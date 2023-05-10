Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0476D6FE39C
	for <lists+linux-usb@lfdr.de>; Wed, 10 May 2023 20:08:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229656AbjEJSI3 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 10 May 2023 14:08:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49548 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229506AbjEJSI2 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 10 May 2023 14:08:28 -0400
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EA21F59F9
        for <linux-usb@vger.kernel.org>; Wed, 10 May 2023 11:08:27 -0700 (PDT)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 34AGljKc032456;
        Wed, 10 May 2023 18:08:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : from : subject : to : cc : content-type :
 content-transfer-encoding; s=qcppdkim1;
 bh=yuRvC/8CByP7Om0MrcW/JaUeCbefnkpJqzW66BvDza8=;
 b=Bkr7nEr72Kyjb3WC1uLFrnIahSW18rnEPg6VqOS8yUAXk6qF4/mrrMPV7HL8qhbjDUTk
 gP7yiTRjwrPTpCesN406ijX5t0dCGO3YJvMd7i/mFRRGJab8cXJMqyPLeiGRMYaNo7+v
 G7kwo25WzT/X3ZTxCjLchWJBw+S11btw56/frpKqCyWwYx/0GozPWoN0MC7j3A/a1elI
 /JOSMjJQKUW1rmkTY9ENyuxcncEkXRZoM8+p2owf/Ojafgeud02m27m1DKuNlncfeWXt
 +h1nOfep/oYlk4RjLsxgAc+mrAgLClJ+CPGuSVvcJSxXrmJKDK0axhyH0UU+ooC3ezTa +A== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3qfyx09yp2-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 10 May 2023 18:08:25 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
        by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 34AI8OK3015685
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 10 May 2023 18:08:24 GMT
Received: from [10.216.32.57] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.42; Wed, 10 May
 2023 11:08:23 -0700
Message-ID: <e465c69c-3a9d-cbdb-d44e-96b99cfa1a92@quicinc.com>
Date:   Wed, 10 May 2023 23:38:19 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
From:   Krishna Kurapati PSSNV <quic_kriskura@quicinc.com>
Subject: Setting LLUCTL force gen1 bit if max speed is SS for Gen2 controller
To:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Content-Language: en-US
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: HFT40LEdUYsK_LuUICMlQLvSPLm6nr1l
X-Proofpoint-GUID: HFT40LEdUYsK_LuUICMlQLvSPLm6nr1l
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-10_04,2023-05-05_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0
 priorityscore=1501 malwarescore=0 phishscore=0 mlxlogscore=599
 clxscore=1015 impostorscore=0 suspectscore=0 spamscore=0 bulkscore=0
 lowpriorityscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2304280000 definitions=main-2305100146
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Team,

  If we set maximum speed to "super-speed" for a SSP capable controller, 
I see device mode working in SS but host mode still works in SSP. From 
the yaml documentation of max-speed, I see the following:

  maximum-speed:
    description:
      Tells USB controllers we want to work up to a certain speed. 
Incase  this isn't passed via DT, USB controllers should default to 
their maximum HW capability.

Shouldn't this maximum speed get limited to gen1 even for host mode ?

If so, can we set LLUCTL Force_Gen1 bit if (Controller is Gen2  && 
max_speed = SuperSpeed) somewhere after GCTL core soft reset is done in 
set_mode ?

The reason being, there were some compliance issues seen with SSP on 
some of our targets and we wanted to drop down to Gen-1 in our targets, 
but limiting maximum-speed is affecting only device mode.

Regards,
Krishna,
