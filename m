Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3A84D76CB59
	for <lists+linux-usb@lfdr.de>; Wed,  2 Aug 2023 12:57:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232712AbjHBK5v (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 2 Aug 2023 06:57:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38042 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232531AbjHBK5s (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 2 Aug 2023 06:57:48 -0400
Received: from mgamail.intel.com (unknown [192.55.52.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A9B151BC5
        for <linux-usb@vger.kernel.org>; Wed,  2 Aug 2023 03:57:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690973850; x=1722509850;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=gtcfbp+Uafttrwbr7jJnxwVOZ5n4dUW3BegPf2sbmRg=;
  b=anrmx++A2+wrd4Bv1Oyt05ow+WaoEqpNDOYt9W93pK3gN/VElRPB2Rw7
   Ob/paIKXmsMTanwhTJeqzkizQyV9kyo1AbVtkWXJXD6U2LmF6y4jlFPJo
   Ialxh2gnaMk1aqe/0YL9pWRHU7N4yhi2EGpWCO4AkWLBvpJutXjb9iQ/Y
   LcdePZgU3JPAI6/HVOpoq41q12TC8PmjNVjYxXcT3A4FLxOnVauMMdwwX
   SWwVP3uk0ew4y2+YC6q8sv9wMlcdSY+lnVxDi6ZiASPQ4UQ4YcXdhxrzt
   H3H7mQZOrcmjnUA9wfcxi4vI4kOQBtysKDVaN/vRzCM7LBuLEhJ/5TyZY
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10789"; a="455916366"
X-IronPort-AV: E=Sophos;i="6.01,249,1684825200"; 
   d="scan'208";a="455916366"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Aug 2023 03:57:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.01,202,1684825200"; 
   d="scan'208";a="872436814"
Received: from kuha.fi.intel.com ([10.237.72.185])
  by fmsmga001.fm.intel.com with SMTP; 02 Aug 2023 03:57:30 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Wed, 02 Aug 2023 13:57:27 +0300
Date:   Wed, 2 Aug 2023 13:57:27 +0300
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Xu Yang <xu.yang_2@nxp.com>
Cc:     linux@roeck-us.net, gregkh@linuxfoundation.org,
        linux-usb@vger.kernel.org, linux-imx@nxp.com, jun.li@nxp.com
Subject: Re: [PATCH v2] usb: typec: tcpm: not sink vbus if operational
 current is 0mA
Message-ID: <ZMo2l5sdPXLnvISM@kuha.fi.intel.com>
References: <20230801070110.1653394-1-xu.yang_2@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230801070110.1653394-1-xu.yang_2@nxp.com>
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Aug 01, 2023 at 03:01:10PM +0800, Xu Yang wrote:
> PD3.0 Spec 6.4.1.3.1 said:
> For a Sink requiring no power from the Source, the Voltage (B19-10)
> shall be set to 5V and the Operational Current Shall be set to 0mA.
> 
> Therefore, we can keep sink path closed if the operational current of
> the first fixed PDO is 0mA.
> 
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

Acked-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> ---
> Changes in v2:
>   - also call tcpm_set_charge() when charge is false as suggested from
>     Heikki and Guenter.
> ---
>  drivers/usb/typec/tcpm/tcpm.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
> index 829d75ebab42..d999e6984fea 100644
> --- a/drivers/usb/typec/tcpm/tcpm.c
> +++ b/drivers/usb/typec/tcpm/tcpm.c
> @@ -4301,7 +4301,9 @@ static void run_state_machine(struct tcpm_port *port)
>  			if (port->slow_charger_loop && (current_lim > PD_P_SNK_STDBY_MW / 5))
>  				current_lim = PD_P_SNK_STDBY_MW / 5;
>  			tcpm_set_current_limit(port, current_lim, 5000);
> -			tcpm_set_charge(port, true);
> +			/* Not sink vbus if operational current is 0mA */
> +			tcpm_set_charge(port, !!pdo_max_current(port->snk_pdo[0]));
> +
>  			if (!port->pd_supported)
>  				tcpm_set_state(port, SNK_READY, 0);
>  			else
> @@ -4582,7 +4584,8 @@ static void run_state_machine(struct tcpm_port *port)
>  			tcpm_set_current_limit(port,
>  					       tcpm_get_current_limit(port),
>  					       5000);
> -			tcpm_set_charge(port, true);
> +			/* Not sink vbus if operational current is 0mA */
> +			tcpm_set_charge(port, !!pdo_max_current(port->snk_pdo[0]));
>  		}
>  		if (port->ams == HARD_RESET)
>  			tcpm_ams_finish(port);
> -- 
> 2.34.1

-- 
heikki
