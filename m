Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5B72B459EC2
	for <lists+linux-usb@lfdr.de>; Tue, 23 Nov 2021 10:01:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233127AbhKWJEa (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 23 Nov 2021 04:04:30 -0500
Received: from mail.kernel.org ([198.145.29.99]:53784 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235864AbhKWJCr (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 23 Nov 2021 04:02:47 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id B666960231;
        Tue, 23 Nov 2021 08:59:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1637657979;
        bh=t/gUEDOBdM1UCI0WmkeX1KtMXFcTgwkgemaCIxITYHY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=I7IpFoGVB5tgvjRxlZrD2qkC+H+rNGmRPkxfaB5wzULjgQfZUaNK7BRMjsdTbZtmP
         UnEmyA7s4TfMrcj61fDL92dDrPVj1gyB5LQMfNHR7qQbfeCwbA/18WotgYYNm2r3m7
         JMet1PTCkRGOG0m/7Hb1DS7JrDhL4OwHi7wALEMYK3Cl3gpk6kmpHDKAbahi8O/G6B
         NA4K+lrIckc4nOGpDJlo5hOo1mSnFsq4Wogrwf5dXZAKuRKCOeZ0GGA2TxFt68gwgB
         4e4Q1qly3SP48vwrHoSNyZ9iOCqA2SN+06+YWAkK4WKh1tqODKL+THX2yq6eEHH/z1
         Uinkr9RPeU+Vw==
Received: from johan by xi.lan with local (Exim 4.94.2)
        (envelope-from <johan@kernel.org>)
        id 1mpRe3-0006ev-Fy; Tue, 23 Nov 2021 09:59:19 +0100
Date:   Tue, 23 Nov 2021 09:59:19 +0100
From:   Johan Hovold <johan@kernel.org>
To:     Anton Lundin <glance@acc.umu.se>
Cc:     linux-usb@vger.kernel.org
Subject: Re: pl2303 converter detected, unknown device type
Message-ID: <YZytZ/vRioINvb14@hovoldconsulting.com>
References: <20211123071613.GZ108031@montezuma.acc.umu.se>
 <YZyijnKD7dixoaV+@hovoldconsulting.com>
 <20211123083430.GA108031@montezuma.acc.umu.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211123083430.GA108031@montezuma.acc.umu.se>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Nov 23, 2021 at 09:34:30AM +0100, Anton Lundin wrote:
> On 23 November, 2021 - Johan Hovold wrote:
> 
> > On Tue, Nov 23, 2021 at 08:16:13AM +0100, Anton Lundin wrote:
> > > I just picked up a new usb-rs232 adapter and was met by the following on
> > > a modern kernel:
> > > 
> > > # uname -r
> > > 5.16.0-rc2
> > > 
> > > usb 3-7: new full-speed USB device number 5 using xhci_hcd
> > > usb 3-7: New USB device found, idVendor=067b, idProduct=23a3, bcdDevice= 1.05
> > > usb 3-7: New USB device strings: Mfr=1, Product=2, SerialNumber=0
> > > usb 3-7: Product: ATEN USB to Serial Bridge
> > > usb 3-7: Manufacturer: Prolific Technology Inc.
> > > pl2303 3-7:1.0: pl2303 converter detected
> > > pl2303 3-7:1.0: unknown device type, please report to linux-usb@vger.kernel.org
> > 
> > > I'm guessing it just needs a case for this bcdDevice.
> > 
> > Indeed, and thanks for reporting this. I'll add the missing entry.
> > 
> > Do you know what kind of PL2303 this is (e.g. PL2303GC)?
> 
> Sorry nope. The device is potted with some kind of opaque plastic, so I
> can see that there are two qfp's on the board, but not the numbers on
> them.

Ok, thanks for checking. Judging from the Prolific site the only G type
device that comes in a QFP type package appears to be PL2303GC.

> If there is some way of identifying the chip I can build a custom driver
> that can read out any information if that helps.

Thanks. Currently bcdDevice is the only known way to do this, but I may
get back to you on this later.

Let's assume it's a PL2303GC for now.

Johan
