Return-Path: <linux-usb+bounces-7103-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 10D43868364
	for <lists+linux-usb@lfdr.de>; Mon, 26 Feb 2024 22:56:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7CB911F24803
	for <lists+linux-usb@lfdr.de>; Mon, 26 Feb 2024 21:56:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2559131E2F;
	Mon, 26 Feb 2024 21:56:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="rtRu16vM"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB400131727
	for <linux-usb@vger.kernel.org>; Mon, 26 Feb 2024 21:56:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708984610; cv=none; b=tUIhWfJ0K30g6IAFep8Dn+w+NqqWnTozMZO7GDCNxXUKrTH3YjuVsIZZ8v303Q/7tjzpGmgnaK5MPlyjBY1I57rf6vWbSEexqPsFfF6O/L+HnwkiKsJhRyGZu+xH+itFCPP348RwlztLRgmV3qO8qE4tuNqVit21p9XjO8nGaeU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708984610; c=relaxed/simple;
	bh=8u2FC3jAwvrF6TPDojQJKao+PCsVs+BnFj6gQL2hy2w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Sv+ompki2kVj8Z2bjZkMmfV8DRqdZD1BB/Q1oDB/wknLrbaPCSnM311q4fqqNVhEb5FsN4x4TWBBtMGji3ISits5gVsT0NjUKo8NowZWgeV2y+cVeNU9n4XzdCPQkQ4Xj+bFbNNPiWLjcYM+WWZBy6WlOBYmSkWJvms1biHpTG0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=rtRu16vM; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-5654ef0c61fso2463a12.0
        for <linux-usb@vger.kernel.org>; Mon, 26 Feb 2024 13:56:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1708984607; x=1709589407; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=azUYynWCdgGcNWjxX8ZZ1okg2QCYfjC5Um2iCEPR9g4=;
        b=rtRu16vMxr4Br2s/krLpxlMa3gUY5w+R0egHVC7ddsFzjFQIJYa6kDxxvB2r9FZ5uY
         E4/P81DN09m1P3m0551nQtaaquRSJvNVLhHkOfaTRKJuCeyXgV81AZ7y/PnOgTLHA/HI
         pD3MgUo5ixURyg83HGl/W74U+870irPHOV11fXp3Tol+CXdkz/e8WrQsF4qTQHscVJOu
         XTRKnicFT9+jLbp/IqOtC9HJrsUQsZrKAbTy7+jzdHY5og0UKXPbmfgRVVp6+WPY9UR2
         uIJLoAfxza0FTbnPJK7aI9o0kqqyb83Pl6Bm78d+yna5WSrOHJGa3rh2Ww25zMGHQyDY
         B0og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708984607; x=1709589407;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=azUYynWCdgGcNWjxX8ZZ1okg2QCYfjC5Um2iCEPR9g4=;
        b=m1rpulRNRE8RKHpcOn6vWe3PKE+QkS/8CkdL2ojwRHns827T/N/AqCVOEgmoVoKfjk
         PrCCGkgJMdnqXB3Y0vuu5TEXWwgmzSgDQ0m0iZwOq8pqYI6sh3f7aEYDYPqfDKKkTTOp
         VUu14eSRnsta5t+74n4ZL42ijXDZGXF2R9R9Y/zGOlCGXt54tZ4grB1ac6sqFpLOB5v0
         V3+ceDzdqHkyJ+kk7t+s0OE7WvHCqLVGRItrXxYKDjO6AvivGbo25vNTX+WjqQsSvNrM
         0x5rQULCMqb+wybpBKPZsaIJ+zJcqZxNDDMO90g26fmASu90VFxhAbcVQXXXbsemzUVy
         7xgA==
X-Forwarded-Encrypted: i=1; AJvYcCVfnsDumtfFruvCm8sLA8nQ3PSrhs0JKRZZJm33lltgVEVf8dCxwAyEnXvTigWGjdQ6IBEgDTwiaU7ZfBQqAhbVVpG8EvDEwsjz
X-Gm-Message-State: AOJu0YxYGA5hgph3b3Vn4pmXM8giJtGIl5Ofv0a2n05HhgMRPc895tya
	h1xDl14svW+YHJK9q7gDZFYMU6qrUQ2ZEWVfW6LT93BmJDBWHbHUOKoPgbExquG9F+sJQok8K7c
	N1lLvj2zrA55fa1stB20f0GQQgCKs/VGNX7UTx2aI0E+Lo2+GYa57
X-Google-Smtp-Source: AGHT+IFi3ylAsCIsvdv/4W6+maO7OqFdyJK2LjzRb/kVlH1D+Q89qTQR6aA+BoWJaN4QVWomh07SqDONCGS3/cNvlWI=
X-Received: by 2002:a50:9e2a:0:b0:565:ad42:b97d with SMTP id
 z39-20020a509e2a000000b00565ad42b97dmr89705ede.0.1708984606786; Mon, 26 Feb
 2024 13:56:46 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240226112816.2616719-1-quic_kriskura@quicinc.com>
