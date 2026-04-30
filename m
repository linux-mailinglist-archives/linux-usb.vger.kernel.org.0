Return-Path: <linux-usb+bounces-36773-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6APDHrlC82kMzAEAu9opvQ
	(envelope-from <linux-usb+bounces-36773-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 30 Apr 2026 13:53:29 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EAA604A264D
	for <lists+linux-usb@lfdr.de>; Thu, 30 Apr 2026 13:53:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A8EDA3011079
	for <lists+linux-usb@lfdr.de>; Thu, 30 Apr 2026 11:53:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59FA3401A16;
	Thu, 30 Apr 2026 11:53:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Jp8h/2Dm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gg8D9+3Z"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 391753A3E98
	for <linux-usb@vger.kernel.org>; Thu, 30 Apr 2026 11:53:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777549993; cv=none; b=IwucLah2dngZhDTyA3hdZbqV1pNVZQlLBu7JVoqGILfu8fJzHeC9FoDSHJ4l9NHvU7fyaXbAJjG9nqlUVjfzrZLObYXejncEigEubEQBIDAyWfooJYDSYMyGinm/M3kE9Zug4l+OcBDQjMo3zeXMByyQs1zRbQERpZOHAHoLunU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777549993; c=relaxed/simple;
	bh=Wy35dkk+x7J7hVzibp+tGhexsVcSnAJWVDQsf3OwioY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=bbZwAAcIWymiPw9Mw8NkQurdTmGcpNtfUeFglkr2RrzF3pYEs1FuKSM6A/qLPxjSvwhCoXJ2iujNy2hl1XOOscwjpkhMjmrJRfpa3ReMwvvCYD8oG8r3XlSquaZyIovT4s7hNwcPyq6xMvTr145wiPEisOanz6aJf9xbIBgpLEQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Jp8h/2Dm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gg8D9+3Z; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63U75YOb831472
	for <linux-usb@vger.kernel.org>; Thu, 30 Apr 2026 11:53:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=S4gD0cycTGKSJtK98/zmKq
	rbMyKEPcJ5+g2Xd9XvCl8=; b=Jp8h/2DmmjhkcdXnovykDDmIcVBQ2HL6cZ8DPq
	git6edin9YkdGhUvPEdJu18DIl2HLHLnCRBxDOqu6QuIJs5tjg/au5DP1M21PCsA
	VtciYYdVMsMv9OrR4PThipusOBq5LuAI+D43FIoZsrQd+DOMWFaKUtt26LBzsgmh
	avHDZ+kA4hAYEpIxVtBohN/ILemJGG8h7oKc4ETs49ylvM98orE/gnvYbNGLdjph
	6n4vfdZTnP6EwlrtwspHhLqkxfW1RLwOCV5iY2suQGjw79nGebtX9T9x/tGcCxNe
	c1cwK42khYDr+fZye8WgGoWQI3fGW5nXFCztOZAMY+UusVcQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dv2cq178w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Thu, 30 Apr 2026 11:53:09 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2b2d0c1ead1so13461045ad.0
        for <linux-usb@vger.kernel.org>; Thu, 30 Apr 2026 04:53:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777549988; x=1778154788; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=S4gD0cycTGKSJtK98/zmKqrbMyKEPcJ5+g2Xd9XvCl8=;
        b=gg8D9+3ZpNsJGcAKL11ElygMFOEepPRJy1EYtwR4gdSunq+lfoNAm8jufs9Rty+C4V
         puyaK2Pnb8xJGaGR0n5Y8S5X4Mnr7BPPqajsushvYV7FFbsNEoQxmEO2/CCEnSk5nqJe
         mKoY8gNECbegKIZQz4uA/SbzdcRwi/IaSJ7Q6fBr01FfBIbX6hvNcGqNZu3XG6tOJMfh
         YRpUuqc0Ti7lywuIlBsxG8SyMZeAF9Ll0W4TNzpiC9Pz1JHGVhIfFF8C2J3WTiFWirWt
         OWTtjKYVh8MakmP83NPgHXdKDgAc100LooG5EMBjpMeEf9dFXA4vXSisQyA8j7lFf5hO
         kO3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777549988; x=1778154788;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S4gD0cycTGKSJtK98/zmKqrbMyKEPcJ5+g2Xd9XvCl8=;
        b=ohLbMRc4n+xHurgBuCciAZBENZrkdMBFLhdkV1EKumT14qFUX5dC1EoexbJBRKKs70
         7wS8Xngu/66SFtPFUOzNrItp0kaYybXl+AsGtdIplen0Cs9s3O9Ub8zvzjc58U22cosT
         ph5BgZFBQvj2cyqVkwd40sESAEjPz8Zrmk2xZTGngi84ZWjfRBETvHWI9LiX8NAKDUf/
         rZgStz3ggEwGcfR+7mHU7pUNlTs9xgHHXRScABhiDNaTSxdZI/0oyGfs8v+jiLRbV718
         uxA+fJYmqfRv+9QO6rtwxrjoweth+irFm/qZkmx9WbGrUOMginK975Kt+QF4ha1q6fXs
         IuSA==
X-Forwarded-Encrypted: i=1; AFNElJ89cgG+NmzpyawAF6WJ9R+mg5IlKQJ/haYP6B15BY2dbgl9SZ9PilHQKBe21QVIqoj3q6IOOA6aSDI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyluzr+36cMrhgR3NOPvaSeij2x4RC/Xl2OfRoTZRK3RjkWHP4a
	SGn1+Op/vHz8a85kuChcDptGcWBGSxmEOUCIEy4Surdq+dKfMobaCFU1ACUwE5lP0s1KAJlpXfe
	faI6gl86pFI2Knl92A0rXfFXmExeQv+fgSxRHKIchH/+37V1ZaMqpeW7Bd2SWHTI=
X-Gm-Gg: AeBDiesquKxzB50t1/iPuGgHPyaTLUmDPrnP7wyn02XVLP56s3aNswbPmGXL0H6Hrev
	srA7drpDZl7OKb0+Oox1eYyHpy+8O3A4P9cdfY7LrM+ihFrvl7KNRcd9p+9C9Au7wpFYlRQ3WFi
	ubcWVIGpzWy+9QngSVnfkf/ngdja39G6FlZk5DARU6XHDJqPsfrypnEC0gs+Z3tiOeSimWjQA2J
	tOlAygsDwS5VQkDghEfdz8oVWZLO3QVLj349AdQGMK7An1/174+H2/W+D1xPM1AqXMlHOslLT5F
	iRS2jnNVMvRNNnt0oyPE8RFg93skak5AvJI36+fEJL6QS10mVzKvoBKHpu+ShOvXG24tNCDfPHo
	Ytx1eZEq0gaqOFEkDbLKz6k/yDoCbynDGeVYBUa5vOCJ6MlU=
X-Received: by 2002:a17:902:f20d:b0:2b2:81aa:f6c3 with SMTP id d9443c01a7336-2b9a24e293dmr22500135ad.29.1777549988503;
        Thu, 30 Apr 2026 04:53:08 -0700 (PDT)
X-Received: by 2002:a17:902:f20d:b0:2b2:81aa:f6c3 with SMTP id d9443c01a7336-2b9a24e293dmr22499885ad.29.1777549987989;
        Thu, 30 Apr 2026 04:53:07 -0700 (PDT)
Received: from [10.213.101.118] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b988971138sm53834955ad.70.2026.04.30.04.53.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2026 04:53:07 -0700 (PDT)
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Subject: [PATCH 0/5] Add USB driver and binding changes for Qualcomm Shikra
 SoC
Date: Thu, 30 Apr 2026 17:20:25 +0530
Message-Id: <20260430-shikra-usb-v1-0-c9c108536fdc@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAFC82kC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDE2MD3eKMzOyiRN3S4iRdw7RkgxTjNMtkQ0NzJaCGgqLUtMwKsGHRsbW
 1AJa0b9NcAAAA
X-Change-ID: 20260430-shikra-usb-1fc0d3f9c117
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777549983; l=1179;
 i=komal.bajaj@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=Wy35dkk+x7J7hVzibp+tGhexsVcSnAJWVDQsf3OwioY=;
 b=EzKgLLmHkhOhpXWlxFsqT4An/gtiBGVcCoWJug4OSDZdbwaJtBRecdGA7cSDgH8odE6pmNwWV
 SOihEZOIutnDBqlGrB93QQ/0mg0nNUd08Ih2mip/nRe9m3yrjPYSe9f
X-Developer-Key: i=komal.bajaj@oss.qualcomm.com; a=ed25519;
 pk=wKh8mgDh+ePUZ4IIvpBhQOqf16/KvuQHvSvHK20LXNU=
X-Proofpoint-GUID: llRG3B-gRVroNiswtshTRjcSeRgeZvLt
X-Authority-Analysis: v=2.4 cv=aYRRWxot c=1 sm=1 tr=0 ts=69f342a5 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=UoB5GuWjjGMfoql652sA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDMwMDEyMCBTYWx0ZWRfXzw9UKkNK8LtU
 Jlw/hgtWS0Gjj9BLQOzmzheKy5qR/VrWPMYjQHdIBjSyUOAUuF14ti/cMMvbKfhisE62a8DdxBs
 z5HEs+f5JoJf4Bm9AWSwgc1Tv1e7rxUaD0JuXY0xKPuZgy6kOOo62S3SMa7ORsxmIlxWZw0AoFq
 /jgXcdM4lkMLxAzveZL11erNQfI2bTx3MmDNhGYdFFk7lm9dU4VDuWE6G7nY7rJwzjIFK5m3C4u
 D+wpmcWZb8YaBktPlINCFkIhhDrElYG25U4AvdYBNpX/DqdnxYUQ/UzTG4bbqKUedx6k3tKfimT
 KD6YpxC0AyQNq1KYC5ZiBK3OrlOfZN8utVJOhckTO/17U9wnt02bVGm7gaL8d2DxAR5Yf6e/T5B
 7e1uAV0UuGA30wK7vxSm/8uArjcAJmzX7UyiL4fqwAS2UfoozT40c761zExXDRp/WdDgP2UrWWK
 1CQ//5JyxAfHGX53xLQ==
X-Proofpoint-ORIG-GUID: llRG3B-gRVroNiswtshTRjcSeRgeZvLt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-30_04,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 clxscore=1011 phishscore=0 spamscore=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 impostorscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604300120
X-Rspamd-Queue-Id: EAA604A264D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-36773-lists,linux-usb=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[komal.bajaj@oss.qualcomm.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

This series adds Driver and binding changes for USB controllers on
Shikra. There are two USB controllers - One of them is SS capable
and other is HS only capable. The ss Phy init sequence is same as
that of Talos.

Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
---
Krishna Kurapati (5):
      dt-bindings: usb: qcom,snps-dwc3: Add Shikra compatible
      dt-bindings: phy: qcom,qusb2: Document QUSB2 Phy for Shikra
      dt-bindings: phy: qcom,msm8998-qmp-usb3-phy: Add support for Shikra
      phy: qcom-qusb2: Add support for Shikra
      phy: qcom: qmp-usbc: Add qmp configuration for Shikra

 .../bindings/phy/qcom,msm8998-qmp-usb3-phy.yaml          |  2 ++
 .../devicetree/bindings/phy/qcom,qusb2-phy.yaml          |  1 +
 .../devicetree/bindings/usb/qcom,snps-dwc3.yaml          |  3 +++
 drivers/phy/qualcomm/phy-qcom-qmp-usbc.c                 |  3 +++
 drivers/phy/qualcomm/phy-qcom-qusb2.c                    | 16 ++++++++++++++++
 5 files changed, 25 insertions(+)
---
base-commit: 39704f00f747aba3144289870b5fd8ac230a9aaf
change-id: 20260430-shikra-usb-1fc0d3f9c117

Best regards,
-- 
Komal Bajaj <komal.bajaj@oss.qualcomm.com>


