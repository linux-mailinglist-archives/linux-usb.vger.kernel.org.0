Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C363C76DFAC
	for <lists+linux-usb@lfdr.de>; Thu,  3 Aug 2023 07:19:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232481AbjHCFTw (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 3 Aug 2023 01:19:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50834 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232659AbjHCFT0 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 3 Aug 2023 01:19:26 -0400
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8DE1A3C3A
        for <linux-usb@vger.kernel.org>; Wed,  2 Aug 2023 22:19:06 -0700 (PDT)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3735GGwU014004;
        Thu, 3 Aug 2023 05:19:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=qcppdkim1;
 bh=n7zPuMulRoXm6vdnssx/oJcawQOWpeKCED1X/4IRxb0=;
 b=CuhgO3zsaxGNbjZL/Or1Z4kzK7+aD8wR6htsW4CoTf5QAJuFD5IB9wm1toKiStZpV7VR
 m/wq7RaFv/aJEjcxo9RVuRT36cHDlnzM/nMsmhdCYqxWt8U9abh8fj5BBlZ+c82RG4UQ
 3hrYU2JzXBhpPeHDvAK8wyTAYOIr/DzR0w/g1UhjEWOYiwh1liLc9U6Queq1UbwenPmv
 QUxIg4Fl32YER2eN32TSLP/xfqGc1USV21O2F9xVKe005rt/ZLUIji/j8zJB/+the2l9
 6abOJQ9y3aGpxQPPFO2jFY6tUbS8ZUG5bdvXYUcTLD1Re7aL6HZ2uQ0inar+hnbwy2OK ng== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3s7sgnhbgn-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 03 Aug 2023 05:19:04 +0000
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
        by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3735Iuw0007313
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 3 Aug 2023 05:18:56 GMT
Received: from linyyuan-gv.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.30; Wed, 2 Aug 2023 22:18:55 -0700
From:   Linyu Yuan <quic_linyyuan@quicinc.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC:     <linux-usb@vger.kernel.org>, Linyu Yuan <quic_linyyuan@quicinc.com>
Subject: [PATCH 6/7] usb: gadget: composite: cleanup function config_ep_by_speed_and_alt()
Date:   Thu, 3 Aug 2023 13:18:09 +0800
Message-ID: <20230803051810.2974-7-quic_linyyuan@quicinc.com>
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
X-Proofpoint-ORIG-GUID: 1Tt89mZIA6_lX3pT3MGhznYULVCCERE9
X-Proofpoint-GUID: 1Tt89mZIA6_lX3pT3MGhznYULVCCERE9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-08-03_03,2023-08-01_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 malwarescore=0
 lowpriorityscore=0 spamscore=0 mlxscore=0 mlxlogscore=673
 priorityscore=1501 impostorscore=0 adultscore=0 bulkscore=0 phishscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2306200000 definitions=main-2308030048
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

When call this function, gadget already have working speed, if it is
USB_SPEED_SUPER_PLUS, in theroy gadget_is_superspeed_plus() checking
should be true, so there is no need to call it. it is same for other
working speed.

Remove all gadget_is_{*}speed_plus() API call to clean it up.

Signed-off-by: Linyu Yuan <quic_linyyuan@quicinc.com>
---
 drivers/usb/gadget/composite.c | 34 ++++++++++++++--------------------
 1 file changed, 14 insertions(+), 20 deletions(-)

diff --git a/drivers/usb/gadget/composite.c b/drivers/usb/gadget/composite.c
index dd9b90481b4c..0ace45b66a31 100644
--- a/drivers/usb/gadget/composite.c
+++ b/drivers/usb/gadget/composite.c
@@ -170,33 +170,27 @@ int config_ep_by_speed_and_alt(struct usb_gadget *g,
 	/* select desired speed */
 	switch (g->speed) {
 	case USB_SPEED_SUPER_PLUS:
-		if (gadget_is_superspeed_plus(g)) {
-			if (f->ssp_descriptors) {
-				speed_desc = f->ssp_descriptors;
-				want_comp_desc = 1;
-				break;
-			}
-			incomplete_desc = true;
+		if (f->ssp_descriptors) {
+			speed_desc = f->ssp_descriptors;
+			want_comp_desc = 1;
+			break;
 		}
+		incomplete_desc = true;
 		fallthrough;
 	case USB_SPEED_SUPER:
-		if (gadget_is_superspeed(g)) {
-			if (f->ss_descriptors) {
-				speed_desc = f->ss_descriptors;
-				want_comp_desc = 1;
-				break;
-			}
-			incomplete_desc = true;
+		if (f->ss_descriptors) {
+			speed_desc = f->ss_descriptors;
+			want_comp_desc = 1;
+			break;
 		}
+		incomplete_desc = true;
 		fallthrough;
 	case USB_SPEED_HIGH:
-		if (gadget_is_dualspeed(g)) {
-			if (f->hs_descriptors) {
-				speed_desc = f->hs_descriptors;
-				break;
-			}
-			incomplete_desc = true;
+		if (f->hs_descriptors) {
+			speed_desc = f->hs_descriptors;
+			break;
 		}
+		incomplete_desc = true;
 		fallthrough;
 	default:
 		speed_desc = f->fs_descriptors;
-- 
2.17.1

