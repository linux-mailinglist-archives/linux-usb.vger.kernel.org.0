Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C43CF332459
	for <lists+linux-usb@lfdr.de>; Tue,  9 Mar 2021 12:46:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230063AbhCILqP (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 9 Mar 2021 06:46:15 -0500
Received: from mga18.intel.com ([134.134.136.126]:41616 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229900AbhCILqE (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 9 Mar 2021 06:46:04 -0500
IronPort-SDR: UmGyhfuiyoioksdtKlHpxjXb1pKiYYtH80IsWuIBpd68PcmemV+5VehEI/uB2LDfMvpr/yJhiK
 Dkk2lLmNYh1g==
X-IronPort-AV: E=McAfee;i="6000,8403,9917"; a="175819662"
X-IronPort-AV: E=Sophos;i="5.81,234,1610438400"; 
   d="scan'208";a="175819662"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Mar 2021 03:46:04 -0800
IronPort-SDR: tMmdUI75Dm5q4ONcLU2/Ydmt352vxhxeECAP6g31/h+9Vxy59zXyLQHEfx2UbvYaIXE9r8l4jC
 QBAKeO1N1Qfg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,234,1610438400"; 
   d="scan'208";a="386200319"
Received: from mattu-haswell.fi.intel.com (HELO [10.237.72.170]) ([10.237.72.170])
  by orsmga002.jf.intel.com with ESMTP; 09 Mar 2021 03:46:02 -0800
Subject: Re: [PATCH v2 7/8] usb: xhci: Rewrite xhci_create_usb3_bos_desc()
To:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, Mathias Nyman <mathias.nyman@intel.com>
References: <cover.1612410491.git.Thinh.Nguyen@synopsys.com>
 <2d9a3de7f6cfeada9a15ec0ec4683b49c62543c2.1612410491.git.Thinh.Nguyen@synopsys.com>
From:   Mathias Nyman <mathias.nyman@linux.intel.com>
Autocrypt: addr=mathias.nyman@linux.intel.com; prefer-encrypt=mutual; keydata=
 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 fiD/
Message-ID: <9ea1095f-0ef0-946f-0fea-1af85f9e8822@linux.intel.com>
Date:   Tue, 9 Mar 2021 13:47:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <2d9a3de7f6cfeada9a15ec0ec4683b49c62543c2.1612410491.git.Thinh.Nguyen@synopsys.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 4.2.2021 6.11, Thinh Nguyen wrote:
> The current xhci_create_usb3_bos_desc() uses a static bos u8 array and
> various magic numbers and offsets making it difficult to extend support
> for USB 3.2. Let's rewrite this entire function to support dual-lane in
> USB 3.2.
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
> Changes in v2:
> - Use static array for SSA per Mathias suggestion
> - Check bcdUSB >= 0x320 instead of bcdUSB == 0x320 per Mathias suggestion
> - When host uses custom PSI, SSIC is the psi_uid_count and not SSAC. I missed
>   this when transferring the previous logic over. Previous implementation
>   was incorrect. Let's fix it here.
> 
>  drivers/usb/host/xhci-hub.c | 237 +++++++++++++++++++++++++++++++++++-
>  1 file changed, 235 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/usb/host/xhci-hub.c b/drivers/usb/host/xhci-hub.c
> index 74c497fd3476..eddd139c2260 100644
> --- a/drivers/usb/host/xhci-hub.c
> +++ b/drivers/usb/host/xhci-hub.c
> @@ -11,6 +11,7 @@
>  
>  #include <linux/slab.h>
>  #include <asm/unaligned.h>
> +#include <linux/bitfield.h>
>  
>  #include "xhci.h"
>  #include "xhci-trace.h"
> @@ -52,7 +53,239 @@ static u8 usb_bos_descriptor [] = {
>  	0xb5, 0x40, 0x0a, 0x00,		/* 10Gbps, SSP, symmetric, tx, ID = 5 */
>  };
>  
> -static int xhci_create_usb3_bos_desc(struct xhci_hcd *xhci, char *buf,
> +/* Default sublink speed attribute of each lane */
> +static u32 ssp_cap_default_ssa[] = {
> +	0x00050034, /* USB 3.0 SS Gen1x1 id:4 symmetric rx 5Gbps */
> +	0x000500b4, /* USB 3.0 SS Gen1x1 id:4 symmetric tx 5Gbps */
> +	0x000a4035, /* USB 3.1 SSP Gen2x1 id:5 symmetric rx 10Gbps */
> +	0x000a40b5, /* USB 3.1 SSP Gen2x1 id:5 symmetric tx 10Gbps */
> +	0x00054036, /* USB 3.2 SSP Gen1x2 id:6 symmetric rx 5Gbps */
> +	0x000540b6, /* USB 3.2 SSP Gen1x2 id:6 symmetric tx 5Gbps */
> +	0x000a4037, /* USB 3.2 SSP Gen2x2 id:7 symmetric rx 10Gbps */
> +	0x000a40b7, /* USB 3.2 SSP Gen2x2 id:7 symmetric tx 10Gbps */
> +};
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
> +		if (port_cap->psi_count) {
> +			u8 num_sym_ssa = 0;
> +
> +			for (i = 0; i < port_cap->psi_count; i++) {
> +				if ((port_cap->psi[i] & PLT_MASK) == PLT_SYM)
> +					num_sym_ssa++;
> +			}
> +
> +			ssac = port_cap->psi_count + num_sym_ssa - 1;
> +			ssic = port_cap->psi_uid_count - 1;
> +		} else {
> +			if (bcdUSB >= 0x0320)
> +				ssac = 7;
> +			else
> +				ssac = 3;
> +
> +			ssic = (ssac + 1) / 2 - 1;
> +		}
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
> +		for (i = 0; i < ssac + 1; i++)
> +			ssp_cap->bmSublinkSpeedAttr[i] =
> +				cpu_to_le32(ssp_cap_default_ssa[i]);
> +
> +		min_ssid = 4;
> +		goto out;
> +	}
> +
> +	offset = 0;
> +	for (i = 0; i < port_cap->psi_count; i++) {
> +		u32 psi;
> +		u32 attr;
> +		u8 ssid;
> +		u8 lp;
> +		u8 lse;
> +		u8 psie;
> +		u16 lane_mantissa;
> +		u16 psim;
> +		u16 plt;
> +
> +		psi = port_cap->psi[i];
> +		ssid = XHCI_EXT_PORT_PSIV(psi);
> +		lp = XHCI_EXT_PORT_LP(psi);
> +		psie = XHCI_EXT_PORT_PSIE(psi);
> +		psim = XHCI_EXT_PORT_PSIM(psi);
> +		plt = psi & PLT_MASK;
> +
> +		lse = psie;
> +		lane_mantissa = psim;
> +
> +		/* Shift to Gbps and set SSP Link Protocol if 10Gpbs */
> +		for (; psie < USB_SSP_SUBLINK_SPEED_LSE_GBPS; psie++)
> +			psim /= 1000;
> +
> +		if (!min_rate || psim < min_rate) {
> +			min_ssid = ssid;
> +			min_rate = psim;
> +		}
> +
> +		/* Some host controllers don't set the link protocol for SSP */
> +		if (psim >= 10)
> +			lp = USB_SSP_SUBLINK_SPEED_LP_SSP;

Maybe we should limit the above fix to older than USB 3.2 hosts.
xHCI supporting Gen 1x2 can in theory have psim==10 even if it only supports
SS link protocol, not SSP.

I'd guess newer USB 3.2 hosts have have fixed the LP bit.  

> +
> +		/*
> +		 * PSIM and PSIE represent the total speed of PSI. The BOS
> +		 * descriptor SSP sublink speed attribute lane mantissa
> +		 * describes the lane speed. E.g. PSIM and PSIE for gen2x2
> +		 * is 20Gbps, but the BOS descriptor lane speed mantissa is
> +		 * 10Gbps. Check and modify the mantissa value to match the
> +		 * lane speed.
> +		 */
> +		if (bcdUSB == 0x0320 && plt == PLT_SYM) {
> +			/*
> +			 * The PSI dword for gen1x2 and gen2x1 share the same
> +			 * values. But the lane speed for gen1x2 is 5Gbps while
> +			 * gen2x1 is 10Gbps. If the previous PSI dword SSID is
> +			 * 5 and the PSIE and PSIM match with SSID 6, let's
> +			 * assume that the controller follows the default speed
> +			 * id with SSID 6 for gen1x2.
> +			 */
> +			if (ssid == 6 && psie == 3 && psim == 10 && i) {
> +				u32 prev = port_cap->psi[i - 1];
> +
> +				if ((prev & PLT_MASK) == PLT_SYM &&
> +				    XHCI_EXT_PORT_PSIV(prev) == 5 &&
> +				    XHCI_EXT_PORT_PSIE(prev) == 3 &&
> +				    XHCI_EXT_PORT_PSIM(prev) == 10) {
> +					lse = USB_SSP_SUBLINK_SPEED_LSE_GBPS;
> +					lane_mantissa = 5;

This is a very specific workaround designed for one default case.

> +				}
> +			}
> +
> +			if (psie == 3 && psim > 10) {
> +				lse = USB_SSP_SUBLINK_SPEED_LSE_GBPS;
> +				lane_mantissa = 10;
> +			}

So is this.

Maybe something more generic could be figured out.
If we assume that bcdUSB >= 0x0320 cases have the Link Protocol (LP) bit is set correctly,
we could do something like:

if (bcdUSB >= 0x0320)
  if (LP && psim > 10) || (!LP && (psim > 5))
    psim = psim / 2  /* divide by lane count */
        
Not sure if above pseudocode works with SSIC cases 

We are also forcing the speeds to Gbps (current code does this as well)
This is rounding down non-standard speeds. (SSIC at 2915 Mbps for example)

> +		}
> +
> +		attr = (FIELD_PREP(USB_SSP_SUBLINK_SPEED_SSID, ssid) |
> +			FIELD_PREP(USB_SSP_SUBLINK_SPEED_LP, lp) |
> +			FIELD_PREP(USB_SSP_SUBLINK_SPEED_LSE, lse) |
> +			FIELD_PREP(USB_SSP_SUBLINK_SPEED_LSM, lane_mantissa));
> +
> +		switch (plt) {
> +		case PLT_SYM:
> +			attr |= FIELD_PREP(USB_SSP_SUBLINK_SPEED_ST,
> +					   USB_SSP_SUBLINK_SPEED_ST_SYM_RX);
> +			ssp_cap->bmSublinkSpeedAttr[offset++] = cpu_to_le32(attr);
> +
> +			attr &= ~USB_SSP_SUBLINK_SPEED_ST;
> +			attr |= FIELD_PREP(USB_SSP_SUBLINK_SPEED_ST,
> +					   USB_SSP_SUBLINK_SPEED_ST_SYM_TX);
> +			ssp_cap->bmSublinkSpeedAttr[offset++] = cpu_to_le32(attr);
> +			break;
> +		case PLT_ASYM_RX:
> +			attr |= FIELD_PREP(USB_SSP_SUBLINK_SPEED_ST,
> +					   USB_SSP_SUBLINK_SPEED_ST_ASYM_RX);
> +			ssp_cap->bmSublinkSpeedAttr[offset++] = cpu_to_le32(attr);
> +			break;
> +		case PLT_ASYM_TX:
> +			attr |= FIELD_PREP(USB_SSP_SUBLINK_SPEED_ST,
> +					   USB_SSP_SUBLINK_SPEED_ST_ASYM_TX);
> +			ssp_cap->bmSublinkSpeedAttr[offset++] = cpu_to_le32(attr);
> +			break;
> +		}
> +	}
> +out:
> +	ssp_cap->wFunctionalitySupport =
> +		cpu_to_le16(FIELD_PREP(USB_SSP_MIN_SUBLINK_SPEED_ATTRIBUTE_ID,
> +				       min_ssid) |
> +			    FIELD_PREP(USB_SSP_MIN_RX_LANE_COUNT, 1) |
> +			    FIELD_PREP(USB_SSP_MIN_TX_LANE_COUNT, 1));
> +
> +	return le16_to_cpu(bos->wTotalLength);
> +}
> +
> +static __maybe_unused int xhci_create_usb3_bos_desc(struct xhci_hcd *xhci, char *buf,
>  				     u16 wLength)
>  {
>  	struct xhci_port_cap *port_cap = NULL;
> @@ -1137,7 +1370,7 @@ int xhci_hub_control(struct usb_hcd *hcd, u16 typeReq, u16 wValue,
>  		if (hcd->speed < HCD_USB3)
>  			goto error;
>  
> -		retval = xhci_create_usb3_bos_desc(xhci, buf, wLength);
> +		retval = xhci_create_usb3x_bos_desc(xhci, buf, wLength);
>  		spin_unlock_irqrestore(&xhci->lock, flags);
>  		return retval;
>  	case GetPortStatus:
> 

This is anyways a lot better than what we currently have.
Would be nice to get those xHCI PSIM values nicely converted to USB 3.x bmSuperSpeedAttr
Lane Speed Mantissa.

Otherwise everyting looks good

Thanks
-Mathias
