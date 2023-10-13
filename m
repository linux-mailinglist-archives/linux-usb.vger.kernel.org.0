Return-Path: <linux-usb+bounces-1602-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D4697C8D2F
	for <lists+linux-usb@lfdr.de>; Fri, 13 Oct 2023 20:39:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B81A6B20BE1
	for <lists+linux-usb@lfdr.de>; Fri, 13 Oct 2023 18:39:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EAFC9134CD;
	Fri, 13 Oct 2023 18:39:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="bV7bkn3z"
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 850B517980
	for <linux-usb@vger.kernel.org>; Fri, 13 Oct 2023 18:39:31 +0000 (UTC)
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BD56BCE
	for <linux-usb@vger.kernel.org>; Fri, 13 Oct 2023 11:39:29 -0700 (PDT)
Received: by mail-ed1-x533.google.com with SMTP id 4fb4d7f45d1cf-51e24210395so1928a12.0
        for <linux-usb@vger.kernel.org>; Fri, 13 Oct 2023 11:39:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1697222368; x=1697827168; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q2ohtkcvpEvo61Q68fjCDCwlB06zwFzfj4hgniJlyos=;
        b=bV7bkn3zxjUWqct4XFwbZ7Vpq8RtE+2stYHDshrwtA72XFDma4rBdOLGPyOkhVLPJj
         yeCzyiEUJhN4Z9s3AbVGHIBDMyWnIrOyE7bpUjFOWJxUfzWQkX0a4LC5QuOLFkBbqJNW
         wHxUmoJJ5PsYEOFpVo1m3KdyFj5EvQMvQuTL5H88s6OLmQhYfjsRBRcTPko+SaIWhxS5
         Is2Ehzw9rBrP1iFEMTntuaCisp1Yx4JrBfpdORilXDkbF1bQLp8qR3kXTuBw0Hnnxz1u
         +HJ95vbbIyidkpk7B0p8G1kCfixTG2r2k5/9vF4De/V7NC9B4D9JztAlswnAxnpxZ3HR
         4I3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697222368; x=1697827168;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=q2ohtkcvpEvo61Q68fjCDCwlB06zwFzfj4hgniJlyos=;
        b=HEI00mcGGxXmrkO2Uq5aoRidH5F8zsipe7kKaNSDkF/jnc49rycSZBRUWT34rs577U
         yPQ6VeXsA7yvvAnqi5tJ4y+38cq+DDvIV7a6FEVLaUvN6qQm0vdupm1a58OTD0Qx0RxO
         thlWlMGXVozwE3vwl5GP4IgXUNylXxoaW23YfnC6lUpVYjl6jfx4ch4PR4COck+c1az4
         Z5R8+DN8Lawk/ZoTEcD2r8+cLN3beV0R/9yC9LhLBiPrXvLP/J7UF9WeBOutXmuQQePX
         e62/7rare2gtDq9R9O5aT7LQ63hOw93WiNKbb+R9Jp4qgiWD/6k581+E6550JONhv2zJ
         zPNw==
X-Gm-Message-State: AOJu0Yzuv4uYbMxINkN2xkFytMrbX3IxXHNkddhlJRlhBybC5EZPvDt9
	KoeL81wER+A+kP4jundhxvhfUs07Zop1BoOANpMYHPD5S6DoljwBz+g=
X-Google-Smtp-Source: AGHT+IF8YANCcWlx2w/0/msjf4y2v4h4Xy4FWI214TULbuhHXEvDPb4bvCZrXVGcnGwKxWVnJu7fKnYNPvtC97SKfJw=
X-Received: by 2002:a50:a696:0:b0:52f:5697:8dec with SMTP id
 e22-20020a50a696000000b0052f56978decmr4174edc.4.1697222368058; Fri, 13 Oct
 2023 11:39:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231009142005.21338-1-quic_kriskura@quicinc.com>
 <20231009142005.21338-2-quic_kriskura@quicinc.com> <CANP3RGfEk2DqZ3biyN78ycQYbDxCEG+H1me2vnEYuwXkNdXnTA@mail.gmail.com>
 <CANP3RGcCpNOuVpdV9n0AFxZo-wsfwi8OfYgBk1WHNHaEd-4V-Q@mail.gmail.com>
 <CANP3RGdY4LsOA6U5kuccApHCzL0_jBnY=pLOYrUuYtMZFTvnbw@mail.gmail.com>
 <d19d9d08-c119-4991-b460-49925f601d15@quicinc.com> <fad5a7fb-cce1-46bc-a0af-72405c76d107@quicinc.com>
 <CANP3RGcqWBYd9FqAX47rE9pFgBTB8=0CGdwkScm-OH1epHcVWQ@mail.gmail.com> <8ff92053-52ff-4950-95c8-0e986f6a028a@quicinc.com>
In-Reply-To: <8ff92053-52ff-4950-95c8-0e986f6a028a@quicinc.com>
From: =?UTF-8?Q?Maciej_=C5=BBenczykowski?= <maze@google.com>
Date: Fri, 13 Oct 2023 11:39:10 -0700
Message-ID: <CANP3RGd4G4dkMOyg6wSX29NYP2mp=LhMhmZpoG=rgoCz=bh1=w@mail.gmail.com>
Subject: Re: [PATCH 2/2] usb: gadget: ncm: Add support to update
 wMaxSegmentSize via configfs
