Return-Path: <linux-usb+bounces-28929-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BEE7CBBFACB
	for <lists+linux-usb@lfdr.de>; Tue, 07 Oct 2025 00:22:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9FFA3188A3B8
	for <lists+linux-usb@lfdr.de>; Mon,  6 Oct 2025 22:22:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB5032DFA24;
	Mon,  6 Oct 2025 22:20:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nYeqUBkS"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6D2B2DF12C
	for <linux-usb@vger.kernel.org>; Mon,  6 Oct 2025 22:20:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759789225; cv=none; b=bNl0sh0eXODVmXAYOWVtQnZrM2oKGIHtdBSEyWu6SH+Dl0wrtC4g3CM442y4A0pm4lg3nNYc4vcqo4Xs1Tv1rjdGJH3pyXOy3CLw62LwkpoPAmTUbPJ8nDRDXPp4XVmdLeUsHRaspD4MlQOZth3b9D5nDBwmXzozwNkcYnkmQiU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759789225; c=relaxed/simple;
	bh=wwAOX22I0FMwc3Zh3TmwOoD6CIPx68eD+c21Q+iR4lk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=pKffm6mYK6TM08rwHfBcFMx0/OMuewlduDoMR03QP3qdrQU6j8uUB4MQ9Dyj0KRXqXFSgLruRgL/DpdLvYJmieBvk06NZoc5j1UZMlaaXf83EexdhXFlu051Ug87pORrwBdnKwQpm3x8rBHtD/NgwN6Ei26w+s/aErRhIsLZcx4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nYeqUBkS; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 596FPM5n026712
	for <linux-usb@vger.kernel.org>; Mon, 6 Oct 2025 22:20:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=fV/4QT0VA9Y
	jNuWz+QmsYOyq2W7XTcB2wF0sRRRIIRY=; b=nYeqUBkS4063/hTYGK5AN36Mmbh
	vU1kULVBz1JC3xY0gai5o+Sf4MqpM5Ogcnm+es3LqpJUnSGDnVgsCdDejxcFKeFw
	Kc7RVqLjKEM/1Cbszq7y9rL6jNqE/34f3FagvVuJ4SVKxG1nBmJ4bo/0gbb3bA88
	0kOpADXsLvqaWzq8fTzdZfalZfTvD3SFQlLxBkKzzUWPpVHjed7KAQE3cMfbKB/d
	P4rhnKbAal91POcAXZMLMgBl53snG6N3YOHGpFgOXeooFHxjvUxz9QMekdXRtGxg
	MNUk8vSl6jLqqxxb3XZDW+BLgPDzTOjs28xZfhXWy+WaC5VWZYKdJqf0aeA==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49mgd0h27w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Mon, 06 Oct 2025 22:20:21 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-780f82484faso3734933b3a.3
        for <linux-usb@vger.kernel.org>; Mon, 06 Oct 2025 15:20:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759789220; x=1760394020;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fV/4QT0VA9YjNuWz+QmsYOyq2W7XTcB2wF0sRRRIIRY=;
        b=VXqGLlrclWxZo4bXQEHhMArRcbkORrxxwvsbNMsknz/lM1xVi1hHk1y+9KGCOECqF1
         ZSgVPLIn/vDluj3prlET66i3MrrXeU0o73IMKqUazmcVQUmpUXXjuGUhb7Fhdz/sMLgk
         euXTGmSkMPWcemK9M6ZuMvKhuC8Km+B2yAYPqbyjIpQ3FtRePifkP04Op4+zIaMepued
         JW49yRWGkfxc8/EwSiyPuUjuUeIo1yl/ApjRDrtaPOHf6VQiNJVP4HemwEY8YOYsXL1v
         8bBydSEuTH1U14UxmqSuhRDxmdDYTg34saLoQvUFUSDzu4BkcG+uRGfI3xT1oin4jtVN
         18nQ==
X-Forwarded-Encrypted: i=1; AJvYcCWyfWzOCKp78H5J+bmu8OWaW4NFMIinRNvQ/Dz7Prboci18qPo5mxRO6hwfoVi2beCIMVWi7ARbZZw=@vger.kernel.org
X-Gm-Message-State: AOJu0YzljqHQDcQ9AABl1EDL2VN4bhynmj8M5skWIwuxHuuTBUnB8S5y
	M6imr2SdCb4gJYHkRFDTiX8OnwXn3zPGN5+Z3WtN7Hqj5tq6+PH/U+YOPofAUnZ6Ny26PxGsnXi
	IBVYE15Jz0Mrl2GYP1CCaiKlkKXuLlSVbFCn81mCOLCHXs495ticH/8GJXkk+W6M=
