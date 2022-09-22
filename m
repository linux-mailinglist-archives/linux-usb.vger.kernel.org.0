Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 687495E64F6
	for <lists+linux-usb@lfdr.de>; Thu, 22 Sep 2022 16:20:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231715AbiIVOUT (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 22 Sep 2022 10:20:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34714 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231510AbiIVOUS (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 22 Sep 2022 10:20:18 -0400
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DA6B983053
        for <linux-usb@vger.kernel.org>; Thu, 22 Sep 2022 07:20:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1663856417; x=1695392417;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=qd3NOc+4hTUXFOrYGC0518GANZPKeVLsSrywj2/K2/I=;
  b=NM5zBHc+ALkm8UCoRo4G2hGt7CT7cPVfjMAkeOsZTeFOBqIMtES5mYg6
   OXf670Vv1UV/wl0RvH3VuXEFbPU3mqWqN/2KUH46rQAGdEHe3S4fal2r2
   NHv/BiJB+cJgAeDWnqfBzL7i7UvM0gX2LsYAOE5SsdsNBUI+Uj7TXJLhv
   umLW78qT49oRIM+WX1/z5USVKq4E2iCEN1GNSbeI7M94Jl5790xLua3GR
   deOUC1UGmH+a9ABXA3r+mUPp7PXCCdQV2HTy9iumF9B1zYZMvRFNYAH1D
   PwlIQZS3PGqNLq7J84OyWyCvvQjbxuNoD3RROZDi9t0waFsAcbXKj6B3g
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10478"; a="301155671"
X-IronPort-AV: E=Sophos;i="5.93,335,1654585200"; 
   d="scan'208";a="301155671"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2022 07:20:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,335,1654585200"; 
   d="scan'208";a="762199731"
Received: from kuha.fi.intel.com ([10.237.72.185])
  by fmsmga001.fm.intel.com with SMTP; 22 Sep 2022 07:20:15 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Thu, 22 Sep 2022 17:20:14 +0300
Date:   Thu, 22 Sep 2022 17:20:14 +0300
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Yang Yingliang <yangyingliang@huawei.com>
Cc:     linux-usb@vger.kernel.org, gregkh@linuxfoundation.org
Subject: Re: [PATCH -next] usb: typec: stusb160x: Switch to use
 dev_err_probe() helper
Message-ID: <YyxvHtmIYwXR7/+e@kuha.fi.intel.com>
References: <20220922135228.2206755-1-yangyingliang@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220922135228.2206755-1-yangyingliang@huawei.com>
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Sep 22, 2022 at 09:52:28PM +0800, Yang Yingliang wrote:
> In the probe path, dev_err() can be replaced with dev_err_probe()
> which will check if error code is -EPROBE_DEFER and prints the
> error name. It also sets the defer probe reason which can be
> checked later through debugfs. It's more simple in error path.
> 
> Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>

Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> ---
>  drivers/usb/typec/stusb160x.c | 7 ++-----
>  1 file changed, 2 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/usb/typec/stusb160x.c b/drivers/usb/typec/stusb160x.c
> index 8638f1d39896..494b371151e0 100644
> --- a/drivers/usb/typec/stusb160x.c
> +++ b/drivers/usb/typec/stusb160x.c
> @@ -750,11 +750,8 @@ static int stusb160x_probe(struct i2c_client *client)
>  	if (client->irq) {
>  		chip->role_sw = fwnode_usb_role_switch_get(fwnode);
>  		if (IS_ERR(chip->role_sw)) {
> -			ret = PTR_ERR(chip->role_sw);
> -			if (ret != -EPROBE_DEFER)
> -				dev_err(chip->dev,
> -					"Failed to get usb role switch: %d\n",
> -					ret);
> +			ret = dev_err_probe(chip->dev, PTR_ERR(chip->role_sw),
> +					    "Failed to get usb role switch\n");
>  			goto port_unregister;
>  		}
>  
> -- 
> 2.25.1

-- 
heikki
