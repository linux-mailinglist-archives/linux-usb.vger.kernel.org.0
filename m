Return-Path: <linux-usb+bounces-33723-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8MIwMOwDoGl/fQQAu9opvQ
	(envelope-from <linux-usb+bounces-33723-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 26 Feb 2026 09:27:24 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 34A2D1A288B
	for <lists+linux-usb@lfdr.de>; Thu, 26 Feb 2026 09:27:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 774A0305F7C0
	for <lists+linux-usb@lfdr.de>; Thu, 26 Feb 2026 08:26:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF7B6392817;
	Thu, 26 Feb 2026 08:26:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UbdKFfrR"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27460285CB4
	for <linux-usb@vger.kernel.org>; Thu, 26 Feb 2026 08:26:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772094387; cv=pass; b=bt0AT60wbQXcc4cm4ASik4rCYXDLvlJ8Lav77+BGwtFqBYIWnkfAKmyH1yNlsLuFwFIUYNHmtY1j+s64iVioCn3kZwSixCA6bvVX7eDvptUsYrpPM3FljZC7yDS5FS4jlIzhHnnQ9/SqwIoeeAcs7zXZ2EeHUgUpWWa8+voiK5c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772094387; c=relaxed/simple;
	bh=dSbRnTtbphPH/CVU76suyGb8H6esoTis5rJLM+HBS2k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dIjdiGW6qBoYR75bNzUgwiBWM8FYuM8YpoA+j1wEEFxTgYhyprwJwRilxk99Ron3fcCd7wCJzw8QekK5vuFsx6Kir8a3wqm4MugT9n60iU07aRLg1bbJDY6TZ7kHc91OMwWND5vSfqmlinpf8vCI4rk6Uah0O444Q97B9CB5QPw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UbdKFfrR; arc=pass smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-43994aa265eso290557f8f.3
        for <linux-usb@vger.kernel.org>; Thu, 26 Feb 2026 00:26:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772094384; cv=none;
        d=google.com; s=arc-20240605;
        b=GcK7PhQlXpGZQooBnW6agO9F5Oxwppj5zretO81SnXReKZVgWa30piD1EtUb4JARIV
         BiKxAf4H7lPIsmXYuBRetsrzttu5UaDSEO5C23uVcCvmVyz/KXmhi30bj0M+5TZ1PO3H
         8CFI3UIxKLOe77GSaZH/s57NSf6Hh41hDTVG+c5o2RK2aoAXimhJrTeZz2ZTjxeWtcMN
         5kzzetavXKgFhZzYbRqlZkTHjuPyngIPShbehrDuDAIy540YNHePu3QcCighi/xzHDfC
         iLpy52BCctf01TxcNpUVP+eJC9tt9BhY9Gek7bCt28YO7dOzSRKw6Fx92ZsZaVLyP4kh
         KwtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=p8tFDUI/IrHDdHe0oMgvftUeNiQenULG77NWOiabLck=;
        fh=Boj/g957fJ/r2sfKll72d1VMnF6qUVfTS3G5XDd1rcQ=;
        b=OtaaejtCCKv7Hi4c6a2BiGQ7tuEBw3blwJFdF5hgzudhwuwhMjoIuU6CPYiyjPPQtC
         Ae8QeYMky9VNeXkVj/gTIkd92Y7JrrkqbTK4rv/HnL1Ydr4RNrkKDoFLRqQN+IJLPmPS
         /9napAriV+qxqllBlntel/U0Kia1AWcQo7u7iMKNbdC+zE2XUlVySJzaJoU/FxjpFsr9
         PeVypsmlmleRWQYTLsUQnqNR5ZB2ghTuNLxIMXwAJ+DXdklM7HcrPAAiuBqW981prdhn
         nOfxO8zEHQNeFZ+NbXgo0FAqf0Jyz1ZeQp706nDe/3grQ/6sq3al/le/K51OCAyh50Oa
         TE4Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772094384; x=1772699184; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=p8tFDUI/IrHDdHe0oMgvftUeNiQenULG77NWOiabLck=;
        b=UbdKFfrRIuoE+NPjCjrp3b5Fi5iZjQrTqUSSVbgIjGRHmU5cJy6Ik9z2Ejq2qk6uYX
         znU/JPq2+5E40iQUH1MvGEixQ0nnbAgXtNJ+eo5ayxRgw1EBZob6C6V0cQNLhlhTLKgZ
         Thf1L6WQHkbyvSNxVN3fhAX3gcICxzO+ME1+0uXBwjz/+GehBBAqwlF8OLay9Bz1YK/T
         VznmC4xf9ZZkfa4dpnaIGlwQxuxq4bjzTM8IwzxxeNYPXK1alIjpRrENTkTOJ2kDuL8M
         OPU2I//+xuXnHL2aUBjBB05I9YIPA39n6i6D1YwBsr7FhZCTgIIWOxNqZg/2jKSRMdeI
         L1Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772094384; x=1772699184;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p8tFDUI/IrHDdHe0oMgvftUeNiQenULG77NWOiabLck=;
        b=iNYKUi4/BETUrrkiMOVMieDGRL17NHit/YkJY+3GSXkG97Za15imQa6R/j62cgfVxP
         I7x8JJjBcCL9gaVd23ZznU/yPPKzRZ0yNE+TzgUv8GUE0Vvknx8p2z5V5dxrDqwlKjp5
         Atg1VcM/s0JApHenR76fb0Emqu1Go25MFxe5CbB9+VGKkmTcUaqGojBloAsvBJMY4UNz
         YF97NyfVASZi6T9DzatNFbFcMXRaxMIqxDURwWZA2o/CtGSR9ymSnwufga/5SsQcoWkf
         3BjqYz08Is7eGwYD6o+tENzeQ6LWyB8LzsNgIy90rwpSUHOS1TbwBWBjQkGZvibbcAmB
         rEGA==
X-Forwarded-Encrypted: i=1; AJvYcCUx94DJS32lXJhXvqlKfojpnxyybfSpGnFUKbm1Hv/MfyCiHxkw+fohuAEIf1zvvdsAv1/Re5VuwU4=@vger.kernel.org
X-Gm-Message-State: AOJu0YyFAQmxBuztALCmnV3aVnSSYcmoTxw1QEv3tL3+IJdtT4RgZ15c
	7d8p9Ztu9Pu2zIQZROrXhna1SNef7j5w02F0pVckhNVcZWtzQdFuuyJEl1oyiDKk09NvieAjqm/
	zvVYz2wLFXiaUufOqfuiiAKoFwX2t9tU=
X-Gm-Gg: ATEYQzx5UVEALwEhPrL5a90vpGIL6dRqXnUJ9R+r/BVxxNZLKjhnaDIBZsnsmdpPcEq
	s37x5uZRkfs6wrCXenpH7mPpIanA0uO7cFLzg8R3Hq/YplyGIPTdwAW5BUDHLiMoJyjeweY2KpP
	zQsmU1iPGFamXT1nDhfngNBcwkSdjYjlR2f1Af9j0jwAnBw0HgVvYcIeoCbUzILHmk54o1EwkkX
	rOPoOoO+PyChFetOyzilfi5zH9x5jssrRsadTsu9pkp+JJ165OtQmucP3A/Jc6e9pT0nPJ4Kjsp
	CyI43yq1eSqultDUNA==
X-Received: by 2002:a05:6000:1a8c:b0:439:9124:f2b7 with SMTP id
 ffacd0b85a97d-43997f341bemr2365098f8f.29.1772094384270; Thu, 26 Feb 2026
 00:26:24 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAPh3n803k8JcBPV5qEzUB-oKzWkAs-D5CU7z=Vd_nLRCr5ZqQg@mail.gmail.com>
 <95ccf5a6-975b-4543-80a3-595f1ee20543@redhat.com> <CAGRyCJE85fLOahUR3PAUnS_jH4+qpBq37qpged=nvObbg1m+Qw@mail.gmail.com>
 <20260225170155.0ae83ae9@kernel.org>
In-Reply-To: <20260225170155.0ae83ae9@kernel.org>
From: Daniele Palmas <dnlplm@gmail.com>
Date: Thu, 26 Feb 2026 09:26:11 +0100
X-Gm-Features: AaiRm50DmBPE8bIbQbuDkJOR9inJwsjkwvr1SpWPBNCMnCqpiSUe-nkgxF4o3fM
Message-ID: <CAGRyCJGYLemYFDNw8cfcCHoxe8YqfRRgnJXgz03WVssKDYXhUA@mail.gmail.com>
Subject: Re: commit 662dc80a5e86 breaks rmnet over usb
To: Jakub Kicinski <kuba@kernel.org>
Cc: Laurent Vivier <lvivier@redhat.com>, Koen Vandeputte <koen.vandeputte@citymesh.com>, oneukum@suse.com, 
	andrew+netdev@lunn.ch, Eric Dumazet <edumazet@google.com>, pabeni@redhat.com, 
	netdev <netdev@vger.kernel.org>, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33723-lists,linux-usb=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	MISSING_XM_UA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dnlplm@gmail.com,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb,netdev];
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 34A2D1A288B
X-Rspamd-Action: no action

