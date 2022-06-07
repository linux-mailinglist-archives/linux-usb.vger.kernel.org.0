Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 27DB25401B2
	for <lists+linux-usb@lfdr.de>; Tue,  7 Jun 2022 16:47:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244641AbiFGOq7 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 7 Jun 2022 10:46:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44040 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243135AbiFGOq6 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 7 Jun 2022 10:46:58 -0400
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
        by lindbergh.monkeyblade.net (Postfix) with SMTP id 45BA511459
        for <linux-usb@vger.kernel.org>; Tue,  7 Jun 2022 07:46:57 -0700 (PDT)
Received: (qmail 405801 invoked by uid 1000); 7 Jun 2022 10:46:56 -0400
Date:   Tue, 7 Jun 2022 10:46:56 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Kevin Rowland <kevin.p.rowland@gmail.com>
Cc:     linux-usb@vger.kernel.org
Subject: Re: Control of external VBUS on resume from sleep
Message-ID: <Yp9k4JRcNMcvVi6l@rowland.harvard.edu>
References: <CAHK3GzziwVASKgvBQmv_DnhwLJ8Bj2K=42ptyTrtOFCAAPXcnw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHK3GzziwVASKgvBQmv_DnhwLJ8Bj2K=42ptyTrtOFCAAPXcnw@mail.gmail.com>
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Jun 06, 2022 at 03:12:58PM -0700, Kevin Rowland wrote:
> Hello all,
> 
> I've got a USB 3.0 host (an NXP i.MX8QM running 5.10.72 with Cadence
> XHCI host controller IP) connected to a USB device on the same PCB,
> which also happens to run Linux (although I think that's beside the
> point here). The quirk is that, although D+/D- are routed directly
> from host to device, VBUS is actually controlled by a separate GPIO on
> the host. The dedicated VBUS pin on the USB host controller is pulled
> high. ID is pulled high on the PBC but driven low by a GPIO from the
> i.MX8, so we can imagine it's tied to ground.
> 
> I've made a little schematic drawing [1] to help visualize the connections.
> 
> We've run into an issue where, on resume from STR, the following
> sequence occurs:
> - the GPIO peripheral on the host is powered back on, VBUS is
> immediately driven high

Why wasn't the GPIO turned on the whole time the system was suspended?  
How can remote wakeup work without VBUS power?

> - the device signals attach on DP/DN, but _I believe_ the host
> controller on the host is not yet powered on
> - the host controller is then powered on and the {hub, hcd, xhci}
> drivers all resume, but no port status change is detected; I believe
> that attach signaling was missed by the host controller
> 
> I'd like for the host controller driver (or the root hub driver??) to
> have explicit control of VBUS, so that it's driven high only when the
> host controller regains power and is ready to detect attach signaling.
> I see device-tree documentation about the USB connector node and
> `vbus-supply`, but I'm having a hard time understanding how to square
> my use-case with `drivers/usb/common/usb-conn-gpio.c`, which reacts to
> state changes on VBUS or ID.
> 
> Any thoughts on where I should stick the logic that enables VBUS on
> resume? My current (very hacky) fix is to initialize a global (argh!)
> gpio_desc to refer to the VBUS GPIO, then to call
> `gpiod_set_value(<gpio_desc>, 0); gpiod_set_value(<gpio_desc>, 1);` in
> `usb_port_resume()`, which is where I ended up when tracking the
> original issue. This toggles VBUS and allows us to catch the new round
> of attach signaling from the device.

The hub driver already knows to turn on port power when a hub is 
initialized or during a reset-resume.  It doesn't do so during a 
regular resume because it assumes power was on the whole time.  You can 
change this, if necessary.

> I'm happy to use the fixed-regulator framework instead, I'm just not
> sure which driver should own the gpio_desc / regulator and where it
> should be disabled / enabled during suspend / resume.

Probably whichever platform-specific driver manages your xHCI controller 
should be the one to interact with the GPIO.  But it should make changes 
only when told to do so by a higher layer (such as the hub driver).

Alan Stern

> Best,
> Kevin
> 
> [1]
> 
>  i.MX8                      device
> .----------------.         .-------------.
> |     GPIOX.Y ---|-------->| VBUS (in)   |
> |                |         |             |
> |  USB           |    _    |             |
> | .------------. |    |    |             |
> | |    VBUS ---|-|----'    |             |
> | |     DP <---|-|-------->| DP          |
> | |     DP <---|-|-------->| DN          |
> | |     ID ----|-|----.    '-------------'
> | '------------' |    |
> '----------------'    v
