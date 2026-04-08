Return-Path: <linux-usb+bounces-36061-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mFQFNo7m1Wld/AcAu9opvQ
	(envelope-from <linux-usb+bounces-36061-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 08 Apr 2026 07:24:30 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C117A3B7268
	for <lists+linux-usb@lfdr.de>; Wed, 08 Apr 2026 07:24:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A33963018777
	for <lists+linux-usb@lfdr.de>; Wed,  8 Apr 2026 05:24:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4578355F47;
	Wed,  8 Apr 2026 05:24:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YiMXMr13"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 303DD19D8A8;
	Wed,  8 Apr 2026 05:24:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775625854; cv=none; b=fOgY318vnflizqlt3esvdWl0qUifAR2+f1C52iKcwzy+FoZ0CHViywwO98bPSaVhlTIcpN3jA2sPYNgnjorsmqOTmzqxIrfReKo8ZKgu0YeJduvpMDEdDGPGqgod1nj9Az0RZ3dWx7ldIbXlUEhDYAbMCHWlR/JQj2roDS2X7e4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775625854; c=relaxed/simple;
	bh=wBc4gl2asjXums88OrFtUc3nzEZ7PDFnuSG8zQepTvo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=thviCGK3163XNDEHbpqvb7im5Ug1LH6IbIFxjT0jqNQDFRgQX3FpUk/eEul/ZQ8JpGVayTdhQM22wPPWme79DdHHcjSxfdFXAuTwXRkJiritNmqOyUA+h6qhmjEmfBQIyV5OUcQAd9fI2cgsFea2ejdjixYgyEe3jy2XoQI7COM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YiMXMr13; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B11BC19424;
	Wed,  8 Apr 2026 05:24:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775625853;
	bh=wBc4gl2asjXums88OrFtUc3nzEZ7PDFnuSG8zQepTvo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YiMXMr13/fSnMfwvYpqG0JFUceNG//gaT8+7WAqldIq6DuEKQsPpNtAtP+fd8xFHh
	 0QeoPCvhDfV/RONDSxq66GccmJ4/h3vjKsLAsNiKMy15mz6R99mFXOftZSEiJrMJwJ
	 Pn8Ef0e/dUjh7DxcS1CgLNiXvQtRiCZ1Y3C9LTDjOcfc0e5VzWeA5qLlkwuc7ddZDY
	 L3cXwXlxhI60385/SbgwL3ibZAoplVKmOH9MmpjbWN72HwShvfnBksooAdhix44n1u
	 zq13Wh2DNmKwmhcjtoVYOTRrr80vyYyBRYuxZwu+UUxomnY5XtfcfKFsoRtNQURa73
	 ZpgnHH1pBzxLQ==
Date: Wed, 8 Apr 2026 13:24:09 +0800
From: "Peter Chen (CIX)" <peter.chen@kernel.org>
To: Xu Yang <xu.yang_2@nxp.com>
Cc: gregkh@linuxfoundation.org, jun.li@nxp.com, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev
Subject: Re: [PATCH v2 1/3] usb: chipidea: core: refactor
 ci_usb_role_switch_set()
Message-ID: <adXmeZoRuOrR7T6w@nchen-desktop>
References: <20260402071457.2516021-1-xu.yang_2@nxp.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260402071457.2516021-1-xu.yang_2@nxp.com>
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
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-36061-lists,linux-usb=lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[peter.chen@kernel.org,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-usb];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,nxp.com:email]
X-Rspamd-Queue-Id: C117A3B7268
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 26-04-02 15:14:55, Xu Yang wrote:
> Current code is redundant, refactor the code, no function change.
> 
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

Acked-by: Peter Chen <peter.chen@kernel.org>

Peter
> 
> ---
> Changes in v2:
>  - new patch
> ---
>  drivers/usb/chipidea/core.c | 29 +++++++----------------------
>  1 file changed, 7 insertions(+), 22 deletions(-)
> 
> diff --git a/drivers/usb/chipidea/core.c b/drivers/usb/chipidea/core.c
> index fac11f20cf0a..87be716dff3e 100644
> --- a/drivers/usb/chipidea/core.c
> +++ b/drivers/usb/chipidea/core.c
> @@ -618,28 +618,13 @@ static int ci_usb_role_switch_set(struct usb_role_switch *sw,
>  	struct ci_hdrc *ci = usb_role_switch_get_drvdata(sw);
>  	struct ci_hdrc_cable *cable;
>  
> -	if (role == USB_ROLE_HOST) {
> -		cable = &ci->platdata->id_extcon;
> -		cable->changed = true;
> -		cable->connected = true;
> -		cable = &ci->platdata->vbus_extcon;
> -		cable->changed = true;
> -		cable->connected = false;
> -	} else if (role == USB_ROLE_DEVICE) {
> -		cable = &ci->platdata->id_extcon;
> -		cable->changed = true;
> -		cable->connected = false;
> -		cable = &ci->platdata->vbus_extcon;
> -		cable->changed = true;
> -		cable->connected = true;
> -	} else {
> -		cable = &ci->platdata->id_extcon;
> -		cable->changed = true;
> -		cable->connected = false;
> -		cable = &ci->platdata->vbus_extcon;
> -		cable->changed = true;
> -		cable->connected = false;
> -	}
> +	cable = &ci->platdata->id_extcon;
> +	cable->changed = true;
> +	cable->connected = (role == USB_ROLE_HOST);
> +
> +	cable = &ci->platdata->vbus_extcon;
> +	cable->changed = true;
> +	cable->connected = (role == USB_ROLE_DEVICE);
>  
>  	ci_irq(ci);
>  	return 0;
> -- 
> 2.34.1
> 

-- 

Best regards,
Peter

