Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F0EE127F755
	for <lists+linux-usb@lfdr.de>; Thu,  1 Oct 2020 03:25:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730385AbgJABYP (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 30 Sep 2020 21:24:15 -0400
Received: from netrider.rowland.org ([192.131.102.5]:33923 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1729645AbgJABYO (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 30 Sep 2020 21:24:14 -0400
Received: (qmail 232901 invoked by uid 1000); 30 Sep 2020 21:24:13 -0400
Date:   Wed, 30 Sep 2020 21:24:13 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Rob Herring <robh@kernel.org>
Cc:     Doug Anderson <dianders@chromium.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Frank Rowand <frowand.list@gmail.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Linux USB List <linux-usb@vger.kernel.org>,
        Bastien Nocera <hadess@hadess.net>,
        Stephen Boyd <swboyd@chromium.org>,
        Ravi Chandra Sadineni <ravisadineni@chromium.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Peter Chen <peter.chen@nxp.com>
Subject: Re: [PATCH v4 1/2] dt-bindings: usb: Add binding for discrete
 onboard USB hubs
Message-ID: <20201001012413.GA232049@rowland.harvard.edu>
References: <20200928101326.v4.1.I248292623d3d0f6a4f0c5bc58478ca3c0062b49a@changeid>
 <20200929201701.GA1080459@bogus>
 <20200929220912.GF1621304@google.com>
 <20200930013229.GB194665@rowland.harvard.edu>
 <20200930124915.GA1826870@google.com>
 <CAL_JsqLq9ZJm_CMiqWwbQhgGeu_ac_j43pvk4+xCFueSbyL4wA@mail.gmail.com>
 <CAD=FV=WcDzgcHNn1+gH+gq_WEwpD0XXdJGm2fBVpAB=3fVbzZA@mail.gmail.com>
 <CAL_Jsq+Zi+hCmUEiSmYw=pVK472=OW1ZjLnkH1NodWUm8FA5+g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAL_Jsq+Zi+hCmUEiSmYw=pVK472=OW1ZjLnkH1NodWUm8FA5+g@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Sep 30, 2020 at 03:20:28PM -0500, Rob Herring wrote:
> On Wed, Sep 30, 2020 at 10:28 AM Doug Anderson <dianders@chromium.org> wrote:

> > > There aren't 2 (or 3) devices here. There's a single USB device (a
> > > hub) and the DT representation should reflect that.
> >
> > That's not completely true, though, is it?
> 
> I was referring to the hub. I only see 1 datasheet, 1 IC and 1 block
> diagram... Lots of devices have more than one interface though usually
> not different speeds of the same thing.
> 
> > As I understand it, a USB
> > 3 port is defined as containing both a USB 2 controller and a USB 3
> > controller.  While it's one port, it's still conceptually two
> > (separable) things.  The fact that they are on the same physical chip
> > doesn't mean that they are one thing any more than a SoC (one chip)
> > needs to be represented by one thing in the device tree.  Though, of
> > course, I'm not the expert here, the argument that this IC is a USB 2
> > hub, a USB 3 hub, and some control logic doesn't seem totally
> > insane...
> 
> Until there's a shared resource.

Here's how the hardware works:

A USB-3 cable contains two sets of data wires: one set running at <=
480 Mb/s and carrying USB-2 protocol packets, and one set running at
>= 5000 Mb/s and carrying USB-3 protocol packets.  The two sets are
logically and physically independent and act as separate data buses.
In fact, I believe it is possible to put one of the buses into runtime
suspend while the other continues to operate normally.

Every device attached to a USB-3 cable must use only one set of these
wires at a time -- except for hubs.  A USB-3 hub must use both sets
and will appear to the host as two independent hubs, one on each bus.

Whether you want to represent a USB-3 hub as two separate devices in
DT is up to you.  I think doing so makes sense, but I don't know very
much about Device Tree.

> > > We already have hubs in DT. See [1][2][3][4]. What's new here? Simply,
> > > vdd-supply needs to be enabled for the hub to be enumerated. That's
> > > not a unique problem for USB, but common for all "discoverable" buses
> > > with MDIO being the most recent example I pointed you to. I'm not sure
> > > what happened with the previous attempt for USB[5]. It didn't look
> > > like there was a major issue. 'generic' power sequencing can't really
> > > handle every case, but as long as bindings allow doing something
> > > device specific I don't care so much. The driver side can evolve. The
> > > DT bindings can't.
> > >
> > > So what should this look like? There are 2 issues here. First, how do
> > > we represent a USB3 device if that means multiple ports. I'm not
> > > really sure other than it needs to be defined and documented. I think
> > > the choices are: ignore the USB3 part (USB2 is always there and what's
> > > used for enumeration, right?) or allow multiple ports in reg.
> >
> > Interesting question, that one.  When trying to optimize board designs
> > we have certainly talked about separating out the USB 2 and USB 3 [1].
> > For instance, we could take the USB 3 lines from the root hub and send
> > them off to a high speed camera and then take the USB 2 lines and
> > route them to a hub which then went to some low speed devices.  We
> > chickened out and didn't do this, but we believed that it would work.
> 
> Great. :( No doubt that we'll see this at some point. Though I'd
> assume if connectors are involved, USB3 only is not USB compliant and
> that will ripple to all the upstream ports. I guess it could be as
> crazy as any USB2 port and any USB3 port in one connector. One from a
> hub and one from the root port. Though aren't there port power
> controls which would probably prevent such craziness.

A hub that attaches only to the USB-3 data wires in a cable is not USB
compliant.  A USB-2 device plugged into such a hub would not work.

But ports can be wired up in weird ways.  For example, it is possible
to have the USB-3 wires from a port going directly to the host
controller, while the USB-2 wires from the same port go through a
USB-2 hub which is then connected to a separate host controller.  (In
fact, my office computer has just such an arrangement.)

> We certainly have separate host controllers as well.
> 
> > > Do hubs
> > > really have 2 ports for each connection?
> >
> > Yup.  It's really two hubs.
> >
> > localhost ~ # lsusb -t
> > /:  Bus 02.Port 1: Dev 1, Class=root_hub, Driver=xhci-hcd/1p, 5000M
> >     |__ Port 1: Dev 2, If 0, Class=Hub, Driver=hub/4p, 5000M
> > /:  Bus 01.Port 1: Dev 1, Class=root_hub, Driver=xhci-hcd/1p, 480M
> >     |__ Port 1: Dev 2, If 0, Class=Hub, Driver=hub/4p, 480M
> 
> Humm, seems we're mixing buses and ports in the numbering. The USB

The "Port 1" numbers on the "Bus" lines doesn't make any sense; they
are meaningless.  If you ignore them the rest is logical.

> binding says it's ports. Not sure that matters, but something to think
> about.
> 
> > localhost ~ # lsusb
> > Bus 002 Device 002: ID 0bda:0411 Realtek Semiconductor Corp.
> > Bus 002 Device 001: ID 1d6b:0003 Linux Foundation 3.0 root hub
> > Bus 001 Device 002: ID 0bda:5411 Realtek Semiconductor Corp.
> > Bus 001 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
> >
> > I think this means that we're already forced to split this one device
> > across two nodes in the device tree, right?  Oh, or I guess you said
> > we could change the binding to allow more than one port in one reg?
> > What would that look like?
> 
> reg = <1 2>;
> 
> Though that's not going to work if you have 2 separate host controllers.
> 
> I think splitting devices is the wrong approach. I think we want to
> link USB2 and USB3 ports instead. We've already got some property to
> do this, but at the host controller level. Called 'companion'
> something IIRC. Probably that needs to be more flexible.

The USB term is "peer" ports.  That is, given a USB-3 hub (which shows
up as one hub on the USB-3 bus and one on the USB-2 bus), port N on
the the USB-3 incarnation of the hub is the peer of port M on the
USB-2 incarnation (for some value of M which doesn't always have to be
the same as N).  In other words, suppose that when you plug a USB-3
device into the hub it shows up on (logical) port N, and when you plug
a USB-2 device into the same port on that hub it shows up on (logical)
port M.  Then ports N and M on the USB-3 and USB-2 incarnations of the
hub are peers.

To make things even more confusing, the USB-2 and USB-3 incarnations
of a USB hub don't have to have the same number of ports!  Some of the
physical ports on the hub may be USB-2 only.

> > You'd have more than one VID/PID listed in
> > the compatible string and more than one "reg"?
> 
> 2 compatible strings I guess.
> 
> > > The 2nd issue is where do extra properties for a device go. That's
> > > nothing new nor special to USB. They go with the device node. We
> > > already went thru that with the last attempt.
> > >
> > > So for this case, we'd have something like this:
> > >
> > >     usb_controller {
> > >         dr_mode = "host";
> > >         #address-cells = <1>;
> > >         #size-cells = <0>;
> > >
> > >         hub@1 {
> > >             compatible = "usbbda,5411";
> > >             reg = <1>;
> > >             vdd-supply = <&pp3300_hub>;
> > >         };
> > >     };
> > >
> > > This is no different than needing a reset line deasserted as the prior
> > > attempt did.
> >
> > I'd believe that the above could be made to work with enough software
> > change in the USB stack.
> 
> I believe the prior attempt did just that.
> 
> >  Presumably we wouldn't want to actually do a
> > full probe of the device until USB actually enumerated it, but I guess
> > you could add some type of optional "pre-probe" step where a driver is
> > called?  So you'd call a pre-probe on whatever driver implements
> > "usbbda,5411" and it would turn on the power supply.  ...then, if the
> > device is actually there, the normal probe would be called?  I guess
> > that'd work...
> 
> Yes, I've been saying for some time we need a pre-probe. Or we need a
> forced probe where the subsystem walks the DT nodes for the bus and
> probes the devices in DT (if they're in DT, we know they are present).
> This was the discussion only a few weeks ago for MDIO (which I think
> concluded with they already do the latter).

This is why I suggested putting the new code into the xhci-platform
driver.  That is the right place for doing these "pre-probes" of DT
nodes for hubs attached to the host controller.

> Instead, I typically see attempts at 'generic' properties for doing
> power sequencing. That is a never ending stream of properties to add
> more controls or more timing constraints on the sequences.
> 
> > One thing that strikes me as a possible problem, though, is that I
> > totally envision HW guys coming back and saying: "oh, we want to
> > second source that USB hub and randomly stuff a different hub on some
> > boards".  In theory that's a reasonable suggestion, right?  USB is a
> > probable bus.  We turn on power to the USB hub (and the regulator to
> > turn on power is the same no matter which hub is stuffed) and then we
> > can just check which device got enumerated.  It's likely that both
> > hubs would behave the same from a software point of view, but they
> > would have different VID/PID.
> 
> A 2nd compatible string solves this. Or the s/w needs to tolerate a
> mismatch in VID/PID. Pre-probe matches on compatible string and real
> probe matches on VID/PID and there doesn't have to be any relationship
> between the 2.
> 
> If you have another way to power the device other than just 'Vbus' or
> self-powered, then you aren't really USB compliant.

That statement is questionable.  After all, "self-powered" really
means nothing more than "not bus-powered" (apart from borderline cases
of devices that take part of their power from the bus and part from
somewhere else).

Alan Stern
