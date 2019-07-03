Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 00D505E95C
	for <lists+linux-usb@lfdr.de>; Wed,  3 Jul 2019 18:38:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726550AbfGCQi0 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 3 Jul 2019 12:38:26 -0400
Received: from mail.kernel.org ([198.145.29.99]:47796 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725933AbfGCQi0 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 3 Jul 2019 12:38:26 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id E95C62189E;
        Wed,  3 Jul 2019 16:38:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1562171905;
        bh=+coCCzn85FkjEOGO7b9tB8JitODzOrhUUN5elqeMyDg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=whyHLpNkYD+uNl46syTtq3z9RT/NHT1JA5YOo9XV5tD37fOGN4Cr/aZsjIPKBS3Sh
         E3ocQv1X6+SpW2t24PIZLXoxR/W14iR3reNPmTct23KBzBpmwKr3+CzwljcGeudPoQ
         LsmNbIxDflVHjHupfoxJr5ZDyv/7Tu61gumbUVgs=
Date:   Wed, 3 Jul 2019 18:38:23 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Markus Breunig <Markus.L.Breunig@gmx.net>
Cc:     linux-usb@vger.kernel.org
Subject: Re: New USB Device
Message-ID: <20190703163823.GA17160@kroah.com>
References: <5D18A890.1040100@gmx.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5D18A890.1040100@gmx.net>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sun, Jun 30, 2019 at 02:18:24PM +0200, Markus Breunig wrote:
> Hello,
> 
> my Raspberry Pi told me to send you the following information. I hope it
> helps ...
> 
> best regards
> 
> Markus
> 
> --------------------------------
> [    2.081893] usb 1-1.2: new full-speed USB device number 4 using dwc_otg
> [    2.219804] usb 1-1.2: New USB device found, idVendor=04d8,
> idProduct=f8e8, bcdDevice=48.12
> [    2.219821] usb 1-1.2: New USB device strings: Mfr=1, Product=2,
> SerialNumber=3
> [    2.219830] usb 1-1.2: Product: GNS 5890 ADS-B Receiver
> [    2.219839] usb 1-1.2: Manufacturer: www.gns-gmbh.com
> [ 1517.863755] usbcore: registered new interface driver usbserial_generic
> [ 1517.863830] usbserial: USB Serial support registered for generic
> [ 1517.863916] usbserial_generic 1-1.2:1.0: The "generic" usb-serial
> driver is only for testing and one-off prototypes.
> [ 1517.863927] usbserial_generic 1-1.2:1.0: Tell
> linux-usb@vger.kernel.org to add your device to a proper driver.
> [ 1517.863939] usbserial_generic 1-1.2:1.0: device has no bulk endpoints
> [ 1517.864009] usbserial_generic 1-1.2:1.1: The "generic" usb-serial
> driver is only for testing and one-off prototypes.
> [ 1517.864018] usbserial_generic 1-1.2:1.1: Tell
> linux-usb@vger.kernel.org to add your device to a proper driver.
> [ 1517.864028] usbserial_generic 1-1.2:1.1: generic converter detected
> [ 1517.865108] usb 1-1.2: generic converter now attached to ttyUSB0

This device isn't even a generic usb to serial converter, why did you
tell your module configuration to bind to this specific device?

thanks,

greg k-h
