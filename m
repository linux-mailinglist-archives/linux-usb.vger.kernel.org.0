Return-Path: <linux-usb+bounces-29552-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CF05BFF01A
	for <lists+linux-usb@lfdr.de>; Thu, 23 Oct 2025 05:31:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id DE1073526F7
	for <lists+linux-usb@lfdr.de>; Thu, 23 Oct 2025 03:31:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1152C28FA9A;
	Thu, 23 Oct 2025 03:31:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=airkyi.com header.i=@airkyi.com header.b="PhayfB6I"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtpbguseast3.qq.com (smtpbguseast3.qq.com [54.243.244.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8052427F747;
	Thu, 23 Oct 2025 03:31:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.243.244.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761190273; cv=none; b=q01Rsxzky+6lKDVP/Pek8s3IuWmvVRbLh76bcRhvWGfvU6RvoWWCOiIcHp4Kkv4UZFsaKuUyWvR2rkw78o7l2xqY7gGseeqRZk7R9DoZsYzNnQnELC4edEl8Ibn6Xy8qr71vVQGJxj6L1XK2Js8T8mqcARYJVBWfJVP/k+zZInk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761190273; c=relaxed/simple;
	bh=3OiqcRrs7DLfC1hTPje6cpCre8EW3o9TnIIexoI2iuY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=PI7Kv1FmTTKOLjXbnAEvRBzDVyjfNDyfdHjmDiF0z4eEoCFUqxjSSgbtnHlShmBHLgK8VY+e+DXwIlEvP4dO9AG3D0+GIqgHZxY5PM1c2cnt6kAECI9DTpXrwgX/ypcDt3TSpDyklgtARkPKcBigamFRcFgFJ8qNzZ3/Q2xKtXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=airkyi.com; spf=pass smtp.mailfrom=airkyi.com; dkim=pass (1024-bit key) header.d=airkyi.com header.i=@airkyi.com header.b=PhayfB6I; arc=none smtp.client-ip=54.243.244.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=airkyi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=airkyi.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=airkyi.com;
	s=altu2504; t=1761190263;
	bh=cDiOxEFqYuonRjIga1t9o2u02p12TN3hXALWFcjKD9c=;
	h=From:To:Subject:Date:Message-Id;
	b=PhayfB6I4L0i99BpOMAkWEpNO+fWCyDH5k307YXjnBMDw7ujz3mW8heZk36A4N616
	 3YY8h6TACKhelslTtH/y/bDbltMWvD55JDHvjbPPoHXA0EWzFbvPDg4PRYLKoTvY4z
	 xoy6nOAcVR/sweovZitKrywZaPaORDCTmpaWA0Ig=
X-QQ-mid: esmtpsz16t1761190262t8232f799
X-QQ-Originating-IP: oQ3NBPzRHx0Ix2kkEvnLPPXZcoZY0uBDIA9nYNoZhes=
Received: from DESKTOP-8BT1A2O.localdomain ( [58.22.7.114])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 23 Oct 2025 11:30:59 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 10751282431167518610
From: Chaoyi Chen <kernel@airkyi.com>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
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
Subject: [PATCH v7 8/9] arm64: dts: rockchip: Add missing dp_out port for RK3399 CDN-DP
Date: Thu, 23 Oct 2025 11:30:08 +0800
Message-Id: <20251023033009.90-9-kernel@airkyi.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20251023033009.90-1-kernel@airkyi.com>
References: <20251023033009.90-1-kernel@airkyi.com>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:airkyi.com:qybglogicsvrsz:qybglogicsvrsz4a-0
X-QQ-XMAILINFO: OTmSFDgC6DdrgmT9niapwOKL54Hii0ZohRUlz3w35GI3Hv1iBMjDgSYm
	eaoToDsewMPGeTJE1hvJbhi2Hr9DvFwUM9dFM51vEN4TbTh4EsqIP4hYTZNJVRTmbYhj29n
	t0+C5pcnnswOBbjsUjlv8Kf8f8BzrCn2SuTw5WokD3B9TDSjsdLRZbsBfNuG1m3+L3/YGAP
	7GD4m5J74ru5eRTRB4WRK4yB255k3RGzM8Yh3B2jjktm2ndEu8d0AaAsEJ579vdA28c6g53
	M+URfDz8D+GbnJrZjMVhSGEMg1z3Ls130z/C0IYhow9Q6diFrMdQirGTZMEJ7CpSoAPvjuy
	5UdRHSINrwJh0r97Zqb40ISlPOdvCQgAJbUUyza+vUgA0Hjhp7+WNaiVIUfs6sinh3NCFce
	6eLW41TPjMjckEuLNRV1ofwyc1swyZOL8WYH+nL10UmiqJUbtfPahsnnLUJF2F8/dU0w5+I
	bb5mgKOboxUxDZJ7B7qyrDFZvwyt4FYN/+3wpnFrPJsE2qb7f9yn3y9kym8YXHwrEAB/P+E
	JuHV25pdJHhclmq0tMKGibAxkC8Hl75uELcKClq1G/uz2vnGN6xUQd4KhkO4nxgZdo334Yb
	r7jDSeUEfH0HstxBouqIYkSBiCpD8wYOLEkWqKmANgboIHOOLNXMWo97zPlfF69F/LSMBZ2
	KT+AfOVk94rroNRIHDI0WzD4hl4P0VJ0L7GCkL4QgzA8ZZLYgQ0VUYn2wdYYVURceyYUmYA
	cObAfXNmc3p1YhcAls0l9+q4qkqHyyB8yGfSo98GjD4ZAdDhb9On3YD0G3wl/Czv/00D9+3
	+wiw1wbIiGG81tBoY0KLbODrresxGwP9ET9x+eobPJzQC29Mq5FuuBguhRxH+Odgx9GKN8R
	Mlz488nrLgM26K/zQDmsqQ5rvQ12dKyRcAewW0luNimNnpD+gaooD0DKeqr823LMcuIx1Jf
	Y4GUfFCAujTc8hcwbAodgGs2c8AElcaLvvCCf1LHm5mk/GZHo0ilA9oK7ciXGvLIUrBMBHE
	R1jFeCAQ==
X-QQ-XMRINFO: M/715EihBoGSf6IYSX1iLFg=
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
2.49.0


