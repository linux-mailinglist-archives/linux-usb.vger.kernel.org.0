Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 734F320C10A
	for <lists+linux-usb@lfdr.de>; Sat, 27 Jun 2020 13:30:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726532AbgF0LaL (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 27 Jun 2020 07:30:11 -0400
Received: from mail.kernel.org ([198.145.29.99]:55146 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726511AbgF0LaL (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sat, 27 Jun 2020 07:30:11 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 75F5D2168B;
        Sat, 27 Jun 2020 11:30:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1593257410;
        bh=3Fs4W0OFMb19gMceHstl9X7MGQJjzH4mWT9h8cIEPn8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Tzz7GKEqMquwacHkXRIz2bb9RTXdK3/BXYko+xpd5nLL3gimjrsOYRNgSx4XgH4c6
         uyI6MEs/zfhFnbgtv7ANXx19lWM4AkosgDCLZt08c82VS7/zCjnReYQoMSNFrSBdyh
         7eNoLl3sWYBQ7oJJvH1RhVwaRkbaBUEWvR96nmyQ=
Date:   Sat, 27 Jun 2020 13:30:04 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Changming Liu <charley.ashbringer@gmail.com>
Cc:     linux-usb@vger.kernel.org, thomas@winischhofer.net
Subject: Re: [PATCH 3/4] USB: sisusbvga: change the buffer in
 sisusb_recv_bulk_msg from char to u8
Message-ID: <20200627113004.GC1596272@kroah.com>
References: <1593200057-245-1-git-send-email-charley.ashbringer@gmail.com>
 <1593200057-245-4-git-send-email-charley.ashbringer@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1593200057-245-4-git-send-email-charley.ashbringer@gmail.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Jun 26, 2020 at 03:34:16PM -0400, Changming Liu wrote:
> This patch changes the userbuffer of sisusb_recv_bulk_msg from char to u8
> to avoid related UB.
> 
> Also, for kernbuffer declared as void* in the function header, force cast 
> the passed-in parameters from char* to u8*.
> 
> Signed-off-by: Changming Liu <charley.ashbringer@gmail.com>
> ---
>  drivers/usb/misc/sisusbvga/sisusb.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/usb/misc/sisusbvga/sisusb.c b/drivers/usb/misc/sisusbvga/sisusb.c
> index 8878c28..86638c1 100644
> --- a/drivers/usb/misc/sisusbvga/sisusb.c
> +++ b/drivers/usb/misc/sisusbvga/sisusb.c
> @@ -448,7 +448,7 @@ static int sisusb_send_bulk_msg(struct sisusb_usb_data *sisusb, int ep, int len,
>   */
>  
>  static int sisusb_recv_bulk_msg(struct sisusb_usb_data *sisusb, int ep, int len,
> -		void *kernbuffer, char __user *userbuffer, ssize_t *bytes_read,
> +		void *kernbuffer, u8 __user *userbuffer, ssize_t *bytes_read,

Same as before, I do not think you need to change these, do you?

thanks,

greg k-h
