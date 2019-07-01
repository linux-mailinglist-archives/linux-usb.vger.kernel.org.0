Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 82B615BDEB
	for <lists+linux-usb@lfdr.de>; Mon,  1 Jul 2019 16:17:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729484AbfGAORJ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 1 Jul 2019 10:17:09 -0400
Received: from iolanthe.rowland.org ([192.131.102.54]:51310 "HELO
        iolanthe.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1727185AbfGAORI (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 1 Jul 2019 10:17:08 -0400
Received: (qmail 1620 invoked by uid 2102); 1 Jul 2019 10:17:07 -0400
Received: from localhost (sendmail-bs@127.0.0.1)
  by localhost with SMTP; 1 Jul 2019 10:17:07 -0400
Date:   Mon, 1 Jul 2019 10:17:07 -0400 (EDT)
From:   Alan Stern <stern@rowland.harvard.edu>
X-X-Sender: stern@iolanthe.rowland.org
To:     Oliver Neukum <oneukum@suse.com>
cc:     Mayuresh Kulkarni <mkulkarni@opensource.cirrus.com>,
        Greg KH <gregkh@linuxfoundation.org>,
        <patches@opensource.cirrus.com>,
        USB list <linux-usb@vger.kernel.org>
Subject: Re: [PATCH] usb: core: devio: add ioctls for suspend and resume
In-Reply-To: <1561972691.10014.8.camel@suse.com>
Message-ID: <Pine.LNX.4.44L0.1907011015120.1536-100000@iolanthe.rowland.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, 1 Jul 2019, Oliver Neukum wrote:

> Am Donnerstag, den 27.06.2019, 09:52 -0400 schrieb Alan Stern:
> 
> > 
> > Or maybe the WAIT_FOR_RESUME ioctl returns because there was a remote 
> > wakeup.  In this case also you would call FORBID_SUSPEND.
> > 
> > In fact, you should call FORBID_SUSPEND _whenever_ WAIT_FOR_RESUME
> 
> Well, this kind of indicates that the original syscall should bump
> the counter.

Perhaps it does, but...

> > returns, unless your program has decided not to use the device any more
> > (in which case you don't care whether the device is suspended or
> > resumed).
> 
> Then you should close the device.

Exactly.  Suppose WAIT_FOR_RESUME is interrupted and then the program
closes the device.  There's no need to force the device back to full 
power in this situation.

Alan Stern

