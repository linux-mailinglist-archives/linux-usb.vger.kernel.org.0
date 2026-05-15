Return-Path: <linux-usb+bounces-37490-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oN6LLEjjBmrVogIAu9opvQ
	(envelope-from <linux-usb+bounces-37490-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Fri, 15 May 2026 11:11:36 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 59AB554C1FB
	for <lists+linux-usb@lfdr.de>; Fri, 15 May 2026 11:11:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id B5143309E7B2
	for <lists+linux-usb@lfdr.de>; Fri, 15 May 2026 09:04:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CBAFD42EECA;
	Fri, 15 May 2026 09:02:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="M2v0VpvA"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1716F43E9D6
	for <linux-usb@vger.kernel.org>; Fri, 15 May 2026 09:02:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778835767; cv=none; b=D1dBnvSkYsN/RTdJjPJqd+lx47Ir73NmbzohLdA7HMrukUObhcRvYpkMP5emvXFb4EcXMxz3nkEolOhSd/Hr7BjeINAiP19bcb0IHpV6DvRgumtH0LQEYYrzewCTY5Y8fUYo1OPvJkRMVaMppOBwDkR8CApmSR8sSawxQiRN3LI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778835767; c=relaxed/simple;
	bh=Gz1BdO2CNIH1WVRh/auvzptyTOFoc+CyHx9t/Lizdxw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EyvTJuGrWT8mwVSLEPehS6WIkCKuP49fAzDxAVWNQDK5J5ACzPX1y1dI5urpGPjI2zDs2FK0Cw75RO90JgpYpSKBIb68C/rON8povYfjhOyh5gO5Vo5LZ3bCVD7G8hKATRhf0VRQmPtvhQVb8bJ2jDE3e5eaCCz+GVQ/3CyQAYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=M2v0VpvA; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-36627a0ea23so3731756a91.0
        for <linux-usb@vger.kernel.org>; Fri, 15 May 2026 02:02:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1778835765; x=1779440565; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T2ZaGVux29bB4QztqEVTUE9+3m9wph3XttnIMDbQw7w=;
        b=M2v0VpvAjlya9oG55Sn6CgaBBDHW5/dZHaKggREN3ATYa9+fAnANphMS+zRZapskTf
         BeOm2v1MqsAB/2o+441GRo1sjw/VMgch7S0wG5Cd/BpGFDY1wktLy70KpArBtgdORpR7
         6X5jlTdwuJ02fwq2KqwgyRhZ3WJpS1tU3Wu+w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778835765; x=1779440565;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=T2ZaGVux29bB4QztqEVTUE9+3m9wph3XttnIMDbQw7w=;
        b=W58jhK4+ZBl76FDr8bthWu8qlaT8UtZSy+uHMDyx0H7Hjr52IflNlWFgKCo/J3hDlo
         POvVCOvje3RdZNIkVd9kukGvO6HtPlZF6Kqx+AGeYmwu0XHknEzAGTuTGkSWWNwhNWJp
         zVfK7574xaO5gU2oe4rhEdnTi/149EilFiCKQCUwpN1RJ2rB/uNA5R5raTmjD9Rw/DKm
         y6k8gYleV6bgCZ4GZRMpSlJdqU7f5rUp0TN2J9qDucZtj+uwQaG51RXfOZnfFYPZ67k8
         hsjXnMSlanC7qwezcebo7xH8tJQvgrd8QF4USErlHRGiozIy58HtQKpDOX0bqJA7SoZZ
         NTkg==
X-Forwarded-Encrypted: i=1; AFNElJ9iIHOdp8VwNjeChxp386ckCMyxulgesINIf63PBlttg76CCBXuQmEIHEW33/l/NEzrR+shgG1qnXI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2RBvwBeOygrW/t5TJhn2CVL15EfPa5tYImGkokGAmIuHQ6BSG
	9hW9/q8MbHh35LaML+ry2Wgrvl8CDy557Lju0m3B38b4M4HkveGnlJyMwD/cN8Uw1Q==
X-Gm-Gg: Acq92OGl1ttO9afUJKUFUuXU+0xBkJJicv2/RIMHmBLMPWwGjypdk5n4fBzNLsWUWzQ
	vBPbKJcb9vXYD/Z2z0FniG+MBBxE+inuf9GGnViG7sUsjdG8jRY+KkDXYT8NLZJaS6wJXTHJm92
	zfmLWdDzB6AWoWIe7bU6vcopu7Lrok9EGYrfamkG6MrpdhVcgvFUyE2KrifsbJXpl+Oc2J6bU1J
	s+zNQ0tpiuKfvPPEDhH94luQvT7ikEmwt5VvVSuqD8lVpRVdlO2uQkQR3XG/6j4vOE1OrAI8c+D
	DssehDraQChsz3kXiUbfTvd4Msf53Nm7pNh6B8wkdGVrIZE6Q2Gn3Oufm0hW/VebeYru6GW6Her
	78p4b0UEval4vtX31Lf3l1vRTRYAE8E+6sDo5c/imd5+PgPgNw040XLebBdx18MM8nQiV3yMZfa
	Y+LLLiobmVQy9V+D0ARFscdK4BT0bUFeStV5O3ngG3v4RdI7DUqKsYfSKn2pB0zbkSFidI+zAOR
	FJJq65ZMuBWm+p74wo=
X-Received: by 2002:a17:90b:53cf:b0:366:16d1:6a25 with SMTP id 98e67ed59e1d1-369518b206cmr3162750a91.5.1778835765371;
        Fri, 15 May 2026 02:02:45 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:b3d8:e32e:c2fc:c31e])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36951584654sm2076537a91.7.2026.05.15.02.02.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 02:02:44 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Bartosz Golaszewski <brgl@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-pm@vger.kernel.org,
	linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Manivannan Sadhasivam <mani@kernel.org>
