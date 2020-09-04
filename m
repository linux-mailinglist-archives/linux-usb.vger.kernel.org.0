Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A475525DD0B
	for <lists+linux-usb@lfdr.de>; Fri,  4 Sep 2020 17:19:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730297AbgIDPTA (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 4 Sep 2020 11:19:00 -0400
Received: from mail.kernel.org ([198.145.29.99]:59898 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729942AbgIDPS7 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 4 Sep 2020 11:18:59 -0400
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 8B75D2074D;
        Fri,  4 Sep 2020 15:18:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1599232739;
        bh=FqeHs8YWf9a+WPlfl1w4ki35eR0+lRE87IspfYNxFjw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=gq+7S8HeEwwu2KKkrf8/2kEaMZeSj5zczVq/oTRNeI4ZIz5wk8i9gA+bRPfSzRWgo
         ps0y07hVEskdUyhTYfNyOWE/3oKaHEqO/cklmhvv30YSdl1wSLjSO8dcJTDwJhy/ia
         B1Y2TxqBnmRu5KTrvlIXeKBvVHfflEiQRj3Mnh2M=
Date:   Fri, 4 Sep 2020 17:19:20 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Khalid Aziz <khalid.aziz@oracle.com>
Cc:     stern@rowland.harvard.edu, erkka.talvitie@vincit.fi,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Khalid Aziz <khalid@gonehiking.org>
Subject: Re: [RFC PATCH 1/1] usb: ehci: Remove erroneous return of EPROTO
 upon detection of stall
Message-ID: <20200904151920.GA3414684@kroah.com>
References: <cover.1598887346.git.khalid@gonehiking.org>
 <8248a5f80a8aa7cd391fa36a907d342fad38563b.1598887346.git.khalid@gonehiking.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8248a5f80a8aa7cd391fa36a907d342fad38563b.1598887346.git.khalid@gonehiking.org>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Aug 31, 2020 at 10:08:43AM -0600, Khalid Aziz wrote:
> With the USB 3.0/3.1 controller on MSI B450-A Pro Max motherboard,
> full speed and low speed devices see constant resets making
> keyboards and mouse unreliable and unusable. These resets are caused
> by detection of stall in qtd_copy_status() and returning EPROTO
> which in turn results in TT buffers in hub being cleared. Hubs do
> not seem to repsond well to this and seem to hang which causes
> further USB transactions to time out. A reset finally clears the
> issue until we repeat the cycle all over again.
> 
> Signed-off-by: Khalid Aziz <khalid.aziz@oracle.com>
> Cc: Khalid Aziz <khalid@gonehiking.org>
> ---
>  drivers/usb/host/ehci-q.c | 4 ----
>  1 file changed, 4 deletions(-)
> 
> diff --git a/drivers/usb/host/ehci-q.c b/drivers/usb/host/ehci-q.c
> index 8a5c9b3ebe1e..7d4b2bc4633c 100644
> --- a/drivers/usb/host/ehci-q.c
> +++ b/drivers/usb/host/ehci-q.c
> @@ -214,10 +214,6 @@ static int qtd_copy_status (
>  		 * When MMF is active and PID Code is IN, queue is halted.
>  		 * EHCI Specification, Table 4-13.
>  		 */
> -		} else if ((token & QTD_STS_MMF) &&
> -					(QTD_PID(token) == PID_CODE_IN)) {
> -			status = -EPROTO;
> -		/* CERR nonzero + halt --> stall */
>  		} else if (QTD_CERR(token)) {
>  			status = -EPIPE;
>  

Removing this check is not a good idea, any chance you can come up with
some other test instead for this broken hardware?

What about getting a USB hub that works?  :)

thanks,

greg k-h
