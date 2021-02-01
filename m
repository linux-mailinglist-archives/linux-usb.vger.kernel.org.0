Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D0C0C30A537
	for <lists+linux-usb@lfdr.de>; Mon,  1 Feb 2021 11:20:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232392AbhBAKTt (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 1 Feb 2021 05:19:49 -0500
Received: from mail.kernel.org ([198.145.29.99]:36246 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231598AbhBAKTt (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 1 Feb 2021 05:19:49 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id C4AF864DC4;
        Mon,  1 Feb 2021 10:19:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1612174748;
        bh=XpLTh4sEEMGWmQHVrIwVn8BNGmOguzaBcom7AbFLMGY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ZI96u99EOGtlB+KQ0nPBOVwuo5wxHMBF6xAtjd+dgU09mx4H6sFjyY7Q/8cFwjB1A
         wG6oK+fDOH46qMcMXXhsRfwwh9R3ATLaQqpqWK+TOjKOu/tVynfpLLlk5+p0Vb2Mvc
         uK4KI6XkZkoLpdKQIX90guFcX5OwcxkNpxCoGKBWB9uegNYO8J635qO9wpRGCCWxbD
         OwI43f/HvaAiJ9DteiM6K4tlbqMasli6Luinwefofl8mCJP6az24MOjiTNnZXFmuRr
         cDOJknvE+JAGAzzqcedmji2F5W7cMdcgcmNHBDWB42i3yxDjFf4aXJzBWjwfNAwShz
         +tmsRGOK8PxBg==
Received: from johan by xi.lan with local (Exim 4.93.0.4)
        (envelope-from <johan@kernel.org>)
        id 1l6WIi-0005WQ-QZ; Mon, 01 Feb 2021 11:19:20 +0100
Date:   Mon, 1 Feb 2021 11:19:20 +0100
From:   Johan Hovold <johan@kernel.org>
To:     Tung Pham <Tung.Pham@silabs.com>
Cc:     Hung Nguyen <Hung.Nguyen@silabs.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Pho Tran <Pho.Tran@silabs.com>
Subject: Re: Bugs: usb serial crash when close second comport
Message-ID: <YBfVqOwEZfkvX7YA@hovoldconsulting.com>
References: <PU1PR06MB2117988A6B7680CA1806DBE091B69@PU1PR06MB2117.apcprd06.prod.outlook.com>
 <CO1PR11MB48828958BDC51E796D37D63F81B69@CO1PR11MB4882.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CO1PR11MB48828958BDC51E796D37D63F81B69@CO1PR11MB4882.namprd11.prod.outlook.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Tung,

On Mon, Feb 01, 2021 at 10:02:18AM +0000, Tung Pham wrote:
> Dear MR Johan Hovold.
> 
> usb serial crash when close second comport
> Environment: Raspberry Pi 4 installed Ubuntu 20.10 (with the latest
> updates) ( kernel version: 5.8.0-1011)

Can you reproduce this with a mainline kernel?

Otherwise, you may need to bring this up with Ubuntu.

> -------------------------------------------
> I uses Raspberry Pi 4 to connect to HB-UM43 hub, then connect cp2108
> EK USB to serial board through the hub.
> After opening connections to both serial devices use screen command,
> the cp210x driver intermittently crashes on closing the second
> connection. The problem does not duplicate if opening only one of the
> connections. Repeatedly opening/closing just the first device works
> fine. Repeatedly opening/closing just the second device works fine.
> Opening both, and then trying to close both can trigger the issue. It
> doesn't matter what ordered they are opened or closed; closing down
> the second one can trigger the issue.
> I has also realized the same test with our cp2108 boards and the
> results are:
> 
> If I connects the Pi directly to the cp2108 EK board, the problem does
> not happen.
> If he uses an Raspberry Pi 4 connected to cp2108 boards through the
> HB-UM43 hub, the problem DOES happen.
> 
> I has also tried modifying cp210x driver downloaded from silabs web
> site, and i thinks the problem is rooted in cp210x_close() function as
> i explains
> "This is the cp210x_close() call from the cp210x driver:
> 
> static void cp210x_close(struct usb_serial_port *port)
> {
> struct cp210x_port_private *port_priv = usb_get_serial_port_data(port);
> usb_serial_generic_close(port); /* Clear both queues; cp2108 needs this to avoid an occasional hang */
> cp210x_write_u16_reg(port, CP210X_PURGE, PURGE_ALL);
> cp210x_write_u16_reg(port, CP210X_IFC_ENABLE, UART_DISABLE); /* Disabling the interface disables event-insertion mode. */
> port_priv->event_mode = false;
> }
> 
> It does basically four things: cancel any pending transactions on the
> BULK OUT and IN endpoints plus clear the OUT fifo
> (usb_serial_generic_close() call), send a request to clear the
> transmit and receive queues (CP210X_PURGE, PURGE_ALL), send a request
> to disable the UART (CP210X_IFC_ENABLE, UART_DISABLE), and then flag
> that the event_mode is off.
> 
> The issue occurs during the usb_serial_generic_close() call. Note that
> this call doesn't seem to actually close the port handle, but just
> does some cleanup in preparation for the close. The actual binary for
> this call comes from the OS; it is linked into the driver.
> 
> The driver also recovers if you unbind then bind the driver to the
> device. So it appears this is a software issue and not the silicon
> getting hung."
> 
> Question: Does the removal of this line usb_serial_generic_close() of
> code have any side effect? (e.g: make driver unstable, etc?), or is it
> an issue of the kernel, how i can fix this?.

This sounds like you could have a problem with the host-controller
driver. What controller is the RPi4 using?

As you write above, the usb_serial_generic_close() is needed to cancel
the outstanding URBs during close so you can't remove that.

But my guess is that something breaks in the HCD when unlinking those
URBs when connected through the hub. Do you have a stack trace from an
oops? Or do things just lock up?

Johan
