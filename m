Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 26AA020C107
	for <lists+linux-usb@lfdr.de>; Sat, 27 Jun 2020 13:28:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726444AbgF0L2g (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 27 Jun 2020 07:28:36 -0400
Received: from mail.kernel.org ([198.145.29.99]:54924 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726439AbgF0L2f (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sat, 27 Jun 2020 07:28:35 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id C3B9F2168B;
        Sat, 27 Jun 2020 11:28:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1593257315;
        bh=UpTlJ/tHWQVkB1JsWYAO2nEeSYwIEGZRRDol8afw0T0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Rg6RE49SE+eHUyKUFDwsIgmimV58BYWiQZIWrY/NydQ2Iq58NmwO/dhDDeh4AfB7w
         UVPAXLDDmhr5hEWyLrmCMEtGhs6HqEJfeLricCo1ZNoXKyUNRQhzb/SSpbMACJ5zqW
         J2lSJEyOy449r1/FjYmIeAJkhNNMiG8WzWYUjSVU=
Date:   Sat, 27 Jun 2020 13:28:28 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Changming Liu <charley.ashbringer@gmail.com>
Cc:     linux-usb@vger.kernel.org, thomas@winischhofer.net
Subject: Re: [PATCH 1/4] USB: sisusbvga: change the char buffer from char to
 u8 for sisusb_write_mem_bulk and sisusb_send_bulk_msg
Message-ID: <20200627112828.GA1596272@kroah.com>
References: <1593200057-245-1-git-send-email-charley.ashbringer@gmail.com>
 <1593200057-245-2-git-send-email-charley.ashbringer@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1593200057-245-2-git-send-email-charley.ashbringer@gmail.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Jun 26, 2020 at 03:34:14PM -0400, Changming Liu wrote:
> This patch changes the types of char buffer declarations 
> as well as passed-in parameters to u8 for the function 
> sisusb_write_mem_bulk and sisusb_send_bulk_msg to aviod
> any related UB.
> 
> This patch also change the local buf[4] of sisusb_write_mem_bulk
> to u8. This fixed an undefined behavior, since buf can be filled
> with data from user space, thus can be negative given it's signed, 
> and its content is being left-shifted. Left-shifting a negative
> value is undefined behavior. It's fixed by changing the buf from
> char to u8.

In looking at this closer, it doesn't make sense to change the function
parameters here, as everything that deals with the pointer already
handles the change properly.


> 
> Signed-off-by: Changming Liu <charley.ashbringer@gmail.com>
> ---
>  drivers/usb/misc/sisusbvga/sisusb.c | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/usb/misc/sisusbvga/sisusb.c b/drivers/usb/misc/sisusbvga/sisusb.c
> index fc8a5da..4aa717a 100644
> --- a/drivers/usb/misc/sisusbvga/sisusb.c
> +++ b/drivers/usb/misc/sisusbvga/sisusb.c
> @@ -327,7 +327,7 @@ static int sisusb_bulkin_msg(struct sisusb_usb_data *sisusb,
>   */
>  
>  static int sisusb_send_bulk_msg(struct sisusb_usb_data *sisusb, int ep, int len,
> -		char *kernbuffer, const char __user *userbuffer, int index,
> +		u8 *kernbuffer, const u8 __user *userbuffer, int index,

So the kernbuffer pointer might want to be changed, but in looking at
the code, there's no difference here, it can be left alone.

The userbuffer does not need to be changed at all.

>  static int sisusb_write_mem_bulk(struct sisusb_usb_data *sisusb, u32 addr,
> -		char *kernbuffer, int length, const char __user *userbuffer,
> +		u8 *kernbuffer, int length, const u8 __user *userbuffer,

Same here, these do not need to be changed.

>  		int index, ssize_t *bytes_written)
>  {
>  	struct sisusb_packet packet;
> @@ -761,7 +761,7 @@ static int sisusb_write_mem_bulk(struct sisusb_usb_data *sisusb, u32 addr,
>  	u8   swap8, fromkern = kernbuffer ? 1 : 0;
>  	u16  swap16;
>  	u32  swap32, flag = (length >> 28) & 1;
> -	char buf[4];
> +	u8 buf[4];

That is what should be changed, and in looking at the code path, I think
that's it here.

Sorry for taking you down the wrong path, but I think you should only
change things that actually matter, and the above api changes don't
change anything at all, right?

thanks,

greg k-h
