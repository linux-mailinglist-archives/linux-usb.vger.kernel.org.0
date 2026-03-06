Return-Path: <linux-usb+bounces-34129-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ACFOOxwkqmkPMAEAu9opvQ
	(envelope-from <linux-usb+bounces-34129-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Fri, 06 Mar 2026 01:47:24 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 54155219F6B
	for <lists+linux-usb@lfdr.de>; Fri, 06 Mar 2026 01:47:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F242430432F1
	for <lists+linux-usb@lfdr.de>; Fri,  6 Mar 2026 00:47:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA8042ED154;
	Fri,  6 Mar 2026 00:47:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="L0R9ZvID"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AAA72EF67A;
	Fri,  6 Mar 2026 00:47:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772758035; cv=none; b=jO49aF6e0grAz9fJj5QDE3wU+PCL7xlKncO5dfuQgGk6UO41vWfIA57Ug6rkjJLJ7m4UMmr/QaeHMq+Q45DI/koi578cQGfjiR47lnShejoQJTwfr3RLwtuxU4KAFkD3KV3CLjMS/mjBfc4lxlnRfBcscE6Yc8o7wedBtTWOblE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772758035; c=relaxed/simple;
	bh=41HneZpqdxSPUGTmYllaKhbcIbsLHd2mvz+gz7Cu4GA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ofmNx/qw6srhQtjQzCh+HddkjcBoyCX6m+H2tWBitG8t9PNZHb+XU4PVCKX8iEatBjNw5qvdg2kBeTcHYgoAJS5nxOwIoeDQQ5AFNpoGGbRAQ2NHjjth/BCuhrvnbkuXKp0j10j6Lh3rv/tUZ8DaU9arMjwOPqZBz8KDjO38VQw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=L0R9ZvID; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E3F1C116C6;
	Fri,  6 Mar 2026 00:47:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772758034;
	bh=41HneZpqdxSPUGTmYllaKhbcIbsLHd2mvz+gz7Cu4GA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=L0R9ZvIDnO9byn3IdhEhtqB2rAkSaBf545dfLFR1ZiPp4CFcKAw0q/OizBmobAHLh
	 yx5GecIRO5b64rWW3ia6Lut9L81Q59KQvjCvixdNOKOFRe0v8UUbcAI0wNk+D6RPwx
	 qzOY7rI7xJdHXk9l713+v5w2CLEHuEkOTgBzhatM5jmAagjXIPBLLqb0DcrquXxBns
	 ApHhPhZFIybngg1qF/TCt54cgXTFS72qRFoVtjWPXpys/q/C9HiRzYDFUml0iQTzaY
	 WMw0CJFPEk8XFfbG9/vsQV47iGY43ew+H4GHyxuN2YzSsq+dYIhmRua63wI2lErsWo
	 Am8fW0/+XkvYQ==
Date: Thu, 5 Mar 2026 18:47:13 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Charan Pedumuru <charan.pedumuru@gmail.com>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	devicetree@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Herve Codina <herve.codina@bootlin.com>
Subject: Re: [PATCH v2 2/4] dt-bindings: usb: generic-ehci: fix schema
 structure and add at91sam9g45 constraints
Message-ID: <177275803136.874627.15836602722441191770.robh@kernel.org>
References: <20260224-atmel-usb-v2-0-6d6a615c9c47@gmail.com>
 <20260224-atmel-usb-v2-2-6d6a615c9c47@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260224-atmel-usb-v2-2-6d6a615c9c47@gmail.com>
X-Rspamd-Queue-Id: 54155219F6B
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34129-lists,linux-usb=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Action: no action


On Tue, 24 Feb 2026 13:12:59 +0000, Charan Pedumuru wrote:
> Add clock and phy constraints for atmel,at91sam9g45-ehci and reorganize
> the allOf section to fix dtbs_check warnings.
> 
> Signed-off-by: Charan Pedumuru <charan.pedumuru@gmail.com>
> ---
>  .../devicetree/bindings/usb/generic-ehci.yaml      | 46 ++++++++++++++++------
>  1 file changed, 33 insertions(+), 13 deletions(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


