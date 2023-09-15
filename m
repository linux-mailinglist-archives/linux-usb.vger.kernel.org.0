Return-Path: <linux-usb+bounces-148-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A2FE77A1FC9
	for <lists+linux-usb@lfdr.de>; Fri, 15 Sep 2023 15:25:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 58163282C8E
	for <lists+linux-usb@lfdr.de>; Fri, 15 Sep 2023 13:25:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C488C1097F;
	Fri, 15 Sep 2023 13:24:59 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EC4D107BA;
	Fri, 15 Sep 2023 13:24:57 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C7BA41FF1;
	Fri, 15 Sep 2023 06:24:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694784295; x=1726320295;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=xhawzRG3TJlJdNBVQGus4/qbVTl5JLFakyWXXMvo36U=;
  b=Cd9C3N27LDJ5yjcAGo/07VP1pGuLUWZLNm9liTtx0CX3Z4kKWGJI5JIZ
   R8icJhzDPtQP6WTUcZV/ErXyFC6EyX1YmEDTcfewXGwMAjfJZPgDElDNr
   jwhDmPmbhz75IYWvWuNhQLrygt/iJ0Obval+YauMmsBfhcHnkmwG9PKhu
   7Q3RwHgtvoLpLzxwwrGXvq3FEBAMwZ6wC9zbLvmwzNxwY4Osr1/0bIev9
   W682JVIgv+qn0gUnqujtpD1LvQW9DcPdtrpWl0eaJhGencfh0kNph5Lpi
   jARH2pUxtJP9an77tdqv3tvW8LhFyrmX8lLdV7c6ho/2cENrh82J6j63Q
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10834"; a="443307482"
X-IronPort-AV: E=Sophos;i="6.02,149,1688454000"; 
   d="scan'208";a="443307482"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2023 06:23:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10834"; a="780091501"
X-IronPort-AV: E=Sophos;i="6.02,149,1688454000"; 
   d="scan'208";a="780091501"
Received: from kuha.fi.intel.com ([10.237.72.185])
  by orsmga001.jf.intel.com with SMTP; 15 Sep 2023 06:23:22 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Fri, 15 Sep 2023 16:23:21 +0300
Date: Fri, 15 Sep 2023 16:23:21 +0300
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Javier Carrasco <javier.carrasco@wolfvision.net>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v2 1/2] usb: typec: tps6598x: add reset gpio support
Message-ID: <ZQRayaqdtrqYl4AT@kuha.fi.intel.com>
References: <20230912-topic-tps6598x_reset-v2-0-02a12e2ec50a@wolfvision.net>
 <20230912-topic-tps6598x_reset-v2-1-02a12e2ec50a@wolfvision.net>
 <ZQRUsD1QLke70VG2@kuha.fi.intel.com>
 <8937c928-1938-4864-08e1-25f88caadb9a@wolfvision.net>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8937c928-1938-4864-08e1-25f88caadb9a@wolfvision.net>
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

Hi,

