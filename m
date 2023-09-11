Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A281C79A268
	for <lists+linux-usb@lfdr.de>; Mon, 11 Sep 2023 06:29:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231132AbjIKE3m (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 11 Sep 2023 00:29:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40844 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229437AbjIKE3k (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 11 Sep 2023 00:29:40 -0400
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5CDE010C
        for <linux-usb@vger.kernel.org>; Sun, 10 Sep 2023 21:29:36 -0700 (PDT)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 38B3blnc032176;
        Mon, 11 Sep 2023 04:29:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=qcppdkim1;
 bh=hlICoDiEGev4Cz0AmAVGXmrJfvbRETuIwaR+e/Q/azI=;
 b=bLAK2gQvuAfeMCaTlx4VRdO4TxSDgmnRZYLyxm4GkLmz2mLUsXmw/4TfKxM7C65FjgIj
 STOqFP2cxI/uRQz21gY1lk+GgSji0TcnRWo1HWuYuNRnlijBNC8CBOAZWTbyhIUtvtgX
 DcSprKJGO9z0MLNOfdDaA5vmoCDoCAd6hDdx7A6h0WUBwdsl2LZuBBtabLTmk1liKtfZ
 PVX8fSxlTaqFGGHWl39aIffw0qOUGl7uhTE/IY4EL4/DrHRJi7Hc0E6te4ybTbHVl6f3
 GCQTfw2mi7+kuUYFsDeVJSseoJAWhv73DTDKczmRvIN49TIA6xzLmASPAgMRyK4Uvo4i rA== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3t0h3dtfbm-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 11 Sep 2023 04:29:04 +0000
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
        by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 38B4T2tL012701
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 11 Sep 2023 04:29:02 GMT
Received: from linyyuan-gv.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.36; Sun, 10 Sep 2023 21:28:55 -0700
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
Subject: [PATCH 00/11] reduce usb gadget trace event buffer usage
Date:   Mon, 11 Sep 2023 12:28:32 +0800
Message-ID: <20230911042843.2711-1-quic_linyyuan@quicinc.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 9mFY6OrT23d735S_3aAk6v8LPLXTYL-t
X-Proofpoint-ORIG-GUID: 9mFY6OrT23d735S_3aAk6v8LPLXTYL-t
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-11_01,2023-09-05_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 bulkscore=0 phishscore=0 mlxlogscore=281 adultscore=0 spamscore=0
 suspectscore=0 impostorscore=0 malwarescore=0 mlxscore=0
 lowpriorityscore=0 clxscore=1011 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2308100000 definitions=main-2309110040
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

some trace event use an interger to to save a bit field info of gadet,
also some trace save endpoint name in string forat, it all can be
chagned to other way at trace event store phase.

bit field can be replace with a union interger member which include
multiple bit fields.

ep name stringe can be replace to a interger which contaion number
and dir info.




Linyu Yuan (11):
  usb: gadget: add anonymous definition in struct usb_gadget
  usb: gadget: add anonymous definition in struct usb_request
  usb: gadget: add anonymous definition in struct usb_ep
  usb: udc: assign epnum for each usb endpoint
  usb: udc: trace: reduce buffer usage of trace event
  usb: cdns3: cdnsp: reduce buffer usage of trace event
  usb: cdns3: trace: reduce buffer usage of trace event
  usb: dwc3: trace: reduce buffer usage of trace event
  usb: cdns2: trace: reduce buffer usage of trace event
  usb: mtu3: trace: reduce buffer usage of trace event
  usb: musb: trace: reduce buffer usage of trace event

 drivers/usb/cdns3/cdns3-gadget.c            |   1 +
 drivers/usb/cdns3/cdns3-trace.h             |  93 +++++------
 drivers/usb/cdns3/cdnsp-gadget.c            |   1 +
 drivers/usb/cdns3/cdnsp-trace.h             |  45 +++---
 drivers/usb/chipidea/udc.c                  |   1 +
 drivers/usb/dwc2/gadget.c                   |   2 +-
 drivers/usb/dwc3/gadget.c                   |   1 +
 drivers/usb/dwc3/trace.h                    |  54 +++----
 drivers/usb/fotg210/fotg210-udc.c           |   1 +
 drivers/usb/gadget/udc/aspeed-vhub/epn.c    |   1 +
 drivers/usb/gadget/udc/aspeed_udc.c         |   1 +
 drivers/usb/gadget/udc/at91_udc.c           |   1 +
 drivers/usb/gadget/udc/atmel_usba_udc.c     |   1 +
 drivers/usb/gadget/udc/bcm63xx_udc.c        |   1 +
 drivers/usb/gadget/udc/bdc/bdc_ep.c         |   1 +
 drivers/usb/gadget/udc/cdns2/cdns2-gadget.c |   2 +-
 drivers/usb/gadget/udc/cdns2/cdns2-trace.h  |  77 +++++-----
 drivers/usb/gadget/udc/dummy_hcd.c          |   1 +
 drivers/usb/gadget/udc/fsl_qe_udc.c         |   1 +
 drivers/usb/gadget/udc/fsl_udc_core.c       |   1 +
 drivers/usb/gadget/udc/fusb300_udc.c        |   1 +
 drivers/usb/gadget/udc/goku_udc.c           |   1 +
 drivers/usb/gadget/udc/gr_udc.c             |   1 +
 drivers/usb/gadget/udc/lpc32xx_udc.c        |   1 +
 drivers/usb/gadget/udc/m66592-udc.c         |   1 +
 drivers/usb/gadget/udc/max3420_udc.c        |   1 +
 drivers/usb/gadget/udc/mv_u3d_core.c        |   2 +
 drivers/usb/gadget/udc/mv_udc_core.c        |   2 +
 drivers/usb/gadget/udc/net2272.c            |   1 +
 drivers/usb/gadget/udc/net2280.c            |   2 +
 drivers/usb/gadget/udc/omap_udc.c           |   1 +
 drivers/usb/gadget/udc/pch_udc.c            |   1 +
 drivers/usb/gadget/udc/pxa25x_udc.c         |   1 +
 drivers/usb/gadget/udc/pxa27x_udc.c         |   1 +
 drivers/usb/gadget/udc/r8a66597-udc.c       |   1 +
 drivers/usb/gadget/udc/renesas_usb3.c       |   1 +
 drivers/usb/gadget/udc/renesas_usbf.c       |   1 +
 drivers/usb/gadget/udc/snps_udc_core.c      |   1 +
 drivers/usb/gadget/udc/tegra-xudc.c         |   2 +
 drivers/usb/gadget/udc/trace.h              | 106 +++++--------
 drivers/usb/gadget/udc/udc-xilinx.c         |   1 +
 drivers/usb/isp1760/isp1760-udc.c           |   1 +
 drivers/usb/mtu3/mtu3_gadget.c              |   1 +
 drivers/usb/mtu3/mtu3_trace.h               |  42 +++--
 drivers/usb/musb/musb_gadget.c              |   1 +
 drivers/usb/musb/musb_trace.h               |  14 +-
 drivers/usb/renesas_usbhs/mod_gadget.c      |   1 +
 drivers/usb/usbip/vudc_dev.c                |   1 +
 include/linux/usb/gadget.h                  | 161 +++++++++++++++-----
 49 files changed, 344 insertions(+), 295 deletions(-)

-- 
2.17.1

