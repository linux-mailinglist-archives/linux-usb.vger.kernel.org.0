Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CB71C6CD7DA
	for <lists+linux-usb@lfdr.de>; Wed, 29 Mar 2023 12:44:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230231AbjC2KoY (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 29 Mar 2023 06:44:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50210 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229674AbjC2KoX (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 29 Mar 2023 06:44:23 -0400
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A9F0C1FDA
        for <linux-usb@vger.kernel.org>; Wed, 29 Mar 2023 03:44:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680086662; x=1711622662;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=kgCBBFq0MFjQlH47D/BTfZbQN5oNFUge9t1Gt2nGmTE=;
  b=JI/wn0KBflgnYmjHb48b30U+AK9iMeiIMPHbSzodVJJGnOmhhFPPrggp
   lhe+qJ+T7w+iBTErEMstFjzgpLsNYWnSVQhPjojFNSLA6c+LoyM/JZGCT
   EXV4iEwIGyvw6N+6D7L11ScGmExaBA61kIMojd+r1vP9YvikMykyNSRfF
   Po4sBNw3e65nHF+dKZ3vl57T1LNZ8zzGacJkC0MwNpfa79OrKF3FEJJlu
   LZxZ2zIT+xlCRLLazKQi1EDreu87tjndJkQIAll35CAulzLs9ohLLdngY
   C2xQ46wl4VGCGn0015l0xByP6Se47p+RI2tx+ZyY6MQI1+eU08FaDKlCb
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10663"; a="427117256"
X-IronPort-AV: E=Sophos;i="5.98,300,1673942400"; 
   d="scan'208";a="427117256"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Mar 2023 03:44:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10663"; a="827845521"
X-IronPort-AV: E=Sophos;i="5.98,300,1673942400"; 
   d="scan'208";a="827845521"
Received: from kuha.fi.intel.com ([10.237.72.185])
  by fmsmga001.fm.intel.com with SMTP; 29 Mar 2023 03:44:20 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Wed, 29 Mar 2023 13:44:19 +0300
Date:   Wed, 29 Mar 2023 13:44:19 +0300
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Li Jun <jun.li@nxp.com>
Cc:     linux@roeck-us.net, gregkh@linuxfoundation.org,
        linux-usb@vger.kernel.org, xu.yang_2@nxp.com
Subject: Re: [PATCH] usb: typec: tcpm: try to get role switch from tcpc fwnode
Message-ID: <ZCQWgwSDVGhM/x6g@kuha.fi.intel.com>
References: <1679991784-25500-1-git-send-email-jun.li@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1679991784-25500-1-git-send-email-jun.li@nxp.com>
X-Spam-Status: No, score=-2.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Mar 28, 2023 at 04:23:04PM +0800, Li Jun wrote:
> Try to get usb role switch from tcpc fwnode if failed to
> get role switch from port dev, this is for case the port
> for role switch endpoint is located in connector node,
> as per connector binding doc, port@0 for HS is required.
> 
> ptn5110: tcpc@50 {
> 	compatible = "nxp,ptn5110";
> 	...
> 	status = "okay";
> 
> 	connector {
> 		compatible = "usb-c-connector";
> 		label = "USB-C";
> 		...
> 
> 		ports {
> 			#address-cells = <1>;
> 			#size-cells = <0>;
> 
> 			port@0 {
> 				reg = <0>;
> 
> 				typec_conn: endpoint {
> 					remote-endpoint = <&usb2_controller>;
> 				};
> 			};
> 		};
> 	};
> };
> 
> Signed-off-by: Li Jun <jun.li@nxp.com>

Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> ---
>  drivers/usb/typec/tcpm/tcpm.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
> index a0d943d78580..f0534bdb4462 100644
> --- a/drivers/usb/typec/tcpm/tcpm.c
> +++ b/drivers/usb/typec/tcpm/tcpm.c
> @@ -6557,6 +6557,8 @@ struct tcpm_port *tcpm_register_port(struct device *dev, struct tcpc_dev *tcpc)
>  	port->port_type = port->typec_caps.type;
>  
>  	port->role_sw = usb_role_switch_get(port->dev);
> +	if (!port->role_sw)
> +		port->role_sw = fwnode_usb_role_switch_get(tcpc->fwnode);
>  	if (IS_ERR(port->role_sw)) {
>  		err = PTR_ERR(port->role_sw);
>  		goto out_destroy_wq;
> -- 
> 2.34.1

-- 
heikki
