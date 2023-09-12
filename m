Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AAAFC79CEDD
	for <lists+linux-usb@lfdr.de>; Tue, 12 Sep 2023 12:51:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230360AbjILKvJ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 12 Sep 2023 06:51:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55322 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231196AbjILKvH (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 12 Sep 2023 06:51:07 -0400
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D070C10D2
        for <linux-usb@vger.kernel.org>; Tue, 12 Sep 2023 03:51:02 -0700 (PDT)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 38C99EOn007549;
        Tue, 12 Sep 2023 10:45:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=qcppdkim1;
 bh=iGMPXnPlImwAMN4IQsHxH1eH4mnL+iiS6+nn1Eg3mnI=;
 b=K0ecU2/oVCn5FrINogVosaVzKWQM2Hnl5CTl8t4HlYADcrTTvLAVYlCcW02ny4Us2tgc
 roRrl5Yam7aG+u8HKD9gpmkOFBGOskMJnSHSThRv3Zg5N7rBl5ljsm6ZLC4ZOyJpYvAz
 sLs/51QOZHnydaVb86cX+PtfBkGOJLNM9VWFdfekL/pNApR6tD2lHUfPHYM6RPLTyR17
 dJLbwbApA9dEoPfPktFP/qNXsnfVyjkEbVzXOAMnj9mR9yGXx44VENZO6bjOvZFzy2/K
 v8HF2PYDrvOYlb39YQQ2tET4RHN1GArDR3wsC+m/8mZhjRMyGTGoAY+UKH/409WTRnms Gw== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3t29b0hma1-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 12 Sep 2023 10:45:14 +0000
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
        by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 38CAjCom017826
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 12 Sep 2023 10:45:12 GMT
Received: from linyyuan-gv.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.36; Tue, 12 Sep 2023 03:45:05 -0700
From:   Linyu Yuan <quic_linyyuan@quicinc.com>
To:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Peter Chen <peter.chen@kernel.org>,
        Pawel Laszczak <pawell@cadence.com>,
        Roger Quadros <rogerq@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Chunfeng Yun <chunfeng.yun@mediatek.com>,
        Neal Liu <neal_liu@aspeedtech.com>,
        "Cristian Birsan" <cristian.birsan@microchip.com>,
        Bin Liu <b-liu@ti.com>, "Kevin Cernekee" <cernekee@gmail.com>,
        Justin Chen <justin.chen@broadcom.com>,
        "Al Cooper" <alcooperx@gmail.com>, Li Yang <leoyang.li@nxp.com>,
        "Vladimir Zapolskiy" <vz@mleia.com>,
        Daniel Mack <daniel@zonque.org>,
        Haojian Zhuang <haojian.zhuang@gmail.com>,
        Robert Jarzmik <robert.jarzmik@free.fr>,
        "Philipp Zabel" <p.zabel@pengutronix.de>,
        Herve Codina <herve.codina@bootlin.com>,
        hierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Michal Simek <michal.simek@amd.com>,
        Rui Miguel Silva <rui.silva@linaro.org>,
        Valentina Manea <valentina.manea.m@gmail.com>,
        "Shuah Khan" <shuah@kernel.org>, Hongren Zheng <i@zenithal.me>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC:     <linux-usb@vger.kernel.org>, Linyu Yuan <quic_linyyuan@quicinc.com>
Subject: [PATCH v3 00/10] usb: gadget: reduce usb gadget trace event buffer usage
Date:   Tue, 12 Sep 2023 18:44:45 +0800
Message-ID: <20230912104455.7737-1-quic_linyyuan@quicinc.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 7wKQidHNMWeo0vbC9BafstMyMN7dt131
X-Proofpoint-ORIG-GUID: 7wKQidHNMWeo0vbC9BafstMyMN7dt131
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-12_08,2023-09-05_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 phishscore=0
 adultscore=0 impostorscore=0 priorityscore=1501 mlxscore=0 mlxlogscore=623
 lowpriorityscore=0 bulkscore=0 spamscore=0 suspectscore=0 clxscore=1015
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2308100000
 definitions=main-2309120090
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

some trace event use an interger to to save a bit field info of gadget,
also some trace save endpoint name in string forat, it all can be
chagned to other way at trace event store phase.

bit field can be replace with a union interger member which include
multiple bit fields.

ep name stringe can be replace to a interger which contaion number
and dir info.

v1: https://lore.kernel.org/linux-usb/20230911042843.2711-1-quic_linyyuan@quicinc.com/
v2: fix two compile issues that COMPILE_TEST not covered
    https://lore.kernel.org/linux-usb/20230911112446.1791-1-quic_linyyuan@quicinc.com/
v3: fix reviewer comments, allow bit fields work on both little and big endian

Linyu Yuan (10):
  usb: gadget: add anonymous definition in struct usb_gadget
  usb: gadget: add anonymous definition in struct usb_request
  usb: gadget: add anonymous definition in struct usb_ep
  usb: udc: trace: reduce buffer usage of trace event
  usb: cdns3: cdnsp: reduce buffer usage of trace event
  usb: cdns3: trace: reduce buffer usage of trace event
  usb: dwc3: trace: reduce buffer usage of trace event
  usb: cdns2: trace: reduce buffer usage of trace event
  usb: mtu3: trace: reduce buffer usage of trace event
  usb: musb: trace: reduce buffer usage of trace event

 drivers/usb/cdns3/cdns3-trace.h            |  93 ++++----
 drivers/usb/cdns3/cdnsp-trace.h            |  45 ++--
 drivers/usb/dwc3/trace.h                   |  54 ++---
 drivers/usb/gadget/udc/cdns2/cdns2-trace.h |  77 +++----
 drivers/usb/gadget/udc/trace.h             | 106 +++------
 drivers/usb/mtu3/mtu3_trace.h              |  42 ++--
 drivers/usb/musb/musb_trace.h              |  14 +-
 include/linux/usb/gadget.h                 | 245 +++++++++++++++++----
 8 files changed, 383 insertions(+), 293 deletions(-)

-- 
2.17.1

