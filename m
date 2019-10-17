Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0A76CDAC98
	for <lists+linux-usb@lfdr.de>; Thu, 17 Oct 2019 14:44:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2502525AbfJQMoj (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 17 Oct 2019 08:44:39 -0400
Received: from imap1.codethink.co.uk ([176.9.8.82]:55840 "EHLO
        imap1.codethink.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2502524AbfJQMoj (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 17 Oct 2019 08:44:39 -0400
Received: from [167.98.27.226] (helo=rainbowdash.codethink.co.uk)
        by imap1.codethink.co.uk with esmtpsa (Exim 4.84_2 #1 (Debian))
        id 1iL58o-0006G3-4F; Thu, 17 Oct 2019 13:44:30 +0100
Received: from ben by rainbowdash.codethink.co.uk with local (Exim 4.92.2)
        (envelope-from <ben@rainbowdash.codethink.co.uk>)
        id 1iL58n-0004Rq-R5; Thu, 17 Oct 2019 13:44:29 +0100
From:   "Ben Dooks (Codethink)" <ben.dooks@codethink.co.uk>
To:     linux-kernel@lists.codethink.co.uk
Cc:     "Ben Dooks (Codethink)" <ben.dooks@codethink.co.uk>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Pawel Laszczak <pawell@cadence.com>,
        Felipe Balbi <felipe.balbi@linux.intel.com>,
        linux-usb@vger.kernel.org
Subject: [PATCH] usb: cdns3: include host-export,h for cdns3_host_init
Date:   Thu, 17 Oct 2019 13:44:27 +0100
Message-Id: <20191017124427.17055-1-ben.dooks@codethink.co.uk>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The cdns3_host_init() function is declared in host-export.h
but host.c does not include it. Add the include to have
the declaration present (and remove the declaration of
cdns3_host_exit which is now static).

Fixes the following sparse warning:

drivers/usb/cdns3/host.c:58:5: warning: symbol 'cdns3_host_init' was not declared. Should it be static?

Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
---
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Pawel Laszczak <pawell@cadence.com>
Cc: Felipe Balbi <felipe.balbi@linux.intel.com>
Cc: "Ben Dooks
Cc: linux-usb@vger.kernel.org
---
 drivers/usb/cdns3/host-export.h | 1 -
 drivers/usb/cdns3/host.c        | 1 +
 2 files changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/cdns3/host-export.h b/drivers/usb/cdns3/host-export.h
index b498a170b7e8..ae11810f8826 100644
--- a/drivers/usb/cdns3/host-export.h
+++ b/drivers/usb/cdns3/host-export.h
@@ -12,7 +12,6 @@
 #ifdef CONFIG_USB_CDNS3_HOST
 
 int cdns3_host_init(struct cdns3 *cdns);
-void cdns3_host_exit(struct cdns3 *cdns);
 
 #else
 
diff --git a/drivers/usb/cdns3/host.c b/drivers/usb/cdns3/host.c
index 2733a8f71fcd..ad788bf3fe4f 100644
--- a/drivers/usb/cdns3/host.c
+++ b/drivers/usb/cdns3/host.c
@@ -12,6 +12,7 @@
 #include <linux/platform_device.h>
 #include "core.h"
 #include "drd.h"
+#include "host-export.h"
 
 static int __cdns3_host_init(struct cdns3 *cdns)
 {
-- 
2.23.0

