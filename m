Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 38DD2633739
	for <lists+linux-usb@lfdr.de>; Tue, 22 Nov 2022 09:33:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232784AbiKVIdm (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 22 Nov 2022 03:33:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40014 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232842AbiKVIdl (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 22 Nov 2022 03:33:41 -0500
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E5CCA3120F
        for <linux-usb@vger.kernel.org>; Tue, 22 Nov 2022 00:33:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1669106020; x=1700642020;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=cYPAGb5oKJW8nbZSQ3cbPAiJ81KgHSrX09eWiow0/c0=;
  b=W4JGlT6GDZNeiHJx8FvWVLUMRyfx7cSl86JAai7d3zAtLgKfDU6k29ov
   I4qjrM/9s7vOSKrM0CCx9SkCK64Sj+iKCC+Knb+Q0BgE+IdDtEfoZben1
   Ik8WzaeUaCWZGtbvOe6aUptjvTwfe60xoEkGG+pbRj/bwIPHLLS8Kgo4F
   8FVN47NGr3Z/o4Axbhninc7JJ27hgrfgAEyDP729y2Q1Hgp5fHzwtWuXh
   wOsOVkLy4fyOi/6PVmjaEF50ZEaFqoLduPpYDQZTgNBZzPPKGp42CZ5qF
   YU02+QxAWTnoUY9K/5MF6Y9uC+ycv1d2LaOT96GNmVeP2BkR/qksq+DBI
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10538"; a="314914128"
X-IronPort-AV: E=Sophos;i="5.96,183,1665471600"; 
   d="scan'208";a="314914128"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2022 00:33:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10538"; a="783768508"
X-IronPort-AV: E=Sophos;i="5.96,183,1665471600"; 
   d="scan'208";a="783768508"
Received: from kuha.fi.intel.com ([10.237.72.185])
  by fmsmga001.fm.intel.com with SMTP; 22 Nov 2022 00:33:38 -0800
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Tue, 22 Nov 2022 10:33:37 +0200
Date:   Tue, 22 Nov 2022 10:33:37 +0200
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Yang Yingliang <yangyingliang@huawei.com>
Cc:     gregkh@linuxfoundation.org, chunfeng.yun@mediatek.com,
        linux-usb@vger.kernel.org
Subject: Re: [PATCH v3] usb: roles: fix of node refcount leak in
 usb_role_switch_is_parent()
Message-ID: <Y3yJYXBKgwD1fmCg@kuha.fi.intel.com>
References: <20221121144620.4059019-1-yangyingliang@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221121144620.4059019-1-yangyingliang@huawei.com>
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

On Mon, Nov 21, 2022 at 10:46:20PM +0800, Yang Yingliang wrote:
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
> Suggested-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

That's not the appropriate tag in this case. I have not suggested
this patch.

> Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
> ---
> v2 -> v3:
>   Remove not needed null pointer check.
> 
> v1 -> v2:
>   Add description to how is the report generated.
> ---
>  drivers/usb/roles/class.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/roles/class.c b/drivers/usb/roles/class.c
> index dfaed7eee94f..0650295f261c 100644
> --- a/drivers/usb/roles/class.c
> +++ b/drivers/usb/roles/class.c
> @@ -106,10 +106,13 @@ usb_role_switch_is_parent(struct fwnode_handle *fwnode)
>  	struct fwnode_handle *parent = fwnode_get_parent(fwnode);
>  	struct device *dev;
>  
> -	if (!parent || !fwnode_property_present(parent, "usb-role-switch"))
> +	if (!parent || !fwnode_property_present(parent, "usb-role-switch")) {

Please change that as well like I proposed earlier:

	if (!fwnode_property_present(parent, "usb-role-switch")) {

You don't need to check the parent separately.

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
