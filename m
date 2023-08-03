Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2933276E408
	for <lists+linux-usb@lfdr.de>; Thu,  3 Aug 2023 11:12:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235034AbjHCJMO (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 3 Aug 2023 05:12:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50394 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235037AbjHCJLn (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 3 Aug 2023 05:11:43 -0400
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E91DC4200
        for <linux-usb@vger.kernel.org>; Thu,  3 Aug 2023 02:11:20 -0700 (PDT)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3737qiCP014019;
        Thu, 3 Aug 2023 09:11:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=qcppdkim1;
 bh=WoVQz2c2nX7hkkPLCE2Mo0vmVTBlcD1TW/x9HXnvEW4=;
 b=DFrR8eEU+fww/iZnvaPEYqeKdgo0XyVWTmuXgVy0OaMAomkHPLLtTDbzoFVepNvUkUkU
 76gSCm9pRNSaXyfaN6axTckr8de16IRtb22dVMbM90WTm9s6g9T3/9EDTka6eoTMKs3k
 KeFmo3si7rHDKhUi8M1pcN4ovAZU63sH2lvt9ZLReopxKhwO3RqaHgGC9NwNHVrPUvCh
 DQBX12IwQxB1pxEjjuSRoHYE951/UKyAlXrS49NF8y+86aGWMIyxNmtrPgYf8oJ/9MFx
 B33OVtMWNqbVk4JWzPtKCTQg7CCDrvOo0QJtmhivd6KFhuWu0QXAHQ+OPzv0w+7ZL9s4 9g== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3s7vtv9a8y-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 03 Aug 2023 09:11:19 +0000
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
        by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3739BBeg024612
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 3 Aug 2023 09:11:11 GMT
Received: from linyyuan-gv.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.30; Thu, 3 Aug 2023 02:11:09 -0700
From:   Linyu Yuan <quic_linyyuan@quicinc.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC:     <linux-usb@vger.kernel.org>, Linyu Yuan <quic_linyyuan@quicinc.com>
Subject: [PATCH v2 4/7] usb: gadget: unconditionally allocate hs/ss descriptor in bind operation
Date:   Thu, 3 Aug 2023 17:10:50 +0800
Message-ID: <20230803091053.9714-5-quic_linyyuan@quicinc.com>
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
X-Proofpoint-GUID: GU2Qmr4suzjPjF3RDfdPBfQY4IS-Y5lm
X-Proofpoint-ORIG-GUID: GU2Qmr4suzjPjF3RDfdPBfQY4IS-Y5lm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-08-03_07,2023-08-01_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 clxscore=1015
 suspectscore=0 phishscore=0 adultscore=0 priorityscore=1501 malwarescore=0
 lowpriorityscore=0 spamscore=0 bulkscore=0 mlxscore=0 mlxlogscore=271
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

Take f_midi_bind() for example,  when composite layer call it, it will
allocate hs descriptor by calling gadget_is_dualspeed() API to check
gadget max support speed capability, but most other gadget function didn't
do like this.

To follow other function drivers, it is safe to remove the check which
mean support all possible link speed by default in function driver.

Similar change apply to midi2 and uvc.

Also in midi and midi2, as there is no descriptor difference between
super speed and super speed plus, follow other gadget function drivers,
do not allocate descriptor for super speed plus, composite layer will
handle it properly.

Signed-off-by: Linyu Yuan <quic_linyyuan@quicinc.com>
---
v2: no change

 drivers/usb/gadget/function/f_midi.c  | 56 +++++++++++----------------
 drivers/usb/gadget/function/f_midi2.c | 44 ++++++++-------------
 drivers/usb/gadget/function/f_uvc.c   | 26 ++++++-------
 3 files changed, 51 insertions(+), 75 deletions(-)

diff --git a/drivers/usb/gadget/function/f_midi.c b/drivers/usb/gadget/function/f_midi.c
index fddf539008a9..2d02f25f9597 100644
--- a/drivers/usb/gadget/function/f_midi.c
+++ b/drivers/usb/gadget/function/f_midi.c
@@ -1023,40 +1023,30 @@ static int f_midi_bind(struct usb_configuration *c, struct usb_function *f)
 	if (!f->fs_descriptors)
 		goto fail_f_midi;
 
-	if (gadget_is_dualspeed(c->cdev->gadget)) {
-		bulk_in_desc.wMaxPacketSize = cpu_to_le16(512);
-		bulk_out_desc.wMaxPacketSize = cpu_to_le16(512);
-		f->hs_descriptors = usb_copy_descriptors(midi_function);
-		if (!f->hs_descriptors)
-			goto fail_f_midi;
-	}
+	bulk_in_desc.wMaxPacketSize = cpu_to_le16(512);
+	bulk_out_desc.wMaxPacketSize = cpu_to_le16(512);
+	f->hs_descriptors = usb_copy_descriptors(midi_function);
+	if (!f->hs_descriptors)
+		goto fail_f_midi;
 
-	if (gadget_is_superspeed(c->cdev->gadget)) {
-		bulk_in_desc.wMaxPacketSize = cpu_to_le16(1024);
-		bulk_out_desc.wMaxPacketSize = cpu_to_le16(1024);
-		i = endpoint_descriptor_index;
-		midi_function[i++] = (struct usb_descriptor_header *)
-				     &bulk_out_desc;
-		midi_function[i++] = (struct usb_descriptor_header *)
-				     &bulk_out_ss_comp_desc;
-		midi_function[i++] = (struct usb_descriptor_header *)
-				     &ms_out_desc;
-		midi_function[i++] = (struct usb_descriptor_header *)
-				     &bulk_in_desc;
-		midi_function[i++] = (struct usb_descriptor_header *)
-				     &bulk_in_ss_comp_desc;
-		midi_function[i++] = (struct usb_descriptor_header *)
-				     &ms_in_desc;
-		f->ss_descriptors = usb_copy_descriptors(midi_function);
-		if (!f->ss_descriptors)
-			goto fail_f_midi;
-
-		if (gadget_is_superspeed_plus(c->cdev->gadget)) {
-			f->ssp_descriptors = usb_copy_descriptors(midi_function);
-			if (!f->ssp_descriptors)
-				goto fail_f_midi;
-		}
-	}
+	bulk_in_desc.wMaxPacketSize = cpu_to_le16(1024);
+	bulk_out_desc.wMaxPacketSize = cpu_to_le16(1024);
+	i = endpoint_descriptor_index;
+	midi_function[i++] = (struct usb_descriptor_header *)
+			     &bulk_out_desc;
+	midi_function[i++] = (struct usb_descriptor_header *)
+			     &bulk_out_ss_comp_desc;
+	midi_function[i++] = (struct usb_descriptor_header *)
+			     &ms_out_desc;
+	midi_function[i++] = (struct usb_descriptor_header *)
+			     &bulk_in_desc;
+	midi_function[i++] = (struct usb_descriptor_header *)
+			     &bulk_in_ss_comp_desc;
+	midi_function[i++] = (struct usb_descriptor_header *)
+			     &ms_in_desc;
+	f->ss_descriptors = usb_copy_descriptors(midi_function);
+	if (!f->ss_descriptors)
+		goto fail_f_midi;
 
 	kfree(midi_function);
 
diff --git a/drivers/usb/gadget/function/f_midi2.c b/drivers/usb/gadget/function/f_midi2.c
index 5a971ba600fe..ec8cd7c7bbfc 100644
--- a/drivers/usb/gadget/function/f_midi2.c
+++ b/drivers/usb/gadget/function/f_midi2.c
@@ -1731,7 +1731,6 @@ static int f_midi2_create_usb_configs(struct f_midi2 *midi2,
 		midi1_out_eps = midi2_midi1_ep_out_descs;
 		break;
 	case USB_SPEED_SUPER:
-	case USB_SPEED_SUPER_PLUS:
 		midi2_midi1_ep_out_desc.wMaxPacketSize = cpu_to_le16(1024);
 		midi2_midi1_ep_in_desc.wMaxPacketSize = cpu_to_le16(1024);
 		for (i = 0; i < midi2->num_eps; i++)
@@ -2001,36 +2000,25 @@ static int f_midi2_bind(struct usb_configuration *c, struct usb_function *f)
 	}
 	f_midi2_free_usb_configs(&config);
 
-	if (gadget_is_dualspeed(midi2->gadget)) {
-		status = f_midi2_create_usb_configs(midi2, &config, USB_SPEED_HIGH);
-		if (status < 0)
-			goto fail;
-		f->hs_descriptors = usb_copy_descriptors(config.list);
-		if (!f->hs_descriptors) {
-			status = -ENOMEM;
-			goto fail;
-		}
-		f_midi2_free_usb_configs(&config);
+	status = f_midi2_create_usb_configs(midi2, &config, USB_SPEED_HIGH);
+	if (status < 0)
+		goto fail;
+	f->hs_descriptors = usb_copy_descriptors(config.list);
+	if (!f->hs_descriptors) {
+		status = -ENOMEM;
+		goto fail;
 	}
+	f_midi2_free_usb_configs(&config);
 
-	if (gadget_is_superspeed(midi2->gadget)) {
-		status = f_midi2_create_usb_configs(midi2, &config, USB_SPEED_SUPER);
-		if (status < 0)
-			goto fail;
-		f->ss_descriptors = usb_copy_descriptors(config.list);
-		if (!f->ss_descriptors) {
-			status = -ENOMEM;
-			goto fail;
-		}
-		if (gadget_is_superspeed_plus(midi2->gadget)) {
-			f->ssp_descriptors = usb_copy_descriptors(config.list);
-			if (!f->ssp_descriptors) {
-				status = -ENOMEM;
-				goto fail;
-			}
-		}
-		f_midi2_free_usb_configs(&config);
+	status = f_midi2_create_usb_configs(midi2, &config, USB_SPEED_SUPER);
+	if (status < 0)
+		goto fail;
+	f->ss_descriptors = usb_copy_descriptors(config.list);
+	if (!f->ss_descriptors) {
+		status = -ENOMEM;
+		goto fail;
 	}
+	f_midi2_free_usb_configs(&config);
 
 	mutex_unlock(&f_midi2_desc_mutex);
 	return 0;
diff --git a/drivers/usb/gadget/function/f_uvc.c b/drivers/usb/gadget/function/f_uvc.c
index c8e149f8315f..faa398109431 100644
--- a/drivers/usb/gadget/function/f_uvc.c
+++ b/drivers/usb/gadget/function/f_uvc.c
@@ -780,21 +780,19 @@ uvc_function_bind(struct usb_configuration *c, struct usb_function *f)
 		f->fs_descriptors = NULL;
 		goto error;
 	}
-	if (gadget_is_dualspeed(cdev->gadget)) {
-		f->hs_descriptors = uvc_copy_descriptors(uvc, USB_SPEED_HIGH);
-		if (IS_ERR(f->hs_descriptors)) {
-			ret = PTR_ERR(f->hs_descriptors);
-			f->hs_descriptors = NULL;
-			goto error;
-		}
+
+	f->hs_descriptors = uvc_copy_descriptors(uvc, USB_SPEED_HIGH);
+	if (IS_ERR(f->hs_descriptors)) {
+		ret = PTR_ERR(f->hs_descriptors);
+		f->hs_descriptors = NULL;
+		goto error;
 	}
-	if (gadget_is_superspeed(c->cdev->gadget)) {
-		f->ss_descriptors = uvc_copy_descriptors(uvc, USB_SPEED_SUPER);
-		if (IS_ERR(f->ss_descriptors)) {
-			ret = PTR_ERR(f->ss_descriptors);
-			f->ss_descriptors = NULL;
-			goto error;
-		}
+
+	f->ss_descriptors = uvc_copy_descriptors(uvc, USB_SPEED_SUPER);
+	if (IS_ERR(f->ss_descriptors)) {
+		ret = PTR_ERR(f->ss_descriptors);
+		f->ss_descriptors = NULL;
+		goto error;
 	}
 
 	/* Preallocate control endpoint request. */
-- 
2.17.1

