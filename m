Return-Path: <linux-usb+bounces-29113-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 520A0BCCB45
	for <lists+linux-usb@lfdr.de>; Fri, 10 Oct 2025 13:09:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5E19C189D903
	for <lists+linux-usb@lfdr.de>; Fri, 10 Oct 2025 11:10:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00F0B2E9754;
	Fri, 10 Oct 2025 11:09:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="D+eH0uVk"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B877624634F
	for <linux-usb@vger.kernel.org>; Fri, 10 Oct 2025 11:09:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760094577; cv=none; b=EqQq+pGbUwMYFZXnzj3SxMMXH5u1ASx/IGFZjjzvyjN9QLMdX+rvnXbYNZErpxhe7pY46pPEKjCyp0xJIjBBIr7h3xWezNbkTayzFP8MsbvMhUUahivjbWVqh5bsdoZyrFpMOyuFABdsjG7KUHgA1bi/edrh6oUcnr2M2eaBXv4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760094577; c=relaxed/simple;
	bh=Vzx0NHcs3n5xKKXaGCLh1Nxpr44wI8QMKVmwBcFJjJk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pYULVPvGplKtOzlLMteqxZpyCDnl1sd2WOp+51rPoXPhNdimpypyV8Mmp6lU5smEQbXw/4VSxmNwN4KiLAojix7h/FLER+x66pWQpzi7F3cUB/k5yrwnppprvZ5QcxBFURh3yx0Y3O/F5Ph5dsOAqUiVdVsj286dBfsjKqzW2OA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=D+eH0uVk; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760094575; x=1791630575;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=Vzx0NHcs3n5xKKXaGCLh1Nxpr44wI8QMKVmwBcFJjJk=;
  b=D+eH0uVkSO8f9cqZ7dechQEcBcVG5s1vb7woc0Mtn5or3fYO9hZ1MjO8
   +Em7LTaXDQE76mCJpUeGOLfM/VmGgXjh5sZsVAsIq4br+SnDh0vHymOWj
   mVXBh1cdHMYdEEMz/MLGQ79x7szYtGu1wFqivSBOahyyNhqdWxIDOYtl6
   gAsY+yGq6fsh1pWhQIBIBtlwHGOq4juTuRac1LHJC40jDvecsZGklwLN0
   dxskHItTnstk51Cvao9e1esR3zkghkN+546j6PWAI4CqZPdRdWilsKFc3
   rvceW6fPBbEZR77BLI7lTEdfKkxHcFGwJ43y7wNFDoofDg+EM06mVgS3A
   Q==;
X-CSE-ConnectionGUID: s/xcaCE+QnygA/gO/mgWFw==
X-CSE-MsgGUID: o5qtLV0bS/GXDH8ow5T6iw==
X-IronPort-AV: E=McAfee;i="6800,10657,11577"; a="62342002"
X-IronPort-AV: E=Sophos;i="6.19,218,1754982000"; 
   d="scan'208";a="62342002"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Oct 2025 04:09:35 -0700
X-CSE-ConnectionGUID: +Y8QDs5PQ5qmIJfd5yxaow==
X-CSE-MsgGUID: z/psGtJUSIWoatEhIF91Xw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,218,1754982000"; 
   d="scan'208";a="184986457"
Received: from abityuts-desk.ger.corp.intel.com (HELO [10.245.245.149]) ([10.245.245.149])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Oct 2025 04:09:33 -0700
Message-ID: <fffa3476-c800-4257-a3c6-057c4c8cde28@intel.com>
Date: Fri, 10 Oct 2025 14:09:30 +0300
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] xhci: dbc: prepare to expose strings through sysfs
To: =?UTF-8?Q?=C5=81ukasz_Bartosik?= <ukaszb@chromium.org>,
 Mathias Nyman <mathias.nyman@intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 =?UTF-8?Q?=C5=81ukasz_Bartosik?= <ukaszb@chromium.org>,
 Mathias Nyman <mathias.nyman@intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org
References: <20251007213902.2231670-1-ukaszb@google.com>
 <20251007213902.2231670-2-ukaszb@google.com>
