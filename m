Return-Path: <linux-usb+bounces-31646-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 49BE8CD2899
	for <lists+linux-usb@lfdr.de>; Sat, 20 Dec 2025 07:35:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id CCD253019348
	for <lists+linux-usb@lfdr.de>; Sat, 20 Dec 2025 06:35:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A0A4829D275;
	Sat, 20 Dec 2025 06:35:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pzFXIlag";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bWRT+wg9"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6F573A1E9E
	for <linux-usb@vger.kernel.org>; Sat, 20 Dec 2025 06:35:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766212554; cv=none; b=h8mJlpjp8H7DM6H0+0u9gZ11rsyXV4E6PhNq94I4aPosBaC+CE4YBj+392jqDi193itOani06d0e2lekitB/9iutmgMdLUsOghV5GM5+6EA5aWQxMC58W9wzIU5KLeWDec/rD/GorksaBi3i8m4D9RdLRrpX7SURvT1QljZ50uA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766212554; c=relaxed/simple;
	bh=2TSXRKp8R83WoeP/yTkt9TOjPwxMSsOnbMziSkI42Ms=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=qOiUClZvWmiiUOz6dmZ/s0YL3X6CP8Ye412w1oZ0dOLM/PLKLaWVbmY4vVg487BW554eI0tlTpkZvIC6ffEuO03ryv6VErJgTTN6qFuPiZA8m5O2GjXAFk2EzhuOOyyn5lSsrcRlqGVdFKmZtc+81QELDAOXA954J+y2ffoKscU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pzFXIlag; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bWRT+wg9; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BK4Pe382818020
	for <linux-usb@vger.kernel.org>; Sat, 20 Dec 2025 06:35:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=OVfGHfohNjCBn0DLG1T06A/Ply+SAj5Rr2/
	QKy2aho4=; b=pzFXIlagoBr4xkzk4wJblMOAMhrkF6hfaZpuF77IV4XqRXvALSn
	01FfuDniUS0MLG0fQKmtsrEsuQWGy81T6eP6TI5Wmr5L5ZDvJj6yhi3kVGjPXYEm
	o+QIAUpCW1SmL5W0ShF+zy9EGrBpPHqM51PufZySa2s8S3+UK2Ozrtwiaqerf+sJ
	ADBRMT1Slu5MhNHbrAh41m/Mrjnz4d0LyHQzMk6uIngF0AMkN2N+2vitG4qpYQXH
	dnc+rEz7tL8qtG3VrAU7feXNhf1xiPGtqk5+7XnwGhvQTX+97tOs96EVGeWbh+DA
	xvbNKBqLO8pMIPjpmgtIm9LLFkcVDezTs1A==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b5mrwr641-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Sat, 20 Dec 2025 06:35:51 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2a08cbeb87eso34788905ad.3
        for <linux-usb@vger.kernel.org>; Fri, 19 Dec 2025 22:35:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766212551; x=1766817351; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OVfGHfohNjCBn0DLG1T06A/Ply+SAj5Rr2/QKy2aho4=;
        b=bWRT+wg9JcnmQ/KuqCcb5qFFqc87X88l4VsYHCRGiZ49hbRubylMtMphBiQ5xANIKZ
         T1g62cH+HpMUHfSrBWpAK+Gc5TIoCteLBTbbRh+TpOX2nFLCHkyrI7blS1gSkLJOkYz0
         rrE7Eux80cslCKNHzKzfWpBy5oW+I6g7G73ZaXFJzPHM+DR9uvYMK+bZuLax1YOli24R
         9DnD3p/ZQOwZ93U/8NBgiCDH2e2sW2ObgyGLMZUd9eUcEC+0eDlwZW11iG+R7mg2Em3b
         /k0Qh2kdR1FBqgr38bzgETAnyuiLzi7dYx3HRKtZy0h6pjJcnXQf1mAzd0PA47v2vVsh
         uPlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766212551; x=1766817351;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OVfGHfohNjCBn0DLG1T06A/Ply+SAj5Rr2/QKy2aho4=;
        b=ZK7CXy0ucCdiBvx4K8BpbhoU3d2+fw8J9sWzL9Q86WHhSwGTJZsFs1k5RsagGfxhTw
         YxZHJUzOnBZSGe1u9L6TuInS3MYM0dopvWJg5K8OKPTmnBdlACMMeoIVQuYG7Hz4yglj
         Q/mDj6MfupK/R7vGI7OUJZbSHgpFfJpK+iiJ30+NNLSREhZF6i3bOfzxW84DiJctQCbc
         cd58muEn56RYTOXDNkDGitbs/fGXC21/nb2MWQsAE3c+m42blM4YA2kDE5k0+ehPKzRk
         0WKChTXN0Idjgd8rsyjSyoUAJO8gjjhynnAubwxEbMYmFQfPj5j44nzeN6PVUdTbZEaI
         70Ng==
X-Gm-Message-State: AOJu0YwH13kj8IvP1SMEiriNAUUdzRIvFIl1y3tiiV+/MW4KDsXWPw5Z
	z4nKl83arid6lTs1fi0YTTyN6FnRrKE1Er3e1E6mLGVpbk7RQ7bjCsP7tExS+4s7c+9Am9AdJMF
	yaeZe1i/pE2Sia93josYBnCkNrOp9J4NWKpleI8AUxDQFzzKy/oi1hNl44MxT6Z0=
