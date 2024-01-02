Return-Path: <linux-usb+bounces-4623-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 057A18219DD
	for <lists+linux-usb@lfdr.de>; Tue,  2 Jan 2024 11:32:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1D8501C21BE7
	for <lists+linux-usb@lfdr.de>; Tue,  2 Jan 2024 10:32:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2EFA7DDA6;
	Tue,  2 Jan 2024 10:32:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Rv7lsR1g"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06192D26A
	for <linux-usb@vger.kernel.org>; Tue,  2 Jan 2024 10:32:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-553e36acfbaso97138a12.0
        for <linux-usb@vger.kernel.org>; Tue, 02 Jan 2024 02:32:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1704191551; x=1704796351; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HSbiLYKQuNUg3Symi8jeoNTl6wqkNimVRtpbCFf2qgI=;
        b=Rv7lsR1gG62julUQaGsQtGLRYqM/3EZgQYuKJlYIvxyIfbFCKExpu0C0dPKH9Za3Ka
         lBlBfbxVCRccmc+QwclZU8VwraK5b4hjSJ90LCltnPMt0ePsIYn7jrvR9YfBJipfDPFM
         F8f4KGeDfGETvNtirtVdB6eDopuToHgMAIU7PGwDyYOWHBnfe3z2GlsDiRtEf1sXP2O2
         CCBUDRmJtmt0xkGcXxYDqnwvJgTlD4N3sn+MiY1ohlZKzRCbJImncb7Mfp6wQBv/+xoT
         wPQivSzKaFPo6CfcCOzAN9QpP6jxMGnQ5/4oU7b72dXXrPHNd4o/N2jgomZGccukp/GH
         G1rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704191551; x=1704796351;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HSbiLYKQuNUg3Symi8jeoNTl6wqkNimVRtpbCFf2qgI=;
        b=QtOf79IBz0cN7yVsFmkqZsaRhrKp1n9A2vmHnrn7yYQvomUGeMTdarlyEVB5QwXnqk
         zpm+M3uwGxO5whHy8OpScVgKYaHH1d1VGUSiku0XeBSG+KPa7BHCNa0LGSP30zVJYIoc
         4KgqiYeSzbz9djwvU2UhRa0FyKDxqw/GyYBsUSB2PkTVqrtvzUeqvoCnG0OsdZT0m/Kh
         Zy7Ke3P4nXCXAOUVpoYDqjwymuNppr0gSmCts5dF3/jMGLe2Q5OvtGAQAPO5o68C5xk6
         c7hvnRf/Mb/DWKq4BHU+HQYTligJkToB4xhwFOI92iSAONCTwWa7Svd0lbCNYwrpEWlw
         rs8A==
X-Gm-Message-State: AOJu0YxBQaPSt9RTNRK4HIX5w2RQmxRQkcuPNEygB3lh9XtP1+Y0Bdhf
	RduBHkkplnlMouJtIVkJISkkw9dIqkY/Aey95mgtWnLdTlvW22a0mWuSSfIasQ==
X-Google-Smtp-Source: AGHT+IEHJ050ZkVyFQMuNNxFerFqoPsTBz0VjtbcI0vImsZMCNKZCem3K80QxcV7thIIOXPTtSorSvAixgle/z3oK20=
X-Received: by 2002:a50:9b51:0:b0:554:1b1c:72c4 with SMTP id
 a17-20020a509b51000000b005541b1c72c4mr646520edj.1.1704191551125; Tue, 02 Jan
 2024 02:32:31 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240102055143.3889-1-quic_kriskura@quicinc.com>
In-Reply-To: <20240102055143.3889-1-quic_kriskura@quicinc.com>
From: =?UTF-8?Q?Maciej_=C5=BBenczykowski?= <maze@google.com>
Date: Tue, 2 Jan 2024 02:32:16 -0800
Message-ID: <CANP3RGeirg+f8cBbw_3YR5AvuB1ZxJC_9-wcn+Tb-GXf1ESKCQ@mail.gmail.com>
Subject: Re: [PATCH] usb: gadget: ncm: Avoid dropping datagrams of properly
 parsed NTBs
To: Krishna Kurapati <quic_kriskura@quicinc.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Hardik Gajjar <hgajjar@de.adit-jv.com>, 
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
	quic_ppratap@quicinc.com, quic_wcheng@quicinc.com, quic_jackp@quicinc.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

en

On Mon, Jan 1, 2024 at 9:52=E2=80=AFPM Krishna Kurapati
<quic_kriskura@quicinc.com> wrote:
>
> It is observed sometimes when tethering is used over NCM with Windows 11
> as host, at some instances, the gadget_giveback has one byte appended at
> the end of a proper NTB. When the NTB is parsed, unwrap call looks for
> any leftover bytes in SKB provided by u_ether and if there are any pendin=
g
> bytes, it treats them as a separate NTB and parses it. But in case the
> second NTB (as per unwrap call) is faulty/corrupt, all the datagrams that
> were parsed properly in the first NTB and saved in rx_list are dropped.

