Return-Path: <linux-usb+bounces-31050-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 81395C94F2A
	for <lists+linux-usb@lfdr.de>; Sun, 30 Nov 2025 13:00:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 055253445BC
	for <lists+linux-usb@lfdr.de>; Sun, 30 Nov 2025 12:00:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF88127A10F;
	Sun, 30 Nov 2025 12:00:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H+OncAfe"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85CB3274FF5
	for <linux-usb@vger.kernel.org>; Sun, 30 Nov 2025 12:00:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764504045; cv=none; b=tb/S33lBsLRiCwuyPTAYnV4MuyAmb208Ytc2Wm1lpn5dh9+/jzkvYYh6F7iTqe1uY/pBQ5XQ1jExr90Y/K6S6hRTLOn+/NTiBNReASnPDi4EvZL9NTu1O4Fsn7KzMjWGuunE7KAvABKIa34lSJ9F9RxEHjuf3CaPAdV2JEC8fFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764504045; c=relaxed/simple;
	bh=73FNcG7xLMjAeZlzIWEfiHhXXTSyNcXQzcUEzorqbGU=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rhsIc6qinp+kb8pi+Za3gnM/FhXnkbt0ysebJYeVbCk8VIo5krQz/wNQWN4h+S4SM8857lfuI7aiRxHsbPq5mvHi+YkH4kbrvatoOglS1GslHBKxFZeFK9br65ZKH27tkY/jV4JomT7PopobWDHDMrK3Ayn68qfL1IWvJ7y3ED8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H+OncAfe; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-640c1fda178so6209713a12.1
        for <linux-usb@vger.kernel.org>; Sun, 30 Nov 2025 04:00:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764504042; x=1765108842; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bxTMqU5p5Wei/iyGG74Fam+Fx7s6gUxy0sZmJiyIPMg=;
        b=H+OncAfewGVxxMl0TQH+Q3FiLq0CKj8e6Rh/7aiqdtRGzMuDobfFdIizDcClivaGsw
         3IXX77CvVHevOfG6Bcb92mBMwXlsVTN991FLCAoq85SNFVFL1zA1mqP7w7x/KkvVRehH
         qd8jSaPu3RCnQls/4RONqJ1zqI2LvexXrgvpW2Ah1jviOkHtjfFCRInK9NALZXCsCoED
         TsOcYh86KMmqNfn6bqVKx4RZqOA+3P2UGzBmCyNwRPWSC+y78VkboQKZ8Dcencj8D+Nv
         QFVvUEVhF2hXnTWGRLEVpE4MgXK9om4++U82JLZFZY1MYZjbpeHN8KM6Q7UYMNIDin4L
         dyEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764504042; x=1765108842;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bxTMqU5p5Wei/iyGG74Fam+Fx7s6gUxy0sZmJiyIPMg=;
        b=n78cpnWZE4b4cGtdprOjb/9LqiJaozffdlK3KLNK+EDGCsnuYd/eVSrPnjE2dPZivS
         +iroWZ4mVATB/F7bVI9B/c+Kg+qkx1AMFO6DMOHjaKRTZSVrTPT4Owmrhf0X8VPsMA6Y
         0TcNdVvGxUgocP4k6dZrF7+XchL6ZAn7VpS0HeWvVIK2b3VIFmhRQT/5CPax+NsY62b8
         2Ut+YDTAq/xmAVJ+yYu7p2uBZzb2sLQjzfoq4Ptxrp4W6dbZL4OGyO/YI6OFZo0OSOGQ
         rZRP6tvdGHsSeVANcYhO2Roi1Xw1vddmNcv1nJgEl6T0Yp3hqXIRg5ATsWRQzzBSeX76
         07CA==
X-Forwarded-Encrypted: i=1; AJvYcCXboxpOc5/Sa6JGyZhgtTtqv9LmD/V+qta1fcwQIVFVVihgeVGjOhS7VYuB8/I3H0hs+qJYyUdpKH0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxkhGHsgZ95FFPFuv7hZ8UhUkIEcDoHgRd0FKCAAsHGZ0cqadGU
	vezvRRWZZV93/AaFxOtxSORKLnHoE7a0xb1TRLlbP4eGJFT2zCquaknQ
