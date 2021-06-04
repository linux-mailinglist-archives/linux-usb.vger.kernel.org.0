Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CFB7939BC20
	for <lists+linux-usb@lfdr.de>; Fri,  4 Jun 2021 17:42:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230034AbhFDPnw (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 4 Jun 2021 11:43:52 -0400
Received: from mail.kernel.org ([198.145.29.99]:38734 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229864AbhFDPnv (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 4 Jun 2021 11:43:51 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 33663613D8;
        Fri,  4 Jun 2021 15:42:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622821325;
        bh=AIJXE2B3YlISAZlGFNaZeM3VqVQHqhxH/p7d5kS42mY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=L2/wb1Oo8aXi3frXjSz8tRO67d8WkE9zB4DuaIgy9jB09qqDDoUuPHouAw6B/CQzU
         WjcVyiNFbDD1kgK9/eP9SijrEbb3qKxxMYRskmVv/g0wRxybV1W+Aj2BfpUhkBw1VB
         3MAl38Ic4j22OhQ6opvnBpn1SQI/aqTybWspq01vhMr2x75P0jbqDtV0B7OAT+EVxc
         yRWd0Sc/zYaVL9j4Pke7GvA/1w48xEgV18EK8UlKeR3CtUoW/H/VNP8cZN9CnGIuUv
         mYFjQN5MbA5Wo87YvQV7G4beFsseyZQdDaBHKYjqWrvludyN/BQFg4x1yDFxK3ekv8
         mjK0JBWsi5DaQ==
Received: from johan by xi.lan with local (Exim 4.94.2)
        (envelope-from <johan@kernel.org>)
        id 1lpBxV-0005qr-24; Fri, 04 Jun 2021 17:42:05 +0200
Date:   Fri, 4 Jun 2021 17:42:05 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Alex =?utf-8?B?VmlsbGFjw61z?= Lasso <a_villacis@palosanto.com>
Cc:     linux-usb@vger.kernel.org, David Frey <dpfrey@gmail.com>,
        Pho Tran <pho.tran@silabs.com>,
        Tung Pham <tung.pham@silabs.com>, Hung.Nguyen@silabs.com
Subject: Re: cp210x module broken in 5.12.5 and 5.12.6, works in 5.11.21
 (with bisection)
Message-ID: <YLpJzTmAnfsrE7UP@hovoldconsulting.com>
References: <465ef3ac-4291-6392-e52b-26cc0c34dd7c@palosanto.com>
 <YLXmrmW9/fB1WbzR@hovoldconsulting.com>
 <2881bd97-f790-c4d6-aed6-de9ab8cd1a9e@palosanto.com>
 <YLZVAmYxFZ1Q/nrH@hovoldconsulting.com>
 <60705932-860a-701c-1019-16f9e16c39dd@palosanto.com>
 <YLeapcNbvExeGKuE@hovoldconsulting.com>
 <cb99a25e-5758-051c-afb6-29d8ef26ee0b@palosanto.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cb99a25e-5758-051c-afb6-29d8ef26ee0b@palosanto.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

[ +CC: the Silabs team and David who reported the same issue ]

Quick summary: Some CP2102N devices cannot use SET_MHS when ulXonLimit
and ulXoffLimit are set to 128/128 even when auto-RTS is disabled.
Leaving the default limits at 0/0 seems to work.

Tung, Hung and Pho, do you have some idea of what might be going on
here?

The full thread is here:

	https://lore.kernel.org/r/465ef3ac-4291-6392-e52b-26cc0c34dd7c@palosanto.com	
On Wed, Jun 02, 2021 at 10:54:14AM -0500, Alex Villacís Lasso wrote:
> El 2/6/21 a las 09:50, Johan Hovold escribió:

> > This may be a little far-fetched but can you send me the logs (debugging
> > again enabled) from when:
> >
> > 	1. plugging the device in
> > 	2. stty -F /dev/ttyUSB0 ixon ixoff
> > 	3. stty -F /dev/ttyUSB0 crtscts -ixon -ixoff
> > 	4. cat /dev/ttyUSB0	# + CTRL-C
> >
> > No need to run the terminal program.
> >
> > If you could also apply the below debugging patch (on top of the
> > previous one) which will dump some device settings during probe before
> > doing the above that would be great.
> >
> > Hopefully this will gives some more clues but otherwise I'll probably
> > just leave the default IXOFF limits for CP2102N to fix the regression.

> >  From 65b53f408b5d6b6408420ed9d1c827f80401796e Mon Sep 17 00:00:00 2001
> > From: Johan Hovold <johan@kernel.org>
> > Date: Wed, 2 Jun 2021 16:23:21 +0200
> > Subject: [PATCH] USB: serial: cp210x: dump communication properties

> Tests with *both* patches applied:

Thanks again for running the new tests.

> <device plugged in>

> jun 02 10:44:29 karlalex-asus kernel: usb 1-9: New USB device found, 
> idVendor=10c4, idProduct=ea60, bcdDevice= 1.00

> jun 02 10:44:29 karlalex-asus kernel: cp210x ttyUSB0: wLength = 66
> jun 02 10:44:29 karlalex-asus kernel: cp210x ttyUSB0: ulMaxTxQueue = 640
> jun 02 10:44:29 karlalex-asus kernel: cp210x ttyUSB0: ulMaxRxQueue = 640
> jun 02 10:44:29 karlalex-asus kernel: cp210x ttyUSB0: ulProvSubType = 1
> jun 02 10:44:29 karlalex-asus kernel: cp210x ttyUSB0: ulProvCapabilities 
> = 0x13f
> jun 02 10:44:29 karlalex-asus kernel: cp210x ttyUSB0: ulSettableParams = 
> 0x7f
> jun 02 10:44:29 karlalex-asus kernel: cp210x ttyUSB0: ulCurrentTx-Queue 
> = 640
> jun 02 10:44:29 karlalex-asus kernel: cp210x ttyUSB0: ulCurrentRx-Queue 
> = 640

This all matches the CP2102N I've got here and which can set RTS just
fine also with the IXOFF limits set (unlike your device).

Unless there's some other configuration setting causing it would seem
your device firmware is just buggy (and bcdDevice was not updated when
it was fixed, which seems unlikely).

> $ stty -F /dev/ttyUSB0 ixon ixoff
> 
> jun 02 10:45:40 karlalex-asus kernel: cp210x ttyUSB0: 
> cp210x_change_speed - setting baud rate to 9600
> jun 02 10:45:40 karlalex-asus kernel: cp210x ttyUSB0: 
> cp210x_set_flow_control - ctrl = 0x00, flow = 0x00
> jun 02 10:45:40 karlalex-asus kernel: cp210x ttyUSB0: 
> cp210x_set_flow_control - xon_limit = 0, xoff_limit = 0
> jun 02 10:45:40 karlalex-asus kernel: cp210x ttyUSB0: 
> cp210x_set_flow_control - ctrl = 0x00, flow = 0x01
> jun 02 10:45:40 karlalex-asus kernel: cp210x ttyUSB0: 
> cp210x_tiocmset_port - control = 0x0303
> jun 02 10:45:40 karlalex-asus kernel: cp210x ttyUSB0: failed set request 
> 0x7 status: -32
> jun 02 10:45:40 karlalex-asus kernel: cp210x ttyUSB0: 
> cp210x_set_flow_control - ctrl = 0x00, flow = 0x01
> jun 02 10:45:40 karlalex-asus kernel: cp210x ttyUSB0: 
> cp210x_set_flow_control - xon_limit = 128, xoff_limit = 128
> jun 02 10:45:40 karlalex-asus kernel: cp210x ttyUSB0: 
> cp210x_set_flow_control - ctrl = 0x01, flow = 0x43

Here IXOFF is enabled.

> jun 02 10:45:40 karlalex-asus kernel: cp210x ttyUSB0: 
> cp210x_tiocmset_port - control = 0x0300
> jun 02 10:45:40 karlalex-asus kernel: cp210x ttyUSB0: failed set request 
> 0x7 status: -32

And setting the IXOFF limits only when software flow control is enabled
would not work either.
 
> $ stty -F /dev/ttyUSB0 crtscts -ixon -ixoff
> 
> jun 02 10:46:41 karlalex-asus kernel: cp210x ttyUSB0: 
> cp210x_change_speed - setting baud rate to 9600
> jun 02 10:46:41 karlalex-asus kernel: cp210x ttyUSB0: 
> cp210x_set_flow_control - ctrl = 0x01, flow = 0x43
> jun 02 10:46:41 karlalex-asus kernel: cp210x ttyUSB0: 
> cp210x_set_flow_control - xon_limit = 128, xoff_limit = 128
> jun 02 10:46:41 karlalex-asus kernel: cp210x ttyUSB0: 
> cp210x_set_flow_control - ctrl = 0x00, flow = 0x03
> jun 02 10:46:41 karlalex-asus kernel: cp210x ttyUSB0: 
> cp210x_tiocmset_port - control = 0x0303
> jun 02 10:46:41 karlalex-asus kernel: cp210x ttyUSB0: failed set request 
> 0x7 status: -32
> jun 02 10:46:41 karlalex-asus kernel: cp210x ttyUSB0: 
> cp210x_set_flow_control - ctrl = 0x00, flow = 0x03
> jun 02 10:46:41 karlalex-asus kernel: cp210x ttyUSB0: 
> cp210x_set_flow_control - xon_limit = 128, xoff_limit = 128
> jun 02 10:46:41 karlalex-asus kernel: cp210x ttyUSB0: 
> cp210x_set_flow_control - ctrl = 0x09, flow = 0x80

Here hardware flow control is enabled.

> jun 02 10:46:41 karlalex-asus kernel: cp210x ttyUSB0: 
> cp210x_tiocmset_port - ctrl = 0x08, flow = 0x00

And then RTS can still be changed using the SET_FLOW command.

I just ran a quick test here and and leaving the ixoff_limit at zero
essentially breaks software flow control since XOFF will be sent when
there are only 7 characters in the receive buffer.

Since software flow control support was only recently added, we may have
to accept that for CP2102N to fix the regression, but I'd really like to
understand why your devices behave the way they do first and see if
there's some other way to work around this.

Hopefully Silabs can provide some insight.

Also, could you try setting those limits to some other values and see if
the SET_MHS (request 0x7) errors go away?

Setting both to 513 is supposed to give us 192/64 according to the
datasheet which would be good enough, for example. Seems to work as
documented here (at least for XOFF).

Johan
