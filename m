Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 33803338D85
	for <lists+linux-usb@lfdr.de>; Fri, 12 Mar 2021 13:51:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231555AbhCLMul (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 12 Mar 2021 07:50:41 -0500
Received: from honk.sigxcpu.org ([24.134.29.49]:33050 "EHLO honk.sigxcpu.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229866AbhCLMuj (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 12 Mar 2021 07:50:39 -0500
Received: from localhost (localhost [127.0.0.1])
        by honk.sigxcpu.org (Postfix) with ESMTP id EC153FB03;
        Fri, 12 Mar 2021 13:50:36 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at honk.sigxcpu.org
Received: from honk.sigxcpu.org ([127.0.0.1])
        by localhost (honk.sigxcpu.org [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id FiOlfnBrBDy9; Fri, 12 Mar 2021 13:50:35 +0100 (CET)
Date:   Fri, 12 Mar 2021 13:50:34 +0100
From:   Guido =?iso-8859-1?Q?G=FCnther?= <agx@sigxcpu.org>
To:     Elias Rudberg <mail@eliasrudberg.se>
Cc:     heikki.krogerus@linux.intel.com, gregkh@linuxfoundation.org,
        linux-usb@vger.kernel.org
Subject: Re: [PATCH] usb: typec: Remove vdo[3] part of
 tps6598x_rx_identity_reg struct
Message-ID: <YEtjmtFB7VxnuoFy@bogon.m.sigxcpu.org>
References: <20210311124710.6563-1-mail@eliasrudberg.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210311124710.6563-1-mail@eliasrudberg.se>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,
On Thu, Mar 11, 2021 at 01:47:10PM +0100, Elias Rudberg wrote:
> Remove the unused "u32 vdo[3]" part in the tps6598x_rx_identity_reg
> struct. This helps avoid "failed to register partner" errors which
> happen when tps6598x_read_partner_identity() fails because the
> amount of data read is 12 bytes smaller than the struct size.
> Note that vdo[3] is already in usb_pd_identity and hence
> shouldn't be added to tps6598x_rx_identity_reg as well.
> 
> Fixes: f6c56ca91b92 ("usb: typec: Add the Product Type VDOs to struct usb_pd_identity")
> 
> Signed-off-by: Elias Rudberg <mail@eliasrudberg.se>
> ---
>  drivers/usb/typec/tps6598x.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/usb/typec/tps6598x.c b/drivers/usb/typec/tps6598x.c
> index 6e6ef6317523..29bd1c5a283c 100644
> --- a/drivers/usb/typec/tps6598x.c
> +++ b/drivers/usb/typec/tps6598x.c
> @@ -64,7 +64,6 @@ enum {
>  struct tps6598x_rx_identity_reg {
>  	u8 status;
>  	struct usb_pd_identity identity;
> -	u32 vdo[3];
>  } __packed;
>  
>  /* Standard Task return codes */

Reviewed-by: Guido Günther <agx@sigxcpu.org>

Cheers,
 -- Guido

> -- 
> 2.25.1
> 
