Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9A7B22EA59A
	for <lists+linux-usb@lfdr.de>; Tue,  5 Jan 2021 07:52:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725843AbhAEGuA (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 5 Jan 2021 01:50:00 -0500
Received: from mail.kernel.org ([198.145.29.99]:58322 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725290AbhAEGuA (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 5 Jan 2021 01:50:00 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id AF9BD22482;
        Tue,  5 Jan 2021 06:49:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1609829359;
        bh=A/v1k09XeLL3xvx8o+1Y2pUAGg5SunJIOtdz+AQyT5I=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=uxSp2sEJDHqtsm9+9O65v9bJOzDf+CogSChffrzoPa//BC9ROw+Flb0H+m/4Ln7Uz
         H7MBXxRNXncnHf55zxADzKDYqnXr8dRPoGdLeb/7YRDdTBQFJBUar0p6Rd6vcThweH
         /OQjiU2DUXLRHl7IaKanKiix+5nN7AB2IMLgHNdo=
Date:   Tue, 5 Jan 2021 07:49:15 +0100
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Tomasz Grobelny <tomasz.aleksander.grobelny@gmail.com>
Cc:     linux-usb@vger.kernel.org
Subject: Re: dwc2 gadget mode different behaviour with different hosts
Message-ID: <X/QL6zRpW2gCMn5a@kroah.com>
References: <CAAH9jopk2ngwBDxfmQ8CQsvntW0uUU2e4h3R=drXV2n2y6+Nuw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAAH9jopk2ngwBDxfmQ8CQsvntW0uUU2e4h3R=drXV2n2y6+Nuw@mail.gmail.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Jan 05, 2021 at 02:02:16AM +0100, Tomasz Grobelny wrote:
> Hi all,
> 
> I am trying to implement Android Open Accessory Protocol which is a
> base for Android Auto Protocol. I am using Odroid N2 working in gadget
> mode and trying to send data to car's headunit.
> 
> The problem I am facing now is that for some headunits it works, for
> some it doesn't. It seems there is some difference in what happens
> immediately after the host tries to switch device to accessory mode by
> sending control commands 51, 52 and 53. The initial part in all cases
> (all headunits I have access to) works just fine, but after it
> completes my Odroid gadget should be reinitialized on the USB bus. On
> hosts on which it works (my PC and VW headunit) the device gets new
> address like this:
> 
> [   33.491312] Mass Storage Function, version: 2009/09/11
> [   33.491322] LUN: removable file: (no medium)
> [   33.504716] file system registered
> [   33.506279] read descriptors
> [   33.506290] read strings
> [   33.510164] dwc2 ff400000.usb: bound driver configfs-gadget
> [   33.678710] dwc2 ff400000.usb: new device is high-speed
> [   33.750089] dwc2 ff400000.usb: new device is high-speed
> [   33.806366] dwc2 ff400000.usb: new address 4
> [   37.899601] ffs_data_put(): freeing
> [   37.899862] unloading
> [   38.942619] file system registered
> [   38.943003] read descriptors
> [   38.943009] read strings
> [   38.946561] dwc2 ff400000.usb: bound driver configfs-gadget
> [   39.310762] dwc2 ff400000.usb: new device is high-speed
> [   39.381890] dwc2 ff400000.usb: new device is high-speed
> [   39.438056] dwc2 ff400000.usb: new address 5
> 
> On Fiat's headunit I get the same address for both phases:
> [   33.773387] Mass Storage Function, version: 2009/09/11
> [   33.773397] LUN: removable file: (no medium)
> [   33.784054] file system registered
> [   33.792335] read descriptors
> [   33.792389] read strings
> [   33.796349] dwc2 ff400000.usb: bound driver configfs-gadget
> [   34.023544] dwc2 ff400000.usb: new device is high-speed
> [   34.131592] dwc2 ff400000.usb: new device is high-speed
> [   34.194740] dwc2 ff400000.usb: new address 3
> [   34.353478] ffs_data_put(): freeing
> [   34.353825] unloading
> [   35.392723] file system registered
> [   35.393450] read descriptors
> [   35.393459] read strings
> [   35.403955] dwc2 ff400000.usb: bound driver configfs-gadget
> [   37.119299] dwc2 ff400000.usb: new device is high-speed
> [   37.227341] dwc2 ff400000.usb: new device is high-speed
> [   37.290497] dwc2 ff400000.usb: new address 3
> 
> Any idea why this might be the case? Can I somehow enforce that the
> device reintroduces itself on the bus and gets new address? Can I
> somehow debug what happens when my device is connected as gadget (eg.
> see control messages for device/configuration/string descriptors)?

Why does it matter what USB "address" your device gets?  That's a random
number that nothing should care about as the USB spec allows it to be
reused if the host controller wants to.

What requires a "different" address each time?  Shouldn't that userspace
bug be fixed instead?

thanks,

greg k-h
