FactoryGirl.define do
	factory :service_sc_gaspar_recepcao_lote_rps, class:  BrNfe::Service::SC::Gaspar::RecepcaoLoteRps do
		emitente  { FactoryGirl.build(:emitente) }
		numero_lote_rps '123'
		operacao        '1'
		certificate_pkcs12_password 'associacao'
		certificate_pkcs12_path {   "#{BrNfe.root}/test/cert.pfx" }
	end
end