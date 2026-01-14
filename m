Return-Path: <linux-usb+bounces-32349-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 222ADD214B1
	for <lists+linux-usb@lfdr.de>; Wed, 14 Jan 2026 22:18:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 8FEC1301198A
	for <lists+linux-usb@lfdr.de>; Wed, 14 Jan 2026 21:18:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0BB0F361671;
	Wed, 14 Jan 2026 21:18:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iOpn3RCK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HzWVe3xM"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E97B830DD27
	for <linux-usb@vger.kernel.org>; Wed, 14 Jan 2026 21:18:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768425485; cv=none; b=Mxa3gPadQG+qA261HvoyWhA9bL6XG57wpOYVzjbc77Bjgw+q8FFVbIkn9rTMnKzL55fNQwgxbEss5R1WbWYawgUFdyGyjikHjGId9C1P0u/prPt1QnyLDsiN7sAS1KgkO0xmKWe1qJ7d93IHCQy9+u9dnyQznzxF3m6330+6QM8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768425485; c=relaxed/simple;
	bh=B96DTjA/Qkfjdv8J23q4DrvKTZtLIXFU6ouxOW8qoG8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=fMW+MwI+UdKUanfme8c4iBrksj6VmN8n5+kBZVKlFLRbkC4x38nJwZJiltJ0BbFMEtXDh8v/x5JA0e0rmFU5V7mjtEU3CEHt2cJFfsRktIoyDqDYBz8fKbtIRYx45MWYym5npExMkDTOSQTUPcKft+Sq79CWnh8Ds5wtiFGu9VE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iOpn3RCK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HzWVe3xM; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60EJaD3Y3280082
	for <linux-usb@vger.kernel.org>; Wed, 14 Jan 2026 21:18:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=gO19S1BttVvttNQrkJqOaoLa4T/6SpEQKjT
	PCRL92oU=; b=iOpn3RCKjp6r8+idZD1YxZuRZJg7DW2m4EC9U4tIc12h1HQQmLa
	AwoZx190JYij9TVqOMomaUHw5AVjTe0AjO6vv8YXD5jokQHuO/BM4wrxO5JqtKwp
	ly4P6Y0YfUl/Ngfr53xZncasBW5RauGeVXvqo9hYJKGNMNvYKQjdWI0sD3vTski/
	1SBZjVmEijGGYwqXkZQ59aEtlU6C2OdjuvFer1pzuhHpDxu6nxnV0gmPMzYPoQx1
	AXXSkUD+wkZuQ2p73Ywpem6LtwuaecOZcGFovvuhhti//hm63F44Q1TU3RJ6JBQ2
	NHtr2w+G+HBUZXKv/9KvSrRFkBFqSefaoug==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bp9x8t134-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Wed, 14 Jan 2026 21:18:02 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-123349958b2so818565c88.0
        for <linux-usb@vger.kernel.org>; Wed, 14 Jan 2026 13:18:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768425482; x=1769030282; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gO19S1BttVvttNQrkJqOaoLa4T/6SpEQKjTPCRL92oU=;
        b=HzWVe3xMDc463PACwFn5uZBSs90QXxbYaUTGBez4+WmReO+ar/RORGGIAniyOBQi0x
         YW6jRdy14ATcgwuv3lg0/hWDv4b2WWTXP/npL8VmYAg5UHFZ5vBcnspvESatyHYu8iBf
         HQ3dVgyKyYGI1WWOizHp7u+sr3yF3Z/sj1HVzl4CXr+NmM04TN61EFAtSLlja97iHEYH
         81Bhu6tV0Pcwf+uS8ObfB46S/UhPohTLUfk6cVokj6C53GuBV0QCNCxV0j75OIxIBIaL
         tZbzUTeMgiZrG+csYvIXpeCpmGeixnasfi/zYy8P/qRe99w26ecVxUB0m+//8RUF8pjm
         f3Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768425482; x=1769030282;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gO19S1BttVvttNQrkJqOaoLa4T/6SpEQKjTPCRL92oU=;
        b=JsDttQ7YMTqGpOCVOa4btGN+O2QsQFJFuZSY8/33FP6ZA4sx0hhK1/gKYdj8aEXOzp
         6qMj02XLIpsbIFBuyltOjMcTRX5C5o7Px2KiLSCAUonMbD3QONXdG76KRE9te8xlzJkP
         Y4jR3cJGmXntajmWQsfZmAmftPsIO7XKcJoUhoPcPLVrcpCZqMnzvTAPAk2dh6+bqilF
         EIOCG3US2K3Y2Pi+C/D+fyrPwznmitN83w2VpDeKKpcX0uE4B/XHCsB+/39QQwGzzz3O
         dRWc60i1HWYKllQ2hp4X3L0xlmo7XdHgCN8HuS2P7OP6qgaC7NH6ZCwJ0ECHZ/Ss7hGW
         vm4g==
