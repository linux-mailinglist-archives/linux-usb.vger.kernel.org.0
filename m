Return-Path: <linux-usb+bounces-37645-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +InIHtqUC2ohJgUAu9opvQ
	(envelope-from <linux-usb+bounces-37645-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 19 May 2026 00:38:18 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id EE97E574A66
	for <lists+linux-usb@lfdr.de>; Tue, 19 May 2026 00:38:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A146E3048C18
	for <lists+linux-usb@lfdr.de>; Mon, 18 May 2026 22:37:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC8BB398910;
	Mon, 18 May 2026 22:37:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T8DrAleS"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C40CB2ED846
	for <linux-usb@vger.kernel.org>; Mon, 18 May 2026 22:37:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779143872; cv=pass; b=mt6ZbPOaZXw+A/s73a6wE6MTAVqq1O+ApYzJr0Glikqso49wah5L5Tu4wffF8ay6MfjHWl750Y1TaQ+nNE56n/x6CoLLyKJJOHJfBqJQ7TvT0tU2GaUbh9M+hUxNfjk3bXOze66I1fR1V4kJbEYNDTybkRd4Qqtm+LA6T9e1cxI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779143872; c=relaxed/simple;
	bh=zVH9YEIH9Jj4pvYqYjCWleuCjg1+IKQGcGIJdO1LwvA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Jna6jlhEIleWW+yJHJ7j25YMrO/u3HXsyfNr5DuT58o0h4OZrVjOBwG1AGv0aMULh3+k0B9pwxEtqzDqvGpqv3W4JkVW2Ue0DnJbMNJG6KCQUWVlO8HiRyZRLdxJMlY6+VgaG0W5rGEeYz72KFVvo/jO699kWS6GbIkF4S61bAQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T8DrAleS; arc=pass smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-488b150559bso22098345e9.1
        for <linux-usb@vger.kernel.org>; Mon, 18 May 2026 15:37:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779143869; cv=none;
        d=google.com; s=arc-20240605;
        b=QyCa96nwPeaO+NAnGouz1oIPwBPHAs6vYWU9ODEkTEyl71Yiyr/LWx760ejKQynitQ
         XBBA4882D/FatSuaV1PDvW2l3ZrjcazpArE327KejQJtHb1dI55GknkTkuJBIXwcxqqQ
         XwpMo+P9zSgTo9DhhcD4dAgQkU3DvzFJabZN+A8yn04QvbSxQoamB2KlDWRO5bTJ/YLV
         8vNmvNFeO77n/RIusO3IK2VhY40/dC7p68qpuOyvQ9zMvabNC5I1JHbbW7jFDcrfzIJP
         41ysC+nZ2zMX4x8aVW5DUn17W0471isIL0jWCb8JpuHezqn1sotNN/ulUFo8XFQKFc0J
         1FDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=664GWszhyp31Qa0bLmQEwoNrNiUNgsJ84EqGT9xrYhg=;
        fh=ctNoIViXZ9Jmr7mAv8W82TEDWzOOLeEPYKvSsSHkOAM=;
        b=LbO4CsNSgCn0LpN+lPE0BfVDteOtzpBw8toQuqy1ng1GvMt/IVPs4yP5oN+2kWlI2g
         RA/0FeRMidfWuGieXROMduZqlW6Q17qkMktmE9QCu5Vf8YYMXKSJf1dHJbXsiB3BwRss
         zm2XUulQuq1HF6td1bqZ58AaDhYCgUIJSYgJ8m3WoYKZhk3U+ZCPE0F8QRubAC/RTgc/
         Aptsn0LtJH5kkT309yibv44j2OiPtsPZfpUTrch2qECY18Z3rHLCkVx/X4HUlcNx2L2N
         0Xh2sRaa8qdriFRaNRcNP+LMPkJwyVhwDVWyj+zkH69MQ7fCNM+C74fLWIJfHL4mZhT2
         adNg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779143869; x=1779748669; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=664GWszhyp31Qa0bLmQEwoNrNiUNgsJ84EqGT9xrYhg=;
        b=T8DrAleSSpiLZyx1P56QDzq9a71zIDp3wOZqe2awkw6+Hvapp2YLnYZC6bLmVlRrzG
         6+fDoGVNaf/0RZM+j71PmVlXqeMXcFaMpparyr+brBDR+fsjmCzxx7wE8pOAoPDLvRHH
         WbiPdfbcGJxDeVpFaXUUWToC4Wee6Zs4XcLyB1bi+7uYP/A4gksvMqR9c7RqP57QtMpb
         sIAtiEY1Sjw4UNPKIO1hvRJErCSoxbusi47Mh//cXtfRZKwa/VDr2B98/5Yr7AIO+/mP
         mry3cgiL3KJxiwLQpbyL512GaVrfdFjWjhTqEOQZIZ/QieAeT42fc6iD8aRb4RvMteGX
         Bj+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779143869; x=1779748669;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=664GWszhyp31Qa0bLmQEwoNrNiUNgsJ84EqGT9xrYhg=;
        b=LN209UUuY+6iroP9EbjwA+7dv7Sjl4nlmkLBOjfSQqym/MeDfg8BPhDE82vjUCtsGq
         LbljuGkUNbyK4rR+FlRJBIAgNIi9BQO64YvLAUokHMvhwLbe0/alvVu0A4H6j18qaeHs
         UxCsTjAMd6xS42QSE9NCM1XzkMghGRwmCfMA8tk9KagD/D29k/cYTEkiupvC6HoMHA5K
         s5Co7baTobZUmKJnvSLTRRfiLiaFi72WPbGrljBvCnHv5r93A2aL2cuqUfSMVmCKtT4+
         XUoqnwPEFQDmjFGmmSXvV+pOU/T9bF6knv+IefpZfO6A9xp1Lqst1YK2T1eTAMt7oVVz
         byxw==
X-Forwarded-Encrypted: i=1; AFNElJ+9STB6boi0VPsZSvOFbA5MiCWPbBYLM3tNo5FpWLvk4my5tVwyTGe5izDEeMUAy5MduWTMyzU4kgs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+4SObHRs2st+QQFaUyirvLtgyIotNnwlPcASpcCpWxTWJ/lB2
	/jLyYbtqIVeR80gokDQnt2O8GnrPWUuGosaa2ouOrIcUs5fatBIlRRwwU6KJfmpG2CHFngrbv1q
	d9xVwCafD2D7lge9boY9qQ7wvJy5athc=
X-Gm-Gg: Acq92OE9Ubot/XlRQ4zjEaeZ8SJTm6P+Xm9HEZPKZDZqiBuYzwDKnkHNfQCG9Sgy/iz
	wkDfbwiLC7kjjkyljFADFtDjXmGrDRk42AHIONdO5XjRU4oxFcRmoiNextZQ7HK9EnyumR0ibkL
	07VZJjA3JH4MVh8kszvhwi5bMrBx/EAicM0CKAbUyPZrZgNsJ6PFXFaYRV22qST0O8qFuJeYDNc
	BjZ5RT4DIHg7+CAsOr7ZtadNt67n/lsp47B8uA1AI8039oosKbt7nzVvKzoGRbcQPNKRmyyWhsn
	smIjiesK/5B98ppWkxQzmWTeXuQi8aG6P63IXfCtMw==
X-Received: by 2002:a05:600c:8210:b0:48a:5c23:cab with SMTP id
 5b1f17b1804b1-48fe6322447mr245539975e9.19.1779143868957; Mon, 18 May 2026
 15:37:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260517000145.1868817-2-eeodqql09@gmail.com> <20260517190308.1876316-1-eeodqql09@gmail.com>
 <20260517190308.1876316-2-eeodqql09@gmail.com> <a5b4720d-e91b-4a81-b2b6-e04835e1826b@rowland.harvard.edu>
In-Reply-To: <a5b4720d-e91b-4a81-b2b6-e04835e1826b@rowland.harvard.edu>
From: Seungjin Bae <eeodqql09@gmail.com>
Date: Mon, 18 May 2026 18:37:12 -0400
X-Gm-Features: AVHnY4K5frEosx4V9e-Ua__o05JMJ_e9AfAIbG5Aep1mC8J9uH3JNwsoUzOpqw4
Message-ID: <CAAsoPpUjCeMoPdDd_CiP6j-Cnfx7kpWAvZHU_kme7tVCgcKgVg@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] usb: host: max3421: Reject hub port requests for
 non-existent ports
