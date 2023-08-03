Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9FC0476DFA9
	for <lists+linux-usb@lfdr.de>; Thu,  3 Aug 2023 07:19:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232457AbjHCFTN (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 3 Aug 2023 01:19:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50638 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231909AbjHCFTI (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 3 Aug 2023 01:19:08 -0400
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6FAD93582
        for <linux-usb@vger.kernel.org>; Wed,  2 Aug 2023 22:18:58 -0700 (PDT)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3732hCZ4006422;
        Thu, 3 Aug 2023 05:18:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=qcppdkim1;
 bh=fStjR+Kyu92pwdIYQfxnCNhvTg+51yYHAY5pRCDHHXY=;
 b=k6t/B9BbXoteSpuoNv4MQKQkkWCTS1NNY1SiJGa1Pe+5IUE5AsLF7l7DZm7rxf9zNCMi
 r6jYl1eILQXx2c8+c8V0ceZKMDtlr6LU0qsQC84G+N9wUWZBUpQx22unHeU/qLoVI6TM
 +Z1rE5l9cJeg2S11gFu+nfMQVPXrWemQOfCGfRbKzVqDzb9zKNUXfPI8GSs1HjeYH7Cc
 DjqnuCIGbAsR9WlSOiEe0ME4qTwKId/O37wEx2fdXmwXMpJ+LU9ES8XjnFrYm9ydRrWC
 svMddFGwHuAaKCs7yUnWhUriojxvfiNOrWMXmyTWrdbTA6JqX+itdgwqTDQ2STaY5TyO lQ== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3s82wx892g-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 03 Aug 2023 05:18:57 +0000
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
        by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3735Isfb006287
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 3 Aug 2023 05:18:55 GMT
Received: from linyyuan-gv.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.30; Wed, 2 Aug 2023 22:18:54 -0700
From:   Linyu Yuan <quic_linyyuan@quicinc.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC:     <linux-usb@vger.kernel.org>, Linyu Yuan <quic_linyyuan@quicinc.com>
Subject: [PATCH 5/7] usb: gadget: config: remove max speed check in usb_assign_descriptors()
Date:   Thu, 3 Aug 2023 13:18:08 +0800
Message-ID: <20230803051810.2974-6-quic_linyyuan@quicinc.com>
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
X-Proofpoint-ORIG-GUID: 125MAu7GbpaFa0bc0YO88W5rHD-ANWyf
X-Proofpoint-GUID: 125MAu7GbpaFa0bc0YO88W5rHD-ANWyf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-08-03_02,2023-08-01_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 spamscore=0
 lowpriorityscore=0 impostorscore=0 adultscore=0 mlxscore=0 bulkscore=0
 priorityscore=1501 mlxlogscore=595 phishscore=0 clxscore=1015
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2306200000 definitions=main-2308030048
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

usb_assign_descriptors() usally called inside function bind operation,
and gadget still have no working connection speed, let's support all
speed at this point, it may possible allocate extra memory to store
descriptors, but it is small and acceptable.

Remove gadget_is_{*}speed() API checking to allow support all speed.

Signed-off-by: Linyu Yuan <quic_linyyuan@quicinc.com>
---
 drivers/usb/gadget/config.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/usb/gadget/config.c b/drivers/usb/gadget/config.c
index 05507606b2b4..b1f625245713 100644
--- a/drivers/usb/gadget/config.c
+++ b/drivers/usb/gadget/config.c
@@ -162,8 +162,6 @@ int usb_assign_descriptors(struct usb_function *f,
 		struct usb_descriptor_header **ss,
 		struct usb_descriptor_header **ssp)
 {
-	struct usb_gadget *g = f->config->cdev->gadget;
-
 	/* super-speed-plus descriptor falls back to super-speed one,
 	 * if such a descriptor was provided, thus avoiding a NULL
 	 * pointer dereference if a 5gbps capable gadget is used with
@@ -177,17 +175,17 @@ int usb_assign_descriptors(struct usb_function *f,
 		if (!f->fs_descriptors)
 			goto err;
 	}
-	if (hs && gadget_is_dualspeed(g)) {
+	if (hs) {
 		f->hs_descriptors = usb_copy_descriptors(hs);
 		if (!f->hs_descriptors)
 			goto err;
 	}
-	if (ss && gadget_is_superspeed(g)) {
+	if (ss) {
 		f->ss_descriptors = usb_copy_descriptors(ss);
 		if (!f->ss_descriptors)
 			goto err;
 	}
-	if (ssp && gadget_is_superspeed_plus(g)) {
+	if (ssp) {
 		f->ssp_descriptors = usb_copy_descriptors(ssp);
 		if (!f->ssp_descriptors)
 			goto err;
-- 
2.17.1

