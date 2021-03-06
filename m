Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CEC2432FC3D
	for <lists+linux-usb@lfdr.de>; Sat,  6 Mar 2021 18:21:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230449AbhCFRUd (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 6 Mar 2021 12:20:33 -0500
Received: from netrider.rowland.org ([192.131.102.5]:48579 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S231256AbhCFRUO (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 6 Mar 2021 12:20:14 -0500
Received: (qmail 76022 invoked by uid 1000); 6 Mar 2021 12:20:13 -0500
Date:   Sat, 6 Mar 2021 12:20:13 -0500
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     Aaron Dewes <aaron.dewes@web.de>, linux-usb@vger.kernel.org
Subject: Re: A question about UAS
Message-ID: <20210306172013.GE74411@rowland.harvard.edu>
References: <2ad0d2f9-0ef1-05b5-76db-b178107bfccb@web.de>
 <YEO1t63SQw1Ui4ce@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YEO1t63SQw1Ui4ce@kroah.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sat, Mar 06, 2021 at 06:02:47PM +0100, Greg KH wrote:
> On Sat, Mar 06, 2021 at 05:34:32PM +0100, Aaron Dewes wrote:
> > Hello!
> > 
> > Sorry if this suggestion/question sounds stupid, I don't have experience
> > with the kernel code and this mailing list.
> > 
> > I'm a contributor to Umbrel (getumbrel.com), and we provide a software
> > that allows to run a bitcoin node easily, and we've run into many people
> > having UAS issues
> 
> What specific UAS issues?  And why not just fix those instead?

Indeed.  It's always better to fix a problem than to cover it up.

> > , and we were manually adding quirks in this case. Now
> > I'm wondering if it is possible to disable UAS for all devices in the
> > kernel cmdline.
> 
> Sure, just blacklist the uas kernel module, that prevents it from being
> loaded and hopefully the device will degrade to the
> old-school-and-dirt-slow usb-storage protocol.

In fact it won't.  The usb-storage driver will see that the device can 
be managed by the uas driver, so it won't bind.  Then nothing will 
manage the device.

You actually have to turn off CONFIG_USB_UAS when the kernel is built.

Alan Stern
