Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 13D935E64F5
	for <lists+linux-usb@lfdr.de>; Thu, 22 Sep 2022 16:19:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229448AbiIVOTn (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 22 Sep 2022 10:19:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33062 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231853AbiIVOTj (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 22 Sep 2022 10:19:39 -0400
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8BF60F5A4
        for <linux-usb@vger.kernel.org>; Thu, 22 Sep 2022 07:19:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1663856378; x=1695392378;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=3kTGdPZmqpNyvjb8qXPvZaWvrzOp1ar28KKQdhPmhYE=;
  b=S/cxc8xANigmAdSQODvwAMDQLs9iTqFJrMi03IC64/8pva7q6rIo7HnV
   K57Itk0nGCHSfbqPCMmjBTm96g1SwzK3PNloUVh1VCWMlo3cSiwHd3lkv
   empff7s++IW4h0G4xGg5RzcqMcSbqIhUX9WIBcuPBPVIBbiwoJdNX1KgQ
   S3JjGr1bNpV7F89pHFQv30usyUKFNaC5Xhko2mFzK7OfPgfWp6WLP6mTA
   JCDQtVeBaVQOukvjzJx26S68xEJ73uz9WSuzFz7ON+nzJXz4Z2fGIUX7s
   luUb2S5X1PnuUug+bSAwwH41BrpQazciQf27Q2Sgh489noXyRSIMFKWoN
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10478"; a="301718252"
X-IronPort-AV: E=Sophos;i="5.93,335,1654585200"; 
   d="scan'208";a="301718252"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2022 07:19:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,335,1654585200"; 
   d="scan'208";a="762199545"
Received: from kuha.fi.intel.com ([10.237.72.185])
  by fmsmga001.fm.intel.com with SMTP; 22 Sep 2022 07:19:35 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Thu, 22 Sep 2022 17:19:34 +0300
Date:   Thu, 22 Sep 2022 17:19:34 +0300
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Yang Yingliang <yangyingliang@huawei.com>
Cc:     linux-usb@vger.kernel.org, linux@roeck-us.net,
        gregkh@linuxfoundation.org
Subject: Re: [PATCH -next] usb: typec: fusb302: Switch to use dev_err_probe()
 helper
Message-ID: <Yyxu9h69/15jKULy@kuha.fi.intel.com>
References: <20220922134806.2204579-1-yangyingliang@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220922134806.2204579-1-yangyingliang@huawei.com>
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Sep 22, 2022 at 09:48:06PM +0800, Yang Yingliang wrote:
> In the probe path, dev_err() can be replaced with dev_err_probe()
> which will check if error code is -EPROBE_DEFER and prints the
> error name. It also sets the defer probe reason which can be
> checked later through debugfs. It's more simple in error path.
> 
> Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>

Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> ---
>  drivers/usb/typec/tcpm/fusb302.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/usb/typec/tcpm/fusb302.c b/drivers/usb/typec/tcpm/fusb302.c
> index db83b377b2f6..721b2a548084 100644
> --- a/drivers/usb/typec/tcpm/fusb302.c
> +++ b/drivers/usb/typec/tcpm/fusb302.c
> @@ -1743,9 +1743,8 @@ static int fusb302_probe(struct i2c_client *client,
>  	chip->tcpm_port = tcpm_register_port(&client->dev, &chip->tcpc_dev);
>  	if (IS_ERR(chip->tcpm_port)) {
>  		fwnode_handle_put(chip->tcpc_dev.fwnode);
> -		ret = PTR_ERR(chip->tcpm_port);
> -		if (ret != -EPROBE_DEFER)
> -			dev_err(dev, "cannot register tcpm port, ret=%d", ret);
> +		ret = dev_err_probe(dev, PTR_ERR(chip->tcpm_port),
> +				    "cannot register tcpm port\n");
>  		goto destroy_workqueue;
>  	}
>  
> -- 
> 2.25.1

-- 
heikki
