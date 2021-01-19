Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 587E62FB84B
	for <lists+linux-usb@lfdr.de>; Tue, 19 Jan 2021 15:30:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392197AbhASMQo (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 19 Jan 2021 07:16:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53994 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389738AbhASKPe (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 19 Jan 2021 05:15:34 -0500
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com [IPv6:2607:f8b0:4864:20::b49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D0D96C0613ED
        for <linux-usb@vger.kernel.org>; Tue, 19 Jan 2021 02:12:27 -0800 (PST)
Received: by mail-yb1-xb49.google.com with SMTP id s7so19809721ybj.0
        for <linux-usb@vger.kernel.org>; Tue, 19 Jan 2021 02:12:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=sender:date:in-reply-to:message-id:mime-version:references:subject
         :from:to:cc;
        bh=pGshkdllAmKtNcf+vD4gEuZmFdpUuE7wrXzrPvtHY6U=;
        b=aBbV9BLrnSNnW8vIGkex+VzAlyluZdM1gnAE81BpnN1hCkywVz/dEq4EHoDarAAHt0
         X9U8mMzbWj3Xwz8m2qQ/ozDwjsNbRV+QaHzswQYFXD8QH9x0zeRoOH4EGk1CGjWQs3jD
         V8CsWEtoCPB58qIfVBMyvO9wR1xiiqKgWtqz9PmzgJwCTbQfwmFQ2ApdVrMW55/6qITm
         V1m/PMLSjiKOtNUqwuriruAuAXKF7M8KOWfNIABsx1xPPTOSXsMKBPkArvb9NXVlfm3K
         zLydVvWS8iOT/cGeSBXCkzwLjNpeXY/710agMz1kxP5IAF2V+Q5yLKWLVbOV5pblwA1a
         d54g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=pGshkdllAmKtNcf+vD4gEuZmFdpUuE7wrXzrPvtHY6U=;
        b=SH1a3jQUw+26tWxbNFv7XuwKvOShwB1a0ALYncrQIgRsW6t8llJAXa3KMEoin1Lv7H
         NtjyYNCcMJq3+Y8slcAeXL/h0snlCA3WulpVoEm2ffoR2N2bGMDUThRAKtNv1KBCvXiz
         OfAQmbHLZche2KXvGMseP+tlAf2IgcbNArZcxzZTg5iElqIabCW0XrXtSWdupLIte7fN
         PeYUuR/AJhQ4dkUlaXaloVzqOzViD2WY839a/BlvbPLCR0/DWzAzzjuq0izWIOtj1vPU
         Ol93JrMW2BQP1+bzwyJFRsilNBkBf+LCz2XKbrcrD9ggsP7QwV+JUEAYObef5Fs9JvxR
         AMyw==
X-Gm-Message-State: AOAM533pjqhDi3Qju3xiaCujWWAiOS4lA5DFtccDDabP5RTIe52MQNeh
        zy4FsdODwHfJTpURJhRHp6QOg4W+MlHgQfY=
X-Google-Smtp-Source: ABdhPJzKYU2xntqX/Jwro+f0uDstVG47y9IPd/tRbPXo+heIpzlduI9IDXetOxxlzGvYbdrFWIcrkWbEDQt5fAY=
Sender: "howardyen via sendgmr" <howardyen@howardyen.ntc.corp.google.com>
X-Received: from howardyen.ntc.corp.google.com ([2401:fa00:fc:202:5d06:ba6f:6a89:a201])
 (user=howardyen job=sendgmr) by 2002:a25:5404:: with SMTP id
 i4mr5226459ybb.519.1611051147046; Tue, 19 Jan 2021 02:12:27 -0800 (PST)
Date:   Tue, 19 Jan 2021 18:10:43 +0800
In-Reply-To: <20210119101044.1637023-1-howardyen@google.com>
Message-Id: <20210119101044.1637023-4-howardyen@google.com>
Mime-Version: 1.0
References: <20210119101044.1637023-1-howardyen@google.com>
X-Mailer: git-send-email 2.30.0.284.gd98b1dd5eaa7-goog
Subject: [PATCH 3/4] usb: xhci-plat: add xhci_plat_priv_overwrite
From:   Howard Yen <howardyen@google.com>
To:     gregkh@linuxfoundation.org, robh+dt@kernel.org,
        mathias.nyman@intel.com
Cc:     linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Howard Yen <howardyen@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Add an overwrite to platform specific callback for setting up the
xhci_vendor_ops, allow vendor to store the xhci_vendor_ops and
overwrite them when xhci_plat_probe invoked.

This change is depend on Commit in this patch series
("usb: host: add xhci hooks for USB offload"), vendor needs
to invoke xhci_plat_register_vendor_ops() to register the vendor specific
vendor_ops. And the vendor_ops will overwrite the vendor_ops inside
xhci_plat_priv in xhci_vendor_init() during xhci-plat-hcd probe.

Signed-off-by: Howard Yen <howardyen@google.com>
---
 drivers/usb/host/xhci-plat.c | 20 ++++++++++++++++++++
 drivers/usb/host/xhci-plat.h |  7 +++++++
 2 files changed, 27 insertions(+)

diff --git a/drivers/usb/host/xhci-plat.c b/drivers/usb/host/xhci-plat.c
index 5f8e69089654..a8e217494831 100644
--- a/drivers/usb/host/xhci-plat.c
+++ b/drivers/usb/host/xhci-plat.c
@@ -163,9 +163,26 @@ static const struct of_device_id usb_xhci_of_match[] = {
 MODULE_DEVICE_TABLE(of, usb_xhci_of_match);
 #endif
 
+static struct xhci_plat_priv_overwrite xhci_plat_vendor_overwrite;
+
+int xhci_plat_register_vendor_ops(struct xhci_vendor_ops *vendor_ops)
+{
+	if (vendor_ops == NULL)
+		return -EINVAL;
+
+	xhci_plat_vendor_overwrite.vendor_ops = vendor_ops;
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(xhci_plat_register_vendor_ops);
+
 static int xhci_vendor_init(struct xhci_hcd *xhci)
 {
 	struct xhci_vendor_ops *ops = xhci_vendor_get_ops(xhci);
+	struct xhci_plat_priv *priv = xhci_to_priv(xhci);
+
+	if (xhci_plat_vendor_overwrite.vendor_ops)
+		ops = priv->vendor_ops = xhci_plat_vendor_overwrite.vendor_ops;
 
 	if (ops && ops->vendor_init)
 		return ops->vendor_init(xhci);
@@ -175,9 +192,12 @@ static int xhci_vendor_init(struct xhci_hcd *xhci)
 static void xhci_vendor_cleanup(struct xhci_hcd *xhci)
 {
 	struct xhci_vendor_ops *ops = xhci_vendor_get_ops(xhci);
+	struct xhci_plat_priv *priv = xhci_to_priv(xhci);
 
 	if (ops && ops->vendor_cleanup)
 		ops->vendor_cleanup(xhci);
+
+	priv->vendor_ops = NULL;
 }
 
 static int xhci_plat_probe(struct platform_device *pdev)
diff --git a/drivers/usb/host/xhci-plat.h b/drivers/usb/host/xhci-plat.h
index 2b2d090c4c01..d85802725208 100644
--- a/drivers/usb/host/xhci-plat.h
+++ b/drivers/usb/host/xhci-plat.h
@@ -22,4 +22,11 @@ struct xhci_plat_priv {
 
 #define hcd_to_xhci_priv(h) ((struct xhci_plat_priv *)hcd_to_xhci(h)->priv)
 #define xhci_to_priv(x) ((struct xhci_plat_priv *)(x)->priv)
+
+struct xhci_plat_priv_overwrite {
+	struct xhci_vendor_ops *vendor_ops;
+};
+
+int xhci_plat_register_vendor_ops(struct xhci_vendor_ops *vendor_ops);
+
 #endif	/* _XHCI_PLAT_H */
-- 
2.30.0.284.gd98b1dd5eaa7-goog

