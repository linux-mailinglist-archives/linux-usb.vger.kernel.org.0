Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 306C34FF0B3
	for <lists+linux-usb@lfdr.de>; Wed, 13 Apr 2022 09:38:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233412AbiDMHkq (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 13 Apr 2022 03:40:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32792 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233296AbiDMHkp (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 13 Apr 2022 03:40:45 -0400
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9FFBBDBC
        for <linux-usb@vger.kernel.org>; Wed, 13 Apr 2022 00:38:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1649835504; x=1681371504;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=o9zSesFIi1JOFxVcXN76qoS0XQAQ9WgXX8LDf+ul7zg=;
  b=A2dvDSQCxsN0Z8dQBTrsLzFbahH3HCIs1VOK36Dxv8yZQt08tTWibU6N
   UWN9QFtoWCQ6ecBsPwoHLHEuQb0ll1XCi/7Oc2O3h07Rvjrgiw8gSzSen
   BPejbe7qvMesEUHtZO/rl5mS63+FZFKyO1++HdYnMQ52ZRNTF9QkL1Gy8
   lpEFO8bUH+fVbg6qs0cB9kXp5FIMFAdbGBmCfzJALJzl3iX6hnXFzt0GO
   fgN2+8bfjr7K8rBKoL34Y23PWeQJyRKkSLpRRUAk1vr1iQIFD9I6rMyX2
   jiD7cNE9Isi8GAL1bCsf2k0GVrh57BsvFwv02xqE3Ivm4hd19rqUeYuFl
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10315"; a="261446716"
X-IronPort-AV: E=Sophos;i="5.90,256,1643702400"; 
   d="scan'208";a="261446716"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Apr 2022 00:38:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,256,1643702400"; 
   d="scan'208";a="700148774"
Received: from kuha.fi.intel.com ([10.237.72.185])
  by fmsmga001.fm.intel.com with SMTP; 13 Apr 2022 00:38:22 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Wed, 13 Apr 2022 10:38:21 +0300
Date:   Wed, 13 Apr 2022 10:38:21 +0300
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Linyu Yuan <quic_linyyuan@quicinc.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, Jack Pham <quic_jackp@quicinc.com>
Subject: Re: [PATCH 2/3] usb: typec: ucsi: add a common function
 ucsi_connector_clean()
Message-ID: <YlZ97SSX2kTwzj5z@kuha.fi.intel.com>
References: <1649759407-24049-1-git-send-email-quic_linyyuan@quicinc.com>
 <1649759407-24049-3-git-send-email-quic_linyyuan@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1649759407-24049-3-git-send-email-quic_linyyuan@quicinc.com>
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Apr 12, 2022 at 06:30:06PM +0800, Linyu Yuan wrote:
> In error path of ucsi_init(), it will clean all valid ucsi connector,
> and samiliar operation also happen in ucsi_unregister(),
> add a common function for two places.
> 
> Signed-off-by: Linyu Yuan <quic_linyyuan@quicinc.com>
> ---
>  drivers/usb/typec/ucsi/ucsi.c | 46 +++++++++++++++++++++----------------------
>  1 file changed, 23 insertions(+), 23 deletions(-)
> 
> diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
> index 77ac0b7..684fc4f 100644
> --- a/drivers/usb/typec/ucsi/ucsi.c
> +++ b/drivers/usb/typec/ucsi/ucsi.c
> @@ -1187,6 +1187,27 @@ static int ucsi_register_port(struct ucsi *ucsi, int index)
>  	return ret;
>  }
>  
> +static void ucsi_connector_clean(struct ucsi *ucsi)
> +{
> +	struct ucsi_connector *con;
> +
> +	if (!ucsi->connector)
> +		return;
> +
> +	for (con = ucsi->connector; con->port; con++) {
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

This looks OK, but the name of the function is confusing to me. Can
you make that ucsi_remove_connectors(), or perhaps
ucsi_unregister_connectors() to keep it alligned with the other
function names in this driver?

>  /**
>   * ucsi_init - Initialize UCSI interface
>   * @ucsi: UCSI to be initialized
> @@ -1195,7 +1216,6 @@ static int ucsi_register_port(struct ucsi *ucsi, int index)
>   */
>  static int ucsi_init(struct ucsi *ucsi)
>  {
> -	struct ucsi_connector *con;
>  	u64 command;
>  	int ret;
>  	int i;
> @@ -1250,15 +1270,7 @@ static int ucsi_init(struct ucsi *ucsi)
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
> +	ucsi_connector_clean(ucsi);
>  
>  err_reset:
>  	memset(&ucsi->cap, 0, sizeof(ucsi->cap));
> @@ -1364,7 +1376,6 @@ EXPORT_SYMBOL_GPL(ucsi_register);
>  void ucsi_unregister(struct ucsi *ucsi)
>  {
>  	u64 cmd = UCSI_SET_NOTIFICATION_ENABLE;
> -	int i;
>  
>  	/* Make sure that we are not in the middle of driver initialization */
>  	cancel_work_sync(&ucsi->work);
> @@ -1372,18 +1383,7 @@ void ucsi_unregister(struct ucsi *ucsi)
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
> +	ucsi_connector_clean(ucsi);
>  }
>  EXPORT_SYMBOL_GPL(ucsi_unregister);
>  
> -- 
> 2.7.4

thanks,

-- 
heikki
