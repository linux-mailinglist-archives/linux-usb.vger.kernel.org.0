Return-Path: <linux-usb+bounces-26519-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B14CB1BE7C
	for <lists+linux-usb@lfdr.de>; Wed,  6 Aug 2025 03:55:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3A5227AF056
	for <lists+linux-usb@lfdr.de>; Wed,  6 Aug 2025 01:53:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C8F3D1B3923;
	Wed,  6 Aug 2025 01:54:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="WvVkdolb"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D3EA19ABD8
	for <linux-usb@vger.kernel.org>; Wed,  6 Aug 2025 01:54:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754445297; cv=none; b=Z/kvRsRWQEI/r0m56fKE0hD11nwhshSzVXwPM+wQ6E5lr/IlSwUMjZPO/Dxf6pWPTeOqVUqMPgVQ03HItEKy0K0r8vypvQ3L0bJw/hlLxVUX0dOX0wEPGNau9m5htR29L52KCemlB4q4YEPxEjTEVhKoldzGaJYB9/4f+07O+VA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754445297; c=relaxed/simple;
	bh=kQQnVC0izYvjXyrwC7oXu9KciKX+b5K//bAiSMoT01Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=A33aQaJhU11PvPsOWZMWMkri8UsGX9uawqs5EIsHuegaRDpU5BborhvL2Czx4gyhAMozIO0dAtlmS83ld68Dy3KhkPTcHBqU5prDDHmA8ldDfMXpsIxjhfo7fUtICjsoBJio0oHfHtkffunpGgvd69hecprGIXBtzO1LpMWrHBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=WvVkdolb; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-af93bcaf678so600827166b.0
        for <linux-usb@vger.kernel.org>; Tue, 05 Aug 2025 18:54:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1754445293; x=1755050093; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=L1PkDCTaXOlCgVfN+O/OMDhLH2gXEH5igacRG1rqZxQ=;
        b=WvVkdolbvSYkzko4nSZtw1QbQ6tLKsQXi3Q6sQIR/xr4xLpOu0iwDoU4QehqgvV6Yy
         4Tbsk8DFtsHbPmPRUZbXKvQqBhG8JBnn0Kj6F+uihfFx1l4Q233WLKnEs09N/ZAh6U4n
         UBUP6xuTZsaAW/u6vXcIbjmqE1Kyupz2jqSS4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754445293; x=1755050093;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=L1PkDCTaXOlCgVfN+O/OMDhLH2gXEH5igacRG1rqZxQ=;
        b=q2y44sziUESt+MuRUcRHDVP8sdoO9jrlhSzfyfnCK4uMBNVwsJE9yIQ6krvczignZl
         DWs9mMQU+eSzkVomnBlUoAESMxFUgcXma1TUJMPfnY8kZ+syZssaLa4QwwiBQznTkRFw
         vEgPzC9hWRtePdpWojkzf6wWNMWBW+U1dXmEW/JPd6GiaJXcvN/4HXCUWb36eaJ1upEA
         +T3PqapNMQmlDdqVWV0sk/TccvfhJf9tYYiB/SRYO/MwgMxo2tufbUvnqvDYV74GumSY
         MbXH0ZT2gaI1eh+hOyJh2lA162FdlKzIoWJvc6ASrzOgKVHw0JL8rKIOBGgMYYgbvvFY
         cthg==
X-Forwarded-Encrypted: i=1; AJvYcCUl7iUA0ndvF0NRkaT0FJYY5FTBRGeHBypFLUxY7RJak39b44feIrTFZsqHV+/e2unLVgk35g0LlDQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YyYbvGue6MQ7EVW+82MQIn/IBPj378BkXR2DLru7qB5fT+mlKRd
	BLESkqLnO/dVpLhXx0NVfEUIRzo7PMDgrEbe6hH8BP2aEZjYnnPeScFv2b3IoU9Z+3Pj/I3XTwJ
	v8JmiarVsnQ==
