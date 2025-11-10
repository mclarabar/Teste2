import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProjectIntentSection extends StatelessWidget {
  const ProjectIntentSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      color: Colors.white,
      child: Column(
        children: [
          Text(
            'INTUITO DO PROJETO:',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          Text(
            'Este aplicativo foi criado com o objetivo de oferecer suporte informativo, '
                'educativo e preventivo a pessoas que convivem com o câncer de pulmão, além '
                'de promover a conscientização sobre os riscos e formas de prevenção dessa '
                'doença. Unindo tecnologia, ciência e acessibilidade, a proposta é transformar '
                'o cuidado com a saúde em algo mais próximo, interativo e eficiente. Um dos '
                'principais destaques do aplicativo é a ferramenta interativa de rastreio, que '
                'une um quiz dinâmico com elementos de jogo. Nessa atividade, o usuário responde '
                'a perguntas relacionadas à sua rotina, hábitos de vida e histórico familiar. Conforme '
                'as respostas, o sistema identifica comportamentos de risco e os apresenta de forma '
                'visual e lúdica, permitindo que o usuário compreenda de maneira leve, mas clara, '
                'quais práticas podem favorecer ou prevenir o câncer de pulmão. O objetivo é promover '
                'a reflexão e incentivar mudanças positivas no dia a dia de forma natural e engajadora. '
                'Além disso, o aplicativo oferece um acervo completo de conteúdos informativos, com resumos '
                'explicativos, flashcards para fixação de informações, artigos científicos atualizados, '
                'vídeos educativos e outros formatos acessíveis. Esses materiais são voltados tanto para quem '
                'está em tratamento quanto para quem deseja aprender mais sobre o tema — familiares, estudantes, '
                'profissionais da saúde ou pessoas que buscam prevenção. Com uma abordagem acolhedora, interativa '
                'e baseada em evidências, o aplicativo busca empoderar os usuários por meio do conhecimento, auxiliando '
                'na compreensão do câncer de pulmão, promovendo hábitos saudáveis e contribuindo para o diagnóstico '
                'precoce e o enfrentamento da doença. A saúde começa com a informação — e esse é o primeiro passo que '
                'o aplicativo ajuda você a dar.',
            textAlign: TextAlign.justify,
          ),
        ],
      ),
    );
  }
}