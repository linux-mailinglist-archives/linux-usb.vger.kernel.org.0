Return-Path: <linux-usb+bounces-37074-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QEBJJwZc/GkOOwAAu9opvQ
	(envelope-from <linux-usb+bounces-37074-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 07 May 2026 11:31:50 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 910D14E5F37
	for <lists+linux-usb@lfdr.de>; Thu, 07 May 2026 11:31:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id D4495300B8F4
	for <lists+linux-usb@lfdr.de>; Thu,  7 May 2026 09:31:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D183F3C1414;
	Thu,  7 May 2026 09:31:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="G8CoT6M5"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C36F0175A6E;
	Thu,  7 May 2026 09:31:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778146295; cv=none; b=Q93hRvHscN0MHTcVMYqz3jruQZuK6i8iG+EPgKjeoIWvYkHivirLNiJVn/9hyPJd7gD9OlFCFxcPlEvWEjd+R0oiUFbLr8HKU/EIB19orwRY79T2racbXGrW84UlrN+H8h8qtYZCguJqxUpDlAy71RMIpTPhY/Sr26lsGg2cxNE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778146295; c=relaxed/simple;
	bh=fnl5fISQxFrCK/lisBXUvoXxWWrrbQLIv9INB6mUopQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BUtWia4YISdcG6hfYKK6LBJpNiyQMZTgtNArT268G2vpCH73xKwraecGtxMTCBpDwu+lcDkKSIwUsfGMC9Egc6H9DYAid5DB7tNe9A8XEHkuRMNEufxlHwHqVBLrDL//immbanFo4qIJr41ncsJvLVhB+20LA4VvRplM9IhNZXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=G8CoT6M5; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778146294; x=1809682294;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=fnl5fISQxFrCK/lisBXUvoXxWWrrbQLIv9INB6mUopQ=;
  b=G8CoT6M5mhOZwG0BMo1G/n8/+XwOLL7D6s9za2GYDqDpIMsd52Z8I5d5
   f46JduFonIh4zpdOmri3b5YcTbd0p+thiPBQ42LMAYzbvHkT11rdupywx
   lzFjOFtIpDezwHZdQofgIjUap/iC9UWyd+DzelgOTL3CpfsQlXdhxibmW
   TxhNrIurhmx5VWvCliiN4+3quIa4Nb8uB0VBndIXwPuy45MpAyfWjMlgK
   IWCODWctuA2w4UcZQrM08xUPb9DwfhVDxLX8cWlKWlDI1o7KcvzODx+a2
   kQXvuSAOaZp2jFP2Q2L0Asp31LqLP/o1K7DzgSndzG134wxHTH2cYRXXN
   A==;
X-CSE-ConnectionGUID: m3P1y2DwTTiNGe6d073xxA==
X-CSE-MsgGUID: +gN0SbMDS3SJTp4idMxw+A==
X-IronPort-AV: E=McAfee;i="6800,10657,11778"; a="101767607"
X-IronPort-AV: E=Sophos;i="6.23,221,1770624000"; 
   d="scan'208";a="101767607"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2026 02:31:33 -0700
X-CSE-ConnectionGUID: 792qLpIHSgKnVzg2h56TEQ==
X-CSE-MsgGUID: B+lUKi63TAuujGLUo71Fkg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,221,1770624000"; 
   d="scan'208";a="241410896"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO [10.245.245.122]) ([10.245.245.122])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2026 02:31:27 -0700
Message-ID: <a5739875-b8a5-4918-8850-fa4b32d5279d@linux.intel.com>
Date: Thu, 7 May 2026 12:31:24 +0300
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] usb: xhci-pci: add generic auxiliary device
 interface
To: Jihong Min <hurryman2212@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Mathias Nyman <mathias.nyman@intel.com>
Cc: Guenter Roeck <linux@roeck-us.net>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>,
 Mario Limonciello <mario.limonciello@amd.com>,
 Basavaraj Natikar <Basavaraj.Natikar@amd.com>, linux-usb@vger.kernel.org,
 linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org
References: <cover.1778123510.git.hurryman2212@gmail.com>
 <effa7bd7bef8a8ea28b9e28fe47af6a58e39edf2.1778123510.git.hurryman2212@gmail.com>
