Return-Path: <linux-usb+bounces-33697-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SEFlLynwnmnoXwQAu9opvQ
	(envelope-from <linux-usb+bounces-33697-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 25 Feb 2026 13:50:49 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 280141979E1
	for <lists+linux-usb@lfdr.de>; Wed, 25 Feb 2026 13:50:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1ED5E30247D9
	for <lists+linux-usb@lfdr.de>; Wed, 25 Feb 2026 12:50:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C688396B68;
	Wed, 25 Feb 2026 12:50:05 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from bm.lauterbach.com (bm.lauterbach.com [62.154.241.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16D183451BB
	for <linux-usb@vger.kernel.org>; Wed, 25 Feb 2026 12:50:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.154.241.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772023805; cv=none; b=HCY0QxZjvZpqIwAfEReLoaC6bFgQrSZPJ64schGceQZjzr+I9jo9kxUjjlJLJwf6V6ZXSw/DcUy6PhFYcP5PZPnivMCrCRY/jzTwUf8L0jFqhOze/hqBrg5Y77XtYrw7RXLbIPYpAVkt/5lauygmr8dK5B1PftsIzOrywTeZ5Jw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772023805; c=relaxed/simple;
	bh=kQHJQ31+MdmA1hhfUleG2SzGoQCyhUgQtY3Qh/+g/+g=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GVJxdns/HQl5awFd9JvbNfWH6/JKE+RYRh/YybeMXAhgQ5wKRO/FmXRu/WhjbdhqhkUhY3zy9KwgRLBR8l15wgFmxGRJoAOEgfWbJPap7WcLKe5rwp/ZSgK6aKSgGchUVos4soKu54JdH87MuJaY+4ZoELNOnyc0Au/Ev0YJU5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lauterbach.com; spf=pass smtp.mailfrom=lauterbach.com; arc=none smtp.client-ip=62.154.241.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lauterbach.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lauterbach.com
Received: from ingpc2.intern.lauterbach.com (unknown [10.2.10.44])
	(Authenticated sender: ingo.rohloff@lauterbach.com)
	by bm.lauterbach.com (Postfix) with ESMTPSA id 7DBEE1E0B5CB1;
	Wed, 25 Feb 2026 13:49:59 +0100 (CET)
Date: Wed, 25 Feb 2026 13:49:59 +0100
From: Ingo Rohloff <ingo.rohloff@lauterbach.com>
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
 "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: [PATCH] usb: dwc3: Support for USB3340x ULPI PHY, via
 "snps,enable_xcvrdly_quirk"
Message-ID: <20260225134959.39e775ff@ingpc2.intern.lauterbach.com>
In-Reply-To: <20260225000512.tle2eu4gkd4ut6bf@synopsys.com>
References: <20260224141438.39524-1-ingo.rohloff@lauterbach.com>
	<20260225000512.tle2eu4gkd4ut6bf@synopsys.com>
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
X-Bm-Transport-Timestamp: 1772023799563
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33697-lists,linux-usb=lfdr.de];
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
	NEURAL_HAM(-0.00)[-1.000];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,synopsys.com:email,lauterbach.com:url,lauterbach.com:email,ingpc2.intern.lauterbach.com:mid]
X-Rspamd-Queue-Id: 280141979E1
X-Rspamd-Action: no action

On Wed, 25 Feb 2026 00:05:17 +0000
Thinh Nguyen <Thinh.Nguyen@synopsys.com> wrote:

> > +	/*
> > +	 * Fixes High-speed negotiation issue with USB3340, see:
> > +	 * https://.../80000645A.pdf
> > +	 *    "Device Enumeration Failure with Link IP Systems"  
> 
> This platform specific info and how it was found should go into the
> commit message and not here.
>

Done.

> > +	 * According to documentation on the Internet,  
> 
> We should not just reference the "Internet". If you want to reference
> some documentation, please provide the DWC_usb3x document section and
> version.
>

I would love to, but Synopsys was completely unwilling to provide
a programming manual to me.

Synopsys told me I should contact Xilinx (now AMD) for access to the
programming manual; and of course Xilinx refused, because Xilinx
has signed an NDA.

The "Internet" was the only source, where I found this information.
The description I provide is from the forum post I now mention in the
commit message.
I put the description in the code, because I am afraid, that the forum
post vanishes and then this information is lost to the public.

I guess, if I were to gain access to the official programming manual,
citing it might be a violation of the NDA I likely would have signed,
but I am not a lawyer.

> 
> > +	 * DWC3_GUSB2PHYCFG_XCVRDLY:
> > +	 *    Adds a delay between the assertion of the
> > +	 *    ULPI Transceiver Select signal (for HS) and  
> 
> It can be for both ULPI and UTMI.
> 

Ah of course :-)
I now mention both: ULPI/UTMI.


> > +	dwc->enable_xcvrdly_quirk = device_property_read_bool(dev,
> > +				"snps,enable_xcvrdly_quirk");  
> 
> Use "-" instead of "_" for property name, and change it to
> "snps,enable-usb2-transceiver-delay"
> 
> ...
> > +	unsigned		enable_xcvrdly_quirk:1;  
> 
> Document the new field. Rename to enable_usb2_transceiver_delay.

Done.
Note: I used "-" before to avoid having different strings for the
member variable and the property name to make it easier to grep
for both at the same time.

> Also, how are you passing this quirk? Through devicetree or software
> node? I don't see the user of this property.
> 

On the hardware I have got (Xilinx Ultrascale+ ZynqMP) I pass it via
devicetree. I now added a 2nd commit, which adds documentation for the
devicetree bindings.

with best regards
  Ingo Rohloff

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
Managing Directors: Lothar Lauterbach, Stephan Lauterbach, Dr. Thomas Ullmann

-------------------------------------------------------------------------

