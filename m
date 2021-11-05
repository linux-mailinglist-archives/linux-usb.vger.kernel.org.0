Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 28DDF446579
	for <lists+linux-usb@lfdr.de>; Fri,  5 Nov 2021 16:08:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233333AbhKEPLP (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 5 Nov 2021 11:11:15 -0400
Received: from mga11.intel.com ([192.55.52.93]:62671 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229680AbhKEPLO (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 5 Nov 2021 11:11:14 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10158"; a="229377692"
X-IronPort-AV: E=Sophos;i="5.87,212,1631602800"; 
   d="scan'208";a="229377692"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2021 08:02:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,212,1631602800"; 
   d="scan'208";a="639841114"
Received: from kuha.fi.intel.com ([10.237.72.166])
  by fmsmga001.fm.intel.com with SMTP; 05 Nov 2021 08:02:08 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Fri, 05 Nov 2021 17:02:08 +0200
Date:   Fri, 5 Nov 2021 17:02:08 +0200
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc:     linux@roeck-us.net, gregkh@linuxfoundation.org,
        bjorn.andersson@linaro.org, robh+dt@kernel.org,
        linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, wcheng@codeaurora.org
Subject: Re: [PATCH v3 6/7] usb: typec: qcom: Remove standalone qcom pm8150b
 typec driver
Message-ID: <YYVHcHC1Gm92VxEM@kuha.fi.intel.com>
References: <20211105033558.1573552-1-bryan.odonoghue@linaro.org>
 <20211105033558.1573552-7-bryan.odonoghue@linaro.org>
 <YYVG5DZJdNfZyj8x@kuha.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YYVG5DZJdNfZyj8x@kuha.fi.intel.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Nov 05, 2021 at 04:59:53PM +0200, Heikki Krogerus wrote:
> On Fri, Nov 05, 2021 at 03:35:57AM +0000, Bryan O'Donoghue wrote:
> > Remove the standalone PMIC Type-C driver. We have implemented a full TCPM
> > driver which covers and extends the functionality in this driver.
> > 
> > Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> > ---
> >  drivers/usb/typec/Kconfig           |  13 --
> >  drivers/usb/typec/Makefile          |   1 -
> >  drivers/usb/typec/qcom-pmic-typec.c | 262 ----------------------------
> >  3 files changed, 276 deletions(-)
> >  delete mode 100644 drivers/usb/typec/qcom-pmic-typec.c
> > 
> > diff --git a/drivers/usb/typec/Kconfig b/drivers/usb/typec/Kconfig
> > index ab480f38523aa..61fba7bd1671d 100644
> > --- a/drivers/usb/typec/Kconfig
> > +++ b/drivers/usb/typec/Kconfig
> > @@ -75,19 +75,6 @@ config TYPEC_STUSB160X
> >  	  If you choose to build this driver as a dynamically linked module, the
> >  	  module will be called stusb160x.ko.
> >  
> > -config TYPEC_QCOM_PMIC
> > -	tristate "Qualcomm PMIC USB Type-C driver"
> > -	depends on ARCH_QCOM || COMPILE_TEST
> > -	depends on USB_ROLE_SWITCH || !USB_ROLE_SWITCH
> > -	help
> > -	  Driver for supporting role switch over the Qualcomm PMIC.  This will
> > -	  handle the USB Type-C role and orientation detection reported by the
> > -	  QCOM PMIC if the PMIC has the capability to handle USB Type-C
> > -	  detection.
> > -
> > -	  It will also enable the VBUS output to connected devices when a
> > -	  DFP connection is made.
> 
> I don't like that you create point where the support is temporarily
> removed for this hardware. I know Guenter asked that you remove the
> old driver in a separate patch, but I believe at that point you were
> also proposing different config option name for the new driver, so you
> could have removed the old driver only after you added the new one.
> 
> Since you now use the same configuration option name - which makes
> perfect sense to me - I think you need to refactor this series. Maybe
> you could first just move the old driver under drivers/usb/typec/tcpm/
> in one patch, and then modify and slit it in another patch.

Or just merge this patch to the next one.

thanks,

-- 
heikki
