Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5DD3C28F215
	for <lists+linux-usb@lfdr.de>; Thu, 15 Oct 2020 14:30:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727833AbgJOMaZ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 15 Oct 2020 08:30:25 -0400
Received: from wout3-smtp.messagingengine.com ([64.147.123.19]:46203 "EHLO
        wout3-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726583AbgJOMaZ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 15 Oct 2020 08:30:25 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailout.west.internal (Postfix) with ESMTP id 0DDA0B00;
        Thu, 15 Oct 2020 08:30:23 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute4.internal (MEProxy); Thu, 15 Oct 2020 08:30:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm2; bh=BplhaW58a06jTA0FvzAeTYIFSqJ
        kzLvT0Cslh1vcjQA=; b=MvZ1DGSwO1Kz3iKMFh4ACMx2Y27VVMwpw/R5vVPlBH7
        dP3BgzWGZiRUVeKBWhe7zXxXE55e4XYrIal37O1/rgg+68oa5pz8jhJIDbrTc1Ik
        9jJITHxpzr7jKdExSj1HawFNJsS+H7lrOdQ8ewPy8vY+e+WDivh7brTYiBLxo1bD
        +RwOEp65sH0isYDkrvmTp2fVxgjwNlaz+1xOyZyxyrZvLCn2hd/pwGmhd+xB7NIj
        JO+4HSsxnIog3WC3meBsWYp92TZxTUsIaGFHrpbTFLRo+oJtUDOwdHy5TyOlK64O
        dttodRRzp7jmAYXnx+V7E32JclMSsSGng3Lf5x26xIw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=BplhaW
        58a06jTA0FvzAeTYIFSqJkzLvT0Cslh1vcjQA=; b=SlRgJ4zCJhXLIvm98S7Ntz
        4amdoVhzB/pR7eOmss4oaPD56URZS592+e2Bk8K4BE3MX1W76X4sZWKzYRrFkW1v
        sg/tZXli6vjzPP56duSPzONOYdYxUinVUsdRQs17lwl5gRQ1IEmiNcdlSrL0mRmS
        nHwqRvZBvt34f+N8YViXb5OuLpJc5g0FnEO2bNGl76heloqsimChUSDlu75rk/6N
        Yl3YVe+sX1HyQ9Z1BZ98mL+ToTh4X2SIXOYdQTipqPIxy3xZfJGPtvQB9L7WEAZH
        c5UQDqTjjkbh9YxwzmCfck314Py+RmHNHzRl6q1IxmHdihVwo/HTBRNWJVAKeZfg
        ==
X-ME-Sender: <xms:30CIXzE0l8iOVRerN1nKDk3Gy-vmF9vYIRb_Jx14q2la27xf6Q1g7g>
    <xme:30CIXwVbZySYzhusZ8dPmT5WbgCiGmTe4boAWyGN_A3AfoxFzmjbKAPW-htaFwiPW
    w4xdqowY3T5cg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrieefgdehvdcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepifhrvghgucfm
    jfcuoehgrhgvgheskhhrohgrhhdrtghomheqnecuggftrfgrthhtvghrnhepveeuheejgf
    ffgfeivddukedvkedtleelleeghfeljeeiueeggeevueduudekvdetnecukfhppeekfedr
    keeirdejgedrieegnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilh
    hfrhhomhepghhrvghgsehkrhhorghhrdgtohhm
X-ME-Proxy: <xmx:30CIX1KXxJFPSxerm5zPOIc3UHPDtKFkZAPICvAjkH40ISoTFlfW9A>
    <xmx:30CIXxGGI5HXPJEXtI-9X_9g66kC1T-TstqQ1nfPDj6inWqZ0ufuuA>
    <xmx:30CIX5Ufg0iMXRz-DEEDmzytQuXgQ9-Hz4eqH58Hish_ap3Gujixdg>
    <xmx:30CIX6eMetkcbyphv_jB7mN64sSHjugFOK8pgX2bvqGYLmOx-w_e2w>
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
        by mail.messagingengine.com (Postfix) with ESMTPA id 160AA3280066;
        Thu, 15 Oct 2020 08:30:22 -0400 (EDT)
Date:   Thu, 15 Oct 2020 14:30:56 +0200
From:   Greg KH <greg@kroah.com>
To:     Lucas Tanure <tanure@linux.com>
Cc:     linux-usb@vger.kernel.org, kernelnewbies@kernelnewbies.org
Subject: Re: USB Question about devices being reconnected to the host
Message-ID: <20201015123056.GA4021854@kroah.com>
References: <d4c94e87-a1bb-18d5-054f-2e6ed01fab5b@linux.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d4c94e87-a1bb-18d5-054f-2e6ed01fab5b@linux.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Oct 15, 2020 at 01:17:45PM +0100, Lucas Tanure wrote:
> Hi,
> 
> I'm learning about USB drivers and I would like to know about disconnecting
> and reconnecting usb devices.
> 
> I can see my probe function being called and also the disconnect function.
> But if I reconnect the device there is no call from the kernel to notify my
> driver about the device being reconnected.

That's not good, your driver should be told this.

> I can also see that the module for my driver was not unloaded, so I dont
> understand the life cycle of a USB device.

Modules are never auto-unloaded.

> If the module is not unloaded at disconnection and re-loaded for a new
> device being connected, how can the driver know the device is there after a
> disconnection?

The probe function should be called, are you sure it isn't?


> 
> Thanks
> Lucas
> 
> This is my dmesg for the driver at the end of this email:
> 
> [   34.706041] usb 1-1.1.2: new high-speed USB device number 5 using dwc_otg
> [   34.837647] usb 1-1.1.2: New USB device found, idVendor=04b4,
> idProduct=00f1, bcdDevice= 0.00
> [   34.837666] usb 1-1.1.2: New USB device strings: Mfr=1, Product=2,
> SerialNumber=0
> [   34.837679] usb 1-1.1.2: Product: FX3
> [   34.837693] usb 1-1.1.2: Manufacturer: Cypress
> [   34.902480] usbdev_probe
> [   34.902681] usbcore: registered new interface driver My USB Device
> [   45.416310] usb 1-1.1.2: USB disconnect, device number 5
> [   45.416655] usbdev_disconnect
> [   61.326035] usb 1-1.1.2: new high-speed USB device number 6 using dwc_otg
> [   61.457674] usb 1-1.1.2: New USB device found, idVendor=04b4,
> idProduct=00f1, bcdDevice= 0.00
> [   61.457692] usb 1-1.1.2: New USB device strings: Mfr=1, Product=2,
> SerialNumber=0
> [   61.457706] usb 1-1.1.2: Product: FX3
> [   61.457720] usb 1-1.1.2: Manufacturer: Cypress

That is odd, sorry, don't know what to suggest.

greg k-h
