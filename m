Return-Path: <linux-usb+bounces-332-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6989D7A4DC3
	for <lists+linux-usb@lfdr.de>; Mon, 18 Sep 2023 17:59:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 53E3F1C216A0
	for <lists+linux-usb@lfdr.de>; Mon, 18 Sep 2023 15:59:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 81A01210F3;
	Mon, 18 Sep 2023 15:57:35 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9581E63CC;
	Mon, 18 Sep 2023 15:57:33 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9C2DD134;
	Mon, 18 Sep 2023 08:56:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695052559; x=1726588559;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=x/Gkehkxz6H66m4fYJwVcARK+fcXMAjRR7eSmz5gtPw=;
  b=CaelJh/qzKinhHGKWi6K8ul8EeQhjwwrfrgeR52Be6B+12SPFAZso9cT
   GGsQbZR2EhKJoUGn5xRXhvcDeOAqequkV6aCfclIqJfv6CW/bQPsf3e6i
   8KPKoMzYiP62T7yFCX9yH4zqbg2Zzov8R5RGDXihiR11hzmWAMY7eLSwg
   U9QjBYQ0HW0r2Tpik0SEnGJOUUpeRXlJ2fvHS87yV316zeJFinLZN8MFF
   st0ck0SFirm8SveGEsVTcsoPP+S7KBhIUNkaj9OHiXZ0KXuElmomyvGVZ
   9DrmPdIAmOnqHWX1+osOH2woVdJICetZ8SGbY7i/3imrcbId8G3ppx5Rx
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10837"; a="443727940"
X-IronPort-AV: E=Sophos;i="6.02,156,1688454000"; 
   d="scan'208";a="443727940"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2023 06:29:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10837"; a="1076591678"
X-IronPort-AV: E=Sophos;i="6.02,156,1688454000"; 
   d="scan'208";a="1076591678"
Received: from kuha.fi.intel.com ([10.237.72.185])
  by fmsmga005.fm.intel.com with SMTP; 18 Sep 2023 06:29:44 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Mon, 18 Sep 2023 16:29:43 +0300
Date: Mon, 18 Sep 2023 16:29:43 +0300
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Abdel Alkuor <alkuor@gmail.com>
Cc: krzysztof.kozlowski+dt@linaro.org, bryan.odonoghue@linaro.org,
	gregkh@linuxfoundation.org, robh+dt@kernel.org,
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
	conor+dt@kernel.org, linux-kernel@vger.kernel.org,
	abdelalkuor@geotab.com
Subject: Re: [PATCH v5 15/15] USB: typec: Do not check VID for tps25750
Message-ID: <ZQhQxzJfJmjbR02B@kuha.fi.intel.com>
References: <20230917152639.21443-1-alkuor@gmail.com>
 <20230917152639.21443-16-alkuor@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230917152639.21443-16-alkuor@gmail.com>
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

Hi,

On Sun, Sep 17, 2023 at 11:26:39AM -0400, Abdel Alkuor wrote:
> From: Abdel Alkuor <abdelalkuor@geotab.com>
> 
> tps25750 doesn't have VID register, check VID for PD controllers
> other than tps25750
> 
> Signed-off-by: Abdel Alkuor <abdelalkuor@geotab.com>
> ---
>  drivers/usb/typec/tipd/core.c | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/usb/typec/tipd/core.c b/drivers/usb/typec/tipd/core.c
> index 326c23bfa8e6..c1399e12a170 100644
> --- a/drivers/usb/typec/tipd/core.c
> +++ b/drivers/usb/typec/tipd/core.c
> @@ -1142,10 +1142,6 @@ static int tps6598x_probe(struct i2c_client *client)
>  	if (IS_ERR(tps->regmap))
>  		return PTR_ERR(tps->regmap);
>  
> -	ret = tps6598x_read32(tps, TPS_REG_VID, &vid);
> -	if (ret < 0 || !vid)
> -		return -ENODEV;
> -
>  	/*
>  	 * Checking can the adapter handle SMBus protocol. If it can not, the
>  	 * driver needs to take care of block reads separately.
> @@ -1176,6 +1172,12 @@ static int tps6598x_probe(struct i2c_client *client)
>  
>  	tps->irq_handler = irq_handler;
>  
> +	if (!tps->is_tps25750) {
> +		ret = tps6598x_read32(tps, TPS_REG_VID, &vid);
> +		if (ret < 0 || !vid)
> +			return -ENODEV;
> +	}

You need to do this at the same time you enable tps25750, so I'm
guessing in patch 4.

You are also changing the execution order just because of that
is_tps25750. Instead you need to make sure you have that flag set as
soon as possible in the first place, so right after "tps" is
allocated:

        mutex_init(&tps->lock);
        tps->dev = &client->dev;
+       tps->is_tps25750 = of_device_is_compatible(np, "ti,tps25750");
 
        tps->regmap = devm_regmap_init_i2c(client, &tps6598x_regmap_config);
        if (IS_ERR(tps->regmap))


thanks,

-- 
heikki

