Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5350E410F23
	for <lists+linux-usb@lfdr.de>; Mon, 20 Sep 2021 06:58:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230453AbhITE73 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 20 Sep 2021 00:59:29 -0400
Received: from mail.kernel.org ([198.145.29.99]:40422 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229695AbhITE72 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 20 Sep 2021 00:59:28 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id C140560F3A;
        Mon, 20 Sep 2021 04:58:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1632113882;
        bh=mYCgFvcsOwdGMSCo2mvN164umT+7a71BbzVHXp6cfME=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=KPow+CdC5468rCGeh8A0ohHtF5qjIfWT28+HmYfMZSvZFLOR0BQ5TZy/1bHkOnpWk
         tbpdNYR9d2+1guqDkIO8K0Gzz/cG+7bUTAER/tEoM0pB2PYvzOxNazMvhEHHMl3yec
         +a/2YzXbe7LQiVDhiGAWolj2oPqYD2Vq/Mgga6sc=
Date:   Mon, 20 Sep 2021 06:57:59 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Florian Faber <faber@faberman.de>
Cc:     linux-usb@vger.kernel.org
Subject: Re: [PATCH] usb: gadget: u_serial: Fix possible null pointer
 dereference
Message-ID: <YUgU10Q/HrHJtASV@kroah.com>
References: <863b03b7-d00a-0af1-c21e-e2f7930bb0b3@faberman.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <863b03b7-d00a-0af1-c21e-e2f7930bb0b3@faberman.de>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sun, Sep 19, 2021 at 09:57:28PM +0200, Florian Faber wrote:
> In gs_rx_push, tty can be null. tty_throttled accesses tty->flags without further testing, which would lead to a null pointer dereference.

Please wrap your changelog text to 72 columns.

> 
> Signed-off-by: Florian Faber <faber@faberman.de>
> ---
>  drivers/usb/gadget/function/u_serial.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/gadget/function/u_serial.c b/drivers/usb/gadget/function/u_serial.c
> index 6f68cbeeee7c..00512e7c7261 100644
> --- a/drivers/usb/gadget/function/u_serial.c
> +++ b/drivers/usb/gadget/function/u_serial.c
> @@ -436,7 +436,7 @@ static void gs_rx_push(struct work_struct *work)
>  	 * We may leave non-empty queue only when there is a tty, and
>  	 * either it is throttled or there is no more room in flip buffer.
>  	 */
> -	if (!list_empty(queue) && !tty_throttled(tty))
> +	if (tty && !list_empty(queue) && !tty_throttled(tty))

Have you ever been able to trigger this with a NULL tty?

thanks,

greg k-h
