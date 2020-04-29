Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D8DB71BE00B
	for <lists+linux-usb@lfdr.de>; Wed, 29 Apr 2020 16:05:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728204AbgD2OEU (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 29 Apr 2020 10:04:20 -0400
Received: from mga17.intel.com ([192.55.52.151]:59723 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728098AbgD2ODy (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 29 Apr 2020 10:03:54 -0400
IronPort-SDR: MvjuHAln0A3beJjtcFnOHj28EkY5dm523IvDVNXdjeqeQv2Ow1ca1w/6Y8OvY+jtimq52MRHn4
 geG5JKbSj2fg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2020 07:03:54 -0700
IronPort-SDR: bxmx6VYp1c0lBvVVxDTcFtcRXQdznOcyLsy+z0I2FyZ0gWWYEmYphN6knX9HhPGijFrDyd8KHe
 zurXwOfDW0bw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,332,1583222400"; 
   d="scan'208";a="367812094"
Received: from kuha.fi.intel.com ([10.237.72.162])
  by fmsmga001.fm.intel.com with SMTP; 29 Apr 2020 07:03:52 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Wed, 29 Apr 2020 17:03:51 +0300
Date:   Wed, 29 Apr 2020 17:03:51 +0300
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc:     linux-usb@vger.kernel.org
Subject: Re: Adding tps65986 to your tps6598x driver
Message-ID: <20200429140351.GE2738754@kuha.fi.intel.com>
References: <d4a9214a-7a55-72ea-75b9-8388bc39d0dd@linaro.org>
 <20200414151505.GK2828150@kuha.fi.intel.com>
 <d64d7b21-4f03-05e8-e0db-aa8c75ba847e@linaro.org>
 <20200422132533.GC618654@kuha.fi.intel.com>
 <e2eb882b-0ecd-a0a7-b415-8beae93f640f@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e2eb882b-0ecd-a0a7-b415-8beae93f640f@linaro.org>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Apr 22, 2020 at 03:50:08PM +0100, Bryan O'Donoghue wrote:
> What's your feeling on the following.
> 
> In DT if we find a child connector then we can determine the state we are
> supposed to be in ?
> 
> That way it _shouldn't_ change the logic you already depend on the ACPI
> systems.
> 
> typec1_con: connector {
>     compatible = "usb-c-connector";
>     label = "USB-C";
>     power-role = "dual";
>     data-role = "dual";
>     try-power-role = "sink";
>     source-pdos = <PDO_FIXED(5000, 3000, PDO_FIXED_USB_COMM)>;
>     sink-pdos = <PDO_FIXED(5000, 3000, PDO_FIXED_USB_COMM)
>                 PDO_VAR(5000, 20000, 3000)>;
>     op-sink-microwatt = <15000000>;
> 
>     self-powered;
> };
> 
> we need to control :
> 
> http://www.ti.com/lit/an/slva843a/slva843a.pdf
> 
> - InitiateSwapToDPF
> - InitiateSwapToUFP
> - process-swap-to-dfp;
> - process-swap-to-ufp;
> - InitiateVconnSwap;
> - ProcessVconnSwap;
> 
> The documentation makes clear some of these settings are mutually exclusive.
> 
> You can capture the logic of that with the connector
> 
> - power-role = "dual";
> - data-role = "dual";
> 
> from the connector declaration. Absent the connector declaration the ACPI
> launched code should still work as-is.
> 
> Alternatively it could be something specific to the chip - as opposed to the
> connector.
> 
> My thought is you either have these two at the type-c controller level or
> inside a child connector node.
> 
> Either way tps6598x would consume them.

You should always have a child node for every connector. Please Note
that we usually have one for each connector in ACPI as well.

For now on every platform the application code (the PD controler FW)
has been platform specific, which means we have not needed to
configure things like the System Configuration register, because we've
known that the application code has already done that for us.

In your case I'm assuming you do not have a platform specific PD
controler FW, so you are going to need to use device properties, which
is the correct thing to do.

So we can always check those properties in tps6598x.c. If we have
them, we configure the System Configuration, and what have you,
according to those. If we don't have them, then we know the PD
controller FW is platform specific.

> > > Something else ? It's important we get the changes upstream, so I'd
> > > appreciate any thoughts you have on the right way to go about this.
> > 
> > So what exactly is the problem here?
> > 
> > Which USB controller are you using? Is it dual-role capable, or do you
> > have separate xHCI controller and separate USB device controller plus
> > a mux between them?
> 
> Err, checks notes.
> Its a ChipIdea HDRC. That part just works.
> 
> As I suggested above,
> 
> tps6598x: tps6598x@38 {
>     compatible = "ti,tps6598x";
>     reg = <0x38>;
> 
>     interrupt-parent = <&gpio>;
>     interrupts = <107 IRQ_TYPE_LEVEL_LOW>;
>     interrupt-names = "irq";
> 
>     pinctrl-names = "default";
>     pinctrl-0 = <&typec_pins>;
> 
>     port {
>         typec1_dr_sw: endpoint {
>             remote-endpoint = <&usb1_drd_sw>;
>         };
>     };

That looks a bit odd to me. I think you want to place that under the
connector node too, however, OF graph is a bit problematic with
Type-C. The problem is that there is no way to identify the OF graph
ports/endpoints. It means that there does not seem to be any way to
know which port/endpoint/remote-endpoint is for the DisplayPort, the
mux, USB port, TBT 3 port, retimer #1, retimer #2, etc.

There is a proposal to define device property that simply contains
reference to the correct node for every type of connection. For USB
role switch the property is named "usb-role-switch":

        connector {
                ...
                usb-role-switch = <the remote port parent of &usb1_drd_sw>;
                ...
        };

>     /* Example A */
>     typec1_con: connector {
>         compatible = "usb-c-connector";
>         label = "USB-C";
>         power-role = "dual";
>         data-role = "dual";
>         try-power-role = "sink";
>         source-pdos = <PDO_FIXED(5000, 3000, PDO_FIXED_USB_COMM)>;
>                       sink-pdos = <PDO_FIXED(5000, 3000,
>                                    PDO_FIXED_USB_COMM)
>                                    PDO_VAR(5000, 20000, 3000)>;
>         op-sink-microwatt = <15000000>;
>     };
> 
>     /* Example B */
>     power-role = "dual";
>     data-role = "dual";
>     try-power-role = "sink";
>     source-pdos = <PDO_FIXED(5000, 3000, PDO_FIXED_USB_COMM)>;
>                   sink-pdos = <PDO_FIXED(5000, 3000,
>                                PDO_FIXED_USB_COMM)
>                                PDO_VAR(5000, 20000, 3000)>;
>     op-sink-microwatt = <15000000>;
> };
> 
> I think connector is probably the right way to go.
> 
> ---
> bod

thanks,

-- 
heikki