X-Gm-Gg: ASbGncv52yiGoPGNv9h2XDM4ylcmOlQ8qucn5HOtCxl78LAM780cxQPdErXzGd/48Dz
	LIRlPXfwzp3rRz50vHlfoNGjuw12nsxf1FPaqnvDrTHeLW2Qq17OToZOXvIydctkkDOiD4t6LYY
	6SPVj78AvPo/u+P3FZvF0YhsZbcjONOft+r6A9mkUddImm0NQ2Cs/BqZIPbp7T2yxpd5RifoJFl
	Y6acEWM7OVViVAMJLxvTaF6DuJDDT0sOyrbgh6CePjPL2NLJtm5MCgVLNzwhIXs+FhipBZlmGB9
	k3kLan08KFZHS8suvjkqqxV0SEi5bNhirgOkfMGwezFThacyQ5YvRmM8DPwSzRrrjd7FP1BpRgb
	gp0t3Md1E/YwBzrRSM8AwcN05tCJ4nbpgCTVGv7TsjXWYVg0EjgMBS4m21oCHa+Kvi/E4NIgSMI
	WhFSFq/V4o0Obz3QeNqIV4sus=
X-Google-Smtp-Source: AGHT+IGmD4wqdcwyP/+ZbEA+uPqjo8sjESyKIcpRu3gC12Ovpf4jFimdfJOqCl4yhK06zAGAotR+ZA==
X-Received: by 2002:a05:6402:40c4:b0:646:6de:a09f with SMTP id 4fb4d7f45d1cf-64606dea188mr14135061a12.2.1764504041319;
        Sun, 30 Nov 2025 04:00:41 -0800 (PST)
Received: from foxbook (bfg212.neoplus.adsl.tpnet.pl. [83.28.44.212])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-647510360dfsm9443427a12.18.2025.11.30.04.00.39
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Sun, 30 Nov 2025 04:00:40 -0800 (PST)
Date: Sun, 30 Nov 2025 13:00:35 +0100
From: Michal Pecio <michal.pecio@gmail.com>
To: Takashi Iwai <tiwai@suse.de>
Cc: Dylan Robinson <dylan_robinson@motu.com>, linux-sound@vger.kernel.org,
 tiwai@suse.com, perex@perex.cz, linux-usb@vger.kernel.org
Subject: Re: [PATCH] ALSA: usb-audio: Fix max bytes-per-interval calculation
Message-ID: <20251130130035.6f44713e.michal.pecio@gmail.com>
In-Reply-To: <87jyz7dc6k.wl-tiwai@suse.de>
References: <20251124210518.90054-1-dylan_robinson@motu.com>
	<20251129205639.48fdbdf9.michal.pecio@gmail.com>
	<87jyz7dc6k.wl-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sun, 30 Nov 2025 11:53:07 +0100, Takashi Iwai wrote:
> On Sat, 29 Nov 2025 20:56:39 +0100,
> Michal Pecio wrote:
> > 
> > On Mon, 24 Nov 2025 16:05:18 -0500, Dylan Robinson wrote:  
> > > The maxpacksize field in struct audioformat represents the maximum number
> > > of bytes per isochronous interval. The current implementation only
> > > special-cases high-speed endpoints and does not account for the different
> > > computations required for SuperSpeed, SuperSpeedPlus, or eUSB2. As a
> > > result, USB audio class devices operating at these speeds may fail to
> > > stream correctly. The issue was observed on a MOTU 16A (2025) interface,
> > > which requires more than 1024 bytes per interval at SuperSpeed.
> > > 
> > > This patch replaces the existing logic with a helper that computes the
> > > correct maximum bytes-per-interval for all USB speeds, borrowing the logic
> > > used in drivers/usb/core/urb.c.  
> > 
> > Hi,
> > 
> > Since v6.18 we have usb_endpoint_max_periodic_payload(), which looks
> > like the exact function you need. It is already used by uvcvideo and
> > xhci_hcd, the latter being particularly important because it ensures
> > that your endpoints will get the bandwidth allocation you expect.
> > 
> > The copy-pasta in urb.c should probably be cleaned up at this point,
> > but that would be a separate and unrelated patch, of course.  
> 
> Thanks for the information!  So we can clean up a lot with this new
> helper like below.

Yes, something like that.

Note that there is a small gotcha here: Dylan's patch and the original
code, as well as usb_submit_urb(), didn't take wBytesPerInterval into
account, while usb_endpoint_max_periodic_payload() and xhci_hcd do.

Odd SuperSpeed endpoints like those below will now be considered to
have 512B/1536B capacity, not 1KB/2KB. Whether any such UAC devices
exist (mine is UVC) I don't know. My only SuperSpeed UAC device uses
one packet per interval and wMaxPacketSize == wBytesPerInterval.

        wMaxPacketSize     0x0400  1x 1024 bytes
        bInterval               1
        bMaxBurst               0
        wBytesPerInterval     512

        wMaxPacketSize     0x0400  1x 1024 bytes
        bInterval               1
        bMaxBurst               1       /* two packets per interval */
        wBytesPerInterval    1536

