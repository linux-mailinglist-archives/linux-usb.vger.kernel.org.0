Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 86103362B6
	for <lists+linux-usb@lfdr.de>; Wed,  5 Jun 2019 19:32:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726515AbfFERcX (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 5 Jun 2019 13:32:23 -0400
Received: from mail.kernel.org ([198.145.29.99]:54448 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725950AbfFERcW (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 5 Jun 2019 13:32:22 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id C4F8020866;
        Wed,  5 Jun 2019 17:32:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1559755942;
        bh=3OiQHIkBj5obYDAp408SvCaE7dajk3tP3v7IaTQD8NM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=K05P9hZ/zbQOih6+VIAtmv54MVb00m0mVCk6ICAh53KoDtFLyQRde0VVPjP3Am+Zx
         frkol9unQ7LlQMuO5WDQ2N+mpkEyld1lltMfotgu8QSP6unXm4Hbz13Ap8w66a9CyS
         supbIfeQkaymcOPYPAg2dycl1TrvYXtR8QEBjd7c=
Date:   Wed, 5 Jun 2019 19:32:19 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Hariprasad Kelam <hariprasad.kelam@gmail.com>
Cc:     Thomas Winischhofer <thomas@winischhofer.net>,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] USB: sisusbvga: Remove unneeded variable
Message-ID: <20190605173219.GC27700@kroah.com>
References: <20190605171908.GA10444@hari-Inspiron-1545>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190605171908.GA10444@hari-Inspiron-1545>
User-Agent: Mutt/1.12.0 (2019-05-25)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Jun 05, 2019 at 10:49:08PM +0530, Hariprasad Kelam wrote:
> fix below warning reported by coccicheck
> 
> drivers/usb/misc/sisusbvga/sisusb.c:1753:5-8: Unneeded variable: "ret".
> Return "0" on line 1877
> 
> Signed-off-by: Hariprasad Kelam <hariprasad.kelam@gmail.com>
> ---
>  drivers/usb/misc/sisusbvga/sisusb.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/usb/misc/sisusbvga/sisusb.c b/drivers/usb/misc/sisusbvga/sisusb.c
> index ea06f1f..dfe2ed1 100644
> --- a/drivers/usb/misc/sisusbvga/sisusb.c
> +++ b/drivers/usb/misc/sisusbvga/sisusb.c
> @@ -1750,7 +1750,7 @@ static int sisusb_setup_screen(struct sisusb_usb_data *sisusb,
>  static int sisusb_set_default_mode(struct sisusb_usb_data *sisusb,
>  		int touchengines)
>  {
> -	int ret = 0, i, j, modex, bpp, du;
> +	int i, j, modex, bpp, du;
>  	u8 sr31, cr63, tmp8;
>  	static const char attrdata[] = {
>  		0x00, 0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07,
> @@ -1874,7 +1874,7 @@ static int sisusb_set_default_mode(struct sisusb_usb_data *sisusb,
>  
>  	SETIREG(SISCR, 0x34, 0x44);	/* we just set std mode #44 */
>  
> -	return ret;
> +	return 0;

If this function can not fail, why is it returning anything at all?
Please fix that up at the same time.

thanks,

greg k-h
