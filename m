Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0ECDE5CCB7
	for <lists+linux-usb@lfdr.de>; Tue,  2 Jul 2019 11:35:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726963AbfGBJfp (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 2 Jul 2019 05:35:45 -0400
Received: from mx2.suse.de ([195.135.220.15]:52504 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726861AbfGBJfo (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 2 Jul 2019 05:35:44 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id C3F08AC9B;
        Tue,  2 Jul 2019 09:35:43 +0000 (UTC)
Message-ID: <1562059312.5819.11.camel@suse.com>
Subject: Re: [PATCH] usb: core: devio: add ioctls for suspend and resume
From:   Oliver Neukum <oneukum@suse.com>
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     Greg KH <gregkh@linuxfoundation.org>,
        Mayuresh Kulkarni <mkulkarni@opensource.cirrus.com>,
        patches@opensource.cirrus.com, USB list <linux-usb@vger.kernel.org>
Date:   Tue, 02 Jul 2019 11:21:52 +0200
In-Reply-To: <Pine.LNX.4.44L0.1907011015120.1536-100000@iolanthe.rowland.org>
References: <Pine.LNX.4.44L0.1907011015120.1536-100000@iolanthe.rowland.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.26.6 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Am Montag, den 01.07.2019, 10:17 -0400 schrieb Alan Stern:
> On Mon, 1 Jul 2019, Oliver Neukum wrote:
> 
> > Am Donnerstag, den 27.06.2019, 09:52 -0400 schrieb Alan Stern:
> > 
> > > 
> > > Or maybe the WAIT_FOR_RESUME ioctl returns because there was a remote 
> > > wakeup.  In this case also you would call FORBID_SUSPEND.
> > > 
> > > In fact, you should call FORBID_SUSPEND _whenever_ WAIT_FOR_RESUME
> > 
> > Well, this kind of indicates that the original syscall should bump
> > the counter.
> 
> Perhaps it does, but...
> 
> > > returns, unless your program has decided not to use the device any more
> > > (in which case you don't care whether the device is suspended or
> > > resumed).
> > 
> > Then you should close the device.
> 
> Exactly.  Suppose WAIT_FOR_RESUME is interrupted and then the program
> closes the device.  There's no need to force the device back to full 
> power in this situation.

But that is the error case. You return an error code. The point of that
is to report that a syscall did not have all requested effects.

	Regards
		Oliver

