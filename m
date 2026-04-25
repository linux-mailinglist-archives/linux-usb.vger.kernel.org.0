Return-Path: <linux-usb+bounces-36478-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AEx6L4Fn7GkPYgAAu9opvQ
	(envelope-from <linux-usb+bounces-36478-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Sat, 25 Apr 2026 09:04:33 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 24A8446558A
	for <lists+linux-usb@lfdr.de>; Sat, 25 Apr 2026 09:04:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 80399304E31F
	for <lists+linux-usb@lfdr.de>; Sat, 25 Apr 2026 07:00:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 164A3322B6D;
	Sat, 25 Apr 2026 07:00:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lYpQeRo/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Db4ZPVd6"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC1BB1F192E
	for <linux-usb@vger.kernel.org>; Sat, 25 Apr 2026 07:00:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777100422; cv=none; b=oZN6hRqol1XIKrjDz3BUTi9q0LLagd1GGzC3t4ZH07L8EABasGDRR7J+m7jjW9tCuykgwVbWGnfC7amT0UGP4C5DavyTLU6t1C0ENRh+oEnKAeAfaOuyacPKWUpi+2rCnXzSaAdn9FKYnQdCoNqXSk/yLRorZ9VYNLz1IKjGFyA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777100422; c=relaxed/simple;
	bh=wp91t95lhjh15mikAKqw1dtodhywMRTjcp8qVMa9ghU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=I6+8MUwFt/+1YxHwL15oTRZg6fn7O6bymxPh51BJ8JWRxrF9LH9BNiF5KdP0Zf+AjxiUO0TfJ/aIV3iHEfg7rzXarzOCV0YHmjQvXzbH8Vm0f9LxYaV4jB42vuzyYWILciZVD2qCe6FjCQl8Vwyw/I2Dj99D3zvFgTQEftvsopg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lYpQeRo/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Db4ZPVd6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63P3N0cu207243
	for <linux-usb@vger.kernel.org>; Sat, 25 Apr 2026 07:00:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=u95S0dwADM496+fuZWR4w1DhE/LLWmP01tc
	nf4xUUdg=; b=lYpQeRo/gUlm/XZu5UEckjqsRJS3mZnBg+1THadc1l14reUD3yL
	kvo4aa1oLI2gKt2o4J2+i6J+vcZV3YHw9yI/AmYZl/4TS7kuINmKzSczsHujT9Lk
	6Z67i4LLnGIhQj9X8Fgci2/93oqqY3mZpbWDA3dTB0D2kp4jQ/VVKlt2IhEc4tiR
	5rTzahFD+3u/lPBqXHqcHEt1v3Wi2HO/Gq0CDTIcEiM0UN57+mRCzo5gb20apPjf
	hgYAvIPm+AAp8BPNjUAwSGLcWYv47P24ohgkeJ94nooge0qY5skngOqQjXxBRUd7
	keD+28d1IGYj8N7zdWLqVFRbdSIp7cc1AHQ==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4drnnf0bky-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Sat, 25 Apr 2026 07:00:13 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-12c66fdd4aeso13093083c88.0
        for <linux-usb@vger.kernel.org>; Sat, 25 Apr 2026 00:00:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777100412; x=1777705212; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=u95S0dwADM496+fuZWR4w1DhE/LLWmP01tcnf4xUUdg=;
        b=Db4ZPVd6YOA3SeUos4G27Mnl4mdLQKZ6JPG8KaaFfLtFkAZ61mN7/Sd98yd9dik7kU
         xgpO447pkmoj7ZhOSjz7VgRasgTdez6j70wOiYxCMwrkj7BRezLrn1R0j3e1syyW3Lfk
         RBCgadJSkCLCa6/ozQ3tl7d63LdI9x8DP6xKWIjCF1B3sF2qrHkVdddHy4lEwC1jxwck
         t/2d8CC42bY6am9Ikfn8H/Ksyal4SZmfXQ5KsArtnVOMOo/FVnWRjfJNzHfEJ0KzJACH
         RuykX1OmK/GD4LzDa/l3jmFHcR0m/zyIwMeBsAl8Odn9njG23JzUC6vniAnLl1orSTEX
         084g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777100412; x=1777705212;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u95S0dwADM496+fuZWR4w1DhE/LLWmP01tcnf4xUUdg=;
        b=rW0G5+bmolQ47oSzLKCfhuSUrmm6rDLPkofw6EU5uyHsbq2gEd6zOfuwaf1pilFj5h
         YQk6BeJNQSOPWsDwWfqovTf8T/0KeasmQc7z09RmvQgvv/cj+C+esRsFngc7dkSGhoRM
         2NqAH4aOG26hkPfA8tMnjOhxNqsQa8Mx5rWCt5y3tkBrIWCp0ou/MYnCIuw8+qdG+0RE
         Jo5zku+i7iX0vTvlcHCZKYqiT/uvMGwjxdH89FJhBRgq2mA4lJscC3o3Pfu2Vm0mQE5e
         ojD8NQicE2aypAQZlsLLnsTIfbrHMY45oY2IlCDIumhIGW2j970p+0lKxR2tbJn3C0hN
         BusQ==
X-Forwarded-Encrypted: i=1; AFNElJ9yEWeanqthoOw+TUSoQ20x9Hj9RgdQot5ROuGOjcyZC5PprHZ9xbPCrBX+uJohjVEDfthN+9+r2qE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwGIwkYZN/HpMY9dqUpvKOSxvmpwBvzQ+t+j54v/vXKVGo0cSIf
	k9x1PIjmDL9uvY7NLDu8mDw7wtgP/hs4FrJDWwqr6T+xr7ReMeaoj0ewzWjmb/BBFhivx6e5mOZ
	+Acj+hI/oxMdeNLGmeCYUL0iLFmdUKCfBHQiuUKNlycqZtEqq5yoALNFQEppkwCA=
X-Gm-Gg: AeBDieuXPZlf1Dye9XSQuCQ6f4W+C2DRREi0VEWhSQWvq9qPZ/l3/YAcSin8tPQ3YoA
	SUSV7zyFDUlmv+mHObM6a7rUigLlAbmMxb9gZGPibBTTha+4wvXPtds6rRfq/AcSV7124DqWI3D
	o/fKR3+3dbicIeCNIXgrAD4VhmqKCEYu2nGP+fonYJIRM69h5WA6IiMx8AgWtFRom7xoqH73DM2
	1TFH79tpOawxW3UGWtAojxPUjQIP6qeK09hqba3rvl6JFuwBFlJls0/I2HFuTuDHa0MxgZvRG8M
	kr76r3OGuqSxVIEAIDtfEKrLwJ/CjSRPvJVSlvx9A+sB0wTQ3/AI5BU5D7CVQZKccX6y3fZfLHA
	3M7J2yJc3EhH8yIPMxVojYfL6BEzuGwLuLwHBSzBiajB7ZIPQfnOsoVTRl5SyeVqGw/Nbx8lHFN
	+Jyaq62CXByA==
X-Received: by 2002:a05:7022:90a:b0:128:ceac:6db1 with SMTP id a92af1059eb24-12c73fa71demr16584844c88.28.1777100412460;
        Sat, 25 Apr 2026 00:00:12 -0700 (PDT)
X-Received: by 2002:a05:7022:90a:b0:128:ceac:6db1 with SMTP id a92af1059eb24-12c73fa71demr16584822c88.28.1777100411921;
        Sat, 25 Apr 2026 00:00:11 -0700 (PDT)
Received: from hu-rraheja-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12dc2dfad8csm9430630c88.3.2026.04.25.00.00.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Apr 2026 00:00:11 -0700 (PDT)
From: Ronak Raheja <ronak.raheja@oss.qualcomm.com>
To: vkoul@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, robh@kernel.org,
        neil.armstrong@linaro.org, gregkh@linuxfoundation.org
Cc: dmitry.baryshkov@oss.qualcomm.com, konrad.dybcio@oss.qualcomm.com,
        abel.vesa@oss.qualcomm.com, wesley.cheng@oss.qualcomm.com,
        ronak.raheja@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 0/4] phy: qcom: Introduce USB support for Hawi