To: Alan Stern <stern@rowland.harvard.edu>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Kyungtae Kim <Kyungtae.Kim@dartmouth.edu>, 
	Kees Cook <kees@kernel.org>, Dan Carpenter <dan.carpenter@linaro.org>, 
	David Mosberger <davidm@egauge.net>, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-37645-lists,linux-usb=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	MISSING_XM_UA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[eeodqql09@gmail.com,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid]
X-Rspamd-Queue-Id: EE97E574A66
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

2026=EB=85=84 5=EC=9B=94 18=EC=9D=BC (=EC=9B=94) =EC=98=A4=ED=9B=84 5:54, A=
lan Stern <stern@rowland.harvard.edu>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:
>
> On Sun, May 17, 2026 at 03:03:08PM -0400, pip-izony wrote:
> > From: Seungjin Bae <eeodqql09@gmail.com>
> >
> > The `max3421_hub_control()` function handles USB hub class requests
> > to the virtual root hub. The `GetPortStatus` case correctly rejects
> > requests with `index !=3D 1`, since the virtual root hub has only a
> > single port. However, the `ClearPortFeature` and `SetPortFeature`
> > cases lack the same check.
> >
> > Fix this by extending the `index !=3D 1` rejection to both cases,
> > matching the existing behavior of `GetPortStatus`.
> >
> > Fixes: 2d53139f3162 ("Add support for using a MAX3421E chip as a host d=
river.")
> > Suggested-by: Alan Stern <stern@rowland.harvard.edu>
> > Signed-off-by: Seungjin Bae <eeodqql09@gmail.com>
> > ---
>
> Reviewed-by: Alan Stern <stern@rowland.harvard.edu>
>
> Heh, this made me go back and look at dummy-hcd.c.  It's missing the
> same check in the same places!
>
> Would you like to submit a patch to fix that driver as well?  If not,
> I'll take care of it.
Thanks for pointing this out.
I'll send a separate patch for that shortly.

Seungjin Bae
>
> Alan Stern
>
> >  v3: New patch in v3, suggested by Alan Stern.
> >
> >  drivers/usb/host/max3421-hcd.c | 4 ++++
> >  1 file changed, 4 insertions(+)
> >
> > diff --git a/drivers/usb/host/max3421-hcd.c b/drivers/usb/host/max3421-=
hcd.c
> > index 3d6b351dcb1a..73e76d0e6973 100644
> > --- a/drivers/usb/host/max3421-hcd.c
> > +++ b/drivers/usb/host/max3421-hcd.c
> > @@ -1685,6 +1685,8 @@ max3421_hub_control(struct usb_hcd *hcd, u16 type=
_req, u16 value, u16 index,
> >       case ClearHubFeature:
> >               break;
> >       case ClearPortFeature:
> > +             if (index !=3D 1)
> > +                     goto error;
> >               switch (value) {
> >               case USB_PORT_FEAT_SUSPEND:
> >                       break;
> > @@ -1728,6 +1730,8 @@ max3421_hub_control(struct usb_hcd *hcd, u16 type=
_req, u16 value, u16 index,
> >               break;
> >
> >       case SetPortFeature:
> > +             if (index !=3D 1)
> > +                     goto error;
> >               switch (value) {
> >               case USB_PORT_FEAT_LINK_STATE:
> >               case USB_PORT_FEAT_U1_TIMEOUT:
> > --
> > 2.43.0
> >

