Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8A46C8685C
	for <lists+linux-usb@lfdr.de>; Thu,  8 Aug 2019 19:59:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729780AbfHHR7C (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 8 Aug 2019 13:59:02 -0400
Received: from mail.kernel.org ([198.145.29.99]:50352 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725785AbfHHR7C (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 8 Aug 2019 13:59:02 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 22FCC2171F;
        Thu,  8 Aug 2019 17:59:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1565287141;
        bh=/UtSNoD9DrzI26ploZhS+chpexm5CiI/ortEWYKqJNU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=I/gaRd3Zfi0oDlvWcIqEHSxAiHZf68hfWct+r5vfBp4hHQhXXL4rAmjFUq6qY5Pr9
         GOh5RtSfQGVLp/54Um38TTaXoe8bYSs9vu5SzyD7ovZIxUgYKYZ1QONb1ygkHs5o/i
         kWM5kUpYzvpVGMx9e6JjF42h67hu74YUBD7qjf5U=
Date:   Thu, 8 Aug 2019 19:58:59 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     Andrey Konovalov <andreyknvl@google.com>,
        Oliver Neukum <oneukum@suse.com>,
        syzkaller-bugs <syzkaller-bugs@googlegroups.com>,
        USB list <linux-usb@vger.kernel.org>
Subject: Re: [PATCH] USB: rio500: Fix lockdep violation
Message-ID: <20190808175859.GA16092@kroah.com>
References: <CAAeHK+z7a3R+Lvo_0VeeMYZZqjWXgcX0qBmi0-Gcx=rDQsBPNA@mail.gmail.com>
 <Pine.LNX.4.44L0.1908081329240.1319-100000@iolanthe.rowland.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.44L0.1908081329240.1319-100000@iolanthe.rowland.org>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Aug 08, 2019 at 01:34:08PM -0400, Alan Stern wrote:
> The syzbot fuzzer found a lockdep violation in the rio500 driver:
> 
> 	======================================================
> 	WARNING: possible circular locking dependency detected
> 	5.3.0-rc2+ #23 Not tainted
> 	------------------------------------------------------
> 	syz-executor.2/20386 is trying to acquire lock:
> 	00000000772249c6 (rio500_mutex){+.+.}, at: open_rio+0x16/0xc0  
> 	drivers/usb/misc/rio500.c:64
> 
> 	but task is already holding lock:
> 	00000000d3e8f4b9 (minor_rwsem){++++}, at: usb_open+0x23/0x270  
> 	drivers/usb/core/file.c:39
> 
> 	which lock already depends on the new lock.
> 
> The problem is that the driver's open_rio() routine is called while
> the usbcore's minor_rwsem is locked for reading, and it acquires the
> rio500_mutex; whereas conversely, probe_rio() and disconnect_rio()
> first acquire the rio500_mutex and then call usb_register_dev() or
> usb_deregister_dev(), which lock minor_rwsem for writing.
> 
> The correct ordering of acquisition should be: minor_rwsem first, then
> rio500_mutex (since the locking in open_rio() cannot be changed).
> Thus, the probe and disconnect routines should avoid holding
> rio500_mutex while doing their registration and deregistration.
> 
> This patch adjusts the code in those two routines to do just that.  It
> also relies on the fact that the probe and disconnect routines are
> protected by the device mutex, so the initial test of rio->present
> needs no extra locking.
> 
> Reported-by: syzbot+7bbcbe9c9ff0cd49592a@syzkaller.appspotmail.com
> Signed-off-by: Alan Stern <stern@rowland.harvard.edu>
> Fixes: d710734b0677 ("USB: rio500: simplify locking")
> CC: Oliver Neukum <oneukum@suse.com>
> CC: <stable@vger.kernel.org>
> 
> ---
> 
> This patch is different from the one I posted earlier.  I realized that 
> we don't want to register the device's char file until after the 
> buffers have been allocated.

Should I revert Oliver's patch?

confused,

greg k-h
