Return-Path: <linux-usb+bounces-32524-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 554E6D3C626
	for <lists+linux-usb@lfdr.de>; Tue, 20 Jan 2026 11:51:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 5CC785C24F3
	for <lists+linux-usb@lfdr.de>; Tue, 20 Jan 2026 10:33:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE7743E8C79;
	Tue, 20 Jan 2026 10:33:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="K/bLsQkV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iaLte5nl"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E23713F0765
	for <linux-usb@vger.kernel.org>; Tue, 20 Jan 2026 10:33:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768905208; cv=none; b=iNWmC87CQZxvDgv6c5dMhZICLeDxiR0vMyZc6ubtO9K44sZNfte/KMoYfRfH3WSoI+Gv49NFp9rFETA6oVi1srl33EE3cHFBylnQ7UEbNL3b9kV9kJrL6WjTdY1Pgj9aTtwy6s8Oy+PlnWC+iRE+lVrI28Q37lHWTLE0P+Lbm4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768905208; c=relaxed/simple;
	bh=iJYPfbsaVRJLjJF6ouY7r1QpOGnx5V6e5FYaMLRBpGA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=U+BlbyXwgpgZRrhfW0mcp+MgRlituKYedQc11tG8xEGdUZqQwwncYzCWBF8lwM6AWV6UOl8lYr4MEmywVWsifMth/75OD/HagryUndAgVkiLcksnCB+K7nk7Q+ND9UBiUt0yCz489+5RzbDpYtVUSunOEV68DPNWm5pYwsujBqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=K/bLsQkV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iaLte5nl; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60K9Nl693176730
	for <linux-usb@vger.kernel.org>; Tue, 20 Jan 2026 10:33:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=chAWrisEFvUfO+2YxDyxtwyJsoSPhEtK4VC
	X6IwXaY8=; b=K/bLsQkVhB99uaDsdCzwpKc4U6EPHrKEEVsQrt2OgVxlrqrE/NT
	nxPGvkK9/X31OosKlxFchFeWiixLqmroCGxZNoP6mR1mIw9Ucpkqxub8qyQSwQru
	0mAEbGTArqBksxwVFNtULUNzdsCZgYxFnNPCsFeOqZ8e4sYfO0wLzTlmZZzxEV33
	lGey30sCadSXlO1i25EaNIhPqF/72s0DlfXCST30xoZhpEO8LvJxQtO4GJgkRoMc
	7YKLjj9/7dEKWe6j2V9XoW9Nih/vSJXbU6Ir3NsCnf2YDWknSsqF5ZJ/er9F9uDb
	mjzSh2+XTsdn8nMc9HI4a/6VrNhwh9uwsvg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bt0p2hd59-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Tue, 20 Jan 2026 10:33:26 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2a090819ed1so34394995ad.2
        for <linux-usb@vger.kernel.org>; Tue, 20 Jan 2026 02:33:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768905205; x=1769510005; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=chAWrisEFvUfO+2YxDyxtwyJsoSPhEtK4VCX6IwXaY8=;
        b=iaLte5nld8W7XjkQzQleWNbCgR8nJZ1ptrgF2BDq5lmDl/RSzcO/erL4TZRGoIoMrM
         dnzPVQh7JvgFMI3US8HmpA/IU9zULFMyJaPxPKVOe0nrctqjHJdongIPUUKlGtCtgbpo
         tN36SZ7EJ+wgjnR80/XZ7JEyNH1PUoX5MVxmEM06fNJieB9bK12OZgHPlDGyGGlEFq++
         PTsADZPKKCZ9J5Sat1eYDTjRoQO5dCn3vG6rSNvVJOVTYzaHOziiqxjf3PX8YyZKg/N1
         hl5hsM6EQin9o60QWZ4SB6f4iwRv59nZgnP+KFgWtrpMrLt58XtXfKGKg6rZx+SzbZ8v
         jRLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768905205; x=1769510005;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=chAWrisEFvUfO+2YxDyxtwyJsoSPhEtK4VCX6IwXaY8=;
        b=Du5qm293ZwLgJLr4EG5YXPXOfe9hzZ21d3Hynrtbb+ZzczwgZSt80b1M92JhBmVE1k
         JwC/7IX39NuF9u6bBFYP2sVDGLN/LIDHAmNSwn5APCHlq2cclPh0VMfzMjfW40r2kiX/
         WD3UPVtK/4nZUiFpVzYmZlKWfq6bavKen9BUy3xJsLfKt4z8WO+Ug3XN0hwN6i1fcjMN
         E6LB7YOh4UQa5mIbfTAx7hTNUlf5XvS3r3QJAa6g8CTZWbqnvUVth/xkv200V7hpJXV8
         LxFQ1EY/1D2Qy1AGiWZFzCPr7bti2q/31ua0OX0jDGzbiR0qRS991I+2x7o5K2g4DkK5
         a14A==
X-Gm-Message-State: AOJu0YzAgwbYdwRS0F7JUNewlDEmpTpgdv733uNA8fhQEkAe2EXxhDPE
	pSxTCort0HCC6MUPlroRI32n9aTBOpf/WEtzIRQsPkmgk6LCYNl23CqPBODetvNZK6tCgZ0C+ZX
	ZpXOWnx2cCK3uYdcia6ca+dD32qaFti+ykCotohLymWVW3Pm60u0anStPKFCc2M6d1wT1BUY=
