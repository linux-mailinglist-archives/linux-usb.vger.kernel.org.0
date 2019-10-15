Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AC95CD79CF
	for <lists+linux-usb@lfdr.de>; Tue, 15 Oct 2019 17:30:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733124AbfJOPa1 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 15 Oct 2019 11:30:27 -0400
Received: from imap1.codethink.co.uk ([176.9.8.82]:52249 "EHLO
        imap1.codethink.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732659AbfJOPa1 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 15 Oct 2019 11:30:27 -0400
Received: from [167.98.27.226] (helo=rainbowdash.codethink.co.uk)
        by imap1.codethink.co.uk with esmtpsa (Exim 4.84_2 #1 (Debian))
        id 1iKOmD-0006Qh-OJ; Tue, 15 Oct 2019 16:30:21 +0100
Received: from ben by rainbowdash.codethink.co.uk with local (Exim 4.92.2)
        (envelope-from <ben@rainbowdash.codethink.co.uk>)
        id 1iKOmD-0002pt-2N; Tue, 15 Oct 2019 16:30:21 +0100
From:   "Ben Dooks (Codethink)" <ben.dooks@codethink.co.uk>
To:     linux-kernel@lists.codethink.co.uk
Cc:     "Ben Dooks (Codethink)" <ben.dooks@codethink.co.uk>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] usb: renesas_usbhs: fix type of buf
Date:   Tue, 15 Oct 2019 16:30:17 +0100
Message-Id: <20191015153017.10858-1-ben.dooks@codethink.co.uk>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Fix the type of buf in __usbhsg_recip_send_status to
be __le16 to avoid the following sparse warning:

drivers/usb/renesas_usbhs/mod_gadget.c:335:14: warning: incorrect type in assignment (different base types)
drivers/usb/renesas_usbhs/mod_gadget.c:335:14:    expected unsigned short
drivers/usb/renesas_usbhs/mod_gadget.c:335:14:    got restricted __le16 [usertype]

Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
---
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: linux-usb@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
---
 drivers/usb/renesas_usbhs/mod_gadget.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/renesas_usbhs/mod_gadget.c b/drivers/usb/renesas_usbhs/mod_gadget.c
index e5ef56991dba..0b8a2920de10 100644
--- a/drivers/usb/renesas_usbhs/mod_gadget.c
+++ b/drivers/usb/renesas_usbhs/mod_gadget.c
@@ -315,7 +315,7 @@ static void __usbhsg_recip_send_status(struct usbhsg_gpriv *gpriv,
 	struct usbhs_pipe *pipe = usbhsg_uep_to_pipe(dcp);
 	struct device *dev = usbhsg_gpriv_to_dev(gpriv);
 	struct usb_request *req;
-	unsigned short *buf;
+	__le16 *buf;
 
 	/* alloc new usb_request for recip */
 	req = usb_ep_alloc_request(&dcp->ep, GFP_ATOMIC);
-- 
2.23.0