Hello Jakub,

Il giorno gio 26 feb 2026 alle ore 02:01 Jakub Kicinski
<kuba@kernel.org> ha scritto:
>
> On Wed, 25 Feb 2026 08:19:46 +0100 Daniele Palmas wrote:
> > > Could you try something like:
> > >
> > > diff --git a/drivers/net/usb/qmi_wwan.c b/drivers/net/usb/qmi_wwan.c
> > > index 3a4985b582cb..6b4796fac692 100644
> > > --- a/drivers/net/usb/qmi_wwan.c
> > > +++ b/drivers/net/usb/qmi_wwan.c
> > > @@ -788,6 +788,8 @@ static int qmi_wwan_bind(struct usbnet *dev, struct usb_interface *intf)
> > >                  usbnet_get_ethernet_addr(dev, cdc_ether->iMACAddress);
> > >          }
> > >
> > > +       dev->rx_urb_size = 32768;
> > > +
> >
> > So far userspace tools (e.g. also the most important one which is
> > ModemManager) rely on changing the rx_urb_size by changing the MTU: I
> > know this is ugly, but it is a behavior that has been there since a
> > lot of time, not sure how many tools based on this assumption could
> > break.
>
> What's the policy in ModemManager to change the rx_urb_size?
> Increase it to make sure it can hold some specific cmd / packet?
>
> I wonder if having rx_urb_size max of (mtu, 32k) would break anything.
>

Typically the host sends a QMI request to the modem for setting the
size of the maximum QMAP aggregated packets block. Then the modem
replies with the maximum size it supports and that one is then set by
the host through changing the MTU of the netdevice. Low-cat modems
usually support 4-8 KB, while 5G 16-32KB.

On ModemManager side this is currently fixed at 16KB, but one can use
other tools e.g. qmicli to set custom values as far as they are
supported by the modem.

> Since we're talking about rx buffer config the right API to configure
> it is likely ethtool -G rx-buf-len :(
>

Thanks for the hint, I'll try to have a look at that to improve qmi_wwan.

> > There's also the chance that there are modems which require a higher
> > rx_urb_size, so having this fixed could not work well.
> >
> > Unfortunately usbnet serves many drivers, I agree with Koen that a
> > revert is the safest option.
>
> Then again the usbnet driver is brittle enough as is, if it's just qmi
> that needs this workaround we would be making common code less robust
> for a benefit of a single "hack" (for lack of a better term)

Makes sense, also Laurent proposed a solution to keep his fix in
usbnet and make qmi_wwan the exception.

Regards,
Daniele

