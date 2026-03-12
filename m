Return-Path: <linux-usb+bounces-34651-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eD9SMjpjsmntMAAAu9opvQ
	(envelope-from <linux-usb+bounces-34651-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 12 Mar 2026 07:54:50 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AFCD26E10A
	for <lists+linux-usb@lfdr.de>; Thu, 12 Mar 2026 07:54:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 31E80307143B
	for <lists+linux-usb@lfdr.de>; Thu, 12 Mar 2026 06:54:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F9BD3AA511;
	Thu, 12 Mar 2026 06:54:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.b="jo3HEwFG"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78A353A9D9A
	for <linux-usb@vger.kernel.org>; Thu, 12 Mar 2026 06:54:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773298478; cv=pass; b=b5vYp5U1RBMpQEzlYOG7Uy1svwvWpm35roti6JajdThOlC/rpjzCtna1iBnDDiqIiUMXgUFUpOfPlvocOxvE4+iuti0eDkXboH9txPYb5WEq7u6I/DP2odTCnMfjcBzIRUFvjdwjSqBskjvC4jRAxeKf2tbvhjYRiJehs73lB7w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773298478; c=relaxed/simple;
	bh=OwgPUCiVxJ6rlcodDLG/pyKdpMJWw543hdmyMimUVR0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Em3/CDIge3DL4FnsKA2LDCgAIjYsiG7w87mtUwb/NYT8zeScXnK6rjgIYpOWVNVAveR2+r2X1M/fvKKIczMrhrHhqteG2KQx3MwIQovk+GZDGty2UwyTv8LviZZzc9A7UdcheIoI9B1rtzvp11CnWDWZyj1387/BmcagCdyfCp4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net; spf=pass smtp.mailfrom=flipper.net; dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.b=jo3HEwFG; arc=pass smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flipper.net
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-662abedbeb7so907708a12.3
        for <linux-usb@vger.kernel.org>; Wed, 11 Mar 2026 23:54:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773298476; cv=none;
        d=google.com; s=arc-20240605;
        b=DIPE3ZzubThGT3bMT/d1rKl9CJv+UXDID/MUGFFFVAt1k8q/zwpwMOIhnwb58gQFlF
         2aiR4yrQIKh2+/Xa/1Rgcs2ti9V9UcoiULPrW03GO27+J4ravDFFjz+yQ9QtVd0WRBf5
         0ex+U25CjJTjcVHkIm7CT0UDV9uR7Ndmhu6tN1ztR7vXuLbuEzsD81ULyhNR/QtvczTO
         6jv86s1zaZjfPYCmmJJSeSC5hO52CKRQWKItITd5fyjA9q5NjoQwBilm15TBR0ZqHy6p
         /oRG6kzO2P5DbyA2bDnb+y4Gh8id5+Gi6C/bUqjC8cYzDesw4yVWn/7ONqEReiig8jTm
         rGpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=6oVguTUzToSREXHO6bdHcFzlyooNi+O9a4UrcClhK8M=;
        fh=Hb3weotifmasXGkMN4Ij1LCSHZ7TIe49P06d2FSUaT4=;
        b=XUgqg69y4IRxJ98vXn+/uYqQPx1c0TlUboS/blXK5kqRAZFXvLPs5AxSlSrAcETC1G
         axx/NzH4Yr+kvkUtGFZTMX1QsB3DqP0AiHgq12e200sj19n3jSEItwo2kFuJ+pr1md9t
         tg2FttbYGpVaEQSvktc0duDrDjJKm6tAM5J237R8neJE+rhqu16H4ZK60hJn/Cx60d2U
         TnDxW9dOXT9nk0ZKlSbiQvQFIXGNQQ8LhaJ1yW1TgWg8hwKSU/lzUV3RHX+Bw14QOOo8
         EkBG2WUlyfjG4Y24EC+RNPWN7Pqcr54/id9Jz0cs+WrI65m1fQ+TlVmvDvw50TasZmrM
         y22Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1773298476; x=1773903276; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6oVguTUzToSREXHO6bdHcFzlyooNi+O9a4UrcClhK8M=;
        b=jo3HEwFGfDQeaNDLq8UjgPgQVEwhL1su924RATM5il8GtcDaRqcwVGQxRzDzqigQ0N
         N3i1u4VOy7moF1H5fOuzgC/3oTQLzJ980vKJspFOdRAQtH73SoGzJy360O5uuVuSRsIC
         57Eh5AizpApCU1bTWnCGDH9ac8EL4yBJTwk+pLPelhqwr1wR7Sme23x8DY0GbNGwm1YC
         vbkH2KWpJ5ZgZC4zPOgmfZgeFjOpeurPmnffTW9jLaNg7nYKLD9nq2G1B2jDF9fq1vtn
         UQcIvBziO8s34ZTPoNZDivye6X/h1DhusJRtRDk/pyz2XzGYXJLpmZSBNIxrE+Hz4zjE
         GoAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773298476; x=1773903276;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6oVguTUzToSREXHO6bdHcFzlyooNi+O9a4UrcClhK8M=;
        b=tnTDHzvjiYNiWEtMCC97tPKNAYD7QTp38r0lRKLJCUgIU5nuFnOY6nzYoQFMjypc9n
         I4rAQ0zJblTx8iNUhFBZkBUNKNE7wIwsGNcVVq0FGJ9a0UQZftTJF/aYA6ycbaqBYTMf
         crm1+G2Q6/wnW5lnD9rSmmCuGJ/5giiG9qwzT7mpjmfodgFesum5WxW279OFrBaav8uU
         eZIjNYcJ+WjCTsEruwlUZ2B3RJIJiOJrWNqSsFSlp9unezLz+gw1ZhzeGqWNbmK5+lRq
         WnRBzNjo2okY+2MKa8CZp5cFkWfppsx09mhmuz+T0gxht5E/J5GBt3PnDMvMnzfV9/ZP
         UIRA==
X-Forwarded-Encrypted: i=1; AJvYcCXafZKDOllVy6HS8GTMWB7mRJOGOwyIs6LuqM5134/xjgCCNltwlgowM0YXZmPSbSmFbxhvBJPLtFM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzFDqW/Gip1bePdFK3fkYXhIOibysuA8QT+DKwro401wFYne2pT
	lVjnAFZ2EuR/b+T5cqjsvFoBja8YnFc8m2GChwGfaE8kxRf3XXh+X519hdnCQ1rplgk56d1W/ju
	QQ0tldbC5gbIwAavNsWsEXNEVjdKCtd83eeqGzoPerQ==
X-Gm-Gg: ATEYQzz2MYUr/H0DSNwV+VxQF0AQfgrM6mYcy6eQ6EDRbb7l79pauTkFKL/SbJx8e3c
	g6j0GyCJeIzB5CH14jowtEIM9R8mW7t96WnEEqMWs/DFrFJhZBdlnbVO+g+Hn/yBta66TFUOKbB
	G6HD+NIGhVhLc+sHt+aXlWCTIquImyeQF+pzIL2QO2wNRUQ86SMe3qdFL3FCOXvlBJyVbAq3uTx
	t+YoXh2A4nI1GM4g2vz3tEmCbpkiFyd8Vqhv6VhfhjLkMuThyNtfWQSZ+qAtGwVoAd7NZUlodyX
	k6NUIRY=
X-Received: by 2002:a17:907:e107:b0:b97:3bbe:e42b with SMTP id
 a640c23a62f3a-b973bbef8dfmr132912266b.28.1773298475586; Wed, 11 Mar 2026
 23:54:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260311-husb311-v1-0-f25bcb58cff7@flipper.net> <802df30e-607b-7404-6693-6691ea45618b@manjaro.org>
In-Reply-To: <802df30e-607b-7404-6693-6691ea45618b@manjaro.org>
From: Alexey Charkov <alchark@flipper.net>
Date: Thu, 12 Mar 2026 10:54:21 +0400
X-Gm-Features: AaiRm50M_qGeqn0F08G8Ku0uzvOc6xLaJrTU2Ngsn_GnwpJNfaW5F6HrcA9leKI
Message-ID: <CAKTNdwH-dPdKyN9-ohWj4PCfRZ-DzpG-aysoULMPb=-XzJTwPw@mail.gmail.com>
Subject: Re: [PATCH 0/4] Add HUSB311 Type-C controller
To: Dragan Simic <dsimic@manjaro.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Gene Chen <gene_chen@richtek.com>, 
	Heiko Stuebner <heiko@sntech.de>, Sebastian Reichel <sebastian.reichel@collabora.com>, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[flipper.net,quarantine];
	R_DKIM_ALLOW(-0.20)[flipper.net:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34651-lists,linux-usb=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alchark@flipper.net,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[flipper.net:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[flipper.net:dkim,flipper.net:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,hynetek.com:url,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 2AFCD26E10A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Mar 11, 2026 at 10:32=E2=80=AFPM Dragan Simic <dsimic@manjaro.org> =
wrote:
>
> Hello Alexey,
>
> On Wednesday, March 11, 2026 17:20 CET, Alexey Charkov <alchark@flipper.n=
et> wrote:
> > HUSB311 is a drop-in replacement for RT1711H, used in Rockchip RK3576 E=
VB1
> > board and some other boards closely following the reference schematic.
> >
> > The existing RT1711H driver seems to work fine with HUSB311, and there =
is
> > no public documentation available for HUSB311 to identify any meaningfu=
l
> > differences, so this series wires up the existing driver to treat
> > HUSB311 in the same way it treats RT1711H.
>
> I'm a bit surprised that you haven't managed to find any HUSB311 datashee=
ts,
> because they are seemingly rather easy to obtain.  I've got a couple of
> HUSB311 datasheet versions with the register descriptions and whatnot, wo=
uld
> you like me to send them over?

Hi Dragan,

The only ones I could find were those I linked in the commit messages
for the bindings and the driver change:
Link: https://www.hynetek.com/uploadfiles/site/219/news/0863c0c7-f535-4f09-=
bacd-0440d2c21088.pdf
Link: https://dl.xkwy2018.com/downloads/RK3588S/03_Product%20Line%20Branch_=
Tablet/02_Key%20Device%20Specifications/HUSB311%20introduction%2020210526.p=
df

They are notably abridged in their register description (which is the
most relevant part as far as drivers are concerned), only covering the
common TCPCI registers and not any vendor defined extensions. It even
references registers in the 0x90 range on page 17 but doesn't describe
them.

Compare that for instance to the RT1711H datasheet:
Link: https://www.richtek.com/assets/product_file/RT1711H/DS1711H-04.pdf

It does look like 's/RT1711H/HUSB311/' apart from that omitted
vendor-defined range.

If you happen to see a version of a HUSB311 datasheet that includes a
description of the 0x90-0xaf register range I would definitely be
eager to have a look.

Best regards,
Alexey

