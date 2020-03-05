Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 83DBD17B0F4
	for <lists+linux-usb@lfdr.de>; Thu,  5 Mar 2020 22:53:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726142AbgCEVxk convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-usb@lfdr.de>); Thu, 5 Mar 2020 16:53:40 -0500
Received: from unicorn.mansr.com ([81.2.72.234]:42720 "EHLO unicorn.mansr.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726067AbgCEVxk (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 5 Mar 2020 16:53:40 -0500
Received: by unicorn.mansr.com (Postfix, from userid 51770)
        id CA46115F0E; Thu,  5 Mar 2020 21:53:38 +0000 (GMT)
From:   =?iso-8859-1?Q?M=E5ns_Rullg=E5rd?= <mans@mansr.com>
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     linux-usb@vger.kernel.org
Subject: Re: Crash while capturing with usbmon
References: <Pine.LNX.4.44L0.2003051605150.1298-100000@iolanthe.rowland.org>
Date:   Thu, 05 Mar 2020 21:53:38 +0000
In-Reply-To: <Pine.LNX.4.44L0.2003051605150.1298-100000@iolanthe.rowland.org>
        (Alan Stern's message of "Thu, 5 Mar 2020 16:09:05 -0500 (EST)")
Message-ID: <yw1x7dzyjwnx.fsf@mansr.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/25.3 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8BIT
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Alan Stern <stern@rowland.harvard.edu> writes:

> On Thu, 5 Mar 2020, Måns Rullgård wrote:
>
>> While trying to capture some USB traffic, this happened:
>> 
>> 8<--- cut here ---
>> Unable to handle kernel paging request at virtual address ffeff000
> ...
>> [<c069e0a8>] (memcpy) from [<c050c88c>] (mon_copy_to_buff+0x4c/0x6c)
>> [<c050c88c>] (mon_copy_to_buff) from [<c050cd2c>] (mon_bin_event+0x480/0x7b8)
>> [<c050cd2c>] (mon_bin_event) from [<c050ade4>] (mon_bus_complete+0x50/0x6c)
> ...
>
>> It is easily reproducible.  What can I do to narrow down the cause?
>
> What kind of USB traffic were you monitoring?  Isochronous?  
> Scatter-gather?

It was bulk transfers reading from a flash stick:

# tcpdump -i usbmon5
tcpdump: verbose output suppressed, use -v or -vv for full protocol decode
listening on usbmon5, link-type USB_LINUX_MMAPPED (USB with padded Linux header), capture size 262144 bytes
18:52:44.785060 CONTROL SUBMIT to 5:4:0
18:52:44.785248 CONTROL COMPLETE from 5:4:0
18:52:44.786077 CONTROL SUBMIT to 5:3:0
18:52:44.786171 CONTROL COMPLETE from 5:3:0
18:52:44.786274 CONTROL SUBMIT to 5:2:0
18:52:44.786308 CONTROL COMPLETE from 5:2:0
18:52:44.786379 CONTROL SUBMIT to 5:1:0
18:52:44.786408 CONTROL COMPLETE from 5:1:0
18:52:50.693712 BULK SUBMIT to 5:4:2
18:52:50.693788 BULK COMPLETE from 5:4:2
18:52:50.694470 BULK SUBMIT to 5:4:1
18:52:50.694562 BULK COMPLETE from 5:4:1
18:52:50.694667 BULK SUBMIT to 5:4:1
18:52:50.694687 BULK COMPLETE from 5:4:1
18:52:50.695562 BULK SUBMIT to 5:4:2
18:52:50.695630 BULK COMPLETE from 5:4:2
18:52:50.695799 BULK SUBMIT to 5:4:1
18:52:50.695823 BULK SUBMIT to 5:4:1
18:52:50.695828 BULK SUBMIT to 5:4:1
18:52:50.695832 BULK SUBMIT to 5:4:1

And then it died.  Sometimes it lasts a little longer, but it always
happens pretty quickly.

> Can you add printk statements in drivers/usb/mon/mon_bin.c: 
> mon_bin_get_data() to determine which of the pathways was used for 
> calling mon_copy_buff() and what the values of the arguments were?

I'll do that.

-- 
Måns Rullgård
