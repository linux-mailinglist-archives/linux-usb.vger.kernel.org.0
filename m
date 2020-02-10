Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AE150157DD8
	for <lists+linux-usb@lfdr.de>; Mon, 10 Feb 2020 15:53:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728760AbgBJOxg (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 10 Feb 2020 09:53:36 -0500
Received: from netrider.rowland.org ([192.131.102.5]:54153 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1727570AbgBJOxf (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 10 Feb 2020 09:53:35 -0500
Received: (qmail 16190 invoked by uid 500); 10 Feb 2020 09:53:34 -0500
Received: from localhost (sendmail-bs@127.0.0.1)
  by localhost with SMTP; 10 Feb 2020 09:53:34 -0500
Date:   Mon, 10 Feb 2020 09:53:34 -0500 (EST)
From:   Alan Stern <stern@rowland.harvard.edu>
X-X-Sender: stern@netrider.rowland.org
To:     Oliver Neukum <oneukum@suse.de>
cc:     Sam Lewis <sam.vr.lewis@gmail.com>, <linux-usb@vger.kernel.org>
Subject: Re: USB hub driver over-current behavior
In-Reply-To: <1581330569.26936.5.camel@suse.de>
Message-ID: <Pine.LNX.4.44L0.2002100946400.14460-100000@netrider.rowland.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, 10 Feb 2020, Oliver Neukum wrote:

> Am Montag, den 10.02.2020, 17:03 +1100 schrieb Sam Lewis:
> > Hi,
> > 
> > I have a LAN9514 (rebranded SMSC9514) USB hub which has per port
> > over-current protection.
> > 
> > I'm using this hub within my embedded device, and I would like the hub
> > to continue working if any single port experiences an over-current or
> > short condition.
> > 
> > In testing this behavior by shorting out a port, I've noticed that the
> > Linux USB driver continually fights against the protection in the hub
> > and attempts to repower the shorted port.
> > 
> > Looking through the hub driver and tracing the execution flow, as far
> > as I can tell, this is the list of events that seem to be occurring:
> > 
> > 1. I short out a single port
> > 2. The hub (through a power switch) detects the short and disables the port
> > 3. The hub sends an over-current event to the driver
> > 4. The driver gets the event in the `port_event` function
> > 5. The driver then sleeps for 100ms (for 'cool down'?) before powering
> > the port back on
> > 6. Repeat from top, until the short is removed
> 
> Hi,
> 
> error handling at this level has gotten little love.

Indeed.  This is mostly because the issue does not crop up in normal 
usage very often.  And most hubs don't have very good over-current 
protection anyway.

I believe the original expectation was that over-current events would
generally be intermittent and very short-lived.  So when an event did
occur, it would make sense to wait a little while and then try to
switch the port back on.  Nobody ever bothered to implement a total
time or retry limit on this behavior, probably because there weren't
any complaints.

> The basic problem is that we have no good way to switch a portback on
> after we have given up on it. Feel free to propose a patch to the
> kernel and a tool to use it and we can discuss them.

Yes, patches are welcome.

Alan Stern

