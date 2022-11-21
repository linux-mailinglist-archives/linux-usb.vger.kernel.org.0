Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D7E5E631C31
	for <lists+linux-usb@lfdr.de>; Mon, 21 Nov 2022 09:59:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229913AbiKUI7I (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 21 Nov 2022 03:59:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50078 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229911AbiKUI7H (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 21 Nov 2022 03:59:07 -0500
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D32E812639
        for <linux-usb@vger.kernel.org>; Mon, 21 Nov 2022 00:59:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1669021146; x=1700557146;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=qyrc9rr876wbUmH3YJQMeUu3d3dx/rJN/x0s6tZw1Mg=;
  b=TGYLIu10RUbY4hitkvJbhvBll/o2qQhb3ipvnVV3IAKw5+z1kI3k2/mG
   PkZPYbq/6ZZ7nadOx7QOJZbKj2RXkeA5Xn96V94upRxzZErvnDCuF+MJ+
   WE88ujkQt7hsJ7FscTWCPve4LpraikgH3IfiESE6BXkRf+/vIn3RJXUuI
   vWR4Uu3Erh84qUR+PtWm9HWWOAf7UhUiFYJUs2v0iymGSY6PMQPzlIrVe
   oJBNEqjCKGp7ozXmkTSRSu/SxzeuwoPlE/9mU852OaJvW6pGqQva/cW0N
   GJ9/3/C4FWxo8dzf4R8poXnT7uQA5LuGfUUd/9x6+eFJHl/Bw3fFil6LC
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10537"; a="293899370"
X-IronPort-AV: E=Sophos;i="5.96,180,1665471600"; 
   d="scan'208";a="293899370"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2022 00:59:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10537"; a="783372146"
X-IronPort-AV: E=Sophos;i="5.96,180,1665471600"; 
   d="scan'208";a="783372146"
Received: from kuha.fi.intel.com ([10.237.72.185])
  by fmsmga001.fm.intel.com with SMTP; 21 Nov 2022 00:59:04 -0800
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Mon, 21 Nov 2022 10:59:03 +0200
Date:   Mon, 21 Nov 2022 10:59:03 +0200
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Yang Yingliang <yangyingliang@huawei.com>
Cc:     linux-usb@vger.kernel.org, linux@roeck-us.net, jun.li@nxp.com,
        gregkh@linuxfoundation.org
Subject: Re: [PATCH v3] usb: typec: tcpci: fix of node refcount leak in
 tcpci_register_port()
Message-ID: <Y3s917SEWZVNeye+@kuha.fi.intel.com>
References: <20221121062416.1026192-1-yangyingliang@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221121062416.1026192-1-yangyingliang@huawei.com>
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Nov 21, 2022 at 02:24:16PM +0800, Yang Yingliang wrote:
> I got the following report while doing device(mt6370-tcpc) load
> test with CONFIG_OF_UNITTEST and CONFIG_OF_DYNAMIC enabled:
> 
>   OF: ERROR: memory leak, expected refcount 1 instead of 2,
>   of_node_get()/of_node_put() unbalanced - destroy cset entry:
>   attach overlay node /i2c/pmic@34/tcpc/connector
> 
> The 'fwnode' set in tcpci_parse_config() which is called
> in tcpci_register_port(), its node refcount is increased
> in device_get_named_child_node(). It needs be put while
> exiting, so call fwnode_handle_put() in the error path of
> tcpci_register_port() and in tcpci_unregister_port() to
> avoid leak.
> 
> Fixes: 5e85a04c8c0d ("usb: typec: add fwnode to tcpc")
> Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>

Acked-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> ---
> v2 -> v3:
>   Move fwnode_handle_put() into tcpci_unregister_port().
> 
> v1 -> v2:
>   Add description to how is the report generated and
>   the review tag from Guenter.
> ---
>  drivers/usb/typec/tcpm/tcpci.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/typec/tcpm/tcpci.c b/drivers/usb/typec/tcpm/tcpci.c
> index b2bfcebe218f..72f8d1e87600 100644
> --- a/drivers/usb/typec/tcpm/tcpci.c
> +++ b/drivers/usb/typec/tcpm/tcpci.c
> @@ -794,8 +794,10 @@ struct tcpci *tcpci_register_port(struct device *dev, struct tcpci_data *data)
>  		return ERR_PTR(err);
>  
>  	tcpci->port = tcpm_register_port(tcpci->dev, &tcpci->tcpc);
> -	if (IS_ERR(tcpci->port))
> +	if (IS_ERR(tcpci->port)) {
> +		fwnode_handle_put(tcpci->tcpc.fwnode);
>  		return ERR_CAST(tcpci->port);
> +	}
>  
>  	return tcpci;
>  }
> @@ -804,6 +806,7 @@ EXPORT_SYMBOL_GPL(tcpci_register_port);
>  void tcpci_unregister_port(struct tcpci *tcpci)
>  {
>  	tcpm_unregister_port(tcpci->port);
> +	fwnode_handle_put(tcpci->tcpc.fwnode);
>  }
>  EXPORT_SYMBOL_GPL(tcpci_unregister_port);
>  

thanks,

-- 
heikki
