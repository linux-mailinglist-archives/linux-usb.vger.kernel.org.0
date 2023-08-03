Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AF8D776DFAE
	for <lists+linux-usb@lfdr.de>; Thu,  3 Aug 2023 07:20:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232418AbjHCFUg (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 3 Aug 2023 01:20:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50704 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232662AbjHCFT4 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 3 Aug 2023 01:19:56 -0400
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 43713422F
        for <linux-usb@vger.kernel.org>; Wed,  2 Aug 2023 22:19:20 -0700 (PDT)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3734HQ6D021632;
        Thu, 3 Aug 2023 05:19:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=qcppdkim1;
 bh=922iD0fp4GbdaiDh3bA05K9id+fDvD+QoW67nPw2mVk=;
 b=o9Rh4YuaD+cShBYuRC3C3Rva/W6OLmRCmYgCOleiPUTKV3uM9En+dOy5TitrNEt90gqz
 bFN9ii/8nX2UunhG6pOgTlsjtM7lyngGAAQ2M2eTcNYo3l7UsRm5Wbw49Big5xpQIuDC
 WNOzDF5vkDw3l0duX8t9y/qMpmCIRz6GTHlfKgVoH+xAIPZwGouMOl/VNU3xHiawy1AP
 IpZQq5TRL/RWD9Gq7oUKibskX9dkYr+JUcn3BFeX0cv48CvcI3+adQhfOy8a6Wn3iEd+
 JHnfXOJ46+VTnarxBnkgQIGmxJbaDMds7jeJUDF2I/rkjYlLSVAQ0fQCMzL2IxleOMjY rg== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3s7upp12um-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 03 Aug 2023 05:19:17 +0000
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
        by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3735Ipdp025565
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 3 Aug 2023 05:18:51 GMT
Received: from linyyuan-gv.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.30; Wed, 2 Aug 2023 22:18:50 -0700
From:   Linyu Yuan <quic_linyyuan@quicinc.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC:     <linux-usb@vger.kernel.org>, Linyu Yuan <quic_linyyuan@quicinc.com>
Subject: [PATCH 2/7] usb: gaget: use working speed to calcaulate network bitrate and qlen
Date:   Thu, 3 Aug 2023 13:18:05 +0800
Message-ID: <20230803051810.2974-3-quic_linyyuan@quicinc.com>
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
X-Proofpoint-GUID: 4jL2c9i-JFyaT5F6WuPiFOKI4-3PIQqQ
X-Proofpoint-ORIG-GUID: 4jL2c9i-JFyaT5F6WuPiFOKI4-3PIQqQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-08-03_02,2023-08-01_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 clxscore=1015
 malwarescore=0 spamscore=0 lowpriorityscore=0 mlxlogscore=417 bulkscore=0
 impostorscore=0 priorityscore=1501 adultscore=0 mlxscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2306200000
 definitions=main-2308030048
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Take ecm_bitrate() as example, it will be called after gadget device
link speed negotiation, consider code
if (gadget_is_superspeed(g) && g->speed >= USB_SPEED_SUPER_PLUS),
if a gadget device link speed is USB_SPEED_SUPER_PLUS,
gadget_is_superspeed(g) must be true, or not it is cleary wrong
configuration of gadget max support speed.

Remove gadget_is_superspeed(g) checking should be safe, and remove other
similar operation in ncm, rndis, u_ether.

Signed-off-by: Linyu Yuan <quic_linyyuan@quicinc.com>
---
 drivers/usb/gadget/function/f_ecm.c   | 6 +++---
 drivers/usb/gadget/function/f_ncm.c   | 6 +++---
 drivers/usb/gadget/function/f_rndis.c | 6 +++---
 drivers/usb/gadget/function/u_ether.c | 5 ++---
 4 files changed, 11 insertions(+), 12 deletions(-)

diff --git a/drivers/usb/gadget/function/f_ecm.c b/drivers/usb/gadget/function/f_ecm.c
index 8da7d314602c..b1cb944559d4 100644
--- a/drivers/usb/gadget/function/f_ecm.c
+++ b/drivers/usb/gadget/function/f_ecm.c
@@ -68,11 +68,11 @@ static inline struct f_ecm *func_to_ecm(struct usb_function *f)
 /* peak (theoretical) bulk transfer rate in bits-per-second */
 static inline unsigned ecm_bitrate(struct usb_gadget *g)
 {
-	if (gadget_is_superspeed(g) && g->speed >= USB_SPEED_SUPER_PLUS)
+	if (g->speed >= USB_SPEED_SUPER_PLUS)
 		return 4250000000U;
-	else if (gadget_is_superspeed(g) && g->speed == USB_SPEED_SUPER)
+	else if (g->speed == USB_SPEED_SUPER)
 		return 3750000000U;
-	else if (gadget_is_dualspeed(g) && g->speed == USB_SPEED_HIGH)
+	else if (g->speed == USB_SPEED_HIGH)
 		return 13 * 512 * 8 * 1000 * 8;
 	else
 		return 19 * 64 * 1 * 1000 * 8;
diff --git a/drivers/usb/gadget/function/f_ncm.c b/drivers/usb/gadget/function/f_ncm.c
index 424bb3b666db..e6dac5510540 100644
--- a/drivers/usb/gadget/function/f_ncm.c
+++ b/drivers/usb/gadget/function/f_ncm.c
@@ -85,11 +85,11 @@ static inline unsigned ncm_bitrate(struct usb_gadget *g)
 {
 	if (!g)
 		return 0;
-	else if (gadget_is_superspeed(g) && g->speed >= USB_SPEED_SUPER_PLUS)
+	else if (g->speed >= USB_SPEED_SUPER_PLUS)
 		return 4250000000U;
-	else if (gadget_is_superspeed(g) && g->speed == USB_SPEED_SUPER)
+	else if (g->speed == USB_SPEED_SUPER)
 		return 3750000000U;
-	else if (gadget_is_dualspeed(g) && g->speed == USB_SPEED_HIGH)
+	else if (g->speed == USB_SPEED_HIGH)
 		return 13 * 512 * 8 * 1000 * 8;
 	else
 		return 19 *  64 * 1 * 1000 * 8;
diff --git a/drivers/usb/gadget/function/f_rndis.c b/drivers/usb/gadget/function/f_rndis.c
index ee95e8f5f9d4..eff5d7cbce00 100644
--- a/drivers/usb/gadget/function/f_rndis.c
+++ b/drivers/usb/gadget/function/f_rndis.c
@@ -87,11 +87,11 @@ static inline struct f_rndis *func_to_rndis(struct usb_function *f)
 /* peak (theoretical) bulk transfer rate in bits-per-second */
 static unsigned int bitrate(struct usb_gadget *g)
 {
-	if (gadget_is_superspeed(g) && g->speed >= USB_SPEED_SUPER_PLUS)
+	if (g->speed >= USB_SPEED_SUPER_PLUS)
 		return 4250000000U;
-	if (gadget_is_superspeed(g) && g->speed == USB_SPEED_SUPER)
+	if (g->speed == USB_SPEED_SUPER)
 		return 3750000000U;
-	else if (gadget_is_dualspeed(g) && g->speed == USB_SPEED_HIGH)
+	else if (g->speed == USB_SPEED_HIGH)
 		return 13 * 512 * 8 * 1000 * 8;
 	else
 		return 19 * 64 * 1 * 1000 * 8;
diff --git a/drivers/usb/gadget/function/u_ether.c b/drivers/usb/gadget/function/u_ether.c
index a366abb45623..4bb0553da658 100644
--- a/drivers/usb/gadget/function/u_ether.c
+++ b/drivers/usb/gadget/function/u_ether.c
@@ -93,11 +93,10 @@ struct eth_dev {
 
 #define DEFAULT_QLEN	2	/* double buffering by default */
 
-/* for dual-speed hardware, use deeper queues at high/super speed */
+/* use deeper queues at high/super speed */
 static inline int qlen(struct usb_gadget *gadget, unsigned qmult)
 {
-	if (gadget_is_dualspeed(gadget) && (gadget->speed == USB_SPEED_HIGH ||
-					    gadget->speed >= USB_SPEED_SUPER))
+	if (gadget->speed == USB_SPEED_HIGH || gadget->speed >= USB_SPEED_SUPER)
 		return qmult * DEFAULT_QLEN;
 	else
 		return DEFAULT_QLEN;
-- 
2.17.1

