Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 22CD7522DDE
	for <lists+linux-usb@lfdr.de>; Wed, 11 May 2022 10:06:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241368AbiEKIGg (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 11 May 2022 04:06:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50528 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238154AbiEKIGc (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 11 May 2022 04:06:32 -0400
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0FC9A2EA30
        for <linux-usb@vger.kernel.org>; Wed, 11 May 2022 01:06:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1652256391; x=1683792391;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=porYyl8VNrOzZeHdyiV5AF5EAJm516jQ3RCzcG8Qhss=;
  b=G8Zcve561rUxxBYUl40Tu4INZ6/eu65PPEjcQfx/DyJ4kbaT7xB9lJ2H
   qcTD7buAx9QCOo28YyFNzYUP/njC1Z/zX4faTWWfTpSRI6COGpFlqYpOS
   brgeQgrqzIINe7tSpEYDVoaX6xW/WpSbeTiADoFnlWwy0/j4Y4x0u03Cz
   iBFIdyWqOxUVLYdI/UhgHPFnUHBdZ6zigI1w9gRdU4oW7fseT8tmWrwlX
   nXTzWgmswl/frwe3+0XB/UfxPTndVBB/BcRsy3yZWzzq8w6b3D+EI/v7l
   RaTXSjoccTaU0ZTHX97B5ePkCMsicE1j3zTMOcInfh5qD5hFMq9dtFGPL
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10343"; a="251677162"
X-IronPort-AV: E=Sophos;i="5.91,216,1647327600"; 
   d="scan'208";a="251677162"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 May 2022 01:06:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,216,1647327600"; 
   d="scan'208";a="711387380"
Received: from kuha.fi.intel.com ([10.237.72.185])
  by fmsmga001.fm.intel.com with SMTP; 11 May 2022 01:06:26 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Wed, 11 May 2022 11:06:26 +0300
Date:   Wed, 11 May 2022 11:06:26 +0300
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Sanket Goswami <Sanket.Goswami@amd.com>
Cc:     gregkh@linuxfoundation.org, ajayg@nvidia.com,
        linux-usb@vger.kernel.org
Subject: Re: [PATCH 2/2] ucsi_ccg: Do not hardcode interrupt polarity and type
Message-ID: <YntugjJfM2FiYNgQ@kuha.fi.intel.com>
References: <20220510052437.3212186-1-Sanket.Goswami@amd.com>
 <20220510052437.3212186-3-Sanket.Goswami@amd.com>
 <Ynts6+QeiWT7tL3I@kuha.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Ynts6+QeiWT7tL3I@kuha.fi.intel.com>
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, May 11, 2022 at 10:59:42AM +0300, Heikki Krogerus wrote:
> On Tue, May 10, 2022 at 10:54:37AM +0530, Sanket Goswami wrote:
> > The current implementation supports only Level trigger with ACTIVE HIGH.
> > Some of the AMD platforms have different PD firmware implementation which
> > needs different polarity. This patch checks the polarity and type based
> > on the device properties set and registers the interrupt handler
> > accordingly.
> > 
> > Signed-off-by: Sanket Goswami <Sanket.Goswami@amd.com>
> > ---
> >  drivers/usb/typec/ucsi/ucsi_ccg.c | 11 +++++++++--
> >  1 file changed, 9 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/usb/typec/ucsi/ucsi_ccg.c b/drivers/usb/typec/ucsi/ucsi_ccg.c
> > index 7585599bacfd..0db935bd8473 100644
> > --- a/drivers/usb/typec/ucsi/ucsi_ccg.c
> > +++ b/drivers/usb/typec/ucsi/ucsi_ccg.c
> > @@ -20,6 +20,7 @@
> >  
> >  #include <asm/unaligned.h>
> >  #include "ucsi.h"
> > +#define INTR_POL_TYPE	BIT(0)
> >  
> >  enum enum_fw_mode {
> >  	BOOT,   /* bootloader */
> > @@ -1324,6 +1325,8 @@ static int ucsi_ccg_probe(struct i2c_client *client,
> >  	struct device *dev = &client->dev;
> >  	struct ucsi_ccg *uc;
> >  	int status;
> > +	/* Keep the IRQ type and polarity default as Level trigger Active High */
> > +	int irqtype = IRQF_TRIGGER_HIGH;
> >  
> >  	uc = devm_kzalloc(dev, sizeof(*uc), GFP_KERNEL);
> >  	if (!uc)
> > @@ -1366,8 +1369,12 @@ static int ucsi_ccg_probe(struct i2c_client *client,
> >  
> >  	ucsi_set_drvdata(uc->ucsi, uc);
> >  
> > +	status = (uintptr_t)device_get_match_data(dev);
> > +	if (status & INTR_POL_TYPE)
> > +		irqtype = IRQF_TRIGGER_FALLING;
> > +
> >  	status = request_threaded_irq(client->irq, NULL, ccg_irq_handler,
> > -				      IRQF_ONESHOT | IRQF_TRIGGER_HIGH,
> > +				      IRQF_ONESHOT | irqtype,
> >  				      dev_name(dev), uc);
> 
> Please note that you would need to update ccg_restart() as well, but
> there is something else wrong here...
> 
> >  	if (status < 0) {
> >  		dev_err(uc->dev, "request_threaded_irq failed - %d\n", status);
> > @@ -1419,7 +1426,7 @@ static const struct i2c_device_id ucsi_ccg_device_id[] = {
> >  MODULE_DEVICE_TABLE(i2c, ucsi_ccg_device_id);
> >  
> >  static const struct acpi_device_id amd_i2c_ucsi_match[] = {
> > -	{"AMDI0042"},
> > +	{"AMDI0042", INTR_POL_TYPE},
> >  	{}
> >  };
> 
> This should not be necessary. That information comes from the ACPI
> tables.
> 
> I don't think that you need to set the polarity/level flags at all in
> case of ACPI. I'll double check that, but if that is the case, then you
> need to make the case where the device is not ACPI enumerated the
> special case instead.

Actually, can you just test if this works for you:

diff --git a/drivers/usb/typec/ucsi/ucsi_ccg.c b/drivers/usb/typec/ucsi/ucsi_ccg.c
index 6db7c8ddd51cd..f13c10e815d7d 100644
--- a/drivers/usb/typec/ucsi/ucsi_ccg.c
+++ b/drivers/usb/typec/ucsi/ucsi_ccg.c
@@ -1251,8 +1251,7 @@ static int ccg_restart(struct ucsi_ccg *uc)
        }
 
        status = request_threaded_irq(uc->irq, NULL, ccg_irq_handler,
-                                     IRQF_ONESHOT | IRQF_TRIGGER_HIGH,
-                                     dev_name(dev), uc);
+                                     IRQF_ONESHOT, dev_name(dev), uc);
        if (status < 0) {
                dev_err(dev, "request_threaded_irq failed - %d\n", status);
                return status;
@@ -1367,8 +1366,7 @@ static int ucsi_ccg_probe(struct i2c_client *client,
        ucsi_set_drvdata(uc->ucsi, uc);
 
        status = request_threaded_irq(client->irq, NULL, ccg_irq_handler,
-                                     IRQF_ONESHOT | IRQF_TRIGGER_HIGH,
-                                     dev_name(dev), uc);
+                                     IRQF_ONESHOT, dev_name(dev), uc);
        if (status < 0) {
                dev_err(uc->dev, "request_threaded_irq failed - %d\n", status);
                goto out_ucsi_destroy;

thanks,

-- 
heikki
