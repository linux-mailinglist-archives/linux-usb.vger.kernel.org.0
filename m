Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 61389525F28
	for <lists+linux-usb@lfdr.de>; Fri, 13 May 2022 12:07:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1379235AbiEMKAK (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 13 May 2022 06:00:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34080 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1354709AbiEMKAJ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 13 May 2022 06:00:09 -0400
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 595FF2AA2C1
        for <linux-usb@vger.kernel.org>; Fri, 13 May 2022 03:00:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1652436008; x=1683972008;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=/ByyPEPwL4Pi8oLwsSNx0cf+iljVc05NKuvcbgA//2s=;
  b=J7GHsP2Gs7p/xty5b/Z/aLVZy9KzOfgqPRqUgoooOAU6BIh+U+teZ965
   n50qiqCWtsHXFiJwiKMH5dq4J0Ep/XG6xnf9xS6uhtYx3jzTzAjXrazMy
   Sqv31LjjvIA6bmlR8zmTks4oX0T6CrwGC3U8+c49Iy7hpOLe4PUhgF70G
   ikhL2rUh36Lxs5guCm5vR8asnv27QSyAez0UE4y4w6nWlheiA5sNna8j1
   5iGkDyhH2T8bE9CSITEdCjUYYqeVAiLsuuNB53lTsOToRIeoihW85O0cq
   bj44bHGnG9Vzl0HDvArlk8RuTIyLndKTM/1MghqRXF9ByV/0QLub1HAGo
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10345"; a="250168189"
X-IronPort-AV: E=Sophos;i="5.91,221,1647327600"; 
   d="scan'208";a="250168189"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2022 03:00:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,221,1647327600"; 
   d="scan'208";a="712335782"
Received: from kuha.fi.intel.com ([10.237.72.185])
  by fmsmga001.fm.intel.com with SMTP; 13 May 2022 03:00:05 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Fri, 13 May 2022 13:00:05 +0300
Date:   Fri, 13 May 2022 13:00:04 +0300
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     "Goswami, Sanket" <Sanket.Goswami@amd.com>
Cc:     gregkh@linuxfoundation.org, ajayg@nvidia.com,
        linux-usb@vger.kernel.org
Subject: Re: [PATCH 2/2] ucsi_ccg: Do not hardcode interrupt polarity and type
Message-ID: <Yn4sJER+AXFru92X@kuha.fi.intel.com>
References: <20220510052437.3212186-1-Sanket.Goswami@amd.com>
 <20220510052437.3212186-3-Sanket.Goswami@amd.com>
 <Ynts6+QeiWT7tL3I@kuha.fi.intel.com>
 <YntugjJfM2FiYNgQ@kuha.fi.intel.com>
 <9dee017e-eedf-4bbd-7c60-33587b1b523f@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9dee017e-eedf-4bbd-7c60-33587b1b523f@amd.com>
X-Spam-Status: No, score=-4.9 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, May 12, 2022 at 10:53:25PM +0530, Goswami, Sanket wrote:
> Hi Heikki,
> 
> On 11-May-22 13:36, Heikki Krogerus wrote:
> > On Wed, May 11, 2022 at 10:59:42AM +0300, Heikki Krogerus wrote:
> >> On Tue, May 10, 2022 at 10:54:37AM +0530, Sanket Goswami wrote:
> >>> The current implementation supports only Level trigger with ACTIVE HIGH.
> >>> Some of the AMD platforms have different PD firmware implementation which
> >>> needs different polarity. This patch checks the polarity and type based
> >>> on the device properties set and registers the interrupt handler
> >>> accordingly.
> >>>
> >>> Signed-off-by: Sanket Goswami <Sanket.Goswami@amd.com>
> >>> ---
> >>>  drivers/usb/typec/ucsi/ucsi_ccg.c | 11 +++++++++--
> >>>  1 file changed, 9 insertions(+), 2 deletions(-)
> >>>
> >>> diff --git a/drivers/usb/typec/ucsi/ucsi_ccg.c b/drivers/usb/typec/ucsi/ucsi_ccg.c
> >>> index 7585599bacfd..0db935bd8473 100644
> >>> --- a/drivers/usb/typec/ucsi/ucsi_ccg.c
> >>> +++ b/drivers/usb/typec/ucsi/ucsi_ccg.c
> >>> @@ -20,6 +20,7 @@
> >>>  
> >>>  #include <asm/unaligned.h>
> >>>  #include "ucsi.h"
> >>> +#define INTR_POL_TYPE	BIT(0)
> >>>  
> >>>  enum enum_fw_mode {
> >>>  	BOOT,   /* bootloader */
> >>> @@ -1324,6 +1325,8 @@ static int ucsi_ccg_probe(struct i2c_client *client,
> >>>  	struct device *dev = &client->dev;
> >>>  	struct ucsi_ccg *uc;
> >>>  	int status;
> >>> +	/* Keep the IRQ type and polarity default as Level trigger Active High */
> >>> +	int irqtype = IRQF_TRIGGER_HIGH;
> >>>  
> >>>  	uc = devm_kzalloc(dev, sizeof(*uc), GFP_KERNEL);
> >>>  	if (!uc)
> >>> @@ -1366,8 +1369,12 @@ static int ucsi_ccg_probe(struct i2c_client *client,
> >>>  
> >>>  	ucsi_set_drvdata(uc->ucsi, uc);
> >>>  
> >>> +	status = (uintptr_t)device_get_match_data(dev);
> >>> +	if (status & INTR_POL_TYPE)
> >>> +		irqtype = IRQF_TRIGGER_FALLING;
> >>> +
> >>>  	status = request_threaded_irq(client->irq, NULL, ccg_irq_handler,
> >>> -				      IRQF_ONESHOT | IRQF_TRIGGER_HIGH,
> >>> +				      IRQF_ONESHOT | irqtype,
> >>>  				      dev_name(dev), uc);
> >>
> >> Please note that you would need to update ccg_restart() as well, but
> >> there is something else wrong here...
> >>
> >>>  	if (status < 0) {
> >>>  		dev_err(uc->dev, "request_threaded_irq failed - %d\n", status);
> >>> @@ -1419,7 +1426,7 @@ static const struct i2c_device_id ucsi_ccg_device_id[] = {
> >>>  MODULE_DEVICE_TABLE(i2c, ucsi_ccg_device_id);
> >>>  
> >>>  static const struct acpi_device_id amd_i2c_ucsi_match[] = {
> >>> -	{"AMDI0042"},
> >>> +	{"AMDI0042", INTR_POL_TYPE},
> >>>  	{}
> >>>  };
> >>
> >> This should not be necessary. That information comes from the ACPI
> >> tables.
> >>
> >> I don't think that you need to set the polarity/level flags at all in
> >> case of ACPI. I'll double check that, but if that is the case, then you
> >> need to make the case where the device is not ACPI enumerated the
> >> special case instead.
> > 
> > Actually, can you just test if this works for you:
> > 
> > diff --git a/drivers/usb/typec/ucsi/ucsi_ccg.c b/drivers/usb/typec/ucsi/ucsi_ccg.c
> > index 6db7c8ddd51cd..f13c10e815d7d 100644
> > --- a/drivers/usb/typec/ucsi/ucsi_ccg.c
> > +++ b/drivers/usb/typec/ucsi/ucsi_ccg.c
> > @@ -1251,8 +1251,7 @@ static int ccg_restart(struct ucsi_ccg *uc)
> >         }
> >  
> >         status = request_threaded_irq(uc->irq, NULL, ccg_irq_handler,
> > -                                     IRQF_ONESHOT | IRQF_TRIGGER_HIGH,
> > -                                     dev_name(dev), uc);
> > +                                     IRQF_ONESHOT, dev_name(dev), uc);
> 
> For AMD platforms, this change is not require as we are not doing firmware
> download using driver.

It really does not matter if your platform does not require this -
other platforms still need it.

Add a function where you handle the irq request, for example
ccg_request_irq(), and then just call that function in both places.

> >         if (status < 0) {
> >                 dev_err(dev, "request_threaded_irq failed - %d\n", status);
> >                 return status;
> > @@ -1367,8 +1366,7 @@ static int ucsi_ccg_probe(struct i2c_client *client,
> >         ucsi_set_drvdata(uc->ucsi, uc);
> >  
> >         status = request_threaded_irq(client->irq, NULL, ccg_irq_handler,
> > -                                     IRQF_ONESHOT | IRQF_TRIGGER_HIGH,
> > -                                     dev_name(dev), uc);
> > +                                     IRQF_ONESHOT, dev_name(dev), uc);
> 
> Thanks for this suggestion, I have validated the same on AMD platforms and it is
> functional. Will re-spin the new patch series with this change.

thanks,

-- 
heikki
