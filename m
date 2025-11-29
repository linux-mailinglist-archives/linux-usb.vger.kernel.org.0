Return-Path: <linux-usb+bounces-31048-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 16EB7C9476C
	for <lists+linux-usb@lfdr.de>; Sat, 29 Nov 2025 20:56:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 8B84E345782
	for <lists+linux-usb@lfdr.de>; Sat, 29 Nov 2025 19:56:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2CA6026B2D7;
	Sat, 29 Nov 2025 19:56:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Vt1EmtVx"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1098124EF76
	for <linux-usb@vger.kernel.org>; Sat, 29 Nov 2025 19:56:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764446209; cv=none; b=tLIQIPbUBFGBXf3k84qSRNe+lHa/I6w4qgYqtVz4yJHECDE7AuPz+81qNfFoi27jR26klFaM85c8Uw3hZ1SeXAsgQzaastgEIUGkYmXkJ+9WKPCrWj7dvEp/EEgmkEZKu3xdLQsovjaULrY3cwGqymuDzW06Wpvmn3ADzuvgk7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764446209; c=relaxed/simple;
	bh=+hgh/g0BnBWw+qpebLsXCl14iSXwIPV4LuJw0I8YUTo=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TpOhtSlKtYKAYBkR4LdgRi46ShM+TBx5deD+/wSImqg9H/jGnjKQclmqWQIpXX1Q6MkkOvs6gsUjzzGhECkr/txkeOS7Vxm4uqi56smfD42b42XDPLCVXFyHfcrbdVkBAK0shcRxwuf09kz3zlSrCG9VKZGwMljCGDdG1gnmNcQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Vt1EmtVx; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-b725ead5800so381153566b.1
        for <linux-usb@vger.kernel.org>; Sat, 29 Nov 2025 11:56:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764446205; x=1765051005; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O3AMeoVRXqR0tzI1TxjtI8lh/zxUBR98DSX18SQBkvQ=;
        b=Vt1EmtVxKUdoFIx0UPko4CiJ+3uSzYLGB6cutz6raw12cCOUXMGzj1tlMjr16Vv87y
         GWFtObxCRluaFohRUSjGnfmGjPas1FU8dmQhsrsVM6g47DmQ/60JzIXsG1ZZvHed+wyh
         dlQMT5btQD/vBw+yLAQ2g6yLNkUbgbBflZvG7XM7zrIHg40XHGj+BGrwyPQZQrZeb7p1
         P1TcKNiX/2Eqdu/7KZBjlkABTgsVKLSbRqPTxCV1awDUs6kEdV/O59bsQdNw8CZNFJ4T
         ebtHTn9kkEW6y+7BYwaEa0McEBPSu3xKYDKObBjS1TLZ9g7g6EPQzEeOuwcsfmAplY27
         fbtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764446205; x=1765051005;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=O3AMeoVRXqR0tzI1TxjtI8lh/zxUBR98DSX18SQBkvQ=;
        b=s5SmKsJ2P/QihPmrqubj0x2M5Laua2TbKEnRupsfF5ixAYx6ERj/Fa02ujymQh9m7N
         Cc927hpiWgcNINM3JJ6aBX1bDym42LfIblQbej6XEex9Jgryn/d5Qh8Y9CB2H6Q2/UQA
         ekosEU+fxkvbsF68isgY+nHBFVvTMoBhquk3FFrpkAo33wb4+CJyeDTZJKe6C/qK+s9q
         0SkMyYVNVHMj7y0fInzYkEU+Tup6F+se9tiHZTbxNpyFNNN7aoAWNDb3iiY4TWnGlhd4
         tHwMzAxVnq/McJDQwKMZDxBVEkByLRWPlF1/nTjgL0ERnJ6py/+3r9AZl+k0/sP4+I4Y
         BeXw==
X-Forwarded-Encrypted: i=1; AJvYcCWomLCn5eoZ4C0gBzclDVvqTp5XjkALXYoPRwv2BIjE0IRglYwukVNEHS45NYmuTsm6P4Is5r+Wols=@vger.kernel.org
X-Gm-Message-State: AOJu0YxlW3V5cbxE4p4VmorMVgwYYT1rJA37aP7NG0Yozrt524yodqsZ
	ARVFzczqgvCStZG3urZKNYuBk5ZaU6Le0kbFKLUY6LmZJkcHKkvFMInd
X-Gm-Gg: ASbGnctFiqjTCoeaHy80HT8I4znItQ9Wepio+RTYneoqNZXn+5YrxwucC8htttHoWm/
	+3ThMfuWxsAcWBEa950lpElVRI0fJ7KHxMYBYolPxsw0pxR6eqX8jtPzk3xhJWJyTtQ7nxg5hDC
	iUgHxSn4y/RE2A/PXnjtcwp8K8bN272n0UoxKOB7b+qH5McUlK6EJoxfORFtD8bLD2VNlrFa4j8
	gKItW9lsGhuGhvFd+R2GErlAyCpUlL2kUVrlxoynzzj50VP/1k+9wccEbJoDKES+Bp9QG0/aPeI
	Ptl2ETachbngeOvIsWzrnt4ox/cVd7Pz+LDN+EJBVkwcMQoSj64hb36TgXefWheMzSSjrWfufT7
	gqHeAzrffSz9YzfIffMwKbQGV18PUTH1vxUvLKUVtzuOoEmwlo3aY22MG8x9lLijdNru43P8Gan
	GDKcDsoBVd/qGGxZTfQ/elJ3Q=
