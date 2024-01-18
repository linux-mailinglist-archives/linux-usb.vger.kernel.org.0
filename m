Return-Path: <linux-usb+bounces-5235-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3657E831F19
	for <lists+linux-usb@lfdr.de>; Thu, 18 Jan 2024 19:31:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D80D928BAAF
	for <lists+linux-usb@lfdr.de>; Thu, 18 Jan 2024 18:31:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D25F42D7A2;
	Thu, 18 Jan 2024 18:31:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="dPZfdoD4"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D108D2D63E
	for <linux-usb@vger.kernel.org>; Thu, 18 Jan 2024 18:31:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705602668; cv=none; b=gyt+mEhDhpThq8x0tA9rUNdcpUPAzMLyu26B1E9KudPQcXa0iQ6uhkB3L4yQ4+liMFSND7nJVFkkNv+02llKbxIiDTKD4IgPV8pAOg2ly/NO+SrOJs/M98yIINJb86cubG3+p2zFdbJK5osfG8ps1BkNuqQPUMPN2V/q1+TtUJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705602668; c=relaxed/simple;
	bh=YsIlkMkHV5F76M0Xv6Opp+8mNktR56PhE/rfREYHALI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=e23+1aXoxe+TDrZ3VgO74f1SKuA/0uVMkqfzGL93s5eG88W/TTWYXmMhzVNQkYAU0mRKgrMBEjuvglt+U/2MalQyx+pMebko23oV7mdU0R/GIXk0E2nSRSpgt8zhHgoItkLq1ynOKlFuGXxhNFEkyIerpCImaMABEjXWDKH1nV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=dPZfdoD4; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-559f5db8f58so911a12.1
        for <linux-usb@vger.kernel.org>; Thu, 18 Jan 2024 10:31:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1705602665; x=1706207465; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WDzpumPQTxLkJQG+gluRd+YfgW50dew9HQQAlqRxvPI=;
        b=dPZfdoD4xjIGRLOFcTEUZx7aPCd/WkIEwQA8EmPIwZNhVUomoV2CUG/Qu+UvGjoD+8
         qRTJUC+FtiZsTCj40f+Ybi/LSiwraYff1iH/BVJQVR0O3uKm74asGwEr6GVupEANSNul
         GnFlXbhFfnLcpqMAUcV+IX7i5ZlHuiIlE2wnoQYIKaH/tiISJgrsfFFggd9PteMBJl4Q
         otJlrda/8Fm5VOxvORNCi2Flx0RFRKf/lNaYiw6SRTJMN7nD9y7vjn9FdPX9wHlMZvua
         kM5L/cZdhK5yLMGC42xYH5skTOew5RSQgsy9+Pcmm0nk4RHMn8uE9iaMAtvl6M+lLlYa
         doWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705602665; x=1706207465;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WDzpumPQTxLkJQG+gluRd+YfgW50dew9HQQAlqRxvPI=;
        b=tAN9sUnP7oiCgId2bcvfy7ILvk3vOddBEbS8K/7xDnTL6oPyyMa1A3pDkgExS8B8Mf
         iKsjZ27fuwMldslgoMTzvEDhaEbbaCtx45i7V5Ps3C81t6nW36To8bPkpsUwVI7fZ5du
         oaXqX0AC31ex/1O9g5qR5/93RTDbRHYQXmc30wXVQ/XosGu9QG4KrA1npC+hChyNSaf3
         QhEWc0NRyIMjy+kdZOqqO9CiadVQ/doBiPfiOBWnsS7uHW/a2VbNvovsSbc2ozHFO1f5
         9ARgt/fq8veKTtrONDlASL3LmCFznyyrXPv3LVgCLPe8Pq+dNBx63ewl2rlrHVyMPbzF
         QlBg==
X-Gm-Message-State: AOJu0YxACI9Obft8rnvJthmBppy6q/OwuEvppwfO82T/G/80zpgVYfIT
	MWSYTyqOf5mS0Df89Y/ktclSxYZCqcEofmPTQxwsMoymMOXP225NHCW5nZRUu+kThaVcD6VKwnr
	DIUpdo6grDaJv+zAlqDEIWAOYeN08neej4mz75WdAhWJvNSoW/A==
X-Google-Smtp-Source: AGHT+IGTyXCLkCwzv91SQLJo8H1vilTaHcuH6H1HwaYMWwM9HiuPHyBE1pEgjVEFvDaXFEHXUCUkZurdjE3oRuDyd8M=
X-Received: by 2002:a05:6402:3127:b0:55a:465a:45a5 with SMTP id
 dd7-20020a056402312700b0055a465a45a5mr1236edb.4.1705602664882; Thu, 18 Jan
 2024 10:31:04 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240118154910.8765-1-quic_kriskura@quicinc.com>
