Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BE19876E40D
	for <lists+linux-usb@lfdr.de>; Thu,  3 Aug 2023 11:12:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235029AbjHCJMl (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 3 Aug 2023 05:12:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50540 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232258AbjHCJMM (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 3 Aug 2023 05:12:12 -0400
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B12763582
        for <linux-usb@vger.kernel.org>; Thu,  3 Aug 2023 02:11:48 -0700 (PDT)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3735XwiZ007757;
        Thu, 3 Aug 2023 09:11:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=qcppdkim1;
 bh=KyHLKSfybuM7d6uV/lxIOhUHC4OLn8T1tnlI7a/JCrA=;
 b=NJfKd1D4jgOl2Z966qC321jx69hmwnQ2SISA53+3IlQZaFA/DzmNVue4XYUxhR4VQqM6
 wrA9+RnkbmipYH3uy2qI83iV4A6DPDcj/WVjExs8bB1KCNXXRc8KHPzj2sumpR/clSmu
 sQHaIkjq5qAX3B/Fz7RT28VHhGW8j2wySd6LiOVDL7DiSRlNMK78qYGHt0M5d0IPvwMS
 vZZC2ieILMyPWh8hTYuNzAHIRf7p4xlG7oSapeuLDSkDv6ZiCfxE6xMs5wSldk9+CtEo
 eh2dW10aCMxwVe3LRuy0HIvuxquqqIYmk9gh9Poy8OhPSPJBF4lEKQbCiyV3/TUFW+Og +g== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3s83q0gkx1-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 03 Aug 2023 09:11:47 +0000
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
        by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3739BFPu000398
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 3 Aug 2023 09:11:15 GMT
Received: from linyyuan-gv.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.30; Thu, 3 Aug 2023 02:11:13 -0700
From:   Linyu Yuan <quic_linyyuan@quicinc.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC:     <linux-usb@vger.kernel.org>, Linyu Yuan <quic_linyyuan@quicinc.com>
Subject: [PATCH v2 7/7] usb: gadget: remove max support speed info in bind operation
Date:   Thu, 3 Aug 2023 17:10:53 +0800
Message-ID: <20230803091053.9714-8-quic_linyyuan@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230803091053.9714-1-quic_linyyuan@quicinc.com>
References: <20230803091053.9714-1-quic_linyyuan@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 3UwNbfBwryZXjxkBdnHaFnZDqEvZIAVG
X-Proofpoint-GUID: 3UwNbfBwryZXjxkBdnHaFnZDqEvZIAVG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-08-03_07,2023-08-01_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 bulkscore=0 clxscore=1015 impostorscore=0 malwarescore=0 suspectscore=0
 mlxlogscore=712 priorityscore=1501 mlxscore=0 spamscore=0 phishscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2306200000 definitions=main-2308030081
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Take ecm_bind() for example, it call gadget_is_{*}speed() API to show
gadget max support speed, it is not much help, remove the API usage here
is safe.

Similar change apply to acm,eem,loopback,ncm,obex,rndis,serial,
sourcesink,subset functions.

Signed-off-by: Linyu Yuan <quic_linyyuan@quicinc.com>
---
v2: no change

 drivers/usb/gadget/function/f_acm.c        | 4 +---
 drivers/usb/gadget/function/f_ecm.c        | 4 +---
 drivers/usb/gadget/function/f_eem.c        | 4 +---
 drivers/usb/gadget/function/f_loopback.c   | 4 +---
 drivers/usb/gadget/function/f_ncm.c        | 4 +---
 drivers/usb/gadget/function/f_obex.c       | 3 +--
 drivers/usb/gadget/function/f_rndis.c      | 4 +---
 drivers/usb/gadget/function/f_serial.c     | 4 +---
 drivers/usb/gadget/function/f_sourcesink.c | 4 +---
 drivers/usb/gadget/function/f_subset.c     | 4 +---
 10 files changed, 10 insertions(+), 29 deletions(-)

diff --git a/drivers/usb/gadget/function/f_acm.c b/drivers/usb/gadget/function/f_acm.c
index cb523f118f04..f616059c5e1e 100644
--- a/drivers/usb/gadget/function/f_acm.c
+++ b/drivers/usb/gadget/function/f_acm.c
@@ -691,10 +691,8 @@ acm_bind(struct usb_configuration *c, struct usb_function *f)
 		goto fail;
 
 	dev_dbg(&cdev->gadget->dev,
-		"acm ttyGS%d: %s speed IN/%s OUT/%s NOTIFY/%s\n",
+		"acm ttyGS%d: IN/%s OUT/%s NOTIFY/%s\n",
 		acm->port_num,
-		gadget_is_superspeed(c->cdev->gadget) ? "super" :
-		gadget_is_dualspeed(c->cdev->gadget) ? "dual" : "full",
 		acm->port.in->name, acm->port.out->name,
 		acm->notify->name);
 	return 0;
diff --git a/drivers/usb/gadget/function/f_ecm.c b/drivers/usb/gadget/function/f_ecm.c
index 7e943b562348..f55f60639e42 100644
--- a/drivers/usb/gadget/function/f_ecm.c
+++ b/drivers/usb/gadget/function/f_ecm.c
@@ -788,9 +788,7 @@ ecm_bind(struct usb_configuration *c, struct usb_function *f)
 	ecm->port.open = ecm_open;
 	ecm->port.close = ecm_close;
 
-	DBG(cdev, "CDC Ethernet: %s speed IN/%s OUT/%s NOTIFY/%s\n",
-			gadget_is_superspeed(c->cdev->gadget) ? "super" :
-			gadget_is_dualspeed(c->cdev->gadget) ? "dual" : "full",
+	DBG(cdev, "CDC Ethernet: IN/%s OUT/%s NOTIFY/%s\n",
 			ecm->port.in_ep->name, ecm->port.out_ep->name,
 			ecm->notify->name);
 	return 0;
diff --git a/drivers/usb/gadget/function/f_eem.c b/drivers/usb/gadget/function/f_eem.c
index 5d38f29bda72..3b445bd88498 100644
--- a/drivers/usb/gadget/function/f_eem.c
+++ b/drivers/usb/gadget/function/f_eem.c
@@ -311,9 +311,7 @@ static int eem_bind(struct usb_configuration *c, struct usb_function *f)
 	if (status)
 		goto fail;
 
-	DBG(cdev, "CDC Ethernet (EEM): %s speed IN/%s OUT/%s\n",
-			gadget_is_superspeed(c->cdev->gadget) ? "super" :
-			gadget_is_dualspeed(c->cdev->gadget) ? "dual" : "full",
+	DBG(cdev, "CDC Ethernet (EEM): IN/%s OUT/%s\n",
 			eem->port.in_ep->name, eem->port.out_ep->name);
 	return 0;
 
diff --git a/drivers/usb/gadget/function/f_loopback.c b/drivers/usb/gadget/function/f_loopback.c
index ae41f556eb75..17ac6ace0cff 100644
--- a/drivers/usb/gadget/function/f_loopback.c
+++ b/drivers/usb/gadget/function/f_loopback.c
@@ -211,9 +211,7 @@ static int loopback_bind(struct usb_configuration *c, struct usb_function *f)
 	if (ret)
 		return ret;
 
-	DBG(cdev, "%s speed %s: IN/%s, OUT/%s\n",
-	    (gadget_is_superspeed(c->cdev->gadget) ? "super" :
-	     (gadget_is_dualspeed(c->cdev->gadget) ? "dual" : "full")),
+	DBG(cdev, "%s: IN/%s, OUT/%s\n",
 			f->name, loop->in_ep->name, loop->out_ep->name);
 	return 0;
 }
diff --git a/drivers/usb/gadget/function/f_ncm.c b/drivers/usb/gadget/function/f_ncm.c
index 0feadf686a31..feccf4c8cc4f 100644
--- a/drivers/usb/gadget/function/f_ncm.c
+++ b/drivers/usb/gadget/function/f_ncm.c
@@ -1529,9 +1529,7 @@ static int ncm_bind(struct usb_configuration *c, struct usb_function *f)
 	hrtimer_init(&ncm->task_timer, CLOCK_MONOTONIC, HRTIMER_MODE_REL_SOFT);
 	ncm->task_timer.function = ncm_tx_timeout;
 
-	DBG(cdev, "CDC Network: %s speed IN/%s OUT/%s NOTIFY/%s\n",
-			gadget_is_superspeed(c->cdev->gadget) ? "super" :
-			gadget_is_dualspeed(c->cdev->gadget) ? "dual" : "full",
+	DBG(cdev, "CDC Network: IN/%s OUT/%s NOTIFY/%s\n",
 			ncm->port.in_ep->name, ncm->port.out_ep->name,
 			ncm->notify->name);
 	return 0;
diff --git a/drivers/usb/gadget/function/f_obex.c b/drivers/usb/gadget/function/f_obex.c
index ab26d84ed95e..dcb093210305 100644
--- a/drivers/usb/gadget/function/f_obex.c
+++ b/drivers/usb/gadget/function/f_obex.c
@@ -365,9 +365,8 @@ static int obex_bind(struct usb_configuration *c, struct usb_function *f)
 	if (status)
 		goto fail;
 
-	dev_dbg(&cdev->gadget->dev, "obex ttyGS%d: %s speed IN/%s OUT/%s\n",
+	dev_dbg(&cdev->gadget->dev, "obex ttyGS%d: IN/%s OUT/%s\n",
 		obex->port_num,
-		gadget_is_dualspeed(c->cdev->gadget) ? "dual" : "full",
 		obex->port.in->name, obex->port.out->name);
 
 	return 0;
diff --git a/drivers/usb/gadget/function/f_rndis.c b/drivers/usb/gadget/function/f_rndis.c
index ed1c3eb91d3b..b47f99d17ee9 100644
--- a/drivers/usb/gadget/function/f_rndis.c
+++ b/drivers/usb/gadget/function/f_rndis.c
@@ -798,9 +798,7 @@ rndis_bind(struct usb_configuration *c, struct usb_function *f)
 	 * until we're activated via set_alt().
 	 */
 
-	DBG(cdev, "RNDIS: %s speed IN/%s OUT/%s NOTIFY/%s\n",
-			gadget_is_superspeed(c->cdev->gadget) ? "super" :
-			gadget_is_dualspeed(c->cdev->gadget) ? "dual" : "full",
+	DBG(cdev, "RNDIS: IN/%s OUT/%s NOTIFY/%s\n",
 			rndis->port.in_ep->name, rndis->port.out_ep->name,
 			rndis->notify->name);
 	return 0;
diff --git a/drivers/usb/gadget/function/f_serial.c b/drivers/usb/gadget/function/f_serial.c
index a9480b9e312e..65c50092aea2 100644
--- a/drivers/usb/gadget/function/f_serial.c
+++ b/drivers/usb/gadget/function/f_serial.c
@@ -236,10 +236,8 @@ static int gser_bind(struct usb_configuration *c, struct usb_function *f)
 			gser_ss_function, gser_ss_function);
 	if (status)
 		goto fail;
-	dev_dbg(&cdev->gadget->dev, "generic ttyGS%d: %s speed IN/%s OUT/%s\n",
+	dev_dbg(&cdev->gadget->dev, "generic ttyGS%d: IN/%s OUT/%s\n",
 		gser->port_num,
-		gadget_is_superspeed(c->cdev->gadget) ? "super" :
-		gadget_is_dualspeed(c->cdev->gadget) ? "dual" : "full",
 		gser->port.in->name, gser->port.out->name);
 	return 0;
 
diff --git a/drivers/usb/gadget/function/f_sourcesink.c b/drivers/usb/gadget/function/f_sourcesink.c
index 6803cd60cc6d..2edbd9b510d6 100644
--- a/drivers/usb/gadget/function/f_sourcesink.c
+++ b/drivers/usb/gadget/function/f_sourcesink.c
@@ -436,9 +436,7 @@ sourcesink_bind(struct usb_configuration *c, struct usb_function *f)
 	if (ret)
 		return ret;
 
-	DBG(cdev, "%s speed %s: IN/%s, OUT/%s, ISO-IN/%s, ISO-OUT/%s\n",
-	    (gadget_is_superspeed(c->cdev->gadget) ? "super" :
-	     (gadget_is_dualspeed(c->cdev->gadget) ? "dual" : "full")),
+	DBG(cdev, "%s: IN/%s, OUT/%s, ISO-IN/%s, ISO-OUT/%s\n",
 			f->name, ss->in_ep->name, ss->out_ep->name,
 			ss->iso_in_ep ? ss->iso_in_ep->name : "<none>",
 			ss->iso_out_ep ? ss->iso_out_ep->name : "<none>");
diff --git a/drivers/usb/gadget/function/f_subset.c b/drivers/usb/gadget/function/f_subset.c
index 51c1cae162d9..8ae9689ef2a0 100644
--- a/drivers/usb/gadget/function/f_subset.c
+++ b/drivers/usb/gadget/function/f_subset.c
@@ -367,9 +367,7 @@ geth_bind(struct usb_configuration *c, struct usb_function *f)
 	 * until we're activated via set_alt().
 	 */
 
-	DBG(cdev, "CDC Subset: %s speed IN/%s OUT/%s\n",
-			gadget_is_superspeed(c->cdev->gadget) ? "super" :
-			gadget_is_dualspeed(c->cdev->gadget) ? "dual" : "full",
+	DBG(cdev, "CDC Subset: IN/%s OUT/%s\n",
 			geth->port.in_ep->name, geth->port.out_ep->name);
 	return 0;
 
-- 
2.17.1

