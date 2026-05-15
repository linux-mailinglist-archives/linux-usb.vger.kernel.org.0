Return-Path: <linux-usb+bounces-37488-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qFxRBCLjBmoBowIAu9opvQ
	(envelope-from <linux-usb+bounces-37488-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Fri, 15 May 2026 11:10:58 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id EEA5954C19A
	for <lists+linux-usb@lfdr.de>; Fri, 15 May 2026 11:10:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 8C6523063544
	for <lists+linux-usb@lfdr.de>; Fri, 15 May 2026 09:03:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C4E0742E012;
	Fri, 15 May 2026 09:02:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="NHdrkCBi"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C42342EEA8
	for <linux-usb@vger.kernel.org>; Fri, 15 May 2026 09:02:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778835761; cv=none; b=befIbioNZDFyN33c9pNcji1xGD/+jGNcXGqwvYGy//JiZbLP4cCTJBQ35Me6CX0pqEfSbM+l58dpDn/WrsTJT9OgglRg4LqZg4/RCWaYOodvHmj/+VaT5FMLSITXWVJzAD6k2e2xPavzVtQIhP3Ow3oddeSj61vxLXDe2mCVJ30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778835761; c=relaxed/simple;
	bh=N43s7YYjxhkf+GkW3rTXjXBZcOKRHT+sr+u8J0torXs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HrLTM3DScgcAkpHqMMBWID5lCSr/NQviE3shT1v9yHgIfY8bIleUkzNtGWLpIAT1JwurnQPbZH2z5/3OWqNEiV3vEuI8Ve+6UTq9BsVqun8YtK9UobfDXCuQ0o41ovr7BgqhMA9SQwdTjop2qKV8GuVoVfYdqc2dxHOFM5z4ycw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=NHdrkCBi; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-c80227b1f6cso3936167a12.1
        for <linux-usb@vger.kernel.org>; Fri, 15 May 2026 02:02:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1778835758; x=1779440558; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9YXeYvlbGnNmMv9PUsmYFfNNN3O6C6muQR1bAD60qYI=;
        b=NHdrkCBiWeitsIo035FAAwltK+dvELq8z0rJxKNuw7KfOKdaxKhJXoxAjwwsr78Rhy
         B31z87CNuSO172vT2iMuYQGdf9C9SEd+g2tSNwPSupWdMJxx37+MtUuJoDgLC7yhDO/p
         8W3AobpOhae7hZkthHul/RN0paAG/pPmyv468=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778835758; x=1779440558;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9YXeYvlbGnNmMv9PUsmYFfNNN3O6C6muQR1bAD60qYI=;
        b=MGLsNH1O5bOLTg3Gc6DhsgkcDD8hLwBqASILXTXRv9tyAOeNNtQ5arxFWBnZWjYqT9
         JtiEy9LwwrH6nCyQXa0Ynt7R15aFxmBsGNLFZSpp4SMWBiOiaTIKLOQozGKaxXXLA9tF
         4siFnM21ON4kTWOezSFEbiZIPgvSB1XF2wwlYS0BnJYVcjhgHGeO+kSAglfiNTxAy1P1
         1wrOJI5zZ8sBhS+q8D7kPGxvShQkznaVEPV2s4+ja0dKxFmsB4H2J2Dn8omggbDkOKKP
         Bv0XBlw+kY9/7v2sU/CTVFOe/DUFCDtY4Q5W9O6qoYTLsih55++08mzBjcCZrjfT4b3q
         kKwA==
X-Forwarded-Encrypted: i=1; AFNElJ9QavV+usWilHW+k3hqQWkLj0A1Bqs5H01IA9s9EM98pi/6zeRklyxL4PsJ2TWBrnH2AK+gfEVg1yA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxN5r9Gps8r1GgZlY02NQOX3RJP5XjqTpNY/Q0iIIJLWC2vFUzG
	hycK1kPFNsa4Sp/FD91u98+N4Jjfl7O9xjEj3f9e7iuR39ETtvZddfABwbpMcmts7w==
X-Gm-Gg: Acq92OH6ckxmqtakHSBxWzh2M8jucDm7grRTT3uo922Y82+GTcKGaL0u6ORwIEexfUG
	aas7mrCLMwBDP5eqALvy8DGY0DukgAQEQEqBOsx9APCV7QhDoQunah+GfnI0I0J/T//3HUeoD7n
	q4Iv+CfoXlBOVYQTCUhCX+ABQm1BEoCdiD3p0qfpR7bCJqcwE+mQdLYWKmYXjEtTcYIpsuCDk00
	7KsfNDFr6I1zjceFIoBHwaalNtfUfbLCUiZN90ur+5Lo/oJHOjMh0OuAkG2pHqD2UhgsP11CA65
	CXvINQhmq1x20xzs0FdHzpSB7OBPNAuQG5sYdv26KBcfTf2h0fODCYSypZinyw9JvFbhAQnR9tA
	R1LCdiTAYTSrnHqYs1x6CJJ6Oxi7sBAs95ESyZY2pVn1NzvHTsXiRzYUoLZ5VugzDYABD7x04ta
	gi5Pv7o23XQQTgaQDl1GFcbgKnQxXhJyB6G5WNq6m9qiGYls8cAKYiwdXmZPXdLFuqCLSdIAxXX
	JwUqPZV
X-Received: by 2002:a17:90b:3d0a:b0:366:479e:63a5 with SMTP id 98e67ed59e1d1-369518b25cemr3280292a91.2.1778835758557;
        Fri, 15 May 2026 02:02:38 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:b3d8:e32e:c2fc:c31e])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36951584654sm2076537a91.7.2026.05.15.02.02.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 02:02:38 -0700 (PDT)
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
Subject: [PATCH RFC 09/12] arm64: dts: mediatek: mt8192-asurada: Add M.2 E-key slot
Date: Fri, 15 May 2026 17:01:45 +0800
Message-ID: <20260515090149.3169406-10-wenst@chromium.org>
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
X-Rspamd-Queue-Id: EEA5954C19A
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
	TAGGED_FROM(0.00)[bounces-37488-lists,linux-usb=lfdr.de];
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

