Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4EE6B76E405
	for <lists+linux-usb@lfdr.de>; Thu,  3 Aug 2023 11:11:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235040AbjHCJLq (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 3 Aug 2023 05:11:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50636 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234574AbjHCJLY (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 3 Aug 2023 05:11:24 -0400
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4996F3594
        for <linux-usb@vger.kernel.org>; Thu,  3 Aug 2023 02:11:09 -0700 (PDT)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3736Do5R018497;
        Thu, 3 Aug 2023 09:11:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=qcppdkim1;
 bh=lnGeKLe76VUqUnyUtHqFpR/yLZB38wSsdkeHjlUbwrE=;
 b=H+UY9mLu5Zn//q6J+r8/HAXtUHVzPj8/opaeaKAAtUKCNwtn3Hb40M0U7aVdLO7g+x/V
 R30IL1DGktEMkffwTelmNxYBeGL9/IPolrK3CZ3j+Nw0+P/gLyymcmYKDPiwQGkMLdOH
 c7/ZtaaoYh8h8efMgFwUUXLKZTGIzT55NBMBXkFugTBC4XSmZdK4H3Vl++e8a3vDmBPy
 4xiruR0X0o57or33vDalIfJnwaD5LJAH+ocaig+GtLGyqNkAHX+k4M2OwUvkoVzCstHv
 xcDN0C4PtP5vQezHDKVR+n5kshbTVJzwUEtGOOmwNp0k2kGA/ONEKbB3FI/n2bYVkY7S Eg== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3s83q0gkwk-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 03 Aug 2023 09:11:07 +0000
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
        by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3739B6JZ020657
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 3 Aug 2023 09:11:06 GMT
Received: from linyyuan-gv.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.30; Thu, 3 Aug 2023 02:11:05 -0700
From:   Linyu Yuan <quic_linyyuan@quicinc.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC:     <linux-usb@vger.kernel.org>, Linyu Yuan <quic_linyyuan@quicinc.com>
Subject: [PATCH v2 1/7] usb: gadget: use working speed to calcaulate network bitrate and qlen
Date:   Thu, 3 Aug 2023 17:10:47 +0800
Message-ID: <20230803091053.9714-2-quic_linyyuan@quicinc.com>
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
X-Proofpoint-ORIG-GUID: 7dYFCliqOH78h8ixOKchUHFyO6-O5uZ_
X-Proofpoint-GUID: 7dYFCliqOH78h8ixOKchUHFyO6-O5uZ_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-08-03_07,2023-08-01_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=2 lowpriorityscore=0
 bulkscore=0 clxscore=1015 impostorscore=0 malwarescore=0 suspectscore=0
 mlxlogscore=181 priorityscore=1501 mlxscore=2 spamscore=2 phishscore=0
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

Take ecm_bitrate() as example, it will be called after gadget device
link speed negotiation, consider code
if (gadget_is_superspeed(g) && g->speed == USB_SPEED_SUPER),
if a gadget device link speed is USB_SPEED_SUPER,
gadget_is_superspeed(g) must be true, or not it is a wrong
configuration of gadget max support speed.

Remove gadget_is_superspeed(g) checking should be safe, and remove other
similar operation in ncm, rndis, u_ether.

Signed-off-by: Linyu Yuan <quic_linyyuan@quicinc.com>
---
v2: move this as first patch to fix comment from Oliver Neukum <oneukum@suse.com>

 drivers/usb/gadget/function/f_ecm.c   | 4 ++--
 drivers/usb/gadget/function/f_ncm.c   | 6 +++---
 drivers/usb/gadget/function/f_rndis.c | 6 +++---
 drivers/usb/gadget/function/u_ether.c | 5 ++---
 4 files changed, 10 insertions(+), 11 deletions(-)

diff --git a/drivers/usb/gadget/function/f_ecm.c b/drivers/usb/gadget/function/f_ecm.c
index c6e63ad77a40..cbe05da94bde 100644
--- a/drivers/usb/gadget/function/f_ecm.c
+++ b/drivers/usb/gadget/function/f_ecm.c
@@ -68,9 +68,9 @@ static inline struct f_ecm *func_to_ecm(struct usb_function *f)
 /* peak (theoretical) bulk transfer rate in bits-per-second */
 static inline unsigned ecm_bitrate(struct usb_gadget *g)
 {
-	if (gadget_is_superspeed(g) && g->speed == USB_SPEED_SUPER)
+	if (g->speed == USB_SPEED_SUPER)
 		return 13 * 1024 * 8 * 1000 * 8;
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

