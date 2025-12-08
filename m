Return-Path: <linux-usb+bounces-31258-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 34E6ACABC39
	for <lists+linux-usb@lfdr.de>; Mon, 08 Dec 2025 02:57:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C4D893003BE6
	for <lists+linux-usb@lfdr.de>; Mon,  8 Dec 2025 01:57:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 863F523EA9B;
	Mon,  8 Dec 2025 01:57:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=airkyi.com header.i=@airkyi.com header.b="oWq6T8kI"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtpbguseast3.qq.com (smtpbguseast3.qq.com [54.243.244.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C997E1FA859;
	Mon,  8 Dec 2025 01:56:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.243.244.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765159020; cv=none; b=H38XFQaF2sLxPK5Qf6rlHR7hMJAu0Mw80cWMfMfT861Jx7R9l/ioKj5EO/CO8CA9vA8vXG2ZWg0kK+e4C3h49BaYg0rb3vVU3C8hs+5wzuAhbXcgSevxJsJjyJtxJcfBC6Xo90pzo2n1o02SdkfJoKhVcS+V5CCtSVK9+CAqjCk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765159020; c=relaxed/simple;
	bh=UYBXRUGpsPucbSnyCek2T6kQGAmNcIEArFxOg+A85iE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=exfpWToR51k5+qKlzqNc/hBqUUHG2zq9fQ1sv1B2CcRuB0loBpuI8ieu3JI9cZHm1YCXisLMitEJn8k6BjhrBsS4vSB9KGDnB4FQ9GXUAtMMPrYiLcKIkyp1J8IO2vpdPl5vKpWqqBWMAazBZtt6pB+YKRx4JBZopPvUlriWG6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=airkyi.com; spf=pass smtp.mailfrom=airkyi.com; dkim=pass (1024-bit key) header.d=airkyi.com header.i=@airkyi.com header.b=oWq6T8kI; arc=none smtp.client-ip=54.243.244.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=airkyi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=airkyi.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=airkyi.com;
	s=altu2504; t=1765158998;
	bh=pFI7M+6j2JewnD4BwkGRc0QPG+RPFm6rGXiCORxPrVE=;
	h=From:To:Subject:Date:Message-Id;
	b=oWq6T8kIy5ueg7QDuWwDeHh1L81tQ6d8PCjG6PCPaAd5GZ+UDZ/qunGrmoKJx573s
	 HuPpqmu2W/J1QXLQaRbCBQ/QG5xq+2cWt6vty5SsHGG9ZJkBEF0ZmhAOaF3686/NkT
	 j+PS6fgFhZiGGC+ayRozrJ7NzTKTvo5eRPb/TB+w=
X-QQ-mid: esmtpsz19t1765158953tcdb9152f
X-QQ-Originating-IP: +8lPfsUXAmh9xGsf2UaKv/ckJ50+L2F5xe64/BgJqIw=
Received: from DESKTOP-8BT1A2O.localdomain ( [58.22.7.114])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 08 Dec 2025 09:55:50 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 7419382156516590338
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
Subject: [PATCH v13 10/11] arm64: dts: rockchip: Add missing dp_out port for RK3399 CDN-DP
Date: Mon,  8 Dec 2025 09:54:59 +0800
Message-Id: <20251208015500.94-11-kernel@airkyi.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20251208015500.94-1-kernel@airkyi.com>
References: <20251208015500.94-1-kernel@airkyi.com>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:airkyi.com:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: NMuAyYK0STFJRzmbuvCgY3S3V7n2KZuzRA9KA/15YsvdICNejfr5bqQG
	Pqxkmm5uJIB9vYdXruPHKNJADq6IyaIrPZn3c5LHgsR929pQlinB7CrfY22a6tbdLq1pD6S
	dfq5rCJ60YA7q18sOpEKK12OmPp3bHKUs2qRo+kxWMt9PqvaQd1DLCXR4EMCaESgYwFfCNi
	FtjqelLiikdjy2YLb0L4ZRJ0jwo2Kj2L92YyRQWVcRW8bw0DmYL7WKgU+x7DdB65SqyJr3J
	+Njf+2Fir7XmQxd56n1A9n1+7Drwrb+xfqFRWQRj3o+R8i8gXacEzMngF2ICj4Us15BrPgp
	vnPXSgQ4bvIVBKqQtli1ahLUoXBctuYqCQ/7Fw0CoN3jdvwcgbW/dHnfMsT54z20He1UlY3
	UYmlMCnf841ny4E+hF/r1qmaIAmBMCfi6FpHsIjFDbHWOhrIOYngnTvPnnQGoSA/tM4Ot6y
	97kNWHCVML5l6uSj1Q2aqVWEXxMj8JTXkzU0Bf20VnnaNlX1E+G7t7nHrk0mzV7rGsLcFA6
	gyyOTrnLkF3v1BfgpXqzWp9YTnAgTvZuOEhvqNWekbd/6Lg5kItQ5RtpVA4TN/QoGyVNn/Q
	5iqGfYEwSoZzrWqi7oV9y754k8PZ7DwdQkzhhDeJkq1ZieWbshTupwT6cr/7mBCyjdD8vnQ
	xg+m7QlhEXBqjuApJYJ+rbo4d+9KZJ2kbIcy4URl5S7CedBwIMwW3haAebkSTSlKoNOGL9P
	pHzL7sY0wtkWEzmPETlU5uKXkQBYSBVu23qG0MP281xlUQzNHBcm/3Vt25UKJ5EQyDrppih
	IKUrrOVXDHoMluVuGmbuO0gBjAPsE1UBAtd6VrvGCYWKkMkUcp3n1tGbxNJ/HiaQZfpzDVa
	tAsgASSkgADfm64peIjweMtQtMwXMH2xm+QDvTkpBHyZfrzDaQDa/9Ykwd+VqgfKRCduu4n
	9XaLDiPKHL8q3gyI9C7boQhimLeyGsBUsS9XKTLMEu4cgBPvF3iJIXfGHJYF0Lqv1KhPN1E
	qiznOwdnWmHl6E/phLCueFr0AodcU=
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
2.51.1


