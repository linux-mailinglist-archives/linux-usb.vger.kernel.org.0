Return-Path: <linux-usb+bounces-37037-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yPWbAI6v+2n0fgMAu9opvQ
	(envelope-from <linux-usb+bounces-37037-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 06 May 2026 23:15:58 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EA514E0878
	for <lists+linux-usb@lfdr.de>; Wed, 06 May 2026 23:15:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A036A301A43A
	for <lists+linux-usb@lfdr.de>; Wed,  6 May 2026 21:15:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 36AFA3264CE;
	Wed,  6 May 2026 21:15:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pVduZtte"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4920D27A916
	for <linux-usb@vger.kernel.org>; Wed,  6 May 2026 21:15:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778102152; cv=none; b=L9eHJKrnxdL7ReFvGw2wMPhUXG3w6ZCkZOIzM43mlg5BLROjrUThHiObLcRDp4ROkpZ88/MPwoiBTSzrTX/A6c4jbcKTwnxJLTbV/cnamnriHa1vfM8sIsxBc0skOZyHeGjKWlSltheusPKFPYj+X+PzbYk6QOxBkGNG3L8XTXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778102152; c=relaxed/simple;
	bh=XJ+ClloHWiI0i5J2IlI8HTRqFze+Mzaf6cGh67jqqyQ=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Rg/LV9l+3vnqXMctgu+ejnF1xvCCAtT8yMUiAzHEVkSdJcFqHCasgPoAtv+lHk1tp23kaU+aP+abqT115qO4n/npLpuXczpFL5nGhesbSc8vao213wDLrftPMLnIGCbtTi1krhWYTtSP9LkbLICVdknqcuWrdm9W/poQyHmrFyA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pVduZtte; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-48a3e9862f0so826505e9.1
        for <linux-usb@vger.kernel.org>; Wed, 06 May 2026 14:15:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778102150; x=1778706950; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7dYoXiHUjmlP1m7cdWazf6GqkiJYUjvpbDWQPXdu5Sc=;
        b=pVduZttedmhabjDK5FLrNmbk8z7fdAVObc7mTB3g2BrzmIRXZx5OXv2y2+q0CK0ItT
         OMXopLE/sUZOOezw+ZJ/cEWU7jbY/fxxB+oETvd/LioVYLy9kyWW2Egd4Im453batCGF
         Nag7HTFL2CAx1KuHbsyYKQAJTSLB8eueqJvV0fU6wTiB3Tzbtc8tDMzpmWbidmtQhpuU
         gYKWzxgnlWZrDOAxJ4s9KTJTfPqtgu8onui8kbaSetIzJVyYyv0uplapm6GqXxZ84gS3
         nWDLTJc3LwzcbKIdtFUREZQSUDbaMebkCc/2v1C/RozMLzJ8scrVHIp8Z5/LUlQoNNsI
         To+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778102150; x=1778706950;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7dYoXiHUjmlP1m7cdWazf6GqkiJYUjvpbDWQPXdu5Sc=;
        b=tWLyJ2VBpIGkr0jdFEs6H8+iqcFSuN4IfgyIzVSmtJv0+ZCLPOr8KLpHhIEdqZ4l/K
         Xrcq50Yk/GpZMLacZd1FJGuMNfQUJ79wbRggzrMtawKpIZe0WVWuunSXJGe10cNA8sYA
         qUAT1qq49pl/bGv0p5Up9Po2jZVuVQ1rOoDk12Fj+f7BwHSWwRu7WHNuTSHnNXbJwl2U
         cb+ezW6g9ZNtD97EPCKmLENmig2SDCrlcIsiXxkgWrv7TZR1ip3qpWu9RkUpScgY+mNt
         voJcsIUveKQvL60XQ+87DvFrIAJJyx3mSGfwRMv7kVqAPp8cPL0hQ7oc+V9Cc7VNuZ+9
         1xtQ==
X-Forwarded-Encrypted: i=1; AFNElJ/bJTWVjn4CGHEaYvL1qUfkIh6VkZWHgykBKXWcs+RdwIJwfKg70mO13yDzLSFakoYFw/2jS5C/Z4I=@vger.kernel.org
X-Gm-Message-State: AOJu0YxaPtWFt5xNHuzk7aM7wjDtZXPKKMGmJvuuPR6PvxknfMvoARWd
	G6ydaor6tIIxcgS9ljSCQLkWG8JRKWfMWIEaavgZqnn39yQ0EiuCmQqo
X-Gm-Gg: AeBDietyz35nulcymdw0ScX16qTXigoykX43ALnXAPv2/qNilhbbo6MyQ8J4kzIYo3O
	CQ836Me8tXhBEwGENa+RsS5+ofgzdm0k+qE62IptCUqPVlie0fG39y1uPziZJkDCZRXsiaw78g2
	uzUphmJPD6f1MBhuYYUVmxF4rd61aC9oha54wRXAyyFFfIjG3IxrcjcgDkqZAv8XsHlpsMtvjW4
	ng7G0JRrUzzZ2skTGNmur3PtF8FuPHMwhviygDO38PYMj7DsbVPVNLfqD6qfoZKlQc6b3VJipVd
	iV30dNYycyOAET4YMuErj/xxdsfj8CmZpjC2TmdButZ1a1Ev/U5i7J59oyk6YgpmWyZD39YkHqP
	HVjx2Y5YF9L1rlGxk0Mo0Ohqf57xpvYGzHIUG/rUNMBJOy6F7CrryAL7uXFDVfT07PvM6vx6Xf9
	2DV2epWpS1pRGvY6lPGCzmltDwZ2zgYy0ZRidv+QPIkf027Q==
X-Received: by 2002:a05:600c:4e56:b0:489:1abb:5559 with SMTP id 5b1f17b1804b1-48e5dfd6508mr2974885e9.5.1778102149531;
        Wed, 06 May 2026 14:15:49 -0700 (PDT)
Received: from foxbook (bgt227.neoplus.adsl.tpnet.pl. [83.28.83.227])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e530c5dfcsm23661205e9.14.2026.05.06.14.15.48
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Wed, 06 May 2026 14:15:49 -0700 (PDT)
Date: Wed, 6 May 2026 23:15:41 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: Jihong Min <hurryman2212@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Mathias Nyman
 <mathias.nyman@intel.com>, Guenter Roeck <linux@roeck-us.net>, Jonathan
 Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, Mario
 Limonciello <mario.limonciello@amd.com>, Basavaraj Natikar
 <Basavaraj.Natikar@amd.com>, linux-usb@vger.kernel.org,
 linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] usb: xhci-pci: add generic auxiliary device
 interface
