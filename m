Return-Path: <linux-usb+bounces-35638-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4AL0HpkQymmS4wUAu9opvQ
	(envelope-from <linux-usb+bounces-35638-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 30 Mar 2026 07:56:41 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D1F29355C5C
	for <lists+linux-usb@lfdr.de>; Mon, 30 Mar 2026 07:56:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3D2AA305511A
	for <lists+linux-usb@lfdr.de>; Mon, 30 Mar 2026 05:52:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 98F07391E4C;
	Mon, 30 Mar 2026 05:52:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RdKw3hoo"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 201CD37CD24;
	Mon, 30 Mar 2026 05:52:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774849953; cv=none; b=MAeCMegH8aoITwJJqzDMTyXfnYEUj9zE8DxeqqFvP5rxAhxFM/NbAs4sAk8Q9wsnfFV9GV/39UD69x/T9wSa33MVNH5X15jbAfum8neYjCdkVgvcXfTElsdlt3sBx1D6ic/RlUdujig6Yt2eIw7IUhdE6C/1zyEx7zO12UsE0Wo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774849953; c=relaxed/simple;
	bh=/ECwA851p6elIjvgfB3UCTYIQS+84rslZlhG6UiYunk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Flev1Ejxvbz0R2fwrXd7R9beHMlzDfRV6UVe0b7bzZz+0mf7ZN1OStfduW83ZCH+uf3B7XUgElNtee3PBjZJNwdPQ06D5Gal33CDuWXFiyK3dO+YxgKA5yXlu2fDGOaJsDAk21VS4HIWbaVceSh9aTfTrQb8mLHtjA1ZKChnEcU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RdKw3hoo; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 889D7C2BCB5;
	Mon, 30 Mar 2026 05:52:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774849952;
	bh=/ECwA851p6elIjvgfB3UCTYIQS+84rslZlhG6UiYunk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RdKw3hoo3vpqkG+ojYHvw7m0zWWb6XYsIed4T+Q4A4tJhy9T3+tadGZds8t2nDizT
	 IQRXih9g9mEL2tJnN7YMIV2YbXF2+TNWKZpK5vn5bXbOxPFeR0xlffczf6oiTbjAbJ
	 oFHwl7/3nJLpkhnPMQYR1nN1UnV4U+DEoyWNTmEXJmr63e+qgtlJWTWKnaEOfEB0Y+
	 pMaccdYUJ5gzqklpuavpz6xefpsqZlG0QUZCt6Vg+7KG4hudDDKTo3Epg4Pgi0hpM6
	 Yd/E0YM0e6TOV0dJJ/3VSThjbcK7yuKygRh9cq/I67OQHaasvRnRYwQcKTQljE9fbs
	 VRai8EAIZjwgA==
Date: Mon, 30 Mar 2026 13:52:29 +0800
From: "Peter Chen (CIX)" <peter.chen@kernel.org>
To: Yongchao Wu <yongchao.wu@autochips.com>
Cc: Pawel Laszczak <pawell@cadence.com>, Roger Quadros <rogerq@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: cdns3: gadget: fix resource leak on gadget init
 failure
Message-ID: <acoPnV8UX0wiIjnh@nchen-desktop>
References: <20260328151551.61228-1-yongchao.wu@autochips.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260328151551.61228-1-yongchao.wu@autochips.com>
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35638-lists,linux-usb=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[peter.chen@kernel.org,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCPT_COUNT_FIVE(0.00)[6]
X-Rspamd-Queue-Id: D1F29355C5C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 26-03-28 23:15:50, Yongchao Wu wrote:
> When cdns3_gadget_start() fails, the DRD gadget is left in an
> initialized state, causing a resource leak. When switching to host
> mode, the stale state triggers a synchronous external abort in
> xhci_gen_setup(), leading to kernel panic:
> 
> [  1301.377716][ T5000][E] Internal error: synchronous external abort: 96000010 [#1] PREEMPT SMP
> [  1301.382485][ T5000][I] pc : xhci_gen_setup+0xa4/0x408
> [  1301.393391][ T5000][I] backtrace:
>     ...
>     xhci_gen_setup+0xa4/0x408    <-- CRASH
>     xhci_plat_setup+0x44/0x58
>     usb_add_hcd+0x284/0x678
>     ...
>     cdns_role_set+0x9c/0xbc        <-- Role switch
> 
> Fix by calling cdns_drd_gadget_off() in the error path to properly
> clean up the DRD gadget state. This prevents both the resource leak
> and the kernel panic during role switching.
> 

Good catch.

I have two questions:
- What exactly resource is leaked?
- Do you call cdns_drd_host_on before setup host?

Besides, you may add Fixed-by tag and Cc to stable tree.

Peter

> Signed-off-by: Yongchao Wu <yongchao.wu@autochips.com>
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

