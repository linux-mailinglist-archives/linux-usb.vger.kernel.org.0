Return-Path: <linux-usb+bounces-36403-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qMa7IIrb52kBBwIAu9opvQ
	(envelope-from <linux-usb+bounces-36403-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 21 Apr 2026 22:18:18 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 73A6E43F5A7
	for <lists+linux-usb@lfdr.de>; Tue, 21 Apr 2026 22:18:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 3D56D3009F3D
	for <lists+linux-usb@lfdr.de>; Tue, 21 Apr 2026 20:18:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A078B35E922;
	Tue, 21 Apr 2026 20:18:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="tH/9mmfy"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA11F2264A9
	for <linux-usb@vger.kernel.org>; Tue, 21 Apr 2026 20:18:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776802692; cv=none; b=EksEFgk1Ag6KbK2adSqGnuzjNYPGr5c01yiUMR9QHRSKsu2Zflg//GM4pf/OH61KRI2sOyuYwfA1MTshoFwIqGMyNahrTrL4kXeqrpQ1eI0QMUsBGrgScWf8rMD7K0JQWuiJDaO20R+ZF/KGlucQIMP87ev7VaozrHspUNg/8h4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776802692; c=relaxed/simple;
	bh=RoJXJWqR3vOiO22NgQK5EsUI+vZUJE9QR22Bkld9VUE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HondMP/TfUS9Sho/dXEwTjhskP7lwLWibaEafQAPwQfRByl4Vj5Pxl3cRvetVQVCeJrWKvbMEYU/TI6eEJVRXYD04eJrHHbKoc2pRW19CqOc9pqKyXuxfQ5JcUP3wn65XzLtaiQHfYVz/xRaOJRzmiWwIQF9R5KYeQ8FPk1E40M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=tH/9mmfy; arc=none smtp.client-ip=209.85.222.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-8ef0ba61d46so75339885a.2
        for <linux-usb@vger.kernel.org>; Tue, 21 Apr 2026 13:18:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1776802690; x=1777407490; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=v/S81oIdpD7a2iCCeuWx/EYZi/RB6XRyMOCJaXVxsWs=;
        b=tH/9mmfylaFKumL1ZzPawQKCJp1sFFmJQoxkSd+QPeKj0JbsyJxW+uuq4ep0z+nm2h
         fjXEeZTliM5tSBxklmfBU0DWU9R8eDmFKmj4+vB2PV1GmIlhzYBT13tQZsv2ka8xuJwn
         gUy5gEYk/QDNjXrqBSp4OwlZV8urkPNGNMvfMCcMrLEcerIXRl7C0TYgpavCADQpGvpd
         h0/35XEvErPZsHVpZE7H9mL2tygDLN/yvDat2LOMi/e3flOycYsA3rSXfMdYLIZ1FE3h
         K2LbviPDWox99D5UuqNc9cHlCoNcnq90tE7Na44GFHikgYOxjjcDK42YUE1BbFAFBK1h
         VO9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776802690; x=1777407490;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=v/S81oIdpD7a2iCCeuWx/EYZi/RB6XRyMOCJaXVxsWs=;
        b=dYFAgzNKG3t5a68l4zypnkiT4YirFAfB0dr5UOiIhh3U+jXHp13FsWNzoMKaWwfjsg
         p7yXCWDRmsTDModMu62OyxifkTgzQ08dUogzdU67UA8J2DE+Ss3gjTKn146hDa7xfWrR
         ZGqv9eQ2g7CTIzGTjVp3SquAPhGrNvfNyCUe3NbJOW39o5DtssznJELG36I2g1Or51ny
         lxkKZAaQcTCT7kW19sMwAz3hHYBPJLJMHMENASXJC52KD3NKb9yAb5Dm4/WLOigaHcCv
         nV5+s6gobZe+V4j08ChsRk/MuXSfclMq0RVQq3eC5+UyTIvfSuQLwUYMS6h2ZkvtZNCp
         4hgg==
X-Forwarded-Encrypted: i=1; AFNElJ8DKvH9/ZixWDSlYgYXAxLlOk437tUQbi16u+t0rNhcW2ZJ5v7+HxAfCUY3r3Tak2cJ31uBKnnpFQw=@vger.kernel.org
X-Gm-Message-State: AOJu0YwDY91Rn23Nc9QEYRFE4EifuxUR0eNRkozTGnhWHb3kvFpGgeFa
	bWABGYZ/SVvnfG4KD/0efVWPuDalCMp+jO6tB53hZKyYO5Zl41JHCOq9gl7URuX9Dg==
X-Gm-Gg: AeBDietPBX5rdhJBG+U1KfFn3kjytsA7LoTw8Vu2p0xzVvPufdb0wsHOC+b9GkGwYDg
	MKOEbVt41z2cRLAvRRbHUkGJ3NWJ/LWsOMU3xbtOY1lSmah3HnaHNOsxqM8sGELR5GYizd5ObSj
	qZU/VkHh2Bo9zGUiJAurSwF0kMA0CVT55D/GJ+1sdwv7AK+XZUAKQLYPVBzj2DnrIdOgJLWUn+J
	yGmEEdFgaLTAMnkka6psOfe6UfDrxJBqP+TfcbIkBC8u0ALQlS+/y+dRWgyROxDsmYDuizrHwWT
	sYWOCocXFIk5GtJeC1UatUdWM6K9KTk+3tLr1pUaGINM4dIOs12fylWkxJ5tCGA/f/1yrBLrzbz
	WwQ7v/kyjJ1a5JqXfNCyG10OXHeZQYjtYpMgyruUiOZ6itX17qzYe1dcWIN3GWYNIJhTGNxaUTr
	TT4YfNrb74PY0P1v3qafqm5uipmQtQIJ3D7hI=
X-Received: by 2002:a05:620a:4441:b0:8cb:2b30:1c82 with SMTP id af79cd13be357-8e7918a3442mr2614484885a.36.1776802689816;
        Tue, 21 Apr 2026 13:18:09 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:d01:d210::5a82])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8ed54eb91a0sm425852685a.47.2026.04.21.13.18.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Apr 2026 13:18:09 -0700 (PDT)