X-Gm-Gg: ASbGncvgGZ0BJfeAtImYmQYhGRg+FnkXBdJK/QMRPpgUV004ZWFmacYVzaLOPkCj59U
	CDh9rtzv0w7JLGLeux1+IiWm7NAUOP1ffuImRaPYowVjSC7v6b5h/kcyzpa/VvA2I31cMyR6n4f
	V0J+TRNb1uvY23t2dqBwAQe8Lt7xmfMPDC5EzuAE428NDSylsB2+Vc9csUG6aJgnQlJcB5ejQzA
	1L01bm6nNA0+qAC6+kCqjasEUAcE1lwdGO4YMGs0b3F7dwYUles/GAq7HOMdZd7jmvcXajEb3/R
	+5gYe8uEr8ADX8eJ7kCa5IpGx2RifR96UolP8JSFSV3lPtqlcAqWbST4+/gJWkjt/B1Sz0oNKki
	8VNXio5Mt6kyYFXubbzfkLA==
X-Received: by 2002:a05:6a00:14cf:b0:781:1a9f:aee7 with SMTP id d2e1a72fcca58-78c98d33024mr17671960b3a.2.1759789219914;
        Mon, 06 Oct 2025 15:20:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHOOY9p6MYrcEA1mJuNfdaAQD2CVOBY6X4Jp8M6dIFsvCZVYNCrKOaryyWH6+rHJuR6iNhMMA==
X-Received: by 2002:a05:6a00:14cf:b0:781:1a9f:aee7 with SMTP id d2e1a72fcca58-78c98d33024mr17671930b3a.2.1759789219452;
        Mon, 06 Oct 2025 15:20:19 -0700 (PDT)
Received: from hu-wcheng-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-78b01fb281bsm13734968b3a.37.2025.10.06.15.20.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Oct 2025 15:20:18 -0700 (PDT)
From: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
To: krzk+dt@kernel.org, conor+dt@kernel.org, konrad.dybcio@oss.qualcomm.com,
        dmitry.baryshkov@oss.qualcomm.com, kishon@kernel.org, vkoul@kernel.org,
        gregkh@linuxfoundation.org, robh@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>
Subject: [PATCH v5 09/10] phy: qualcomm: m31-eusb2: Make clkref an optional resource
Date: Mon,  6 Oct 2025 15:20:01 -0700
Message-Id: <20251006222002.2182777-10-wesley.cheng@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251006222002.2182777-1-wesley.cheng@oss.qualcomm.com>
References: <20251006222002.2182777-1-wesley.cheng@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: YgkU7kryKVuaILbkBd7333Q5FwVg3non
X-Authority-Analysis: v=2.4 cv=T8aBjvKQ c=1 sm=1 tr=0 ts=68e440a5 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=x6icFKpwvdMA:10 a=EUspDBNiAAAA:8 a=8inbgvmG2iPteTk8MkMA:9
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-ORIG-GUID: YgkU7kryKVuaILbkBd7333Q5FwVg3non
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA2MDEyMyBTYWx0ZWRfX3q6JB1jt2GSF
 sbQW+EYxwuiugUrfs/x6YXlz54cw7NttiOau+kmvltpOyvMCOO6RhLT2ie1UXK9u+qfSu1g536h
 YPIqNTnTBi9sMluTNeCO0PqBfODeyStaTgalzR94TDj2/o22SdMhbEV8Qb0RyYzh/pQ3UHUOoKH
 gaqjFaj9jUeJqXPDTFDTV7vvrelntRX7PbicGpuprSd8/lEfGNB3dGlFD70V0M5qmFcsESLBc6C
 fG/L0F8+97k5UP5EbH4fE46QVuoaDtZyD7q37iE9hh9LzFjMdHelDGFZ7EsG2g+qcmuivR8apCq
 cEFl7fGHxbttqnt8ORiTtyrhHEbICbql56D0eTbolUxqMm6GgCYgME5cwvTwEaU3dIo+v0iLb9s
 rRBn7e9gWX4scv6h6xsMI0O89pN/cA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-06_06,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 phishscore=0 clxscore=1015 priorityscore=1501
 impostorscore=0 lowpriorityscore=0 suspectscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2510060123

Some USB subsystems that utlize the M31 eUSB2 PHY doesn't require a clkref.
One example is the Glymur platform, which contains 4 USB controllers that
all utilize the M31 eUSB2 PHY.  However, PHYs associated to the primary
and secondary controllers do not require a clkref resource.  Due to this,
mark this as an optional clock.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-m31-eusb2.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-m31-eusb2.c b/drivers/phy/qualcomm/phy-qcom-m31-eusb2.c
index 95cd3175926d..f8a00962f937 100644
--- a/drivers/phy/qualcomm/phy-qcom-m31-eusb2.c
+++ b/drivers/phy/qualcomm/phy-qcom-m31-eusb2.c
@@ -267,7 +267,7 @@ static int m31eusb2_phy_probe(struct platform_device *pdev)
 	if (IS_ERR(phy->reset))
 		return PTR_ERR(phy->reset);
 
-	phy->clk = devm_clk_get(dev, NULL);
+	phy->clk = devm_clk_get_optional(dev, NULL);
 	if (IS_ERR(phy->clk))
 		return dev_err_probe(dev, PTR_ERR(phy->clk),
 				     "failed to get clk\n");

