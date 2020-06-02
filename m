Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 41AC01EB503
	for <lists+linux-usb@lfdr.de>; Tue,  2 Jun 2020 07:21:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726223AbgFBFV5 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 2 Jun 2020 01:21:57 -0400
Received: from foo.stuge.se ([212.116.89.98]:46030 "EHLO foo.stuge.se"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725781AbgFBFV5 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 2 Jun 2020 01:21:57 -0400
Received: (qmail 1506 invoked by uid 1000); 2 Jun 2020 05:21:50 -0000
Message-ID: <20200602052150.1505.qmail@stuge.se>
Date:   Tue, 2 Jun 2020 05:21:50 +0000
From:   Peter Stuge <peter@stuge.se>
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     balbi@kernel.org, sam@ravnborg.org, linux-usb@vger.kernel.org,
        dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v3 4/6] drm: Add Generic USB Display driver
References: <20200529175643.46094-1-noralf@tronnes.org>
 <20200529175643.46094-5-noralf@tronnes.org>
 <20200529224531.22261.qmail@stuge.se>
 <614b0b0d-44d7-22e5-339d-cb8a13b426ac@tronnes.org>
 <20200602001207.17171.qmail@stuge.se>
 <20200602023254.GB15540@rowland.harvard.edu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200602023254.GB15540@rowland.harvard.edu>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Alan,

Alan Stern wrote:
> > The way I read composite_setup() after try_fun_setup: it calls f->setup()
> > when available, and that can return < 0 to stall.
> > 
> > I expect that composite_setup() and thus f->setup() run when the
> > SETUP packet has arrived, thus before the data packet arrives, and if
> > composite_setup() stalls then the device/function should never see the
> > data packet.
> > 
> > For an OUT transaction I think the host controller might still send
> > the DATA packet, but the device controllers that I know don't make it
> > visible to the application in that case.
> 
> ...
> 
> Are you guys interested in comments from other people who know more
> about the kernel and how it works with USB?

I am, especially when it comes to the gadget code.


> The USB protocol forbids a device from sending a STALL response to a
> SETUP packet.  The only valid response is ACK.  Thus, there is no way
> to prevent the host from sending its DATA packet for a control-OUT
> transfer.

Right; a STALL handshake only after a DATA packet, but a udc could silently
drop the first DATA packet if instructed to STALL during SETUP processing.
I don't know how common that is for the udc:s supported by gadget, but some
MCU:s behave like that.


> A gadget driver can STALL in response to a control-OUT data packet,
> but only before it has seen the packet.

How can it do that for OUT, and IN if possible there too?

Is it related to f->setup() returning < 0 ?


The spec also allows NAK, but the gadget code seems to not (need to?)
explicitly support that. Can you comment on this as well?


> Once the driver knows what the data packet contains, the gadget API
> doesn't provide any way to STALL the status stage.

Thanks. I think this particular gadget driver doesn't need to decide late.

Ideally the control transfers can even be avoided.


Thanks and kind regards

//Peter
