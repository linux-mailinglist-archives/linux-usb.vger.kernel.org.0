Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6B72676E40A
	for <lists+linux-usb@lfdr.de>; Thu,  3 Aug 2023 11:12:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233647AbjHCJMa (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 3 Aug 2023 05:12:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51098 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234999AbjHCJL4 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 3 Aug 2023 05:11:56 -0400
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D040C30DB
        for <linux-usb@vger.kernel.org>; Thu,  3 Aug 2023 02:11:32 -0700 (PDT)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3737H43F019696;
        Thu, 3 Aug 2023 09:11:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=qcppdkim1;
 bh=Uq+VxVLUXgQpBbn2rTm9pyXsHvy6qJlIdWzuexQwcM8=;
 b=hjmVFEx4OlrIK0jFi8eQXzTT4A8oWZw4e2VPhTeQpHuEmcRcc4IfPAc0D+XYAv9N0L+0
 Kfd4XvF1QIhzdgo8auQXmUIgj2SMyViMW0zBea+B0Hr4uouczRk3BLO4X9619rQ91Hji
 w8rbdP7WeudUb+OoOq5FGhFAgC7EbB6wXTGvHvpFUDC9lw3dS+rWTTpyzpgvlBCu/Grl
 /ENDdMD2czBKz1CPvLxrDNClJ4uUvRJlTKqN6OVlQWfSC+GTrL8Tz2dAfElWceHp07a6
 ayu3p97Rowkpxqrenw3XsJKSoBpsJFw8jBFrU/k6iQNlMQ13d/QhDkIf1Io6xBE5oj1q uA== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3s7upp1g53-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 03 Aug 2023 09:11:31 +0000
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
        by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3739BEFd021204
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 3 Aug 2023 09:11:14 GMT
Received: from linyyuan-gv.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.30; Thu, 3 Aug 2023 02:11:12 -0700
From:   Linyu Yuan <quic_linyyuan@quicinc.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC:     <linux-usb@vger.kernel.org>, Linyu Yuan <quic_linyyuan@quicinc.com>
Subject: [PATCH v2 6/7] usb: gadget: composite: cleanup function config_ep_by_speed_and_alt()
Date:   Thu, 3 Aug 2023 17:10:52 +0800
Message-ID: <20230803091053.9714-7-quic_linyyuan@quicinc.com>
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
X-Proofpoint-GUID: sKxXCQlHMgja1tlU0n-4wsRlmibVeGE0
X-Proofpoint-ORIG-GUID: sKxXCQlHMgja1tlU0n-4wsRlmibVeGE0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-08-03_06,2023-08-01_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 clxscore=1015
 malwarescore=0 spamscore=0 lowpriorityscore=0 mlxlogscore=687 bulkscore=0
 impostorscore=0 priorityscore=1501 adultscore=0 mlxscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2306200000
 definitions=main-2308030081
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
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
v2: no change

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

