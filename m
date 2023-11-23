Return-Path: <linux-usb+bounces-3236-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C13CA7F59D8
	for <lists+linux-usb@lfdr.de>; Thu, 23 Nov 2023 09:15:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7578B28158A
	for <lists+linux-usb@lfdr.de>; Thu, 23 Nov 2023 08:15:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 531E7199D1;
	Thu, 23 Nov 2023 08:15:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="akEYf748"
X-Original-To: linux-usb@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7ADD91BF
	for <linux-usb@vger.kernel.org>; Thu, 23 Nov 2023 00:15:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1700727311;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MBAKRF8F4hdJoWFT1ZCdxP7Mt7QGWlcBr9oSbKx0zlk=;
	b=akEYf748CM0SqfZhIv83LL1BIBx8jXnV96LigYkQhwLirvN1YZey8swOjMJa/saC9EC9pF
	NqMFNZVJDpuITLRlCcdSGyHsJ0K04bIesZKFL550BYddXk/i7OrvzVxljpyFfGCR38lkfN
	p84oyERLczH6TadSvNELGGpe6GHJIHY=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-531-3oy1WTmEO4CMY6Q3g7m9vQ-1; Thu, 23 Nov 2023 03:15:09 -0500
X-MC-Unique: 3oy1WTmEO4CMY6Q3g7m9vQ-1
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-a030a495526so7373066b.0
        for <linux-usb@vger.kernel.org>; Thu, 23 Nov 2023 00:15:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700727308; x=1701332108;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MBAKRF8F4hdJoWFT1ZCdxP7Mt7QGWlcBr9oSbKx0zlk=;
        b=PQxknRUHKcDyb319PW/AqCrzDGXEA82a3hrD1EeKydWgZrDOWqoIim/XXy2cQBRhCz
         gyM/0MyDdq3xIyFcIFiEk2O82FkQo4/5S4dYgmpe8l7kPiHGIxlyaEqWR4KBR4ccQFpF
         oY+T1X2gTf8iRI8Jsl3ToYsnqaIj9NrPqXJZccOcDFVfXkM67OpxdPhw16TAndgPlvZA
         iLhmCU/5y2lZnfkxeI5OMjCi3EjuQ36uBolZpsbgkBmC6o9wI6zIi5k+ubVJZZ2GJjHT
         P/m/XdiMbC93RaThajISGaN8kq3JbBbmLT3lG2R4LZOwcL3OJ1XXVPQlllbW/B889e3M
         RigA==
X-Gm-Message-State: AOJu0YxJmY/+sXRW1m9ghLzaPo7iMLc2G7B9GgAJWST3XpJ4WWKIofpQ
	g1dn9dRxPlHNCUB5zUzPa7rqNVNhxChdJPGAPL4XC4Qor/6sgfyCnpv9F6MFF/RaznmFpWSOA49
	4v18sZEsSF3DPUra54cMu
X-Received: by 2002:a17:906:105d:b0:a01:ee03:37ec with SMTP id j29-20020a170906105d00b00a01ee0337ecmr2869521ejj.3.1700727308268;
        Thu, 23 Nov 2023 00:15:08 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGgNH6UN/jv3ZxGigxzLsNo43TaP68LOcaLWAYmnEbhQEbVhDZMQRe/9kG6J/6FwCTaF1P2Xg==
X-Received: by 2002:a17:906:105d:b0:a01:ee03:37ec with SMTP id j29-20020a170906105d00b00a01ee0337ecmr2869509ejj.3.1700727307865;
        Thu, 23 Nov 2023 00:15:07 -0800 (PST)
Received: from gerbillo.redhat.com (146-241-241-213.dyn.eolo.it. [146.241.241.213])
        by smtp.gmail.com with ESMTPSA id t24-20020a17090616d800b009ffb4af0505sm458101ejd.104.2023.11.23.00.15.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Nov 2023 00:15:07 -0800 (PST)
Message-ID: <70fa0bcd10a8ef67d186da27a7c6a327b0b3e2cd.camel@redhat.com>
Subject: Re: [PATCH 0/2] usb: fix port mapping for ZTE MF290 modem
From: Paolo Abeni <pabeni@redhat.com>
To: Johan Hovold <johan@kernel.org>
Cc: Lech Perczak <lech.perczak@gmail.com>, netdev@vger.kernel.org, 
	linux-usb@vger.kernel.org
Date: Thu, 23 Nov 2023 09:15:06 +0100
In-Reply-To: <ZVyrZ1Bq5UooD5xq@hovoldconsulting.com>
References: <20231117231918.100278-1-lech.perczak@gmail.com>
	 <08e17879fe0c0be1f82da31fdb39931ed38f7155.camel@redhat.com>
	 <4b534e6aab6e4cf461f07680466f146e65b3fb25.camel@redhat.com>
	 <ZVyrZ1Bq5UooD5xq@hovoldconsulting.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4 (3.46.4-1.fc37) 
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Tue, 2023-11-21 at 14:06 +0100, Johan Hovold wrote:
> On Tue, Nov 21, 2023 at 11:58:56AM +0100, Paolo Abeni wrote:
> > On Tue, 2023-11-21 at 11:49 +0100, Paolo Abeni wrote:
> > > On Sat, 2023-11-18 at 00:19 +0100, Lech Perczak wrote:
> > > > This modem is used iside ZTE MF28D LTE CPE router. It can already
> > > > establish PPP connections. This series attempts to adjust its
> > > > configuration to properly support QMI interface which is available =
and
> > > > preferred over that. This is a part of effort to get the device
> > > > supported b OpenWrt.
> > > >=20
> > > > Lech Perczak (2):
> > > >   usb: serial: option: don't claim interface 4 for ZTE MF290
> > > >   net: usb: qmi_wwan: claim interface 4 for ZTE MF290
> > >=20
> > > It looks like patch 1 targets the usb-serial tree, patch 2 targets th=
e
> > > netdev tree and there no dependencies between them.
> >=20
> > Sorry, ENOCOFFEE here. I see the inter-dependency now. I guess it's
> > better to pull both patches via the same tree.
> >=20
> > @Johan: do you have any preferences? We don't see changes on=20
> > qmi_wwan.c too often, hopefully we should not hit conflicts up to the
> > next RC.
>=20
> It should be fine to take these through the two trees, respectively, as
> we usually do.

Fine by me: I'll take patch 2/2 only.

Cheers,

Paolo


