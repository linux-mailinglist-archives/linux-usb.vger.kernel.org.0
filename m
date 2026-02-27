Return-Path: <linux-usb+bounces-33779-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cJpACmF6oWkUtgQAu9opvQ
	(envelope-from <linux-usb+bounces-33779-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Fri, 27 Feb 2026 12:05:05 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 915D71B6570
	for <lists+linux-usb@lfdr.de>; Fri, 27 Feb 2026 12:05:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3F358302736F
	for <lists+linux-usb@lfdr.de>; Fri, 27 Feb 2026 11:04:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E44E03E95A0;
	Fri, 27 Feb 2026 11:04:42 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from bm.lauterbach.com (bm.lauterbach.com [62.154.241.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6FBA32FA22
	for <linux-usb@vger.kernel.org>; Fri, 27 Feb 2026 11:04:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.154.241.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772190282; cv=none; b=KSezVUXJscIG3ZQQEPLLzebTRvbPvN3MsVEqpvLS0ZQna4HtPemxb1KGzm5C8knuHgZ/wY5MOtmlE8QqUs5KNSB+MO2HssbV5d4h8AyrbYn04CsSuhW9tcMseCZS5z8aOqe9mcDW5vSFbNkGTM3D2ulON2k5qD0S2e/fwZgY1d8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772190282; c=relaxed/simple;
	bh=A0ppAcSej9kxsgncKKPoe2xhPs3IOda1FlbegBy6jME=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=l/eBjslUW7pQ/1H/+sMefE+Hffr4usEJxRUEmZlM0UfK2sPDWxhL1K9qGpk2CsivXlPlMVW4SxN71DvOtEmSzM8Ywfd666mz+RLgfgFW12OFR+dMiaDwbqJttp5ZZiugNbhgUl0knc5OhzqHTB1uTdmZuv9nLPR8gEOd/QNtpQU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lauterbach.com; spf=pass smtp.mailfrom=lauterbach.com; arc=none smtp.client-ip=62.154.241.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lauterbach.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lauterbach.com
Received: from ingpc2.intern.lauterbach.com (unknown [10.2.10.44])
	(Authenticated sender: ingo.rohloff@lauterbach.com)
	by bm.lauterbach.com (Postfix) with ESMTPSA id D298ED6161BA;
	Fri, 27 Feb 2026 12:04:36 +0100 (CET)
Date: Fri, 27 Feb 2026 12:04:36 +0100
From: Ingo Rohloff <ingo.rohloff@lauterbach.com>
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, "linux-usb@vger.kernel.org"
 <linux-usb@vger.kernel.org>
Subject: Re: [PATCH v2 2/2] dt-bindings: usb: dwc3: Add property to insert
 delay before TxValid.
Message-ID: <20260227120436.6f4e68a9@ingpc2.intern.lauterbach.com>
In-Reply-To: <20260227002003.gznbxapvqr3slc2o@synopsys.com>
References: <20260225000512.tle2eu4gkd4ut6bf@synopsys.com>
	<20260225130323.24606-1-ingo.rohloff@lauterbach.com>
	<20260225130323.24606-3-ingo.rohloff@lauterbach.com>
	<9d59395b-ae39-40b3-af21-75468ec34cd8@kernel.org>
	<20260226171224.3ab6b68f@ingpc2.intern.lauterbach.com>
	<20260226190432.jq6c3gxwy6dydwpc@synopsys.com>
	<20260227002003.gznbxapvqr3slc2o@synopsys.com>
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
X-Bm-Transport-Timestamp: 1772190276911
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33779-lists,linux-usb=lfdr.de];
	RCPT_COUNT_THREE(0.00)[3];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	HAS_ORG_HEADER(0.00)[];
	DMARC_NA(0.00)[lauterbach.com];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	REDIRECTOR_URL(0.00)[urldefense.com];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ingo.rohloff@lauterbach.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,urldefense.com:url,lauterbach.com:url,lauterbach.com:email]
X-Rspamd-Queue-Id: 915D71B6570
X-Rspamd-Action: no action

On Fri, 27 Feb 2026 00:20:10 +0000
Thinh Nguyen <Thinh.Nguyen@synopsys.com> wrote:
> On Thu, Feb 26, 2026, Thinh Nguyen wrote:
> > On Thu, Feb 26, 2026, Ingo Rohloff wrote:  
> > > On Thu, 26 Feb 2026 11:51:27 +0100
> > > Krzysztof Kozlowski <krzk@kernel.org> wrote:
> > >   
> > > > On 25/02/2026 14:03, Ingo Rohloff wrote:  
> > > > > The Microchip USB3340x ULPI PHY requires a delay when switching
> > > > > to the high-speed transmitter. See:
> > > > >     https://urldefense.com/v3/__http://ww1.microchip.com/downloads/en/DeviceDoc/80000645A.pdf__;!!A4F2R9G_pg!YRzZkLTZr5Bhh57FiXmyq7e4wVPHUbXZdgH3a627O2kbzpOTPiw_1MKGc_zD5cr8_Y-r1h5XvyFL9c7YRNObAl-lmUNgSuU$ 
> > > > >     Module 2 "Device Enumeration Failure with Link IP Systems"
> > > > >  
> > > > 
> > > > So that's deducible from the compatible and you do not need this
> > > > property at all?
> > > >   
> > >   
> 
> After reading Ingo's comment again, I don't think we can simply deduct
> whether this property is needed from just the Xilinx dwc3 compatible.
> I think this one may need its own devicetree property.

Krzystof gave me another idea though:
In drivers/usb/dwc3/ulpi.c the dwc3 code will call dwc3_ulpi_init(),
if the DWC3 controller is connected via ULPI to an USB ULPI PHY.

dwc3_ulpi_init() will call ulpi_register_interface(), which 
(under the right circumstances) will call ulpi_read_id().

At this point in time it would be easy to use
dwc3_ulpi_read()/dwc3_ulpi_write() to read out the
  USB ULPI PHY VendorID/ProductID
by mimicking the behavior of ulpi_read_id() from drivers/usb/common/ulpi.c

Based on the VendorID/ProductID we then could set
   dwc3->enable_usb2_transceiver_delay
if necessary.

This approach means:
* No new device tree property necessary.
* Code autodetects the problematic combo of DWC3 + USB3340 ULPI PHY
  and applies the necessary settings.
* Will work for any combination of DWC3 IP + USB3340 ULPI PHY,
  and not only for the  Xilinx specific DWC3 implementation.
* Future proof: If there ever is another ULPI PHY, which needs special
  settings in the DWC3 controller, you could then just extend the
  code to detect this new ULPI PHY and apply the necessary settings.

Caveat:
You have the code to read out the ULPI PHY VendorID/ProductID twice:
* Once in ulpi_read_id() from drivers/usb/common/ulpi.c
* Once in drivers/usb/dwc3/ulpi.c

I do not see any easy way to get access to the VendorID/ProductID
from ulpi_read_id(); in particular because right now this function
is only called if the ULPI PHY has a corresponding node in the
device tree, which currently is not the case.
Meaning right now ulpi_read_id() is NOT called.

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

