Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7EA64191088
	for <lists+linux-usb@lfdr.de>; Tue, 24 Mar 2020 14:31:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728630AbgCXN31 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 24 Mar 2020 09:29:27 -0400
Received: from netrider.rowland.org ([192.131.102.5]:51077 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1727578AbgCXN30 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 24 Mar 2020 09:29:26 -0400
Received: (qmail 6089 invoked by uid 500); 24 Mar 2020 09:29:25 -0400
Received: from localhost (sendmail-bs@127.0.0.1)
  by localhost with SMTP; 24 Mar 2020 09:29:25 -0400
Date:   Tue, 24 Mar 2020 09:29:25 -0400 (EDT)
From:   Alan Stern <stern@rowland.harvard.edu>
X-X-Sender: stern@netrider.rowland.org
To:     Oliver Neukum <oneukum@suse.com>
cc:     Kyungtae Kim <kt0755@gmail.com>, <linux-usb@vger.kernel.org>
Subject: Re: Fwd: BUG: KASAN: use-after-free in usb_hcd_unlink_urb+0x5f/0x170
 drivers/usb/core/hcd.c
In-Reply-To: <1585046753.7151.18.camel@suse.com>
Message-ID: <Pine.LNX.4.44L0.2003240928240.4640-100000@netrider.rowland.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, 24 Mar 2020, Oliver Neukum wrote:

> Am Montag, den 23.03.2020, 02:18 -0400 schrieb Kyungtae Kim:
> > We report a bug (in linux-5.5.11) found by FuzzUSB (a modified version
> > of syzkaller)
> 
> Hi,
> 
> thank you for the report. Is this a reproducible bug?
> 
> > In function usb_hcd_unlink_urb (driver/usb/core/hcd.c:1607), it tries to
> > read "urb->use_count". But it seems the instance "urb" was
> > already freed (right after urb->dev at line 1597) by the function "urb_destroy"
> > in a different thread, which caused memory access violation.
> 
> Yes.
> 
> > To solve, it may need to check if urb is valid before urb->use_count,
> > to avoid such freed memory access.
> 
> Difficult to do as the URB itself would be invalid.
> 
> I am afraid there is a race in here:
> 
> 
>         if (test_bit(US_FLIDX_ABORTING, &us->dflags)) {
>                 /* cancel the request, if it hasn't been cancelled already */
>                 if (test_and_clear_bit(US_FLIDX_SG_ACTIVE, &us->dflags)) {
>                         usb_stor_dbg(us, "-- cancelling sg request\n");
>                         usb_sg_cancel(&us->current_sg);
>                 }
>         }
> 
>         /* wait for the completion of the transfer */
>         usb_sg_wait(&us->current_sg);
>         clear_bit(US_FLIDX_SG_ACTIVE, &us->dflags);
> 
> 
> What keeps the request alive while usb_sg_wait() is running?

It's a bug in the SG library code.  I'll post a patch later on, 
although it's not clear whether anyone will be able to test it 
properly.

Alan Stern

