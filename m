Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 99E70161F4A
	for <lists+linux-usb@lfdr.de>; Tue, 18 Feb 2020 04:13:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726442AbgBRDN3 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 17 Feb 2020 22:13:29 -0500
Received: from mail-pf1-f196.google.com ([209.85.210.196]:40992 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726245AbgBRDN3 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 17 Feb 2020 22:13:29 -0500
Received: by mail-pf1-f196.google.com with SMTP id j9so9884709pfa.8;
        Mon, 17 Feb 2020 19:13:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=JlrTFZcXaXEEafeSE3nImbB0vbUzyWCyCcfm1wOyiLc=;
        b=C4Dz20e0ry953A10oUBIOcW9uU42YAT3MsW18oEofB/y7Cj1Yzfgs2Da0xAXUflgep
         r0yWRItnmYjTUZNPeZO2H33x5ZLOnG9u4euuSZocYgymgfN0rNXGJ98TcH3l0ozuh5TY
         KGTAt3bsAzxNDNSWjZWMrkS5zmp1MHlk+9sQwlpIRlgf6HcLjcuuGkdFa9yu3eFMB8g1
         4Xp8pfRYiG9+1LIMPUJUV1e2nMcu9z8sDtNrTqiUa8M84SUF8xU+QuVAgusPC6HRx1vt
         rnkYezB5D34oE4SOKSNImOPxqpn19oKeaFkaFcPBp2uk5NuaGK8Cb33a56fhrZQkbqCI
         doFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=JlrTFZcXaXEEafeSE3nImbB0vbUzyWCyCcfm1wOyiLc=;
        b=ABP1rAfAXmeP7DKPT6MktNn93cYjyP6QsypNifNfGblYWrs4eCcsywLj6j1ideR+Ih
         ADhmhVlTh8kXVrairD/1ZgTlEme4wb1c0KIbphUje2v4HRwpnfp+aYbqHypCFHaO6KEn
         y61H+GhkvbpgjmcapJi5HKXP6XO7idmKV4JrIEXYmWJ1cDIyqS964mci9V34/ffAFODZ
         d9naq0qE9xFlpY7AilekgSiq6zc8q4UKpH2qY7UQbbzDiqyUQkVjbg7oFJTDNC6YlHQj
         kNACJ1RQwr352cNMbZZCrKHAwpkFC74vDarWkri1/R9ML2KxDJWGGks3Rlm8gCLI2j6o
         I9GQ==
X-Gm-Message-State: APjAAAXSoHPxmE7KNn/vT8N3SQHR+CWFaHOwWLB4jHrX39EdMLb98dfJ
        K1/FZq4djN/KSFv99Q2+DEw=
X-Google-Smtp-Source: APXvYqzfYZcx45jDrw2b3lwZ9VtKORLiesbinZG49d5O6n/fZzIx4Lq9J4RL2j09kiOMrlAzng+MMw==
X-Received: by 2002:a63:ce03:: with SMTP id y3mr21577884pgf.427.1581995608638;
        Mon, 17 Feb 2020 19:13:28 -0800 (PST)
Received: from taoren-ubuntu-R90MNF91.thefacebook.com ([2620:10d:c090:180::6f94])
        by smtp.gmail.com with ESMTPSA id b18sm1812595pfd.63.2020.02.17.19.13.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Feb 2020 19:13:28 -0800 (PST)
From:   rentao.bupt@gmail.com
To:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@aj.id.au>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Chunfeng Yun <chunfeng.yun@mediatek.com>,
        Colin Ian King <colin.king@canonical.com>,
        Stephen Boyd <swboyd@chromium.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, linux-usb@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-aspeed@lists.ozlabs.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org,
        taoren@fb.com
Cc:     Tao Ren <rentao.bupt@gmail.com>
Subject: [PATCH v3 2/5] usb: gadget: aspeed: add ast2600 vhub support
Date:   Mon, 17 Feb 2020 19:13:12 -0800
Message-Id: <20200218031315.562-3-rentao.bupt@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200218031315.562-1-rentao.bupt@gmail.com>
References: <20200218031315.562-1-rentao.bupt@gmail.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Tao Ren <rentao.bupt@gmail.com>

Add AST2600 support in aspeed-vhub driver. There are 3 major differences
between AST2500 and AST2600 vhub:
  - AST2600 supports 7 downstream ports while AST2500 supports 5.
  - AST2600 supports 21 generic endpoints while AST2500 supports 15.
  - EP0 data buffer's 8-byte DMA alignment restriction is removed from
    AST2600.

Signed-off-by: Tao Ren <rentao.bupt@gmail.com>
Reviewed-by: Andrew Jeffery <andrew@aj.id.au>
Reviewed-by: Joel Stanley <joel@jms.id.au>
---
 Changes in v3:
   - None.
 Changes in v2:
   - removed "ast_vhub_config" related logic.

 drivers/usb/gadget/udc/aspeed-vhub/Kconfig | 4 ++--
 drivers/usb/gadget/udc/aspeed-vhub/core.c  | 3 +++
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/gadget/udc/aspeed-vhub/Kconfig b/drivers/usb/gadget/udc/aspeed-vhub/Kconfig
index 83ba8a2eb6af..605500b19cf3 100644
--- a/drivers/usb/gadget/udc/aspeed-vhub/Kconfig
+++ b/drivers/usb/gadget/udc/aspeed-vhub/Kconfig
@@ -4,5 +4,5 @@ config USB_ASPEED_VHUB
 	depends on ARCH_ASPEED || COMPILE_TEST
 	depends on USB_LIBCOMPOSITE
 	help
-	  USB peripheral controller for the Aspeed AST2500 family
-	  SoCs supporting the "vHub" functionality and USB2.0
+	  USB peripheral controller for the Aspeed AST2400, AST2500 and
+	  AST2600 family SoCs supporting the "vHub" functionality and USB2.0
diff --git a/drivers/usb/gadget/udc/aspeed-vhub/core.c b/drivers/usb/gadget/udc/aspeed-vhub/core.c
index e4395813df35..442845a64660 100644
--- a/drivers/usb/gadget/udc/aspeed-vhub/core.c
+++ b/drivers/usb/gadget/udc/aspeed-vhub/core.c
@@ -431,6 +431,9 @@ static const struct of_device_id ast_vhub_dt_ids[] = {
 	{
 		.compatible = "aspeed,ast2500-usb-vhub",
 	},
+	{
+		.compatible = "aspeed,ast2600-usb-vhub",
+	},
 	{ }
 };
 MODULE_DEVICE_TABLE(of, ast_vhub_dt_ids);
-- 
2.17.1

