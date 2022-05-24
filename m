Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 472D7532834
	for <lists+linux-usb@lfdr.de>; Tue, 24 May 2022 12:50:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231975AbiEXKuc (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 24 May 2022 06:50:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36424 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229534AbiEXKua (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 24 May 2022 06:50:30 -0400
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5FB7665D35
        for <linux-usb@vger.kernel.org>; Tue, 24 May 2022 03:50:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1653389430; x=1684925430;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=eATiG80+Fef3jOUN5hgqNn+1nqfwmwbrLO9bhvYisFM=;
  b=kcb6YAO0jz4hekMR9Yo1Ew//5q2+uzjw4xiK2v9tpFKdI+SfDywRi6Dr
   Lh8n1GViO2bsiRfeh5rH19Qu0dsKvMIsm62/wO5ZrqpSH/PQ0hwj8SxTQ
   po1XBECPl76I2bJ23h2DWaXUBRM1LHan60qYv5Bo+L1RAhhbjXh/YJ4ZO
   eNFZPpMjxiEOZhOFXT+qekhuiHt25MIt3zJbwTy3tC74q2BjJyAYHc1ik
   BPSj9nwJov5AGmtHi6W3uDgo5HC0CssLmTH23yW4LsuzZmPPRTP50YNTX
   wtq5WRix58uObK2olO0rEvL21Mzb2kFh+us2Vz5YJEXHAH1rTDxy3MN/s
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10356"; a="255559307"
X-IronPort-AV: E=Sophos;i="5.91,248,1647327600"; 
   d="scan'208";a="255559307"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 May 2022 03:50:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,248,1647327600"; 
   d="scan'208";a="717120963"
Received: from kuha.fi.intel.com ([10.237.72.185])
  by fmsmga001.fm.intel.com with SMTP; 24 May 2022 03:50:27 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Tue, 24 May 2022 13:50:26 +0300
Date:   Tue, 24 May 2022 13:50:26 +0300
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Sanket Goswami <Sanket.Goswami@amd.com>
Cc:     gregkh@linuxfoundation.org, ajayg@nvidia.com,
        linux-usb@vger.kernel.org
Subject: Re: [PATCH v2 1/2] ucsi_ccg: ACPI based I2c client enumeration for
 AMD ASICs
Message-ID: <Yoy4ckohFhuWGmG0@kuha.fi.intel.com>
References: <20220520112704.1461022-1-Sanket.Goswami@amd.com>
 <20220520112704.1461022-2-Sanket.Goswami@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220520112704.1461022-2-Sanket.Goswami@amd.com>
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, May 20, 2022 at 04:57:03PM +0530, Sanket Goswami wrote:
> Some of the AMD platforms have Cypress CCGX PD controller connected
> to system I2C i.e designware I2C controller. Added support to enumerate
> the CCGX client by adding ACPI ID to the firmware.

Oh, this patch needs to come only after the patch 2/2. Otherwise
you'll break bisectability. Please swap the places of these patches in
the next version.

thanks,

> Signed-off-by: Sanket Goswami <Sanket.Goswami@amd.com>
> ---
>  drivers/usb/typec/ucsi/ucsi_ccg.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/usb/typec/ucsi/ucsi_ccg.c b/drivers/usb/typec/ucsi/ucsi_ccg.c
> index 6db7c8ddd51c..7585599bacfd 100644
> --- a/drivers/usb/typec/ucsi/ucsi_ccg.c
> +++ b/drivers/usb/typec/ucsi/ucsi_ccg.c
> @@ -1418,6 +1418,12 @@ static const struct i2c_device_id ucsi_ccg_device_id[] = {
>  };
>  MODULE_DEVICE_TABLE(i2c, ucsi_ccg_device_id);
>  
> +static const struct acpi_device_id amd_i2c_ucsi_match[] = {
> +	{"AMDI0042"},
> +	{}
> +};
> +MODULE_DEVICE_TABLE(acpi, amd_i2c_ucsi_match);
> +
>  static int ucsi_ccg_resume(struct device *dev)
>  {
>  	struct i2c_client *client = to_i2c_client(dev);
> @@ -1459,6 +1465,7 @@ static struct i2c_driver ucsi_ccg_driver = {
>  		.name = "ucsi_ccg",
>  		.pm = &ucsi_ccg_pm,
>  		.dev_groups = ucsi_ccg_groups,
> +		.acpi_match_table = amd_i2c_ucsi_match,
>  	},
>  	.probe = ucsi_ccg_probe,
>  	.remove = ucsi_ccg_remove,
> -- 
> 2.25.1

-- 
heikki
