Return-Path: <linux-usb+bounces-33873-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2AYbJKl7pWm6CAYAu9opvQ
	(envelope-from <linux-usb+bounces-33873-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 02 Mar 2026 12:59:37 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F35241D7FA6
	for <lists+linux-usb@lfdr.de>; Mon, 02 Mar 2026 12:59:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C9DF1303639B
	for <lists+linux-usb@lfdr.de>; Mon,  2 Mar 2026 11:54:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 661A03630B1;
	Mon,  2 Mar 2026 11:54:08 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from bm.lauterbach.com (bm.lauterbach.com [62.154.241.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A9A0175A7E
	for <linux-usb@vger.kernel.org>; Mon,  2 Mar 2026 11:54:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.154.241.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772452448; cv=none; b=d3E1mLeqCtCLU50gbN38797K/+YXdjSX7bydwK9TTQhZkCiPA0si4MD93KfHl+tAsSjRoKLp0Dj7B/JIsV70Jyshriv9RjzFGK+9wbZ0tp0lvedEVC4VXGYYEBw7yQ4rIobO3TF9l6mGO3XXvqXEEgyzpulp2OImW9+hthZYWnc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772452448; c=relaxed/simple;
	bh=8yP9hx+vBZWh2RoesXrf34JHrnsZnfPvV+AnLF/Q3yM=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JYu5C1BbyWJ8TYzB/ArO/sh+UnheVAEb1tSm/Xgm6iyFImZmLFp7BddFuejlSMeSKCJzF0X0RMYIeHq8OZh+SCEPhFH8j2YXDA0kdtnzJ2VEqeW/Ia4EjAcOjRO2z41RWRiUe3Apu5BmlZWDhdkEN2Q/PD8LYnrU8ariApxok9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lauterbach.com; spf=pass smtp.mailfrom=lauterbach.com; arc=none smtp.client-ip=62.154.241.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lauterbach.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lauterbach.com
Received: from ingpc2.intern.lauterbach.com (unknown [10.2.10.44])
	(Authenticated sender: ingo.rohloff@lauterbach.com)
	by bm.lauterbach.com (Postfix) with ESMTPSA id 6AD69D1F02FD;
	Mon, 02 Mar 2026 12:53:57 +0100 (CET)
Date: Mon, 2 Mar 2026 12:53:57 +0100
From: Ingo Rohloff <ingo.rohloff@lauterbach.com>
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
 "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: [PATCH v3 1/1] usb: dwc3: Support USB3340x ULPI PHY high-speed
 negotiation.
Message-ID: <20260302125357.16bac2df@ingpc2.intern.lauterbach.com>
In-Reply-To: <20260228005948.p4jniuf2zwws3ek5@synopsys.com>
References: <20260227133038.45150-1-ingo.rohloff@lauterbach.com>
	<20260227133038.45150-2-ingo.rohloff@lauterbach.com>
	<20260228005948.p4jniuf2zwws3ek5@synopsys.com>
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
X-Bm-Transport-Timestamp: 1772452437495
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33873-lists,linux-usb=lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.926];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: F35241D7FA6
X-Rspamd-Action: no action

Hello Thinh,

I hope I didn't cut out too much of the discussion:

> > --- a/drivers/usb/dwc3/ulpi.c
> > +++ b/drivers/usb/dwc3/ulpi.c
> >
> > +static void dwc3_ulpi_detect_quirks(struct dwc3 *dwc) 
> > +... 
> > +	switch (vendor_id) {
> > +	case USB_VENDOR_MICROCHIP:
> > +		switch (product_id) {
> > +		case 0x0009:
> > +			/* Microchip USB3340 ULPI PHY */
> > +			dwc->enable_usb2_transceiver_delay = true; 
> > ...
>
> 
> > --- a/drivers/usb/dwc3/core.c
> > +++ b/drivers/usb/dwc3/core.c
> >
> > +static void dwc3_hs_apply_ulpi_quirks(struct dwc3 *dwc)
> > +{
> > +   if (dwc->enable_usb2_transceiver_delay) {
> > +	    int index;
> > +       u32 reg;
> > +
> > +	   for (index = 0; index < dwc->num_usb2_ports; index++) {
> > +          reg = dwc3_readl(dwc->regs, DWC3_GUSB2PHYCFG(index));
> > +          reg |= DWC3_GUSB2PHYCFG_XCVRDLY;
> > +          dwc3_writel(dwc->regs, DWC3_GUSB2PHYCFG(index), reg);
> > +      }
> > +  }  
> > ...
>
> This should be placed in dwc3_ulpi_init() or dwc3_ulpi_detect_quirks().
>
> ...
>
> Do we really need this field enable_usb2_transceiver_delay anymore now
> that we have this check base on the ProductID?

I have thought about this, but I think I have to do it like above.

I think modifying the GUSB2PHYCFG in drivers/usb/dwc3/ulpi.c is the wrong
place.
"ulpi.c" currently doesn't touch the DWC3 controller itself at all.

It seems all of the config for GUSB2PHYCFG is done via `dwc3_core_init()`.
This function is also called for resuming operation after a suspend:

dwc3_plat_runtime_resume
  dwc3_runtime_resume
    dwc3_resume_common
      dwc3_core_init_for_resume
        dwc3_core_init

So I think the right place to modify GUSB2PHYCFG according to the detected
UPLI PHY is in dwc3_core_init().

Note: dwc3_core_init() detects the ULPI PHY only once:

   if (!dwc->ulpi_ready) {
      ...
      dwc->ulpi_ready = true;
   }

My previous v3 patch has the bug to call `dwc3_hs_apply_ulpi_quirks`
(to be renamed in v4) ONLY ONCE. I think that's wrong:

The strategy is: When the ULPI PHY is detected, set
   dwc->enable_usb2_transceiver_delay
if necessary.
Then use this bit to modify GUSB2PHYCFG if necessary:
* Once after the ULPI PHY is detected initially,
  via dwc3_core_probe().
* Each time operation is resumed after a suspend.
  That's why `dwc3_hs_apply_ulpi_quirks` has to be called
  each time dwc3_core_init() is called.


**ALTERNATIVE**
Store the found ULPI Vendor/Product ID in `struct dwc3` instead of the
`enable_usb2_transceiver_delay` boolean and then directly use the
ULPI Vendor/Product ID to apply the necessary config of GUSB2PHYCFG in
`dwc3_hs_apply_ulpi_quirks`.

What do you think?



I will try to incorporate all other feedback you gave me.

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

