Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 65B8E2F9E02
	for <lists+linux-usb@lfdr.de>; Mon, 18 Jan 2021 12:24:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390245AbhARLYH (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 18 Jan 2021 06:24:07 -0500
Received: from mail.kernel.org ([198.145.29.99]:58386 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2390237AbhARLX5 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 18 Jan 2021 06:23:57 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 28A03221FF;
        Mon, 18 Jan 2021 11:23:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1610968997;
        bh=7mfplVtSgfwJuKBBASVd77oQsEZkeU1UF6z66d0kKcs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=lUieiu5KEyUG09Ql0TEUFft2wQnbEfQhGVMEwzAUbBgpBibWVkzpqQTMlA0+rqtUj
         JvUR9Ddw0Mfrcj2uFmBgVbir4yFNj7Wi8z1nqvkZAd/IEPzteZRXkQ9cqObioIag4z
         PowXDKU/RKqAdpYgzuSeOmnhqmm6CzIh1Ou7ZdopncqDFRAPqUq+IGeyeHO32ovT/x
         dlOiZhCjY9ZVHzdCg/CXRju98lN5nN08Qmzpr3roMZ39ybSGo9RFQoVK8DwAaV4AlE
         UQpy9HKCgMq5fD6uivGmy/imPZ9TQU9uXtTFqMXC4p+lRXc1guCm3ec3NWetc3RTpm
         SSc0W2Zj31XVw==
Received: from johan by xi with local (Exim 4.93.0.4)
        (envelope-from <johan@kernel.org>)
        id 1l1Sd0-0001NX-Jz; Mon, 18 Jan 2021 12:23:23 +0100
Date:   Mon, 18 Jan 2021 12:23:22 +0100
From:   Johan Hovold <johan@kernel.org>
To:     Himadri Pandya <himadrispandya@gmail.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Johan Hovold <johan@kernel.org>, linux-usb@vger.kernel.org
Subject: Re: [PATCH 0/6] USB: serial: drop short control-transfer checks
Message-ID: <YAVvqmeBBfk6hEyb@hovoldconsulting.com>
References: <20210118111426.5147-1-johan@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210118111426.5147-1-johan@kernel.org>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Himadri,

On Mon, Jan 18, 2021 at 12:14:20PM +0100, Johan Hovold wrote:
> There's no need to check for short control transfers when sending data
> so remove the redundant sanity checks from the drivers that had them.
> 
> Included is also a related fix of a copy-paste error in a debug message.
> 
> Johan
> 
> 
> Johan Hovold (6):
>   USB: serial: mxuport: drop short control-transfer check
>   USB: serial: upd78f0730: drop short control-transfer check
>   USB: serial: io_ti: drop short control-transfer check
>   USB: serial: io_ti: fix a debug-message copy-paste error
>   USB: serial: f81232: drop short control-transfer checks
>   USB: serial: f81534: drop short control-transfer check
> 
>  drivers/usb/serial/f81232.c     | 12 ++----------
>  drivers/usb/serial/f81534.c     |  4 +---
>  drivers/usb/serial/io_ti.c      |  8 ++------
>  drivers/usb/serial/mxuport.c    |  7 -------
>  drivers/usb/serial/upd78f0730.c |  5 +----
>  5 files changed, 6 insertions(+), 30 deletions(-)

I intended to CC you on this series, but forgot to do so before hitting
send.

The series can be found here:

	https://lore.kernel.org/r/20210118111426.5147-1-johan@kernel.org

I checked to make sure it doesn't interfere too much with your revised
series.

Johan
