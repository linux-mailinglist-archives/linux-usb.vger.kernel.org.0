Return-Path: <linux-usb+bounces-37161-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8FprMJ9W/mmupQAAu9opvQ
	(envelope-from <linux-usb+bounces-37161-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Fri, 08 May 2026 23:33:19 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 27A0A4FBF1C
	for <lists+linux-usb@lfdr.de>; Fri, 08 May 2026 23:33:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7FE0D301F9B3
	for <lists+linux-usb@lfdr.de>; Fri,  8 May 2026 21:33:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DAB6130EF6C;
	Fri,  8 May 2026 21:33:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="l+m5M1qT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dDEgrnCN"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0296B25A640
	for <linux-usb@vger.kernel.org>; Fri,  8 May 2026 21:33:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778275987; cv=none; b=j7McEBkc+O2ooAE5YQaHDKIprjTy2eEQTzhLhz28t/VFTESPxec3zYbKoJznG4TH9o1l4wOnWgrAcNsK2AXMg5NNv0sI4+oXaBsoCMd4BTtZBf+u3jMdC/TcrRnsANqz41WlQ/ucvAEZHMXJ1LDFYCL0P3JAtQ6lnmllMw5/D5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778275987; c=relaxed/simple;
	bh=pCIGMlA/nMC5ncud5vvgUb8fb4QYErXq3W2kk7NW0Mc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=fdOD+i5S/j0g5+jxghNcXi7UU96vAxoNof/sPfnBWYkfj+x7tpadCbwsoiuQYeMgAmYeOlDUQrwjYOSv3zYahA52Uoqp0aGZYIB1XXTGhbswvM56xJycHA/aU85+YxBJ7gjUawcnZacz4bjOjyT/iR64PoVB07vA6iCorMkSx3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=l+m5M1qT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dDEgrnCN; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 648G2wQU724365
	for <linux-usb@vger.kernel.org>; Fri, 8 May 2026 21:33:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=ishO0sGDv2e12plW9StdJroZu9Xzo2EbYqG
	B0f+M3M8=; b=l+m5M1qT3cR4+K1Toao4eL7iI9DEAg9lzroeZrfiA/h73eCraqM
	brJj8tWcAEELVWLz1ebnhtCwPTFIJKp0W/qgzEqO6+pwtAD4mcqDfAk1Cb6CidS4
	lsTzmWXAHrZAjqdBArEbF6O5vT/bw2dVwYJTT47aRl5CCYfFuTSa1ac+at9uhDBU
	Jpdk5RO//cHez6i0diRYQEilIXlF/X9ZNgxnAoWgvDY6bjCMenIcZoqSmfV7OhGC
	HtC0+lCqBdxk7stGcPl7ELFqGL09QIZ0brCryBCDi9IqGNlXRilSb94+OH9OADh5
	sicbCXienX+rA0bFKaEp1+z2BzQhPGgmo5w==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e1k0uh25c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Fri, 08 May 2026 21:33:05 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-2ee5b73c5f2so11136389eec.0
        for <linux-usb@vger.kernel.org>; Fri, 08 May 2026 14:33:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778275984; x=1778880784; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ishO0sGDv2e12plW9StdJroZu9Xzo2EbYqGB0f+M3M8=;
        b=dDEgrnCNge7A9DuQRcuWygVd9Sn67Daqey3tedJfDhp/pABOmvIaJPjQ08RMDUdqIs
         x+wkFUUKjFtp5AABC+2Of4uFG0GcaZc2HuX39hmUfi+qRx3brCo4oI2FEWHDpkbT0QJh
         tSrg3SjRheUWCMBWPrgjFDQi/W8jZf5JrS2Uj9A6kvvKLTN+Yf0h6OjOVWm/bi1QVMxw
         9+iD8UAQ8qMJ07tFN+OoAiCCajGoIu0Qv9TO2DtC/wPvj2wdvamsSjMpwBuMUNXqtQZv
         bCgkZ0Qc6XFBbLxq7rf1wkTSBFPDIQEOVZUdfnDJ8+TSPQ2DPqtZRdxqZNVb5Vilnpu/
         URsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778275984; x=1778880784;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ishO0sGDv2e12plW9StdJroZu9Xzo2EbYqGB0f+M3M8=;
        b=A7aHR0N5SET3HZoHhEHWtSnt0SwFQRkvWcFqGzBUEhUGUpIhkjAjfUYPzyHusFuFfm
         Zp3rIw4AYCABVoc5Pz7OCpVmJiD1+o8i2CB3bIQzzgexrieHZGELRtRxbSqBtxDhu/4i
         tjmw1HBEwZSRap+d5vlj8r0QjTC9n3cE6+9GM5muF1i/OVsKZHrOJQ4sHydl8ws2bnh0
         bDVoFBTdC/L/Fqz/zczOOTSW88vuQqi2Lp558b8rn6xjradURwthoHvLmLS5mJyhS69O
         mz0fBrN0Bzv0ni35ebtufdeHLOEjftULyHqyLbWhu5VkD6k3oapA3LY0w7YAxrEH/YjB
         lz8A==
X-Forwarded-Encrypted: i=1; AFNElJ/tTQOhv3yy92OKKVJFkjbsqLLDbI+ASKIVPv/9CZkhvJeOw9vzeOf+Qa5/ETi1rlJwa4psRiAFX7s=@vger.kernel.org
X-Gm-Message-State: AOJu0YzN5Yk8l88624FRz1pQ21b+vTrkdq/3tXIkrLO/D3D4uR5IMtUx
	aIdoLWGsOE1J/il71aa4/eV2QyJyaTcmWg/ihbtXpV1AVYuvsdM4tSZKg3WWp7d9BnYh0M0bsgg
	OcAOWkTTAlrRess7CP5h21UuTcGxq2dnxLYEd8Vs54SWpeU33Rvf1iY1Q0+JkP7VHAD4Wq8c=
X-Gm-Gg: Acq92OGjKMmnoRaH1KuG6Ebp8IvDv9UoqL9Zfm2an2jmuymNntIA0DbNAq2lcvIR7gd
	SO6m7VZREeGEabpfMe813CzDSZhwNyN8MF5P/YECScdgd0PJDqRxhOvmwMYP38OxGuowUnUT9ik
	rCAOGiI3+Xrw2PjNqAnb3vVHLqn4YcDcq1Vv8IQWHtnOuDzpdXnapL4Gy7J/kTAxStRJdJRs3iE
	yVHIGy9645kpzzV6UApHnGzgfEkqfsgSsjgzy6MPQcqRsrFMoQlFA8CG94F5GynNxlZfo3nU1+E
	8NSTT4Rh0XRBG1oYXD9vFXbKQBd8xWHM/D6u3cFkegSosThhWsIDQqY0IjyxTEYLwGjHsSaT1/9
	dtUdh8BEnDeEnHBaDDe1Nm1iycf9GfZIjRfjq6MEGCsFLZv4ugardD7a/X1aTGNbMN+cnepP4QA
	k=
X-Received: by 2002:a05:693c:2c97:b0:2ed:e15:c926 with SMTP id 5a478bee46e88-2f54be949a5mr7815886eec.34.1778275983810;
        Fri, 08 May 2026 14:33:03 -0700 (PDT)
X-Received: by 2002:a05:693c:2c97:b0:2ed:e15:c926 with SMTP id 5a478bee46e88-2f54be949a5mr7815852eec.34.1778275983281;
        Fri, 08 May 2026 14:33:03 -0700 (PDT)
Received: from hu-rraheja-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2f888e3e285sm4871285eec.27.2026.05.08.14.33.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 14:33:03 -0700 (PDT)
From: Ronak Raheja <ronak.raheja@oss.qualcomm.com>
To: vkoul@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, robh@kernel.org,
        neil.armstrong@linaro.org, gregkh@linuxfoundation.org,
        dmitry.baryshkov@oss.qualcomm.com, konrad.dybcio@oss.qualcomm.com,
        abel.vesa@oss.qualcomm.com
Cc: wesley.cheng@oss.qualcomm.com, krzysztof.kozlowski@oss.qualcomm.com,
        ronak.raheja@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/4] phy: qcom: Introduce USB support for Hawi
