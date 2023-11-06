# frozen_string_literal: true
require 'onnxruntime'
require 'ruby-spacy'
require 'pycall/import'
include PyCall::Import

require_relative "classifier/version"

module Proposal
  module Classifier
    class Model
      def self.predict_onx(input_text)
        nlp = Spacy::Language.new("pt_core_news_lg")
        doc = nlp.read(input_text)
        vector = doc.vector
        scaled_array = (vector - vector.min) / (vector.max - vector.min) * (1 - 0) + 0
        model = OnnxRuntime::InferenceSession.new("./exported_model.onnx")
        label_name = model.outputs()[0][:name]
        vector_fim_reshaped = scaled_array.reshape(1, -1)
        pred_onx = model.run([label_name], {X: vector_fim_reshaped})[0]
        return pred_onx
      end
    end
  end
end