X-Forwarded-Encrypted: i=1; AJvYcCWw7sL/C/OW03d2e4ueiyil43oeZNBu15K/Zxnza/GaiIuvFGPKulB6JS02nrzrxTdzWTM5kGC7yrc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwUC2sVUcxDkQnUswO2lQ1PwO4AX/KqxudbGlARfLqGmdcjT46L
	QsZjn9Y8yJJEX/GKj+ZHGaznxEARBazASrEN1TUmfPr0vFUwlUSm7ry3/vPbyXrYEF729KRPpvL
	w/LnjrROkSBKaapFU00obvxo6raI7SUzf4IVF4x3RA35kywtzL9PG7+PuRKTMBgc=
X-Gm-Gg: AY/fxX4R10QLSJ4XY50zVwhLrAzSVODMPn7FGeYgZai2/mCLWmxj+62V7ylFpCDJ5CB
	T/E/M0AC9qf/Teqola7xAMp6XIkpa4dhp8CuRDMxYaCKk//MB1nD+ceLIE/nGkzJA2ngYTQgy8m
	HGp184UOfmMHB6Rk1gq76js7bk9ApGRIa6+gIfJn5SGJavK2nCB7NbixUXaNGdmHFRaWLexZAU+
	aJWBxTfJMgf9X4FDwh4fU4u2bzkMET4o3QC88AS92zW98bWts8LDH3xUA1bUo3v35jNld+QM3uC
	2bkUQJa99Tl81uAlrmfhCe0FbbBUnPkPVlIH5ROQ0BKe1cJ23+bGrFRfEk8BKXg7qWYt0ETyfPH
	MeRuMQKjxxiRbdyjGfPRBR1LYOOJeviLGowcpNyrTWtZvuUamWWm0564zvxwGs8JLHW8mhNmy
X-Received: by 2002:a05:701b:2706:b0:119:e56b:9590 with SMTP id a92af1059eb24-12337704afbmr3993581c88.21.1768425481771;
        Wed, 14 Jan 2026 13:18:01 -0800 (PST)
X-Received: by 2002:a05:701b:2706:b0:119:e56b:9590 with SMTP id a92af1059eb24-12337704afbmr3993558c88.21.1768425481148;
        Wed, 14 Jan 2026 13:18:01 -0800 (PST)
Received: from hu-amelende-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-121f243421esm32167118c88.2.2026.01.14.13.17.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 13:18:00 -0800 (PST)
From: Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>
To: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org,
        heikki.krogerus@linux.intel.com, gregkh@linuxfoundation.org,
        abel.vesa@linaro.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
