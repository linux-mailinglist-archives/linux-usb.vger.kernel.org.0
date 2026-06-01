Return-Path: <linux-usb+bounces-38262-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AAmVG40AHmrDgQkAu9opvQ
	(envelope-from <linux-usb+bounces-38262-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 01 Jun 2026 23:58:37 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C0C63625B71
	for <lists+linux-usb@lfdr.de>; Mon, 01 Jun 2026 23:58:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1E1D7302B75A
	for <lists+linux-usb@lfdr.de>; Mon,  1 Jun 2026 21:55:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F242B37F724;
	Mon,  1 Jun 2026 21:55:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lDuneMgC"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BA5D282F10;
	Mon,  1 Jun 2026 21:55:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780350927; cv=none; b=INORgYoAnkzI+IDs1WCSwkaWwKr4sm6MBrrerT1YlLHcggiHwzQHghuuPqhU3hV17/WyCCcaSCWT67Bq8jkquX8Dv+ZCPlnhGp0j0Gkaa73PgaQS58m71NJBwKLKfuj7v2kSnfk4+miGbD1n1miZ7c2u6Vhc94d7129JphsNqJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780350927; c=relaxed/simple;
	bh=OPW7t2+scf7awova5FPOoTQNVM4dIqp3OEtLYGNHxRE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FjTjJ6c1MVE1mAiNCxAG9HAo3laE7Kq22O/3D6qNCFVxsfz9RzPttXXqvEx/BeeDRNKIuvU22Uw61sc3kHHuX1pfQLbvncDN/evz2+n8EEb3DAZCbkhmb30jiyzBO/XGCBbaOFEIXlsygrT+Y3BSkyBUDJigqEjr3OLKT+kO8Zs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lDuneMgC; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2DEA1F00893;
	Mon,  1 Jun 2026 21:55:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780350926;
	bh=Btd7ETiVGpwE7oNRY8Tbs8MqaEa31ijMp/j+iytSgS0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=lDuneMgCbrJYW+2aAqXGd1O172kgGoI3AnwmqFoacxgXNKX2JQlwpONWVoMyLH06Y
	 +3fy6YDReRQBpMEhm2WmCm/MZoNqOehMyvT1L2gFsX5Tn0p33aBbRUAYITX6euXyd9
	 UY8bgO/Gz0Ooa42fF1aHOQcEIEbM4CXYGVIxcLaJcMcMXB9HPK4OenmXy3BFuHopbw
	 uCbLq0RxhWGu6jjiiXtRTYl3cs9gW6CM41d+0kJKWACmUm3yb3FbV+w7uKESeAngHA
	 16GAgq3kGN5C6nVHYjo5yu5lGcWVECBprcxL5X3JnTqzy3XMxbqlD3QNNiOa95VXP9
	 8Ygb5VrUfrDuA==
Date: Mon, 1 Jun 2026 16:55:25 -0500
From: Rob Herring <robh@kernel.org>
To: Conor Dooley <conor@kernel.org>
Cc: Pawel Laszczak <pawell@cadence.com>, Peter Chen <peter.chen@kernel.org>,
	Roger Quadros <rogerq@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v8 1/2] dt-bindings: usb: cdns3: Add cdns,cdnsp-no-drd
 compatible string
