Return-Path: <linux-usb+bounces-16197-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5128499D7CC
	for <lists+linux-usb@lfdr.de>; Mon, 14 Oct 2024 22:00:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A9A30B22166
	for <lists+linux-usb@lfdr.de>; Mon, 14 Oct 2024 20:00:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 26B5B1CF5C9;
	Mon, 14 Oct 2024 19:59:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="B4A4UoLv"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E14401CF28B
	for <linux-usb@vger.kernel.org>; Mon, 14 Oct 2024 19:59:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728935991; cv=none; b=eLnDzRZBT8tkN3Wz3QKbNs2pR1A7Zb6XzUAGNF7ukUS/YHEgB/tpl124cRjhSCmFftpKZMKF85wi1OXVs0fnT8WDAVMmLvLQzd6q0NgKMqA677q1wAeCyljWR3pCm939RaShy3jXDkfDdDcsDni33apVq4idBA47g3QjK3GUJ+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728935991; c=relaxed/simple;
	bh=u9uV9JChogphVwKk7EEyRzAoG4DZeAhoQVoDLrLr6d0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qxroinkLmGIxamHEEW43FS6/N+TcFzGcdgsMt9qaYEZVgLW0xSbOfgH6TueKN/G8mJ64gI1Su9WTKVuxUw4Pdd1VihdYXbpyDHSv6FR/sa7bO5iaycNR9PhNnlye1T4Eq/jmy1pp/7gdgCaMTHDUoRYZE1vmFDd/i28uh9yJNkA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=B4A4UoLv; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-a99ffeea60bso272072166b.3
        for <linux-usb@vger.kernel.org>; Mon, 14 Oct 2024 12:59:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728935988; x=1729540788; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Qlz+q0/TK0V+xCzZbAzvbZ/eVxqxyV9wT+tFG3h7ujI=;
        b=B4A4UoLvg0gRApu15+rqotHnY5gY1YOC3MNcJQO8oyku9FkQvz1+ro5x3oMnvYrq8C
         Fq0Wo4FwCkPeP6skXgh10EfYJWJkp+8gbLHq5EjHG24aaQs87t6sl+muJ2veiV/ucpEP
         uPhOuD4V1AHEfDi9VICdGDBdAAfFvI1xupc3R1BOI1fIRRwMKU0dOe9/kSL+fJXLZPcj
         wG7WTJdqWuXhaozYscL1n5DI9lcVwCaBvfWnObEh7i2ZH8NlkfkqWUYs7tWjpe0BxD7L
         Mfbysg1S75m9i216/ITnTq5sC8nd4u2SmYJvrI1Fb8/2EbNtt1jjAO2ALiUPU+4FseTb
         HBFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728935988; x=1729540788;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Qlz+q0/TK0V+xCzZbAzvbZ/eVxqxyV9wT+tFG3h7ujI=;
        b=OnQgLoY8YirL5+JB9ZjQVrkKRFGtiJ/1zGHwxGlS00GCgeFcSEUP+u0mPFnhjR5Dur
         lysyvwnz7AwxNFUXmvLoPtNxtNhv/VgAL880yde7Pg6vdfCyix0Jj+n3fca9jPkKo00A
         jLFCaETdtcjvA4S+l7c/c5KPNXIE2YGv266PfWrtfw3w49+emdH2OLj/FdDT7LDAUV6H
         JHFTEJEqJcEVnbeuxVyQPvWK4d/LBK+twBUFgkQq1RbU41Z8TJzAEsPeEelrr6lv7Wkl
         iI3RT3/8VjmqUA46UHvzGRj4iJoEZDolTESd5CAzN92iecibSednR6NpR7tJuwm0eQlS
         h7mA==
X-Forwarded-Encrypted: i=1; AJvYcCXcnqIE2HTfTV3xjQrlmQJcQtlIwmhWW0eAlN3jYoggp8RT0zA5sThKZV50ySsiQaIUjYwkAOHA5S4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzCucpU9MG08iVhoy79Tm6weMGUp3Jaj/+K4IqyqQoVBqN61LxY
	yDn0XkVwGPkCksUXwIfH7HbyqTh1lymzcpBVxTB+RWHM05mJuZu8kwy8E1KEyJWDIsmRKk8qhGe
	pSm4lTYUZduUwfOFzpTZ6+TfevvCYzTyRUyS1rpqpuE/rcA6RZyQC
