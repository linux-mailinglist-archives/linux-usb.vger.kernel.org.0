Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E71E338D2F6
	for <lists+linux-usb@lfdr.de>; Sat, 22 May 2021 04:16:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230477AbhEVCRs (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 21 May 2021 22:17:48 -0400
Received: from netrider.rowland.org ([192.131.102.5]:59481 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S230473AbhEVCRs (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 21 May 2021 22:17:48 -0400
Received: (qmail 1260972 invoked by uid 1000); 21 May 2021 22:16:23 -0400
Date:   Fri, 21 May 2021 22:16:23 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Greg KH <greg@kroah.com>
Cc:     Johan Hovold <johan@kernel.org>, "Geoffrey D. Bennett" <g@b4.vu>,
        USB mailing list <linux-usb@vger.kernel.org>
Subject: [PATCH v2] USB: core: WARN if pipe direction != setup packet
 direction
Message-ID: <20210522021623.GB1260282@rowland.harvard.edu>
References: <20210520202056.GB1216852@rowland.harvard.edu>
 <YKdpThmE1xenUjhI@hovoldconsulting.com>
 <YKey+pWP8iKkCV1Q@hovoldconsulting.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YKey+pWP8iKkCV1Q@hovoldconsulting.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

When a control URB is submitted, the direction indicated by URB's pipe
member is supposed to match the direction indicated by the setup
packet's bRequestType member.  A mismatch could lead to trouble,
depending on which field the host controller drivers use for
determining the actual direction.

This shouldn't ever happen; it would represent a careless bug in a
kernel driver somewhere.  This patch adds a dev_WARN_ONCE to let
people know about the potential problem.

Suggested-by: "Geoffrey D. Bennett" <g@b4.vu>
Signed-off-by: Alan Stern <stern@rowland.harvard.edu>

---

v2: Use dev_WARN_ONCE instead of dev_WARN


[as1960b]


 drivers/usb/core/urb.c |    3 +++
 1 file changed, 3 insertions(+)

Index: usb-devel/drivers/usb/core/urb.c
===================================================================
--- usb-devel.orig/drivers/usb/core/urb.c
+++ usb-devel/drivers/usb/core/urb.c
@@ -407,6 +407,9 @@ int usb_submit_urb(struct urb *urb, gfp_
 			return -ENOEXEC;
 		is_out = !(setup->bRequestType & USB_DIR_IN) ||
 				!setup->wLength;
+		dev_WARN_ONCE(&dev->dev, (usb_pipeout(urb->pipe) != is_out),
+				"BOGUS control dir, pipe %x doesn't match bRequestType %x\n",
+				urb->pipe, setup->bRequestType);
 	} else {
 		is_out = usb_endpoint_dir_out(&ep->desc);
 	}