X-Google-Smtp-Source: AGHT+IHQ9zaUNVzgGxTzwCaTHRqZMx3oRsllkErV5jlogBMB6LB/zgVFb1daPizSnIDSerIbfOQWIQ==
X-Received: by 2002:a17:907:7f16:b0:b73:5f48:6159 with SMTP id a640c23a62f3a-b76c5354c01mr2103475166b.5.1764446205151;
        Sat, 29 Nov 2025 11:56:45 -0800 (PST)
Received: from foxbook (bfg212.neoplus.adsl.tpnet.pl. [83.28.44.212])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b76f5199852sm772266166b.15.2025.11.29.11.56.44
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Sat, 29 Nov 2025 11:56:44 -0800 (PST)
Date: Sat, 29 Nov 2025 20:56:39 +0100
From: Michal Pecio <michal.pecio@gmail.com>
To: Dylan Robinson <dylan_robinson@motu.com>
Cc: linux-sound@vger.kernel.org, tiwai@suse.com, perex@perex.cz,
 linux-usb@vger.kernel.org
Subject: Re: [PATCH] ALSA: usb-audio: Fix max bytes-per-interval calculation
Message-ID: <20251129205639.48fdbdf9.michal.pecio@gmail.com>
In-Reply-To: <20251124210518.90054-1-dylan_robinson@motu.com>
References: <20251124210518.90054-1-dylan_robinson@motu.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 24 Nov 2025 16:05:18 -0500, Dylan Robinson wrote:
> The maxpacksize field in struct audioformat represents the maximum number
> of bytes per isochronous interval. The current implementation only
> special-cases high-speed endpoints and does not account for the different
> computations required for SuperSpeed, SuperSpeedPlus, or eUSB2. As a
> result, USB audio class devices operating at these speeds may fail to
> stream correctly. The issue was observed on a MOTU 16A (2025) interface,
> which requires more than 1024 bytes per interval at SuperSpeed.
> 
> This patch replaces the existing logic with a helper that computes the
> correct maximum bytes-per-interval for all USB speeds, borrowing the logic
> used in drivers/usb/core/urb.c.

Hi,

Since v6.18 we have usb_endpoint_max_periodic_payload(), which looks
like the exact function you need. It is already used by uvcvideo and
xhci_hcd, the latter being particularly important because it ensures
that your endpoints will get the bandwidth allocation you expect.

The copy-pasta in urb.c should probably be cleaned up at this point,
but that would be a separate and unrelated patch, of course.

Regards,
Michal

> Signed-off-by: Dylan Robinson <dylan_robinson@motu.com>
> ---
>  sound/usb/stream.c | 36 ++++++++++++++++++++++++++++++++----
>  1 file changed, 32 insertions(+), 4 deletions(-)
> 
> diff --git a/sound/usb/stream.c b/sound/usb/stream.c
> index 5c235a5ba7e1..074a61215de6 100644
> --- a/sound/usb/stream.c
> +++ b/sound/usb/stream.c
> @@ -684,6 +684,37 @@ snd_usb_find_output_terminal_descriptor(struct usb_host_interface *ctrl_iface,
>  	return NULL;
>  }
>  
> +static unsigned int
> +snd_usb_max_bytes_per_interval(struct snd_usb_audio *chip,
> +					struct usb_host_interface *alts)
> +{
> +	struct usb_host_endpoint *ep = &alts->endpoint[0];
> +	unsigned int max_bytes = usb_endpoint_maxp(&ep->desc);
> +
> +	/* SuperSpeed isoc endpoints have up to 16 bursts of up to 3 packets each */
> +	if (snd_usb_get_speed(chip->dev) >= USB_SPEED_SUPER) {
> +		int burst = 1 + ep->ss_ep_comp.bMaxBurst;
> +		int mult = USB_SS_MULT(ep->ss_ep_comp.bmAttributes);
> +		max_bytes *= burst;
> +		max_bytes *= mult;
> +	}
> +
> +	if (snd_usb_get_speed(chip->dev) == USB_SPEED_SUPER_PLUS &&
> +		USB_SS_SSP_ISOC_COMP(ep->ss_ep_comp.bmAttributes)) {
> +		max_bytes = le32_to_cpu(ep->ssp_isoc_ep_comp.dwBytesPerInterval);
> +	}
> +
> +	/* High speed, 1-3 packets/uframe, max 6 for eUSB2 double bw */
> +	if (snd_usb_get_speed(chip->dev) == USB_SPEED_HIGH) {
> +		if (usb_endpoint_is_hs_isoc_double(chip->dev, ep))
> +			max_bytes = le32_to_cpu(ep->eusb2_isoc_ep_comp.dwBytesPerInterval);
> +		else
> +			max_bytes *= usb_endpoint_maxp_mult(&ep->desc);
> +	}
> +
> +	return max_bytes;
> +}
> +
>  static struct audioformat *
>  audio_format_alloc_init(struct snd_usb_audio *chip,
>  		       struct usb_host_interface *alts,
> @@ -703,11 +734,8 @@ audio_format_alloc_init(struct snd_usb_audio *chip,
>  	fp->ep_attr = get_endpoint(alts, 0)->bmAttributes;
>  	fp->datainterval = snd_usb_parse_datainterval(chip, alts);
>  	fp->protocol = protocol;
> -	fp->maxpacksize = le16_to_cpu(get_endpoint(alts, 0)->wMaxPacketSize);
> +	fp->maxpacksize = snd_usb_max_bytes_per_interval(chip, alts);
>  	fp->channels = num_channels;
> -	if (snd_usb_get_speed(chip->dev) == USB_SPEED_HIGH)
> -		fp->maxpacksize = (((fp->maxpacksize >> 11) & 3) + 1)
> -				* (fp->maxpacksize & 0x7ff);
>  	fp->clock = clock;
>  	INIT_LIST_HEAD(&fp->list);
>  
> -- 
> 2.51.1
> 

