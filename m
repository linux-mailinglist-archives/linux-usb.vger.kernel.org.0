Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 23599330BEA
	for <lists+linux-usb@lfdr.de>; Mon,  8 Mar 2021 12:05:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231389AbhCHLEx (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 8 Mar 2021 06:04:53 -0500
Received: from mga14.intel.com ([192.55.52.115]:17014 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231299AbhCHLEm (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 8 Mar 2021 06:04:42 -0500
IronPort-SDR: kT6LX+uoLuyCPi2vqUF2bwh65fBGTGZIeU+5Gmp3cjRBDllydJh8amc+aQKO2mxux5Z4i7vEzj
 Bu3hHBd5eXGA==
X-IronPort-AV: E=McAfee;i="6000,8403,9916"; a="187369665"
X-IronPort-AV: E=Sophos;i="5.81,232,1610438400"; 
   d="scan'208";a="187369665"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Mar 2021 03:04:41 -0800
IronPort-SDR: 3g7Ukf8mDwSkMuYKQLoaJEdqaLF9EMEvmlE1zq+T+GyH8w+aURdc1ca4ekbhfMO1kRzm0FvxHR
 4l15ETlC5SIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,232,1610438400"; 
   d="scan'208";a="508891653"
Received: from kuha.fi.intel.com ([10.237.72.162])
  by fmsmga001.fm.intel.com with SMTP; 08 Mar 2021 03:04:39 -0800
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Mon, 08 Mar 2021 13:04:38 +0200
Date:   Mon, 8 Mar 2021 13:04:38 +0200
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     'Wei Yongjun <weiyongjun1@huawei.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        linux-usb@vger.kernel.org, kernel-janitors@vger.kernel.org,
        Hulk Robot <hulkci@huawei.com>
Subject: Re: [PATCH -next] usb: typec: tps6598x: Fix return value check in
 tps6598x_probe()
Message-ID: <YEYExr0X06jAO9mh@kuha.fi.intel.com>
References: <20210308094841.3587751-1-weiyongjun1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210308094841.3587751-1-weiyongjun1@huawei.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Mar 08, 2021 at 09:48:41AM +0000, 'Wei Yongjun wrote:
> From: Wei Yongjun <weiyongjun1@huawei.com>
> 
> In case of error, the function device_get_named_child_node() returns
> NULL pointer not ERR_PTR(). The IS_ERR() test in the return value check
> should be replaced with NULL test.
> 
> Fixes: 18a6c866bb19 ("usb: typec: tps6598x: Add USB role switching logic")
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>

Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> ---
>  drivers/usb/typec/tps6598x.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/usb/typec/tps6598x.c b/drivers/usb/typec/tps6598x.c
> index a4ec8e56c2b9..2c4ab90e16e7 100644
> --- a/drivers/usb/typec/tps6598x.c
> +++ b/drivers/usb/typec/tps6598x.c
> @@ -629,8 +629,8 @@ static int tps6598x_probe(struct i2c_client *client)
>  		return ret;
>  
>  	fwnode = device_get_named_child_node(&client->dev, "connector");
> -	if (IS_ERR(fwnode))
> -		return PTR_ERR(fwnode);
> +	if (!fwnode)
> +		return -ENODEV;
>  
>  	tps->role_sw = fwnode_usb_role_switch_get(fwnode);
>  	if (IS_ERR(tps->role_sw)) {

thanks,

-- 
heikki
