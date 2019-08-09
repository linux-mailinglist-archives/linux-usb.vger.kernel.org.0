Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D533C87939
	for <lists+linux-usb@lfdr.de>; Fri,  9 Aug 2019 14:03:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2406582AbfHIMDX (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 9 Aug 2019 08:03:23 -0400
Received: from mga18.intel.com ([134.134.136.126]:51699 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726140AbfHIMDX (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 9 Aug 2019 08:03:23 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 09 Aug 2019 05:03:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,364,1559545200"; 
   d="scan'208";a="375182553"
Received: from pipin.fi.intel.com (HELO pipin) ([10.237.72.175])
  by fmsmga006.fm.intel.com with ESMTP; 09 Aug 2019 05:03:19 -0700
From:   Felipe Balbi <balbi@kernel.org>
To:     Nagarjuna Kristam <nkristam@nvidia.com>,
        gregkh@linuxfoundation.org, thierry.reding@gmail.com,
        jonathanh@nvidia.com, mark.rutland@arm.com, robh+dt@kernel.org
Cc:     devicetree@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-usb@vger.kernel.org, Nagarjuna Kristam <nkristam@nvidia.com>
Subject: Re: [Patch V6 7/8] usb: gadget: Add UDC driver for tegra XUSB device mode controller
In-Reply-To: <1565257046-9890-8-git-send-email-nkristam@nvidia.com>
References: <1565257046-9890-1-git-send-email-nkristam@nvidia.com> <1565257046-9890-8-git-send-email-nkristam@nvidia.com>
Date:   Fri, 09 Aug 2019 15:03:18 +0300
Message-ID: <87tvaqtuk9.fsf@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


Hi,

Nagarjuna Kristam <nkristam@nvidia.com> writes:
> This patch adds UDC driver for tegra XUSB 3.0 device mode controller.
> XUSB device mode controller supports SS, HS and FS modes
>
> Based on work by:
>   Mark Kuo <mkuo@nvidia.com>
>   Hui Fu <hfu@nvidia.com>
>   Andrew Bresticker <abrestic@chromium.org>
>
> Signed-off-by: Nagarjuna Kristam <nkristam@nvidia.com>
> Acked-by: Thierry Reding <treding@nvidia.com>
> ---
>  drivers/usb/gadget/udc/Kconfig      |   11 +
>  drivers/usb/gadget/udc/Makefile     |    1 +
>  drivers/usb/gadget/udc/tegra_xudc.c | 3808 +++++++++++++++++++++++++++++++++++
>  3 files changed, 3820 insertions(+)
>  create mode 100644 drivers/usb/gadget/udc/tegra_xudc.c
>
> diff --git a/drivers/usb/gadget/udc/Kconfig b/drivers/usb/gadget/udc/Kconfig
> index ef0259a..fe6028e 100644
> --- a/drivers/usb/gadget/udc/Kconfig
> +++ b/drivers/usb/gadget/udc/Kconfig
> @@ -440,6 +440,17 @@ config USB_GADGET_XILINX
>  	  dynamically linked module called "udc-xilinx" and force all
>  	  gadget drivers to also be dynamically linked.
>  
> +config USB_TEGRA_XUDC
> +	tristate "NVIDIA Tegra Superspeed USB 3.0 Device Controller"
> +	depends on ARCH_TEGRA

I need at least a COMPILE_TEST here.

-- 
balbi
