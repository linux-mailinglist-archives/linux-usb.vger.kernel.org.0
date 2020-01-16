Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6790213D221
	for <lists+linux-usb@lfdr.de>; Thu, 16 Jan 2020 03:23:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729064AbgAPCXt (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 15 Jan 2020 21:23:49 -0500
Received: from wsip-184-185-158-229.sd.sd.cox.net ([184.185.158.229]:34692
        "EHLO s0-postfix.allcaps.org" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726513AbgAPCXt (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 15 Jan 2020 21:23:49 -0500
Received: from MacBook-Pro.local (unknown [12.197.118.92])
        by s0-postfix.allcaps.org (Postfix) with ESMTPSA id 65F821C64048;
        Wed, 15 Jan 2020 17:14:13 -0800 (PST)
Subject: Re: Unable to set "iInterface" in usb gadget via configfs
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     linux-usb@vger.kernel.org
References: <Pine.LNX.4.44L0.2001151011520.1788-100000@iolanthe.rowland.org>
From:   "Andrew P. Lentvorski" <bsder@allcaps.org>
Autocrypt: addr=bsder@allcaps.org; prefer-encrypt=mutual; keydata=
 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
Message-ID: <0453184e-353e-2a98-4f7a-c97b9dddf57a@allcaps.org>
Date:   Wed, 15 Jan 2020 18:23:47 -0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <Pine.LNX.4.44L0.2001151011520.1788-100000@iolanthe.rowland.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 1/15/20 7:14 AM, Alan Stern wrote:

> I don't think any earlier messages in this thread made it through the 
> mailing list, but this one definitely did.

Yay!  I also saw this one in the archives so I was hopeful.

>>> I've been trying to set "iInterface" in my usb gadget to a specific string, but I simply can't find a way to make configfs accept this.
>>>
>>> When I set my gadget up on my Beaglebone Black (uname -a: Linux beaglebone 4.14.108-ti-r113 #1 SMP PREEMPT Wed Jul 31 00:01:10 UTC 2019 armv7l GNU/Linux).
>>>
>>> I get (output from lsusb):
>>>
>>> iInterface 5 HID Interface
>>>
>>>
>>> But I want it to be something like:
>>>
>>> iInterface 4 LPC-LINK2 CMSIS-DAP V5.224
>>>
>>>
>>> This seems to be wired up as a fixed value in f_hid.c and doesn't seem to have a corresponding way to actually change it via configfs.
>>>
>>>
>>> #define CT_FUNC_HID_IDX 0
>>>
>>> static struct usb_string ct_func_string_defs[] = {
>>>         [CT_FUNC_HID_IDX].s     = "HID Interface",
>>>         {},                     /* end of list */
>>> };
> 
> Then maybe you need to fix f_hid.c.  Or maybe configfs isn't meant to
> allow the user to specify these string index values (I don't know any
> of the configfs details).

That's kind of my problem in that I was hoping to get someone far more
knowledegable than me to at least flag these before attacking it:

A) I didn't overlook something stupid and this really is hardwired with
no way to change it (either in configfs or ... some other? kernel mechanism)

B) This is an *actual* bug.

C) This is an actual bug *that should be fixed* and isn't that way
intentionally for some Linux reason.

D) This is actually the right place to fix it.  Obviously there is going
to be something at the configfs level, too, and I have *zero* idea where
to start looking for that.

Thanks,
-a

