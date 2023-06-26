Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0F9C273DE70
	for <lists+linux-usb@lfdr.de>; Mon, 26 Jun 2023 14:06:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229501AbjFZMGN (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 26 Jun 2023 08:06:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45974 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229472AbjFZMGL (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 26 Jun 2023 08:06:11 -0400
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A34D6E43
        for <linux-usb@vger.kernel.org>; Mon, 26 Jun 2023 05:06:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687781167; x=1719317167;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=clVeNSfSbEHgmi9IiYaapXCJAsRF3dX7EkVNHGCjrlc=;
  b=jbLt4F2nr8cUPaSZqd+UU2XFUmYwMPLOLM28ftY5Q2vH4JmVsNxUSwCZ
   +h9ksLNIzz168F6H+WSgaFMFFAKQIscIFWHPP3QsCQl/nEiUmmMtk3c+K
   ZVPUhHmlnappZQH14olHfRT26IcibU2kluIP6jK9NFBM55uqPYbVa+uUT
   LKAs99brmgOVEJq1kQVXmpEjBpaTFS8fdHA/cSSNCcGa3JvMTu2HKN/ua
   TXpT4OaDITAIJx6Bfjajq/JqpPXDC1It6U5l+hodDBSrdYMXZHMmnL3/b
   dFlgrz067nyX3EXb8fkKDiZ6i4Y+3zZH3PNFnbdC/RYe5DY5dorbdyJlX
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10752"; a="341588405"
X-IronPort-AV: E=Sophos;i="6.01,159,1684825200"; 
   d="scan'208";a="341588405"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2023 05:06:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10752"; a="860677327"
X-IronPort-AV: E=Sophos;i="6.01,159,1684825200"; 
   d="scan'208";a="860677327"
Received: from kuha.fi.intel.com ([10.237.72.185])
  by fmsmga001.fm.intel.com with SMTP; 26 Jun 2023 05:06:04 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Mon, 26 Jun 2023 15:06:03 +0300
Date:   Mon, 26 Jun 2023 15:06:03 +0300
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        linux-usb@vger.kernel.org, kernel@pengutronix.de
Subject: Re: [PATCH] usb: typec: nb7vpq904m: Switch back to use struct
 i2c_driver::probe
Message-ID: <ZJl/K/Y2E+r38BrS@kuha.fi.intel.com>
References: <20230626091314.557122-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230626091314.557122-1-u.kleine-koenig@pengutronix.de>
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Jun 26, 2023 at 11:13:14AM +0200, Uwe Kleine-König wrote:
> struct i2c_driver::probe_new is about to go away. Switch the driver to
> use the probe callback with the same prototype.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>

Acked-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> ---
>  drivers/usb/typec/mux/nb7vpq904m.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/typec/mux/nb7vpq904m.c b/drivers/usb/typec/mux/nb7vpq904m.c
> index 80e580d50129..9360b65e8b06 100644
> --- a/drivers/usb/typec/mux/nb7vpq904m.c
> +++ b/drivers/usb/typec/mux/nb7vpq904m.c
> @@ -517,7 +517,7 @@ static struct i2c_driver nb7vpq904m_driver = {
>  		.name = "nb7vpq904m",
>  		.of_match_table = nb7vpq904m_of_table,
>  	},
> -	.probe_new	= nb7vpq904m_probe,
> +	.probe		= nb7vpq904m_probe,
>  	.remove		= nb7vpq904m_remove,
>  	.id_table	= nb7vpq904m_table,
>  };
> 
> base-commit: 88d8f3ac9c67e2d00db671dbb0af50efb7c358cb
> -- 
> 2.39.2

-- 
heikki
