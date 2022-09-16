Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 726B25BA9D3
	for <lists+linux-usb@lfdr.de>; Fri, 16 Sep 2022 12:00:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230304AbiIPJ7B (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 16 Sep 2022 05:59:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45618 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230319AbiIPJ64 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 16 Sep 2022 05:58:56 -0400
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EFC73AB04C
        for <linux-usb@vger.kernel.org>; Fri, 16 Sep 2022 02:58:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1663322332; x=1694858332;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=t537bmNkqs9dAyQDbXHcnZQTEQ6XLcQZ2HqYuG2/gBE=;
  b=NGpgifRG71TTW37WsD4z8RA13G1oY0hj/rUCIylh+cQ0DO8bR+jIjoCD
   Qe0Z9BBCdN3USgCj+JpP4Xmcgr3LezW3QIy2LoAn+5YuCFgcKuZwxCAAG
   BFiDE1PFTH432cv/Hfb+DFUTBjvNrqAhZdfKifgqpBo/p8zZ84nhLcaJl
   lg1H5rBrsHk7xHMluW9TdoF2Qipxhh5oAWRwqRkCTSBfOn7p5h94ckz7C
   eiW9SL+SJTWeXKZShIwDU/68Ku2d0YpUeVbYHvUnEvgNl+IGWiqee8QWI
   arAcjc/VHVpHBoHRB7Y7I4qJqHYVIDO+vMBqOFLCDJuAywor4w9725n7m
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10471"; a="279338655"
X-IronPort-AV: E=Sophos;i="5.93,320,1654585200"; 
   d="scan'208";a="279338655"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2022 02:58:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,320,1654585200"; 
   d="scan'208";a="759991579"
Received: from kuha.fi.intel.com ([10.237.72.185])
  by fmsmga001.fm.intel.com with SMTP; 16 Sep 2022 02:58:48 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Fri, 16 Sep 2022 12:58:47 +0300
Date:   Fri, 16 Sep 2022 12:58:47 +0300
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Liang He <windhl@126.com>
Cc:     gregkh@linuxfoundation.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH v2] usb: typec: anx7411: Use of_get_child_by_name()
 instead of of_find_node_by_name()
Message-ID: <YyRI12FZYWCG7KNw@kuha.fi.intel.com>
References: <20220915092209.4009273-1-windhl@126.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220915092209.4009273-1-windhl@126.com>
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Sep 15, 2022 at 05:22:09PM +0800, Liang He wrote:
> In anx7411_typec_switch_probe(), we should call of_get_child_by_name()
> instead of of_find_node_by_name() as of_find_xxx API will decrease the
> refcount of the 'from' argument.
> 
> Fixes: fe6d8a9c8e64 ("usb: typec: anx7411: Add Analogix PD ANX7411 support")
> Signed-off-by: Liang He <windhl@126.com>

Acked-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> ---
>  
>  v2: use of_get_child_by_name() advised by Heikki Krogerus.
> 
>  drivers/usb/typec/anx7411.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/usb/typec/anx7411.c b/drivers/usb/typec/anx7411.c
> index c0f0842d443c..f178d0eb47b1 100644
> --- a/drivers/usb/typec/anx7411.c
> +++ b/drivers/usb/typec/anx7411.c
> @@ -1105,7 +1105,7 @@ static int anx7411_typec_switch_probe(struct anx7411_data *ctx,
>  	int ret;
>  	struct device_node *node;
>  
> -	node = of_find_node_by_name(dev->of_node, "orientation_switch");
> +	node = of_get_child_by_name(dev->of_node, "orientation_switch");
>  	if (!node)
>  		return 0;
>  
> @@ -1115,7 +1115,7 @@ static int anx7411_typec_switch_probe(struct anx7411_data *ctx,
>  		return ret;
>  	}
>  
> -	node = of_find_node_by_name(dev->of_node, "mode_switch");
> +	node = of_get_child_by_name(dev->of_node, "mode_switch");
>  	if (!node) {
>  		dev_err(dev, "no typec mux exist");
>  		ret = -ENODEV;

thanks,

-- 
heikki
