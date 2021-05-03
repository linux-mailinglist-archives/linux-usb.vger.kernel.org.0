Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F17EE371FE5
	for <lists+linux-usb@lfdr.de>; Mon,  3 May 2021 20:48:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229595AbhECStw (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 3 May 2021 14:49:52 -0400
Received: from tika.stderr.nl ([94.142.244.14]:36118 "EHLO tika.stderr.nl"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229520AbhECStv (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 3 May 2021 14:49:51 -0400
X-Greylist: delayed 2550 seconds by postgrey-1.27 at vger.kernel.org; Mon, 03 May 2021 14:49:51 EDT
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=mail.tikatika.nl; s=201709.tika; h=Content-Transfer-Encoding:MIME-Version:
        Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=HOIsjMTeBHgCkQN1c1ZbVf0eCr7InkIweP2NmdOnPP0=; b=EYOD7trv+LF0bsvDfN/TAIvaap
        pAAcj9+zT2/EWU+wshRYYLJ7Shsd+uoRYj9Zg4pMZttoDXRjqb4Se4tnAuhT8eaRfHtVaMkDkv0li
        xZSGOU59/qrollXaL3aTq9xGt6sQ5FR6DWVEqZLzMoZpsiEH06TIAL3s7lgPMX99KCJw=;
X-Preliminary-Spam-Score: -2.9 (--)
Received: from 217-19-19-88.dsl.cambrium.nl ([217.19.19.88] helo=grubby.lan)
        by tika.stderr.nl with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <matthijs@stdin.nl>)
        id 1ldcxP-0002qL-JA; Mon, 03 May 2021 20:06:19 +0200
Received: from matthijs by grubby.lan with local (Exim 4.93)
        (envelope-from <matthijs@stdin.nl>)
        id 1ldcxI-000GmK-T4; Mon, 03 May 2021 20:06:04 +0200
From:   Matthijs Kooijman <matthijs@stdin.nl>
To:     linux-usb@vger.kernel.org
Cc:     Minas Harutyunyan <hminas@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Matthijs Kooijman <matthijs@stdin.nl>
Subject: [PATCH] usb: dwc2: Remove obsolete MODULE_ constants from platform.c
Date:   Mon,  3 May 2021 20:05:38 +0200
Message-Id: <20210503180538.64423-1-matthijs@stdin.nl>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Originally, the core and platform drivers were separate modules, so each
had its own module info. Since commit 2d1165a4b95e (usb: dwc2: remove
dwc2_platform.ko) platform.c is included in the core module, which now
contains duplicate module info (from core.c and platform.c).

Due to the linking order and modinfo implementation, running `modinfo`
on the resulting dwc2.ko shows just the info from platform.c, rather
than that from core.c, suggesting that I am the author of the entire
dwc2 module. Since platform.c is just a minor part of the entire module,
this removes its module info in favor of the info from core.c.

Signed-off-by: Matthijs Kooijman <matthijs@stdin.nl>
---
 drivers/usb/dwc2/platform.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/usb/dwc2/platform.c b/drivers/usb/dwc2/platform.c
index 5f18acac7406..e1e1e32e0008 100644
--- a/drivers/usb/dwc2/platform.c
+++ b/drivers/usb/dwc2/platform.c
@@ -742,7 +742,3 @@ static struct platform_driver dwc2_platform_driver = {
 };
 
 module_platform_driver(dwc2_platform_driver);
-
-MODULE_DESCRIPTION("DESIGNWARE HS OTG Platform Glue");
-MODULE_AUTHOR("Matthijs Kooijman <matthijs@stdin.nl>");
-MODULE_LICENSE("Dual BSD/GPL");
-- 
2.25.1