Content-Language: en-US
From: Mathias Nyman <mathias.nyman@linux.intel.com>
In-Reply-To: <effa7bd7bef8a8ea28b9e28fe47af6a58e39edf2.1778123510.git.hurryman2212@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 910D14E5F37
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-37074-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,linuxfoundation.org,intel.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mathias.nyman@linux.intel.com,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,intel.com:dkim,linux.intel.com:mid]
X-Rspamd-Action: no action

On 5/7/26 06:31, Jihong Min wrote:
> Some xHCI PCI controllers expose controller-specific functionality that is
> not part of generic xHCI operation and is better handled by optional child
> drivers in other subsystems. Add a small auxiliary device registration path
> for selected xHCI PCI controllers.
> 
> The initial PCI ID match table lists AMD Promontory 21 (PROM21) 1022:43fd
> controllers. For matching controllers, xhci-pci creates an auxiliary
> device and stores it in devres so the remove path destroys it before HCD
> teardown.
> 
> Subsystem-specific child drivers can then bind to those devices through
> the auxiliary bus and keep their hardware-specific logic outside xhci-pci.
> 
> Assisted-by: Codex:gpt-5.5
> Signed-off-by: Jihong Min <hurryman2212@gmail.com>
> ---
>   drivers/usb/host/Kconfig    | 10 +++++
>   drivers/usb/host/xhci-pci.c | 83 +++++++++++++++++++++++++++++++++++++
>   2 files changed, 93 insertions(+)
> 
> diff --git a/drivers/usb/host/Kconfig b/drivers/usb/host/Kconfig
> index 0a277a07cf70..e0c2c7ac5c97 100644
> --- a/drivers/usb/host/Kconfig
> +++ b/drivers/usb/host/Kconfig
> @@ -42,6 +42,16 @@ config USB_XHCI_PCI
>   	depends on USB_PCI
>   	default y
>   
> +config USB_XHCI_PCI_AUXDEV
> +	bool "xHCI PCI auxiliary device support"
> +	depends on USB_XHCI_PCI
> +	select AUXILIARY_BUS
> +	help
> +	  This enables xHCI PCI support for registering auxiliary devices
> +	  for selected controllers. It is used by optional child drivers
> +	  that bind to xHCI PCI controller-specific functionality through
> +	  the auxiliary bus.
> +
>   config USB_XHCI_PCI_RENESAS
>   	tristate "Support for additional Renesas xHCI controller with firmware"
>   	depends on USB_XHCI_PCI
> diff --git a/drivers/usb/host/xhci-pci.c b/drivers/usb/host/xhci-pci.c
> index 585b2f3117b0..618d6840e108 100644
> --- a/drivers/usb/host/xhci-pci.c
> +++ b/drivers/usb/host/xhci-pci.c
> @@ -8,6 +8,8 @@
>    * Some code borrowed from the Linux EHCI driver.
>    */
>   
> +#include <linux/auxiliary_bus.h>
> +#include <linux/device/devres.h>
>   #include <linux/pci.h>
>   #include <linux/slab.h>
>   #include <linux/module.h>
> @@ -80,6 +82,7 @@
>   #define PCI_DEVICE_ID_AMD_RAVEN_15E1_XHCI		0x15e1
>   #define PCI_DEVICE_ID_AMD_RAVEN2_XHCI			0x15e5
>   #define PCI_DEVICE_ID_AMD_RENOIR_XHCI			0x1639
> +#define PCI_DEVICE_ID_AMD_PROM21_XHCI			0x43fd
>   #define PCI_DEVICE_ID_AMD_PROMONTORYA_4			0x43b9
>   #define PCI_DEVICE_ID_AMD_PROMONTORYA_3			0x43ba
>   #define PCI_DEVICE_ID_AMD_PROMONTORYA_2			0x43bb
> @@ -103,6 +106,80 @@ static int xhci_pci_run(struct usb_hcd *hcd);
>   static int xhci_pci_update_hub_device(struct usb_hcd *hcd, struct usb_device *hdev,
>   				      struct usb_tt *tt, gfp_t mem_flags);
>   
> +static const struct pci_device_id pci_ids_have_aux[] = {
> +	{ PCI_DEVICE_DATA(AMD, PROM21_XHCI, "prom21_hwmon") },
> +	{ /* end: all zeroes */ }
> +};
> +
> +struct xhci_pci_aux_devres {
> +	struct auxiliary_device *auxdev;
> +};
> +
> +static const char *xhci_pci_aux_dev_name(struct pci_dev *pdev)
> +{
> +	const struct pci_device_id *id;
> +
> +	id = pci_match_id(pci_ids_have_aux, pdev);
> +	if (!id)
> +		return NULL;
> +
> +	return (const char *)id->driver_data;
> +}
> +
> +static void xhci_pci_aux_devres_release(struct device *dev, void *res)
> +{
> +	struct xhci_pci_aux_devres *devres = res;
> +
> +	if (devres->auxdev)
> +		auxiliary_device_destroy(devres->auxdev);
> +}
> +
> +static void xhci_pci_try_add_aux_device(struct pci_dev *pdev)
> +{
> +	struct xhci_pci_aux_devres *devres;
> +	struct auxiliary_device *auxdev;
> +	const char *aux_dev_name;
> +
> +	aux_dev_name = xhci_pci_aux_dev_name(pdev);
> +	if (!aux_dev_name)
> +		return;
> +
> +	devres = devres_alloc(xhci_pci_aux_devres_release, sizeof(*devres),
> +			      GFP_KERNEL);
> +	if (!devres) {
> +		dev_warn(&pdev->dev,
> +			 "failed to allocate auxiliary device state\n");
> +		return;
> +	}
> +
> +	auxdev = auxiliary_device_create(&pdev->dev, KBUILD_MODNAME,
> +					 aux_dev_name, NULL,
> +					 (pci_domain_nr(pdev->bus) << 16) |
> +						 pci_dev_id(pdev));
> +	if (!auxdev) {
> +		devres_free(devres);
> +		dev_warn(&pdev->dev, "failed to add %s auxiliary device\n",
> +			 aux_dev_name);
> +		return;
> +	}
> +
> +	devres->auxdev = auxdev;
> +	devres_add(&pdev->dev, devres);
> +}
> +
> +static void xhci_pci_try_remove_aux_device(struct pci_dev *pdev)
> +{
> +	struct xhci_pci_aux_devres *devres;
> +
> +	devres = devres_find(&pdev->dev, xhci_pci_aux_devres_release, NULL,
> +			     NULL);
> +	if (!devres || !devres->auxdev)
> +		return;
> +
> +	auxiliary_device_destroy(devres->auxdev);
> +	devres->auxdev = NULL;
> +}
> +
>   static const struct xhci_driver_overrides xhci_pci_overrides __initconst = {
>   	.reset = xhci_pci_setup,
>   	.start = xhci_pci_run,
> @@ -677,6 +754,9 @@ int xhci_pci_common_probe(struct pci_dev *dev, const struct pci_device_id *id)
>   	if (device_property_read_bool(&dev->dev, "ti,pwron-active-high"))
>   		pci_clear_and_set_config_dword(dev, 0xE0, 0, 1 << 22);
>   
> +	if (IS_ENABLED(CONFIG_USB_XHCI_PCI_AUXDEV))
> +		xhci_pci_try_add_aux_device(dev);
> +
>   	return 0;

I think this should be turned around so that the vendor specific code calls the common code.
xhci-pci-renesas.c does this nicely.

In your case it would be adding something like a xhci-pci-prom21.c pci driver:

xhci_pci_prom21_probe(struct pci_dev *dev, const struct pci_device_id *id)
{
	crate_auxiliary_device(dev);
	return xhci_pci_common_probe(dev, id);
}

xhci_pci_prom21_remove(struct pci_dev *dev)
{
	destroy_auxiliary_device(dev);
	xhci_pci_remove(dev);
}

static const struct pci_device_id pci_ids[] = {
	{ PCI_DEVICE(YOUR_AMD_PCI_VENDOR_ID, YOUR_PROM21_DEVICE_ID) },
	{ /* end: all zeroes */ }
};
MODULE_DEVICE_TABLE(pci, pci_ids);

static struct pci_driver xhci_prom21_pci_driver = {
	.name =		"xhci-pci-prom21",
	.id_table =	pci_ids,

	.probe =	xhci_pci_prom21_probe,
	.remove =	xhci_pci_prom21_remove,

	.shutdown = 	usb_hcd_pci_shutdown,
	.driver = {
		.pm = pm_ptr(&usb_hcd_pci_pm_ops),
	},
};
module_pci_driver(xhci_prom21_pci_driver);

MODULE_DESCRIPTION("AMD Promontory 21 xHCI PCI Host Controller Driver");
MODULE_IMPORT_NS("xhci");
MODULE_LICENSE("GPL v2");

-Mathias

