Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C8F4120C108
	for <lists+linux-usb@lfdr.de>; Sat, 27 Jun 2020 13:29:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726500AbgF0L3v (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 27 Jun 2020 07:29:51 -0400
Received: from mail.kernel.org ([198.145.29.99]:55018 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726439AbgF0L3v (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sat, 27 Jun 2020 07:29:51 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 362E521789;
        Sat, 27 Jun 2020 11:29:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1593257390;
        bh=FAukEEirVmkSA4z/zFBcGpeifCgL/YscOsGHKQEosZc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=F/DROYmxgBVWodpQPmsgfAh2IEQCcVXnSpGvCo0IE3oi/rBu93XFtw8Zngb65HVdV
         uXA9XRMTJIeU0ONcCUfTSnTn1E/gnG/tLJNZMDs32A5nJEkt4GPcyyoO9JFgS7A4Mp
         nGguUeuv/hLoyxfOnnvc+xtrTWFZ1mx1HWCe8Amc=
Date:   Sat, 27 Jun 2020 13:29:44 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Changming Liu <charley.ashbringer@gmail.com>
Cc:     linux-usb@vger.kernel.org, thomas@winischhofer.net
Subject: Re: [PATCH 2/4] USB: sisusbvga: change the buffer members in
 sisusb_usb_data from char to u8
Message-ID: <20200627112944.GB1596272@kroah.com>
References: <1593200057-245-1-git-send-email-charley.ashbringer@gmail.com>
 <1593200057-245-3-git-send-email-charley.ashbringer@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1593200057-245-3-git-send-email-charley.ashbringer@gmail.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Jun 26, 2020 at 03:34:15PM -0400, Changming Liu wrote:
> This patch changes the buffer within struct sisusb_usb_data, 
> namely, ibuf,obuf and font_backup
> from char* to unsigned char* to avoid any related UB.
> 
> Thia patch also changes the buffer declared in the code that gets 
> assigned to by these buffers from char to u8 as well.
> 
> Signed-off-by: Changming Liu <charley.ashbringer@gmail.com>
> ---
>  drivers/usb/misc/sisusbvga/sisusb.c | 4 ++--
>  drivers/usb/misc/sisusbvga/sisusb.h | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/usb/misc/sisusbvga/sisusb.c b/drivers/usb/misc/sisusbvga/sisusb.c
> index 4aa717a..8878c28 100644
> --- a/drivers/usb/misc/sisusbvga/sisusb.c
> +++ b/drivers/usb/misc/sisusbvga/sisusb.c
> @@ -335,7 +335,7 @@ static int sisusb_send_bulk_msg(struct sisusb_usb_data *sisusb, int ep, int len,
>  	int fromuser = (userbuffer != NULL) ? 1 : 0;
>  	int fromkern = (kernbuffer != NULL) ? 1 : 0;
>  	unsigned int pipe;
> -	char *buffer;
> +	u8 *buffer;
>  
>  	(*bytes_written) = 0;
>  
> @@ -454,7 +454,7 @@ static int sisusb_recv_bulk_msg(struct sisusb_usb_data *sisusb, int ep, int len,
>  	int result = 0, retry, count = len;
>  	int bufsize, thispass, transferred_len;
>  	unsigned int pipe;
> -	char *buffer;
> +	u8 *buffer;
>  
>  	(*bytes_read) = 0;
>  
> diff --git a/drivers/usb/misc/sisusbvga/sisusb.h b/drivers/usb/misc/sisusbvga/sisusb.h
> index c0fb9e1..8fe5d07 100644
> --- a/drivers/usb/misc/sisusbvga/sisusb.h
> +++ b/drivers/usb/misc/sisusbvga/sisusb.h
> @@ -109,7 +109,7 @@ struct sisusb_usb_data {
>  	int present;		/* !=0 if device is present on the bus */
>  	int ready;		/* !=0 if device is ready for userland */
>  	int numobufs;		/* number of obufs = number of out urbs */
> -	char *obuf[NUMOBUFS], *ibuf;	/* transfer buffers */
> +	unsigned char *obuf[NUMOBUFS], *ibuf;	/* transfer buffers */

u8 for this?

>  	int obufsize, ibufsize;
>  	struct urb *sisurbout[NUMOBUFS];
>  	struct urb *sisurbin;
> @@ -140,7 +140,7 @@ struct sisusb_usb_data {
>  	int sisusb_cursor_size_to;
>  	int current_font_height, current_font_512;
>  	int font_backup_size, font_backup_height, font_backup_512;
> -	char *font_backup;
> +	unsigned char *font_backup;

u8 like you say you are changing in the above text?

thanks,

greg k-h
