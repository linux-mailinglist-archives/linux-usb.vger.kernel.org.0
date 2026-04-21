Return-Path: <linux-usb+bounces-36396-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +LrULC+M52lY9wEAu9opvQ
	(envelope-from <linux-usb+bounces-36396-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 21 Apr 2026 16:39:43 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2241743C2C0
	for <lists+linux-usb@lfdr.de>; Tue, 21 Apr 2026 16:39:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id C8A80301CE4B
	for <lists+linux-usb@lfdr.de>; Tue, 21 Apr 2026 14:38:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D0A5387590;
	Tue, 21 Apr 2026 14:38:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="LAgKP+y8"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F191212D7C
	for <linux-usb@vger.kernel.org>; Tue, 21 Apr 2026 14:37:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776782280; cv=none; b=K5ean2s9rY7pxIsfPQilUquIq+2/borTrV8tgAL13TB4+jKzw/Z8I+jF6chwC/HzT+LGODeJG4Vx8Ur83H4W0TgcMoYNbxur7BpBii8er1MgQld3YkaKyl2oG9XXmfROhdn2ahULDHQTBwQMoTLXhaJi+jgKhzXPWGNmRpc0Lak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776782280; c=relaxed/simple;
	bh=AHJgGnpeX5LVzY/GceNPIBAEzVpq45DA7bIyL1jAogY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=s4alfwG+RmD33WvRTJ4YyXItan7QZBwwp3AqDYyRwYbEBtJyemSnXeDLtUHsumk1WNlPaRBzIClpAeA99FNhpN2zSDiyu3dtKAB1xG33Wbe11xYRjtAfsBFztF+NMMj5BGUtBSPpdrzDe7HCtxwMChi99GDz5rEuaL5Prz5YDDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=LAgKP+y8; arc=none smtp.client-ip=209.85.160.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-506a7bbe9d0so36547961cf.0
        for <linux-usb@vger.kernel.org>; Tue, 21 Apr 2026 07:37:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1776782277; x=1777387077; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=47UOho7cFXU9Cx0PBlLkPD/xoymRf95gp8yIK25T/BY=;
        b=LAgKP+y8iWwXPnqDPnrv3QD2sGY35izXvwkHzLrTFqXnM1nJx9kdZdZaGqYJooheoq
         BdZrOgYuRZvMkFEcX+c7Yt956lisQzHetC9XpiyF31oaf4swxA3hSZuHyvNfpSlxQtbu
         aH3yNP1GJL1ZTVVQoju6Ien/FFmTk4cRq+Z9vVv+jWLl1iGUMeL5IvxZLeGoCrQMJNp5
         OaLFyNTZ8RbNDLftaSgAq0OjLdggMwo94Gu24v23Jkm5vfDU7oDq/mB2rVpQL7RVTFYe
         PuYWcXLpXBWOAsteY2i7zYnWVib0ZXDWQHWZlH46GgZkc14q8qUw9PnsxSOpxytse6zW
         tCFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776782277; x=1777387077;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=47UOho7cFXU9Cx0PBlLkPD/xoymRf95gp8yIK25T/BY=;
        b=JChcJcLKIMfT6yMUoEjzzgVPQCetYKqsMPFquMjIzs9TtRF8y3iIpFeIFN/I4QJL4A
         j+hw3Qwc/nXaj6tRhDrh5AlADANZc7ei2vpi/Kw4wh40sB88lDwdXEaXOSSgCdHhqhFa
         AUWQyH6a3OqgepSlnfcP4okGBPyxyCmjVE+/qDkdZYiFgHeCI/gDh3/JjcxfJdzlH7QM
         9U0GDf9tGATYwoMbDPjyDad4Bz6/slG/TkJXX2BWrXpDU1vmg/61e5pxB4KGu/061M4x
         S8aGrCH5aizdnYxh2GqJjnJyP7ZcSQpe3GXZnvFnsVeg2lbnlFF7u2aeGrMg9JcRB8LL
         Xg0A==
X-Forwarded-Encrypted: i=1; AFNElJ/DlgkJUtR9NTy5E+iPIt0tP7P7Fwkns+hbUXs5HWh9kRf7R9K13/gzCrdAhdx6AxV4QZfC3upxQxo=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywo2E82pUufIGurcDuzO08niQ76OCrCYNB0RCFp90bdFhDJIFUD
	RPKn1KeQYxAJUWZars/C4nSd3OrM57Ksytq2VoXeG/H2YyK5ZhhtM03QUGsAMxYKWg==
X-Gm-Gg: AeBDievvJJJnrhDKLhYYCnCDLroW2lAwjQCeS7WfNIgUUFPcGUdxzZLNipM5IL6/pUh
	7UBL+1jCemStrC+KKW/STiHM09IecsU/jEv3MENtmDdM/p1je94ujldTkyAKWTNUN3EKKtRHHPO
	eToGPYi2jRbK2OVs48XG8+u37sE/2yh7PbrW32wAbK4FDQSbCv24rsDrTDkAcXOUcIDu8qPiIyR
	b2Nd/+3kbuCf5hZ16tCcnw3NCF3zlz4quPJ2/m3DMNW+z+pa82NdtOcIJTLUT7zHV/ykY/5kcAE
	iUVJacXz+ty9AD4mO4wxSnOnh5pi5NkExfAh3akZI8/IdRLn1y/dXBGZRoMPWFi8zbyonEaD6Q6
	vjvKpkWrQwjiWc2pzbt4KfKVXmF6A6/SPSqX4dOobMTboQ2oreiSrTu3qhBysycEZ5LOgSmXUm6
	ib3ziPdSiqZcAWXOoOxaF6bwGru+/Tc5TqPGOuOKq6lBbBfA==
X-Received: by 2002:ac8:7f0f:0:b0:50d:6557:5c83 with SMTP id d75a77b69052e-50e36c1165emr233206841cf.25.1776782276532;
        Tue, 21 Apr 2026 07:37:56 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:d01:d210::5a82])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-50e5d5ecffdsm53553121cf.29.2026.04.21.07.37.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Apr 2026 07:37:56 -0700 (PDT)
