Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3DF5824D952
	for <lists+linux-usb@lfdr.de>; Fri, 21 Aug 2020 18:03:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726903AbgHUQDa (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 21 Aug 2020 12:03:30 -0400
Received: from netrider.rowland.org ([192.131.102.5]:37141 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1726858AbgHUQD1 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 21 Aug 2020 12:03:27 -0400
Received: (qmail 257463 invoked by uid 1000); 21 Aug 2020 12:03:21 -0400
Date:   Fri, 21 Aug 2020 12:03:21 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Martin Thierer <mthierer@gmail.com>
Cc:     linux-usb@vger.kernel.org
Subject: Re: Data toggles not reset on "set configuration" for ports handled
 by "xhci_hcd" driver
Message-ID: <20200821160321.GA256196@rowland.harvard.edu>
References: <CAL3BvCzb6dGZOm6jy2PddSfioM7hThMEBm+aQ_gmMAWAXFYOuQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAL3BvCzb6dGZOm6jy2PddSfioM7hThMEBm+aQ_gmMAWAXFYOuQ@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Aug 21, 2020 at 02:30:12PM +0200, Martin Thierer wrote:
> I'm debugging a problem with the "xum1541" usb adapter (used to
> interface with legacy cbm floppy drives), which doesn't work correctly
> when plugged into some usb ports but works fine in others.
> 
> The symptom of failure is that the host command only works the first
> time after the device has been plugged in.
> 
> This is what I found so far:
> 
> The device mostly uses bulk transfers for communication. After every
> start, the host program issues a "set configuration" command (even
> though the device only has a single configuration). On receiving the
> "set configuration" message, the firmware of the xum1541 device does
> an endpoint reset including a reset of the data toggles.
> 
> The problem is, that my host computer only seems to reset its data
> toggles when the device is plugged into a usb port that as per syslog
> uses the "ehci-pci" driver, while it does not in ports using the
> "xhci_hcd" driver.
> 
> That's why the data toggles get out of sync when the device is plugged
> into a port handled by the "xhci_hcd" driver and therefore stops
> working.
> 
> For now I try to work around this issue by avoiding the "set
> configuration" call altogether, but I'm still curious what the correct
> behaviour is.
> 
> The notion of a "set configuration" call that doesn't really change
> the configuration triggering a "lightweight reset" seems to be common,
> but I'm not sure if there's consensus what the reset should include.
> 
> So I'm not sure which behaviour (to reset the data toggles or not) is
> correct, but I think at least the linux kernel should behave
> consistently regardless of the usb driver / port used?

The USB 2.0 specification says (section 8.5.2):

	A bulk endpoint’s toggle sequence is initialized to DATA0 when 
	the endpoint experiences any configuration event (configuration 
	events are explained in Sections 9.1.1.5 and 9.4.5).

Section 9.1.1.5 says:

	Before a USB device’s function may be used, the device must be 
	configured. From the device’s perspective, configuration 
	involves correctly processing a SetConfiguration() request with 
	a non-zero configuration value. Configuring a device or changing 
	an alternate setting causes all of the status and configuration 
	values associated with endpoints in the affected interfaces to 
	be set to their default values. This includes setting the data 
	toggle of any endpoint using data toggles to the value DATA0.

Together these should explain the correct behavior.

> Is resetting the data toggles even handled by the driver (or by the
> hardware)?

The driver.

Alan Stern
