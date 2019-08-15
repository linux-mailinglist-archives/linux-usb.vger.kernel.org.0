Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 42C2D8E7DA
	for <lists+linux-usb@lfdr.de>; Thu, 15 Aug 2019 11:12:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731006AbfHOJMY (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 15 Aug 2019 05:12:24 -0400
Received: from mail.kernel.org ([198.145.29.99]:53950 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731003AbfHOJMY (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 15 Aug 2019 05:12:24 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 9E45C2063F;
        Thu, 15 Aug 2019 09:12:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1565860343;
        bh=PgA+KYfqJcFsqXw2u5nG8mnyYB8ncpHlkucqapPf9jw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=m0FtXlB4P6UigI38N+57x0iIOUapFY+SKKSKP4KG3qsSFu0trUc42QqxsWM3tbcmU
         9PpCEujtdnCu3FQj2vB1gmEmaswqt3+VFH1+AtsaFyKRalj+u2f4JsH/FJq/Cz4De3
         7QfsemorJx6yVhWOEG+rsIaM2zefVk59ioB+Jo4c=
Date:   Thu, 15 Aug 2019 11:12:20 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Bjoern <lkml@call-home.ch>
Cc:     linux-usb@vger.kernel.org
Subject: Re: USB disconnect due to error from flowcontrol urb
Message-ID: <20190815091220.GA14172@kroah.com>
References: <b2eb7947-7b13-ab50-1f89-79268a2da063@call-home.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b2eb7947-7b13-ab50-1f89-79268a2da063@call-home.ch>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Aug 15, 2019 at 10:41:05AM +0200, Bjoern wrote:
> Hi,
> 
> 
> I'm running on Ubuntu Bionic 4.14.94-155 on an odroid-x4 (armhf).
> 
> 
> I have a FT230X Basic UART (0403:6015) plugged into the exynos-ohci USB. The
> device is linked via a udev rule to a "symbolic/virtual" device so that the
> software FHEM can address it independent of the real ttyUSB* name.
> 
> 
> I constantly see disconnects for the device in the kernel log, see log
> excerpts below. I've found similar issues online going back till 2012 but
> there seems to be no solution so far. I'd like to help find the cause if
> possible.
> 
> Regards,
> Bjoern
> 
> 
> Aug  4 11:25:11 fhem2 kernel: [2476586.963898] usb 2-1: USB disconnect,
> device number 66

Your device removed itself from the system electronically, the other
errors you report here are the kernel trying to clean up after itself.

Try fixing the cable for the device, or the power provided to it, this
is a physical issue, not a logical one that the kernel can help with,
sorry.

thanks,

greg k-h
