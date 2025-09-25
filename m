Return-Path: <linux-usb+bounces-28629-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 36A2BB9CED8
	for <lists+linux-usb@lfdr.de>; Thu, 25 Sep 2025 02:52:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id ED738327E65
	for <lists+linux-usb@lfdr.de>; Thu, 25 Sep 2025 00:52:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 465EF2D8DB0;
	Thu, 25 Sep 2025 00:52:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Mw1Y/hgf"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39A79266B56
	for <linux-usb@vger.kernel.org>; Thu, 25 Sep 2025 00:52:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758761556; cv=none; b=M4cxOpfBa1/7eN5NCx59DWcww9HkS9ZQaNROB+W4BA+Aob3Xqu+YKMTqEYVW+JUwBdU4ooWmxJEdF0c7BjSt/dX/nFffTov9e5su6YTU3BjbFLIfona0euy8akbu8jIm2FRNMgOE+S8nUJozMOINPrxnpW7HQ6R53FARKz6ycAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758761556; c=relaxed/simple;
	bh=JO369MGgGMk171xFRwjVqeRFJxDWky0ek+7VCvbF/so=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=jKFO55DA9Ys3/SH7gBm80FnjO4tWH1aotVlK0pS7KCd2jIbnk34wempwt313nvHMGEwNzpCAfNP+wrU7/Sb7zJETg4HdjtYoKzwKbWhBGYDf3/RYpfJTr7DGue4TwvsJugwK7SNjTKppSmbwuZvr5uesd0o+Zn6ASj7Y962Ibww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Mw1Y/hgf; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58ODkrj7001919
	for <linux-usb@vger.kernel.org>; Thu, 25 Sep 2025 00:52:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=nzXyVD9qAsVJZyPhyB0idDDfhpNBSjuyVh5
	MWcnszg0=; b=Mw1Y/hgfaRAUkNXuOLfG7N7fIOCYu0rN60W2g9HeVeH5DOjqemO
	vIVohzMTSOktedDH3VYOOiyYQ+Kx1CSK4aa1BFd4DCXfj7Qn4n0gMyQrep73EYmm
	+faT+2rAFgABGGk97TaWprDY4217dPvwAvYIR/qAnlV4dNd3Oec4ZU6PmhGYXa3e
	sMDGE2AabTpWyb1P3L3MS2le6rg9Q0CaIa31V+kc2rQOD0APEGJuBZW9iFusTzXF
	IacOhwmncFpauac6FoCCvnD4xApAc4LNaiSK4mcyt91DdJPEYj5U6Fx59zVQDeCN
	wrOAjeBqsyf122XE1hPWCo0OIPcmFk2NZng==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 499k98p7qg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Thu, 25 Sep 2025 00:52:34 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-277f0ea6fc6so6336165ad.2
        for <linux-usb@vger.kernel.org>; Wed, 24 Sep 2025 17:52:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758761553; x=1759366353;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nzXyVD9qAsVJZyPhyB0idDDfhpNBSjuyVh5MWcnszg0=;
        b=JcXwd5p2Wv0dRoNgtE/PQu8AAMKwd+9gfB9F4ARc11kFoBUJYMfh4fhIMPCXd7F1Lc
         Q9ljd9XRnWm9xpsMCeiGQnnKvkqifFPYv+gasdwu/m01INUkwQVX4usRIXVhQp7Ve8yL
         EIPMYOJ3bzXH2HOWbAorZ8I3KWr6Us3SIa/E4tnKNNYRcIH9tykxQQpNPqNV6NCB7HcW
         pTdDghOiU1LiWAz4fbRoVytnbPQg7kjYu2FfnCmJJismslr7q749s5JJfeNZckH8A5T9
         WNycGV7MAuXO55JyQ9kt7jaefHhjnFrh8Pb0UZpRbJXI9nTfUU84YD39U0IyOUJN6+0E
         CUtA==
