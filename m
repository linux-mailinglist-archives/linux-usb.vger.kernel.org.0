Return-Path: <linux-usb+bounces-33965-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eM3XCuH+p2nUnAAAu9opvQ
	(envelope-from <linux-usb+bounces-33965-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 04 Mar 2026 10:44:01 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C1F4C1FDCAA
	for <lists+linux-usb@lfdr.de>; Wed, 04 Mar 2026 10:44:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 1FD9B3048993
	for <lists+linux-usb@lfdr.de>; Wed,  4 Mar 2026 09:43:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A1D139EF2A;
	Wed,  4 Mar 2026 09:43:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=airkyi.com header.i=@airkyi.com header.b="hvGvt668"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtpbgsg2.qq.com (smtpbgsg2.qq.com [54.254.200.128])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9B583914F0;
	Wed,  4 Mar 2026 09:43:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.254.200.128
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772617424; cv=none; b=oLtcwTyqUKqkwUPkHh6Rvxp+ShSuDnmHGhiBjVZ86CYeFDYRxeCvWIwXn96HD6XUfSFaAaJ10xlOIyQLSI/9lOTgPV+tErPcFpentl/UGcZVv6wDOjsKah0YmpgZcZiwag3exm6rFeMlvDSggp9tK+yAQEYa4RflP3YFykVc1Ps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772617424; c=relaxed/simple;
	bh=4YalIBUlKCSuqLKMYj8QW21cucOEQ0PxecICR8IYRKQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=ZCRPMRAZA3BBQN5v6qMgYXLPxCbsJ3bkpdM8etaEQv7N1baQmOHOv3sReF5z6gjMdxFekmo0zi3kuvsUA8oJ/90ZbifFINu5P6oZV08qzSSGnTQC+Xd0lzeYCEvh2GT/Sd3Q8/FicsY+/ZSTYVfsJBFV4FgZ+CRNCO2M4G4I2UE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=airkyi.com; spf=pass smtp.mailfrom=airkyi.com; dkim=pass (1024-bit key) header.d=airkyi.com header.i=@airkyi.com header.b=hvGvt668; arc=none smtp.client-ip=54.254.200.128
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=airkyi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=airkyi.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=airkyi.com;
	s=altu2504; t=1772617394;
	bh=6RKYrl9uKKYeoPLwxT7m43ODsBqPn7Ulx0XyJQsA0lM=;
	h=From:To:Subject:Date:Message-Id;
	b=hvGvt668wGBcc7ZggozHfba4px6hK488hHCusfPwAqU8lr/O+h9K18c9nG8ZZqT6q
	 1KBARuxCS6Jnu3q5vFOz1ol0gg2h4Xajrfa6XSDcOWeKaLHsUILfWHOQn/yF3nFOiZ
	 MJB+GnQ8ZBYY0pOehebTUPt6Ra83p22yg1uKtNU8=
X-QQ-mid: esmtpsz11t1772617388tfeb4e152
X-QQ-Originating-IP: +aJbc9WVF6tbHYn3OXz/sefWHKyzghaWilNXBu+Q7Yo=
Received: from DESKTOP-8BT1A2O.localdomain ( [58.22.7.114])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 04 Mar 2026 17:43:03 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 1682592045439921271
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
	Dragan Simic <dsimic@manjaro.org>,
	Johan Jonker <jbx6244@gmail.com>,
	Diederik de Haas <didi.debian@cknow.org>,
	Peter Robinson <pbrobinson@gmail.com>,
	Hugh Cole-Baker <sigmaris@gmail.com>
Cc: linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	dri-devel@lists.freedesktop.org,
	Chaoyi Chen <chaoyi.chen@rock-chips.com>
Subject: [PATCH v15 8/9] arm64: dts: rockchip: Add missing dp_out port for RK3399 CDN-DP
Date: Wed,  4 Mar 2026 17:41:51 +0800
Message-Id: <20260304094152.92-9-kernel@airkyi.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20260304094152.92-1-kernel@airkyi.com>
References: <20260304094152.92-1-kernel@airkyi.com>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:airkyi.com:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: NnA3IMNPwBd+CNTmwMGxqBe495Mx24MrOBi8iXp6tu4PbVkC+LGzFPi9
	tUutEw6vyBzcw+PoYCVN6j5cSx74ETipj/6ftbOLVyCd6V8fedGPV1attH7bFqN10E+RK2L
	aVTO4oR2MfCDJUi88F2xgiPfsjpNAfCzZjoxeAFEEBwvgvoXlX0iL6RrwrCUhW6uV7E7M5P
	oZb3iKHKESXjDYmysAeKI9+kRPqWAWm0c+aYEy4NKWPOdXrIpPSYhTWZTbk0C6JhxBQ5DKk
	yOIYXfyKNPVa+JyU7CF8omoumWmVkzOo8zg6r0SVo0N+PjsbxmQUIHZrconZ7iAx89539d3
	eTd5q5X/FSQjbpnkdbTd6JDQ+7RK6tvMewFlcXAoZ9iLl66TxZu3fAjU+Y8oTKslJbCcyQw
	o7x/Tfp8soZSc/zQNhRA8gXoYWtsbZyAwcAtP2rMvud/GM1PKwoU8sCfFUMMbdeOoPFa6aL
	XHzaQnFpDjEK7YxSO75T2HBxGtgA/Mgm+YMUHpWqUAVIth1Qx9a1Pmors34GQ2/LW+9bq1s
	TVW7VBXOWzt97UsiMSFOjvplno0ekPhS8Y2n7UBXrN15tbI8cPP8wEu8hGh8CIp0XFuSqgS
	9ibPSPrwQ9caVa5QAFNFaz8oCI67YeVICT87Glu5Zx7alyttHqHyPrjk45rLaZP6slbeI0G
	VxqmkqglGpkp8iwKDx9XepMLVgzymVbFaRmJdpQb56fl4TFabYOTs/7vwGJgBll8L3eRuyZ
	F/pM+l2mm8O52+eWQDmzmfN0+YJCH9vTnFjlc+9DCTEt5Me4uRQGe1Exz40BFZrloaGsF71
	h533KIhCiU2r3t1ehTxW2cLUFXJH1eN5pDy8m0iuPQ847XQRwsNcp0ByZAnmTq4/yZhSdrF
	vtPHOyb42HTzvGEkc8ZVQscDYGiOvr8yP98/1YcKXpfBAcLiYQj52AM+O74dI165Ou1cq2P
	T3PM1Yr/hWa2GPmhxE1UiDqAz2vQboqKtJW0AcADChlFivq90zxNVr2jMbu1f+Z9T0FJp2D
	J7lFMxlJPLOY11F7UwEeYfeFjp/HwRyWKclRbZsw==
X-QQ-XMRINFO: NI4Ajvh11aEjEMj13RCX7UuhPEoou2bs1g==
X-QQ-RECHKSPAM: 0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
X-Rspamd-Queue-Id: C1F4C1FDCAA
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[airkyi.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64];
	R_DKIM_ALLOW(-0.20)[airkyi.com:s=altu2504];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33965-lists,linux-usb=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[40];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[linux.intel.com,linuxfoundation.org,oss.qualcomm.com,gmail.com,bootlin.com,kernel.org,sntech.de,rock-chips.com,intel.com,linaro.org,ideasonboard.com,kwiboo.se,suse.de,ffwll.ch,google.com,manjaro.org,cknow.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	DKIM_TRACE(0.00)[airkyi.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kernel@airkyi.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	NEURAL_HAM(-0.00)[-0.999];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,airkyi.com:dkim,airkyi.com:mid,rock-chips.com:email,0.0.0.0:email,0.0.0.1:email]
X-Rspamd-Action: no action

From: Chaoyi Chen <chaoyi.chen@rock-chips.com>

Let's make the ports nodes of cdn_dp in the same style as the other
display interface, and match the style of ports's yaml.

Signed-off-by: Chaoyi Chen <chaoyi.chen@rock-chips.com>
---

(no changes since v5)

Changes in v4:
- Remove unnecessary #address/#size-cells

(no changes since v1)
---

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


