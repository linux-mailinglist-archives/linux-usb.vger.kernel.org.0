Return-Path: <linux-usb+bounces-38061-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MLtGI7V6FWp8VgcAu9opvQ
	(envelope-from <linux-usb+bounces-38061-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 26 May 2026 12:49:25 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id B4B565D462F
	for <lists+linux-usb@lfdr.de>; Tue, 26 May 2026 12:49:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 2F344301237F
	for <lists+linux-usb@lfdr.de>; Tue, 26 May 2026 10:48:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F8643DE42E;
	Tue, 26 May 2026 10:48:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fuZ4QRQD"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 946AD3DDDBD;
	Tue, 26 May 2026 10:48:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779792501; cv=none; b=mTmYhXMqCW/AKFl1SXqMSzVm0v9DfGD6RBTjkoHKlP7eEnBMDiGgl7UW6hnRsOr2hgbITtbQf6yB0fixMCIASD/sdUv7F1WvogQ28AmARHleD5+eRxlCyWyCw6JvEeuHSJ0fcWWYuew/uLoQkayg373TtlIQK/SYZhvygpn/Y9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779792501; c=relaxed/simple;
	bh=MTpJxKTuens6DDUF5s3lKZOugiQSoVatfQj2hgjmCR8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=adrMUOjFeDpg2W4tYt95TLX8N/ZLdKBaXQndtuyTy0qIb7zpwzY3C2NgePxZeACWdGjN+ZY0P9e8UEOuZTV/X4D5rs+drJxIsU2AKoWZzk8ZgmO3Mwk7v4dj+sRUtLb+dtACiYV36/JzHk1raSG/BNnRffnC92EX37v77eenuWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fuZ4QRQD; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 211541F000E9;
	Tue, 26 May 2026 10:48:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779792500;
	bh=WEAysOJhYWScktWySeX+/hXiUj2AW4y6blrSCBK852s=;
	h=From:To:Cc:Subject:Date;
	b=fuZ4QRQDTCyNZCqf+VzbJ3OEA/ucV1ybEhaJ3ZKzfgZ/LujfhOdE+NOxz/mYBE06i
	 MXQYSzCgyVL72T5wkfhsTjn6Jqg/0MkJ+Y+Y1oHEDQaeALOsQkXHyUSinY/k8ue9Hp
	 q9Upes6n1tC0/JY3YWJJGSVMFj8VxGWOm+z02n90I0GOB91nkfNcJyzflDPYFancja
	 /xdJQ+ZTUyBh7Sg3TMqjDCoyClzjy9QL2yc9RniPXh8OP823mV5YAgYN8Wl1kIeqpz
	 TonAUlHUh4oJYlpXMr5gTzAt97W7kvgXZD+W/b/Nw8n/7Ri2HAX9EQV9fbZ5a/2j+d
	 MeFiHc19m/f+A==
From: Arnd Bergmann <arnd@kernel.org>
To: Daniel Mack <daniel@zonque.org>,
	Haojian Zhuang <haojian.zhuang@gmail.com>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Arnd Bergmann <arnd@arndb.de>
Cc: Dan Carpenter <error27@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] usb: udc: pxa: fix error handling
Date: Tue, 26 May 2026 12:47:52 +0200
Message-Id: <20260526104810.3906090-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[gmail.com,lists.infradead.org,vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-38061-lists,linux-usb=lfdr.de];
	FREEMAIL_TO(0.00)[zonque.org,gmail.com,free.fr,linuxfoundation.org,linux.intel.com,arndb.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[arnd@kernel.org,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-0.997];
	TAGGED_RCPT(0.00)[linux-usb];
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,arndb.de:email]
X-Rspamd-Queue-Id: B4B565D462F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Arnd Bergmann <arnd@arndb.de>

As Dan Carpenter points out, my recent change makes subtle
changes to the error handling that were not intended.

Move the warning print up so it does not get skipped in
case of an error, but handle -EPROBE_DEFER properly now.

Change the devm_gpiod_get() to the _optional variant, which
is in line with the intended behavior and the DT binding,
though this did not work previously.

Reported-by: Dan Carpenter <error27@gmail.com>
Link: https://lore.kernel.org/linux-usb/ag6-xhfFjb5NpXQz@stanley.mountain/
Fixes: 25bd55f46032 ("usb: udc: pxa: remove unused platform_data")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/usb/gadget/udc/pxa27x_udc.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/drivers/usb/gadget/udc/pxa27x_udc.c b/drivers/usb/gadget/udc/pxa27x_udc.c
index 640f81988c04..df5cca43afbe 100644
--- a/drivers/usb/gadget/udc/pxa27x_udc.c
+++ b/drivers/usb/gadget/udc/pxa27x_udc.c
@@ -2374,9 +2374,10 @@ static int pxa_udc_probe(struct platform_device *pdev)
 	struct pxa_udc *udc = &memory;
 	int retval = 0;
 
-	udc->gpiod = devm_gpiod_get(&pdev->dev, NULL, GPIOD_ASIS);
+	udc->gpiod = devm_gpiod_get_optional(&pdev->dev, NULL, GPIOD_ASIS);
 	if (IS_ERR(udc->gpiod))
-		return PTR_ERR(udc->gpiod);
+		return dev_err_probe(&pdev->dev, PTR_ERR(udc->gpiod),
+				     "Couldn't find or request D+ gpio\n");
 
 	udc->regs = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(udc->regs))
@@ -2395,11 +2396,6 @@ static int pxa_udc_probe(struct platform_device *pdev)
 		udc->transceiver = usb_get_phy(USB_PHY_TYPE_USB2);
 	}
 
-	if (IS_ERR(udc->gpiod)) {
-		dev_err(&pdev->dev, "Couldn't find or request D+ gpio : %ld\n",
-			PTR_ERR(udc->gpiod));
-		return PTR_ERR(udc->gpiod);
-	}
 	if (udc->gpiod)
 		gpiod_direction_output(udc->gpiod, 0);
 
-- 
2.39.5


