Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DB3E1199257
	for <lists+linux-usb@lfdr.de>; Tue, 31 Mar 2020 11:35:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730131AbgCaJfF (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 31 Mar 2020 05:35:05 -0400
Received: from mga14.intel.com ([192.55.52.115]:55575 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726488AbgCaJfF (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 31 Mar 2020 05:35:05 -0400
IronPort-SDR: FF2VhLJHBr7a6rRD0Gjanr6aKoJPma3u905ya24ocarl2HVY3/95mpU7qVf6DvPNdgqizXaGGY
 9GXNbecsO/UA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2020 02:35:04 -0700
IronPort-SDR: 9cSEsqGFfl9calpWeNqqnOCTi5ajzlJ41PmpKzua5uAvjtVo1KwwNZn8+SQRMnuoc1nplOmIHc
 FpkKQ73T2yzA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,327,1580803200"; 
   d="scan'208";a="248992543"
Received: from mattu-haswell.fi.intel.com (HELO [10.237.72.170]) ([10.237.72.170])
  by orsmga003.jf.intel.com with ESMTP; 31 Mar 2020 02:35:00 -0700
Subject: Re: [PATCH v2 2/4] usb: xhci: xhci-plat: Add support for Broadcom STB
 SoC's
To:     Al Cooper <alcooperx@gmail.com>, linux-kernel@vger.kernel.org
Cc:     andriy.shevchenko@linux.intel.com,
        Alan Stern <stern@rowland.harvard.edu>,
        bcm-kernel-feedback-list@broadcom.com,
        Chunfeng Yun <chunfeng.yun@mediatek.com>,
        devicetree@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        =?UTF-8?Q?Jonathan_Neusch=c3=a4fer?= <j.neuschaefer@gmx.net>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        linux-usb@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>,
        Mathias Nyman <mathias.nyman@intel.com>,
        Rob Herring <robh+dt@kernel.org>
References: <20200327204711.10614-1-alcooperx@gmail.com>
 <20200327204711.10614-3-alcooperx@gmail.com>
From:   Mathias Nyman <mathias.nyman@linux.intel.com>
Openpgp: preference=signencrypt
Autocrypt: addr=mathias.nyman@linux.intel.com; prefer-encrypt=mutual; keydata=
 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 fiD/
Message-ID: <0841dbde-efa7-6dc2-c19d-f87b756a94eb@linux.intel.com>
Date:   Tue, 31 Mar 2020 12:37:35 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20200327204711.10614-3-alcooperx@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 27.3.2020 22.47, Al Cooper wrote:
> Add support for Broadcom STB SoC's to the xhci platform driver
> 
> Signed-off-by: Al Cooper <alcooperx@gmail.com>
> ---
>  drivers/usb/host/xhci-brcm.c | 16 ++++++++++++++++
>  drivers/usb/host/xhci-brcm.h | 16 ++++++++++++++++
>  drivers/usb/host/xhci-plat.c | 11 +++++++++++
>  3 files changed, 43 insertions(+)
>  create mode 100644 drivers/usb/host/xhci-brcm.c
>  create mode 100644 drivers/usb/host/xhci-brcm.h
> 
> diff --git a/drivers/usb/host/xhci-brcm.c b/drivers/usb/host/xhci-brcm.c
> new file mode 100644
> index 000000000000..bf8c0bfd1780
> --- /dev/null
> +++ b/drivers/usb/host/xhci-brcm.c
> @@ -0,0 +1,16 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/* Copyright (c) 2018, Broadcom */
> +
> +#include <linux/usb.h>
> +#include <linux/usb/hcd.h>
> +
> +#include "xhci.h"
> +
> +int xhci_plat_brcm_init_quirk(struct usb_hcd *hcd)
> +{
> +	struct xhci_hcd	*xhci = hcd_to_xhci(hcd);
> +
> +	xhci->quirks |= XHCI_RESET_ON_RESUME;
> +	return 0;
> +}
> +

If there's nothing else than one quirk flag needed for Broadcom STB Soc
it would be simpler to add it directly to the xhci_plat_brcm structure.

No need to add xhci-brcm.c or xhci-brcm.h files, or any xhci Makfile or Kconfig
changes


> diff --git a/drivers/usb/host/xhci-brcm.h b/drivers/usb/host/xhci-brcm.h
> new file mode 100644
> index 000000000000..e64800fae4d5
> --- /dev/null
> +++ b/drivers/usb/host/xhci-brcm.h
> @@ -0,0 +1,16 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/* Copyright (c) 2018, Broadcom */
> +
> +#ifndef _XHCI_BRCM_H
> +#define _XHCI_BRCM_H
> +
> +#if IS_ENABLED(CONFIG_USB_XHCI_BRCM)
> +int xhci_plat_brcm_init_quirk(struct usb_hcd *hcd);
> +#else
> +static inline int xhci_plat_brcm_init_quirk(struct usb_hcd *hcd)
> +{
> +	return 0;
> +}
> +#endif
> +#endif /* _XHCI_BRCM_H */
> +
> diff --git a/drivers/usb/host/xhci-plat.c b/drivers/usb/host/xhci-plat.c
> index 315b4552693c..3e90a1207803 100644
> --- a/drivers/usb/host/xhci-plat.c
> +++ b/drivers/usb/host/xhci-plat.c
> @@ -22,6 +22,7 @@
>  
>  #include "xhci.h"
>  #include "xhci-plat.h"
> +#include "xhci-brcm.h"
>  #include "xhci-mvebu.h"
>  #include "xhci-rcar.h"
>  
> @@ -112,6 +113,10 @@ static const struct xhci_plat_priv xhci_plat_renesas_rcar_gen3 = {
>  	SET_XHCI_PLAT_PRIV_FOR_RCAR(XHCI_RCAR_FIRMWARE_NAME_V3)
>  };
>  
> +static const struct xhci_plat_priv xhci_plat_brcm = {
> +	.init_quirk = xhci_plat_brcm_init_quirk,
> +};
> +

So something like this instead:

static const struct xhci_plat_priv xhci_plat_brcm = {
	.quirks = XHCI_RESET_ON_RESUME,
};

-Mathias
