Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 52C5D3B9CCB
	for <lists+linux-usb@lfdr.de>; Fri,  2 Jul 2021 09:12:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230173AbhGBHPE (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 2 Jul 2021 03:15:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56900 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230137AbhGBHPE (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 2 Jul 2021 03:15:04 -0400
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com [IPv6:2607:f8b0:4864:20::b4a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7EFD8C061762
        for <linux-usb@vger.kernel.org>; Fri,  2 Jul 2021 00:12:32 -0700 (PDT)
Received: by mail-yb1-xb4a.google.com with SMTP id w13-20020a056902100db0290559a715f5bbso11352647ybt.23
        for <linux-usb@vger.kernel.org>; Fri, 02 Jul 2021 00:12:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=UnsUVbnKrmyU1lgIL4DYjS7D/XYOp3W6UGWKGs+lUZA=;
        b=E+z6hu7lKYUyuWKm+szD1aJe1A0llfRSOkbyhTv9LsPXBWMIKDNzTe/u59jQkUbJFh
         jyZZg/9L8SYZjInggezn/F5Cb8+VP1Jw9uLJHCb8eg9asRZxpFElyTA2EG9yKv1UF09Y
         KQc7Vkjl+UJxA5J+N+4+BK9ycQWXJC8dfes0KpCRjP10T3QF/fWkH7Eu3mRAEJPrq0nd
         GbUr9FK6nHjrkBfskM0NPSgGrZy8wmcv9kF48t3fJclvv6PHsF37SLgA24YLtql6AazV
         VvpfRUkb56dN2rYblA7DcH7E+saT4TJE0fcDx98iHUaaDOydE4+q/xgPIy9D8QGg79FG
         xEMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=UnsUVbnKrmyU1lgIL4DYjS7D/XYOp3W6UGWKGs+lUZA=;
        b=uAyAldFTsKA13ofRVOiXGT1Q9WeZtt2qys76gVUrFlW5mVZACB7ayy/28xHp+Z2qhH
         Fk8aJ9rxgfyVGk7ZHp8WoMGhk6QESDNiDfNkxM5LwafXfRCxTaCpgzoksZ8a/mjLAdpm
         ky42bhnnbzxvHo2OkdVpX82mRz9VI893J2TqUg2lJqXagoKHk5Ixj8FmT1J9iZcG84iu
         n/goOmGd2nnE02uLSquQiWbWeEohAneA0DUSJ6zAOyeHUXn3s6a51/BjCt+2nIc3PZLy
         A4AmJP+STxrwTqxSQgl84z7MSjQj1lQUtHA9wBAoloVgnODy67uvn5WkBRVacytC13R2
         FL/Q==
X-Gm-Message-State: AOAM532wl5gP3dNJJlmh+CeSYRhyqbmE6nLqZU8ChKxoIX8oFOFYETF+
        tXPxRrzy2/B6W6sJH3Lv41FSincENM0L
X-Google-Smtp-Source: ABdhPJzsH3mqEkh3V1kTNtE1Mz0ju8P5J6AfhJCXdPCem19ojYXCkcPxUSkNWenLGL/qZEITZPHxXzp1GDs3
X-Received: from gthelen2.svl.corp.google.com ([2620:15c:2cd:202:81c6:dd12:da9f:dd72])
 (user=gthelen job=sendgmr) by 2002:a25:c709:: with SMTP id
 w9mr4870053ybe.456.1625209951580; Fri, 02 Jul 2021 00:12:31 -0700 (PDT)
Date:   Fri,  2 Jul 2021 00:12:24 -0700
In-Reply-To: <xr93czs1p4uj.fsf@gthelen2.svl.corp.google.com>
Message-Id: <20210702071224.3673568-1-gthelen@google.com>
Mime-Version: 1.0
References: <xr93czs1p4uj.fsf@gthelen2.svl.corp.google.com>
X-Mailer: git-send-email 2.32.0.93.g670b81a890-goog
Subject: [PATCH V2] usb: xhci: avoid renesas_usb_fw.mem when it's unusable
From:   Greg Thelen <gthelen@google.com>
To:     Mathias Nyman <mathias.nyman@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Vinod Koul <vkoul@kernel.org>
Cc:     linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Greg Thelen <gthelen@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Commit a66d21d7dba8 ("usb: xhci: Add support for Renesas controller with
memory") added renesas_usb_fw.mem firmware reference to xhci-pci.  Thus
modinfo indicates xhci-pci.ko has "firmware: renesas_usb_fw.mem".  But
the firmware is only actually used with CONFIG_USB_XHCI_PCI_RENESAS.  An
unusable firmware reference can trigger safety checkers which look for
drivers with unmet firmware dependencies.

Avoid referring to renesas_usb_fw.mem in circumstances when it cannot be
loaded (when CONFIG_USB_XHCI_PCI_RENESAS isn't set).

Fixes: a66d21d7dba8 ("usb: xhci: Add support for Renesas controller with memory")
Signed-off-by: Greg Thelen <gthelen@google.com>
---
Changelog since v1:
- Smaller patch, only filters out MODULE_FIRMWARE()
- Added blank line
- Added Fixes footer to commit log

drivers/usb/host/xhci-pci.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/usb/host/xhci-pci.c b/drivers/usb/host/xhci-pci.c
index 18c2bbddf080..1c9a7957c45c 100644
--- a/drivers/usb/host/xhci-pci.c
+++ b/drivers/usb/host/xhci-pci.c
@@ -636,7 +636,14 @@ static const struct pci_device_id pci_ids[] = {
 	{ /* end: all zeroes */ }
 };
 MODULE_DEVICE_TABLE(pci, pci_ids);
+
+/*
+ * Without CONFIG_USB_XHCI_PCI_RENESAS renesas_xhci_check_request_fw() won't
+ * load firmware, so don't encumber the xhci-pci driver with it.
+ */
+#if IS_ENABLED(CONFIG_USB_XHCI_PCI_RENESAS)
 MODULE_FIRMWARE("renesas_usb_fw.mem");
+#endif
 
 /* pci driver glue; this is a "new style" PCI driver module */
 static struct pci_driver xhci_pci_driver = {
-- 
2.32.0.93.g670b81a890-goog

