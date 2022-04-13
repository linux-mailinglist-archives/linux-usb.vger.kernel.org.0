Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E39CD4FF0C5
	for <lists+linux-usb@lfdr.de>; Wed, 13 Apr 2022 09:46:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232648AbiDMHsh (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 13 Apr 2022 03:48:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42344 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233459AbiDMHse (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 13 Apr 2022 03:48:34 -0400
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4C4C73BBCF
        for <linux-usb@vger.kernel.org>; Wed, 13 Apr 2022 00:46:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1649835974; x=1681371974;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=xTOb3tRMZd7riltPlAFYvY9zywdeJJXIvXwM3fKsANY=;
  b=Zbrw8otFHD91kAfgoeKvUHLKrxCXz7oO3YrAWvm+lN3hyvHy494cKLcw
   cNkNxQk7LAI1tcOhpu8NHZYlugqfpqsTq46kfqHE3gXkAj0AiP3LmHtM3
   mmYr90M1Dgd1lXj3XRDf6XwPXH/gqHP6XIgzVYez2whVH7ZXoZCLvPr0w
   sJlcvtx5wRpltMTpoRQtYeqg5A1MZJ0gBGQ424Xc0E0Urlfg+2wueKElb
   jRTZtk5+x01jTIa7pbKRfhcNGI8m3qKzzUB6fvsB+vZ13CPIi1xLtjyUL
   ZkAHsHd7w6uVmBV0APuH6w0IMbETcN8IAPvcwpK7HgFd93zI9ApTTnN3p
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10315"; a="262043235"
X-IronPort-AV: E=Sophos;i="5.90,256,1643702400"; 
   d="scan'208";a="262043235"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Apr 2022 00:46:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,256,1643702400"; 
   d="scan'208";a="700150567"
Received: from kuha.fi.intel.com ([10.237.72.185])
  by fmsmga001.fm.intel.com with SMTP; 13 Apr 2022 00:46:11 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Wed, 13 Apr 2022 10:46:10 +0300
Date:   Wed, 13 Apr 2022 10:46:10 +0300
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Linyu Yuan <quic_linyyuan@quicinc.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, Jack Pham <quic_jackp@quicinc.com>
Subject: Re: [PATCH 3/3] usb: typec: ucsi: retry find role swithch when
 module load late
Message-ID: <YlZ/wrIRUD7HpMDB@kuha.fi.intel.com>
References: <1649759407-24049-1-git-send-email-quic_linyyuan@quicinc.com>
 <1649759407-24049-4-git-send-email-quic_linyyuan@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1649759407-24049-4-git-send-email-quic_linyyuan@quicinc.com>
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Apr 12, 2022 at 06:30:07PM +0800, Linyu Yuan wrote:
> When role switch enabled, return -EAGAIN if fail to find it due to
> module load ordering issue, then restart ucsi init work to find
> it again every 100ms.
> 
> It also means change ucsi init work to delayed_work.
> 
> Signed-off-by: Linyu Yuan <quic_linyyuan@quicinc.com>
> ---
>  drivers/usb/typec/ucsi/ucsi.c | 28 ++++++++++++++++------------
>  drivers/usb/typec/ucsi/ucsi.h |  2 +-
>  2 files changed, 17 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
> index 684fc4f..fabd4df 100644
> --- a/drivers/usb/typec/ucsi/ucsi.c
> +++ b/drivers/usb/typec/ucsi/ucsi.c
> @@ -1053,6 +1053,14 @@ static int ucsi_register_port(struct ucsi *ucsi, int index)
>  	con->num = index + 1;
>  	con->ucsi = ucsi;
>  
> +	cap->fwnode = ucsi_find_fwnode(con);
> +	con->usb_role_sw = fwnode_usb_role_switch_get(cap->fwnode);
> +	if (IS_ERR(con->usb_role_sw)) {
> +		dev_err(ucsi->dev, "con%d: failed to get usb role switch\n",
> +			index + 1);
> +		return -EAGAIN;
> +	}

No, this is wrong. If there is a role switch assigned in the firmware
for the port, then fwnode_usb_role_switch_get() will return
-EPROBE_DEFER until the switch has been registered.

So I think what you want to do is just make the failure to get the
role switch fatal in this driver. Just return PTR_ERR(con->usb_role_sw).

thanks,

-- 
heikki
