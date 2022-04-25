Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1C4DD50DAEB
	for <lists+linux-usb@lfdr.de>; Mon, 25 Apr 2022 10:14:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231897AbiDYIQv (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 25 Apr 2022 04:16:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34326 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229516AbiDYIQu (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 25 Apr 2022 04:16:50 -0400
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CE34157162
        for <linux-usb@vger.kernel.org>; Mon, 25 Apr 2022 01:13:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1650874424; x=1682410424;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=0/Lqx6rK1nzQbOEg3GJ9LN0HLopbgD9x5/V9J3CbkG4=;
  b=dgR5nZousEZUP8BD75VELpr6CTDT79ixsFcN5ksXEp/56PE8UN6an21d
   MSSSOVemNwHoh5SbwkwzSaadDQvG2ar/Jz369vm7Oj7Lo+1q0KUsiTsou
   YzFbm0wc2/UndMJE2xcgOATXUoHMJjAoo72h44ibKSJvQD66ZHUV+63gD
   xBpWesR9P+NwIh3AMBONCtziP/lEt+c8uBeE2AtxWhOww33DRtSd5TiO1
   2QiVbd6++7cENnBEDaSN9No0Tgif/wqSvHpeibUZCul6uRNexDkaAGWSV
   mFMQkeGh/STyda3sceKpPEcSaVZzGzWbjO08UljYq4sKpuqrnKzwLA6cw
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10327"; a="351626784"
X-IronPort-AV: E=Sophos;i="5.90,287,1643702400"; 
   d="scan'208";a="351626784"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2022 01:13:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,287,1643702400"; 
   d="scan'208";a="704458771"
Received: from kuha.fi.intel.com ([10.237.72.185])
  by fmsmga001.fm.intel.com with SMTP; 25 Apr 2022 01:13:42 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Mon, 25 Apr 2022 11:13:41 +0300
Date:   Mon, 25 Apr 2022 11:13:41 +0300
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Linyu Yuan <quic_linyyuan@quicinc.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, Jack Pham <quic_jackp@quicinc.com>
Subject: Re: [PATCH v5 2/3] usb: typec: ucsi: do not allocate one extra
 unused connector
Message-ID: <YmZYNWewOiHNu+9D@kuha.fi.intel.com>
References: <1650597022-19793-1-git-send-email-quic_linyyuan@quicinc.com>
 <1650597022-19793-3-git-send-email-quic_linyyuan@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1650597022-19793-3-git-send-email-quic_linyyuan@quicinc.com>
X-Spam-Status: No, score=-4.9 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Apr 22, 2022 at 11:10:21AM +0800, Linyu Yuan wrote:
> In ucsi_init(), it allocate number of (ucsi->cap.num_connectors + 1)
> connectors, there is one extra as the ending.
> ucsi_unregister_connectors() is safe to unregister all ucsi connectors
> according ucsi->cap.num_connectors.
> 
> Let's remove the extra one connector to save memory.

Maybe you could just merge this one into the first patch.

> Signed-off-by: Linyu Yuan <quic_linyyuan@quicinc.com>
> ---
> v2: new change
> v3: no change
> v4: fix a typo extral -> extra in commit description
> v5: update commit description
> 
>  drivers/usb/typec/ucsi/ucsi.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
> index af9a2a1..ce9192e 100644
> --- a/drivers/usb/typec/ucsi/ucsi.c
> +++ b/drivers/usb/typec/ucsi/ucsi.c
> @@ -1251,7 +1251,7 @@ static int ucsi_init(struct ucsi *ucsi)
>  	}
>  
>  	/* Allocate the connectors. Released in ucsi_unregister() */
> -	ucsi->connector = kcalloc(ucsi->cap.num_connectors + 1,
> +	ucsi->connector = kcalloc(ucsi->cap.num_connectors,
>  				  sizeof(*ucsi->connector), GFP_KERNEL);
>  	if (!ucsi->connector) {
>  		ret = -ENOMEM;
> -- 
> 2.7.4

thanks,

-- 
heikki
