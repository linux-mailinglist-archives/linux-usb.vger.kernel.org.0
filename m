Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7246533735C
	for <lists+linux-usb@lfdr.de>; Thu, 11 Mar 2021 14:05:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233294AbhCKNEn (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 11 Mar 2021 08:04:43 -0500
Received: from mga06.intel.com ([134.134.136.31]:48651 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233327AbhCKNEN (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 11 Mar 2021 08:04:13 -0500
IronPort-SDR: BMRgbCc0VAjRihMzagcET0Eej1BO9Y6DWznHrdaPpq8R/+G7FWC+HuyS5sE32cytT+aUe+A+3U
 tUrwUi5Wiz/g==
X-IronPort-AV: E=McAfee;i="6000,8403,9919"; a="250027065"
X-IronPort-AV: E=Sophos;i="5.81,240,1610438400"; 
   d="scan'208";a="250027065"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2021 05:04:12 -0800
IronPort-SDR: TmfHUPnjbs5QPu42p34JwvdXfFQ97eibbpOkzNkFESsP/nxTaC2MJD4NtrP7C0BRZPPVWuUpa1
 qf7+tH38ib6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,240,1610438400"; 
   d="scan'208";a="510010207"
Received: from kuha.fi.intel.com ([10.237.72.162])
  by fmsmga001.fm.intel.com with SMTP; 11 Mar 2021 05:04:10 -0800
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Thu, 11 Mar 2021 15:04:09 +0200
Date:   Thu, 11 Mar 2021 15:04:09 +0200
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Elias Rudberg <mail@eliasrudberg.se>
Cc:     gregkh@linuxfoundation.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH] usb: typec: Remove vdo[3] part of
 tps6598x_rx_identity_reg struct
Message-ID: <YEoVSRfVaGr6uxXe@kuha.fi.intel.com>
References: <20210311124710.6563-1-mail@eliasrudberg.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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

This needs to go to the stable kernels as well. Please resend with the
appropriate "Cc: stable@vger.kernel.org" tag. Please also include my
reviewed-by tag:

Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

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
> -- 
> 2.25.1

thanks,

-- 
heikki