I think this is likely Windows trying to avoid generating 0 length frames.

(usb max single datagram [frame?] size is 1024 bytes).

My guess is this extra byte will only ever happen at the end of a
multiple of 1024 bytes,
and it will always be exactly one byte, and it will likely be a '0' pad byt=
e.

Could you check if a more specific test of this sort would make sense?
(ie. fix the problem)

Something like

if (to_process =3D=3D 1) && (current_offset & 1023 =3D=3D 0) && (*payload =
=3D=3D 0)
  // extra 1 zero byte pad to prevent multiple of 1024 sized packet
  return
}

It seems a little dangerous to just blindly ignore arbitrary amounts
of trailing garbage...

>
> Adding a few custom traces showed the following:
>
> [002] d..1  7828.532866: dwc3_gadget_giveback: ep1out:
> req 000000003868811a length 1025/16384 zsI =3D=3D> 0
> [002] d..1  7828.532867: ncm_unwrap_ntb: K: ncm_unwrap_ntb toprocess: 102=
5
> [002] d..1  7828.532867: ncm_unwrap_ntb: K: ncm_unwrap_ntb nth: 175199934=
2
> [002] d..1  7828.532868: ncm_unwrap_ntb: K: ncm_unwrap_ntb seq: 0xce67
> [002] d..1  7828.532868: ncm_unwrap_ntb: K: ncm_unwrap_ntb blk_len: 0x400
> [002] d..1  7828.532868: ncm_unwrap_ntb: K: ncm_unwrap_ntb ndp_len: 0x10
> [002] d..1  7828.532869: ncm_unwrap_ntb: K: Parsed NTB with 1 frames
>
> In this case, the giveback is of 1025 bytes and block length is 1024.
> The rest 1 byte (which is 0x00) won't be parsed resulting in drop of
> all datagrams in rx_list.
>
> Same is case with packets of size 2048:
> [002] d..1  7828.557948: dwc3_gadget_giveback: ep1out:
> req 0000000011dfd96e length 2049/16384 zsI =3D=3D> 0
> [002] d..1  7828.557949: ncm_unwrap_ntb: K: ncm_unwrap_ntb nth: 175199934=
2
> [002] d..1  7828.557950: ncm_unwrap_ntb: K: ncm_unwrap_ntb blk_len: 0x800
>
> Lecroy shows one byte coming in extra confirming that the byte is coming
> in from PC:
>
> Transfer 2959 - Bytes Transferred(1025)  Timestamp((18.524 843 590)
> - Transaction 8391 - Data(1025 bytes) Timestamp(18.524 843 590)
> --- Packet 4063861
>       Data(1024 bytes)
>       Duration(2.117us) Idle(14.700ns) Timestamp(18.524 843 590)
> --- Packet 4063863
>       Data(1 byte)
>       Duration(66.160ns) Time(282.000ns) Timestamp(18.524 845 722)
>
> Fix this by checking if the leftover bytes before parsing next NTB is of
> size more than the expected header.
>
> Fixes: 427694cfaafa ("usb: gadget: ncm: Handle decoding of multiple NTB's=
 in unwrap call")
> Signed-off-by: Krishna Kurapati <quic_kriskura@quicinc.com>
> ---
> There could probably be cases where the first NTB is proper and the secon=
d
> NTB's header is proper but the NDP is corrupt, and in those cases too, al=
l
> the datagrams are dropped. But I haven't seen such case practically.
>
>  drivers/usb/gadget/function/f_ncm.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/usb/gadget/function/f_ncm.c b/drivers/usb/gadget/fun=
ction/f_ncm.c
> index cc0ed29a4adc..a75b6dc8b0cb 100644
> --- a/drivers/usb/gadget/function/f_ncm.c
> +++ b/drivers/usb/gadget/function/f_ncm.c
> @@ -1325,7 +1325,7 @@ static int ncm_unwrap_ntb(struct gether *port,
>              "Parsed NTB with %d frames\n", dgram_counter);
>
>         to_process -=3D block_len;
> -       if (to_process !=3D 0) {
> +       if (to_process > opts->nth_size) {

shouldn't this check actually be >=3D not > ?

>                 ntb_ptr =3D (unsigned char *)(ntb_ptr + block_len);
>                 goto parse_ntb;
>         }
> --
> 2.42.0
>


--
Maciej =C5=BBenczykowski, Kernel Networking Developer @ Google

