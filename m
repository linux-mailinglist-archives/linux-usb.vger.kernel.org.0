Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7732419C3A9
	for <lists+linux-usb@lfdr.de>; Thu,  2 Apr 2020 16:12:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388148AbgDBOM3 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 2 Apr 2020 10:12:29 -0400
Received: from netrider.rowland.org ([192.131.102.5]:52943 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1728225AbgDBOM3 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 2 Apr 2020 10:12:29 -0400
Received: (qmail 11839 invoked by uid 500); 2 Apr 2020 10:12:28 -0400
Received: from localhost (sendmail-bs@127.0.0.1)
  by localhost with SMTP; 2 Apr 2020 10:12:28 -0400
Date:   Thu, 2 Apr 2020 10:12:28 -0400 (EDT)
From:   Alan Stern <stern@rowland.harvard.edu>
X-X-Sender: stern@netrider.rowland.org
To:     Greg KH <gregkh@linuxfoundation.org>
cc:     massimo <maxcipo1@tin.it>, <linux-usb@vger.kernel.org>
Subject: Re: Usb_power_supply
In-Reply-To: <20200402073942.GA2755501@kroah.com>
Message-ID: <Pine.LNX.4.44L0.2004021010060.9681-100000@netrider.rowland.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, 2 Apr 2020, Greg KH wrote:

> On Thu, Apr 02, 2020 at 09:19:06AM +0200, massimo wrote:
> > I've read the interesting Greg's article about writing USB driver for
> > Linux.
> > I'm interested in a simpler question. Is it possible
> > to write a driver in Ubuntu (19.10) to switch power on or off to a USB
> > port, that' s to say to give or take off the 5 volts power supply  to a
> > USB port (in order for example to switch on or off a simple usb lamp)?
> > Thanks for your attention and courtesy, Massimo.
> > 
> 
> Try the userspace program 'usbreset' that is part of the usbutils
> package, and can be found also here:
> 	https://github.com/gregkh/usbutils/blob/master/usbreset.c

Or you can use the program that was posted here:

	https://marc.info/?l=linux-usb&m=127162615232234&w=2

This program turns power on and off for specific ports, as opposed to
resetting the entire hub.

Alan Stern

> if your hub supports it, this will work.  Note, not all USB hubs support
> this type of behavior, as it is not required by the USB specification.
> 
> hope this helps,

