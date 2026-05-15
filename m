Return-Path: <linux-usb+bounces-37489-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SKwzIznjBmrVogIAu9opvQ
	(envelope-from <linux-usb+bounces-37489-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Fri, 15 May 2026 11:11:21 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 3181754C1C7
	for <lists+linux-usb@lfdr.de>; Fri, 15 May 2026 11:11:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 9C0613070D3D
	for <lists+linux-usb@lfdr.de>; Fri, 15 May 2026 09:04:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3BC8643E4A6;
	Fri, 15 May 2026 09:02:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="IntThx1g"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8882E43DA29
	for <linux-usb@vger.kernel.org>; Fri, 15 May 2026 09:02:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778835763; cv=none; b=Sdk9fAD/Dn0aSuJOcY8K8cJ/BQVui0Yz9EJqxPeKM+nNroqflJnXyC6SPl4AxSA7xYdFPAlnjn2nrMYAbtrIlHA3NrpV7w8KkyB/6cvfJT/cVhDmyMxKBs3SGMjtd+C7T5eO9ntxBDRWETY17mvLRr6Evz6GmRC/gPLMtAZnZfQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778835763; c=relaxed/simple;
	bh=VrOSzPFrQvicaTFR+8obgla8JultGfpYF5nJAKr0KVE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=H264E17a+l1FZoxtUsvAINAYZ1Cdsks8rjfr74r683NK3MN9xwq2Tv07258A2TOZ033Nl4QgblkXlXIbdKXmudzJWkcnL5W1RqEQWEZzBGWmTwYlq0lhotUWvVf6L6LHyJoO1qIF/Kz3WSMDiRYw/tiOCYn1vbyrCtTpotbcshs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=IntThx1g; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-367c26471f5so4883913a91.1
        for <linux-usb@vger.kernel.org>; Fri, 15 May 2026 02:02:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1778835762; x=1779440562; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EEzJ+Z0L9sJzo3bRALn/EbUhsV+JTXUM3B754yNkOg8=;
        b=IntThx1gua/EnZx2ZFe7/kpR6hVhyNyEUOs2k/6V+pNbH5wQM1Vi7TcOx94YenaeSY
         h8dc7BzpYkhflcnMD0+IHW8dQjWY6vUjw/H2tg1BYRD3D7yKdX2nRejXG944hUODIrJi
         fp4ZXvqqCF5owqLc0Z0asUAjqMgqW8yYIJJ6c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778835762; x=1779440562;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=EEzJ+Z0L9sJzo3bRALn/EbUhsV+JTXUM3B754yNkOg8=;
        b=hIkVU77GSohKvvOtjI7pv0iVABWi7+AHAMZgOLwBQD+1OcNqR4lUelWK/SXKih7KKY
         e8X9kWWlf+LFvXALAZ4EYO5vhJ+FTjAPtAiU+9iGZCAkIJmwIrRdx6tRSExrs8muGmqB
         FsHFQNjoSpSwhgKYyMjf9nmB6F/q6DzvOdT+EEROZ7UZDvyTumX0i5RliEKxZg+jgQDR
         UsVRPanTsPiPLeJnWJVzeL/MLUVKuv5idq9+9wfCyv5g2RSEGdqcoBR5yrig5c1tz6b7
         T76+SjcSsVPt0mjA8uZf6+NJoY383RBb58+zJfudWt34haRvtgtoFlzm4X6bf6i4j5lm
         IZGA==
X-Forwarded-Encrypted: i=1; AFNElJ8d3tD9XOYjoD59klOzvWJKWlbpaHgCEwkagXnbhWqxpj6j8+3yuDJOzSOSBs4Dm5ptvW0E2S1Do0s=@vger.kernel.org
X-Gm-Message-State: AOJu0YySThWUtSuGxbzwxqm3ygfaAx02/CMqkSw68KS59fZvs89d2eu4
	fWb49lV0lQRkvHvhg2CV1sm60ygCQyH7F0yk9adqCuoM9UJCGeg/f6ro6uOJbiGP82/RRAdWg1q
	t7PM=
X-Gm-Gg: Acq92OGnTkkFvDR0AI18ArsIxyqh25adA8Q0OB/CrawfW4xzUVvrq8CaFqdIdmQrkgO
	DJ3XCOIk8IuPlrOXDMMg/AxCPMp5S7C6EBd9ILL16oZbFsrwR9aNOis5lRA/V/u5U5yAzzfiIkT
	6QDbKwFdw+G3jsWUhjgO2YiMVBF2wwoJc0RSqUkj/sPDLoE64tQEfEePoIpGKuKLMakYMBiuCVd
	YzuRAc3q4HxuuK2CrDGNsrKj9gNEkIgoxqFzVRM2TdrcC1HvP0TtEHE9Lkah2femu3uFV4J8GlF
	Qt2zVoPy46wNDyPHtLBeYy/Z+pLccr6TI50gGsjXAPpp1K5ai10KstxUsb6MYDdFN2ObtJA1AZn
	cewtLyf2INpWbUFdIy6oZ2C/OXagoMgrzXC3ZBXtxEwKw7SdzJMDeYCEoUpVube7Mhb9sc/nca+
	VQEMIzWp3fklIc1nTCTy60Y59SoT8eA1jWjlbDysYPtfe14W7Uo7JG2Hnrm1hEl0i8RsnHk4cmC
	s/g469+
X-Received: by 2002:a17:90b:544f:b0:35f:b46e:e329 with SMTP id 98e67ed59e1d1-3695189552fmr3108678a91.6.1778835761921;
        Fri, 15 May 2026 02:02:41 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:b3d8:e32e:c2fc:c31e])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36951584654sm2076537a91.7.2026.05.15.02.02.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 02:02:41 -0700 (PDT)
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
Subject: [PATCH RFC 10/12] arm64: dts: mediatek: mt8195-cherry: Add M.2 E-key slot
Date: Fri, 15 May 2026 17:01:46 +0800
Message-ID: <20260515090149.3169406-11-wenst@chromium.org>
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
X-Rspamd-Queue-Id: 3181754C1C7
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
	TAGGED_FROM(0.00)[bounces-37489-lists,linux-usb=lfdr.de];
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

