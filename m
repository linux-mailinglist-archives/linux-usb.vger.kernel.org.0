Return-Path: <linux-usb+bounces-8347-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A45288B8C9
	for <lists+linux-usb@lfdr.de>; Tue, 26 Mar 2024 04:39:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1EBDB2E33C6
	for <lists+linux-usb@lfdr.de>; Tue, 26 Mar 2024 03:39:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 73B49128801;
	Tue, 26 Mar 2024 03:39:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="r6/iMtQt"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F0A21D53C
	for <linux-usb@vger.kernel.org>; Tue, 26 Mar 2024 03:39:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711424350; cv=none; b=snfuPmI/qGBKbgsnqEegtEy+OvZvh3+SW/r1VynxWblDOVgBESILnN8fTgG+FbE4hhnEcM2opIr/uOj2X+cm5qnETJ9f4ZUG0VWQKXXV+eUfuV0iUXeVKcVoKhSSseiKX03IV6FOPu7ZU9w1EseYFHf/jRxVbFmx0fl8rqRZPW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711424350; c=relaxed/simple;
	bh=ApTdtlrl8/LXffDSll4JXlTXzDNlhfOuLGMTRhqu4c4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qf55/yVXTr5w5GA3gDXpm0mses/lxc1gPNjP/l4sdwsKf+Yf5CgbEne/uunVrdb/ocy4rPCUPYwSUOIAvyr+ZTm6catneBCNGj7xHjOf0fA8MVd5lGgICpb7ljz3nMk/gP0rXSKEAW8sMSzRGkn5nUrx42iEFVll4LfDJhnKlFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b=r6/iMtQt; arc=none smtp.client-ip=185.125.188.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Received: from mail-yb1-f200.google.com (mail-yb1-f200.google.com [209.85.219.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 7F59B3F74E
	for <linux-usb@vger.kernel.org>; Tue, 26 Mar 2024 03:39:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1711424341;
	bh=v8ORGo2AO7/q/K0T6O9SCBPO1+KCK6J3A6wV5iYBto8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=r6/iMtQt4yJBmk5r/b/kNBHtGRNUxM4tXL7pj86MgsqIz49nQoTLNKUCTIqE197hM
	 brJVBmjpaOUKTxwwE6YbCZ76amkSdnN+1BGS4CiHO51MRapN20ZyZliV8OMFyA9Bjg
	 Vv9HKEjoAeAq+ve76djxoG0boVzgJ1b6AkdHxMppxqdwQpjcO8iXMaL6MFH5dr0pcE
	 0ldN1hPEhKGYUuRQEjs69Ay9GCJOzFh4kYcdby3UCkV0sfZkcLjMolJ2MZ3fqcN1Bd
	 xmQhzpkXavpQ7FMzA+qMXy9zSLtWQkczJWc7VxllDYnN1W4Q4r2uAWazCZ2DkG+BM3
	 lSt9IhAG1qTwQ==
Received: by mail-yb1-f200.google.com with SMTP id 3f1490d57ef6-dccc49ef73eso7463958276.2
        for <linux-usb@vger.kernel.org>; Mon, 25 Mar 2024 20:39:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711424340; x=1712029140;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=v8ORGo2AO7/q/K0T6O9SCBPO1+KCK6J3A6wV5iYBto8=;
        b=r5rMlrJ1Tvn92fJchdHewiva7ziwvJKyF7BFdtHBFGA+xsAnYcSUf4cxtY+jlzobIr
         +ZKp/EiBDvj6uuLu6hlaJ+RpH9OK7AwwZVhZbqxwGoHEZz+WJ6RMKVE4dr7bZDtx5wpr
         J+UXtuu0UVj77i48eH7WfqAP3s0BzvzmjXs9m2xnd7FGJDljaAmFYvxnx2XJEW3HlLXB
         ueRvRipBlT8ZOsykBXKULkSM23OqEpPNwojQL5U0izen6F+4VBtTTMiZGIuFeSEd8kHz
         lfybkfNeXa720mdsfoIhxr0NsN1hst45y1/1gzioeBqoqLkRW+YMIpWpSn+g6gW+RWfb
         0UBA==
X-Forwarded-Encrypted: i=1; AJvYcCXgtzZmloocrzrOWy4qE49HCLU1RFOt+hqHCkc4lzLsUcMlp3PlgKQPPe+a9sMWSq6ZQO1mg5rYvx2ZwBf2bofMm4ghLZAYBtCf
X-Gm-Message-State: AOJu0YyQYa1VeXku1c4bkivj7rVdiFTjuqklOyI0MjXQU9VcD9GwwNiw
	NOUBwTFJRNoJG8A1tJIqpXb0Vdid8eRRDg1z3OdpT6PYTieMbMBGFMaU+VDrdKO5F6xeBZdXhlT
	D55rMlnwU1EyoubI3QudCMS8mQQEHvJ4qPZn73oEgGKU+mSGOy9Ye5VNx012B6k+PbNhehGlEP6
	A7rc7xSzCkjutMwpWtzA8yORisBWnO1PQlzLqP/p8Gn3swIpb1
X-Received: by 2002:a05:6902:4d3:b0:dc6:d457:ac92 with SMTP id v19-20020a05690204d300b00dc6d457ac92mr6952220ybs.31.1711424340564;
        Mon, 25 Mar 2024 20:39:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGfkyusSwVv9X6404NxGSl4pmMa8rd6JuBikpeWo9J1A+sg3qnY3CCXnWWR9sERDDWyUY2dDhjo3InoADY9Mgg=
X-Received: by 2002:a05:6902:4d3:b0:dc6:d457:ac92 with SMTP id
 v19-20020a05690204d300b00dc6d457ac92mr6952214ybs.31.1711424340282; Mon, 25
 Mar 2024 20:39:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240305065140.66801-1-kai.heng.feng@canonical.com>
In-Reply-To: <20240305065140.66801-1-kai.heng.feng@canonical.com>
From: Kai-Heng Feng <kai.heng.feng@canonical.com>
Date: Tue, 26 Mar 2024 11:38:48 +0800
Message-ID: <CAAd53p7P_-4voZ49=WKpDCg9tx4QRV2NEG5FyqitsAc-Yzm2VA@mail.gmail.com>
Subject: Re: [PATCH] usb: Disable USB3 LPM at shutdown
To: gregkh@linuxfoundation.org
Cc: stern@rowland.harvard.edu, mathias.nyman@linux.intel.com, oneukum@suse.com, 
	Roy Luo <royluo@google.com>, Heiner Kallweit <hkallweit1@gmail.com>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 5, 2024 at 2:52=E2=80=AFPM Kai-Heng Feng
<kai.heng.feng@canonical.com> wrote:
>
> SanDisks USB3 storage may disapper after system reboot:
>
> usb usb2-port3: link state change
> xhci_hcd 0000:00:14.0: clear port3 link state change, portsc: 0x2c0
> usb usb2-port3: do warm reset, port only
> xhci_hcd 0000:00:14.0: xhci_hub_status_data: stopping usb2 port polling
> xhci_hcd 0000:00:14.0: Get port status 2-3 read: 0x2b0, return 0x2b0
> usb usb2-port3: not warm reset yet, waiting 50ms
> xhci_hcd 0000:00:14.0: Get port status 2-3 read: 0x2f0, return 0x2f0
> usb usb2-port3: not warm reset yet, waiting 200ms
> ...
> xhci_hcd 0000:00:14.0: Get port status 2-3 read: 0x6802c0, return 0x7002c=
0
> usb usb2-port3: not warm reset yet, waiting 200ms
> xhci_hcd 0000:00:14.0: clear port3 reset change, portsc: 0x4802c0
> xhci_hcd 0000:00:14.0: clear port3 warm(BH) reset change, portsc: 0x4002c=
0
> xhci_hcd 0000:00:14.0: clear port3 link state change, portsc: 0x2c0
> xhci_hcd 0000:00:14.0: Get port status 2-3 read: 0x2c0, return 0x2c0
> usb usb2-port3: not enabled, trying warm reset again...
>
> This is due to the USB device still cause port change event after xHCI is
> shuted down:
>
> xhci_hcd 0000:38:00.0: // Setting command ring address to 0xffffe001
> xhci_hcd 0000:38:00.0: xhci_resume: starting usb3 port polling.
> xhci_hcd 0000:38:00.0: xhci_hub_status_data: stopping usb4 port polling
> xhci_hcd 0000:38:00.0: xhci_hub_status_data: stopping usb3 port polling
> xhci_hcd 0000:38:00.0: hcd_pci_runtime_resume: 0
> xhci_hcd 0000:38:00.0: xhci_shutdown: stopping usb3 port polling.
> xhci_hcd 0000:38:00.0: // Halt the HC
> xhci_hcd 0000:38:00.0: xhci_shutdown completed - status =3D 1
> xhci_hcd 0000:00:14.0: xhci_shutdown: stopping usb1 port polling.
> xhci_hcd 0000:00:14.0: // Halt the HC
> xhci_hcd 0000:00:14.0: xhci_shutdown completed - status =3D 1
> xhci_hcd 0000:00:14.0: Get port status 2-3 read: 0x1203, return 0x203
> xhci_hcd 0000:00:14.0: set port reset, actual port 2-3 status  =3D 0x1311
> xhci_hcd 0000:00:14.0: Get port status 2-3 read: 0x201203, return 0x10020=
3
> xhci_hcd 0000:00:14.0: clear port3 reset change, portsc: 0x1203
> xhci_hcd 0000:00:14.0: clear port3 warm(BH) reset change, portsc: 0x1203
> xhci_hcd 0000:00:14.0: clear port3 link state change, portsc: 0x1203
> xhci_hcd 0000:00:14.0: clear port3 connect change, portsc: 0x1203
> xhci_hcd 0000:00:14.0: Get port status 2-3 read: 0x1203, return 0x203
> usb 2-3: device not accepting address 2, error -108
> xhci_hcd 0000:00:14.0: xHCI dying or halted, can't queue_command
> xhci_hcd 0000:00:14.0: Set port 2-3 link state, portsc: 0x1203, write 0x1=
1261
> xhci_hcd 0000:00:14.0: Get port status 2-3 read: 0x1263, return 0x263
> xhci_hcd 0000:00:14.0: set port reset, actual port 2-3 status  =3D 0x1271
> xhci_hcd 0000:00:14.0: Get port status 2-3 read: 0x12b1, return 0x2b1
> usb usb2-port3: not reset yet, waiting 60ms
> ACPI: PM: Preparing to enter system sleep state S5
> xhci_hcd 0000:00:14.0: Get port status 2-3 read: 0x12f1, return 0x2f1
> usb usb2-port3: not reset yet, waiting 200ms
> reboot: Restarting system
>
> The port change event is caused by LPM transition, so disabling LPM at sh=
utdown
> to make sure the device is in U0 for warmboot.
>
> Signed-off-by: Kai-Heng Feng <kai.heng.feng@canonical.com>

A gentle ping...

> ---
>  drivers/usb/core/port.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/usb/core/port.c b/drivers/usb/core/port.c
> index c628c1abc907..c50266d7ce9d 100644
> --- a/drivers/usb/core/port.c
> +++ b/drivers/usb/core/port.c
> @@ -418,8 +418,10 @@ static void usb_port_shutdown(struct device *dev)
>  {
>         struct usb_port *port_dev =3D to_usb_port(dev);
>
> -       if (port_dev->child)
> +       if (port_dev->child) {
>                 usb_disable_usb2_hardware_lpm(port_dev->child);
> +               usb_unlocked_disable_lpm(port_dev->child);
> +       }
>  }
>
>  static const struct dev_pm_ops usb_port_pm_ops =3D {
> --
> 2.34.1
>

