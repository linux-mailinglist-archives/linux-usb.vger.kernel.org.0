Return-Path: <linux-usb+bounces-36573-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aDHULYDY72l/GwEAu9opvQ
	(envelope-from <linux-usb+bounces-36573-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 27 Apr 2026 23:43:28 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B6D847ACBC
	for <lists+linux-usb@lfdr.de>; Mon, 27 Apr 2026 23:43:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 3E22F3017515
	for <lists+linux-usb@lfdr.de>; Mon, 27 Apr 2026 21:43:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9CE1D3ACA6F;
	Mon, 27 Apr 2026 21:42:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="b5WrC9JW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bgdBfA8L"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CDF939A07E
	for <linux-usb@vger.kernel.org>; Mon, 27 Apr 2026 21:42:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777326164; cv=none; b=PdnybdGoZqflyXu+coRjiulMkPmvr9CwgPueY6DBNSvGLDgyMNX3CBbQoi7Ld9g/EDkHdXi4SCA4TYrzhDvMPBfyLTpZ5clQ/fHg9q83+xGtD7X0ICH4/zo1AFtASRdT91JUxZc4opeyDciCGDxYxiXSd1nkIUyD2D9RA9K6vJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777326164; c=relaxed/simple;
	bh=r7Z52qBn7Oiq3+44QCWlmOdEnbJHHdtV1GjdHQai3oU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Vk5CU4ewq18n66GlNcKLl+FQF4gpPeHEN21ikyWXPt0O8XuvE+FOIp2DuBGn0xXGriv584GvZVP7uifIJ1f31iRvInIECludd2Qfxu/NbBMX2I9e7BuVlmJULwDxsm+N8nYQuoUZJG/qZUUb9rAwwORm1V+A7rhTrFNt6pLbOm4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=b5WrC9JW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bgdBfA8L; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63RDp3bK2914115
	for <linux-usb@vger.kernel.org>; Mon, 27 Apr 2026 21:42:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=ecNTbhYHuyh
	QbhuoB+7vmARq36r7IGCdT0R1LSWjkRI=; b=b5WrC9JW7JAMcr3KVwh989rq+Tp
	iPJKEqxKBpznej42ftjhEOsGDsjmwmyAvL1mPKfspVYQ04bGpMX9p+Vnd89xO2ht
	LF7aRVelvKON9i4K4J2S6o/M7v13F9i58VGZBPJ1kGHt2Ca4P6ba33HugRoezlbP
	YFfMLycar5ffs7rNdXCbdtSSoiMWtP0+oRup+9VEBTrb0lAevNd2KudfP20GCOnn
	blcbntJvAwr5coh6+x6FJqxwClUKKj8ImpmTt8XTA92sgciHHC5qZiqiuTdAMgEF
	Ie75FJE2d163MEZfRNwQhHGAw6b9jUVSc/qW18dNi3Z25h+GgZg1tuu+0Kg==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dt26xkg5r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Mon, 27 Apr 2026 21:42:41 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-12c726f4019so13985987c88.1
        for <linux-usb@vger.kernel.org>; Mon, 27 Apr 2026 14:42:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777326161; x=1777930961; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ecNTbhYHuyhQbhuoB+7vmARq36r7IGCdT0R1LSWjkRI=;
        b=bgdBfA8L6ZlX/jQpUs5BeS1B9SwkNRMEhQ38RYfEYiPYSifdhG1L+pwNyHE7eokJtp
         vXS5yWEY+0ViHhtr3Gh7zjzsuBADIhee+b/IeydpMCyWk0bUEQVLXn8vyKw6at7eGcZq
         swgZOIEdDss2yM7xtizRnY3dvtER4i1/kpLdgUzLH3cd5xADkubuC04W6WcqESSMrNpz
         dv7oQlEPiymamVH2KLXMBEwuiWa6kmAVHd6PHhIn0SF8b+7weaFvGAM9jUGV3zv+EqF5
         sgXjdUYNxM++H/ENTA5Y+atc0CK8Q3HICzuUWHZW4MCHc3acD4jquc/AetfXw7eLd2Wy
         GIEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777326161; x=1777930961;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ecNTbhYHuyhQbhuoB+7vmARq36r7IGCdT0R1LSWjkRI=;
        b=juWv8mkkMYXqM0kzwD4+Vp8LpBi1M1Vfy8N//mPagRy7+UoYyFGAkF1KqUEtJFMJDE
         2YqHAtN7wfV3YYFnUQUR+esk9p4Rj3tg+j4BncjPPyKYCj335NnnCn+8MDK5T3o4IiI+
         RiPDVlL/weazqIr8RHiZoo4Va+HiVCPeYueH77P7Fv3wTCG6Tw4ioS73B7XAAGKjYzQH
         45cnlSrU9ZI4VgTcl9Vkf+ZzLCMMOsgneGxgoBx0BrammBn+chmz0JTPy4O2tRwS8fje
         Bqrt7rY2Rg+0NNnnVQD+Gbeabl8R+5UWw/FpWWGkCTS0Jm7yjR6EAthlqIQjB3QNEt2C
         4nfQ==
X-Forwarded-Encrypted: i=1; AFNElJ+IV9vjyVhUxGVb90Ni2Qv6i9dkSYVCjnGfUF6GvoFkdC3hxQihVwOFmJxXILIn2B4BHtWE5EegAkM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/Amg80QCXS8ugHZRS/Z4sUlvd/Vaf7Op0PaFJS1/G3Itxupj3
	m5qMC6dlsLn2yNzmWQih4UHKTk4pdY73SGW2AJiGbMHAGCLJtWje5d16wAEFerlKJEZNFKs1wjy
	uH4G26g9ebYBc5xokCYRotSrtAxvWCj5BLAZSsyvlN+SlLuKDeow8bkkhkw/1o8A=
X-Gm-Gg: AeBDietA/T3yeHLbAaQB+dOqy0tYFN2iYOBkCDhlwRTWCqnoBQ7ANkflrapMHzAFN16
	QYVsjUGtP/awgwQDEb0m5DHDP0zKN9KnGGQwQz2I4vYqMZJF1aVOgdv3z8ZtVH/NJtLeNGsgfu0
	arXCvJg0OHeMtPOsXNRPAFdOkXfmSrE4+89GBgRlWwHwUexQMEUZGAfh8rHwrcfIhR+hb3diA2N
	0xhWI6olJymB7SjDSdbc019i/4JqcT6dFvxIY3AW9wJ8IV02Fwjin3XpJQKWPwCSmR38wvoZPqZ
	iMoLKt0S02w0ijX+ZeiLGUDTiWPTMm7SKMTradZpMwccEfs3Y9Bt+ouUgyZtdBKdMdoq2J7TAXl
	MIiy4EvU0NfIo49557iIG+Ynxd2ZHxqf3uzEG61X3EY4SuuOjVIWY8J9pEOT9zZbusPJMCv/z8H
	zDEX7Evx5Fvg==
X-Received: by 2002:a05:7022:1b0d:b0:12d:b8e5:5d6 with SMTP id a92af1059eb24-12ddd995d76mr319170c88.24.1777326160474;
        Mon, 27 Apr 2026 14:42:40 -0700 (PDT)
X-Received: by 2002:a05:7022:1b0d:b0:12d:b8e5:5d6 with SMTP id a92af1059eb24-12ddd995d76mr319153c88.24.1777326159951;
        Mon, 27 Apr 2026 14:42:39 -0700 (PDT)
Received: from hu-rraheja-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12ddd927bbbsm653119c88.2.2026.04.27.14.42.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 14:42:39 -0700 (PDT)
From: Ronak Raheja <ronak.raheja@oss.qualcomm.com>
To: vkoul@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, robh@kernel.org,
        neil.armstrong@linaro.org, gregkh@linuxfoundation.org
Cc: dmitry.baryshkov@oss.qualcomm.com, konrad.dybcio@oss.qualcomm.com,
        abel.vesa@oss.qualcomm.com, wesley.cheng@oss.qualcomm.com,
        krzysztof.kozlowski@oss.qualcomm.com, ronak.raheja@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 2/4] dt-bindings: phy: qcom,m31-eusb2-phy: Document M31 eUSB2 PHY for Hawi
