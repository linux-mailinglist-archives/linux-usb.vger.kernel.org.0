Return-Path: <linux-usb+bounces-31474-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 70795CC3306
	for <lists+linux-usb@lfdr.de>; Tue, 16 Dec 2025 14:26:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E71333052B35
	for <lists+linux-usb@lfdr.de>; Tue, 16 Dec 2025 13:23:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4858E3612C8;
	Tue, 16 Dec 2025 12:08:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KHtFUFi8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RugadaPJ"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 675313612C7
	for <linux-usb@vger.kernel.org>; Tue, 16 Dec 2025 12:08:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765886888; cv=none; b=WKZOuj6DAgd3C+d+IcXpdrRCeNIxS6E2bJ2gXVZH+KKhF4rlf3qvD+Fxaq/+6T+sgj7OlsA/BqWOe9mprDOxX5r8Z5VHLZaLsc23cZ/9dJGJuwNS3qvOeauj+QQ62xGaQDdz5c7g3JR9SMR8JXn+HFSWQt7RMZ6WGtQZPvz07fc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765886888; c=relaxed/simple;
	bh=H9abZfOkYQts6D4SGcICwKtFQofYukdrYeyR6tT4CQI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=cnrKXr2LE3NK7i2mBO7s6aWm9gLDkQ/i6NOK1Rgt0MAjjCf3X8jvD0qNTMNf49OVXYurEsQKCQeVNPxQ0VYMZDdszeHDPWMibSvbeq8aZHxmUkqbSrb4bf+hec3A1rBRTAX+vE5sYXB1A4MNKF+x71QcVZ701ZIw3YKR3PM3OPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KHtFUFi8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RugadaPJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BG8JTH52573341
	for <linux-usb@vger.kernel.org>; Tue, 16 Dec 2025 12:08:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=0TtjIbhvpwUJJPB/dQ889ENI1wVn4pYy08t
	WsWt09M0=; b=KHtFUFi80kNircPvQpnVELjl7Y6bZszGYW8aLftHETg+0VtCaHJ
	ijKUpx6LBDM2aE2EgsVPRtT0eMXXjoU8lfCQJFQgYAQoxEymjnxkbjmDTuJxSF28
	sumIvHCIzLW4JOez5uoTD0jBJpymdJvAjUGF/so/kWIs4C44tQa5Pto5xiiVT0pV
	Gvx5UE2OfCjhzuBJVXg7q0TcCsQS0Xf9prpfZuF9HSdIqcZT84LblCtNTf+Eusel
	zZXKK9m3jbjStUo0JchDpsuL9TFH8uvSF+RGCI1oHm6phtEF8vITAns60CBcTT8v
	iOdgyas9ZAFmILU4RsEx0MA9HMrZPtGcxXQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b33thrxg4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Tue, 16 Dec 2025 12:08:06 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2a0a0bad5dfso57790715ad.0
        for <linux-usb@vger.kernel.org>; Tue, 16 Dec 2025 04:08:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765886886; x=1766491686; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0TtjIbhvpwUJJPB/dQ889ENI1wVn4pYy08tWsWt09M0=;
        b=RugadaPJzeClGD2nxlEjYBWmJcUR0YABpRN7fyhpPMjice0MgHS0KIbAbvBLmpwo4G
         sd2bypiGx8TeKPhABPuD6Kp/cckYGpY4EshXkQ5vk4c+Aco6KL5fq6ynp0ZjWroKLx3o
         J93hNxP0RY87VZdifdM673NPEFjX5xDHe79hfADOVakrqVYCmczfjfuRd8PzLT7ef//J
         Qd7nw2UI7qUCE8aaorWWWvRLuNOj2tTq4iDawFoCxEx9oQrQDgrVtNkrOr3rCyXnENsn
         7B5lWeqnkQ/7974SxbHbRVcWEBrQspXvvDYPtdwwi1qcXIbmDv2DTSW/jCEdGMSaen4y
         kQ0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765886886; x=1766491686;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0TtjIbhvpwUJJPB/dQ889ENI1wVn4pYy08tWsWt09M0=;
        b=t11IwaTnDnuaUkH4FhLFUgCieU+NXZUCzbC2WvEzxXsTFF6Gt3p1Z3xHmZEL4xHCQ3
         fm7epZ/ZYJMdzabacGWIIAwqLcbK/mLjEigAQEtin139Gsk3U2USRKjYd0iZu5/8XvBi
         Pmo1vgsJTFF+KERHuX57Imn+hy8MeH50o+UkM8Kl0+NCJbX47DFLuQesDdrcLPfx/XsB
         xEuN1siTw5FFI/nBABEf0CjmQkL5pyUljwzME/9W/A4nC6BOLmaeqdZJyOQJqwovrLHW
         owsTRn7kjuSKfHfeRwAqsr9apYuAmOXdR/5HBIX+pAwG52aspghUE9G7FqSjx5czHVbQ
         JXyg==
X-Gm-Message-State: AOJu0YzSu5UeuA3itBBud3C+ty87lkqisx3VVK2FNWvHOw9cHdvtp9HT
	74oX53CPs+NPSaQCWMOHx5Ia81atV35Fl6xrcH9bug3iSTVEOlqyHKIOQY88V9IDQIDpZcm3Zi6
	V1/k2lKQvB73dgMPJO75xoDSiRP7FDYIvzPL5k/aBsBXDMsi21LEfVga6021226E=
