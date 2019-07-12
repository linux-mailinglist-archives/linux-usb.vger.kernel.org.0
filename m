Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 68A4A665F7
	for <lists+linux-usb@lfdr.de>; Fri, 12 Jul 2019 07:01:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725840AbfGLFBo (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 12 Jul 2019 01:01:44 -0400
Received: from mail-pl1-f174.google.com ([209.85.214.174]:34703 "EHLO
        mail-pl1-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725791AbfGLFBn (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 12 Jul 2019 01:01:43 -0400
Received: by mail-pl1-f174.google.com with SMTP id i2so4182793plt.1
        for <linux-usb@vger.kernel.org>; Thu, 11 Jul 2019 22:01:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gnarbox-com.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=GsfAfjxmTu+gZ1qU1vsqald8kLgVSASzuls926Mm0FM=;
        b=QxgFe2O8KpFQaQv5WhcX3DD2JzG/tgbUA6/iPQbIo+Zp7Ls5DS6Ww5NezIunIy1m+h
         Kl4xWmWZr+H0SE79EK8QZtiOiTZIdOJV86k7IMWMMWZ3ESB4DykXIuKl3lcyadONKzF6
         7uLk93vi+J2wCBUyQhNQSZ7jL0J4jtDwetVbTKQ0ScXDdyBLL7DvuDMPtEKcxCo1xC9Q
         tKH5WwYyfcd/rFj2hEao5LbeJv83MaopzPKyUCvsvTdAzMAiRxadnGKEC7BPjui4oGn2
         zWwL499AYtGbfBWb0QYER2fgvLNYO7NVFXTKM0ovSpvNqsQxkfbN6QClTFpSIko0eVIb
         Jt5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=GsfAfjxmTu+gZ1qU1vsqald8kLgVSASzuls926Mm0FM=;
        b=sv7mZ3qHrSVHb8pmZSIxgNdV8zBrQheu3AiyVS9oQXIO94v6toitRQvyUamQMnt8Av
         1O/eFLUQ8swcwMigeAaaXwtvpq3/lElTDeVLCEdFXQr5nYAUvUY2u+paisS5yXMVG8vm
         8PHLylsFbDDOzT0grGt5+4knJuFSVyvEV650UstZSU+PxpHh0wO3f/rRKQAJ+tLQKYNs
         lezYm31yiCIafxioDXA1ex+wQ5nl9/FIm4+1J4U/TTaZisReQ1zIesMBIybvVkPvuoiA
         pJc6XBGljAMwZx4iirEs11NXPFKI4DUnIicqMOAhy9xno6VZkIV5gTa/xU9s1HKuNyRg
         k3eQ==
X-Gm-Message-State: APjAAAUdUN3DCTA2c7uY+7Q7lXWuYpIs56BC1/cbjCaD3qgj3VY9fz6r
        2ph1SCZyteuOVYSjPadliPbwJF4BIdqDzA==
X-Google-Smtp-Source: APXvYqzKU7eE9pKBGy7SMBC/7FrJIQExMrhNPC1LpwLeXJnQAweR2xwS9YbXTBub8KpRo5oxhhbQwA==
X-Received: by 2002:a17:902:44e:: with SMTP id 72mr9012125ple.326.1562907702647;
        Thu, 11 Jul 2019 22:01:42 -0700 (PDT)
Received: from coops (cpe-104-173-199-40.socal.res.rr.com. [104.173.199.40])
        by smtp.gmail.com with ESMTPSA id z19sm6349831pgv.35.2019.07.11.22.01.41
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 11 Jul 2019 22:01:41 -0700 (PDT)
Date:   Thu, 11 Jul 2019 22:01:39 -0700
From:   Rob Weber <rob@gnarbox.com>
To:     Felipe Balbi <felipe.balbi@linux.intel.com>
Cc:     linux-usb@vger.kernel.org
Subject: Re: dwc3 Disable Compliance Mode
Message-ID: <20190712050139.GA28879@coops>
References: <20190710230110.GA3188@coops>
 <877e8phviw.fsf@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <877e8phviw.fsf@linux.intel.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello Felipe,

On Thu, Jul 11, 2019 at 10:37:11AM +0300, Felipe Balbi wrote:
> Rob Weber <rob@gnarbox.com> writes:
> > I hope you are doing well. My team and I are frequently experiencing an
> > issue with the dwc3 in our CherryTrail SoC where we encounter an LFPS
> > Polling timeout while our device is being enumerated.
> >
> > We configured the dwc3 as an ethernet gadget using configfs and the ecm
> > and RNDIS functions. The dwc3 transitions to U3 after configuration as
> > expected. Only once we connect our device to a USB host do we see the
> > link state transition to Polling. We are assuming LFPS Polling times
> > out because the link_state file in debugfs shows the link has
> > transitioned to compliance mode only after entering LFPS.Polling, and we
> > recently learned that compliance mode is triggered by a timeout during
> > LFPS.Polling.
> >
> > This issue is not 100% reproducible, but is occuring rather frequently
> > at the moment. We're unsure of the root cause of the issue as well. One
> > culprit might be the USB SuperSpeed Redriver we use in our design.
> >
> > We would like to disable compliance mode in the meantime to allow other
> > team members to continue developing and testing USB device mode features
> > while we dig into the root cause of the issue. Is there a proper way to
> > disable compliance mode entirely?
> 
> That's not something that can be done, unfortunately.

Okay, understood.
> 
> > If not, is there some mechanism we could implement to reset the
> > dwc3 when we enter compliance mode? I attempted some sort of mechanism
> > to reset the link state, but it does not seem to help the issue. I've
> > attached my patch and the trace events for my attempted workaround to
> > this email. My initial approach was to transition the link from
> > Compliance -> SS.Disabled -> Rx.Detect when we detect we've entered
> > compliance mode. The traces show that the dwc3 just enters LFPS.Polling
> > and subsequently enters compliance mode, despite the link being reset.
> 
> I think you would have to go through the entire Power On Reset
> sequence, but that's likely to be flakey.

Okay, good to know. I am not confident in this approach as well because of
the state management / recovery we might have to perform.

I wanted to explain our goal a little bit more in depth in case some
other apprach might come to mind. Our product supports 3 ways in which
the user can work with the USB port: Host mode, Mass Storage Mode, and
Ethernet Mode. Host mode is pretty straightforward. Users will generally
work with USB mass storage devices and USB-Ethernet adapters in host
mode. Mass storage mode exposes an internal user data partition using
f_mass_storage and configfs so the user can connect our product to their
host computer for backing up data. Ethernet uses the f_ecm and f_rndis
functions creating an ethernet connection with USB hosts, particularly
mobile devices, to interact with our mobile applications and servers
through a wired connection.

We control this functionality through a userspace application written in Go
that creates the gadget/function configuration in configfs. Given this
background information, are there any approaches that come to mind, such
as reconfiguring the gadget? Thanks in advance for your input.

> > Do you have any ideas on how we might work around compliance mode in the
> > meantime?
> 
> We have a few quirk flags that may help. snps,u2exit_lfps_quirk comes to
> mind, but I suggest trying a few of them and see if any helps.
> 
> All flags are described in
> Documentation/devicetree/bindings/usb/dwc3.txt

Great, thank you. I will give these a shot and let you know if I have
further questions.

> >  /* -------------------------------------------------------------------------- */
> > # tracer: nop
> > #
> > # entries-in-buffer/entries-written: 220/220   #P:4
> > #
> > #                              _-----=> irqs-off
> > #                             / _----=> need-resched
> > #                            | / _---=> hardirq/softirq
> > #                            || / _--=> preempt-depth
> > #                            ||| /     delay
> > #           TASK-PID   CPU#  ||||    TIMESTAMP  FUNCTION
> > #              | |       |   ||||       |         |
> >           <idle>-0     [003] ..s1   178.444339: dwc3_core: Tick! Checking for compliance mode
> >
> >           <idle>-0     [003] d.s2   178.444352: dwc3_core: Compliance Mode detected. Attempting recovery routine
> 
> >      irq/23-dwc3-1115  [002] d..1   178.445380: dwc3_event: event (00140301): Link Change [SS.Disabled]
> >      irq/23-dwc3-1115  [002] d..1   178.445826: dwc3_event: event (00150301): Link Change [RX.Detect]
> >      irq/23-dwc3-1115  [002] d..1   178.445832: dwc3_event: event (00170301): Link Change [Polling]
> >           <idle>-0     [003] ..s1   180.492293: dwc3_core: Tick! Checking for compliance mode
> >
> >           <idle>-0     [003] d.s2   180.492306: dwc3_core: Compliance Mode detected. Attempting recovery routine
> >
> >      irq/23-dwc3-1115  [002] d..1   180.493333: dwc3_event: event (00140301): Link Change [SS.Disabled]
> >      irq/23-dwc3-1115  [002] d..1   180.493636: dwc3_event: event (00150301): Link Change [RX.Detect]
> >      irq/23-dwc3-1115  [002] d..1   180.493641: dwc3_event: event (00170301): Link Change [Polling]
> >           <idle>-0     [003] ..s1   182.540350: dwc3_core: Tick! Checking for compliance mode
> >
> >           <idle>-0     [003] d.s2   182.540362: dwc3_core: Compliance Mode detected. Attempting recovery routine
> >
> >      irq/23-dwc3-1115  [002] d..1   182.541392: dwc3_event: event (00140301): Link Change [SS.Disabled]
> >      irq/23-dwc3-1115  [002] d..1   182.541976: dwc3_event: event (00150301): Link Change [RX.Detect]
> >      irq/23-dwc3-1115  [002] d..1   182.541982: dwc3_event: event (00170301): Link Change [Polling]
> >           <idle>-0     [003] .Ns1   184.588211: dwc3_core: Tick! Checking for compliance mode
> >
> >           <idle>-0     [003] dNs2   184.588232: dwc3_core: Compliance Mode detected. Attempting recovery routine
> 
> Don't we get an interrupt for Compliance mode entry?

Not that I've seen, surprisingly. My compliance mode recovery mechanism
looks for both compliance mode and loopback mode, neither of which I
have ever seen in the link state change events.

Cheers,
Rob Weber
