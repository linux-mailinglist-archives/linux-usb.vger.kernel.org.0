Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9EF7F96287
	for <lists+linux-usb@lfdr.de>; Tue, 20 Aug 2019 16:34:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730395AbfHTOe1 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 20 Aug 2019 10:34:27 -0400
Received: from mx2.suse.de ([195.135.220.15]:51790 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1730390AbfHTOe1 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 20 Aug 2019 10:34:27 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id 2EC87AE84;
        Tue, 20 Aug 2019 14:34:26 +0000 (UTC)
Message-ID: <1566311665.11678.22.camel@suse.com>
Subject: Re: Duplicated code in hiddev_open()
From:   Oliver Neukum <oneukum@suse.com>
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     Jiri Kosina <jikos@kernel.org>,
        USB list <linux-usb@vger.kernel.org>
Date:   Tue, 20 Aug 2019 16:34:25 +0200
In-Reply-To: <Pine.LNX.4.44L0.1908191014440.1506-100000@iolanthe.rowland.org>
References: <Pine.LNX.4.44L0.1908191014440.1506-100000@iolanthe.rowland.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.26.6 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Am Montag, den 19.08.2019, 10:17 -0400 schrieb Alan Stern:
> On Mon, 19 Aug 2019, Oliver Neukum wrote:
> 
> > Am Freitag, den 16.08.2019, 13:10 -0400 schrieb Alan Stern:
> > > Oliver and Jiri:
> > > 
> > > Why is there duplicated code in
> > > drivers/hid/usbhid/hiddev.c:hiddev_open()?
> > > 
> > > Line 267:
> > > 	/*
> > > 	 * no need for locking because the USB major number
> > > 	 * is shared which usbcore guards against disconnect
> > > 	 */
> > > 	if (list->hiddev->exist) {
> > > 		if (!list->hiddev->open++) {
> > > 			res = hid_hw_open(hiddev->hid);
> > > 			if (res < 0)
> > > 				goto bail;
> > > 		}
> > > 	} else {
> > > 		res = -ENODEV;
> > > 		goto bail;
> > > 	}
> > > 
> > > Line 286:
> > > 	mutex_lock(&hiddev->existancelock);
> > > 	if (!list->hiddev->open++)
> > > 		if (list->hiddev->exist) {
> > > 			struct hid_device *hid = hiddev->hid;
> > > 			res = hid_hw_power(hid, PM_HINT_FULLON);
> > > 			if (res < 0)
> > > 				goto bail_unlock;
> > > 			res = hid_hw_open(hid);
> > > 			if (res < 0)
> > > 				goto bail_normal_power;
> > > 		}
> > > 	mutex_unlock(&hiddev->existancelock);
> > > 
> > > The second part can never execute, because the first part ensures that 
> > > list->hiddev->open > 0 by the time the second part runs.
> > > 
> > > Even more disturbing, why is one of these code sections protected by a 
> > > mutex and the other not?
> > 
> > I suppose the comment I made back then:
> > 
> > 079034073faf9 drivers/hid/usbhid/hiddev.c (Oliver Neukum               2008-12-16 10:55:15 +0100 268)    * no need for locking because the USB major number
> > 079034073faf9 drivers/hid/usbhid/hiddev.c (Oliver Neukum               2008-12-16 10:55:15 +0100 269)    * is shared which usbcore guards against disconnect
> > 
> > has ceased to be true, but the section was not removed, as the check
> > for existance was duplicated.
> > 
> > > Note: The second section was added in commit 0361a28d3f9a ("HID: 
> > > autosuspend support for USB HID") over ten years ago!
> > 
> > Yes and I remember how frustrating keyboards were in testing, but
> > no further details.
> 
> Indeed.  But more importantly for now, how should this be fixed?  This
> may be the culprit in some of the syzbot bug reports (those involving 
> hiddev).


I doubt it. This looks like it would cause a resource leak, not the
other way round. But I'd say all operations need to be done under lock.

	Regards
		



oliver

