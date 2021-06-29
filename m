Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9912E3B7717
	for <lists+linux-usb@lfdr.de>; Tue, 29 Jun 2021 19:21:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233961AbhF2RXX (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 29 Jun 2021 13:23:23 -0400
Received: from mail.kernel.org ([198.145.29.99]:60302 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233905AbhF2RXW (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 29 Jun 2021 13:23:22 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id D9A1C61D8A;
        Tue, 29 Jun 2021 17:20:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1624987255;
        bh=z2AU0lngbSrFPnRBOSAZ6kVGU1SgF+c085mmdUJkwrU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Q6iuQXyjQ6HX4k7sqrJDoHCO/AHW3q6k+itFdViXfO9Yj4GIIr5tyNxcv3KIGx6Xz
         orzhbGRybhBa+i9kJlluXCPnJhI/A1eZ7SMlr0RON8DinDxoERLIZVqmGe/GssNt7e
         fRaMl5wUOHdBPwY9PIhVe5uWzXvlsd+xaLN/7Qog=
Date:   Tue, 29 Jun 2021 19:19:46 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Benjamin Marty <benjamin.marty@gmail.com>
Cc:     linux-usb@vger.kernel.org
Subject: Re: USB Gadget Filesystem HID stuck on write when using mass storage
 at the same time
Message-ID: <YNtWMnNUsuL5YE3g@kroah.com>
References: <CABSdY3LGN202SN5YJxnk_bMAx2-js=AB0hictqo69ENgWbMQSw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CABSdY3LGN202SN5YJxnk_bMAx2-js=AB0hictqo69ENgWbMQSw@mail.gmail.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Jun 29, 2021 at 03:45:46PM +0200, Benjamin Marty wrote:
> Hello
> 
> In my application, I boot a Linux System through USB Gadget mass
> storage and at the same time pass in USB Touch commands via USB HID
> Device. Both over the same USB OTG Gadget Link.
> 
> If I execute USB HID commands during high traffic over the USB Mass
> Storage, the HID device gets stuck. Writes to it are then blocking
> forever. I'm not sure if I use something wrong or if this is a Kernel
> issue. Do I maybe need to check something before I'm allowed to write
> to the HID device?
> 
> Hardware issue are unlikely, I tried it on the Raspberry Pi Platform
> and also on the NXP iMX8MM platform. Both have this HID device stuck
> issue. I have also tried multiple Intel Computers as USB Host.
> 
> I tried to document my issue here with test scripts to replicate what
> I do in my C Application with the same result:
> https://github.com/raspberrypi/linux/issues/4373

What kernel version are you using for your device?

What is locking up, the kernel on the device, or the kernel on the USB
host side?

And have you used usbmon to look at the USB traffic to ensure that you
really are sending the data you think you are sending?

thanks,

greg k-h
