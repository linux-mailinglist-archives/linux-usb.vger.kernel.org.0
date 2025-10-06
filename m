Return-Path: <linux-usb+bounces-28924-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 44F17BBFAD4
	for <lists+linux-usb@lfdr.de>; Tue, 07 Oct 2025 00:22:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D94193C58FA
	for <lists+linux-usb@lfdr.de>; Mon,  6 Oct 2025 22:21:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3AD072D0629;
	Mon,  6 Oct 2025 22:20:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DYS9EGDO"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BF221DE8B5
	for <linux-usb@vger.kernel.org>; Mon,  6 Oct 2025 22:20:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759789219; cv=none; b=UdZy/NQU2YKqVSOnTZBaZm2zoGNW3UbJ5oH6kLXxaI1PfH8aBs1AMj2SXLHvPexszEhiFoTj9CJW9yUbCiOMbLWrikxi6ea5wrxl+deP4iApHd0C2Ie9/w6UTNANiom1zNc4l58kXbMWYjPXweZGiICHptp2VzgCTvtmlpgE4Tw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759789219; c=relaxed/simple;
	bh=jYbMkukNfUrVsrOi8oI9ZoTQ53vpsVBeUKRkto04Vyw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=XltJH9HeHbBbfVWIQbMAewyOirRsWURXVd9ke8t26ccKj+YG27ZgclYzpw3s3SVEp0ZudPIVfIKcBzK99ahFCp2D3j1X6ydylSlUxIqOWVsJ6Ttuo4KthNMDuUaqqA7ezV+chNHJnN3fSAZipKGfQLKa3si8hziADy5nzR9qFDM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DYS9EGDO; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 596F1PxG031750
	for <linux-usb@vger.kernel.org>; Mon, 6 Oct 2025 22:20:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=RGKF86TVDvAKv1fL1H0rAgmHc9LmQpxf1z8
	wB1amINA=; b=DYS9EGDOyjSCwLQjSssmFxKbQIh9+ybfQfPcqOrjrwn+/jVzKgP
	3p50a0MWkA5UDhy+24Woqz9K49yby4sm1uJ8xkh0UC1LjKa5PqpoywU2R3i6HKM5
	HuDKOicvCkDj7M36DOuBfKnoUxYV6jf9a5Tfk1ysf3gO/cS89taA1sSiXLM1rurq
	Y1ZJKE/uGP5HgB2EAmlLtyevh+BLl7+DC7u3E6vr/kdOIO+Ul7szYvTDhd4O69UZ
	Y9Rm+JGIBABOS2enF3KIZUVY7n75koOkPC2YoaLyvCvPYOZHzohb5LFZ+MlN9IoM
	fMimOQI5iFsccSGnTZTVMQw6LooSQybtrcw==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49jvv7n8wm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Mon, 06 Oct 2025 22:20:07 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-76e2ea9366aso4522971b3a.2
        for <linux-usb@vger.kernel.org>; Mon, 06 Oct 2025 15:20:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759789207; x=1760394007;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RGKF86TVDvAKv1fL1H0rAgmHc9LmQpxf1z8wB1amINA=;
        b=GBvT0r7s2ttMqUwMvLCTde+K7wxg6Sigy+MV22ZT/KDtWHQQQ7CQMQVZ3WBju6Yidn
         c9DBpdPcgl8uWJhdI+yH+PbnrcecNy7uZ0fCMi8vwGQP6WDhSBo1YdT71iqc3f+hHv2i
         MCmOpfOndotHfahVVa8a+nQofgfpN1p5p89VBfy+siKRM9FeLEtiyHRwQ3j5b3np+9B4
         OAHI5CbpYvEhoCr5fqM5QzrvxTr7ejr/Ef8tWl/3OqU4DtJdjh8Nt2PC6xcIwEQ51usH
         n23Wpox13S2HirraOAOhil4sPfpLvGrzySKI5iwTA1jEh8Q++qzWcBb4ptG3VYf/xpmx
         GECg==
X-Forwarded-Encrypted: i=1; AJvYcCWgggQIiP5KNHsnwpuqaDS6Rcm7fE7yJRlknEiVWUYiJWwRMLOwiYNkhzfOToE93aXDhfRlHX1Hm0o=@vger.kernel.org
X-Gm-Message-State: AOJu0YzkfnaOga8/PFBQXKg+1ey3UhiDdMQ4PV0AVv678gI5hw9gNT1C
	5REXj+2g+Jd/EslVGIbAibmEX9JOyMjCLKvecrTjycmcgE97Jw3cj5N0b2mTx0XrMQZjKqB7Tgb
	NgDlyyAhWODMgP5K/RPCsssKvdhCaAXRY/E6TJowSUEK4L4w1rgvuRDX8pkqEaGA=
X-Gm-Gg: ASbGnctIl94FqqzV+55S4u9rxjBxMTBWu1cR6Leaq/gZVHsDd6tv9FSc5o8hXO/+86s
	D2LtAb0FqpoxuSUrWo94nqBKQF56C+Fj3z6tl3cWjMut6K8ZYPOR0RTXIzUPJfbk3kEdnZUxrDf
	BfhZRe5o2ZUejrz/l2O3lEHFlv6GFmMtoeof0ffQ16Za/6Knk8vB7L2JuG6FA+61gvwQDPUGpYd
	4myb/6xvinS0y48U1YQUI7AXleLZzfYjrTtIRhQ/rUrHf1/EyjNST+l9EZ0mSmppSAgQc/tKjfa
	33CIDDW7J9zKLYOfYMh7qE64piTVrMVAvK0VLsE1U3D7xGpgtXXBAG7VBgKeo/9KCttD1TmgZXy
	sr4CAi7JeA9fEXvq/oo8P7g==
