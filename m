Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EA400623D03
	for <lists+linux-usb@lfdr.de>; Thu, 10 Nov 2022 09:01:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232900AbiKJIBD (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 10 Nov 2022 03:01:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34106 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232874AbiKJIBA (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 10 Nov 2022 03:01:00 -0500
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com [IPv6:2607:f8b0:4864:20::b4a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 027452495F
        for <linux-usb@vger.kernel.org>; Thu, 10 Nov 2022 00:01:00 -0800 (PST)
Received: by mail-yb1-xb4a.google.com with SMTP id y65-20020a25c844000000b006bb773548d5so1160915ybf.5
        for <linux-usb@vger.kernel.org>; Thu, 10 Nov 2022 00:00:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:references:mime-version:message-id:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=O8vK2CTFtLD5YGZvxAtHHt4MBxX8fsqvLDieKgi2UpY=;
        b=HaF/H/3MkcFULhHBzOSB9PUz3Skp+KtwKWMvJkFA25o4ce0byRTJRnB1Pftp0lH62r
         9A4GwUXfbkSXOn6ueebI8CtEhwk9spUrrxU5UJ1ZuRVgvd0CfdUhd8cP7vG3f3WCtYdq
         vxDnon+DaljAFnAfHzb+ISco8ApoRXACL/qfXvS/MotOfYrhhiKyn7SC5vTRUrBY+04w
         bspiXPgGN5190d3+v6SP6zrc2UOdEwict7cVQO3vD4uBtphtjXoK6Ymm/YDPujpJtKY/
         zk7k2etjtzYtKvlzfR38vTKUgyy3FaBlKyXuqu+8EtEdO71LM7cm0wwz8INlx9w0cxjl
         oGxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:references:mime-version:message-id:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=O8vK2CTFtLD5YGZvxAtHHt4MBxX8fsqvLDieKgi2UpY=;
        b=u2CVCAku4UgKwGbHHbJqsGMztK93fpQdsvXfeFX4C72aOPxkpitIDFoItHFrpe3ENc
         bHx0KWYL7sB01m4x/R53o9vGYpg6UTA+lUixu0DtK25/wAPoY5UthUXWOdsx1hmAb8gU
         UF/iDrv8BFChQJFpFzQLhRTwxQrdNxKf0xsx6hwvSiz5KeL0eOKmSRQZdI8XmGtqgIbH
         RtMPFz0ylhmk3DPYUgdgc3q6a/QWUTivEYjl4TEkpkclrrNkbtFp5lTRX5b1D7TwQq8T
         J92lev0ZkvVSBJV3DFVFM2hGjgsoHJLp1Qat3+tjV3gOo5WU9EBCjfYDvvL8iCSX+0bb
         zoyA==
X-Gm-Message-State: ACrzQf1lZikKCP5/hccIIACxWZ8yOEPKqcMFB41skdmtDypeY+bZkQPq
        WodzWEPY9Y0yjrZBrgzW61N22yaGB6bP0bn6JS8=
X-Google-Smtp-Source: AMsMyM7Kl/6ds+ZaZdLDIKG04z2Za8eDR7Zgxfd3VWiKDhi+1gejDYi9rlhnaZzvtSq4SWaAa+EpbXSDkq15EM7yscQ=
X-Received: from albertccwang.ntc.corp.google.com ([2401:fa00:fc:202:2c6f:5c28:5579:9e27])
 (user=albertccwang job=sendgmr) by 2002:a81:9c51:0:b0:373:448b:6aea with SMTP
 id n17-20020a819c51000000b00373448b6aeamr44918198ywa.265.1668067259237; Thu,
 10 Nov 2022 00:00:59 -0800 (PST)
Date:   Thu, 10 Nov 2022 16:00:05 +0800
In-Reply-To: <20221110080006.3563429-1-albertccwang@google.com>
Message-Id: <20221110080006.3563429-3-albertccwang@google.com>
Mime-Version: 1.0
References: <20221110080006.3563429-1-albertccwang@google.com>
X-Mailer: git-send-email 2.38.1.431.g37b22c650d-goog
Subject: [PATCH v2 2/3] usb: xhci-plat: add xhci_plat_priv_overwrite
From:   Albert Wang <albertccwang@google.com>
To:     mathias.nyman@intel.com, gregkh@linuxfoundation.org
Cc:     badhri@google.com, howardyen@google.com,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
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
---
Changes in v2:
- Use 'offload_ops' instead of 'vendor_ops'

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
2.38.1.431.g37b22c650d-goog

