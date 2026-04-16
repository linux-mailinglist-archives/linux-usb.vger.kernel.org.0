Return-Path: <linux-usb+bounces-36275-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oEZHBGbM4GkdmAAAu9opvQ
	(envelope-from <linux-usb+bounces-36275-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 16 Apr 2026 13:47:50 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F36640DA30
	for <lists+linux-usb@lfdr.de>; Thu, 16 Apr 2026 13:47:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 322FD302351A
	for <lists+linux-usb@lfdr.de>; Thu, 16 Apr 2026 11:43:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7DA033B0AFB;
	Thu, 16 Apr 2026 11:43:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IyTWukIf"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E072394782;
	Thu, 16 Apr 2026 11:43:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776339799; cv=none; b=WkKS6vArA+HUrp4UT513U5vTvZlScY0VxcappfnnQSS+cDfrn+r85E7eosBNOdf0Qf1JfdqKS9cOMyePqYPl5uyFdqr90Xo+YQogL831YXrn/fNFQomRWFHbd/bG5qYp8x+T42wfGepwGVU4RTZUBRG4j90ZyDlrIhKNyOwZT5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776339799; c=relaxed/simple;
	bh=zM5mgse4oacmHVRx0YuDqIQ/cA7IFrxVzzxUGmfFqIw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Mg+mj5fMe1+xTv6S8qD5lSWAmGXUq1e4N/g22FQPT7/NPng+LDV1IX6XeFlSVna36+zZlmAl4hwrrM0n7N1GfQ2CyLVdJqOOZbVsr5H0X2Q4cXTMxXsMHsNeF5eLV0p3NYbUXPs21sg3MeJHj58RLwoSzWP/Va+9Y2YznAa5t2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IyTWukIf; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91ED3C2BCAF;
	Thu, 16 Apr 2026 11:43:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776339798;
	bh=zM5mgse4oacmHVRx0YuDqIQ/cA7IFrxVzzxUGmfFqIw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IyTWukIfuLjLrkC9izBM3L6githAWM6AoDl/P/wGn9XOQ79KAtu+SL8DQ5k2kvU2t
	 eDdMuwEFiAesKQAVSt8WIbbGnB7pHf0Lxu+Bre0DYKwdE4I/mzxsK/RRgs5899WhM/
	 E2QgP249xWnZ8EEtSKTxtHUU4V15jFM5GKZKIgU1pZRD72z8QqkkLBw7uw5STlHiJH
	 x/Y7vS47aP/UPwvv+PC2PKI2XYy+hlwcsGSjsbWkTIxmFfWyx656TIGuQIQKz5NDKX
	 hWW9gxgBBajJLlpaMFI/mOx/21o3yGGPRzu7g0Zxq95LTRH0cdaPMaiuiDuX4EqmLh
	 bcDkF7h2ovZaw==
Date: Thu, 16 Apr 2026 19:43:14 +0800
From: "Peter Chen (CIX)" <peter.chen@kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Arnd Bergmann <arnd@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Pawel Laszczak <pawell@cadence.com>,
	Roger Quadros <rogerq@kernel.org>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: cdns3: attempt to fix Kconfig dependencies
Message-ID: <aeDLUpWuhBAu8XXW@nchen-desktop>
References: <20260402141008.2691819-1-arnd@kernel.org>
 <ac9xVUVB/BKfBUmE@nchen-desktop>
 <26779a33-135a-4881-8614-9987c5e90380@app.fastmail.com>
 <ac+H2dzj5t1JJJd5@nchen-desktop>
 <e650e6c7-bd19-4c35-bcd2-0c53178feb8e@app.fastmail.com>
 <adMMm5kS3PR5CHFB@nchen-desktop>
 <51c96cbd-1d46-47ff-b553-5b81efd39067@app.fastmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <51c96cbd-1d46-47ff-b553-5b81efd39067@app.fastmail.com>
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
	TAGGED_FROM(0.00)[bounces-36275-lists,linux-usb=lfdr.de];
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
X-Rspamd-Queue-Id: 6F36640DA30
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 26-04-13 18:45:38, Arnd Bergmann wrote:
> On Mon, Apr 6, 2026, at 03:30, Peter Chen (CIX) wrote:
> > On 26-04-03 20:50:52, Arnd Bergmann wrote:
> >> 
> >> The only other alternative I see would be to split up the
> >> platform driver support into separate modules for cdns3 and
> >> cdnsp as well, which would make the dependencies trivial but
> >> require reworking of the actual in a way that I haven't
> >> been able to figure out yet. If you are already integrating
> >> other changes for the next attempt, maybe you can try to
> >> come up with a solution for this as well.
> >
> > Thanks for your suggestion, creating different platform driver
> > between cdns3 and cdnsp is the way we used at downstream, but
> > when I try to upstream cdsnp platform driver support, I find
> > the two platforms driver are 95% identical in content, so I
> > would like to keep one platform driver and one binding doc.
> 
> I gave this some more thought and realized that the best
> way to handle it is probably by reworking the cdns3 driver
> to no longer require the separate platform_device registration
> for the child device. This would make it work like most other
> drivers in the kernel, which helps both with the module
> dependencies and with new developers working on it.
> 
> The way I think this can work would be:
> 
> - turn drivers/usb/cdns3/cdns3-plat.c into a library module
>   that exports the probe/remove/suspend/resume functions
> - Remove the of_platform_populate()/platform_device_unregister()
>   calls from soc specific drivers
> - Change the individual probe/remove callbacks to
>   call the exported functions from the generic driver
> - Integrate cdns3_platform_data into struct cdns, and
>   pass that from the soc specific driver into the common
>   code
> - Set cdns->gadget_init in the soc specific driver
> 
> There may be additional steps needed to make this work, but
> the result should be much cleaner.
> 

Hi Arnd,

Thanks for your time to improve this issue. But for Cadence IP,
we began the architecture with parent (SoC) and child (IP) topology,
created parent/child device tree yaml files
(eg, fsl,imx8qm-cdns3.yaml/cdns,usb3.yaml) as well.

If we kept the DT node but dropped a real struct device for the IP controller
(e.g. only the glue struct device existed while the IP stayed "node-only"),
several things become fragile or outright wrong, even we could change cdns3
code to use parent device, and work out for solution like 
"device_property_read_bool(dev, "usb-role-switch") on cdns->dev.
But for usb-role-switch and Type-C graph/connection logic are
the painful case, and could not easy to find the solution.

When something (e.g. Type-C/connector path) tries to resolve
a "usb-role-switch" connection, the match callback does:

static void *usb_role_switch_match(const struct fwnode_handle *fwnode,
	       	const char *id,
		void *data)
{
	struct device *dev;
	if (id && !fwnode_property_present(fwnode, id))
		return NULL;
	dev = class_find_device_by_fwnode(&role_class, fwnode);
	return dev ? to_role_switch(dev) : ERR_PTR(-EPROBE_DEFER);
}

class_find_device_by_fwnode() ultimately uses device_match_fwnode,
which is pointer equality on dev_fwnode(dev):

int device_match_fwnode(struct device *dev, const void *fwnode)
{
	return fwnode && dev_fwnode(dev) == fwnode;
}

So the only role switch that matches is one whose registered sw->dev has
dev_fwnode(&sw->dev) equal to the fwnode passed into usb_role_switch_match()
(whatever the graph/connection layer produced for that link often is 
 cdns,usb3 child, but not the SoC glue parent).

So we are not arguing for "DT for documentation only"; we need the child
platform device as the anchor that matches the IP node and the properties
that the Cadence DRD code actually consumes.

I have an new idea for how to improve cdns3 Kconfig/Makefile structure, and I push
the code at: https://git.kernel.org/pub/scm/linux/kernel/git/peter.chen/cix.git/
branch: cdns3_kconfig_reorg

Brief summary of what I did:

Expose Cadence USBSSP through the same platform path as USBSS, trim
Kconfig and Makefile: one core loadable object plus separate glue .ko
files.

Single cdns.ko bundles core, DRD, the generic "cdns,usb3" platform
driver in cdns3-plat.c, optional host.o, and optional gadget objects.
Use CONFIG_USB_CDNS3_GADGET as a bool to compile gadget support into
that module. Remove duplicate MODULE_* declarations from cdns3-plat.c
now that it links into the same module.

Kconfig: the generic platform driver is selected via CONFIG_USB_CDNS3.
Move CONFIG_USB_CDNSP_PCI beside CONFIG_USB_CDNS3_PCI_WRAP
under "Platform glue driver support". SoC glue entries (TI, i.MX, StarFive)
depend only on CONFIG_USB_CDNS3.

Export cdns_core_init_role and re-orginize the function cdns_init, and
controller version could be gotten before the gadget init function is
decided per controller.

Keep host_init / gadget_init callbacks in struct cdns, so core.c does
not need direct linkage to host or gadget objects. Refactor cdnsp-pci.c
into a thin PCI-to-platform wrapper.

drivers/usb/Makefile: descend into drivers/usb/cdns3/ only when
CONFIG_USB_CDNS_SUPPORT is enabled.

Is this solution okay for you?

-- 

Best regards,
Peter

