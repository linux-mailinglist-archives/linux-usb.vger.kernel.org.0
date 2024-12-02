Return-Path: <linux-usb+bounces-18002-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id DB3A69E0644
	for <lists+linux-usb@lfdr.de>; Mon,  2 Dec 2024 16:06:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3E6DBB6485E
	for <lists+linux-usb@lfdr.de>; Mon,  2 Dec 2024 14:07:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC415203717;
	Mon,  2 Dec 2024 14:06:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="b27Z7UWa"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57276203711
	for <linux-usb@vger.kernel.org>; Mon,  2 Dec 2024 14:06:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733148398; cv=none; b=cIxD1iJICouJtrM/FyFG9WU8JBPvmaKdEOraLE8R4KEs8wx4nwCnVYJONq1Xd3TTPeZ32IYmI+7RkpbC5JnYfqyc6gfWJyh2/WyKjQqdjJ4uGeFLYmj3cBvv0Fz1QAQahiMcoQM55eJT3pcsSXzCZSD9OJj+W7GUopNElItvcuc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733148398; c=relaxed/simple;
	bh=5aFBx/ZmhmjSLk12IInWiJikYkuYOKCjhlmjjMLkC5o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rbcts3U1Hb6bs+tFyPzU4lIqZsCgl/O8xmIS51S6W/WoegaC8evPhWO9821QTiu86VYxdyvinjPnfiObwPahwiIEZWlRqb6eB8rTO4/dpcPzZDaTK+nYgDwmRN7gamPL9+0SYBjjwVPJgyP5jh1ShEKjYT4ntR8/ui0TZhkNl+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=b27Z7UWa; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733148396; x=1764684396;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=5aFBx/ZmhmjSLk12IInWiJikYkuYOKCjhlmjjMLkC5o=;
  b=b27Z7UWagxzTvSslqvFCtlJ/EDt4ykdFz9UIz83u+LvXuaNXax2sMbPb
   rEVx4Plsz+1nBpOd7WjIoz/G+kDipydoelIqzaicuRxgmiXRRNtMHcmVj
   xP0eDfci3b0hD1h5277+pVbfu6+aK9UOGzb4WzAjZQngBMOQbpdt4S2ul
   3OzRoUUaTaGRNYGutR3VbR/BbEYhzgFxszMmXBEwHVHVWyx5ouc8z7Nmq
   mDkzwxedgBeg+YVP/ODzoB7Z2Zh3xoJS4lG0OjyciXxS6fxOt37YOi+Ah
   /yLiBzLg3DvHlbr2srtqXZXs6U+Y1zq68u7V1KVYXN2bd+uOv/v5zaXoA
   w==;
X-CSE-ConnectionGUID: EM4PA2kyTS+i/Ik6pUGtgg==
X-CSE-MsgGUID: /vcO1RfJS2eGjSOhqaDvjg==
X-IronPort-AV: E=McAfee;i="6700,10204,11274"; a="33245886"
X-IronPort-AV: E=Sophos;i="6.12,202,1728975600"; 
   d="scan'208";a="33245886"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Dec 2024 06:06:36 -0800
X-CSE-ConnectionGUID: tazOb4YRTN20hqF7Qm870Q==
X-CSE-MsgGUID: X3Y4daRaS7SNQ69W2eDMkg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,202,1728975600"; 
   d="scan'208";a="93430124"
Received: from kuha.fi.intel.com ([10.237.72.152])
  by fmviesa010.fm.intel.com with SMTP; 02 Dec 2024 06:06:32 -0800
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Mon, 02 Dec 2024 16:06:31 +0200
Date: Mon, 2 Dec 2024 16:06:31 +0200
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: =?utf-8?Q?=C5=81ukasz?= Bartosik <ukaszb@chromium.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Benson Leung <bleung@chromium.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
	Jameson Thies <jthies@google.com>,
	Pavan Holla <pholla@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>, linux-usb@vger.kernel.org,
	chrome-platform@lists.linux.dev
Subject: Re: [PATCH v8 3/3] usb: typec: cros_ec_ucsi: Recover from write
 timeouts
Message-ID: <Z02-57oN7h_E1VQ1@kuha.fi.intel.com>
References: <20241128232035.1525978-1-ukaszb@chromium.org>
 <20241128232035.1525978-4-ukaszb@chromium.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241128232035.1525978-4-ukaszb@chromium.org>

Hi Łukasz,

On Thu, Nov 28, 2024 at 11:20:35PM +0000, Łukasz Bartosik wrote:
> From: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
> 
> In a suspend-resume edge case, the OPM is timing out in ucsi_resume and
> the PPM is getting stuck waiting for a command complete ack. Add a write
> timeout recovery task that will get us out of this state.

Sorry, I did not realise this before, but this is in practice a fix
(or workaround) to the driver that you just introduced in the previous
patch. Please merge it into that.

