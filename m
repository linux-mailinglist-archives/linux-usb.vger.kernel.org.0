Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 04B2321472F
	for <lists+linux-usb@lfdr.de>; Sat,  4 Jul 2020 18:01:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726897AbgGDQBp (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 4 Jul 2020 12:01:45 -0400
Received: from smtp101.ord1c.emailsrvr.com ([108.166.43.101]:59675 "EHLO
        smtp101.ord1c.emailsrvr.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726869AbgGDQBp (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 4 Jul 2020 12:01:45 -0400
X-Greylist: delayed 317 seconds by postgrey-1.27 at vger.kernel.org; Sat, 04 Jul 2020 12:01:44 EDT
X-Auth-ID: halbert@halwitz.org
Received: by smtp13.relay.ord1c.emailsrvr.com (Authenticated sender: halbert-AT-halwitz.org) with ESMTPSA id 64B6EA012E;
        Sat,  4 Jul 2020 11:56:27 -0400 (EDT)
Subject: Re: Kernel crash during USB device enumeration or MSC mounting
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     Linux USB List <linux-usb@vger.kernel.org>
References: <aa7c2ad9-3daa-7fec-3f2a-9e35a3196938@halwitz.org>
 <20200704153429.GA433456@kroah.com> <20200704153607.GB433456@kroah.com>
From:   Dan Halbert <halbert@halwitz.org>
Message-ID: <72aca793-6383-8acb-e459-436c2805852f@halwitz.org>
Date:   Sat, 4 Jul 2020 11:56:26 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200704153607.GB433456@kroah.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Classification-ID: 557aa241-f020-490b-8877-fdd1b1a0a984-1-1
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 7/4/20 11:36 AM, Greg KH wrote

Thanks for your quick reply, Greg.

> Where is the kernel crash in those logs?  I don't seem to be able to
> find the correct one, can you just send it here so we can read and
> comment on it in the email thread?  I see something odd with the fat
> driver, are you sure you are creating a correct filesystem image for it
> to handle?

There are two crashes described in that report. In the first post, I 
mentioned that the full kdump crash dump is here:
https://drive.google.com/open?id=1ka3ySSccEMRSmnYgI9X16IndPDmIKTD6
Is that what you are looking for?

The first trace seems USB-related, and is in comment #2 (you have to 
click Read More...),
and starts out:

[76707.692760] Call Trace:
[76707.692767] ? usb_alloc_urb+0x29/0x60
[76707.692772] usb_alloc_urb+0x29/0x60
[76707.692779] acm_probe+0x6da/0xdb0 [cdc_acm]
...

The second trace is in comment #4, and seems filesystem-related:

[40866.349358] Call Trace:
[40866.349363] ? kernfs_fop_open+0xc2/0x3b0
[40866.349366] kernfs_fop_open+0xc2/0x3b0
[40866.349368] ? kernfs_fop_read+0x1b0/0x1b0
[40866.349372] do_dentry_open+0x143/0x3a0
[40866.349373] vfs_open+0x2d/0x30
[40866.349376] do_last+0x194/0x900
[40866.349392] path_openat+0x8d/0x290
...

> What do you mean by "reset"?  Are you disconnecting the device from the
> USB bus causing it to electronically be removed and then added back?  Or
> doing something else?

The microcontroller is doing a hard reset, which causes an electrical 
USB reset, if I understand correctly. We have also occasionally seen 
crashes on plug-in (and maybe unplug, though I have not seen that 
personally).

> ... the traces seem _very_ short on the stuff on the web page,
> can you send us the full traceback from the crash?

I have the kdump stuff, but I'm not sure how to give you a full 
traceback. Do you want the whole contents of the /var/crash dirs?

>That's not good, but might mean it is a filesystem issue, not a USB
>issue.

Yes, possibly, though it might be an interaction between the filesystem 
code and USB, since I'm seeing different traces. We have not seen these 
crashes on some other motherboards, including some Intel laptop chipsets 
and some AMD chipsets.

> Ok, this trace:
> 	https://bugs.launchpad.net/ubuntu/+source/linux/+bug/1871143/comments/4
> 
> seems to point at the filesystem code.  Are you sure you are creating
> the image correctly?
> 
> If you unplug and plug the device back in with that same filesystem
> image, does it work, or still crash?

Yes, it works fine. It might be something about the abruptness of the 
disconnect and the speed with which it tries to reconnect. It is 
intermittent, and doesn't always cause a crash.

We've been using these devices and their filesystems for years 
successfully for several years. That doesn't mean the filesystem code 
on-board is perfect, but we shouldn't be able to crash the kernel.

Thanks,
Dan