X-Gm-Gg: AY/fxX4JqhB/4oGDgUAcRFuX7KheS3XSKRqvx19TvbZCXphKjnJHh7Lto9E2YQgUn+i
	2no2nSxD5fL6OjGJ2HtngvtDNtplIMPEXtI9T3Qrp75HgoF+zQV7C78qW9CeaYM8LCpmL85jV+E
	hPlob8qUdgvFbPYkHgFxnNDNDoThVWNinAIopzPFYDcq3Gn2YuVfcjaSsCQq7yhsK/B9my5h5i9
	TRl29q/hzcxR1q1ZqkHPChxh7eSjnsrqOB/o4AAWKCrxzAal9jjh8+KjHX32OZ0C4Z4MX2PrZdD
	bpXJeyxQYeYgexyERhOoHlom3pjaibGFGM+ZI6cnRWdcWGu0i+lDtd724QF4d3RCw+WLbdqbTfc
	aC/5FpnSVZ8c91Q7xHW7eMK3iyT080jpRr/q1uqADE4E=
X-Received: by 2002:a05:6a21:6112:b0:38d:eeca:b34a with SMTP id adf61e73a8af0-38e45e2d811mr1404074637.52.1768905205090;
        Tue, 20 Jan 2026 02:33:25 -0800 (PST)
X-Received: by 2002:a05:6a21:6112:b0:38d:eeca:b34a with SMTP id adf61e73a8af0-38e45e2d811mr1404046637.52.1768905204571;
        Tue, 20 Jan 2026 02:33:24 -0800 (PST)
Received: from hu-swatagar-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c5edf3791e5sm10050709a12.31.2026.01.20.02.33.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jan 2026 02:33:24 -0800 (PST)
From: Swati Agarwal <swati.agarwal@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Icenowy Zheng <uwu@icenowy.me>,
        Matthias Kaehlcke <mka@chromium.org>,
        Mike Looijmans <mike.looijmans@topic.nl>,
        Stephen Boyd <swboyd@chromium.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Jens Glathe <jens.glathe@oldschoolsolutions.biz>,
        Chaoyi Chen <chaoyi.chen@rock-chips.com>,
        =?UTF-8?q?J=20=2E=20Neusch=C3=A4fer?= <j.ne@posteo.net>,
        Pin-yen Lin <treapking@chromium.org>,
        Catalin Popescu <catalin.popescu@leica-geosystems.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Swati Agarwal <swati.agarwal@oss.qualcomm.com>
Subject: [PATCH v4 0/4] Enable secondary USB controller in host mode
Date: Tue, 20 Jan 2026 16:03:08 +0530
Message-Id: <20260120103312.2174727-1-swati.agarwal@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: usqRra4h7rMaBdV_LgWqas9UuM1CPWQT
X-Authority-Analysis: v=2.4 cv=drTWylg4 c=1 sm=1 tr=0 ts=696f59f6 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=BbGdbhBj7xDDEJ_r43wA:9
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: usqRra4h7rMaBdV_LgWqas9UuM1CPWQT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIwMDA4NiBTYWx0ZWRfX6hRNiMeZsmdr
 ktPae/HCU2NK1/wKPIbYwVt6xXEvOCAY8+ZZitqmYCbZ9GnpbcU3xOhRwg8Rphiti4GsLBWu73L
 QlQ+g23BEzpMTc9ULOZyIBCuRx39UNj1vztDK7yp6QlVVjUab23JbrQ7YLpAGTBUhXN5PEDyPNe
 KAXWJh2MYsIYVxKEtOx/jQXqyukkjo/EtQe+CWcKwIWEHTaibhpZxHXpYvFK+Vv3L5MX2L62vNG
 LRuWx2CSPJkaW+MZFVEh6BwYsYpnRDGOQNE3MT1tYSsxNXvnz6yHCKj/CftdEawUxXUgcIGFT+V
 mRJJz5vhCGqp2J05yB5LgX1QdSnNlAkUUe4FT30PCDtx4RQuAFbEeV/flJizX/fly+jrmDp1ikF
 If1itzxnlMAYIrAT0TQKvpUh/t0Xpd7/goOMPztpMzeKEVfMaSZt+WpUXEJBN9y/GjTGNUwvsxF
 ZuWpdDGHAMhW+M7EQkg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-20_02,2026-01-19_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 bulkscore=0 adultscore=0 impostorscore=0
 malwarescore=0 priorityscore=1501 clxscore=1015 lowpriorityscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601200086

Enable secondary USB controller in host mode on lemans EVK platforms.

Changes in v4:
Updated power supply property for hub.
Updated details for all 4 ports of hub.

Changes in v3:
Updated binding properties for genesys hub.

Changes in v2:
Add Genesys Logic GL3590 hub support.
Rename hd3ss3220_ instance for primary port controller.

Link to v3:
https://lore.kernel.org/all/20251220063537.3639535-1-swati.agarwal@oss.qualcomm.com/

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

 .../bindings/usb/genesys,gl850g.yaml          |  17 ++
 arch/arm64/boot/dts/qcom/lemans-evk.dts       | 217 +++++++++++++++++-
 drivers/usb/misc/onboard_usb_dev.c            |   1 +
 drivers/usb/misc/onboard_usb_dev.h            |   8 +
 4 files changed, 239 insertions(+), 4 deletions(-)

-- 
2.34.1


