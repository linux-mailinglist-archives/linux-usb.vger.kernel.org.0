Return-Path: <linux-usb+bounces-36828-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mOKWDE/e9Gn8FQIAu9opvQ
	(envelope-from <linux-usb+bounces-36828-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Fri, 01 May 2026 19:09:35 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ED094AE5BC
	for <lists+linux-usb@lfdr.de>; Fri, 01 May 2026 19:09:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 81B46301F40A
	for <lists+linux-usb@lfdr.de>; Fri,  1 May 2026 17:07:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 459AA426D1F;
	Fri,  1 May 2026 17:06:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="loU/v0O0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Gx+9th4F"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94E23423A64
	for <linux-usb@vger.kernel.org>; Fri,  1 May 2026 17:06:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777655208; cv=none; b=OTEc+laC12VPSlOz6ZedWevS1O8ttNBMhMwHjkBGNUqSrLPjgj2jKfpWzifj8FxqeI/rq/dZ739k63KnM0lLbuiq2NzeDaH55xEJjC6qq0l+uEU/Y8fi/QjwJcUBQQLxu9PxYwReK536mPS9SMaee29nzzY8qmFBFB+vKIAoW1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777655208; c=relaxed/simple;
	bh=qsMJyaTk8HgUMp6PIBAKLauYZ+N5Wx0Hlr64l+0gPH0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=LvV0eJ/P67dmVuOJVXka6HzkhqEJ4ernqq/gFG9jCiFubyIgKCl0aQWSeHRZ6O5sGyg5IBKlKEUFAnrCmI0eCT71PxaiS7tSS/WSY9/fDCWhUlUMZ/4/qp5AY0l63d6BFjw2C1AFCyP1VeSKE3DwEOMYytr+cluNJykZPoj5QBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=loU/v0O0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Gx+9th4F; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 641GLgmG625475
	for <linux-usb@vger.kernel.org>; Fri, 1 May 2026 17:06:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=WE94TFXH4kX
	yNBV49l2OPveZ6QXNRWCGY2DVlIlO5xg=; b=loU/v0O02Jz2CQtsLmIvsqPRIAm
	T08qeNlO2HCXUW3iTN+T/lmvauIKyhxerZV0GM3rjRSURMsE298VzLMW1ZBi/Wmg
	6aJM4KwT598cyaHKgE9K+kUvbrDz4lDRiZzSxoSpXVLYHjnwxqjcHDcKwf9DK5vJ
	WFUUgqLkGzWL7BsZ/yFWnbz2Vs9DUR2BTHC2gE6HczSzd3z4EWQebZqdnMcm0GcB
	hd2o6eDnipsywQ1pDXUCqbNhD+dBj6z0sLVFHQLihZpyVIGSZ5qdryznD7ksSoda
	j5l+h2GGw6dwMRDOqxt9RqgJbquQmZSwGt/QqZaiP8ThJmB1dEcMZAgbp2g==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dvc45beyk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Fri, 01 May 2026 17:06:45 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-2bdf75bc88fso3665879eec.0
        for <linux-usb@vger.kernel.org>; Fri, 01 May 2026 10:06:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777655205; x=1778260005; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WE94TFXH4kXyNBV49l2OPveZ6QXNRWCGY2DVlIlO5xg=;
        b=Gx+9th4FvmitBs5ZY9GPD1/dtp5XFUsZJxkwqu5A8esKYfVl5L++CDLhwfrTZQ79gd
         j5yr/wk4yotk7Z6csvsNa6VEI9aWbZY8ANsFvTy8GrEGKzc3xd9MIkWXLhv9t+O3EYHo
         OBXZ0Xrs3LD/EIWg4/GEJBxBwxPbz3GwOj8jWF75l5tuAs5zhqjRmhJjyN2O4V53SFb1
         cphAE2B+nYPLXZ24JkHTsB+NPuJVdTLtJERyYhSRSHPqnA/fyvIk0GSIlff0ZbVzk3x3
         z0hqoQywNesCwA/OWo+WW/boCpapP4PEj7OhaisLMXgoWxfhVs5cTAoQVeswXYMFYCCJ
         gDvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777655205; x=1778260005;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WE94TFXH4kXyNBV49l2OPveZ6QXNRWCGY2DVlIlO5xg=;
        b=ZOyTe1L1yrY5lnQArsR0raU8YjXU4HRQQV1BCucxAexpOCVpeWCG/huXRciIfj4Wfh
         KeiR7OxuDFiXWI5w1ZN5QlSvACXJ0ucpP71gYciM05niFfQTAM5vtgmvLqBEkVHhw7ga
         gMBbCqXNQT+kQo4hsZU7YoVtKfysmYWQBgn3123wLx3WB+b1cJOvLT9MTWGrupN8v1tX
         vGrh086e87we0gkUK/5tccNZdZdGo6BAogKztERXzYXiCQTbj4AnsFuzT6SG1A9Xrejo
         Jup9Wpb9ybxruPaAYazVUqkx/O13WGvTOc9Qz3aulqDDgXd9vdIm9c6HuLXSXRluGPCT
         Jx9A==
X-Forwarded-Encrypted: i=1; AFNElJ8LlduYfGg5gi4IBU15BP7/7gmXbg2PE3DwIyh+LgEl5kQwDAc79Q4esg8r6NzGyf/zqDSskmARCu4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzKhWx6aCbY/jbQxqMN+LrZ+AxAFU5i54Bg0sNYNaTNHX5TS0zw
	RjyoYzshiHnOPmN2/ZUQzzXTf6rjxo3Wd3MKY2Ob8FuYgTpJLKqXA1mAdwXnBIDbkPi+Wq0RDJw
	Yv6z+/4Iyr3Hm5QQmd/M341djJ7Zz//2awt0iJa6HoKdQMIoKOHiYtwyOOdcqWI8=
X-Gm-Gg: AeBDieuStiS4oC0gyH0uF6L2ZUa2UFoQmhu37zOaIs439/AwP+ofdO8FJ9pJO10xQa5
	jYq5A7EFIhyOzaOktSyg0sLiqjdCo5e3GGQcMJWzKgUUoj6i6bo8nnJd5Viyv6Nj7pqBmHyn12w
	uN8na3QFIeliTIEgcKv32usoy20/mr4ed8jsrTf9ljlONV632Cr4SXVKF8pmbGSlieUJTPhrk7C
	7qMwJHSfntZ4xp4CJh0upjKJDpj73EyqnsADkpkmVuwg9321g06G0nE3ozg4rHhNNhqwyxvbSlw
	t65vOf47G2h5lIjPYcHPcRM95i55F2YFIJNLe8blVQf1IinHjjgIepGPlCNwWIhm+tLtLhIDchB
	9dnLN0i0WLU3RfeKn8AFvX14PgrUUEuEm6XcXmog4HvR3yH61ZnwqoYJ153Jzy7VwI+CEvvTklL
	crAAAJ65YhUw==
X-Received: by 2002:a05:7301:5795:b0:2ea:d965:a4b9 with SMTP id 5a478bee46e88-2efb7cd0f64mr98227eec.7.1777655204360;
        Fri, 01 May 2026 10:06:44 -0700 (PDT)
X-Received: by 2002:a05:7301:5795:b0:2ea:d965:a4b9 with SMTP id 5a478bee46e88-2efb7cd0f64mr98206eec.7.1777655203669;
        Fri, 01 May 2026 10:06:43 -0700 (PDT)
Received: from hu-eserrao-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ee3537d300sm6655978eec.0.2026.05.01.10.06.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 May 2026 10:06:43 -0700 (PDT)
From: Elson Serrao <elson.serrao@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
        Souradeep Chowdhury <quic_schowdhu@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH v4 7/9] usb: misc: qcom_eud: fix virtual attach/detach event handling