Date: Fri,  8 May 2026 14:32:30 -0700
Message-Id: <20260508213234.4643-1-ronak.raheja@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=dIqWXuZb c=1 sm=1 tr=0 ts=69fe5691 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=fySfh4wnc5TE2N7XS4QA:9 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-ORIG-GUID: as-h2nW-G_QNUm-aHi2uF042xOOpw3nU
X-Proofpoint-GUID: as-h2nW-G_QNUm-aHi2uF042xOOpw3nU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA4MDIxMyBTYWx0ZWRfX879wOsld7Gsm
 HswqGPeuiBovNEOBeilSSMZESuVUlUXG71kSlAACx7AYtpWNyFRZCaXAtSKeJX57k0ohRdPogPp
 tsISKVLtKV7A/ts2ZJh+FPi9LQYNWWW+JaCvN0W2x8/okYu04QJnKPPCdMTCY3KX3cx1ZAUaGr8
 TvWB56DAzXNOzypd1ZHX17te1JRul8dxNvqV6YHhVmn1wwcHMjGMX3pfM2zP85H0WNcDZb6pafR
 NJbMS585LcSFMzCYTmIzcVC7y77Pd7vW7Og0FtoUM+4WkQInx+B4xEQYybJvbARCEmNVK8NcV/x
 A6G2cr1AbU28ED38MxN28fcpmba381URCscBhfymXjX2sJoCpo5+QExg99SR6f09yj3krZuWEQx
 VTgUlJb2UX71kJaCXt5jgJ11hcgue8MAGVQ8ke3Fk9tuJfMpFt6aO1iNmRY8KoG0zB3t20C62KZ
 HraASPkS4Izl7enJKKQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_02,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 phishscore=0 suspectscore=0 malwarescore=0
 clxscore=1015 lowpriorityscore=0 adultscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605080213
