Return-Path: <linux-usb+bounces-3079-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 56F9E7F2A4B
	for <lists+linux-usb@lfdr.de>; Tue, 21 Nov 2023 11:25:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 858BC1C210EF
	for <lists+linux-usb@lfdr.de>; Tue, 21 Nov 2023 10:25:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D9184643B;
	Tue, 21 Nov 2023 10:25:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="etl9qQsN"
X-Original-To: linux-usb@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8FB59BA
	for <linux-usb@vger.kernel.org>; Tue, 21 Nov 2023 02:25:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1700562314;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kv793GlpUAibpHSviUbIOlEfqFoGFgwrV0FjBE/F+mY=;
	b=etl9qQsNc7CIAUWcXmAMM7yIqPAqEfCMezyRKfqOzkwqJFL4DH2B/QU9RrF7z9lpTtfrgL
	LrjCuq+9eFi6upBD3jFBYy1+XYdOu+cPdkAoVrFiVKaS1N4KIBeQN+fuDcpqVoPPvdQ/Rm
	br7nVaKHpu9R/cGk5Lbq1Ta+YOnfypQ=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-260-8L0Br0jEN4-567MJTzok6Q-1; Tue, 21 Nov 2023 05:25:13 -0500
X-MC-Unique: 8L0Br0jEN4-567MJTzok6Q-1
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-a030a495526so666266b.0
        for <linux-usb@vger.kernel.org>; Tue, 21 Nov 2023 02:25:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700562312; x=1701167112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kv793GlpUAibpHSviUbIOlEfqFoGFgwrV0FjBE/F+mY=;
        b=dmue/v52PR1EGHV8K8qTfuWFKdbZd56ALnvlwQmQ/CB+VFY/60yIkL5vHlVujLYD4K
         BOGVEqVwlPoFot8Au8Ti6rYe8YilaMYJiQZ5+e5JDhVFm0K1QjVOLm7J7W1zGufgH0Tf
         hDhhfDuHUEjxDYSKEl4QRAwL4B6pOWI9DiBRwYPNkQgYKTKNu3BIATvtb+/bFZ0Fk7UX
         HH7byye8INMPCo6YqxIDExsAbZF3YtJRlBE/wZjTA31t4IY6CYErTJMFV0rLmHL0p3fu
         uIooxqqtcASnXM7tw93OFmXh2tG3posvExXJ5VhiSgnJmH4sHrLvO0cwVUs2fDK4/tWP
         RTBw==
X-Gm-Message-State: AOJu0YwNctcfQmRbVfxaRemcZkeTE2v23Hp9L1qXitdsl2oZSMRqrbWw
	lzGK1csGLQg/mcwknM1wSg/BsRa7fzFb+VFLdE0Z5sbolYKAF6Nw9uJakxNTJFcYU+AwkKtPm3o
	LeVgTkm9CREUmhrrBHmaq
X-Received: by 2002:a17:906:20d7:b0:9b2:bf2d:6b65 with SMTP id c23-20020a17090620d700b009b2bf2d6b65mr6470906ejc.4.1700562312005;
        Tue, 21 Nov 2023 02:25:12 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH+UJk+zZlK5NUPrng8ZM0MjQUSFGh7RXz8MfiFQKiFHg+caQVnu7yUEILkX7uCjm3wmWC4VA==
X-Received: by 2002:a17:906:20d7:b0:9b2:bf2d:6b65 with SMTP id c23-20020a17090620d700b009b2bf2d6b65mr6470882ejc.4.1700562311351;
        Tue, 21 Nov 2023 02:25:11 -0800 (PST)
Received: from gerbillo.redhat.com (146-241-234-2.dyn.eolo.it. [146.241.234.2])
        by smtp.gmail.com with ESMTPSA id i26-20020a170906a29a00b00a01892903d6sm866248ejz.47.2023.11.21.02.25.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Nov 2023 02:25:10 -0800 (PST)
Message-ID: <f8c1979e2c71d871998aec0126dd87adb5e76cce.camel@redhat.com>
Subject: Re: [PATCH 1/2] r8152: Hold the rtnl_lock for all of reset
From: Paolo Abeni <pabeni@redhat.com>
To: Douglas Anderson <dianders@chromium.org>, Jakub Kicinski
 <kuba@kernel.org>,  Hayes Wang <hayeswang@realtek.com>, "David S . Miller"
 <davem@davemloft.net>
Cc: Grant Grundler <grundler@chromium.org>, Simon Horman <horms@kernel.org>,
  Edward Hill <ecgh@chromium.org>, linux-usb@vger.kernel.org, Laura Nao
 <laura.nao@collabora.com>, Alan Stern <stern@rowland.harvard.edu>,
 =?ISO-8859-1?Q?Bj=F8rn?= Mork <bjorn@mork.no>,  Eric Dumazet
 <edumazet@google.com>, linux-kernel@vger.kernel.org, netdev@vger.kernel.org
Date: Tue, 21 Nov 2023 11:25:09 +0100
In-Reply-To: <20231117130836.1.I77097aa9ec01aeca1b3c75fde4ba5007a17fdf76@changeid>
References: 
	<20231117130836.1.I77097aa9ec01aeca1b3c75fde4ba5007a17fdf76@changeid>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4 (3.46.4-1.fc37) 
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Fri, 2023-11-17 at 13:08 -0800, Douglas Anderson wrote:
> As of commit d9962b0d4202 ("r8152: Block future register access if
> register access fails") there is a race condition that can happen
> between the USB device reset thread and napi_enable() (not) getting
> called during rtl8152_open(). Specifically:
> * While rtl8152_open() is running we get a register access error
>   that's _not_ -ENODEV and queue up a USB reset.
> * rtl8152_open() exits before calling napi_enable() due to any reason
>   (including usb_submit_urb() returning an error).
>=20
> In that case:
> * Since the USB reset is perform in a separate thread asynchronously,
>   it can run at anytime USB device lock is not held - even before
>   rtl8152_open() has exited with an error and caused __dev_open() to
>   clear the __LINK_STATE_START bit.
> * The rtl8152_pre_reset() will notice that the netif_running() returns
>   true (since __LINK_STATE_START wasn't cleared) so it won't exit
>   early.
> * rtl8152_pre_reset() will then hang in napi_disable() because
>   napi_enable() was never called.
>=20
> We can fix the race by making sure that the r8152 reset routines don't
> run at the same time as we're opening the device. Specifically we need
> the reset routines in their entirety rely on the return value of
> netif_running(). The only way to reliably depend on that is for them
> to hold the rntl_lock() mutex for the duration of reset.

Acquiring the rtnl_lock in a callback and releasing it in a different
one, with the latter called depending on the configuration, looks
fragile and possibly prone to deadlock issues.

Have you tested your patch with lockdep enabled?

Can you instead acquire the rtnl lock only for pre_reset/post_rest and
in rtl8152_open() do something alike:

	for (i =3D 0; i < MAX_WAIT; ++i) {
		if (usb_lock_device_for_reset(udev, NULL))
			goto error;

		wait_again =3D udev->reset_in_progress;
		usb_unlock_device(udev);
		if (!wait_again)
			break;

		usleep(1);
	}
	if (i =3D=3D MAX_WAIT)
		goto error;

which should be more polite to other locks?


Thanks,

Paolo