X-Forwarded-Encrypted: i=1; AJvYcCXJKQ2qpX6mid10GvvyJKaVcwM1PkY8k6fsO1HKorkZFkF9vzbnlFXxc1x3QELgrmc2KU321TxqL64=@vger.kernel.org
X-Gm-Message-State: AOJu0YwK4FfzlLtUX5gcjE27KLjhgau/ui1NPj08ywBN5LRwY3BkYqgN
	/8RFN1fEeJ5fqyENUkIdoaeRECQ6M5Q37beMJQS8+vq7dGXnjsGxO6DNKXtmZAnT2vj58OwHvO+
	pjikS5amHARibBY4lhxJ8MWwUEAygp6De4xQBDwf6RubFShEHPZt/LeHwQiuVS/4=
X-Gm-Gg: ASbGncunRdcMghPTxmjYvOwexAFdheTljrmOz9BQEZD40pYMn6WomvtEtwWEG0Fg2n9
	orLTP26T5zdXGkH2YrJzNBt2+2OKSnnczREG0TBxYWDQBkqsNcqTAbiL6h/w3HANHQY63kyAkHA
	4oviOEIJNCLYXBQ01H+v7gVWPV47AadxUAwNWzhV4PO3anesrkLJ2YiPzzIFT04c6QeAqxjF6dP
	G+elNhryE2189BKp3rT2PEup4XfSR0hzqi+wcyNq8b6IG2loK+OF1+k2zOOAGF7GP25UK8J032v
	2yYl4s2etMV3zoc4GLyQK8mCbhah6DRKRGWfbvVCMJNrNryAlgWR2a2nP1E0VwMAHWV+VEb3+zo
	aRA+3X1SRr9AvFhVO
X-Received: by 2002:a17:902:d60f:b0:267:cdc8:b30b with SMTP id d9443c01a7336-27ed4a873c8mr14727415ad.53.1758761552793;
        Wed, 24 Sep 2025 17:52:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHZb/eqow/4MDtfwG0wirrD5pVGj+rZTu8owWBw6yjQmbqpouZLqrvcXW52IQPKF2b9fRjZOw==
X-Received: by 2002:a17:902:d60f:b0:267:cdc8:b30b with SMTP id d9443c01a7336-27ed4a873c8mr14727135ad.53.1758761552307;
        Wed, 24 Sep 2025 17:52:32 -0700 (PDT)
Received: from hu-wcheng-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-27ed6ac27d4sm5238105ad.135.2025.09.24.17.52.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 17:52:31 -0700 (PDT)
From: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
To: krzk+dt@kernel.org, conor+dt@kernel.org, dmitry.baryshkov@oss.qualcomm.com,
        kishon@kernel.org, vkoul@kernel.org, gregkh@linuxfoundation.org,
        robh@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>
Subject: [PATCH v2 00/10] Introduce Glymur USB support
Date: Wed, 24 Sep 2025 17:52:18 -0700
Message-Id: <20250925005228.4035927-1-wesley.cheng@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: TTuJYEo0Og803VYE8o9TjmrhJOrd6e4C
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDAxOCBTYWx0ZWRfXxQmM6OYoWpEC
 fJ96Zzn7VsPA+fy4I795nu8raFcKr72bsPKmnFeElXF0pt5ue2oR7KtbokCOsq6C1Fyv8mP+rOH
 Bp76+U1fFY2bPZEUhZlaAuxs4ucRpTk5XkE024HCUFHLqgm8TWsVaIcTS7e/3HlyxReEZ2QU+Ni
 rR9UBb6Yut3ARW1bgfJ3RtBdt8YY+IQV34tRZMqpIGo95RmfUHHlp7TUWBNng+qn5gcQQMxDhqH
 6tIhSOqcPSaXsCtw0PoykgN6s/v1QBbvViQiXHvkGPjSyqBVlRoz8ix8j/rm1wfxHDH+HIE8SXc
 Ihv7sYlM+lewOFi3EL6quearXQAcDgM+rW/V7A+G+XdbDIgGuXK/g+sgbhKjLMcKNhLL0NVApJS
 z7xiJuLY
