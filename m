Return-Path: <linux-usb+bounces-34670-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QFGcMU6SsmnJNgAAu9opvQ
	(envelope-from <linux-usb+bounces-34670-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 12 Mar 2026 11:15:42 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 43E512703B1
	for <lists+linux-usb@lfdr.de>; Thu, 12 Mar 2026 11:15:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 81DCD30517DC
	for <lists+linux-usb@lfdr.de>; Thu, 12 Mar 2026 10:14:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C80DA3BE637;
	Thu, 12 Mar 2026 10:14:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pi7ewZ9L";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gjH7Kvck"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E40B43B3C1A
	for <linux-usb@vger.kernel.org>; Thu, 12 Mar 2026 10:14:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773310487; cv=none; b=AkFnfmd97xaFnP8Du/RtBI3EHR3rOyuqQxGwf8meInwAZ1FPCaY9fWJ770LfbiIAKfVN1rD+3KJtBgcuoUteoIvGf/IiHu6GVzMJ9oJvzDwHrx0Rb68UO/TtvX1psq6trpdi8hsZy8QUZ2FtY1NDTWqkFl2PDfs51DAJu5qdWXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773310487; c=relaxed/simple;
	bh=7hz56gYkfLsR7fwZZXQDBS2sB+2fzXdO0TOSAxu3FKU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=WdBDTUf8OokJAl0LRTH72kwTOp6MdiSe5eQd1hjlFA8Qmkr6ZJm5uA/HQ5GBBrNKMYBh1QnHgjbgdb8YI/n42dMLi7ed7EvoagKjmS862RSsceTfnnNohJ6hgdt8BI9brB0u+8XZunOb56a91C5rWq3Gy98a/aNSSUugfD5NrJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pi7ewZ9L; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gjH7Kvck; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62CA9v5e263534
	for <linux-usb@vger.kernel.org>; Thu, 12 Mar 2026 10:14:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=1X7gcYQZXXBsIl3nZSh38k3FlvQMwhCo8hQ
	ompIzliE=; b=pi7ewZ9LYSmbVYTEJP/TUcZqA6vsodIqkAj9kRPu/Ez+vn/QgC0
	yIVmq6qo/HSIYLFGIBhtC6UKsqegRT7lYAFBxc1UZtORMkbrgvagpDrbqhRk2x5+
	jXo4r3vWWsi9cXGIxXD2HnpexKSaDzfaldtadVfMr2yqV2V3RRFxsySllce1veP/
	vthy2OjmnVQ5l7yv5AkcXB73+Tj0iXWNJ2G4TZg4F0DhNGvraRywHRWo3q3fU7z5
	KDgTOf7E07ntRq1M69rcoWsb7pOkxqcI0s7Osd3zstvfHkXembfogVhAe42a9uSV
	/8ZUW8Kvrw5jLeH94szPbiSHnNMKr8hJJ/Q==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cuh4yhq04-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Thu, 12 Mar 2026 10:14:42 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-354c0234c1fso1097790a91.2
        for <linux-usb@vger.kernel.org>; Thu, 12 Mar 2026 03:14:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773310481; x=1773915281; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1X7gcYQZXXBsIl3nZSh38k3FlvQMwhCo8hQompIzliE=;
        b=gjH7KvckhY7kkc2mqgUWrt4VONqZgNLmhlavZoKNwfPJ9nyrs+YEXhOOfEoGDi2pWx
         XEyLSdgoeLZof8vUhVjWmwQHBPJxFnUE6aDSpvcQCWcEYnJ5zeAhoD8A1mfar8iwDfx5
         i+43a3WKTDMedkf4PmFPQDsMIDeIEimj802iwQGLR/LeXsLFs8qd3myU1BDxx8qTdLdK
         PxcIPO3ns2GaJr25AkSPyeVa36tk9HlrXGwwu1pL/uQkX7JNLtkjfN1aJt5Akk5q/qnZ
         Mx7SEUCuvbFxLLF47SRPrSNGPq9gHqX214OYiubZfVsz0u8Kvp0WXkSLiVzPhO/2Et9y
         kCSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773310481; x=1773915281;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1X7gcYQZXXBsIl3nZSh38k3FlvQMwhCo8hQompIzliE=;
        b=bnR+vqu2F8aOj57wGiXvT3d5FSk5vRKttbJm7Yf4Bp/UWiY6pwj8rxeP/SkeNPtt+7
         tnVdNulfmNdycfsumboXyh0tb5c+3VNqpd3ojwLTAhixsOjkiOC69cT++EPpsUd+GxzM
         BDKlNLmt4vYJXlh7g0RU0PwipEvikvObaTTRiXgbxh6IPfL7kjIc0+QEf5W3e8p7WfJD
         c9/Joomx322LsqowF6joiemgEaULgLqqXQATr+KV320sLaDly5a769SUjyFNHhBOfcv/
         DVBNie3wMX4BPP3w0VaMsrfGAyctIgNMFMZKcs73Y1WyZr2EXin8Kpp3491ajHOsZByo
         ZJSQ==
X-Gm-Message-State: AOJu0Yweke1ON0mBdFsDeLcTX50WS9jOtJFh2lGFgCtifCff5cStaa5y
	fdU2KEE+gAURtVJg87U0v15PI7s6z2hkP1t8tBWGH38AGupFQwnnD+ZajoBBinVEW+iKkAjoJ4K
	jJlizY6s/ctuezirMGdFRIWB7b7K6v90xNtHGTeLd+YSsP3hBaIPY8CFV5B6D8FA=
X-Gm-Gg: ATEYQzxCDbAa3oiAlK6Ag+BczKBffiM8nyS3zqP/YA4F1xl6V0loG4BjVdVFy4+YQ2O
	STvD6kqYoFeK9NfwgjjesJwZfPogcmzgVUEYXlhCRax94dWJhnWKe9kNpgJc89T0oWh7L60wdJP
	zKgjBitPn4/Es/zcoQ4vYVHkcwPn4vkQulXTzFaiJbDy7sodrD6a2M/9p9zBbCWcG3HzfWA+gen
	FBnOFmAmFVXhGySy02HEXzNANllFX2KFjMPShF75BGRAvqSj0gbvH/9Pc9kdWTrznJruN2cG3yu
	E3A9/MSas3quYyljTR9X9666gFeCJCCExOYS6Fv/DnULfro/ozrPFGdFowmvYfFxDqYqKjXXJd6
	imFOuyTfEAhOnqUk7oEEonYjtofguH20OT9Jem8lcTI1/94PzqyJp5KekJCw=
X-Received: by 2002:a17:90b:5607:b0:354:bfb7:db1a with SMTP id 98e67ed59e1d1-35a0199ca2amr5104413a91.31.1773310481411;
        Thu, 12 Mar 2026 03:14:41 -0700 (PDT)
X-Received: by 2002:a17:90b:5607:b0:354:bfb7:db1a with SMTP id 98e67ed59e1d1-35a0199ca2amr5104382a91.31.1773310480826;
        Thu, 12 Mar 2026 03:14:40 -0700 (PDT)
Received: from hu-kriskura-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c73cdf248dasm4729109a12.9.2026.03.12.03.14.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2026 03:14:40 -0700 (PDT)
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andrei Kuchynski <akuchynski@chromium.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Pooja Katiyar <pooja.katiyar@intel.com>,
        Johan Hovold <johan@kernel.org>,
        Venkat Jayaraman <venkat.jayaraman@intel.com>,
        Jameson Thies <jthies@google.com>,
        Hsin-Te Yuan <yuanhsinte@chromium.org>,
        Benson Leung <bleung@chromium.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Subject: [PATCH] usb: typec: ucsi: Add UCSI_USB4_IMPLIES_USB quirk for X1E80100
Date: Thu, 12 Mar 2026 15:44:31 +0530
Message-Id: <20260312101431.2375709-1-krishna.kurapati@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEyMDA4MCBTYWx0ZWRfXx04wO5Rdb6Zu
 gslhIQQv3aDZhHo4mI9wl0PjdvoGBVyuH4P0iHksmvW4f+sd7VQtJJSR6oVFCaxXPUSYhh56kAE
 3VC3wP//4WvYgt0Uplerv2mewvDre8LRrDchyBtdcSZ5upqJ0AmgLvbRyW0ezU2zFJCkSrTKxCd
 isGNjl6G11Q9CZjWPMLrr17nk7nrnQm6PXHxFwTza2uPepIAyFBMEuDP9R0Rq3h1k9m0vr8OWen
 lNPGA4EPLtZQJHybeZq8oajoEUoIu5rSkzRj5/ycPz4+1b5zrb2vtOGOdvJA54ZEnyilwR4PLSP
 3+dIa1vSLd3XGImLg9cgyAB1E/8hzfvyrGyNZp9SrjO/qbOaiU1Ghud/qxsB8elM0u/dKZOmlI/
 EOChm3I6dMwtvMrOvNZHhRTHugejQeVuv9OGaxup3lszBBdpDwBKwmHeBYBCusgWIyCjouVs01m
 jBFrvkFfbdVkfXoTfHA==
X-Proofpoint-ORIG-GUID: QriLBqzJKIPpubf3lMynhirSljy9mZjH
X-Authority-Analysis: v=2.4 cv=C+7kCAP+ c=1 sm=1 tr=0 ts=69b29212 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=B76G-Ux6xhFiTzXwFL4A:9 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: QriLBqzJKIPpubf3lMynhirSljy9mZjH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-11_02,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 phishscore=0 adultscore=0 suspectscore=0
 bulkscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603120080
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34670-lists,linux-usb=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	FROM_NEQ_ENVFROM(0.00)[krishna.kurapati@oss.qualcomm.com,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 43E512703B1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On X1E80100, when we connect a USB4 capable dock, the PARTNER_FLAGS
indicate USB4_GEN3 being set whilst keeping the PARTNER_FLAGS_USB
cleared. Due to this, during ucsi_partner_change call, the usb role
is marked as ROLE_NONE and passed to DWC3 controller the same way.

Fix this by adding UCSI_USB4_IMPLIES_USB quirk and check for it to
decide and pass on proper ROLE information to DWC3 layer.

Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
---
 drivers/usb/typec/ucsi/ucsi.c       | 6 ++++--
 drivers/usb/typec/ucsi/ucsi.h       | 3 +++
 drivers/usb/typec/ucsi/ucsi_glink.c | 2 ++
 3 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
index f38a4d7ebc42..e042499613c9 100644
--- a/drivers/usb/typec/ucsi/ucsi.c
+++ b/drivers/usb/typec/ucsi/ucsi.c
@@ -1182,8 +1182,10 @@ static void ucsi_partner_change(struct ucsi_connector *con)
 		}
 	}
 
