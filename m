Return-Path: <linux-usb+bounces-19347-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FEDCA111A8
	for <lists+linux-usb@lfdr.de>; Tue, 14 Jan 2025 21:06:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 776481889E27
	for <lists+linux-usb@lfdr.de>; Tue, 14 Jan 2025 20:06:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1917C20C00A;
	Tue, 14 Jan 2025 20:05:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VnkFXAPi"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C73D319149F
	for <linux-usb@vger.kernel.org>; Tue, 14 Jan 2025 20:05:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736885149; cv=none; b=K3xkx3lS5od84zIZ9P0iuUr176Xy9Tq9xuHYvxcThM064KX23jNDGw+RU+bzQgqm0Spf3TXpmg6Isex70vrxUOulRwCcjgopoGRF0Ls41ncaAhclvzAGl/femzZ4bBPKSuA0LWcsn0PK6oraEnkcsU3w3bBmez5/4aTiFyi+kz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736885149; c=relaxed/simple;
	bh=oBRrldCGEtQDH9TkaLDR4/zC/3PP573MIhVqsz9gJTw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Hri4G6g/y8mV/p4VyTqG2pzGw4/FhSaZbgnaLHViqDIFX5Un0Il3G4swmIFVzsMZi6lZ2AamDKMgwXVKHXF4N+asBqRix0q8k63pv40IKy5Aci3dpPPrwoBYRsQNZBquydtu4cNguL074/YoOKfCH3fE9r+HsKoDUDUZ9kXrwow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VnkFXAPi; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-43616bf3358so7474715e9.3
        for <linux-usb@vger.kernel.org>; Tue, 14 Jan 2025 12:05:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736885146; x=1737489946; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ix4BWT9qwOiJ6xVGoiI7oaTduq2Ilx63FNUEN2N3zfk=;
        b=VnkFXAPic+CT8CfPGdclmGVNFdBrftO4RcT3nQHje5UAWlfXOMoQqPq56BW8yZOLa9
         Gky2KrBx5bQzuisOV01XNBMVkyqyVQJFkgJj8N4uLf4jIZUm7FNhhLxYl2+1+1dj0X5O
         U1s/KuKzcSUDDwlF7AyZL3w5+9TIT4vpBCabYEvhzgolnn/WNs5X9dztFYjaaXWrxj7D
         QRZHyTe51JVuocDPFY46Pv2knF+UGf1AFZM23uE67cfuSkNquPxV2p06DY9f2WWVG9Ry
         wZwCFDB+b/BMIEC3w1bPhQscVviQM+lJp6MRIHIUuBR1o6hdgPT81RaPCA9EcZBr9xF9
         o3GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736885146; x=1737489946;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ix4BWT9qwOiJ6xVGoiI7oaTduq2Ilx63FNUEN2N3zfk=;
        b=OToWoUtH4fp6K0nYQbedMJcsgxxnNrHl/io9PqF/kTgsM08n77k9RqDDMXqFdFS9Pf
         JE+faL9/VW9HGB/DTbpTb/14mtojv275NJCerHUjy835bkz4TiTWt/Xq7OUKVWLlW3Vh
         9p/YJM1xt1adUC555Nek3MOKTFr/ccdcr5ddrQqURVO+EV8zRNf9fG7QqjIdQdnw6XPD
         uUIDpfgDJoe9czeTi7Az6+FEGQBEXY/Iu/SCVcInwvq3eaESjuBj1UChHCqIijvxtsIu
         vnm634Yco2mLMh8NZ3ovBaGxxlPxHoOzZWu07pLZrKhDCUEdsgPKG3YLbMw+2kk/3/vT
         lsTg==
X-Gm-Message-State: AOJu0Yyj1uKr6L1rloCnmI+rBY95COK6i0TT3+EhHnad65hQd3vkN+Se
	hbnflWrYYLKPPnJxaY//srzWEejvq9gq4bjLHoBaNmFNmKdfoT5rFDyh3BgYSQQ=
X-Gm-Gg: ASbGnctUYXB7PQNYKpJFWCywOE/INa2hU70afA8tFwOGHSFSyLzlJhiAjzLG+iSFhxQ
	XR9FRYKjcDjtWPbc3HZBPC1escGHXUC9YHQPs0fQTM4vpvi/d74qktHM2I/xobgfbv4s8Q7cIKp
	3bt8aWMiIZ6K1LufZFYqJLqI5Hh3rVrlWsMRaoG6d8Lk2bnKJC4qxNZr7cgGgfW3sCF4Xl+0+Eg
	TGUALO9fakro6xeL+2fjnz3khO/FM/7Jf+HGgsfDQXLYgluVyJjl/xoM3IhZLhUcPLyIlEo
