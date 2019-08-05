Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9BA7B81EB0
	for <lists+linux-usb@lfdr.de>; Mon,  5 Aug 2019 16:09:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728818AbfHEOJC (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 5 Aug 2019 10:09:02 -0400
Received: from iolanthe.rowland.org ([192.131.102.54]:50230 "HELO
        iolanthe.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1728058AbfHEOJB (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 5 Aug 2019 10:09:01 -0400
Received: (qmail 1824 invoked by uid 2102); 5 Aug 2019 10:09:00 -0400
Received: from localhost (sendmail-bs@127.0.0.1)
  by localhost with SMTP; 5 Aug 2019 10:09:00 -0400
Date:   Mon, 5 Aug 2019 10:09:00 -0400 (EDT)
From:   Alan Stern <stern@rowland.harvard.edu>
X-X-Sender: stern@iolanthe.rowland.org
To:     gavinli@thegavinli.com
cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        <linux-usb@vger.kernel.org>,
        "Steinar H . Gunderson" <sesse@google.com>,
        Gavin Li <git@thegavinli.com>
Subject: Re: [PATCH v1] usb: usbfs: fix double-free of usb memory upon
 submiturb error
In-Reply-To: <20190804235044.22327-1-gavinli@thegavinli.com>
Message-ID: <Pine.LNX.4.44L0.1908051008310.1626-100000@iolanthe.rowland.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sun, 4 Aug 2019 gavinli@thegavinli.com wrote:

> From: Gavin Li <git@thegavinli.com>
> 
> Upon an error within proc_do_submiturb(), dec_usb_memory_use_count()
> gets called once by the error handling tail and again by free_async().
> Remove the first call.
> 
> Signed-off-by: Gavin Li <git@thegavinli.com>
> ---
>  drivers/usb/core/devio.c | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/drivers/usb/core/devio.c b/drivers/usb/core/devio.c
> index fa783531ee88..f026a0d54ce5 100644
> --- a/drivers/usb/core/devio.c
> +++ b/drivers/usb/core/devio.c
> @@ -1789,8 +1789,6 @@ static int proc_do_submiturb(struct usb_dev_state *ps, struct usbdevfs_urb *uurb
>  	return 0;
>  
>   error:
> -	if (as && as->usbm)
> -		dec_usb_memory_use_count(as->usbm, &as->usbm->urb_use_count);
>  	kfree(isopkt);
>  	kfree(dr);
>  	if (as)

Acked-by: Alan Stern <stern@rowland.harvard.edu>

