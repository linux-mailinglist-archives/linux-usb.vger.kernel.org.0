Return-Path: <linux-usb+bounces-33984-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IG1VLPdPqGmztAAAu9opvQ
	(envelope-from <linux-usb+bounces-33984-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 04 Mar 2026 16:29:59 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 14B2E202B13
	for <lists+linux-usb@lfdr.de>; Wed, 04 Mar 2026 16:29:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 40EBB302AD35
	for <lists+linux-usb@lfdr.de>; Wed,  4 Mar 2026 15:25:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 71F2733A6EB;
	Wed,  4 Mar 2026 15:25:44 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from bm.lauterbach.com (bm.lauterbach.com [62.154.241.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E43633F37F
	for <linux-usb@vger.kernel.org>; Wed,  4 Mar 2026 15:25:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.154.241.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772637944; cv=none; b=Zhc9LflV33vEiT5ZafD6iN338U3wUl/yx28/5npC8IaX241Wc6i5Kx4GKDDYNHK7vSXaJmNAFsC4bIAkyDDYkzzijCaFdf7d1tG7AfCZ8zVFytqZl6/87LkaX2Zqq7rMbT8lVALdt/J6GS+OIO+chvt6kDIqqDzQzX6am/o3BOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772637944; c=relaxed/simple;
	bh=l5gbzYLcusXd4/NiQao2+xe22o8JTyrA19v/toLcAPc=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZWRHKAQXbMuhJbdWnFBkUyS1NKSsDY2pGf4yZeM3vDu2Uj74IcOcsVNcfROTKDf3047nlWTh3FG/iPYDGTTohzaj4RoQs3Iz8U9wSt5wzpupKSmbVpUa3SUk5kWqnKroLE0/uysfILnt3aTWARR9TUbmLeYy5+/XGnmrw6w+PDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lauterbach.com; spf=pass smtp.mailfrom=lauterbach.com; arc=none smtp.client-ip=62.154.241.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lauterbach.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lauterbach.com
Received: from ingpc2.intern.lauterbach.com (unknown [10.2.10.44])
	(Authenticated sender: ingo.rohloff@lauterbach.com)
	by bm.lauterbach.com (Postfix) with ESMTPSA id 4680B2583DF91;
	Wed, 04 Mar 2026 16:25:32 +0100 (CET)
Date: Wed, 4 Mar 2026 16:25:31 +0100
From: Ingo Rohloff <ingo.rohloff@lauterbach.com>
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
 "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: [PATCH v4 1/1] usb: dwc3: Support USB3340x ULPI PHY high-speed
 negotiation.
Message-ID: <20260304162531.5548aaeb@ingpc2.intern.lauterbach.com>
In-Reply-To: <20260303234935.zusemc7tvnmetpbs@synopsys.com>
References: <20260303133720.17167-1-ingo.rohloff@lauterbach.com>
	<20260303133720.17167-2-ingo.rohloff@lauterbach.com>
	<20260303234935.zusemc7tvnmetpbs@synopsys.com>
Organization: Lauterbach GmbH
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.50; x86_64-unknown-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Bm-Milter-Handled: 166a2dfb-2e12-4590-8fa5-72e30323519f
X-Bm-Transport-Timestamp: 1772637932335
X-Rspamd-Queue-Id: 14B2E202B13
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33984-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	HAS_ORG_HEADER(0.00)[];
	DMARC_NA(0.00)[lauterbach.com];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_THREE(0.00)[3];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ingo.rohloff@lauterbach.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.873];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,lauterbach.com:url,lauterbach.com:email,ingpc2.intern.lauterbach.com:mid]
X-Rspamd-Action: no action

Hello Thinh,

> > +static void dwc3_ulpi_detect_config(struct dwc3 *dwc)  
> 
> We can rename this to dwc3_ulpi_get_properties() and declare it in
> core.h. Then we can have the dwc3_get_properties() call this function.

I tested this and this doesn't work:
At the time dwc3_get_properties() runs, the DWC3 controller hasn't been
initialized at all yet.

Any access to a DWC3 hardware register fails (I think the clocks to the
DWC3 IP are not even enabled at that point of time) and the kernel crashes.

To read out the ULPI PHY Vendor/Product ID at least the ULPI
interface of the DWC3 controller must be up and running.

> This will ensure that the order of the setting of the GUSB2PHYCFG is
> done in dwc3_hs_phy_setup(), which is prior to registering the ulpi phy.

I originally had the same idea: Make sure GUSB2PHYCFG settings are
correct before I do any access to the ULPI PHY; that's why I originally
used a device tree property.

But because I now use the Vendor/Product ID, this doesn't work;
instead what I implemented right now does this:

- First setup the ULPI interface to be able to access the ULPI PHY
- Check what ULPI PHY model is connected (via Vendor/Product ID)
- Apply further workarounds depending on the detected ULPI PHY model.

The setting of the XCVRDLY in GUSB2PHYCFG only has an effect once you
enable the USB connection.


> > +static void dwc3_ulpi_apply_config(struct dwc3 *dwc)
> > +{
> >    ...
>
> This should be done in dwc3_hs_phy_setup(). See more comments about this
> below.

The problem is: As far as I can tell, dwc3_hs_phy_setup() has to run first,
to setup the DWC3 controller to access the ULPI PHY at all.

Right at the beginning the code in dwc3_hs_phy_setup() reads:

	/* Select the HS PHY interface */
	switch (DWC3_GHWPARAMS3_HSPHY_IFC(dwc->hwparams.hwparams3)) {
	case DWC3_GHWPARAMS3_HSPHY_IFC_UTMI_ULPI:

I think that's also the reason why dwc3_core_init() uses this order

	ret = dwc3_phy_setup(dwc);
	...
	if (!dwc->ulpi_ready) {
		ret = dwc3_core_ulpi_init(dwc);

You first have to make sure that dwc3_phy_setup() has setup the interfaces
to the PHYs (both High-Speed and Super-Speed) before trying to
access the HS PHY.


> > +static void dwc3_ulpi_detect_config(struct dwc3 *dwc) 
> > +{
> > +	u16 product_id;
> > +	u16 vendor_id;
> > +	int ret;
> > +
> > +	/* Test the interface */
> > ...
> 
> Do we need to check for data integrity here? That check will be done
> during ulpi init, where it has proper checks and can fail properly
> there.

Thanks!
OMG I am stupid :-):
I misunderstood the code of ulpi_register_interface():
I thought ulpi_register_interface() would only do this check and read out
the Vendor/Product ID, if there is a matching device tree node, but it
turns out it will always do the check and read out the
Vendor/Product ID, even if there is no matching device tree node.

This in turn means: I don't even have to replicate any code, 
because ulpi_register_interface() will already read out the
ULPI PHYs Vendor/Product ID.

If drivers/usb/dwc3/core.c includes "linux/ulpi/driver.h" the code in
core.c already has access to the ULPI PHY Vendor/Product ID via
   dwc->ulpi->id.vendor
   dwc->ulpi->id.product

Which means: I directly can use this to enable the XCVRDLY in GUSB2PHYCFG
if the specific Vendor/Product ID is found.

What do you think?


with best regards
  Ingo


-- 


-------------------------------------------------------------------------
Dipl.-Inform.
Ingo ROHLOFF
Senior Staff Embedded Systems Engineering
phone +49 8102 9876-142 - ingo.rohloff@lauterbach.com

Lauterbach Engineering GmbH & Co. KG
Altlaufstrasse 40, 85635 Hoehenkirchen-Siegertsbrunn, GERMANY
www.lauterbach.com

Registered Office: Hoehenkirchen-Siegertsbrunn, Germany,
Local Court: Munich, HRA 87406, VAT ID: DE246770537,
Managing Directors: Lothar Lauterbach, Stephan Lauterbach, Dr. Thomas
Ullmann

-------------------------------------------------------------------------

