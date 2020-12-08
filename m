Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4D6BE2D2FB8
	for <lists+linux-usb@lfdr.de>; Tue,  8 Dec 2020 17:32:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729374AbgLHQbX (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 8 Dec 2020 11:31:23 -0500
Received: from netrider.rowland.org ([192.131.102.5]:56187 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1728602AbgLHQbX (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 8 Dec 2020 11:31:23 -0500
Received: (qmail 1301383 invoked by uid 1000); 8 Dec 2020 11:30:42 -0500
Date:   Tue, 8 Dec 2020 11:30:42 -0500
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Greg KH <greg@kroah.com>
Cc:     andreyknvl@google.com, legousb-devel@lists.sourceforge.net,
        linux-usb@vger.kernel.org, starblue@users.sourceforge.net,
        syzkaller-bugs@googlegroups.com
Subject: [PATCH] USB: legotower: fix logical error in recent commit
Message-ID: <20201208163042.GD1298255@rowland.harvard.edu>
References: <20201208160703.GB1298255@rowland.harvard.edu>
 <000000000000f0fb0d05b5f65e64@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <000000000000f0fb0d05b5f65e64@google.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Commit d9f0d82f06c6 ("USB: legousbtower: use usb_control_msg_recv()")
contained an elementary logical error.  The check of the return code
from the new usb_control_msg_recv() function was inverted.

Reported-and-tested-by: syzbot+9be25235b7a69b24d117@syzkaller.appspotmail.com
Signed-off-by: Alan Stern <stern@rowland.harvard.edu>

---


[as1950]


 drivers/usb/misc/legousbtower.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

Index: usb-devel/drivers/usb/misc/legousbtower.c
===================================================================
--- usb-devel.orig/drivers/usb/misc/legousbtower.c
+++ usb-devel/drivers/usb/misc/legousbtower.c
@@ -797,7 +797,7 @@ static int tower_probe(struct usb_interf
 				      &get_version_reply,
 				      sizeof(get_version_reply),
 				      1000, GFP_KERNEL);
-	if (!result) {
+	if (result) {
 		dev_err(idev, "get version request failed: %d\n", result);
 		retval = result;
 		goto error;