Date: Mon, 27 Apr 2026 14:42:15 -0700
Message-Id: <20260427214217.2735240-3-ronak.raheja@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260427214217.2735240-1-ronak.raheja@oss.qualcomm.com>
References: <20260427214217.2735240-1-ronak.raheja@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 73f9ls_qGD9IuUFJyGdoZO0A16aTweAM
X-Proofpoint-ORIG-GUID: 73f9ls_qGD9IuUFJyGdoZO0A16aTweAM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI3MDIzMCBTYWx0ZWRfX+07Bq89TiVjF
 OYzjIOamEQXFCFgk2FWCLe4uonPW1nuU4XYlWNswIaAhiz55fRlLC/aSjX3oh29GfZb1QZkyNb2
 p/98o0pbB8LBbAcNIga8GhbnK8MuYSbjDzTPBwqn7ReYletiQ3HGj/RyIeVW3KbpviZgGLUiAyo
 hYHwtRa/2kKHYkzZD/bvEEJJVLNlaKxslhvJuufdjtQ87syJDoN/vkMwlQdhk/CZgGzDXpOV8ej
 F+xISSrVCdLSaXoXvqr6mPfccXF/Czd1w1yiAnGsaHc6i9c42UvtShESrSoEGPvTaMtHUZy1J/T
 BzcEp7mCqkxqIfWrEaSnSbSTNOMX3h4+UR/Et87YykH129xDW6W12NnHcJF8HC373rQXr+Hk2fS
 V7H9Xo8QkjcbXT1lE9xKK217X8LdIi3jQOaGV7b6Mnk3XNZHmGsex4xW5ehKFaS9sPrVCoR71+I
 cjL4BPAj3iIIeebQ+Yg==
