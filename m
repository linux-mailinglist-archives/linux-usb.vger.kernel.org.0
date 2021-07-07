Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0E7B73BE3C5
	for <lists+linux-usb@lfdr.de>; Wed,  7 Jul 2021 09:41:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231147AbhGGHoO (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 7 Jul 2021 03:44:14 -0400
Received: from mail.kernel.org ([198.145.29.99]:53232 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230461AbhGGHoK (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 7 Jul 2021 03:44:10 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 96AA661C9D;
        Wed,  7 Jul 2021 07:41:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1625643689;
        bh=z/jxh6yzQSQpIOWYaHw55EuJmQqmhXC2mtzXrCTw0i0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=gzUqVGEVd+Z+AiT0OenqSq8igIlYxLI2dnWR6k+fLa8dwwkdjjZmYFEfWZ0N/JYd9
         v5Qd4JGjvLpre9dPhACR/39BgKQpHGrRke+0j0T+oUxsCbZ6mTYz8/XjmJcjAajfz5
         hpL8JN+bvdqIwFx7i5cApK7YoJzCJIIyI+797esM=
Date:   Wed, 7 Jul 2021 09:41:26 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Jeffrey Walton <noloader@gmail.com>
Cc:     linux-usb@vger.kernel.org
Subject: Re: CH341 driver and the 5.4 kernel
Message-ID: <YOVapvO9N8FhsIUC@kroah.com>
References: <CAH8yC8=9arZhsPruxMmT+NL65=-YB57Mzg0fVfRdjMy5bmBbdg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAH8yC8=9arZhsPruxMmT+NL65=-YB57Mzg0fVfRdjMy5bmBbdg@mail.gmail.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Jul 07, 2021 at 03:33:52AM -0400, Jeffrey Walton wrote:
> Hi Everyone,
> 
> I'm trying to track down the cause of some garbage in a response when
> using an ELM327 (https://www.elmelectronics.com/ic/elm327/) with a
> CH341 serial controller.
> 
> I see there's been a fair amount of activity with the CH341
> (https://github.com/torvalds/linux/commits/master/drivers/usb/serial/ch341.c),
> but I can't tell if its been backported to the 5.4 kernel.
> Specifically, the 5.4.0-77 kernel supplied with Ubuntu 18.04 and Mint
> 20.1.

Who knows what has been backported to random vendor kernels like this :)

Look at the source and see!

> Does anyone know if the fixes and improvements for the CH341 have made
> their way into the 5.4 kernel?

What specific commit are you looking for?

And if you want to use this device, why not use a much more modern
kernel release?  5.4 is quite old for new hardware to be using, does
5.13 work properly for you?

thanks,

greg k-h
