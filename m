Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E6B3C140109
	for <lists+linux-usb@lfdr.de>; Fri, 17 Jan 2020 01:39:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729044AbgAQAjf (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 16 Jan 2020 19:39:35 -0500
Received: from wsip-184-185-158-229.sd.sd.cox.net ([184.185.158.229]:65391
        "EHLO s0-postfix.allcaps.org" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726378AbgAQAjf (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 16 Jan 2020 19:39:35 -0500
Received: from MacBook-Pro.local (unknown [12.197.118.92])
        by s0-postfix.allcaps.org (Postfix) with ESMTPSA id C93B01C6404A;
        Thu, 16 Jan 2020 15:29:57 -0800 (PST)
Subject: Re: Unable to set "iInterface" in usb gadget via configfs
To:     Felipe Balbi <balbi@kernel.org>,
        Alan Stern <stern@rowland.harvard.edu>
Cc:     linux-usb@vger.kernel.org
References: <Pine.LNX.4.44L0.2001151011520.1788-100000@iolanthe.rowland.org>
 <0453184e-353e-2a98-4f7a-c97b9dddf57a@allcaps.org>
 <87lfq75zcb.fsf@kernel.org>
From:   "Andrew P. Lentvorski" <bsder@allcaps.org>
Autocrypt: addr=bsder@allcaps.org; prefer-encrypt=mutual; keydata=
 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
Message-ID: <26ebfc08-0952-8c26-b9f4-01da14ea4846@allcaps.org>
Date:   Thu, 16 Jan 2020 16:39:34 -0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <87lfq75zcb.fsf@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 1/16/20 5:02 AM, Felipe Balbi wrote:

>>>>> When I set my gadget up on my Beaglebone Black (uname -a: Linux
>>>>> beaglebone 4.14.108-ti-r113 #1 SMP PREEMPT Wed Jul 31 00:01:10 UTC
>>>>> 2019 armv7l GNU/Linux).
>>>>>
>>>>> I get (output from lsusb):
>>>>>
>>>>> iInterface 5 HID Interface
>>>>>
>>>>>
>>>>> But I want it to be something like:
>>>>>
>>>>> iInterface 4 LPC-LINK2 CMSIS-DAP V5.224
> 
> Why? Oh, you want your beaglebone to behave as a CMSIS-DAP to trick some
> other SW?
> 
> Do we need to support that upstream, though? It seems like this is a
> one-off thing. Does anybody else need to configure interface string
> descriptor?

I ... don't know, actually.  That's probably a good question.

What I *can* tell you is that a quick survey of the various USB devices
in my office with lsusb shows the majority of iInterface are 0x00, but
that everything else is a smattering of all manner of stuff: "Integrated
Camera", "Bulk Control Interface", "Volume Control", "Firmware Upgrade
Port", etc.

Microchip's PIC32 USB HID sample code sets the value to 0x00.

USB Complete (5th Edition) also shows this as 0x00 on page 267 for a
configuration_descriptor for a vendor-specific HID.


>> C) This is an actual bug *that should be fixed* and isn't that way
>> intentionally for some Linux reason.
> 
> Up until now, it has been intentional. Currently, I don't see a need to
> change it. 

Clearly, some HID devices *are* using this field.  So, this probably
should be made changeable if we want the HID gadget to be maximally useful.

As for the technical details I can see from the code:


A bit of code archaeology shows that .iInterface was expected to be
dynamic as of the origin commit for f_hid.c (commit
71adf118946957839a13aa4d1094183e05c6c094).  This still persists in the
file today.


The allocation of usb_gstrings_attach comes in at Nov 6, 2014 as of
(commit 5ca8d3ec9970f4798e68bd21a9d44db3d0ff4da7) with the message:

"Before configfs is integrated the usb_gstrings_attach() interface
must be used."

This looks like a case of something that simply got lost in the shuffle
in the upgrade path to configfs, and I'm just the first poor slob who
tripped over the oversight.


However, I'm a little concerned as to why this was set *at all* (which
seems to be what is actually tripping me up), and I'd be interested as
to what drove the specific choice of 0x05 "HID Interface".  I don't see
this in any spec anywhere obvious and this seems to be a deliberate
change from previous behavior.

If this isn't user configurable, then it's probably a highly
questionable choice to give this any default value other than 0x00.
This would have been quite a bit easier to code, too, so I'm *really*
scratching my head about this.


> I may be persuaded otherwise, but I need to see arguments
> other than "I want to trick some SW into thinking I'm something else".

Obviously I'm biased and scratching my own itch, but why would you
consider that not to be an important argument?

Being able to fake being a particular piece of USB hardware that's
currently tied to some ancient Windows binary driver is a great way to
insert Linux into industrial and lab control pipelines.  Giving a
control board the ability to now also be accessed via ethernet or
wireless (or even a better USB protocol) and thus now has an upgrade or
higher performance path is a *really* useful thing.  And the Beaglebone
Black is a really good "protocol engine".  Finally, after making the usb
gadget emulation work, I can probably blow a bunch of Windows machines
away completely since something like a Beaglebone Black is more than
sufficient to handle the control without any outside intervention.

My end target isn't "CMSIS-DAP"--there are a zillion really cheap
CMSIS-DAP devices so emulating CMSIS-DAP would be mostly pointless
pedantry (although perhaps a good usb gadget tutorial).  CMSIS-DAP just
happens to be a really good test case as it is an extremely well
documented HID-based protocol and has extensive tests to validate it.
Consequently, I can be sure that most bugs and difficulties are
localized to my gadget implementation code or the gadget driver.



Anyhow, let me know whether I should attack the problem or not.  I
suspect my biggest issue is simply that I will have to do all the work
on a Beaglebone Black as I really don't know of any other way to test
that gadget subsystem.  This will probably be okay if I can build it as
a module--if I have to do a full kernel build it will probably demand
that I set up a cross-compiling environment (and that isn't trivial).


Thanks,
-a
