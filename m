Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6847F157E7E
	for <lists+linux-usb@lfdr.de>; Mon, 10 Feb 2020 16:12:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728360AbgBJPMR (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 10 Feb 2020 10:12:17 -0500
Received: from netrider.rowland.org ([192.131.102.5]:52535 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1727347AbgBJPMR (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 10 Feb 2020 10:12:17 -0500
Received: (qmail 18190 invoked by uid 500); 10 Feb 2020 10:12:15 -0500
Received: from localhost (sendmail-bs@127.0.0.1)
  by localhost with SMTP; 10 Feb 2020 10:12:15 -0500
Date:   Mon, 10 Feb 2020 10:12:15 -0500 (EST)
From:   Alan Stern <stern@rowland.harvard.edu>
X-X-Sender: stern@netrider.rowland.org
To:     Martin Townsend <mtownsend1973@gmail.com>
cc:     linux-usb@vger.kernel.org
Subject: Re: Enumerating USB devices in the Bootloader
In-Reply-To: <CABatt_xcct6nNp6OELNMO3-R+JPLdh_bn6pH5RxyWQu=m9NhGw@mail.gmail.com>
Message-ID: <Pine.LNX.4.44L0.2002101005210.14460-100000@netrider.rowland.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, 10 Feb 2020, Martin Townsend wrote:

> Hi,
> 
> We are using the USB mass storage gadget driver in Linux and
> everything is working fairly well but sometimes we are finding that we
> are exceeding the 100mA limit (which I think is the default the host
> will provide) before Linux has had a change to enumerate the USB
> device at which point we ask for 500mA.  We have tried to reduce the
> power by ensuring all clocks are turned off, devices not used disabled
> etc but can't seem to satisfy the 100mA limit.  We were thinking that
> maybe we could enumerate the USB device during U-Boot at which point
> we know we are under the 100mA limit.  Does anyone know a reason why
> this would not work?

It won't work because U-Boot isn't the kernel.  When the kernel takes 
over the USB controller, it will force the host to re-enumerate the 
gadget -- and you will be right back where you started.

The only way to make this work would be to prevent U-Boot from ever 
actually booting the Linux kernel.  This probably isn't the way you 
want your device to behave, though.

> would at some point from U-Boot enumerating a new
> bMaxPower would the connection be reset and drop back to 100mA during
> the kernel startup? Are there any considerations that we would need to
> take care of in the kernel for this to work?

If you can't satisfy the 100-mA current limit then you should make your
device be self-powered instead of relying on power delivered over the
USB bus.

Be aware also that bus-powered USB-2 hubs can't deliver 500 mA to their
downstream ports.  They are always limited to 100 mA or less.  If your
gadget was plugged into one of them, it wouldn't be able to work at 
all.

Alan Stern

