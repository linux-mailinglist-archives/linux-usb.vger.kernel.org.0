Return-Path: <linux-usb+bounces-33585-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8F6cBeqRnGnRJQQAu9opvQ
	(envelope-from <linux-usb+bounces-33585-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 23 Feb 2026 18:44:10 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4169717B030
	for <lists+linux-usb@lfdr.de>; Mon, 23 Feb 2026 18:44:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 881283008C85
	for <lists+linux-usb@lfdr.de>; Mon, 23 Feb 2026 17:44:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 253EC33557B;
	Mon, 23 Feb 2026 17:44:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MHAbLf9d"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6355331A53;
	Mon, 23 Feb 2026 17:44:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771868644; cv=none; b=kjrfGjLPyj7MWipbnQRjbgwU6oaDi8ScjMNj3Upp0BHMbRDC5UTmSlqmtYFPk97+D6ag0HztcnIz6+jMhkTiq4un0msByEmbIDpzdc7784qUMwgVIbJpYTWr3LWPX+txqPX+Pzy0o9m+9Qbq+IjrXupwphlIeWjorImekfEVX9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771868644; c=relaxed/simple;
	bh=melVn+G0oHm9QWUFDpJV5XUQypF5aPsyygFT1uqDsJY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YF2IcNBCRxNGu9d6SkorPiRjBqwcBIimLhIyJXHAgTN5/XWcHHumuwwD8/aUwjQdTAggCDt9GhHg7baG9JAC7rdenqlgXcGWZwsDK6VBBxP/uUJlb+bo2MBi3B4a/sJbejJU1AwbeLG6Xdtj4r2xsDrRfnaaaKWWj2iLuJAv21E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MHAbLf9d; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65C51C116C6;
	Mon, 23 Feb 2026 17:44:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771868644;
	bh=melVn+G0oHm9QWUFDpJV5XUQypF5aPsyygFT1uqDsJY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MHAbLf9d/ozrIBQ4m1EZANbAGUTKUH3NsJarEku7/xtsig/LyCZWToRBhBlWFiTEx
	 mWBAx4q6lYdh2DnU4c9pxJFmULbvVZLhMorwlMfDBRFesQ5TGoyaTjDfxdB0Db9BCG
	 +JTLkNxXRPvGc7r6K7B49YtTcy/D0SuxLrykEv2Pli/phr+9TEvsGcf/gd9ypTSykq
	 eDgC1owhFycdUoa5Ll0zwEdQF8jV0J8+I6swYtAISahqjIjf9x/kLvwCcEO18zU1n0
	 OxLkmZMfX4e1Rapzjn+uY5u395oNv23Xp+U7FMZGrgh7tbDhlthUizqayDGIxOz8aG
	 VhzdUkIzBM4yQ==
Date: Mon, 23 Feb 2026 11:44:03 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Amit Sunil Dhamne <amitsd@google.com>
Cc: Badhri Jagan Sridharan <badhri@google.com>,
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
	RD Babiera <rdbabiera@google.com>,
	Conor Dooley <conor+dt@kernel.org>, Kyle Tso <kyletso@google.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	devicetree@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: connector: Add sink properties to
 comply with PD 3.1 spec
Message-ID: <177186864300.4163723.6004584061652135231.robh@kernel.org>
References: <20260211-skedb-v1-0-616340426cdc@google.com>
 <20260211-skedb-v1-1-616340426cdc@google.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260211-skedb-v1-1-616340426cdc@google.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33585-lists,linux-usb=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 4169717B030
X-Rspamd-Action: no action


On Wed, 11 Feb 2026 23:25:35 +0000, Amit Sunil Dhamne wrote:
> Add additional properties for ports supporting sink mode. The properties
> define certain hardware and electrical properties such as sink load
> step, sink load characteristics, sink compliance and charging adapter
> Power Delivery Profile (PDP) for the connector. These properties need to
> be defined for a Type-C port in compliance with the PD 3.1 spec.
> 
> Signed-off-by: Amit Sunil Dhamne <amitsd@google.com>
> ---
>  .../bindings/connector/usb-connector.yaml          | 34 ++++++++++++++++++++++
>  .../devicetree/bindings/usb/maxim,max33359.yaml    |  4 +++
>  include/dt-bindings/usb/pd.h                       | 18 ++++++++++++
>  3 files changed, 56 insertions(+)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


