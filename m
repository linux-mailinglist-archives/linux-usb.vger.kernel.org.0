Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 937A091212
	for <lists+linux-usb@lfdr.de>; Sat, 17 Aug 2019 19:42:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726012AbfHQRm1 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 17 Aug 2019 13:42:27 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:40366 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725925AbfHQRm1 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 17 Aug 2019 13:42:27 -0400
Received: by mail-wm1-f68.google.com with SMTP id v19so6579147wmj.5
        for <linux-usb@vger.kernel.org>; Sat, 17 Aug 2019 10:42:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=8BvRZzNwicLE/z69UjSGTGXsbcr/fKjBl5Vh3tEDe5E=;
        b=j0hYbZ96LX4H5j/7zgd5rcfxEfejgdQ/b3Z3lITb1rDiOz+pmpdDHibAGDilR0flpI
         0WqNSoZUHOM0zp94G6hvFGixz/r8qegZ8eMUsT+WoXpcJiqi3P/HYMZbec391bcLLqM9
         bvMHWcpEqu0+0B70ai/uKjLUnWIFNSIhPWSrM0arLx60w4/gS5VQTufbP721yWk1cEI7
         3cQGfYIGFlwYld047aS3/5YgQ0HJXE/9xMaieEq8o8XWUq/6cJlFfDodQ49jDZ2OCNsX
         C58m58eoOHH5BDA7qJxepz2d+pWPrxIWG4UrUG+Ue/3DtZLfyVGoKFvWZm4ooYzwr8zA
         dEzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=8BvRZzNwicLE/z69UjSGTGXsbcr/fKjBl5Vh3tEDe5E=;
        b=ffxx92C0iiWvNxRQuMuRqE6OUAT7iCUYRFo3nSQJOd+tAzUNaYi1SfHFh3tpJi8bC6
         3C3CltRciRwOeDNtiqm9dg0xoSFumZ3G8VFIc67UYOT7L1KP3O7cagZlj97To5Nn9g1Y
         XzL3U7IFgh6BqlhYPquYN8Qu2M+3K6huXG2NjNaeKMVzf2lhIxwX3PYgEDuKAio0Cgcx
         /nxLXwGcP6Gi/SOuqIw9Q9zv3X1dj09PVhqQucAMXj4Aes8Wdl5WUpzyFTqlHQITk5jp
         ExDCYh6L23tEzzl6HupGsv7Tz6CoDS11AC63sY/laC6k7ONAK4/0zGDQcxA8JVkjWdvd
         HOvw==
X-Gm-Message-State: APjAAAVNFLP+iNmG73oOWK/cePM9BF4OzCI0Y1dmcNcP/1BUNr18+mZM
        zbjDjUQKEhCXlvx//8qkgRLzp82FXKc=
X-Google-Smtp-Source: APXvYqxv2eAKy6wC5/B6NqHIhQmJQf/sbwr5KaaeCSiu5f34DWh1zJuYU6TFxW662W79bfdW9CZ7MQ==
X-Received: by 2002:a1c:a957:: with SMTP id s84mr12487811wme.65.1566063744693;
        Sat, 17 Aug 2019 10:42:24 -0700 (PDT)
Received: from localhost.localdomain ([92.59.185.54])
        by smtp.gmail.com with ESMTPSA id t8sm23681659wra.73.2019.08.17.10.42.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Aug 2019 10:42:23 -0700 (PDT)
From:   Vicente Bergas <vicencb@gmail.com>
To:     Felipe Balbi <balbi@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>
Cc:     Heiko Stuebner <heiko@sntech.de>,
        Will Deacon <will.deacon@arm.com>,
        MarcZyngier <marc.zyngier@arm.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Matthias Brugger <mbrugger@suse.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org,
        Vicente Bergas <vicencb@gmail.com>
Subject: [PATCH] usb: dwc3: Add shutdown to platform_driver
Date:   Sat, 17 Aug 2019 19:41:40 +0200
Message-Id: <20190817174140.6394-1-vicencb@gmail.com>
X-Mailer: git-send-email 2.22.1
In-Reply-To: <4d18d4f7-a00e-bd60-6361-51054eba3bca@arm.com>
References: <4d18d4f7-a00e-bd60-6361-51054eba3bca@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Otherwise the device keeps writing to memory after kexec and disturbs
the next kernel.

Signed-off-by: Vicente Bergas <vicencb@gmail.com>
---
 drivers/usb/dwc3/dwc3-of-simple.c | 6 ++++++
 1 file changed, 6 insertions(+)

Hi Felipe, Robin,
this version calls 'remove' from 'shutdown' instead of just asserting
a reset because it looks like a cleaner way to stop the device.

Calling remove from shutdown in core.c instead of dwc3-of-simple.c does not
fix the issue either.

It has been tested on the sapphire board, a RK3399 platform.

Regards,
  Vicenç.

diff --git a/drivers/usb/dwc3/dwc3-of-simple.c b/drivers/usb/dwc3/dwc3-of-simple.c
index bdac3e7d7b18..d5fd45c64901 100644
--- a/drivers/usb/dwc3/dwc3-of-simple.c
+++ b/drivers/usb/dwc3/dwc3-of-simple.c
@@ -133,6 +133,11 @@ static int dwc3_of_simple_remove(struct platform_device *pdev)
 	return 0;
 }
 
+static void dwc3_of_simple_shutdown(struct platform_device *pdev)
+{
+	dwc3_of_simple_remove(pdev);
+}
+
 static int __maybe_unused dwc3_of_simple_runtime_suspend(struct device *dev)
 {
 	struct dwc3_of_simple	*simple = dev_get_drvdata(dev);
@@ -190,6 +195,7 @@ MODULE_DEVICE_TABLE(of, of_dwc3_simple_match);
 static struct platform_driver dwc3_of_simple_driver = {
 	.probe		= dwc3_of_simple_probe,
 	.remove		= dwc3_of_simple_remove,
+	.shutdown	= dwc3_of_simple_shutdown,
 	.driver		= {
 		.name	= "dwc3-of-simple",
 		.of_match_table = of_dwc3_simple_match,
-- 
2.22.1

