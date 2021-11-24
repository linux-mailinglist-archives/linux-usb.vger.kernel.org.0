Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4A02C45B4DC
	for <lists+linux-usb@lfdr.de>; Wed, 24 Nov 2021 08:04:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239962AbhKXHHg (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 24 Nov 2021 02:07:36 -0500
Received: from mail.kernel.org ([198.145.29.99]:39466 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230070AbhKXHHf (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 24 Nov 2021 02:07:35 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8FB4960231;
        Wed, 24 Nov 2021 07:04:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1637737466;
        bh=BahlYYdOYxPLnTgI1Rc+nTu0PEzgJtejclHiwxWA4nU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=rVGmrCd6Ti5x3xdRbD0tSNoRycEoQt0ZOg8XOvQ2J2t+HTiVSp+GuUrV96oMjGuik
         WWfreS5dM+KcLBVvYzRqC95skEmy/TzaABiL6DR431QAxpjM8rBkq+hwNV7Rzu++o0
         oVNi8gbpqE8B3Lln2GHrVDNQe8z8+KaSdVKUdCYs=
Date:   Wed, 24 Nov 2021 08:04:21 +0100
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Jupiter <jupiter.hce@gmail.com>
Cc:     linux-usb <linux-usb@vger.kernel.org>
Subject: Re: Kernel 5.10 USB issues
Message-ID: <YZ3j9XKE0WjfkcsI@kroah.com>
References: <CAA=hcWTukyvM0Hz-VgW_NG7Whc3i7GLGySzJ0iGHvxo3O1f5vQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAA=hcWTukyvM0Hz-VgW_NG7Whc3i7GLGySzJ0iGHvxo3O1f5vQ@mail.gmail.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Nov 24, 2021 at 11:46:06AM +1100, Jupiter wrote:
> Hi,
> 
> I connected a USB bus between an iMX6ULZ and an 4G LTE modem, it was
> running well in kernel 4.19.75. I've just upgraded kernel to 5.10.59,
> the USB is broken, the USB drivers were disconnected / connected
> repeatedly:
> 
> [12781.730889] usb 1-1: USB disconnect, device number 84
> [12781.808317] option1 ttyUSB0: GSM modem (1-port) converter now
> disconnected from ttyUSB0

That is usually a hardware problem, the kernel can not disconnect a
device from the bus through software.

But, if 4.19 is working, can you use 'git bisect' between the two
kernels to find what caused the problem?

thanks,

greg k-h
