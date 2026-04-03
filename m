Return-Path: <linux-usb+bounces-35938-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aF7cIGyRz2lqxQYAu9opvQ
	(envelope-from <linux-usb+bounces-35938-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Fri, 03 Apr 2026 12:07:40 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id ED346393279
	for <lists+linux-usb@lfdr.de>; Fri, 03 Apr 2026 12:07:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 21863309181E
	for <lists+linux-usb@lfdr.de>; Fri,  3 Apr 2026 10:06:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 894FA382365;
	Fri,  3 Apr 2026 10:05:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GyLynvEG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Df3mevHz"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68DD83822AD
	for <linux-usb@vger.kernel.org>; Fri,  3 Apr 2026 10:05:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775210710; cv=none; b=fo2pZV5CWVjcsfSQtIdO/rDnoXOCFCFn9PdqnsQ1hYOKXbqZknHvzFT/Ltw3h/3tWbNjp16zg3y/RZcDYwpfDo035js7Wyhvlx4lKLGuln3QwN8UIQ0ddvB+oSI16BOHgAgvt4S7TDas7DCsmEZ63V2J1WDiCJQgGPwS4KkMI0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775210710; c=relaxed/simple;
	bh=VypqrigY/IvoRkUzjoWyWyWrNK+puRHMIlpuyfFo7Fs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Rw1Mx1QKkHFXsWiYlYj6bPPhKRTQ5oYKoaSJnKBX1luUqAZ0WrnIw40mxgEAJohmNjOV5U0/ElzilCQNa+c4yFxZ3q9MxnrswmBBEcmFWfKwX0yeytkfJtygJJC/xyfekgzFBUOmOV7fWbgVQjf9Hh5wZi+9TnIoWBnW4mqJPBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GyLynvEG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Df3mevHz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63342YQo3780374
	for <linux-usb@vger.kernel.org>; Fri, 3 Apr 2026 10:05:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=XtsyijHJK5i
	Pr+Zr0qa1HiLkSDPYDHag4nII/9rEeGE=; b=GyLynvEGNLqKXw5rFRqEvSjNo1C
	hAPVlkVAH9+mZ7uMcB3j5OjfNP4CVkaUtD8OCvKL+WtXxcOVAT+PVKz2ZfKeHcbd
	P8v+Om5fizDb41XJQIGCYG7ymgoDv/WG4k4pQxqMzo+jcg9nY/lO9f4FVB07ZBMh
	4dpLwukzKffSODoItp6iaDp2uuEgbHEiw08himusHZzisDOJwgYnjTWEoa/77cK0
	1Wch4Eea9yqgz4PyfIrYJiqC813o/mi4B00kt2pYDEwuRz29xC13jRSsOU340EbB
	ql5lrtTMEKpXuJNVSdvABLcmPgp6XeOK/pTtIjbybKF1YOeq0YxF447X0Vw==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4da663h1tn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Fri, 03 Apr 2026 10:05:02 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-82cec239147so1167461b3a.1
        for <linux-usb@vger.kernel.org>; Fri, 03 Apr 2026 03:05:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775210702; x=1775815502; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XtsyijHJK5iPr+Zr0qa1HiLkSDPYDHag4nII/9rEeGE=;
        b=Df3mevHzTMWJdLXAekR0xRnKi0PQuEULT/d/m6z+O0+H5aUpO7mDnlTXIJ9QVHoWLF
         6b1f5RmGZRQPOLsM3GyckC0Q303/edd2TBGVjmSAhuUehGbuuMoJ6Y2RQPRJXpwPq1z7
         2C7ZuYPcBQvgNGEwZSOXqUp4y8Ju+YiXuQ7WiX+4RFJgTM3Wr3YBy883407Y0jVCmTMU
         A1GU2Sbk5INO7RZOS2okPi/heYTWCg6Zv6ewA6tBk+4u92rl/vaR4cruEP4dfr0OZZym
         eLEzMpByu5PxPOi55YLF9gE48jS5+7nmTiFyw/T4+cyoWjbk+l/kxGD58Hjf8RQfsXGm
         j8UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775210702; x=1775815502;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=XtsyijHJK5iPr+Zr0qa1HiLkSDPYDHag4nII/9rEeGE=;
        b=AuZhEcuRAu37d+7Cn1lOH8JoK5/Z1T5eR+mKnIj/eM+JYkMRRVxNcc98ePJCxOwDUw
         5X0ZQ40CHmkRDD1jle8aS9rUoWx5T1xSdV61XezxXSBvXfpQAPgqJ/+/0nSCuGz8zrTx
         zYqF7lbSQ/mLneFvsgFDeYPZNQ8/L+WMkYvr1XA6QoLOCSAv3OKFAnz1Y0XezZv86Gmm
         40Atm8hkQhocah6oQLW+PS+h5Izmj2tON7NGsrbbtabJH3h8Sy3i2I45eak2/sXmUOHl
         ZicR49OvzImBsGRvPDjijz9L8egef06JUXcnZPfiSepFqo+X3SRt9NkkISuWG+5eYYvD
         zCuw==
X-Gm-Message-State: AOJu0YzQQ/vep92tcY107t3kfKYK+AE9Z+tFaltcCdz44rDcypFBGzgI
	+Bcr7epbhJhc+/AaDS+jytqTf610X9UCJRGvO8nPmpbeEu19FSntQEgT8lrUCyIUcM7c2mAiIxC
	C3krvD3FgNB5ptB/vx0OMnOnoWgrPYgz5QgH/29mM+P4DFwEOnhBKb1FACa2Jy8c=
X-Gm-Gg: AeBDievyb9qJ3ueJ/CeEaKQsinchmUTa0zU24XK7pVznpgQvN9Kfp/ZXxgG2GHGi3ju
	U2Gt56SxtFLSZXBIAOJudUfV1BQCluUg/r3ElX8ZvI4WEUw/qR3VuGyK7IhQ8T9xGytoasSGKWL
	fRuObvSvAjwxcpn0xuERekNzAqguEC8tQ3IHUwFa/48a+J513BFNDzQ/bZHve0mxxoNc0UYqvBC
	zoaiw2fUOvePXzmW2p6vxjWzHE5YDRDlwRvDtv2c3boIednQ+p0DH89YcmkBwAcf9Ie04XHL6XX
	VAEl7kFx8SOxwiAQH1HDYa3ehm14rANWDSUZObxOAuHC9b3PtXc9sMwH3Gi6PJJ23an/HrFnfJU
	57uHUisGNuoTFOpZ5TxgCLBmbe3yXb2Il7tB4Irmz42wXvAskVnwatPs=
X-Received: by 2002:a05:6a00:278b:b0:829:7a62:6a with SMTP id d2e1a72fcca58-82d0dd03d1emr2090064b3a.22.1775210701821;
        Fri, 03 Apr 2026 03:05:01 -0700 (PDT)
X-Received: by 2002:a05:6a00:278b:b0:829:7a62:6a with SMTP id d2e1a72fcca58-82d0dd03d1emr2090031b3a.22.1775210701278;
        Fri, 03 Apr 2026 03:05:01 -0700 (PDT)
Received: from hu-swatagar-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82cf9b6113dsm5012644b3a.23.2026.04.03.03.04.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 03:05:00 -0700 (PDT)
From: Swati Agarwal <swati.agarwal@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Icenowy Zheng <uwu@icenowy.me>,
        Matthias Kaehlcke <mka@chromium.org>,
        Alexey Charkov <alchark@flipper.net>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mike Looijmans <mike.looijmans@topic.nl>,
        Pin-yen Lin <treapking@chromium.org>,
        =?UTF-8?q?J=20=2E=20Neusch=C3=A4fer?= <j.ne@posteo.net>,
        Chaoyi Chen <chaoyi.chen@rock-chips.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Swati Agarwal <swati.agarwal@oss.qualcomm.com>
Subject: [PATCH v7 2/2] usb: misc: onboard_usb_hub: Add Genesys Logic GL3590 hub support
Date: Fri,  3 Apr 2026 15:34:35 +0530
Message-Id: <20260403100435.3477729-3-swati.agarwal@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260403100435.3477729-1-swati.agarwal@oss.qualcomm.com>
References: <20260403100435.3477729-1-swati.agarwal@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAzMDA4OCBTYWx0ZWRfXyr3AZuiQVFM9
 cByEF202h2Yq35flbaVjFaBoOjUMO4NrC7I4Cl/T9bnRkfTaJQ07CD9JECUwRr72ZPFfus0/D0L
 euFe24nNPapzEn7ak3Dbv7vdhrROuKk5WIIWziUa5EpWwcs6sNziPafhGKAauSFHV/Bsr2H437D
 GAx7ptWEm6+yQXllmodCrUVpq7MSd6aK+ZoUZY8CDwwYOvpnqYIrhxXZVvXhl8q7vcWX3jg6S3Z
 kVAduhHou0t9KaQttj/dUSiZ+vMW9X2a3cQTckmljlzDheFm5asiAkDUZj0RyWc4v9NoJquxK5t
 GCXzSCDKXvutWp6Q0dVLU0vD7JkDaKFHopoUQsrWVo134QU+HSIA7FKYy3rx94QvhO/978qqPiQ
 xjYs/35zipTlsWcpjcyWZ/ol/8NrF4Pv0Kdk+g5biWbfRiobNLdKNNF0NrZhfKhpBvKh+0iT4Tx
 rUxqVqxROLUooZ01ohA==
X-Proofpoint-GUID: pBxQAkof-WPhHEhRt9VMxsLQnROT8cRE
X-Proofpoint-ORIG-GUID: pBxQAkof-WPhHEhRt9VMxsLQnROT8cRE
X-Authority-Analysis: v=2.4 cv=Acu83nXG c=1 sm=1 tr=0 ts=69cf90ce cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=k-QuRK_TgsIVSdvBErMA:9 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-03_03,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 adultscore=0 clxscore=1015 priorityscore=1501
 phishscore=0 impostorscore=0 bulkscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604030088
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35938-lists,linux-usb=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[swati.agarwal@oss.qualcomm.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: ED346393279
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add support for the GL3590 4 ports USB3.2 hub.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Swati Agarwal <swati.agarwal@oss.qualcomm.com>
---
 drivers/usb/misc/onboard_usb_dev.c | 1 +
 drivers/usb/misc/onboard_usb_dev.h | 8 ++++++++
 2 files changed, 9 insertions(+)

diff --git a/drivers/usb/misc/onboard_usb_dev.c b/drivers/usb/misc/onboard_usb_dev.c
index 7cdbdfe07a76..11508ed4df25 100644
--- a/drivers/usb/misc/onboard_usb_dev.c
+++ b/drivers/usb/misc/onboard_usb_dev.c
@@ -665,6 +665,7 @@ static const struct usb_device_id onboard_dev_id_table[] = {
 	{ USB_DEVICE(VENDOR_ID_GENESYS, 0x0608) }, /* Genesys Logic GL850G USB 2.0 HUB */
 	{ USB_DEVICE(VENDOR_ID_GENESYS, 0x0610) }, /* Genesys Logic GL852G USB 2.0 HUB */
 	{ USB_DEVICE(VENDOR_ID_GENESYS, 0x0620) }, /* Genesys Logic GL3523 USB 3.1 HUB */
+	{ USB_DEVICE(VENDOR_ID_GENESYS, 0x0625) }, /* Genesys Logic GL3590 USB 3.2 HUB */
 	{ USB_DEVICE(VENDOR_ID_MICROCHIP, 0x2412) }, /* USB2412 USB 2.0 HUB */
 	{ USB_DEVICE(VENDOR_ID_MICROCHIP, 0x2514) }, /* USB2514B USB 2.0 HUB */
 	{ USB_DEVICE(VENDOR_ID_MICROCHIP, 0x2517) }, /* USB2517 USB 2.0 HUB */
diff --git a/drivers/usb/misc/onboard_usb_dev.h b/drivers/usb/misc/onboard_usb_dev.h
index ac1aa3e122ad..3523f8f8a149 100644
--- a/drivers/usb/misc/onboard_usb_dev.h
+++ b/drivers/usb/misc/onboard_usb_dev.h
@@ -101,6 +101,13 @@ static const struct onboard_dev_pdata genesys_gl852g_data = {
 	.is_hub = true,
 };
 
+static const struct onboard_dev_pdata genesys_gl3590_data = {
+	.reset_us = 50,
+	.num_supplies = 2,
+	.supply_names = { "vdd", "vdd12" },
+	.is_hub = true,
+};
+
 static const struct onboard_dev_pdata usb_a_conn_data = {
 	.num_supplies = 1,
 	.supply_names = { "vbus" },
@@ -146,6 +153,7 @@ static const struct of_device_id onboard_dev_match[] = {
 	{ .compatible = "usb5e3,608", .data = &genesys_gl850g_data, },
 	{ .compatible = "usb5e3,610", .data = &genesys_gl852g_data, },
 	{ .compatible = "usb5e3,620", .data = &genesys_gl852g_data, },
+	{ .compatible = "usb5e3,625", .data = &genesys_gl3590_data, },
 	{ .compatible = "usb5e3,626", .data = &genesys_gl852g_data, },
 	{ .compatible = "usbbda,179", .data = &realtek_rtl8188etv_data, },
 	{ .compatible = "usbbda,411", .data = &realtek_rts5411_data, },
-- 
2.34.1


