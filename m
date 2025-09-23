Return-Path: <linux-usb+bounces-28502-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 43027B94066
	for <lists+linux-usb@lfdr.de>; Tue, 23 Sep 2025 04:40:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CD5EE3B14FC
	for <lists+linux-usb@lfdr.de>; Tue, 23 Sep 2025 02:40:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4222A2580ED;
	Tue, 23 Sep 2025 02:40:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="hvblbB1a"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qv1-f68.google.com (mail-qv1-f68.google.com [209.85.219.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16244270ED9
	for <linux-usb@vger.kernel.org>; Tue, 23 Sep 2025 02:40:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758595219; cv=none; b=q1FzfMTrY0PlLMYco/miuvB5NT+CuY6DMugTRuN2B7dme8Q27A31Ztc6CgnCyDCqQYiZbqnw5z9MQLA99zs9VrMJ35rozYa3AtBQLRK6aN5mDsTAiIRprCZAWScov2TwxeAbrxKG09lF9wmEpAH0vLyWTuUOZDbM5N+Jkk8wu3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758595219; c=relaxed/simple;
	bh=vfDfTsyYfO/BqRmTkPgyem+KWINdSwj36PIiWxhUsjI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uBjC7vS/vulBPjhpLCorM7009g4xbRDmcDQ0q/pDgdeL0aohr5Y7Nx66/lQOmTBn7BvOL7SD107zXAf3V4XYutoAe0F2Go3dN+vq+d8TZ9NKL7jZqmf6jx6pEGnArjXs5Z2bWJ7+q0soM1JHKm2JU96Al8o7FijojEnvx2m6fsw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=hvblbB1a; arc=none smtp.client-ip=209.85.219.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qv1-f68.google.com with SMTP id 6a1803df08f44-78ed682e9d3so45526076d6.0
        for <linux-usb@vger.kernel.org>; Mon, 22 Sep 2025 19:40:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1758595217; x=1759200017; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/vUgX58DsyU0+b3vhwK7OifvnksHmZK93Xb99v2Xcmk=;
        b=hvblbB1aHbYpfkTioQWGBNaezDoFfL78O+2hNuAM7fgTAqQ9p0liDGsgLSE5f6pxDf
         lrQePrdDX7KNAuKlvFa2LmDXfcWn9uTNfbCCV8tbDOOdcpy/7YBc5r0JeOSFn3/x405e
         +PAENKI5W1ZAe9C3YD6/TRBU5J/mgz3dNAOXJoS4EHTrqgkxUV7T1qazl1B0XzJ8xANM
         +9lB7J2tWovOX3SGTnojZmIfbKcjviDOPcJvNf48kQXMmJEBdBnXNYOvOfIpcDAkUVIu
         5gZw6WQ6tMHMyYMLTGl10UBFxu6XnatTeZnWKGfO2PqEJotoDn13FuPuT2Sq99HHGc7d
         xg8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758595217; x=1759200017;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/vUgX58DsyU0+b3vhwK7OifvnksHmZK93Xb99v2Xcmk=;
        b=Mb4niXvy5ipyUsMKN1AwgVEj0zbhyDrVYryt293/MSSf8KmvRAvXgCk+rBw5CepmJW
         TZ50aUXOUxqMMIA2kI+l/tZbVVTWkSwRxlpWbfCbb8QFIgxBTcsMp1UxtFt8SrNaC9tI
         w91Wb4FcDUDaEq9aEpqwuvOpJSPDADu/oYFx5tFS49Wz4RosXSe/UW3LCWEE7FIyRm0z
         jd2zcQzTjRxwwWlkFbRZASNe5qBfk4VEmeqs4nTl9IMwoEOygO4ffLqati0uSdKs1TXI
         rfj1H7e3yvjGNLwgEqav32u01QJYd1yhEk99vDBqbhePxpVt61E8RJcCPJSxcPyBmM1M
         2UlA==
X-Forwarded-Encrypted: i=1; AJvYcCVHw6lhpctCBpyVeW4UhTBYr1IGH59yFXBFYhFwl5y//kJiNa9N2v5L3JrIFZOkDg3VLZzbtd+/QGE=@vger.kernel.org
X-Gm-Message-State: AOJu0YyQEBkJQJFUprenrIpIMQB0oigcsrQRmfl3Hjovk5LYcDzh5Zzq
	hT3I45J5Vi3fGLlRZUHAdUR/a78w50Z8NCc6M4xSZ9e9VItiRpf7o8ur2kb038YEhQ==
X-Gm-Gg: ASbGncuOj/fLbugXWVrJBufsdCB8l1z6Q8wU8tN07RiK4lhzIr65bpxdhJKWTHWepj6
	6T/6zT7kEwe/eJG+kpoDaNHt/RkITlEnlRmJ/ARv0g6g2Qazz80CBwfihSzaRZn9qP60DqFBm1N
	tHllpGCZt/kdeoG61XjfAGaTXeJaraELSG1CdIODo/UkrwL6i49CxIIBm5z5r5aX3FVwxdxSLOa
	PQu/xPaLODZiKS4uTCYaNZG40mLw616AtaAIQLMGNufRbshxZWjuRxVBpiMoidmoDn/+Th+PDc4
	iO7je19gNMAsHoWAROXypBpRx8X/A+R6jb3TkC+XnfZUFXj1qJJeeABVbtxO9RAJa7JI1Qd7Pn+
	DEGI9lirhBdCcrn059Wi+v9zf
X-Google-Smtp-Source: AGHT+IE73YLWqjqtgU0vcQHw7OetClT9gbbbQMHH5iy0VtyUCNnwXencpMLyHRicslxwC75Z7qt/Ug==
X-Received: by 2002:a05:6214:20c1:b0:790:3b37:8ec6 with SMTP id 6a1803df08f44-7e6ffea2284mr11149416d6.13.1758595216848;
        Mon, 22 Sep 2025 19:40:16 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:d03:1700::5082])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-849c03c1531sm304190185a.29.2025.09.22.19.40.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Sep 2025 19:40:15 -0700 (PDT)
