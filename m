Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 542D82ADAFD
	for <lists+linux-usb@lfdr.de>; Tue, 10 Nov 2020 16:56:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730819AbgKJP4w (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 10 Nov 2020 10:56:52 -0500
Received: from netrider.rowland.org ([192.131.102.5]:48703 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1730299AbgKJP4w (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 10 Nov 2020 10:56:52 -0500
Received: (qmail 193217 invoked by uid 1000); 10 Nov 2020 10:56:50 -0500
Date:   Tue, 10 Nov 2020 10:56:50 -0500
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Kyungtae Kim <kt0755@gmail.com>
Cc:     Felipe Balbi <balbi@kernel.org>,
        Greg KH <gregkh@linuxfoundation.org>,
        USB list <linux-usb@vger.kernel.org>,
        syzkaller <syzkaller@googlegroups.com>
Subject: Re: WARNING in usb_composite_setup_continue
Message-ID: <20201110155650.GC190146@rowland.harvard.edu>
References: <CAEAjamsxe9OuMVpHfox3w57HtGsE3mPXOty9bdXW-iPdx=TXMA@mail.gmail.com>
 <CAEAjamsjFXWGSwUcCuUOeJ8s9EWGQP-Jvt40bG0Otav=xFb+5A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAEAjamsjFXWGSwUcCuUOeJ8s9EWGQP-Jvt40bG0Otav=xFb+5A@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Felipe:

On Mon, Nov 09, 2020 at 02:29:42PM -0500, Kyungtae Kim wrote:
> We report a bug (in linux-5.8.13) found by FuzzUSB (a modified version
> of syzkaller).
> 
> (corrected analysis)
> This bug happens while continuing a delayed setup message in mass
> storage gadget.
> To be specific, composite_setup() sets FSG_STATE_CONFIG_CHANGE via
> fsg_set_alt() (line 1793),
> and followed by cdev->delayed_status++ (line 1798).
> Meanwile, the mass gadget tries  check cdev->delayed_status == 0
> through handle_exception() (line 2428),
> which occurs in between the two operations above.
> Such a race causes invalid operations eventually.

Do you know who maintains composite.c (or the composite framework) these 
days?  This is a real race, and it needs to be fixed.

Part of the problem seems to be that cdev->delayed_status is sometimes 
accessed without the protection of cdev->lock.  But I don't know when it 
is safe to take that lock, so I can't tell what changes to make.

Another part of the problem is that cdev->delayed_status doesn't count 
things properly.  That is, its value is incremented each time a function 
driver asks for a delayed status and decremented each time a function 
driver calls usb_composite_setup_continue(), and the delayed status 
response is sent when the value reaches 0.  But there's nothing to stop 
this from happening (imagine a gadget with two functions A and B):

	Function driver A asks for delayed status;
	Function driver A calls setup_continue(): Now the value
		of the counter is 0 so a status message is queued
		too early;
	Function driver B asks for delayed status;
	Function driver B calls setup_continue(): Now a second
		status message is queued.

I'm willing to help fix these issues, but I need assistance from someone 
who fully understands the composite framework.

Alan Stern
