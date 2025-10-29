Return-Path: <linux-usb+bounces-29830-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 93F65C18A08
	for <lists+linux-usb@lfdr.de>; Wed, 29 Oct 2025 08:16:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id B58184E5519
	for <lists+linux-usb@lfdr.de>; Wed, 29 Oct 2025 07:16:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B5E430F944;
	Wed, 29 Oct 2025 07:15:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=airkyi.com header.i=@airkyi.com header.b="Sy8c4HFW"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtpbgeu2.qq.com (smtpbgeu2.qq.com [18.194.254.142])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40A8C225413;
	Wed, 29 Oct 2025 07:15:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=18.194.254.142
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761722140; cv=none; b=ccp0DjzZWmmeJ9W/3cfzdDch9SCsI6neHOmul1yq0HSKzI7QwYdZIOOULu+8PKM8trPEWqjF9NrQ6rjUBSS8qa+NRzww0PWiIBiPapuPMILrOWr1HLCLeapHLCX1Q821ae4Pn/aB/LSs3dXkEkVOLiLaMcJ8Fcavtz4urrlT4z8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761722140; c=relaxed/simple;
	bh=3OiqcRrs7DLfC1hTPje6cpCre8EW3o9TnIIexoI2iuY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=okn/l1X92uXs5f7LiuDmOzK7inJi1+M8B3sRsXhfyWIzWJU0BmwqDm8Ms9/eDDLJ3jOrlIyNnChWCih9lN5T9GU4g4E1pf3XUi6qgqHaQIUiQjVNH6k7YNLHvnXn4DE/L3jE5+VBUBMJz67jDMa/rk+J6ojZgV7Bopphbyyf8rA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=airkyi.com; spf=pass smtp.mailfrom=airkyi.com; dkim=pass (1024-bit key) header.d=airkyi.com header.i=@airkyi.com header.b=Sy8c4HFW; arc=none smtp.client-ip=18.194.254.142
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=airkyi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=airkyi.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=airkyi.com;
	s=altu2504; t=1761722134;
	bh=cDiOxEFqYuonRjIga1t9o2u02p12TN3hXALWFcjKD9c=;
	h=From:To:Subject:Date:Message-Id;
	b=Sy8c4HFWY5o434CVWL0VrQJSlxNoGws2p1QMXxoUelIpGbivpBwhf5/a5Jr8im875
	 kH2jpeoYpUwuE1sAOL/MyOPUobEewdcbkErQWAOYH0hZB3tXE0E87CIhIPATZ1BdC7
	 5GE/s47fIDAD22YVOi0FzSFonZM8v87ugQ0r0Vxs=
X-QQ-mid: zesmtpsz6t1761722132t2011f568
X-QQ-Originating-IP: 7NBRw7TbdpqiA0XMn9RW6Owy6xUxWMzzgSSAg2TdaX4=
Received: from DESKTOP-8BT1A2O.localdomain ( [58.22.7.114])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 29 Oct 2025 15:15:27 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 1472557446544160381
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
Subject: [PATCH v8 09/10] arm64: dts: rockchip: Add missing dp_out port for RK3399 CDN-DP
Date: Wed, 29 Oct 2025 15:14:34 +0800
Message-Id: <20251029071435.88-10-kernel@airkyi.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20251029071435.88-1-kernel@airkyi.com>
References: <20251029071435.88-1-kernel@airkyi.com>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:airkyi.com:qybglogicsvrsz:qybglogicsvrsz4a-0
X-QQ-XMAILINFO: MVbvI5amSZ2YjBsber5S6w8cbLdG5azchMi1RlLh3/nxBB3f+K5TREW+
	rxJLVZbi6RabHQ3TG5mitTZQGRfCFCQ/HG75biGospr4MpGF5MZPQYejGNoZ0nTaUk5/dEU
	/URLOJh8ziSItipKo0oIAw107EwdzBGDPgPR1qh2exI8tEI3GBXY6hhlVRcUesr11cEmp+H
	Wo296noCMCStrh/njXS/R35ipQIEUj10OYqVWs4u0O5tOphCHbvB66DxgLel9MriUn1QStZ
	SP0anpBwQ/m02adVHvV0oisnwPR5gpniFn0/QnLLlbW5cBOkrZm2GMnCwN65Uo9sS9Gq9WA
	XRggnesMEsPtfK1CKKTLDFv6FnBEUBt/OV+vOXJf6oSdFC/ALSjs2oTXO4Bw2/3osJRn8Ku
	dUnbB8ed8HHVMDqk1wroZ6RyPqyK7RpGHubG4fEFlBIfrmiBpjqrwBwZDx9DM5EZuJ/2Oja
	HJTvVWhBwzzEzn0dgLX1qtwlLXEHUconBV/wj9phpd++xo/NV93QcfDyee0WKuArZK3XIgF
	VAVL+knJjtH3w7CnZ5E5tjSF6rX5MJ0KJO/gB4XEMVot8iXbwqqiPblXRKybJCOhA7GQl9+
	AayP7U0bP3Iang2Sug+GiqJmebG70yYqSCSVFPco1KG2o6ks/0FGXo1I/P5iH1aywsHordC
	USudTctc0XY0O/JQVAQIom4ZWgMyFZUOsfGEyLVm+pE1YtWINNEhqtIY6y8K9z/cN/U7iyY
	XxH/LtCHplz1Nnqq7Ix4XLGIMaGuQQzK2OC00sWULryIR3fDubppCnF7KCfjZDojmTRgc5M
	24wh63l1vcEpvxh+PD+90rkrvd08JkEqH82dST+bcO0XIzFaT8dLM4xzJZQ6oh3HuX45scn
	p474xnvS2Vg9CkeHPWNLTeZjAUssbagGxJ3yvGLdadfIOhys9Q/eDFwYhIOZ0jcriSpb0im
	Gx1GQiFrbjc2K8nKyfjmnJxfuP+5tRqDuXxNSqhEZrpRIJp5bce5xue+dRCiCyaF/USXgvS
	QwM8RPiv4JnS8no4pbt9IkLLKHYz1kqSD5IOWSxw==
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
2.49.0


