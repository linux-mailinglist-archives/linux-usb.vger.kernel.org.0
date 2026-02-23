Return-Path: <linux-usb+bounces-33553-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wMo9GS46nGlCBgQAu9opvQ
	(envelope-from <linux-usb+bounces-33553-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 23 Feb 2026 12:29:50 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CD19517586F
	for <lists+linux-usb@lfdr.de>; Mon, 23 Feb 2026 12:29:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id BA4B13033276
	for <lists+linux-usb@lfdr.de>; Mon, 23 Feb 2026 11:29:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E71D13612FC;
	Mon, 23 Feb 2026 11:29:08 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B1973612DD
	for <linux-usb@vger.kernel.org>; Mon, 23 Feb 2026 11:29:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771846148; cv=none; b=CmqyEcK0yl3tEQ9FZOx3XUUN4ApFsK2ePhajqu9MRkY7vzXz0D4nKC3yZ3X8f5UQZGSH65DmsNxGeHwVw60utSWq/xCvlhs0EEl7trPoICDLtC0Xau2Sqr11AZ1CS4FOITBAZn9guBFZ2Xrbk7TMXACp3nn5F6su7UF4STz46bI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771846148; c=relaxed/simple;
	bh=HBscHmJudXstqHTcCSQOBobWNft6w8CPgOT77IxP0ss=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aMtZC6KSH0cT3IW0yg2raMKfwRwrVrUcGYW2GiUvzcIflbj+AfmYoikhCKNjnaW4CpqQq7SF7OB1zRZJbUbdcQsUnZv0XmHhayAh5tN08SJSk901daCzNO4cKDpYTz3dIep/uVMRjnLI5APItDUHEggpVwS3RXL45vtzR3eAsdQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mfe@pengutronix.de>)
	id 1vuU7X-0007vD-TX; Mon, 23 Feb 2026 12:28:59 +0100
Received: from pty.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::c5])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mfe@pengutronix.de>)
	id 1vuU7W-002DlE-15;
	Mon, 23 Feb 2026 12:28:59 +0100
Received: from mfe by pty.whiteo.stw.pengutronix.de with local (Exim 4.98.2)
	(envelope-from <mfe@pengutronix.de>)
	id 1vuU7X-000000017ln-2Qg2;
	Mon, 23 Feb 2026 12:28:59 +0100
Date: Mon, 23 Feb 2026 12:28:59 +0100
From: Marco Felsch <m.felsch@pengutronix.de>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Fabio Estevam <festevam@gmail.com>, 
	Matthias Kaehlcke <mka@chromium.org>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, kernel@pengutronix.de
Subject: Re: [PATCH v5 3/4] dt-bindings: usb: usb-device: add usb hub port
 vbus-supply suppport
Message-ID: <qjabgfbpwuxowtnolahzzioukl26lllyu4b3x6lchnf4jodrrf@q3i3v3fgtxte>
References: <20260223-v6-16-topic-usb-onboard-dev-v5-0-28d3018a8026@pengutronix.de>
 <20260223-v6-16-topic-usb-onboard-dev-v5-3-28d3018a8026@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260223-v6-16-topic-usb-onboard-dev-v5-3-28d3018a8026@pengutronix.de>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-usb@vger.kernel.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.54 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[pengutronix.de];
	FREEMAIL_TO(0.00)[linuxfoundation.org,kernel.org,gmail.com,chromium.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33553-lists,linux-usb=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[m.felsch@pengutronix.de,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.945];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	R_DKIM_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.2:email,pengutronix.de:url,pengutronix.de:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,0.0.0.1:email]
X-Rspamd-Queue-Id: CD19517586F
X-Rspamd-Action: no action

Hi Rob,

I didn't add your r-b since I moved the DTS example here.

Regards,
  Marco

On 26-02-23, Marco Felsch wrote:
> Some PCB designs don't use the dedicated USB hub port power control GPIO
> to control the port VBUS supply. Instead host managed GPIOs are used to
> control the VBUS supply.
> 
> Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
> ---
>  Documentation/devicetree/bindings/usb/usb-device.yaml | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/usb/usb-device.yaml b/Documentation/devicetree/bindings/usb/usb-device.yaml
> index 09fceb469f10525e9dcdb91435b142b0d21964b8..c9abdbea0e5348dc25f8f9484142089cf60bd514 100644
> --- a/Documentation/devicetree/bindings/usb/usb-device.yaml
> +++ b/Documentation/devicetree/bindings/usb/usb-device.yaml
> @@ -53,6 +53,12 @@ properties:
>    "#size-cells":
>      const: 0
>  
> +  vbus-supply:
> +    description: USB hub port VBUS supply.
> +      The host managed regulator which controls the USB hub port VBUS. This
> +      regulator is only required if the hub internal control signals aren't
> +      used to control the VBUS regulators.
> +
>  patternProperties:
>    "^interface@[0-9a-f]{1,2}(,[0-9a-f]{1,2})$":
>      type: object
> @@ -85,6 +91,7 @@ additionalProperties: true
>  
>  examples:
>    # hub connected to port 1
> +  # device connected to hub port 2, vbus controlled by ext. regulator
>    # device connected to port 2
>    # device connected to port 3
>    #    interface 0 of configuration 1
> @@ -99,6 +106,14 @@ examples:
>          hub@1 {
>              compatible = "usb5e3,608";
>              reg = <1>;
> +            #address-cells = <1>;
> +            #size-cells = <0>;
> +
> +            device@2 {
> +                compatible = "usb123,4321";
> +                reg = <2>;
> +                vbus-supply = <&reg_5v0_vbus>;
> +            };
>          };
>  
>          device@2 {
> 
> -- 
> 2.47.3
> 
> 

-- 
#gernperDu 
#CallMeByMyFirstName

Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | https://www.pengutronix.de/ |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-9    |

