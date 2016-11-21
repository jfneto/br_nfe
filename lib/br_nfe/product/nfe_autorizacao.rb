module BrNfe
	module Product
		class NfeAutorizacao < BrNfe::Product::Base
			
			# Array com as notas fiscais a serem emitidas
			# Pode ser adicionado os dados das notas fiscais em forma de `Hash` ou
			# O próprio objeto da NF-e.
			#
			# Exemplo com Hash:
			#    self.notas_fiscais = [{serie: 1, numero_nf: 1143, ...},{serie: 1, numero_nf: 1144, ...}]
			#    self.notas_fiscais << {serie: 1, numero_nf: 1145, ...}
			#    self.notas_fiscais << {serie: 1, numero_nf: 1146, ...}
			#
			# Exemplo com Objetos:
			#    self.notas_fiscais = [BrNfe::Product::NotaFiscal.new({serie: 1, numero_nf: 1143, ...}),{serie: 1, numero_nf: 1144, ...}]
			#    self.notas_fiscais << BrNfe::Product::NotaFiscal.new({serie: 1, numero_nf: 1145, ...})
			#    self.notas_fiscais << {serie: 1, numero_nf: 1146, ...}
			#
			# Sempre vai retornar um Array de objetos da class configurada em `BrNfe.nota_fiscal_product_class`
			#
			# <b>Tipo: </b> _BrNfe.nota_fiscal_product_class (BrNfe::Product::NotaFiscal)_
			# <b>Min: </b> _1_
			# <b>Max: </b> _50_
			# <b>Default: </b> _[]_
			#
			has_many :notas_fiscais, 'BrNfe.nota_fiscal_product_class'

			
			validate_has_many :notas_fiscais, message: :invalid_invoice
			validates :notas_fiscais, length: {in: 1..50}

			# URL que será setada no atribto xmlns do XML;
			# Ex:
			# nfeCabecMsg xmlns="http://www.portalfiscal.inf.br/nfe/wsdl/NfeStatusServico2"
			def url_xmlns
				gateway.url_xmlns_autorizacao
			end

			# URL do webservice para enviar as informações.
			# Ex:
			# https://www.sefazvirtual.fazenda.gov.br/NfeInutilizacao2/NfeInutilizacao2.asmx?wsdl
			def wsdl
				gateway.wsdl_autorizacao
			end

			# Método SOAP que será chamado para enviar o XML
			def method_wsdl
				gateway.operation_autorizacao
			end

			# Versão utilizada pelo webservice do  estado para determinada ação.
			def gateway_xml_version
				gateway.version_xml_autorizacao
			end

			# Versão SSL utilizada pelo webservice
			def ssl_version
				gateway.ssl_version_autorizacao
			end

			# XML que será enviado no body da requisição SOAP contendo as informações
			# específicas de cada operação.
			def xml_builder
				render_xml 'nfe_autorizacao'
			end
		end
	end
end