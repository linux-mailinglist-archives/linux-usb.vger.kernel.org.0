Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B413B532812
	for <lists+linux-usb@lfdr.de>; Tue, 24 May 2022 12:47:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232569AbiEXKqq (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 24 May 2022 06:46:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59204 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229824AbiEXKqp (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 24 May 2022 06:46:45 -0400
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 78D6534B9A
        for <linux-usb@vger.kernel.org>; Tue, 24 May 2022 03:46:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1653389203; x=1684925203;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ce/bEZgw+z8/tiqS932sMnX7rI6iTMcI6FtAxz4tyUM=;
  b=C0HPOgUgjvfNBIsNbNmKUOxlKPpTAL/m/pNpsXHNxbnq+T4FFq/Z3FjO
   10ctVYO5Iee1uUcYVe+IqwjIOKlBNLiD0x26led9cnmEn84C7eh08zH8r
   KLtumodWBhVBkEWuWe5DncC04gBLpUVAFKTgmwJcZHpoxiibEYPRLXtt5
   sGDOvaxaxRxbrz+qIDnxvPG9IkvtKF85+rlGgji1E252fWnG2zQpueNlv
   wTrPqyT+U89lAh27+0Zn86DolbzdHcGNDRq9PVL8jNnlaLKEfMgiluHm2
   ktTnMBDC8PeQytv25FM/mk94aSmEcIhSDi0olZNc6uFeUAqs7GHpHP8Np
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10356"; a="273220991"
X-IronPort-AV: E=Sophos;i="5.91,248,1647327600"; 
   d="scan'208";a="273220991"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 May 2022 03:46:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,248,1647327600"; 
   d="scan'208";a="717119592"
Received: from kuha.fi.intel.com ([10.237.72.185])
  by fmsmga001.fm.intel.com with SMTP; 24 May 2022 03:46:40 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Tue, 24 May 2022 13:46:39 +0300
Date:   Tue, 24 May 2022 13:46:39 +0300
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Sanket Goswami <Sanket.Goswami@amd.com>
Cc:     gregkh@linuxfoundation.org, ajayg@nvidia.com,
        linux-usb@vger.kernel.org
Subject: Re: [PATCH v2 2/2] ucsi_ccg: Do not hardcode interrupt polarity and
 type
Message-ID: <Yoy3j13pHbBXSRub@kuha.fi.intel.com>
References: <20220520112704.1461022-1-Sanket.Goswami@amd.com>
 <20220520112704.1461022-3-Sanket.Goswami@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220520112704.1461022-3-Sanket.Goswami@amd.com>
X-Spam-Status: No, score=-5.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Sanket,

On Fri, May 20, 2022 at 04:57:04PM +0530, Sanket Goswami wrote:
> The current implementation supports only Level trigger with ACTIVE HIGH,
> which is overriding level and polarity set by the ACPI table, hence
> Implement the common utility function to manage irq requests.
> 
> Suggested-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> Signed-off-by: Sanket Goswami <Sanket.Goswami@amd.com>
> ---
> Changes in v2:
> - Implemented the new routine ccg_request_irq to handle irq requests.
> 
>  drivers/usb/typec/ucsi/ucsi_ccg.c | 14 ++++++++------
>  1 file changed, 8 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/usb/typec/ucsi/ucsi_ccg.c b/drivers/usb/typec/ucsi/ucsi_ccg.c
> index 7585599bacfd..950efb2363f7 100644
> --- a/drivers/usb/typec/ucsi/ucsi_ccg.c
> +++ b/drivers/usb/typec/ucsi/ucsi_ccg.c
> @@ -1239,6 +1239,12 @@ static int ccg_fw_update(struct ucsi_ccg *uc, enum enum_flash_mode flash_mode)
>  	return err;
>  }
>  
> +static int ccg_request_irq(int irq, struct ucsi_ccg *uc)
> +{
> +	return request_threaded_irq(irq, NULL, ccg_irq_handler,
> +				    IRQF_ONESHOT, dev_name(uc->dev), uc);
> +}

Like that this function would be completely useless...

>  static int ccg_restart(struct ucsi_ccg *uc)
>  {
>  	struct device *dev = uc->dev;
> @@ -1250,9 +1256,7 @@ static int ccg_restart(struct ucsi_ccg *uc)
>  		return status;
>  	}
>  
> -	status = request_threaded_irq(uc->irq, NULL, ccg_irq_handler,
> -				      IRQF_ONESHOT | IRQF_TRIGGER_HIGH,
> -				      dev_name(dev), uc);
> +	status = ccg_request_irq(uc->irq, uc);
>  	if (status < 0) {
>  		dev_err(dev, "request_threaded_irq failed - %d\n", status);
>  		return status;
> @@ -1366,9 +1370,7 @@ static int ucsi_ccg_probe(struct i2c_client *client,
>  
>  	ucsi_set_drvdata(uc->ucsi, uc);
>  
> -	status = request_threaded_irq(client->irq, NULL, ccg_irq_handler,
> -				      IRQF_ONESHOT | IRQF_TRIGGER_HIGH,
> -				      dev_name(dev), uc);
> +	status = ccg_request_irq(client->irq, uc);
>  	if (status < 0) {
>  		dev_err(uc->dev, "request_threaded_irq failed - %d\n", status);
>  		goto out_ucsi_destroy;

This will break the boards that don't support ACPI. I told you that
you need to now consider those as the exception. Something like this
should cover them (and make ccg_request_irq() actually useful):

diff --git a/drivers/usb/typec/ucsi/ucsi_ccg.c b/drivers/usb/typec/ucsi/ucsi_ccg.c
index 6db7c8ddd51cd..0707a71562991 100644
--- a/drivers/usb/typec/ucsi/ucsi_ccg.c
+++ b/drivers/usb/typec/ucsi/ucsi_ccg.c
@@ -627,6 +627,16 @@ static irqreturn_t ccg_irq_handler(int irq, void *data)
        return IRQ_HANDLED;
 }
 
+static int ccg_request_irq(struct ucsi_ccg *uc)
+{
+       unsigned long flags = IRQF_ONESHOT;
+
+       if (!has_acpi_companion(uc->dev))
+               flags |= IRQF_TRIGGER_HIGH;
+
+       return request_threaded_irq(uc->irq, NULL, ccg_irq_handler, flags, dev_name(uc->dev), uc);
+}
+
 static void ccg_pm_workaround_work(struct work_struct *pm_work)
 {
        ccg_irq_handler(0, container_of(pm_work, struct ucsi_ccg, pm_work));
@@ -1250,9 +1260,7 @@ static int ccg_restart(struct ucsi_ccg *uc)
                return status;
        }
 
-       status = request_threaded_irq(uc->irq, NULL, ccg_irq_handler,
-                                     IRQF_ONESHOT | IRQF_TRIGGER_HIGH,
-                                     dev_name(dev), uc);
+       status = ccg_request_irq(uc);
        if (status < 0) {
                dev_err(dev, "request_threaded_irq failed - %d\n", status);
                return status;
@@ -1331,6 +1339,7 @@ static int ucsi_ccg_probe(struct i2c_client *client,
 
        uc->dev = dev;
        uc->client = client;
+       uc->irq = client->irq;
        mutex_init(&uc->lock);
        init_completion(&uc->complete);
        INIT_WORK(&uc->work, ccg_update_firmware);
@@ -1366,16 +1375,12 @@ static int ucsi_ccg_probe(struct i2c_client *client,
 
        ucsi_set_drvdata(uc->ucsi, uc);
 
-       status = request_threaded_irq(client->irq, NULL, ccg_irq_handler,
-                                     IRQF_ONESHOT | IRQF_TRIGGER_HIGH,
-                                     dev_name(dev), uc);
+       status = ccg_request_irq(uc);
        if (status < 0) {
                dev_err(uc->dev, "request_threaded_irq failed - %d\n", status);
                goto out_ucsi_destroy;
        }
 
-       uc->irq = client->irq;
-
        status = ucsi_register(uc->ucsi);
        if (status)
                goto out_free_irq;

thanks,

-- 
heikki
