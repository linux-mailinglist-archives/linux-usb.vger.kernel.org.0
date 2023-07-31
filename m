Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4CA447697AB
	for <lists+linux-usb@lfdr.de>; Mon, 31 Jul 2023 15:33:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230168AbjGaNdS (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 31 Jul 2023 09:33:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36222 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229555AbjGaNdR (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 31 Jul 2023 09:33:17 -0400
Received: from mgamail.intel.com (unknown [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C09611708
        for <linux-usb@vger.kernel.org>; Mon, 31 Jul 2023 06:33:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690810396; x=1722346396;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=rJC5YBwmWBMsrLwxZxay1xeOr3SdZg+IRBLZGu1yrko=;
  b=WE2LKxyHa0uPtnWK0/hiSwK5AJVER9dEhSPjD7av8k5t3M+tjTn3v9EC
   JtUmZ0S8bTsZumcwQib7dEzyNE5u+GB2bGfLBO9UiVcqhssjKiaQh/KOt
   RbuWTotKySj3aWCb/61qo0ARqjemVu6GsYyD9+CKanMe4FCXldzm8zp4B
   wzAItmGCu+fAoog4qzX2qXgDPC2qrc/WNXFGfzDiXDcgl5c7e0ktPmvl6
   ilGqDjsm2/g2a8F7R+QZf9qFDBWLQ4ZvLJU3QkKtkYwyGydXkM3z2C5+b
   QWH1XSVr8CS1yDtZj9s3ykA7GN5wl/3hJH0ji6TzwJeF3BVrhmcKWIJmd
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10788"; a="371728291"
X-IronPort-AV: E=Sophos;i="6.01,244,1684825200"; 
   d="scan'208";a="371728291"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jul 2023 06:33:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.01,202,1684825200"; 
   d="scan'208";a="871674420"
Received: from kuha.fi.intel.com ([10.237.72.185])
  by fmsmga001.fm.intel.com with SMTP; 31 Jul 2023 06:33:15 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Mon, 31 Jul 2023 16:33:12 +0300
Date:   Mon, 31 Jul 2023 16:33:12 +0300
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Xu Yang <xu.yang_2@nxp.com>
Cc:     linux@roeck-us.net, gregkh@linuxfoundation.org, linux-imx@nxp.com,
        linux-usb@vger.kernel.org, jun.li@nxp.com
Subject: Re: [PATCH] usb: typec: tcpm: not sink vbus if operational current
 is 0mA
Message-ID: <ZMe4GOfAT3a1YueY@kuha.fi.intel.com>
References: <20230630105656.2828595-1-xu.yang_2@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230630105656.2828595-1-xu.yang_2@nxp.com>
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

I'm sorry to keep you waiting.

On Fri, Jun 30, 2023 at 06:56:56PM +0800, Xu Yang wrote:
> PD3.0 Spec 6.4.1.3.1 said:
> For a Sink requiring no power from the Source, the Voltage (B19…10)
> Shall be set to 5V and the Operational Current Shall be set to 0mA.
> 
> Therefore, we can keep sink path closed if the operational current of
> the first fixed PDO is 0mA.
> 
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> ---
>  drivers/usb/typec/tcpm/tcpm.c | 12 ++++++++++--
>  1 file changed, 10 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
> index 829d75ebab42..4f7e4c50e847 100644
> --- a/drivers/usb/typec/tcpm/tcpm.c
> +++ b/drivers/usb/typec/tcpm/tcpm.c
> @@ -4301,7 +4301,12 @@ static void run_state_machine(struct tcpm_port *port)
>  			if (port->slow_charger_loop && (current_lim > PD_P_SNK_STDBY_MW / 5))
>  				current_lim = PD_P_SNK_STDBY_MW / 5;
>  			tcpm_set_current_limit(port, current_lim, 5000);
> -			tcpm_set_charge(port, true);
> +
> +			if (pdo_max_current(port->snk_pdo[0]))
> +				tcpm_set_charge(port, true);
> +			else
> +				tcpm_log(port, "Not require power from Source");
> +
>  			if (!port->pd_supported)
>  				tcpm_set_state(port, SNK_READY, 0);
>  			else
> @@ -4582,7 +4587,10 @@ static void run_state_machine(struct tcpm_port *port)
>  			tcpm_set_current_limit(port,
>  					       tcpm_get_current_limit(port),
>  					       5000);
> -			tcpm_set_charge(port, true);
> +			if (pdo_max_current(port->snk_pdo[0]))
> +				tcpm_set_charge(port, true);
> +			else
> +				tcpm_log(port, "Not require power from Source");

Shouldn't you still always call tcpm_set_charge()?

        tcpm_set_charge(port, pdo_max_current(port->snk_pdo[0]));

I think we need to wait for comments from Guenter. I don't know this
driver well enough.

thanks,

-- 
heikki
