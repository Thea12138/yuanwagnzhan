<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>青岛智能产业技术研究院</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

<link type="text/css" rel="stylesheet" href="Resources/css/style.css" />
<link href="http://libs.baidu.com/bootstrap/3.0.3/css/bootstrap.min.css" rel="stylesheet">
<link rel="shortcut icon" type="image/x-icon" href="Resources/favicon.ico" media="screen" />

<script src="http://libs.baidu.com/jquery/2.0.0/jquery.min.js"></script> 
<script src="http://libs.baidu.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>
<script type="text/javascript" src="Resources/js/jQuery-1.11.0.js"></script>
<script type="text/javascript" src="Resources/js/Jump.js"></script>
<script type="text/javascript" src="Resources/js/BackSpace.js"></script>
<style type="text/css">
.fontstyle {
	text-align: center;
	font-size: 36px;
	line-height: 130px;
	color: #4e4e4e;
}

.ulnav {
	margin: 0;
	padding: 0;
	width: 200px;
	list-style: disc;
}

.ulnav li {
	margin: 0;
	padding: 0 0 8px 0;
	font-size: 16px;
	cursor: pointer;
}

.ulnav li:hover {
	font-size: 16px;
	cursor: pointer;
	color: orange;
}

.ulnav .active {
	font-size: 16px;
	cursor: pointer;
	color: orange;
}

p {
	margin: 0 10px;
	text-align: left;
	text-indent: 2em;
}

.tabcontent {
	width: 100%;
	padding: 10px 0;
	font-size: 14px;
	line-height: 28px;
	color: #4e4e4e;
}

.fcolor {
	color: #5b9bd5;
}
</style>
<script type="text/javascript">
	function ChangeDesc(tabid, liid) {
		$(".tabcontent").hide();
		$("#" + tabid).show();
		$(".ulnav li").removeClass("active");
		$("#" + liid).addClass("active");
	}
</script>
</head>