X-Authority-Analysis: v=2.4 cv=FM8rAeos c=1 sm=1 tr=0 ts=69efd851 cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=vC2bFTPnYnLVIQvTftgA:9 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-27_04,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 adultscore=0 bulkscore=0 phishscore=0
 spamscore=0 malwarescore=0 priorityscore=1501 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604270230
X-Rspamd-Queue-Id: 6B6D847ACBC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	TAGGED_FROM(0.00)[bounces-36573-lists,linux-usb=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ronak.raheja@oss.qualcomm.com,linux-usb@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	RCPT_COUNT_TWELVE(0.00)[17];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]

Document the M31 eUSB2 PHY for Hawi which handles the USB2 path. Use
fallback to indicate the compatibility of the M31 eUSB2 PHY on the Hawi
with that on the SM8750.

Signed-off-by: Ronak Raheja <ronak.raheja@oss.qualcomm.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/phy/qcom,m31-eusb2-phy.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,m31-eusb2-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,m31-eusb2-phy.yaml
index cd6b84213a7c..c0e7e2963ce6 100644
--- a/Documentation/devicetree/bindings/phy/qcom,m31-eusb2-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,m31-eusb2-phy.yaml
@@ -19,6 +19,7 @@ properties:
       - items:
           - enum:
               - qcom,glymur-m31-eusb2-phy
+              - qcom,hawi-m31-eusb2-phy
               - qcom,kaanapali-m31-eusb2-phy
           - const: qcom,sm8750-m31-eusb2-phy
       - const: qcom,sm8750-m31-eusb2-phy
-- 
2.34.1