On Fri, Sep 15, 2023 at 03:17:28PM +0200, Javier Carrasco wrote:
> On 15.09.23 14:57, Heikki Krogerus wrote:
> > On Fri, Sep 15, 2023 at 02:23:48PM +0200, Javier Carrasco wrote:
> >> The TPS6598x PD controller provides an active-high hardware reset input
> >> that reinitializes all device settings. If it is not grounded by
> >> design, the driver must be able to de-assert it in order to initialize
> >> the device.
> >>
> >> The PD controller is not ready for registration right after the reset
> >> de-assertion and a delay must be introduced in that case. According to
> >> TI, the delay can reach up to 1000 ms [1], which is in line with the
> >> experimental results obtained with a TPS65987D.
> >>
> >> Add a GPIO descriptor for the reset signal and basic reset management
> >> for initialization and suspend/resume.
> >>
> >> [1] https://e2e.ti.com/support/power-management-group/power-management/
> >> f/power-management-forum/1269856/tps65987d-tps65987d-reset-de-assert-
> >> to-normal-operation/4809389#4809389
> >>
> >> Signed-off-by: Javier Carrasco <javier.carrasco@wolfvision.net>
> >> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> >> ---
> >>  drivers/usb/typec/tipd/core.c | 20 ++++++++++++++++++++
> >>  1 file changed, 20 insertions(+)
> >>
> >> diff --git a/drivers/usb/typec/tipd/core.c b/drivers/usb/typec/tipd/core.c
> >> index 37b56ce75f39..3068ef300073 100644
> >> --- a/drivers/usb/typec/tipd/core.c
> >> +++ b/drivers/usb/typec/tipd/core.c
> >> @@ -8,6 +8,7 @@
> >>  
> >>  #include <linux/i2c.h>
> >>  #include <linux/acpi.h>
> >> +#include <linux/gpio/consumer.h>
> >>  #include <linux/module.h>
> >>  #include <linux/of.h>
> >>  #include <linux/power_supply.h>
> >> @@ -43,6 +44,9 @@
> >>  /* TPS_REG_SYSTEM_CONF bits */
> >>  #define TPS_SYSCONF_PORTINFO(c)		((c) & 7)
> >>  
> >> +/* reset de-assertion to ready for operation */
> >> +#define SETUP_MS			1000
> >> +
> >>  enum {
> >>  	TPS_PORTINFO_SINK,
> >>  	TPS_PORTINFO_SINK_ACCESSORY,
> >> @@ -86,6 +90,7 @@ struct tps6598x {
> >>  	struct mutex lock; /* device lock */
> >>  	u8 i2c_protocol:1;
> >>  
> >> +	struct gpio_desc *reset;
> >>  	struct typec_port *port;
> >>  	struct typec_partner *partner;
> >>  	struct usb_pd_identity partner_identity;
> >> @@ -717,6 +722,13 @@ static int tps6598x_probe(struct i2c_client *client)
> >>  	mutex_init(&tps->lock);
> >>  	tps->dev = &client->dev;
> >>  
> >> +	tps->reset = devm_gpiod_get_optional(tps->dev, "reset", GPIOD_OUT_LOW);
> >> +	if (IS_ERR(tps->reset))
> >> +		return dev_err_probe(tps->dev, PTR_ERR(tps->reset),
> >> +				     "failed to get reset GPIO\n");
> >> +	if (tps->reset)
> >> +		msleep(SETUP_MS);
> >> +
> >>  	tps->regmap = devm_regmap_init_i2c(client, &tps6598x_regmap_config);
> >>  	if (IS_ERR(tps->regmap))
> >>  		return PTR_ERR(tps->regmap);
> >> @@ -892,6 +904,9 @@ static void tps6598x_remove(struct i2c_client *client)
> >>  	tps6598x_disconnect(tps, 0);
> >>  	typec_unregister_port(tps->port);
> >>  	usb_role_switch_put(tps->role_sw);
> >> +
> >> +	if (tps->reset)
> >> +		gpiod_set_value_cansleep(tps->reset, 1);
> > 
> > Do you need that "if (tps->reset)" in this case? That function is NULL safe,
> > right?
> > 
> The function makes use of the VALIDATE_DESC_VOID macro to make it NULL
> safe, but this macro also calls pr_warn if the descriptor is NULL and I
> do not want to add warnings for an optional property that did not exist
> before because it could be confusing. But if that is the desired
> behavior, I will remove the checks.

No, I don't want noise either.

> >>  }
> >>  
> >>  static int __maybe_unused tps6598x_suspend(struct device *dev)
> >> @@ -902,6 +917,8 @@ static int __maybe_unused tps6598x_suspend(struct device *dev)
> >>  	if (tps->wakeup) {
> >>  		disable_irq(client->irq);
> >>  		enable_irq_wake(client->irq);
> >> +	} else if (tps->reset) {
> >> +		gpiod_set_value_cansleep(tps->reset, 1);
> >>  	}
> >>  
> >>  	if (!client->irq)
> >> @@ -918,6 +935,9 @@ static int __maybe_unused tps6598x_resume(struct device *dev)
> >>  	if (tps->wakeup) {
> >>  		disable_irq_wake(client->irq);
> >>  		enable_irq(client->irq);
> >> +	} else if (tps->reset) {
> >> +		gpiod_set_value_cansleep(tps->reset, 0);
> >> +		msleep(SETUP_MS);
> >>  	}
> >>  
> >>  	if (!client->irq)
> >>
> >> -- 
> >> 2.39.2

thanks,

-- 
heikki