> Signed-off-by: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
> Signed-off-by: Łukasz Bartosik <ukaszb@chromium.org>
> ---
>  drivers/usb/typec/ucsi/cros_ec_ucsi.c | 88 ++++++++++++++++++++++++++-
>  1 file changed, 87 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/typec/ucsi/cros_ec_ucsi.c b/drivers/usb/typec/ucsi/cros_ec_ucsi.c
> index c588d9a57643..6daf61e7e62a 100644
> --- a/drivers/usb/typec/ucsi/cros_ec_ucsi.c
> +++ b/drivers/usb/typec/ucsi/cros_ec_ucsi.c
> @@ -7,6 +7,7 @@
>  
>  #include <linux/container_of.h>
>  #include <linux/dev_printk.h>
> +#include <linux/jiffies.h>
>  #include <linux/mod_devicetable.h>
>  #include <linux/module.h>
>  #include <linux/platform_data/cros_ec_commands.h>
> @@ -29,6 +30,9 @@
>   */
>  #define WRITE_TMO_MS		5000
>  
> +/* Number of times to attempt recovery from a write timeout before giving up. */
> +#define WRITE_TMO_CTR_MAX	5
> +
>  struct cros_ucsi_data {
>  	struct device *dev;
>  	struct ucsi *ucsi;
> @@ -36,6 +40,8 @@ struct cros_ucsi_data {
>  	struct cros_ec_device *ec;
>  	struct notifier_block nb;
>  	struct work_struct work;
> +	struct delayed_work write_tmo;
> +	int tmo_counter;
>  
>  	struct completion complete;
>  	unsigned long flags;
> @@ -99,12 +105,43 @@ static int cros_ucsi_async_control(struct ucsi *ucsi, u64 cmd)
>  	return 0;
>  }
>  
> +static int cros_ucsi_sync_control(struct ucsi *ucsi, u64 cmd)
> +{
> +	struct cros_ucsi_data *udata = ucsi_get_drvdata(ucsi);
> +	int ret;
> +
> +	ret = ucsi_sync_control_common(ucsi, cmd);
> +	if (ret)
> +		goto out;
> +
> +	/* Successful write. Cancel any pending recovery work. */
> +	cancel_delayed_work_sync(&udata->write_tmo);
> +
> +	return 0;
> +out:

This label looks a bit unnecessary to me. How about a switch statement?

	ret = ucsi_sync_control_common(ucsi, cmd);
        switch (ret) {
        case -EBUSY:
        case -ETIMEDOUT:
		cancel_delayed_work_sync(&udata->write_tmo);
		schedule_delayed_work(&udata->write_tmo, msecs_to_jiffies(WRITE_TMO_MS));
                break;
        case 0:
                cancel_delayed_work_sync(&udata->write_tmo);
                break;
        }

        return ret;

> +	/* EC may return -EBUSY if CCI.busy is set. Convert this to a timeout.
> +	 */
> +	if (ret == -EBUSY)
> +		ret = -ETIMEDOUT;
> +
> +	/* Schedule recovery attempt when we timeout or tried to send a command
> +	 * while still busy.
> +	 */
> +	if (ret == -ETIMEDOUT) {
> +		cancel_delayed_work_sync(&udata->write_tmo);
> +		schedule_delayed_work(&udata->write_tmo,
> +				      msecs_to_jiffies(WRITE_TMO_MS));
> +	}
> +
> +	return ret;
> +}
> +
>  struct ucsi_operations cros_ucsi_ops = {
>  	.read_version = cros_ucsi_read_version,
>  	.read_cci = cros_ucsi_read_cci,
>  	.read_message_in = cros_ucsi_read_message_in,
>  	.async_control = cros_ucsi_async_control,
> -	.sync_control = ucsi_sync_control_common,
> +	.sync_control = cros_ucsi_sync_control,
>  };
>  
>  static void cros_ucsi_work(struct work_struct *work)
> @@ -118,6 +155,54 @@ static void cros_ucsi_work(struct work_struct *work)
>  	ucsi_notify_common(udata->ucsi, cci);
>  }
>  
> +static void cros_ucsi_write_timeout(struct work_struct *work)
> +{
> +	struct cros_ucsi_data *udata =
> +		container_of(work, struct cros_ucsi_data, write_tmo.work);
> +	u32 cci;
> +	u64 cmd;
> +
> +	if (cros_ucsi_read(udata->ucsi, UCSI_CCI, &cci, sizeof(cci))) {
> +		dev_err(udata->dev,
> +			"Reading CCI failed; no write timeout recovery possible.");
> +		return;
> +	}
> +
> +	if (cci & UCSI_CCI_BUSY) {
> +		udata->tmo_counter++;
> +
> +		if (udata->tmo_counter <= WRITE_TMO_CTR_MAX)
> +			schedule_delayed_work(&udata->write_tmo,
> +					      msecs_to_jiffies(WRITE_TMO_MS));
> +		else
> +			dev_err(udata->dev,
> +				"PPM unresponsive - too many write timeouts.");
> +
> +		return;
> +	}
> +
> +	/* No longer busy means we can reset our timeout counter. */
> +	udata->tmo_counter = 0;
> +
> +	/* Need to ack previous command which may have timed out. */
> +	if (cci & UCSI_CCI_COMMAND_COMPLETE) {
> +		cmd = UCSI_ACK_CC_CI | UCSI_ACK_COMMAND_COMPLETE;
> +		cros_ucsi_async_control(udata->ucsi, &cmd);
> +
> +		/* Check again after a few seconds that the system has
> +		 * recovered to make sure our async write above was successful.
> +		 */
> +		schedule_delayed_work(&udata->write_tmo,
> +				      msecs_to_jiffies(WRITE_TMO_MS));
> +		return;
> +	}
> +
> +	/* We recovered from a previous timeout. Treat this as a recovery from
> +	 * suspend and call resume.
> +	 */
> +	ucsi_resume(udata->ucsi);
> +}
> +
>  static int cros_ucsi_event(struct notifier_block *nb,
>  			   unsigned long host_event, void *_notify)
>  {
> @@ -162,6 +247,7 @@ static int cros_ucsi_probe(struct platform_device *pdev)
>  	platform_set_drvdata(pdev, udata);
>  
>  	INIT_WORK(&udata->work, cros_ucsi_work);
> +	INIT_DELAYED_WORK(&udata->write_tmo, cros_ucsi_write_timeout);
>  	init_completion(&udata->complete);
>  
>  	udata->ucsi = ucsi_create(dev, &cros_ucsi_ops);

thanks,

-- 
heikki

