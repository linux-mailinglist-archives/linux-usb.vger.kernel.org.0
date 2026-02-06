Return-Path: <linux-usb+bounces-33152-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GDTXJ5gDhmmyJAQAu9opvQ
	(envelope-from <linux-usb+bounces-33152-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Fri, 06 Feb 2026 16:07:04 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 19440FF731
	for <lists+linux-usb@lfdr.de>; Fri, 06 Feb 2026 16:07:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 036243020FF4
	for <lists+linux-usb@lfdr.de>; Fri,  6 Feb 2026 15:07:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C513C27AC5C;
	Fri,  6 Feb 2026 15:06:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mF1Mcbyo"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5249927603A;
	Fri,  6 Feb 2026 15:06:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770390417; cv=none; b=lgVoOKz2luFDsz1yXQ2wKbrzfWZbS6fhStQnqvSK6BjDGuru2FXFzZAQHeBpOPMqxtDSKWCnBFC5c/mg5Zx+NNErQ0kTUuEUObMBc//4qHZXdLf/BjZvjtQS5btI88yC+W+vHgrkfBENc0+EDtqJICsucUIgWKgGBy8HHKcTOVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770390417; c=relaxed/simple;
	bh=Wh0zkOIcGs5X78t/45Ad4WKvEnMDZ7iCpArYfmux1fY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HVXxNKifq2mcbB7+RE2Pm8qBWa6WWkGBsrW828RgNfnseKhtrdV+p9a8NoTE6/IhDJdhyuxaiDuUkFI/EUgKmUqYfHZ5aQi5kOlAvWe4OlWIQ37Jghrpa/o0JBBcEYjMXGkw8ZTESqWmoSs74DaGeqBCDMG9mFYansBFMduTMyg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mF1Mcbyo; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4D77C116C6;
	Fri,  6 Feb 2026 15:06:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770390416;
	bh=Wh0zkOIcGs5X78t/45Ad4WKvEnMDZ7iCpArYfmux1fY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mF1Mcbyoooju9sd6YjGYZTyQ+FD+FuLfsLhi2I39RoweQd0HDYf8NpkM95IxiKNpn
	 jWUVstra1IGrAZt4biu1cS+DAh+FJjnqjYxEUFVcq3J2PKUwqTJFA/y1w9m8+2YQp0
	 RdjeoMCv87wKl1z0LJDJGb/x6dTHcsmbizT3jUQNawvxCZTa7HHX9w7YWYXctQ4cpJ
	 fBZZQn0UhpI7QUuQ4OidzklQBPHidgOPnTxwUq44bzydVQUn2ZaqIgXAU70ShVoBoo
	 ugHk3WfqbFYjz2/85oBSwEu8FGv+UwI5MzmP40yaFIlhTq8QkPKtg8wkoJZnQX/Bsw
	 NrD9hIq8+/vfg==
Date: Fri, 6 Feb 2026 09:06:56 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Charan Pedumuru <charan.pedumuru@gmail.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-usb@vger.kernel.org,
	Felipe Balbi <balbi@ti.com>, Conor Dooley <conor+dt@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v2 1/2] dt-bindings: usb: ti,omap4-musb: convert to DT
 schema
Message-ID: <177039041547.227698.2039782077213181368.robh@kernel.org>
References: <20260127-ti-usb-v2-0-9dd6a65b43df@gmail.com>
 <20260127-ti-usb-v2-1-9dd6a65b43df@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260127-ti-usb-v2-1-9dd6a65b43df@gmail.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33152-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.977];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 19440FF731
X-Rspamd-Action: no action


On Tue, 27 Jan 2026 17:42:13 +0000, Charan Pedumuru wrote:
> Convert OMAP MUSB USB OTG Controller binding to DT schema.
> Changes during conversion:
> - Include "interrupts" and "interrupt-names" properties in the YAML, as
>   they are used by many in-tree DTS files.
> - Extend the "power" property to allow the value 150 (in addition to
>   existing values), since this is present in several in-tree DTS examples.
> - Drop the ti,hwmods property, as it is not used by any in-tree DTS files.
> 
> Signed-off-by: Charan Pedumuru <charan.pedumuru@gmail.com>
> ---
>  .../devicetree/bindings/usb/ti,omap4-musb.yaml     | 120 +++++++++++++++++++++
>  1 file changed, 120 insertions(+)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


