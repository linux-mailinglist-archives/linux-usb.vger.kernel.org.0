Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5DF89170C2E
	for <lists+linux-usb@lfdr.de>; Thu, 27 Feb 2020 00:04:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728012AbgBZXEJ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 26 Feb 2020 18:04:09 -0500
Received: from mail-pj1-f68.google.com ([209.85.216.68]:35960 "EHLO
        mail-pj1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726413AbgBZXEI (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 26 Feb 2020 18:04:08 -0500
Received: by mail-pj1-f68.google.com with SMTP id gv17so295823pjb.1;
        Wed, 26 Feb 2020 15:04:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=zsjurGtPTTibpkqzKjZm8jUnRch17NXPwWPKWmJ+Vuc=;
        b=A3pWRVK82v74q7UE2Rowuqoj20xjR8Mvj89W3wT9EDgeuXzRfmvWvl9JYkLV2f3oxj
         ThtPjoNzAwWH3yFTnubIDFn8iefjWOJU9ztIyqxi213kz9HE763WZkEfuXgbXhNN5/tc
         /L5AGr/IeOB2hwwMRc/BKh5OLLrmlIYOQDBYzDXyVasQJjpvdy3OzSBckd0fdBDpHIQD
         rmkAdtXMyS/kEpQJI9xb6eaM93sQHySDaef4E/az0oJFwuYahBsd2hhz9jWMfwf9F1nR
         VQWYB/BBXqkbj3f2CqqxX+0oYKLknlfkUv8mxvOT8YeVcDqgrE9RkkWYogJZYMj14RCA
         52rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=zsjurGtPTTibpkqzKjZm8jUnRch17NXPwWPKWmJ+Vuc=;
        b=jhWbQ4dA2I4hTAx1bWphrByLuu77EqXfrjozO6uFFitS5QWU9ObjdFR+O9KG4WWNFj
         MH987Xj5xaKAn83w8iNa4zTZiPek7h+juHMxA1xaEmOIwJITQN9P+c71IT6ExCSxt8ab
         LnTC7QZQk8X7lvM9GpA40i/GO0CAukGEmEh1Ix+K8/z1mYUhNIy955pPEg8bbDD8456v
         6C7JheGGe0wU9Pdb9CmUu8dZPg+bJS9NfL6H6JazeYIBOO7DrIXWeDI1/w6TPGV8p0/9
         hIMZVe36UngePI5cKhV4m9Dvceb7ANsPr5fWdzHY6em0vKsb+M2xivh6BHq0FunF12hg
         drzw==
X-Gm-Message-State: APjAAAV8ggSNZmw9AbAYybmqVCNSTQ2fNm6z9/OZPkx4cvQ/jJs+ryeP
        Wxy1yYlVOX5HWOGwOsnR5xw=
X-Google-Smtp-Source: APXvYqyRYW0slf7hnoyWPRWJzidVwkAK8H8EWbA/08e8qmnHPg65wYda6/tRhFcbKEdUJFZQpqF4hQ==
X-Received: by 2002:a17:90a:fd85:: with SMTP id cx5mr1533764pjb.80.1582758245243;
        Wed, 26 Feb 2020 15:04:05 -0800 (PST)
Received: from taoren-ubuntu-R90MNF91.thefacebook.com ([2620:10d:c090:500::7:5ebf])
        by smtp.gmail.com with ESMTPSA id 3sm3912621pjg.27.2020.02.26.15.04.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Feb 2020 15:04:04 -0800 (PST)
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
Subject: [PATCH v4 3/7] usb: gadget: aspeed: add ast2600 vhub support
Date:   Wed, 26 Feb 2020 15:03:42 -0800
Message-Id: <20200226230346.672-4-rentao.bupt@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200226230346.672-1-rentao.bupt@gmail.com>
References: <20200226230346.672-1-rentao.bupt@gmail.com>
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
---
 No Change in v3/v4.
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

