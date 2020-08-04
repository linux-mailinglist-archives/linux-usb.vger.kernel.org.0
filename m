Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DA53F23B9C4
	for <lists+linux-usb@lfdr.de>; Tue,  4 Aug 2020 13:41:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728902AbgHDLl2 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 4 Aug 2020 07:41:28 -0400
Received: from relay5-d.mail.gandi.net ([217.70.183.197]:52083 "EHLO
        relay5-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728675AbgHDLl2 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 4 Aug 2020 07:41:28 -0400
X-Originating-IP: 82.255.60.242
Received: from classic (lns-bzn-39-82-255-60-242.adsl.proxad.net [82.255.60.242])
        (Authenticated sender: hadess@hadess.net)
        by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id 5ADE41C000B;
        Tue,  4 Aug 2020 11:41:26 +0000 (UTC)
Message-ID: <8f1de4cc2813f0a8721a2f76421956056c0c6278.camel@hadess.net>
Subject: Re: [PATCH v6 3/3] USB: Fix device driver race
From:   Bastien Nocera <hadess@hadess.net>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org, Alan Stern <stern@rowland.harvard.edu>
Date:   Tue, 04 Aug 2020 13:41:25 +0200
In-Reply-To: <20200803153804.GA1172014@kroah.com>
References: <20200727104644.149873-1-hadess@hadess.net>
         <20200727104644.149873-3-hadess@hadess.net>
         <64c8caa8ee054ed9106683f15238b2be74f77aa2.camel@hadess.net>
         <20200803153804.GA1172014@kroah.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.3 (3.36.3-1.fc32) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, 2020-08-03 at 17:38 +0200, Greg Kroah-Hartman wrote:
> On Mon, Aug 03, 2020 at 05:04:46PM +0200, Bastien Nocera wrote:
> > On Mon, 2020-07-27 at 12:46 +0200, Bastien Nocera wrote:
> > > When a new device with a specialised device driver is plugged in,
> > > the
> > > new driver will be modprobe()'d but the driver core will attach
> > > the
> > > "generic" driver to the device.
> > > 
> > > After that, nothing will trigger a reprobe when the modprobe()'d
> > > device
> > > driver has finished initialising, as the device has the "generic"
> > > driver attached to it.
> > > 
> > > Trigger a reprobe ourselves when new specialised drivers get
> > > registered.
> > > 
> > > Fixes: 88b7381a939d ("USB: Select better matching USB drivers
> > > when
> > > available")
> > > Signed-off-by: Bastien Nocera <hadess@hadess.net>
> > 
> > Greg, Alan, are you happy with this iteration?
> > 
> > If so, I can send it again with Alan's acks, along with a fix for
> > the
> > function name Alan mentioned. I see that the first patch in the
> > list
> > landed in usb-next already.
> > 
> 
> Yes, please resend the remaining patches.  I don't recall seeing
> Alan's
> ack on it.

Resent as v7. There's a new patch in the lot, based on a comment by
Alan in this thread which I thought appropriate to include.

Cheers

