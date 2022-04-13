Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E41E54FF6FA
	for <lists+linux-usb@lfdr.de>; Wed, 13 Apr 2022 14:40:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235585AbiDMMmV (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 13 Apr 2022 08:42:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46260 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233514AbiDMMmU (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 13 Apr 2022 08:42:20 -0400
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3BDEE1CB27
        for <linux-usb@vger.kernel.org>; Wed, 13 Apr 2022 05:39:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1649853599; x=1681389599;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Y1uhrIu6CQ0WQ7zQxY/F/nh1VSpZRva8ea2YDEdWIbE=;
  b=VsqmtHY4A8lGxZmLOwqtlL6HM7GgFH3W9tsmpiha7BmhnFFCqYKnbov6
   swMLUt0gyndGWatc+9g4odllthrcYQScNMyzuQG3jkLhaFs6wO4PWuVc/
   /2sieKTkvAblXjKQQ2B+qLKSNRNFyvqHZVy6GqSjxbXsIoH2GRVo0PYTw
   E8+A2Kn/uG5QD4lDvi0ooq0bBoZF9uso8apaAUdfuPmbDinn9yMwAacZb
   ZIH6OHzHB3cSMqusVwykW0+/qgDhbH13Lqj7qVUpX7ecFCvOkI4JURfQt
   oS1d3khwL310JOSv/zGaims5KHwyvl1Ldqb49/la9FRGmKQByi1hpYhsH
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10315"; a="325556314"
X-IronPort-AV: E=Sophos;i="5.90,256,1643702400"; 
   d="scan'208";a="325556314"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Apr 2022 05:39:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,256,1643702400"; 
   d="scan'208";a="700230607"
Received: from kuha.fi.intel.com ([10.237.72.185])
  by fmsmga001.fm.intel.com with SMTP; 13 Apr 2022 05:39:56 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Wed, 13 Apr 2022 15:39:55 +0300
Date:   Wed, 13 Apr 2022 15:39:55 +0300
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Linyu Yuan <quic_linyyuan@quicinc.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, Jack Pham <quic_jackp@quicinc.com>
Subject: Re: [PATCH v3 4/4] usb: typec: ucsi: retry find role swithch when
 module load late
Message-ID: <YlbEm31fOaMsFW6C@kuha.fi.intel.com>
References: <1649843891-15554-1-git-send-email-quic_linyyuan@quicinc.com>
 <1649843891-15554-5-git-send-email-quic_linyyuan@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1649843891-15554-5-git-send-email-quic_linyyuan@quicinc.com>
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

You have to make the subject line a bit more clear. Perhaps you could
just say "Wait for the USB role switches".

On Wed, Apr 13, 2022 at 05:58:11PM +0800, Linyu Yuan wrote:
> When role switch enabled, return -EAGAIN if fail to find it due to
> module load ordering issue, then restart ucsi init work to find
> it again every 100ms.

It looks like you did not update that.

> It also means change ucsi init work to delayed_work.

So from where does that 100ms come from?

> Signed-off-by: Linyu Yuan <quic_linyyuan@quicinc.com>
> ---
> v2: keep original con->num in debug log
> v3: change return value from -EAGAIN to PTR_ERR()
> 
>  drivers/usb/typec/ucsi/ucsi.c | 28 ++++++++++++++++------------
>  drivers/usb/typec/ucsi/ucsi.h |  2 +-
>  2 files changed, 17 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
> index ce9192e..63c25dd 100644
> --- a/drivers/usb/typec/ucsi/ucsi.c
> +++ b/drivers/usb/typec/ucsi/ucsi.c
> @@ -1053,6 +1053,14 @@ static int ucsi_register_port(struct ucsi *ucsi, int index)
>  	con->num = index + 1;
>  	con->ucsi = ucsi;
>  
> +	cap->fwnode = ucsi_find_fwnode(con);
> +	con->usb_role_sw = fwnode_usb_role_switch_get(cap->fwnode);
> +	if (IS_ERR(con->usb_role_sw)) {
> +		dev_err(ucsi->dev, "con%d: failed to get usb role switch\n",
> +			con->num);
> +		return PTR_ERR(con->usb_role_sw);
> +	}
> +
>  	/* Delay other interactions with the con until registration is complete */
>  	mutex_lock(&con->lock);
>  
> @@ -1088,7 +1096,6 @@ static int ucsi_register_port(struct ucsi *ucsi, int index)
>  	if (con->cap.op_mode & UCSI_CONCAP_OPMODE_DEBUG_ACCESSORY)
>  		*accessory = TYPEC_ACCESSORY_DEBUG;
>  
> -	cap->fwnode = ucsi_find_fwnode(con);
>  	cap->driver_data = con;
>  	cap->ops = &ucsi_ops;
>  
> @@ -1147,13 +1154,6 @@ static int ucsi_register_port(struct ucsi *ucsi, int index)
>  		ucsi_port_psy_changed(con);
>  	}
>  
> -	con->usb_role_sw = fwnode_usb_role_switch_get(cap->fwnode);
> -	if (IS_ERR(con->usb_role_sw)) {
> -		dev_err(ucsi->dev, "con%d: failed to get usb role switch\n",
> -			con->num);
> -		con->usb_role_sw = NULL;
> -	}
> -
>  	/* Only notify USB controller if partner supports USB data */
>  	if (!(UCSI_CONSTAT_PARTNER_FLAGS(con->status.flags) & UCSI_CONSTAT_PARTNER_FLAG_USB))
>  		u_role = USB_ROLE_NONE;
> @@ -1286,12 +1286,16 @@ static int ucsi_init(struct ucsi *ucsi)
>  
>  static void ucsi_init_work(struct work_struct *work)
>  {
> -	struct ucsi *ucsi = container_of(work, struct ucsi, work);
> +	struct ucsi *ucsi = container_of(work, struct ucsi, work.work);
>  	int ret;
>  
>  	ret = ucsi_init(ucsi);
>  	if (ret)
>  		dev_err(ucsi->dev, "PPM init failed (%d)\n", ret);
> +
> +

Extra line.

> +	if (ret == -EPROBE_DEFER)
> +		queue_delayed_work(system_long_wq, &ucsi->work, HZ/10);

You have to stop queueing that eventually. You need a counter.

I'm still not sure why do you want to queue this same work again and
again? Why not just call ucsi_init() in a loop?

        int my_counter = 1000;

        while (ucsi_init(ucsi) == -EPROBE_DEFER && my_counter--)
                msleep(10);

>  }
>  
>  /**
> @@ -1331,7 +1335,7 @@ struct ucsi *ucsi_create(struct device *dev, const struct ucsi_operations *ops)
>  	if (!ucsi)
>  		return ERR_PTR(-ENOMEM);
>  
> -	INIT_WORK(&ucsi->work, ucsi_init_work);
> +	INIT_DELAYED_WORK(&ucsi->work, ucsi_init_work);
>  	mutex_init(&ucsi->ppm_lock);
>  	ucsi->dev = dev;
>  	ucsi->ops = ops;
> @@ -1366,7 +1370,7 @@ int ucsi_register(struct ucsi *ucsi)
>  	if (!ucsi->version)
>  		return -ENODEV;
>  
> -	queue_work(system_long_wq, &ucsi->work);
> +	queue_delayed_work(system_long_wq, &ucsi->work, 0);
>  
>  	return 0;
>  }
> @@ -1383,7 +1387,7 @@ void ucsi_unregister(struct ucsi *ucsi)
>  	u64 cmd = UCSI_SET_NOTIFICATION_ENABLE;
>  
>  	/* Make sure that we are not in the middle of driver initialization */
> -	cancel_work_sync(&ucsi->work);
> +	cancel_delayed_work_sync(&ucsi->work);
>  
>  	/* Disable notifications */
>  	ucsi->ops->async_write(ucsi, UCSI_CONTROL, &cmd, sizeof(cmd));
> diff --git a/drivers/usb/typec/ucsi/ucsi.h b/drivers/usb/typec/ucsi/ucsi.h
> index 280f1e1..3812017 100644
> --- a/drivers/usb/typec/ucsi/ucsi.h
> +++ b/drivers/usb/typec/ucsi/ucsi.h
> @@ -287,7 +287,7 @@ struct ucsi {
>  	struct ucsi_capability cap;
>  	struct ucsi_connector *connector;
>  
> -	struct work_struct work;
> +	struct delayed_work work;
>  
>  	/* PPM Communication lock */
>  	struct mutex ppm_lock;
> -- 
> 2.7.4

thanks,

-- 
heikki