Message-ID: <20260601215525.GA4114052-robh@kernel.org>
References: <20260515-b4-no_drd_config-v8-0-75cb05317679@cadence.com>
 <20260515-b4-no_drd_config-v8-1-75cb05317679@cadence.com>
 <20260515-trinity-unthawed-c5ab5d7783f2@spud>
 <PH7PR07MB9538E14BE6778498A48FECEBDD002@PH7PR07MB9538.namprd07.prod.outlook.com>
 <20260519-defog-spiritual-2eeebb390ba7@spud>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260519-defog-spiritual-2eeebb390ba7@spud>
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-38262-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,cadence.com:email]
X-Rspamd-Queue-Id: C0C63625B71
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, May 19, 2026 at 06:49:36PM +0100, Conor Dooley wrote:
> On Tue, May 19, 2026 at 08:47:30AM +0000, Pawel Laszczak wrote:
> > >
> > >On Fri, May 15, 2026 at 01:24:38PM +0200, Pawel Laszczak via B4 Relay wrote:
> > >> From: Pawel Laszczak <pawell@cadence.com>
> > >>
> > >> Introduce a new compatible string 'cdns,cdnsp-no-drd' for Cadence
> > >> USBSS/USBSSP controllers to support hardware configurations where the
> > >> Dual-Role Device (DRD) register block is missing or inaccessible.
> > >>
> > >> This change follows the recommendation to imply hardware limitations
> > >> directly from the compatible string rather than using a dedicated
> > >> boolean property.
> > >>
> > >> When 'cdns,cdnsp-no-drd' is used:
> > >> - The 'otg' register and interrupt resources are not required.
> > >> - The 'reg' and 'interrupts' properties are restricted to 2 items
> > >>   (host and device).
> > >> - 'dr_mode' must be explicitly set to either 'host' or 'peripheral'.
> > >>
> > >> The standard 'cdns,usb3' compatible remains unchanged, maintaining
> > >> backward compatibility by requiring all 3 resource sets (otg, host, dev).
> > >>
> > >> Signed-off-by: Pawel Laszczak <pawell@cadence.com>
> > >> ---
> > >> v8:
> > >> - Update commit message to reflect schema changes.
> > >> - Removed 'cdns,no-drd' boolean property as per Rob Herring's suggestion.
> > >> - Introduced a new compatible string 'cdns,cdnsp-no-drd' for controller
> > >>   variants that lack the DRD/OTG register block.
> > >>
> > >> v7:
> > >> - Rename 'no_drd' to 'cdns,no-drd'.
> > >> - Update commit message to reflect property renaming and schema
> > >changes.
> > >> - Simplify 'reg-names' using a single enum.
> > >> - Revert 'interrupt-names' to a list of constants.
> > >> - Move 'reg' item descriptions to if/else blocks for accuracy.
> > >> - Clean up 'if/then' logic (remove redundant checks).
> > >> - Add explicit 'items' list for 'interrupt-names' in the 'else' block.
> > >>
> > >> v6:
> > >> - Fixed validation error for 'interrupt-names' by correcting
> > >>   the items definition.
> > >> - Adjusted 'minItems'/'maxItems' to properly support the optional
> > >>  'wakeup' interrupt.
> > >> - Fixed 'too long' schema error in examples.
> > >>
> > >> v5:
> > >> - Implemented strict conditional validation using if-then-else logic.
> > >> - Enforced 2 register/interrupt items and required 'dr_mode'
> > >>   (host or peripheral) when 'no_drd' is present.
> > >> - Enforced the standard 3 register/interrupt items (otg, host, dev)
> > >>   when 'no_drd' is absent to ensure backward compatibility.
> > >> - Updated 'reg-names' and 'interrupt-names' to use enums in the main
> > >>   properties section to support flexible resource ordering during
> > >>   validation.
> > >> ---
> > >> ---
> > >>  .../devicetree/bindings/usb/cdns,usb3.yaml         | 60
> > >++++++++++++++++++----
> > >>  1 file changed, 50 insertions(+), 10 deletions(-)
> > >>
> > >> diff --git a/Documentation/devicetree/bindings/usb/cdns,usb3.yaml
> > >b/Documentation/devicetree/bindings/usb/cdns,usb3.yaml
> > >> index 2d95fb7321af..7b0aa9c4a2bd 100644
> > >> --- a/Documentation/devicetree/bindings/usb/cdns,usb3.yaml
> > >> +++ b/Documentation/devicetree/bindings/usb/cdns,usb3.yaml
> > >> @@ -17,22 +17,22 @@ description:
> > >>
> > >>  properties:
> > >>    compatible:
> > >> -    const: cdns,usb3
> > >> +    enum:
> > >> +      - cdns,usb3
> > >> +      - cdns,cdnsp-no-drd
> > >
> > >I doubt this is what Rob meant, he asked for soc-specific compatibles
> > >and this is generic. A soc-specific compatible would be something like
> > >microchip,newsoc-usb3
> > 
> > Hi Conor, Rob
> > 
> > To clarify the hardware situation: I am developing and testing this on
> > an FPGA development board connected via pure PCI, without any Device Tree.
> > I do not have a specific SoC platform, nor do I know what silicon target
> > the end customers will use in the future.
> > Introducing a fake SoC-specific compatible string just to pass the DT
> > validation feels misleading and unnecessary.
> > 
> > Since cdns,usb3 is already an established generic compatible, and we
> > cannot use a generic configuration string like cdns,cdnsp-no-drd,
> > the cleanest way forward is to make this resource-driven instead of
> > compatible-driven.
> > 
> > In v9, I propose to:
> >  - Keep only the existing cdns,usb3 compatible.
> >  - Update cdns,usb3.yaml to allow minItems: 2 for reg and reg-names
> >    if dr_mode is explicitly set to "host" or "peripheral" (indicating
> >    that the OTG register block is absent).
> >  - In the driver code, determine the lack of DRD dynamically if the "otg"
> >    resource/register block is missing.
> > 
> > This elegantly solves the issue for my PCI/FPGA platform (where I just
> > won't pass the "otg" resource), complies with DT practices, and leaves
> > the door open for any future customer SoC to use cdns,usb3 with
> > standard dr_mode constraints.
> > 
> > Does this approach look acceptable to you?
> 
> Not really. I want enforcement of the correct properties in the binding,
> not permission of multiple different combinations.
> 
> Perhaps we could go back to the original cdns,usbssp compatible and
> leave an empty slot for the soc-specific compatibles, like:
>       - items:
>           - {}
>           - const: sifive,clint2        # SiFive CLINT v2 IP block
> 
> That way you can proceed with this effort without a soc-compatible
> but we don't end up permitting a generic compatible.

That sounds good to me.

Rob

