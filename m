Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7957192189
	for <lists+linux-usb@lfdr.de>; Mon, 19 Aug 2019 12:41:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726820AbfHSKlM (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 19 Aug 2019 06:41:12 -0400
Received: from mx2.suse.de ([195.135.220.15]:55380 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726550AbfHSKlM (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 19 Aug 2019 06:41:12 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id 61C1FAE4B;
        Mon, 19 Aug 2019 10:41:11 +0000 (UTC)
Message-ID: <1566211268.5663.9.camel@suse.com>
Subject: Re: Duplicated code in hiddev_open()
From:   Oliver Neukum <oneukum@suse.com>
To:     Alan Stern <stern@rowland.harvard.edu>,
        Jiri Kosina <jikos@kernel.org>
Cc:     USB list <linux-usb@vger.kernel.org>
Date:   Mon, 19 Aug 2019 12:41:08 +0200
In-Reply-To: <Pine.LNX.4.44L0.1908161228310.1525-100000@iolanthe.rowland.org>
References: <Pine.LNX.4.44L0.1908161228310.1525-100000@iolanthe.rowland.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.26.6 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Am Freitag, den 16.08.2019, 13:10 -0400 schrieb Alan Stern:
> Oliver and Jiri:
> 
> Why is there duplicated code in
> drivers/hid/usbhid/hiddev.c:hiddev_open()?
> 
> Line 267:
> 	/*
> 	 * no need for locking because the USB major number
> 	 * is shared which usbcore guards against disconnect
> 	 */
> 	if (list->hiddev->exist) {
> 		if (!list->hiddev->open++) {
> 			res = hid_hw_open(hiddev->hid);
> 			if (res < 0)
> 				goto bail;
> 		}
> 	} else {
> 		res = -ENODEV;
> 		goto bail;
> 	}
> 
> Line 286:
> 	mutex_lock(&hiddev->existancelock);
> 	if (!list->hiddev->open++)
> 		if (list->hiddev->exist) {
> 			struct hid_device *hid = hiddev->hid;
> 			res = hid_hw_power(hid, PM_HINT_FULLON);
> 			if (res < 0)
> 				goto bail_unlock;
> 			res = hid_hw_open(hid);
> 			if (res < 0)
> 				goto bail_normal_power;
> 		}
> 	mutex_unlock(&hiddev->existancelock);
> 
> The second part can never execute, because the first part ensures that 
> list->hiddev->open > 0 by the time the second part runs.
> 
> Even more disturbing, why is one of these code sections protected by a 
> mutex and the other not?

I suppose the comment I made back then:

079034073faf9 drivers/hid/usbhid/hiddev.c (Oliver Neukum               2008-12-16 10:55:15 +0100 268)    * no need for locking because the USB major number
079034073faf9 drivers/hid/usbhid/hiddev.c (Oliver Neukum               2008-12-16 10:55:15 +0100 269)    * is shared which usbcore guards against disconnect

has ceased to be true, but the section was not removed, as the check
for existance was duplicated.

> Note: The second section was added in commit 0361a28d3f9a ("HID: 
> autosuspend support for USB HID") over ten years ago!

Yes and I remember how frustrating keyboards were in testing, but
no further details.

	Regards
		Oliver

