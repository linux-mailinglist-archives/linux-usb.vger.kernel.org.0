Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9406C334258
	for <lists+linux-usb@lfdr.de>; Wed, 10 Mar 2021 17:02:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229790AbhCJQBr (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 10 Mar 2021 11:01:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51718 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229851AbhCJQB2 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 10 Mar 2021 11:01:28 -0500
Received: from mail-ot1-x334.google.com (mail-ot1-x334.google.com [IPv6:2607:f8b0:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 27542C061760
        for <linux-usb@vger.kernel.org>; Wed, 10 Mar 2021 08:01:28 -0800 (PST)
Received: by mail-ot1-x334.google.com with SMTP id j8so16875415otc.0
        for <linux-usb@vger.kernel.org>; Wed, 10 Mar 2021 08:01:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=71Szmz88lWkywP/rY1VQkY3dGVzVAAC4awFIIbB0qVU=;
        b=DBMZmzT8UUJ4RgXCy/finQ46AwfEskP1MX+gjjw936NOKTsK4pp6mdHezya/F/MLqY
         RkjToRBf1/mOa0RYdpYKsZ5T6nE2DWfmq1nfYXDv1vfRV3WRuue3vdBXkMY8IJhMvwa5
         e2X5sGNumxHIPxjiowzMhqbaXUFbuyuSH+SSLpZ1MjujarAod6t7nH2osbx2BRo/7oWr
         KOLxl9oycJcsava3CM5D+tMhXSqoRAuHdnioK7+zUZ1tyELPxThrIxZuJ39D/fvRKKMa
         Yc2XHCQgTLdabjmWE2hMzKRyvIaTA3nEv5igpinhc2OPM1YklCPlQAk7cmH8ux5juQPr
         f4Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=71Szmz88lWkywP/rY1VQkY3dGVzVAAC4awFIIbB0qVU=;
        b=H2J0DKM5RJeK3yA706HK9bDhU8WTW3cs8nE+FticAdo/zOein0CUBgt7Yfr91MH7rt
         zixJg3aLMK4CrBSU+r3ILiYFmkVxdRn/MhKT7/ZcgCCkAjeok3lbGDBEDluTSYeIFOKv
         2Yoczjp4VdHY2fHpcuZhVtg2XUmx7ODTFHsWRaXIzq2Rvqsr5RegezLQcxne9p+cmYR/
         Pp7diUeVrxmINwilL1bUxrUO70XQn+2aLVuOY2Fa/+z7rzwqJXe8XWcnbiTV33PFxE/+
         CHXNyBlr8YlkopfEcpK0Z8iVqRRKjmkia6pbfpcrDsetSyzAfh+TpLRwWHDmkp7YCYou
         tVWQ==
X-Gm-Message-State: AOAM531jnH7Jog23TCXvNzUC/Xge3ReMLJf6xGacDyKRm9jHL/1z/ZCK
        pIvM03/QkoEukOooj6DCIqw=
X-Google-Smtp-Source: ABdhPJyyavsJ//LpaGkss3IbKK1FWHD8GXkkwHAc6PNsZroUvFSescEi7YXPF9FufJ8Jx+eFZg1irA==
X-Received: by 2002:a9d:6a9:: with SMTP id 38mr3109447otx.365.1615392087111;
        Wed, 10 Mar 2021 08:01:27 -0800 (PST)
Received: from ruiqi-desktop.lan (072-177-087-193.res.spectrum.com. [72.177.87.193])
        by smtp.gmail.com with ESMTPSA id y11sm3614811oov.9.2021.03.10.08.01.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Mar 2021 08:01:26 -0800 (PST)
From:   Frank Li <lznuaa@gmail.com>
X-Google-Original-From: Frank Li <Frank.Li@nxp.com>
To:     peter.chen@kernel.org, pawell@cadence.com, a-govindraju@ti.com,
        linux-imx@nxp.com, linux-usb@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, lznuaa@gmail.com,
        dan.carpenter@oracle.com
Subject: [PATCH 1/1] usb: cdns3: fix static checker warning.
Date:   Wed, 10 Mar 2021 10:01:25 -0600
Message-Id: <20210310160125.810157-1-Frank.Li@nxp.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The patch c450e48eb570: "usb: cdns3: add power lost support for
system resume" from Feb 18, 2021, leads to the following static
checker warning:

        drivers/usb/cdns3/core.c:551 cdns_resume()
        error: uninitialized symbol 'ret'.

drivers/usb/cdns3/core.c
544
545     if (!role_changed) {
546            if (cdns->role == USB_ROLE_HOST)
547                  ret = cdns_drd_host_on(cdns);
548     else if (cdns->role == USB_ROLE_DEVICE)
549            ret = cdns_drd_gadget_on(cdns);

"ret" is uninitialized at else branch.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 drivers/usb/cdns3/core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/cdns3/core.c b/drivers/usb/cdns3/core.c
index 5d486c8a9d99..bb739d88179f 100644
--- a/drivers/usb/cdns3/core.c
+++ b/drivers/usb/cdns3/core.c
@@ -527,7 +527,7 @@ int cdns_resume(struct cdns *cdns, u8 set_active)
 	struct device *dev = cdns->dev;
 	enum usb_role real_role;
 	bool role_changed = false;
-	int ret;
+	int ret = 0;
 
 	if (cdns_power_is_lost(cdns)) {
 		if (cdns->role_sw) {
-- 
2.25.1

