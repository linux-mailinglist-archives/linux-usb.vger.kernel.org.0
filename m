Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B46C61BD84F
	for <lists+linux-usb@lfdr.de>; Wed, 29 Apr 2020 11:33:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726447AbgD2Jds (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 29 Apr 2020 05:33:48 -0400
Received: from mail.kernel.org ([198.145.29.99]:47854 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726423AbgD2Jds (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 29 Apr 2020 05:33:48 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id A482320731;
        Wed, 29 Apr 2020 09:33:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1588152827;
        bh=tjcrupmlXIekZDXrsaScc4bd9TkTFaOaR9/4ilamjFU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=szQojsOJ8muuu3DiKus1WesDgms+ak3tjcnmYxHz0fMRZr74uVjIT2VLFlfLuUdYl
         4BjXMBM/c+WH7K2qK3RM1SYOjt2J8LtrmC+cElAZ8aXHpw8DdJ2maxCUJlsbc2y40z
         SNNBfKwnW2vS3/7XwRxbXH4BsrQzL8H+bbwVSLJM=
Date:   Wed, 29 Apr 2020 11:33:44 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Oliver Neukum <oneukum@suse.com>
Cc:     linux-usb@vger.kernel.org
Subject: Re: [PATCH] UAS: add quirk for LaCie 2Big Quadra
Message-ID: <20200429093344.GA2080215@kroah.com>
References: <20200429083204.21428-1-oneukum@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200429083204.21428-1-oneukum@suse.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Apr 29, 2020 at 10:32:04AM +0200, Oliver Neukum wrote:
> This device needs US_FL_NO_REPORT_OPCODES to avoid going
> through prolonged error handling on enumeration.
> 
> Signed-off-by: Oliver Neukum <oneukum@suse.com>
> Cc: stable <stable@vger.kernel.org>
> Reported-by: Julian Groﬂ <julian.g@posteo.de>
> ---
>  drivers/usb/storage/unusual_uas.h | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/usb/storage/unusual_uas.h b/drivers/usb/storage/unusual_uas.h
> index cfdec74e0f4a..d6c54b5bde75 100644
> --- a/drivers/usb/storage/unusual_uas.h
> +++ b/drivers/usb/storage/unusual_uas.h
> @@ -73,6 +73,13 @@ UNUSUAL_DEV(0x152d, 0x0578, 0x0000, 0x9999,
>  		USB_SC_DEVICE, USB_PR_DEVICE, NULL,
>  		US_FL_BROKEN_FUA),
>  
> +/* Reported-by: Julian Groﬂ <julian.g@posteo.de> */
> +UNUSUAL_DEV(0x059f, 0x105f, 0x0000, 0x9999,
> +		"LaCie",
> +		"2Big Quadra USB3",
> +		USB_SC_DEVICE, USB_PR_DEVICE, NULL,
> +		US_FL_NO_REPORT_OPCODES),
> +

Can you please keep these in sorted order by vendor/product id as the
comment in the file suggests to do so?

thanks,

greg k-h
