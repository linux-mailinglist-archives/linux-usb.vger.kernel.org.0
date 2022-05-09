Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0C05051FDE5
	for <lists+linux-usb@lfdr.de>; Mon,  9 May 2022 15:17:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235539AbiEINUC (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 9 May 2022 09:20:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45096 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235740AbiEINTH (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 9 May 2022 09:19:07 -0400
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B8FD52AD762;
        Mon,  9 May 2022 06:15:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1652102104; x=1683638104;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=iSnrFBxr06fSphcPtR/WLDqJAPFHt5RKs7RAaUtGNkA=;
  b=FkSuMDnY5tCpnLcoHfY04A4M2cQKSlIW4PMM7ibZCJlsijKE/mWzEeyU
   MC8H+hZKDmp7J6Hj9QijgNHoeDkI9gBkwN/+m8L6KUZRkhUm0C8/YiEyQ
   qTvs8vrz4/SAhaC0ga03gAt8CHg+J3ieS1+ZS19AaOisEz/QnsAiMnoyL
   M5XLZ5gH8norKrbvQjyHaWm5qDKWf26FgtgHaGqWZYLDF2CGMA8kM3J3y
   VGtx5yzBvjPQrnJLZSr6N+WjPjyLZle3pI3lG6BUVunCCgH7PzsAqpeoH
   kLZdPULP5ugfe9qLuflNsa1t17G3gFMSqi3XxR6m6V97SY0+DnAa+7sRR
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10341"; a="249582456"
X-IronPort-AV: E=Sophos;i="5.91,211,1647327600"; 
   d="scan'208";a="249582456"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 May 2022 06:14:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,211,1647327600"; 
   d="scan'208";a="710519730"
Received: from kuha.fi.intel.com ([10.237.72.185])
  by fmsmga001.fm.intel.com with SMTP; 09 May 2022 06:14:09 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Mon, 09 May 2022 16:14:08 +0300
Date:   Mon, 9 May 2022 16:14:08 +0300
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
        linux-usb@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] usb: typec: ucsi: acpi: fix a NULL vs IS_ERR() check in
 probe
Message-ID: <YnkToKe1WM0qW4Si@kuha.fi.intel.com>
References: <YnjaDBXLmwouCB3M@kili>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YnjaDBXLmwouCB3M@kili>
X-Spam-Status: No, score=-4.9 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, May 09, 2022 at 12:08:28PM +0300, Dan Carpenter wrote:
> The devm_memremap() function never returns NULL.  It returns error
> pointers.

Oh, so memremap() and devm_memremap() don't behave the same way.
That's a bummer. Thanks for catching this.

Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> Fixes: cdc3d2abf438 ("usb: typec: ucsi: acpi: Map the mailbox with memremap()")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>  drivers/usb/typec/ucsi/ucsi_acpi.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/usb/typec/ucsi/ucsi_acpi.c b/drivers/usb/typec/ucsi/ucsi_acpi.c
> index 7455e3aff2be..8873c1644a29 100644
> --- a/drivers/usb/typec/ucsi/ucsi_acpi.c
> +++ b/drivers/usb/typec/ucsi/ucsi_acpi.c
> @@ -133,8 +133,8 @@ static int ucsi_acpi_probe(struct platform_device *pdev)
>  	}
>  
>  	ua->base = devm_memremap(&pdev->dev, res->start, resource_size(res), MEMREMAP_WB);
> -	if (!ua->base)
> -		return -ENOMEM;
> +	if (IS_ERR(ua->base))
> +		return PTR_ERR(ua->base);
>  
>  	ret = guid_parse(UCSI_DSM_UUID, &ua->guid);
>  	if (ret)
> -- 
> 2.35.1

-- 
heikki
