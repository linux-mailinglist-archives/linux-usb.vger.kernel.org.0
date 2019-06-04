Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8EEB733E7B
	for <lists+linux-usb@lfdr.de>; Tue,  4 Jun 2019 07:38:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726638AbfFDFi4 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 4 Jun 2019 01:38:56 -0400
Received: from mail.kernel.org ([198.145.29.99]:57550 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726427AbfFDFi4 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 4 Jun 2019 01:38:56 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 820E824E0A;
        Tue,  4 Jun 2019 05:38:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1559626736;
        bh=699nDgaZYC1loH6CvgYXp5jVup0tS2hkcH2TvZdZ2Lw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=d4TJceFIbdS3xFEG8FmxiPAYWbKhGWPdCfNYLjJuI1QtIjCQFsSBg6JuHxrIXhvGn
         UFTrdn6x2yz+JHHJ/thGwmGklje6ZFrMeA3vXuezBRvHcpxMezNnto/pBLssdk7ds3
         5aZPhPm+kKCHBLqiL2Fe6Bu2NDybdfPjQZdDqZuM=
Date:   Tue, 4 Jun 2019 07:38:53 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Alan Stern <stern@rowland.harvard.edu>, linux-usb@vger.kernel.org
Subject: Re: Extending USB_CONNECTINFO ioctl
Message-ID: <20190604053853.GC1588@kroah.com>
References: <20190604002410.GA36666@dtor-ws>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190604002410.GA36666@dtor-ws>
User-Agent: Mutt/1.12.0 (2019-05-25)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Jun 03, 2019 at 05:24:10PM -0700, Dmitry Torokhov wrote:
> Hi Alan, Greg,
> 
> When running software in a jailed environment where sysfs or udev is not
> readily available and one can only have an FD to usbdevfs device passed
> into the jail, there is a desire to allow libusb working. Alan recently
> added USBDEVFS_GET_SPEED, but we are still missing bus number and list
> of port numbers on the way to the root to be able to better identify the
> device in question.
> 
> What do you think about adding a new ioctl:
> 
> struct usbdevfs_connectinfo_ex {
> 	__u32 size;		/* size of the structure from the kernel POV */
> 	__u32 busnum;
> 	__u32 devnum;
> 	__u32 speed;		/* USB_SPEED_* form ch9.h */
> 	u8 num_ports;		/* Number of entries in port_numbers array */
> 	u8 port_numbers[31];	/* Current limit in USB3.0 spec is 7 */
> };
> 
> /*
>  * Returns struct usbdevfs_connectinfo_ex; length is variable to allow
>  * extending size of the data returned.
>  */
> #define USBDEVFS_CONNINFO_EX(len)  _IOC(_IOC_READ, 'U', 32, len)

Sounds reasonable, as long as you get the 'variable data' portion
correct :)

thanks,

greg k-h