Message-ID: <20260506231541.32f88ce1.michal.pecio@gmail.com>
In-Reply-To: <3f26994ebb5f0e4e653a8108a9626bc793148679.1778099627.git.hurryman2212@gmail.com>
References: <20260506032939.92351-1-hurryman2212@gmail.com>
	<cover.1778099627.git.hurryman2212@gmail.com>
	<3f26994ebb5f0e4e653a8108a9626bc793148679.1778099627.git.hurryman2212@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 6EA514E0878
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-37037-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[13];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michalpecio@gmail.com,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]

On Thu,  7 May 2026 05:40:33 +0900, Jihong Min wrote:
> Some xHCI PCI controllers expose controller-specific functionality that is
> not part of generic xHCI operation and is better handled by optional child
> drivers in other subsystems. Add a small auxiliary device registration path
> for selected xHCI PCI controllers.
> 
> The initial table creates an xhci_pci.hwmon auxiliary device for AMD
> 1022:43fd controllers. Store the created auxiliary device in devres so the
> xhci-pci remove path destroys it before HCD teardown. Use a
> PCI-domain-qualified id so auxiliary device names remain unique across PCI
> domains.
> 
> This keeps xhci-pci responsible only for publishing selected controller
> functions while allowing subsystem-specific drivers to bind through the
> auxiliary bus.
> 
> Assisted-by: Codex:gpt-5.5
> Signed-off-by: Jihong Min <hurryman2212@gmail.com>
> ---
>  drivers/usb/host/Kconfig    |  10 ++++
>  drivers/usb/host/xhci-pci.c | 114 ++++++++++++++++++++++++++++++++++++
>  2 files changed, 124 insertions(+)
> 
> diff --git a/drivers/usb/host/Kconfig b/drivers/usb/host/Kconfig
> index 0a277a07cf70..e0c2c7ac5c97 100644
> --- a/drivers/usb/host/Kconfig
> +++ b/drivers/usb/host/Kconfig
> @@ -42,6 +42,16 @@ config USB_XHCI_PCI
>  	depends on USB_PCI
>  	default y
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
>  config USB_XHCI_PCI_RENESAS
>  	tristate "Support for additional Renesas xHCI controller with firmware"
>  	depends on USB_XHCI_PCI
> diff --git a/drivers/usb/host/xhci-pci.c b/drivers/usb/host/xhci-pci.c
> index 585b2f3117b0..1ab27d2182eb 100644
> --- a/drivers/usb/host/xhci-pci.c
> +++ b/drivers/usb/host/xhci-pci.c
> @@ -8,6 +8,8 @@
>   * Some code borrowed from the Linux EHCI driver.
>   */
>  
> +#include <linux/auxiliary_bus.h>
> +#include <linux/device/devres.h>
>  #include <linux/pci.h>
>  #include <linux/slab.h>
>  #include <linux/module.h>
> @@ -103,6 +105,114 @@ static int xhci_pci_run(struct usb_hcd *hcd);
>  static int xhci_pci_update_hub_device(struct usb_hcd *hcd, struct usb_device *hdev,
>  				      struct usb_tt *tt, gfp_t mem_flags);
>  
> +#if IS_ENABLED(CONFIG_USB_XHCI_PCI_AUXDEV)
> +static const struct {
> +	struct pci_device_id id;
> +	const char *aux_dev_name;
> +} pci_ids_have_aux[] = {
> +	{
> +		.id = { PCI_DEVICE(PCI_VENDOR_ID_AMD, 0x43fd) }, /* PROM21 xHCI */
> +		.aux_dev_name = "hwmon",
> +	},
> +	{ /* end: all zeroes */ }
> +};
> +
> +struct xhci_pci_aux_devres {
> +	struct auxiliary_device *auxdev;
> +};
> +
> +static bool xhci_pci_aux_match_id(const struct pci_device_id *id,
> +				  const struct pci_dev *pdev)
> +{
> +	if (id->vendor != PCI_ANY_ID && id->vendor != pdev->vendor)
> +		return false;
> +	if (id->device != PCI_ANY_ID && id->device != pdev->device)
> +		return false;
> +	if (id->subvendor != PCI_ANY_ID &&
> +	    id->subvendor != pdev->subsystem_vendor)
> +		return false;
> +	if (id->subdevice != PCI_ANY_ID &&
> +	    id->subdevice != pdev->subsystem_device)
> +		return false;
> +
> +	return !((id->class ^ pdev->class) & id->class_mask);
> +}
> +
> +static const char *xhci_pci_aux_dev_name(struct pci_dev *pdev)
> +{
> +	int i;
> +
> +	for (i = 0; pci_ids_have_aux[i].aux_dev_name; i++) {
> +		if (xhci_pci_aux_match_id(&pci_ids_have_aux[i].id, pdev))
> +			return pci_ids_have_aux[i].aux_dev_name;
> +	}
> +
> +	return NULL;
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
> +#else
> +static inline void xhci_pci_try_add_aux_device(struct pci_dev *pdev)
> +{
> +}
> +
> +static inline void xhci_pci_try_remove_aux_device(struct pci_dev *pdev)
> +{
> +}
> +#endif
> +
>  static const struct xhci_driver_overrides xhci_pci_overrides __initconst = {
>  	.reset = xhci_pci_setup,
>  	.start = xhci_pci_run,
> @@ -677,6 +787,8 @@ int xhci_pci_common_probe(struct pci_dev *dev, const struct pci_device_id *id)
>  	if (device_property_read_bool(&dev->dev, "ti,pwron-active-high"))
>  		pci_clear_and_set_config_dword(dev, 0xE0, 0, 1 << 22);
>  
> +	xhci_pci_try_add_aux_device(dev);

Is it considered acceptable to add

	if (IS_ENABLED(CONFIG_USB_XHCI_PCI_AUXDEV))

before this call, remove #ifdef around the definitions of the auxdev
functions and rely on dead code elimination to clean them up?

We already have a similar trick with CONFIG_USB_XHCI_PCI_RENESAS here
and it seemed to be working, though the amount of conditional code is
much lower and so is the potential risk.

The reason for doing it this way was because Greg doesn't like #ifdefs
in .c files, and neither do static analyzers like them.

> +
>  	return 0;
>  
>  put_usb3_hcd:
> @@ -713,6 +825,8 @@ void xhci_pci_remove(struct pci_dev *dev)
>  	xhci = hcd_to_xhci(pci_get_drvdata(dev));
>  	set_power_d3 = xhci->quirks & XHCI_SPURIOUS_WAKEUP;
>  
> +	xhci_pci_try_remove_aux_device(dev);
> +
>  	xhci->xhc_state |= XHCI_STATE_REMOVING;
>  
>  	if (pci_choose_state(dev, PMSG_SUSPEND) == PCI_D0)
> -- 
> 2.53.0
> 