In-Reply-To: <20240118154910.8765-1-quic_kriskura@quicinc.com>
From: =?UTF-8?Q?Maciej_=C5=BBenczykowski?= <maze@google.com>
Date: Thu, 18 Jan 2024 10:30:53 -0800
Message-ID: <CANP3RGePrcwQkmqrG0rkNH79tyXP-W6J=xnCGvWK6G2OPfa6iA@mail.gmail.com>
Subject: Re: [PATCH] usb: gadget: ncm: Fix endianness of wMaxSegmentSize
 variable in ecm_desc
To: Krishna Kurapati <quic_kriskura@quicinc.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Hardik Gajjar <hgajjar@de.adit-jv.com>, 
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
	quic_ppratap@quicinc.com, quic_wcheng@quicinc.com, quic_jackp@quicinc.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 18, 2024 at 7:49=E2=80=AFAM Krishna Kurapati
<quic_kriskura@quicinc.com> wrote:
>
> Recent commit [1] added support for changing max segment size of the NCM
> interface via configfs. But the value of segment size value stored in
> ncm_opts need to be converted to little endian before saving it in
> ecm_desc. Also while initialising the value of segment size in opts durin=
g
> instance allocation, the value ETH_FRAME_LEN needs to be assigned directl=
y
> without any conversion as ETH_FRAME_LEN and the variable max_segment_size
> are native endian. The current implementaion modifies it into little endi=
an
> thus breaking things for big endian targets.
>
> Fix endianness while assigning these variables.
> While at it, fix up some stray spaces in comments added in code.
>
> [1]: https://lore.kernel.org/all/20231221153216.18657-1-quic_kriskura@qui=
cinc.com/
>
> Fixes: 1900daeefd3e ("usb: gadget: ncm: Add support to update wMaxSegment=
Size via configfs")
> Signed-off-by: Krishna Kurapati <quic_kriskura@quicinc.com>
> ---
> Since the patch was tested on ARM based QC devices, no issues were seen
> as these devices were little endian. Thanks to Maciej =C5=BBenczykowski f=
or
> pointing it out offline over ACK that the patch breaks functionality for
> big endian devices.
>
>  drivers/usb/gadget/function/f_ncm.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/usb/gadget/function/f_ncm.c b/drivers/usb/gadget/fun=
ction/f_ncm.c
> index a1575a0ca568..ca5d5f564998 100644
> --- a/drivers/usb/gadget/function/f_ncm.c
> +++ b/drivers/usb/gadget/function/f_ncm.c
> @@ -105,8 +105,8 @@ static inline struct f_ncm *func_to_ncm(struct usb_fu=
nction *f)
>
>  /*
>   * Although max mtu as dictated by u_ether is 15412 bytes, setting
> - * max_segment_sizeto 15426 would not be efficient. If user chooses segm=
ent
> - * size to be (>=3D 8192), then we can't aggregate more than one  buffer=
 in each
> + * max_segment_size to 15426 would not be efficient. If user chooses seg=
ment
> + * size to be (>=3D 8192), then we can't aggregate more than one buffer =
in each
>   * NTB (assuming each packet coming from network layer is >=3D 8192 byte=
s) as ep
>   * maxpacket limit is 16384. So let max_segment_size be limited to 8000 =
to allow
>   * at least 2 packets to be aggregated reducing wastage of NTB buffer sp=
ace
> @@ -1489,7 +1489,7 @@ static int ncm_bind(struct usb_configuration *c, st=
ruct usb_function *f)
>         ncm_data_intf.bInterfaceNumber =3D status;
>         ncm_union_desc.bSlaveInterface0 =3D status;
>
> -       ecm_desc.wMaxSegmentSize =3D ncm_opts->max_segment_size;
> +       ecm_desc.wMaxSegmentSize =3D cpu_to_le16(ncm_opts->max_segment_si=
ze);
>
>         status =3D -ENODEV;
>
> @@ -1685,7 +1685,7 @@ static struct usb_function_instance *ncm_alloc_inst=
(void)
>                 kfree(opts);
>                 return ERR_CAST(net);
>         }
> -       opts->max_segment_size =3D cpu_to_le16(ETH_FRAME_LEN);
> +       opts->max_segment_size =3D ETH_FRAME_LEN;
>         INIT_LIST_HEAD(&opts->ncm_os_desc.ext_prop);
>
>         descs[0] =3D &opts->ncm_os_desc;
> --
> 2.42.0
>
Reviewed-by: Maciej =C5=BBenczykowski <maze@google.com>

