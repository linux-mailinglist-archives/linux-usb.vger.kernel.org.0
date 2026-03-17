Return-Path: <linux-usb+bounces-34972-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CJrVGWSbuWlzLAIAu9opvQ
	(envelope-from <linux-usb+bounces-34972-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 17 Mar 2026 19:20:20 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6799D2B0D47
	for <lists+linux-usb@lfdr.de>; Tue, 17 Mar 2026 19:20:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 866F53087792
	for <lists+linux-usb@lfdr.de>; Tue, 17 Mar 2026 18:09:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 315883E3C7B;
	Tue, 17 Mar 2026 18:08:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.b="csNOpWSW"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A55C93F7863
	for <linux-usb@vger.kernel.org>; Tue, 17 Mar 2026 18:08:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773770910; cv=none; b=RQpQDbK88U+vEYD1MjF5FvSTPqE14xwLvCxsrUgpv+HQwdaWpM+MWjj7XZ7rRh6+B8Nbk4Rsuhr8++VOA+iVea3XbCC/tGWKBQ7IBXes8PTlSQowMgUUvvb9MlWNmjIP7iAt4LiQ/zoc9LZRGWLkB9kKduMXliSZ+URGfRa5EGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773770910; c=relaxed/simple;
	bh=IcqKl6Q93uEU2+8AL9hVIxItRFtJRUZB5AVhl781nlw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lEIuMRh3rVoWiss1KwfsNPFfcZ4QuWha6/95x5wpG3Zux+XG3xDNEGXGs/NFwLpPRqaOS+h3zoQyVrRjMCgIQZ8lHsykNhbmqTYNt/9p09BEKN3lLBOSU/9HxBjT2jacOkQcGMwUTK+njdHJikgkkxeSeQFxMz9aqoDu8kVaqME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net; spf=pass smtp.mailfrom=flipper.net; dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.b=csNOpWSW; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flipper.net
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-48540355459so58575715e9.3
        for <linux-usb@vger.kernel.org>; Tue, 17 Mar 2026 11:08:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1773770904; x=1774375704; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=z7IffOQPDV8+R2vLMwqGaiOzpiBs5raeLy7NwaqA2zE=;
        b=csNOpWSW243w2N8IZI1VNWQR/aVyoptPIRWFEdGUUJ2532ferNRpS2NUjt12FORKue
         5M2XFyBYdEHnkuNmMhQ/5Mj00Yefni8jqSSi6mJXayoDFASh8y4aZ6WXfVdnxn/iV1Oy
         VjC7yExHeDUfajXQAMhzABWgfFgTeW4Rw65uznI4RpC+g/kDmU+F06StMXVHT68yA7Dg
         yrn9KN0sjoU0ba68xsly4M5UQT4Ncxsgam/1isE0X4NQsHgH6e5XODTW+hzKfcxiYrL6
         UOAhUkPa3x3AyhsQ/lnMeP00eD4bTh9CozT6p9TAXSLA2w2oCgnKw+WH5S94Uo/4b0Ig
         Dvvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773770904; x=1774375704;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=z7IffOQPDV8+R2vLMwqGaiOzpiBs5raeLy7NwaqA2zE=;
        b=ismA2kzcFERi0mkjUXxepjXnurBQ/Jy2FZz3RTV3u9LamHJllDpaJ6Q2sjXV59+hNX
         X0RAcZ9EdNV1bfOVKa4gC+TTGcudjRWtJbCgzGRwLEvdnlWvnLi6Xus2+dfUglPsYS6V
         Q5ZuOaB+m341hCdaKUwvXevOcWCljn2o79mG9et8ChcQhZmFOLWOnZmZ2TPxEH410OQ3
         fY5XaJbPeviCj9C+T/3/GJMwzHeoeTwl/4a47e4jAeVQ9vMAIN2VwBgr1eJmmMIw8Syt
         s5cwvecVSD/wJGxzfv8Dz9QvjyFkuyLy0ZMw2RmRGCJSXnWd0of6wdwye4SU8M5X+xRi
         q+lw==
X-Forwarded-Encrypted: i=1; AJvYcCUFzf9xuEhWx7qnLnvtY58kiHxuFDEHLAoVfDLAExBN2pkMuJjtvhtfISInpkCPnJnbhSCIEk/MzSo=@vger.kernel.org
X-Gm-Message-State: AOJu0YyE36OMClTTAXiu83ahMQcHlZB7gQyyvfbWv9PeUlyt0LdFucsJ
	sxkQMmx4vVqlrwx2GAAqacVTAybYkjqCEEKCs5eonzl2udsi6s4bVr1FW0fKrTvSBAw=
X-Gm-Gg: ATEYQzwJf8ulhiRJqA97cyxuoNZ3tv3rrE3ovWjo5esK2Wiej1LE77S5ZhsQcWah11r
	90Q0KAlmE3vfiM2FvVQerefgl3hNcf/5kSQCDh39nWpdMEHH5xz5KxMHZ7Rl3AVCOk/J7rrV18L
	GB7sbQV7hCj0vjOZLgNpAel9Gh8zYM+10J3XCpe4C99NQpyrt6rO89LLWbNyjiaqhLPSSFzrMGJ
	XPubUfcz50alZ8IdSAgF51n9lVpshQxOnQBjgFHAmCbL8/QkOYD/ayyW01ryuraRV8VF7w1L7Ub
	4VMeQpVQlMfmgOGMdJqwi7yVKshysFrgKXzZBjMXyKZqIh0Pif9EfpvBL+2eIQKko8cT+A57WU4
	Vy4n5CwlWR63o5S3TuWEDbqOoN8Mqh+aq1BT18LYT8lJtykLXgibGIDeypie15sOr2FcCJx8qIe
	vuLbw0P4ZGvUWI5HV1eSfFdbtFv5+1QbzW9sf/VHwj5XL1mXmkYqPEtGMeJnZW87fD8QVyffsqR
	Tc32g==
X-Received: by 2002:a05:600c:620c:b0:485:40ed:2d1 with SMTP id 5b1f17b1804b1-486f4475049mr8830515e9.17.1773770903842;
        Tue, 17 Mar 2026 11:08:23 -0700 (PDT)
Received: from alchark-surface.localdomain (bba-86-98-192-109.alshamil.net.ae. [86.98.192.109])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b5184b8b9sm1436536f8f.1.2026.03.17.11.08.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 11:08:23 -0700 (PDT)
From: Alexey Charkov <alchark@flipper.net>
Date: Tue, 17 Mar 2026 22:08:02 +0400
Subject: [PATCH v2 5/5] arm64: dts: rockchip: Add HUSB311 Type-C controller
 on RK3576 EVB1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260317-husb311-v2-5-03c17c986abe@flipper.net>
References: <20260317-husb311-v2-0-03c17c986abe@flipper.net>
In-Reply-To: <20260317-husb311-v2-0-03c17c986abe@flipper.net>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Gene Chen <gene_chen@richtek.com>, Heiko Stuebner <heiko@sntech.de>, 
 Yuanshen Cao <alex.caoys@gmail.com>
Cc: Sebastian Reichel <sebastian.reichel@collabora.com>, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 Alexey Charkov <alchark@flipper.net>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1866; i=alchark@flipper.net;
 h=from:subject:message-id; bh=IcqKl6Q93uEU2+8AL9hVIxItRFtJRUZB5AVhl781nlw=;
 b=owGbwMvMwCW2adGNfoHIK0sZT6slMWTunNHmJGfEaCm+fu6bly6VCnWlgeb5ohfcLIqPLNWa5
 uH96gR3x0QWBjEuBksxRZa535bYTjXim7XLw+MrzBxWJpAh0iINDEDAwsCXm5hXaqRjpGeqbahn
 aKhjrGPEwMUpAFM9WYqRYX257051ceGN7IdvJFzdefLKdct/7G8ynD1yF1zeGz17TyQjw/lPB+b
 XxN1Z7rlz644PXIxnD5b9YTqx5UVLWbBzYb/WBR4A
X-Developer-Key: i=alchark@flipper.net; a=openpgp;
 fpr=9DF6A43D95320E9ABA4848F5B2A2D88F1059D4A5
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[flipper.net,quarantine];
	R_DKIM_ALLOW(-0.20)[flipper.net:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34972-lists,linux-usb=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,linux.intel.com,linuxfoundation.org,richtek.com,sntech.de,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[flipper.net:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alchark@flipper.net,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[4e:email,0.0.0.51:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,flipper.net:dkim,flipper.net:email,flipper.net:mid]
X-Rspamd-Queue-Id: 6799D2B0D47
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Rockchip RK3576 EVB1 board has a Hynetek HUSB311 USB Type-C controller on
its Type-C OTG port, which also supports DisplayPort Alternate Mode.

Add the required DT nodes to enable basic HUSB311 operation.

Note that for full support of mode and orientation switching, the USBDP
PHY schema may need to be expanded, such as in [1]. This is left out for
now until the respective schema is finalized and merged.

[1] https://lore.kernel.org/linux-rockchip/20260313-rockchip-usbdp-cleanup-v3-1-3e8fe89a35b5@collabora.com/

Signed-off-by: Alexey Charkov <alchark@flipper.net>
---
 arch/arm64/boot/dts/rockchip/rk3576-evb1-v10.dts | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3576-evb1-v10.dts b/arch/arm64/boot/dts/rockchip/rk3576-evb1-v10.dts
index fb0dd1bc5148..df6c4b4b05f6 100644
--- a/arch/arm64/boot/dts/rockchip/rk3576-evb1-v10.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3576-evb1-v10.dts
@@ -11,6 +11,7 @@
 #include <dt-bindings/leds/common.h>
 #include <dt-bindings/pinctrl/rockchip.h>
 #include <dt-bindings/soc/rockchip,vop2.h>
+#include <dt-bindings/usb/pd.h>
 #include "rk3576.dtsi"
 
 / {
@@ -769,6 +770,25 @@ regulator-state-mem {
 &i2c2 {
 	status = "okay";
 
+	usbc0: typec-portc@4e {
+		compatible = "hynetek,husb311", "richtek,rt1711h";
+		reg = <0x4e>;
+		interrupt-parent = <&gpio0>;
+		interrupts = <RK_PA5 IRQ_TYPE_LEVEL_LOW>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&usbc0_int>;
+		vbus-supply = <&vbus5v0_typec>;
+
+		connector {
+			compatible = "usb-c-connector";
+			label = "USB-C";
+			data-role = "dual";
+			power-role = "source";
+			source-pdos = <PDO_FIXED(5000, 2000,
+						 PDO_FIXED_USB_COMM | PDO_FIXED_DATA_SWAP)>;
+		};
+	};
+
 	hym8563: rtc@51 {
 		compatible = "haoyu,hym8563";
 		reg = <0x51>;

-- 
2.52.0


