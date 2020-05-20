Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A7C3B1DB53E
	for <lists+linux-usb@lfdr.de>; Wed, 20 May 2020 15:39:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726691AbgETNjq (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 20 May 2020 09:39:46 -0400
Received: from mga02.intel.com ([134.134.136.20]:44651 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726546AbgETNjq (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 20 May 2020 09:39:46 -0400
IronPort-SDR: ySa+kcFjkWhsd37aHKlUg68Z20R9G/VwujEinlzrC7jTpcexgp5uXal9W7k9yd4Q6qatl/STbV
 +yhy8Lw5pVnQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2020 06:39:45 -0700
IronPort-SDR: bTXmTJnSLguyWwSYawp3bnTXIj5nlBv0wtGPmHqrYZP2EPMdllYLLquH9tQYkgEoIUuy8VkH9r
 Vkz98eoOHDpg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,414,1583222400"; 
   d="scan'208";a="374079016"
Received: from kuha.fi.intel.com ([10.237.72.162])
  by fmsmga001.fm.intel.com with SMTP; 20 May 2020 06:39:43 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Wed, 20 May 2020 16:39:42 +0300
Date:   Wed, 20 May 2020 16:39:42 +0300
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc:     linux-usb@vger.kernel.org, gregkh@linuxfoundation.org
Subject: Re: [PATCH v2 1/2] usb: typec: Ensure USB_ROLE_SWITCH is selected
 for tps6598x
Message-ID: <20200520133942.GA1910854@kuha.fi.intel.com>
References: <20200520123312.320281-1-bryan.odonoghue@linaro.org>
 <20200520123312.320281-2-bryan.odonoghue@linaro.org>
 <20200520131728.GJ1298122@kuha.fi.intel.com>
 <ae7915f0-be5b-1756-c51a-b839ec3de8eb@linaro.org>
 <16b990e1-2046-23e8-f4be-bf1f8659313b@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <16b990e1-2046-23e8-f4be-bf1f8659313b@linaro.org>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, May 20, 2020 at 02:32:31PM +0100, Bryan O'Donoghue wrote:
> On 20/05/2020 14:24, Bryan O'Donoghue wrote:
> > On 20/05/2020 14:17, Heikki Krogerus wrote:
> > > depends on USB_ROLE_SWITCH || !USB_ROLE_SWITCH
> > 
> > Hmm.
> > 
> > That broke for me with a recursive dependency
> > 
> > but this will work
> > 
> > +       depends on REGMAP_I2C
> > +       depends on USB_ROLE_SWITCH || !USB_ROLE_SWITCH
> > 
> 
> Sorry Heikki.
> 
> If I make the above change and then do this to switch off where the USB
> controller in my build is selecting - role switch
> 
> index d53db520e209..636a5428b47e 100644
> --- a/drivers/usb/chipidea/Kconfig
> +++ b/drivers/usb/chipidea/Kconfig
> @@ -6,7 +6,6 @@ config USB_CHIPIDEA
>         select EXTCON
>         select RESET_CONTROLLER
>         select USB_ULPI_BUS
> -       select USB_ROLE_SWITCH
>         select USB_TEGRA_PHY if ARCH_TEGRA
>         help

That driver is a switch supplier. You should select the class here.

> it breaks
> 
> drivers/usb/dwc3/drd.o: In function `dwc3_usb_role_switch_get':
> /home/deckard/Development/qualcomm/qlt-kernel/drivers/usb/dwc3/drd.c:508:
> undefined reference to `usb_role_switch_get_drvdata'
> drivers/usb/dwc3/drd.o: In function `dwc3_usb_role_switch_set':
> /home/deckard/Development/qualcomm/qlt-kernel/drivers/usb/dwc3/drd.c:484:
> undefined reference to `usb_role_switch_get_drvdata'
> drivers/usb/dwc3/drd.o: In function `dwc3_setup_role_switch':
> /home/deckard/Development/qualcomm/qlt-kernel/drivers/usb/dwc3/drd.c:555:
> undefined reference to `usb_role_switch_register'
> drivers/usb/dwc3/drd.o: In function `dwc3_drd_exit':
> /home/deckard/Development/qualcomm/qlt-kernel/drivers/usb/dwc3/drd.c:628:
> undefined reference to `usb_role_switch_unregister'
> drivers/usb/chipidea/core.o: In function `ci_usb_role_switch_get':
> /home/deckard/Development/qualcomm/qlt-kernel/drivers/usb/chipidea/core.c:621:
> undefined reference to `usb_role_switch_get_drvdata'
> drivers/usb/chipidea/core.o: In function `ci_usb_role_switch_set':
> /home/deckard/Development/qualcomm/qlt-kernel/drivers/usb/chipidea/core.c:635:
> undefined reference to `usb_role_switch_get_drvdata'
> drivers/usb/chipidea/core.o: In function `ci_hdrc_remove':
> /home/deckard/Development/qualcomm/qlt-kernel/drivers/usb/chipidea/core.c:1231:
> undefined reference to `usb_role_switch_unregister'
> drivers/usb/chipidea/core.o: In function `ci_hdrc_probe':
> /home/deckard/Development/qualcomm/qlt-kernel/drivers/usb/chipidea/core.c:1210:
> undefined reference to `usb_role_switch_unregister'
> /home/deckard/Development/qualcomm/qlt-kernel/drivers/usb/chipidea/core.c:1143:
> undefined reference to `usb_role_switch_register'
> make[1]: *** [/home/deckard/Development/qualcomm/qlt-kernel/Makefile:1106:
> vmlinux] Error 1
> make[1]: Leaving directory '/home/deckard/Development/qualcomm/qlt-kernel-tools/qlt-kernel/build/square_5.x-tracking'
> 
> to do what you want to do - shouldn't we have to make all of those "select
> USB_ROLE_SWITCH" into "depends on USB_ROLE_SWITCH" ?
> 
> i.e. make all of the consumers depends on instead of selects ?

Yes, ideally.

thanks,

-- 
heikki