I also don't know whether this affects UAC operation in any way, but
it's something to watch out for.

Ignoring wBytesPerInterval wasn't right either, because xhci_hcd would
still reserve wBytesPerInterval bandwidth (as per spec) and URBs which
exceed that could complete with an error.

If a device is found where wBytesPerInterval makes no sense and must be
ignored, it needs to be ignored consistently across the kernel.

> 
> Takashi
> 
> -- 8< --
> From: Takashi Iwai <tiwai@suse.de>
> Subject: [PATCH] ALSA: usb-audio: Simplify with usb_endpoint_max_periodic_payload()
> 
> Recently we received a new helper function,
> usb_endpoint_max_periodic_payload(), for calculating the max packet
> size for periodic transfer.
> 
> Simplify the former open code with the new helper function.
> 
> Fixes: a748e1dbb2df ("ALSA: usb-audio: Fix max bytes-per-interval calculation")
> Suggested-by: Michal Pecio <michal.pecio@gmail.com>
> Signed-off-by: Takashi Iwai <tiwai@suse.de>
> ---
>  sound/usb/stream.c | 34 ++--------------------------------
>  1 file changed, 2 insertions(+), 32 deletions(-)
> 
> diff --git a/sound/usb/stream.c b/sound/usb/stream.c
> index 074a61215de6..ec7d756d78d1 100644
> --- a/sound/usb/stream.c
> +++ b/sound/usb/stream.c
> @@ -684,43 +684,13 @@ snd_usb_find_output_terminal_descriptor(struct usb_host_interface *ctrl_iface,
>  	return NULL;
>  }
>  
> -static unsigned int
> -snd_usb_max_bytes_per_interval(struct snd_usb_audio *chip,
> -					struct usb_host_interface *alts)
> -{
> -	struct usb_host_endpoint *ep = &alts->endpoint[0];
> -	unsigned int max_bytes = usb_endpoint_maxp(&ep->desc);
> -
> -	/* SuperSpeed isoc endpoints have up to 16 bursts of up to 3 packets each */
> -	if (snd_usb_get_speed(chip->dev) >= USB_SPEED_SUPER) {
> -		int burst = 1 + ep->ss_ep_comp.bMaxBurst;
> -		int mult = USB_SS_MULT(ep->ss_ep_comp.bmAttributes);
> -		max_bytes *= burst;
> -		max_bytes *= mult;
> -	}
> -
> -	if (snd_usb_get_speed(chip->dev) == USB_SPEED_SUPER_PLUS &&
> -		USB_SS_SSP_ISOC_COMP(ep->ss_ep_comp.bmAttributes)) {
> -		max_bytes = le32_to_cpu(ep->ssp_isoc_ep_comp.dwBytesPerInterval);
> -	}
> -
> -	/* High speed, 1-3 packets/uframe, max 6 for eUSB2 double bw */
> -	if (snd_usb_get_speed(chip->dev) == USB_SPEED_HIGH) {
> -		if (usb_endpoint_is_hs_isoc_double(chip->dev, ep))
> -			max_bytes = le32_to_cpu(ep->eusb2_isoc_ep_comp.dwBytesPerInterval);
> -		else
> -			max_bytes *= usb_endpoint_maxp_mult(&ep->desc);
> -	}
> -
> -	return max_bytes;
> -}
> -
>  static struct audioformat *
>  audio_format_alloc_init(struct snd_usb_audio *chip,
>  		       struct usb_host_interface *alts,
>  		       int protocol, int iface_no, int altset_idx,
>  		       int altno, int num_channels, int clock)
>  {
> +	struct usb_host_endpoint *ep = &alts->endpoint[0];
>  	struct audioformat *fp;
>  
>  	fp = kzalloc(sizeof(*fp), GFP_KERNEL);
> @@ -734,7 +704,7 @@ audio_format_alloc_init(struct snd_usb_audio *chip,
>  	fp->ep_attr = get_endpoint(alts, 0)->bmAttributes;
>  	fp->datainterval = snd_usb_parse_datainterval(chip, alts);
>  	fp->protocol = protocol;
> -	fp->maxpacksize = snd_usb_max_bytes_per_interval(chip, alts);
> +	fp->maxpacksize = usb_endpoint_max_periodic_payload(chip->dev, ep);
>  	fp->channels = num_channels;
>  	fp->clock = clock;
>  	INIT_LIST_HEAD(&fp->list);
> -- 
> 2.52.0
> 