Date: Mon, 22 Sep 2025 22:40:13 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Brahmajit Das <listout@listout.xyz>
Cc: syzbot+f02665daa2abeef4a947@syzkaller.appspotmail.com,
	clemens@ladisch.de, linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org, linux-usb@vger.kernel.org,
	perex@perex.cz, syzkaller-bugs@googlegroups.com, tiwai@suse.com
Subject: Re: [PATCH 1/1] ALSA: usb-audio: Avoid NULL dereference in
 snd_usbmidi_do_output()
Message-ID: <43ab3d0e-4b56-4292-aa51-2473e766dca5@rowland.harvard.edu>
References: <68d17f44.050a0220.13cd81.05b7.GAE@google.com>
 <20250922231720.3603805-1-listout@listout.xyz>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250922231720.3603805-1-listout@listout.xyz>

On Tue, Sep 23, 2025 at 04:47:20AM +0530, Brahmajit Das wrote:
> Syzkaller reported a general protection fault in snd_usbmidi_do_output(),
> caused by dereferencing a NULL URB pointer when accessing
> ep->urbs[urb_index].urb.
> 
> This can happen in rare race conditions where the URB was not initialized
> or was already freed (e.g. during disconnect or after errors), and the
> output timer or other path tries to reuse it.
> 
> Fix this by checking if the URB is NULL before accessing it, and skipping
> the current slot if it is.
> 
> Reported-by: syzbot+f02665daa2abeef4a947@syzkaller.appspotmail.com
> Link: https://syzkaller.appspot.com/bug?extid=f02665daa2abeef4a947
> 
> Signed-off-by: Brahmajit Das <listout@listout.xyz>
> ---
>  sound/usb/midi.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/sound/usb/midi.c b/sound/usb/midi.c
> index acb3bf92857c..7919a39decb4 100644
> --- a/sound/usb/midi.c
> +++ b/sound/usb/midi.c
> @@ -307,6 +307,10 @@ static void snd_usbmidi_do_output(struct snd_usb_midi_out_endpoint *ep)
>  	for (;;) {
>  		if (!(ep->active_urbs & (1 << urb_index))) {
>  			urb = ep->urbs[urb_index].urb;
> +			if (!urb) {
> +				// Skip this urb
> +				goto next_urb;
> +			}

What prevents the URB from being freed right here?  If this happens, 
the code below would access memory that was deallocated.

To prevent races, you have to use some sort of lock or other 
synchronization mechanism.  A simple test won't work.

Alan Stern

>  			urb->transfer_buffer_length = 0;
>  			ep->umidi->usb_protocol_ops->output(ep, urb);
>  			if (urb->transfer_buffer_length == 0)
> @@ -319,6 +323,7 @@ static void snd_usbmidi_do_output(struct snd_usb_midi_out_endpoint *ep)
>  				break;
>  			ep->active_urbs |= 1 << urb_index;
>  		}
> +next_urb:
>  		if (++urb_index >= OUTPUT_URBS)
>  			urb_index = 0;
>  		if (urb_index == ep->next_urb)
> -- 
> 2.51.0

