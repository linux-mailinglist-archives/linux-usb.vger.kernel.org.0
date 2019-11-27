Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 57E7210B1DE
	for <lists+linux-usb@lfdr.de>; Wed, 27 Nov 2019 16:07:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726987AbfK0PHN (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 27 Nov 2019 10:07:13 -0500
Received: from iolanthe.rowland.org ([192.131.102.54]:56026 "HELO
        iolanthe.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1726514AbfK0PHN (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 27 Nov 2019 10:07:13 -0500
Received: (qmail 1537 invoked by uid 2102); 27 Nov 2019 10:07:11 -0500
Received: from localhost (sendmail-bs@127.0.0.1)
  by localhost with SMTP; 27 Nov 2019 10:07:11 -0500
Date:   Wed, 27 Nov 2019 10:07:11 -0500 (EST)
From:   Alan Stern <stern@rowland.harvard.edu>
X-X-Sender: stern@iolanthe.rowland.org
To:     Pete Zaitcev <zaitcev@redhat.com>
cc:     Greg KH <greg@kroah.com>, USB list <linux-usb@vger.kernel.org>
Subject: Re: [PATCH] usb: mon: Fix a deadlock in usbmon between mmap and read
In-Reply-To: <20191126223509.69fb61ed@suzdal.zaitcev.lan>
Message-ID: <Pine.LNX.4.44L0.1911271004190.1484-100000@iolanthe.rowland.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, 26 Nov 2019, Pete Zaitcev wrote:

> On Tue, 26 Nov 2019 10:20:14 -0500 (EST)
> Alan Stern <stern@rowland.harvard.edu> wrote:
> 
> > > Signed-off-by: Pete Zaitcev <zaitcev@redhat.com>
> > > Reported-by: syzbot+56f9673bb4cdcbeb0e92@syzkaller.appspotmail.com  
> > 
> > Reviewed-by: Alan Stern <stern@rowland.harvard.edu>
> 
> Thanks.
> 
> > Fixes: 46eb14a6e158 ("USB: fix usbmon BUG trigger")
> 
> Indeed... Either I didn't think that one through, or the copy_to_user
> used not to take the mmap_sem.

copy_to_user doesn't, but the fault handler does (the core handler, not
the fault routine in mon_bin.c).  After all, it doesn't want the memory
map to change while a page is being read in to satisfy the fault.

Alan Stern

