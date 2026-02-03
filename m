Return-Path: <linux-usb+bounces-33033-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6KXpKNm2gWkrJAMAu9opvQ
	(envelope-from <linux-usb+bounces-33033-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 03 Feb 2026 09:50:33 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id DA143D6608
	for <lists+linux-usb@lfdr.de>; Tue, 03 Feb 2026 09:50:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 35BD330074FB
	for <lists+linux-usb@lfdr.de>; Tue,  3 Feb 2026 08:50:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99F61395DBA;
	Tue,  3 Feb 2026 08:50:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aYTqh5e4"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qv1-f67.google.com (mail-qv1-f67.google.com [209.85.219.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D92FE393DD0
	for <linux-usb@vger.kernel.org>; Tue,  3 Feb 2026 08:50:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.219.67
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770108610; cv=pass; b=nF56aDvSGGQou0RwwOv5BOGl/O5/lZ8uRTktnP383mKyw9MAEc3+auvV6PN9VZR61EnGwgWGKNnGLcX1k3hBeerbzNKUuAWcBjrlMuom+cdODADYQw5BoL6hQ8IgBmsAxI8bz6tmQ4vPCAzFfUFKnvp0hnttRVh2gnQe6T+cRZI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770108610; c=relaxed/simple;
	bh=i+dCt4DeKmE0vkJJ36XHq9U/eP0bq1C7KWOcgsKggKw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Eqt+42+W52ld/VEMZm4Zqau2o1PlFjw9Se6cckLp69Q/9A5Mw4bo9Kh5dbQ2hRYAtN1UO1gYbfY6HhUmSsgmJjkdGfNa9etMBWec9BLKhOow3V4SsYOsdTqEfr9XPapRnkCR5bjzW1hM33pIySUkkR9TH07KIMn/aa742f3SyLQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aYTqh5e4; arc=pass smtp.client-ip=209.85.219.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f67.google.com with SMTP id 6a1803df08f44-894774491deso68497886d6.2
        for <linux-usb@vger.kernel.org>; Tue, 03 Feb 2026 00:50:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770108608; cv=none;
        d=google.com; s=arc-20240605;
        b=KX/TswOH/xdq9bu+UfV78rfDnJAVAx2n+k8y5ijDd1xR/UgxUCESx0zhU3VMaYoBTo
         8F5RAL2zJS0LdaFa07T7GFKKXrRWeAzCKUT0xfsgxAAT8fB7xPPyKmG6JKN2aJYOgVQs
         uwojq0fESjzSKlzNwXdMT1chekMIY8wxORctgo80ynpBu1kpyzkOTje/+VQreXb4tAJI
         Tab7CLa87eNabJoYFKRKzXBQgvSlgSTjDYtShjwaOspRBzJH/8xShrT/lJXMUyfm3qhw
         qcKgjDvAeOTIescuBxT73T5xS1ckStgx/aQdH8uGaZi3+vGV3xl2gBF2ySyzM4K59Yst
         RpRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=i+dCt4DeKmE0vkJJ36XHq9U/eP0bq1C7KWOcgsKggKw=;
        fh=xLPKfRP0MwWQRgc5DUhqlDxKo7VUIjvRHsw6SwmVfsA=;
        b=LjbnbS0PQqegmdL6GPmddAPzu9oFRCcA5PrZ9QqBiM9Aqw06cdyQpogzXldwamcbeG
         u43Th5uFu68Zb+ON6KZCadsBE9LpU/MCpFsY0b2iPC4/BmXxYgcFlHux2f10CSzh2BCT
         TJ9pklq6u16aXiuRlRSjnvLdsJhO/qrit1pykbq1QrbGeBUwQPYlime9xOlmCIJm4UPA
         LKRoQ4SwNL1//gANkaEtDmQEQ7dUz/eSZJKcCpbUraERsMCvGMpmHgaL+7BWuKGCWqKf
         jSN+7eHZVzl11WJQUNEAVrQu/NyGdUPok5h+j9BzW1G2vORiec2p98ADjVfUFsgOSfd/
         XQ5w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770108608; x=1770713408; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i+dCt4DeKmE0vkJJ36XHq9U/eP0bq1C7KWOcgsKggKw=;
        b=aYTqh5e4gx8q2j0Tnslvr6tH6jp+WMgl2bSf15QPzb/B9GIBoDcRVVbN/8fOMr47Lf
         FhjYrSKtDs2+/NpU3IXJkGdhYPoEqN+qiKE1/UZ2HFerFAH8S1fWuu6lyt2WMCuXDu24
         uBczyOW1VTVHUbq/16gAXLkpM0nE0t8XuInwYaLRz41bjcmOjUerpzMi6AMxdHHfjuZ0
         /DagcOOHeIkL4How3/zP3+HaMEcbDI8RhHTkloC3/InAMOj4yuF/T0D/lJc1obrBN909
         fqi1N3VWZbCESIZIboxAuJjF88XC6ZTe4DMaL+Do6U3a1M1wt00XeqXa9/yb2qL+hkxB
         jHaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770108608; x=1770713408;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=i+dCt4DeKmE0vkJJ36XHq9U/eP0bq1C7KWOcgsKggKw=;
        b=LnIkhImSRwTCjC2igvNusExVKaeLg5i7/4mDXgxSf/piJB/laNQzOKX+hD0tEdhQoi
         s4v0pAQF6UxNk6wZhCc0Z3vDWZDMxYzuwZOSumPICtp9kdAkYN40gwCaH9ZZXfp9GlJg
         uMNjAwC72NNa3S8s8TWpE8rMupJSxwEfewT3H5geBQpWOG8rO8C24Gqvqeh/WSZC24/Q
         QEJLU6vT+WPmsJuw7h+IGM/zZ9Wd2FkvrsYPiWXOuTcx2V8UOu3uNaxdOSlTK6XX10F5
         etLs9f6JZRf91z8rkmQmzNHPbx3lOd1NtNvIkpWxots6qiJAPMK7AJk1uUUlEwz9JDpc
         DSrg==
X-Gm-Message-State: AOJu0YxDHJdmn6daCINmlrLHsk7Jh6YYlZZ5dSa2mOnJAO38UjOu/JDU
	4iiBrsQY7Jv5w56I8riW703UmufYhqqHnsCJRxhE8GrrkeP/2glHqT3eOv7oliRtjNF4RrbZcHl
	bnHwBGPwdK/i+pE89ueqWtngFY9NmHNg=
X-Gm-Gg: AZuq6aJlTrqHYv56LCJYX9Qeo2s+aYg51QafqgMZuWsTZG35dMGB3rIf1rzoTlxtHU5
	ZqBCadtyBlYcxmK56QIlVqPGfTYcS0QfL43iqUyhvcz8mXqfjJfneluieQ+tHsPwIbzskAnrAEi
	mbaRKiBl9/nG0iKkY4kGxg8IT2p8LUgebps5YCWyZPnHPakw7DfHaYu4puzWtH3pE/6jpPyPBqb
	ec2/JPAMPss39/BgrqDbFgf9OuY3y18WCaAN+mmkxEsOdOMw/hmyejWNR+0TZ4eleyyYT8qsU0k
	BchqE4mKlOYGfxjAR6VV9bEZWT+lmgC0HWoVPrV2PW29j0GsrSc62dKS
X-Received: by 2002:a05:6214:262e:b0:894:610c:3a22 with SMTP id
 6a1803df08f44-894e9f99fa3mr206356306d6.20.1770108607720; Tue, 03 Feb 2026
 00:50:07 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260203013517.26170-1-enelsonmoore@gmail.com> <aYGw80IvE0TG7WOx@smile.fi.intel.com>
In-Reply-To: <aYGw80IvE0TG7WOx@smile.fi.intel.com>
From: Ethan Nelson-Moore <enelsonmoore@gmail.com>
Date: Tue, 3 Feb 2026 00:49:57 -0800
X-Gm-Features: AZwV_QgXt7IS2wkY_QcWhvRgLnL-HnrRbnKcnppOhB9zD-eHSPXSoomX_beDp-U
Message-ID: <CADkSEUgmX1tk-qJ7ee=P3EYcvriW91nVJZ6AFDpVEVjj7O8pJg@mail.gmail.com>
Subject: Re: [PATCH net-next v4] net: usb: introduce usbnet_mii_ioctl helper function
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-usb@vger.kernel.org, netdev@vger.kernel.org, 
	Vadim Fedorenko <vadim.fedorenko@linux.dev>, Andrew Lunn <andrew@lunn.ch>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Peter Korsgaard <peter@korsgaard.com>, Steve Glendinning <steve.glendinning@shawell.net>, 
	Oliver Neukum <oneukum@suse.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Oleksij Rempel <o.rempel@pengutronix.de>, Max Schulze <max.schulze@online.de>, 
	=?UTF-8?Q?Krzysztof_Ha=C5=82asa?= <khalasa@piap.pl>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33033-lists,linux-usb=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[17];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[enelsonmoore@gmail.com,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-usb,netdev];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,mail.gmail.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: DA143D6608
X-Rspamd-Action: no action

Hi, Andy,

On Tue, Feb 3, 2026 at 12:25=E2=80=AFAM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
> > +extern int usbnet_mii_ioctl(struct net_device *net, struct ifreq *rq, =
int cmd);
>
> Do we still need to populate 'extern'? Can we get rid of this redundancy?
In my opinion, while you're right that it isn't necessary because all
functions (unlike variables) are implied to be extern, the use of
extern to indicate functions that are exported/intended to be part of
the API is a good idea.

Ethan