X-Gm-Gg: AY/fxX7UVI+yheFuHCnyNSq2QDpT+0xUcCEZZIb7izv+rEbOwkp5BYI3qjTbVdIvrBJ
	6KrNFDsSG2Iw9Ftgb2kFvW9iWGT/T6poRK5Jo3qapRe/jwnwfiTBX/eQsXoANCeBobJ5j5rF+A/
	AcTDz6K+8ZjJ/oXh7qlCbxaf+XZMKdb+WrOxuzQ/K1QCbaIS8PoR617tjceAnfOjCNKTxo4dSgd
	uhBkADTwyW9+d9TUdypeiw5988/bE8i0HJA8TB2Lr7hFJ9bC2AwAi1HGvCPMfueicBVT11NJMZ0
	jjiLuAQyIiFGd62lBJoR5d29WD2Xj+k73s8nyuvEyleDjLhwihAUhrXCjt644y3Td+wHTj6wfBI
	Lq+MRlfIErRwBh76bo3CTYddWhtyU/fh2l72IGyBjxMs=
X-Received: by 2002:a17:902:cf03:b0:2a0:bb05:df4f with SMTP id d9443c01a7336-2a0bb05e314mr83402925ad.44.1765886885894;
        Tue, 16 Dec 2025 04:08:05 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFiw6zSvfczmhqR9lmIDcnmAukNtHBZazConwujUupumT2t8wOfkgbilHRFxoLYk9MMrzDSSw==
X-Received: by 2002:a17:902:cf03:b0:2a0:bb05:df4f with SMTP id d9443c01a7336-2a0bb05e314mr83402605ad.44.1765886885453;
        Tue, 16 Dec 2025 04:08:05 -0800 (PST)
Received: from hu-swatagar-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a110f6374asm48568695ad.63.2025.12.16.04.08.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Dec 2025 04:08:04 -0800 (PST)
From: Swati Agarwal <swati.agarwal@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Icenowy Zheng <uwu@icenowy.me>,
        =?UTF-8?q?J=20=2E=20Neusch=C3=A4fer?= <j.ne@posteo.net>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Jens Glathe <jens.glathe@oldschoolsolutions.biz>,
        Mike Looijmans <mike.looijmans@topic.nl>,
        Pin-yen Lin <treapking@chromium.org>,
        Catalin Popescu <catalin.popescu@leica-geosystems.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Swati Agarwal <swati.agarwal@oss.qualcomm.com>
Subject: [PATCH v2 0/4] Enable USB1 controller in host mode
Date: Tue, 16 Dec 2025 17:37:45 +0530
Message-Id: <20251216120749.94007-1-swati.agarwal@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=ZIPaWH7b c=1 sm=1 tr=0 ts=69414ba6 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=T81NLgZPhjG5DizPKtsA:9
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: cAdLf43hrLVSf7N5eAo2AJG7QkhxctQI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE2MDEwMyBTYWx0ZWRfX7FHdUjCK0iW0
 SeCAD6LM1mCeSPgUltusJ6FLMC9GV4ERBoZWjXrIqJWhGyWyvljlX320aQTFFUO+D4vLeAthG5+
 KgcZPWT0m8S93DKRHPrRy2N/D1bhELDofTuOjfTttpjwJWqZJkvMPO+xJ4KiV3/ej7JMKw4QnW8
 /NqTPJFsVvDFPlhgp15GaOfIP8APHB2hlX7lQrEV9Y8otnwXUUFaOqQkQOx7j7ZZNy1FSGNeltA
 xy90am92kWAQ3eKBOS+NuV1zSnGMGaGxDBFvslTaJA9srhsI/6iZ5X6VgZXrDXbRXtRh8dGftI1
 ZvTJGichUI/pF4DHtJFuL2OL4A8325zxhNBBbAeJo8OWWeaWNlPsux+TI5r10t/dye//1BvHALN
 ZEBUCDe5SbAxBfnvt3a0k+gaJmadWw==
X-Proofpoint-ORIG-GUID: cAdLf43hrLVSf7N5eAo2AJG7QkhxctQI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-16_02,2025-12-15_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0 phishscore=0
 spamscore=0 priorityscore=1501 adultscore=0 clxscore=1011 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512160103

Enable USB1 controller in host mode on EVK platforms.

changes in v2:
Added Genesys Logic GL3590 hub support.
Renamed hd3ss3220_ instance for primary port controller.

Link to v1:
https://lore.kernel.org/all/20251203-swati-v1-1-250efcb4e6a7@oss.qualcomm.com/

Swati Agarwal (4):
  dt-bindings: usb: Add binding for Genesys Logic GL3590 hub
  usb: misc: onboard_usb_hub: Add Genesys Logic GL3590 hub support
  arm64: dts: qcom: lemans-evk: Rename hd3ss3220_ instance for primary
    port controller
  arm64: dts: qcom: lemans-evk: Enable USB1 controller for host mode

 .../bindings/usb/genesys,gl850g.yaml          |   1 +
 arch/arm64/boot/dts/qcom/lemans-evk.dts       | 167 +++++++++++++++++-
 drivers/usb/misc/onboard_usb_dev.c            |   1 +
 drivers/usb/misc/onboard_usb_dev.h            |   1 +
 4 files changed, 166 insertions(+), 4 deletions(-)

-- 
2.34.1


