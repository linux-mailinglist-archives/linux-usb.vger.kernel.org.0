Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 85EE11DC7CA
	for <lists+linux-usb@lfdr.de>; Thu, 21 May 2020 09:36:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728359AbgEUHge (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 21 May 2020 03:36:34 -0400
Received: from mail.kernel.org ([198.145.29.99]:51606 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728053AbgEUHgd (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 21 May 2020 03:36:33 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 0301C2065F;
        Thu, 21 May 2020 07:36:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1590046590;
        bh=Ko0yxRa2b18dohhk/hY+WAc1XIHiNYoqz9iprCTMgGk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=XlaXyCf56ctMQwNZGnCngXjbZ8vAdEMxF1iWQ0l8BwnfEJzEqFGSaorcWZRZrFqW/
         ifGiyX8YHXIMl2BhMUKv8kQ6bSUwh7y4u0K+NoWhB/U5ilTKFQ17QxgLMS4Fm9zRo0
         yuSr76eGi33lCt1Uh9htRZaI1UeyGDmPx+ECxZBM=
Date:   Thu, 21 May 2020 09:36:27 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Changming Liu <liu.changm@northeastern.edu>
Cc:     "thomas@winischhofer.net" <thomas@winischhofer.net>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: [PATCH] USB: sisusbvga: Fix left shifting a possible negative
 value
Message-ID: <20200521073627.GB2579717@kroah.com>
References: <BL0PR06MB45483EF82A54B8751524A2E7E5B60@BL0PR06MB4548.namprd06.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <BL0PR06MB45483EF82A54B8751524A2E7E5B60@BL0PR06MB4548.namprd06.prod.outlook.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, May 20, 2020 at 06:06:50PM +0000, Changming Liu wrote:
> The char buffer buf, accepts user data which might be negative value and
> the content is left shifted to form an unsigned integer.
> 
> Since left shifting a negative value is undefined behavior, thus change
> the char to u8 to fix this
> 
> Signed-off-by: Changming Liu <liu.changm@northeastern.edu>
> ---
>  drivers/usb/misc/sisusbvga/sisusb.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/misc/sisusbvga/sisusb.c b/drivers/usb/misc/sisusbvga/sisusb.c
> index fc8a5da4a07c..0734e6dd9386 100644
> --- a/drivers/usb/misc/sisusbvga/sisusb.c
> +++ b/drivers/usb/misc/sisusbvga/sisusb.c
> @@ -761,7 +761,7 @@ static int sisusb_write_mem_bulk(struct sisusb_usb_data *sisusb, u32 addr,
>         u8   swap8, fromkern = kernbuffer ? 1 : 0;
>         u16  swap16;
>         u32  swap32, flag = (length >> 28) & 1;
> -       char buf[4];
> +       u8 buf[4];

Do we also need to change the kernbuffer variable from char* to be u8*
as the same time to solve the same potential issue?

thanks,

greg k-h