-	/* Only notify USB controller if partner supports USB data */
-	if (!(UCSI_CONSTAT(con, PARTNER_FLAG_USB)))
+	if ((!UCSI_CONSTAT(con, PARTNER_FLAG_USB)) &&
+	    ((con->ucsi->quirks & UCSI_USB4_IMPLIES_USB) &&
+	     (!(UCSI_CONSTAT(con, PARTNER_FLAG_USB4_GEN3) ||
+		UCSI_CONSTAT(con, PARTNER_FLAG_USB4_GEN4)))))
 		u_role = USB_ROLE_NONE;
 
 	ret = usb_role_switch_set_role(con->usb_role_sw, u_role);
diff --git a/drivers/usb/typec/ucsi/ucsi.h b/drivers/usb/typec/ucsi/ucsi.h
index 43a0d01ade8f..cff9ddc2ae21 100644
--- a/drivers/usb/typec/ucsi/ucsi.h
+++ b/drivers/usb/typec/ucsi/ucsi.h
@@ -497,6 +497,9 @@ struct ucsi {
 	unsigned long quirks;
 #define UCSI_NO_PARTNER_PDOS	BIT(0)	/* Don't read partner's PDOs */
 #define UCSI_DELAY_DEVICE_PDOS	BIT(1)	/* Reading PDOs fails until the parter is in PD mode */
+
+/* USB4 connection can imply that USB communcation is supported */
+#define UCSI_USB4_IMPLIES_USB	BIT(2)
 };
 
 #define UCSI_MAX_DATA_LENGTH(u) (((u)->version < UCSI_VERSION_2_0) ? 0x10 : 0xff)
