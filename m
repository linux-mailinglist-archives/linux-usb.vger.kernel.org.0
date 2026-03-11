Return-Path: <linux-usb+bounces-34598-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mMrgKjiXsWnkDAAAu9opvQ
	(envelope-from <linux-usb+bounces-34598-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 11 Mar 2026 17:24:24 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 134FC267450
	for <lists+linux-usb@lfdr.de>; Wed, 11 Mar 2026 17:24:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B256B310C978
	for <lists+linux-usb@lfdr.de>; Wed, 11 Mar 2026 16:22:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2689C3E1CFE;
	Wed, 11 Mar 2026 16:21:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.b="f1C7ORNz"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5550B3E276A
	for <linux-usb@vger.kernel.org>; Wed, 11 Mar 2026 16:21:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773246072; cv=none; b=VYH9kFIpd3qDhbaC/3G1Np16MKm2UfEytb9ZPJxzYBtI3Fe3pU0RzmhkAACXUqMCbqJzE5O/dNeOccfuiG8VauSWXUFY+qGnk9hRv15IAzx/T2ejaXPpjmK6xpewOXxnq88ZGVwXLHfzJiww+xy9JTtf3QlamRbA+sjjESTfCW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773246072; c=relaxed/simple;
	bh=aTYkOItHw6/UdJWcy/m8IRD3FteMfp8S2ed7FbrUbHI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=La7gDBrk168iGlYP4k8S7y13PT2UPvRn0PTBYwyh+DP0EVjiHK91hyYANabmOzQAQ853sYEdbxJubaKyekVQvbEo8RtBofyfHRA+LbX4T/VJJDcFq7zvfyfbg0lbekwQeFFKoYmbspHXV6zuNacTx4iV/hcWL7cTlrlQNxTONwc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net; spf=pass smtp.mailfrom=flipper.net; dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.b=f1C7ORNz; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flipper.net
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4852e9ca034so190385e9.2
        for <linux-usb@vger.kernel.org>; Wed, 11 Mar 2026 09:21:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1773246065; x=1773850865; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TP8PcAKjtgL6kY/iJ+s9NgDULWjFTdaiB417DZFinrk=;
        b=f1C7ORNzaSu3u0mVvqXwdBZ7N89GhEHducyRCYN/rdbmUX8/615S9bQARIy9Tw1lyv
         ijpJI8LWcHDnebnu/X2AVwkSZKk1XRD7NS8mZsUY1VqwdhJjJ2zAlH7KRLwK9tQm2/0c
         rMYbd8Ro9iwJXgbHHYyVujwlT+UKjGx54YB7k5UeWB95jMdRaeHFUGu1d56LFrrHdrM2
         357YnMgJ5RIp1i8Xt94OrjxgadhFIHAUitqKUqocaqHZqZbBO6sDoKuQQ7vXROailSDb
         EgdMoWZfU+F6lje3YSVv2ZkJYAP3f3dQ58JX3XGuKkVqFtLiWrSwsZMzLiNBgyX/joTY
         unqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773246065; x=1773850865;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=TP8PcAKjtgL6kY/iJ+s9NgDULWjFTdaiB417DZFinrk=;
        b=h3dMARgScGRqyP/wew2nWJPyDF4qQjCa9n2ItZHSiUI2WOaOcweMExTl/QZq56N0aX
         bOhk2nVqgxKz0Oh08D97K+rQgFNQhm+OuoZRNtkSgCGLds8tqlHZULzHsYgIWkNb+d1c
         +XgmdtJJgkOlbceNKpJaSDOG3qMhT5tquBDcX/8T10rjCXFvLuZuqZsib7/f2L4GV4mb
         a/Ae1zqUQE0h9Gps8OJ/Q35OJFxusfKqueR8B1nFWtZypV7bZaj+utewmImbDv0E99yx
         /VU5+FU23rpbE1eO4CSiCWuXumIOHNCF8tXBBfOojvjZgLblF69rBx6K6Inj9c9GaZGB
         2ltw==
X-Forwarded-Encrypted: i=1; AJvYcCWyUJOVOs4Da8FwtGe21j4hUOUGd9OPTUchZNk3ej9gTbFUH6Th9EafAAsVuUh+aPR4dQ7SbRKRmR8=@vger.kernel.org
X-Gm-Message-State: AOJu0YyoiZwWOsjtyqGwQHP3FnHEof/u0ve25j2/zJgXyu23dXbhcroG
	/NnXH5jdKniSmsNaiEQ2KtGuPGdz69cHz31GfV49JlJQLzPaWnYkv1nT/B17KPQYfvw=
X-Gm-Gg: ATEYQzwGTFZBUzqXZ40uinPkWQAax9DAsLagIEaOwia+3hQ3rpkSI8ieBn6zSXh+6sq
	ZwtaO00HCnJd/rhBTNklVVoC7eQJdYpnpiVYlLDIXB5OOgsxV0FstV9s6/qc1CEwtoVSHR8aOMO
	TUiW+jMulHMsm7v3Vz07Vyp2XurGmjVh+GBISrU8kllIZUVMAyUM4d/+O0VQmtRmNoW0geYNTlj
	sKj4T8gzywBWUt1us0shmYD6Cf/CWBHOEqHqkDRqkoBhxD/aBiHsr1LTO9Oy4V6f9lv+w2P5umD
	zoCci0+HYm3F/4Z4+i4TXkI3+juXK6uurUWeMyE/IfescIJ+Z4JWl/7iwi1gTqCt2lm5adgc+DF
	TqQ9RbFFxYvqyuziz9Xch+7/jzBUlFEWXpjbo1IJWdu2fen1DkpFUY2S+VU5OnIe9cJiCVjPnxp
	nnFGDSllEWBG/YiEVoM6isCcMMGYVn41g0/HvPNApyvxeglCeZJgchBGeDIvw0ghGxWalONjXQc
	mKA0w==
X-Received: by 2002:a05:600c:4452:b0:485:3c7f:527e with SMTP id 5b1f17b1804b1-4854b0d6a55mr54482765e9.15.1773246064959;
        Wed, 11 Mar 2026 09:21:04 -0700 (PDT)
Received: from alchark-surface.localdomain (bba-86-98-192-109.alshamil.net.ae. [86.98.192.109])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439fe20b899sm283952f8f.23.2026.03.11.09.21.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 09:21:04 -0700 (PDT)
From: Alexey Charkov <alchark@flipper.net>
Date: Wed, 11 Mar 2026 20:20:47 +0400
Subject: [PATCH 4/4] arm64: dts: rockchip: Add HUSB311 Type-C controller on
 RK3576 EVB1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260311-husb311-v1-4-f25bcb58cff7@flipper.net>
References: <20260311-husb311-v1-0-f25bcb58cff7@flipper.net>
In-Reply-To: <20260311-husb311-v1-0-f25bcb58cff7@flipper.net>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Gene Chen <gene_chen@richtek.com>, Heiko Stuebner <heiko@sntech.de>
Cc: Sebastian Reichel <sebastian.reichel@collabora.com>, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, Alexey Charkov <alchark@flipper.net>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1862; i=alchark@flipper.net;
 h=from:subject:message-id; bh=aTYkOItHw6/UdJWcy/m8IRD3FteMfp8S2ed7FbrUbHI=;
 b=owGbwMvMwCW2adGNfoHIK0sZT6slMWRunJay6ZFYZcH8+HXP9hmdf3RaZfF1d31xh8Ulzkp5o
 rnpH9rud0xkYRDjYrAUU2SZ+22J7VQjvlm7PDy+wsxhZQIZIi3SwAAELAx8uYl5pUY6Rnqm2oZ6
 hoY6xjpGDFycAjDVbxYzMsx/MFf/gu+v3T8VhQo9TyvVMOW8ePEyME8sPVwn6VCxpgAjw2S/NUu
 uLLpc1845+/T8YBMnHt7HzLti9kzVZZkiLF3HxQEA
X-Developer-Key: i=alchark@flipper.net; a=openpgp;
 fpr=9DF6A43D95320E9ABA4848F5B2A2D88F1059D4A5
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[flipper.net,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[flipper.net:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34598-lists,linux-usb=lfdr.de];
	DKIM_TRACE(0.00)[flipper.net:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alchark@flipper.net,linux-usb@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_PROHIBIT(0.00)[0.0.0.51:email];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[flipper.net:dkim,flipper.net:email,flipper.net:mid,collabora.com:url,4e:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 134FC267450
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Rockchip RK3576 EVB1 board has a Hynetek HUSB311 USB Type-C controller on
its Type-C OTG port, which also supports DisplayPort Alternate Mode.

Add the required DT nodes to enable basic HUSB311 operation.

Note that for full support of mode and orientation switching, the USBDP
PHY schema may need to be expanded, such as in [1]. This is left out for
now until the respective schema is finalized and merged.

[1] https://gitlab.collabora.com/hardware-enablement/rockchip-3588/linux/-/commit/fe29a74fd38aa1beb4a8101fdcecebaf3444e5f9

Signed-off-by: Alexey Charkov <alchark@flipper.net>
---
 arch/arm64/boot/dts/rockchip/rk3576-evb1-v10.dts | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3576-evb1-v10.dts b/arch/arm64/boot/dts/rockchip/rk3576-evb1-v10.dts
index f5746bc2970b..59bc1ac6d3d1 100644
--- a/arch/arm64/boot/dts/rockchip/rk3576-evb1-v10.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3576-evb1-v10.dts
@@ -11,6 +11,7 @@
 #include <dt-bindings/leds/common.h>
 #include <dt-bindings/pinctrl/rockchip.h>
 #include <dt-bindings/soc/rockchip,vop2.h>
+#include <dt-bindings/usb/pd.h>
 #include "rk3576.dtsi"
 
 / {
@@ -768,6 +769,25 @@ regulator-state-mem {
 &i2c2 {
 	status = "okay";
 
+	usbc0: typec-portc@4e {
+		compatible = "hynetek,husb311";
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


