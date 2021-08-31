Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2989A3FC303
	for <lists+linux-usb@lfdr.de>; Tue, 31 Aug 2021 08:55:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237960AbhHaGzc (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 31 Aug 2021 02:55:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46836 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236942AbhHaGzc (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 31 Aug 2021 02:55:32 -0400
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 22240C061575
        for <linux-usb@vger.kernel.org>; Mon, 30 Aug 2021 23:54:37 -0700 (PDT)
Received: by mail-lj1-x234.google.com with SMTP id j12so29943820ljg.10
        for <linux-usb@vger.kernel.org>; Mon, 30 Aug 2021 23:54:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=KA0DNJ/h5FUhfovoEu1yIRYDM3KnGkH/hC6vqZb5KzE=;
        b=BuMe7Gi0xEdKiP94g0YVmqN3d3kgOT3j1WAKgiAz9MoMXCrya9nH8Fj0hUDy+oRezh
         f9Dq3QiEOGt8qWldby5RVglDRN5Xq82mQjcdUXAMvxdpmN51xy4cLLiNt1KHTy8SqqRd
         FFW4unxZ0Aw5DIZAlLFX+rebD8C+3cf96Spy6TLRjZ9KlFVFuCF7IaADVmJwsvoyFAF0
         h9W7OKYQ/0YGaG/OJt5D0bGkQ2MVzZVCFnBRybNW/YKF6VaMzqPi7MHHvGoLpn7o41mN
         8rH4dGazVpYSrMj8gQTJeHp+6e6tm/LsepfO1+5VGWPIh1knacJFVkNxdDl+wBn+YrfR
         pWjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=KA0DNJ/h5FUhfovoEu1yIRYDM3KnGkH/hC6vqZb5KzE=;
        b=bQ5cL4LiGJ8jScm0jpiNT3WGiqtPKkDpKlf9nmbkJoIU0i18c+W9byXoLHXUrU/okf
         CMAVWHa9EJ+l5dSXy0p0yLEwbFFyrrsl3ig5Qpx08nF4MZO4nV6QoeI+qg4RxAG4voiV
         pxbrzUU5F+imgb60hHhB3lhIyxtgmm+SoAlYLTD1ze4sDn6Cqhlvnh/iSyqR/A4TPv0D
         T2Ha2MrTtbKjUSWLJfjnabAmKY9KsR8XUQg9Sjd+/AjA++9ozMD1ugvexd+gb9OETBiv
         y62VCA14oJAMWuNsa4tBM0Emp6zRsoEQ6/Bh1b/EJ89/BV2ZbQfVG/EMBKhekXvVO+ye
         95Lw==
X-Gm-Message-State: AOAM5309DcofaunZq8hQ27x527+Qo2ixfx3c5sNuaw78qCHBJn4CmKOv
        QeCE/FULZIZgo2vztbEz0BxLcgSCBp0=
X-Google-Smtp-Source: ABdhPJzvJj/iD79v9tgk1DczNp0GxCJJW4uKa1WuBN6AYwX7sb5W3yQDimmm0WJZ8+CGtI//LlVbTQ==
X-Received: by 2002:a2e:99c8:: with SMTP id l8mr24100473ljj.178.1630392875428;
        Mon, 30 Aug 2021 23:54:35 -0700 (PDT)
Received: from localhost.localdomain ([2a00:f41:380f:9460:d43f:c035:7aa2:d752])
        by smtp.gmail.com with ESMTPSA id p1sm918892lfo.255.2021.08.30.23.54.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Aug 2021 23:54:35 -0700 (PDT)
From:   =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Liu Shixin <liushixin2@huawei.com>, linux-usb@vger.kernel.org,
        =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>,
        Chuhong Yuan <hslester96@gmail.com>
Subject: [PATCH fix] Revert "USB: bcma: Add a check for devm_gpiod_get"
Date:   Tue, 31 Aug 2021 08:54:19 +0200
Message-Id: <20210831065419.18371-1-zajec5@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Rafał Miłecki <rafal@milecki.pl>

This reverts commit f3de5d857bb2362b00e2a8d4bc886cd49dcb66db.

That commit broke USB on all routers that have USB always powered on and
don't require toggling any GPIO. It's a majority of devices actually.

The original code worked and seemed safe: vcc GPIO is optional and
bcma_hci_platform_power_gpio() takes care of checking the pointer before
using it.

This revert fixes:
[   10.801127] bcma_hcd: probe of bcma0:11 failed with error -2

Cc: Chuhong Yuan <hslester96@gmail.com>
Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
---
 drivers/usb/host/bcma-hcd.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/usb/host/bcma-hcd.c b/drivers/usb/host/bcma-hcd.c
index 337b425dd4b0..2df52f75f6b3 100644
--- a/drivers/usb/host/bcma-hcd.c
+++ b/drivers/usb/host/bcma-hcd.c
@@ -406,12 +406,9 @@ static int bcma_hcd_probe(struct bcma_device *core)
 		return -ENOMEM;
 	usb_dev->core = core;
 
-	if (core->dev.of_node) {
+	if (core->dev.of_node)
 		usb_dev->gpio_desc = devm_gpiod_get(&core->dev, "vcc",
 						    GPIOD_OUT_HIGH);
-		if (IS_ERR(usb_dev->gpio_desc))
-			return PTR_ERR(usb_dev->gpio_desc);
-	}
 
 	switch (core->id.id) {
 	case BCMA_CORE_USB20_HOST:
-- 
2.26.2