Content-Language: en-US
From: Mathias Nyman <mathias.nyman@intel.com>
In-Reply-To: <20251007213902.2231670-2-ukaszb@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 10/8/25 00:38, Łukasz Bartosik wrote:
> From: Łukasz Bartosik <ukaszb@chromium.org>
> 
> Reorganize the code to prepare ground for setting serial number,
> product and manufacturer names through sysfs. This commit:
> 1. Introduces new buffers for storing serial number, product and
>     manufacturer name in utf8. The buffers will be used by sysfs
>     *_show and *_store functions.
> 2. Increases USB string descriptor data maximum length to the
>     value from USB specification (126 bytes of data).
> 3. Adds new helper functions get_str_desc_len, prepare_len
>     and xhci_dbc_populate_str_desc.
> 
> Signed-off-by: Łukasz Bartosik <ukaszb@chromium.org>

This change does in general look good to me.

It gets rid of the code duplication in current xhci_dbc_populate_strings(),
and retains new strings over suspend/resume.

I mostly have minor nitpicks regarding naming and other subjective matters

> ---
>   drivers/usb/host/xhci-dbgcap.c | 145 ++++++++++++++++++---------------
>   drivers/usb/host/xhci-dbgcap.h |  24 ++++--
>   2 files changed, 94 insertions(+), 75 deletions(-)
> 
> diff --git a/drivers/usb/host/xhci-dbgcap.c b/drivers/usb/host/xhci-dbgcap.c
> index 63edf2d8f245..c2fecaffd6f3 100644
> --- a/drivers/usb/host/xhci-dbgcap.c
> +++ b/drivers/usb/host/xhci-dbgcap.c
> @@ -124,7 +75,63 @@ static void xhci_dbc_init_ep_contexts(struct xhci_dbc *dbc)
>   	ep_ctx->deq             = cpu_to_le64(deq | dbc->ring_in->cycle_state);
>   }
>   
> -static void xhci_dbc_init_contexts(struct xhci_dbc *dbc, u32 string_length)
> +static u8 get_str_desc_len(const char *desc)
> +{
> +	return ((struct usb_string_descriptor *)desc)->bLength;
> +}
> +
> +static u32 prepare_len(struct dbc_str_descs *descs)

prepare_len() is very generic, how about something like

dbc_prepare_info_context_str_len()

> +{
> +	u32 len;
> +
> +	len = get_str_desc_len(descs->serial);
> +	len <<= 8;
> +	len += get_str_desc_len(descs->product);
> +	len <<= 8;
> +	len += get_str_desc_len(descs->manufacturer);
> +	len <<= 8;
> +	len += get_str_desc_len(descs->string0);
> +
> +	return len;
> +}
> +
> +static int xhci_dbc_populate_str_desc(char *desc, const char *src)
> +{
> +	struct usb_string_descriptor	*s_desc;
> +	int				utf16_len;
> +
> +	s_desc = (struct usb_string_descriptor *)desc;
> +	utf16_len = utf8s_to_utf16s(src, strlen(src), UTF16_LITTLE_ENDIAN,
> +				    (wchar_t *)s_desc->wData, USB_MAX_STRING_LEN);

The "utf16_len" got me confused.
It's not wrong, but I first assumed it is bytes this utf16 formatted text
takes, when it turns out to be number of u16 entries in the text.

> +	if (utf16_len < 0)
> +		return utf16_len;
> +
> +	s_desc->bLength		= utf16_len * 2 + 2;
> +	s_desc->bDescriptorType	= USB_DT_STRING;
> +
> +	return s_desc->bLength;
> +}
> +
> +static void xhci_dbc_populate_str_descs(struct dbc_str_descs *str_descs,
> +					struct dbc_str *str)
> +{
> +	/* Serial string: */
> +	xhci_dbc_populate_str_desc(str_descs->serial, str->serial);
> +
> +	/* Product string: */
> +	xhci_dbc_populate_str_desc(str_descs->product, str->product);
> +
> +	/* Manufacturer string: */
> +	xhci_dbc_populate_str_desc(str_descs->manufacturer, str->manufacturer);
> +
> +	/* String0: */
> +	str_descs->string0[0]	= 4;
> +	str_descs->string0[1]	= USB_DT_STRING;
> +	str_descs->string0[2]	= 0x09;
> +	str_descs->string0[3]	= 0x04;
> +}

