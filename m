Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DA6AE6CC1C7
	for <lists+linux-usb@lfdr.de>; Tue, 28 Mar 2023 16:13:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232591AbjC1ONq (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 28 Mar 2023 10:13:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55026 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232134AbjC1ONp (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 28 Mar 2023 10:13:45 -0400
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7B91DCDD5
        for <linux-usb@vger.kernel.org>; Tue, 28 Mar 2023 07:12:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680012766; x=1711548766;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=yARIkuXNDoOeefFLW7JGbG3dy0cac3GGA+v4i0aZmvg=;
  b=UdLTB+dbSRBrKXXteoLiyJhQDYLFnqvHrrxYOIUjFnxLDM5pqiUCbrTM
   PY2cnKi2lYI3/cdZOWPlHGtHJmjwAVED5rHlCF59F8ohuHS1q5oehpWWE
   ZrLIwwAlLAsULXJ031peTFOwvRGGV2Qc/HFHb4dKJrcgufMinLRJLcOpi
   Q1XnCyoob5L8bWF6JdMBMtZ/6uETISLYzcn7hBwCbfZ/MON3Jrpo9z3BM
   l/k4VY0jD7Uta8U/ceJ48uM71EETAILPpfvqMIL/HUfPSGbsKhzeVF1dS
   EkkEQJIsjgmX8auDX5LhXeVs8HMxnCdh6cKNnJKz9RzuwLM5wZVWwKivX
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10662"; a="342162277"
X-IronPort-AV: E=Sophos;i="5.98,297,1673942400"; 
   d="scan'208";a="342162277"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Mar 2023 07:11:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10662"; a="827491282"
X-IronPort-AV: E=Sophos;i="5.98,297,1673942400"; 
   d="scan'208";a="827491282"
Received: from kuha.fi.intel.com ([10.237.72.185])
  by fmsmga001.fm.intel.com with SMTP; 28 Mar 2023 07:11:50 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Tue, 28 Mar 2023 17:11:49 +0300
Date:   Tue, 28 Mar 2023 17:11:49 +0300
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Li Jun <jun.li@nxp.com>
Cc:     linux@roeck-us.net, gregkh@linuxfoundation.org,
        linux-usb@vger.kernel.org, xu.yang_2@nxp.com,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: Re: [PATCH] usb: typec: tcpm: try to get role switch from tcpc fwnode
Message-ID: <ZCL1pULmTtMOpaKB@kuha.fi.intel.com>
References: <1679991784-25500-1-git-send-email-jun.li@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1679991784-25500-1-git-send-email-jun.li@nxp.com>
X-Spam-Status: No, score=-2.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,RCVD_IN_MSPIKE_H3,
        RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

+Bryan

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

This looks like exactly the same as the RFC from Bryan that I just
commented. I have not objections if this looks okay to you Brian. I
think we should still wait for comments also from Guenter.

thanks,

-- 
heikki