Subject: [PATCH RFC 11/12] arm64: dts: mediatek: mt8195-cherry: Add USB type-A connector
Date: Fri, 15 May 2026 17:01:47 +0800
Message-ID: <20260515090149.3169406-12-wenst@chromium.org>
X-Mailer: git-send-email 2.54.0.563.g4f69b47b94-goog
In-Reply-To: <20260515090149.3169406-1-wenst@chromium.org>
References: <20260515090149.3169406-1-wenst@chromium.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 59AB554C1FB
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[chromium.org,none];
	R_DKIM_ALLOW(-0.20)[chromium.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	TAGGED_FROM(0.00)[bounces-37490-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[kernel.org,linuxfoundation.org,gmail.com,collabora.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wenst@chromium.org,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[chromium.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Action: no action

The MT8195 Cherry design features a USB type-A connector for external
devices.

Add a proper representation for it with a node for the connector and
OF graph connection to the USB hub behind it.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 .../boot/dts/mediatek/mt8195-cherry.dtsi      | 72 ++++++++++++++++++-
 1 file changed, 70 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi b/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
index c95a54de3567..b21cbe918c1f 100644
--- a/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
@@ -153,7 +153,6 @@ usb_vbus: regulator-5v0-usb-vbus {
 		compatible = "regulator-fixed";
 		regulator-name = "usb-vbus";
 		enable-active-high;
-		regulator-always-on;
 		vin-supply = <&pp5000_s5>;
 	};
 
@@ -267,6 +266,32 @@ tboard_thermistor2: thermal-sensor-t2 {
 						125000 44>;
 	};
 
+	usb-a-connector {
+		compatible = "usb-a-connector";
+		vbus-supply = <&usb_vbus>;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+
+				usb_a_u2_ep: endpoint {
+					remote-endpoint = <&usb2_hub_p3_ep>;
+				};
+			};
+
+			port@1 {
+				reg = <1>;
+
+				usb_a_u3_ep: endpoint {
+					remote-endpoint = <&usb3_hub_p3_ep>;
+				};
+			};
+		};
+	};
+
 	wifi-bt-connector {
 		compatible = "pcie-m2-e-connector";
 		pinctrl-names = "default";
@@ -1672,9 +1697,52 @@ vdosys1_ep_ext: endpoint@1 {
 
 &xhci0 {
 	rx-fifo-depth = <3072>;
-	vbus-supply = <&usb_vbus>;
+	#address-cells = <1>;
+	#size-cells = <0>;
 	vusb33-supply = <&mt6359_vusb_ldo_reg>;
 	status = "okay";
+
+	usb3_hub: usb-hub@1 {
+		compatible = "usb5e3,620";
+		reg = <1>;
+		reset-gpios = <&pio 84 GPIO_ACTIVE_LOW>;
+		vdd-supply = <&pp5000_s5>;
+		peer-hub = <&usb2_hub>;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@3 {
+				reg = <3>;
+
+				usb3_hub_p3_ep: endpoint {
+					remote-endpoint = <&usb_a_u3_ep>;
+				};
+			};
+		};
+	};
+
+	usb2_hub: usb-hub@2 {
+		compatible = "usb5e3,610";
+		reg = <2>;
+		reset-gpios = <&pio 84 GPIO_ACTIVE_LOW>;
+		vdd-supply = <&pp5000_s5>;
+		peer-hub = <&usb3_hub>;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@3 {
+				reg = <3>;
+
+				usb2_hub_p3_ep: endpoint {
+					remote-endpoint = <&usb_a_u2_ep>;
+				};
+			};
+		};
+	};
 };
 
 &xhci2 {
-- 
2.54.0.563.g4f69b47b94-goog


