Return-Path: <linux-usb+bounces-37487-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GBrvAVXkBmoHowIAu9opvQ
	(envelope-from <linux-usb+bounces-37487-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Fri, 15 May 2026 11:16:05 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CE0B54C35C
	for <lists+linux-usb@lfdr.de>; Fri, 15 May 2026 11:16:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9608130B684A
	for <lists+linux-usb@lfdr.de>; Fri, 15 May 2026 09:03:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 73E9043CEF6;
	Fri, 15 May 2026 09:02:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="bUMxrti+"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4BB243CEC5
	for <linux-usb@vger.kernel.org>; Fri, 15 May 2026 09:02:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778835757; cv=none; b=kaa9QVDEZ6UVBMNxr8W4K7sk5Rs2DaNXcuE0qIOUqkqXPOET16eapH4VPLVlIEfVRtDw8JF3fLwdTMlo9fdxBeAekqaxAhGOc6sY9uTbyvwbzkQOjvhNgaCLCErsaNwLQgZtejzZ+SfPxl/7b7/NmcxHPNUUD8J2SWdlrpEIoLs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778835757; c=relaxed/simple;
	bh=6pAbUH6Dp2ugRs5RDIe0yKeS1DEjUiAIURTicXIqUwY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qvsBGT0/WPLUPjb+rOHb3wGpzCtmXxwVfmpldd11Whk5+cQF2Tdsl5dWB4sYsAD9Fiut3O8qcBhL5AjZCu9ruw2uMi9bIO2JrirUMrI9NV3n2oS/Ht5Kfdu0Ntzi5TDOA1GZ+u2ZjnDoPTxUP1fS5uRxGOaXiuOapuRz9OMcHgg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=bUMxrti+; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-3660daea6a5so4935551a91.1
        for <linux-usb@vger.kernel.org>; Fri, 15 May 2026 02:02:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1778835755; x=1779440555; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gi/8adN9TdR0oUR/hsRlFBiThItLlG36dm/4R472kYw=;
        b=bUMxrti+DL5cdjuUph+f7J+OVkKQVS7Va88HwADdYgfspcuFt5n9wWuqqHqkJlmGoi
         xXtH1XJOvPDKCZ/4s+q7KaihI0xsth93QNTuBX3ydKDflyld3xd3NWhyowN6yc93/a/2
         DD9E/8ywwBfWx6VUCPYTpKsdRmI7/Kzwv3WUQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778835755; x=1779440555;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gi/8adN9TdR0oUR/hsRlFBiThItLlG36dm/4R472kYw=;
        b=PvrHIBk4b2XcE54dWSVOCk88oQ2BLb67BZRSE8YfQEQZNMMgab7zygESQV3gwjpBfz
         k83lMAfR0jp9ZEpnPi9ioBwa1kJRLNUKv512n05LJqfgH87wOHIWfR/TZjtm4/8bi/mX
         EYZHAdL6foo5FQKWrcjRvWR6qefptMZcDgTu97ORVu2FD5KE2tx/9S+wwMq+VqKiH3Jq
         LvUq5Faj+D8rSCH/7GKBe4m7J8veHKujsIpJz7UOkIo8Js2KzOp4s3JCulIbIbyPoGr5
         +gNvZu4UsgeEzKVeGhbArt1WgRzoLxW9n2ANRiXuYkwLnZ8nbmF38fvIshj9xOMyw2mX
         El7w==
X-Forwarded-Encrypted: i=1; AFNElJ/qEzHJzzJzhz7+xAAzrFsZt3XE22r9B84/TykhPrQydGPb7wTiKX+prA7rnXTxdqH5ISh1MhZuzeA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxuubhO0GA+nyFrSo3YCJ4H4xICdEs7tNv+YXVfsvVJlw3FIshy
	BCHbpHPE8uF43MEqUjQuPz8bEwdEH4hy7QwJxptWrvlzXKXqI/39cm3Pr9bXcAfzbg==
X-Gm-Gg: Acq92OH4VXGdALsDvT6j24iIAJ7WoBgtiVfgs+AeUUslPSM6m/XGqzLlY/KqZ0O0epm
	KRNOcmWKkj1v1WfTdcXuWRetUEKHesNu3j56flXZ7hG5LKftxc7M/2frrEWL2gvvvn1simOkxsZ
	kcKec6+CdfZTNBmErG0ZLX6rSPZtorcttBFiiuF4L8P5rZ6J7Pa2IXdTsK7ln4hVRtSf6R/gZx+
	izJQcNkgZCCcZ6mP57hhdlP8Rsaq0Mp0ItqoC/NETpYRYbr7HxkDZdpvQ0w9HOpVkt3gLNgFNCH
	kHQcsI2JgPkNV011r0gRqA66te1zWpXWekJWdC3IGaWmFT4QkYXVB0gtYsBkQG1GfK3rDZ2E1DP
	82uO/BWWulg8Rgq7hO7rzIk3xvNd1l0FJ4XuOEP5USIsoODLXTTr4rVoBLaKGK4vRq2EUAyj66m
	zQ1yYYDvPSfAZw+bUejc/fuKiGOb9CqT4vgVWBKt0Q43NdFcrBxXKCOVspIt5Rh7Fyogb8gaHaG
	eQawSGMcxlmwVEfzvg=
X-Received: by 2002:a17:90b:5790:b0:368:98c0:8836 with SMTP id 98e67ed59e1d1-36951a667c3mr3003689a91.18.1778835755183;
        Fri, 15 May 2026 02:02:35 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:b3d8:e32e:c2fc:c31e])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36951584654sm2076537a91.7.2026.05.15.02.02.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 02:02:34 -0700 (PDT)
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
Subject: [PATCH RFC 08/12] arm64: dts: mediatek: mt8192-asurada: Add USB type-A connector
Date: Fri, 15 May 2026 17:01:44 +0800
Message-ID: <20260515090149.3169406-9-wenst@chromium.org>
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
X-Rspamd-Queue-Id: 7CE0B54C35C
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[chromium.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[chromium.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_TO(0.00)[kernel.org,linuxfoundation.org,gmail.com,collabora.com];
	RCPT_COUNT_TWELVE(0.00)[15];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-37487-lists,linux-usb=lfdr.de];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wenst@chromium.org,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[chromium.org:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,0.0.0.3:email,chromium.org:email,chromium.org:mid,chromium.org:dkim,0.0.0.1:email,0.0.0.2:email,0.0.0.0:email]
X-Rspamd-Action: no action

The MT8192 Asurada design features a USB type-A connector for external
devices.

Add a proper representation for it with a node for the connector and
OF graph connection to the USB hub behind it.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 .../boot/dts/mediatek/mt8192-asurada.dtsi     | 74 ++++++++++++++++++-
 1 file changed, 71 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi b/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi
index b7387075cb87..fb4d92750770 100644
--- a/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi
@@ -292,6 +292,32 @@ sound: sound {
 		pinctrl-24 = <&aud_gpio_tdm_off_pins>;
 		pinctrl-25 = <&aud_gpio_tdm_on_pins>;
 	};
+
+	usb-a-connector {
+		compatible = "usb-a-connector";
+		vbus-supply = <&pp5000_a>;
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
 };
 
 &afe {
@@ -1702,11 +1728,53 @@ &uart0 {
 };
 
 &xhci {
-	status = "okay";
-
 	wakeup-source;
 	vusb33-supply = <&pp3300_g>;
-	vbus-supply = <&pp5000_a>;
+	#address-cells = <1>;
+	#size-cells = <0>;
+	status = "okay";
+
+	usb3_hub: usb-hub@1 {
+		compatible = "usb5e3,620";
+		reg = <1>;
+		reset-gpios = <&pio 44 GPIO_ACTIVE_LOW>;
+		vdd-supply = <&pp5000_a>;
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
+		reset-gpios = <&pio 44 GPIO_ACTIVE_LOW>;
+		vdd-supply = <&pp5000_a>;
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
 
 #include <arm/cros-ec-keyboard.dtsi>
-- 
2.54.0.563.g4f69b47b94-goog


