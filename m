Return-Path: <linux-usb+bounces-28627-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C06D9B9C9EE
	for <lists+linux-usb@lfdr.de>; Thu, 25 Sep 2025 01:35:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 875E13A4F40
	for <lists+linux-usb@lfdr.de>; Wed, 24 Sep 2025 23:35:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72C262BEFE3;
	Wed, 24 Sep 2025 23:35:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="X07ZGBNh"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE5452C0294
	for <linux-usb@vger.kernel.org>; Wed, 24 Sep 2025 23:35:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758756918; cv=none; b=d7hprW0OXElzeKiQcoNw9YUjvt97oEsn/yEON26V76PLcghkXbfmU3ecOBz+y4QI1fyJfPVlC2KOi3lbJpzFwXKD+KYz8fur+UanqDErtW/znCZShk2T/OdTKMkhb3rwj9LhCOWqQmqN2MlZRT376AOBm9PVfXuOe/BMU4pyNAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758756918; c=relaxed/simple;
	bh=Q7Y5sKrFJYAcd7JLFQleIjbeTi6scSpI9zSmmOVIXBE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Oyov4NOABbcPtmJhqapnKu9GIaJKnZSMYlVm0Wlcxp1he7Bt8fGiSozZUDMtjF2drvUZlUBaHZAZ3w5AminFbo+TMeBmNTP8271ZcTR6k8rY5Sa3FZkMur4f+6NtB0OFi8LHsmN9wnaCKm65HJX+cVoV9v4xGQv2RrNL1kMvAu0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=X07ZGBNh; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58OCdgma021486
	for <linux-usb@vger.kernel.org>; Wed, 24 Sep 2025 23:35:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QaWO9DEgDqVIwBTC8sgSyuuxsW+ioYv5Qng3RAcDRvY=; b=X07ZGBNhrkJS4Hfw
	hG9PrJmBLalpsAsTYTZwFlUwoy6qJc5mjZjhZoOq/b73ACt7C2QLh+shY1ijYTdQ
	Kk+6AVuaqCrIxJnyrkqm3Ape5SVp3ZZmUa/BEhQPEWOqnttXdZkkikb73tPuRIEt
	svuuBStU9+sgTRYVI2uiGhuCJ2lPw4l3ZyVJXCiLE+JoLOAmHo5HGWKvVBZgNQOu
	22aMbLxf5fzM55mYVbo//OPevCskz3au9EyJn07rrW8GgDiMiZap7ZrpgEm9q/b2
	etH6I+p4rPs4e+u3NsEkxtXcwsW0p7rY3IbnWvyXXFCI1y20prNa8DFlShQt/2/J
	I+OM1Q==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49budadkrg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Wed, 24 Sep 2025 23:35:15 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-77f2466eeb5so244327b3a.2
        for <linux-usb@vger.kernel.org>; Wed, 24 Sep 2025 16:35:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758756913; x=1759361713;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QaWO9DEgDqVIwBTC8sgSyuuxsW+ioYv5Qng3RAcDRvY=;
        b=vt/ApdPA34hsD8yjNcrfsGIo3xfrKNRHv8ni96woYrVslgKbkWzB0q3GMVqR0undIb
         oMlkThxLIAP7Qx4juqpmemp30+GSHkLxkft52c8n0eeZcuWTEGwJWucLgs0IDUVbMTVE
         xRqP9vepyDktIbTI3MzWD8TfPjAh1aUdL5xt37L6thM4nlnDp+ci1bC6D/sN5iAW6fD2
         J2WRdeBWu2yUK3XxFvXILUvFaM69N5uz2OJ1FZUCnFeNbdAHrnHHTARZA4L99YSkTiMo
         KcIX6sRi1LtkmNHDfmowdFIk9fAe/zQ8xfm7MCQ1c+HgCYPzJgRmbR/946W6A52m7qdp
         pddw==
X-Forwarded-Encrypted: i=1; AJvYcCU9vMXIff+2nshkoCryFURbugJ/YAcmMspjzClL0OwWBTJVaBOSUc/WuoNsvzHYkng7g2DEof3IRZ4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0IAA1PxK55pU+syzSRNPdEo7jCOqOyiKzrMEBTqoaq8lkd4su
	vy6VqVWLlgzvO1DgJDXCkEeepx7t/tJNZ3KPXwFiviPWqS17N4pqxo7N18NWmH5Zx4jJJQLBHnA
	WGGaRPeThjKB0tCnjJCLNeN5ETDOny4qfbsN9N2zVzXmmCXinQvA8BJDPpzgRjRk=
X-Gm-Gg: ASbGncsRU5hUfZK1VnnmZAeBNeCLj0jbiJuw5tK5rwq/V+7V5Pj0iF03ABeMezKYosP
	p2XUL8FasyNf3VjatTInkwnxKOOIWoHUiW1bKUqNwhY668Faaq6ocaW9JOLALS87tn6fcewWOoy
	8OJoRuukatXSPZ/Py2vg6by0wkPZTUG5sjB/4SU072rZJYkkuIgQtD2bmv0+sfaCyTj3t/iX/v1
	9Go6WgDxsrl3RcvEDrD+ndzES90dnrlntKBxHhIs2//BtxufrDS00JzeOw2ri2tLLZWujGLYz26
	GG7JgE6vsBEefnTw/7wZftA5dQxM2cQBOq3Na4ysCVVDtWpDNmiJo2EDx0VPdemIH0aTwtASdtL
	vjivR+kPwZ3qKiO4=
