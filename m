Return-Path: <linux-usb+bounces-33853-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iBuvLyM8pWne6QUAu9opvQ
	(envelope-from <linux-usb+bounces-33853-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 02 Mar 2026 08:28:35 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 23F1A1D3E69
	for <lists+linux-usb@lfdr.de>; Mon, 02 Mar 2026 08:28:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CE12C3026C1A
	for <lists+linux-usb@lfdr.de>; Mon,  2 Mar 2026 07:28:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 47C1B32AABD;
	Mon,  2 Mar 2026 07:28:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KjrpJuT1"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C66253803F2;
	Mon,  2 Mar 2026 07:28:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772436489; cv=none; b=ff5lbaCAXKMrQVowiD7mrF4+6p1+g2bENo2Qc6a5NWwg1Yzy3qXc7nKYy2naM2OgTjXAE78xl533kFu45ngMyvDTa5pQCtORak5AfBG1hLzCn3vCaj5S+OvOwosXLaJgT/UJ9SaTBMF+7pYM9uHZUuwm6R87jUhDFjt5TTRT21w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772436489; c=relaxed/simple;
	bh=ly8HT51Rpj1MK01hp0bH0zBk7g8xc2eK/NzfIj5fkzk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Z7KDnUdKUjFLAK49gKnRTiZRoFPexj+Ugsw/2jTPlxDB0CTBCX1jxif7Rc8JZxr49BCLr1nZ7G4VUGNkorMmUOmunuZRjr71tJz+IplSjWOO1NVYCVM01ALHyc65Y22pjPGzadlB0G+Wek/v68WcTxxB0m1q1upQdG0dVyLDPt8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KjrpJuT1; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DFFC9C2BC9E;
	Mon,  2 Mar 2026 07:28:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772436489;
	bh=ly8HT51Rpj1MK01hp0bH0zBk7g8xc2eK/NzfIj5fkzk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KjrpJuT1ApWRTzEvi26BSgWCrT0v9YW5HqBUL3NqbAD0203eG0lEG3zqF7Rz9MaFW
	 bgFnHgTR5xSMquOOVdhLE42OXMJaieL1LMDdwybtoeGC1iLxnwMMPXZoJ0vNe2WbkR
	 eOWhUu0F9L2uHW7SYkP9y0x4PzxMD4kI7KGyxWNONzjnVIIBNvl/PU1iC6CoC8BDka
	 fgLzm4T5Csps77KNaEzMoXyd6wIguhLvuXBCcfUmsCoYwWVhTCRBA0rHoJprvuZrGu
	 zQ0Kn7f/I95aGB2ccW+/xdbThHAChwxjsfl0NXbUWh3FPR0qU05qZmhnCc9bD5n2oZ
	 kEgA3S5dM25Hg==
Date: Mon, 2 Mar 2026 08:28:07 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Peter Chen <peter.chen@cixtech.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	gregkh@linuxfoundation.org, pawell@cadence.com, rogerq@kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
	cix-kernel-upstream@cixtech.com
Subject: Re: [PATCH 2/2] dt-bindings: usb: cdns,usb3: Add support for USBSSP
Message-ID: <20260302-vengeful-delicate-macaw-e8dc8c@quoll>
References: <20260302030339.324196-1-peter.chen@cixtech.com>
 <20260302030339.324196-3-peter.chen@cixtech.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260302030339.324196-3-peter.chen@cixtech.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33853-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[cixtech.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,devicetree.org:url,cadence.com:email]
X-Rspamd-Queue-Id: 23F1A1D3E69
X-Rspamd-Action: no action

On Mon, Mar 02, 2026 at 11:03:34AM +0800, Peter Chen wrote:
> Extend the Cadence USBSS DRD binding to also cover the USBSSP
> controller by adding "cdns,usbssp" to the compatible enum.
> 
> The USBSSP is the next-generation Cadence USB controller IP. It adds
> SuperSpeed Plus (USB 3.1 gen2x1, 10 Gbps) support and uses an
> XHCI-based device controller. The register layout and resource model
> (otg/xhci/dev memory regions; host/peripheral/otg interrupts) are
> identical to the USBSS, so both controllers share the same binding
> and the same platform driver (cdns3-plat.c).
> 
> Changes to the binding:
> - compatible: const -> enum with cdns,usb3 and cdns,usbssp
> - maximum-speed: add super-speed-plus
> - Add USBSSP example
> 
> This patch was developed with assistance from Anthropic Claude Opus 4.6.

Use proper tag, but expect pushback of microslop crap.

> 
> Signed-off-by: Peter Chen <peter.chen@cixtech.com>
> ---
>  .../devicetree/bindings/usb/cdns,usb3.yaml    | 36 +++++++++++++++++--
>  1 file changed, 33 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/usb/cdns,usb3.yaml b/Documentation/devicetree/bindings/usb/cdns,usb3.yaml
> index f454ddd9bbaa..f79333e7fc1f 100644
> --- a/Documentation/devicetree/bindings/usb/cdns,usb3.yaml
> +++ b/Documentation/devicetree/bindings/usb/cdns,usb3.yaml
> @@ -4,14 +4,22 @@
>  $id: http://devicetree.org/schemas/usb/cdns,usb3.yaml#
>  $schema: http://devicetree.org/meta-schemas/core.yaml#
>  
> -title: Cadence USBSS-DRD controller
> +title: Cadence USBSS/USBSSP DRD controller
>  
>  maintainers:
>    - Pawel Laszczak <pawell@cadence.com>
>  
> +description:
> +  Cadence USB dual-role controllers. USBSS (cdns,usb3) supports up to
> +  SuperSpeed (USB 3.0). USBSSP (cdns,usbssp) is the next generation with
> +  SuperSpeed Plus (USB 3.1 gen2x1) and XHCI-based device controller. Both
> +  share the same register layout and resource model.

So are compatible or not?

> +
>  properties:
>    compatible:
> -    const: cdns,usb3
> +    enum:
> +      - cdns,usb3
> +      - cdns,usbssp

Why do we need another generic compatible?

And why do you add it now to each of device schemas using this one?


>  
>    reg:
>      items:
> @@ -49,7 +57,7 @@ properties:
>        cdns3 to type C connector.
>  
>    maximum-speed:
> -    enum: [super-speed, high-speed, full-speed]
> +    enum: [super-speed-plus, super-speed, high-speed, full-speed]
>  
>    phys:
>      minItems: 1
> @@ -90,6 +98,7 @@ unevaluatedProperties: false
>  
>  examples:
>    - |
> +    // USBSS example (SuperSpeed)
>      #include <dt-bindings/interrupt-controller/arm-gic.h>
>      bus {
>          #address-cells = <2>;
> @@ -109,3 +118,24 @@ examples:
>              dr_mode = "otg";
>          };
>      };
> +  - |
> +    // USBSSP example (SuperSpeed Plus)
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    bus {

No, drop entire example. It's the same as other.

Best regards,
Krzysztof


