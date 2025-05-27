Return-Path: <linux-usb+bounces-24340-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CCA5AC5BE7
	for <lists+linux-usb@lfdr.de>; Tue, 27 May 2025 23:06:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5FF1D9E1F36
	for <lists+linux-usb@lfdr.de>; Tue, 27 May 2025 21:05:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 57DCC217701;
	Tue, 27 May 2025 21:05:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ku8XGyGN"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55F34215F72
	for <linux-usb@vger.kernel.org>; Tue, 27 May 2025 21:05:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748379904; cv=none; b=IL5lEBYxzbkJOPT8QfOtIypEUFHlUcXHb6rZrwx0kypQuuAG2OIxcV0Os3CyFWHk/zrA/Z1k1sLh9jUUF5M8Fc1bVc7T1COS9FPZGmXi+LZOvKqG//COkWAeahlYsnTv0sZlyFhoz34p9iD8zDEFjsG63ZFOSC9lSiOts/YM+AI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748379904; c=relaxed/simple;
	bh=KVQpBUxY898OgxHofMwBS3SQRdZueoxZf5ILA+twSEw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oy+t20mpZj1LiqFYVpsxWOrz4osNGRh7aORk33a3bvVdOP6oFME8tdICaAw+r1MbXSfyv+pJxSswZuSpKa7LTiXu3vsagsOh2v3WvaHZ9yvCuHsZUnFbi9B9jSR5BmTRyRyQPVshNFG+rXWqGRqm6vARXzK+4qZmluum7vaGYbQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ku8XGyGN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54RCGsiX022698
	for <linux-usb@vger.kernel.org>; Tue, 27 May 2025 21:05:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vzRhl64Zv5yDqBHxQZ3cj4CWJj0+v77+Y3Pg3G7a3BU=; b=ku8XGyGNM0cD4O2p
	e/nfCt/gQVj1hNBbSv7MvO8P4az+FAp6b9N5ArvkdWR2iW8Hdv6/rvgkpecyuhFJ
	m3J0qfvmSsvPyRmJFA6Y9reIlgYRPoCkzRCT89oK491XFQBQPRJarRMRxVhBkQ0o
	zku//xs6drP+5+obIpRr+iMBYeXz5lT1M3RlbH2nkwX1xfpDGd/HoETNq9goUhXW
	KUxwj9tf+tHBWQdkFJUArrC3WoaaTu6w/0xHk1EOec29EgRILnNtPjRRaGRXkoOt
	T5n+Myo2nl4tVqLczaamkHpP9xlKMPZYUDc0bRVCwFfXcFkjjI13gsFzcjAsZAYa
	yNGXjw==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46u6vjr8tv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Tue, 27 May 2025 21:05:02 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-7395d07a3dcso2786334b3a.3
        for <linux-usb@vger.kernel.org>; Tue, 27 May 2025 14:05:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748379901; x=1748984701;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vzRhl64Zv5yDqBHxQZ3cj4CWJj0+v77+Y3Pg3G7a3BU=;
        b=XhBhV2miqkJqTHbPYwPWiHdkQjsMOEScX/2s/vJjZhbMKQxlhXJmymXzI0zl27g34Y
         dTkgZe3DjehwgB+YgQrCdDAUf8SKJbsLlQltQ7pEbdDG/Wtf0XQabikigwVKsj/WtokP
         ZWT8HvoGMp/7KRBeyELq1bUJ7iL/kjKcTsnjQ1x8fog4d2L0QIlydUCz1qkRWSf2lGkL
         KNH5LCQPpxPHOIKaIGn5IjO1L3tM0Q2hHhe0Rlc+KZVEOS/cb4uSCy/sWxNkQVXOub+i
         /8eEYu9SLBDUbUykP3nxVdOJ/4H36HCuM0vTcDYWa5I3wJ8GJXhF/XYkbCXYjdE8vEPQ
         s12A==
X-Forwarded-Encrypted: i=1; AJvYcCUgiimu5eZY5USdoXTcP/+kmIPbDBCJAoiOmxk9t/6pPZSAjd+iXyn5EfA8mV2Xp2VCGJmc8e19Ts4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwvDA8rCA/WF+wffEZxJ6KlvoeNcSVg3prkVr47AlWedgwbijRN
	wH1V+jrJ/F+Mo/q1DaN3FZ/zm534J0+0P+bP22zady5lBoo07BY18QADc/+5olEe2yYihn0pn1s
	OoB4iMVW53me9iKAs1x8bi2eKhYt5Wfve1oWA8VkG6s/4Bfh/50j6VstTo+dfZGc=
X-Gm-Gg: ASbGncuXfmuPRvKiqM2WvZhsUVEFyb9CeH5Arlz7yoxwGMWacfv9NkGlct5wflfMcgz
	+mGgYHd53pxa3HnzoA42v4vT2jOV82QBUlwzANSb37xckY3F6kkuLl6uc6e6dJFEmT0mRgKh21i
	AHMq/CgMwobG+92INRWB0Wp+qAqiheOFd5xKeP+2/8A99eLRebzhyi4nm9xkjxi0mRjNy/rYhdQ
	RYajL/kZMot+xit9G3dR+wMauNv2dVWKz7pleFhi8D9WGGiBcSPtL5sJooyVaP1bFeA5AZ1MXHg
	IeJ9mHE+eOXampI4QLdwZbamgqQ20ZRkz5NHRwyY+C3aDyjJhkt5edpL95qsKZ2wur4=
