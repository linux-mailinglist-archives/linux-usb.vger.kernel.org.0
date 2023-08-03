Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F0C5576E406
	for <lists+linux-usb@lfdr.de>; Thu,  3 Aug 2023 11:11:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235043AbjHCJLt (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 3 Aug 2023 05:11:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51038 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234640AbjHCJLZ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 3 Aug 2023 05:11:25 -0400
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8B38135B5
        for <linux-usb@vger.kernel.org>; Thu,  3 Aug 2023 02:11:10 -0700 (PDT)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3736LfbU003599;
        Thu, 3 Aug 2023 09:11:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=qcppdkim1;
 bh=SxNXJZBhGOhSoRgtoq2N8H2t1MFrvgbFsEDbdtNaPAU=;
 b=GfbHzKuGCxzhPgzuqwrrCj4wCqZZUzudNckaSILXo3Dpf4dWT0GqvvH1snma9pisADsA
 HjEkVrbYQpA1y7b1KqJ3PN2KODE9XNugjsOa67+AJWm3WX9LSf7Y5AGWPf+iuGi2nLNr
 4wU43RiL24Bge73bkfhmj5uVog93OKkm4SbPUTsOFP0g/3VmtWoh5FEGvaaQyCCe1ORs
 7hXbia9BV5C5R9hTaahTZVuh+hfnQmzxP2esN/zvSxG237uRWLROaC0qiSBlRL+XtLy6
 /9LP/VjGHufO0XL0HBGhWsub19xE1zdcaJjDj3JLd57Ogl3yCW2AIzrSBmbdD8445BzH tw== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3s83q0gkwp-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 03 Aug 2023 09:11:09 +0000
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
        by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3739B8hx009988
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 3 Aug 2023 09:11:08 GMT
Received: from linyyuan-gv.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.30; Thu, 3 Aug 2023 02:11:06 -0700
From:   Linyu Yuan <quic_linyyuan@quicinc.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC:     <linux-usb@vger.kernel.org>, Linyu Yuan <quic_linyyuan@quicinc.com>
Subject: [PATCH v2 2/7] usb: gadget: add a inline function gether_bitrate()
Date:   Thu, 3 Aug 2023 17:10:48 +0800
Message-ID: <20230803091053.9714-3-quic_linyyuan@quicinc.com>
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
X-Proofpoint-ORIG-GUID: wDa2caWubYUfW9E2W23a109U-oFhZocS
X-Proofpoint-GUID: wDa2caWubYUfW9E2W23a109U-oFhZocS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-08-03_07,2023-08-01_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 bulkscore=0 clxscore=1015 impostorscore=0 malwarescore=0 suspectscore=0
 mlxlogscore=365 priorityscore=1501 mlxscore=0 spamscore=0 phishscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2306200000 definitions=main-2308030080
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

In function ecm_bitrate(), it is not support report bit rate for super
speed plus mode, but it can use same bit rate value defined in ncm and
rndis.

Add a common inline function gether_bitrate() which report different for
all possible speeds, it can be used by ecm, ncm and rndis, also remove
old function from them.

Signed-off-by: Linyu Yuan <quic_linyyuan@quicinc.com>
---
v2: fix comment from Oliver Neukum <oneukum@suse.com>

 drivers/usb/gadget/function/f_ecm.c   | 15 ++-------------
 drivers/usb/gadget/function/f_ncm.c   | 19 ++-----------------
 drivers/usb/gadget/function/f_rndis.c | 15 +--------------
 drivers/usb/gadget/function/u_ether.h | 13 +++++++++++++
 4 files changed, 18 insertions(+), 44 deletions(-)

diff --git a/drivers/usb/gadget/function/f_ecm.c b/drivers/usb/gadget/function/f_ecm.c
index cbe05da94bde..7e943b562348 100644
--- a/drivers/usb/gadget/function/f_ecm.c
+++ b/drivers/usb/gadget/function/f_ecm.c
@@ -65,17 +65,6 @@ static inline struct f_ecm *func_to_ecm(struct usb_function *f)
 	return container_of(f, struct f_ecm, port.func);
 }
 
-/* peak (theoretical) bulk transfer rate in bits-per-second */
-static inline unsigned ecm_bitrate(struct usb_gadget *g)
-{
-	if (g->speed == USB_SPEED_SUPER)
-		return 13 * 1024 * 8 * 1000 * 8;
-	else if (g->speed == USB_SPEED_HIGH)
-		return 13 * 512 * 8 * 1000 * 8;
-	else
-		return 19 * 64 * 1 * 1000 * 8;
-}
-
 /*-------------------------------------------------------------------------*/
 
 /*
@@ -411,10 +400,10 @@ static void ecm_do_notify(struct f_ecm *ecm)
 
 		/* SPEED_CHANGE data is up/down speeds in bits/sec */
 		data = req->buf + sizeof *event;
