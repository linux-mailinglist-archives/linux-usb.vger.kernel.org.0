Return-Path: <linux-usb+bounces-19351-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E86C6A111B2
	for <lists+linux-usb@lfdr.de>; Tue, 14 Jan 2025 21:07:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EF387160F6B
	for <lists+linux-usb@lfdr.de>; Tue, 14 Jan 2025 20:07:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A3FEA212B05;
	Tue, 14 Jan 2025 20:06:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Rld9k4J1"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B934420E6E7
	for <linux-usb@vger.kernel.org>; Tue, 14 Jan 2025 20:05:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736885161; cv=none; b=Vkdl1z3KAk7DQ2pYtBUKoOcR7oT4eTtuhh6ocYoAsp+0LUR2Nrh+7P3qI91oBL128Yw5EGzC6OM6Y8Iy1Lbj+S7NLyxDDOpK9aUe6Uec8TUTplESaMhSMJl9s3jTMYd0IkSaDynZuRcAnvv6WQGG4Z1QKa5DjrmFe99lvoh8jq4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736885161; c=relaxed/simple;
	bh=ChnARzU8vkZ4N8/sOQo0Ix2BDfajX6xlMScKMcecQCo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uVwsEb8y9+iAJWPIOJujwcBRCMX/U7k0GLRoMbKJ/iTSv7Nc/hWnj2/LvX6enkOalBz8a8Hl4x0XKf+YJt6oc/CKHkasm+f1h4GZYNt3+AWDk58mUH/0jHkhjJO60feyP/qT0g255YlSD4hNGDWFtwStBU2wYdjaiWYQAupge14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Rld9k4J1; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-385db79aafbso493271f8f.1
        for <linux-usb@vger.kernel.org>; Tue, 14 Jan 2025 12:05:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736885156; x=1737489956; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TTD6x1Lk041c+VoW0XQVNqPy/PU8FV8OyNgCvVmY2nI=;
        b=Rld9k4J1NLBnK53Ec3v7xQoASqry9SxVHSCS0xULH0LrLIWvDumxYfzpD+H4KalGQv
         bL6o+XMEvIG9gSxVk6awNvmnnXfw6zQyzkjxOWPfL/ZhCc30OuS+JC8aRH+uPAJl/9Qq
         +lBl+A8GLpe9XJbgEpHF9wnAm+JUoSiMWuIJdE1kkYKApIAZ/QbdjqjC5YXDK6JIbrgy
         zIy70TOaLGj8fCFk6JfDH37cFUm+LiaaluNYYepnWS0L3qmXg71wvijYMuyFGVKb7uSN
         +kdjGeMjc9Mv+5ax8Gu1YKoy+rl9bVgCKnWGXlIwt180XwVi/nBmuoIjXsc92xxT9bPA
         SNmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736885156; x=1737489956;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TTD6x1Lk041c+VoW0XQVNqPy/PU8FV8OyNgCvVmY2nI=;
        b=eFg3GbIkX/0ZVITbcKoiKEgmY5c+uUbFBpPUASVVEZdnX8hc6QT1+0DsTwqtYzKKYM
         1uxWGP0JGzXeP/9VfIMBGqgAlxZB6vKxyjIecFNPwRWZOKXm03z+7JKW4ArvoZ5uQT4U
         JAYzilxNZYaAYpNwwtc511OBmRIYM/FpKBpD1Q6v1ussxWsBStzGXQsmXVjeTRKjY6T8
         FD2B0o21MvVsDmM0wjhr+2nMXCQAGfAeYzjEMovJFXziMsHSMMjGWSMXazqTglVj4+Di
         3FGLeNi2fbTIH7gfnyIuDieVveOG6FifAfTLT6y/YA9fBfHIdRw9pyylKcu0rI5F2AEp
         84Tw==
X-Gm-Message-State: AOJu0YxjyP9UC2NZ9l6utQHaWfdVKbt+YG3V1dcyW4utnH/26Rb7L1oy
	6yEZkWkZ2emqkhb9XjQJA24muZsSg8inXeDTztbkNoBu77v4lfNR7+Vn2U+rJNw=
X-Gm-Gg: ASbGncuLlEkU2LY9WqS6H51PPBEdGrBn1B9ArB3RJZVLkXmew3x2X4mxddxWATXxfTX
	zEBzUrj5RBJgh2gG7Of4byjIjDkagZ0G+m8HTdOSBjscHJyEMDITnBjmIjjk6jkgU22Oyc6LYPY
	eH67T4OJEeFx92vMSuErKl0j/BtrAb3nkF3UplR0qIn0lmEWtyugz9LSVySpKjBPDlRAIvUFD5q
	P3ORmFRrc0jkFhglvlPV+Kl9S+Rqzl0WOkCeUij5WUnF/7Huij37/sTm5xLh5iw+OEsGMZp
