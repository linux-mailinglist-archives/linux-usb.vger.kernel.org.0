Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 18F4A2CFE80
	for <lists+linux-usb@lfdr.de>; Sat,  5 Dec 2020 20:41:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726016AbgLETk0 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 5 Dec 2020 14:40:26 -0500
Received: from netrider.rowland.org ([192.131.102.5]:34997 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1725784AbgLETkZ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 5 Dec 2020 14:40:25 -0500
Received: (qmail 1180502 invoked by uid 1000); 5 Dec 2020 10:39:42 -0500
Date:   Sat, 5 Dec 2020 10:39:42 -0500
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Patrik Nilsson <lists@nipatriknilsson.com>
Cc:     Patrik Nilsson <nipatriknilsson@gmail.com>,
        Greg KH <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org
Subject: Re: high speed data to usb disk makes the kernel think that is has
 been unmounted
Message-ID: <20201205153942.GB1179536@rowland.harvard.edu>
References: <20200811193150.GA344152@rowland.harvard.edu>
 <ef2937d6-f8a8-fbc6-decd-eeb4af94e863@gmail.com>
 <20200812061451.GE1299081@kroah.com>
 <95be674d-ee98-b904-6856-2f662ac7838f@gmail.com>
 <20200818085502.GB28036@kroah.com>
 <83a5be3e-9f93-e601-5161-cbb5d1957c5a@gmail.com>
 <20200818183420.GB152667@rowland.harvard.edu>
 <0975cb43-5520-543c-987c-57de5e7b258b@gmail.com>
 <20200915182414.GB1010655@rowland.harvard.edu>
 <114ee1e1-c30e-45cf-1086-1d9258df9389@nipatriknilsson.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <114ee1e1-c30e-45cf-1086-1d9258df9389@nipatriknilsson.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sat, Dec 05, 2020 at 12:49:45PM +0100, Patrik Nilsson wrote:
> Dear Alan,
> 
> After long time testing it seems that changing the TIMEOUT values did help
> somewhat, but not completely.
> 
> I tested two SSD and wrote to them at the same time:
> 
> # dd if=/dev/zero of=/dev/sdd bs=$((10*1024*1024))
> 
> # dd if=/dev/zero of=/dev/sdg bs=$((10*1024*1024)) # different bash terminal
> 
> The synchronize write gives a lot of errors as the log below (1) shows
> 
> Running big with blocks in synchronized mode gives the same kind of error:
> 
> # dd if=/dev/zero of=/dev/sdi bs=$((10*1024*1024)) oflag=dsync # this is
> another SSD bought for this test
> dd: error writing '/dev/sdi': Input/output error
> 9+0 records in
> 8+0 records out
> 83886080 bytes (84 MB, 80 MiB) copied, 185.585 s, 452 kB/s
> 
> When synchronized data transfer is done to sdi and sdg in a small block size
> everything works out as it should, but takes a long time.
> 
> # dd if=/dev/zero of=/dev/sdg bs=1024 oflag=dsync
> 56897100+0 records in
> 56897100+0 records out
> 58262630400 bytes (58 GB, 54 GiB) copied, 74235.8 s, 785 kB/s
> [...]
> dd: error writing '/dev/sdg': No space left on device
> 488386585+0 records in
> 488386584+0 records out
> 500107862016 bytes (500 GB, 466 GiB) copied, 702184 s, 712 kB/s
> 
> I have been unable to catch this kind of error leading to a crash.
> 
> The shutdown of the test computer did show the same kind of errors as the
> below log. It couldn't write asynchronous data.

Without more information it's impossible to tell what's really going
wrong.  The logs by themselves just aren't good enough.

Messing around with the timings isn't going to fix the real problem,
which is that you keep getting write errors.  Once a write error has
occurred you're already in trouble; failing to reinitialize the drive
afterward is minor in comparison.

The best thing for you to do at this point is collect a usbmon trace 
showing some errors as they occur.  Information on how to use usbmon is 
in the kernel source file Documentation/usb/usbmon.rst.

Alan Stern
