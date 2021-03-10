Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 01D7E334935
	for <lists+linux-usb@lfdr.de>; Wed, 10 Mar 2021 21:57:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230215AbhCJU41 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 10 Mar 2021 15:56:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59104 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231197AbhCJU4R (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 10 Mar 2021 15:56:17 -0500
Received: from smtp.gentoo.org (mail.gentoo.org [IPv6:2001:470:ea4a:1:5054:ff:fec7:86e4])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 83FF4C061574
        for <linux-usb@vger.kernel.org>; Wed, 10 Mar 2021 12:56:17 -0800 (PST)
From:   Matthias Schwarzott <zzam@gentoo.org>
Subject: Re: [usb-storage] Re: Amazon Kindle disconnect after Synchronize
 Cache
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     linux-usb@vger.kernel.org, usb-storage@lists.one-eyed-alien.net,
        hirofumi@mail.parknet.co.jp
References: <9f57532f-1fb7-0fdd-b91c-2dfecef5aff3@gentoo.org>
 <20210305191437.GC48113@rowland.harvard.edu>
 <2a1f6636-6b57-ccc5-76b3-7eae5e80e7d3@gentoo.org>
 <20210307155236.GB103559@rowland.harvard.edu>
 <9c3121a9-3d0c-60b3-ef17-993b7d2e9149@gentoo.org>
 <20210307165856.GA104554@rowland.harvard.edu>
 <268e646f-d4ea-3190-f1b9-8e69bfc1b019@gentoo.org>
 <20210309155046.GA176674@rowland.harvard.edu>
Message-ID: <dfd2b281-3beb-9869-37b6-8bd48a6cf40f@gentoo.org>
Date:   Wed, 10 Mar 2021 21:56:04 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210309155046.GA176674@rowland.harvard.edu>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Am 09.03.21 um 16:50 schrieb Alan Stern:
> On Mon, Mar 08, 2021 at 10:59:48PM +0100, Matthias Schwarzott wrote:
>> Am 07.03.21 um 17:58 schrieb Alan Stern:
> 
>>> Okay.  Can you collect a usbmon trace showing the events leading up to
>>> and including a disconnection?
>>>
>> The easiest reproducer is by calling sync while having a file/the device
>> open (and keeping it open afterwards).
>>
>> 1. I recorded usbmon trace like this:
>> # cat /sys/kernel/debug/usb/usbmon/3u >
>> /tmp/connect-python-sync-disconnect-usbmon.out
>>
>> 2. Connect Kindle device
>>
>> 3. Then trigger sync with python:
>> # python -c "import time; import os; f = open('/dev/sde', 'r+b');
>> time.sleep(1); os.fsync(f); time.sleep(5)"
>>
>> 4. After 2 seconds Kindle disconnects (does no longer show USB-Mode screen).
>>
>> 5. Ctrl+c the recording
>>
>> When the final sleep in the python-command is missing, the Kindle does not
>> disconnect.
>>
>>> Alan Stern
>>>
>>> PS: I suspect the SYNCHRONIZE CACHE commands are correlated with the
>>> disconnections but don't cause them.  That is, I suspect the
>>> disconnections happen when the device has been idle -- and generally the
>>> host computer sends a SYNCHRONIZE CACHE command before idling a
>>> removable drive.
>>>
>>
>> I cannot read the usbmon trace, but wireshark displayed a command "SCSI:
>> Prevent/Allow Medium Removal LUN: 0x00  ALLOW" when closing the file.
>> So I suspect this command also counts as activity (!idle).
> 
> Here is the revelant part of the usbmon trace.  The second value on each
> line is a timestamp in microseconds.
> 
>> ffff88814e50d0c0 2440334800 S Bo:3:039:1 -115 31 = 55534243 79000000 00000000 00000600 00000000 00000000 00000000 000000
>> ffff88814e50d0c0 2440334822 C Bo:3:039:1 0 31 >
>> ffff88814e50d0c0 2440334824 S Bi:3:039:1 -115 13 <
>> ffff88814e50d0c0 2440334909 C Bi:3:039:1 0 13 = 55534253 79000000 00000000 00
> 
> That is a TEST UNIT READY command, showing normal status.
> 
>> ffff88814e50d0c0 2440334922 S Bo:3:039:1 -115 31 = 55534243 7a000000 00000000 0000061e 00000001 00000000 00000000 000000
>> ffff88814e50d0c0 2440334949 C Bo:3:039:1 0 31 >
>> ffff88814e50d0c0 2440334951 S Bi:3:039:1 -115 13 <
>> ffff88814e50d0c0 2440335817 C Bi:3:039:1 0 13 = 55534253 7a000000 00000000 00
> 
> That is a PREVENT MEDIUM REMOVAL command, sent when the device file was
> opened by the Python program.
> 
>> ffff88814e50d0c0 2441336674 S Bo:3:039:1 -115 31 = 55534243 7b000000 00000000 00000a35 00000000 00000000 00000000 000000
>> ffff88814e50d0c0 2441336697 C Bo:3:039:1 0 31 >
>> ffff88814e50d0c0 2441336699 S Bi:3:039:1 -115 13 <
>> ffff88814e50d0c0 2441336911 C Bi:3:039:1 0 13 = 55534253 7b000000 00000000 00
> 
> That is the SYNCHRONIZE CACHE command.  Notice that the timestamp shows
> it occurred one second after the PREVENT MEDIUM REMOVAL.
> 
>> ffff88814e50d0c0 2442346649 S Bo:3:039:1 -115 31 = 55534243 7c000000 00000000 00000600 00000000 00000000 00000000 000000
>> ffff88814e50d0c0 2442346700 C Bo:3:039:1 0 31 >
>> ffff88814e50d0c0 2442346702 S Bi:3:039:1 -115 13 <
>> ffff88814e50d0c0 2442346799 C Bi:3:039:1 0 13 = 55534253 7c000000 00000000 00
> 
> One second later, a normal TEST UNIT READY.
> 
>> ffff88814e50d0c0 2444394684 S Bo:3:039:1 -115 31 = 55534243 7d000000 00000000 00000600 00000000 00000000 00000000 000000
>> ffff88814e50d0c0 2444394713 C Bo:3:039:1 0 31 >
>> ffff88814e50d0c0 2444394720 S Bi:3:039:1 -115 13 <
>> ffff88814e50d0c0 2444394804 C Bi:3:039:1 0 13 = 55534253 7d000000 00000000 01
>> ffff88814e50d0c0 2444394821 S Bo:3:039:1 -115 31 = 55534243 7e000000 12000000 80000603 00000012 00000000 00000000 000000
>> ffff88814e50d0c0 2444394866 C Bo:3:039:1 0 31 >
>> ffff88822c917540 2444394928 S Bi:3:039:1 -115 18 <
>> ffff88822c917540 2444395673 C Bi:3:039:1 0 18 = 70000200 0000000a 00000000 3a000000 0000
>> ffff88814e50d0c0 2444395696 S Bi:3:039:1 -115 13 <
>> ffff88814e50d0c0 2444395723 C Bi:3:039:1 0 13 = 55534253 7e000000 00000000 00
> 
> Two seconds later, another TEST UNIT READY.  This one returned a failure
> status, with an error code saying that the medium is not present (in
> spite of the fact that medium removal was supposed to be prevented).
> 
> The usbmon trace contains six more TEST UNIT READY commands, sent in
> quick succession, all getting the same failure result.  Notably, it does
> not show any sort of disconnection.  The final timestamp in the trace is
> 2446328158, which is just five seconds after the SYNCHRONIZE CACHE
> command was sent -- there's no way to tell if anything happened after
> that.
> 
> Maybe there's something else going on under Windows that we're not aware
> of.  The only significant different I can see between this trace and the
> short Windows trace in your original email is the time interval between
> TEST UNIT READY commands; here it is two seconds but with Windows it was
> one second.  You can change the interval by writing to
> 
> 	/sys/block/sde/events_poll_msecs
> 
> What happens if you set the value to 1000 before running the test?
> 
I tested different values. At 1000 it still disconnects. At lower values 
it no longer does this.
I tested 200 up to 900. Even 900 ms is good enough to keep it connected.

Btw. it is not a USB disconnect, but it just seems to plays medium ejected.

Out of interest I called "sg_start -v -l /dev/sde" after one of the 
failing experiments. That made the Kindle go back to connected state.

To me the above experiments show that enough TEST UNIT READY commands 
are needed in the 2 s after a SYNCHRONIZE CACHE.

> Also, the usbmon trace shows that my guess about power management and
> device disconnections was completely wrong.  The bus does not get
> suspended and the Kindle does not disconnect, even though it seems to
> become unusable.
> 

Regards
Matthias