X-Google-Smtp-Source: AGHT+IGxND6xy5nbDMXlLJof5zJ1WURbjIRC0t+BVySYcz+h6/d0aMJOQigcunQUz7PnqwmnaXQnTQ==
X-Received: by 2002:adf:9ccd:0:b0:38a:5557:7677 with SMTP id ffacd0b85a97d-38a872e161dmr7612204f8f.5.1736885155913;
        Tue, 14 Jan 2025 12:05:55 -0800 (PST)
Received: from [127.0.1.1] ([178.197.223.165])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-436e9dc8802sm184622025e9.10.2025.01.14.12.05.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jan 2025 12:05:55 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Tue, 14 Jan 2025 21:05:38 +0100
Subject: [PATCH 5/6] USB: gadget: Use str_enable_disable-like helpers
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250114-str-enable-disable-usb-v1-5-c8405df47c19@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=10986;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=ChnARzU8vkZ4N8/sOQo0Ix2BDfajX6xlMScKMcecQCo=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBnhsOUr4DH74j1XH0iJ+MUvhAzl6rXxBkoviRuh
 xhBDndCrD2JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZ4bDlAAKCRDBN2bmhouD
 1xigD/9uO2A+K9X0l9z0fBURd0QHpksk5JEq9mdkT/Eotp4sPG9oTB1mL4QvKsIkKwHjHHZ7PT2
 hujen0zuhWUDLbnwOAmDlS9Qlr5j5RdUOTW5ua36V1fFyCs11eeBegKf8jfe8jS1H7BFgMBm7B0
 9qmpzfRTnjW6PpuD0gz0WmFKrxGUsDPkJWVOP+96+hdW4rPz5FEnbdXlbKmULDqp03Pq8OSGbOJ
 eOiVtSmqR1CZthgT47JRgufY5LIG/ZekfqD1eGToTeWX7J3HuNTQdUtATiG8g8v8djikaZxS4nv
 02bigHcvqTpRO1HCmY9/rpz9tonb/mryOTFnWuloA/e6LDuBAJ/DR4phr9F+P2170GYxO3aDkPJ
 3JUbFlnsfdg4LRXyqteXvGlN/jg1IKR/Dm5vvWRqZ91ke5odvDAGhRrVplUFXfACEXO0WX54eEh
 lGzup+iWi6CmWs1ZJSE7NCilxzF2Jb0UEpi/b6OeRZwaHoCfTzsmGa3GQEkmmLXbfohrc6TiTqf
 CJ1lKguZ8PeHU7y2OwlE7IVeVhlhTC5c4AtONfmHnk9Gkv1hoIW0/1TK15Y4skTAE7ZfV7lV1XR
 E63O5dIXpabPWDRxosZnAwVYEtlHxp4ysuLa1XPj0dFl6lkPP8DHnLsqIPZ53dhseGezkL3rp49
 VpAd+QxCNWc+iPA==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Replace ternary (condition ? "enable" : "disable") syntax with helpers
from string_choices.h because:
1. Simple function call with one argument is easier to read.  Ternary
   operator has three arguments and with wrapping might lead to quite
   long code.
2. Is slightly shorter thus also easier to read.
3. It brings uniformity in the text - same string.
4. Allows deduping by the linker, which results in a smaller binary
   file.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/usb/gadget/function/f_ecm.c         |  4 ++--
 drivers/usb/gadget/function/f_ncm.c         |  3 ++-
 drivers/usb/gadget/function/u_serial.c      |  3 ++-
 drivers/usb/gadget/legacy/inode.c           |  3 ++-
 drivers/usb/gadget/udc/aspeed-vhub/hub.c    |  3 ++-
 drivers/usb/gadget/udc/at91_udc.c           |  3 ++-
 drivers/usb/gadget/udc/cdns2/cdns2-gadget.c | 13 +++++++------
 drivers/usb/gadget/udc/dummy_hcd.c          |  3 ++-
 drivers/usb/gadget/udc/fsl_udc_core.c       |  3 ++-
 drivers/usb/gadget/udc/omap_udc.c           |  3 ++-
 drivers/usb/gadget/udc/pxa27x_udc.c         |  3 ++-
 11 files changed, 27 insertions(+), 17 deletions(-)

