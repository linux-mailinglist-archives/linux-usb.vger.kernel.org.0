Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 07B6C78EEE
	for <lists+linux-usb@lfdr.de>; Mon, 29 Jul 2019 17:16:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728760AbfG2PQ4 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 29 Jul 2019 11:16:56 -0400
Received: from mga06.intel.com ([134.134.136.31]:52643 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728023AbfG2PQ4 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 29 Jul 2019 11:16:56 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 29 Jul 2019 07:28:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,323,1559545200"; 
   d="scan'208";a="190602097"
Received: from kuha.fi.intel.com ([10.237.72.189])
  by fmsmga001.fm.intel.com with SMTP; 29 Jul 2019 07:28:06 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Mon, 29 Jul 2019 17:28:05 +0300
Date:   Mon, 29 Jul 2019 17:28:05 +0300
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Guenter Roeck <linux@roeck-us.net>, linux-usb@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v1] usb: typec: tcpm: Switch to use
 fwnode_property_count_uXX()
Message-ID: <20190729142805.GG28600@kuha.fi.intel.com>
References: <20190723193750.69038-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190723193750.69038-1-andriy.shevchenko@linux.intel.com>
User-Agent: Mutt/1.12.0 (2019-05-25)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Jul 23, 2019 at 10:37:50PM +0300, Andy Shevchenko wrote:
> Use use fwnode_property_count_uXX() directly, that makes code neater.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Acked-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> ---
>  drivers/usb/typec/tcpm/tcpm.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
> index fba32d84e578..ec525811a9eb 100644
> --- a/drivers/usb/typec/tcpm/tcpm.c
> +++ b/drivers/usb/typec/tcpm/tcpm.c
> @@ -4410,8 +4410,7 @@ static int tcpm_fw_get_caps(struct tcpm_port *port,
>  		goto sink;
>  
>  	/* Get source pdos */
> -	ret = fwnode_property_read_u32_array(fwnode, "source-pdos",
> -					     NULL, 0);
> +	ret = fwnode_property_count_u32(fwnode, "source-pdos");
>  	if (ret <= 0)
>  		return -EINVAL;
>  
> @@ -4435,8 +4434,7 @@ static int tcpm_fw_get_caps(struct tcpm_port *port,
>  		return -EINVAL;
>  sink:
>  	/* Get sink pdos */
> -	ret = fwnode_property_read_u32_array(fwnode, "sink-pdos",
> -					     NULL, 0);
> +	ret = fwnode_property_count_u32(fwnode, "sink-pdos");
>  	if (ret <= 0)
>  		return -EINVAL;
>  
> -- 
> 2.20.1

thanks,

-- 
heikki
