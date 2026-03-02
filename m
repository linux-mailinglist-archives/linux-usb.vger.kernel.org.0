Return-Path: <linux-usb+bounces-33855-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YAEKKzM9pWm36gUAu9opvQ
	(envelope-from <linux-usb+bounces-33855-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 02 Mar 2026 08:33:07 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 34BE31D3FA7
	for <lists+linux-usb@lfdr.de>; Mon, 02 Mar 2026 08:33:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D907A3011BD3
	for <lists+linux-usb@lfdr.de>; Mon,  2 Mar 2026 07:32:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 506CD383C86;
	Mon,  2 Mar 2026 07:32:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uhyHdBHN"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD3B43803D1;
	Mon,  2 Mar 2026 07:32:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772436720; cv=none; b=tjDlCiNJSdLAradM0BEHNrnYOd+oaNLVvTd2xk/8nJgTs6T2GRAwVwPkRJnsTBnoAZTQ4deOlJcRtCRl/r1f38VhPd/qyeKMK4DaB9zIpl1XFwM6H9vZCcgxeQBp0vfFfYeGX+aDaaZvNDrhS0mlQmwICeMhN/OvTPMg4RvvJxE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772436720; c=relaxed/simple;
	bh=WAHARe+Z+diQ+iFBEceRcnn4xGWcGm9TG07E8ie+9/I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cD3B8xb54jRe9/VCcpV0P7pggPYmGaZKJmtq3C7+lhqTk5sbrVwZsDJt/7z3zb0KolbPOWoxspkf/9brEpEdlq1eoSWgKA29TZVqo5/Kv25vW1vktpLWq3n8WEBy7gCGqUEaqmq93k/GHQULliZlVI2U+OZsa1LV5Yd2pUEslZg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uhyHdBHN; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8243C19423;
	Mon,  2 Mar 2026 07:31:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772436720;
	bh=WAHARe+Z+diQ+iFBEceRcnn4xGWcGm9TG07E8ie+9/I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uhyHdBHN6XO7UczfoTRpLDjMfk7+7qGBZADpOk5a0KDr/YQYKyuoFi859EJrf4NTe
	 SLXKaXyXxnh7W1Hb9ku6gYdT+HoPR02c9JhW9dkqI4WsE3JhfmsZAWKHCsKKeg78jG
	 UEaX762Q0ORizBVH0b93QN7hHmIFmsOV8UIM2kiKq+N9IAlM4aXYTEX3EutK0imu+2
	 O5YZ6mPFDWNgCvFiyBn2mAxoNalfrvsBzjo01iYs4cq0FDXWFmY4stwPit6ZpiSTO8
	 0xWyhp2paXWfI1LWmyXnm7HMXiLAIcvFh74D92KqM1ShpC5nKmbfiv/6yw0mw5JkGh
	 PbNl4O0ul3Sgg==
Date: Mon, 2 Mar 2026 08:31:57 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Peter Chen <peter.chen@cixtech.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	gregkh@linuxfoundation.org, pawell@cadence.com, rogerq@kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
	cix-kernel-upstream@cixtech.com
Subject: Re: [PATCH 1/2] usb: cdns3: Add USBSSP platform driver support
Message-ID: <20260302-brave-cockle-of-bliss-a8dde5@quoll>
References: <20260302030339.324196-1-peter.chen@cixtech.com>
 <20260302030339.324196-2-peter.chen@cixtech.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260302030339.324196-2-peter.chen@cixtech.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33855-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[cadence.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 34BE31D3FA7
X-Rspamd-Action: no action

On Mon, Mar 02, 2026 at 11:03:33AM +0800, Peter Chen wrote:
> -	cdns->gadget_init = cdns3_gadget_init;
> +	if (device_get_match_data(dev) == &cdnsp_plat)
> +		cdns->gadget_init = cdnsp_gadget_init;
> +	else
> +		cdns->gadget_init = cdns3_gadget_init;
>  
>  	ret = cdns_init(cdns);
>  	if (ret)
> @@ -317,7 +325,8 @@ static const struct dev_pm_ops cdns3_pm_ops = {
>  
>  #ifdef CONFIG_OF
>  static const struct of_device_id of_cdns3_match[] = {
> -	{ .compatible = "cdns,usb3" },
> +	{ .compatible = "cdns,usb3", .data = &cdns3_plat },
> +	{ .compatible = "cdns,usbssp", .data = &cdnsp_plat },
>  	{ },
>  };
>  MODULE_DEVICE_TABLE(of, of_cdns3_match);
> @@ -336,6 +345,7 @@ static struct platform_driver cdns3_driver = {
>  module_platform_driver(cdns3_driver);
>  
>  MODULE_ALIAS("platform:cdns3");
> +MODULE_ALIAS("platform:cdnsp");

You do not need this at all. Fix your DTS or platforms or this
driver.

>  MODULE_AUTHOR("Pawel Laszczak <pawell@cadence.com>");
>  MODULE_LICENSE("GPL v2");
>  MODULE_DESCRIPTION("Cadence USB3 DRD Controller Driver");

Best regards,
Krzysztof