diff --git a/drivers/usb/gadget/function/f_ecm.c b/drivers/usb/gadget/function/f_ecm.c
index 6cb7771e8a692dbf555d65f4b3699b2a62c85cec..80841de845b09129564cb6d1b7710f8b76174292 100644
--- a/drivers/usb/gadget/function/f_ecm.c
+++ b/drivers/usb/gadget/function/f_ecm.c
@@ -13,6 +13,7 @@
 #include <linux/module.h>
 #include <linux/device.h>
 #include <linux/etherdevice.h>
+#include <linux/string_choices.h>
 
 #include "u_ether.h"
 #include "u_ether_configfs.h"
@@ -387,8 +388,7 @@ static void ecm_do_notify(struct f_ecm *ecm)
 		event->wLength = 0;
 		req->length = sizeof *event;
 
-		DBG(cdev, "notify connect %s\n",
-				ecm->is_open ? "true" : "false");
+		DBG(cdev, "notify connect %s\n", str_true_false(ecm->is_open));
 		ecm->notify_state = ECM_NOTIFY_SPEED;
 		break;
 
diff --git a/drivers/usb/gadget/function/f_ncm.c b/drivers/usb/gadget/function/f_ncm.c
index 8e761249d672c7b079f2c9ec13cbe9644251ec94..f60576a65ca67e84d8d4d568171bea2e6b4fcfe7 100644
--- a/drivers/usb/gadget/function/f_ncm.c
+++ b/drivers/usb/gadget/function/f_ncm.c
@@ -17,6 +17,7 @@
 #include <linux/device.h>
 #include <linux/etherdevice.h>
 #include <linux/crc32.h>
+#include <linux/string_choices.h>
 
 #include <linux/usb/cdc.h>
 
@@ -558,7 +559,7 @@ static void ncm_do_notify(struct f_ncm *ncm)
 		req->length = sizeof *event;
 
 		DBG(cdev, "notify connect %s\n",
-				ncm->is_open ? "true" : "false");
+				str_true_false(ncm->is_open));
 		ncm->notify_state = NCM_NOTIFY_NONE;
 		break;
 
diff --git a/drivers/usb/gadget/function/u_serial.c b/drivers/usb/gadget/function/u_serial.c
index bc143a86c2ddf07cba0d3ab6ada41387bc0d4bec..5413882b149812a141cc641be99e216d0b11006a 100644
--- a/drivers/usb/gadget/function/u_serial.c
+++ b/drivers/usb/gadget/function/u_serial.c
@@ -21,6 +21,7 @@
 #include <linux/tty.h>
 #include <linux/tty_flip.h>
 #include <linux/slab.h>
+#include <linux/string_choices.h>
 #include <linux/export.h>
 #include <linux/module.h>
 #include <linux/console.h>
@@ -1545,7 +1546,7 @@ static int __init userial_init(void)
 
 	pr_debug("%s: registered %d ttyGS* device%s\n", __func__,
 			MAX_U_SERIAL_PORTS,
-			(MAX_U_SERIAL_PORTS == 1) ? "" : "s");
+			str_plural(MAX_U_SERIAL_PORTS));
 
 	return status;
 fail:
diff --git a/drivers/usb/gadget/legacy/inode.c b/drivers/usb/gadget/legacy/inode.c
index 9c7381661016daa3a1a61d0509e57210d5f5e682..b6a30d88a800347de9d8e274923bd24b58018b53 100644
--- a/drivers/usb/gadget/legacy/inode.c
+++ b/drivers/usb/gadget/legacy/inode.c
@@ -20,6 +20,7 @@
 #include <linux/uaccess.h>
 #include <linux/sched.h>
 #include <linux/slab.h>
+#include <linux/string_choices.h>
 #include <linux/poll.h>
 #include <linux/kthread.h>
 #include <linux/aio.h>
@@ -1182,7 +1183,7 @@ ep0_fasync (int f, struct file *fd, int on)
 {
 	struct dev_data		*dev = fd->private_data;
 	// caller must F_SETOWN before signal delivery happens
-	VDEBUG (dev, "%s %s\n", __func__, on ? "on" : "off");
+	VDEBUG(dev, "%s %s\n", __func__, str_on_off(on));
 	return fasync_helper (f, fd, on, &dev->fasync);
 }
 
diff --git a/drivers/usb/gadget/udc/aspeed-vhub/hub.c b/drivers/usb/gadget/udc/aspeed-vhub/hub.c
index a63e4af60a56a9a0b00c2828c4de14f31b13e033..02fe1a08d5757e9e3e21e874766d3cee1305e555 100644
--- a/drivers/usb/gadget/udc/aspeed-vhub/hub.c
+++ b/drivers/usb/gadget/udc/aspeed-vhub/hub.c
@@ -22,6 +22,7 @@
 #include <linux/usb/gadget.h>
 #include <linux/of.h>
 #include <linux/regmap.h>
