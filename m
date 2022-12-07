Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4341964590A
	for <lists+linux-usb@lfdr.de>; Wed,  7 Dec 2022 12:30:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230078AbiLGLaX (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 7 Dec 2022 06:30:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41266 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230145AbiLGLaI (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 7 Dec 2022 06:30:08 -0500
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4C3425132E
        for <linux-usb@vger.kernel.org>; Wed,  7 Dec 2022 03:30:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1670412607; x=1701948607;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=p5u0Nhc1WGFwHT58QRJVH3h6E3E/5VQA0pLihMnB89c=;
  b=PKwOMyVBd7nfpY0d7r9DKzb9VDKZGXEGl1jdKy3K5K8eiZ+vVeqhtICz
   7/mCxRYeoYAEVR+zG3gPnR7ThSON49lm/url1cCaLXKVC9HY7yAAJ4mvQ
   z/1/RKLemQCgA6U40DJ46pf7N4mESvB7+B0eLkHo7Na0KhI48bWXmmHqd
   9tdxy9L/xaefP3jTGLabkillq0qtWH27z1Gv6t7giY2oNV+rV9hIkkA94
   2k7pDv1ijW/f3g+KCgiK7ZrMrrFKkKc8jTLKLxX9mat6eCvUpF/5twjvO
   p8OFMo15Cy0U53qtaD0E3mT26089ZDaUSjbrVqyHaxUQM/G5xR5k4KHYk
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10553"; a="379035889"
X-IronPort-AV: E=Sophos;i="5.96,225,1665471600"; 
   d="scan'208";a="379035889"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Dec 2022 03:30:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10553"; a="788861346"
X-IronPort-AV: E=Sophos;i="5.96,225,1665471600"; 
   d="scan'208";a="788861346"
Received: from kuha.fi.intel.com ([10.237.72.185])
  by fmsmga001.fm.intel.com with SMTP; 07 Dec 2022 03:30:04 -0800
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Wed, 07 Dec 2022 13:30:03 +0200
Date:   Wed, 7 Dec 2022 13:30:03 +0200
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Yang Yingliang <yangyingliang@huawei.com>
Cc:     gregkh@linuxfoundation.org, samuel@sholland.org,
        linux-usb@vger.kernel.org
Subject: Re: [PATCH] usb: typec: wusb3801: fix fwnode refcount leak in
 wusb3801_probe()
Message-ID: <Y5B5O6J5ahZTJPhv@kuha.fi.intel.com>
References: <20221203071027.3808308-1-yangyingliang@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221203071027.3808308-1-yangyingliang@huawei.com>
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sat, Dec 03, 2022 at 03:10:27PM +0800, Yang Yingliang wrote:
> I got the following report while doing fault injection test:
> 
>   OF: ERROR: memory leak, expected refcount 1 instead of 4,
>   of_node_get()/of_node_put() unbalanced - destroy cset entry:
>   attach overlay node /i2c/tcpc@60/connector
> 
> If wusb3801_hw_init() fails, fwnode_handle_put() needs be called to
> avoid refcount leak.
> 
> Fixes: d016cbe4d7ac ("usb: typec: Support the WUSB3801 port controller")
> Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>

Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> ---
>  drivers/usb/typec/wusb3801.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/typec/wusb3801.c b/drivers/usb/typec/wusb3801.c
> index 3cc7a15ecbd3..a43a18d4b02e 100644
> --- a/drivers/usb/typec/wusb3801.c
> +++ b/drivers/usb/typec/wusb3801.c
> @@ -364,7 +364,7 @@ static int wusb3801_probe(struct i2c_client *client)
>  	/* Initialize the hardware with the devicetree settings. */
>  	ret = wusb3801_hw_init(wusb3801);
>  	if (ret)
> -		return ret;
> +		goto err_put_connector;
>  
>  	wusb3801->cap.revision		= USB_TYPEC_REV_1_2;
>  	wusb3801->cap.accessory[0]	= TYPEC_ACCESSORY_AUDIO;
> -- 
> 2.25.1

-- 
heikki
