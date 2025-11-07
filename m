Return-Path: <linux-usb+bounces-30200-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0620EC4042D
	for <lists+linux-usb@lfdr.de>; Fri, 07 Nov 2025 15:10:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0D9B318889D0
	for <lists+linux-usb@lfdr.de>; Fri,  7 Nov 2025 14:11:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6EE38328B44;
	Fri,  7 Nov 2025 14:10:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Jd05a5Y0"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-yx1-f53.google.com (mail-yx1-f53.google.com [74.125.224.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 681E42765C5
	for <linux-usb@vger.kernel.org>; Fri,  7 Nov 2025 14:10:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762524637; cv=none; b=u5UL864XioyW7/EJJz2k9QN86bc57y+EKhuFJ4/JrJWgZmBXdPFZjg5qpMpFjF9gZENvXC1Y6gaAWrE9HnWMHPfyfalo4W298XwLZSZvIOFFn0r5vI6V+Dx2xe9oHuAoeR9uawo/UvFb9pxp9hk7eimsi9ZYAdeqD0roGpm8aGc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762524637; c=relaxed/simple;
	bh=+cZzo8xco90BPe5zTjWVIqWQKXNXcQ8nK2fbETbWVGA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=a6aZdpcgmpV1KX7mtbShlzQDftbN6oGJzd+N+MtxD+pBp2HU1IQhSQGgAsBWMz/6aBjWap9F0GPKnhWDO5vwi44OTaXJhcC0LX83FZytqx8GGaeXlmHv9zIrVBF+1FrVQ5ZcSaeigJpAHMatjTqmJQ53d71LArJ47srrsEQ2G10=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Jd05a5Y0; arc=none smtp.client-ip=74.125.224.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-yx1-f53.google.com with SMTP id 956f58d0204a3-640c9c85255so660710d50.3
        for <linux-usb@vger.kernel.org>; Fri, 07 Nov 2025 06:10:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1762524633; x=1763129433; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+cZzo8xco90BPe5zTjWVIqWQKXNXcQ8nK2fbETbWVGA=;
        b=Jd05a5Y0VSWEg6+WhsNNNP8SP5sWGXlREIoQ7QL1YSRh5n+xYDYKhN3VVUF5PMauNv
         k1oFQ4XdybJJ816WPMB9wp7ZUPFavSRX9FvwVWWlnnjzf8spk9fKGrSbfOpG51a7JYKF
         JMpQOLl2JhJsh1qCk18sPyzOQBYZ3r135FGyQ8UNNCm2WGWYNy0sLx/uSC7sF3TMmpaJ
         kdDNfQClpuTYwY2H8E+M3n9CfevAXenBf6j91ng0IYu8050N2PJuSKiSSAkjhtZ0pNs+
         4FLdX11mJsMvMSMlOG/nOE9MYyShq60mBDf4ArZr1eLwyOWJw5UexKAaLmIXZWMCF56m
         k+oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762524633; x=1763129433;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+cZzo8xco90BPe5zTjWVIqWQKXNXcQ8nK2fbETbWVGA=;
        b=eKjhu3aYT325NzuGBgY0XpFN8cZzk1Sz8o2uM3hEIMxf/yiy4lBNrM7gwYfvZTuVpS
         j/WekE5Hx0H45AWU94kOlfsgdir7xhePPsIswcoY3tBW2V+NS7qZAndSZrTcspPMhjQv
         mBWo3r7BK+bxrQSktCMWvu5CwvdAoLXuvQLoqnobgFQvofmR5uFowvOu+EAX47GQUtGg
         WtJYKRY42lIGs2ICg/qYmB813mtQG93GeTlp6kruWAjzRicE3hkIGFlekpOxTUDRjBON
         yI9Ie/c82981PBOK5AG93e9503lm3BaiMv+pT1adHD8aZkU1YfStQxBpD5t5mTmn/X+p
         J5/w==
X-Forwarded-Encrypted: i=1; AJvYcCVzUyraWR5JKEQeHLsMekz+bNrx4jTFzdPyKw/F5ZeFWkAFIXftgW10d48+Y7gp8+uKMV7DRfq4Y3g=@vger.kernel.org
X-Gm-Message-State: AOJu0YxgUXAdLorr9w+ammi4xESuN46itzl2tnNYCG/ma9Qj980djO98
	Jou2GeLrrkp0XQEm4HZ9UCZWrOEzEiwBi/q40uyYUMbMiNZ1pHtNcLLcUP6hyxyU+zZZdpTbC9c
	qV6c68gjBDGPWH5prZ5K37F49Rf3RWuRxBmwIk+hu
