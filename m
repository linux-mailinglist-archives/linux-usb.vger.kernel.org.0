Return-Path: <linux-usb+bounces-28848-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 69F39BB1E8E
	for <lists+linux-usb@lfdr.de>; Thu, 02 Oct 2025 00:05:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 11E2E17DD28
	for <lists+linux-usb@lfdr.de>; Wed,  1 Oct 2025 22:05:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5122228641F;
	Wed,  1 Oct 2025 22:05:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ha4LZ4Fo"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 444FA145355
	for <linux-usb@vger.kernel.org>; Wed,  1 Oct 2025 22:05:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759356341; cv=none; b=FqiJFL5FplidLSB8M7ITvSg8sHrI3x52bb5W0Jai0ESGQY6qBR9S8NJVMhPhz8mGXVaVQOOhvIW/Jvl5+Mp0uJxil0kTer71/t5g5o145CsyoRjiSRXgSDkA9voh+azSowWfqxlDgCf2Pr5rLxOkpbqk5B/ZsuODEFdwXvJBWsk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759356341; c=relaxed/simple;
	bh=9QggdL6fGbd2hr3ymExV7iFJbMfOs4Ept9ZR40FEjLc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=F6mBz1BBAgJJkRFJ/01mYa17/8lGu5rgbPvYO41btYbfnH5GhlDK08y2yKmYdUO2i5rmrR3vXyV/OyizRJ+bjwpiP7tYME3C+AzQIPihF5BOkl+VDRJmNT8yp9UJ5EPKQ6EYWnbvQ61hyNqRr6dBnFs1706APtZ0yh+gPJM0kRU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ha4LZ4Fo; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 591Ic9au022671
	for <linux-usb@vger.kernel.org>; Wed, 1 Oct 2025 22:05:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=2E82fWMJs7/CltSb2bc3lU2woFhMHzKTAIE
	lMVu/z78=; b=Ha4LZ4Fo0k1WjYvzIlc8wzeiX+X4GqWVv0C6thmcID+Nq0QA75r
	pzWtGB7EkPKQenbLnSZHwxQRXQgwvR0ZgDu6FZjN1VEl7eAixHKkcd4P1j7neH2+
	BQ4s+7cdmNjRIon8dEmmVeVzo483QDFTCMqdVQQrgtU6E+GEg3t1uDPnYLmV6KYI
	+gE/bZrSv6A+6s5+Y11K3d5Q3LQXGgK11GtB0FBSKx/s02/LSRxv/fvwdhMqsjaJ
	ADTSOYEeoljVutvh2PRzdKuDJzFerz0pGLPzD9HbXZGE7Z/rI2DSaNxOzVzzFj7Y
	A4Zg9tp2HqHjFOhwPjn/qd0miBklQ7FEecg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e59n6bq2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Wed, 01 Oct 2025 22:05:38 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3352a336ee1so787383a91.0
        for <linux-usb@vger.kernel.org>; Wed, 01 Oct 2025 15:05:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759356338; x=1759961138;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2E82fWMJs7/CltSb2bc3lU2woFhMHzKTAIElMVu/z78=;
        b=ET78VfPvO5020KSy8u3Wkxh5DdnJtKSvFwLLf/Fjua4tAvnPzmcrnV0AYPfHbvyIEc
         zakkprLoR2EIG2d7oDmquaeeqm8i2Adj5mMiIaS9ffeyHWO7pPtxflVavNSqlZcxRGX8
         nIG8z7uuryeIUYoNvVDbMMdNBQOBoISl56uwSYhgjODQDWT0MfabSWyatb03kjc/S8To
         0iTCJXvVlvHE03hn8lLIv52pkbD6M6KihrAzG9lVviUd39YOPhaykK47z2WM8jN3AUV+
         TkmvbhfcX9olquMUfINT9evbCzMPDM0Hv6PE70QjYjrJ1C7B+nADDSteCzzF7T5u1Fuu
         Z+JQ==
X-Forwarded-Encrypted: i=1; AJvYcCXNjYfPorKnw/xRyEIujRC6rzl/OCD4ZeV2H3NM+VSDT1zrsdzT1sdtuyNRrSS7RvEaxsxhO4YOI74=@vger.kernel.org
X-Gm-Message-State: AOJu0YxfRCubItsA4uDoblwGZIAi9MHcSR2zK5dTdDNbBZq97Y0vmvB2
	TAsfxTWrpaUWRhP2VdAT12waQYnK0OmSGHwBzMlEA9OyBWsyID/y4mAFBafJs2PStHgGVIg41+C
	0uhQq6Vuz1TlD/B8QiZtxyuxV5AaJbWlbr9XwijDxdICS1ehVdyvjXjDSS/HZMTQ=
X-Gm-Gg: ASbGnctsV5ytFOR47PWnkDJSIG6eZM1Y//18oi0R+/mpiWdULjO/MHqvVtNPB29naWW
	yZYX6rUB2oWpYmTYA2qqJmSOYZJzj3FjGbx7OVRWWdWdMgf8UWtlG6K6vpetExOP+9xDkfWoE0k
	TMu/AmxlsllI9knRJZ4Eru6KjcbDHBqDQiKBN89xQ4/lC17uN1UuwrrsT4lhNq6wBe6KetfWAHJ
	RYF3j+4hx5hiYs59I/esZ02vQkzHAKublaeyo4Ao1s+3pF94XETdwia/7/0VnMUVSxaDA47CII9
	bSRhp1HFRl/oADzzMNqiFL0KBawZe++TPVFTSM6eUP8yfgS+0Nu32ZFH/53ZdNZlf/HLqwCdN/L
	CPaQcVMhy+lkJ06gd11b28g==