<body style="overflow:auto;overflow-x:hidden;margin:0 0">
    <div id=header class=header>
           <div class=headertop>
              <div class=headerinner>
                <div class=logo>
                    <div class=language><a href="index.do">中文</a> | <a class="lanActive" href="index_e.do" >English</a></div>
                    <!-- <div class=qrcode><img src="Resources/css/img/qrcode.png" width=50px height=50px></div> 
	                <div class=code><img src="Resources/css/img/code.png" width=50px height=50px></div> -->
                </div>
              </div>
           </div>         
	</div>         
    <div class="clear"></div>
    <div id=homepage class=homepage>         
      <!--    <div style="margin-top:0px; width:100%;height: 500px;background: url(Resources/css/en/img1.jpg) no-repeat center;"></div>-->
        <div style="text-align: center;line-height: 48px;margin-bottom: 10px;">
            <h1>Profile of Qingdao Academy of Intelligent Industries</h1>
        </div>
        <table
                style="width: 1000px;margin: 0 auto;background-color: #eeeeee;"
                cellpadding="0" cellspacing="0" border="0">
                <tr>
                <td style="width: 200px;background-color:#fff; " valign="top">
                <ul class="ulnav">
                <li id="li1" class="active" onclick="ChangeDesc('tab1',this.id)">
                <!-- 青岛智能产业技术研究院 -->Qingdao Academy of Intelligent
                Industries(QAII)
                </li>
                <li id="li2" onclick="ChangeDesc('tab2',this.id)">
                <!-- 智能制造研究所 -->Institute of Intelligent Manufacturing and
                Robotic Systems(IIMRS)
                </li>
                <li id="li3" onclick="ChangeDesc('tab3',this.id)">
                <!-- 智能网络研究所 -->Institute of Intelligent Sensing and Networking
                Systems(IISNS)
                </li>
                <li id="li4" onclick="ChangeDesc('tab4',this.id)">
                <!-- 智慧农业研究所 -->Institute of Smart Agricultural Systems(ISAS)
                </li>
                <li id="li5" onclick="ChangeDesc('tab5',this.id)">
                <!-- 智慧健康研究所 -->Institute of Smart Healthcare Systems(ISHS)
                </li>
                <li id="li6" onclick="ChangeDesc('tab6',this.id)">
                <!-- 智慧企业研究所 -->Institute of Smart Enterprise Systems(ISES)
                </li>
                <li id="li7" onclick="ChangeDesc('tab7',this.id)">
                <!-- 智慧城市研究所 -->Institute of Smart Cities and
                Infrastructures(ISCI)
                </li>
                <li id="li8" onclick="ChangeDesc('tab8',this.id)">
                <!-- 智慧社会研究所 -->Institute of Smart Societies and Services(ISSS)
                </li>
                <li id="li9" onclick="ChangeDesc('tab9',this.id)">
                <!-- 智慧教育研究所 -->Institute of Smart EDucation Systems(ISEDS)
                </li>
                <li id="li10" onclick="ChangeDesc('tab10',this.id)">
                <!-- 智慧物流研究所 -->Institute of Smart Logistical Systems(ISLS)
                </li>
                <li id="li11" onclick="ChangeDesc('tab11',this.id)">
                <!-- 智能数据研究所 -->Institute of Data Intelligence(IDI)
                </li>
                <li id="li12" onclick="ChangeDesc('tab12',this.id)">
                <!-- 智能系统研究所 -->Institute of Intelligent Systems(IIS)
                </li>
                <li id="li13" onclick="ChangeDesc('tab13',this.id)">
                <!-- 智能服务研究所 -->Institute of Intelligent Services Systems(IISS)
                </li>
                <li id="li14" onclick="ChangeDesc('tab14',this.id)">
                <!-- 技术研发中心 -->R&D and Innovation Center
                </li>
                <li id="li15" onclick="ChangeDesc('tab15',this.id)">
                <!-- 平行工作室 -->Parellel workshop
                </li>
                <li id="li16" onclick="ChangeDesc('tab16',this.id)">
                <!-- 综合服务处 -->Department of Administration
                </li>
                <li id="li17" onclick="ChangeDesc('tab17',this.id)">
                <!-- 人事教育处 -->Department of Human Resources
                </li>
                <li id="li18" onclick="ChangeDesc('tab18',this.id)">
                <!-- 财务处 -->Department of Finance
                </li>
                <li id="li19" onclick="ChangeDesc('tab19',this.id)">
                <!-- 科技处 -->Department of Research Management
                </li>
                <li id="li20" onclick="ChangeDesc('tab20',this.id)">
                <!-- 产业化处 -->Department of Industrialization Management
                </li>
                </ul>
                </td>
                <td style="width: 800px;" valign="top">
                <div id="tab1" class="tabcontent">
                <p>
                <b>Founding Information</b>
                </p>
                <p>Qingdao Academy of Intelligent Industries (hereafter
                referred to as QAII) is jointly founded by Institute of
                Automation, Chinese Academy of Sciences, Qingdao National
                High-tech Industrial Development Zone, and Qingdao Science and
                Technology Bureau. It is officially registered as a new research
                institution with independent legal entity in May 2014.</p>
                <p>
                <b>Organization of QAII</b>
                </p>
                <p>QAII is mainly composed of “one institute (center), one
                enterprise, one industrial park, one industrial fund, and one
                platform”, namely, Qingdao Academy of Intelligent Industries
                (CASIA Center for Intelligent Systems and Technology, Chinese
                Academy of Sciences), Intelligent Industries Development
                Platform Corporation, Intelligent Industries Park, Intelligent
                Industries Fund, and Big Data Platform.</p>
                <p>Currently, QAII includes 14 research institutes including
                Intelligent Manufacturing, Intelligent Networks, Smart
                Agriculture, Smart Enterprise, Smart City, Smart Society, Smart
                Health, Smart Education, Intelligent Logistics, Intelligent
                Data, Intelligent Systems, Intelligent Services, Parallel
                Economy, Parallel Control, and one Technology Research and
                Development Center.</p>

                <img alt="" src="Resources/css/en/img2.jpg" width="800px" />
                <p>
                <b>Talents and Research Team</b>
                </p>
                <p>QAII has established an academic and technology committee
                that composes of many academician and experts from both China
                and abroad. There are currently 258 staff, including 6 “1000
                Talents Plan” experts, 4 “100 Talents Plan” members, 4 winners
                of the National Science Fund for Distinguished Young Scholars, 1
                winner of National Natural Science Foundation Outstanding Youth
                Fund, 4 Editor-in-Chief of premier international journals, 126
                staff with Master degree and above. QAII has gradually formed a
                major force of talents in intelligent fields.</p>
                <p>
                <b>Development of QAII</b>
                </p>
                <p>Based on principles of “Demand-Guided, Innovation-Driven,
                Joint Collaboration, and Steady Progressing”, QAII is committed
                to fully utilizing resources from different parties to attract
                talents in information, software, automation, and intelligence
                areas both from home and abroad. Through innovation of frontier
                intelligent industrial technology, development of emerging
                intelligent industries with core competitiveness, and technology
                transfer to products, QAII strives to build a technology
                innovation base, an emerging incubator of intelligent
                industries, a high-level center for talents training, and an
                institute for international academic exchange and education
                cooperation with international influence and reputation.</p>
                <p>Since its establishment, QAII has founded the Intelligent
                Transportation Joint Research and Development Center, led the
                establishment of the Strategic Alliance Formation for Smart
                Agricultural Industrial Technology Innovation and the Strategic
                Alliance for Smart Health, actively taken participation into
                industrial alliance of 3D Printing, Smart Education, Smart
                Healthcare, and made full efforts for promoting the development
                of the related industries. QAII has gradually set up several
                joint laboratories with Shandong Province Gout Research Center,
                Xi’an Jiao Tong University, Tsinghua University, and other
                units. It signed cooperative agreements to jointly foster
                high-level talents training with well-known institutions such as
                University of Macau, University of California, Indiana
                University-Purdue University Indianapolis, and others.</p>
                <p>Considering the rapid development of emerging intelligent
                industries and the talents shortage in Qingdao, QAII aims to
                build the first “Intelligent Technology Academy” in the world
                and establish the “Huangpu Military Academy” to train the
                “red-collar talents” in intelligent industries. Up to now, it
                has incubated more than 10 technological companies.</p>
                <p>QAII aims to maintain an international foresight, create
                international standards, and lead the development of intelligent
                industries based on Parallel Intelligence based theories and
                technologies. The purpose is to help Qingdao become a city of
                innovation, a capital of entrepreneurs, and an island of maker
                culture.</p>
                <p>
                <b>备注关键词：</b>
                </p>
                <p>青岛智能产业技术研究院 ：Qingdao Academy of Intelligent Industries
                (QAII)</p>
                <p>中科院自动化所：Institute of Automation, Chinese Academy of
                Sciences</p>
                <p>青岛高新区管委会：Qingdao National High-tech Industrial Development
                Zone</p>
                <p>青岛市科技局：Qingdao Science and Technology Bureau</p>
                <p>中国科学院自动化研究所青岛智能产业技术研究中心</p>
                <p>CASIA Center for Intelligent Systems and Technology,
                Chinese Academy of Sciences</p>

                </div>
                <div id="tab2" class="tabcontent" style="display: none;">
                <p>to be updated</p>
                </div>
                <div id="tab3" class="tabcontent" style="display: none;">
                <p>to be updated</p>
                </div>
                <div id="tab4" class="tabcontent" style="display: none;">
                <p>to be updated</p>
                </div>
                <div id="tab5" class="tabcontent" style="display: none;">
                <div style="text-align: center;line-height: 48px;">
                <h2>Institute of Smart Healthcare Systems</h2>
                </div>
                <p>
                <b>Introduction</b>
                </p>
                <p>Based on the theory of parallel control, which comes
                directly from the ACP approach, the institute of smart
                healthcare Systems, combined with the artificial intelligence
                algorithms, modern information technology and systems
                engineering, provides modern technology solutions related to
                medical care, health care, and health for elderlies. The main
                research directions include, computer-aided automation
                diagnostic and treatment system; knowledge base of medicine,
                health, food, sport, lifestyle and healthcare; remote and
                wearable health monitoring system; life-safety monitoring system
                for elderly people; open health and safety monitoring platform;
                health records, personal health profile and health management
                system; big data intelligent analysis in healthcare, data mining
                and early warning, alarm algorithm; parallel service system for
                elderly people; remote health medication inquiry system,
                automated online medical diagnosis, consulting and advertising
                system and other research and development of technical
                solutions.</p>
                <p>
                <b>Projects</b>
                </p>
                <p>1. Parallel computer-aided automation diagnostic and
                treatment system for gout disease</p>
                <p>Introduction</p>
                <p>Based on the theory of parallel control, which comes
                directly from the ACP approach, through the establishment and
                use of medical knowledge base, intelligent medical records
                library, expert diagnostic and treatment rule library, using
                computer information system, artificial intelligence, big data
                mining and machine learning technology, develop parallel
                computer-aided automation diagnostic and treatment system for
                gout and hyperuricemia diseases, so as to provide the doctor
                with the diagnosis and treatment decision-making basis and
                suggestions. The system consists of three sub-systems: smart
                clinic management system for gout disease, information platform
                for gout disease, computer-aided automation diagnosis and
                treatment system for gout disease.</p>
                <p>Functions</p>
                <p>● Standardizing the diagnosis and treatment process</p>
                <p>● Medical knowledge base, intelligent medical records
                library, expert diagnostic and treatment rule library</p>
                <p>● Simulation of medical experts in the decision-making
                process of diagnosis and treatment</p>
                <p>● Providing the diagnosis and treatment decision-making
                basis and suggestions, Inferred details and similar medical
                records</p>
                <p>● The self-improvement system for the algorithm to
                consistently evolve</p>
                <p>● 7x24 hours of patient care</p>
                <p>● Desensitized data sharing between hospitals</p>
                <p>● Professional knowledge in a timely manner</p>
                <p>● Medical Education</p>
                <p>● Research platform</p>
                <p>2. Smart health and safety monitoring platform</p>
                <p>Introduction</p>
                <p>To establish an open health and safety monitoring platform
                under the guidance of the theory of parallel control, and to
                store the data of vital signs, health, position and living rules
                from the cloud into the health records data center for all the
                groups concerned with their own health through mobile and
                wearable equipment. Through the intelligent algorithm for
                real-time and historical analysis of user data, sketch out
                personal health and personal habits profile. According to the
                specific health of the customer, our platform makes customized
                advices for clients to achieve a better lifestyle.</p>
                <p>Functions</p>
                <p>● Providing people with timely, accurate, economic,
                comprehensive, personalized, high-quality health and safety
                monitoring, illness warning, personalized health management
                services</p>
                <p>● To help people effectively prevent the various diseases
                and health risks on the threat of life safety</p>
                <p>● To calculate the best health guidance program for
                customers , and assist users to improve their health and
                physical indicators effectively.</p>
                <p>3. Parallel service system for elderly people</p>
                <p>Through the large data collection and mining, the parallel
                service system analyzes the portrait of individual needs for
                elderly people. Applying the theory of parallel control to
                establish the individualized model for the elderly people
                caring, the parallel service system is able to guide the old -
                age service. Through the continuous collection of feedbacks in
                the analysis of old - age data, the parallel service system
                improves the model for the elderly people caring, in order to
                organize all of the resources, like medical institutions, family
                members, community neighborhoods, individuals, government,
                charity, professional services, to provide the most needed
                material supply, health care, life care, spiritual care and
                other precision old - age services for elderly people, and then
                to achieve the best old - age supply, demand matching and old -
                age service industrialization.</p>
                </div>
                <div id="tab6" class="tabcontent" style="display: none;">
                <p>to be updated</p>
                </div>
                <div id="tab7" class="tabcontent" style="display: none;">
                <p>to be updated</p>
                </div>
                <div id="tab8" class="tabcontent" style="display: none;">
                <p>to be updated</p>
                </div>
                <div id="tab9" class="tabcontent" style="display: none;">
                <p>
                <b class="fcolor">Institute of Smart Education Systems
                (ISES)</b>
                </p>
                <p>ISES aims to apply the intelligent technology to education
                domain and to promote the industrialization, studies the deep
                integration of Big Data, Cloud Computing, Internet of Things,
                and parallel system with education, supports to boost the
                comprehensive education reform and curriculum reform.</p>
                <p>
                <b class="fcolor">Key work 1: iSTREAM program for innovative
                practice education at K-12 students</b>
                </p>
                <p>Base on the iCDIOS（i & Conceive, Design, Implement,
                Operate, Services）engineering education model and iSTREAM（i &
                Sciences, Technology, Robotics, Engineering, Arts,
                Management）multi-disciplinary education concept, where i may
                represent the new IT intelligent technology element for
                individual, inspiration, intelligence, invention, innovation,
                integration, interdisciplinary, international, and more, this
                work aims to serve for the popularization of science, innovation
                and entrepreneurship training, extracurricular practice
                activity, maker education together, and involves to develop a
                systematic standard including education equipment, science
                education curriculums, innovation laboratory, innovation and
                practice education base, supportive parallel system platform,
                extracurricular activity, and etc..</p>
                <p>
                <font class="fcolor">Curriculum:</font> combination of campus
                and outside campus, theoretical and practice; common sense and
                innovation, integration and synthetization, fundament and
                frontier
                </p>
                <p>
                <font class="fcolor">Characteristic:</font> interesting,
                informative, standardized, modularized, and diversified.
                </p>
                <div align="center">
                <img alt="" src="Resources/css/en/jks/img1.png"
                style="width: 800px;">
                </div>
                <p>
                <b class="fcolor">Key work 2: Parallel intelligent adaptive
                education system</b>
                </p>
                <p>Based on the constructivism education theory and
                hybrid-augmented intelligence, this work aims to construct
                corresponding artificial education systems from the
                learner-centered viewpoint including education scenario, social
                environment, director, and learner four fundamental elements in
                the real education system. Adaptive personalized designs for
                teaching scenario, teaching method and knowledge system for
                specific learners and comprehensive evaluation of teaching and
                learning performance are made by computational experiments,
                based on which actual teaching and learning processes are
                optimized. Meanwhile, the artificial education systems are
                adjusted based on Big Data analysis, and the adaptive learning
                algorithm is improved based on Human-computer collaborative
                hybrid-augmented intelligence.</p>
                <div align="center">
                <img alt="" src="Resources/css/en/jks/img2.jpg"
                style="width: 800px;">
                </div>
                <p>
                <b class="fcolor">Key work 3: Professional education</b>
                </p>
                <p>Hongdao Institute of Intelligent Industries is built under
                the support of Qingdao Academy of Intelligent Industries, and
                conducts engineering management education for the ecological
                chains in intelligent industries. This work aims to cultivate
                engineering technology and management talents for the
                multi-level, multi-mode, cross-border intelligent industries,
                and to research and develop new curriculums and majors through
                the resource integration and cooperation for the intelligent
                industries based on the market demands.</p>
                </div>
                <div id="tab10" class="tabcontent" style="display: none;">
                <p>to be updated</p>
                </div>
                <div id="tab11" class="tabcontent" style="display: none;">
                <p>to be updated</p>
                </div>
                <div id="tab12" class="tabcontent" style="display: none;">
                <p>to be updated</p>
                </div>
                <div id="tab13" class="tabcontent" style="display: none;">
                <p>to be updated</p>
                </div>
                <div id="tab14" class="tabcontent" style="display: none;">
                <div style="text-align: center;line-height: 48px;">
                <h2 style="color:red;">Hardware Technology Group</h2>
                </div>
                <p>to be updated</p>
                <div style="text-align: center;line-height: 48px;">
                <h2 style="color:red;">Software Technology Group</h2>
                </div>
                <p>Technology R & D Center supported by the State Key
                Laboratory of Management and Control for Complex Systems and
                Qingdao Academy of Intelligent Industries, focuses on the
                hardware and software design, development, integration and
                implementation of engineering research projects, and Provides
                communication and comprehensive deployment for network, platform
                solutions, technology development, technology transfer,
                technology service and service for consulting and personnel
                internship training. Specific, Technology R & D Center provides
                the services as follows:</p>
                <p>● Platform-level system solution design.</p>
                <p>● system design, technology development, technology
                transfer, technical advice, technical services.</p>
                <p>● website design services, Internet, management
                information system services.</p>
                <p>● intelligent network control system equipment design and
                integration.</p>
                <p>● computer hardware and software systems and network,
                communication system integration, design, installation and
                maintenance services.</p>
                <p>Technology R & D Center has an experienced, business
                skilled R&D team, staff role covers the project managers,
                architects, database experts, research and development
                engineers, test engineers, network engineers, etc. Center has
                successively for the Intelligent Industries provides a variety
                of public technical service and support, covering infrastructure
                operation support services, system integration design services
                and public information maintenance services; And undertake a
                number of software/hardware system design and development work,
                covers the enterprise integrated management, traffic management
                and decision support, data analysis and processing, agricultural
                intensification management, intelligent data monitoring and
                control, etc. R&D team now has a wealth of work foundation,
                mainly involves the following areas:</p>
                <p>● enterprise integrated management information
                construction, including learning and training, work
                standardization, inspection, production management, emergency
                management, analysis, evaluation, etc.</p>
                <p>● integrated transportation management informatization,
                including multiple construction traffic integrated management
                platform, the signal control platform, bus BRT monitoring and
                scheduling command system, traffic simulation environment, the
                orbit transportation simulation environment, etc.</p>
                <p>● agricultural informatization construction, including
                office automation, monitoring of agricultural production,
                agriculture orchard production management, etc.</p>
                <p>● network construction, including the network hardware
                environment construction plan and implementation, the basis of
                integrated services network software and governance.</p>
                <p>● data integration information construction, including
                multiple system comprehensive integration, data integration
                platform construction scheme and implementation.</p>
                <p>● other aspects, including the geographic information
                system GIS platform construction, electronic maps,
                visualization, mobile phone APP, etc.</p>
                <div style="text-align: center;line-height: 48px;">
                <h2 style="color:red;">Embedded Systems Group</h2>
                </div>
                <p>Technology R&D Center is relying on The State Key
                Laboratory of Management and Control for Complex Systems and
                QingDao Academy of Intelligent Industries. Now the center main
                research direction is IOT, big data, cloud computing, embedded
                security system and the robot, and the main application
                direction is IOT cloud platform, wireless network communication
                network, embedded system development, hardware circuit design
                and help robot. The center provide data platform, application
                services and a full range of solutions for the Industry
                Internet. Its areas involve cold chain logistics, intelligent
                manufacturing, smart home, intelligent energy, intelligent
                agriculture, intelligent transportation, environmental
                monitoring and many other industries, and provide IoT solutions
                and product service.</p>
                <p>The center has a research and development and sales team
                about 13 people. The center has successively with the CHINA
                Academy of Railway Sciences, the Chinese Academy of Agricultural
                Sciences, Guangzhou Transportation Commission, Qingdao
                University of Technology, Hunan Cothink Robotics Tech.Co.,LTD
                and many other scientific research institutes,high-tech
                enterprises expand cooperation in the field of Intelligent data
                monitoring, Big data analysis, data visualization analysis,
                Large data storage, Data visualization analysis, Big data
                storage, Industrial Information Collection and Intelligent
                Decision, device management, Robot application.</p>
                <p>Department launched the Internet of things cloud platform,
                cold chain information systems, indoor environmental monitoring
                system has been on the line.</p>
                </div>
                <div id="tab15" class="tabcontent" style="display: none;">
                <p>to be updated</p>
                </div>
                <div id="tab16" class="tabcontent" style="display: none;">
                <p>to be updated</p>
                </div>
                <div id="tab17" class="tabcontent" style="display: none;">
                <p>to be updated</p>
                </div>
                <div id="tab18" class="tabcontent" style="display: none;">
                <p>to be updated</p>
                </div>
                <div id="tab19" class="tabcontent" style="display: none;">
                <p>to be updated</p>
                </div>
                <div id="tab20" class="tabcontent" style="display: none;">
                <p>to be updated</p>
                </div>
                </td>
                </table>
          
    </div>
    <div class="clear"></div>
    <div class=foot>  
         <div class=foottext></div>
         <div class=footnav>
                <ul>
                     <li><a href="http://www.cas.cn/">中国科学院</a></li>
                     <li><span style="color:#fff;">|</span></li>
                     <li><a href="http://www.ia.cas.cn/">中国科学院自动化研究所</a></li>
                     <li><span style="color:#fff;">|</span></li>
                     <li><a href="http://www.compsys.ia.ac.cn/">复杂系统管理与控制国家重点实验室</a></li>
                     <li><span style="color:#fff;">|</span></li>
                     <li><a href="http://www.casc.ac.cn/">东莞科学院云计算产业技术创新与育成中心</a></li>
                </ul>
         </div>
         <div class=copyright>青岛智能产业技术研究院 版权所有 鲁ICP备15005983号-1</div>
         <div class=address>地址：青岛高新区智力岛路1号创业大厦B座26层</div>
    </div>
    <div class="clear"></div>
</body>
</html>
