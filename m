Return-Path: <linux-usb+bounces-34130-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qEYRMkokqmkPMAEAu9opvQ
	(envelope-from <linux-usb+bounces-34130-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Fri, 06 Mar 2026 01:48:10 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 38CBA219F9F
	for <lists+linux-usb@lfdr.de>; Fri, 06 Mar 2026 01:48:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6C8473030481
	for <lists+linux-usb@lfdr.de>; Fri,  6 Mar 2026 00:47:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 124512EC0B5;
	Fri,  6 Mar 2026 00:47:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DY1PXkqo"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90A65336886;
	Fri,  6 Mar 2026 00:47:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772758073; cv=none; b=Gdj6qk5uoV7g2TTGJ8kb8OYSu3VgR9Ee0+3AAQaHeVRg0YA0cGsfLCDXaIvAq/vsBMPDniE9ZTlzcB7zFf+gPkaQlt7R6nEdlykbrVLEjz6/OrJdFZljEqTkRlf2JRrDx9ZCae3PcLaeexAuL6/snLaUMDnPqMMvzvSyAqMb6Zg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772758073; c=relaxed/simple;
	bh=h9pWZ+KlVqTI+gHB0a3vvZujRk02rbpKF1UtgPpic7k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GVNlEWl13foOdyuOiFYCE2xC/R3u86UfwuHvLjd+Ix4KFxxl51gauBlIZzK2UUocivRHqJ1JKqXIknJUz8H90D+lDiyCQDAORqtFlZzokxqVtoUsfXl9zxPmDu5kuixET327Cn+ugnh07SzBqZEvaGd/NVBTDMP/kV+ZG8aJ1ms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DY1PXkqo; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19D54C19423;
	Fri,  6 Mar 2026 00:47:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772758073;
	bh=h9pWZ+KlVqTI+gHB0a3vvZujRk02rbpKF1UtgPpic7k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DY1PXkqoCDwg+JaZPV0pz0uTiOL9hZveg0NsCcpXqwRPxOlp8BRYh2rWN4dwouvx7
	 Hbm7li5Jjl+im7NoAd8BIgB6WiBZo/mmaMVZPhvLstwvHF0n19PRTsyitfTbOIY1m7
	 5vnoPqwDnPhctFoYie9p1posds5ma78IoYQU+cNqJwHq7C3RPWOzuQSOYNAZ1Pva9d
	 HkH1j3aPeoD5JXj6QpxUKFEDnBJLOBwBORC8nXELqgWneoNXVcp2KmFSOYsUvofctB
	 lWS0JrtTpAt9ndAV8anNFA2aEaiWHIRKB4Rc2he7DWHWibmGeohXyFLdcAXI8OSR1h
	 /TC7mEL078KvA==
Date: Thu, 5 Mar 2026 18:47:52 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Charan Pedumuru <charan.pedumuru@gmail.com>
Cc: linux-usb@vger.kernel.org, Nicolas Ferre <nicolas.ferre@microchip.com>,
	linux-kernel@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	Herve Codina <herve.codina@bootlin.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: Re: [PATCH v2 3/4] dt-bindings: usb: atmel,at91rm9200-udc: convert
 to DT schema
Message-ID: <177275807065.875463.18386357319081632495.robh@kernel.org>
References: <20260224-atmel-usb-v2-0-6d6a615c9c47@gmail.com>
 <20260224-atmel-usb-v2-3-6d6a615c9c47@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260224-atmel-usb-v2-3-6d6a615c9c47@gmail.com>
X-Rspamd-Queue-Id: 38CBA219F9F
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34130-lists,linux-usb=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.997];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Action: no action


On Tue, 24 Feb 2026 13:13:00 +0000, Charan Pedumuru wrote:
> Convert Atmel AT91 USB Device Controller (UDC) binding to DT schema.
> Changes during conversion:
> - Include "atmel,pullup-gpio" and "atmel,matrix" in the properties since
>   they are required by existing in-tree DTS definitions.
> 
> Signed-off-by: Charan Pedumuru <charan.pedumuru@gmail.com>
> ---
>  .../bindings/usb/atmel,at91rm9200-udc.yaml         | 77 ++++++++++++++++++++++
>  1 file changed, 77 insertions(+)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


