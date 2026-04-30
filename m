Return-Path: <linux-usb+bounces-36777-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QJLcKIZD82kMzAEAu9opvQ
	(envelope-from <linux-usb+bounces-36777-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 30 Apr 2026 13:56:54 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D3784A2727
	for <lists+linux-usb@lfdr.de>; Thu, 30 Apr 2026 13:56:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9B647304C4F6
	for <lists+linux-usb@lfdr.de>; Thu, 30 Apr 2026 11:54:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0B413E3142;
	Thu, 30 Apr 2026 11:53:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WTCq+PRP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DBgjVwnc"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74F89402BB1
	for <linux-usb@vger.kernel.org>; Thu, 30 Apr 2026 11:53:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777550014; cv=none; b=VpO7PB/ygnpLpzOEAK+vwVXOdVxLpxaTGdIzoyevobyEf8C6mbM8QwoN7al2jVMow+uzVJnCJWJq+FF6CuyE+IEstak4wqFU6djdcnNAN62vaj3SMlHDNEJAwa438jyAvafiz5I+vgEgPjD/sQOmguzNBwe8GuATWjCPXwo8y1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777550014; c=relaxed/simple;
	bh=glAUnslPhbMwD/sFXe6BFap3FDs/pmoREZOqlEys1Bw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TplDxtjUTO7uk2dRJNZsqAd0SfBIUXjS+enVnBOJWriY0D97BW1yKhcmmE7o62hPKmY2mpuqvaWz/l0pp+pw9EO2xzLjPaBEEhC7vsygrlU8F3YWxdYgt9A6v1HOkjvV6vD+5jiqX9RKqt5mfqQKVLgYQCrpXkgpQ9IllSLo7C8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WTCq+PRP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DBgjVwnc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63UBkNHO1820720
	for <linux-usb@vger.kernel.org>; Thu, 30 Apr 2026 11:53:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ps5zXr8KvxD7La8ND/9uOCAL3O/rduP00pOV5kPiIIU=; b=WTCq+PRPVkeGHc5N
	4E4YFwhZCC0aLpYfOjyVEUbQEHg4rQWAKmu7GvjtrC/AovOiaqGNA3bDkECWOBh/
	hxMro0KI/hrFLS+/UGbqtoJrrWbqv1TGw4FnFIqH2KYg/wkqfHYMgfS9zF1F87oR
	TeIvfzYDJWQr3ZdUE4FgoCHIZVUA80muLmW6zI913AdVvb1PiyRzPXRHNfd5yX6f
	chZGN1ts+LtfC4CutHifXQDTshoZ8u+4b7YQs+0wAYWIMVtce6q2LATQ9GSWmhmM
	a0eRGkz0EzCTsDrYq6qhhPnIUY4AduhGEeRhpoBsEFaw1k6CrMTHibxYBLyeWVub
	eYHbhA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dv6ger0qq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Thu, 30 Apr 2026 11:53:28 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2b2d0c1ead1so13463725ad.0
        for <linux-usb@vger.kernel.org>; Thu, 30 Apr 2026 04:53:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777550007; x=1778154807; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ps5zXr8KvxD7La8ND/9uOCAL3O/rduP00pOV5kPiIIU=;
        b=DBgjVwnc4c+VfQLFSNon+idN4tPdDGfCzr4mBRDO8vhal00dFC9oi9o6XPi0Ruymgy
         msF+i1PdAtz8GMVZpO28eXQniAmuZEY6hVhKpfIZJ+ZiZrwujcp/Ytda5aZ5E6iKaD9k
         wKQ9RR32+yDMdJ542Z0RTfrfcMVMr0OimDiqb65PPmSnpl5Norw+E3oBeyN64nIszSX0
         DR3mb+H+3/tVSM3LVTM2ynjGGASWsHXk+7ylR/ntQwOE5pHL2O5Hus/ieNmkp9k9/fZD
         NOMTZeNk/kqKoykwK1KkfIKiXjC+37pKIe8Bar8T2zBujrx8zC7KepGZDcITxKR7pWaD
         dIug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777550007; x=1778154807;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ps5zXr8KvxD7La8ND/9uOCAL3O/rduP00pOV5kPiIIU=;
        b=I7/q0P5HN9Xld2qyp4LPqrCESHeMsv59tw2BsKK+zvPXsYBjwCO4xWY7Ab0RxX7kxd
         afcj3I2cjnytWu/jcPl2kwduM5pbdFP4durM6vBQQXOECNlylvuZWZi06FNL4Tqxy5Jd
         qkjyuysaKI9hLNPNOW1pq7kkwSAULjith4CWPiVpwp9uujUHc5+qEX8cC6F2mTdwMELa
         RAhhvjmDCauFrkmJL9S8/LlOxHQv5wtm92gEZlZ2Wnyc88o497YjmqoWcvum0haiPVKc
         svKC7Eb/fkx60+2upVXI7HBKDwH3h06HdVcNADvki+mURZ0mFVK7VLGJ1ZHlXDVLJXdb
         KTOw==
X-Forwarded-Encrypted: i=1; AFNElJ8EF6qslbQgQA0dO/rQC25RXWiMytLCQh70WHiwkdJGHxItpH98AaS5eJoN5TLmU7lKQFaQ3s4uUBs=@vger.kernel.org
X-Gm-Message-State: AOJu0YziSzzAAr/n4mWotDd9+ZP8VIheyTPx8qKFp/Iwp/y+PaKCmPuo
	kgavPmML593o0jseO/Mlds+ojrnQw45BXgY7IGTeMKW4P2qXBaGWgBj26vMIVZBC+w77kaSv1K6
	PZwb8IHwaz/RWynXSHc5en9fnDiHqdV2oq/Vx0Z8cYfFYMe7BI6XCPavp83tNPo0aAgKlBK0=
X-Gm-Gg: AeBDievTZUYvVlyn7cNAbZJQNQLleRwmGiS0yN6laXtDfw1kGXJVm3o6udqpyTZwyrB
	6txIfLIfVB9v9s69n6aDFrk8mOJOPTRqFaxYmMLb9vHUaVMxgW4AJWShlXWzxoKz02CAtXKB9/2
	KnokhFlt9dyEYMkhWWN+1T3Y1P/SLm6DBcT7yTrsiVXfCFmvKRVOPSAnHEt71cmKjEGydDgbvcE
	ZDOmehK4+H6QNok5PY9Yi8KignWJQBrsN02g2p+bnDlYBweR1wzpsBoUN/C6cbb9Y+KhOEGdNd+
	3lAEgVnpedJ+qLCGcGjGlejaDDyL0GAYfEyFQxocM1qfNJKDCsv4jxPrK49v//vlOfTm5Llvzvf
	ISd8DPdhQ8CaNNUCu5I04p1mrID5lfDLf70E9vZzmkMfDMd8=
X-Received: by 2002:a17:902:bd04:b0:2b4:5931:bc4c with SMTP id d9443c01a7336-2b9a2345232mr18800295ad.15.1777550007312;
        Thu, 30 Apr 2026 04:53:27 -0700 (PDT)
X-Received: by 2002:a17:902:bd04:b0:2b4:5931:bc4c with SMTP id d9443c01a7336-2b9a2345232mr18800005ad.15.1777550006729;
        Thu, 30 Apr 2026 04:53:26 -0700 (PDT)
Received: from [10.213.101.118] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b988971138sm53834955ad.70.2026.04.30.04.53.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2026 04:53:26 -0700 (PDT)
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Date: Thu, 30 Apr 2026 17:20:29 +0530
Subject: [PATCH 4/5] phy: qcom-qusb2: Add support for Shikra
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260430-shikra-usb-v1-4-c9c108536fdc@oss.qualcomm.com>
References: <20260430-shikra-usb-v1-0-c9c108536fdc@oss.qualcomm.com>
In-Reply-To: <20260430-shikra-usb-v1-0-c9c108536fdc@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-phy@lists.infradead.org,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777549983; l=1446;
 i=komal.bajaj@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=z9a9ilodfoaZe6rWbutpepb+HOnjBSdkp1kFi8ZpYi4=;
 b=IOE9Vdz9TdJzaNgyiwXdVYxmmFDYF9VHTqzy5dEJC1AehxKvn7ZNiOEZ5b8sjuLAwE7dJ9Yr2
 RkKC9X1+cFGAHVfnRoo/InDVj7ljVl1kbIEcjeZVigHOKnB1Ht82W38
X-Developer-Key: i=komal.bajaj@oss.qualcomm.com; a=ed25519;
 pk=wKh8mgDh+ePUZ4IIvpBhQOqf16/KvuQHvSvHK20LXNU=
X-Authority-Analysis: v=2.4 cv=f6V4wuyM c=1 sm=1 tr=0 ts=69f342b8 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=2jleMYo8EjVMK2M3yooA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: xcDqaGbisiioYx025205nQDYNO96dfQR
X-Proofpoint-ORIG-GUID: xcDqaGbisiioYx025205nQDYNO96dfQR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDMwMDEyMCBTYWx0ZWRfXzfxAaivfB6AK
 ff/SW9RvPO14K02gMeiRoGJIurrbTRrvrQGwQhvMnCqqjsJGEOGKYMH5PJfIKTqPQCZ6OBi9Bp2
 g0pQZaWBsbvee4Cq9p2PYnfY7Xnap/cGEqUaG9sY9WH/if8Ni3N7ncuefYkXIM4EKue+Z1qIDuc
 zzc5mmBiPI6iLdzDsKvdeg4cf+T7QbdR1CUaarb0rwnSFf0xPU9KPmyZrgYmJCswMKuo5ezi5NF
 kNSCBaeoRyks2f9qMqDBvIvUbY1Pux8WdYAnIU4l9fzSbFRf/4JtEsVhqJu42nTUFjQPQbeFtXm
 KbeCvgqppSrPFdLKuPkl6QnGO0LEY56TKMxJ0hLykytVZPJH+me3HxZ2H6DDOH9s8zaGnk5cJX/
 ENt75/mMGJ51fkZEp78IfY+ecw+Mev+P5IlClOzimu31pg2gDWCbrDy8d2KoY+eJ2YRd9Fz1U75
 5bDMoYYghju9OZQ77WA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-30_04,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 suspectscore=0 adultscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 malwarescore=0 priorityscore=1501
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604300120
X-Rspamd-Queue-Id: 0D3784A2727
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-36777-lists,linux-usb=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[komal.bajaj@oss.qualcomm.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>

Add init sequence and phy configuration for Shikra.

Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-qusb2.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/phy/qualcomm/phy-qcom-qusb2.c b/drivers/phy/qualcomm/phy-qcom-qusb2.c
index eb93015be841..ab7437e7b751 100644
--- a/drivers/phy/qualcomm/phy-qcom-qusb2.c
+++ b/drivers/phy/qualcomm/phy-qcom-qusb2.c
@@ -381,6 +381,19 @@ static const struct qusb2_phy_cfg sdm660_phy_cfg = {
 	.autoresume_en	 = BIT(3),
 };
 
+static const struct qusb2_phy_cfg shikra_phy_cfg = {
+	.tbl            = qcs615_init_tbl,
+	.tbl_num        = ARRAY_SIZE(qcs615_init_tbl),
+	.regs           = ipq6018_regs_layout,
+
+	.has_pll_test	= true,
+	.se_clk_scheme_default = true,
+	.disable_ctrl   = CLAMP_N_EN | FREEZIO_N | POWER_DOWN,
+	.mask_core_ready = PLL_LOCKED,
+	.autoresume_en   = BIT(3),
+	.update_tune1_with_efuse = false,
+};
+
 static const struct qusb2_phy_cfg sm6115_phy_cfg = {
 	.tbl		= sm6115_init_tbl,
 	.tbl_num	= ARRAY_SIZE(sm6115_init_tbl),
@@ -958,6 +971,9 @@ static const struct of_device_id qusb2_phy_of_match_table[] = {
 	}, {
 		.compatible	= "qcom,sdm660-qusb2-phy",
 		.data		= &sdm660_phy_cfg,
+	}, {
+		.compatible	= "qcom,shikra-qusb2-phy",
+		.data		= &shikra_phy_cfg,
 	}, {
 		.compatible	= "qcom,sm4250-qusb2-phy",
 		.data		= &sm6115_phy_cfg,

-- 
2.34.1