X-Received: by 2002:a05:6a21:3305:b0:1f5:87a0:60ed with SMTP id adf61e73a8af0-2188c289ab9mr22294723637.19.1748379901386;
        Tue, 27 May 2025 14:05:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFP42zUWXhEhoQN5IEHJjKv/vMbeqty1ztD8a25bRQwLQO3Db3gW3dczT8C8Tba1smWx7q+Lw==
X-Received: by 2002:a05:6a21:3305:b0:1f5:87a0:60ed with SMTP id adf61e73a8af0-2188c289ab9mr22294694637.19.1748379900997;
        Tue, 27 May 2025 14:05:00 -0700 (PDT)
Received: from hu-molvera-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7465e64836fsm29167b3a.26.2025.05.27.14.04.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 May 2025 14:05:00 -0700 (PDT)
From: Melody Olvera <melody.olvera@oss.qualcomm.com>
Date: Tue, 27 May 2025 14:04:41 -0700
Subject: [PATCH v6 05/10] phy: qcom: Update description for QCOM based
 eUSB2 repeater
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250527-sm8750_usb_master-v6-5-d58de3b41d34@oss.qualcomm.com>
References: <20250527-sm8750_usb_master-v6-0-d58de3b41d34@oss.qualcomm.com>
In-Reply-To: <20250527-sm8750_usb_master-v6-0-d58de3b41d34@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Melody Olvera <melody.olvera@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1748379891; l=1426;
 i=melody.olvera@oss.qualcomm.com; s=20241204; h=from:subject:message-id;
 bh=2C6aI5pd5BWhSTEhtHBak51NwjHm1CBTcKGDwCW84eg=;
 b=+RgrZ3qByHLV/U1fiMG21YBXz3FH3SWPCbcDLBDzvXvrqIQqU26M7grdrJWa2RNyA/AHze4N/
 vb6chONnS/6B31yW7+693rVPVIUjPxlrSEsHR/5RkqyBCWY66Oqo6R6
X-Developer-Key: i=melody.olvera@oss.qualcomm.com; a=ed25519;
 pk=1DGLp3zVYsHAWipMaNZZTHR321e8xK52C9vuAoeca5c=
X-Authority-Analysis: v=2.4 cv=UOXdHDfy c=1 sm=1 tr=0 ts=683628fe cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=2IHzoM5ujN45o2WKKn0A:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22 a=TjNXssC_j7lpFel5tvFf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: ZqGkPgFWTDtbwoifk_-E9TYnZmW_j1OL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI3MDE3OCBTYWx0ZWRfX3fm9ln43Uc9u
 9sCtnbiKg5YzOd2iLLv4HotVBdsFuDGKa9NWDTCbSR+2Ng3IwD9a5ErQhqJHCPJGt3lfOiiho67
 I/o0aoa8357szurxNpyZ7JcNABNL5LXf0F3Vw6WFXD00/uBq9FUZv29UPfmJh//JJKZerdMkajd
 hzU/Nd5HEreiTdNq8fppggrNCurans/GNvx870th6Wkqbdo/SpyhdjlGVAxK1KwzumxXCyFIgBf
 9K6sLlvpnKcCAjfI+cQ/hoNbxqK3caS+t7sIKefC7aYTYnIiNIIQQK+LQ/bP/qEd2INCt6KWwly
 F6n0CWoLygdUtnhj77GUXLLtYBRMWiIjobUHIGTklB/iR82D81zWtBxveV9TNYVX8NP+caEpIOA
 SfvGWsI1DOjfB3JKGGG2Mvk4egy/M6Dp5ZZHt+IkB/L28ofOGS/1h6WJ1D42SVeONnM7C5Qj
X-Proofpoint-GUID: ZqGkPgFWTDtbwoifk_-E9TYnZmW_j1OL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-27_10,2025-05-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 mlxscore=0 adultscore=0 priorityscore=1501
 mlxlogscore=879 bulkscore=0 malwarescore=0 impostorscore=0 spamscore=0
 suspectscore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505270178

From: Wesley Cheng <quic_wcheng@quicinc.com>

The eUSB2 repeater that exists in the QCOM PMICs are utilized for several
different eUSB2 PHY vendors, such as M31 or Synopsys.  Hence, the wording
needs to be updated to remove associations to a specific vendor.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
Signed-off-by: Melody Olvera <melody.olvera@oss.qualcomm.com>
---
 drivers/phy/qualcomm/Kconfig | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/phy/qualcomm/Kconfig b/drivers/phy/qualcomm/Kconfig
index ef14f4e33973cff4103d8ea3b07cfd62d344e450..85581b40e598814cb27d954e8c63eba809702622 100644
--- a/drivers/phy/qualcomm/Kconfig
+++ b/drivers/phy/qualcomm/Kconfig
@@ -126,12 +126,12 @@ config PHY_QCOM_QUSB2
 	  USB IPs on MSM SOCs.
 
 config PHY_QCOM_EUSB2_REPEATER
-	tristate "Qualcomm SNPS eUSB2 Repeater Driver"
+	tristate "Qualcomm PMIC eUSB2 Repeater Driver"
 	depends on OF && (ARCH_QCOM || COMPILE_TEST)
 	select GENERIC_PHY
 	help
-	  Enable support for the USB high-speed SNPS eUSB2 repeater on Qualcomm
-	  PMICs. The repeater is paired with a Synopsys eUSB2 Phy
+	  Enable support for the USB high-speed eUSB2 repeater on Qualcomm
+	  PMICs. The repeater is paired with a Synopsys or M31 eUSB2 Phy
 	  on Qualcomm SOCs.
 
 config PHY_QCOM_M31_USB

-- 
2.48.1


