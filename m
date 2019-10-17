Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 308B9DB342
	for <lists+linux-usb@lfdr.de>; Thu, 17 Oct 2019 19:27:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2403956AbfJQR1Y (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 17 Oct 2019 13:27:24 -0400
Received: from imap1.codethink.co.uk ([176.9.8.82]:37068 "EHLO
        imap1.codethink.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728639AbfJQR1Y (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 17 Oct 2019 13:27:24 -0400
Received: from [167.98.27.226] (helo=rainbowdash.codethink.co.uk)
        by imap1.codethink.co.uk with esmtpsa (Exim 4.84_2 #1 (Debian))
        id 1iL9YU-0005iY-Ei; Thu, 17 Oct 2019 18:27:18 +0100
Received: from ben by rainbowdash.codethink.co.uk with local (Exim 4.92.2)
        (envelope-from <ben@rainbowdash.codethink.co.uk>)
        id 1iL9YU-0008BR-0s; Thu, 17 Oct 2019 18:27:18 +0100
From:   "Ben Dooks (Codethink)" <ben.dooks@codethink.co.uk>
To:     linux-kernel@lists.codethink.co.uk
Cc:     "Ben Dooks (Codethink)" <ben.dooks@codethink.co.uk>,
        Chunfeng Yun <chunfeng.yun@mediatek.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org
Subject: [PATCH] usb: mtu3: fix missing include of mtu3_dr.h
Date:   Thu, 17 Oct 2019 18:27:17 +0100
Message-Id: <20191017172717.31409-1-ben.dooks@codethink.co.uk>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The declarations of ssusb_gadget_{init,exit} are
in the mtu3_dr.h file but the code does that implements
them does not include this. Add the include to fix the
following sparse warnigns:

drivers/usb/mtu3/mtu3_core.c:825:5: warning: symbol 'ssusb_gadget_init' was not declared. Should it be static?
drivers/usb/mtu3/mtu3_core.c:925:6: warning: symbol 'ssusb_gadget_exit' was not declared. Should it be static?

Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
---
Cc: Chunfeng Yun <chunfeng.yun@mediatek.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-mediatek@lists.infradead.org
---
 drivers/usb/mtu3/mtu3_core.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/usb/mtu3/mtu3_core.c b/drivers/usb/mtu3/mtu3_core.c
index c3d5c1206eec..9dd02160cca9 100644
--- a/drivers/usb/mtu3/mtu3_core.c
+++ b/drivers/usb/mtu3/mtu3_core.c
@@ -16,6 +16,7 @@
 #include <linux/platform_device.h>
 
 #include "mtu3.h"
+#include "mtu3_dr.h"
 #include "mtu3_debug.h"
 #include "mtu3_trace.h"
 
-- 
2.23.0

