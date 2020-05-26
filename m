Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CD2141BF63B
	for <lists+linux-usb@lfdr.de>; Thu, 30 Apr 2020 13:14:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726951AbgD3LNY (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 30 Apr 2020 07:13:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58252 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726309AbgD3LNX (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 30 Apr 2020 07:13:23 -0400
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4D00AC035494;
        Thu, 30 Apr 2020 04:13:23 -0700 (PDT)
Received: by mail-wr1-x443.google.com with SMTP id f13so6336110wrm.13;
        Thu, 30 Apr 2020 04:13:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=vkQbZ0OEnEU7UUbpzBp0+WjmUbWo04Z45g1QFzRKmTk=;
        b=HvheZXHcAizX3JxlOfjwHuKgg7LKT2EQsWc2Ig/AjK2y/OvWm/ixHaCS+PesA8BOtt
         PTDn7Ts0TDC5J/Rolru5jC+PuGJiFQJicdk2GjJaXWav38GS0CX1heCbsVSCvLx2cYSF
         fnxikEP/6ExRE+d55j1ZVeFxopMSfLpoVKHK2aFJ4WXdjUPErhfnYyf6HGqlCrzdbfsl
         yaXUCD5c6bzptx31MhjgXzG8syTmThGJablUruh14oQkcT/zIksOLvsFg4fOXPnB0raq
         IwUIA6SDIuFQYpzXVuzPGts6m0rzud+2g01KtGihb3OkXDxuI5Na+D1B+iQCfm64gs1W
         4fuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=vkQbZ0OEnEU7UUbpzBp0+WjmUbWo04Z45g1QFzRKmTk=;
        b=F1rnwTfOBBlMWcdqGOu05A9Alwq8hnkPITnU8N3NKH5XHK4fKTmHmIhJp8yVIEtwe/
         dOYguxzWdQq52x2nka4NU819pkztUwu4kNvHwd20RTMCgQgmXF3Og82JjgB0GdSQn8E2
         dSA00MEiHG/RnSsnhAocXIUqvKSzQotlfRwtIirFmpNkDhLuU3MrgNtnz3+nPVgwSqrp
         Je4tl6Gaslh7d030mgB4+jysYfsuWIsHqESkxKjgEfFQY/LH7YCDZ5IGODQwNwL/Wm1R
         Lcmt7OYlSfo6XmWEOdU5gnEHXK97xnkcTADbzDXuIWK9rKX0wuYASHRltdwnBKAKRGzr
         hFhA==
X-Gm-Message-State: AGi0Pua+H3weD3HD2jIPeFL7uptyfJWdcnq3m1d9BtOkTMuqavHPyVg1
        lWFLZdn4HFVIUbk+91FRyqxnak+J/0U=
X-Google-Smtp-Source: APiQypJwlaARr5WlOrdAdalm1MiBJKod38IAG2x5fmsHVGwDEhBVxjnVF9KrpRgCKecDpFjOwYAw4g==
X-Received: by 2002:adf:f187:: with SMTP id h7mr3324837wro.331.1588245201775;
        Thu, 30 Apr 2020 04:13:21 -0700 (PDT)
Received: from stbsrv-and-01.and.broadcom.net ([192.19.231.250])
        by smtp.gmail.com with ESMTPSA id 74sm3727077wrk.30.2020.04.30.04.13.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2020 04:13:21 -0700 (PDT)
From:   Al Cooper <alcooperx@gmail.com>
To:     linux-kernel@vger.kernel.org
Cc:     Al Cooper <alcooperx@gmail.com>,
        Alan Stern <stern@rowland.harvard.edu>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        bcm-kernel-feedback-list@broadcom.com, devicetree@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        linux-usb@vger.kernel.org, Mathias Nyman <mathias.nyman@intel.com>,
        Rob Herring <robh+dt@kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v6 2/4] usb: xhci: xhci-plat: Add support for Broadcom STB SoC's
Date:   Thu, 30 Apr 2020 07:12:56 -0400
Message-Id: <20200430111258.6091-3-alcooperx@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200430111258.6091-1-alcooperx@gmail.com>
References: <20200430111258.6091-1-alcooperx@gmail.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Add support for Broadcom STB SoC's to the xhci platform driver

Signed-off-by: Al Cooper <alcooperx@gmail.com>
Acked-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci-plat.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/usb/host/xhci-plat.c b/drivers/usb/host/xhci-plat.c
index 1d4f6f85f0fe..44406d0eb317 100644
--- a/drivers/usb/host/xhci-plat.c
+++ b/drivers/usb/host/xhci-plat.c
@@ -112,6 +112,10 @@ static const struct xhci_plat_priv xhci_plat_renesas_rcar_gen3 = {
 	SET_XHCI_PLAT_PRIV_FOR_RCAR(XHCI_RCAR_FIRMWARE_NAME_V3)
 };
 
+static const struct xhci_plat_priv xhci_plat_brcm = {
+	.quirks = XHCI_RESET_ON_RESUME,
+};
+
 static const struct of_device_id usb_xhci_of_match[] = {
 	{
 		.compatible = "generic-xhci",
@@ -147,6 +151,12 @@ static const struct of_device_id usb_xhci_of_match[] = {
 	}, {
 		.compatible = "renesas,rcar-gen3-xhci",
 		.data = &xhci_plat_renesas_rcar_gen3,
+	}, {
+		.compatible = "brcm,xhci-brcm-v2",
+		.data = &xhci_plat_brcm,
+	}, {
+		.compatible = "brcm,bcm7445-xhci",
+		.data = &xhci_plat_brcm,
 	},
 	{},
 };
-- 
2.17.1

