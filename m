Return-Path: <linux-usb+bounces-33225-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kF4CLf2Wimn2MAAAu9opvQ
	(envelope-from <linux-usb+bounces-33225-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 10 Feb 2026 03:25:01 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 380A2116473
	for <lists+linux-usb@lfdr.de>; Tue, 10 Feb 2026 03:25:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 09F9F302D5B1
	for <lists+linux-usb@lfdr.de>; Tue, 10 Feb 2026 02:24:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E80ED2DAFA4;
	Tue, 10 Feb 2026 02:24:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VpUfiCWN"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71EF5284686;
	Tue, 10 Feb 2026 02:24:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770690297; cv=none; b=dKJM+GQsJBLE+X/0tRb4WPXO4DsW7o+PZl5R1cKPiexpY6Ym2YQAoVxsJp9yL7TYCIgHKzlOBhsi0NvL8/7IRiFsNqVLECcXs3ubxiBg1ikyFPjVRiLAQbx5qtkHkZK1TNOr+l7ODf+OZiW6cYnwyFJ4IL4aL+HKghHHZ/qXysQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770690297; c=relaxed/simple;
	bh=qvzkgIsUupXyFBmx94KHEIrSTpQoQW9SEGt5veYFylE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=m/lB5+KcxM3WEeZiA+U+KQs634l2Jb1hkuLRNYModgae0aWhjcF+vXAvDE7LW96wTt+UgPhZwKVJht6HZL+UFVRqnIYqElDkITUC/o6tOUWnAwEy3Drjl3JlIN2hcz/dxx8Kin58ZxtiBkYHSgkuIXv5yQjYCQpPuYgN7JncnBY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VpUfiCWN; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D93AC116C6;
	Tue, 10 Feb 2026 02:24:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770690297;
	bh=qvzkgIsUupXyFBmx94KHEIrSTpQoQW9SEGt5veYFylE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VpUfiCWNb0vIktuuKWDP6Fl3XWl+f+zThcHDJq4SLtV6wjdRsodxX3StIrah3IjVS
	 lLyr/fNF07JG/tVAe3JyNDP2l68nIHnCI29Y73uRuwfYi/M1xI/P4IOUx4WzRgu20e
	 8jNRqleE6NsTtCQbEAkUggssnnhuL5fDWEq36grrGmUiivUIYhJzVTaEfMQor9D1ut
	 +zXBzGcxexfCOSQcM5MCcLZJu3Sfrp6XkU80bj3OHmkI8Bbx0cDfu0RfDDNa6hfqC7
	 NeozwEYjDFXg8tQA+dE3mf1zu4yfP9Mx3c1BLVHy3pSVSnIFKIsRNnjpLlyOiP1c7I
	 uvZYNzwPcyA2w==
Date: Mon, 9 Feb 2026 20:24:56 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Xu Yang <xu.yang_2@nxp.com>
Cc: Frank Li <frank.li@nxp.com>, Shawn Guo <shawnguo@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-usb@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-kernel@vger.kernel.org,
	Li Jun <jun.li@nxp.com>, Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v3 1/3] dt-bindings: usb: introduce nxp,imx-dwc3
Message-ID: <177069029377.2355609.7155450591040552968.robh@kernel.org>
References: <20260206-add-flatten-dts-based-dwc3-imx-driver-v3-0-ebd9b9b77049@nxp.com>
 <20260206-add-flatten-dts-based-dwc3-imx-driver-v3-1-ebd9b9b77049@nxp.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260206-add-flatten-dts-based-dwc3-imx-driver-v3-1-ebd9b9b77049@nxp.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-33225-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	FREEMAIL_CC(0.00)[nxp.com,kernel.org,gmail.com,pengutronix.de,vger.kernel.org,lists.infradead.org,lists.linux.dev,synopsys.com,linuxfoundation.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,linux-usb@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[i.mx:url,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 380A2116473
X-Rspamd-Action: no action


On Fri, 06 Feb 2026 18:18:49 +0800, Xu Yang wrote:
> The i.MX USB glue and DWC3 core are closely coupled. Describe the i.MX
> USB block in a single block will bring more benefits than a parent-child
> relation. The new binding is used to describe flattened usb controller
> node. It's a copy of the legacy binding fsl,imx8mp-dwc3.yaml with the
> needed modifications.
> 
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> 
> ---
> Changes in v3:
>  - rename file name as nxp,imx-dwc3.yaml
>  - rename compatible as nxp,imx*-dwc3
>  - remove status property in example node
>  - remove select block
>  - modify commit message
> Changes in v2:
>  - reorder compatible property
> ---
>  .../devicetree/bindings/usb/fsl,imx8mp-dwc3.yaml   |   2 +
>  .../devicetree/bindings/usb/nxp,imx-dwc3.yaml      | 123 +++++++++++++++++++++
>  2 files changed, 125 insertions(+)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


