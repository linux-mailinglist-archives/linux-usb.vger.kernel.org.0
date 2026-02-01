Return-Path: <linux-usb+bounces-32977-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id Jl4jLf5If2mDnAIAu9opvQ
	(envelope-from <linux-usb+bounces-32977-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Sun, 01 Feb 2026 13:37:18 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 61881C5E39
	for <lists+linux-usb@lfdr.de>; Sun, 01 Feb 2026 13:37:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8EC72300CC85
	for <lists+linux-usb@lfdr.de>; Sun,  1 Feb 2026 12:37:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7DFE733BBC8;
	Sun,  1 Feb 2026 12:37:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NFgo0gX4"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06D1131AA84;
	Sun,  1 Feb 2026 12:37:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769949431; cv=none; b=NXxH9JKVljHjAdwNRjEGyaaPV5cnd3a0pbx6tW9zqTps3bSeJM6g77HVDC1bmoFQZjBUy3453am8rSpSFMqkzQa+ALbgdNttubOMMhy4ya7QCJaF4OPKBQw7qqhkaguyQcCIm1bjgZc/Cl5zV1f2rKGtbQUT4SNtUjwU3hwi2II=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769949431; c=relaxed/simple;
	bh=dGFx1VFWlzUONLDaiGnHfQKX+Ch//O+EYhfbY6SQQX8=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=FFYD0+5I0sNDsPUcmOqg05rp+Em9ccfu/ACuuwta/g9oCm0hY2itt+ygL7ei1s/wVqyXkUrLjxT7v4xNswr7SxbgPMLG0N7CXmeF7oglIo3s9m+4CjN+UCH57Xx0aGLBcPrq5w34SYRocjcst93DvQxEpKSKdECTeWnWSc7L4E4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NFgo0gX4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6668DC4CEF7;
	Sun,  1 Feb 2026 12:37:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769949430;
	bh=dGFx1VFWlzUONLDaiGnHfQKX+Ch//O+EYhfbY6SQQX8=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=NFgo0gX4uOKnO4aLFv4fzv4vMsy2AG0BojmtvNr3bxDP12Dy4tyzj4qveTTpDRSIL
	 Q57sjRmwqvpHVf9xjj3oOPLIzPqaBO19MQsd1xiCkW0LOdjMsyqiVFs6kueibSWxBl
	 1sYm3LXChw7MeaYK/Ub8UiFaoEGvviYemv9+CkZWtqd4PV5DPtY0J7EFMnSkYcgYGG
	 E43PXEL1yydK0NyN3j3U6zkLJnWdARgy158qhSyWH8/4dMVB131XON+0oOzbVBQ53E
	 tocKg05grXKjzgNVU8Tffwm9bKKaYquC4APg3Uq28iowVCVS780fHLlShu3D3Bb5jY
	 /om+toEnczXnQ==
Date: Sun, 01 Feb 2026 06:37:09 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: devicetree@vger.kernel.org, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 linux-kernel@vger.kernel.org, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 linux-arm-kernel@lists.infradead.org, 
 Herve Codina <herve.codina@bootlin.com>, linux-usb@vger.kernel.org, 
 Conor Dooley <conor+dt@kernel.org>
To: Charan Pedumuru <charan.pedumuru@gmail.com>
In-Reply-To: <20260201-atmel-usb-v1-2-d1a3e93003f1@gmail.com>
References: <20260201-atmel-usb-v1-0-d1a3e93003f1@gmail.com>
 <20260201-atmel-usb-v1-2-d1a3e93003f1@gmail.com>
Message-Id: <176994942956.410099.10343293169382130437.robh@kernel.org>
Subject: Re: [PATCH 2/4] dt-bindings: usb: atmel,at91sam9g45-ehci: convert
 to DT schema
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32977-lists,linux-usb=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,0.7.161.32:email]
X-Rspamd-Queue-Id: 61881C5E39
X-Rspamd-Action: no action


On Sun, 01 Feb 2026 11:34:21 +0000, Charan Pedumuru wrote:
> Convert Atmel AT91SAM9G45 EHCI USB Host Controller
> binding to DT schema.
> Changes during conversion:
> - Include "usb-ehci" as a fallback compatible to allow atmel EHCI
>   driver matching.
> 
> Signed-off-by: Charan Pedumuru <charan.pedumuru@gmail.com>
> ---
>  .../bindings/usb/atmel,at91sam9g45-ehci.yaml       | 71 ++++++++++++++++++++++
>  1 file changed, 71 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Warning: Duplicate compatible "usb-ehci" found in schemas matching "$id":
	http://devicetree.org/schemas/usb/atmel,at91sam9g45-ehci.yaml
	http://devicetree.org/schemas/usb/generic-ehci.yaml#
Warning: Duplicate compatible "atmel,at91sam9g45-ehci" found in schemas matching "$id":
	http://devicetree.org/schemas/usb/atmel,at91sam9g45-ehci.yaml
	http://devicetree.org/schemas/usb/generic-ehci.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/usb/atmel,at91sam9g45-ehci.example.dtb: usb@500000 (atmel,at91sam9g45-ehci): Unevaluated properties are not allowed ('clock-names' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/generic-ehci.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.kernel.org/project/devicetree/patch/20260201-atmel-usb-v1-2-d1a3e93003f1@gmail.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


