Return-Path: <linux-usb+bounces-30055-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 4909CC32315
	for <lists+linux-usb@lfdr.de>; Tue, 04 Nov 2025 18:00:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id C68814E512A
	for <lists+linux-usb@lfdr.de>; Tue,  4 Nov 2025 17:00:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD0BE338592;
	Tue,  4 Nov 2025 17:00:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="vN8XvbLr"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B535C23D294
	for <linux-usb@vger.kernel.org>; Tue,  4 Nov 2025 17:00:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762275629; cv=none; b=GKVNu0MUhjbIQ9RGQBd2wGVMD/PnoKtro4fiCFzMZpMQmah8QErhdpkcostp+D77FCCbf6LIzQsJkcTrlF9NpwhI8/nNfd1KbJ5TqGSL/0llVKNtvF2sYe1UsmUrhjLcE6IHFNkc1zNbhfHiI2pJjJPzbg1U7hnrJCIn26ZPiII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762275629; c=relaxed/simple;
	bh=fNKxR8Huz8fa7FD9nwQcgMFYT6NMnhgEmGSLfWUUPiY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SMbPZkorTEIfP1CoqzxYFgW6nd+/R3vzYiT5dLjw/mzTuTGjlfFEQRivRmnhuSOBbiWoFghYum3E1kuAMRianf+tURKyw+GapyCb8PJCxvoYmqJP1EnhXkwITjl7icx4EtENl0Qkdw93dd4li4ysEZGpI8yNf8TaglQLrCcN/UU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=vN8XvbLr; arc=none smtp.client-ip=209.85.160.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-4ecee8ce926so53410101cf.1
        for <linux-usb@vger.kernel.org>; Tue, 04 Nov 2025 09:00:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1762275627; x=1762880427; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GLkr+toBJEkXFzMqz8dqv7JYuTKc8UDp6rSXr+gKLa0=;
        b=vN8XvbLrs1+xsvgRmVkBFXatjDV76IcwA2jgfMR9HRSs7u2VX0c8cVW/X6WtAnWNE4
         tFpf1xnHHU+G1t+kT4rhIfwFv5Tjt0C3XBegnZPt9ALyucdsmDbailmZSNNcB80p6CaM
         Ovnge+7rIpNCGwtkqNC0RcEQHCcO5BcyHuTo1h23IyVSfs0afCp/G1tuw66THAFONVus
         S+yRHKmyJlu0cVmeMmbYxcX3L8flvOBjQVGKEwNc4wlJ6k/dznq38YGxGaexo0kKUdyU
         9owRR2ZdSiB80/OudtnebEiwG66RPCVqQj7ydKE/sAnYFl5gshEL6LfEsngmFuiurnCl
         gmWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762275627; x=1762880427;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GLkr+toBJEkXFzMqz8dqv7JYuTKc8UDp6rSXr+gKLa0=;
        b=aBL1l+sbmX90yuJzKQXK6t29NRrgTVJ/YZNlayX9eyYD1o7NlKWUWT83yXQ7kFshE4
         RnGPRQ0P0DUHYsl+cTinwaxQlJOwlM3Gv8QY56JPucp+TfXFb/PxxlwGN4HcOvtIjRfC
         Ko5YzWK4hq3K4aRrAwYvmiUMS4VR2IrUNhEIJAnFDNIjSOYAPkm9vmB8Benpgua9AQbN
         8BEJNcaf1Ph3N27PXYyncPWI9BuU7rQluMp30x+B0Etw8qeq7JZ5RsY9d/pZAbvCcS89
         uLcVnX1bC9OZSKxwQAQcFu8LsH7iMZSBYUp5eLaPMUYY4dG4rCqoBSEu8SixZpvWumHa
         +Bbw==
X-Forwarded-Encrypted: i=1; AJvYcCX1dyZgzEBZVgezM9OfAE5kLrdamJX39hwukQ5KLiy7meUWiQjkeY8lBjKB1Ye58/MY7UMZPZTH05Q=@vger.kernel.org
X-Gm-Message-State: AOJu0Yznkp1oheri8b6OcVzWxnx4HvnAn20ziW1rPkyxW7l9pRJWKMDc
	hO/gyVzCKtQDnt58cFuPmbjMl/C46xyKQsNhs9RPFFBqUmnftSErT9gpZk3XoLFpFdgLSd/3V7M
	iozFX5Pbzt98CoBsOUGS7yVwJ3TGedSgFw2y5LG2h
X-Gm-Gg: ASbGncs2RPQGhSaCDNM2yS01FpR3sujcltkgk30E7ft0edkvZSCmsBf2fs3TtScgSLL
	gN+aHgC6/1RuLuXZJevghEMg5uj5zQzD0RiHQ8Fqx+vvDK+a92CfrRktDSPKqt2xz5JMAFK/yHb
	UcVHdGO+rQw+gBPfpKrQlmlg4HdmZcit8XPxRSxBEPHL/yxMHuH3wKit/hccH59rTM9BcUb0du1
	Vwm7NHSeCjE1Hm45RBVdQa56da0cvMv81to/eYG4MnQDZhGJqGIcKwHJgBd
