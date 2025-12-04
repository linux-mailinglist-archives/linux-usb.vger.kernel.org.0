Return-Path: <linux-usb+bounces-31154-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 53526CA28BE
	for <lists+linux-usb@lfdr.de>; Thu, 04 Dec 2025 07:34:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 22B4B3020372
	for <lists+linux-usb@lfdr.de>; Thu,  4 Dec 2025 06:34:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6239C315765;
	Thu,  4 Dec 2025 06:33:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=airkyi.com header.i=@airkyi.com header.b="G4rGFW6B"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtpbgsg2.qq.com (smtpbgsg2.qq.com [54.254.200.128])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02CB8314B62;
	Thu,  4 Dec 2025 06:33:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.254.200.128
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764829986; cv=none; b=RDCCIDCTwbKyKf5mfRPRZveyKvDq8BLbZCAoKA+/12TC9nIk0J9OJOV66AJnZEUbOPS5k32smjd4epAoohYtMadumtAx1qqF/CgovZfzjxbYEM2Xc+Ox7T8W8rS5t6cGQ1XTl/87mbenOspVCuDNMnk4qsWK3Sa3ZuJg/Py4oTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764829986; c=relaxed/simple;
	bh=UYBXRUGpsPucbSnyCek2T6kQGAmNcIEArFxOg+A85iE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=hQFb6V0GDLaAQuTdwB8XBHW2yCvHb7UcACnnhEyr8JhnJbtekdPW7UGHJYPoJPdQemL+joityupXasf3zJ/mIy42t4sl7DC3MC4k68FuG66rLDiOEf5XAruBQ4dFJL1xNCYyAMcu0BUvWrk3FBUDvCwLLWZ3D5GKaRE+D0G1gL8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=airkyi.com; spf=pass smtp.mailfrom=airkyi.com; dkim=pass (1024-bit key) header.d=airkyi.com header.i=@airkyi.com header.b=G4rGFW6B; arc=none smtp.client-ip=54.254.200.128
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=airkyi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=airkyi.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=airkyi.com;
	s=altu2504; t=1764829969;
	bh=pFI7M+6j2JewnD4BwkGRc0QPG+RPFm6rGXiCORxPrVE=;
	h=From:To:Subject:Date:Message-Id;
	b=G4rGFW6BaX1A9pLnZqYAWDT90nj+jccTFEb10JBP3lMvinA8x41QCcCvnAR1JBpuJ
	 BNAz6k1OKS9D8RNK/1Syo4y88Msbj6iju6qRNJNKdb7cpsnKxuVnLcKEfv6cqppkdx
	 10hfccrx//zTPrKEHb4WX1O7v7x/F8adi0Th9+m8=
X-QQ-mid: esmtpsz21t1764829922tecf1257c
X-QQ-Originating-IP: NiUTsEaeW2rSOfSbtTwTjvQzd57obr2vgj+TkXCiLyQ=
Received: from DESKTOP-8BT1A2O.localdomain ( [58.22.7.114])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 04 Dec 2025 14:31:59 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 17220348659415043936
From: Chaoyi Chen <kernel@airkyi.com>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Peter Chen <hzpeterchen@gmail.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Sandy Huang <hjc@rock-chips.com>,
	Andy Yan <andy.yan@rock-chips.com>,
	Yubing Zhang <yubing.zhang@rock-chips.com>,
	Frank Wang <frank.wang@rock-chips.com>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Amit Sunil Dhamne <amitsd@google.com>,
	Chaoyi Chen <chaoyi.chen@rock-chips.com>,
	Dragan Simic <dsimic@manjaro.org>,
	Johan Jonker <jbx6244@gmail.com>,
	Diederik de Haas <didi.debian@cknow.org>,
	Peter Robinson <pbrobinson@gmail.com>
