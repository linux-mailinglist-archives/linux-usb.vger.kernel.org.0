Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EBB339265A
	for <lists+linux-usb@lfdr.de>; Mon, 19 Aug 2019 16:17:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726728AbfHSORg (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 19 Aug 2019 10:17:36 -0400
Received: from iolanthe.rowland.org ([192.131.102.54]:43284 "HELO
        iolanthe.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1726636AbfHSORf (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 19 Aug 2019 10:17:35 -0400
Received: (qmail 2787 invoked by uid 2102); 19 Aug 2019 10:17:34 -0400
Received: from localhost (sendmail-bs@127.0.0.1)
  by localhost with SMTP; 19 Aug 2019 10:17:34 -0400
Date:   Mon, 19 Aug 2019 10:17:34 -0400 (EDT)
From:   Alan Stern <stern@rowland.harvard.edu>
X-X-Sender: stern@iolanthe.rowland.org
To:     Oliver Neukum <oneukum@suse.com>
cc:     Jiri Kosina <jikos@kernel.org>,
        USB list <linux-usb@vger.kernel.org>
Subject: Re: Duplicated code in hiddev_open()
In-Reply-To: <1566211268.5663.9.camel@suse.com>
Message-ID: <Pine.LNX.4.44L0.1908191014440.1506-100000@iolanthe.rowland.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, 19 Aug 2019, Oliver Neukum wrote:

> Am Freitag, den 16.08.2019, 13:10 -0400 schrieb Alan Stern:
> > Oliver and Jiri:
> > 
> > Why is there duplicated code in
> > drivers/hid/usbhid/hiddev.c:hiddev_open()?
> > 
> > Line 267:
> > 	/*
> > 	 * no need for locking because the USB major number
> > 	 * is shared which usbcore guards against disconnect
> > 	 */
> > 	if (list->hiddev->exist) {
> > 		if (!list->hiddev->open++) {
> > 			res = hid_hw_open(hiddev->hid);
> > 			if (res < 0)
> > 				goto bail;
> > 		}
> > 	} else {
> > 		res = -ENODEV;
> > 		goto bail;
> > 	}
> > 
> > Line 286:
> > 	mutex_lock(&hiddev->existancelock);
> > 	if (!list->hiddev->open++)
> > 		if (list->hiddev->exist) {
> > 			struct hid_device *hid = hiddev->hid;
> > 			res = hid_hw_power(hid, PM_HINT_FULLON);
> > 			if (res < 0)
> > 				goto bail_unlock;
> > 			res = hid_hw_open(hid);
> > 			if (res < 0)
> > 				goto bail_normal_power;
> > 		}
> > 	mutex_unlock(&hiddev->existancelock);
> > 
> > The second part can never execute, because the first part ensures that 
> > list->hiddev->open > 0 by the time the second part runs.
> > 
> > Even more disturbing, why is one of these code sections protected by a 
> > mutex and the other not?
> 
> I suppose the comment I made back then:
> 
> 079034073faf9 drivers/hid/usbhid/hiddev.c (Oliver Neukum               2008-12-16 10:55:15 +0100 268)    * no need for locking because the USB major number
> 079034073faf9 drivers/hid/usbhid/hiddev.c (Oliver Neukum               2008-12-16 10:55:15 +0100 269)    * is shared which usbcore guards against disconnect
> 
> has ceased to be true, but the section was not removed, as the check
> for existance was duplicated.
> 
> > Note: The second section was added in commit 0361a28d3f9a ("HID: 
> > autosuspend support for USB HID") over ten years ago!
> 
> Yes and I remember how frustrating keyboards were in testing, but
> no further details.

Indeed.  But more importantly for now, how should this be fixed?  This
may be the culprit in some of the syzbot bug reports (those involving 
hiddev).

Alan Stern