Date: Fri, 24 Apr 2026 23:59:58 -0700
Message-Id: <20260425070002.348733-1-ronak.raheja@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: Sr2uLbDUECFbc-y8aIg_eQSU79ShEqj2
X-Authority-Analysis: v=2.4 cv=Y5rIdBeN c=1 sm=1 tr=0 ts=69ec667d cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=MeUEimlcFosfp0q7v7UA:9
 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-GUID: Sr2uLbDUECFbc-y8aIg_eQSU79ShEqj2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI1MDA2NSBTYWx0ZWRfX+0woZ6n8wxSk
 Nr4zAWWPlTlypnuBgpK3bMDnaLRz6kQXmzZkrwGDivuf03pctMRG58Vy5Nt/6R/mPvJN53Eh2u/
 k3BEI+88u7nQkQgEJY/xUzStLKH1OZOMGY4PSBgCfQK+YLDhG9FkFYgdzjXC0E3ons+g95mWfv+
 L2IISX4o8fsoPKKTBzF9mDHOpX/kG3rPx6oX7WhYvHD1zaD08ImJuMkJEy29VDBol5ab4Z6TfcV
 EokO6qetKL6fSR6Y3nVibcxjTIedO9qXL69K8o+NDvBgcFIVhcRT7Mc7WNBjxDgT9ofzDwAzPoj
 PHSvJx2YbMmvpO+fuQFkk0qJTEepUA0bBlEZT0tPLdpl6vxqZl9p+BPhzIPgEp1a1BHlUmMXMck
 V1knBhE8wpsPNE4IRHYvHFzwcsrhbF51F8uKQpCBDABYaOYNWiPmSYKNbn0N0wof4hyUJOf4RJ6
 DoHlC5PgP8HAhwIOqDg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-25_02,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 adultscore=0 clxscore=1011 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 suspectscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604250065