Date: Tue, 21 Apr 2026 10:37:53 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Xu Yang <xu.yang_2@nxp.com>
Cc: gregkh@linuxfoundation.org, khtsai@google.com,
	kexinsun@smail.nju.edu.cn, hhhuuu@google.com, kees@kernel.org,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, jun.li@nxp.com
Subject: Re: [PATCH] usb: gadget: udc: skip pullup() if already connected
Message-ID: <e431e2f9-ce24-491a-9447-1b872099ab25@rowland.harvard.edu>
References: <20260421082050.1260823-1-xu.yang_2@nxp.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260421082050.1260823-1-xu.yang_2@nxp.com>
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[rowland.harvard.edu,none];
	R_DKIM_ALLOW(-0.20)[rowland.harvard.edu:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-36396-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[rowland.harvard.edu:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[stern@rowland.harvard.edu,linux-usb@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 2241743C2C0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Apr 21, 2026 at 04:20:50PM +0800, Xu Yang wrote:
> The device controller may update vbus status via usb_udc_vbus_handler(),
> which tries to connect the gadget even though gadget_bind_driver() has
> already called usb_udc_connect_control_locked(). This causes pullup() to
> be called twice. Avoid this by checking if gadget->connected is true.

This patch is wrong.  To see why, read the comments just below the end 
of the patch and see also usb_gadget_activate().

(Also, is there really anything wrong with calling pullup() twice in a 
row?)

Alan Stern

> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> ---
>  drivers/usb/gadget/udc/core.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/usb/gadget/udc/core.c b/drivers/usb/gadget/udc/core.c
> index e8861eaad907..be29daa7ad3c 100644
> --- a/drivers/usb/gadget/udc/core.c
> +++ b/drivers/usb/gadget/udc/core.c
> @@ -712,6 +712,9 @@ static int usb_gadget_connect_locked(struct usb_gadget *gadget)
>  		goto out;
>  	}
>  
> +	if (gadget->connected)
> +		goto out;
> +
>  	if (gadget->deactivated || !gadget->udc->allow_connect || !gadget->udc->started) {
>  		/*
>  		 * If the gadget isn't usable (because it is deactivated,
> -- 
> 2.34.1
> 
> 

