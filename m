Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6D6BCB4D56
	for <lists+linux-usb@lfdr.de>; Tue, 17 Sep 2019 14:03:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727113AbfIQMDD (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 17 Sep 2019 08:03:03 -0400
Received: from mail.kernel.org ([198.145.29.99]:43442 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726763AbfIQMDD (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 17 Sep 2019 08:03:03 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 699A9214AF;
        Tue, 17 Sep 2019 12:03:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1568721780;
        bh=dxP7C9JxKzU2DX/i4t8DKrJNp2XcqYfOs5eLUbvoIyk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=E80o9iDMM+rY3tCMLOEYB0ft0+pVU7AZbnNvd9w9YLZlG4JrYMM2aMNFRD7MwZ4Bl
         wG1ylNwDpAW3H+pT/bUjbE+/ras+fmd0e4JOZlxAoj18VF2p1b2pikoOChA2BL3dhK
         bOicph25kRjN7u1EoRyzjhogdiyS4HTlGCOgd0v8=
Date:   Tue, 17 Sep 2019 14:02:58 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     JH <jupiter.hce@gmail.com>
Cc:     linux-usb@vger.kernel.org
Subject: Re: Failed to connect to 4G modem
Message-ID: <20190917120258.GB489142@kroah.com>
References: <CAA=hcWRF00syz8jB1+qdy1pFA7Wk_B=1Z_DT5vYuQrzFKhtZbw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAA=hcWRF00syz8jB1+qdy1pFA7Wk_B=1Z_DT5vYuQrzFKhtZbw@mail.gmail.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Sep 17, 2019 at 09:29:34PM +1000, JH wrote:
> Hi,
> 
> I am running kernel LTS 4.19 in an i.MX6 board with a 4G LTE modem, it
> continually displayed following messages in a serial port tried and
> failed to connect to LTE modem, are there any problems in kernel 4.19
> LTS to support usb qmi protocol and LTE modem connection?
> 
> I did try the kernel version 5.1, it can connect to the modem, but
> failed in couple of hours or days, when it disconnected, it got the
> same following messages.
> 
> Are there serious problems in kernel to support usb qmi LTE modem
> communication and connection?
> 
> [   43.837243] option1 ttyUSB0: GSM modem (1-port) converter now disconnected f0
> [   43.882941] option 1-1:1.0: device disconnected
> [   43.942788] option1 ttyUSB1: GSM modem (1-port) converter now disconnected f1
> [   44.001445] option 1-1:1.2: device disconnected
> [   44.011575] qmi_wwan 1-1:1.3: nonzero urb status received: -71
> [   44.017461] qmi_wwan 1-1:1.3: wdm_int_callback - 0 bytes
> [   44.022801] qmi_wwan 1-1:1.3: wdm_int_callback - usb_submit_urb failed with 9
> [   44.059958] qmi_wwan 1-1:1.3 wwan0: unregister 'qmi_wwan' usb-ci_hdrc.1-1, We
> [   47.675604] usb 1-1: new high-speed USB device number 5 using ci_hdrc
> [   47.905246] usb 1-1: New USB device found, idVendor=05c6, idProduct=90b2, bc0
> [   47.913732] usb 1-1: New USB device strings: Mfr=3, Product=2, SerialNumber=4
> [   47.921099] usb 1-1: Product: Qualcomm CDMA Technologies MSM
> [   47.927087] usb 1-1: Manufacturer: Qualcomm, Incorporated
> [   47.932746] usb 1-1: SerialNumber: 5ff10299
> [   47.964528] option 1-1:1.0: GSM modem (1-port) converter detected
> [   47.989484] usb 1-1: GSM modem (1-port) converter now attached to ttyUSB0
> [   48.014760] option 1-1:1.2: GSM modem (1-port) converter detected
> [   48.026996] usb 1-1: GSM modem (1-port) converter now attached to ttyUSB1
> [   48.048810] qmi_wwan 1-1:1.3: cdc-wdm0: USB WDM device
> [   48.082751] qmi_wwan 1-1:1.3 wwan0: register 'qmi_wwan' at usb-ci_hdrc.1-1, 8
> [   51.581595] usb 1-1: USB disconnect, device number 5
> [   51.613737] option1 ttyUSB0: GSM modem (1-port) converter now disconnected f0
> [   51.644564] option 1-1:1.0: device disconnected
> [   51.713919] option1 ttyUSB1: GSM modem (1-port) converter now disconnected f1
> [   51.771139] option 1-1:1.2: device disconnected

The device is disconnecting itself from the USB bus, and then connecting
itself, and then disconnecting...

Probably an electrical issue, the kernel can not disconnect a device
directly from the USB bus, that information comes from the USB hub
itself.

Try your connections.

thanks,

greg k-h
