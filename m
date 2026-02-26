Return-Path: <linux-usb+bounces-33762-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eFr9NN2toGnDlgQAu9opvQ
	(envelope-from <linux-usb+bounces-33762-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 26 Feb 2026 21:32:29 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D8831AF2C0
	for <lists+linux-usb@lfdr.de>; Thu, 26 Feb 2026 21:32:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 97492303FFE4
	for <lists+linux-usb@lfdr.de>; Thu, 26 Feb 2026 20:27:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8252044B693;
	Thu, 26 Feb 2026 20:27:52 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from bm.lauterbach.com (bm.lauterbach.com [62.154.241.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBF142DE70B
	for <linux-usb@vger.kernel.org>; Thu, 26 Feb 2026 20:27:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.154.241.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772137672; cv=none; b=JKlUrSKWraYwLn1loutgf5q9+kKB8Oo87ZhK0jCGaZ/TlKDSlsGQI9fM+0bC+jpnA3GWhgZWN/04Gr+hK0Ouzo+Q7cU/TRoMFDjOy2hNreUEFLstXjlsVFyU5xJeB+uko1PTBVJ3+4nY56Bb2K3xNrYyGVP9W3JfMOLZfXEAPig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772137672; c=relaxed/simple;
	bh=roUtyCSj8n8yQMr2dtUL3d5Igzhd8Fag/RONgvmBPAs=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JtW5zOH/phSfN9xcPtPXAiy4aZgf5uuiqHFCp7foUp2EiYnI/geBT8mqDLv5wbelWwIWpDjh1TfV+LRlfpokAiBMOaLfENGblBVDen2b7ubexZAwHINo876HSGT3V9vsGyErVDl0oKiRJAwcseBZDhCdpycoI1WYr5QZG4vryDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lauterbach.com; spf=pass smtp.mailfrom=lauterbach.com; arc=none smtp.client-ip=62.154.241.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lauterbach.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lauterbach.com
Received: from ingpc2.intern.lauterbach.com (unknown [10.2.10.44])
	(Authenticated sender: ingo.rohloff@lauterbach.com)
	by bm.lauterbach.com (Postfix) with ESMTPSA id 0E2DDCFC67D8;
	Thu, 26 Feb 2026 21:27:47 +0100 (CET)
Date: Thu, 26 Feb 2026 21:27:46 +0100
From: Ingo Rohloff <ingo.rohloff@lauterbach.com>
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
 "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: [PATCH] usb: dwc3: Support for USB3340x ULPI PHY, via
 "snps,enable_xcvrdly_quirk"
Message-ID: <20260226212746.7a4b95a6@ingpc2.intern.lauterbach.com>
In-Reply-To: <20260226192645.aban6dcocehjq7ra@synopsys.com>
References: <20260224141438.39524-1-ingo.rohloff@lauterbach.com>
	<20260225000512.tle2eu4gkd4ut6bf@synopsys.com>
	<20260225134959.39e775ff@ingpc2.intern.lauterbach.com>
	<20260226023935.ge3vlasodrrnhq6o@synopsys.com>
	<20260226123200.643e0ddd@ingpc2.intern.lauterbach.com>
	<20260226192645.aban6dcocehjq7ra@synopsys.com>
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
X-Bm-Transport-Timestamp: 1772137667061
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33762-lists,linux-usb=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,lauterbach.com:url,lauterbach.com:email]
X-Rspamd-Queue-Id: 3D8831AF2C0
X-Rspamd-Action: no action

Hello Thinh,

Thank you for being patient!

I still don't really understand, or maybe there is a general
misunderstanding.

> On Thu, Feb 26, 2026, Ingo Rohloff wrote:
> > Do you mean to read in a dwc3_xlnx_driver specific device tree property
> > and then pass this via software node to the main DWC3 driver?  
> 
> Not some device tree property, but the compatible string for your
> specific platform.

I am not sure what "platform" means here:

My platform is a custom made PCB my company manufactures,
which is part of a product we sell.

On this PCB is a Xilinx Ultrascale+ ZynqMP chip connected to
a Microchip USB3340 chip (and of course more non USB related chips).

The dwc3_xlnx_of_match[] in drivers/usb/dwc3/dwc3-xilinx.c 
lists only these two devices, which are FPGAs from Xilinx.


	{
		.compatible = "xlnx,zynqmp-dwc3",
		.data = &dwc3_xlnx_init_zynqmp,
	},
	{
		.compatible = "xlnx,versal-dwc3",
		.data = &dwc3_xlnx_init_versal,
	}

We use the first entry "xlnx,zynqmp-dwc3".

Do you mean these entries, when you say "platform" ?


I could add a
	{
		.compatible = "lauterbach,powerdebug-v1-zynqmp-dwc3",
		.data = &dwc3_xlnx_init_zynqmp,
	},

and then use this "compatible" match to pass a property
to the DWC3 driver to set the XCVRDLY bit.

But this particular entry then refers to some
completely specific PCB from my company, which is not publicly
available (except as part of the product we sell).

I don't think that you mean I should add another entry to
dwc3_xlnx_of_match[] ?

So I still don't understand to which "compatible" string you refer to.


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