Subject: [PATCH v4 0/4] soc: qcom: pmic_glink: Add support for battery management running on SOCCP
Date: Wed, 14 Jan 2026 13:17:55 -0800
Message-Id: <20260114211759.2740309-1-anjelique.melendez@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: Kim1fZk3CUy9iHQ3FRUrShxG3HOrYRzk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE0MDE3NCBTYWx0ZWRfX6ALCtKQty38/
 oBtZS0IIP0vk7T6kNnY53d+1sy1y9J5ofMgEt8lQ2wny/ET5jeXvy//B7x66WxCbB7jXLwCAKuj
 N/vU3W48SlQbmy3x8pTRc3bw2QiKvQYQehWJuWwDZfHCbi9iEu+E9D7HNNGLJtcs2wRJMEekADI
 bcAp2SB9PBbHeMLEKatyRFBZh0AAQYVs59coPywVd+EsiAx2ojWvTsAl6D4z3MQxhF9MMkr6MhZ
 Fe/ZfAS70qaw2VuZjua0LBILfndLYErRlw4tHwUT89+SqRgsMq5aCn74o2G0Xhy/58bgE0jRUlK
 jy4ldZyfl9oSn7foF57+2OvGLZ6QvQJlzdndCvi32Dq53Gxo2hBBqAH1RCDQclvfK5rJ3/vIRTh
 utcZtJH++vuvVsKX8uRUfD3mVknmrn76Hkxe+dtcqt/xUIh8PdhqibzTmwoY89KZybhMBuJYYlc
 rvB3gLWCQTqVI/yfV9A==
X-Authority-Analysis: v=2.4 cv=HY4ZjyE8 c=1 sm=1 tr=0 ts=6968080b cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=qMsUIMY-mLJ0Ph_xJfoA:9
 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-ORIG-GUID: Kim1fZk3CUy9iHQ3FRUrShxG3HOrYRzk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-14_06,2026-01-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 adultscore=0 priorityscore=1501
 lowpriorityscore=0 spamscore=0 suspectscore=0 clxscore=1015 impostorscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601140174

System On Chip Control Processor (SOCCP) is a subsystem that can have
battery management firmware running on it to support Type-C/PD and
battery charging. Add support for devices, such as Kaanpali and Glymur, 
which are running battery management on SOCCP.

While at it, also update the compatible string for X1E80100 so that it no
longer has fallback on SM8550. 

Changes since v3:
  - Added "dt-bindings: soc: qcom: qcom,pmic-glink: Update X1E80100 compatible string"
    and "usb: typec: ucsi: ucsi_glink: Add support for X1E80100" to series 
  - Corrected bindings dependencies
  - Renamed pmic_glink_data structs
  - Link: https://lore.kernel.org/all/20251217055655.638594-1-anjelique.melendez@oss.qualcomm.com/
Changes since v2:
  - Updated bindings dependencies
  - Removed qcom,glymur-pmic-glink compatible string from pmic_glink driver list
  - Link: https://lore.kernel.org/all/20251027212250.3847537-1-anjelique.melendez@oss.qualcomm.com/
Changes since V1:
  - Corrected bindings dependencies 
  - Renamed pmic_glink_data variables
  - Dropped "soc: qcom: pmic_glink: Add support for SOCCP remoteproc channels"
    since it was applied from its original series: https://lore.kernel.org/all/176157405464.8818.5887965202916918883.b4-ty@kernel.org/
  - Link: https://lore.kernel.org/all/20251017003033.268567-1-anjelique.melendez@oss.qualcomm.com/

Anjelique Melendez (4):
  dt-bindings: soc: qcom: qcom,pmic-glink: Update X1E80100 compatible
    string
  dt-bindings: soc: qcom: qcom,pmic-glink: Add Kaanapali and Glymur
    compatibles
  usb: typec: ucsi: ucsi_glink: Add support for X1E80100 compatible
    string
  soc: qcom: pmic_glink: Add charger PDR service path and service name
    to client data

 .../bindings/soc/qcom/qcom,pmic-glink.yaml    |  7 ++
 drivers/soc/qcom/pmic_glink.c                 | 66 ++++++++++++-------
 drivers/usb/typec/ucsi/ucsi_glink.c           |  1 +
 3 files changed, 50 insertions(+), 24 deletions(-)

-- 
2.34.1


