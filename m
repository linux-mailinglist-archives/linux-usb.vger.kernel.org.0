Return-Path: <linux-usb+bounces-35934-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kILCDACIz2mwwwYAu9opvQ
	(envelope-from <linux-usb+bounces-35934-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Fri, 03 Apr 2026 11:27:28 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 338CE392C51
	for <lists+linux-usb@lfdr.de>; Fri, 03 Apr 2026 11:27:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id B7E03300BC6D
	for <lists+linux-usb@lfdr.de>; Fri,  3 Apr 2026 09:26:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BEF873659F9;
	Fri,  3 Apr 2026 09:26:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YiTbqW83"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DE052DCF45;
	Fri,  3 Apr 2026 09:26:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775208414; cv=none; b=hz1lnBCC57QGW0kHtxQ8DJd/0P+or32WWFBpKC7vbqOxD+/XQmlEHQ9RupReSFlH8R9+h23G3wdac7PDY+69b+YridqoP9LrrLG/UuTjC3vHZSPTUkMYHtw41WPTy4Z3ZWoedJ8a5EJn3AaWaa5Biuf9BIV3w585kVKSAYtcbdQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775208414; c=relaxed/simple;
	bh=IFW15AksXYhoF02+XCjmZnN3Zj/qKE14iDBL9F1cKjc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=axBKXtV9C4eRfmQ8XiAfAIBDBExdlSYF2W2lm2Sv87VNnJ+4E8gwgFwJ0RtAZ7AgX7RSK1qtmHRVqofP/12qc9Gnpz6fBLqDpUp5kZdyVbwQDJAupDFUoGb68inlhHpdTQMiVFwWgNcvxTzMSBN+H5m1DgAU57Dwsh22Sew/lBY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YiTbqW83; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 101C2C4CEF7;
	Fri,  3 Apr 2026 09:26:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775208413;
	bh=IFW15AksXYhoF02+XCjmZnN3Zj/qKE14iDBL9F1cKjc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YiTbqW83vjLPTLXyp+2IYUcbQDM5huwVHhnSrRpW1J0fh4G0H51NSi9/hVcnkkW85
	 m9RXFOgnmLXFnUuQdFw+DV3KsMrX2YVCScijLsNbe3kVs3FNNRD/hMptHQ3LINFpiy
	 k7RmzZ4Nwh8qLd28iaRcACyLUh/fj8rQMOWgtnu6kBkTRrIFtUsZEYCqKdJYD8jKWj
	 HYBws2ADDLR68igF6WI2oExWkH5oFsPPWmuR5wDE6ejB1syAvsiYoksqxCwf7p30Az
	 vYUXJLD/Wd5Isnxs2/0QpbtSKi/zqji/fvJu6zK59/aiqbCRubTri2zuozgyNvWNPz
	 OLMwisFx4S7Wg==
Date: Fri, 3 Apr 2026 17:26:49 +0800
From: "Peter Chen (CIX)" <peter.chen@kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Arnd Bergmann <arnd@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Pawel Laszczak <pawell@cadence.com>,
	Roger Quadros <rogerq@kernel.org>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: cdns3: attempt to fix Kconfig dependencies
Message-ID: <ac+H2dzj5t1JJJd5@nchen-desktop>
References: <20260402141008.2691819-1-arnd@kernel.org>
 <ac9xVUVB/BKfBUmE@nchen-desktop>
 <26779a33-135a-4881-8614-9987c5e90380@app.fastmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <26779a33-135a-4881-8614-9987c5e90380@app.fastmail.com>
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35934-lists,linux-usb=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[peter.chen@kernel.org,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 338CE392C51
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 26-04-03 10:39:18, Arnd Bergmann wrote:
> On Fri, Apr 3, 2026, at 09:50, Peter Chen (CIX) wrote:
> > On 26-04-02 16:09:55, Arnd Bergmann wrote:
> >> ---
> >> TBH, I would be more comfortable with reverting 6076388ca1ed altogether
> >> and asking for a new version with the proper fixups included along
> >> with more testing for the next merge window.
> >
> > It depends on Greg, I am okay for both ways. If Greg reverts the patch,
> > I will do below improvements and adapts for most of your changes for v3
> > patch.
> >
> > cdns-usb-common.ko is a libary, and no USB/GADGET dependency, could builds in.
> >   ├── core.o  
> >   └── drd.o
> >
> > cdns3-host.ko     -> depends on USB/XHCI（it is m when USB = m
> > cdns3.ko (gadget) -> depends on USB_GADGET
> > cdnsp.ko (gadget) -> depends on USB_GADGET
> > cdns3-plat.ko     -> assign host_init/gadget_init function pointer
> 
> This all sounds good. Ideally cdns3-plat.ko would also lose the
> dependency on cdns3.ko/cdnsp.ko

No, it can't. cdns3-plat.ko depends on cdns3.ko/cdsnp.ko or its
stub.

> 
> >> @@ -10,12 +11,24 @@ config USB_CDNS_SUPPORT
> >>  
> >>  config USB_CDNS_HOST
> >>  	bool
> >> +	depends on USB=y || USB=USB_CDNS_SUPPORT
> >> +
> >> +config CONFIG_USB_CDNS_PLATFORM
> >
> > %s/CONFIG_USB_CDNS_PLATFORM/USB_CDNS_PLATFORM
> 
> Oh, this means my patch did not actually work at all, and my testing
> was pointless. I've fixed that now in my randconfig tree to see
> if anything else comes up.
> 
>      Arnd

I am afraid it may need to change more for your patch, otherwise, it could have
error with below combinations:

USB=y USB_GADGET=y USB_CDNS_SUPPORT=y USB_CDNS_HOST=y USB_CDNS_PLATFORM=y USB_CDNS3=y
USB_CDNS3_GADGET=y USB_CDNS3_HOST=y USB_CDNSP=y USB_CDNSP_GADGET=m USB_CDNSP_HOST=y

USB_CDNS_PLATFORM reference to the cdnsp_gadget_init which is built as module.

drivers/usb/cdns3/cdns3-plat.c:52: undefined reference to `cdnsp_gadget_init'

So far, below changes works okay at my test:

diff --git a/drivers/usb/cdns3/Kconfig b/drivers/usb/cdns3/Kconfig
index 07ed694e10b8..57cd7e3b5b22 100644
--- a/drivers/usb/cdns3/Kconfig
+++ b/drivers/usb/cdns3/Kconfig
@@ -13,11 +13,13 @@ config USB_CDNS_HOST
 	bool
 	depends on USB=y || USB=USB_CDNS_SUPPORT
 
-config CONFIG_USB_CDNS_PLATFORM
+config USB_CDNS_PLATFORM
 	tristate "Cadence USB3 generic platform support"
 	depends on USB_CDNSP || USB_CDNS3
 	depends on USB_CDNSP || !USB_CDNSP
 	depends on USB_CDNS3 || !USB_CDNS3
+	depends on USB_CDNS3_GADGET || !USB_CDNS3_GADGET
+	depends on USB_CDNSP_GADGET || !USB_CDNSP_GADGET
 	help
 	  The platform driver support is needed on any SoC integrating
 	  a variant of the Cadence USB3 or USBSSP dual-role controllers,
@@ -118,7 +120,7 @@ config USB_CDNSP
 if USB_CDNSP
 
 config USB_CDNSP_GADGET
-	bool "Cadence USBSSP device controller"
+	tristate "Cadence USBSSP device controller"
 	depends on USB_GADGET=y || USB_GADGET=USB_CDNSP
 	help
 	  Say Y here to enable device controller functionality of the


-- 

Best regards,
Peter

