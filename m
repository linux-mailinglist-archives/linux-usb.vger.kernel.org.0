Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 030B36352F2
	for <lists+linux-usb@lfdr.de>; Wed, 23 Nov 2022 09:41:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236626AbiKWIlL (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 23 Nov 2022 03:41:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46108 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236614AbiKWIlE (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 23 Nov 2022 03:41:04 -0500
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E6D12FAEB7
        for <linux-usb@vger.kernel.org>; Wed, 23 Nov 2022 00:41:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1669192862; x=1700728862;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=6C3snsGK39TjM4Qk+w+e3m+gX5IIp4Yv8fDd6d9QUWw=;
  b=i8C0rvNZUxV5TBc70T06xWmhB0I8Oxi8kbRyMDK0DrRbwXGkorBrc2SO
   HX4eyCQt7VpO8tYWFN3+naPOQDdve8BOAOZWA6EBZ5w0mHQSRC4UyyRIj
   ZfAWL0qZsXw9fggWG1e5w7t2yyDBTAtqylklAnF5SoRmNChDZyR9ybCFr
   tYFBD8vgfJjg3wwt28F5pQadYbn23iVABXGbg1esOzrEtKYpqjzueX2h2
   V+Y4U2BTnnET2D48VZJQrcOEr3/4t6uWWhrDNEuZUMbKBAuOOeo/MPqhq
   X7QmMPyoRaWwjr/oW2aGvt1A3nH5dpVRzZyrzEkcON7aUVHbGi4Nqg/V6
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10539"; a="378272311"
X-IronPort-AV: E=Sophos;i="5.96,186,1665471600"; 
   d="scan'208";a="378272311"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2022 00:41:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10539"; a="784157824"
X-IronPort-AV: E=Sophos;i="5.96,186,1665471600"; 
   d="scan'208";a="784157824"
Received: from kuha.fi.intel.com ([10.237.72.185])
  by fmsmga001.fm.intel.com with SMTP; 23 Nov 2022 00:40:57 -0800
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Wed, 23 Nov 2022 10:40:56 +0200
Date:   Wed, 23 Nov 2022 10:40:56 +0200
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Yang Yingliang <yangyingliang@huawei.com>
Cc:     gregkh@linuxfoundation.org, chunfeng.yun@mediatek.com,
        linux-usb@vger.kernel.org
Subject: Re: [PATCH v4] usb: roles: fix of node refcount leak in
 usb_role_switch_is_parent()
Message-ID: <Y33cmL6UaO9InJg/@kuha.fi.intel.com>
References: <20221122111226.251588-1-yangyingliang@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221122111226.251588-1-yangyingliang@huawei.com>
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Nov 22, 2022 at 07:12:26PM +0800, Yang Yingliang wrote:
> I got the following report while doing device(mt6370-tcpc) load
> test with CONFIG_OF_UNITTEST and CONFIG_OF_DYNAMIC enabled:
> 
>   OF: ERROR: memory leak, expected refcount 1 instead of 2,
>   of_node_get()/of_node_put() unbalanced - destroy cset entry:
>   attach overlay node /i2c/pmic@34
> 
> The 'parent' returned by fwnode_get_parent() with refcount incremented.
> it needs be put after using.
> 
> Fixes: 6fadd72943b8 ("usb: roles: get usb-role-switch from parent")
> Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>

Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> ---
> v2 -> v4:
>   Remove not needed null pointer check.
> 
> v1 -> v2:
>   Add description to how is the report generated.
> ---
>  drivers/usb/roles/class.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/roles/class.c b/drivers/usb/roles/class.c
> index dfaed7eee94f..32e6d19f7011 100644
> --- a/drivers/usb/roles/class.c
> +++ b/drivers/usb/roles/class.c
> @@ -106,10 +106,13 @@ usb_role_switch_is_parent(struct fwnode_handle *fwnode)
>  	struct fwnode_handle *parent = fwnode_get_parent(fwnode);
>  	struct device *dev;
>  
> -	if (!parent || !fwnode_property_present(parent, "usb-role-switch"))
> +	if (!fwnode_property_present(parent, "usb-role-switch")) {
> +		fwnode_handle_put(parent);
>  		return NULL;
> +	}
>  
>  	dev = class_find_device_by_fwnode(role_class, parent);
> +	fwnode_handle_put(parent);
>  	return dev ? to_role_switch(dev) : ERR_PTR(-EPROBE_DEFER);
>  }
>  

thanks,

-- 
heikki