Cc: linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	dri-devel@lists.freedesktop.org
Subject: [RESEND PATCH v11 10/11] arm64: dts: rockchip: Add missing dp_out port for RK3399 CDN-DP
Date: Thu,  4 Dec 2025 14:31:08 +0800
Message-Id: <20251204063109.104-11-kernel@airkyi.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20251204063109.104-1-kernel@airkyi.com>
References: <20251204063109.104-1-kernel@airkyi.com>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:airkyi.com:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: NqN/wpVFVRYXfOkkt/5joF1Y+ozz0DVVJrvwNxc3aHN2fao2K+ZvqR3L
	GFNv/f0wbyDYBVqAvyBbyeoV2g3DAgOQJQ5LToUg6rY6LVdMh2vCjt4mZfEoiFzT0ByV+sl
	p3z/TowmqajGQGWCQe/dl/c8xP59WoWzimRF1yxSwF2R/oaY+ocXTnUaefAws4QiVKv52wX
	G3hdrWbFteebQxWvXu+VtlHrnbXaKKTOgK1Fg1Au+DcSYwIljVpXznOCX6608MVty7xlqMn
	ZJ5Hpfbhxol2SfuBT8Y/IRJxqgFQ60PvzNJIiPCXfMmlGTq87Y7B54it8UunSp3CS3Ts++/
	9kHAIrgLmsRe52X+A1X8kgFAjVyRnRQUhIVZI+DY3NUDIU6B/5mWcu959KudU26ZEGKNHfk
	6T9Urrpw1n0MGRq+3ynJHGpaKJWrFlqD1s0dAlvI22Fck9KnCKSW6s04B9rCde2E1+WI+wT
	TPU8P/nn8U5bL30fg6A+s0A69t16qlz9xAMDEHrGThg/RD1mG+86SxwGx6qt/HKlejp8Gkm
	Za+YfzeNB+ik+J+6u2jLnnHVT9rEhSfW2E4ef1SjfRyNBACrnj/jLn0z6YdNX79fgjwedPV
	bAz3UDv7XzXsLJ+0reNSFftZv2QZs59Oan/uLJhGtfYiO9+KPLHitZPBIXj5AGLha5E5sly
	by10qqnfbFIxAaxuzYj4ZAYzZrZmRWnSF2oSIWLymScYIWGRRh/iHOXCmWdcJ5hI925TfaP
	cb+890ehkdbe74wTAg/rx3HwKM7HAWw6GyPe77B4ZPcglS+u2JWuQuOmToI41Sn8fKKJObR
	IjMYRFGCf2l6vBMgECRzjrXbSS3kdeneSN7KM2W+r77eriTd8mu9FEy5B691zXoJbDe07Em
	INyZMjBMmHuf/+KrTEq/2bmE5GwjCl68rACHbMh6ni3IRcvDDy0pBAX6V5eABfV11rFMTMd
	fYWVnDnxDVWAH65pJeJoLKqqCSNmg4+BJX9PkllNUxFN8SY+JsVkbMvmiKwNu5Rszx/Y=
X-QQ-XMRINFO: Nq+8W0+stu50PRdwbJxPCL0=
X-QQ-RECHKSPAM: 0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

From: Chaoyi Chen <chaoyi.chen@rock-chips.com>

Let's make the ports nodes of cdn_dp in the same style as the other
display interface, and match the style of ports's yaml.

Signed-off-by: Chaoyi Chen <chaoyi.chen@rock-chips.com>
---

(no changes since v5)

Changes in v4:
- Remove unnecessary #address/#size-cells

(no changes since v1)

 arch/arm64/boot/dts/rockchip/rk3399-base.dtsi | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3399-base.dtsi b/arch/arm64/boot/dts/rockchip/rk3399-base.dtsi
index 4dcceb9136b7..93b42820998f 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399-base.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3399-base.dtsi
@@ -618,7 +618,11 @@ cdn_dp: dp@fec00000 {
 		status = "disabled";
 
 		ports {
-			dp_in: port {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			dp_in: port@0 {
+				reg = <0>;
 				#address-cells = <1>;
 				#size-cells = <0>;
 
@@ -632,6 +636,10 @@ dp_in_vopl: endpoint@1 {
 					remote-endpoint = <&vopl_out_dp>;
 				};
 			};
+
+			dp_out: port@1 {
+				reg = <1>;
+			};
 		};
 	};
 
-- 
2.51.1