The MT8192 Asurada design features an M.2 E-key slot for WiFi/BT combo
cards. Only PCIe and USB are wired from the SoC to the slot, along with
some auxiliary signals.

Add the proper representation for it, replacing the PCIe wifi node and
vpcie3v3-supply property under the PCIe controller. Also clean up the
pcie controller node.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 .../boot/dts/mediatek/mt8192-asurada.dtsi     | 65 +++++++++++++++++--
 1 file changed, 58 insertions(+), 7 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi b/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi
index fb4d92750770..901240384a4a 100644
--- a/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi
@@ -318,6 +318,41 @@ usb_a_u3_ep: endpoint {
 			};
 		};
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
+
+				wifi_ep: endpoint {
+					remote-endpoint = <&pcie_ep>;
+				};
+			};
+
+			/* USB for Bluetooth */
+			port@2 {
+				reg = <2>;
+
+				bt_ep: endpoint {
+					remote-endpoint = <&usb2_hub_p4_ep>;
+				};
+			};
+
+			/* SDIO, UART and I2S not implemented */
+		};
+	};
 };
 
 &afe {
@@ -671,19 +706,19 @@ &pcie {
 	pinctrl-0 = <&pcie_pins>;
 	memory-region = <&wifi_restricted_dma_region>;
 
-	pcie0: pcie@0,0 {
+	pcie@0 {
+		compatible = "pciclass,0604";
+		reg = <0 0 0 0 0>;
 		device_type = "pci";
-		reg = <0x0000 0 0 0 0>;
 		num-lanes = <1>;
-		bus-range = <0x1 0x1>;
-
 		#address-cells = <3>;
 		#size-cells = <2>;
 		ranges;
 
-		wifi: wifi@0,0 {
-			reg = <0x10000 0 0 0 0x100000>,
-			      <0x10000 0 0x100000 0 0x100000>;
+		port {
+			pcie_ep: endpoint {
+				remote-endpoint = <&wifi_ep>;
+			};
 		};
 	};
 };
@@ -1206,6 +1241,14 @@ pins-bus {
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
 	mmc0_default_pins: mmc0-default-pins {
 		pins-cmd-dat {
 			pinmux = <PINMUX_GPIO184__FUNC_MSDC0_DAT0>,
@@ -1773,6 +1816,14 @@ usb2_hub_p3_ep: endpoint {
 					remote-endpoint = <&usb_a_u2_ep>;
 				};
 			};
+
+			port@4 {
+				reg = <4>;
+
+				usb2_hub_p4_ep: endpoint {
+					remote-endpoint = <&bt_ep>;
+				};
+			};
 		};
 	};
 };
-- 
2.54.0.563.g4f69b47b94-goog


