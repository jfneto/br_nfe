module BrNfe
	module Servico
		module Betha
			module V2
				class ConsultaLoteRps < BrNfe::Servico::Betha::V2::Gateway
					
					attr_accessor :protocolo

					validates :protocolo, presence: true

					def method_wsdl
						:consultar_lote_rps
					end

					def xml_builder
						Nokogiri::XML::Builder.new do |xml|
							xml.ConsultarLoteRpsEnvio(xmlns: "http://www.betha.com.br/e-nota-contribuinte-ws") {
								xml.Prestador{ 
									xml.CpfCnpj{
										xml.Cnpj emitente.cnpj
									}
								}
								xml.Protocolo protocolo
							}
						end.doc.root
					end
				end
			end
		end
	end
end