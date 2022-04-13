Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 651594FF669
	for <lists+linux-usb@lfdr.de>; Wed, 13 Apr 2022 14:09:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235442AbiDMMLU (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 13 Apr 2022 08:11:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55290 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235422AbiDMMLT (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 13 Apr 2022 08:11:19 -0400
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9D3A15D1B8
        for <linux-usb@vger.kernel.org>; Wed, 13 Apr 2022 05:08:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1649851736; x=1681387736;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=LTNCzDZKbtndFAmRAh6gWs6lgPmEjLZnYzpr6t7R/jI=;
  b=NqEfc23GbQ1Z1GPhiX+Y5FZKgFe6WNN2ZLheS01IeiMdmCRSE5P+PH3D
   iwyUuSkhB9/J/WU2swxL/FBtBMljw2Ypg3TAGguSSm89Lq660I8tgJKW8
   ir38zaCWFUi9PQuxHajIoZbJR91CdPgzzo5lrMt9pBv/mMbGXZ1W0mVWl
   tH3835zs36sqGW0k2aeAELcdyRcq+cE4F55jvQ7Atyq451giZtmxvfZHH
   7wkDWtCoiZ4WdkfSbWwLM3E7M3Vo235NRSEQYCQgitQ+iPZfiWv1G2vsJ
   OgNEr5jC6G7LjGLcQ6ibUb0bzPLPcLxvqQKE5IjGH131N/el3Y/EQ2mLE
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10315"; a="249935308"
X-IronPort-AV: E=Sophos;i="5.90,256,1643702400"; 
   d="scan'208";a="249935308"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Apr 2022 05:08:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,256,1643702400"; 
   d="scan'208";a="700222200"
Received: from kuha.fi.intel.com ([10.237.72.185])
  by fmsmga001.fm.intel.com with SMTP; 13 Apr 2022 05:08:53 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Wed, 13 Apr 2022 15:08:52 +0300
Date:   Wed, 13 Apr 2022 15:08:52 +0300
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Linyu Yuan <quic_linyyuan@quicinc.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, Jack Pham <quic_jackp@quicinc.com>
Subject: Re: [PATCH v3 2/4] usb: typec: ucsi: add a common function
 ucsi_unregister_connectors()
Message-ID: <Yla9VGMpcDcpJR0f@kuha.fi.intel.com>
References: <1649843891-15554-1-git-send-email-quic_linyyuan@quicinc.com>
 <1649843891-15554-3-git-send-email-quic_linyyuan@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1649843891-15554-3-git-send-email-quic_linyyuan@quicinc.com>
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Apr 13, 2022 at 05:58:09PM +0800, Linyu Yuan wrote:
> In error path of ucsi_init(), it will unregister all valid ucsi connector,
> and samiliar operation also happen in ucsi_unregister(),

Sorry but I have to confirm this: with "samiliar" you mean "the same",
right?

> add a common function for two places.
> 
> Signed-off-by: Linyu Yuan <quic_linyyuan@quicinc.com>
> ---
> v2: improve ucsi_connector_clean(), check total number of connector.
> v3: rename to ucsi_unregister_connectors(), suggest by maintainer
> 
>  drivers/usb/typec/ucsi/ucsi.c | 51 ++++++++++++++++++++++++-------------------
>  1 file changed, 28 insertions(+), 23 deletions(-)
> 
> diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
> index 77ac0b7..af9a2a1 100644
> --- a/drivers/usb/typec/ucsi/ucsi.c
> +++ b/drivers/usb/typec/ucsi/ucsi.c
> @@ -1187,6 +1187,32 @@ static int ucsi_register_port(struct ucsi *ucsi, int index)
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

Can that actually ever happen?

> +	for (i = 0; i < ucsi->cap.num_connectors; i++) {
> +		con = &ucsi->connector[i];
> +		if (!con->port)
> +			break;
> +
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

Another way of doing this would be to just remove a single connector
in the function, and leave the loops to the callers.

static void ucsi_unregister_connector(struct ucsi_connector *con)
{
        cancel_work_sync(&con->work);
        ucsi_unregister_partner(con);
        ucsi_unregister_altmodes(con, UCSI_RECIPIENT_CON);
        ucsi_unregister_port_psy(con);
        if (con->wq)
                destroy_workqueue(con->wq);
        typec_unregister_port(con->port);
}

I wonder would it actually be a bit more clearer to do it like that...
I'll leave the decision to you.

>  /**
>   * ucsi_init - Initialize UCSI interface
>   * @ucsi: UCSI to be initialized
> @@ -1195,7 +1221,6 @@ static int ucsi_register_port(struct ucsi *ucsi, int index)
>   */
>  static int ucsi_init(struct ucsi *ucsi)
>  {
> -	struct ucsi_connector *con;
>  	u64 command;
>  	int ret;
>  	int i;
> @@ -1250,15 +1275,7 @@ static int ucsi_init(struct ucsi *ucsi)
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
> @@ -1364,7 +1381,6 @@ EXPORT_SYMBOL_GPL(ucsi_register);
>  void ucsi_unregister(struct ucsi *ucsi)
>  {
>  	u64 cmd = UCSI_SET_NOTIFICATION_ENABLE;
> -	int i;
>  
>  	/* Make sure that we are not in the middle of driver initialization */
>  	cancel_work_sync(&ucsi->work);
> @@ -1372,18 +1388,7 @@ void ucsi_unregister(struct ucsi *ucsi)
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
