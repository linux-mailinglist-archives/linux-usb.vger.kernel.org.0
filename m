Return-Path: <linux-usb+bounces-28624-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C43DB9C9CF
	for <lists+linux-usb@lfdr.de>; Thu, 25 Sep 2025 01:35:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D4607382B3B
	for <lists+linux-usb@lfdr.de>; Wed, 24 Sep 2025 23:35:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 91F922BD035;
	Wed, 24 Sep 2025 23:35:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="f7mGMPGI"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85DC729C35A
	for <linux-usb@vger.kernel.org>; Wed, 24 Sep 2025 23:35:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758756911; cv=none; b=grCymL4VMpiU86MwvOG8lj+pVxim7ZxbKeaSOvAP0a173dWLDrSR0QmGDfuLFFnfab36707rpefo8cH7DaD6uSn+BNUyJFEKJMQVbj7VYgJdQFXFWzdpAZZUOLgpeP49bjorN45C3koHjf+gnlksJCKCjp/mBnd8fPWC12tzrnc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758756911; c=relaxed/simple;
	bh=Rl9KTMUdwIiYEMdOtiL5Lii1gIrVj4sbsfGYlSZOYFg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=O0rog9OwyWETwaRufDnsaDkkNyWmkfsnHyBqG4Qnl1bc3tJfcmcTwEmRdkTK7oGSnnewCpAUn4qg+NnzTbJ6rLrQG9U7uoHRs2C+uvYgxcQ60FKKtvr5tFwUpaYpdpUWXkpgOZmNDig7OyQy7K5vKqdC6RyuXF/kjC0yVCdjQBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=f7mGMPGI; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58OCu4QF018033
	for <linux-usb@vger.kernel.org>; Wed, 24 Sep 2025 23:35:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=N1NPRqXSWps5+W1iMU6uaU
	9WzkrfYOwTW1b50gNguWo=; b=f7mGMPGI8o7JG+1U9WjHfi+SVLO2QmqTtNWPjg
	ocknAV12ykmsvYsFBjl7Os8bVaGYGYL4FqVEXdE2Skkvo9p/wbm+C4v7EBcNuqxK
	ERicRIkcJCkUrn1ICDwUSMz8EpFudDjvV9D6Z+mmKYhPbpSpDu1qQj+VsXfV12cy
	PJfynzjYDTsFWxofhiPSaodMbuQBquH80+d6XHu7oojnKbmyCo8v64a2SoKnCcfr
	2oqzJLtn9/RtTWamjuGPkSzh5RfEB6RJQJR2zqqFdc13djLPe+nuf2Y/lzYOLh65
	ZRpo0Tly1UoBqSyevAnArmpBeGiTdH4Rq5qcyeijyF6rb5qw==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49b3kka0p0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Wed, 24 Sep 2025 23:35:08 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-77df7f0d7a3so322465b3a.2
        for <linux-usb@vger.kernel.org>; Wed, 24 Sep 2025 16:35:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758756907; x=1759361707;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=N1NPRqXSWps5+W1iMU6uaU9WzkrfYOwTW1b50gNguWo=;
        b=nOd9ynoHItvV+t9j6CjKCZl9po3jgjJm38IXpn6//J73hXIX9sTQe+oxwXFbstuSbp
         dAFR6DOLjf2lV3kyCtO7gBLpyP82yZC5RE11r8smQwks5khnuCsl67u2qmHddjsgC5w0
         iTPdsavofa1Gzwbu2HiTzsNi3mlqIAqtktWQljb3tZLIjlzldSTa97yNyp5EHerOif6L
         kauQefUHuSLznV5lSZ2/F658RIwL1CX8Tm/rgtuExJVNLpn6EbtzVjoQdUd9PBOYwNzD
         OIuVHwDaQV3y9f3XrFMJu+WgecoKlE8KLZQTPz/XVncZNMRSB4OOFWNGSjHWcRO4zGGW
         LCvA==
X-Forwarded-Encrypted: i=1; AJvYcCWEkBwc2kjEzper55QtJdiQZvJAQ22Xn8mAhhB5gd1F1Kf3W9TwlQWWn+thkLQxf+YRLFXhdlK63Ds=@vger.kernel.org
X-Gm-Message-State: AOJu0YxGbU07V405CJeak7N1et9OL/elBgTl9ZaB6W1qcg0c9etvYgI5
	5cecBnPA0869lWWp0GOnHXkna2jreiGWvlXh/WTu0qvL2ONyDETyZ1I191vYFxIkbkGcdmjvkai
	6mWoDQ2cQgFW9zmp+tLLX651sousp7NoMN1gooTWC80k0OxMnbktifWQiO2w83RU=
X-Gm-Gg: ASbGncvqGLhfaas0kCDCCHQUWG6TAOMfg7Jws3MamGUMCDGZmAYdKunqwx+Z3Jnuhoz
	vJtDTx/r/UVFmIMXOaZUKZiStIiZNNLv45dMKQLpeKiP2XOS/y/lCrOEyUrR+43vaGMeQIjU6bh
	GQwidkG54/ecJB6j8StGm+LYVm7s58+h30n4tetH3ujqkTFDEHVMg+vVFRyAN2/xe1TxzvADMFr
	J9J+GPenWQ9nAESKDNiwXMrUQEownWnnmtGL/0rm7zvtV/8Ydqm47kTSC64HcOngvBjkcAEABuh
	YIHUhWtINNtlbxZ5NuDasBWXhesY4t4aEbHF4E6p2IroxZUODldueQ0e1+W/d2Ri+eQT9YSG8KK
	/C0cq/bksmHNdbqw=