X-Proofpoint-ORIG-GUID: TTuJYEo0Og803VYE8o9TjmrhJOrd6e4C
X-Authority-Analysis: v=2.4 cv=Dp1W+H/+ c=1 sm=1 tr=0 ts=68d49252 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=yJojWOMRYYMA:10 a=uF0vjx2ZuONpqyvErPEA:9 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_07,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 adultscore=0 bulkscore=0 impostorscore=0
 phishscore=0 spamscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509200018

This series enables the PHY level changes that are required to support
the type C based controllers and the multiport controller.  The typeC
ports utilize a usb43dp based QMP PHY for the SSUSB path, while using
the M31 eUSB2 PHY for the HSUSB path.  For the multiport controller,
it will utilize two QMP UNI PHYs for the SSUSB path, and two M31 eUSB2
PHYs for the HSUSB path.

-----
Changes in v2:
- Updated QMP combo PHY to properly handle the refgen-supply and to
remove the primary core reference/tag
- Updated QMP UNI PHY to properly handle the refgen-supply and added
a separate IF/THEN block to handle the new clkref
- Updated M31 eUSB2 to make clocks and clocks-name required for sm8750
and optional for Glymur
- Fixed missing PCS MISC table
- Added SMB2370 repeater changes

Wesley Cheng (10):
  dt-bindings: phy: qcom,sc8280xp-qmp-usb43dp-phy: Add Glymur compatible
  dt-bindings: phy: qcom,qmp-usb: Add Glymur USB UNI PHY compatible
  dt-bindings: phy: qcom-m31-eusb2: Add Glymur compatible
  dt-bindings: usb: qcom,snps-dwc3: Add Glymur compatible
  dt-bindings: phy: qcom,snps-eusb2-repeater: Add SMB2370 compatible
  phy: qualcomm: Update the QMP clamp register for V6
  phy: qualcomm: qmp-combo: Update QMP PHY with Glymur settings
  phy: qualcomm: qmp-usb: Add support for Glymur USB UNI PHY
  phy: qualcomm: m31-eusb2: Make clkref an optional resource
  phy: qualcomm: eusb2-repeater: Add SMB2370 eUSB2 repeater support

 .../bindings/phy/qcom,m31-eusb2-phy.yaml      |  21 +-
 .../phy/qcom,sc8280xp-qmp-usb3-uni-phy.yaml   |  35 +
 .../phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml    |  19 +-
 .../phy/qcom,snps-eusb2-repeater.yaml         |   1 +
 .../bindings/usb/qcom,snps-dwc3.yaml          |  26 +
 .../phy/qualcomm/phy-qcom-eusb2-repeater.c    |  18 +
 drivers/phy/qualcomm/phy-qcom-m31-eusb2.c     |   2 +-
 drivers/phy/qualcomm/phy-qcom-qmp-combo.c     | 349 +++++++++-
 .../phy/qualcomm/phy-qcom-qmp-pcs-aon-v6.h    |  12 +
 .../phy/qualcomm/phy-qcom-qmp-pcs-aon-v8.h    |  17 +
 .../phy/qualcomm/phy-qcom-qmp-pcs-misc-v5.h   |  12 +
 .../qualcomm/phy-qcom-qmp-qserdes-lalb-v8.h   | 639 ++++++++++++++++++
 drivers/phy/qualcomm/phy-qcom-qmp-usb.c       | 163 +++++
 .../phy/qualcomm/phy-qcom-qmp-usb43-pcs-v8.h  |  33 +
 .../phy-qcom-qmp-usb43-qserdes-com-v8.h       | 224 ++++++
 drivers/phy/qualcomm/phy-qcom-qmp.h           |   4 +
 16 files changed, 1562 insertions(+), 13 deletions(-)
 create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-pcs-aon-v6.h
 create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-pcs-aon-v8.h
 create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-pcs-misc-v5.h
 create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-qserdes-lalb-v8.h
 create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-usb43-pcs-v8.h
 create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-usb43-qserdes-com-v8.h


