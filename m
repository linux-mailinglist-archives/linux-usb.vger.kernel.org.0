Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 89521184A18
	for <lists+linux-usb@lfdr.de>; Fri, 13 Mar 2020 15:59:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726678AbgCMO7I (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 13 Mar 2020 10:59:08 -0400
Received: from mga01.intel.com ([192.55.52.88]:22278 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726216AbgCMO7I (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 13 Mar 2020 10:59:08 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 13 Mar 2020 07:58:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,549,1574150400"; 
   d="scan'208";a="243401951"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga003.jf.intel.com with ESMTP; 13 Mar 2020 07:58:44 -0700
Received: from andy by smile with local (Exim 4.93)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1jCllu-009Huq-2a; Fri, 13 Mar 2020 16:58:46 +0200
Date:   Fri, 13 Mar 2020 16:58:46 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Al Cooper <alcooperx@gmail.com>
Cc:     linux-kernel@vger.kernel.org,
        Alan Stern <stern@rowland.harvard.edu>,
        Arnd Bergmann <arnd@arndb.de>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        bcm-kernel-feedback-list@broadcom.com,
        "David S. Miller" <davem@davemloft.net>,
        devicetree@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Johan Hovold <johan@kernel.org>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        linux-usb@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>,
        Mathias Nyman <mathias.nyman@intel.com>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 2/4] usb: xhci: xhci-plat: Add support for Broadcom STB
 SoC's
Message-ID: <20200313145846.GU1922688@smile.fi.intel.com>
References: <20200313141545.31943-1-alcooperx@gmail.com>
 <20200313141545.31943-3-alcooperx@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200313141545.31943-3-alcooperx@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Mar 13, 2020 at 10:15:43AM -0400, Al Cooper wrote:
> Add support for Broadcom STB SoC's to the xhci platform driver

...

>  #include "xhci-plat.h"
>  #include "xhci-mvebu.h"
>  #include "xhci-rcar.h"
> +#include "xhci-brcm.h"

Perhaps put it in order, i.e. after xhci-plat.h?

...

> +static const struct xhci_plat_priv xhci_plat_brcm = {
> +	.init_quirk = xhci_plat_brcm_init_quirk

Add comma at the end, it might help to reduce burden on update.

> +};

-- 
With Best Regards,
Andy Shevchenko


