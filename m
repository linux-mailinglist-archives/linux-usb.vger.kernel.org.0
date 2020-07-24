Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5B8CE22C18C
	for <lists+linux-usb@lfdr.de>; Fri, 24 Jul 2020 10:59:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727871AbgGXI73 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 24 Jul 2020 04:59:29 -0400
Received: from relay12.mail.gandi.net ([217.70.178.232]:36789 "EHLO
        relay12.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726753AbgGXI73 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 24 Jul 2020 04:59:29 -0400
Received: from classic (lns-bzn-39-82-255-60-242.adsl.proxad.net [82.255.60.242])
        (Authenticated sender: hadess@hadess.net)
        by relay12.mail.gandi.net (Postfix) with ESMTPSA id 0D280200012;
        Fri, 24 Jul 2020 08:59:26 +0000 (UTC)
Message-ID: <3fb6c6616182384c7a2ab4228586306e6d6ad961.camel@hadess.net>
Subject: Re: [PATCH v3] USB: Fix device driver race
From:   Bastien Nocera <hadess@hadess.net>
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     linux-usb@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Date:   Fri, 24 Jul 2020 10:59:26 +0200
In-Reply-To: <20200723215830.GB1370343@rowland.harvard.edu>
References: <a3cd9c51f215be37ac9bb44083ab8b3280f9359f.camel@hadess.net>
         <20200723215830.GB1370343@rowland.harvard.edu>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.3 (3.36.3-1.fc32) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, 2020-07-23 at 17:58 -0400, Alan Stern wrote:
> On Thu, Jul 23, 2020 at 11:30:39PM +0200, Bastien Nocera wrote:
> > When a new device with a specialised device driver is plugged in,
> > the
> > new driver will be modprobe()'d but the driver core will attach the
> > "generic" driver to the device.
> > 
> > After that, nothing will trigger a reprobe when the modprobe()'d
> > device
> > driver has finished initialising, as the device has the "generic"
> > driver attached to it.
> > 
> > Trigger a reprobe ourselves when new specialised drivers get
> > registered.
> > 
> > Fixes: 88b7381a939d
> > Signed-off-by: Bastien Nocera <hadess@hadess.net>
> 
> Better than before, but there are still some things to improve.

That's kind of you to say, but it was really incredibly sloppy. I've
sent a v4 that only runs the reprobe on device that could be attached
to the new driver.

It was closer to an early version I made locally and didn't work
because I forgot that ->id_table could also be used for matching, and
because I was only running it when ->match was present, the reprobe was
never actually run...

This should all be fixed now.

Cheers

