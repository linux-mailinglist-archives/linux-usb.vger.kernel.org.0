Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AE67714154F
	for <lists+linux-usb@lfdr.de>; Sat, 18 Jan 2020 01:58:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729824AbgARA6k (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 17 Jan 2020 19:58:40 -0500
Received: from wsip-184-185-158-229.sd.sd.cox.net ([184.185.158.229]:55047
        "EHLO s0-postfix.allcaps.org" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727033AbgARA6k (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 17 Jan 2020 19:58:40 -0500
Received: from MacBook-Pro.local (unknown [12.197.118.92])
        by s0-postfix.allcaps.org (Postfix) with ESMTPSA id 0EA661C64046;
        Fri, 17 Jan 2020 15:49:00 -0800 (PST)
Subject: Re: Unable to set "iInterface" in usb gadget via configfs
To:     Felipe Balbi <balbi@kernel.org>,
        Alan Stern <stern@rowland.harvard.edu>
Cc:     linux-usb@vger.kernel.org
References: <Pine.LNX.4.44L0.2001151011520.1788-100000@iolanthe.rowland.org>
 <0453184e-353e-2a98-4f7a-c97b9dddf57a@allcaps.org>
 <87lfq75zcb.fsf@kernel.org>
 <26ebfc08-0952-8c26-b9f4-01da14ea4846@allcaps.org>
 <878sm65tak.fsf@kernel.org>
From:   "Andrew P. Lentvorski" <bsder@allcaps.org>
Autocrypt: addr=bsder@allcaps.org; prefer-encrypt=mutual; keydata=
 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
Message-ID: <76a34192-6b09-357c-f1e0-2228a9ebab76@allcaps.org>
Date:   Fri, 17 Jan 2020 16:58:38 -0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <878sm65tak.fsf@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 1/17/20 1:25 AM, Felipe Balbi wrote:

> why? No behavior changed. Look at the very first commit on
> f_hid.c. commit 71adf118946957839a13aa4d1094183e05c6c094 contains the
> following:

Oops.  I missed that.  Sorry for not being complete enough.  My fault.

> Now, if there's a real usecase for this. Something that can attract, as
> per Dave B., 3 or more users, then we can consider adding it
> upstream. Remember that if we add support for changing interface
> strings, it has to be implemented for *all* functions and validated on
> all functions, then properly documented as a configfs ABI which can
> never change anymore.

Erg.  I did not realize that this was not going to be limited to just
f_hid.c.

That's ... ugly.  Reeeally ugly.  And a *LOT* of work.

I can certainly see that "some devices do this" is nowhere close to
enough justification for that.

>> control board the ability to now also be accessed via ethernet or
>> wireless (or even a better USB protocol) and thus now has an upgrade or
>> higher performance path is a *really* useful thing.  And the Beaglebone
>> Black is a really good "protocol engine".  Finally, after making the usb
>> gadget emulation work, I can probably blow a bunch of Windows machines
>> away completely since something like a Beaglebone Black is more than
>> sufficient to handle the control without any outside intervention.
> 
> You're getting to a point where things start to get interesting. What
> exactly are you trying to do?

I've got both a GPIB (with USB 1.0(!) only--as far as I can tell--talk
about a relic) and an industrial controller (unknown protocol but USB
tracing and a signal analyzer shows pretty much 1-1 so reverse
engineering it doesn't seem problematic) currently sitting on my desk.
I have one system which has enough USB devices in it that it won't work
on a USB 3 system because the Intel USB 3 chipset allocates twice as
many endpoints per device and hits an internal limit--they want a USB
upgrade as an intermediate move to ethernet.

I have a half-dozen other similar type requests queued behind these.
People are finally reaching a critical point where they can't keep
ancient hardware, ancient drivers, ancient Windows, and ancient
computers all running anymore--even VM's are starting to fail as too
many things have some level of timing baked into the driver (normally
unintentionally).

>> Anyhow, let me know whether I should attack the problem or not.

At this point, I suspect that the correct answer is "Keep an eye on this
while moving forward."

If I stumble over more drivers that are trying to use iInterface for
some reason, I will see if setting it to 0x00 makes things choose a
different path.  Simply changing the default to effectively 0x00-unused
seems like a lot less work and might pick up 90% of the use cases.  It
also means the scope would be limited to f_hid.c.  If I hit this a
couple times, I'll have a lot more justification behind me.

If I start seeing cases where I actually need to specify the iInterface
stuff, I'll come back with data and we can revisit this again.  I
suspect that someone is eventually going to drop a CDC class device in
front of me, and that will give me more data, too.  If ever I reach the
 point where I have multiple devices working around this, hopefully you
will find my arguments far more persuasive.  :)

> you could use dummy_hcd as well.

Interesting.  I did not know about this, but I will keep it in mind.


Thanks for being so patient.  Sorry for wasting your time only to come
back to "do nothing".

-a