X-Gm-Gg: ASbGnct4DiNQqx3lJb886X3GeCDIr27ZJAPYQfZoL4wjlXkSf92JNfIcT8GpBdQK8ll
	zDXbHmk5ZnSHzTe0iuyE2J09u2DFANeNfPLAksSIx8/oaM7hVuoa8EGUhasZvS2TBaZmXyNPJL3
	IHzws+oYxZCzafjTIVaoWJ+wkMgQo/Mfb+E/U+IDw1m0eC8Y2grcGSgpV7pCYsTT9DwDatn+Eea
	FPc1JmY7UhQgT0SLnc481hQ5DuB8Jdus0hym260KkEP2voYV2KEI2A1WSjtP2DXMq9+VUhyKg95
	dw98DokH+LizzTYh+cfqlP4rmFXGss2mlWaOCSfRaZ8eLXk7UYtM+pdDH6HLCnM0dP7zbg5Jc0g
	dN+1k5OLigGhPYmZJSUIjG029nSHamapyw1z7MsSpQpNB/bsZ7V7yW2X3iXtiUXelzx6pFWoW
X-Google-Smtp-Source: AGHT+IENDr5n6qAUJ0hIevhp0QiMzLM3OWQLozvNc4GWTp23XMyeQnSTtUweHBXTLH7q5G87mwRZfQ==
X-Received: by 2002:a17:907:7b9f:b0:af9:1c73:cefd with SMTP id a640c23a62f3a-af9904906bdmr98455766b.52.1754445293609;
        Tue, 05 Aug 2025 18:54:53 -0700 (PDT)
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com. [209.85.208.46])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af91a218ab4sm1007886466b.92.2025.08.05.18.54.52
        for <linux-usb@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 Aug 2025 18:54:52 -0700 (PDT)
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-605b9488c28so11096337a12.2
        for <linux-usb@vger.kernel.org>; Tue, 05 Aug 2025 18:54:52 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUm7dHTnseg2BXsJogtaFRJXqbXBtnFFklGWzBWoYKObq4YvNZfjXx76X+86rLddaUsf0ndrmvOLgM=@vger.kernel.org
X-Received: by 2002:aa7:d64b:0:b0:608:6501:6a1f with SMTP id
 4fb4d7f45d1cf-617960b2169mr747725a12.1.1754445292221; Tue, 05 Aug 2025
 18:54:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250801190310.58443-1-ammarfaizi2@gnuweeb.org>
 <20250804100050.GQ8494@horms.kernel.org> <20250805202848.GC61519@horms.kernel.org>
 <CAHk-=wjqL4uF0MG_c8+xHX1Vv8==sPYQrtzbdA3kzi96284nuQ@mail.gmail.com> <CAHk-=wh+bnqPjL=9oq3uEkyZ7WB8=F_QMOHsGjHLj98oYk-X3Q@mail.gmail.com>
In-Reply-To: <CAHk-=wh+bnqPjL=9oq3uEkyZ7WB8=F_QMOHsGjHLj98oYk-X3Q@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 6 Aug 2025 04:54:36 +0300
X-Gmail-Original-Message-ID: <CAHk-=wjedw0vsfByNOrxd-QMF9svfNjbSo1szokEZuKtktG7Lw@mail.gmail.com>
X-Gm-Features: Ac12FXyVcowt5QK4YaVtsfApiqsjcc5RnE4u3G8HT-dXMHsAGYoNHxft3oIBLvY
Message-ID: <CAHk-=wjedw0vsfByNOrxd-QMF9svfNjbSo1szokEZuKtktG7Lw@mail.gmail.com>
Subject: Re: [PATCH net v2] net: usbnet: Fix the wrong netif_carrier_on() call placement
To: Simon Horman <horms@kernel.org>
Cc: Ammar Faizi <ammarfaizi2@gnuweeb.org>, Oliver Neukum <oneukum@suse.com>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Linux Netdev Mailing List <netdev@vger.kernel.org>, Linux USB Mailing List <linux-usb@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Armando Budianto <sprite@gnuweeb.org>, gwml@vger.gnuweeb.org, 
	stable@vger.kernel.org, John Ernberg <john.ernberg@actia.se>
Content-Type: text/plain; charset="UTF-8"

On Wed, 6 Aug 2025 at 04:11, Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> And yeah, the attached patch also fixes the problem for me and makes
> more sense to me.

Ok, crossed emails because I was reading things in odd orders and
going back to bed trying to get over jetlag.

Anyway, I've applied Ammar's v3 that ended up the same patch that I also tested,

              Linus

