Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7C784172BEC
	for <lists+linux-usb@lfdr.de>; Fri, 28 Feb 2020 00:05:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730290AbgB0XFY (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 27 Feb 2020 18:05:24 -0500
Received: from mail-pl1-f194.google.com ([209.85.214.194]:37314 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730275AbgB0XFX (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 27 Feb 2020 18:05:23 -0500
Received: by mail-pl1-f194.google.com with SMTP id q4so422302pls.4;
        Thu, 27 Feb 2020 15:05:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=yJC16zlFSOyxbyka2I18YVaxRbVkz24cosOoXMXos50=;
        b=G8yUlb/UgIGBnsBBBzhuJpYS/b3TODQNj2LCX6Ni0FHusgj/dI6DvMfY3DyLXjCd+4
         7TSd9b1kx4YHRO7u2jVBcK0cxQXp6n5BV8iCLJQ+B3D42RuDg3Hms+Zlt54xOer6ClP7
         IT7OOA6dSTkTInmPaBZ0RaWcvMhuY5KFarW1iRYSDp+kz6SXgyA/kE7EAxmJq7qOPcj0
         urJGWTP9TVVzwIAJnV6kgPEWj3UwU6XdjgbEQ0EALzqp7R1SIEBVb6PGa4hqIYzKkcDi
         p5OtNP8zApxHZPUF+HFvhu4WNzn/UY5Eph9q+gfBudKs+Vq2Yk3i8kl64/RMOmOJZOkH
         T2yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=yJC16zlFSOyxbyka2I18YVaxRbVkz24cosOoXMXos50=;
        b=QkselsoZ0DIc4QFJ2Lh1DcJAYNjLuWAPupEv4yYcpEp+bzdywU3G3uQJchqqs7hP2h
         7fRFTiUQHImcB2I0GB+rhuxeu1MkusfV+wHGjQ/i7Og7ADtrkf+Kx9KX2Icdygw2omVa
         CiyLdFCYz03ijiMSd8M+BrXLqw5yIhO7u9hN/yq2x2yByJJ5AQhesWWf65OBP+zvOxF3
         2CqtVGtXnKycs6PjWlawhVgci6Tcci2I7BTp+g+SMYM1oiC5uPO1kUUgVSWMM3WlyQ6G
         qv5Qc27KDkenJgFvppaTuJSNdjQnd0Ba4tjrfOtXYnG8B+3M8fze2xi8jfZWjptyipHc
         2IOA==
X-Gm-Message-State: APjAAAXxecKbsylG4ChbgUHqqmgnPhkKgnUvo3cHHdiZknqrC381iqp8
        x13/vNJNiTOodoHB2OlDnbE=
X-Google-Smtp-Source: APXvYqwORVgy8DNmPXAm9w8bkqL0l/3lqlTjrEqHlGoRPD+Vd86uBoG6JTIEh5PWgEsQSRCgSNUjwQ==
X-Received: by 2002:a17:90a:d348:: with SMTP id i8mr1395591pjx.43.1582844721043;
        Thu, 27 Feb 2020 15:05:21 -0800 (PST)
Received: from taoren-ubuntu-R90MNF91.thefacebook.com ([2620:10d:c090:500::4:d8f5])
        by smtp.gmail.com with ESMTPSA id w2sm8275975pfw.43.2020.02.27.15.05.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Feb 2020 15:05:20 -0800 (PST)
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
Subject: [PATCH v5 3/7] usb: gadget: aspeed: add ast2600 vhub support
Date:   Thu, 27 Feb 2020 15:05:03 -0800
Message-Id: <20200227230507.8682-4-rentao.bupt@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200227230507.8682-1-rentao.bupt@gmail.com>
References: <20200227230507.8682-1-rentao.bupt@gmail.com>
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
Acked-by: Benjamin Herrenschmidt <benh@kernel.crashing.org>
---
 No Change in v3/v4/v5.
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
index f8ab8e012f34..f8d35dd60c34 100644
--- a/drivers/usb/gadget/udc/aspeed-vhub/core.c
+++ b/drivers/usb/gadget/udc/aspeed-vhub/core.c
@@ -423,6 +423,9 @@ static const struct of_device_id ast_vhub_dt_ids[] = {
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