X-Google-Smtp-Source: AGHT+IFF+NOL6cyiG7mt/hpyvkvyIQ5FH47+mKOsgPqnCVkB6Agi5TbojvwLum3KesDuClRq/0X9YA==
X-Received: by 2002:a05:600c:3b11:b0:42c:bb35:b6d0 with SMTP id 5b1f17b1804b1-436e267f21bmr104196145e9.1.1736885146061;
        Tue, 14 Jan 2025 12:05:46 -0800 (PST)
Received: from [127.0.1.1] ([178.197.223.165])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-436e9dc8802sm184622025e9.10.2025.01.14.12.05.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jan 2025 12:05:45 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Tue, 14 Jan 2025 21:05:34 +0100
Subject: [PATCH 1/6] USB: Replace own str_plural with common one
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250114-str-enable-disable-usb-v1-1-c8405df47c19@linaro.org>
References: <20250114-str-enable-disable-usb-v1-0-c8405df47c19@linaro.org>
In-Reply-To: <20250114-str-enable-disable-usb-v1-0-c8405df47c19@linaro.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Mathias Nyman <mathias.nyman@intel.com>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, 
 Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, Daniel Mack <daniel@zonque.org>, 
 Haojian Zhuang <haojian.zhuang@gmail.com>, 
 Robert Jarzmik <robert.jarzmik@free.fr>, Peter Chen <peter.chen@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Alan Stern <stern@rowland.harvard.edu>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
 usb-storage@lists.one-eyed-alien.net, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4557;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=oBRrldCGEtQDH9TkaLDR4/zC/3PP573MIhVqsz9gJTw=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBnhsORQpZSPRfkKaL3N8KwomBIhzaY4ZZ1/V+EP
 p3YB7iKfC2JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZ4bDkQAKCRDBN2bmhouD
 1/ihD/4zYcA+M7tRdqi7/4Eu0P6oiHwpIW+zgjjC8mO4dKq/fzdsBl6GN0MPubf3R+62Dn9SnlZ
 gBkxcpdPfMPzibVeDxdAxqS/QFZCYYfiYHTOUfNvFX4yjYDZ/F+e34/1VyxC/CsP4NiGivuM1qy
 zhYf6dMBMFG2cvEw2a1kyx/HYLvdjFakU6qqy8zckY9c+NkUVSzs7hcIfn8b8XLf6VJk3CCsbFC
 eFAvoZoXKQdleAAlT1D0Pj5QXP+piUPJYY1zpD7AatwpaCgQS3tAaO2qTKebXHVAQlcYgrnWjNO
 U/JAwvdS2ckWppCHDH9hPb0M0WbFxji74szMZm/F6faWFlHxLVs+NDFB+umXtlluIAM4lLH0fxt
 g7V7Ma5GLHOJjzXMOk0Nx/MKFiDPnDeHOEEdn/zazix7cPwagALIFuZIRHyS+2Hb6E7Jim4VQPy
 EjG0PB4bNJw7WoOzXhMBUuem1SAaRPOw7M1CPetC6vw1w7l7PoyevPZLHy6Qc5xW1YZOKrGR5kh
 qI/1IOST1DLVe+KRGyTwfCBs/ZdurCWpWaseYe6pmkR46WH9pJj+50nK91+HRsuj/cAoU/2jFs0
 59Ytog3gzGwCenTSUtSlN7SsMs7uDj8jCE/rC4cMXVQj4nqZXGsiWEkXD8mSi/5aADZGy32Pm1i
 6OczTp8+0UGp3Jg==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Use existing str_plural() helper from string_choices.h to reduce amount
of duplicated code.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/usb/core/config.c  | 19 +++++++------------
 drivers/usb/core/generic.c | 12 ++++--------
 2 files changed, 11 insertions(+), 20 deletions(-)

diff --git a/drivers/usb/core/config.c b/drivers/usb/core/config.c
index 25a00f974934fb5a562caf3f5f259ba23031e457..f7bf8d1de3adeb16a540ec5236726fc7b03517df 100644
--- a/drivers/usb/core/config.c
+++ b/drivers/usb/core/config.c
@@ -9,6 +9,7 @@
 #include <linux/usb/quirks.h>
 #include <linux/module.h>
 #include <linux/slab.h>
+#include <linux/string_choices.h>
 #include <linux/device.h>
 #include <asm/byteorder.h>
 #include "usb.h"
@@ -18,12 +19,6 @@
 
 #define USB_MAXCONFIG			8	/* Arbitrary limit */
 
