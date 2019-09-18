Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D9DF0B5B0C
	for <lists+linux-usb@lfdr.de>; Wed, 18 Sep 2019 07:47:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727953AbfIRFrs (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 18 Sep 2019 01:47:48 -0400
Received: from mail.kernel.org ([198.145.29.99]:55738 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727945AbfIRFrs (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 18 Sep 2019 01:47:48 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 4F7E6214AF;
        Wed, 18 Sep 2019 05:47:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1568785667;
        bh=JvQGxHUosBmhgnXfyjkkAJzkNVtxzzxd9MGeUZKkudU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=N8Ze+cPjeYEiUy6sCxlJgV5RsjyqWtSEO0KNeNmrpm9wudZU67WzkDkrWUUKqUZt5
         wcFeHvLGkcpFjLRVzPRuHxt85NLfH0erFnK05JfDW8ClFIn5uVVzc4BSxXmtZDCjfR
         f+bMZDMiyreFkUdM/OPkB/Y6GHdmT+U1GtmiS8Lw=
Date:   Wed, 18 Sep 2019 07:47:44 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     JH <jupiter.hce@gmail.com>
Cc:     linux-usb@vger.kernel.org
Subject: Re: Failed to connect to 4G modem
Message-ID: <20190918054744.GA1830105@kroah.com>
References: <CAA=hcWRF00syz8jB1+qdy1pFA7Wk_B=1Z_DT5vYuQrzFKhtZbw@mail.gmail.com>
 <20190917120258.GB489142@kroah.com>
 <CAA=hcWTD2zYD0gVTu6sDuRqUcTOnn42Gm0s1tOGvBQdQ40Q7LA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAA=hcWTD2zYD0gVTu6sDuRqUcTOnn42Gm0s1tOGvBQdQ40Q7LA@mail.gmail.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Sep 18, 2019 at 07:38:14AM +1000, JH wrote:
> Hi Greg,
> 
> On 9/17/19, Greg KH <gregkh@linuxfoundation.org> wrote:
> > On Tue, Sep 17, 2019 at 09:29:34PM +1000, JH wrote:
> >> Hi,
> >>
> >> I am running kernel LTS 4.19 in an i.MX6 board with a 4G LTE modem, it
> >> continually displayed following messages in a serial port tried and
> >> failed to connect to LTE modem, are there any problems in kernel 4.19
> >> LTS to support usb qmi protocol and LTE modem connection?
> >>
> >> I did try the kernel version 5.1, it can connect to the modem, but
> >> failed in couple of hours or days, when it disconnected, it got the
> >> same following messages.
> >>
> >> Are there serious problems in kernel to support usb qmi LTE modem
> >> communication and connection?
> >>
> >> [   43.837243] option1 ttyUSB0: GSM modem (1-port) converter now
> >> disconnected f0
> >> [   43.882941] option 1-1:1.0: device disconnected
> >> [   43.942788] option1 ttyUSB1: GSM modem (1-port) converter now
> >> disconnected f1
> >> [   44.001445] option 1-1:1.2: device disconnected
> >> [   44.011575] qmi_wwan 1-1:1.3: nonzero urb status received: -71
> >> [   44.017461] qmi_wwan 1-1:1.3: wdm_int_callback - 0 bytes
> >> [   44.022801] qmi_wwan 1-1:1.3: wdm_int_callback - usb_submit_urb failed
> >> with 9
> >> [   44.059958] qmi_wwan 1-1:1.3 wwan0: unregister 'qmi_wwan'
> >> usb-ci_hdrc.1-1, We
> >> [   47.675604] usb 1-1: new high-speed USB device number 5 using ci_hdrc
> >> [   47.905246] usb 1-1: New USB device found, idVendor=05c6,
> >> idProduct=90b2, bc0
> >> [   47.913732] usb 1-1: New USB device strings: Mfr=3, Product=2,
> >> SerialNumber=4
> >> [   47.921099] usb 1-1: Product: Qualcomm CDMA Technologies MSM
> >> [   47.927087] usb 1-1: Manufacturer: Qualcomm, Incorporated
> >> [   47.932746] usb 1-1: SerialNumber: 5ff10299
> >> [   47.964528] option 1-1:1.0: GSM modem (1-port) converter detected
> >> [   47.989484] usb 1-1: GSM modem (1-port) converter now attached to
> >> ttyUSB0
> >> [   48.014760] option 1-1:1.2: GSM modem (1-port) converter detected
> >> [   48.026996] usb 1-1: GSM modem (1-port) converter now attached to
> >> ttyUSB1
> >> [   48.048810] qmi_wwan 1-1:1.3: cdc-wdm0: USB WDM device
> >> [   48.082751] qmi_wwan 1-1:1.3 wwan0: register 'qmi_wwan' at
> >> usb-ci_hdrc.1-1, 8
> >> [   51.581595] usb 1-1: USB disconnect, device number 5
> >> [   51.613737] option1 ttyUSB0: GSM modem (1-port) converter now
> >> disconnected f0
> >> [   51.644564] option 1-1:1.0: device disconnected
> >> [   51.713919] option1 ttyUSB1: GSM modem (1-port) converter now
> >> disconnected f1
> >> [   51.771139] option 1-1:1.2: device disconnected
> >
> > The device is disconnecting itself from the USB bus, and then connecting
> > itself, and then disconnecting...
> >
> > Probably an electrical issue, the kernel can not disconnect a device
> > directly from the USB bus, that information comes from the USB hub
> > itself.
> 
> That was always my thought until I tried kernel 5.1 under the same
> platform (nothing changed except the kernel version), the kernel 5.1
> can connect to the 4G modem, I could not tell the hardware engineer if
> it was hardware problem where kernel 5.1 can connect, kernel 4.19
> could not, how would you explain it? Seems some differences between
> kernel 5.1 and kernel 4.19, what I could be missing?
> 
> I cannot use kernel 5, we need kernel LTS on product, too late to wait
> for 5.4 LTS.

Can you use 'git bisect' to find the commit that fixes the issue?  That
way we can backport it to the 4.19.y tree for you.

Otherwise, just use 5.3 now and then 5.4 when it comes out in a few
months.

good luck!

greg k-h
