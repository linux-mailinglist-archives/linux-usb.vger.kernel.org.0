Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5BE4150F2E6
	for <lists+linux-usb@lfdr.de>; Tue, 26 Apr 2022 09:44:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344076AbiDZHrn (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 26 Apr 2022 03:47:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58696 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236504AbiDZHrn (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 26 Apr 2022 03:47:43 -0400
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EC408135396
        for <linux-usb@vger.kernel.org>; Tue, 26 Apr 2022 00:44:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1650959076; x=1682495076;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=pRYvxWXkNfC95dVjysMidfBGkW7O3H/U3Yykqf3PRfo=;
  b=PV+kKwpXwl21ycQC5svo8SdVB0xZapsQNuS6fPla8Hg0m3OqS5VN6ReI
   CF8aXqhZWgLpp0gIuuyCcgJfdukwgtdcUltg7CZBmn414IPE+AHzCrR4Q
   Qfm2l16uQJGT1ri3Pr/rDWj/wRez8E2Bl412/5NjryLRK9WTTVfWloJQx
   3o7MfIjmtB7sdshxqILBBNzpVoadTMNoWClB27LzuhP0cgllWikOzVqkp
   XvAP2S5JD7+91oUX+ZQlACpDjfhcW+Z5Ae8Ht8doQvztGPRYJp56Sk5JZ
   B5ox+qkl4WqPsjeSMsv28038+nji0xsEcapiFb20WBwFLHV2cBE+gsu1K
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10328"; a="263080277"
X-IronPort-AV: E=Sophos;i="5.90,290,1643702400"; 
   d="scan'208";a="263080277"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Apr 2022 00:44:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,290,1643702400"; 
   d="scan'208";a="704937684"
Received: from kuha.fi.intel.com ([10.237.72.185])
  by fmsmga001.fm.intel.com with SMTP; 26 Apr 2022 00:44:34 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Tue, 26 Apr 2022 10:44:33 +0300
Date:   Tue, 26 Apr 2022 10:44:33 +0300
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Linyu Yuan <quic_linyyuan@quicinc.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, Jack Pham <quic_jackp@quicinc.com>
Subject: Re: [PATCH v7 1/2] usb: typec: ucsi: add a common function
 ucsi_unregister_connectors()
Message-ID: <Ymei4biEF845er6h@kuha.fi.intel.com>
References: <1650881886-25530-1-git-send-email-quic_linyyuan@quicinc.com>
 <1650881886-25530-2-git-send-email-quic_linyyuan@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1650881886-25530-2-git-send-email-quic_linyyuan@quicinc.com>
X-Spam-Status: No, score=-7.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Apr 25, 2022 at 06:18:05PM +0800, Linyu Yuan wrote:
> In error path of ucsi_init(), it will unregister all valid ucsi connectors,
> and similar operation also happen in ucsi_unregister(),
> add a common function ucsi_unregister_connectors() for two places,
> inside this function, if con->wq is NULL, it will break the loop,
> if other kind of error happen after con->wq allocated,
> ucsi/typec related API is safe to unregister.
> 
> Also in ucsi_init(), it allocate number of (ucsi->cap.num_connectors + 1)
> connectors, there is one extra as the ending,
> ucsi_unregister_connectors() is safe to unregister all ucsi connectors
> according ucsi->cap.num_connectors,
> remove the extra one connector to save memory.
> 
> Signed-off-by: Linyu Yuan <quic_linyyuan@quicinc.com>

Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> ---
> v2: improve ucsi_connector_clean(), check total number of connector.
> v3: rename to ucsi_unregister_connectors(), suggest by maintainer
> v4: merge patch#1 in V3, fix a typo samiliar -> similar in commit description
> v5: no change
> v6: merge patch#2 in v5 to this one,
>     remove con->port = NULL; and change break condition
>     in ucsi_unregister_connectors().
> v7: break for loop when !con->wq
> 
>  drivers/usb/typec/ucsi/ucsi.c | 53 +++++++++++++++++++++++--------------------
>  1 file changed, 29 insertions(+), 24 deletions(-)
> 
> diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
> index f0c2fa1..a168510 100644
> --- a/drivers/usb/typec/ucsi/ucsi.c
> +++ b/drivers/usb/typec/ucsi/ucsi.c
> @@ -1186,6 +1186,32 @@ static int ucsi_register_port(struct ucsi *ucsi, int index)
>  	return ret;
>  }
>  
> +static void ucsi_unregister_connectors(struct ucsi *ucsi)
> +{
> +	struct ucsi_connector *con;
> +	int i;
> +
> +	if (!ucsi->connector)
> +		return;
> +
> +	for (i = 0; i < ucsi->cap.num_connectors; i++) {
> +		con = &ucsi->connector[i];
> +
> +		if (!con->wq)
> +			break;
> +
> +		cancel_work_sync(&con->work);
> +		ucsi_unregister_partner(con);
> +		ucsi_unregister_altmodes(con, UCSI_RECIPIENT_CON);
> +		ucsi_unregister_port_psy(con);
> +		destroy_workqueue(con->wq);
> +		typec_unregister_port(con->port);
> +	}
> +
> +	kfree(ucsi->connector);
> +	ucsi->connector = NULL;
> +}
> +
>  /**
>   * ucsi_init - Initialize UCSI interface
>   * @ucsi: UCSI to be initialized
> @@ -1194,7 +1220,6 @@ static int ucsi_register_port(struct ucsi *ucsi, int index)
>   */
>  static int ucsi_init(struct ucsi *ucsi)
>  {
> -	struct ucsi_connector *con;
>  	u64 command;
>  	int ret;
>  	int i;
> @@ -1225,7 +1250,7 @@ static int ucsi_init(struct ucsi *ucsi)
>  	}
>  
>  	/* Allocate the connectors. Released in ucsi_unregister() */
> -	ucsi->connector = kcalloc(ucsi->cap.num_connectors + 1,
> +	ucsi->connector = kcalloc(ucsi->cap.num_connectors,
>  				  sizeof(*ucsi->connector), GFP_KERNEL);
>  	if (!ucsi->connector) {
>  		ret = -ENOMEM;
> @@ -1249,15 +1274,7 @@ static int ucsi_init(struct ucsi *ucsi)
>  	return 0;
>  
>  err_unregister:
> -	for (con = ucsi->connector; con->port; con++) {
> -		ucsi_unregister_partner(con);
> -		ucsi_unregister_altmodes(con, UCSI_RECIPIENT_CON);
> -		ucsi_unregister_port_psy(con);
> -		if (con->wq)
> -			destroy_workqueue(con->wq);
> -		typec_unregister_port(con->port);
> -		con->port = NULL;
> -	}
> +	ucsi_unregister_connectors(ucsi);
>  
>  err_reset:
>  	memset(&ucsi->cap, 0, sizeof(ucsi->cap));
> @@ -1363,7 +1380,6 @@ EXPORT_SYMBOL_GPL(ucsi_register);
>  void ucsi_unregister(struct ucsi *ucsi)
>  {
>  	u64 cmd = UCSI_SET_NOTIFICATION_ENABLE;
> -	int i;
>  
>  	/* Make sure that we are not in the middle of driver initialization */
>  	cancel_work_sync(&ucsi->work);
> @@ -1371,18 +1387,7 @@ void ucsi_unregister(struct ucsi *ucsi)
>  	/* Disable notifications */
>  	ucsi->ops->async_write(ucsi, UCSI_CONTROL, &cmd, sizeof(cmd));
>  
> -	for (i = 0; i < ucsi->cap.num_connectors; i++) {
> -		cancel_work_sync(&ucsi->connector[i].work);
> -		ucsi_unregister_partner(&ucsi->connector[i]);
> -		ucsi_unregister_altmodes(&ucsi->connector[i],
> -					 UCSI_RECIPIENT_CON);
> -		ucsi_unregister_port_psy(&ucsi->connector[i]);
> -		if (ucsi->connector[i].wq)
> -			destroy_workqueue(ucsi->connector[i].wq);
> -		typec_unregister_port(ucsi->connector[i].port);
> -	}
> -
> -	kfree(ucsi->connector);
> +	ucsi_unregister_connectors(ucsi);
>  }
>  EXPORT_SYMBOL_GPL(ucsi_unregister);
>  
> -- 
> 2.7.4

-- 
heikki
