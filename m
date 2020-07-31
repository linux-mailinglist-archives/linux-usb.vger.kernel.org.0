Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 16FC1233F32
	for <lists+linux-usb@lfdr.de>; Fri, 31 Jul 2020 08:40:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731423AbgGaGj7 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 31 Jul 2020 02:39:59 -0400
Received: from mail.kernel.org ([198.145.29.99]:53508 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731420AbgGaGj6 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 31 Jul 2020 02:39:58 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id A18D220829;
        Fri, 31 Jul 2020 06:39:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1596177598;
        bh=YCJoUaWR/x7qnP+PdHEOelksbMa6S31UZAJI17UwjLA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=biW43IdJG+7LIQvVu24YKluF/c9CA46sd0L/uPeA7K8sCAC10GiiKDl+zh+h/nbhS
         e0xreGMHYf6b97xkqAUTgU72aYu/An2dUsEu0lAL5Ma1Z6FY1qc1P2BVWrqQccTo2x
         JIqv+BWIZpyTZbvNR5L9A0xpTqhKt5J8I+Sguh8g=
Date:   Fri, 31 Jul 2020 08:39:45 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Christian Gromm <christian.gromm@microchip.com>
Cc:     driverdev-devel@linuxdriverproject.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH v6] drivers: most: add USB adapter driver
Message-ID: <20200731063945.GF1508201@kroah.com>
References: <1596111472-21232-1-git-send-email-christian.gromm@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1596111472-21232-1-git-send-email-christian.gromm@microchip.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Jul 30, 2020 at 02:17:52PM +0200, Christian Gromm wrote:
> This patch adds the USB driver source file most_usb.c and
> modifies the Makefile and Kconfig accordingly.
> 
> Signed-off-by: Christian Gromm <christian.gromm@microchip.com>
> ---
> v2:
> Reported-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
>         - don't remove usb driver from staging area
>         - don't touch staging/most/Kconfig
>         - remove subdirectory for USB driver and put source file into
>           drivers/most
> v3:
>         - submitted fixes found during code audit to staging version
>           first to be able to resend single patch that adds the driver
> v4:
> Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
>         submitted patch set that fixes issues found during code audit
>         to staging version first to be able to resend single patch that
>         adds the driver. The patch series included:
> 
>         - use function sysfs_streq
>         - add missing put_device calls
>         - use correct error codes
>         - replace code to calculate array index
>         - don't use error path to exit function on success
>         - move allocation of URB out of critical section
>         - return 0 instead of variable
>         - change return value of function drci_rd_reg
>         - don't use expressions that might fail in a declaration
>         - change order of function parameters
> 
> v5:
> Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
>         submitted patch set that fixes issues found during code audit
>         to staging version first to be able to resend single patch that
>         adds the driver. The patch series included:
> 
>         - init return value in default path of switch/case expression
> 
> v6:
> Reported-by: Randy Dunlap <rdunlap@infradead.org>
> 
> 	remove dependency to NET in Kconfig file
> 
> 
>  drivers/most/Kconfig              |   11 +
>  drivers/most/Makefile             |    2 +
>  drivers/most/most_usb.c           | 1170 +++++++++++++++++++++++++++++++++++++
>  drivers/staging/most/Kconfig      |    2 -
>  drivers/staging/most/usb/Kconfig  |   13 -
>  drivers/staging/most/usb/Makefile |    4 -
>  drivers/staging/most/usb/usb.c    | 1170 -------------------------------------
>  7 files changed, 1183 insertions(+), 1189 deletions(-)
>  create mode 100644 drivers/most/most_usb.c
>  delete mode 100644 drivers/staging/most/usb/Kconfig
>  delete mode 100644 drivers/staging/most/usb/Makefile
>  delete mode 100644 drivers/staging/most/usb/usb.c
> 

If you create this with 'git format-patch -M' we can see that this
really is a rename/move and nothing else is changed in the file.

Can you do that here?

thanks,

greg k-h
