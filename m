Return-Path: <linux-usb+bounces-33240-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uG/jCG38imlyPAAAu9opvQ
	(envelope-from <linux-usb+bounces-33240-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 10 Feb 2026 10:37:49 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7307D118F4E
	for <lists+linux-usb@lfdr.de>; Tue, 10 Feb 2026 10:37:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 92E3B305583D
	for <lists+linux-usb@lfdr.de>; Tue, 10 Feb 2026 09:35:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8973D341041;
	Tue, 10 Feb 2026 09:35:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="rxfkhjya"
X-Original-To: linux-usb@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB0E27478;
	Tue, 10 Feb 2026 09:35:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770716155; cv=none; b=YXwEWLIRzSG5/RQ5niMcthI/YZsQt+8+Zd90/jbBnZrGq+mOmAMyaNLQM+bAo24bYuewRDcivfLD/4U33YaHF4Zg+0SY7+84Znn55/cFXTS8J0uuL7qBXX/uHg+E52jY6piO+Aj1D4nogjGmIoUMRL29Tf8PkiSHF7b8QOz/Kdw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770716155; c=relaxed/simple;
	bh=O6+9B/65QKoZaNBSDL4NNat40eUZOYI0QA9ipoKRE0I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D3LlPNlUgt463/KiP62UdbpDBZKxXcCOiXJV+yVn55mFGkWk4cQVj7a4eAU9eZsDiDK8H1k8elILST9hMeVrENvH4gIzxevespB84txvljb5KEKgErpemqkoWEn+DvdEO7j3gj2i3EbhyhtVSK4VyviMqMwsCURv5smEVANeDeI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=rxfkhjya; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from killaraus.ideasonboard.com (2001-14ba-703d-e500--2a1.rev.dnainternet.fi [IPv6:2001:14ba:703d:e500::2a1])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 61894838;
	Tue, 10 Feb 2026 10:35:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1770716105;
	bh=O6+9B/65QKoZaNBSDL4NNat40eUZOYI0QA9ipoKRE0I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rxfkhjyaeK7cswb9Bgzf8Aft0k7CHlgHH3UYxfGO68DkJHky8Sp9bf/tfECQ3FAOd
	 hto3g8FgxHyqLC4vJBGRobqfI2g6UBQIw2m7yHL8sOnj5KuEZoV+xv3Ks94Ig2cLZW
	 1q0NQLIEI7xaPnsFbR92Pqc8U7rMLBjZ4H2JBD+A=
Date: Tue, 10 Feb 2026 11:35:50 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Chen Ni <nichen@iscas.ac.cn>
Cc: rui.silva@linaro.org, gregkh@linuxfoundation.org, balbi@ti.com,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: isp1760: Add missing error check for
 platform_get_resource()
Message-ID: <20260210093550.GK2405149@killaraus.ideasonboard.com>
References: <20260210090202.2332349-1-nichen@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260210090202.2332349-1-nichen@iscas.ac.cn>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33240-lists,linux-usb=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[laurent.pinchart@ideasonboard.com,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-usb];
	RCPT_COUNT_FIVE(0.00)[6];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,ideasonboard.com:email,ideasonboard.com:dkim,killaraus.ideasonboard.com:mid,iscas.ac.cn:email]
X-Rspamd-Queue-Id: 7307D118F4E
X-Rspamd-Action: no action

On Tue, Feb 10, 2026 at 05:02:02PM +0800, Chen Ni wrote:
> Check the return value of platform_get_resource() to prevent potential
> NULL pointer dereference when the memory resource is unavailable.
> 
> Fixes: 7ef077a8ad35 ("usb: isp1760: Move driver from drivers/usb/host/ to drivers/usb/isp1760/")
> Signed-off-by: Chen Ni <nichen@iscas.ac.cn>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/usb/isp1760/isp1760-if.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/usb/isp1760/isp1760-if.c b/drivers/usb/isp1760/isp1760-if.c
> index a64190addba6..60f81ec81373 100644
> --- a/drivers/usb/isp1760/isp1760-if.c
> +++ b/drivers/usb/isp1760/isp1760-if.c
> @@ -196,6 +196,8 @@ static int isp1760_plat_probe(struct platform_device *pdev)
>  	int ret;
>  
>  	mem_res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +	if (!mem_res)
> +		return -EINVAL;
>  
>  	irq = platform_get_irq(pdev, 0);
>  	if (irq < 0)

-- 
Regards,

Laurent Pinchart

