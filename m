Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2257C17BCE9
	for <lists+linux-usb@lfdr.de>; Fri,  6 Mar 2020 13:38:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726171AbgCFMiO convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-usb@lfdr.de>); Fri, 6 Mar 2020 07:38:14 -0500
Received: from unicorn.mansr.com ([81.2.72.234]:49230 "EHLO unicorn.mansr.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726026AbgCFMiN (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 6 Mar 2020 07:38:13 -0500
Received: by unicorn.mansr.com (Postfix, from userid 51770)
        id 3FBEA15F0E; Fri,  6 Mar 2020 12:38:12 +0000 (GMT)
From:   =?iso-8859-1?Q?M=E5ns_Rullg=E5rd?= <mans@mansr.com>
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     linux-usb@vger.kernel.org
Subject: Re: Crash while capturing with usbmon
References: <Pine.LNX.4.44L0.2003051605150.1298-100000@iolanthe.rowland.org>
Date:   Fri, 06 Mar 2020 12:38:12 +0000
In-Reply-To: <Pine.LNX.4.44L0.2003051605150.1298-100000@iolanthe.rowland.org>
        (Alan Stern's message of "Thu, 5 Mar 2020 16:09:05 -0500 (EST)")
Message-ID: <yw1x36alk6a3.fsf@mansr.com>
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
>
> Can you add printk statements in drivers/usb/mon/mon_bin.c: 
> mon_bin_get_data() to determine which of the pathways was used for 
> calling mon_copy_buff() and what the values of the arguments were?

OK, I added a printk to mon_bin_get_data(), and the bad call has
offset=4736, length=4096 urb->num_sgs=0 urb->transfer_flags=0x281,
urb->transfer_buffer=0xffefee00.

I guess the question now is how transfer_buffer got assigned that value.

-- 
Måns Rullgård
