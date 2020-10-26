Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B1950298ABB
	for <lists+linux-usb@lfdr.de>; Mon, 26 Oct 2020 11:50:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1771748AbgJZKus (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 26 Oct 2020 06:50:48 -0400
Received: from mga09.intel.com ([134.134.136.24]:17239 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1770960AbgJZKus (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 26 Oct 2020 06:50:48 -0400
IronPort-SDR: qSriWFKUOqsAfY2DKthudq/5vqeyQ4GJqwAUkwCofXLa/jtHSwYs/kfOwfKN4vbZAzkcRN3cVc
 Em6NH/i0BANA==
X-IronPort-AV: E=McAfee;i="6000,8403,9785"; a="168028948"
X-IronPort-AV: E=Sophos;i="5.77,419,1596524400"; 
   d="scan'208";a="168028948"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2020 03:50:47 -0700
IronPort-SDR: mvAVHmZci8gK+Q1T9uq0mTKy5biKMBAKO81/CVDdMmXq1SamcuqtAadXI3Jp3X7vrYzojciJvN
 em1TDswG/owQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,419,1596524400"; 
   d="scan'208";a="424056460"
Received: from kuha.fi.intel.com ([10.237.72.162])
  by fmsmga001.fm.intel.com with SMTP; 26 Oct 2020 03:50:45 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Mon, 26 Oct 2020 12:50:44 +0200
Date:   Mon, 26 Oct 2020 12:50:44 +0200
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Amelie Delaunay <amelie.delaunay@st.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH 1/2] usb: typec: stusb160x: fix an IS_ERR() vs NULL check
 in probe
Message-ID: <20201026105044.GA1442058@kuha.fi.intel.com>
References: <20201023112347.GC282278@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201023112347.GC282278@mwanda>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Oct 23, 2020 at 02:23:47PM +0300, Dan Carpenter wrote:
> The typec_register_port() function doesn't return error pointers, it
> returns error pointers.
> 
> Fixes: da0cb6310094 ("usb: typec: add support for STUSB160x Type-C controller family")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

You do need to fix the commit message like Sergei pointed out.
Otherwise, FWIW:

Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> ---
>  drivers/usb/typec/stusb160x.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/usb/typec/stusb160x.c b/drivers/usb/typec/stusb160x.c
> index ce0bd7b3ad88..f7369e371dd4 100644
> --- a/drivers/usb/typec/stusb160x.c
> +++ b/drivers/usb/typec/stusb160x.c
> @@ -729,8 +729,8 @@ static int stusb160x_probe(struct i2c_client *client)
>  	}
>  
>  	chip->port = typec_register_port(chip->dev, &chip->capability);
> -	if (!chip->port) {
> -		ret = -ENODEV;
> +	if (IS_ERR(chip->port)) {
> +		ret = PTR_ERR(chip->port);
>  		goto all_reg_disable;
>  	}
>  
> -- 
> 2.28.0

thanks,

-- 
heikki
