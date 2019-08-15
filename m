Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 192D98EE58
	for <lists+linux-usb@lfdr.de>; Thu, 15 Aug 2019 16:37:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731703AbfHOOhC (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 15 Aug 2019 10:37:02 -0400
Received: from iolanthe.rowland.org ([192.131.102.54]:57986 "HELO
        iolanthe.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1730084AbfHOOhC (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 15 Aug 2019 10:37:02 -0400
Received: (qmail 2247 invoked by uid 2102); 15 Aug 2019 10:37:01 -0400
Received: from localhost (sendmail-bs@127.0.0.1)
  by localhost with SMTP; 15 Aug 2019 10:37:01 -0400
Date:   Thu, 15 Aug 2019 10:37:01 -0400 (EDT)
From:   Alan Stern <stern@rowland.harvard.edu>
X-X-Sender: stern@iolanthe.rowland.org
To:     Jonathan Bell <jonathan@raspberrypi.org>
cc:     Oliver Neukum <oneukum@suse.com>, <linux-usb@vger.kernel.org>,
        Minas Harutyunyan <hminas@synopsys.com>
Subject: Re: dwc2 / Raspberry Pi - hardware bug for small transfers results
 in memory corruption
In-Reply-To: <CAPHs_JLkWmgvWJPyBdugFPfgPMpyeQL1bQe3VLru4BTf9L+iag@mail.gmail.com>
Message-ID: <Pine.LNX.4.44L0.1908151035260.1664-100000@iolanthe.rowland.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, 15 Aug 2019, Jonathan Bell wrote:

> On Thu, Aug 15, 2019 at 11:55 AM Oliver Neukum <oneukum@suse.com> wrote:
> >
> > Am Mittwoch, den 14.08.2019, 16:59 +0100 schrieb Jonathan Bell:
> > > As reported by one of our users here:
> > > https://github.com/raspberrypi/linux/issues/3148
> > >
> > > There is a bug when the dwc2 core receives USB data packets that are
> > > between 1 and 4 bytes in length - 4 bytes are always written to memory
> > > where the non-packet bytes are garbage.
> >
> > Hi,
> >
> > in which function does that happen? If your buffer cannot handle 4
> > bytes I cannot see how it copes with teh DMA rules.
> >
> In drivers/media/usb/uvc/uvc_ctrl.c:uvc_ctrl_populate_cache() and friends.
> 
> The UVC driver passes in offsets into a struct uvc_control as the
> "buffer" that usb_control_msg() fills.

This sounds like a violation of the DMA rules.  A buffer passed to
usb_control_msg() must be allocated by kmalloc or equivalent, and it
must not share a cache line with any other data values.  Something in
the middle of a larger struct is definitely not kosher.

Alan Stern

