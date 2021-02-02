Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BFF4430BE26
	for <lists+linux-usb@lfdr.de>; Tue,  2 Feb 2021 13:27:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231230AbhBBM1Q (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 2 Feb 2021 07:27:16 -0500
Received: from mga05.intel.com ([192.55.52.43]:46558 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229525AbhBBM1M (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 2 Feb 2021 07:27:12 -0500
IronPort-SDR: kE8SnMcObX6hbfA+RWGvHi4PVMjFUZfz3dGsXrzYuPLPzohchestFsgdHRa82/buESrpANjgvv
 NZAxSFaoWGqw==
X-IronPort-AV: E=McAfee;i="6000,8403,9882"; a="265676166"
X-IronPort-AV: E=Sophos;i="5.79,394,1602572400"; 
   d="scan'208";a="265676166"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Feb 2021 04:25:13 -0800
IronPort-SDR: 7kHH/DSkdItOz6jOmKgtz7vIgASNbkfMbZocaWFiaUDbRKhRPScW7XuxqUsXW2/ybQsC9g+70U
 DH1E9GY/IlTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.79,394,1602572400"; 
   d="scan'208";a="391442926"
Received: from mattu-haswell.fi.intel.com (HELO [10.237.72.170]) ([10.237.72.170])
  by orsmga008.jf.intel.com with ESMTP; 02 Feb 2021 04:25:11 -0800
Subject: Re: [RFC PATCH 7/8] usb: xhci: Rewrite xhci_create_usb3_bos_desc()
To:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, Mathias Nyman <mathias.nyman@intel.com>
References: <cover.1612237179.git.Thinh.Nguyen@synopsys.com>
 <f242d50158030eaa93235c54f29d14290b04f71e.1612237179.git.Thinh.Nguyen@synopsys.com>
From:   Mathias Nyman <mathias.nyman@linux.intel.com>
Autocrypt: addr=mathias.nyman@linux.intel.com; prefer-encrypt=mutual; keydata=
 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 fiD/
Message-ID: <9ba42025-ebe4-db16-17d7-ff3782629a5c@linux.intel.com>
Date:   Tue, 2 Feb 2021 14:26:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <f242d50158030eaa93235c54f29d14290b04f71e.1612237179.git.Thinh.Nguyen@synopsys.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi

On 2.2.2021 5.42, Thinh Nguyen wrote:
> The current xhci_create_usb3_bos_desc() uses a static bos structure and
> various magic numbers and offset making it difficult to extend support
> for USB 3.2. Let's rewrite this entire function to support dual-lane in
> USB 3.2.

Agree, it's time to get rid of the static u8 array used for bos.
 
> 
> The hub driver matches the port speed ID from the extended port status
> to the SSID of the sublink speed attributes to detect if the device
> supports SuperSpeed Plus. Currently we don't provide the default gen1x2
> and gen2x2 sublink speed capability descriptor for USB 3.2 roothub. The
> USB stack depends on this to detect and match the correct speed.
> In addition, if the xHCI host provides Protocol Speed ID (PSI)
> capability, then make sure to convert Protocol Speed ID Mantissa and
> Exponent (PSIM & PSIE) to lane speed for gen1x2 and gen2x2.
> 
> Signed-off-by: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
> ---
>  drivers/usb/host/xhci-hub.c | 279 +++++++++++++++++++++++++++++++++++-
>  1 file changed, 277 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/usb/host/xhci-hub.c b/drivers/usb/host/xhci-hub.c
> index 74c497fd3476..c095c30212e5 100644
> --- a/drivers/usb/host/xhci-hub.c
> +++ b/drivers/usb/host/xhci-hub.c
> @@ -11,6 +11,7 @@
>  
>  #include <linux/slab.h>
>  #include <asm/unaligned.h>
> +#include <linux/bitfield.h>
>  
>  #include "xhci.ch"
>  #include "xhci-trace.h"
> @@ -52,7 +53,281 @@ static u8 usb_bos_descriptor [] = {
>  	0xb5, 0x40, 0x0a, 0x00,		/* 10Gbps, SSP, symmetric, tx, ID = 5 */
>  };
>  
> -static int xhci_create_usb3_bos_desc(struct xhci_hcd *xhci, char *buf,
> +static int xhci_fill_default_ssp_attr(struct xhci_hcd *xhci,
> +		struct usb_ssp_cap_descriptor *ssp_cap)
> +{
> +	u32 attr;
> +	u8 ssac;
> +	int i;
> +
> +	attr = le32_to_cpu(ssp_cap->bmAttributes);
> +	ssac = FIELD_GET(USB_SSP_SUBLINK_SPEED_ATTRIBS, attr);
> +
> +	/* Currently we only support USB 3.1 and 3.2 */
> +	if (ssac != 3 && ssac != 7)
> +		return -EINVAL;
> +
> +	/*
> +	 * Map default xHCI port speed ID to SSID:
> +	 *  SSID 4 = Symmetric SSP Gen1x1
> +	 *  SSID 5 = Symmetric SSP Gen2x1
> +	 *  SSID 6 = Symmetric SSP Gen1x2
> +	 *  SSID 7 = Symmetric SSP Gen2x2
> +	 */
> +	for (i = 0; i < ssac + 1; i++) {
> +		u8 ssid;
> +		u8 type;
> +		u8 lp;
> +		u16 mantissa;
> +
> +		ssid = (i >> 1) + 4;
> +
> +		if (ssid > 4)
> +			lp = USB_SSP_SUBLINK_SPEED_LP_SSP;
> +		else
> +			lp = USB_SSP_SUBLINK_SPEED_LP_SS;
> +
> +		if (ssid == 5 || ssid == 7)
> +			mantissa = 10;
> +		else
> +			mantissa = 5;
> +
> +		if (i % 2)
> +			type = USB_SSP_SUBLINK_SPEED_ST_SYM_TX;
> +		else
> +			type = USB_SSP_SUBLINK_SPEED_ST_SYM_RX;
> +
> +		ssp_cap->bmSublinkSpeedAttr[i] =
> +			cpu_to_le32(FIELD_PREP(USB_SSP_SUBLINK_SPEED_SSID,
> +					       ssid) |
> +				    FIELD_PREP(USB_SSP_SUBLINK_SPEED_LSE,
> +					       USB_SSP_SUBLINK_SPEED_LSE_GBPS) |
> +				    FIELD_PREP(USB_SSP_SUBLINK_SPEED_ST, type) |
> +				    FIELD_PREP(USB_SSP_SUBLINK_SPEED_LP, lp) |
> +				    FIELD_PREP(USB_SSP_SUBLINK_SPEED_LSM,
> +					       mantissa));
> +	}
> +
> +	return 0;
> +}

I don't think it makes sense to generates the default sublinkSpeedAttr[] entries like
the function above does.
The content is static and defined in xhci spec.
For these I'd just make a static u32 array. (minding endianness)

static u32 ssp_cap_default_ssa[] = {
	0xaaaaaaaa, /* USB 3.0 SS 5Gbps Id:4, rx */ 
	0xbbbbbbbb, /* USB 3.0 SS 5Gbps Id:4, tx */ 
	0xcccccccc, /* USB 3.1 SSP 10Gbps Id:5  rx */ 
	0xdddddddd, /* USB 3.1 SSP 10Gbps Id:5, tx */ 
	0xeeeeeeee, /* USB 3.2 Gen1x2 10Gbps Id:6, rx */ 
	...
}

Then when creating the ssp cap descriptor set the attribute count (ssac) based on
bcdUSB as you do, and assign the default values if custom ones aren't given (!psi_count).

for (i = 0; i < ssac + 1; i++)
	ssp_cap->mbSublinkSpeedAttr[i] = ssp_capdefault_ssa[i]; 
> +
> +static int xhci_create_usb3x_bos_desc(struct xhci_hcd *xhci, char *buf,
> +				      u16 wLength)
> +{
> +	struct usb_bos_descriptor	*bos;
> +	struct usb_ss_cap_descriptor	*ss_cap;
> +	struct usb_ssp_cap_descriptor	*ssp_cap;
> +	struct xhci_port_cap		*port_cap = NULL;
> +	u16				bcdUSB;
> +	u32				reg;
> +	u32				min_rate = 0;
> +	u8				min_ssid;
> +	u8				ssac;
> +	u8				ssic;
> +	int				offset;
> +	int				i;
> +
> +	/* BOS descriptor */
> +	bos = (struct usb_bos_descriptor *)buf;
> +	bos->bLength = USB_DT_BOS_SIZE;
> +	bos->bDescriptorType = USB_DT_BOS;
> +	bos->wTotalLength = cpu_to_le16(USB_DT_BOS_SIZE +
> +					USB_DT_USB_SS_CAP_SIZE);
> +	bos->bNumDeviceCaps = 1;

This is much better than the current way we fill the descriptor, much more readable.

> +
> +	/* Create the descriptor for port with the highest revision */
> +	for (i = 0; i < xhci->num_port_caps; i++) {
> +		u8 major = xhci->port_caps[i].maj_rev;
> +		u8 minor = xhci->port_caps[i].min_rev;
> +		u16 rev = (major << 8) | minor;
> +
> +		if (i == 0 || bcdUSB < rev) {
> +			bcdUSB = rev;
> +			port_cap = &xhci->port_caps[i];
> +		}
> +	}
> +
> +	if (bcdUSB >= 0x0310) {
> +		/* Two SSA entries for each unique PSI ID, RX and TX */
> +		if (port_cap->psi_count)
> +			ssac = port_cap->psi_uid_count * 2 - 1;
> +		else if (bcdUSB == 0x0320)

maybe (bcdUSB >= 0x320), allows old driver to handle future hardware.

> +			ssac = 7;
> +		else
> +			ssac = 3;
> +
> +		if (port_cap->psi_count)
> +			ssic = port_cap->psi_count - 1;
> +		else
> +			ssic = (ssac + 1) / 2 - 1;
> +
> +		bos->bNumDeviceCaps++;
> +		bos->wTotalLength = cpu_to_le16(USB_DT_BOS_SIZE +
> +						USB_DT_USB_SS_CAP_SIZE +
> +						USB_DT_USB_SSP_CAP_SIZE(ssac));
> +	}
> +
> +	if (wLength < USB_DT_BOS_SIZE + USB_DT_USB_SS_CAP_SIZE)
> +		return wLength;
> +
> +	/* SuperSpeed USB Device Capability */
> +	ss_cap = (struct usb_ss_cap_descriptor *)&buf[USB_DT_BOS_SIZE];
> +	ss_cap->bLength = USB_DT_USB_SS_CAP_SIZE;
> +	ss_cap->bDescriptorType = USB_DT_DEVICE_CAPABILITY;
> +	ss_cap->bDevCapabilityType = USB_SS_CAP_TYPE;
> +	ss_cap->bmAttributes = 0; /* set later */
> +	ss_cap->wSpeedSupported = cpu_to_le16(USB_5GBPS_OPERATION);
> +	ss_cap->bFunctionalitySupport = USB_LOW_SPEED_OPERATION;
> +	ss_cap->bU1devExitLat = 0; /* set later */
> +	ss_cap->bU2DevExitLat = 0; /* set later */
> +
> +	reg = readl(&xhci->cap_regs->hcc_params);
> +	if (HCC_LTC(reg))
> +		ss_cap->bmAttributes |= USB_LTM_SUPPORT;
> +
> +	if ((xhci->quirks & XHCI_LPM_SUPPORT)) {
> +		reg = readl(&xhci->cap_regs->hcs_params3);
> +		ss_cap->bU1devExitLat = HCS_U1_LATENCY(reg);
> +		ss_cap->bU2DevExitLat = cpu_to_le16(HCS_U2_LATENCY(reg));
> +	}
> +
> +	if (wLength < le16_to_cpu(bos->wTotalLength))
> +		return wLength;
> +
> +	if (bcdUSB < 0x0310)
> +		return le16_to_cpu(bos->wTotalLength);
> +
> +	ssp_cap = (struct usb_ssp_cap_descriptor *)&buf[USB_DT_BOS_SIZE +
> +		USB_DT_USB_SS_CAP_SIZE];
> +	ssp_cap->bLength = USB_DT_USB_SSP_CAP_SIZE(ssac);
> +	ssp_cap->bDescriptorType = USB_DT_DEVICE_CAPABILITY;
> +	ssp_cap->bDevCapabilityType = USB_SSP_CAP_TYPE;
> +	ssp_cap->bReserved = 0;
> +	ssp_cap->wReserved = 0;
> +	ssp_cap->bmAttributes =
> +		cpu_to_le32(FIELD_PREP(USB_SSP_SUBLINK_SPEED_ATTRIBS, ssac) |
> +			    FIELD_PREP(USB_SSP_SUBLINK_SPEED_IDS, ssic));
> +
> +	if (!port_cap->psi_count) {

for (i = 0; i < ssac + 1; i++)
	ssp_cap->mbSublinkSpeedAttr[i] = ssp_cap_default_ssa[i];  //mind endianness

> +		int ret;
> +
> +		ret = xhci_fill_default_ssp_attr(xhci, ssp_cap);
> +		if (ret)
> +			return ret;
> +
> +		min_ssid = 4;
> +		goto out;
> +	}
> +
> +	offset = 0;
> +	for (i = 0; i < port_cap->psi_count; i++) {

I need to take a better look at this sublinkSpeedAttr[] creation from custom PSIC table a bit later.

Thanks
-Mathias