X-Google-Smtp-Source: AGHT+IHyzDdpfQy1ogOmLinZQFR4B08PtdTVqgFkjFVLjt+FqIzXGcrnMNTyXjkb4SiZpnz28193KoiXFhUYGydLiv4=
X-Received: by 2002:a05:622a:13d1:b0:4c4:dfac:683f with SMTP id
 d75a77b69052e-4ed725ff575mr2114981cf.56.1762275625640; Tue, 04 Nov 2025
 09:00:25 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251104161327.41004-1-simon.schippers@tu-dortmund.de> <20251104161327.41004-2-simon.schippers@tu-dortmund.de>
In-Reply-To: <20251104161327.41004-2-simon.schippers@tu-dortmund.de>
From: Eric Dumazet <edumazet@google.com>
Date: Tue, 4 Nov 2025 09:00:14 -0800
X-Gm-Features: AWmQ_bmeXlUhR0iNRG8sd-M8ii4vznUNqZK8bfVckHH7T2JL75mp-YQvDeczkds
Message-ID: <CANn89iL6MjvOc8qEQpeQJPLX0Y3X0HmqNcmgHL4RzfcijPim5w@mail.gmail.com>
Subject: Re: [PATCH net-next v1 1/1] usbnet: Add support for Byte Queue Limits (BQL)
To: Simon Schippers <simon.schippers@tu-dortmund.de>
Cc: oneukum@suse.com, andrew+netdev@lunn.ch, davem@davemloft.net, 
	kuba@kernel.org, pabeni@redhat.com, netdev@vger.kernel.org, 
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 4, 2025 at 8:14=E2=80=AFAM Simon Schippers
<simon.schippers@tu-dortmund.de> wrote:
>
> The usbnet driver currently relies on fixed transmit queue lengths, which
> can lead to bufferbloat and large latency spikes under load -
> particularly with cellular modems.
> This patch adds support for Byte Queue Limits (BQL) to dynamically manage
> the transmit queue size and reduce latency without sacrificing
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
> Signed-off-by: Simon Schippers <simon.schippers@tu-dortmund.de>
> ---
>  drivers/net/usb/usbnet.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/drivers/net/usb/usbnet.c b/drivers/net/usb/usbnet.c
> index 62a85dbad31a..1994f03a78ad 100644
> --- a/drivers/net/usb/usbnet.c
> +++ b/drivers/net/usb/usbnet.c
> @@ -831,6 +831,7 @@ int usbnet_stop(struct net_device *net)
>
>         clear_bit(EVENT_DEV_OPEN, &dev->flags);
>         netif_stop_queue (net);
> +       netdev_reset_queue(net);
>
>         netif_info(dev, ifdown, dev->net,
>                    "stop stats: rx/tx %lu/%lu, errs %lu/%lu\n",
> @@ -939,6 +940,7 @@ int usbnet_open(struct net_device *net)
>         }
>
>         set_bit(EVENT_DEV_OPEN, &dev->flags);
> +       netdev_reset_queue(net);
>         netif_start_queue (net);
>         netif_info(dev, ifup, dev->net,
>                    "open: enable queueing (rx %d, tx %d) mtu %d %s framin=
g\n",
> @@ -1500,6 +1502,7 @@ netdev_tx_t usbnet_start_xmit(struct sk_buff *skb, =
struct net_device *net)
>         case 0:
>                 netif_trans_update(net);
>                 __usbnet_queue_skb(&dev->txq, skb, tx_start);
> +               netdev_sent_queue(net, skb->len);
>                 if (dev->txq.qlen >=3D TX_QLEN (dev))
>                         netif_stop_queue (net);
>         }
> @@ -1563,6 +1566,7 @@ static inline void usb_free_skb(struct sk_buff *skb=
)
>  static void usbnet_bh(struct timer_list *t)
>  {
>         struct usbnet           *dev =3D timer_container_of(dev, t, delay=
);
> +       unsigned int bytes_compl =3D 0, pkts_compl =3D 0;
>         struct sk_buff          *skb;
>         struct skb_data         *entry;
>
> @@ -1574,6 +1578,8 @@ static void usbnet_bh(struct timer_list *t)
>                                 usb_free_skb(skb);
>                         continue;
>                 case tx_done:
> +                       bytes_compl +=3D skb->len;
> +                       pkts_compl++;
>                         kfree(entry->urb->sg);
>                         fallthrough;
>                 case rx_cleanup:
> @@ -1584,6 +1590,8 @@ static void usbnet_bh(struct timer_list *t)
>                 }
>         }
>
> +       netdev_completed_queue(dev->net, pkts_compl, bytes_compl);
> +
>         /* restart RX again after disabling due to high error rate */
>         clear_bit(EVENT_RX_KILL, &dev->flags);
>

I think this is racy. usbnet_bh() can run from two different contexts,
at the same time (from two cpus)

1) From process context :
usbnet_bh_work()

2) From a timer. (dev->delay)


To use BQL, you will need to add mutual exclusion.