diff --git a/drivers/usb/typec/ucsi/ucsi_glink.c b/drivers/usb/typec/ucsi/ucsi_glink.c
index 11b3e24e34e2..1cb519cc0532 100644
--- a/drivers/usb/typec/ucsi/ucsi_glink.c
+++ b/drivers/usb/typec/ucsi/ucsi_glink.c
@@ -371,6 +371,7 @@ static void pmic_glink_ucsi_destroy(void *data)
 static unsigned long quirk_sc8180x = UCSI_NO_PARTNER_PDOS;
 static unsigned long quirk_sc8280xp = UCSI_NO_PARTNER_PDOS | UCSI_DELAY_DEVICE_PDOS;
 static unsigned long quirk_sm8450 = UCSI_DELAY_DEVICE_PDOS;
+static unsigned long quirk_x1e80100 = UCSI_DELAY_DEVICE_PDOS | UCSI_USB4_IMPLIES_USB;
 
 static const struct of_device_id pmic_glink_ucsi_of_quirks[] = {
 	{ .compatible = "qcom,qcm6490-pmic-glink", .data = &quirk_sc8280xp, },
@@ -379,6 +380,7 @@ static const struct of_device_id pmic_glink_ucsi_of_quirks[] = {
 	{ .compatible = "qcom,sm8350-pmic-glink", .data = &quirk_sc8180x, },
 	{ .compatible = "qcom,sm8450-pmic-glink", .data = &quirk_sm8450, },
 	{ .compatible = "qcom,sm8550-pmic-glink", .data = &quirk_sm8450, },
+	{ .compatible = "qcom,x1e80100-pmic-glink", .data = &quirk_x1e80100, },
 	{}
 };
 
-- 
2.34.1