X-Gm-Gg: ASbGncvmAEZ+Ohi41D1myQhB8fWGvDAdX3PuCpEEzVP7peA+bBluMjza58xaw0vYB3+
	X5AlELAc9ajwIRo+swMG8AdzTsd9bdcfWWvfWatO1Ik8iZEDGD62AzriqNmKpQeH6Q1JYydl+XF
	TznEsZ3sw+i2q1D71dtV6xhRyT75Kz8R5pXzQo2/eFASryu2EyBgZk5kYbD+/+sWag9IxDEp2CA
	gIH5m4S8yUm2hLMWoRpxWTnVzwv4UWnR78GEPmUoGs/qjypLy/x9NM91mGIrnMYCcnkGns=
X-Google-Smtp-Source: AGHT+IF4MNPjtjkI0HykYzQ/N+DjSl09Uwih8EXv3NQX/RBzR++OlV/O2BGN0tPhSnQ92UawBVQW3Cb0VrPm4WrY5A8=
X-Received: by 2002:a05:690e:2557:b0:63f:a48d:b7ce with SMTP id
 956f58d0204a3-640c41c6a29mr2059410d50.27.1762524633098; Fri, 07 Nov 2025
 06:10:33 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251106175615.26948-1-simon.schippers@tu-dortmund.de>
In-Reply-To: <20251106175615.26948-1-simon.schippers@tu-dortmund.de>
From: Eric Dumazet <edumazet@google.com>
Date: Fri, 7 Nov 2025 06:10:21 -0800
X-Gm-Features: AWmQ_blZgftDNHs4-HzNXdI8nrjDZ7hGHov3wbswer-i55xUXiO1FMu9wnhdIiA
Message-ID: <CANn89i+Cc=y_Powx5aWC9fkASsMpuDZsL5TxDxEQiHmSjj4khw@mail.gmail.com>
Subject: Re: [PATCH net-next v2] usbnet: Add support for Byte Queue Limits (BQL)
To: Simon Schippers <simon.schippers@tu-dortmund.de>
Cc: oneukum@suse.com, andrew+netdev@lunn.ch, davem@davemloft.net, 
	kuba@kernel.org, pabeni@redhat.com, dnlplm@gmail.com, netdev@vger.kernel.org, 
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 6, 2025 at 9:56=E2=80=AFAM Simon Schippers
<simon.schippers@tu-dortmund.de> wrote:
>
> In the current implementation, usbnet uses a fixed tx_qlen of:
>
> USB2: 60 * 1518 bytes =3D 91.08 KB
> USB3: 60 * 5 * 1518 bytes =3D 454.80 KB
>
> Such large transmit queues can be problematic, especially for cellular
> modems. For example, with a typical celluar link speed of 10 Mbit/s, a
> fully occupied USB3 transmit queue results in:
>
> 454.80 KB / (10 Mbit/s / 8 bit/byte) =3D 363.84 ms
>
> of additional latency.
>
> This patch adds support for Byte Queue Limits (BQL) [1] to dynamically
> manage the transmit queue size and reduce latency without sacrificing
> throughput.
>
> Testing was performed on various devices using the usbnet driver for
> packet transmission:
>
> - DELOCK 66045: USB3 to 2.5 GbE adapter (ax88179_178a)
> - DELOCK 61969: USB2 to 1 GbE adapter (asix)
> - Quectel RM520: 5G modem (qmi_wwan)
> - USB2 Android tethering (cdc_ncm)
>
> No performance degradation was observed for iperf3 TCP or UDP traffic,
> while latency for a prioritized ping application was significantly
> reduced. For example, using the USB3 to 2.5 GbE adapter, which was fully
> utilized by iperf3 UDP traffic, the prioritized ping was improved from
> 1.6 ms to 0.6 ms. With the same setup but with a 100 Mbit/s Ethernet
> connection, the prioritized ping was improved from 35 ms to 5 ms.
>
> [1] https://lwn.net/Articles/469652/
>
> Signed-off-by: Simon Schippers <simon.schippers@tu-dortmund.de>
> ---

Reviewed-by: Eric Dumazet <edumazet@google.com>