Date: Tue, 21 Apr 2026 16:18:07 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: =?iso-8859-1?Q?Bj=F8rn?= Mork <bjorn@mork.no>
Cc: Xu Yang <xu.yang_2@nxp.com>, gregkh@linuxfoundation.org,
	khtsai@google.com, kexinsun@smail.nju.edu.cn, hhhuuu@google.com,
	kees@kernel.org, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev, jun.li@nxp.com
Subject: Re: [PATCH] usb: gadget: udc: skip pullup() if already connected
Message-ID: <40ab2813-e583-484e-990b-1a3651e0bbb4@rowland.harvard.edu>
References: <20260421082050.1260823-1-xu.yang_2@nxp.com>
 <e431e2f9-ce24-491a-9447-1b872099ab25@rowland.harvard.edu>
 <87v7dkpc4b.fsf@miraculix.mork.no>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87v7dkpc4b.fsf@miraculix.mork.no>
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[rowland.harvard.edu,none];
	R_DKIM_ALLOW(-0.20)[rowland.harvard.edu:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[rowland.harvard.edu:+];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-36403-lists,linux-usb=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[stern@rowland.harvard.edu,linux-usb@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	DBL_BLOCKED_OPENRESOLVER(0.00)[rowland.harvard.edu:dkim,rowland.harvard.edu:mid,harvard.edu:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 73A6E43F5A7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Apr 21, 2026 at 05:27:32PM +0200, Bjørn Mork wrote:
> Alan Stern <stern@rowland.harvard.edu> writes:
> 
> > This patch is wrong.  To see why, read the comments just below the end 
> > of the patch and see also usb_gadget_activate().
> 
> 
> Made me look...
> 
> Must say. This strikes me as a nice way to filter out humans from the
> rest of the submitters:
> 
>                 gadget->connected = true;
>                 goto out;
>         }
>  
>         ret = gadget->ops->pullup(gadget, 1);
>         if (!ret)
>                 gadget->connected = 1;
> 
> 
> The indecisiveness looks strange. There's a nice symmetry with
> usb_gadget_disconnect_locked() though:
> 
>                 gadget->connected = false;
>                 goto out;
>         }
>  
>         ret = gadget->ops->pullup(gadget, 0);
>         if (!ret)
>                 gadget->connected = 0;

Granted, it does look a little strange.  ->connected is actually a 1-bit 
bitfield, though, so treating it as a boolean instead of an integer is 
not completely beyond the bounds of reason.

> What surprised me most was that the different variants were added by the
> same commit
> ccdf138fe3e2 ("usb: gadget: add usb_gadget_activate/deactivate functions").

But this isn't what my rejection was complaining about.  The patch's 
problem was functional, not aesthetic.

Alan Stern