+#include <linux/string_choices.h>
 #include <linux/dma-mapping.h>
 #include <linux/bcd.h>
 #include <linux/version.h>
@@ -219,7 +220,7 @@ static int ast_vhub_hub_dev_feature(struct ast_vhub_ep *ep,
 	if (wValue == USB_DEVICE_REMOTE_WAKEUP) {
 		ep->vhub->wakeup_en = is_set;
 		EPDBG(ep, "Hub remote wakeup %s\n",
-		      is_set ? "enabled" : "disabled");
+		      str_enabled_disabled(is_set));
 		return std_req_complete;
 	}
 
diff --git a/drivers/usb/gadget/udc/at91_udc.c b/drivers/usb/gadget/udc/at91_udc.c
index e3af4ec3794e2ef871bc252948b6121921623704..aa4c61094dc6fa379de04f08f3b771dcafe942b3 100644
--- a/drivers/usb/gadget/udc/at91_udc.c
+++ b/drivers/usb/gadget/udc/at91_udc.c
@@ -16,6 +16,7 @@
 #include <linux/delay.h>
 #include <linux/ioport.h>
 #include <linux/slab.h>
+#include <linux/string_choices.h>
 #include <linux/errno.h>
 #include <linux/list.h>
 #include <linux/interrupt.h>
@@ -131,7 +132,7 @@ static void proc_ep_show(struct seq_file *s, struct at91_ep *ep)
 	seq_printf(s, "csr %08x rxbytes=%d %s %s %s" EIGHTBITS "\n",
 		csr,
 		(csr & 0x07ff0000) >> 16,
-		(csr & (1 << 15)) ? "enabled" : "disabled",
+		str_enabled_disabled(csr & (1 << 15)),
 		(csr & (1 << 11)) ? "DATA1" : "DATA0",
 		types[(csr & 0x700) >> 8],
 
diff --git a/drivers/usb/gadget/udc/cdns2/cdns2-gadget.c b/drivers/usb/gadget/udc/cdns2/cdns2-gadget.c
index 62fce42ef2dabd18643e3d933426025a17cdb9f1..7e69944ef18a91ab51f4f8abefae7149e93eb92c 100644
--- a/drivers/usb/gadget/udc/cdns2/cdns2-gadget.c
+++ b/drivers/usb/gadget/udc/cdns2/cdns2-gadget.c
@@ -29,6 +29,7 @@
 #include <linux/pm_runtime.h>
 #include <linux/interrupt.h>
 #include <linux/property.h>
+#include <linux/string_choices.h>
 #include <linux/dmapool.h>
 #include <linux/iopoll.h>
 
@@ -2233,12 +2234,12 @@ static int cdns2_init_eps(struct cdns2_device *pdev)
 		dev_dbg(pdev->dev, "Init %s, SupType: CTRL: %s, INT: %s, "
 			"BULK: %s, ISOC %s, SupDir IN: %s, OUT: %s\n",
 			pep->name,
-			(pep->endpoint.caps.type_control) ? "yes" : "no",
-			(pep->endpoint.caps.type_int) ? "yes" : "no",
-			(pep->endpoint.caps.type_bulk) ? "yes" : "no",
-			(pep->endpoint.caps.type_iso) ? "yes" : "no",
-			(pep->endpoint.caps.dir_in) ? "yes" : "no",
-			(pep->endpoint.caps.dir_out) ? "yes" : "no");
+			str_yes_no(pep->endpoint.caps.type_control),
+			str_yes_no(pep->endpoint.caps.type_int),
+			str_yes_no(pep->endpoint.caps.type_bulk),
+			str_yes_no(pep->endpoint.caps.type_iso),
+			str_yes_no(pep->endpoint.caps.dir_in),
+			str_yes_no(pep->endpoint.caps.dir_out));
 
 		INIT_LIST_HEAD(&pep->pending_list);
 		INIT_LIST_HEAD(&pep->deferred_list);
diff --git a/drivers/usb/gadget/udc/dummy_hcd.c b/drivers/usb/gadget/udc/dummy_hcd.c
index a7e8fa45776b5c16220bc5181eb6a91c45adf019..bda08c5ba7c01457aee61f86f828c12cc1ce8d01 100644
--- a/drivers/usb/gadget/udc/dummy_hcd.c
+++ b/drivers/usb/gadget/udc/dummy_hcd.c
@@ -28,6 +28,7 @@
 #include <linux/delay.h>
 #include <linux/ioport.h>
 #include <linux/slab.h>
