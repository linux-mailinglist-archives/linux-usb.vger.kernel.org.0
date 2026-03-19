Return-Path: <linux-usb+bounces-35094-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2O5+FA1xu2nSkAIAu9opvQ
	(envelope-from <linux-usb+bounces-35094-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 19 Mar 2026 04:44:13 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F6162C5A35
	for <lists+linux-usb@lfdr.de>; Thu, 19 Mar 2026 04:44:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id B635D30142A1
	for <lists+linux-usb@lfdr.de>; Thu, 19 Mar 2026 03:44:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35EED372B5F;
	Thu, 19 Mar 2026 03:44:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cjbmt1Kf"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B610A1F16B;
	Thu, 19 Mar 2026 03:44:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773891841; cv=none; b=dw5UFrmutuh7DevgS1e2HxcyFXPKaD1d+E6EYE5KwyV6ZPw1iraS31iIEdAErF6aHxnCmTUuHwR5jnwG6FhITmfilDPcmEC37JM/+pizbxxIDXKwAbjWgn00N29WzeVpjAg0O2Q3xNshq3a72WrS/qc/+jineU0NkWAo99dU6pY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773891841; c=relaxed/simple;
	bh=CzMsYR3c/PvKAde7SYzFR7jTEZ5YuA28MnmJSPfMl0k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D1dj1IftKpn212zEeo44n7l+hxUSeXJMTCBmZ7ksMNuCrv4HwyrZmTGL5iMIroMRaR/ELE6CfK4rEPqLLJeqrIXpc6N3IN0lHY0ZCFA65e68+I2hc/FyOoCpgOsfpApjsPJNRULSbXx+EUihsr9XepzJ+KA+aNHTrNvtW27SZBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cjbmt1Kf; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA6ACC19425;
	Thu, 19 Mar 2026 03:44:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773891841;
	bh=CzMsYR3c/PvKAde7SYzFR7jTEZ5YuA28MnmJSPfMl0k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cjbmt1KfammGT3leMIfAIyc3FhE64JvDoXo2kQlfvD6M0qaRZ9/RQNLwoBWBlO57Q
	 8jkOLbKFvIP9LKjJk/avgJu9nv9rx4BUokeyJvFayuEEY6GWJl+dTN09QT/0snpKp4
	 zsZLsS2sQX7cR5Tfb3b8LTu2U41qNgxNdxol+kLflL07cpBmpHTYDb7c7UU69uFXw6
	 RBsSFil/oJv6/YtSDyJyO9kdMGRfEYc3KGW7tmhy9jVxhtsmgkTWa6chVPGisNfSnP
	 tZpLZgTyoGQnmQb4O671qgo/37ZabNLQua8/QAvtbUYncH04io3xxvIHqMVpJIaTCa
	 M8MhM7z+/zYvQ==
Date: Thu, 19 Mar 2026 11:43:59 +0800
From: Yixun Lan <dlan@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Matthias Kaehlcke <mka@chromium.org>,
	Junzhong Pan <panjunzhong@linux.spacemit.com>,
	Inochi Amaoto <inochiama@gmail.com>, spacemit@lists.linux.dev,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: Re: [PATCH 2/3] dt-bindings: usb: Add support for Terminus FE1.1s
 USB2.0 Hub controller
Message-ID: <20260319034359-GKC489299@kernel.org>
References: <20260317-03-usb-hub-fe1-v1-0-71ec3989f5be@kernel.org>
 <20260317-03-usb-hub-fe1-v1-2-71ec3989f5be@kernel.org>
 <20260318-original-cockle-from-jupiter-a2c9b0@quoll>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260318-original-cockle-from-jupiter-a2c9b0@quoll>
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,linuxfoundation.org,chromium.org,linux.spacemit.com,gmail.com,lists.linux.dev,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-35094-lists,linux-usb=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[12];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.973];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dlan@kernel.org,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	HAS_WP_URI(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[devicetree.org:url,0.0.0.1:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,terminus-usa.com:url]
X-Rspamd-Queue-Id: 4F6162C5A35
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Krzysztof, 

I will address all comments for other patches in this series, so no reply
to all of them..

On 09:36 Wed 18 Mar     , Krzysztof Kozlowski wrote:
> On Tue, Mar 17, 2026 at 08:55:03AM +0000, Yixun Lan wrote:
> > Terminus FE1.1s is USB2.0 protocol compliant 4-port USB HUB, It support
> > MTT (Multiple Transaction Translator) mode, the upstream port supports
> > high-speed 480MHz and full-speed 12MHz modes, also has integrated 5V to
> > 3.3V, 1.8V regulator and Power-On-Reset circuit.
> > 
> > Introduce the DT binding for it.
> > 
> > Link: https://terminus-usa.com/wp-content/uploads/2024/06/FE1.1s-Product-Brief-Rev.-2.0-2023.pdf [1]
> > Signed-off-by: Yixun Lan <dlan@kernel.org>
> > ---
> >  .../devicetree/bindings/usb/terminus,fe11.yaml     | 61 ++++++++++++++++++++++
> >  1 file changed, 61 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/usb/terminus,fe11.yaml b/Documentation/devicetree/bindings/usb/terminus,fe11.yaml
> > new file mode 100644
> > index 000000000000..93bb4066f851
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/usb/terminus,fe11.yaml
> > @@ -0,0 +1,61 @@
> > +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/usb/terminus,fe11.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Terminus FE1.1/1.1S USB 2.0 Hub Controller
> > +
> > +maintainers:
> > +  - Yixun Lan <dlan@kernel.org>
> > +
> > +allOf:
> > +  - $ref: usb-hub.yaml#
> > +
> > +properties:
> > +  compatible:
> > +    enum:
> > +      - usb1a40,0101
> 
> I do not see vendor prefix used anywhere. Drop that patch, because I
> think we do not reserve them for file names or schema IDs.
> 
Ok, will drop
> > +
> > +  reg: true
> > +
> > +  reset-gpios:
> > +    description:
> > +      GPIO controlling the RESET#, but the reset line can be optional.
> 
> Don't repeat constraints in free form text. Schema tells what can be
> optional by not requiring it.
> 
Ok
> > +
> > +  vdd-supply:
> > +    description:
> > +      Regulator supply to the hub, one of 3.3V or 5V can be chosen.
> 
> And this cannot be optional.
> 
Ok, will add it to 'required' section
> > +
> > +  ports:
> > +    $ref: /schemas/graph.yaml#/properties/ports
> > +
> > +    patternProperties:
> > +      '^port@':
> > +        $ref: /schemas/graph.yaml#/properties/port
> > +
> > +        properties:
> > +          reg:
> > +            minimum: 1
> > +            maximum: 4
> > +
> > +required:
> > +  - compatible
> > +  - reg
> 
> Missing supply.
> 
ditto
> > +
> > +additionalProperties: false
> 
> First, radxa never built tested the DTS when posted it. Yeah, why would
> they care...
> 
> Second, now you added schema which is nice, but you still did not verify
> it with the DTS.
> 
> That's the point of DT schema. To verify the DTS. You MUST do it when
> you post the binding. Why? To see the errors you have here. See other
> hub schemas, like genesys, what goes above - unevaluated.
> 
Ok, I did the binding check but only for arch/riscv/, will cover all in
future..

> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/gpio/gpio.h>
> > +    usb {
> > +        #address-cells = <1>;
> > +        #size-cells = <0>;
> > +
> > +        hub: hub@1 {
> 
> Drop unused label
> 
Ok

> > +            compatible = "usb1a40,0101";
> > +            reg = <1>;
> > +            reset-gpios = <&gpio0 1 GPIO_ACTIVE_LOW>;
> > +            vdd-supply = <&vcc_5v>;
> > +        };
> > +    };
> > 
> > -- 
> > 2.53.0
> > 
> 

-- 
Yixun Lan (dlan)

