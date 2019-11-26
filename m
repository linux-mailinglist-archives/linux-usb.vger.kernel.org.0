Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5EC5010A11D
	for <lists+linux-usb@lfdr.de>; Tue, 26 Nov 2019 16:20:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728454AbfKZPUP (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 26 Nov 2019 10:20:15 -0500
Received: from iolanthe.rowland.org ([192.131.102.54]:40362 "HELO
        iolanthe.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1727532AbfKZPUP (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 26 Nov 2019 10:20:15 -0500
Received: (qmail 1799 invoked by uid 2102); 26 Nov 2019 10:20:14 -0500
Received: from localhost (sendmail-bs@127.0.0.1)
  by localhost with SMTP; 26 Nov 2019 10:20:14 -0500
Date:   Tue, 26 Nov 2019 10:20:14 -0500 (EST)
From:   Alan Stern <stern@rowland.harvard.edu>
X-X-Sender: stern@iolanthe.rowland.org
To:     Greg KH <greg@kroah.com>, Pete Zaitcev <zaitcev@redhat.com>
cc:     USB list <linux-usb@vger.kernel.org>
Subject: Re: [PATCH] usb: mon: Fix a deadlock in usbmon between mmap and read
In-Reply-To: <20191126004407.4b72ef7f@suzdal.zaitcev.lan>
Message-ID: <Pine.LNX.4.44L0.1911261018110.1508-100000@iolanthe.rowland.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, 26 Nov 2019, Pete Zaitcev wrote:

> The problem arises because our read() function grabs a lock of the
> circular buffer, finds something of interest, then invokes copy_to_user()
> straight from the buffer, which in turn takes mm->mmap_sem. In the same
> time, the callback mon_bin_vma_fault() is invoked under mm->mmap_sem.
> It attempts to take the fetch lock and deadlocks.
> 
> This patch does away with protecting of our page list with any
> semaphores, and instead relies on the kernel not close the device
> while mmap is active in a process.
> 
> In addition, we prohibit re-sizing of a buffer while mmap is active.
> This way, when (now unlocked) fault is processed, it works with the
> page that is intended to be mapped-in, and not some other random page.
> Note that this may have an ABI impact, but hopefully no legitimate
> program is this wrong.
> 
> Signed-off-by: Pete Zaitcev <zaitcev@redhat.com>
> Reported-by: syzbot+56f9673bb4cdcbeb0e92@syzkaller.appspotmail.com

Reviewed-by: Alan Stern <stern@rowland.harvard.edu>

Also this should have:

Fixes: 46eb14a6e158 ("USB: fix usbmon BUG trigger")
CC: <stable@vger.kernel.org>

Alan Stern

