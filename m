Return-Path: <linux-usb+bounces-33749-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qMdHG4CBoGn6kQQAu9opvQ
	(envelope-from <linux-usb+bounces-33749-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 26 Feb 2026 18:23:12 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 00F891AC44D
	for <lists+linux-usb@lfdr.de>; Thu, 26 Feb 2026 18:23:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 42F5C32AA9AA
	for <lists+linux-usb@lfdr.de>; Thu, 26 Feb 2026 16:43:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 118B03E8C6F;
	Thu, 26 Feb 2026 16:12:30 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from bm.lauterbach.com (bm.lauterbach.com [62.154.241.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AD43368967
	for <linux-usb@vger.kernel.org>; Thu, 26 Feb 2026 16:12:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.154.241.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772122349; cv=none; b=SxYLFxE8LxkMLAPevzI1sKyi6cdHtzBfmweJJI/MvAmpPMTdYe+6R4Q0bqwA/f5X9cc2OC+WlatFFmqAb4hvI9+4Uzfz6ZioH4DIznk/hxyfoPuWCz9KsyKY5bQci5Pmn0TkDoKtGiz+qiH+W1MMkHSDVt2Xw2UJATlVXP8li+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772122349; c=relaxed/simple;
	bh=eyP8TjwavLnPd/uf0N8VhxgNdhRvxWu1fuR/aW4Xe3E=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VXwIDcY1QEpN0tCZYEX7OYhxZnB1efGRQC5rpwBAo9XToi4Y4EH7G1DCHz4BAGXFW+yQHRG/U4xmFsdEyhZWKFd3AXRFXxgn9XqbJi1vhDAnNxg0vkTMEq7FaNlAJP42Ek5A+aXzbWYb836paL185BfylrR6OOFtTSuMc5Xkmrg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lauterbach.com; spf=pass smtp.mailfrom=lauterbach.com; arc=none smtp.client-ip=62.154.241.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lauterbach.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lauterbach.com
Received: from ingpc2.intern.lauterbach.com (unknown [10.2.10.44])
	(Authenticated sender: ingo.rohloff@lauterbach.com)
	by bm.lauterbach.com (Postfix) with ESMTPSA id D4FB98A0EA;
	Thu, 26 Feb 2026 17:12:24 +0100 (CET)
Date: Thu, 26 Feb 2026 17:12:24 +0100
From: Ingo Rohloff <ingo.rohloff@lauterbach.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Thinh.Nguyen@synopsys.com, linux-usb@vger.kernel.org
Subject: Re: [PATCH v2 2/2] dt-bindings: usb: dwc3: Add property to insert
 delay before TxValid.
Message-ID: <20260226171224.3ab6b68f@ingpc2.intern.lauterbach.com>
In-Reply-To: <9d59395b-ae39-40b3-af21-75468ec34cd8@kernel.org>
References: <20260225000512.tle2eu4gkd4ut6bf@synopsys.com>
	<20260225130323.24606-1-ingo.rohloff@lauterbach.com>
	<20260225130323.24606-3-ingo.rohloff@lauterbach.com>
	<9d59395b-ae39-40b3-af21-75468ec34cd8@kernel.org>
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
X-Bm-Transport-Timestamp: 1772122344927
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33749-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[lauterbach.com];
	RCVD_COUNT_THREE(0.00)[4];
	HAS_ORG_HEADER(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ingo.rohloff@lauterbach.com,linux-usb@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,microchip.com:url,get_maintainers.pl:url]
X-Rspamd-Queue-Id: 00F891AC44D
X-Rspamd-Action: no action

Hello Krzysztof,

On Thu, 26 Feb 2026 11:51:27 +0100
Krzysztof Kozlowski <krzk@kernel.org> wrote:

> On 25/02/2026 14:03, Ingo Rohloff wrote:
> > The Microchip USB3340x ULPI PHY requires a delay when switching to the
> > high-speed transmitter. See:
> >     http://ww1.microchip.com/downloads/en/DeviceDoc/80000645A.pdf
> >     Module 2 "Device Enumeration Failure with Link IP Systems"  
> 
> So that's deducible from the compatible and you do not need this
> property at all?
> 

Thanks for giving me a new idea :-)

The problem is, that the original device trees provided by Xilinx do not
mention the external ULPI PHY at all, which means I do not have a
"compatible" property to match to.

Additionally: The patch only works for the DWC3 controller, because this
particular USB controller has the necessary hardware support to insert the
needed delay.
Of course other USB controllers might not even need this fix at all,
because other controllers might always have the required delay.

Right now the patch by me uses a device tree property to tell the DWC3
controller to set the XCVRDLY bit to insert a delay (completely
autonomously done in hardware).

Which means: The system designer needs to know if this is necessary or
not, depending on the used ULPI PHY. If the delay is needed, the system
designer then sets the according device tree property.

I searched other device trees, but almost none of them have a device tree
"ulpi" node.

The DWC3 code does call ulpi_register_interface() and this function does
look for an "ulpi" device tree node (which currently doesn't exist in my
device tree).

By inserting such a device tree node, I can at least make
"drivers/usb/common/ulpi.c" read out the vendor and product ID of the ULPI
PHY via ulpi_read_id().

Using this product/vendor ID the DWC3 controller driver could
automatically set the XCVRDLY bit to support this particular PHY.

The condition is:
* If you have a DWC3 controller, which uses an external ULPI PHY
* and the external ULPI PHY is a Microchip USB3340 chip
  (detected via Vendor/Product ID)
then set the XCVRDLY bit in the DWC3 controller.

I am not sure what the right way is to implement this kind of automagic
and if this kind of automagic is wanted at all.

@Thinh: I need some advice:

Should the DWC3 controller really match to specific
ULPI Vendor/Product IDs to decide if to set the XCVRDLY bit or not?

How does the DWC3 controller get access to the
ULPI Vendor/Product ID or to the information that the XCVRDLY should be
set?

Reading the code I think an alternative way might be:
Implement a "struct ulpi_driver" for this specific USB3340 ULPI PHY.
Make this ulpi_driver create a software node to tell the DWC3 controller
to set the XCVRDLY bit.

Does this sound sensible at all?
This sounds like a lot of work to only fix this particular combination
of hardware.




> Please use scripts/get_maintainers.pl to get a list of necessary people
> and lists to CC....

I am sorry: I did not re-run get_maintainers.pl on v2 patch version.
I will do better for the next version.

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