> @@ -1314,6 +1320,11 @@ xhci_alloc_dbc(struct device *dev, void __iomem *base, const struct dbc_driver *
>   	dbc->bInterfaceProtocol = DBC_PROTOCOL;
>   	dbc->poll_interval = DBC_POLL_INTERVAL_DEFAULT;
>   
> +	/* initialize serial, product and manufacturer with default values */
> +	memcpy(dbc->str.serial, DBC_STRING_SERIAL, strlen(DBC_STRING_SERIAL)+1);
> +	memcpy(dbc->str.product, DBC_STRING_PRODUCT, strlen(DBC_STRING_PRODUCT)+1);
> +	memcpy(dbc->str.manufacturer, DBC_STRING_MANUFACTURER, strlen(DBC_STRING_MANUFACTURER)+1);
> +

Maybe it would be cleaner to just define a default struct for the strings and assign it here.
We could get rid of the #define  DBC_STRING_* from the header as well.

i.e.:

static const struct dbc_str dbc_str_default = {
	.manufacturer = "Linux Foundation",
	.product = "Linux USB Debug Target",
	.serial = "0001",
};

xhci_alloc_dbc(..)
{
	...
	/* initialize serial, product and manufacturer with default values */
	dbc->str = dbc_str_default;
}>   	if (readl(&dbc->regs->control) & DBC_CTRL_DBC_ENABLE)
>   		goto err;
>   
> diff --git a/drivers/usb/host/xhci-dbgcap.h b/drivers/usb/host/xhci-dbgcap.h
> index 47ac72c2286d..0e6addafea6c 100644
> --- a/drivers/usb/host/xhci-dbgcap.h
> +++ b/drivers/usb/host/xhci-dbgcap.h
> @@ -47,7 +47,6 @@ struct dbc_info_context {
>   #define DBC_DOOR_BELL_TARGET(p)		(((p) & 0xff) << 8)
>   
>   #define DBC_MAX_PACKET			1024
> -#define DBC_MAX_STRING_LENGTH		64
>   #define DBC_STRING_MANUFACTURER		"Linux Foundation"
>   #define DBC_STRING_PRODUCT		"Linux USB Debug Target"
>   #define DBC_STRING_SERIAL		"0001"
> @@ -63,11 +62,19 @@ struct dbc_info_context {
>   #define DBC_PORTSC_LINK_CHANGE		BIT(22)
>   #define DBC_PORTSC_CONFIG_CHANGE	BIT(23)
>   
> +#define USB_MAX_STRING_DESC_LEN		(USB_MAX_STRING_LEN + 2)

This looks like somthing that would be defined in ch9.h or usb.h.

Maybe a more local name like DBC_MAX_STRING_DESC_LEN


> +
>   struct dbc_str_descs {
> -	char	string0[DBC_MAX_STRING_LENGTH];
> -	char	manufacturer[DBC_MAX_STRING_LENGTH];
> -	char	product[DBC_MAX_STRING_LENGTH];
> -	char	serial[DBC_MAX_STRING_LENGTH];
> +	char	string0[USB_MAX_STRING_DESC_LEN];
> +	char	manufacturer[USB_MAX_STRING_DESC_LEN];
> +	char	product[USB_MAX_STRING_DESC_LEN];
> +	char	serial[USB_MAX_STRING_DESC_LEN];
> +};
> +
> +struct dbc_str {> +	char	manufacturer[USB_MAX_STRING_LEN/2+1];
> +	char	product[USB_MAX_STRING_LEN/2+1];
> +	char	serial[USB_MAX_STRING_LEN/2+1];
>   };

Maybe some comment above to clarify the odd size

/* utf8 strings used to create the USB_MAX_STRING_LEN utf16 string descriptors */

Thanks
Mathias