X-Received: by 2002:a05:6a00:2386:b0:77f:5048:8a8c with SMTP id d2e1a72fcca58-780fcf1f200mr1705539b3a.28.1758756907088;
        Wed, 24 Sep 2025 16:35:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHvPHLLLfcrAguV8dm/AHzS45EMx+5sChl6etbTWkhwR118b19qGtwnriyiyE7t/rKeIdvbWQ==
X-Received: by 2002:a05:6a00:2386:b0:77f:5048:8a8c with SMTP id d2e1a72fcca58-780fcf1f200mr1705521b3a.28.1758756906641;
        Wed, 24 Sep 2025 16:35:06 -0700 (PDT)
Received: from hu-jingyw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7810238e9a9sm212379b3a.15.2025.09.24.16.35.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 16:35:06 -0700 (PDT)
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Subject: [PATCH 0/4] phy: qcom: Introduce USB support for Kaanapali
Date: Wed, 24 Sep 2025 16:34:53 -0700
Message-Id: <20250924-knp-usb-v1-0-48bf9fbcc546@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAB2A1GgC/y2NywrCQAxFf6Vk7cCkIkz9FXExj2iDONakLULpv
 5uWLg+ce+4CSsKkcG0WEJpZ+VMN8NRA7mN9kuNiDK1vL77D4F51cJMmF9CXfA7UYUEwexB68G8
 v3e7GKSq5JLHmftu/o44khyj0nexpPOx1/QNkpeMjhwAAAA==
To: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        Ronak Vijay Raheja <ronak.raheja@oss.qualcomm.com>,
        Melody Olvera <melody.olvera@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-99b12
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758756905; l=1256;
 i=jingyi.wang@oss.qualcomm.com; s=20250911; h=from:subject:message-id;
 bh=Rl9KTMUdwIiYEMdOtiL5Lii1gIrVj4sbsfGYlSZOYFg=;
 b=B2o2Pfld+/1LcRIUb8MooBDPIU7mPswCsw3Py/cKadOg7yq2h5g5I/1Uux6fJQDvlvLxO1rx5
 nLk/HHSI2UaBx5sMRoIBsi2K3jiany4XakCAlndBN//foxlslCIJW55
X-Developer-Key: i=jingyi.wang@oss.qualcomm.com; a=ed25519;
 pk=PSoHZ6KbUss3IW8FPRVMHMK0Jkkr/jV347mBYJO3iLo=
X-Proofpoint-GUID: YuMmcJOR9iJ1y71sXLYRMe9f7tcdSArb
X-Proofpoint-ORIG-GUID: YuMmcJOR9iJ1y71sXLYRMe9f7tcdSArb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIyMDA4OSBTYWx0ZWRfX8d9DHohNDp6W
 pNDtDxgfBcD/htQ/kuDlFUoN2J4hA+yF0ZHot4pUFNr77jMG2pkyFlMucFlhuLQSG6CZPlxnj98
 nXSqD3bt+CP4vRzE+JOXOYsn/sMPMkbXls4/XPjgWTO03k24vIXCPDaFivhOZoGwudWb7BW9SQf
 nF1m1dlu7PmkRzCvFTdMjDf1+14W/CWcdWCIuBGZyOFQlyFsToIhuTbQna6H3D0mzaY4N4AtFop
 h7OeNNXvT9IuIOaz6SBk60SyCL4HhKsFbXJuymO6Iw9BddXKikQtZx7JDQF4xVuH1szwF3MQTfV
 Zfb8NHV/VmS7mFljBtj/Kny4DiYAPWF9RWcrf4xLpT1Y/PzavUdKZMZszScXlbdELQKgcLOYVxr
 uZvyNT+v
X-Authority-Analysis: v=2.4 cv=BabY0qt2 c=1 sm=1 tr=0 ts=68d4802c cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=751tZ-0Qz6C-U5i-0qsA:9 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_07,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1011 phishscore=0 bulkscore=0 priorityscore=1501
 adultscore=0 malwarescore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509220089

Add support for the PHYs and controllers used for USB on Kaanapali SoCs.

The usb function depends on:
https://lore.kernel.org/all/20250920032158.242725-1-wesley.cheng@oss.qualcomm.com/T/#mb2e1260cf266638a56c04bc793f5fe9ed1b3b79d
patch 4 was picked from:
https://lore.kernel.org/linux-usb/20250527-sm8750_usb_master-v6-10-d58de3b41d34@oss.qualcomm.com/

Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
---
Melody Olvera (1):
      arm64: defconfig: Add M31 eUSB2 PHY config

Ronak Raheja (1):
      dt-bindings: usb: qcom,snps-dwc3: Add Kaanapali compatible

Ronak Vijay Raheja (2):
      dt-bindings: phy: qcom,sc8280xp-qmp-usb43dp-phy: Add Kaanapali QMP PHY
      dt-bindings: phy: qcom,m31-eusb2-phy: Document M31 eUSB2 PHY for Kaanapali

 .../bindings/phy/qcom,m31-eusb2-phy.yaml           |  6 ++-
 .../phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml         | 54 ++++++++++++----------
 .../devicetree/bindings/usb/qcom,snps-dwc3.yaml    |  3 ++
 arch/arm64/configs/defconfig                       |  1 +
 4 files changed, 39 insertions(+), 25 deletions(-)
---
base-commit: ae2d20002576d2893ecaff25db3d7ef9190ac0b6
change-id: 20250918-knp-usb-810dc38e91d1

Best regards,
-- 
Jingyi Wang <jingyi.wang@oss.qualcomm.com>


