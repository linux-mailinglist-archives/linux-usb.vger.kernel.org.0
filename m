Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F1B34522DC6
	for <lists+linux-usb@lfdr.de>; Wed, 11 May 2022 09:59:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236824AbiEKH7q (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 11 May 2022 03:59:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55922 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235522AbiEKH7p (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 11 May 2022 03:59:45 -0400
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6242265413
        for <linux-usb@vger.kernel.org>; Wed, 11 May 2022 00:59:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1652255983; x=1683791983;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=MsSCjbbXkHZyqC4MqYBiwbpSRo8ctKjSsqWrBbZA95s=;
  b=dYkFgMN7hDKK5wCEoJijIeOGPPuvKNAaisaNsOh4w/mQbVOUQlPpJ6Wd
   B9R4CGqJ3Ijhtij6ex9COIxNw0jgrulb8hvJOsgN/xncGzzT1tGyJU3U7
   fdDcUQeF2uI0WgYcJDSNeUldXfuJnfky8fh0QEQSgkweUVHQnSo0PJJOQ
   9WadRPVF5ZairEFJqAdtPv+aAvGaTSb7A9c/CbhymunAtHnPXHEsV2p9R
   FXHbrEkJDIFO/S7ZhFyPYKBaVK3lwI9NJIZoEHfw4XM+FYvhLx5nYQSqb
   WVclOvxhE0kYz0GaFpVrCkVi0Ye1+aAsbgyMoLp8fVn2IYBcEGxZ/dNy7
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10343"; a="332662343"
X-IronPort-AV: E=Sophos;i="5.91,216,1647327600"; 
   d="scan'208";a="332662343"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 May 2022 00:59:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,216,1647327600"; 
   d="scan'208";a="711385394"
Received: from kuha.fi.intel.com ([10.237.72.185])
  by fmsmga001.fm.intel.com with SMTP; 11 May 2022 00:59:40 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Wed, 11 May 2022 10:59:39 +0300
Date:   Wed, 11 May 2022 10:59:39 +0300
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Sanket Goswami <Sanket.Goswami@amd.com>
Cc:     gregkh@linuxfoundation.org, ajayg@nvidia.com,
        linux-usb@vger.kernel.org
Subject: Re: [PATCH 2/2] ucsi_ccg: Do not hardcode interrupt polarity and type
Message-ID: <Ynts6+QeiWT7tL3I@kuha.fi.intel.com>
References: <20220510052437.3212186-1-Sanket.Goswami@amd.com>
 <20220510052437.3212186-3-Sanket.Goswami@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220510052437.3212186-3-Sanket.Goswami@amd.com>
X-Spam-Status: No, score=-4.9 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, May 10, 2022 at 10:54:37AM +0530, Sanket Goswami wrote:
> The current implementation supports only Level trigger with ACTIVE HIGH.
> Some of the AMD platforms have different PD firmware implementation which
> needs different polarity. This patch checks the polarity and type based
> on the device properties set and registers the interrupt handler
> accordingly.
> 
> Signed-off-by: Sanket Goswami <Sanket.Goswami@amd.com>
> ---
>  drivers/usb/typec/ucsi/ucsi_ccg.c | 11 +++++++++--
>  1 file changed, 9 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/usb/typec/ucsi/ucsi_ccg.c b/drivers/usb/typec/ucsi/ucsi_ccg.c
> index 7585599bacfd..0db935bd8473 100644
> --- a/drivers/usb/typec/ucsi/ucsi_ccg.c
> +++ b/drivers/usb/typec/ucsi/ucsi_ccg.c
> @@ -20,6 +20,7 @@
>  
>  #include <asm/unaligned.h>
>  #include "ucsi.h"
> +#define INTR_POL_TYPE	BIT(0)
>  
>  enum enum_fw_mode {
>  	BOOT,   /* bootloader */
> @@ -1324,6 +1325,8 @@ static int ucsi_ccg_probe(struct i2c_client *client,
>  	struct device *dev = &client->dev;
>  	struct ucsi_ccg *uc;
>  	int status;
> +	/* Keep the IRQ type and polarity default as Level trigger Active High */
> +	int irqtype = IRQF_TRIGGER_HIGH;
>  
>  	uc = devm_kzalloc(dev, sizeof(*uc), GFP_KERNEL);
>  	if (!uc)
> @@ -1366,8 +1369,12 @@ static int ucsi_ccg_probe(struct i2c_client *client,
>  
>  	ucsi_set_drvdata(uc->ucsi, uc);
>  
> +	status = (uintptr_t)device_get_match_data(dev);
> +	if (status & INTR_POL_TYPE)
> +		irqtype = IRQF_TRIGGER_FALLING;
> +
>  	status = request_threaded_irq(client->irq, NULL, ccg_irq_handler,
> -				      IRQF_ONESHOT | IRQF_TRIGGER_HIGH,
> +				      IRQF_ONESHOT | irqtype,
>  				      dev_name(dev), uc);

Please note that you would need to update ccg_restart() as well, but
there is something else wrong here...

>  	if (status < 0) {
>  		dev_err(uc->dev, "request_threaded_irq failed - %d\n", status);
> @@ -1419,7 +1426,7 @@ static const struct i2c_device_id ucsi_ccg_device_id[] = {
>  MODULE_DEVICE_TABLE(i2c, ucsi_ccg_device_id);
>  
>  static const struct acpi_device_id amd_i2c_ucsi_match[] = {
> -	{"AMDI0042"},
> +	{"AMDI0042", INTR_POL_TYPE},
>  	{}
>  };

This should not be necessary. That information comes from the ACPI
tables.

I don't think that you need to set the polarity/level flags at all in
case of ACPI. I'll double check that, but if that is the case, then you
need to make the case where the device is not ACPI enumerated the
special case instead.


thanks,

-- 
heikki
