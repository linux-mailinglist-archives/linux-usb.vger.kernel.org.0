Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7A7C650DAEF
	for <lists+linux-usb@lfdr.de>; Mon, 25 Apr 2022 10:15:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234439AbiDYISZ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 25 Apr 2022 04:18:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36292 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234487AbiDYIRe (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 25 Apr 2022 04:17:34 -0400
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B800B5D5CF
        for <linux-usb@vger.kernel.org>; Mon, 25 Apr 2022 01:14:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1650874469; x=1682410469;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=9BN9/BYJGII+pRxz/HVnxIJooqTXc2ZWkxvrW/LvTrw=;
  b=dlPWR7iZ+yYJhCMNmzMleHgRVMscQ2KgPyztttvkK+8sNJmh1fddSp+Y
   9nHMMssK5w+C0dLLQAKzSvZJR+1eqSZGpODjdSyO7UCu0BZ4KAdcta1o1
   SOT5Ojns/cnXOnU333YKcYWqk3B0+qb0m3qqrFUEuXV5MECaZuZTlmKIo
   u4bu+JRyxa423nFCOMjKT0fto1ZO1bXVdykqyBt2iLRgfy4nPwAd1T9A+
   OSC3SFF5pp3BLfyyjDaWd/+n4PEKraGIUfrnoTFeqzqtNZ1iDFe81yPU5
   EoszzF4jRX/3cqdMtoLg4f/HR6OY2s1sATaF/+34EivLpH8z0FEzkSPxw
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10327"; a="247105190"
X-IronPort-AV: E=Sophos;i="5.90,287,1643702400"; 
   d="scan'208";a="247105190"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2022 01:14:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,287,1643702400"; 
   d="scan'208";a="704458958"
Received: from kuha.fi.intel.com ([10.237.72.185])
  by fmsmga001.fm.intel.com with SMTP; 25 Apr 2022 01:14:25 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Mon, 25 Apr 2022 11:14:24 +0300
Date:   Mon, 25 Apr 2022 11:14:24 +0300
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Linyu Yuan <quic_linyyuan@quicinc.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, Jack Pham <quic_jackp@quicinc.com>
Subject: Re: [PATCH v5 3/3] usb: typec: ucsi: Wait for the USB role switches
Message-ID: <YmZYYCorXsB3fM6T@kuha.fi.intel.com>
References: <1650597022-19793-1-git-send-email-quic_linyyuan@quicinc.com>
 <1650597022-19793-4-git-send-email-quic_linyyuan@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1650597022-19793-4-git-send-email-quic_linyyuan@quicinc.com>
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Apr 22, 2022 at 11:10:22AM +0800, Linyu Yuan wrote:
> When role switch module probe late than ucsi module,
> fwnode_usb_role_switch_get() will return -EPROBE_DEFER,
> it is better to restart ucsi init work to find
> it again every 100ms, total wait time is 10 second.
> 
> It also means change ucsi init work to delayed_work.
> 
> Signed-off-by: Linyu Yuan <quic_linyyuan@quicinc.com>

Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> ---
> v2: keep original con->num in debug log
> v3: change return value from -EAGAIN to PTR_ERR()
> v4: change subject line,
>     add counter for retry limit,
>     correct commit descripton to match change in V3
> v5: small update of commit description
> 
>  drivers/usb/typec/ucsi/ucsi.c | 32 ++++++++++++++++++++------------
>  drivers/usb/typec/ucsi/ucsi.h |  6 +++++-
>  2 files changed, 25 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
> index ce9192e..11f8808 100644
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
> @@ -1286,12 +1286,20 @@ static int ucsi_init(struct ucsi *ucsi)
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
> +	if (ret == -EPROBE_DEFER) {
> +		if (ucsi->work_count++ > UCSI_ROLE_SWITCH_WAIT_COUNT)
> +			return;
> +
> +		queue_delayed_work(system_long_wq, &ucsi->work,
> +				   UCSI_ROLE_SWITCH_INTERVAL);
> +	}
>  }
>  
>  /**
> @@ -1331,7 +1339,7 @@ struct ucsi *ucsi_create(struct device *dev, const struct ucsi_operations *ops)
>  	if (!ucsi)
>  		return ERR_PTR(-ENOMEM);
>  
> -	INIT_WORK(&ucsi->work, ucsi_init_work);
> +	INIT_DELAYED_WORK(&ucsi->work, ucsi_init_work);
>  	mutex_init(&ucsi->ppm_lock);
>  	ucsi->dev = dev;
>  	ucsi->ops = ops;
> @@ -1366,7 +1374,7 @@ int ucsi_register(struct ucsi *ucsi)
>  	if (!ucsi->version)
>  		return -ENODEV;
>  
> -	queue_work(system_long_wq, &ucsi->work);
> +	queue_delayed_work(system_long_wq, &ucsi->work, 0);
>  
>  	return 0;
>  }
> @@ -1383,7 +1391,7 @@ void ucsi_unregister(struct ucsi *ucsi)
>  	u64 cmd = UCSI_SET_NOTIFICATION_ENABLE;
>  
>  	/* Make sure that we are not in the middle of driver initialization */
> -	cancel_work_sync(&ucsi->work);
> +	cancel_delayed_work_sync(&ucsi->work);
>  
>  	/* Disable notifications */
>  	ucsi->ops->async_write(ucsi, UCSI_CONTROL, &cmd, sizeof(cmd));
> diff --git a/drivers/usb/typec/ucsi/ucsi.h b/drivers/usb/typec/ucsi/ucsi.h
> index 280f1e1..8eb391e 100644
> --- a/drivers/usb/typec/ucsi/ucsi.h
> +++ b/drivers/usb/typec/ucsi/ucsi.h
> @@ -287,7 +287,11 @@ struct ucsi {
>  	struct ucsi_capability cap;
>  	struct ucsi_connector *connector;
>  
> -	struct work_struct work;
> +	struct delayed_work work;
> +	int work_count;
> +#define UCSI_ROLE_SWITCH_RETRY_PER_HZ	10
> +#define UCSI_ROLE_SWITCH_INTERVAL	(HZ / UCSI_ROLE_SWITCH_RETRY_PER_HZ)
> +#define UCSI_ROLE_SWITCH_WAIT_COUNT	(10 * UCSI_ROLE_SWITCH_RETRY_PER_HZ)
>  
>  	/* PPM Communication lock */
>  	struct mutex ppm_lock;
> -- 
> 2.7.4

-- 
heikki
