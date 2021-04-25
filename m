Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 68F0C36A7D4
	for <lists+linux-usb@lfdr.de>; Sun, 25 Apr 2021 16:45:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230244AbhDYOqM (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 25 Apr 2021 10:46:12 -0400
Received: from netrider.rowland.org ([192.131.102.5]:60147 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S230239AbhDYOqM (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 25 Apr 2021 10:46:12 -0400
Received: (qmail 337007 invoked by uid 1000); 25 Apr 2021 10:45:31 -0400
Date:   Sun, 25 Apr 2021 10:45:31 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Rene Rebe <rene@exactcode.com>
Cc:     gregkh@linuxfoundation.org, hdegoede@redhat.com,
        linux-usb@vger.kernel.org, usb-storage@lists.one-eyed-alien.net
Subject: Re: [PATCH] unbreak all modern Seagate ATA pass-through for SMART
Message-ID: <20210425144531.GA336783@rowland.harvard.edu>
References: <ee48ea5d-c820-ae24-b557-2a7b7372821c@redhat.com>
 <20210425.135048.1651130854722875318.rene@exactcode.com>
 <YIVZ2l9qUfkcyPpG@kroah.com>
 <20210425.141536.1295354861910527121.rene@exactcode.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210425.141536.1295354861910527121.rene@exactcode.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sun, Apr 25, 2021 at 02:15:36PM +0200, Rene Rebe wrote:
> From: Greg KH <gregkh@linuxfoundation.org>
> Subject: Re: [PATCH] unbreak all modern Seagate ATA pass-through for SMART
> Date: Sun, 25 Apr 2021 14:00:26 +0200
> 
> > > I would expect that more modern devices to work. Vendors usually
> > > linearly allocate their product ids for new devices, and we could
> > > allow list product ids higher than this Seven to unbreak more modern
> > > devices by default and limit the amount of device quirks needed?
> > 
> > Vendors do not allocate device ids that way at all, as there is no
> > requirement to do so.  I know of many vendors that seemingly use random
> > values from their product id space, so there is no guarantee that this
> > will work, sorry.
> 
> I did not say it is a requirement, just that they usually do speaking
> of just this Seagate case. What is wrong with using that to
> potentially significantly cut down the quirk list?

You didn't read commit 92335ad9e895, did you?  It lists a large number 
of Seagate devices that don't work with ATA pass-through, and three of 
them have product IDs that are larger than 0xab03.

Please check the facts before guessing about things that will cause 
problems for other people.

> > What is wrong with just allowing specific devices that you have tested
> > will work, to the list instead?  That's the safest way to handle this.
> 
> The problem is that out of the box it does not work for users, and
> normal users do not dive into the kernel code to find out and simply
> think their devices sucks. Even I for years thought the drive sucks,
> before I took a closer look. If you long term want more new devices in
> an allow list than the previous quirk list included (9 or 10 does not
> sound that many to me), ... whatever you prefer ,-) I would rather
> have 10 quirk disable list than potential many more white listed the
> next years to come. Maybe we shoudl simply restore the prevoius
> quirks.

That's a possibility, and in the future we may do it.  But probably not 
until the enable list grows to a comparable length.

Alan Stern
