Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2887DDF482
	for <lists+linux-usb@lfdr.de>; Mon, 21 Oct 2019 19:48:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727110AbfJURsF (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 21 Oct 2019 13:48:05 -0400
Received: from iolanthe.rowland.org ([192.131.102.54]:52480 "HELO
        iolanthe.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1726672AbfJURsF (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 21 Oct 2019 13:48:05 -0400
Received: (qmail 6668 invoked by uid 2102); 21 Oct 2019 13:48:04 -0400
Received: from localhost (sendmail-bs@127.0.0.1)
  by localhost with SMTP; 21 Oct 2019 13:48:04 -0400
Date:   Mon, 21 Oct 2019 13:48:04 -0400 (EDT)
From:   Alan Stern <stern@rowland.harvard.edu>
X-X-Sender: stern@iolanthe.rowland.org
To:     Harald Dunkel <harri@afaics.de>
cc:     USB list <linux-usb@vger.kernel.org>
Subject: Re: 5.3.6: I/O error on writing SD card via USB3
In-Reply-To: <2fe6fc2e-d1da-8e74-221b-e750509832ef@afaics.de>
Message-ID: <Pine.LNX.4.44L0.1910211339170.1673-100000@iolanthe.rowland.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, 21 Oct 2019, Harald Dunkel wrote:

> Hi Alan,
> 
> On 10/19/19 4:57 PM, Alan Stern wrote:
> > 
> > What happens if you don't use that rather slow 133x SD card?  Do other
> > cards work better?
> > 
> 
> No problem with a 32 GByte SDHC card (U1).
> 
> > Another possibility: If you attach the card adapter by a USB-2 cable
> > then it will run as a USB-2 device (even when plugged into a USB-3
> > port).  That probably would help -- although it would also slow down
> > the data transfers.  Although, come to think of it, slowing down the
> > transfer rate may be just what this card needs...
> > 
> 
> The USB2 cable worked, too. Actually I had expected that the speed is
> reduced automatically according to the specs of the card. ???

That is doubtful.  The speed of the connection is determined when the
connection is first set up.  Unless the reader disconnects itself from 
the USB bus when a card is removed and reconnects when a card is 
inserted, the speed can't change.

You can see what the current connection speed is (in units of millions
of bits per second) by looking in sysfs.  For example:

	cat /sys/bus/usb/devices/2-10/speed

(or maybe 2-5 instead of 2-10; both paths appeared in the kernel log 
you posted earlier).

At any rate, it sounds like the 133x card is just too slow to keep up.

Alan Stern