X-Rspamd-Queue-Id: 24A8446558A
X-Rspamd-Action: no action
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
	TAGGED_FROM(0.00)[bounces-36478-lists,linux-usb=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	RCPT_COUNT_TWELVE(0.00)[16];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]

This series adds USB PHY support for the Hawi SoC. It documents the
QMP USB3-DP combo PHY and M31 eUSB2 PHY bindings, adds the Hawi
compatible to the DWC3 USB binding, and adds the PHY initialization
sequences to the qmp-combo driver.

Ronak Raheja (4):
  dt-bindings: phy: qcom,sc8280xp-qmp-usb43dp-phy: Add Hawi QMP PHY
  dt-bindings: phy: qcom,m31-eusb2-phy: Document M31 eUSB2 PHY for Hawi
  dt-bindings: usb: qcom,snps-dwc3: Add Hawi compatible
  phy: qualcomm: qmp-combo: Add support for Hawi SoC

 .../bindings/phy/qcom,m31-eusb2-phy.yaml      |   1 +
 .../phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml    |   2 +
 .../bindings/usb/qcom,snps-dwc3.yaml          |   3 +
 .../phy/qualcomm/phy-qcom-qmp-com-aon-v10.h   |  15 ++
 drivers/phy/qualcomm/phy-qcom-qmp-combo.c     | 232 +++++++++++++++++-
 .../phy/qualcomm/phy-qcom-qmp-dp-phy-v10.h    |  15 ++
 .../phy/qualcomm/phy-qcom-qmp-pcs-aon-v10.h   |  13 +
 .../phy/qualcomm/phy-qcom-qmp-pcs-usb-v10.h   |  19 ++
 drivers/phy/qualcomm/phy-qcom-qmp-pcs-v10.h   |  34 +++
 .../qualcomm/phy-qcom-qmp-qserdes-com-v10.h   |  89 +++++++
 .../qualcomm/phy-qcom-qmp-qserdes-txrx-v10.h  |  89 +++++++
 drivers/phy/qualcomm/phy-qcom-qmp.h           |   5 +
 12 files changed, 513 insertions(+), 4 deletions(-)
 create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-com-aon-v10.h
 create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-dp-phy-v10.h
 create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-pcs-aon-v10.h
 create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-pcs-usb-v10.h
 create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-pcs-v10.h
 create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-qserdes-com-v10.h
 create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-qserdes-txrx-v10.h

-- 
2.34.1


