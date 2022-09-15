Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9E2195B94C0
	for <lists+linux-usb@lfdr.de>; Thu, 15 Sep 2022 08:53:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229671AbiIOGx4 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 15 Sep 2022 02:53:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34018 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229463AbiIOGxz (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 15 Sep 2022 02:53:55 -0400
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C68B5543D2
        for <linux-usb@vger.kernel.org>; Wed, 14 Sep 2022 23:53:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1663224834; x=1694760834;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=xcIjYXcMtKqYNrqKmzwckbuk5NMo9dp6RRy2TKMReZ0=;
  b=Dlco1rPPwKVQN8I3tY2bH7upzuyzaidzshRYXg8F2TxnOMrmUN0iClsx
   MwClY7OCD+IolmBW/wO3CkOGGx2ME/C4HWeGIzDpzrS4N3KCRTUCV2yAA
   k/7+TFW0umN7I4tJlJPPDx1tuLfREqOYy7yQCXosBrN/L8r6Wfta1zDD5
   iPK8C1XL6nK1EugrsDNH7zIGe0W3k32sFkk9C1FvWNmpA0NgyKBfslEJ9
   aK94HzfNL4xg2aA/4SK22WXh2kOaSrqKlopAYtZyH8HanMU4mMlXYCKUh
   B2G7jpjq7LWnQJVjQiu/mPLzYLQgr041/myTvvapv6Zi+t3yYy4wPjbH0
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10470"; a="362591233"
X-IronPort-AV: E=Sophos;i="5.93,317,1654585200"; 
   d="scan'208";a="362591233"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2022 23:53:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,317,1654585200"; 
   d="scan'208";a="759513725"
Received: from kuha.fi.intel.com ([10.237.72.185])
  by fmsmga001.fm.intel.com with SMTP; 14 Sep 2022 23:53:52 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Thu, 15 Sep 2022 09:53:51 +0300
Date:   Thu, 15 Sep 2022 09:53:51 +0300
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Liang He <windhl@126.com>
Cc:     gregkh@linuxfoundation.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH] usb: typec: anx7411: Call of_node_get() before
 of_find_xxx API
Message-ID: <YyLL/zGW+Zr1+t0H@kuha.fi.intel.com>
References: <20220915025400.4003321-1-windhl@126.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220915025400.4003321-1-windhl@126.com>
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Sep 15, 2022 at 10:54:00AM +0800, Liang He wrote:
> In anx7411_typec_switch_probe(), we should call of_node_get() before
> of_find_node_by_name() which will automatically decrease the 'from'
> argument.

Just use of_get_child_by_name() instead of of_find_node_by_name(). If
you don't need recursion, then there is no point in using
of_find_node_by_name().

thanks,

> Fixes: fe6d8a9c8e64 ("usb: typec: anx7411: Add Analogix PD ANX7411 support")
> Signed-off-by: Liang He <windhl@126.com>
> ---
>  drivers/usb/typec/anx7411.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/usb/typec/anx7411.c b/drivers/usb/typec/anx7411.c
> index c0f0842d443c..fe000bbf7183 100644
> --- a/drivers/usb/typec/anx7411.c
> +++ b/drivers/usb/typec/anx7411.c
> @@ -1105,6 +1105,7 @@ static int anx7411_typec_switch_probe(struct anx7411_data *ctx,
>  	int ret;
>  	struct device_node *node;
>  
> +	of_node_get(dev->of_node);
>  	node = of_find_node_by_name(dev->of_node, "orientation_switch");
>  	if (!node)
>  		return 0;
> @@ -1115,6 +1116,7 @@ static int anx7411_typec_switch_probe(struct anx7411_data *ctx,
>  		return ret;
>  	}
>  
> +	of_node_get(dev->of_node);
>  	node = of_find_node_by_name(dev->of_node, "mode_switch");
>  	if (!node) {
>  		dev_err(dev, "no typec mux exist");
> -- 
> 2.25.1

-- 
heikki
