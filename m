Return-Path: <linux-usb+bounces-33513-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AZ5hBzthmGkVHgMAu9opvQ
	(envelope-from <linux-usb+bounces-33513-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Fri, 20 Feb 2026 14:27:23 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 9018C167CAB
	for <lists+linux-usb@lfdr.de>; Fri, 20 Feb 2026 14:27:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5E0F430219BC
	for <lists+linux-usb@lfdr.de>; Fri, 20 Feb 2026 13:27:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78EE634678D;
	Fri, 20 Feb 2026 13:27:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GDyqwfVh"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2CE432FA1B
	for <linux-usb@vger.kernel.org>; Fri, 20 Feb 2026 13:27:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771594037; cv=none; b=aYHhAiqZMKpQSTjzqwMZQgJ14Sy1++2XWK/9ey0y2fHBZYR14bMXygJE/UoprB8pzek1WzPxUcgtlc6Rmmhv9m1RJ729nKzMQ3YOeW4tdDu7lL3j7q6+6G9VHH0rjuwaE/e/0Y1pyb70QUzil8Fr9uBAVdy4iRurpU/2N0VUP0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771594037; c=relaxed/simple;
	bh=SL+hCJl8NVJyHtTra+SBQTc/Qc0hchPC1rt+qmF2/5M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=SP66KkmOR6hbGNuVFqKEG5snfpxQE/PRywF8/Q9ZMr/gnKTNnV0hdIgfiCFWQcKiztCUF2ycOJzprYlgMKMMoYW0AJZzemIYfXhn0AXN+GE69c6iDSx4GHbvjXIs/CMA0AJy2jD6ATo9Qtv1Xw+i3UQGDwGQCd7hp6Yh8osJAPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GDyqwfVh; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4833115090dso19650855e9.3
        for <linux-usb@vger.kernel.org>; Fri, 20 Feb 2026 05:27:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771594034; x=1772198834; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XPeIw7v04h3XB7z1p+iLdmX/CwyJGydUSf5l09KjUDs=;
        b=GDyqwfVhxlROMeqAs9YGAvPFx7W2AewnTfqkOvF+YdsbhkpOEPS4CEQ49ryKeW+JA5
         X9SO1dmfe7iGM99SDcnZq+mi6UHZXBzKEIG95FtOZSawUH7p5yZOsaSrxVv/xqEH/E+c
         chacvAAcW9SOOyg6HXKu3XgOuFltZxoAaWWvv/FnG9AgyqnpTCHaTj9M0Kst2z0D/OXh
         WTltkJ5/giZZfTk3Zh1/kQoSi8M7ah7H2lJMsCLQtRhGg6vxZUAWIeNmCob/KiRlC1Ly
         DZr+hwSnJTfTsQothCTfsIy07/NFe7xyAM3D2pJdQenObiJ291h2RKNih8ejqoeyd2da
         WVQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771594034; x=1772198834;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XPeIw7v04h3XB7z1p+iLdmX/CwyJGydUSf5l09KjUDs=;
        b=xFwY3APuebGx9nbHm4U6SdjgY6kY/2h0SxOwpe6qJm2ZzMDND8VMPx7iGptaSFu7nK
         224Bpdq0EapUNW65cShEoO24bduullPBCcXYBEWZHSQKTX3L8Bt0zPrNvFbLUcb4BgP6
         DomNjQfKDwgZq+qLPTqu6deO9oNx1jEyY8YTT67K1eVjaNj5o3C9xTEoBrx12vkLGYmh
         Iun+6UEog+Y9L1DyjZJwYu9KZ1pg0YcUYGLkCkOgNkrR0QnwfqR/PCEtHgAf5iXlSjaX
         gEKeMaRnuotzmF/F5dFcPpQ3c5TW9EHxC+re4rVCDxXAZ91zDJAoJVIMe1MtkNC9XTEp
         ZICw==
X-Forwarded-Encrypted: i=1; AJvYcCV+11Hij2pE0zqgDAvKQitkMiHeXjNXroOAWiJTY4dKz4kMR62J7Fb1X9VrFbligIWZJOU8P5YFULI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1o5ttM+o0jeA0L8GD4uY0gjHWl5y2x4Yqkzh83OkwaP5/BXoQ
	yFgA4yz+D9MMgSP2JhC3fuIbt8PyUkT/eO1TLMOmEi+3eg3EYMV65axs
X-Gm-Gg: AZuq6aLGdt8VGNjV7nV7AmqeBrLk4HDgOzU+tX51y/48iKssPYODAWKF+Uw8//DydgX
	JrfnAfyqRi96NMRsNsvp9TNAie4OjsF675cIh3xCUucuGNRgcGELsgi57We+0cZr/m3/7ve8llb
	aa6lesynQ/gGksFgXazJxC4U+06/VP8VAsb3xYdj9I2MdjqoxDHaezpQSQj9vQxv+p1j72lUF3B
	8kq7Mx6xpkkCCH2qMVY8ZjV063s/Tst1WyqiXPqbJTIsAkU7n9QMwDrBRvY2xTZCl2G0PkgMUsJ
	q02YfHGlL2oXdrN2cEWIQpagE4OCkimLzlwNfIaAsLqjInyyyhccZ8hQO6JpY8sGZ+PSdsXXpTU
	0Kt5VcwynBTLbeksLzT4GV3i3xcJHsLW2ZrL/7DrEUHdoE/6ycDVHDqR/lM16a2hM9H798XN04/
	QBTnCmjLVsVZAJSlzlUOkOi12mS1IYOsMZjWI/BlQeLjS634/Be5ObuAygvj82rU0=
X-Received: by 2002:a05:600c:46cd:b0:479:1b0f:dfff with SMTP id 5b1f17b1804b1-48398a550dcmr142793575e9.10.1771594033629;
        Fri, 20 Feb 2026 05:27:13 -0800 (PST)
Received: from [192.168.0.253] (5D59A51C.catv.pool.telekom.hu. [93.89.165.28])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-483a3dea9aasm25882215e9.1.2026.02.20.05.27.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Feb 2026 05:27:13 -0800 (PST)
From: Gabor Juhos <j4g8y7@gmail.com>
Date: Fri, 20 Feb 2026 14:27:02 +0100
Subject: [PATCH] usb: ehci-orion: remove optional PHY handling code
 remnants
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260220-ehci-orion-drop-phy-handling-v1-1-01abd9f168cc@gmail.com>
X-B4-Tracking: v=1; b=H4sIACVhmGkC/x3MTQqEMAxA4atI1gZq5gfqVcSFtBkbGNqSgjhI7
 26Y5YOPd0FjFW4wDxcoH9KkZItpHCCkLe+MEq2BHL0dkUNOQbCoMYxaKtb0Q4PxK3nH6B9hegV
 P7klgi6r8kfO/X9beb7GjdPVuAAAA
X-Change-ID: 20260220-ehci-orion-drop-phy-handling-d93c15c92042
To: Alan Stern <stern@rowland.harvard.edu>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Gregory CLEMENT <gregory.clement@bootlin.com>, 
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, Gabor Juhos <j4g8y7@gmail.com>
X-Mailer: b4 0.14.2
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[bootlin.com,vger.kernel.org,lists.infradead.org,gmail.com];
	TAGGED_FROM(0.00)[bounces-33513-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[j4g8y7@gmail.com,linux-usb@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 9018C167CAB
X-Rspamd-Action: no action

Since the USB core code handles the generic USB PHYs automatically, the
optional PHY handling code has been removed from the 'ehci-orion' driver
entirely by commit e04585184dcf ("usb: ehci-orion: avoid double PHY
initialization"). However, the devm_phy_optional_get() call has been kept
so the driver still gets the PHY even though it is not used for anything
in the driver.

Drop the remaining code, and also remove the 'phy' member of the
'orion_ehci_hcd' structure to simplify the code.

Fixes: e04585184dcf ("usb: ehci-orion: avoid double PHY initialization")
Signed-off-by: Gabor Juhos <j4g8y7@gmail.com>
---
 drivers/usb/host/ehci-orion.c | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/drivers/usb/host/ehci-orion.c b/drivers/usb/host/ehci-orion.c
index 34abff8669f8bf096f4547b6ce0977eb130b3c8d..eaaa49712a8c64928771eb317165091480245d0f 100644
--- a/drivers/usb/host/ehci-orion.c
+++ b/drivers/usb/host/ehci-orion.c
@@ -12,7 +12,6 @@
 #include <linux/clk.h>
 #include <linux/platform_data/usb-ehci-orion.h>
 #include <linux/of.h>
-#include <linux/phy/phy.h>
 #include <linux/usb.h>
 #include <linux/usb/hcd.h>
 #include <linux/io.h>
@@ -60,7 +59,6 @@
 
 struct orion_ehci_hcd {
 	struct clk *clk;
-	struct phy *phy;
 };
 
 static struct hc_driver __read_mostly ehci_orion_hc_driver;
@@ -276,13 +274,6 @@ static int ehci_orion_drv_probe(struct platform_device *pdev)
 			goto err_put_hcd;
 	}
 
-	priv->phy = devm_phy_optional_get(&pdev->dev, "usb");
-	if (IS_ERR(priv->phy)) {
-		err = PTR_ERR(priv->phy);
-		if (err != -ENOSYS)
-			goto err_dis_clk;
-	}
-
 	/*
 	 * (Re-)program MBUS remapping windows if we are asked to.
 	 */

---
base-commit: 2b7a25df823dc7d8f56f8ce7c2d2dac391cea9c2
change-id: 20260220-ehci-orion-drop-phy-handling-d93c15c92042

Best regards,
-- 
Gabor Juhos <j4g8y7@gmail.com>