Date: Fri,  1 May 2026 10:06:33 -0700
Message-Id: <20260501170635.2641748-8-elson.serrao@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260501170635.2641748-1-elson.serrao@oss.qualcomm.com>
References: <20260501170635.2641748-1-elson.serrao@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTAxMDE2OCBTYWx0ZWRfX4SbG6iPpkaLe
 td0xe1eoQR0OFNSzGICJCrfcxoTKhFm5lCLy1zFEocsx0HdgjDus2AbSFSnh8euNjDFlliRJg7w
 AxDkUpPoHQofQiGP+QnjeCkpFJFxXKmH7ulv9ZZZxtxKhxSNddeDhALKzz0Q/hIch0zwVKZHmf1
 vE7+6TwwKafT+z4GhJvbpSZvqdDIX9RuUKkwABm9dHClGur6aiObwEKuTlkrjFp3zXKPl/xEQJR
 kbJ1XFx3458prrUYVp28gYDvN//5oX/dbxwwDmHCl0HaGDoD54c7Xv5ZZBE4e1HjNnE85Dqmj/p
 geFwpx1Nj1BZKCAWJ31ak7fRT0jlPK1YvMURTC3evrb5cM+XKJA7dkMPQopiSuJejtsM30xX4qc
 KZx5ToDOjuiQGT3IZ+dJg3LgtKdLEhKu9NhTa4ULMigVLRsf+uV9PeU0HxcVyn87D+i2qFP+4C2
 ys1fRklvLoLB03TDqdg==
X-Authority-Analysis: v=2.4 cv=DP+/JSNb c=1 sm=1 tr=0 ts=69f4dda5 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=oDIJ3hVRoRHbvujwG_AA:9 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-ORIG-GUID: KlhyLHPu7EDK6IiY1eYwYqIal6eltppN
X-Proofpoint-GUID: KlhyLHPu7EDK6IiY1eYwYqIal6eltppN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-01_04,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0 impostorscore=0
 adultscore=0 suspectscore=0 priorityscore=1501 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605010168
X-Rspamd-Queue-Id: 1ED094AE5BC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-36828-lists,linux-usb=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[elson.serrao@oss.qualcomm.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	NEURAL_HAM(-0.00)[-0.998];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

EUD provides virtual USB attach/detach events to simulate cable
plug/unplug while maintaining the physical debug connection. However,
the current implementation incorrectly sets the USB role to HOST on
virtual detach, which doesn't represent the disconnected state.

Fix the virtual detach handling by setting the USB role to NONE
instead of HOST, correctly representing the disconnected state.

Signed-off-by: Elson Serrao <elson.serrao@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 drivers/usb/misc/qcom_eud.c | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/misc/qcom_eud.c b/drivers/usb/misc/qcom_eud.c
index 4734b6307a85..187cbffbab13 100644
--- a/drivers/usb/misc/qcom_eud.c
+++ b/drivers/usb/misc/qcom_eud.c
@@ -320,10 +320,26 @@ static irqreturn_t handle_eud_irq_thread(int irq, void *data)
 
 	path = chip->paths[chip->port_idx];
 
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


