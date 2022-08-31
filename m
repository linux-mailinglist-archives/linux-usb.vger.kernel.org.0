Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ACF2D5A78F2
	for <lists+linux-usb@lfdr.de>; Wed, 31 Aug 2022 10:23:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231361AbiHaIXL (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 31 Aug 2022 04:23:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51174 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231211AbiHaIWy (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 31 Aug 2022 04:22:54 -0400
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C9D587434B;
        Wed, 31 Aug 2022 01:22:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1661934122; x=1693470122;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=dMx5gQK4P0/43L/ocP4Db4yCGe9lHBrO7/00ZiSt77M=;
  b=SBe5SzDYjFnfU1u+Vj9gnVb1ek6lm8Xea5yPfNITuye1qEA3IuXWbuun
   02NNxZnGWlFmWW6NVJIQaoz1JufGcsKh7GrD+lbVN4aO5pRJP9E7eQn3I
   sIDl+e/4EoI07hZkuw7bglQyKjBI7hlXLp+yCr575p5vu9idywI88qRzf
   VNcDi2G4wFjaKmptstoBKGs0/oo0A4Y42AIqI/1EQMO9kfJcsEbK8oqz2
   mo47XOSuW+ciITwG83h8LCgYgKheBfuxnlRK/bnokYvi1oxOQx+TH5Hcj
   SQSAs6HR6KKHLjFqTq4dZFo40VYkLX9VP+jnWR4YYkj/1GoXRoD3mjT09
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10455"; a="292977629"
X-IronPort-AV: E=Sophos;i="5.93,277,1654585200"; 
   d="scan'208";a="292977629"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2022 01:22:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,277,1654585200"; 
   d="scan'208";a="754352948"
Received: from kuha.fi.intel.com ([10.237.72.185])
  by fmsmga001.fm.intel.com with SMTP; 31 Aug 2022 01:22:00 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Wed, 31 Aug 2022 11:21:59 +0300
Date:   Wed, 31 Aug 2022 11:21:59 +0300
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     zhaoxiao <zhaoxiao@uniontech.com>
Cc:     gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb:mux:intel_pmc_mux: Use the helper
 acpi_dev_get_memory_resources()
Message-ID: <Yw8aJ8QC1BtBNBfx@kuha.fi.intel.com>
References: <20220831061126.25172-1-zhaoxiao@uniontech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220831061126.25172-1-zhaoxiao@uniontech.com>
X-Spam-Status: No, score=-7.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Aug 31, 2022 at 02:11:26PM +0800, zhaoxiao wrote:
> It removes the need to check the resource data type separately.
> 
> Signed-off-by: zhaoxiao <zhaoxiao@uniontech.com>

Was this patch generated by yet another bot?

If that's the case, then I would appreciated that you clearly state
that here somehow, just like the other projects.

thanks,

> ---
>  drivers/usb/typec/mux/intel_pmc_mux.c | 9 +--------
>  1 file changed, 1 insertion(+), 8 deletions(-)
> 
> diff --git a/drivers/usb/typec/mux/intel_pmc_mux.c b/drivers/usb/typec/mux/intel_pmc_mux.c
> index 47b733f78fb0..6207c8f54240 100644
> --- a/drivers/usb/typec/mux/intel_pmc_mux.c
> +++ b/drivers/usb/typec/mux/intel_pmc_mux.c
> @@ -569,13 +569,6 @@ static int pmc_usb_register_port(struct pmc_usb *pmc, int index,
>  	return ret;
>  }
>  
> -static int is_memory(struct acpi_resource *res, void *data)
> -{
> -	struct resource r;
> -
> -	return !acpi_dev_resource_memory(res, &r);
> -}
> -
>  /* IOM ACPI IDs and IOM_PORT_STATUS_OFFSET */
>  static const struct acpi_device_id iom_acpi_ids[] = {
>  	/* TigerLake */
> @@ -606,7 +599,7 @@ static int pmc_usb_probe_iom(struct pmc_usb *pmc)
>  		return -ENODEV;
>  
>  	INIT_LIST_HEAD(&resource_list);
> -	ret = acpi_dev_get_resources(adev, &resource_list, is_memory, NULL);
> +	ret = acpi_dev_get_memory_resources(adev, &resource_list);
>  	if (ret < 0)
>  		return ret;
>  
> -- 
> 2.20.1

-- 
heikki
