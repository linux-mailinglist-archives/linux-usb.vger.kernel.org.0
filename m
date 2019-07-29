Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3C74978F66
	for <lists+linux-usb@lfdr.de>; Mon, 29 Jul 2019 17:34:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388072AbfG2PeO (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 29 Jul 2019 11:34:14 -0400
Received: from mga03.intel.com ([134.134.136.65]:58475 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2387887AbfG2PeO (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 29 Jul 2019 11:34:14 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 29 Jul 2019 07:26:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,323,1559545200"; 
   d="scan'208";a="190601879"
Received: from kuha.fi.intel.com ([10.237.72.189])
  by fmsmga001.fm.intel.com with SMTP; 29 Jul 2019 07:26:49 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Mon, 29 Jul 2019 17:26:48 +0300
Date:   Mon, 29 Jul 2019 17:26:48 +0300
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-usb@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v1] usb: typec: mux: Switch to use
 fwnode_property_count_uXX()
Message-ID: <20190729142648.GF28600@kuha.fi.intel.com>
References: <20190723194726.69545-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190723194726.69545-1-andriy.shevchenko@linux.intel.com>
User-Agent: Mutt/1.12.0 (2019-05-25)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Jul 23, 2019 at 10:47:26PM +0300, Andy Shevchenko wrote:
> Use fwnode_property_count_uXX() directly, that makes code neater.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Acked-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> ---
>  drivers/usb/typec/mux.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/typec/mux.c b/drivers/usb/typec/mux.c
> index 61b7bc58dd81..57907f26f681 100644
> --- a/drivers/usb/typec/mux.c
> +++ b/drivers/usb/typec/mux.c
> @@ -215,7 +215,7 @@ static void *typec_mux_match(struct device_connection *con, int ep, void *data)
>  	}
>  
>  	/* Alternate Mode muxes */
> -	nval = fwnode_property_read_u16_array(con->fwnode, "svid", NULL, 0);
> +	nval = fwnode_property_count_u16(con->fwnode, "svid");
>  	if (nval <= 0)
>  		return NULL;
>  
> -- 
> 2.20.1

thanks,

-- 
heikki
