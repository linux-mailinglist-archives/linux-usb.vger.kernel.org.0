Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 27F6710C9BF
	for <lists+linux-usb@lfdr.de>; Thu, 28 Nov 2019 14:44:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726909AbfK1Nnv (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 28 Nov 2019 08:43:51 -0500
Received: from mail-wm1-f65.google.com ([209.85.128.65]:40537 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726656AbfK1Nnv (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 28 Nov 2019 08:43:51 -0500
Received: by mail-wm1-f65.google.com with SMTP id y5so11707752wmi.5
        for <linux-usb@vger.kernel.org>; Thu, 28 Nov 2019 05:43:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=vtzLD0tyab7VEFg5K+G3bH3VUcvOhRi/b0o/Pb84uPg=;
        b=tIfp8pk983wWAlUIotSYeqWNg3ZI5ZwNr8gf2fngdwvGRNbPC89oqvVwYbs5HxV5Xp
         jUJ9wSR8H29ha+IAEKJUY7BA6srBV8K2TXitMb0yjTK0w9Ir6AkJCuCxtOtdCkdBbPJw
         fYDpGW59cKqQFb6Q61PO0ksF0XvWW/IeWTDZvbvjlSXC0JE3Et/LvYLs3mope5NEBUuF
         ro3PeFyseq+2RJ9/JpJRqJKLx7wXF44XSH9kta2wYFBpvjuZxJ1Ihz9nDZwUeBmPZFfT
         LOPg6sEsZpP/5eHcFfm+8l23a+QEdgZtNH8B1kZeZMEPLfeaICFCAnS9Oa4K27so7MLu
         aqcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=vtzLD0tyab7VEFg5K+G3bH3VUcvOhRi/b0o/Pb84uPg=;
        b=qBa9MhWLdmIUNjO7e7MgyhtflfxjOZmh7Ou1H8fAOl6Bw2JjGrJhfZoRvTBzz4czVH
         D4SJT7mBDqYRhZb/18Va/le5K+R5ogBS0N8oQEYLfTJq0vSOWpSof3avOLBbv6VnvjIW
         9goIlqbUlbDQmVBzCSRsiMBmP6N2chzNZ80Dez3SDo82JcaMZP9UhLzhDNMyvRN4RLpo
         2tVrJY+efC4J6OyT050cL7XqlAC9/wmcXg5gS/W52k6W5oCn8C+vofEqRc8h/XNH5Dl9
         psocS0U0pjcVDJ6A1t/pQhp4LuBbzvRyjClsg71iH/PqjyTyC1PfhgvOdRRv4m5amGCr
         HzFQ==
X-Gm-Message-State: APjAAAVtkWA7CRa4qRdLuj01rQSQu3FzbU7mNZBc6RhAJteFTagoua5y
        5/edTRIRSVfzhgSfFLz9Cs1E6p3svfw=
X-Google-Smtp-Source: APXvYqyf46hZBfKvDKQEzIdpHO2/RKf7J9rYHD3HrhxoRz2Bcmo6J8EHzeVg7tSXozyJK0+Qyq4wGw==
X-Received: by 2002:a1c:3b82:: with SMTP id i124mr9015505wma.122.1574948628635;
        Thu, 28 Nov 2019 05:43:48 -0800 (PST)
Received: from localhost.localdomain ([176.61.57.127])
        by smtp.gmail.com with ESMTPSA id u26sm10743407wmj.9.2019.11.28.05.43.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Nov 2019 05:43:48 -0800 (PST)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
Cc:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Chunfeng Yun <chunfeng.yun@mediatek.com>,
        Nagarjuna Kristam <nkristam@nvidia.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH 1/2] usb: common: usb-conn-gpio: Don't log an error on probe deferral
Date:   Thu, 28 Nov 2019 13:43:57 +0000
Message-Id: <20191128134358.3880498-2-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191128134358.3880498-1-bryan.odonoghue@linaro.org>
References: <20191128134358.3880498-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This patch makes the printout of the error message for failing to get a
VBUS regulator handle conditional on the error code being something other
than -EPROBE_DEFER.

Deferral is a normal thing, we don't need an error message for this.

Cc: Chunfeng Yun <chunfeng.yun@mediatek.com>
Cc: Nagarjuna Kristam <nkristam@nvidia.com>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/usb/common/usb-conn-gpio.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/common/usb-conn-gpio.c b/drivers/usb/common/usb-conn-gpio.c
index 87338f9eb5be..ed204cbb63ea 100644
--- a/drivers/usb/common/usb-conn-gpio.c
+++ b/drivers/usb/common/usb-conn-gpio.c
@@ -156,7 +156,8 @@ static int usb_conn_probe(struct platform_device *pdev)
 
 	info->vbus = devm_regulator_get(dev, "vbus");
 	if (IS_ERR(info->vbus)) {
-		dev_err(dev, "failed to get vbus\n");
+		if (PTR_ERR(info->vbus) != -EPROBE_DEFER)
+			dev_err(dev, "failed to get vbus\n");
 		return PTR_ERR(info->vbus);
 	}
 
-- 
2.24.0

