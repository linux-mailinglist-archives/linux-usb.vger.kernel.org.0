Return-Path: <linux-usb+bounces-36293-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KLwSGIYE4mmQ0gAAu9opvQ
	(envelope-from <linux-usb+bounces-36293-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Fri, 17 Apr 2026 11:59:34 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9088A419CB7
	for <lists+linux-usb@lfdr.de>; Fri, 17 Apr 2026 11:59:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1717631A1949
	for <lists+linux-usb@lfdr.de>; Fri, 17 Apr 2026 09:45:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE46C38F22E;
	Fri, 17 Apr 2026 09:45:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uZWCemRj"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C44D372B31;
	Fri, 17 Apr 2026 09:45:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776419112; cv=none; b=cjBReiYNwLVtpFZDYXr5Xck12ffTJ4AAEgmMpIEwrXHpKDoy0MaZZOwmL+paA+eHaL7+xbPh2v6bBViXFdrPmbIULZvUG0S4c0xsTK5G696OBXf0Enj2Bk1iK04Th3JQVI5nHiDbAhiBjkP/bChTnx3rLuyEPj1fmuyy0Q4aDko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776419112; c=relaxed/simple;
	bh=TjlOm6QPktLU6GL/2R28tU2LM4RxDKCNP1yrBM/3Xsk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tq2zPOv691NDG82T5H1iXI55LfeaQ+rj5vyUQUzTnxWD7CzsTY+H+yQtI+IDbGIIZLe8Xqlx7HYR3gCEjFdQzFkt5+vWYk9ErB7oSI5SPtxd/35GuocK+VHTVkTPpSrpELSdvN0bgem9ykM1daepdzJ1E3T2YW/Y1433TNBcnes=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uZWCemRj; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5832C19425;
	Fri, 17 Apr 2026 09:45:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776419112;
	bh=TjlOm6QPktLU6GL/2R28tU2LM4RxDKCNP1yrBM/3Xsk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uZWCemRjo96fw9wk+avb7r6fVFNevzp7ywGiUMS0GojgHYJzclNjQwfV64ocLPCGe
	 4bpkBISocUmY7pDDw7WqWgV7eo3bHcQKgT8uWZ041vbhXHdQPWoG3y/l8gW5p1Q+Rr
	 X7JKTm7T1EDSxBdt0SXneF4dqezNt5UIfufiaHzYryWtPp493ICRTQUq8z8M70M+TG
	 dsrPYIfdnqQNXJY7Y64j8CkPWGKk4gKtpS13GPWJqTQxKGX6nrCKorSi7gOztxxQDx
	 2RI4dOioEYVcBl9f26tvpWOa4OVOq7iVfoEj3Oy2xXg0Lac4+FqoOloq2OlsalUoX/
	 9FuYZXfnfHBYg==
Date: Fri, 17 Apr 2026 17:45:08 +0800
From: "Peter Chen (CIX)" <peter.chen@kernel.org>
To: Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Arnd Bergmann <arnd@kernel.org>, Pawel Laszczak <pawell@cadence.com>,
	Roger Quadros <rogerq@kernel.org>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: cdns3: attempt to fix Kconfig dependencies
Message-ID: <aeIBJAPg52jvEY6y@nchen-desktop>
References: <20260402141008.2691819-1-arnd@kernel.org>
 <ac9xVUVB/BKfBUmE@nchen-desktop>
 <26779a33-135a-4881-8614-9987c5e90380@app.fastmail.com>
 <ac+H2dzj5t1JJJd5@nchen-desktop>
 <e650e6c7-bd19-4c35-bcd2-0c53178feb8e@app.fastmail.com>
 <adMMm5kS3PR5CHFB@nchen-desktop>
 <51c96cbd-1d46-47ff-b553-5b81efd39067@app.fastmail.com>
 <aeDLUpWuhBAu8XXW@nchen-desktop>
 <cb70271c-3ddb-422c-bf24-1cf019473f7e@app.fastmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <cb70271c-3ddb-422c-bf24-1cf019473f7e@app.fastmail.com>
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-36293-lists,linux-usb=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[peter.chen@kernel.org,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 9088A419CB7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 26-04-16 15:19:06, Arnd Bergmann wrote:
> Hi Peter,
> 
> I agree that this will stay a little awkward due to the currently
> defined DT binding, but I would expect that even for the driver
> itself, the normal way to handle this becomes simpler rather
> than adding problems. E.g. the use of DMA on the child device
> is rather questionable since the parent device is the actual
> DMA master, and any properties defining how DMA works on
> the parent bus (dma-ranges, iommu, ...) don't directly propagate
> to the cdns3 device when that bypasses the normal platform
> device probing.

Hi Arnd,

I agree the parent device (SoC glue layer) is the direct interface to
system bus, and child device (IP) is in it at SoC architecture. For USB
IP driver, it may not consider well for it, eg, dwc3/cdns3/chipidea.
So, there are below code for this consideration.

	dwc->sysdev_is_parent = device_property_read_bool(dev,
				"linux,sysdev_is_parent");
	if (dwc->sysdev_is_parent)
		dwc->sysdev = dwc->dev->parent;
	else
		dwc->sysdev = dwc->dev;

For PCIe, it uses the architecture you suggested that is the
IP part works like library and SoC glue layer is the only struct device.

> 
> > When something (e.g. Type-C/connector path) tries to resolve
> > a "usb-role-switch" connection, the match callback does:
> >
> > static void *usb_role_switch_match(const struct fwnode_handle *fwnode,
> > 	       	const char *id,
> > 		void *data)
> > {
> > 	struct device *dev;
> > 	if (id && !fwnode_property_present(fwnode, id))
> > 		return NULL;
> > 	dev = class_find_device_by_fwnode(&role_class, fwnode);
> > 	return dev ? to_role_switch(dev) : ERR_PTR(-EPROBE_DEFER);
> > }
> >
> > class_find_device_by_fwnode() ultimately uses device_match_fwnode,
> > which is pointer equality on dev_fwnode(dev):
> >
> > int device_match_fwnode(struct device *dev, const void *fwnode)
> > {
> > 	return fwnode && dev_fwnode(dev) == fwnode;
> > }
> >
> > So the only role switch that matches is one whose registered sw->dev has
> > dev_fwnode(&sw->dev) equal to the fwnode passed into usb_role_switch_match()
> > (whatever the graph/connection layer produced for that link often is 
> >  cdns,usb3 child, but not the SoC glue parent).
> 
> Could the callers of usb_role_switch_get() change to calling
> fwnode_usb_role_switch_get() instead? It looks like that
> already handles the case of an device node without a struct device
> attached to it.

Thanks for the pointer. I will trace the call paths that matter for cdns3
(and any Type-C/connector helpers we rely on) and see where we can switch
to the fwnode variant without breaking existing boards.

> 
> > So we are not arguing for "DT for documentation only"; we need the child
> > platform device as the anchor that matches the IP node and the properties
> > that the Cadence DRD code actually consumes.
> 
> I'm not convinced that "need" is correct here, since no other subsystem
> aside from cdns3 and xhci seems to follow the idea of having a
> separate platform device for a common component inside of a SoC
> integration. The DT binding of course can't be fixed any more,
> but the code should be flexible enough to just make it work
> either way.

Fair point, I should have said we strongly prefer keeping a real struct device
anchored at the IP child node given how role-switch, Resources, IRQ, PHY,
runtime PM works today, while still making the driver logic robust if
we ever have to attach at the glue device instead.

> 
> > Brief summary of what I did:
> >
> > Expose Cadence USBSSP through the same platform path as USBSS, trim
> > Kconfig and Makefile: one core loadable object plus separate glue .ko
> > files.
> >
> > Single cdns.ko bundles core, DRD, the generic "cdns,usb3" platform
> > driver in cdns3-plat.c, optional host.o, and optional gadget objects.
> > Use CONFIG_USB_CDNS3_GADGET as a bool to compile gadget support into
> > that module. Remove duplicate MODULE_* declarations from cdns3-plat.c
> > now that it links into the same module.
> 
> Right, as far as I can tell, this should work correctly and is a
> nice simplification.

Thanks for confirming this is an acceptable simplification.

> 
> > Kconfig: the generic platform driver is selected via CONFIG_USB_CDNS3.
> > Move CONFIG_USB_CDNSP_PCI beside CONFIG_USB_CDNS3_PCI_WRAP
> > under "Platform glue driver support". SoC glue entries (TI, i.MX, StarFive)
> > depend only on CONFIG_USB_CDNS3.
> >
> > Export cdns_core_init_role and re-orginize the function cdns_init, and
> > controller version could be gotten before the gadget init function is
> > decided per controller.
> >
> > Keep host_init / gadget_init callbacks in struct cdns, so core.c does
> > not need direct linkage to host or gadget objects. Refactor cdnsp-pci.c
> > into a thin PCI-to-platform wrapper.
> >
> > drivers/usb/Makefile: descend into drivers/usb/cdns3/ only when
> > CONFIG_USB_CDNS_SUPPORT is enabled.
> >
> > Is this solution okay for you?
> 
> I can certainly live with that. I would still prefer the internal
> platform device to go away completely, but that would not be a
> functional change, only internal cosmetics, and it has no impact
> on configuration questions.

Understood that it is mostly cosmetic for configuration. I am not trying
to do that in this series; if we pursue it, it can be a follow-up once
the module layout is settled.

> 
> I'll leave it up to Greg to chime in if he has a strong opinion
> on the matter, but I assume he's fine with your patch as well.

Noted, I will wait for any comment from Greg.

> 
> A minor variation you could consider would be to make the common
> module just
> 
>       depends on USB || USB_GADGET
>       depends on USB if !USB_GADGET
>       depends on USB_GADGET if !USB
> 
> to make it always a loadable module if either USB or USB_GADGET
> is =m, and hide the symbols controlling host and gadget mode
> individually.

Good suggestion. I have applied this change and did more simplification.
I added your suggested-by tag, is it okay for you?

https://git.kernel.org/pub/scm/linux/kernel/git/peter.chen/cix.git/
branch: cdns3_kconfig_reorg

Below are changes compared to last version:

    Tighten CONFIG_USB_CDNS_SUPPORT dependencies so the umbrella follows
    host or gadget when either is built as a module. Match host and gadget
    bools to the cdns.ko tristate with USB=USB_CDNS3 and USB_GADGET=USB_CDNS3
    instead of comparing against USB_CDNS_SUPPORT.

    Link host.o when CONFIG_USB_CDNS3_HOST is enabled and use that symbol in
    host-export.h, removing the redundant CONFIG_USB_CDNS_HOST indirection.


-- 

Best regards,
Peter

