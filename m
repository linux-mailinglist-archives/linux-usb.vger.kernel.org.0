Return-Path: <linux-usb+bounces-34838-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0CgfLl6et2l/TgEAu9opvQ
	(envelope-from <linux-usb+bounces-34838-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 16 Mar 2026 07:08:30 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B813294F8C
	for <lists+linux-usb@lfdr.de>; Mon, 16 Mar 2026 07:08:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0F4BE300C934
	for <lists+linux-usb@lfdr.de>; Mon, 16 Mar 2026 06:08:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5BB1D348466;
	Mon, 16 Mar 2026 06:08:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="0KQzo4ZI"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDF51221F0C;
	Mon, 16 Mar 2026 06:08:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773641292; cv=none; b=IegnugDr3INzssh1Fx9ojnXkgEndSFGmbi3a/TCsLJsZ3HJhn5zAJ2oz+4AkOQtze2bDpjHi+3j0yCYkUW6O6bsIqbCfkY2Kp2QuIQ43BxBmGyZk9EU74zkppWRB6OUzauCi5ZoDR0dchSsFNOIcHhh0HIugh1uvN2ZOW0i/THA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773641292; c=relaxed/simple;
	bh=rakuDO5xe7RyfJb/jTzL1YuV5Ks5YMXigvm6njkJAoQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Z+K0sX8wGuxG4n4XCwtO65sU0uJX5pGrNApcsr9DXwqgB5WI3jKlINsFdOOcrL6glo3z+7VHcn8akqXl3zH/4cnyVNxhoVISVjo4sXYyoVl5cpSlL7drdKn7DppWmWGy2im+kX1e8rrltq4fT3ky/3OGxtjcEJocjRJiLvx1+Mg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=0KQzo4ZI; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2B2EC19421;
	Mon, 16 Mar 2026 06:08:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1773641292;
	bh=rakuDO5xe7RyfJb/jTzL1YuV5Ks5YMXigvm6njkJAoQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=0KQzo4ZI51i2VhGTTzl/KyWh0pt/GKFJQX7RhKet7HFRp0tynUAMc62WR0TLDfyqH
	 VZcpnuch0YyBjcyiFvDol0Va4HEDL4Ms7MD3l3shIMz8NSC5rCKUn3fav8h+e8wuD+
	 tGFbaLZ2BKnht8IPxLZLOhhQOCwBVb5KIUW8MCXw=
Date: Mon, 16 Mar 2026 07:07:53 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Loke Forsberg <loke.forsberg@gmail.com>
Cc: linux-usb@vger.kernel.org, khtsai@google.com, raubcameo@gmail.com,
	kees@kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: gadget: f_ncm: replace kzalloc with kzalloc_obj
Message-ID: <2026031617-hypocrisy-lion-cb8e@gregkh>
References: <20260315111827.20205-1-Loke.Forsberg@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260315111827.20205-1-Loke.Forsberg@gmail.com>
X-Spamd-Result: default: False [3.84 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=korg];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34838-lists,linux-usb=lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[linuxfoundation.org:+];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gregkh@linuxfoundation.org,linux-usb@vger.kernel.org];
	FREEMAIL_CC(0.00)[vger.kernel.org,google.com,gmail.com,kernel.org];
	TAGGED_RCPT(0.00)[linux-usb];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linuxfoundation.org:dkim]
X-Rspamd-Queue-Id: 4B813294F8C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sun, Mar 15, 2026 at 12:18:27PM +0100, Loke Forsberg wrote:
> Replace kzalloc(sizeof(*ptr)) with kzalloc_obj(), to improve type safety.
> 
> Signed-off-by: Loke Forsberg <Loke.Forsberg@gmail.com>
> ---
>  drivers/usb/gadget/function/f_ncm.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/usb/gadget/function/f_ncm.c b/drivers/usb/gadget/function/f_ncm.c
> index 14fc7dce6f39..e1e6763293ef 100644
> --- a/drivers/usb/gadget/function/f_ncm.c
> +++ b/drivers/usb/gadget/function/f_ncm.c
> @@ -1456,7 +1456,7 @@ static int ncm_bind(struct usb_configuration *c, struct usb_function *f)
>  		return -EINVAL;
>  
>  	if (cdev->use_os_string) {
> -		os_desc_table = kzalloc(sizeof(*os_desc_table), GFP_KERNEL);
> +		os_desc_table = kzalloc_obj(os_desc_table, GFP_KERNEL);

Why have you used GFP_KERNEL when kzalloc_obj() does not need that for
the default case?


>  		if (!os_desc_table)
>  			return -ENOMEM;
>  	}
> @@ -1753,7 +1753,7 @@ static struct usb_function *ncm_alloc(struct usb_function_instance *fi)
>  	struct f_ncm_opts	*opts;
>  
>  	/* allocate and initialize one new instance */
> -	ncm = kzalloc(sizeof(*ncm), GFP_KERNEL);
> +	ncm = kzalloc_obj(ncm, GFP_KERNEL);

Same here.

thanks,

greg k-h