To: Krishna Kurapati PSSNV <quic_kriskura@quicinc.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, onathan Corbet <corbet@lwn.net>, 
	Linyu Yuan <quic_linyyuan@quicinc.com>, linux-usb@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	quic_ppratap@quicinc.com, quic_wcheng@quicinc.com, quic_jackp@quicinc.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
	USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=ham
	autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

On Thu, Oct 12, 2023 at 8:40=E2=80=AFAM Krishna Kurapati PSSNV
<quic_kriskura@quicinc.com> wrote:
>
>
>
> On 10/12/2023 6:02 PM, Maciej =C5=BBenczykowski wrote:
> > On Thu, Oct 12, 2023 at 1:48=E2=80=AFAM Krishna Kurapati PSSNV
> >
> > Could you paste the full patch?
> > This is hard to review without looking at much more context then email
> > is providing
> > (or, even better, send me a link to a CL in gerrit somewhere - for
> > example aosp ACK mainline tree)
>
> Sure. Will provide a gerrit on ACK for review before posting v2.
>
> The intent of posting the diff was two fold:
>
> 1. The question Greg asked regarding why the max segment size was
> limited to 15014 was valid. When I thought about it, I actually wanted
> to limit the max MTU to 15000, so the max segment size automatically
> needs to be limited to 15014.

Note that this is a *very* abstract value.
I get you want L3 MTU of 10 * 1500, but this value is not actually meaningf=
ul.

IPv4/IPv6 fragmentation and IPv4/IPv6 TCP segmentation
do not result in a trivial multiplication of the standard 1500 byte
ethernet L3 MTU.
Indeed aggregating 2 1500 L3 mtu frames results in *different* sized
frames depending on which type of aggregation you do.
(and for tcp it even depends on the number and size of tcp options,
though it is often assumed that those take up 12 bytes, since that's the
normal for Linux-to-Linux tcp connections)

For example if you aggregate N standard Linux ipv6/tcp L3 1500 mtu frames,
this means you have
N frames: ethernet (14) + ipv6 (40) + tcp (20) + tcp options (12) +
payload (1500-12-20-40=3D1500-72=3D1428)
post aggregation:
1 frame: ethernet (14) + ipv6 (40) + tcp (20) + tcp options (12) +
payload (N*1428)

so N * 1500 =3D=3D N * (72 + 1428) --> 1 * (72 + N * 1428)

That value of 72 is instead 52 for 'standard Linux ipv4/tcp),
it's 40/60 if there's no tcp options (which I think happens when
talking to windows)
it's different still with ipv4 fragmentation... and again different
with ipv6 fragmentation...
etc.

ie. 15000 L3 mtu is exactly as meaningless as 14000 L3 mtu.
Either way you don't get full frames.

As such I'd recommend going with whatever is the largest mtu that can
be meaningfully made to fit in 16K with all the NCM header overhead.
That's likely closer to 15500-16000 (though I have *not* checked).

> But my commit text didn't mention this
> properly which was a mistake on my behalf. But when I looked at the
> code, limiting the max segment size 15014 would force the practical
> max_mtu to not cross 15000 although theoretical max_mtu was set to:
> (GETHER_MAX_MTU_SIZE - 15412) during registration of net device.
>
> So my assumption of limiting it to 15000 was wrong. It must be limited
> to 15412 as mentioned in u_ether.c  This inturn means we must limit
> max_segment_size to:
> GETHER_MAX_ETH_FRAME_LEN (GETHER_MAX_MTU_SIZE + ETH_HLEN)
> as mentioned in u_ether.c.
>
> I wanted to confirm that setting MAX_DATAGRAM_SIZE to
> GETHER_MAX_ETH_FRAME_LEN was correct.
>
> 2. I am not actually able to test with MTU beyond 15000. When my host
> device is a linux machine, the cdc_ncm.c limits max_segment_size to:
> CDC_NCM_MAX_DATAGRAM_SIZE               8192    /* bytes */

In practice you get 50% of the benefits of infinitely large mtu by
going from 1500 to ~2980.
you get 75% of the benefits by going to ~6K
you get 87.5% of the benefits by going to ~12K
the benefits of going even higher are smaller and smaller...

If the host side is limited to 8192, maybe we should match that here too?

But the host side limitation of 8192 doesn't seem particularly sane either.=
..
Maybe we should relax that instead?

(especially since for things like tcp zero copy you want an mtu which
is slighly more then N * 4096,
ie. around 4.5KB, 8.5KB, 12.5KB or something like that)

> When connected to windows machine, I am able to set the mtu to a max
> value of 15000. So not sure how to test the patch if I set the
> max_segment_size to GETHER_MAX_ETH_FRAME_LEN.
>
> By pasting the diff, I wanted to confirm both the above queries.
>
> And you are right, while assigning value to ecm.wMaxSegmentSize, we must
> use cpu_to_le16(...). Will ensure to make this change in v2. It worked
> without that too, not sure how.

