Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3968F3B7FED
	for <lists+linux-usb@lfdr.de>; Wed, 30 Jun 2021 11:28:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233750AbhF3Jac (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 30 Jun 2021 05:30:32 -0400
Received: from mail.kernel.org ([198.145.29.99]:58694 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233541AbhF3Jab (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 30 Jun 2021 05:30:31 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id C506461D08;
        Wed, 30 Jun 2021 09:28:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1625045283;
        bh=uulr+6EBInk7XkX/ZQTV8ZCrjbnAVIOZEZjoVzjfCzI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=2JjfpT+X36aeKuNSlOfo+ZkmwDowCT7iVu1+/1EBLu1JA5hQIhU8b35ZzduxY35QP
         JVTyiFIlnUIPLDE0VEDZGeGlUNBip5j/2aheXuDDniZDzG1YqFrYg+LK3DCHDVajuI
         l0G9dcorzIIJGzPedavswip4CSfVtI1Qxqml9aVc=
Date:   Wed, 30 Jun 2021 11:28:01 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Benjamin Marty <benjamin.marty@gmail.com>
Cc:     linux-usb@vger.kernel.org
Subject: Re: USB Gadget Filesystem HID stuck on write when using mass storage
 at the same time
Message-ID: <YNw5Iemje5SddNzc@kroah.com>
References: <CABSdY3LGN202SN5YJxnk_bMAx2-js=AB0hictqo69ENgWbMQSw@mail.gmail.com>
 <YNtWMnNUsuL5YE3g@kroah.com>
 <CABSdY3KORj8JNg8PATysXSaWjWVfHHA-uFhEEY4f-U8nvOUCWw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CABSdY3KORj8JNg8PATysXSaWjWVfHHA-uFhEEY4f-U8nvOUCWw@mail.gmail.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

A: http://en.wikipedia.org/wiki/Top_post
Q: Were do I find info about this thing called top-posting?
A: Because it messes up the order in which people normally read text.
Q: Why is top-posting such a bad thing?
A: Top-posting.
Q: What is the most annoying thing in e-mail?

A: No.
Q: Should I include quotations after my reply?

http://daringfireball.net/2007/07/on_top

On Wed, Jun 30, 2021 at 10:55:04AM +0200, Benjamin Marty wrote:
> On the iMX8 device `Linux imx8mm-var-dart 5.4.3-g050b21f4b394 #1 SMP
> PREEMPT Fri Oct 9 11:36:53 PDT 2020 aarch64 GNU/Linux` and on the
> Raspberry Pi device `Linux raspberry 5.10.17-v7l+ #1403 SMP Mon Feb 22
> 11:33:35 GMT 2021 armv7l GNU/Linux`.

I do not understand, which is the host and which is the gadget here?

> File write to `/dev/hidg0` starts to hang when there was high mass
> storage traffic. It also doesn't recover itself. There is no `complete
> kernel lockup`.

File write on the host or gadget?

If things are not locked up, what is stalled?

> I haven't used usbmon yet but if I don't have high traffic scenarios
> on the mass storage then the mass storage and HID device works as
> expected. So I'm confident that I send the correct data.

That's fine, but it is good to use usbmon to see what the errors are as
well when things go wrong.

> Also saw that I'm getting this error in dmesg on both devices:
> [ 1895.677053] configfs-gadget gadget: End Point Request ERROR: -108

Ah, is your userspace code on the gadget not handling this properly?
What userspace code is running on the gadget for your USB device
emulation?

thanks,

greg k-h
