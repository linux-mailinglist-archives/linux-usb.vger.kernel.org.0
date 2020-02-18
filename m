Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3120216300D
	for <lists+linux-usb@lfdr.de>; Tue, 18 Feb 2020 20:33:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726551AbgBRTdV (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 18 Feb 2020 14:33:21 -0500
Received: from mail-wm1-f66.google.com ([209.85.128.66]:52587 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726352AbgBRTdT (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 18 Feb 2020 14:33:19 -0500
Received: by mail-wm1-f66.google.com with SMTP id p9so3989954wmc.2
        for <linux-usb@vger.kernel.org>; Tue, 18 Feb 2020 11:33:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=GIsVr9Du1tvwTcb5uCrDYvsZclteV5H/OmCi1XkJbsI=;
        b=2O7QCmf9iFPFkRv0VE4t1kzuscHCsPiDVYzPZdeRD/9yAPEt88zBVFrmtSMmlZ3421
         rsxYMRWVL65/PAVSI+vSUD4Mc5D6Q71LrCBmrFVh6CoqVkFk9c3CPvosbjK7rSBUbtzg
         x+J0N0FjpraNAXztDPn6ZHeBPGRkfGD+mJZrT3LOlUMtdJVb4THClxuIne79PZiKtf+p
         Axb1FxrlwfXgmNaVy7zxMnu5Q9ueOgmTV01D2AX1SHUrRlJsXeBZN0BcRyLyeZdghWF5
         wx7bviISHxlfdi0b8mECPUKlhhT99egizBIh0rpqYep8hAgoOE9ZcK0pS/38Pb6BzwN0
         Q2oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=GIsVr9Du1tvwTcb5uCrDYvsZclteV5H/OmCi1XkJbsI=;
        b=tIYHAHu340UXjhcCohZ8r/E48Shzdm8yhGIsP0VSAgz1CTjTA1ya1dzDYqSQDDB/3g
         jh1n1zfdflEvBO/uSp7IkeULCS2IC1NVXZ85IyR91nGbZw33FNgS1X1adGYynzs9RVvm
         VdWhrvtzg1cjDquGc1yNWkJVpjsE9GoPmgKudBnL20whjwW6FPFr7eNDFcQIPfQB7PNx
         5GBg/RGi8H053AEbhDXj/Xj4Kr7rsDr0canzlsd5chu/RR7sDiV4vHoXogncrsiwvG/b
         +g/AjeM2p1f3IyL4vYqaKEsob2H4UfHDGJaDu3v9yrN1jW3q2vBfnQ23qUQajkCQNVkd
         OyUg==
X-Gm-Message-State: APjAAAUvWpRouMAl3FkEjIf3HvqcFEkYajcKEmzmd95yQxs9YpMMzeSj
        BSaFEps7ZG3kDvLh6duEuLivyQ==
X-Google-Smtp-Source: APXvYqxR5PXmj0VVyv0YT2k0zGTYVu+qYbvCaTD7nmPRrFBNPj3tgodO+1GzG5jCiyAA9mno7qDhuw==
X-Received: by 2002:a1c:1fc5:: with SMTP id f188mr4899137wmf.55.1582054396803;
        Tue, 18 Feb 2020 11:33:16 -0800 (PST)
Received: from localhost.localdomain ([51.15.160.169])
        by smtp.googlemail.com with ESMTPSA id k16sm7649266wru.0.2020.02.18.11.33.15
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Tue, 18 Feb 2020 11:33:16 -0800 (PST)
From:   Corentin Labbe <clabbe@baylibre.com>
To:     alexandre.belloni@bootlin.com, b-liu@ti.com, balbi@kernel.org,
        gregkh@linuxfoundation.org, ludovic.desroches@microchip.com,
        mathias.nyman@intel.com, nicolas.ferre@microchip.com,
        slemieux.tyco@gmail.com, stern@rowland.harvard.edu, vz@mleia.com
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, Corentin Labbe <clabbe@baylibre.com>
Subject: [PATCH 02/20] usb: gadget: legacy: inode: remove useless cast for driver.name
Date:   Tue, 18 Feb 2020 19:32:45 +0000
Message-Id: <1582054383-35760-3-git-send-email-clabbe@baylibre.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1582054383-35760-1-git-send-email-clabbe@baylibre.com>
References: <1582054383-35760-1-git-send-email-clabbe@baylibre.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

device_driver name is const char pointer, so it not useful to cast
shortname (which is already const char).

Signed-off-by: Corentin Labbe <clabbe@baylibre.com>
---
 drivers/usb/gadget/legacy/inode.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/gadget/legacy/inode.c b/drivers/usb/gadget/legacy/inode.c
index b47938dff1a2..e3dfc2180555 100644
--- a/drivers/usb/gadget/legacy/inode.c
+++ b/drivers/usb/gadget/legacy/inode.c
@@ -1736,7 +1736,7 @@ static struct usb_gadget_driver gadgetfs_driver = {
 	.suspend	= gadgetfs_suspend,
 
 	.driver	= {
-		.name		= (char *) shortname,
+		.name		= shortname,
 	},
 };
 
-- 
2.24.1