-
-static inline const char *plural(int n)
-{
-	return (n == 1 ? "" : "s");
-}
-
 static int find_next_descriptor(unsigned char *buffer, int size,
     int dt1, int dt2, int *num_skipped)
 {
@@ -484,7 +479,7 @@ static int usb_parse_endpoint(struct device *ddev, int cfgno,
 	retval = buffer - buffer0 + i;
 	if (n > 0)
 		dev_dbg(ddev, "skipped %d descriptor%s after %s\n",
-		    n, plural(n), "endpoint");
+		    n, str_plural(n), "endpoint");
 	return retval;
 
 skip_to_next_endpoint_or_interface_descriptor:
@@ -563,7 +558,7 @@ static int usb_parse_interface(struct device *ddev, int cfgno,
 	alt->extralen = i;
 	if (n > 0)
 		dev_dbg(ddev, "skipped %d descriptor%s after %s\n",
-		    n, plural(n), "interface");
+		    n, str_plural(n), "interface");
 	buffer += i;
 	size -= i;
 
@@ -605,7 +600,7 @@ static int usb_parse_interface(struct device *ddev, int cfgno,
 		dev_notice(ddev, "config %d interface %d altsetting %d has %d "
 		    "endpoint descriptor%s, different from the interface "
 		    "descriptor's value: %d\n",
-		    cfgno, inum, asnum, n, plural(n), num_ep_orig);
+		    cfgno, inum, asnum, n, str_plural(n), num_ep_orig);
 	return buffer - buffer0;
 
 skip_to_next_interface_descriptor:
@@ -664,7 +659,7 @@ static int usb_parse_configuration(struct usb_device *dev, int cfgidx,
 		if (size2 < sizeof(struct usb_descriptor_header)) {
 			dev_notice(ddev, "config %d descriptor has %d excess "
 			    "byte%s, ignoring\n",
-			    cfgno, size2, plural(size2));
+			    cfgno, size2, str_plural(size2));
 			break;
 		}
 
@@ -754,7 +749,7 @@ static int usb_parse_configuration(struct usb_device *dev, int cfgidx,
 	if (n != nintf)
 		dev_notice(ddev, "config %d has %d interface%s, different from "
 		    "the descriptor's value: %d\n",
-		    cfgno, n, plural(n), nintf_orig);
+		    cfgno, n, str_plural(n), nintf_orig);
 	else if (n == 0)
 		dev_notice(ddev, "config %d has no interfaces?\n", cfgno);
 	config->desc.bNumInterfaces = nintf = n;
@@ -798,7 +793,7 @@ static int usb_parse_configuration(struct usb_device *dev, int cfgidx,
 	config->extralen = i;
 	if (n > 0)
 		dev_dbg(ddev, "skipped %d descriptor%s after %s\n",
-		    n, plural(n), "configuration");
+		    n, str_plural(n), "configuration");
 	buffer += i;
 	size -= i;
 
diff --git a/drivers/usb/core/generic.c b/drivers/usb/core/generic.c
index b134bff5c3fe3e86215bdcd14a2591a521f5ba3c..9c6ae5e1198bb2043d27e2f309a46f8ce512225f 100644
--- a/drivers/usb/core/generic.c
+++ b/drivers/usb/core/generic.c
@@ -21,14 +21,10 @@
 
 #include <linux/usb.h>
 #include <linux/usb/hcd.h>
+#include <linux/string_choices.h>
 #include <uapi/linux/usb/audio.h>
 #include "usb.h"
 
-static inline const char *plural(int n)
-{
-	return (n == 1 ? "" : "s");
-}
-
 static int is_rndis(struct usb_interface_descriptor *desc)
 {
 	return desc->bInterfaceClass == USB_CLASS_COMM
@@ -194,18 +190,18 @@ int usb_choose_configuration(struct usb_device *udev)
 	if (insufficient_power > 0)
 		dev_info(&udev->dev, "rejected %d configuration%s "
 			"due to insufficient available bus power\n",
-			insufficient_power, plural(insufficient_power));
+			insufficient_power, str_plural(insufficient_power));
 
 	if (best) {
 		i = best->desc.bConfigurationValue;
 		dev_dbg(&udev->dev,
 			"configuration #%d chosen from %d choice%s\n",
-			i, num_configs, plural(num_configs));
+			i, num_configs, str_plural(num_configs));
 	} else {
 		i = -1;
 		dev_warn(&udev->dev,
 			"no configuration chosen from %d choice%s\n",
-			num_configs, plural(num_configs));
+			num_configs, str_plural(num_configs));
 	}
 	return i;
 }

-- 
2.43.0


