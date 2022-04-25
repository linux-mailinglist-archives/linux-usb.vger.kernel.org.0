Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F0D6D50DAE0
	for <lists+linux-usb@lfdr.de>; Mon, 25 Apr 2022 10:10:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232133AbiDYINV (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 25 Apr 2022 04:13:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51922 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235553AbiDYIMr (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 25 Apr 2022 04:12:47 -0400
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 79EA918E08
        for <linux-usb@vger.kernel.org>; Mon, 25 Apr 2022 01:09:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1650874184; x=1682410184;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=RO4blfivGMaQnE/1LKJoiOc8KbJQVTezXHB5aGBOe0Q=;
  b=YHFUJHkS11p9tdxvi+wlDKNypovMEIOaFrgnL/PRl6LKTrONwzN0H0Sg
   +k7JjOPEnbJMN/0oEBG5c8HQJQCWyqeOaZleK4HlRfVHN/DMB5kVlbTOM
   NlaYILUKCCUsIhBvmPqVro6yCVKKfdBlVLi35tEOGHjc+Gy9qnqOeMPQE
   lO5t3jSE/HT8UJoGY3XLMku387sqUcUWSKKegUF2xt/ibPAfozaxUjdtn
   iSwVg/kzSTNcAgKML3QXZrhfFYtKkV/aNEnNjUPzTVaixI1tDzroRaVOu
   3SVgSUhiBxn/XNIw/I/rA0isUu2a/gElaZC8PDfVQv67LMC69PsPm0Vhs
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10327"; a="265344055"
X-IronPort-AV: E=Sophos;i="5.90,287,1643702400"; 
   d="scan'208";a="265344055"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2022 01:09:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,287,1643702400"; 
   d="scan'208";a="704457501"
Received: from kuha.fi.intel.com ([10.237.72.185])
  by fmsmga001.fm.intel.com with SMTP; 25 Apr 2022 01:09:41 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Mon, 25 Apr 2022 11:09:41 +0300
Date:   Mon, 25 Apr 2022 11:09:41 +0300
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Linyu Yuan <quic_linyyuan@quicinc.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, Jack Pham <quic_jackp@quicinc.com>
Subject: Re: [PATCH v5 1/3] usb: typec: ucsi: add a common function
 ucsi_unregister_connectors()
Message-ID: <YmZXRQYPQe6KQf0m@kuha.fi.intel.com>
References: <1650597022-19793-1-git-send-email-quic_linyyuan@quicinc.com>
 <1650597022-19793-2-git-send-email-quic_linyyuan@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1650597022-19793-2-git-send-email-quic_linyyuan@quicinc.com>
X-Spam-Status: No, score=-7.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Apr 22, 2022 at 11:10:20AM +0800, Linyu Yuan wrote:
> As con->port will be used in error path of ucsi_init(),
> it should be NULL or valid.
> 
> In error path of ucsi_init(), it will unregister all valid ucsi connectors,
> and similar operation also happen in ucsi_unregister(),
> add a common function for two places.
> 
> Signed-off-by: Linyu Yuan <quic_linyyuan@quicinc.com>
> ---
> v2: improve ucsi_connector_clean(), check total number of connector.
> v3: rename to ucsi_unregister_connectors(), suggest by maintainer
> v4: merge patch#1 in V3, fix a typo samiliar -> similar in commit description
> v5: no change
> 
>  drivers/usb/typec/ucsi/ucsi.c | 52 ++++++++++++++++++++++++-------------------
>  1 file changed, 29 insertions(+), 23 deletions(-)
> 
> diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
> index f0c2fa1..af9a2a1 100644
> --- a/drivers/usb/typec/ucsi/ucsi.c
> +++ b/drivers/usb/typec/ucsi/ucsi.c
> @@ -1100,6 +1100,7 @@ static int ucsi_register_port(struct ucsi *ucsi, int index)
>  	con->port = typec_register_port(ucsi->dev, cap);
>  	if (IS_ERR(con->port)) {
>  		ret = PTR_ERR(con->port);
> +		con->port = NULL;

I'm not sure you need to add that line. See below.

>  		goto out;
>  	}
>  
> @@ -1186,6 +1187,32 @@ static int ucsi_register_port(struct ucsi *ucsi, int index)
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
> +		if (!con->port)
> +			break;

                if (IS_ERR_OR_NULL(con->port))
                        break;

> +		cancel_work_sync(&con->work);
> +		ucsi_unregister_partner(con);
> +		ucsi_unregister_altmodes(con, UCSI_RECIPIENT_CON);
> +		ucsi_unregister_port_psy(con);
> +		if (con->wq)
> +			destroy_workqueue(con->wq);
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
> @@ -1194,7 +1221,6 @@ static int ucsi_register_port(struct ucsi *ucsi, int index)
>   */
>  static int ucsi_init(struct ucsi *ucsi)
>  {
> -	struct ucsi_connector *con;
>  	u64 command;
>  	int ret;
>  	int i;
> @@ -1249,15 +1275,7 @@ static int ucsi_init(struct ucsi *ucsi)
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
> @@ -1363,7 +1381,6 @@ EXPORT_SYMBOL_GPL(ucsi_register);
>  void ucsi_unregister(struct ucsi *ucsi)
>  {
>  	u64 cmd = UCSI_SET_NOTIFICATION_ENABLE;
> -	int i;
>  
>  	/* Make sure that we are not in the middle of driver initialization */
>  	cancel_work_sync(&ucsi->work);
> @@ -1371,18 +1388,7 @@ void ucsi_unregister(struct ucsi *ucsi)
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

thanks,

-- 
heikki