X-Rspamd-Queue-Id: 27A0A4FBF1C
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_NEQ_ENVFROM(0.00)[ronak.raheja@oss.qualcomm.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-37161-lists,linux-usb=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	RCPT_COUNT_TWELVE(0.00)[17];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

This series adds USB PHY support for the Hawi SoC. It documents the
QMP USB3-DP combo PHY and M31 eUSB2 PHY bindings, adds the Hawi
compatible to the DWC3 USB binding, and adds the PHY initialization
sequences to the qmp-combo driver.

---
Changes in v3:
- Fix missing version tag in individual patch subjects
- Link to v2: https://lore.kernel.org/all/20260427214217.2735240-1-ronak.raheja@oss.qualcomm.com

Changes in v2:
- Clarify in the QMP PHY binding commit message why Hawi needs a
  dedicated compatible string vs previous targets
- Remove stray blank line in hawi_usb3_rx_tbl
- Link to v1: https://lore.kernel.org/all/20260425070002.348733-1-ronak.raheja@oss.qualcomm.com/

Ronak Raheja (4):
  dt-bindings: phy: qcom,sc8280xp-qmp-usb43dp-phy: Add Hawi QMP PHY
  dt-bindings: phy: qcom,m31-eusb2-phy: Document M31 eUSB2 PHY for Hawi
  dt-bindings: usb: qcom,snps-dwc3: Add Hawi compatible
  phy: qualcomm: qmp-combo: Add support for Hawi SoC

 .../bindings/phy/qcom,m31-eusb2-phy.yaml      |   1 +
 .../phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml    |   2 +
 .../bindings/usb/qcom,snps-dwc3.yaml          |   3 +
 .../phy/qualcomm/phy-qcom-qmp-com-aon-v10.h   |  15 ++
 drivers/phy/qualcomm/phy-qcom-qmp-combo.c     | 231 +++++++++++++++++-
 .../phy/qualcomm/phy-qcom-qmp-dp-phy-v10.h    |  15 ++
 .../phy/qualcomm/phy-qcom-qmp-pcs-aon-v10.h   |  13 +
 .../phy/qualcomm/phy-qcom-qmp-pcs-usb-v10.h   |  19 ++
 drivers/phy/qualcomm/phy-qcom-qmp-pcs-v10.h   |  34 +++
 .../qualcomm/phy-qcom-qmp-qserdes-com-v10.h   |  89 +++++++
 .../qualcomm/phy-qcom-qmp-qserdes-txrx-v10.h  |  89 +++++++
 drivers/phy/qualcomm/phy-qcom-qmp.h           |   5 +
 12 files changed, 512 insertions(+), 4 deletions(-)
 create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-com-aon-v10.h
 create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-dp-phy-v10.h
 create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-pcs-aon-v10.h
 create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-pcs-usb-v10.h
 create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-pcs-v10.h
 create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-qserdes-com-v10.h
 create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-qserdes-txrx-v10.h

-- 
2.34.1