+#include <linux/string_choices.h>
 #include <linux/errno.h>
 #include <linux/init.h>
 #include <linux/hrtimer.h>
@@ -625,7 +626,7 @@ static int dummy_enable(struct usb_ep *_ep,
 		desc->bEndpointAddress & 0x0f,
 		(desc->bEndpointAddress & USB_DIR_IN) ? "in" : "out",
 		usb_ep_type_string(usb_endpoint_type(desc)),
-		max, ep->stream_en ? "enabled" : "disabled");
+		max, str_enabled_disabled(ep->stream_en));
 
 	/* at this point real hardware should be NAKing transfers
 	 * to that endpoint, until a buffer is queued to it.
diff --git a/drivers/usb/gadget/udc/fsl_udc_core.c b/drivers/usb/gadget/udc/fsl_udc_core.c
index 8b7f7f96177459f6d295f5740b5ab23c0eab838f..4dea8bc30cf6d64663889ad0694bd34513321b54 100644
--- a/drivers/usb/gadget/udc/fsl_udc_core.c
+++ b/drivers/usb/gadget/udc/fsl_udc_core.c
@@ -22,6 +22,7 @@
 #include <linux/errno.h>
 #include <linux/err.h>
 #include <linux/slab.h>
+#include <linux/string_choices.h>
 #include <linux/init.h>
 #include <linux/list.h>
 #include <linux/interrupt.h>
@@ -1181,7 +1182,7 @@ static int fsl_vbus_session(struct usb_gadget *gadget, int is_active)
 
 	udc = container_of(gadget, struct fsl_udc, gadget);
 	spin_lock_irqsave(&udc->lock, flags);
-	dev_vdbg(&gadget->dev, "VBUS %s\n", is_active ? "on" : "off");
+	dev_vdbg(&gadget->dev, "VBUS %s\n", str_on_off(is_active));
 	udc->vbus_active = (is_active != 0);
 	if (can_pullup(udc))
 		fsl_writel((fsl_readl(&dr_regs->usbcmd) | USB_CMD_RUN_STOP),
diff --git a/drivers/usb/gadget/udc/omap_udc.c b/drivers/usb/gadget/udc/omap_udc.c
index 698463bf697b29aaf15f05297b8beac9f2bfdab3..8902abe3ca7659f4248cc857c53f53920a011d67 100644
--- a/drivers/usb/gadget/udc/omap_udc.c
+++ b/drivers/usb/gadget/udc/omap_udc.c
@@ -18,6 +18,7 @@
 #include <linux/errno.h>
 #include <linux/delay.h>
 #include <linux/slab.h>
+#include <linux/string_choices.h>
 #include <linux/timer.h>
 #include <linux/list.h>
 #include <linux/interrupt.h>
@@ -1252,7 +1253,7 @@ static int omap_vbus_session(struct usb_gadget *gadget, int is_active)
 
 	udc = container_of(gadget, struct omap_udc, gadget);
 	spin_lock_irqsave(&udc->lock, flags);
-	VDBG("VBUS %s\n", is_active ? "on" : "off");
+	VDBG("VBUS %s\n", str_on_off(is_active));
 	udc->vbus_active = (is_active != 0);
 	if (cpu_is_omap15xx()) {
 		/* "software" detect, ignored if !VBUS_MODE_1510 */
diff --git a/drivers/usb/gadget/udc/pxa27x_udc.c b/drivers/usb/gadget/udc/pxa27x_udc.c
index f9a55d4f189f4396230afcef85241c858fe40c41..897f53601b5b208955a29bca2b0743cce4155843 100644
--- a/drivers/usb/gadget/udc/pxa27x_udc.c
+++ b/drivers/usb/gadget/udc/pxa27x_udc.c
@@ -20,6 +20,7 @@
 #include <linux/gpio.h>
 #include <linux/gpio/consumer.h>
 #include <linux/slab.h>
+#include <linux/string_choices.h>
 #include <linux/prefetch.h>
 #include <linux/byteorder/generic.h>
 #include <linux/platform_data/pxa2xx_udc.h>
@@ -1083,7 +1084,7 @@ static int pxa_ep_queue(struct usb_ep *_ep, struct usb_request *_req,
 
 	is_first_req = list_empty(&ep->queue);
 	ep_dbg(ep, "queue req %p(first=%s), len %d buf %p\n",
-			_req, is_first_req ? "yes" : "no",
+			_req, str_yes_no(is_first_req),
 			_req->length, _req->buf);
 
 	if (!ep->enabled) {

-- 
2.43.0


