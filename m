Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BC4CD1DB4A1
	for <lists+linux-usb@lfdr.de>; Wed, 20 May 2020 15:11:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726747AbgETNLC (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 20 May 2020 09:11:02 -0400
Received: from mga06.intel.com ([134.134.136.31]:39982 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726439AbgETNLC (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 20 May 2020 09:11:02 -0400
IronPort-SDR: HnVV2vE6JIt643J2C0lZHe1k9kWJV18FA61+HKgvR86QfVs3snuvN75b59/2/S67vul0jxOuDW
 /NBq8ZBUpxXQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2020 06:10:55 -0700
IronPort-SDR: 70By9Ty12l9Aee0c4RqnbdxQE8IwPX6txzA60JQQagCYfYp1/8iuGcxLDaH4M4WnK9+HbdjDrI
 N6n8HpmIRd0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,414,1583222400"; 
   d="scan'208";a="374072587"
Received: from kuha.fi.intel.com ([10.237.72.162])
  by fmsmga001.fm.intel.com with SMTP; 20 May 2020 06:10:53 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Wed, 20 May 2020 16:10:52 +0300
Date:   Wed, 20 May 2020 16:10:52 +0300
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc:     linux-usb@vger.kernel.org, gregkh@linuxfoundation.org
Subject: Re: [PATCH] usb: typec: Ensure USB_ROLE_SWITCH is a dependency for
 tps6598x
Message-ID: <20200520131052.GH1298122@kuha.fi.intel.com>
References: <20200520100526.2729-1-bryan.odonoghue@linaro.org>
 <20200520103542.GF1298122@kuha.fi.intel.com>
 <c1b5a729-6b2a-9c91-6ed0-94ffbc529fcd@linaro.org>
 <4f5aaa11-194f-24ad-bd8a-ce510b2bce94@linaro.org>
 <49a6693e-ed9e-2de6-1dea-ba24b8a3ff4d@linaro.org>
 <8000f5b7-7652-4a31-6ec2-ac680c830823@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8000f5b7-7652-4a31-6ec2-ac680c830823@linaro.org>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, May 20, 2020 at 12:52:36PM +0100, Bryan O'Donoghue wrote:
> So it should be "select USB_ROLE_SWITCH" not "depends on USB_ROLE_SWITCH"

No. The consumers of the switches should depend on it, not silently
select it.

> grep -r "USB_ROLE_SWITCH" * | grep depend
> drivers/usb/typec/Kconfig:	depends on USB_ROLE_SWITCH
> 
> grep -r "USB_ROLE_SWITCH" * | grep select
> drivers/extcon/Kconfig:	select USB_ROLE_SWITCH
> drivers/usb/dwc3/Kconfig:	select USB_ROLE_SWITCH
> drivers/usb/cdns3/Kconfig:	select USB_ROLE_SWITCH
> drivers/usb/gadget/udc/Kconfig:	select USB_ROLE_SWITCH
> drivers/usb/mtu3/Kconfig:	select USB_ROLE_SWITCH
> drivers/usb/musb/Kconfig:	select USB_ROLE_SWITCH
> drivers/usb/musb/Kconfig:	select USB_ROLE_SWITCH
> drivers/usb/typec/tcpm/Kconfig:	select USB_ROLE_SWITCH
> drivers/usb/typec/Kconfig:	select USB_ROLE_SWITCH
> drivers/usb/typec/mux/Kconfig:	select USB_ROLE_SWITCH
> drivers/usb/common/Kconfig:	select USB_ROLE_SWITCH

Note that all those except tcpm supply the switch.

thanks,

-- 
heikki
