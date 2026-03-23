Return-Path: <linux-usb+bounces-35313-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6LnZODQBwWlUPgQAu9opvQ
	(envelope-from <linux-usb+bounces-35313-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 23 Mar 2026 10:00:36 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 81E642EE943
	for <lists+linux-usb@lfdr.de>; Mon, 23 Mar 2026 10:00:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 379893022045
	for <lists+linux-usb@lfdr.de>; Mon, 23 Mar 2026 08:54:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6EB433859E6;
	Mon, 23 Mar 2026 08:54:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Trg1ATVi";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SrrcSQTp"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E9CD38553B
	for <linux-usb@vger.kernel.org>; Mon, 23 Mar 2026 08:54:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774256072; cv=none; b=tVl7MP6Qmhf7Ip2fUWvOCVRtw6nNpCbT5bbPz+e4pQU9FccM8nDjGQDFG/v6tfmJAIYAXmIuURhGgk53QDry52VaU23hiH+r0n5SU26ixSQ4vsukLdqSHztO3vGAkqkiLm+Um3qUYZG4Tu5QcR3vkmv+tO2AfqBaJmSV3I0RRUg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774256072; c=relaxed/simple;
	bh=ypEi64pFV2glo89XxtZm2HdHHzV0uZjCSiCheKZTlHM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hpala17i2SjKkNIhAwQMB38YuTGNSwo2BwOTrLot9Ep27WPEUJTxcj8Qbk4W1+iRSFJP/ypis8fX5FyWFuILEhzXY1CTq7UjrDEpqfXblPoSogz511vwy6p2lTX+2p7XgSk9LxHXfG5fQ6NOjJZyQ55rGPH+34UjrTssfuB91l8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Trg1ATVi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SrrcSQTp; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62N3hF3X3737936
	for <linux-usb@vger.kernel.org>; Mon, 23 Mar 2026 08:54:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nd8w5xBd6hNj+LCQVU2FB2kU+tfacWvd0IZ6Q3ToAHA=; b=Trg1ATViX1jTkeCe
	ORPTxOakuW3uQUr2IS5hqpGWLHkhwRvwPiZ/PAUSClerH7f3DE+lJVWKR95lNvpT
	NmRXqOTrzHqNSOfCFXLJb8Na+HmZ6M72Lc8hAISmZLnbqUYoKm77FZtDJ/Xbk1Ui
	/kisGCzupKrDyrcaOGkB8aSTBjms9lgbKKwPo3IGbyv66ZVPawaP9Ek9pDA7ZBrb
	UfMw4KV07C+dSsLPNz0HBuo4Y/idkv+2/I17IZbSGBV52poaX0DyGM1jqTEA9Pmb
	YrNjsjN2ACCVdleNzhYlxwvhoDDDOIWW9YyN1v8NENfzQFQn9Il3hzRKXq8fgt6B
	D2/2dg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d1mghcep2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Mon, 23 Mar 2026 08:54:29 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-5094741c1c1so319159271cf.1
        for <linux-usb@vger.kernel.org>; Mon, 23 Mar 2026 01:54:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774256068; x=1774860868; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nd8w5xBd6hNj+LCQVU2FB2kU+tfacWvd0IZ6Q3ToAHA=;
        b=SrrcSQTpDECC5npNShMpfXFdjR7XqyeRJt2N/AXS6IdWGPUDB8+wl01DPWombDTuDo
         ynBBbud9aeQXZK07fhgGF/hBsS5WhGAUlbgWBHkxxpEnVAucAiPnc1nCOjcLrhlTDowE
         8QVfIA5IVjKgDlQUqYhKILQGwUjRC0BMfKo2+oQBhZR6cYM7PveONQISb01Jl6mIkGt4
         /pFp1mb2mNQIGivn/tuoUk+dcZ4t21xiscY9UNR+LYpvorUEZH+3GXZgOWi92MM/KpZk
         c0wmOykWH+U4e7OmSYPQE/jGd63BGSJ21ilZNsE/gvdhIKdyWvBmeaL6lmi+pwDlasav
         GZbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774256068; x=1774860868;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=nd8w5xBd6hNj+LCQVU2FB2kU+tfacWvd0IZ6Q3ToAHA=;
        b=WUNfwQ7xPS9A3ya54UELJUNBcdr6iydSHmhbtcJoXJ1rXgfs3/gZrLmt3miY1WCa/a
         OFa0WxByZZnX4xvrv0c9qbFgWVFEY8d2rPoyAktcjfqyiauGx1t5bhgQKT1QKi3RYGsv
         E4H5d6K3ZNwwrBmLZN4D0Xgz0GeWivyJuKff0v7t4MtHX6TrG12rQd2Y9f8BbOY3rbjL
         VlwirPmplAiofx9xEaXO/Nw9AX0JsXFm/osbpwXbS2LXJBwwHGtlPri8GoB97i8Yom8r
         LdV4Rt8ugQnlkdlfHOs9ZphraAuWvUpml2HAu5NSpjp3wJS8n+FBe+2FjiQPx7gdoOF4
         3RVA==
X-Forwarded-Encrypted: i=1; AJvYcCURZuQCJ9HpdnkH/iYLo+fx2bokrS4Q4RKd00Q5qeCsoAA5/sBCMOQZWZX3D+lJP8X/r8C/7lEkVno=@vger.kernel.org
X-Gm-Message-State: AOJu0YztTKKRUAfHuvQC4Muk4g+Al7e6b4Q3Gq0EZFo+PW8waaai/htv
	mMGTCgNt12AvNdH8CxEshgNosJRg26OwdKRE6QQWciOe2lLyIFkLepWnMFZZcRo/2s4DXU26XnU
	fUL2BLrWHYspzHSf2Udaqtj67dEK6zGH6jglaTrYevBNPOY5lXErkCzhY/cYl8kSpGU4RYuE=
X-Gm-Gg: ATEYQzzpgUEKwHoHAvUhHEaoAg8rxln8UAH5umkKe7yyNNLYH0qRiBxNxiS3R0GXJ2n
	b4rwcUzg0hTCFvXDwnQaRG97DXWgqX8+QmmMfA2suix0r0CX4ZbJnTe06/ly0tPrzDEIsj+FkW+
	2kXpfSR4SJCnuHtQtxTknpQLXAvRmp2k0o7e/2zRPb94Wk1Lko9ua2PSsGndECsKaPTZN/mLwkw
	T8qPIkVx2zlEM+V2nf1vUKIH9wsjjIKZ/9fXIQ45CCs/EPj6UuA3XEsmHAN7AmxjKBP4kSKaRcT
	Q5d0+enUynwhnecJtUia5M78irQ8yuVzyxJ5a5CFPCIDPk/U+HjrPPmsxkvzJiY+Nmme9HbOYAK
	rXLGsZI1qeiKoNOiZkkjUAz+O0cXtzCrh6s12GQyUSHiA
X-Received: by 2002:ac8:5890:0:b0:50b:3f6a:1d88 with SMTP id d75a77b69052e-50b3f6a2050mr152307091cf.19.1774256068464;
        Mon, 23 Mar 2026 01:54:28 -0700 (PDT)
X-Received: by 2002:ac8:5890:0:b0:50b:3f6a:1d88 with SMTP id d75a77b69052e-50b3f6a2050mr152306961cf.19.1774256068073;
        Mon, 23 Mar 2026 01:54:28 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b64703c27sm27911739f8f.18.2026.03.23.01.54.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 01:54:27 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Mon, 23 Mar 2026 09:54:12 +0100
Subject: [PATCH v2 1/5] dt-bindings: usb: qcom,snps-dwc3: Drop stale child
 node comment
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260323-dt-bindings-snps-qcom-dwc3-cleanup-v2-1-3bcd37c0a5b5@oss.qualcomm.com>
References: <20260323-dt-bindings-snps-qcom-dwc3-cleanup-v2-0-3bcd37c0a5b5@oss.qualcomm.com>
In-Reply-To: <20260323-dt-bindings-snps-qcom-dwc3-cleanup-v2-0-3bcd37c0a5b5@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=812;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=ypEi64pFV2glo89XxtZm2HdHHzV0uZjCSiCheKZTlHM=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpwP+7x5qZ7osOWOXn4XF5PTSAGBR1RBPDvLMnW
 veTAZzql6uJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCacD/uwAKCRDBN2bmhouD
 199JD/oCvnbi7NKCL3GwDul/ThBxgn4z+dXPvOmUpd2ICChxlXlzO4tl5AEWNGvpzY9G+glGkhy
 GZZdERFt/+s+fT0KALJGPiFV7qtF3o6wgxiRJD9wSUlr8EeBczLx6LQBBf6MhfE2zsRqNgCKDAa
 UVTQuNGXhMd8PB3B1/j3fLcbvxt5xm7b8r8RhDlYNZODrw/JA1yGQw2Y294bPk4cgDoKf3nRDIT
 M0IYrBSkjUki3wrBiD2vwNMywCaJ8RuBJ/Sc+sw4Ok3ctz7aw2Rs8gtqTLWjo2xz5MaOvt/FmQ3
 txeUcLI9fNy97pTwoBriO99unauB2iiftGngOmL+aiE+gB5Lj4GlKgOL0bjl7PLsxrAiBcp8Mme
 k1fEUEL97Y6/O8tdEV+ziE2AjGdhzooiEmqAsqiEHmdxexyKkHmVY/XKw4w+TyzdvAGGRBUqJOI
 ZCFmCZICYICFQhK/xYgChKP5Jgn4xjBBeWapvLOfwTuCX9FgM3zifvzMUntcpnA0cjFSAQU0I1k
 qd89KjosDo13s6NcmSNIycS5cHE5b03DrrBf1H9NVnEkNqmUl5ILIQesqYSp7G2OtJJIemXumSi
 HtMpyd9g9vGPINqtU2ikftQedihAQUPgdRoMNCWd3h/1KK8JiOQvBLmcu1biutRfppXIkN5FAnr
 PHlPZNXNfNL2UHw==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Authority-Analysis: v=2.4 cv=HI7O14tv c=1 sm=1 tr=0 ts=69c0ffc5 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=OWNo7BSMJsPq8WwrYUAA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: 49XRkaQFFQJC1U6HyoLyxyQoeOvqYsf3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDA2OCBTYWx0ZWRfXy50/aW48ZBV2
 LNMJcuLk4CdSgnJCWT37WAG4QggTDVp8k/lAGVeXD/kftnyIg/dAm+vfAH++pVIp8iOIdamacIr
 tH37iuyyKobkuAkrBrybEACzR0XBcLwpvA6Ig/YriXx6gcYx/4ycvx5trYaW4+ZsZDQKsqBkNdv
 HjZlGQpxbszBpV/P07VlEeiduxoRDPxjdYciVM9bxmNj+7U84XdR31bIL7RdVqpvHZs+y9oMl3P
 4vhGtO+TSUe6vZfmyTpiieAkgAaChIWnirx1d1ACe4BbNQBL+g/MpSmY3GnmqZ7TKLhLzTVxt1n
 7yv7tikBxe1oE5Xaqz6qWxZBnUooYyf6Zy18r7rcYmelGJFY7txihKq4WCFqw9aOmd6jDdV7Mwp
 LuShqc9CjWhOC0vy73EAfK+W/e+N1gNv3g0hoykGw0TgIjgn4fcANW/73DAqBEnsOf7w+h59yvh
 gyx8x4WNXMhlCgRFvgw==
X-Proofpoint-GUID: 49XRkaQFFQJC1U6HyoLyxyQoeOvqYsf3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_02,2026-03-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 phishscore=0 malwarescore=0 bulkscore=0
 impostorscore=0 suspectscore=0 spamscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603230068
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35313-lists,linux-usb=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 81E642EE943
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

After moving the binding to style with combined wrapper+device (so one
node) there is no child node required.  Drop the stale comment about it.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

Changes in v2:
1. None
---
 Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml | 2 --
 1 file changed, 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml b/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
index f879e2e104c4..2b6a0939d98d 100644
--- a/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
+++ b/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
@@ -153,8 +153,6 @@ properties:
 
   wakeup-source: true
 
-# Required child node:
-
 required:
   - compatible
   - reg

-- 
2.51.0


