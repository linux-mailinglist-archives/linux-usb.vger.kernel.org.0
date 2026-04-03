Return-Path: <linux-usb+bounces-35933-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MGM9IFyAz2mvwgYAu9opvQ
	(envelope-from <linux-usb+bounces-35933-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Fri, 03 Apr 2026 10:54:52 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 22582392623
	for <lists+linux-usb@lfdr.de>; Fri, 03 Apr 2026 10:54:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 5B09530172F5
	for <lists+linux-usb@lfdr.de>; Fri,  3 Apr 2026 08:54:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7897A37F8B0;
	Fri,  3 Apr 2026 08:54:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="olOtzznI"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 048E32D94BA;
	Fri,  3 Apr 2026 08:54:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775206488; cv=none; b=TxLaJwElU408GgnDhWMO0CDFpTmGihkN9tHWrGZMC06tp8SmI9L2zJ8TSCySnMiaXSsMJczMqaQ0+yPlbeekvdWypBo1VuBUIIREO5qNRhk4d6dZSC2J94uRn/3dp5Pq5KoCEFdp8mDyJlITLPDMZHzDHW7FsMtb80zx8bv9U/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775206488; c=relaxed/simple;
	bh=Lm7sxcZWZLQ7jgVaZ6uQsqGGcnJlQ/ZjCeLWYGM5xds=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KhatrTZ7OblFexdQ5PxGtldhwzJALNyXNHkpEnNj5VZycJDM4skmyIP0raGQCGIrts+lllzWq9HOsTF98MBKTPjIQdB3FN7SSBqovR+hmkPvNLrrlrHzrJ2gzIRdpMFxDYgvWEkLB2xxJN+eFraxHRmKlfPYBqZI23ZQIJwqozg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=olOtzznI; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3393C4CEF7;
	Fri,  3 Apr 2026 08:54:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1775206487;
	bh=Lm7sxcZWZLQ7jgVaZ6uQsqGGcnJlQ/ZjCeLWYGM5xds=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=olOtzznIfuQMHAk0Wl81GenxptY5Zo1gWWid1mEXIHXjWJfS0PjK8hEq5j3QRmFWt
	 YcZCH/U8E8gpXrqTyrSSFFWiapqYmjUl4sIjIB22dkf6mftsdw2Vm8JUs872LobpGW
	 fhSfbhTULNIirhqd3uItgZeQtBV/cNTN7TCVakrs=
Date: Fri, 3 Apr 2026 10:54:44 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: "Peter Chen (CIX)" <peter.chen@kernel.org>
Cc: Arnd Bergmann <arnd@kernel.org>, Pawel Laszczak <pawell@cadence.com>,
	Arnd Bergmann <arnd@arndb.de>, Roger Quadros <rogerq@kernel.org>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: cdns3: attempt to fix Kconfig dependencies
Message-ID: <2026040328-residence-auction-d94d@gregkh>
References: <20260402141008.2691819-1-arnd@kernel.org>
 <ac9xVUVB/BKfBUmE@nchen-desktop>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ac9xVUVB/BKfBUmE@nchen-desktop>
X-Spamd-Result: default: False [2.34 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=korg];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-35933-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[linuxfoundation.org:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gregkh@linuxfoundation.org,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,linuxfoundation.org:dkim,arndb.de:email]
X-Rspamd-Queue-Id: 22582392623
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Apr 03, 2026 at 03:50:45PM +0800, Peter Chen (CIX) wrote:
> On 26-04-02 16:09:55, Arnd Bergmann wrote:
> > From: Arnd Bergmann <arnd@arndb.de>
> > 
> > The way that dependencies between host and gadget mode, as well as cdns3
> > and cdnsp were handled was rather fragile before commit 6076388ca1ed
> > ("usb: cdns3: Add USBSSP platform driver support").
> > 
> > After those changes, I get randconfig build failures:
> > 
> > arm-linux-gnueabi-ld: drivers/usb/cdns3/cdnsp-gadget.o: in function `__cdnsp_gadget_init':
> > cdnsp-gadget.c:(.text+0x12da): undefined reference to `cdns_drd_gadget_on'
> > arm-linux-gnueabi-ld: drivers/usb/cdns3/cdnsp-gadget.o: in function `cdnsp_gadget_pullup':
> > cdnsp-gadget.c:(.text+0x3030): undefined reference to `cdns_clear_vbus'
> > arm-linux-gnueabi-ld: cdnsp-gadget.c:(.text+0x3138): undefined reference to `cdns_set_vbus'
> > arm-linux-gnueabi-ld: drivers/usb/cdns3/cdnsp-gadget.o: in function `cdnsp_gadget_exit':
> > cdnsp-gadget.c:(.text+0xe0): undefined reference to `cdns_drd_gadget_off'
> > 
> > and I see additional configurations that are broken. The main problem
> > here is that the 'common' module links against both host and gadget
> > support if they are enabled, but there are insufficient protections
> > agains it being built-in if only one of them is built-in and the other
> > is in a loadable module, causing link failures.
> > 
> > The use of IS_REACHABLE() in gadget-export.h works around a similar
> > problem if one of cdns3 and cdnsp is built-in but the other one is
> > =m. This one is worse because instead of a clear link failure, the
> > logic just makes it not work at all despite support being enabled.
> > 
> > To improve this mess, throw out both the Makefile hacks and the
> > IS_REACHABLE() hack and replace these with regular Kconfig dependencies
> > that ensure each driver is only enabled when its dependencies are there,
> > as we do in most other drivers. The main downside here is that there is no
> > good way to have built-in gadget support on cdn3 along with USB=m. Fixing
> > this part proper would require cleaning up the code to turn the 'common'
> > parts into a library module that only gets called by the other drivers
> > but does not interact with either host or gadget support itself.
> > 
> > Another problem that is not solved by this patch is the way that
> > platform specific glue logic in this driver relies on having
> > a soc specific device as the parent of a generic child, instead of
> > the specific driver just calling into a common helper module.
> > This may be impossible to fix without breaking the DT bindings.
> > 
> > Fixes: 6076388ca1ed ("usb: cdns3: Add USBSSP platform driver support")
> 
> Hi Arnd,
> 
> Thanks for fixing it, I am sorry for taking your effort debug it.
> 
> > Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> > ---
> > TBH, I would be more comfortable with reverting 6076388ca1ed altogether
> > and asking for a new version with the proper fixups included along
> > with more testing for the next merge window.
> 
> It depends on Greg, I am okay for both ways. If Greg reverts the patch,
> I will do below improvements and adapts for most of your changes for v3
> patch.

I'll be glad to revert if you want me to, just let me know.

thanks,

greg k-h

