Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 269E51D2CBB
	for <lists+linux-usb@lfdr.de>; Thu, 14 May 2020 12:28:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726863AbgENK2G (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 14 May 2020 06:28:06 -0400
Received: from mail.kernel.org ([198.145.29.99]:56552 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726494AbgENK2D (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 14 May 2020 06:28:03 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 9B1BC206DA;
        Thu, 14 May 2020 10:28:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1589452083;
        bh=hAvvmC7GroHv7ZgWP/NYN0lVqlr+JyvKlza9/MIngvo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=EbaSk1K/o+7jqN70XnllY/y7me8Q/dlyaoQUhO7BJQ1GT+aKbUhXrHWsWBxbAdYr/
         nKFWl7VnPH1XBEkxp7+J0rruP0e7vQzg3ISW7dltukayj4GfeX5rW0++FKgSkT0WLF
         X1BvVVwtGP5WRqLWKx8PGVGmDVbFJnlTmbQgQR6Q=
Date:   Thu, 14 May 2020 12:25:46 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Christian Gromm <christian.gromm@microchip.com>
Cc:     driverdev-devel@linuxdriverproject.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH v2 1/8] drivers: most: add usb adapter driver
Message-ID: <20200514102546.GA1828756@kroah.com>
References: <1589449976-11378-1-git-send-email-christian.gromm@microchip.com>
 <1589449976-11378-2-git-send-email-christian.gromm@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1589449976-11378-2-git-send-email-christian.gromm@microchip.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, May 14, 2020 at 11:52:49AM +0200, Christian Gromm wrote:
> This patch adds the usb driver source file most_usb.c and
> modifies the Makefile and Kconfig accordingly.
> 
> Signed-off-by: Christian Gromm <christian.gromm@microchip.com>
> ---
> v2:
> Reported-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> 	- don't remove usb driver from staging area
> 	- don't touch staging/most/Kconfig
> 	- remove subdirectory for USB driver and put source file into
> 	  drivers/most

Hm, no, can you invert this series?  I'll gladly take the "fixes" for
the existing code in staging, and then we can do a new review after that
of the file being added to match what is in staging.  I think you might
have missed at least one change that happened there already :(

thanks,

greg k-h
