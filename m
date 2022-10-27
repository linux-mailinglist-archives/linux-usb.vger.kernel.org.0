Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9695160ED1B
	for <lists+linux-usb@lfdr.de>; Thu, 27 Oct 2022 02:41:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234122AbiJ0Al1 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 26 Oct 2022 20:41:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38996 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234074AbiJ0AlY (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 26 Oct 2022 20:41:24 -0400
Received: from mail-yw1-x114a.google.com (mail-yw1-x114a.google.com [IPv6:2607:f8b0:4864:20::114a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EB1DD7E019
        for <linux-usb@vger.kernel.org>; Wed, 26 Oct 2022 17:41:22 -0700 (PDT)
Received: by mail-yw1-x114a.google.com with SMTP id 00721157ae682-360a7ff46c3so162589627b3.12
        for <linux-usb@vger.kernel.org>; Wed, 26 Oct 2022 17:41:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:references:mime-version:message-id:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=p0nqHJsa5c2NZf9cWkPRuZHGIcCuYzYIiGgo8niECgY=;
        b=L6g50xPDwU5qrKT9t4j2jcX1wFPSNRjsww6qLigzmWsalQKWYMXkB63Fmq6W70BSQY
         2HVOeJPveyUuic0uYIkQk3Bxgrvk78X9EorcqupfiQu71HilngoaD2HDzY/XHjyfVsx5
         bOJTzlQC9/WINE1FtvTOt+afYW5HZb8OOxIUYsJE0qC0GhgR+MddoA0dovENQBDn8C8M
         PnWgYlb2rQc8jlK+lks+UWsCrpKlLy2LPjap7gBoFqodNzt3p8D422TLCFxRP1WmCgAR
         YtnR4sdL3f01LdTPUYgV2PEPpBOQ/vnAHyp11sGi+1KPYKnlN2sVvSYYK5afHjC1QPUO
         gE7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:references:mime-version:message-id:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=p0nqHJsa5c2NZf9cWkPRuZHGIcCuYzYIiGgo8niECgY=;
        b=SHxdVbEEYGZVkQmmWKzd7MeK5RV4s/oDrT/vYc03IMefiTa5rbIVaaylyqstCUf8v8
         DgK6cc7x7DxJ2xK5iqwudlCDDOyeDV8OsMpJ9P6boCW0MSboJLZgKy5ZFqeVe5YHVBZm
         DXorLRxWUIKm8+NHD9FJRl1J0+lhgXaOKLS3uDfWPRe6T4B9tE71f4553I747O+cN+B0
         bcu5vnsiRIz2s7tYvujPPFjrgvimL0BJOVWc+XIF2khEQsslwxN4KFM5XONceyp5lWdo
         8Sz5bN0YuFnBl2tbh5iE69jFUgU4t0t8yNTaSM/Ga+kYiw+v8pSxPHdycpbYG3vD18Px
         3ULw==
X-Gm-Message-State: ACrzQf0CAQT8sApeZQqIQFjGiR29g8HA7HYfp/7P+5sf50w3p2JWdMiN
        g74mTKTTmvI2eWKKAARLE5g+RePBHM5edUDWMqg=
X-Google-Smtp-Source: AMsMyM7e9lx3WpMkUy/P9HmEU0KEq8RUlpYSokBVnz1mM3GL8TbyCed/mlU0u+APeBV/eudKo+ekchJpmgDbIezCTCU=
X-Received: from albertccwang.ntc.corp.google.com ([2401:fa00:fc:202:57bd:c29a:f9b1:f09c])
 (user=albertccwang job=sendgmr) by 2002:a25:e68c:0:b0:6cb:7596:8bdb with SMTP
 id d134-20020a25e68c000000b006cb75968bdbmr9752524ybh.145.1666831282254; Wed,
 26 Oct 2022 17:41:22 -0700 (PDT)
Date:   Thu, 27 Oct 2022 08:40:49 +0800
In-Reply-To: <20221027004050.4192111-1-albertccwang@google.com>
Message-Id: <20221027004050.4192111-3-albertccwang@google.com>
Mime-Version: 1.0
References: <20221027004050.4192111-1-albertccwang@google.com>
X-Mailer: git-send-email 2.38.0.135.g90850a2211-goog
Subject: [PATCH 2/3] usb: xhci-plat: add xhci_plat_priv_overwrite
From:   Albert Wang <albertccwang@google.com>
To:     mathias.nyman@intel.com, gregkh@linuxfoundation.org
Cc:     badhri@google.com, howardyen@google.com,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@google.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-8.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,HK_RANDOM_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Howard Yen <howardyen@google.com>

Add an overwrite to platform specific callback for setting up the
xhci_offload_ops, allow vendor to store the xhci_offload_ops and
overwrite them when xhci_plat_probe invoked.

Signed-off-by: Howard Yen <howardyen@google.com>
Link: https://lore.kernel.org/r/20210119101044.1637023-1-howardyen@google.com
Signed-off-by: Greg Kroah-Hartman <gregkh@google.com>
---
 drivers/usb/host/xhci-plat.c | 20 ++++++++++++++++++++
 drivers/usb/host/xhci-plat.h |  7 +++++++
 2 files changed, 27 insertions(+)

diff --git a/drivers/usb/host/xhci-plat.c b/drivers/usb/host/xhci-plat.c
index 2f04acb42fa6..11ff89f722b7 100644
--- a/drivers/usb/host/xhci-plat.c
+++ b/drivers/usb/host/xhci-plat.c
@@ -173,9 +173,26 @@ static const struct of_device_id usb_xhci_of_match[] = {
 MODULE_DEVICE_TABLE(of, usb_xhci_of_match);
 #endif
 
+static struct xhci_plat_priv_overwrite xhci_plat_vendor_overwrite;
+
+int xhci_plat_register_offload_ops(struct xhci_offload_ops *offload_ops)
+{
+	if (offload_ops == NULL)
+		return -EINVAL;
+
+	xhci_plat_vendor_overwrite.offload_ops = offload_ops;
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(xhci_plat_register_offload_ops);
+
 static int xhci_vendor_init(struct xhci_hcd *xhci)
 {
 	struct xhci_offload_ops *ops = xhci_offload_get_ops(xhci);
+	struct xhci_plat_priv *priv = xhci_to_priv(xhci);
+
+	if (xhci_plat_vendor_overwrite.offload_ops)
+		ops = priv->offload_ops = xhci_plat_vendor_overwrite.offload_ops;
 
 	if (ops && ops->offload_init)
 		return ops->offload_init(xhci);
@@ -185,9 +202,12 @@ static int xhci_vendor_init(struct xhci_hcd *xhci)
 static void xhci_vendor_cleanup(struct xhci_hcd *xhci)
 {
 	struct xhci_offload_ops *ops = xhci_offload_get_ops(xhci);
+	struct xhci_plat_priv *priv = xhci_to_priv(xhci);
 
 	if (ops && ops->offload_cleanup)
 		ops->offload_cleanup(xhci);
+
+	priv->offload_ops = NULL;
 }
 
 static int xhci_plat_probe(struct platform_device *pdev)
diff --git a/drivers/usb/host/xhci-plat.h b/drivers/usb/host/xhci-plat.h
index 5aa0d38fa01a..0656d6daa194 100644
--- a/drivers/usb/host/xhci-plat.h
+++ b/drivers/usb/host/xhci-plat.h
@@ -22,4 +22,11 @@ struct xhci_plat_priv {
 
 #define hcd_to_xhci_priv(h) ((struct xhci_plat_priv *)hcd_to_xhci(h)->priv)
 #define xhci_to_priv(x) ((struct xhci_plat_priv *)(x)->priv)
+
+struct xhci_plat_priv_overwrite {
+	struct xhci_offload_ops *offload_ops;
+};
+
+int xhci_plat_register_offload_ops(struct xhci_offload_ops *offload_ops);
+
 #endif	/* _XHCI_PLAT_H */
-- 
2.38.0.135.g90850a2211-goog

