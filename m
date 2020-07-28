Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 58E3D2312BE
	for <lists+linux-usb@lfdr.de>; Tue, 28 Jul 2020 21:32:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729695AbgG1Tcr (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 28 Jul 2020 15:32:47 -0400
Received: from netrider.rowland.org ([192.131.102.5]:34383 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1729646AbgG1Tcr (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 28 Jul 2020 15:32:47 -0400
Received: (qmail 1511031 invoked by uid 1000); 28 Jul 2020 15:32:46 -0400
Date:   Tue, 28 Jul 2020 15:32:46 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Roger Quadros <rogerq@ti.com>
Cc:     USB mailing list <linux-usb@vger.kernel.org>
Subject: Adding and removing the same gadget multiple times
Message-ID: <20200728193246.GD1507946@rowland.harvard.edu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Roger:

Your commit fac323471df6 ("usb: udc: allow adding and removing the same 
gadget device") from a few years ago just caught my eye.  (I don't 
recall whether I noticed it at the time.)

In any case, we need to talk about it.  What you're doing -- 
unregistering and re-registering the struct device embedded in the 
gadget structure -- is strictly forbidden by the kernel's device model. 
It's even mentioned specifically in the kerneldoc for device_add().

Now, I guess doing this would be okay _if_ you took care not to 
re-register the device until all references to the previous incarnation 
have been dropped.  In particular, setting the structure's memory to 0 
should not be done immediately after calling device_unregister() -- 
which is what the commit does -- but rather in the release routine.

Do you know which UDC drivers actually do re-register their gadgets?  In 
particular, do they have their own release routines or do they rely on 
the default usb_udc_nop_release() provided by the UDC core?  Moving the 
memset into that routine ought to be okay; leaving it where it is would 
be a time bomb waiting to go off.  I'm suprised it hasn't caused 
problems already.

Furthermore, drivers that do re-register their gadgets should wait until 
gadget->dev.release is NULL, indicating that the release routine has 
been called and the memory has been wiped.  If they re-register before 
that, the re-registration will fail for the same reasons you observed 
when you wrote the commit.

Of course, a cleaner alternative would be to allocate the gadget 
structure dynamically.  Then instead of re-registering the old one, the 
driver could allocate a new one and register it instead, with no 
concerns about reuse.

Alan Stern
