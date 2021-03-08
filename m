Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8A895330BEC
	for <lists+linux-usb@lfdr.de>; Mon,  8 Mar 2021 12:05:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231339AbhCHLEw (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 8 Mar 2021 06:04:52 -0500
Received: from mga06.intel.com ([134.134.136.31]:27702 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231345AbhCHLEZ (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 8 Mar 2021 06:04:25 -0500
IronPort-SDR: csGFF6A+mi2/GtjTi/c0OakTMIpA3sXcRK2xTfvzqwP/xftVraKemhyil1HiZjMoHfIyzne3xH
 t2iUoTOfuRug==
X-IronPort-AV: E=McAfee;i="6000,8403,9916"; a="249387026"
X-IronPort-AV: E=Sophos;i="5.81,232,1610438400"; 
   d="scan'208";a="249387026"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Mar 2021 03:04:10 -0800
IronPort-SDR: YYH49d1lndd1JGWH48mr4UBBGxD5xwBLe357Xsb4UDgWuxUAq04dHaLNlkrOIWreGUk2ji3x4Q
 9iep8tHc+4Zw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,232,1610438400"; 
   d="scan'208";a="508891585"
Received: from kuha.fi.intel.com ([10.237.72.162])
  by fmsmga001.fm.intel.com with SMTP; 08 Mar 2021 03:04:07 -0800
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Mon, 08 Mar 2021 13:04:06 +0200
Date:   Mon, 8 Mar 2021 13:04:06 +0200
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     'Wei Yongjun <weiyongjun1@huawei.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Amelie Delaunay <amelie.delaunay@st.com>,
        linux-usb@vger.kernel.org, kernel-janitors@vger.kernel.org,
        Hulk Robot <hulkci@huawei.com>
Subject: Re: [PATCH -next] usb: typec: stusb160x: fix return value check in
 stusb160x_probe()
Message-ID: <YEYEptIy2hCBiLhZ@kuha.fi.intel.com>
References: <20210308094839.3586773-1-weiyongjun1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210308094839.3586773-1-weiyongjun1@huawei.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Mar 08, 2021 at 09:48:39AM +0000, 'Wei Yongjun wrote:
> From: Wei Yongjun <weiyongjun1@huawei.com>
> 
> In case of error, the function device_get_named_child_node() returns
> NULL pointer not ERR_PTR(). The IS_ERR() test in the return value check
> should be replaced with NULL test.
> 
> Fixes: da0cb6310094 ("usb: typec: add support for STUSB160x Type-C controller family")
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>

Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> ---
>  drivers/usb/typec/stusb160x.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/usb/typec/stusb160x.c b/drivers/usb/typec/stusb160x.c
> index d21750bbbb44..6eaeba9b096e 100644
> --- a/drivers/usb/typec/stusb160x.c
> +++ b/drivers/usb/typec/stusb160x.c
> @@ -682,8 +682,8 @@ static int stusb160x_probe(struct i2c_client *client)
>  	}
>  
>  	fwnode = device_get_named_child_node(chip->dev, "connector");
> -	if (IS_ERR(fwnode))
> -		return PTR_ERR(fwnode);
> +	if (!fwnode)
> +		return -ENODEV;
>  
>  	/*
>  	 * When both VDD and VSYS power supplies are present, the low power

thanks,

-- 
heikki
