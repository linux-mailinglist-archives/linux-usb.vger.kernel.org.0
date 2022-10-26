Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 193A160DBBA
	for <lists+linux-usb@lfdr.de>; Wed, 26 Oct 2022 09:03:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233083AbiJZHDS (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 26 Oct 2022 03:03:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35392 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232884AbiJZHDI (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 26 Oct 2022 03:03:08 -0400
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 750DB3868D
        for <linux-usb@vger.kernel.org>; Wed, 26 Oct 2022 00:03:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1666767787; x=1698303787;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=EzpykmBLTNdEtwt9sJohY7YcmJNUmktVzAIyilVMXOM=;
  b=HV1iPuh9IeD7vCsXnK0rckQ2itQt3fY5SAZ/NGzPn7FQzy9InZMBsmpq
   Bg3u8k2hquTTbt90aKbke/IW3ASrOV8KVeHspl6H3qumx/GTX9838bI6h
   QtJA5GMSE6J38FOtBX3QLrBj2yRNnZwSD5YRkl5blQQ/G/fJ02ftOWF7u
   A1r5K+OvRaiTlQEwpuTAhIj5d68EJr4aN8jcPEMRxLiXkfDiZHGbbU+CC
   j97+xN1G0kbjRROjA82puvSeDBLBe9sgIrYrIpfrKlScq2DfgTD+43VGQ
   SnXxcJKPMpZ6SP5lPJXA4QKKX1URuUrfJQ5rfUVU3auucg3e3S0pjnw+G
   w==;
X-IronPort-AV: E=Sophos;i="5.95,213,1661842800"; 
   d="scan'208";a="180554014"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 26 Oct 2022 00:03:06 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Wed, 26 Oct 2022 00:03:05 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.12 via Frontend
 Transport; Wed, 26 Oct 2022 00:03:04 -0700
Date:   Wed, 26 Oct 2022 08:02:49 +0100
From:   Conor Dooley <conor.dooley@microchip.com>
To:     Xu Yang <xu.yang_2@nxp.com>
CC:     <gregkh@linuxfoundation.org>, <peter.chen@kernel.org>,
        <jun.li@nxp.com>, <linux-usb@vger.kernel.org>, <linux-imx@nxp.com>
Subject: Re: [PATCH] usb: chipidea: core: wrap ci_handle_power_lost() with
 CONFIG_PM_SLEEP
Message-ID: <Y1jbmacR2zyeQJGw@wendy>
References: <20221026121157.1491302-1-xu.yang_2@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20221026121157.1491302-1-xu.yang_2@nxp.com>
X-Spam-Status: No, score=-4.9 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Oct 26, 2022 at 08:11:57PM +0800, Xu Yang wrote:
> If CONFIG_PM_SLEEP is not set, the following error will be shown up
> when build kernel:
>     error: 'ci_handle_power_lost' defined but not used.
> 
> This will move ci_handle_power_lost() to an area wrapped by
> CONFIG_PM_SLEEP.
> 
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> Fixes: 74494b33211d ("usb: chipidea: core: add controller resume support when controller is powered off")

Reported-by: Conor Dooley <conor.dooley@microchip.com>
Tested-by: Conor Dooley <conor.dooley@microchip.com>

Thanks for the quick fix. BTW, your mails show up timestamped in the
future, maybe something's up with the TZ on your machine.

Thanks,
Conor.

> ---
>  drivers/usb/chipidea/core.c | 38 ++++++++++++++++++-------------------
>  1 file changed, 19 insertions(+), 19 deletions(-)
> 
> diff --git a/drivers/usb/chipidea/core.c b/drivers/usb/chipidea/core.c
> index 2b170b434d01..484b1cd23431 100644
> --- a/drivers/usb/chipidea/core.c
> +++ b/drivers/usb/chipidea/core.c
> @@ -661,25 +661,6 @@ static enum ci_role ci_get_role(struct ci_hdrc *ci)
>  	return role;
>  }
>  
> -static void ci_handle_power_lost(struct ci_hdrc *ci)
> -{
> -	enum ci_role role;
> -
> -	disable_irq_nosync(ci->irq);
> -	if (!ci_otg_is_fsm_mode(ci)) {
> -		role = ci_get_role(ci);
> -
> -		if (ci->role != role) {
> -			ci_handle_id_switch(ci);
> -		} else if (role == CI_ROLE_GADGET) {
> -			if (ci->is_otg && hw_read_otgsc(ci, OTGSC_BSV))
> -				usb_gadget_vbus_connect(&ci->gadget);
> -		}
> -	}
> -
> -	enable_irq(ci->irq);
> -}
> -
>  static struct usb_role_switch_desc ci_role_switch = {
>  	.set = ci_usb_role_switch_set,
>  	.get = ci_usb_role_switch_get,
> @@ -1400,6 +1381,25 @@ static int ci_suspend(struct device *dev)
>  	return 0;
>  }
>  
> +static void ci_handle_power_lost(struct ci_hdrc *ci)
> +{
> +	enum ci_role role;
> +
> +	disable_irq_nosync(ci->irq);
> +	if (!ci_otg_is_fsm_mode(ci)) {
> +		role = ci_get_role(ci);
> +
> +		if (ci->role != role) {
> +			ci_handle_id_switch(ci);
> +		} else if (role == CI_ROLE_GADGET) {
> +			if (ci->is_otg && hw_read_otgsc(ci, OTGSC_BSV))
> +				usb_gadget_vbus_connect(&ci->gadget);
> +		}
> +	}
> +
> +	enable_irq(ci->irq);
> +}
> +
>  static int ci_resume(struct device *dev)
>  {
>  	struct ci_hdrc *ci = dev_get_drvdata(dev);
> -- 
> 2.34.1
> 
> 
