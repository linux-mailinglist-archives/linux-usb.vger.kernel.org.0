Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BF19A83209
	for <lists+linux-usb@lfdr.de>; Tue,  6 Aug 2019 14:59:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731272AbfHFM7w (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 6 Aug 2019 08:59:52 -0400
Received: from mga18.intel.com ([134.134.136.126]:13583 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729898AbfHFM7w (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 6 Aug 2019 08:59:52 -0400
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 06 Aug 2019 05:59:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,353,1559545200"; 
   d="scan'208";a="192656186"
Received: from kuha.fi.intel.com ([10.237.72.189])
  by fmsmga001.fm.intel.com with SMTP; 06 Aug 2019 05:59:49 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Tue, 06 Aug 2019 15:59:48 +0300
Date:   Tue, 6 Aug 2019 15:59:48 +0300
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org, Ajay Gupta <ajayg@nvidia.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        Wei Yongjun <weiyongjun1@huawei.com>
Subject: Re: [PATCH] USB: typec: ucsi_ccg: convert i2c driver to use
 dev_groups
Message-ID: <20190806125948.GB25061@kuha.fi.intel.com>
References: <20190805193636.25560-6-gregkh@linuxfoundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190805193636.25560-6-gregkh@linuxfoundation.org>
User-Agent: Mutt/1.12.0 (2019-05-25)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Aug 05, 2019 at 09:36:36PM +0200, Greg Kroah-Hartman wrote:
> The driver core now supports the option to automatically create and
> remove any needed sysfs attribute files for a driver when the device is
> bound/removed from it.  Convert the uscsi_ccg code to use that instead
> of trying to create sysfs files "by hand".
> 
> Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> Cc: Ajay Gupta <ajayg@nvidia.com>
> Cc: Wolfram Sang <wsa@the-dreams.de>
> Cc: Wei Yongjun <weiyongjun1@huawei.com>
> Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> ---
>  drivers/usb/typec/ucsi/ucsi_ccg.c | 13 +++----------
>  1 file changed, 3 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/usb/typec/ucsi/ucsi_ccg.c b/drivers/usb/typec/ucsi/ucsi_ccg.c
> index f7a79a23ebed..e283a42e4f06 100644
> --- a/drivers/usb/typec/ucsi/ucsi_ccg.c
> +++ b/drivers/usb/typec/ucsi/ucsi_ccg.c
> @@ -1104,14 +1104,11 @@ static ssize_t do_flash_store(struct device *dev,
>  
>  static DEVICE_ATTR_WO(do_flash);
>  
> -static struct attribute *ucsi_ccg_sysfs_attrs[] = {
> +static struct attribute *ucsi_ccg_attrs[] = {
>  	&dev_attr_do_flash.attr,
>  	NULL,
>  };
> -
> -static struct attribute_group ucsi_ccg_attr_group = {
> -	.attrs = ucsi_ccg_sysfs_attrs,
> -};
> +ATTRIBUTE_GROUPS(ucsi_ccg);
>  
>  static int ucsi_ccg_probe(struct i2c_client *client,
>  			  const struct i2c_device_id *id)
> @@ -1189,10 +1186,6 @@ static int ucsi_ccg_probe(struct i2c_client *client,
>  
>  	i2c_set_clientdata(client, uc);
>  
> -	status = sysfs_create_group(&uc->dev->kobj, &ucsi_ccg_attr_group);
> -	if (status)
> -		dev_err(uc->dev, "cannot create sysfs group: %d\n", status);
> -
>  	pm_runtime_set_active(uc->dev);
>  	pm_runtime_enable(uc->dev);
>  	pm_runtime_idle(uc->dev);
> @@ -1209,7 +1202,6 @@ static int ucsi_ccg_remove(struct i2c_client *client)
>  	ucsi_unregister_ppm(uc->ucsi);
>  	pm_runtime_disable(uc->dev);
>  	free_irq(uc->irq, uc);
> -	sysfs_remove_group(&uc->dev->kobj, &ucsi_ccg_attr_group);
>  
>  	return 0;
>  }
> @@ -1270,6 +1262,7 @@ static struct i2c_driver ucsi_ccg_driver = {
>  	.driver = {
>  		.name = "ucsi_ccg",
>  		.pm = &ucsi_ccg_pm,
> +		.dev_groups = ucsi_ccg_groups,
>  	},
>  	.probe = ucsi_ccg_probe,
>  	.remove = ucsi_ccg_remove,
> -- 
> 2.22.0

thanks,

-- 
heikki