X-Received: by 2002:a05:6a00:3e03:b0:772:45ee:9ba6 with SMTP id d2e1a72fcca58-780fce17efbmr1909189b3a.8.1758756913524;
        Wed, 24 Sep 2025 16:35:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEBpn2lzR5gwMTN21ScTg1+Ioghs8Ao0Bl/JBGqmTWGzBcRYnazeZu1NEI/aAE8+KZ7s8VCEw==
X-Received: by 2002:a05:6a00:3e03:b0:772:45ee:9ba6 with SMTP id d2e1a72fcca58-780fce17efbmr1909167b3a.8.1758756913098;
        Wed, 24 Sep 2025 16:35:13 -0700 (PDT)
Received: from hu-jingyw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7810238e9a9sm212379b3a.15.2025.09.24.16.35.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 16:35:12 -0700 (PDT)
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Date: Wed, 24 Sep 2025 16:34:57 -0700
Subject: [PATCH 4/4] arm64: defconfig: Add M31 eUSB2 PHY config
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250924-knp-usb-v1-4-48bf9fbcc546@oss.qualcomm.com>
References: <20250924-knp-usb-v1-0-48bf9fbcc546@oss.qualcomm.com>
In-Reply-To: <20250924-knp-usb-v1-0-48bf9fbcc546@oss.qualcomm.com>
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
        Melody Olvera <melody.olvera@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-99b12
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758756905; l=989;
 i=jingyi.wang@oss.qualcomm.com; s=20250911; h=from:subject:message-id;
 bh=WnYe8cHS28Bdfzb1400w3Q/pQBsMgEBstbc7oiSATRU=;
 b=7uAglFkbwYo4jHhD7gwM2JVXFmP/o4yxCs15lZZSvumjLdI84vH7Fpy9ZL40trCRHSUoqDUDW
 CEe4pD6KhtvCG9NhhXIm71MfIYHuq4t01BYmmCRhc4C4Hro4PFs8IQP
X-Developer-Key: i=jingyi.wang@oss.qualcomm.com; a=ed25519;
 pk=PSoHZ6KbUss3IW8FPRVMHMK0Jkkr/jV347mBYJO3iLo=
X-Proofpoint-GUID: fpN2jCMJdYzXfP0z81znDoS7DsS2eEjv
X-Proofpoint-ORIG-GUID: fpN2jCMJdYzXfP0z81znDoS7DsS2eEjv
X-Authority-Analysis: v=2.4 cv=Yaq95xRf c=1 sm=1 tr=0 ts=68d48033 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=4ROhr7NTa0bsJorruOEA:9
 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIzMDExMyBTYWx0ZWRfXxJNPj9AB7qv8
 6KiLuXKlYmG1J4ghtN8WinBsMCYlXL1zErO1nosa7oPePUE9Z0gb5KVbRJu7eGBuSBBepFhyKwS
 6d5wvG5kZyesSK/hZVSeJnxTcNnphPYp5JDLXqvMkcZZ5ga3jrmnbIK7RCZ7g/yHZZZlBlrj4BP
 9LkDpvBj8Sq7DxKZ7/CgcX1oTxiAMBhao71JgNZYwEVWWFXRkFmCpbMq1LF98OAgaG5q5yNkfwx
 NqceYN5tPq+vwsvpJ2Ei3H4i+ICvYE8tJL1GCOXgxeiCyTkuhq0jcL+wKPxEVZHxSbzBBc4LfZa
 NCBuWq3kK+c41lklGSFdwbXx+rS9rRoUKXKYGKr/P98/gjON9I6Z973s0clcLYrZ2WUbK4+MAgv
 ePwbU2DN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_07,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1011 suspectscore=0 priorityscore=1501 phishscore=0
 adultscore=0 malwarescore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509230113

From: Melody Olvera <melody.olvera@oss.qualcomm.com>

The Qualcomm SM8750 SoCs use an eUSB2 PHY driver different from the
already existing M31 USB driver because it requires a connection
to an eUSB2 repeater. Thus, for USB to probe and work properly on
the Qualcomm SM8750 SoCs, enable the additional driver.

Signed-off-by: Melody Olvera <melody.olvera@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index e3a2d37bd104..24b1c943a7e1 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1641,6 +1641,7 @@ CONFIG_PHY_QCOM_QMP=m
 CONFIG_PHY_QCOM_QUSB2=m
 CONFIG_PHY_QCOM_EUSB2_REPEATER=m
 CONFIG_PHY_QCOM_M31_USB=m
+CONFIG_PHY_QCOM_M31_EUSB=m
 CONFIG_PHY_QCOM_USB_HS=m
 CONFIG_PHY_QCOM_USB_SNPS_FEMTO_V2=m
 CONFIG_PHY_QCOM_USB_HS_28NM=m

-- 
2.25.1


