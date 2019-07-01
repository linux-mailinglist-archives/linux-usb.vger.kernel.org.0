Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E3FA24C73E
	for <lists+linux-usb@lfdr.de>; Thu, 20 Jun 2019 08:09:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726234AbfFTGJe (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 20 Jun 2019 02:09:34 -0400
Received: from [192.198.146.187] ([192.198.146.187]:54689 "EHLO
        E6440.gar.corp.intel.com" rhost-flags-FAIL-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725953AbfFTGJd (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 20 Jun 2019 02:09:33 -0400
X-Greylist: delayed 641 seconds by postgrey-1.27 at vger.kernel.org; Thu, 20 Jun 2019 02:09:32 EDT
Received: from E6440.gar.corp.intel.com (localhost [127.0.0.1])
        by E6440.gar.corp.intel.com (Postfix) with ESMTP id 1CAEDC1C9B;
        Thu, 20 Jun 2019 13:58:25 +0800 (CST)
From:   Harry Pan <harry.pan@intel.com>
To:     LKML <linux-kernel@vger.kernel.org>
Cc:     gs0622@gmail.com, Harry Pan <harry.pan@intel.com>,
        Kai-Heng Feng <kai.heng.feng@canonical.com>,
        Alan Stern <stern@rowland.harvard.edu>,
        Dennis Wassenberg <dennis.wassenberg@secunet.com>,
        Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
        Bin Liu <b-liu@ti.com>, linux-usb@vger.kernel.org,
        Jon Flatley <jflat@chromium.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Colin Ian King <colin.king@canonical.com>,
        Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH] USB: core: correct a spelling mistake in the comment
Date:   Thu, 20 Jun 2019 13:58:23 +0800
Message-Id: <20190620055823.15735-1-harry.pan@intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Fix a spelling typo in the function comment.

Signed-off-by: Harry Pan <harry.pan@intel.com>

---

 drivers/usb/core/hub.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/core/hub.c b/drivers/usb/core/hub.c
index 8d4631c81b9f..1988f8f88f75 100644
--- a/drivers/usb/core/hub.c
+++ b/drivers/usb/core/hub.c
@@ -2719,7 +2719,7 @@ static bool use_new_scheme(struct usb_device *udev, int retry,
 }
 
 /* Is a USB 3.0 port in the Inactive or Compliance Mode state?
- * Port worm reset is required to recover
+ * Port warm reset is required to recover
  */
 static bool hub_port_warm_reset_required(struct usb_hub *hub, int port1,
 		u16 portstatus)
-- 
2.20.1

