Return-Path: <linux-usb+bounces-36278-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WMzNDZ7j4GlhnAAAu9opvQ
	(envelope-from <linux-usb+bounces-36278-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 16 Apr 2026 15:26:54 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AAFD40ECC7
	for <lists+linux-usb@lfdr.de>; Thu, 16 Apr 2026 15:26:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 8C9FA30978A6
	for <lists+linux-usb@lfdr.de>; Thu, 16 Apr 2026 13:20:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B40B3BC675;
	Thu, 16 Apr 2026 13:19:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="GfImRmQV";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="q+jsHmXN"
X-Original-To: linux-usb@vger.kernel.org
Received: from fhigh-a8-smtp.messagingengine.com (fhigh-a8-smtp.messagingengine.com [103.168.172.159])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7F8D3BAD85;
	Thu, 16 Apr 2026 13:19:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.159
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776345570; cv=none; b=XpJDoA6+F3jXswMiFCfTt/1u1Da4NYWKEIlxZq9uBKrExaFxnKEAe+Hh6P+R1VHkb1MLG9/0z8TBP+1UAAcGFHIrVxTqhsbllIEr3EqttKSP0Av71nhrx+20yQ3r7gTlT3/YX6PNtW6L8brEfZxcelvuiWBIviI9W7aQ2slRh7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776345570; c=relaxed/simple;
	bh=GmbM3QWjiQ5Yz7areFLtXjjfG79OxvE9GJ91cyENfrA=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=sYYnX9Yeaiwaun+jr+lguddsPRKDIGcbo+U7TAnH/ZT7WoYg87eGY4URN5+785MV1klgVJT23f6Hyl4i/IxBcbXn03titsA2AkbdJt2cYODJmGhvN6STPDCmMSqhb2vuxzS3N36C0cY8dXPNxKwhZ/yctXCr1R8B4Oa40fl41b8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=GfImRmQV; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=q+jsHmXN; arc=none smtp.client-ip=103.168.172.159
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfhigh.phl.internal (Postfix) with ESMTP id C991E1400045;
	Thu, 16 Apr 2026 09:19:27 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-04.internal (MEProxy); Thu, 16 Apr 2026 09:19:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1776345567;
	 x=1776431967; bh=K/rAy+ruILoOU0xvxjRUcwJ3Eb9dwl1lQFI0ZJRDyeM=; b=
	GfImRmQVQk22yfySbwRRzj78EMGmlB9XBro9jPwfUI49CWrFuetJctbeCQSfDXdl
	JLPL30q71n85KslKPxZ7lV+tm3ZVr8kppwRXhY6k12JY2okkED5fgn+dBaXnrm/G
	3vdk/Brkb3s9Yk9PXoJ1n3eVMU0QYkryv+li9mrxwqoisAYJHJmD/DdDj6Su06me
	WGeAEv+Ft/VfG4oF+CDDw3ZnMvSmDDEhy0VMRbEanZvGGU02f4uLNB5peeIz08Sc
	eHSRpNZQO9MBNq+ckWmCu1PYSgFyJCCafOMh40jZWpl/XTgto90vm9X/uB5ddhTe
	TgZh1gX+JIsbT7g+A2xhAQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1776345567; x=
	1776431967; bh=K/rAy+ruILoOU0xvxjRUcwJ3Eb9dwl1lQFI0ZJRDyeM=; b=q
	+jsHmXN7Rmm2TyoxW3rcuJR2+iWwq08CoD470k7c7wg5UNMBYJyeO/wrGzHiPNcO
	+koMqZJvBbHE3uPX00wyLh8j8OjVX0ddtZt7tY7txQlDJMQWOKt1LTGI8W1dHE3s
	qcH9h1RXPXu24NdHJ1/nRrx5qL82UibqaeVjXrrqcqpU4LdSSV0BXyfUN+SXSJzs
	yQHFf1RjYizR+RrvPMU48fc9c2rzGMOvNRC/ppRebmCLG91503xiGIDzHySHURB7
	fKpH2Q6plyrAOkSZEQ8bKFjLLpuD/Un8zJcqHZGZ9WP2/NYDClvGFfA5YRxLGo2m
	jGMYlV3dZu3sYqvA/g42A==
X-ME-Sender: <xms:3-HgaU0B-YInxL7DfJgvYOrSAMrqezAMZ-glmRJOVo3HQBVBAW_MYA>
    <xme:3-HgaZ6Pu0_Oweww3vdZHvaHcQKGpeWpTWj694UVYgqkm_N2UAck733QdBGVGxhhX
    9sAhyxhsouFxOcG4LDl6TvZ5Gx8v1xUKokCpj9FfCXxs23d4jzUwg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgdegjeduudcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefoggffhffvvefkjghfufgtgfesthejredtredttdenucfhrhhomhepfdetrhhnugcu
    uegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrghtthgvrh
    hnpefhtdfhvddtfeehudekteeggffghfejgeegteefgffgvedugeduveelvdekhfdvieen
    ucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrhhnug
    esrghrnhgusgdruggvpdhnsggprhgtphhtthhopeejpdhmohguvgepshhmthhpohhuthdp
    rhgtphhtthhopehprgifvghllhestggruggvnhgtvgdrtghomhdprhgtphhtthhopegrrh
    hnugeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepphgvthgvrhdrtghhvghnsehkvghr
    nhgvlhdrohhrghdprhgtphhtthhopehrohhgvghrqheskhgvrhhnvghlrdhorhhgpdhrtg
    hpthhtohepghhrvghgkhhhsehlihhnuhigfhhouhhnuggrthhiohhnrdhorhhgpdhrtghp
    thhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtg
    hpthhtoheplhhinhhugidquhhssgesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:3-HgaWf7xgCx-83o7WKEnvGhhSsIatklebKdNxoaeWDMBGY5vFLs9Q>
    <xmx:3-HgaaT02IFF6fp1LQJ23wgqyGqJuSu_91n_wTjanOzRJ_t_oyOsxw>
    <xmx:3-HgaXbdNWiHaleZnWS7Zw0dqv6S9_zMi-rKWk496uNaW6GZG5xZLg>
    <xmx:3-HgaVdKGM9mEIi_fNIOGOSzeVd43xJ_qQYAqpZ0JOfTjEH4xcgLuw>
    <xmx:3-HgaXWHaejmB0TcmqKa_ZqD94Y9VnbQm54H4TlvzrAv8Fb5taG9Gtrz>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 7F124700065; Thu, 16 Apr 2026 09:19:27 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: AlVvYKQckCPF
Date: Thu, 16 Apr 2026 15:19:06 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Peter Chen" <peter.chen@kernel.org>
Cc: "Arnd Bergmann" <arnd@kernel.org>,
 "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,
 "Pawel Laszczak" <pawell@cadence.com>, "Roger Quadros" <rogerq@kernel.org>,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Message-Id: <cb70271c-3ddb-422c-bf24-1cf019473f7e@app.fastmail.com>
In-Reply-To: <aeDLUpWuhBAu8XXW@nchen-desktop>
References: <20260402141008.2691819-1-arnd@kernel.org>
 <ac9xVUVB/BKfBUmE@nchen-desktop>
 <26779a33-135a-4881-8614-9987c5e90380@app.fastmail.com>
 <ac+H2dzj5t1JJJd5@nchen-desktop>
 <e650e6c7-bd19-4c35-bcd2-0c53178feb8e@app.fastmail.com>
 <adMMm5kS3PR5CHFB@nchen-desktop>
 <51c96cbd-1d46-47ff-b553-5b81efd39067@app.fastmail.com>
 <aeDLUpWuhBAu8XXW@nchen-desktop>
Subject: Re: [PATCH] usb: cdns3: attempt to fix Kconfig dependencies
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-2.15 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[arndb.de,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[arndb.de:s=fm1,messagingengine.com:s=fm2];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	XM_UA_NO_VERSION(0.01)[];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-36278-lists,linux-usb=lfdr.de];
	DKIM_TRACE(0.00)[arndb.de:+,messagingengine.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[arnd@arndb.de,linux-usb@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_COUNT_FIVE(0.00)[6];
	RCPT_COUNT_SEVEN(0.00)[7];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	DBL_BLOCKED_OPENRESOLVER(0.00)[app.fastmail.com:mid,messagingengine.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 3AAFD40ECC7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Apr 16, 2026, at 13:43, Peter Chen (CIX) wrote:
> On 26-04-13 18:45:38, Arnd Bergmann wrote:
>> On Mon, Apr 6, 2026, at 03:30, Peter Chen (CIX) wrote:
>> > On 26-04-03 20:50:52, Arnd Bergmann wrote:
>> - turn drivers/usb/cdns3/cdns3-plat.c into a library module
>>   that exports the probe/remove/suspend/resume functions
>> - Remove the of_platform_populate()/platform_device_unregister()
>>   calls from soc specific drivers
>> - Change the individual probe/remove callbacks to
>>   call the exported functions from the generic driver
>> - Integrate cdns3_platform_data into struct cdns, and
>>   pass that from the soc specific driver into the common
>>   code
>> - Set cdns->gadget_init in the soc specific driver
>> 
>> There may be additional steps needed to make this work, but
>> the result should be much cleaner.
>
> Thanks for your time to improve this issue. But for Cadence IP,
> we began the architecture with parent (SoC) and child (IP) topology,
> created parent/child device tree yaml files
> (eg, fsl,imx8qm-cdns3.yaml/cdns,usb3.yaml) as well.
>
> If we kept the DT node but dropped a real struct device for the IP controller
> (e.g. only the glue struct device existed while the IP stayed "node-only"),
> several things become fragile or outright wrong, even we could change cdns3
> code to use parent device, and work out for solution like 
> "device_property_read_bool(dev, "usb-role-switch") on cdns->dev.
> But for usb-role-switch and Type-C graph/connection logic are
> the painful case, and could not easy to find the solution.

Hi Peter,

I agree that this will stay a little awkward due to the currently
defined DT binding, but I would expect that even for the driver
itself, the normal way to handle this becomes simpler rather
than adding problems. E.g. the use of DMA on the child device
is rather questionable since the parent device is the actual
DMA master, and any properties defining how DMA works on
the parent bus (dma-ranges, iommu, ...) don't directly propagate
to the cdns3 device when that bypasses the normal platform
device probing.

> When something (e.g. Type-C/connector path) tries to resolve
> a "usb-role-switch" connection, the match callback does:
>
> static void *usb_role_switch_match(const struct fwnode_handle *fwnode,
> 	       	const char *id,
> 		void *data)
> {
> 	struct device *dev;
> 	if (id && !fwnode_property_present(fwnode, id))
> 		return NULL;
> 	dev = class_find_device_by_fwnode(&role_class, fwnode);
> 	return dev ? to_role_switch(dev) : ERR_PTR(-EPROBE_DEFER);
> }
>
> class_find_device_by_fwnode() ultimately uses device_match_fwnode,
> which is pointer equality on dev_fwnode(dev):
>
> int device_match_fwnode(struct device *dev, const void *fwnode)
> {
> 	return fwnode && dev_fwnode(dev) == fwnode;
> }
>
> So the only role switch that matches is one whose registered sw->dev has
> dev_fwnode(&sw->dev) equal to the fwnode passed into usb_role_switch_match()
> (whatever the graph/connection layer produced for that link often is 
>  cdns,usb3 child, but not the SoC glue parent).

Could the callers of usb_role_switch_get() change to calling
fwnode_usb_role_switch_get() instead? It looks like that
already handles the case of an device node without a struct device
attached to it.

> So we are not arguing for "DT for documentation only"; we need the child
> platform device as the anchor that matches the IP node and the properties
> that the Cadence DRD code actually consumes.

I'm not convinced that "need" is correct here, since no other subsystem
aside from cdns3 and xhci seems to follow the idea of having a
separate platform device for a common component inside of a SoC
integration. The DT binding of course can't be fixed any more,
but the code should be flexible enough to just make it work
either way.

> Brief summary of what I did:
>
> Expose Cadence USBSSP through the same platform path as USBSS, trim
> Kconfig and Makefile: one core loadable object plus separate glue .ko
> files.
>
> Single cdns.ko bundles core, DRD, the generic "cdns,usb3" platform
> driver in cdns3-plat.c, optional host.o, and optional gadget objects.
> Use CONFIG_USB_CDNS3_GADGET as a bool to compile gadget support into
> that module. Remove duplicate MODULE_* declarations from cdns3-plat.c
> now that it links into the same module.

Right, as far as I can tell, this should work correctly and is a
nice simplification.

> Kconfig: the generic platform driver is selected via CONFIG_USB_CDNS3.
> Move CONFIG_USB_CDNSP_PCI beside CONFIG_USB_CDNS3_PCI_WRAP
> under "Platform glue driver support". SoC glue entries (TI, i.MX, StarFive)
> depend only on CONFIG_USB_CDNS3.
>
> Export cdns_core_init_role and re-orginize the function cdns_init, and
> controller version could be gotten before the gadget init function is
> decided per controller.
>
> Keep host_init / gadget_init callbacks in struct cdns, so core.c does
> not need direct linkage to host or gadget objects. Refactor cdnsp-pci.c
> into a thin PCI-to-platform wrapper.
>
> drivers/usb/Makefile: descend into drivers/usb/cdns3/ only when
> CONFIG_USB_CDNS_SUPPORT is enabled.
>
> Is this solution okay for you?

I can certainly live with that. I would still prefer the internal
platform device to go away completely, but that would not be a
functional change, only internal cosmetics, and it has no impact
on configuration questions.

I'll leave it up to Greg to chime in if he has a strong opinion
on the matter, but I assume he's fine with your patch as well.

A minor variation you could consider would be to make the common
module just

      depends on USB || USB_GADGET
      depends on USB if !USB_GADGET
      depends on USB_GADGET if !USB

to make it always a loadable module if either USB or USB_GADGET
is =m, and hide the symbols controlling host and gadget mode
individually.

       Arnd