X-Received: by 2002:a17:90b:4a4f:b0:329:ed5b:ecd5 with SMTP id 98e67ed59e1d1-339a6f077fdmr5548822a91.19.1759356337578;
        Wed, 01 Oct 2025 15:05:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHpG0a+/1ddOhqZgj2PUQhFUXjO9C38MdvW9oBXkB4sjVIrrjyTq0zZe7rYuFj7BM7r6xga8w==
X-Received: by 2002:a17:90b:4a4f:b0:329:ed5b:ecd5 with SMTP id 98e67ed59e1d1-339a6f077fdmr5548793a91.19.1759356337055;
        Wed, 01 Oct 2025 15:05:37 -0700 (PDT)
Received: from hu-wcheng-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-339b4ea3c3dsm702085a91.5.2025.10.01.15.05.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Oct 2025 15:05:36 -0700 (PDT)
From: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
To: krzk+dt@kernel.org, conor+dt@kernel.org, konrad.dybcio@oss.qualcomm.com,
        dmitry.baryshkov@oss.qualcomm.com, kishon@kernel.org, vkoul@kernel.org,
        gregkh@linuxfoundation.org, robh@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>
Subject: [PATCH v4 00/10] Introduce Glymur USB support
Date: Wed,  1 Oct 2025 15:05:24 -0700
Message-Id: <20251001220534.3166401-1-wesley.cheng@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: ozMmP_vfREWCt09dFFnzMOr9t7QtyqTM
X-Authority-Analysis: v=2.4 cv=O4g0fR9W c=1 sm=1 tr=0 ts=68dda5b2 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=x6icFKpwvdMA:10 a=K6vXddHitPicjvNs8NYA:9 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: ozMmP_vfREWCt09dFFnzMOr9t7QtyqTM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDAwMSBTYWx0ZWRfX5sMQi0QMNEbM
 NU4tlLKVYL2z+POfCZawIxZC3HVAA6q/0HxCLwQ2pDtfEI57X0kswkvq0JXz5oL4z9JFT6XE/0l
 BjrjAincAB/2aJDeNGnpDLjow6MTbf5161eVJhP7Jb2EWtlW7CfspDkMOQv9eKjQHSKzyjxy/p+
 fE/7oItkjEq2pH959jB8RE9v7PaujqTAnvp+U7H4vTqQYW85oUdDCA75B5xtnGGDJLYKSRsOnMf
 KMfijAYInXRxwCWpr5n3LftIlUB+16RQHOvyjQB9Zaq+16iRa03U7ZljYFeVq3/dosq9EjHslr8
 Nj9Ye2zCtx73JrJd9xIbg2wjWdKCgXrKcfVS7eeJ5p2Mz7NCf5jlu7iE586oeMIvVZUkdlVRP3n
 bWJQ/8hA3OoF9bnyk+IhpH4ONwgjRw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-01_06,2025-09-29_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0
 spamscore=0 impostorscore=0 bulkscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509270001

This series enables the PHY level changes that are required to support
the type C based controllers and the multiport controller.  The typeC
ports utilize a usb43dp based QMP PHY for the SSUSB path, while using
the M31 eUSB2 PHY for the HSUSB path.  For the multiport controller,
it will utilize two QMP UNI PHYs for the SSUSB path, and two M31 eUSB2
PHYs for the HSUSB path.

-----
Changes in v4:
- Updated DT bindings change for QMP combo PHY to have IF/THEN blocks
to handle the newly added clkref, and fixed the commit message as well
- Added a new header with v8 offsets for the PCS MISC register set,
and refgen current load for the QMP combo PHY driver
- RE-added the headers for the QMP combo PHY

Changes in v3:
- Fixed some incorrect patch ordering.
- Alphabetized Glymur QMP settings for combo and UNI setting arrays

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
 .../phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml    |  76 ++-
 .../phy/qcom,snps-eusb2-repeater.yaml         |   1 +
 .../bindings/usb/qcom,snps-dwc3.yaml          |  26 +
 .../phy/qualcomm/phy-qcom-eusb2-repeater.c    |  18 +
 drivers/phy/qualcomm/phy-qcom-m31-eusb2.c     |   2 +-
 drivers/phy/qualcomm/phy-qcom-qmp-combo.c     | 350 +++++++++-
 .../phy/qualcomm/phy-qcom-qmp-pcs-aon-v6.h    |  12 +
 .../phy/qualcomm/phy-qcom-qmp-pcs-aon-v8.h    |  17 +
 .../phy/qualcomm/phy-qcom-qmp-pcs-misc-v5.h   |  12 +
 .../phy/qualcomm/phy-qcom-qmp-pcs-misc-v8.h   |  12 +
 .../qualcomm/phy-qcom-qmp-qserdes-lalb-v8.h   | 639 ++++++++++++++++++
 drivers/phy/qualcomm/phy-qcom-qmp-usb.c       | 163 +++++
 .../phy/qualcomm/phy-qcom-qmp-usb43-pcs-v8.h  |  33 +
 .../phy-qcom-qmp-usb43-qserdes-com-v8.h       | 224 ++++++
 drivers/phy/qualcomm/phy-qcom-qmp.h           |   4 +
 17 files changed, 1620 insertions(+), 25 deletions(-)
 create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-pcs-aon-v6.h
 create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-pcs-aon-v8.h
 create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-pcs-misc-v5.h
 create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-pcs-misc-v8.h
 create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-qserdes-lalb-v8.h
 create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-usb43-pcs-v8.h
 create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-usb43-qserdes-com-v8.h