In-Reply-To: <20240226112816.2616719-1-quic_kriskura@quicinc.com>
From: =?UTF-8?Q?Maciej_=C5=BBenczykowski?= <maze@google.com>
Date: Mon, 26 Feb 2024 13:56:30 -0800
Message-ID: <CANP3RGf7qsuwcgVpmOoH0QNh-v4PjRh_xj7Rcz=YJ1TbGiPK0Q@mail.gmail.com>
Subject: Re: [RFC PATCH] usb: gadget: ncm: Fix handling of zero block length packets
To: Krishna Kurapati <quic_kriskura@quicinc.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org, quic_ppratap@quicinc.com, 
	quic_wcheng@quicinc.com, quic_jackp@quicinc.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 26, 2024 at 3:28=E2=80=AFAM Krishna Kurapati
<quic_kriskura@quicinc.com> wrote:
>
> While connecting to a Linux host with CDC_NCM_NTB_DEF_SIZE_TX
> set to 65536, it has been observed that we receive short packets,
> which come at interval of 5-10 seconds sometimes and have block
> length zero but still contain 1-2 valid datagrams present.
>
> According to the NCM spec:
>
> "If wBlockLength =3D 0x0000, the block is terminated by a
> short packet. In this case, the USB transfer must still
> be shorter than dwNtbInMaxSize or dwNtbOutMaxSize. If
> exactly dwNtbInMaxSize or dwNtbOutMaxSize bytes are sent,
> and the size is a multiple of wMaxPacketSize for the
> given pipe, then no ZLP shall be sent.
>
> wBlockLength=3D 0x0000 must be used with extreme care, because
> of the possibility that the host and device may get out of
> sync, and because of test issues.
>
> wBlockLength =3D 0x0000 allows the sender to reduce latency by
> starting to send a very large NTB, and then shortening it when
> the sender discovers that there=E2=80=99s not sufficient data to justify
> sending a large NTB"
>
> However, there is a potential issue with the current implementation,
> as it checks for the occurrence of multiple NTBs in a single
> giveback by verifying if the leftover bytes to be processed is zero
> or not. If the block length reads zero, we would process the same
> NTB infintely because the leftover bytes is never zero and it leads
> to a crash. Fix this by bailing out if block length reads zero.
>
> Fixes: 427694cfaafa ("usb: gadget: ncm: Handle decoding of multiple NTB's=
 in unwrap call")
> Signed-off-by: Krishna Kurapati <quic_kriskura@quicinc.com>
> ---
>
> PS: Although this issue was seen after CDC_NCM_NTB_DEF_SIZE_TX
> was modified to 64K on host side, I still believe this
> can come up at any time as per the spec. Also I assumed
> that the giveback where block length is zero, has only
> one NTB and not multiple ones.
>
>  drivers/usb/gadget/function/f_ncm.c | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/drivers/usb/gadget/function/f_ncm.c b/drivers/usb/gadget/fun=
ction/f_ncm.c
> index e2a059cfda2c..355e370e5140 100644
> --- a/drivers/usb/gadget/function/f_ncm.c
> +++ b/drivers/usb/gadget/function/f_ncm.c
> @@ -1337,6 +1337,9 @@ static int ncm_unwrap_ntb(struct gether *port,
>         VDBG(port->func.config->cdev,
>              "Parsed NTB with %d frames\n", dgram_counter);
>
> +       if (block_len =3D=3D 0)
> +               goto done;
> +
>         to_process -=3D block_len;
>
>         /*
> @@ -1351,6 +1354,7 @@ static int ncm_unwrap_ntb(struct gether *port,
>                 goto parse_ntb;
>         }
>
> +done:
>         dev_consume_skb_any(skb);
>
>         return 0;
> --
> 2.34.1
>

In general this is of course fine (though see Greg's auto-complaint).

I haven't thought too much about this, but I just wonder whether the
check for block_len =3D=3D 0
shouldn't be just after block_len is read, ie. somewhere just after:

block_len =3D get_ncm(&tmp, opts->block_length);

as it is kind of weird to be handling block_len =3D=3D 0 at the point where
you are already theoretically done processing the block...

I guess, as is, this assumes the block isn't actually of length 0,
since there's a bunch of following get_ncm() calls...
Are those guaranteed to be valid?

I guess I don't actually see the infinite loop with block_len =3D=3D 0,
since get_ncm() always moves us forward...

Maybe your patch *is* correct as is, and you just need a comment
explaining *why* block_len =3D=3D 0 is terminal at the spot you're adding t=
he check.

Also couldn't you fix this without goto, by changing

  } else if (to_process > 0) {
to
  } else if (to_process && block_len) {
    // See NCM spec.  zero block_len means short packet.

--
Maciej =C5=BBenczykowski, Kernel Networking Developer @ Google

