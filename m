Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 639D076DFAB
	for <lists+linux-usb@lfdr.de>; Thu,  3 Aug 2023 07:19:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232769AbjHCFTu (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 3 Aug 2023 01:19:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50696 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232400AbjHCFTZ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 3 Aug 2023 01:19:25 -0400
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A32083C3C
        for <linux-usb@vger.kernel.org>; Wed,  2 Aug 2023 22:19:06 -0700 (PDT)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 37357uaW009998;
        Thu, 3 Aug 2023 05:19:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=qcppdkim1;
 bh=nI+KfOofYlPleGJYyUj9T95++Dj9KvSzi1rHi0s7t2Q=;
 b=N0pIWWtc0tdDGPXghKp7xTCoUvNMI+RRtYZnrjnNz/fzbRmGR1O65+sJnCD5Xj+Y+Cso
 3LppI4dWuetYEFo7Lji9xv3gMH3YjUWJHV4bGB+WA5E8VkIS9esbVk/pzPIPOBr0elKz
 mxS2AE5qhQ9myD1rV1Pj/ZLsGscmuJD9p4oqJLY04ZqSRnHD0FsxxXGv0WNrhvpXv1ch
 9yxJZS3xS/zPwPAwnWXedbiQ1VJanrgu8FqcXWD5IdFAsiwWxa/eOcx3o9vb1cvJ3WY3
 mVc2CKq3u8lYh4l3C37r0FXRpuK7qnEE0sE+s9AkBFyjb1QB5Lwtnrn+IVG/dFve2wNA 3Q== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3s7vxsruxn-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 03 Aug 2023 05:19:04 +0000
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
        by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3735IwwJ025637
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 3 Aug 2023 05:18:58 GMT
Received: from linyyuan-gv.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.30; Wed, 2 Aug 2023 22:18:57 -0700
From:   Linyu Yuan <quic_linyyuan@quicinc.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC:     <linux-usb@vger.kernel.org>, Linyu Yuan <quic_linyyuan@quicinc.com>
Subject: [PATCH 7/7] usb: gadget: remove max support speed info in bind operation
Date:   Thu, 3 Aug 2023 13:18:10 +0800
Message-ID: <20230803051810.2974-8-quic_linyyuan@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230803051810.2974-1-quic_linyyuan@quicinc.com>
References: <20230803051810.2974-1-quic_linyyuan@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 7FhWclbkQeP0lBlnWWaGWhD8fKVRtYOe
X-Proofpoint-GUID: 7FhWclbkQeP0lBlnWWaGWhD8fKVRtYOe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-08-03_02,2023-08-01_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 suspectscore=0 adultscore=0 priorityscore=1501 clxscore=1015
 malwarescore=0 bulkscore=0 mlxlogscore=712 phishscore=0 spamscore=0
 mlxscore=0 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2306200000 definitions=main-2308030048
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
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
index b1cb944559d4..28ee1029a212 100644
--- a/drivers/usb/gadget/function/f_ecm.c
+++ b/drivers/usb/gadget/function/f_ecm.c
@@ -801,9 +801,7 @@ ecm_bind(struct usb_configuration *c, struct usb_function *f)
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
index e6dac5510540..433d278e40ff 100644
--- a/drivers/usb/gadget/function/f_ncm.c
+++ b/drivers/usb/gadget/function/f_ncm.c
@@ -1544,9 +1544,7 @@ static int ncm_bind(struct usb_configuration *c, struct usb_function *f)
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
index eff5d7cbce00..f0fa332e679a 100644
--- a/drivers/usb/gadget/function/f_rndis.c
+++ b/drivers/usb/gadget/function/f_rndis.c
@@ -811,9 +811,7 @@ rndis_bind(struct usb_configuration *c, struct usb_function *f)
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