X-Received: by 2002:a05:6a00:84a:b0:781:d21e:136f with SMTP id d2e1a72fcca58-78c98deac4cmr16335598b3a.26.1759789206898;
        Mon, 06 Oct 2025 15:20:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEKfPsN6sUhqkQtc17HeV3fxUqq2CQHTosBe9Ogh+oYvS7dvTA1+fvWCJRnPz3xcYUrQk7a/g==
X-Received: by 2002:a05:6a00:84a:b0:781:d21e:136f with SMTP id d2e1a72fcca58-78c98deac4cmr16335560b3a.26.1759789206391;
        Mon, 06 Oct 2025 15:20:06 -0700 (PDT)
Received: from hu-wcheng-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-78b01fb281bsm13734968b3a.37.2025.10.06.15.20.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Oct 2025 15:20:05 -0700 (PDT)
From: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
To: krzk+dt@kernel.org, conor+dt@kernel.org, konrad.dybcio@oss.qualcomm.com,
        dmitry.baryshkov@oss.qualcomm.com, kishon@kernel.org, vkoul@kernel.org,
        gregkh@linuxfoundation.org, robh@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>
Subject: [PATCH v5 00/10] Introduce Glymur USB support
Date: Mon,  6 Oct 2025 15:19:52 -0700
Message-Id: <20251006222002.2182777-1-wesley.cheng@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA0MDAzNyBTYWx0ZWRfX3z3AXC60EaaK
 EUJ/qH9TLy/dyWSWEdXGwUIHWS+WfOqWF2IoJcc/9YC71BKI9lxbrMYdiqk/Y43GlAmV6alra5S
 nvEsCpHr9xgJfvin82D+haEfHVR4bDgwbCKzJ1yaQShBkg9eulvPlFf9KY7NGhIdjnAFdA/oK/t
 yw9zWAU/vNeh9czQnV/RaFHp8ukHjiAhYzgwhIdh4rltwupNKvCFDeugy5T+Z+DhpClhiai2D5k
 Qb4mrzGh/y42LdpdBaVnxpt+nAmeDK4VzpBH+yEvDxqURbSoTMGLMBzArhq1LIMy6PGumXVqgzZ
 YeCDxsftrqIZo4EyC0f+CDdHSzLkd2VOXTkx0logcdC0TAi6Lp745paSIdLk8nvouuWH2yWisBS
 81qYu+pjX9iioT/df/OxsTO2jDST3Q==
X-Proofpoint-ORIG-GUID: j5pfc5ODk5ZxVO_leoM-_kmHEGnyfjFb
X-Authority-Analysis: v=2.4 cv=WIdyn3sR c=1 sm=1 tr=0 ts=68e44097 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=x6icFKpwvdMA:10 a=K6vXddHitPicjvNs8NYA:9 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-GUID: j5pfc5ODk5ZxVO_leoM-_kmHEGnyfjFb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-06_06,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 priorityscore=1501 impostorscore=0 malwarescore=0
 bulkscore=0 spamscore=0 adultscore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2510040037

This series enables the PHY level changes that are required to support
the type C based controllers and the multiport controller.  The typeC
ports utilize a usb43dp based QMP PHY for the SSUSB path, while using
the M31 eUSB2 PHY for the HSUSB path.  For the multiport controller,
it will utilize two QMP UNI PHYs for the SSUSB path, and two M31 eUSB2
PHYs for the HSUSB path.

-----
Changes in v5:
- Moved phy-qcom-qmp-usb43-pcs-v8.h into USB specific QMP driver
- Fixed DT bindings for clock properties for QMP combo PHY

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
 .../phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml    |  72 +-
 .../phy/qcom,snps-eusb2-repeater.yaml         |   1 +
 .../bindings/usb/qcom,snps-dwc3.yaml          |  26 +
 .../phy/qualcomm/phy-qcom-eusb2-repeater.c    |  18 +
 drivers/phy/qualcomm/phy-qcom-m31-eusb2.c     |   2 +-
 drivers/phy/qualcomm/phy-qcom-qmp-combo.c     | 352 +++++++++-
 .../phy/qualcomm/phy-qcom-qmp-pcs-aon-v6.h    |  12 +
 .../phy/qualcomm/phy-qcom-qmp-pcs-aon-v8.h    |  17 +
 .../phy/qualcomm/phy-qcom-qmp-pcs-misc-v5.h   |  12 +
 .../phy/qualcomm/phy-qcom-qmp-pcs-misc-v8.h   |  12 +
 .../qualcomm/phy-qcom-qmp-qserdes-lalb-v8.h   | 639 ++++++++++++++++++
 drivers/phy/qualcomm/phy-qcom-qmp-usb.c       | 163 +++++
 .../phy/qualcomm/phy-qcom-qmp-usb43-pcs-v8.h  |  33 +
 .../phy-qcom-qmp-usb43-qserdes-com-v8.h       | 224 ++++++
 drivers/phy/qualcomm/phy-qcom-qmp.h           |   2 +
 17 files changed, 1622 insertions(+), 19 deletions(-)
 create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-pcs-aon-v6.h
 create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-pcs-aon-v8.h
 create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-pcs-misc-v5.h
 create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-pcs-misc-v8.h
 create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-qserdes-lalb-v8.h
 create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-usb43-pcs-v8.h
 create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-usb43-qserdes-com-v8.h


