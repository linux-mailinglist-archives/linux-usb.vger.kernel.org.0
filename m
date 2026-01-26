Return-Path: <linux-usb+bounces-32756-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MExjAnb7d2nlmwEAu9opvQ
	(envelope-from <linux-usb+bounces-32756-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 27 Jan 2026 00:40:38 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BA4528E47C
	for <lists+linux-usb@lfdr.de>; Tue, 27 Jan 2026 00:40:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id AE41730517C8
	for <lists+linux-usb@lfdr.de>; Mon, 26 Jan 2026 23:39:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 809F2314D19;
	Mon, 26 Jan 2026 23:38:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HVK+8wbC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IUesLymQ"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7A133101B0
	for <linux-usb@vger.kernel.org>; Mon, 26 Jan 2026 23:38:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769470722; cv=none; b=bA+6zyrJPmv4RydHLkLzbZjbQO8xqgUaQwwtp6QGykt4Av5nCMrnN38w/1oW5N7A6aag6gXuZAmPrPecEjAoKUN9MCxGl3KSPU9+CNhC0SqXSCYlNG6F5K1pyKE+/DsRByFCWKYcDEunn338pnc6aGNssYpUzfNS+a0K2D+/W2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769470722; c=relaxed/simple;
	bh=jYMZSplTH/Weoy7w2xwkPNIev4l2TEwX13EaENGM7y4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=R196s9LnsvKu8nek5Eclt6X+1dnBkAqKmZ0wbZNxTLuXyAxf0xNNRVPBYPjMusAMJwu57dE87fFuAvM8gV1gBaW7NeeEAYGCvwMd+sGJVo3E2g/qThG5aZdH+X+5ulfDi8llbJ0+/GIr9oq1CMaUe7+b+EN16fhTOhHJI9+42vw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HVK+8wbC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IUesLymQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60QKgCPP2880085
	for <linux-usb@vger.kernel.org>; Mon, 26 Jan 2026 23:38:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=7PTKth0UrDe
	AreEEoorgLCH/1E+7Lkz0YAQpMI46XKg=; b=HVK+8wbCdiIs/l622lAVwrz3EeR
	zZqWYZnv680gp+5x8ks1d/+hNAudyePUvl4hwQ8UyEzi0RvMYdRjhm5WZEQanFoo
	wcxEAsy4QcIzrchJtfC1lDWC41ORL3SlmGL2lrzC3VeatKga/NsYwBW49f563lE1
	9B/1slmi+4lMdXWtn3M+B2ND21lAfVtEK7xSZWMvucz4VCJ81u4gpern3vaJZTpk
	mC6RWH+rJJSemB6MmklBh1vVEVhryPZ2sbmXu602vXftKfaQbxDURRGlhlhfyJNk
	6g0cb4qm14ZuB/M0ZSqhIMstaCjoPcL4Nb/+44NFXZ/XuJWmCQZFpa9KEIw==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bxffs0cth-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Mon, 26 Jan 2026 23:38:39 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-1248da4d2d6so2658016c88.0
        for <linux-usb@vger.kernel.org>; Mon, 26 Jan 2026 15:38:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769470718; x=1770075518; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7PTKth0UrDeAreEEoorgLCH/1E+7Lkz0YAQpMI46XKg=;
        b=IUesLymQtsEG2G6zk64QOF3M1GZ2eo7vCp27Iq+anjpPofsP8HvBTJVaQ5L7EhlHah
         YWiocy5A2t2LGv5LmfONHzmvGi8IRa0xs2aWb6y5NO3nc9p5LuXyuzhjzdaW+p5HzrAR
         ctB/tkxVa+5AKPCs0Gsj2vhpPK3rAaVIyAtmh5OlGmKgu8TcRk6xO21PJP+FBSnA2msD
         vNkwwvYe+4ZG5j31To9/KYjU9NFgfA6LgOo7xIKE3Hiqc6h48F+5Kxm+08FyhQRkfhJl
         dzne6cbkfwC1+JuZpVGvPKHgItWiimIhx96BN92eqHt66lY5stB/r/8Smlvw/0UyZ0NA
         lv0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769470718; x=1770075518;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7PTKth0UrDeAreEEoorgLCH/1E+7Lkz0YAQpMI46XKg=;
        b=PWaK7SUAnYc0PK/asftA+gPhl8GNVee7aoUfzvFIMkc4tcTBmuFisrMCZfxkzW+wcP
         llzsqYv9CdZddratkqR8lEu1cgeILPJcmS7sGEo34Xw0BOW7hWrZyMlDJPs3c3gVE9dJ
         9kV2Kdzjb05I3xg8MIXWcWq+uWvUAWP7rLkhCgBT1z9ZkBEgeK0dGd7JM3UaBWMti/Er
         i8adD76Lt03/Dyfs3EaYCSn6CkyR+t/ruh8cnOenT03pIt+9NtkoLP6OK0dISfU/u0xg
         cmbelpckDwG+FJhxqskr/mXFO2rmDc8y0D1nhROC7Rngj+cJFw8lZSppcyC/WwDGInB+
         t/SA==
X-Forwarded-Encrypted: i=1; AJvYcCWma6cZpIQuAip2Gb67TK/kFYYlNKck1qJIk7KxQvQU/oqI5MyHYwRPhsUHezUDhCnxS3nOFIp0r8M=@vger.kernel.org
X-Gm-Message-State: AOJu0YyrHgilH9gDfh1zRi4yCK6CIUCOi+UOosHMByBVwiuOxXD0rDN0
	5h0ku1rqhuoTc8xHWLz2NYtnYPkCFK2oTavogJun+0Uco8sHvmAEr/uQ3aCCWTiRa9kdkMr19yW
	MjBAYiIN2orKUX+CTmfmmJK9iTv/ae/OS2HFSEjwZNT7qq9teRE6wYHxY6Uigbco=
X-Gm-Gg: AZuq6aKZQmFUhwJK5mw84EbLFYFKcOk+49pvIkjms0zWdxYtExDVe/RQFbpKSC5zVAP
	R6pI+I6lyEwZ5ZBSyo3Qsu3zOexhxnyPzTV+73olb9og6cQ6mJB3ZT8BpDrT4C27Tg2LcQpBAE4
	VPOQRJyf8FKVZkHRlXSfPjDffy5mqlay/L7uJWbLlSwFcNbHbGbdCv3Clpzth29QBsF/0r4nI8S
	ZhiOKso1CstsbP5R23qZrGjlzblH3g6p5KiTrMHlfdpPu0fHkwj2BtbeQF0jRCQXFy2DrTK2HXR
	2mRFeE/FUDOd6vLlG7VdnNg1xYrrO7EFFDhJlskr7Tv5wbhWu4+MxyaHlQzGx+F0Ck317AbuTr0
	aX4HI2CSszcATk2Z7lV3Mb9RDdxCocY++rKhmJfUvFOEk3wtFxpvS8kUpvwu1Fg0=
X-Received: by 2002:a05:7022:d95:b0:11b:1966:8732 with SMTP id a92af1059eb24-1248ec698e2mr2582767c88.25.1769470718430;
        Mon, 26 Jan 2026 15:38:38 -0800 (PST)
X-Received: by 2002:a05:7022:d95:b0:11b:1966:8732 with SMTP id a92af1059eb24-1248ec698e2mr2582759c88.25.1769470717874;
        Mon, 26 Jan 2026 15:38:37 -0800 (PST)
Received: from hu-eserrao-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1247d90ce0dsm19948967c88.4.2026.01.26.15.38.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jan 2026 15:38:37 -0800 (PST)
From: Elson Serrao <elson.serrao@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Souradeep Chowdhury <quic_schowdhu@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 7/9] usb: misc: qcom_eud: fix virtual attach/detach event handling
Date: Mon, 26 Jan 2026 15:38:28 -0800
Message-Id: <20260126233830.2193816-8-elson.serrao@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260126233830.2193816-1-elson.serrao@oss.qualcomm.com>
References: <20260126233830.2193816-1-elson.serrao@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: LY15UUinsD6q1wYlnr5Yr_-R2NtfRXPj
X-Authority-Analysis: v=2.4 cv=YpcChoYX c=1 sm=1 tr=0 ts=6977faff cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=oDIJ3hVRoRHbvujwG_AA:9 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-ORIG-GUID: LY15UUinsD6q1wYlnr5Yr_-R2NtfRXPj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI2MDIwMiBTYWx0ZWRfX4JtKnAYmEbqX
 qK0CZtx9uNFo7wr1MPy9Nh1tCUpLcTFGhlxs/O+x1GAXrjFs81gDIZmQ0wJGdeenWyhDNGMoXr0
 CY0/QgigYb2ts0MT1Az6SxVbiG/YK70Lk5aRFJQc5qKyyI2nAy8m9k3HImm8wkmO0Ixo3s8PFkW
 f28Au5iE09JTqDPpYWe7+K3Flk+FHtKRXYLZyTWAa71F/xREjdCWXkpUkYT1jWX3y7yQq4BuJzM
 QNf8bfQfGb0Mps2Fqa1Ty9q1nqBaI1z2/wAKdAQJs+p1U7cjN8uyV75vUASBplne7MLaJNOfz8T
 ax/Pw6rQUgD7msW//cv6KZVWxmC9DHW3bxvrwJIjUxiHs2oUCKHgFpAuLbvoZuauN7bVV+JBa3q
 NWBAFDKhFZTGS4y3uDro6f4SaGCyl6RrRZMoKHkxho7VgbC0wXeCoaKVNYlGxokoT79RJmOLiEn
 pGC4yh27ZwrGMulBdKw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-26_04,2026-01-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 phishscore=0 impostorscore=0 suspectscore=0
 spamscore=0 malwarescore=0 bulkscore=0 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601260202
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_NEQ_ENVFROM(0.00)[elson.serrao@oss.qualcomm.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32756-lists,linux-usb=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	RCPT_COUNT_SEVEN(0.00)[11];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: BA4528E47C
X-Rspamd-Action: no action

EUD provides virtual USB attach/detach events to simulate cable
plug/unplug while maintaining the physical debug connection. However,
the current implementation incorrectly sets the USB role to HOST on
virtual detach, which doesn't represent the disconnected state.

Fix the virtual detach handling by setting the USB role to NONE
instead of HOST, correctly representing the disconnected state.

Signed-off-by: Elson Serrao <elson.serrao@oss.qualcomm.com>
---
 drivers/usb/misc/qcom_eud.c | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/misc/qcom_eud.c b/drivers/usb/misc/qcom_eud.c
index 3f1cc7ea2a6a..60f566427abe 100644
--- a/drivers/usb/misc/qcom_eud.c
+++ b/drivers/usb/misc/qcom_eud.c
@@ -343,10 +343,26 @@ static irqreturn_t handle_eud_irq_thread(int irq, void *data)
 	if (!path || !path->controller_sw)
 		goto clear_irq;
 
+	/*
+	 * EUD virtual attach/detach event handling for low power debugging:
+	 *
+	 * When EUD is enabled in debug mode, the device remains physically
+	 * connected to the PC throughout the debug session, keeping the USB
+	 * controller active. This prevents testing of low power scenarios that
+	 * require USB disconnection.
+	 *
+	 * EUD solves this by providing virtual USB attach/detach events while
+	 * maintaining the physical connection. These events are triggered from
+	 * the Host PC via the enumerated EUD control interface and delivered
+	 * to the EUD driver as interrupts.
+	 *
+	 * These notifications are forwarded to the USB controller through role
+	 * switch framework.
+	 */
 	if (chip->usb_attached)
 		ret = usb_role_switch_set_role(path->controller_sw, USB_ROLE_DEVICE);
 	else
-		ret = usb_role_switch_set_role(path->controller_sw, USB_ROLE_HOST);
+		ret = usb_role_switch_set_role(path->controller_sw, USB_ROLE_NONE);
 	if (ret)
 		dev_err(chip->dev, "failed to set role switch\n");
 
-- 
2.34.1


