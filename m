Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9E3056008C
	for <lists+linux-usb@lfdr.de>; Fri,  5 Jul 2019 07:21:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726568AbfGEFV0 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 5 Jul 2019 01:21:26 -0400
Received: from mail.kernel.org ([198.145.29.99]:35354 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725778AbfGEFVZ (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 5 Jul 2019 01:21:25 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 30372218A0;
        Fri,  5 Jul 2019 05:21:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1562304084;
        bh=AoN+uc/Wu/YbxrHuBIWfbpVOWeK77tGqGJDmv4kP6TQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=zEFAySMErWv+q0//LQn+pg7XW2zMkZCAnaC2xWvyqYl32OXQm56d6z+EW+b+zTymI
         +fwG0IVI58WL7hRFSOGlivQjzaTXBb+5p/N+gl+SMl24adx6WqB1WUdVG6Jd2egknb
         88voRu+ba/TEVVj02jkTc+1VLQqRoLFsto52nrwo=
Date:   Fri, 5 Jul 2019 07:21:21 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Markus Breunig <Markus.L.Breunig@gmx.net>
Cc:     linux-usb@vger.kernel.org
Subject: Re: Fwd: Re: New USB Device
Message-ID: <20190705052121.GD15821@kroah.com>
References: <5D1D1376.7070202@gmx.net>
 <5D1E65F3.6090307@gmx.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5D1E65F3.6090307@gmx.net>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Jul 04, 2019 at 10:47:47PM +0200, Markus Breunig wrote:
> Hi Greg,
> 
> using a serial device driver is the idea of the manufacturer
> "www.gns-gmbh.com". In the LINUX instructions of the ADS-B receiver some
> hints to use the device are given via usbserial.

Any pointers to those instructions?

> In practice the "GNS 5890 ADS-B Receiver" is similare to some GPS
> Receivers with NMEA 0183 interface starting to send information on the
> serial interface after power on and signal availabillity (with 115200
> boud data rate).
> 
> does this help?

Does the device actually work with those instructions?

Can you provide the output of 'lsusb -v' with the device plugged in?

thanks,

greg k-h