The Mt8195 Cherry design features an M.2 E-key slot for WiFi/BT combo
cards. Only PCIe and USB are wired from the SoC to the slot, along with
some auxiliary signals.

Add the proper representation for it, replacing the PCIe wifi node and
vpcie3v3-supply property under the PCIe controller, and the vbus-supply
property under the xhci3 node.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 .../boot/dts/mediatek/mt8195-cherry.dtsi      | 74 +++++++++++++++++--
 1 file changed, 69 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi b/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
index ef7afc436aef..c95a54de3567 100644
--- a/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
@@ -266,6 +266,47 @@ tboard_thermistor2: thermal-sensor-t2 {
 						120000 51
 						125000 44>;
 	};
+
+	wifi-bt-connector {
+		compatible = "pcie-m2-e-connector";
+		pinctrl-names = "default";
+		pinctrl-0 = <&m2_e_key_kill_pins>;
+		vpcie3v3-supply = <&pp3300_wlan>;
+		w-disable1-gpios = <&pio 61 GPIO_ACTIVE_LOW>;
+		w-disable2-gpios = <&pio 59 GPIO_ACTIVE_LOW>;
+		/* PCIe auxiliary signals wired to controller. */
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			/* PCIe for WiFi */
+			port@0 {
+				reg = <0>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				wifi_ep: endpoint@0 {
+					reg = <0>;
+					remote-endpoint = <&pcie1_ep>;
+				};
+			};
+
+			/* USB for Bluetooth */
+			port@2 {
+				reg = <2>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				bt_ep: endpoint@0 {
+					reg = <0>;
+					remote-endpoint = <&usb3_ep>;
+				};
+			};
+
+			/* SDIO, UART and I2S not implemented */
+		};
+	};
 };
 
 &adsp {
@@ -791,14 +832,14 @@ pcie@0 {
 		reg = <0 0 0 0 0>;
 		device_type = "pci";
 		num-lanes = <1>;
-		vpcie3v3-supply = <&pp3300_wlan>;
 		#address-cells = <3>;
 		#size-cells = <2>;
 		ranges;
 
-		wifi@0 {
-			reg = <0 0 0 0 0>;
-			wakeup-source;
+		port {
+			pcie1_ep: endpoint {
+				remote-endpoint = <&wifi_ep>;
+			};
 		};
 	};
 };
@@ -1085,6 +1126,14 @@ pins-bus {
 		};
 	};
 
+	m2_e_key_kill_pins: m2-e-key-kill-pins {
+		pins-kill {
+			pinmux = <PINMUX_GPIO61__FUNC_GPIO61>,
+				 <PINMUX_GPIO59__FUNC_GPIO59>;
+			output-high;
+		};
+	};
+
 	mmc0_pins_default: mmc0-default-pins {
 		pins-cmd-dat {
 			pinmux = <PINMUX_GPIO126__FUNC_MSDC0_DAT0>,
@@ -1637,9 +1686,24 @@ &xhci2 {
 &xhci3 {
 	/* MT7921's USB Bluetooth has issues with USB2 LPM */
 	usb2-lpm-disable;
-	vbus-supply = <&pp3300_wlan>;
 	vusb33-supply = <&mt6359_vusb_ldo_reg>;
 	status = "okay";
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@1 {
+			reg = <1>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			usb3_ep: endpoint@0 {
+				reg = <0>;
+				remote-endpoint = <&bt_ep>;
+			};
+		};
+	};
 };
 
 #include <arm/cros-ec-keyboard.dtsi>
-- 
2.54.0.563.g4f69b47b94-goog