-		data[0] = cpu_to_le32(ecm_bitrate(cdev->gadget));
+		data[0] = cpu_to_le32(gether_bitrate(cdev->gadget));
 		data[1] = data[0];
 
-		DBG(cdev, "notify speed %d\n", ecm_bitrate(cdev->gadget));
+		DBG(cdev, "notify speed %d\n", gether_bitrate(cdev->gadget));
 		ecm->notify_state = ECM_NOTIFY_NONE;
 		break;
 	}
diff --git a/drivers/usb/gadget/function/f_ncm.c b/drivers/usb/gadget/function/f_ncm.c
index e6dac5510540..0feadf686a31 100644
--- a/drivers/usb/gadget/function/f_ncm.c
+++ b/drivers/usb/gadget/function/f_ncm.c
@@ -80,21 +80,6 @@ static inline struct f_ncm *func_to_ncm(struct usb_function *f)
 	return container_of(f, struct f_ncm, port.func);
 }
 
-/* peak (theoretical) bulk transfer rate in bits-per-second */
-static inline unsigned ncm_bitrate(struct usb_gadget *g)
-{
-	if (!g)
-		return 0;
-	else if (g->speed >= USB_SPEED_SUPER_PLUS)
-		return 4250000000U;
-	else if (g->speed == USB_SPEED_SUPER)
-		return 3750000000U;
-	else if (g->speed == USB_SPEED_HIGH)
-		return 13 * 512 * 8 * 1000 * 8;
-	else
-		return 19 *  64 * 1 * 1000 * 8;
-}
-
 /*-------------------------------------------------------------------------*/
 
 /*
@@ -576,10 +561,10 @@ static void ncm_do_notify(struct f_ncm *ncm)
 
 		/* SPEED_CHANGE data is up/down speeds in bits/sec */
 		data = req->buf + sizeof *event;
-		data[0] = cpu_to_le32(ncm_bitrate(cdev->gadget));
+		data[0] = cpu_to_le32(gether_bitrate(cdev->gadget));
 		data[1] = data[0];
 
-		DBG(cdev, "notify speed %u\n", ncm_bitrate(cdev->gadget));
+		DBG(cdev, "notify speed %u\n", gether_bitrate(cdev->gadget));
 		ncm->notify_state = NCM_NOTIFY_CONNECT;
 		break;
 	}
diff --git a/drivers/usb/gadget/function/f_rndis.c b/drivers/usb/gadget/function/f_rndis.c
index eff5d7cbce00..ed1c3eb91d3b 100644
--- a/drivers/usb/gadget/function/f_rndis.c
+++ b/drivers/usb/gadget/function/f_rndis.c
@@ -84,19 +84,6 @@ static inline struct f_rndis *func_to_rndis(struct usb_function *f)
 	return container_of(f, struct f_rndis, port.func);
 }
 
-/* peak (theoretical) bulk transfer rate in bits-per-second */
-static unsigned int bitrate(struct usb_gadget *g)
-{
-	if (g->speed >= USB_SPEED_SUPER_PLUS)
-		return 4250000000U;
-	if (g->speed == USB_SPEED_SUPER)
-		return 3750000000U;
-	else if (g->speed == USB_SPEED_HIGH)
-		return 13 * 512 * 8 * 1000 * 8;
-	else
-		return 19 * 64 * 1 * 1000 * 8;
-}
-
 /*-------------------------------------------------------------------------*/
 
 /*
@@ -640,7 +627,7 @@ static void rndis_open(struct gether *geth)
 	DBG(cdev, "%s\n", __func__);
 
 	rndis_set_param_medium(rndis->params, RNDIS_MEDIUM_802_3,
-				bitrate(cdev->gadget) / 100);
+				gether_bitrate(cdev->gadget) / 100);
 	rndis_signal_connect(rndis->params);
 }
 
diff --git a/drivers/usb/gadget/function/u_ether.h b/drivers/usb/gadget/function/u_ether.h
index 851ee10d6e63..34be220cef77 100644
--- a/drivers/usb/gadget/function/u_ether.h
+++ b/drivers/usb/gadget/function/u_ether.h
@@ -279,4 +279,17 @@ static inline bool can_support_ecm(struct usb_gadget *gadget)
 	return true;
 }
 
+/* peak (theoretical) bulk transfer rate in bits-per-second */
+static inline unsigned int gether_bitrate(struct usb_gadget *g)
+{
+	if (g->speed >= USB_SPEED_SUPER_PLUS)
+		return 4250000000U;
+	if (g->speed == USB_SPEED_SUPER)
+		return 3750000000U;
+	else if (g->speed == USB_SPEED_HIGH)
+		return 13 * 512 * 8 * 1000 * 8;
+	else
+		return 19 * 64 * 1 * 1000 * 8;
+}
+
 #endif /* __U_ETHER_H */
-- 
2.17.1

