Return-Path: <linux-usb+bounces-2917-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CB957EDDC6
	for <lists+linux-usb@lfdr.de>; Thu, 16 Nov 2023 10:38:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E94A0280F3A
	for <lists+linux-usb@lfdr.de>; Thu, 16 Nov 2023 09:38:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9E3428E12;
	Thu, 16 Nov 2023 09:38:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="P2sWr66b"
X-Original-To: linux-usb@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1DD71196
	for <linux-usb@vger.kernel.org>; Thu, 16 Nov 2023 01:38:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1700127481;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0Hf8LAx7bki1E0+UUAWwLzQvW31NE2EWhiu1SC5q3wA=;
	b=P2sWr66blKeG2/KNeERoD/12OF96LJ3AJqeOYdTmxxxlNuB/OusgSgKeuyAzeamE7K4EAs
	n3mjQH0EDM/oCmjqxW9+pNdyulZzbrJ5aBQGqlQvTzdE/dNnash3Wl50JeBTzX7jFvRKGz
	b8624Fe4RfkaaxiOH1Vd7cMyZ2RA2H8=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-681-c7J3GrNAM2GZ6cAomzRUgA-1; Thu, 16 Nov 2023 04:37:59 -0500
X-MC-Unique: c7J3GrNAM2GZ6cAomzRUgA-1
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-9c39f53775fso8661166b.1
        for <linux-usb@vger.kernel.org>; Thu, 16 Nov 2023 01:37:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700127478; x=1700732278;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0Hf8LAx7bki1E0+UUAWwLzQvW31NE2EWhiu1SC5q3wA=;
        b=Pt5MaDqKXwWsPFml+ilzRdEtcLNZEq57fZWzsXo2btM1tpE5/e0h61qWDlfBuiNb67
         bea55EVMEAIrc+86hjRCOE2UpTK54ptS4uOyL4hFexbPL6aCQ3W0XxRxO16OWE88IZSq
         PEWOfUuKgSDgBg+7gFc+hpXJ+K4QBTExFs+AZGa3dVlEl0h5vZBhx4w+TkvDyjU273rQ
         BhLR881TIa3Vw5QbpGBTb+oW1HpjbdK1bF9Shh6ey61rfzrDKC25i3RkdXzXxe7ebVye
         ExUHnhtxdgmNYZbnRWFqraEjSmFa8P3Fyc2g7Aax8H/usDwPL/MD/Eospm6OlAI89ADQ
         BJnQ==
X-Gm-Message-State: AOJu0Yx1VyzL47JnXQI8Wgxrev9Pa8DefkZT+o9foS2Rfb0NS2ZazAOy
	a3m23f9gYWM75UUNJylLgYqsnLHKskdmmjKUD4ouq3vcJGRDDx3jlwylUbxGxfZ7LxKildNyRmD
	xX2RlnbMwP8GePSoHZnByG0R+JJbZ
X-Received: by 2002:a17:906:1de:b0:9bf:b83c:5efd with SMTP id 30-20020a17090601de00b009bfb83c5efdmr5493546ejj.3.1700127477912;
        Thu, 16 Nov 2023 01:37:57 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHtvSRCoxqvqt1KeFT05sRiQfB46lYfJJBCPO6bAY48AI0riSceQ/hxVl5Z0X7BgzQkZOEe5g==
X-Received: by 2002:a17:906:1de:b0:9bf:b83c:5efd with SMTP id 30-20020a17090601de00b009bfb83c5efdmr5493519ejj.3.1700127477428;
        Thu, 16 Nov 2023 01:37:57 -0800 (PST)
Received: from gerbillo.redhat.com (146-241-98-67.dyn.eolo.it. [146.241.98.67])
        by smtp.gmail.com with ESMTPSA id z9-20020a170906714900b0099d804da2e9sm8153342ejj.225.2023.11.16.01.37.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Nov 2023 01:37:56 -0800 (PST)
Message-ID: <d17b696c81a57fb857b54a8c05e121be1cfc47fa.camel@redhat.com>
Subject: Re: [PATCH 1/2] net: usb: ax88179_178a: fix failed operations
 during ax88179_reset
From: Paolo Abeni <pabeni@redhat.com>
To: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>, davem@davemloft.net,
  edumazet@google.com, kuba@kernel.org, linux-usb@vger.kernel.org, 
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: weihao.bj@ieisystem.com
Date: Thu, 16 Nov 2023 10:37:55 +0100
In-Reply-To: <20231114125111.313229-2-jtornosm@redhat.com>
References: <20231114125111.313229-1-jtornosm@redhat.com>
	 <20231114125111.313229-2-jtornosm@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4 (3.46.4-1.fc37) 
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Tue, 2023-11-14 at 13:50 +0100, Jose Ignacio Tornos Martinez wrote:
> Using generic ASIX Electronics Corp. AX88179 Gigabit Ethernet device,
> the following test cycle has been implemented:
>     - power on
>     - check logs
>     - shutdown
>     - after detecting the system shutdown, disconnect power
>     - after approximately 60 seconds of sleep, power is restored
> Running some cycles, sometimes error logs like this appear:
>     kernel: ax88179_178a 2-9:1.0 (unnamed net_device) (uninitialized): Fa=
iled to write reg index 0x0001: -19
>     kernel: ax88179_178a 2-9:1.0 (unnamed net_device) (uninitialized): Fa=
iled to read reg index 0x0001: -19
>     ...
> These failed operation are happening during ax88179_reset execution, so
> the initialization could not be correct.
>=20
> In order to avoid this, we need to increase the delay after reset and
> clock initial operations. By using these larger values, many cycles
> have been run and no failed operations appear.
>=20
> Reported-by: Herb Wei <weihao.bj@ieisystem.com>
> Tested-by: Herb Wei <weihao.bj@ieisystem.com>
> Signed-off-by: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>

We need at least a suitable Fixes tag

> ---
>  drivers/net/usb/ax88179_178a.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/net/usb/ax88179_178a.c b/drivers/net/usb/ax88179_178=
a.c
> index aff39bf3161d..4ea0e155bb0d 100644
> --- a/drivers/net/usb/ax88179_178a.c
> +++ b/drivers/net/usb/ax88179_178a.c
> @@ -1583,11 +1583,11 @@ static int ax88179_reset(struct usbnet *dev)
> =20
>  	*tmp16 =3D AX_PHYPWR_RSTCTL_IPRL;
>  	ax88179_write_cmd(dev, AX_ACCESS_MAC, AX_PHYPWR_RSTCTL, 2, 2, tmp16);
> -	msleep(200);
> +	msleep(500);

Do you know if there is some status register you can query for 'reset
completed'? or some official documentation you can quote for the above
delay?

Thanks!

Paolo


