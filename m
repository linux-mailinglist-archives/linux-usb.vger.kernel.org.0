Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 13CE54BC97
	for <lists+linux-usb@lfdr.de>; Wed, 19 Jun 2019 17:12:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729903AbfFSPMJ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 19 Jun 2019 11:12:09 -0400
Received: from mx2.suse.de ([195.135.220.15]:59656 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726009AbfFSPMJ (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 19 Jun 2019 11:12:09 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id B407DAF61;
        Wed, 19 Jun 2019 15:12:07 +0000 (UTC)
Message-ID: <1560957124.4587.20.camel@suse.com>
Subject: Re: [PATCH] usb: core: devio: add ioctls for suspend and resume
From:   Oliver Neukum <oneukum@suse.com>
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     Greg KH <gregkh@linuxfoundation.org>,
        Mayuresh Kulkarni <mkulkarni@opensource.cirrus.com>,
        patches@opensource.cirrus.com, linux-usb@vger.kernel.org
Date:   Wed, 19 Jun 2019 17:12:04 +0200
In-Reply-To: <Pine.LNX.4.44L0.1906191024150.1596-100000@iolanthe.rowland.org>
References: <Pine.LNX.4.44L0.1906191024150.1596-100000@iolanthe.rowland.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.26.6 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Am Mittwoch, den 19.06.2019, 10:40 -0400 schrieb Alan Stern:
> On Wed, 19 Jun 2019, Oliver Neukum wrote:

> > It would be easiest to export the usb_autopm_* API to user space.
> 
> But ->suspend and ->resume callbacks are part of that API, and as you 
> say, it is not feasible to have these callbacks run in userspace.

We can notify user space about resume(). There will be a delay, but
there will always be a delay, even in kernel space.

> The only solution I can think of is for the userspace program to first
> set the device's autosuspend delay to 0.  Then whenever the
> WAIT_FOR_RESUME ioctl returns -- even if it returns immediately -- the
> program should assume the suspend is over or is not going to happen.  
> Then the program can run normally for a short while (10 seconds,
> perhaps) before making another attempt to suspend.

That is ugly. Quite ugly actually.

Why actually do we care about suspend()? Would the user space
task do anything else but cease IO? We can do that in usbfs,
assuming we do not care about the order of killing.
User space will learn from an appropriate error code the device
went to power save. And if it does not do IO, why care?
I have never seen a driver that actually saves device state in
suspend().

	Regards
		Oliver

