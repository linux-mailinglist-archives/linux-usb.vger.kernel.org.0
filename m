Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AF492202F82
	for <lists+linux-usb@lfdr.de>; Mon, 22 Jun 2020 07:31:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731163AbgFVFbv (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 22 Jun 2020 01:31:51 -0400
Received: from mail.kernel.org ([198.145.29.99]:48390 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729114AbgFVFbv (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 22 Jun 2020 01:31:51 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 6138820767;
        Mon, 22 Jun 2020 05:31:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1592803909;
        bh=cwPe/H+cg/ry9PWSogV5dTRYK2pNHqvyanszZ+o/Xk8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=dfMO6nbLaeDayLumjqHLF+r2ZuvD0WDgCj02LP2ihNVm9H3yNqhwR45FAzPgSU7h8
         jl5f06TxAzNdNvb1Hk2gaww7lR0paa5HBXBp8YR+BgMe2VEquywMSgFV7EK1VIv2rk
         IBKamtcFBr7LeM59AEhculFHyCG5A+zrXeZ9JG9g=
Date:   Mon, 22 Jun 2020 07:31:46 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     =?utf-8?B?SmFyb23DrXIgxaBrb3JwaWw=?= <Jerry@jrr.cz>
Cc:     linux-usb@vger.kernel.org, Johan Hovold <johan@kernel.org>
Subject: Re: [PATCH v3] usbserial: cp210x - icount support for parity error
 checking
Message-ID: <20200622053146.GB134804@kroah.com>
References: <b4cd2557-9a61-5ccd-32ad-48b0c68bef6b@jrr.cz>
 <20200621085816.GB95977@kroah.com>
 <03712b5a-ecb6-ae42-ff8e-8d5d6f2ed918@jrr.cz>
 <20200621095509.GA120230@kroah.com>
 <470484c8-7afc-c593-5ca9-cdb97dba39e1@jrr.cz>
 <20200621135838.GA125568@kroah.com>
 <7bdff86f-0988-2afc-e1a6-35df2931fd5b@jrr.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7bdff86f-0988-2afc-e1a6-35df2931fd5b@jrr.cz>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sun, Jun 21, 2020 at 10:21:11PM +0200, Jaromír Škorpil wrote:
> The current version of cp210x driver doesn't provide any way to detect
> a parity error in received data from userspace. Some serial protocols like
> STM32 bootloader protect data only by parity so application needs to
> know whether parity error happened to repeat peripheral data reading.
> 
> Added support for icount (ioctl TIOCGICOUNT) which sends GET_COMM_STATUS
> command to CP210X and according received flags increments fields for
> parity error, frame error, break and overrun. An application can detect
> an error condition after reading data from ttyUSB and reacts adequately.
> There is no impact for applications which don't call ioctl TIOCGICOUNT.
> 
> The flag "hardware overrun" is not examined because CP2102 sets this bit
> for the first received byte after openning of port which was previously
> closed with some unreaded data in buffer. This is confusing and checking
> "queue overrun" flag seems be enough.
> 
> Signed-off-by: Jaromír Škorpil <Jerry@jrr.cz>
> ---
> v2: Simplified counting - only queue overrun checked
> v3: Changed description + UTF-8 name  ;-)

Much nicer, thanks for the changes!

I'll let Johan comment on the actual patch itself, as he's the
maintainer of this driver/subsystems.

thanks,

greg k-h
