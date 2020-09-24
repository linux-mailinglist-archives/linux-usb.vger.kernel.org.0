Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8EF8027754D
	for <lists+linux-usb@lfdr.de>; Thu, 24 Sep 2020 17:28:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728440AbgIXP2v (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 24 Sep 2020 11:28:51 -0400
Received: from mail-out.m-online.net ([212.18.0.9]:60383 "EHLO
        mail-out.m-online.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728368AbgIXP2v (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 24 Sep 2020 11:28:51 -0400
X-Greylist: delayed 369 seconds by postgrey-1.27 at vger.kernel.org; Thu, 24 Sep 2020 11:28:49 EDT
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
        by mail-out.m-online.net (Postfix) with ESMTP id 4BxzLl4qF3z1qs0Y;
        Thu, 24 Sep 2020 17:22:39 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
        by mail.m-online.net (Postfix) with ESMTP id 4BxzLl42xcz1r12t;
        Thu, 24 Sep 2020 17:22:39 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
        by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new, port 10024)
        with ESMTP id zCXoiBsYmpzO; Thu, 24 Sep 2020 17:22:38 +0200 (CEST)
X-Auth-Info: Mg4TILaI2HacphWNVRN/Ss+p9Lq0ghtD8wz7YWPogA8=
Received: from maia.denx.de (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.mnet-online.de (Postfix) with ESMTPSA;
        Thu, 24 Sep 2020 17:22:38 +0200 (CEST)
Message-ID: <f6946d36092ab6c6160f0ef8abc8cfb5686df22b.camel@denx.de>
Subject: Re: [PATCH] USB: gadget: f_ncm: Fix NDP16 datagram validation
From:   Harald Seiler <hws@denx.de>
To:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc:     Ilja Van Sprundel <ivansprundel@ioactive.com>,
        Brooke Basile <brookebasile@gmail.com>,
        stable <stable@kernel.org>, balbi@kernel.org,
        gregkh@linuxfoundation.org, linux-usb@vger.kernel.org
Date:   Thu, 24 Sep 2020 17:22:28 +0200
In-Reply-To: <20200920170158.1217068-1-bryan.odonoghue@linaro.org>
References: <20200920170158.1217068-1-bryan.odonoghue@linaro.org>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.5 (3.36.5-1.fc32) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sun, 2020-09-20 at 18:01 +0100, Bryan O'Donoghue wrote:
> commit 2b74b0a04d3e ("USB: gadget: f_ncm: add bounds checks to ncm_unwrap_ntb()")
> adds important bounds checking however it unfortunately also introduces  a
> bug with respect to section 3.3.1 of the NCM specification.
> 
> wDatagramIndex[1] : "Byte index, in little endian, of the second datagram
> described by this NDP16. If zero, then this marks the end of the sequence
> of datagrams in this NDP16."
> 
> wDatagramLength[1]: "Byte length, in little endian, of the second datagram
> described by this NDP16. If zero, then this marks the end of the sequence
> of datagrams in this NDP16."
> 
> wDatagramIndex[1] and wDatagramLength[1] respectively then may be zero but
> that does not mean we should throw away the data referenced by
> wDatagramIndex[0] and wDatagramLength[0] as is currently the case.
> 
> Breaking the loop on (index2 == 0 || dg_len2 == 0) should come at the end
> as was previously the case and checks for index2 and dg_len2 should be
> removed since zero is valid.
> 
> I'm not sure how much testing the above patch received but for me right now
> after enumeration ping doesn't work. Reverting the commit restores ping,
> scp, etc.

Same regression for me.  The last datagram of any NTB from the host is
ignored so most networking is broken.  With this patch, I'm able to
communicate from host to device again.

> The extra validation associated with wDatagramIndex[0] and
> wDatagramLength[0] appears to be valid so, this change removes the incorrect
> restriction on wDatagramIndex[1] and wDatagramLength[1] restoring data
> processing between host and device.
> 
> Fixes: 2b74b0a04d3e ("USB: gadget: f_ncm: add bounds checks to ncm_unwrap_ntb()")
> Cc: Ilja Van Sprundel <ivansprundel@ioactive.com>
> Cc: Brooke Basile <brookebasile@gmail.com>
> Cc: stable <stable@kernel.org>

Tested-by: Harald Seiler <hws@denx.de>
Reviewed-by: Harald Seiler <hws@denx.de>

> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>  drivers/usb/gadget/function/f_ncm.c | 30 ++---------------------------
>  1 file changed, 2 insertions(+), 28 deletions(-)
> 
> diff --git a/drivers/usb/gadget/function/f_ncm.c b/drivers/usb/gadget/function/f_ncm.c
> index b4206b0dede5..1f638759a953 100644
> --- a/drivers/usb/gadget/function/f_ncm.c
> +++ b/drivers/usb/gadget/function/f_ncm.c
> @@ -1189,7 +1189,6 @@ static int ncm_unwrap_ntb(struct gether *port,
>  	const struct ndp_parser_opts *opts = ncm->parser_opts;
>  	unsigned	crc_len = ncm->is_crc ? sizeof(uint32_t) : 0;
>  	int		dgram_counter;
> -	bool		ndp_after_header;
>  
>  	/* dwSignature */
>  	if (get_unaligned_le32(tmp) != opts->nth_sign) {
> @@ -1216,7 +1215,6 @@ static int ncm_unwrap_ntb(struct gether *port,
>  	}
>  
>  	ndp_index = get_ncm(&tmp, opts->ndp_index);
> -	ndp_after_header = false;
>  
>  	/* Run through all the NDP's in the NTB */
>  	do {
> @@ -1232,8 +1230,6 @@ static int ncm_unwrap_ntb(struct gether *port,
>  			     ndp_index);
>  			goto err;
>  		}
> -		if (ndp_index == opts->nth_size)
> -			ndp_after_header = true;
>  
>  		/*
>  		 * walk through NDP
> @@ -1312,37 +1308,13 @@ static int ncm_unwrap_ntb(struct gether *port,
>  			index2 = get_ncm(&tmp, opts->dgram_item_len);
>  			dg_len2 = get_ncm(&tmp, opts->dgram_item_len);
>  
> -			if (index2 == 0 || dg_len2 == 0)
> -				break;
> -
>  			/* wDatagramIndex[1] */
> -			if (ndp_after_header) {
> -				if (index2 < opts->nth_size + opts->ndp_size) {
> -					INFO(port->func.config->cdev,
> -					     "Bad index: %#X\n", index2);
> -					goto err;
> -				}
> -			} else {
> -				if (index2 < opts->nth_size + opts->dpe_size) {
> -					INFO(port->func.config->cdev,
> -					     "Bad index: %#X\n", index2);
> -					goto err;
> -				}
> -			}
>  			if (index2 > block_len - opts->dpe_size) {
>  				INFO(port->func.config->cdev,
>  				     "Bad index: %#X\n", index2);
>  				goto err;
>  			}
>  
> -			/* wDatagramLength[1] */
> -			if ((dg_len2 < 14 + crc_len) ||
> -					(dg_len2 > frame_max)) {
> -				INFO(port->func.config->cdev,
> -				     "Bad dgram length: %#X\n", dg_len);
> -				goto err;
> -			}
> -
>  			/*
>  			 * Copy the data into a new skb.
>  			 * This ensures the truesize is correct
> @@ -1359,6 +1331,8 @@ static int ncm_unwrap_ntb(struct gether *port,
>  			ndp_len -= 2 * (opts->dgram_item_len * 2);
>  
>  			dgram_counter++;
> +			if (index2 == 0 || dg_len2 == 0)
> +				break;
>  		} while (ndp_len > 2 * (opts->dgram_item_len * 2));
>  	} while (ndp_index);
>  
> -- 
> 2.27.0
> 
-- 
Harald

