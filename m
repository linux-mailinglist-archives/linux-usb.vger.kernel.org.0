Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B2DF83FB9D6
	for <lists+linux-usb@lfdr.de>; Mon, 30 Aug 2021 18:09:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237571AbhH3QKJ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 30 Aug 2021 12:10:09 -0400
Received: from netrider.rowland.org ([192.131.102.5]:53405 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S231181AbhH3QKJ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 30 Aug 2021 12:10:09 -0400
Received: (qmail 336991 invoked by uid 1000); 30 Aug 2021 12:09:14 -0400
Date:   Mon, 30 Aug 2021 12:09:14 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Oliver Neukum <oneukum@suse.com>
Cc:     Johan Hovold <johan@kernel.org>, Greg KH <greg@kroah.com>,
        syzbot <syzbot+ada0f7d3d9fd2016d927@syzkaller.appspotmail.com>,
        syzkaller-bugs@googlegroups.com,
        USB mailing list <linux-usb@vger.kernel.org>
Subject: Re: [PATCH] USB: core: Make usb_start_wait_urb() interruptible
Message-ID: <20210830160914.GC332514@rowland.harvard.edu>
References: <20210828180358.GA291431@rowland.harvard.edu>
 <0000000000000f37f405caa41e79@google.com>
 <20210829015825.GA297712@rowland.harvard.edu>
 <YSyPQqMPHRiUvYEx@hovoldconsulting.com>
 <20210830144613.GA332514@rowland.harvard.edu>
 <0e3214c8-a82f-d117-962e-326817244c9a@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0e3214c8-a82f-d117-962e-326817244c9a@suse.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Aug 30, 2021 at 05:11:53PM +0200, Oliver Neukum wrote:
> 
> On 30.08.21 16:46, Alan Stern wrote:
> > Do you have alternative suggestions?  I don't think we want special 
> > interruptible versions of usb_control_msg() and usb_bulk_msg() just for 
> > use by usbfs.
> 
> Hi,
> 
> why not just pass a flag?

We could.  But you're ignoring the question I asked earlier in that 
email: Is a 5-second uninterruptible delay (the default USB control 
timeout) acceptable in general?

Alan Stern