X-Google-Smtp-Source: AGHT+IEqEDaLUpXMT18RBsLBogUI7VV3LWh52gRwoZvp1NdHc8GYVSpA84mcVyFFOwzawVw0wQVA/81PbA0ZoTNlK4A=
X-Received: by 2002:a17:907:9709:b0:a9a:4d1:460 with SMTP id
 a640c23a62f3a-a9a04d10662mr502667566b.63.1728935987853; Mon, 14 Oct 2024
 12:59:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240829175201.670718-1-oneukum@suse.com>
In-Reply-To: <20240829175201.670718-1-oneukum@suse.com>
From: Eric Dumazet <edumazet@google.com>
Date: Mon, 14 Oct 2024 21:59:33 +0200
Message-ID: <CANn89i+m69mWQw+V6XWCzmF84s6uQV15m_YdkPDQptoxUks4=w@mail.gmail.com>
Subject: Re: [PATCHv2 net] usbnet: modern method to get random MAC
To: Oliver Neukum <oneukum@suse.com>
Cc: davem@davemloft.net, kuba@kernel.org, pabeni@redhat.com, 
	netdev@vger.kernel.org, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@kernel.org, 
	John Sperbeck <jsperbeck@google.com>, Brian Vazquez <brianvv@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 29, 2024 at 7:52=E2=80=AFPM Oliver Neukum <oneukum@suse.com> wr=
ote:
>
> The driver generates a random MAC once on load
> and uses it over and over, including on two devices
> needing a random MAC at the same time.
>
> Jakub suggested revamping the driver to the modern
> API for setting a random MAC rather than fixing
> the old stuff.
>
> The bug is as old as the driver.
>
> Signed-off-by: Oliver Neukum <oneukum@suse.com>
>
> ---
>
> v2: Correct commentary style
>
>  drivers/net/usb/usbnet.c | 11 +++--------
>  1 file changed, 3 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/net/usb/usbnet.c b/drivers/net/usb/usbnet.c
> index dfc37016690b..40536e1cb4df 100644
> --- a/drivers/net/usb/usbnet.c
> +++ b/drivers/net/usb/usbnet.c
> @@ -61,9 +61,6 @@
>
>  /*----------------------------------------------------------------------=
---*/
>
> -// randomly generated ethernet address
> -static u8      node_id [ETH_ALEN];
> -
>  /* use ethtool to change the level for any given device */
>  static int msg_level =3D -1;
>  module_param (msg_level, int, 0);
> @@ -1743,7 +1740,6 @@ usbnet_probe (struct usb_interface *udev, const str=
uct usb_device_id *prod)
>
>         dev->net =3D net;
>         strscpy(net->name, "usb%d", sizeof(net->name));
> -       eth_hw_addr_set(net, node_id);
>
>         /* rx and tx sides can use different message sizes;
>          * bind() should set rx_urb_size in that case.
> @@ -1819,9 +1815,9 @@ usbnet_probe (struct usb_interface *udev, const str=
uct usb_device_id *prod)
>                 goto out4;
>         }
>
> -       /* let userspace know we have a random address */
> -       if (ether_addr_equal(net->dev_addr, node_id))
> -               net->addr_assign_type =3D NET_ADDR_RANDOM;
> +       /* this flags the device for user space */
> +       if (!is_valid_ether_addr(net->dev_addr))
> +               eth_hw_addr_random(net);
>
>         if ((dev->driver_info->flags & FLAG_WLAN) !=3D 0)
>                 SET_NETDEV_DEVTYPE(net, &wlan_type);
> @@ -2229,7 +2225,6 @@ static int __init usbnet_init(void)
>         BUILD_BUG_ON(
>                 sizeof_field(struct sk_buff, cb) < sizeof(struct skb_data=
));
>
> -       eth_random_addr(node_id);
>         return 0;
>  }
>  module_init(usbnet_init);
> --
> 2.45.2
>

As diagnosed by John Sperbeck :

This patch implies all ->bind() method took care of populating net->dev_add=
r ?

Otherwise the following existing heuristic is no longer working

// heuristic:  "usb%d" for links we know are two-host,
// else "eth%d" when there's reasonable doubt.  userspace
// can rename the link if it knows better.
if ((dev->driver_info->flags & FLAG_ETHER) !=3D 0 &&
    ((dev->driver_info->flags & FLAG_POINTTOPOINT) =3D=3D 0 ||
     (net->dev_addr [0] & 0x02) =3D=3D 0))
strscpy(net->name, "eth%d", sizeof(net->name));

