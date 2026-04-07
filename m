Return-Path: <linux-usb+bounces-36053-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QJKnHE5W1Wmu4wcAu9opvQ
	(envelope-from <linux-usb+bounces-36053-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 07 Apr 2026 21:09:02 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 4481A3B3406
	for <lists+linux-usb@lfdr.de>; Tue, 07 Apr 2026 21:09:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id CD1CF3022CAE
	for <lists+linux-usb@lfdr.de>; Tue,  7 Apr 2026 19:09:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3DD4234CFA1;
	Tue,  7 Apr 2026 19:08:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ni+GZeLI"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEF531E9B3A;
	Tue,  7 Apr 2026 19:08:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775588935; cv=none; b=ut7G5QkkCiQrDSvt4BtiJ9cQOHKh6kiFq4RapRvLNlhNYdkJ8mXvi1nGFB6GwhBfb3rNNtroEpiyv9pTerYhM+RSwcAgE5dD9SzCAv4qfpuMttDKdYpkim/3G6g2pQifCvjQM1H3o3xJiOMKUUOONeebycGpbFysa2+ZPeVVyXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775588935; c=relaxed/simple;
	bh=u4p4j14nBfKMVlnfafMssBd+Km2VMF7NLSQuYZdeM1M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AOPkrnL5Ij9k0K25D+ilCIx1e3x34TGH9AQlioCvBW7A9L2QeZ7tZSbQk8EmtEuhjKlX7sn9lo0zlHbLuxUISOZUnaQn1W5LZpI87DD3uyNQfS5HYulcJEq1HAxZouy2H3bfnPw8u3jndMRFyip4r9hb9WT9iAxx5MdhLWq1/4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ni+GZeLI; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F8F9C116C6;
	Tue,  7 Apr 2026 19:08:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775588935;
	bh=u4p4j14nBfKMVlnfafMssBd+Km2VMF7NLSQuYZdeM1M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ni+GZeLIGk0p5/vkZR18uK3/Gq1Za2r8WLI/5h9kbN/oRCRBHEg9TEWLSWpEBG/U1
	 DUVVw87E68DXVwCVX4YNkIWfG5ENXBFkJqNvT6XKsESPRxzKdnB0dHU/1qqXyfeQin
	 VC28ZqbOHWlDBJwjjyr3c8pi0+beg0ZUuuyOqnbFyZLr7GRctmZ0ph8of+lW1ZxvUY
	 kTE1wm4ILxyDs0Cvg6Q0S0xZFBDaS0ve6GOHDWAvdtb7O6e995NmwhuXqvkSA2Ohfq
	 6mKOpIKEoRKLC1ozyH/wKKES1UjEtLmp8NxDfdhV02ikhR1SucMrtCfB1NzM5EKNr3
	 Q3kswq2zGEMTQ==
Date: Tue, 7 Apr 2026 14:08:53 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Charan Pedumuru <charan.pedumuru@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org,
	Conor Dooley <conor+dt@kernel.org>, linux-usb@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Herve Codina <herve.codina@bootlin.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-kernel@vger.kernel.org,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v4 2/5] dt-bindings: usb: generic-ohci: add AT91RM9200
 OHCI binding support
Message-ID: <177558893274.3412548.17799728970061303874.robh@kernel.org>
References: <20260327-atmel-usb-v4-0-eb8b6e49b29d@gmail.com>
 <20260327-atmel-usb-v4-2-eb8b6e49b29d@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260327-atmel-usb-v4-2-eb8b6e49b29d@gmail.com>
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-36053-lists,linux-usb=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 4481A3B3406
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On Fri, 27 Mar 2026 16:47:43 +0000, Charan Pedumuru wrote:
> Convert the Atmel AT91RM9200 OHCI USB host controller binding to DT schema
> by defining it in the existing generic OHCI schema.
> 
> Signed-off-by: Charan Pedumuru <charan.pedumuru@gmail.com>
> ---
>  .../devicetree/bindings/usb/atmel-usb.txt          | 27 --------------
>  .../devicetree/bindings/usb/generic-ohci.yaml      | 41 ++++++++++++++++++++++
>  2 files changed, 41 insertions(+), 27 deletions(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


