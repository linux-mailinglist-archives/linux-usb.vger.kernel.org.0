Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 93C8C79A26D
	for <lists+linux-usb@lfdr.de>; Mon, 11 Sep 2023 06:30:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233523AbjIKEac (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 11 Sep 2023 00:30:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41324 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233520AbjIKEab (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 11 Sep 2023 00:30:31 -0400
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E10C9CD7
        for <linux-usb@vger.kernel.org>; Sun, 10 Sep 2023 21:30:21 -0700 (PDT)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 38B4M2tj009242;
        Mon, 11 Sep 2023 04:29:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=qcppdkim1;
 bh=n5+ix5S+vyXmRTSbao5OKH99zO5rWRekoDCUIXjDMHU=;
 b=NhaeQv/1bYBgPJlPgtrn40+KXv7VdzDftHn34AfGWf6LtxooA6YfTjP86mW753khYza8
 aj0MOZhLmqMvCa94r+D58HRxQLjEegfpfOAx1QuVjLm4BJRDzSLmGbXrU9CeMN9cUqPG
 7A95ywvw7gXqktM3+oI+k+qBX48p6LRUTVSfde1ZmWhSxUgnAZE/CXPmb2qyXYI6i7qG
 Ar1hCXj+7JO1NpeasX0PEBcNE/3yeqzLIy2VR1Exvlz0kUQUhGjLxCK0ayevgflM3zvg
 ls0Y4EC5rELiCfQfgUNGzSxsHkCWXL5kCg6U1l43bxi41vlTkoQtW5ZdIJHWk2gh7OHx gQ== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3t0j0fjmjx-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 11 Sep 2023 04:29:32 +0000
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
        by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 38B4TV4J021488
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 11 Sep 2023 04:29:31 GMT
Received: from linyyuan-gv.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.36; Sun, 10 Sep 2023 21:29:24 -0700
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
Subject: [PATCH 04/11] usb: udc: assign epnum for each usb endpoint
Date:   Mon, 11 Sep 2023 12:28:36 +0800
Message-ID: <20230911042843.2711-5-quic_linyyuan@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230911042843.2711-1-quic_linyyuan@quicinc.com>
References: <20230911042843.2711-1-quic_linyyuan@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 7kILNNFOllPjedNRqq9gZqWCM1KduqEz
X-Proofpoint-GUID: 7kILNNFOllPjedNRqq9gZqWCM1KduqEz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-11_01,2023-09-05_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501 mlxscore=0
 malwarescore=0 clxscore=1015 impostorscore=0 mlxlogscore=584 bulkscore=0
 lowpriorityscore=0 adultscore=0 spamscore=0 phishscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2308100000
 definitions=main-2309110041
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

When record trace event in UDC core layer, it will reduce trace ring
buffer usage if record one u32 variable including epnum, use
USB_EP_NAME() macro will generate endpoint name from epnum.

Signed-off-by: Linyu Yuan <quic_linyyuan@quicinc.com>
---
 drivers/usb/cdns3/cdns3-gadget.c            | 1 +
 drivers/usb/cdns3/cdnsp-gadget.c            | 1 +
 drivers/usb/chipidea/udc.c                  | 1 +
 drivers/usb/dwc2/gadget.c                   | 2 +-
 drivers/usb/dwc3/gadget.c                   | 1 +
 drivers/usb/fotg210/fotg210-udc.c           | 1 +
 drivers/usb/gadget/udc/aspeed-vhub/epn.c    | 1 +
 drivers/usb/gadget/udc/aspeed_udc.c         | 1 +
 drivers/usb/gadget/udc/at91_udc.c           | 1 +
 drivers/usb/gadget/udc/atmel_usba_udc.c     | 1 +
 drivers/usb/gadget/udc/bcm63xx_udc.c        | 1 +
 drivers/usb/gadget/udc/bdc/bdc_ep.c         | 1 +
 drivers/usb/gadget/udc/cdns2/cdns2-gadget.c | 2 +-
 drivers/usb/gadget/udc/dummy_hcd.c          | 1 +
 drivers/usb/gadget/udc/fsl_qe_udc.c         | 1 +
 drivers/usb/gadget/udc/fsl_udc_core.c       | 1 +
 drivers/usb/gadget/udc/fusb300_udc.c        | 1 +
 drivers/usb/gadget/udc/goku_udc.c           | 1 +
 drivers/usb/gadget/udc/gr_udc.c             | 1 +
 drivers/usb/gadget/udc/lpc32xx_udc.c        | 1 +
 drivers/usb/gadget/udc/m66592-udc.c         | 1 +
 drivers/usb/gadget/udc/max3420_udc.c        | 1 +
 drivers/usb/gadget/udc/mv_u3d_core.c        | 2 ++
 drivers/usb/gadget/udc/mv_udc_core.c        | 2 ++
 drivers/usb/gadget/udc/net2272.c            | 1 +
 drivers/usb/gadget/udc/net2280.c            | 2 ++
 drivers/usb/gadget/udc/omap_udc.c           | 1 +
 drivers/usb/gadget/udc/pch_udc.c            | 1 +
 drivers/usb/gadget/udc/pxa25x_udc.c         | 1 +
 drivers/usb/gadget/udc/pxa27x_udc.c         | 1 +
 drivers/usb/gadget/udc/r8a66597-udc.c       | 1 +
 drivers/usb/gadget/udc/renesas_usb3.c       | 1 +
 drivers/usb/gadget/udc/renesas_usbf.c       | 1 +
 drivers/usb/gadget/udc/snps_udc_core.c      | 1 +
 drivers/usb/gadget/udc/tegra-xudc.c         | 2 ++
 drivers/usb/gadget/udc/udc-xilinx.c         | 1 +
 drivers/usb/isp1760/isp1760-udc.c           | 1 +
 drivers/usb/mtu3/mtu3_gadget.c              | 1 +
 drivers/usb/musb/musb_gadget.c              | 1 +
 drivers/usb/renesas_usbhs/mod_gadget.c      | 1 +
 drivers/usb/usbip/vudc_dev.c                | 1 +
 41 files changed, 45 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/cdns3/cdns3-gadget.c b/drivers/usb/cdns3/cdns3-gadget.c
index 11a5b3437c32..6abd3a1593bb 100644
--- a/drivers/usb/cdns3/cdns3-gadget.c
+++ b/drivers/usb/cdns3/cdns3-gadget.c
@@ -3109,6 +3109,7 @@ static int cdns3_init_eps(struct cdns3_device *priv_dev)
 		priv_ep->num = ep_number;
 		priv_ep->dir = ep_dir ? USB_DIR_IN : USB_DIR_OUT;
 
+		priv_ep->endpoint.epnum = ep_number;
 		if (!ep_number) {
 			ret = cdns3_init_ep0(priv_dev, priv_ep);
 			if (ret) {
diff --git a/drivers/usb/cdns3/cdnsp-gadget.c b/drivers/usb/cdns3/cdnsp-gadget.c
index fff9ec9c391f..4225d3c1d0c4 100644
--- a/drivers/usb/cdns3/cdnsp-gadget.c
+++ b/drivers/usb/cdns3/cdnsp-gadget.c
@@ -1622,6 +1622,7 @@ static int cdnsp_gadget_init_endpoints(struct cdnsp_device *pdev)
 		pep->number = epnum;
 		pep->direction = direction; /* 0 for OUT, 1 for IN. */
 
+		pep->endpoint.epnum = epnum;
 		/*
 		 * Ep0 is bidirectional, so ep0in and ep0out are represented by
 		 * pdev->eps[0]
diff --git a/drivers/usb/chipidea/udc.c b/drivers/usb/chipidea/udc.c
index 0b7bd3c643c3..be05027edbfd 100644
--- a/drivers/usb/chipidea/udc.c
+++ b/drivers/usb/chipidea/udc.c
@@ -1857,6 +1857,7 @@ static int init_eps(struct ci_hdrc *ci)
 			hwep->lock         = &ci->lock;
 			hwep->td_pool      = ci->td_pool;
 
+			hwep->ep.epnum     = i;
 			hwep->ep.name      = hwep->name;
 			hwep->ep.ops       = &usb_ep_ops;
 
diff --git a/drivers/usb/dwc2/gadget.c b/drivers/usb/dwc2/gadget.c
index b517a7216de2..a92931b21b9e 100644
--- a/drivers/usb/dwc2/gadget.c
+++ b/drivers/usb/dwc2/gadget.c
@@ -4805,7 +4805,7 @@ static void dwc2_hsotg_initep(struct dwc2_hsotg *hsotg,
 
 	INIT_LIST_HEAD(&hs_ep->queue);
 	INIT_LIST_HEAD(&hs_ep->ep.ep_list);
-
+	hs_ep->ep.epnum = epnum;
 	/* add to the list of endpoints known by the gadget driver */
 	if (epnum)
 		list_add_tail(&hs_ep->ep.ep_list, &hsotg->gadget.ep_list);
diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
index 858fe4c299b7..325d299713f7 100644
--- a/drivers/usb/dwc3/gadget.c
+++ b/drivers/usb/dwc3/gadget.c
@@ -3267,6 +3267,7 @@ static int dwc3_gadget_init_endpoint(struct dwc3 *dwc, u8 epnum)
 
 	dep->endpoint.name = dep->name;
 
+	dep->endpoint.epnum = num;
 	if (!(dep->number > 1)) {
 		dep->endpoint.desc = &dwc3_gadget_ep0_desc;
 		dep->endpoint.comp_desc = NULL;
diff --git a/drivers/usb/fotg210/fotg210-udc.c b/drivers/usb/fotg210/fotg210-udc.c
index f7ea84070554..f48d57672010 100644
--- a/drivers/usb/fotg210/fotg210-udc.c
+++ b/drivers/usb/fotg210/fotg210-udc.c
@@ -1238,6 +1238,7 @@ int fotg210_udc_probe(struct platform_device *pdev, struct fotg210 *fotg)
 		ep->fotg210 = fotg210;
 		INIT_LIST_HEAD(&ep->queue);
 		ep->ep.name = fotg210_ep_name[i];
+		ep->ep.epnum = i;
 		ep->ep.ops = &fotg210_ep_ops;
 		usb_ep_set_maxpacket_limit(&ep->ep, (unsigned short) ~0);
 
diff --git a/drivers/usb/gadget/udc/aspeed-vhub/epn.c b/drivers/usb/gadget/udc/aspeed-vhub/epn.c
index 148d7ec3ebf4..c5f4ec58f520 100644
--- a/drivers/usb/gadget/udc/aspeed-vhub/epn.c
+++ b/drivers/usb/gadget/udc/aspeed-vhub/epn.c
@@ -825,6 +825,7 @@ struct ast_vhub_ep *ast_vhub_alloc_epn(struct ast_vhub_dev *d, u8 addr)
 	ep->d_idx = addr;
 	ep->vhub = vhub;
 	ep->ep.ops = &ast_vhub_epn_ops;
+	ep->ep.epnum = addr;
 	ep->ep.name = kasprintf(GFP_KERNEL, "ep%d", addr);
 	d->epns[addr-1] = ep;
 	ep->epn.g_idx = i;
diff --git a/drivers/usb/gadget/udc/aspeed_udc.c b/drivers/usb/gadget/udc/aspeed_udc.c
index 2ef89a442f50..50c57f86dc4f 100644
--- a/drivers/usb/gadget/udc/aspeed_udc.c
+++ b/drivers/usb/gadget/udc/aspeed_udc.c
@@ -1355,6 +1355,7 @@ static void ast_udc_init_ep(struct ast_udc_dev *udc)
 
 	for (i = 0; i < AST_UDC_NUM_ENDPOINTS; i++) {
 		ep = &udc->ep[i];
+		ep->ep.epnum = i;
 		ep->ep.name = ast_ep_name[i];
 		if (i == 0) {
 			ep->ep.caps.type_control = true;
diff --git a/drivers/usb/gadget/udc/at91_udc.c b/drivers/usb/gadget/udc/at91_udc.c
index 922b4187004b..2905bc60be75 100644
--- a/drivers/usb/gadget/udc/at91_udc.c
+++ b/drivers/usb/gadget/udc/at91_udc.c
@@ -1819,6 +1819,7 @@ static int at91udc_probe(struct platform_device *pdev)
 
 	for (i = 0; i < NUM_ENDPOINTS; i++) {
 		ep = &udc->ep[i];
+		ep->ep.epnum = i;
 		ep->ep.name = ep_info[i].name;
 		ep->ep.caps = ep_info[i].caps;
 		ep->ep.ops = &at91_ep_ops;
diff --git a/drivers/usb/gadget/udc/atmel_usba_udc.c b/drivers/usb/gadget/udc/atmel_usba_udc.c
index 02b1bef5e22e..045b732ac467 100644
--- a/drivers/usb/gadget/udc/atmel_usba_udc.c
+++ b/drivers/usb/gadget/udc/atmel_usba_udc.c
@@ -2217,6 +2217,7 @@ static struct usba_ep * atmel_udc_of_init(struct platform_device *pdev,
 		ep->can_dma = ep_cfg->can_dma;
 		ep->can_isoc = ep_cfg->can_isoc;
 
+		ep->ep.epnum = ep->index;
 		sprintf(ep->name, "ep%d", ep->index);
 		ep->ep.name = ep->name;
 
diff --git a/drivers/usb/gadget/udc/bcm63xx_udc.c b/drivers/usb/gadget/udc/bcm63xx_udc.c
index da7011d906e0..325d37ac2fae 100644
--- a/drivers/usb/gadget/udc/bcm63xx_udc.c
+++ b/drivers/usb/gadget/udc/bcm63xx_udc.c
@@ -952,6 +952,7 @@ static int bcm63xx_init_udc_hw(struct bcm63xx_udc *udc)
 	for (i = 0; i < BCM63XX_NUM_EP; i++) {
 		struct bcm63xx_ep *bep = &udc->bep[i];
 
+		bep->ep.epnum = i;
 		bep->ep.name = bcm63xx_ep_info[i].name;
 		bep->ep.caps = bcm63xx_ep_info[i].caps;
 		bep->ep_num = i;
diff --git a/drivers/usb/gadget/udc/bdc/bdc_ep.c b/drivers/usb/gadget/udc/bdc/bdc_ep.c
index fa88f210ecd5..2fc32349823a 100644
--- a/drivers/usb/gadget/udc/bdc/bdc_ep.c
+++ b/drivers/usb/gadget/udc/bdc/bdc_ep.c
@@ -1977,6 +1977,7 @@ static int init_ep(struct bdc *bdc, u32 epnum, u32 dir)
 		snprintf(ep->name, sizeof(ep->name), "ep%d%s", epnum - 1,
 			 dir & 1 ? "in" : "out");
 
+		ep->usb_ep.epnum = epnum - 1;
 		usb_ep_set_maxpacket_limit(&ep->usb_ep, 1024);
 		ep->usb_ep.caps.type_iso = true;
 		ep->usb_ep.caps.type_bulk = true;
diff --git a/drivers/usb/gadget/udc/cdns2/cdns2-gadget.c b/drivers/usb/gadget/udc/cdns2/cdns2-gadget.c
index 0eed0e03842c..81dcad43025f 100644
--- a/drivers/usb/gadget/udc/cdns2/cdns2-gadget.c
+++ b/drivers/usb/gadget/udc/cdns2/cdns2-gadget.c
@@ -2213,7 +2213,7 @@ static int cdns2_init_eps(struct cdns2_device *pdev)
 		} else {
 			snprintf(pep->name, sizeof(pep->name), "ep%d%s",
 				 epnum, !!direction ? "in" : "out");
-			pep->endpoint.name = pep->name;
+			pep->endpoint.epnum = epnum;
 
 			usb_ep_set_maxpacket_limit(&pep->endpoint, 1024);
 			pep->endpoint.ops = &cdns2_gadget_ep_ops;
diff --git a/drivers/usb/gadget/udc/dummy_hcd.c b/drivers/usb/gadget/udc/dummy_hcd.c
index 0953e1b5c030..b2c919e46cc5 100644
--- a/drivers/usb/gadget/udc/dummy_hcd.c
+++ b/drivers/usb/gadget/udc/dummy_hcd.c
@@ -1049,6 +1049,7 @@ static void init_dummy_udc_hw(struct dummy *dum)
 
 		if (!ep_info[i].name)
 			break;
+		ep->ep.epnum = i;
 		ep->ep.name = ep_info[i].name;
 		ep->ep.caps = ep_info[i].caps;
 		ep->ep.ops = &dummy_ep_ops;
diff --git a/drivers/usb/gadget/udc/fsl_qe_udc.c b/drivers/usb/gadget/udc/fsl_qe_udc.c
index 4aae86b47edf..48a32f8b903d 100644
--- a/drivers/usb/gadget/udc/fsl_qe_udc.c
+++ b/drivers/usb/gadget/udc/fsl_qe_udc.c
@@ -2411,6 +2411,7 @@ static int qe_ep_config(struct qe_udc *udc, unsigned char pipe_num)
 	ep->udc = udc;
 	strcpy(ep->name, ep_name[pipe_num]);
 	ep->ep.name = ep_name[pipe_num];
+	ep->ep.epnum = pipe_num;
 
 	if (pipe_num == 0) {
 		ep->ep.caps.type_control = true;
diff --git a/drivers/usb/gadget/udc/fsl_udc_core.c b/drivers/usb/gadget/udc/fsl_udc_core.c
index ee5705d336e3..78f4948bfc9f 100644
--- a/drivers/usb/gadget/udc/fsl_udc_core.c
+++ b/drivers/usb/gadget/udc/fsl_udc_core.c
@@ -2331,6 +2331,7 @@ static int struct_ep_setup(struct fsl_udc *udc, unsigned char index,
 	else
 		ep->ep.caps.dir_out = true;
 
+	ep->ep.epunm = index / 2;
 	/* for ep0: maxP defined in desc
 	 * for other eps, maxP is set by epautoconfig() called by gadget layer
 	 */
diff --git a/drivers/usb/gadget/udc/fusb300_udc.c b/drivers/usb/gadget/udc/fusb300_udc.c
index bd03d475f927..a2cc2237c3b1 100644
--- a/drivers/usb/gadget/udc/fusb300_udc.c
+++ b/drivers/usb/gadget/udc/fusb300_udc.c
@@ -1445,6 +1445,7 @@ static int fusb300_probe(struct platform_device *pdev)
 		}
 		ep->fusb300 = fusb300;
 		INIT_LIST_HEAD(&ep->queue);
+		ep->ep.epnum = i;
 		ep->ep.name = fusb300_ep_name[i];
 		ep->ep.ops = &fusb300_ep_ops;
 		usb_ep_set_maxpacket_limit(&ep->ep, HS_BULK_MAX_PACKET_SIZE);
diff --git a/drivers/usb/gadget/udc/goku_udc.c b/drivers/usb/gadget/udc/goku_udc.c
index 5ffb3d5c635b..9757c886dd72 100644
--- a/drivers/usb/gadget/udc/goku_udc.c
+++ b/drivers/usb/gadget/udc/goku_udc.c
@@ -1266,6 +1266,7 @@ static void udc_reinit (struct goku_udc *dev)
 		struct goku_ep	*ep = &dev->ep[i];
 
 		ep->num = i;
+		ep->ep.epnum = i;
 		ep->ep.name = names[i];
 		ep->reg_fifo = &dev->regs->ep_fifo [i];
 		ep->reg_status = &dev->regs->ep_status [i];
diff --git a/drivers/usb/gadget/udc/gr_udc.c b/drivers/usb/gadget/udc/gr_udc.c
index c6dfa7cccc11..674de5aea8ed 100644
--- a/drivers/usb/gadget/udc/gr_udc.c
+++ b/drivers/usb/gadget/udc/gr_udc.c
@@ -1976,6 +1976,7 @@ static int gr_ep_init(struct gr_udc *dev, int num, int is_in, u32 maxplimit)
 	ep->num = num;
 	ep->is_in = is_in;
 	ep->dev = dev;
+	ep->ep.epnum = num;
 	ep->ep.ops = &gr_ep_ops;
 	INIT_LIST_HEAD(&ep->queue);
 
diff --git a/drivers/usb/gadget/udc/lpc32xx_udc.c b/drivers/usb/gadget/udc/lpc32xx_udc.c
index fe62db32dd0e..1d436450adc8 100644
--- a/drivers/usb/gadget/udc/lpc32xx_udc.c
+++ b/drivers/usb/gadget/udc/lpc32xx_udc.c
@@ -1385,6 +1385,7 @@ static void udc_reinit(struct lpc32xx_udc *udc)
 
 		if (i != 0)
 			list_add_tail(&ep->ep.ep_list, &udc->gadget.ep_list);
+		ep->ep.epnum = i;
 		usb_ep_set_maxpacket_limit(&ep->ep, ep->maxpacket);
 		INIT_LIST_HEAD(&ep->queue);
 		ep->req_pending = 0;
diff --git a/drivers/usb/gadget/udc/m66592-udc.c b/drivers/usb/gadget/udc/m66592-udc.c
index e05f45a4b56b..4070b466e109 100644
--- a/drivers/usb/gadget/udc/m66592-udc.c
+++ b/drivers/usb/gadget/udc/m66592-udc.c
@@ -1622,6 +1622,7 @@ static int m66592_probe(struct platform_device *pdev)
 		}
 		ep->m66592 = m66592;
 		INIT_LIST_HEAD(&ep->queue);
+		ep->ep.epnum = i;
 		ep->ep.name = m66592_ep_name[i];
 		ep->ep.ops = &m66592_ep_ops;
 		usb_ep_set_maxpacket_limit(&ep->ep, 512);
diff --git a/drivers/usb/gadget/udc/max3420_udc.c b/drivers/usb/gadget/udc/max3420_udc.c
index 2d57786d3db7..09bf310df9fa 100644
--- a/drivers/usb/gadget/udc/max3420_udc.c
+++ b/drivers/usb/gadget/udc/max3420_udc.c
@@ -1162,6 +1162,7 @@ static void max3420_eps_init(struct max3420_udc *udc)
 		ep->id = idx;
 		ep->halted = 0;
 		ep->maxpacket = 0;
+		ep->ep_usb.epnum = idx;
 		ep->ep_usb.name = ep->name;
 		ep->ep_usb.ops = &max3420_ep_ops;
 		usb_ep_set_maxpacket_limit(&ep->ep_usb, MAX3420_EP_MAX_PACKET);
diff --git a/drivers/usb/gadget/udc/mv_u3d_core.c b/drivers/usb/gadget/udc/mv_u3d_core.c
index 2a421f0ff931..c77c949edd06 100644
--- a/drivers/usb/gadget/udc/mv_u3d_core.c
+++ b/drivers/usb/gadget/udc/mv_u3d_core.c
@@ -1308,6 +1308,7 @@ static int mv_u3d_eps_init(struct mv_u3d *u3d)
 	ep = &u3d->eps[1];
 	ep->u3d = u3d;
 	strncpy(ep->name, "ep0", sizeof(ep->name));
+	ep->ep.epnum = 0;
 	ep->ep.name = ep->name;
 	ep->ep.ops = &mv_u3d_ep_ops;
 	ep->wedge = 0;
@@ -1339,6 +1340,7 @@ static int mv_u3d_eps_init(struct mv_u3d *u3d)
 		ep->u3d = u3d;
 		strncpy(ep->name, name, sizeof(ep->name));
 		ep->ep.name = ep->name;
+		ep->ep.epnum = i / 2;
 
 		ep->ep.caps.type_iso = true;
 		ep->ep.caps.type_bulk = true;
diff --git a/drivers/usb/gadget/udc/mv_udc_core.c b/drivers/usb/gadget/udc/mv_udc_core.c
index d888dcda2bc8..fdd8dd52d89d 100644
--- a/drivers/usb/gadget/udc/mv_udc_core.c
+++ b/drivers/usb/gadget/udc/mv_udc_core.c
@@ -1244,6 +1244,7 @@ static int eps_init(struct mv_udc *udc)
 	ep = &udc->eps[0];
 	ep->udc = udc;
 	strncpy(ep->name, "ep0", sizeof(ep->name));
+	ep->ep.epnum = 0;
 	ep->ep.name = ep->name;
 	ep->ep.ops = &mv_ep_ops;
 	ep->wedge = 0;
@@ -1273,6 +1274,7 @@ static int eps_init(struct mv_udc *udc)
 		ep->udc = udc;
 		strncpy(ep->name, name, sizeof(ep->name));
 		ep->ep.name = ep->name;
+		ep->ep.epnum = i / 2;
 
 		ep->ep.caps.type_iso = true;
 		ep->ep.caps.type_bulk = true;
diff --git a/drivers/usb/gadget/udc/net2272.c b/drivers/usb/gadget/udc/net2272.c
index 12e76bb62c20..766aabcbd3d1 100644
--- a/drivers/usb/gadget/udc/net2272.c
+++ b/drivers/usb/gadget/udc/net2272.c
@@ -1373,6 +1373,7 @@ net2272_usb_reinit(struct net2272 *dev)
 		struct net2272_ep *ep = &dev->ep[i];
 
 		ep->ep.name = ep_name[i];
+		ep->ep.epnum = i;
 		ep->dev = dev;
 		ep->num = i;
 		ep->not_empty = 0;
diff --git a/drivers/usb/gadget/udc/net2280.c b/drivers/usb/gadget/udc/net2280.c
index 1b929c519cd7..b6b3722c0ae6 100644
--- a/drivers/usb/gadget/udc/net2280.c
+++ b/drivers/usb/gadget/udc/net2280.c
@@ -2158,6 +2158,7 @@ static void usb_reinit_228x(struct net2280 *dev)
 
 		ep->ep.name = ep_info_dft[tmp].name;
 		ep->ep.caps = ep_info_dft[tmp].caps;
+		ep->ep.epnum = tmp;
 		ep->dev = dev;
 		ep->num = tmp;
 
@@ -2201,6 +2202,7 @@ static void usb_reinit_338x(struct net2280 *dev)
 						   ep_info_dft[i].name;
 		ep->ep.caps = dev->enhanced_mode ? ep_info_adv[i].caps :
 						   ep_info_dft[i].caps;
+		ep->ep.epnum = i;
 		ep->dev = dev;
 		ep->num = i;
 
diff --git a/drivers/usb/gadget/udc/omap_udc.c b/drivers/usb/gadget/udc/omap_udc.c
index 10c5d7f726a1..8baf996fa65a 100644
--- a/drivers/usb/gadget/udc/omap_udc.c
+++ b/drivers/usb/gadget/udc/omap_udc.c
@@ -2582,6 +2582,7 @@ omap_ep_setup(char *name, u8 addr, u8 type,
 	else
 		ep->ep.caps.dir_out = true;
 
+	ep->ep.epnum = addr & 0xf;
 	ep->ep.name = ep->name;
 	ep->ep.ops = &omap_ep_ops;
 	ep->maxpacket = maxp;
diff --git a/drivers/usb/gadget/udc/pch_udc.c b/drivers/usb/gadget/udc/pch_udc.c
index 4f8617210d85..05247d6f5c61 100644
--- a/drivers/usb/gadget/udc/pch_udc.c
+++ b/drivers/usb/gadget/udc/pch_udc.c
@@ -2788,6 +2788,7 @@ static void pch_udc_pcd_reinit(struct pch_udc_dev *dev)
 		ep->halted = 1;
 		ep->num = i / 2;
 		ep->in = ~i & 1;
+		ep->ep.epnum = i / 2;
 		ep->ep.name = ep_string[i];
 		ep->ep.ops = &pch_udc_ep_ops;
 		if (ep->in) {
diff --git a/drivers/usb/gadget/udc/pxa25x_udc.c b/drivers/usb/gadget/udc/pxa25x_udc.c
index df0551ecc810..b4e2f018216c 100644
--- a/drivers/usb/gadget/udc/pxa25x_udc.c
+++ b/drivers/usb/gadget/udc/pxa25x_udc.c
@@ -1392,6 +1392,7 @@ static void udc_reinit(struct pxa25x_udc *dev)
 		if (i != 0)
 			list_add_tail (&ep->ep.ep_list, &dev->gadget.ep_list);
 
+		ep->ep.epnum = i;
 		ep->ep.desc = NULL;
 		ep->stopped = 0;
 		INIT_LIST_HEAD (&ep->queue);
diff --git a/drivers/usb/gadget/udc/pxa27x_udc.c b/drivers/usb/gadget/udc/pxa27x_udc.c
index 61424cfd2e1c..8f05937414ca 100644
--- a/drivers/usb/gadget/udc/pxa27x_udc.c
+++ b/drivers/usb/gadget/udc/pxa27x_udc.c
@@ -1677,6 +1677,7 @@ static void udc_init_data(struct pxa_udc *dev)
 
 	/* USB endpoints init */
 	for (i = 1; i < NR_USB_ENDPOINTS; i++) {
+		dev->udc_usb_ep[i].usb_ep.epnum = i;
 		list_add_tail(&dev->udc_usb_ep[i].usb_ep.ep_list,
 				&dev->gadget.ep_list);
 		usb_ep_set_maxpacket_limit(&dev->udc_usb_ep[i].usb_ep,
diff --git a/drivers/usb/gadget/udc/r8a66597-udc.c b/drivers/usb/gadget/udc/r8a66597-udc.c
index 51b665f15c8e..eb3cd4446e39 100644
--- a/drivers/usb/gadget/udc/r8a66597-udc.c
+++ b/drivers/usb/gadget/udc/r8a66597-udc.c
@@ -1912,6 +1912,7 @@ static int r8a66597_probe(struct platform_device *pdev)
 		}
 		ep->r8a66597 = r8a66597;
 		INIT_LIST_HEAD(&ep->queue);
+		ep->ep.epnum = i;
 		ep->ep.name = r8a66597_ep_name[i];
 		ep->ep.ops = &r8a66597_ep_ops;
 		usb_ep_set_maxpacket_limit(&ep->ep, 512);
diff --git a/drivers/usb/gadget/udc/renesas_usb3.c b/drivers/usb/gadget/udc/renesas_usb3.c
index 3b01734ce1b7..f1bf719022fb 100644
--- a/drivers/usb/gadget/udc/renesas_usb3.c
+++ b/drivers/usb/gadget/udc/renesas_usb3.c
@@ -2700,6 +2700,7 @@ static int renesas_usb3_init_ep(struct renesas_usb3 *usb3, struct device *dev,
 		snprintf(usb3_ep->ep_name, sizeof(usb3_ep->ep_name), "ep%d", i);
 		usb3_ep->usb3 = usb3;
 		usb3_ep->num = i;
+		usb3_ep->ep.epnum = i;
 		usb3_ep->ep.name = usb3_ep->ep_name;
 		usb3_ep->ep.ops = &renesas_usb3_ep_ops;
 		INIT_LIST_HEAD(&usb3_ep->queue);
diff --git a/drivers/usb/gadget/udc/renesas_usbf.c b/drivers/usb/gadget/udc/renesas_usbf.c
index 657f265ac7cc..cb741e54ea4c 100644
--- a/drivers/usb/gadget/udc/renesas_usbf.c
+++ b/drivers/usb/gadget/udc/renesas_usbf.c
@@ -3308,6 +3308,7 @@ static int usbf_probe(struct platform_device *pdev)
 		ep->id = i;
 		ep->disabled = 1;
 		ep->udc = udc;
+		ep->ep.epnum = i;
 		ep->ep.ops = &usbf_ep_ops;
 		ep->ep.name = usbf_ep_info[i].name;
 		ep->ep.caps = usbf_ep_info[i].caps;
diff --git a/drivers/usb/gadget/udc/snps_udc_core.c b/drivers/usb/gadget/udc/snps_udc_core.c
index 2fc5d4d277bc..feeea53787ee 100644
--- a/drivers/usb/gadget/udc/snps_udc_core.c
+++ b/drivers/usb/gadget/udc/snps_udc_core.c
@@ -1538,6 +1538,7 @@ static void udc_setup_endpoints(struct udc *dev)
 	for (tmp = 0; tmp < UDC_EP_NUM; tmp++) {
 		ep = &dev->ep[tmp];
 		ep->dev = dev;
+		ep->ep.epnum = tmp;
 		ep->ep.name = ep_info[tmp].name;
 		ep->ep.caps = ep_info[tmp].caps;
 		ep->num = tmp;
diff --git a/drivers/usb/gadget/udc/tegra-xudc.c b/drivers/usb/gadget/udc/tegra-xudc.c
index cb85168fd00c..3e95d1486674 100644
--- a/drivers/usb/gadget/udc/tegra-xudc.c
+++ b/drivers/usb/gadget/udc/tegra-xudc.c
@@ -3173,6 +3173,7 @@ static int tegra_xudc_alloc_ep(struct tegra_xudc *xudc, unsigned int index)
 	if (index) {
 		snprintf(ep->name, sizeof(ep->name), "ep%u%s", index / 2,
 			 (index % 2 == 0) ? "out" : "in");
+		ep->ep.epnum = index / 2;
 		ep->usb_ep.name = ep->name;
 		usb_ep_set_maxpacket_limit(&ep->usb_ep, 1024);
 		ep->usb_ep.max_streams = 16;
@@ -3186,6 +3187,7 @@ static int tegra_xudc_alloc_ep(struct tegra_xudc *xudc, unsigned int index)
 		list_add_tail(&ep->usb_ep.ep_list, &xudc->gadget.ep_list);
 	} else {
 		strscpy(ep->name, "ep0", 3);
+		ep->ep.epnum = 0;
 		ep->usb_ep.name = ep->name;
 		usb_ep_set_maxpacket_limit(&ep->usb_ep, 512);
 		ep->usb_ep.ops = &tegra_xudc_ep0_ops;
diff --git a/drivers/usb/gadget/udc/udc-xilinx.c b/drivers/usb/gadget/udc/udc-xilinx.c
index 56b8286a8009..f04e26a8f6d3 100644
--- a/drivers/usb/gadget/udc/udc-xilinx.c
+++ b/drivers/usb/gadget/udc/udc-xilinx.c
@@ -1324,6 +1324,7 @@ static void xudc_eps_init(struct xusb_udc *udc)
 			ep->ep_usb.caps.type_control = true;
 		}
 
+		ep->ep_usb.epnum = ep_number;
 		ep->ep_usb.caps.dir_in = true;
 		ep->ep_usb.caps.dir_out = true;
 
diff --git a/drivers/usb/isp1760/isp1760-udc.c b/drivers/usb/isp1760/isp1760-udc.c
index 5cafd23345ca..a6f83ff661ad 100644
--- a/drivers/usb/isp1760/isp1760-udc.c
+++ b/drivers/usb/isp1760/isp1760-udc.c
@@ -1466,6 +1466,7 @@ static void isp1760_udc_init_eps(struct isp1760_udc *udc)
 		ep->ep.ops = &isp1760_ep_ops;
 		ep->ep.name = ep->name;
 
+		ep->ep.epnum = ep_num;
 		/*
 		 * Hardcode the maximum packet sizes for now, to 64 bytes for
 		 * the control endpoint and 512 bytes for all other endpoints.
diff --git a/drivers/usb/mtu3/mtu3_gadget.c b/drivers/usb/mtu3/mtu3_gadget.c
index ad0eeac4332d..bc76339eef16 100644
--- a/drivers/usb/mtu3/mtu3_gadget.c
+++ b/drivers/usb/mtu3/mtu3_gadget.c
@@ -655,6 +655,7 @@ static void init_hw_ep(struct mtu3 *mtu, struct mtu3_ep *mep,
 	sprintf(mep->name, "ep%d%s", epnum,
 		!epnum ? "" : (is_in ? "in" : "out"));
 
+	mep->ep.epnum = epnum;
 	mep->ep.name = mep->name;
 	INIT_LIST_HEAD(&mep->ep.ep_list);
 
diff --git a/drivers/usb/musb/musb_gadget.c b/drivers/usb/musb/musb_gadget.c
index 051c6da7cf6d..1aab514d39f2 100644
--- a/drivers/usb/musb/musb_gadget.c
+++ b/drivers/usb/musb/musb_gadget.c
@@ -1709,6 +1709,7 @@ init_peripheral_ep(struct musb *musb, struct musb_ep *ep, u8 epnum, int is_in)
 			(!epnum || hw_ep->is_shared_fifo) ? "" : (
 				is_in ? "in" : "out"));
 	ep->end_point.name = ep->name;
+	ep->end_point.epnum = epnum;
 	INIT_LIST_HEAD(&ep->end_point.ep_list);
 	if (!epnum) {
 		usb_ep_set_maxpacket_limit(&ep->end_point, 64);
diff --git a/drivers/usb/renesas_usbhs/mod_gadget.c b/drivers/usb/renesas_usbhs/mod_gadget.c
index 105132ae87ac..648bee7e5198 100644
--- a/drivers/usb/renesas_usbhs/mod_gadget.c
+++ b/drivers/usb/renesas_usbhs/mod_gadget.c
@@ -1139,6 +1139,7 @@ int usbhs_mod_gadget_probe(struct usbhs_priv *priv)
 		uep->pipe	= NULL;
 		snprintf(uep->ep_name, EP_NAME_SIZE, "ep%d", i);
 
+		uep->ep.epnum = i;
 		uep->ep.name		= uep->ep_name;
 		uep->ep.ops		= &usbhsg_ep_ops;
 		INIT_LIST_HEAD(&uep->ep.ep_list);
diff --git a/drivers/usb/usbip/vudc_dev.c b/drivers/usb/usbip/vudc_dev.c
index 44b04c54c086..05c95d9ebd8e 100644
--- a/drivers/usb/usbip/vudc_dev.c
+++ b/drivers/usb/usbip/vudc_dev.c
@@ -535,6 +535,7 @@ static int init_vudc_hw(struct vudc *udc)
 			i ? (is_out ? "out" : "in") : "");
 		ep->ep.name = ep->name;
 
+		ep->ep.epnum = num;
 		ep->ep.ops = &vep_ops;
 
 		usb_ep_set_maxpacket_limit(&ep->ep, ~0);
-- 
2.17.1

