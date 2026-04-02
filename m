Return-Path: <linux-usb+bounces-35823-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8EneBVvTzWnVhwYAu9opvQ
	(envelope-from <linux-usb+bounces-35823-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 02 Apr 2026 04:24:27 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B92E382A35
	for <lists+linux-usb@lfdr.de>; Thu, 02 Apr 2026 04:24:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D9CBD3029265
	for <lists+linux-usb@lfdr.de>; Thu,  2 Apr 2026 02:23:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 186D333121D;
	Thu,  2 Apr 2026 02:23:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fUNVXBvM"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9492827A476;
	Thu,  2 Apr 2026 02:23:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775096599; cv=none; b=BNJOMeWlDyGgKD2UPVKjOOxcpIfrkiuRM2hZc0LidCVfsFh0cvfP4F79D8oggaygChE/7Uxsokjc7KG2Px0WRvkaVlHDw5q+gNg0gGg2HPmBEsJ4Td/e4eNzvfEbBSj0WYhBT7/T6BeTs7GLBhGRxQRTIQRkFQmrVf4dwnI5TQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775096599; c=relaxed/simple;
	bh=DqjhRKzQGHoJ1MK8NCyZGi/JF0RBID0ZezmBBCyIgi0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nLTkzECgFbZbHaceNHePq7Cgcg4jFVLxw8dzD7mWTBdHa40uVSMmovUYijhJkpswfl7VTKpmXGYP7TScVvbUmhkNRGl7dU0Q6t/wJz9ySDljiHNHj4bSTdjmz1eB7b/WI3xeMPseZyhApQatCj6KOeB/xTIFvFQuX8S5O9frVG0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fUNVXBvM; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2ED79C4CEF7;
	Thu,  2 Apr 2026 02:23:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775096599;
	bh=DqjhRKzQGHoJ1MK8NCyZGi/JF0RBID0ZezmBBCyIgi0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fUNVXBvMitSM1Ek3YerPgTbrzgSqmTdDF4tWOtUgPl4F1KZhADNa4GdPpkESY9F+y
	 2zLfak1YkQB2L+ficrfQ/SmPgRlVlUHeKBb2D8R8mJlF+bRDuV0iTYLDD8aT1bl8Aq
	 3C/IsmmnV88MSkNP58ZKgN93p4gqDcp3ZS1yyYCXHuVq+CJnyk2ctwLkkH5qESemWb
	 7WsZewa/dIvo1b22kQuB+nGNmDTrwDu6zKAB/OsjFVbfHeGxv8K02835W0VRVJV7Gs
	 IOdjJS0l6BLswjMFvpOrdHtl7U/V9+4PEpdh+vIxUaECrrV1lRlNX8MtPRvL51nvfK
	 51rNTvSeeAdzw==
Date: Thu, 2 Apr 2026 10:23:15 +0800
From: "Peter Chen (CIX)" <peter.chen@kernel.org>
To: Yongchao Wu <yongchao.wu@autochips.com>
Cc: pawell@cadence.com, rogerq@kernel.org, gregkh@linuxfoundation.org,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	stable@kernel.org
Subject: Re: [PATCH v2] usb: cdns3: gadget: fix state inconsistency on gadget
 init failure
Message-ID: <ac3TE3RvVO2hvDDz@nchen-desktop>
References: <20260401001000.5761-1-yongchao.wu@autochips.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260401001000.5761-1-yongchao.wu@autochips.com>
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35823-lists,linux-usb=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[peter.chen@kernel.org,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,autochips.com:email]
X-Rspamd-Queue-Id: 6B92E382A35
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 26-04-01 08:10:00, Yongchao Wu wrote:
> When cdns3_gadget_start() fails, the DRD hardware is left in gadget mode
> while software state remains INACTIVE, creating hardware/software state
> inconsistency.
> 
> When switching to host mode via sysfs:
>   echo host > /sys/class/usb_role/13180000.usb-role-switch/role
> 
> The role state is not set to CDNS_ROLE_STATE_ACTIVE due to the error,
> so cdns_role_stop() skips cleanup because state is still INACTIVE.
> This violates the DRD controller design specification (Figure22),
> which requires returning to idle state before switching roles.
> 
> This leads to a synchronous external abort in xhci_gen_setup() when
> setting up the host controller:
> 
> [  516.440698] configfs-gadget 13180000.usb: failed to start g1: -19
> [  516.442035] cdns-usb3 13180000.usb: Failed to add gadget
> [  516.443278] cdns-usb3 13180000.usb: set role 2 has failed
> ...
> [ 1301.375722] xhci-hcd xhci-hcd.1.auto: xHCI Host Controller
> [ 1301.377716] Internal error: synchronous external abort: 96000010 [#1] PREEMPT SMP
> [ 1301.382485] pc : xhci_gen_setup+0xa4/0x408
> [ 1301.393391] backtrace:
>     ...
>     xhci_gen_setup+0xa4/0x408    <-- CRASH
>     xhci_plat_setup+0x44/0x58
>     usb_add_hcd+0x284/0x678
>     ...
>     cdns_role_set+0x9c/0xbc        <-- Role switch
> 
> Fix by calling cdns_drd_gadget_off() in the error path to properly
> clean up the DRD gadget state.
> 
> Fixes: 7733f6c32e36 ("usb: cdns3: Add Cadence USB3 DRD Driver")
> Cc: stable@kernel.org
> Signed-off-by: Yongchao Wu <yongchao.wu@autochips.com>

Acked-by: Peter Chen <peter.chen@kernel.org>

Peter
> 
> ---
> Changes in v2:
>   - Update commit title to reflect state inconsistency
>   - Add more detailed description with error logs
>   - Add Fixes tag and Cc to stable
> ---
>  drivers/usb/cdns3/cdns3-gadget.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/usb/cdns3/cdns3-gadget.c b/drivers/usb/cdns3/cdns3-gadget.c
> index d59a60a16..4cc3f2ffb 100644
> --- a/drivers/usb/cdns3/cdns3-gadget.c
> +++ b/drivers/usb/cdns3/cdns3-gadget.c
> @@ -3428,6 +3428,7 @@ static int __cdns3_gadget_init(struct cdns *cdns)
>  	ret = cdns3_gadget_start(cdns);
>  	if (ret) {
>  		pm_runtime_put_sync(cdns->dev);
> +		cdns_drd_gadget_off(cdns);
>  		return ret;
>  	}
>  
> -- 
> 2.43.0
> 
> 

-- 

Best regards,
Peter

