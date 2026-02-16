Return-Path: <linux-usb+bounces-33391-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oHM1JUkok2kI2AEAu9opvQ
	(envelope-from <linux-usb+bounces-33391-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 16 Feb 2026 15:23:05 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 181EA1448B9
	for <lists+linux-usb@lfdr.de>; Mon, 16 Feb 2026 15:23:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3767B302D96C
	for <lists+linux-usb@lfdr.de>; Mon, 16 Feb 2026 14:22:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 210C0315D21;
	Mon, 16 Feb 2026 14:22:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sBiGe49+"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com [209.85.128.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44432315D43
	for <linux-usb@vger.kernel.org>; Mon, 16 Feb 2026 14:22:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771251724; cv=none; b=bVFEZ8HF0SjEkhjaRdv2I37TuVvRRvnQbcjqHwoZBSmryoLVNWlZS7wNzZAiwzML1DVrjWXua7Z5stWs0Hnh4oblWsSRQA4ckRhnKwTenc993wgVgOb8eclkSsA66sCTT34Qh5STUa5lf6KKV5tPbEXs/b6TA5icyyGMyyaZCxw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771251724; c=relaxed/simple;
	bh=UhlMaTJRZ9fLa8E4fuLuIg9nXiWgxX4wZpZOm+FPpVM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pp/EuRDkgwLeaB3mChZd4HU68W71SwaB/Ls60ya8/6VdXau72p0DLwF15rGuTkpZOHfrwEzrAmNa5iEfLpvfrgA2zbjGoJpkHZ9YRiZa/eaIWzs4jnxRLCljlQmi0unEXr66Sf8oNnTJ9UeE7owDUTkKp3Wnwn6OYMZPCKZrRgA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=sBiGe49+; arc=none smtp.client-ip=209.85.128.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f68.google.com with SMTP id 5b1f17b1804b1-48379a42f76so18233745e9.0
        for <linux-usb@vger.kernel.org>; Mon, 16 Feb 2026 06:22:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1771251720; x=1771856520; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lZLm3gI01t7k0CB1F3RPdej8cy0OV8XKyJkxMLlBgyY=;
        b=sBiGe49+ave/J770/xqZErlE21w1AAbRIMIz+1A6BaCdPGoZUKEd44oQo0hrTLle2z
         QTBNyEqv5a9QvDParNDwaKj6HX6WBhMbK/NlflvndYyDFmPBCeiwgl+Oj1Sg4ytJnL8T
         ToWGTkbGr24iooiAm2zT3XduLu48E3KIEtLQYWaWvPk04df9xVMd1KzuLvsMMTnaFcO6
         pohT4l8MX88oAkfDLlU8e4GMu3V4xvf4TL7v9NkcKAzof97HBfbWX4jblGth9LX+Lm6N
         /ltP+g1RNa4S4ZMCT8eIFt7su7aH5YwopBy22MMOmhwxngjQNSI5EyFQIhJY6QVvUF4W
         vAdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771251720; x=1771856520;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=lZLm3gI01t7k0CB1F3RPdej8cy0OV8XKyJkxMLlBgyY=;
        b=rxd9YjaBjrsOguHLmyKt0/1TRsWO/gQ7FZk38NJu5QtAGQNoKRMX2Ql0Bn7sEec1Ym
         Uv6FJ3cFntcVYjLm+2XPnN8zo9CtrGRwKynq2wxDj6n3VV1Ut6x6SXNqyt83qrtytHJk
         i6kf6rH8ez481tyLjk444ulMvzHGf9rH4UsJdEnKwuGvhjPHiOkxRJZllC+oPnk5kVeL
         2FfYK77mOvKyg2IyuAGgzznc3TkOflzG7fHQKIF9JXug/l3Ay5sBACHZMWHUa6yqJFsN
         4D2yWGXSAouFFsvIvOE66H0xRjEYIEzmmIap1rjuit0tEUteEkx10Yh8J3dF/oFlDiro
         UScg==
X-Gm-Message-State: AOJu0YwIDscvbjPoTb7wUDOMzCmPMioCL2xnhRNYyFv3Cnes6sQKf310
	U6FB0ZV4cHmtd9rVUanL79o9orxYRhCdXVn5q5lDvG2n8BlyMKEHA1y2u5zF6amBORA=
X-Gm-Gg: AZuq6aIgme/05R+V8RScL5Ft44aH/i0R/eYaLeRwGVSF58eVYX2Q36tx4Bs7tuK72+G
	+Vej1yJMmlPEIoOhwLLV+dygV6FRhv6znSonpnCm1GKHVBGjtoqoY264MB4YXuO6zxtDiyLpt1U
	euUTIjwt0MoU7wp/rHdlOt4KmFFlIBmeVELUSVkZ8K6ATjhs+TUPng7zqRzVUw/6/CK23Vkv/Jk
	0h78gL47BDyq1m/5p1KJhAsrDFtq7kMEzRENLGn7GRmXKxP/6UZ3M7TjxNgwfzm6NfCCaScXjVE
	IoICr0w+Z17eOwxgbd3AvLpexNs43v2qISJLn5Jgq33/mMwiJS2/uUsu99b+efN5TeAq1qUCaoD
	MD56fppYYsQJRvU5XEeiMzLNsm541jkoYbZAOgT+exCKHm7KyxcQ0tb1k+Lt/RP+Kuz1AW58oMQ
	r1/4jKwlCchQeiWT3Efi5xQgaUCXXcqALGs0DLtPpjJ0pZ
X-Received: by 2002:a05:600c:4443:b0:47e:e20e:bbb0 with SMTP id 5b1f17b1804b1-48379bac837mr120118635e9.6.1771251720343;
        Mon, 16 Feb 2026 06:22:00 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48370a63afesm86717475e9.9.2026.02.16.06.21.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Feb 2026 06:22:00 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Mon, 16 Feb 2026 15:21:52 +0100
Subject: [PATCH v4 8/9] arm64: dts: qcom: sm8650: Add sound DAI prefix for
 DP
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260216-topic-sm8650-ayaneo-pocket-s2-base-v4-8-802c82795431@linaro.org>
References: <20260216-topic-sm8650-ayaneo-pocket-s2-base-v4-0-802c82795431@linaro.org>
In-Reply-To: <20260216-topic-sm8650-ayaneo-pocket-s2-base-v4-0-802c82795431@linaro.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, Bartosz Golaszewski <brgl@kernel.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, 
 Bjorn Helgaas <bhelgaas@google.com>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 linux-pci@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=911;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=UhlMaTJRZ9fLa8E4fuLuIg9nXiWgxX4wZpZOm+FPpVM=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBpkyf9alGreRCevIfARG+2CS9U8xFI01sSnnbt6Rp1
 YgyKjEaJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCaZMn/QAKCRB33NvayMhJ0RQlD/
 9gdGpMW7udNzorRnTxGVQNi958K60kf4eU7jNVk20JU4e7AVB4PsaOKCXsfanOkeZYJ+nUgfWUjco/
 Qr0awa7jK/DDIL4dXPwLe5qj3EVuescmxg1h1kAqnemmT4jV3jbVSu64PVBNZsHfA47XqqEL87TQQL
 pj1LicLl/T57H2OrcCSDv7/bbjF88QrKYzuQe24NLnFwD+O6IB0U0h79WewAwFflB/QpcDHunbCmzs
 nO2Lb+0MO3FyzSU1gYrJ6Icq3j96NX5Qpj3Naz/IX0HRjMLe6XVBeNKUK+ITUJMrArYD0Z4JAeg4Ou
 pEbIcqy3wvcEkAneC3bttfApzibxoC9PhGo1t8ymc7BUhg30O0HZWCM2f6PcpogGCAy8wjJ0L1hGfu
 XJdYtl3nQUaNC0ru52M05CgrDob8zP8P6hQve3tOGCEAYLAlN4CqrxvGKeAFefCURPdRYg/Mb/QOw4
 b5kH8xri5gJcyIjHvx5nopRX2dVuWXo3GFIVFMFAELSUUl2btqdR5gmNHMvTcuQGTVHQZbOGp6yToo
 C1DlwEE3V1CXevh44itIBML+WU0DFAdHb5n3p+ivIXsTLUpgeqW8Jg7voMkkj89cfjMjPHWS/M2OTq
 TUDRWJQzlzLhf5qoptusI69N4gCBrcEivzgBHobOGluV13Sq1/1vVDATqv4g==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33391-lists,linux-usb=lfdr.de];
	FREEMAIL_TO(0.00)[linuxfoundation.org,kernel.org,glider.be,gmail.com,google.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[neil.armstrong@linaro.org,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[linaro.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb,dt,renesas];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email,linaro.org:mid,linaro.org:dkim,linaro.org:email,af54000:email]
X-Rspamd-Queue-Id: 181EA1448B9
X-Rspamd-Action: no action

Sound DAI devices exposing same set of mixers, e.g. each DisplayPort
controller, need to add dedicated prefix for these mixers to avoid
conflicts and to allow ALSA to properly configure given instance.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8650.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/dts/qcom/sm8650.dtsi
index a7a06f78e564..6098d6201002 100644
--- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi
@@ -5773,6 +5773,7 @@ mdss_dp0: displayport-controller@af54000 {
 				phy-names = "dp";
 
 				#sound-dai-cells = <0>;
+				sound-name-prefix = "DisplayPort0";
 
 				status = "disabled";
 

-- 
2.34.1


