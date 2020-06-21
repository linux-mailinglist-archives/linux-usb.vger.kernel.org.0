Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D28002029B9
	for <lists+linux-usb@lfdr.de>; Sun, 21 Jun 2020 10:58:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729597AbgFUI6T (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 21 Jun 2020 04:58:19 -0400
Received: from mail.kernel.org ([198.145.29.99]:44688 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727119AbgFUI6T (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sun, 21 Jun 2020 04:58:19 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id B6C7B2488F;
        Sun, 21 Jun 2020 08:58:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1592729899;
        bh=5gmTzLFumfnOLAAa80lJlQwNFMAWd4Yru1ccYGg5fqg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=bxFI2rQB7O33rBXqypF5EXZGBT4HecF6XVcu5cvGv38bP9UYomsstdZbjjnV3KUOf
         GcHihIpKwrxXYPB0kVIzm7WqOfT8Yk/yOBX2Z7M6CLI5+Omiyu2ene1L9hEBg4Yt6I
         ijC1oQnvL8FnZidzyxQg4eR4zF8KyjiVD8JoZI34=
Date:   Sun, 21 Jun 2020 10:58:16 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Jerry <Jerry@jrr.cz>
Cc:     Johan Hovold <johan@kernel.org>, linux-usb@vger.kernel.org
Subject: Re: [PATCH 1/1] usbserial: cp210x - icount support for parity error
 checking
Message-ID: <20200621085816.GB95977@kroah.com>
References: <b4cd2557-9a61-5ccd-32ad-48b0c68bef6b@jrr.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b4cd2557-9a61-5ccd-32ad-48b0c68bef6b@jrr.cz>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sat, Jun 20, 2020 at 09:58:40PM +0200, Jerry wrote:
> usbserial: add cp210x support for icount to detect parity error in received data

Why is this here?

> Motivation - current version of cp210x driver doesn't provide any way to detect
> a parity error in received data from userspace. Some serial protocols like STM32
> bootloader protect data only by even parity so application needs to detect
> whether parity error happened to read again peripheral data.
> 
> I created a simple patch which adds support for icount (ioctl TIOCGICOUNT) which
> sends GET_COMM_STATUS command to CP210X and according received flags increments
> fields for parity error, frame error, break and overrun.
> So application can detect an error condition after reading data from ttyUSB
> and repeat operation. There is no impact for applications which don't
> call ioctl TIOCGICOUNT.
> This patch is also placed at http://yyy.jrr.cz/cp210x.patch (my first patch)

Please read the section entitled "The canonical patch format" in the
kernel file, Documentation/SubmittingPatches for what is needed in order
to properly describe the change.

> Signed-off-by: Jaromir Skorpil <Jerry@jrr.cz>

This does not match your From: line :(

thanks,

greg k-h