X-Gm-Gg: AY/fxX5V3FPjgTw6MvRtaF/H8Nvpn4AmBL8hBOf0Q5kwhMIBZJJe9BmPy1WZKpSrWdd
	dnna7F54h5hRgWYZdnH/yKd+LVvk0Kc5brAi0vduSb6I0PXjANCg+EZjNJOsUp7UQcY6hsLuJPr
	SdbvQGbrF66j8Xsbi5PKEHKS7qt3GZjdB+n3kYNxMgLdY3+4cD0DeyNTZcgVFymj5HFdEDz/Enj
	4b7aw78b8UMsU0+muS6db0ltrp5RbJ3K0PcoEWcUXNUeJRmkgWVudxzM81nEDShfMxEh34zm1xT
	WFGK67/bRkx88BuPI8ao8tIWC0YZ3ltUWQ7UaWofPsM5bO3yyEFa0PCYD2kbjNWj39Z3BzcJK5F
	1J991zQbMVBovVsyCo2yUt9pV0ie6ZohNiRYxgZs8sl0=
X-Received: by 2002:a05:6a20:e210:b0:33b:5a3f:3cbe with SMTP id adf61e73a8af0-376aa0f02a4mr5106161637.54.1766212551140;
        Fri, 19 Dec 2025 22:35:51 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGoA04DE8wIXAVuz9iakFv8bFLzulWvY2PNaRydPmKJhJnjE4+AMxw9BDghB+oya8ADVlznSA==
X-Received: by 2002:a05:6a20:e210:b0:33b:5a3f:3cbe with SMTP id adf61e73a8af0-376aa0f02a4mr5106137637.54.1766212550645;
        Fri, 19 Dec 2025 22:35:50 -0800 (PST)
Received: from hu-swatagar-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34e7723b3a8sm2847143a91.3.2025.12.19.22.35.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Dec 2025 22:35:49 -0800 (PST)
From: Swati Agarwal <swati.agarwal@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Icenowy Zheng <uwu@icenowy.me>,
        Matthias Kaehlcke <mka@chromium.org>,
        =?UTF-8?q?J=20=2E=20Neusch=C3=A4fer?= <j.ne@posteo.net>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Jens Glathe <jens.glathe@oldschoolsolutions.biz>,
        Mike Looijmans <mike.looijmans@topic.nl>,
        Catalin Popescu <catalin.popescu@leica-geosystems.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Pin-yen Lin <treapking@chromium.org>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Swati Agarwal <swati.agarwal@oss.qualcomm.com>
Subject: [PATCH v3 0/4] Enable secondary USB controller in host mode
Date: Sat, 20 Dec 2025 12:05:33 +0530
Message-Id: <20251220063537.3639535-1-swati.agarwal@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 1aCSvnogacVh87h73kqroSds4ZPLHNPL
X-Authority-Analysis: v=2.4 cv=R+UO2NRX c=1 sm=1 tr=0 ts=694643c7 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=BbGdbhBj7xDDEJ_r43wA:9
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIwMDA1MCBTYWx0ZWRfX0+dsN9uZr24k
 BEqH698rEdfiAQA1eoeasI2OF6DdNEUyKrV7xcy8AhmORJcrIH+0kS9LPNgh3ruTUlAnmGns8r4
 XULiEe/WIRtrtKbg9g+nilUwZ3OVxObvnoXJoOsmW0oGVxsbSRkYRwKlju+d8JswX0QIDjuOHeD
 QNg2LUbf6UwsIeHBmbv0gm1qQxlaHfjHjDIQuO6tX02aKXrleZeszJ0vI/wLCLR17V8x8cpH50Q
 oh0XCYm68ppd0wCj7DwWw8OUiUVUv/Sghmd3eNevxPQgPA1pBQHk2fksiXZpeYBTHqwShzCYl/2
 gXKTc8yxFP7A928poGufYdEWziamAgRxsCIxlXd1vdAhU2jtrX1/lybz20NAbze7baNO7y3SegV
 RUdOpp3NuKVyNtEjbVGv6t0/8qk85vdT1vMhLLt5Vo6l4BdNq9f3wrF33TOzA9A3itCLYvvyhUI
 i3SVAmwgJhAk6lc0M+w==
X-Proofpoint-ORIG-GUID: 1aCSvnogacVh87h73kqroSds4ZPLHNPL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-20_01,2025-12-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 clxscore=1015 lowpriorityscore=0 adultscore=0
 suspectscore=0 spamscore=0 bulkscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512200050

Enable secondary USB controller in host mode on lemans EVK platforms.

Changes in v3:
Updated binding properties for genesys hub.

Changes in v2:
Add Genesys Logic GL3590 hub support.
Rename hd3ss3220_ instance for primary port controller.

Link to v2:
https://lore.kernel.org/all/20251216120749.94007-1-swati.agarwal@oss.qualcomm.com/

Link to v1:
https://lore.kernel.org/all/20251203-swati-v1-1-250efcb4e6a7@oss.qualcomm.com/

Swati Agarwal (4):
  dt-bindings: usb: Add binding for Genesys Logic GL3590 hub
  usb: misc: onboard_usb_hub: Add Genesys Logic GL3590 hub support
  arm64: dts: qcom: lemans-evk: Rename hd3ss3220_ instance for primary
    port controller
  arm64: dts: qcom: lemans-evk: Enable secondary USB controller in host
    mode

 .../bindings/usb/genesys,gl850g.yaml          |  12 ++
 arch/arm64/boot/dts/qcom/lemans-evk.dts       | 166 +++++++++++++++++-
 drivers/usb/misc/onboard_usb_dev.c            |   1 +
 drivers/usb/misc/onboard_usb_dev.h            |   1 +
 4 files changed, 176 insertions(+), 4 deletions(-)

-- 
2.34.1


