Return-Path: <linux-usb+bounces-33736-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wHG6GEEvoGkrgAQAu9opvQ
	(envelope-from <linux-usb+bounces-33736-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 26 Feb 2026 12:32:17 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B460D1A5100
	for <lists+linux-usb@lfdr.de>; Thu, 26 Feb 2026 12:32:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7466E306F002
	for <lists+linux-usb@lfdr.de>; Thu, 26 Feb 2026 11:32:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 661A4372B59;
	Thu, 26 Feb 2026 11:32:12 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from bm.lauterbach.com (bm.lauterbach.com [62.154.241.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B32C363C63
	for <linux-usb@vger.kernel.org>; Thu, 26 Feb 2026 11:32:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.154.241.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772105532; cv=none; b=C5JRzFVzn741loTFI+BgauVfo+cm7BoEcWqdITT8NYd6ghvHAHjxrXx2AwmanXhqdMRFpUE0KHYzHi+Q5A6ek0jXOFHOTroJoMtTr4hotTHwNqCOiB9lap5PJIYkiNIJgqCLbAH6m13Xc8Rkluxwmcvivhj25ohm6ePprJK86Q8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772105532; c=relaxed/simple;
	bh=vHDrWu1363DVgA1wKFPFGleIZ3tTRBOo+yTaOxHok8M=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=EJLYJXNwfqFbxb6uC1GjuDFfp+UMFaK3ExL06jTalnnHH3D9yCmPlpg5obsoCoFAwtiPPAWipYn9T9/6U89DkSyqBoPcvRyI9XvfD1d98e7ljmaOmETvcuDN+WmvgWaJsWz5XRDix6CeIUsE28w+xg4gzznOThoJBC5H2sVSN8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lauterbach.com; spf=pass smtp.mailfrom=lauterbach.com; arc=none smtp.client-ip=62.154.241.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lauterbach.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lauterbach.com
Received: from ingpc2.intern.lauterbach.com (unknown [10.2.10.44])
	(Authenticated sender: ingo.rohloff@lauterbach.com)
	by bm.lauterbach.com (Postfix) with ESMTPSA id C9317121710C2;
	Thu, 26 Feb 2026 12:32:00 +0100 (CET)
Date: Thu, 26 Feb 2026 12:32:00 +0100
From: Ingo Rohloff <ingo.rohloff@lauterbach.com>
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
 "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: [PATCH] usb: dwc3: Support for USB3340x ULPI PHY, via
 "snps,enable_xcvrdly_quirk"
Message-ID: <20260226123200.643e0ddd@ingpc2.intern.lauterbach.com>
In-Reply-To: <20260226023935.ge3vlasodrrnhq6o@synopsys.com>
References: <20260224141438.39524-1-ingo.rohloff@lauterbach.com>
	<20260225000512.tle2eu4gkd4ut6bf@synopsys.com>
	<20260225134959.39e775ff@ingpc2.intern.lauterbach.com>
	<20260226023935.ge3vlasodrrnhq6o@synopsys.com>
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
X-Bm-Transport-Timestamp: 1772105520839
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33736-lists,linux-usb=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,lauterbach.com:url,lauterbach.com:email,synopsys.com:email]
X-Rspamd-Queue-Id: B460D1A5100
X-Rspamd-Action: no action

Hello Thinh,

On Thu, 26 Feb 2026 02:39:46 +0000
Thinh Nguyen <Thinh.Nguyen@synopsys.com> wrote:

> > > Also, how are you passing this quirk? Through devicetree or software
> > > node? I don't see the user of this property.
> > >   
> > 
> > On the hardware I have got (Xilinx Ultrascale+ ZynqMP) I pass it via
> > devicetree. I now added a 2nd commit, which adds documentation for the
> > devicetree bindings.
> >   
> 
> You should pass this via software node through the glue driver. I don't
> think there's enough justification to create a new devicetree property
> just for this.

Please help me to understand:
I think the glue driver you are referring to is the Xilinix specific one,
so the one in `drivers/usb/dwc3/dwc3-xilinx.c`, which declares
`dwc3_xlnx_driver`.

Is this what you mean?

I think I understand how to create a software node there and how to pass
it to the main dwc3 driver.

Do you mean to read in a dwc3_xlnx_driver specific device tree property
and then pass this via software node to the main DWC3 driver?

I am wondering if the dwc3_xlnx_driver is the right place for this.

Please let me explain:

The origin of the failing high-speed negotiation is not because
of the ZynqMP specific hardware (so this particular specific DWC3
implementation), but because of the externally connected 
Microchip USB3340 ULPI PHY.

Meaning: Any DWC3 implementation which is connected to this particular
external ULPI PHY will have this high-speed negotiation problem.

On the other hand: If you connect a different ULPI PHY to the ZynqMP
DWC3 implementation, then this will work without any extra measures.
The Xilinx evaluation boards use other ULPI PHYs (USB3320), which is
why this problem didn't pop up with the Xilinx evaluation boards.

It's luck, that the dwc3 controller has a bit which allows it
to work together with this particular USB3340 ULPI PHY.

The property in the device tree describes the circuit implemented
on your hardware board:
If you have an externally USB3340 ULPI PHY connected to a 
DWC3 controller, then you have to set this new property.
If you have a different High-Speed USB PHY then you might not need
to set this property.
Of course this property will also help if you have a different
High-Speed PHY which has the same behavior as the USB3340 ULPI PHY
and so also requires setting the XCVRDLY bit.

I think any DWC3 implementation which allows to connect an external
ULPI PHY is affected by this problem.

So should I really move this property to the Xilinx specific glue driver?

with best regards
  Ingo

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

