Return-Path: <linux-usb+bounces-19227-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 73822A0AB58
	for <lists+linux-usb@lfdr.de>; Sun, 12 Jan 2025 18:50:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 507241886EB6
	for <lists+linux-usb@lfdr.de>; Sun, 12 Jan 2025 17:50:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 706831C07D8;
	Sun, 12 Jan 2025 17:50:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="v9dSzhT0"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13B89137775
	for <linux-usb@vger.kernel.org>; Sun, 12 Jan 2025 17:49:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736704202; cv=none; b=XsTBIvskOXWVw0bv89dmQ0ruiDHe1bPVXr9mQ5PALKQ/XLI/ahtTVdtm8Bgxs7zFkXgNuhZf54VRof6dlamS5cpbFd+OTfivaYWWmeqNFLvgB4aGkVQGOIs48HvrkJicwF+L9TLXDFEfdCg84yJza8CL5/vVWs0qgTx8Toafkt4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736704202; c=relaxed/simple;
	bh=uDJACHUGLibjYF1aDSM22R1bFrU/Xm8GF8JLZOYj7po=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=atbTJ6bob5Sm9yYliCcrUEyY4I3ysgqwhZWTRUTeNetKDG/H8lVAreG4TSWXikYtLOgvcADaF3SFBGVR3YJDLeja47J0dUalTMDWpAdBh5JdQdvv5TxJBKXFGk+A558ZZ25eSI1PB1Wiw7sGI/YalV+Z/NNSSrW/Usm5HESLnFI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=v9dSzhT0; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-5d442f9d285so1907a12.1
        for <linux-usb@vger.kernel.org>; Sun, 12 Jan 2025 09:49:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1736704198; x=1737308998; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QF897j9gyWxTtE+ADrPWgMWBl1xcbraQPMkvqP7uSCM=;
        b=v9dSzhT07J23aBzQvgu9L7eWpGyH6/Bnjc4OevX5OHzGUoB5L+CoaxJLo8eklwkWt2
         exg3EatdhVdtdWtm2LTaRY192pQy6DjAgm/2ImypQpIaqk+jhPbHpzkWmF69vbFuRCA9
         N+5blysLb1YH2wm1+/dILTB+CXPSy/u02E5QoJ65geFOPxl2zOzm/9oZ/H34crtipMDX
         kt1p6T7Gto6WcW5x2/ArMmHIJRcep0YMqXwQRbKtwosv1n1IU54tyZrONA89yfTxwWgs
         GePJbLemuxHzHdcdvgkI6rLwcZRJLlmvQTFO236XMkaoo3SMvbjNSfzhoApl2hFmkeRg
         N64g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736704198; x=1737308998;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QF897j9gyWxTtE+ADrPWgMWBl1xcbraQPMkvqP7uSCM=;
        b=SBsn6ZTLdth3Ot+LdI9MOcerTwjUUs2fKgBlJ3av71695DbCtOapskGQB6Cru3gGI6
         nJMUausUGj7RzMdUb1Vf1tDddwskuu5lD5Fr0Y3QLx7xmwgNCstTmshAXbVw5WXIXEdn
         79Oy8tuTGfujTw8OgO9MkGpkdw2L/qHEF+J85PfDjJVZukbaEYgb5Edg+M85sRlweGP8
         dw5X/Ocxat0HWyVgwLsLT3p8IZfDCfUFQipTTYztQJ56TErjZkw7kycJjMXZwUHEHVQl
         o/d6Y+Ow+EIq54+x/xPhE05tEiVkPLogDdn06E2RzogSK4zvIjn3RM9hOfCx5EntERaA
         IFqw==
X-Forwarded-Encrypted: i=1; AJvYcCUKLfrE+d19m+FJo6hSlbZrMZOAqDOjb+F3ivMBD3uZ6meg1qdD9Ci5Ob87bq3EinXkF48OJMkNAKE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxCg99jbPi1ufc79TvW3d33n8evNGvLAjcIW+m7B9HIXQYGbtlI
	3FPJLOI1N4f6QvfzuoyOaI6X6uT5mGyYZvc5OJaEt3xyzmiiAWzS/lmpG4AmXEN+nMz0562YWBx
	y069HIBm0WPvqehM1M/5LVFqJg5rslLSKSzDL
X-Gm-Gg: ASbGncvGHOWhthW+FOm0RQhFE2KuW0mywUo5Drf4AIkw+o8jHXu5DRUuzGWuMwXTGxU
	Qp72icSvhH0Nt1KkHzejJH22bjjSKbsTHeWU=
X-Google-Smtp-Source: AGHT+IHzb/7oHZjXskuOAqYpd/JdG5zfAK3YKnpoYRRAJP+sN/lU97UYR7pL0iAoQHuNEKfZ6lBu3FfkGvYUv6/d2tQ=
X-Received: by 2002:a50:cc81:0:b0:5d0:d935:457b with SMTP id
 4fb4d7f45d1cf-5d99f8efe29mr174519a12.0.1736704198155; Sun, 12 Jan 2025
 09:49:58 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240205074650.200304-1-quic_kriskura@quicinc.com>
 <ME0P300MB05534EDF5293054B53061567A61C2@ME0P300MB0553.AUSP300.PROD.OUTLOOK.COM>
 <CANP3RGc_SBROWVA2GMaN41mzCU28wGtQzT5qmSKcYsYDY03G5g@mail.gmail.com> <ME0P300MB0553900AF75E50947B011FF3A61D2@ME0P300MB0553.AUSP300.PROD.OUTLOOK.COM>
In-Reply-To: <ME0P300MB0553900AF75E50947B011FF3A61D2@ME0P300MB0553.AUSP300.PROD.OUTLOOK.COM>
From: =?UTF-8?Q?Maciej_=C5=BBenczykowski?= <maze@google.com>
Date: Sun, 12 Jan 2025 09:49:47 -0800
X-Gm-Features: AbW1kvZgAS46r8T0UzYONe9j1Em-XTZ0kppXQjBJirsoKp-83yrOsPVJ8FhMc_s
Message-ID: <CANP3RGc7n2vv6vGh7j0Y=7DNqfXnQxZaTcwdPD15kzoY1in08Q@mail.gmail.com>
Subject: Re: [PATCH v3] usb: gadget: ncm: Avoid dropping datagrams of properly
 parsed NTBs
To: Junzhong Pan <panjunzhong@outlook.com>
Cc: quic_kriskura@quicinc.com, gregkh@linuxfoundation.org, 
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
	quic_jackp@quicinc.com, quic_ppratap@quicinc.com, quic_wcheng@quicinc.com, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jan 11, 2025 at 2:31=E2=80=AFAM Junzhong Pan <panjunzhong@outlook.c=
om> wrote:
>
> Hi Maciej
>
> Thanks for the reply, I am sorry for the unclear description.
>
> +remove hgajjar@de.adit-jv.com from CC list due to mail delivery failure.
>
> On 2025/1/11 3:00, Maciej =C5=BBenczykowski wrote:
> > On Thu, Jan 9, 2025 at 11:37=E2=80=AFPM Junzhong Pan <panjunzhong@outlo=
ok.com> wrote:
> >> Lecroy shows the wSequence=3D5765 have 10 Datagram consisting a 31*512
> >> bytes=3D15872 bytes OUT Transfer but have no ZLP:
> >>
> >> OUT Transfer wSequence=3D5765
> >>         NTH32 Datagrams: 1514B * 8 + 580B NDP32
> >>         Transfer length: 512B * 31
> >>         NO ZLP
> >> OUT Transfer wSequence=3D5766
> >>         NTH32 Datagrams: 1514B * 8 NDP32
> >>         Transfer length: 512B * 29  + 432
> >>
> >> This lead to a result that the first givebacked 16K skb correponding t=
o
> >> a usb_request contains two NTH but not complete:
> >>
> >> USB Request 1 SKB 16384B
> >>         (NTH32) (Datagrams) (NDP32) | (NTH32) (Datagrams piece of wSeq=
uence=3D5766)
> >> USB Request 2 SKB 14768B
> >>         (Datagrams piece of wSequence=3D5766) (NDP32)
> >>
> >>  From the context, it seems the first report of Wrong NDP SIGN is caus=
ed
> >> by out-of-bound accessing, the second report of Wrong NTH SIGN is caus=
ed
> >> by a wrong beginning of NTB parsing.
> >
> > Could you clarify which Linux Kernel you're testing against?
>
> I am using linux 6.6.63, but the related codes have not newer updates sin=
ce.
>
> > Could you provide some pcap of the actual usb frames?
> > Or perhaps describe better the problem, because I'm not quite
> > following from your email.
> > (I'm not sure if the problem is what windows is sending, or how Linux
> > is parsing it)
>
> I think the root cause of the problem is because Windows 10 ncm class
> driver doesn't send ZLP, meanwhile the current parsing is depend on a con=
dition
> that NTB won't spread across usb_request.
>
> This is observed only on Windows 10 but not on Windows 11.
>
> To reproduce the issue, you just need a Windows 10 machine and run iperf3=
 -c
> from the windows and iperf3 -s on the gadget board, configure the gadget
> with the following os_desc, windows10 will bind its ncm driver automatica=
lly:
>         echo 0xEF >  $GADGET/bDeviceClass
>         echo 0x02 > $GADGET/bDeviceSubClass
>         echo 0x01 > $GADGET/bDeviceProtocol
>         echo 1 > $GADGET/os_desc/use
>         echo 0x1 > $GADGET/os_desc/b_vendor_code
>         echo "MSFT100" > $GADGET/os_desc/qw_sign
>         mkdir -p $FUNCTIONS/ncm.0/os_desc/interface.ncm
>         echo WINNCM > $FUNCTIONS/ncm.0/os_desc/interface.ncm/compatible_i=
d
>
> Reproduced on dwc2 and dwc3 controller with linux 6.6.63.
>
> > I *think* what you're saying is that wSequence=3D5765 & 5766 are being
> > treated as a single ncm message due to their being a multiple of 512
> > in the former, not followed by a ZLP?  I thought that was precisely
> > when microsoft ncm added an extra zero byte...
> >
> > What's at the end of 5755?  Padding? No padding?
> > Is there an NTH32 header in 5766?  Should there be?
> >
>
> Okay, I will explain it more precisely (some numbers are corrected).
> On the USB wire, the transfers on OUT endpoint is like this:
>
> OUT Transfer #1 issued by win10, Transfer length: 512B * 31 =3D 15872 Byt=
es
>         OUT Transaction 512B for 31 times, no ZLP and other things. Parse=
d as below:
>         [Offset 0x0000] A NTH32 Header with wSequence=3D5765, dwNdpIndex=
=3D0x3D90
>         [Offset 0x0012] Datagram blocks
>         [Offset 0x3D90] A NDP32 describing 11 Datagram blocks plus one ze=
ro length item and padding, len =3D 112 Bytes.
>                         (0)index=3D0x0012 length=3D1514
>                         (1)index=3D0x05FE length=3D1514
>                         (2)index=3D0x0BEA length=3D1514
>                         (3)index=3D0x11D6 length=3D1514
>                         (4)index=3D0x17C2 length=3D1514
>                         (5)index=3D0x1DAE length=3D1514
>                         (6)index=3D0x239A length=3D1514
>                         (7)index=3D0x2986 length=3D1514
>                         (8)index=3D...... length=3D1514
>                         (9)index=3D...... length=3D1514
>                         (10)index=3D..... length=3D580
>                         (11)index=3D0x0 length=3D0
>                         ...padding...
>
> OUT Transfer #2 issued by win10, Transfer length: 512B * 29  + 432 =3D 15=
280 Bytes
>         OUT Transaction 512B for 29 times, and OUT Transaction 432B for o=
ne time.
>         [Offset 0x0000] A NTH32 with wSequence=3D5766, dwNdpIndex=3D0x3B4=
8
>         [Offset 0x0012] Datagram block
>         [Offset 0x3B48] A NDP32 describing Datagram blocks
>
> In the u_ether driver, we first queued a usb_request(buf=3Dskb.data, leng=
th=3D16384)
> to the udc driver, the udc should give it back when it receive a 16384B d=
ata or
> encounter ZLP/Short packet.
>
> Since the OUT Xfer #1 doesn't have ZLP or SP, the udc won't giveback the =
usb_request
> with req->actual =3D 15872, instead, it gather some piece of the data fro=
m OUT Transfer #2
> to make a req->actual=3D16384 then return to rx_complete.
>
> For f_ncm, we now have a the first usb_request givebacked from udc driver=
 having
> skb->data organized as the following structure:
>
>       usb_request #1
>         -----------------------from OUT Transfer #1:-------------------
>         [Offset 0x0000] A NTH32 Header with wSequence=3D5765, dwNdpIndex=
=3D0x3D90
>         [Offset 0x0012] Datagram blocks
>         [Offset 0x3D90] A NDP32 describing 10 Datagram blocks plus one ze=
ro length item and padding, len =3D 112 Bytes.
>                         (0)index=3D0x0012 length=3D1514
>                         (1)index=3D0x05FE length=3D1514
>                         (2)index=3D0x0BEA length=3D1514
>                         (3)index=3D0x11D6 length=3D1514
>                         (4)index=3D0x17C2 length=3D1514
>                         (5)index=3D0x1DAE length=3D1514
>                         (6)index=3D0x239A length=3D1514
>                         (7)index=3D0x2986 length=3D1514
>                         (8)index=3D...... length=3D1514
>                         (9)index=3D...... length=3D1514
>                         (10)index=3D..... length=3D580
>                         (11)index=3D0x0 length=3D0
>                         ...padding...
>         --------------------from OUT Transfer #2:-------------------
>         [Offset 0x3E00/15872] A NTH32 Header with wSequence=3D5766, dwNdp=
Index=3D0x3B48
>         [Offset 0x3E00+???] Datagram block piece from next NDP (wSequence=
=3D5766)
>
> During the unwrap, we will first report a "Wrong NTH SIGN" when we try to=
 redirect to
> the NDP of wSequence=3D5765 parsing the second NTB in the usb_request, si=
nce theie is no
> bound checking, we read some garbage data from skb->data + [0x3E00 + 0x3B=
48].
>
> Raising the following message (without modification):
> [  174] configfs-gadget.0: Wrong NDP SIGN
>
> After this, we go to the next usb_request, at this time, we have a short =
package(432B) from
> the OUT Transfer #2, thus the udc would giveback next usb_request to us l=
ike this:
>
>       usb_request #2
>         --------------------from OUT Transfer #2:-------------------
>         [Offset 0x0000]  Datagram block piece from NTB of wSequence=3D576=
5
>                          3f 98 a6 8e 17 f8 bb 29 07 b8 da 13 7f 20 80 8e =
77 ca 32 07 ac 71 b8 8d 84 03 d7 1b 96 9b c4 fa
>         [Offset 0x????] A NDP32 describing Datagram blocks
>
> At this point, the unwrap function try to read a NTH sign but got unexpec=
ted user data,
> then it raise this message:
> [  174] configfs-gadget.0: Wrong NTH SIGN, skblen 14768
> [  174] HEAD:00000000b1a72bfc: 3f 98 a6 8e 17 f8 bb 29 07 b8 da 13 7f 20 =
80 8e 77 ca 32 07 ac 71 b8 8d 84 03 d7 1b 96 9b c4 fa
>
> In short, there is two NTBs across two usb_requests, the beginning of a u=
sb_request is
> not necessary a NTH sign.
> Do this make sense to you?
>
> Best Regards,
> Pan

Ok, this was *very* helpful.  I'll dig into this more during the week,
but here's a few quick questions/statements that immediately come to
mind.

(a) I think this looks like a bug on the sending Win10 side, rather
than a parsing bug in Linux,
with there being no ZLP, and no short (<512) frame, there's simply no
way for the receiver to split at the right spot.
Indeed, fixing this on the Linux/parsing side seems non-trivial...
I guess we could try to treat the connection as simply a serial
connection (ie. ignore frame boundaries), but then we might have
issues with other senders...

I guess the most likely 'correct' hack/fix would be to hold on to the
extra 'N*512' bytes (it doesn't even have to be 1, though likely the N
is odd), if it starts with a NTH header...

(b) I notice the '512' not '1024', I think this implies a USB2
connection instead of USB3
-- could you try replicating this with a USB3 capable data cable (and
USB3 ports), this should result in 1024 block size instead of 512.

I'm wondering if the win10 stack is avoiding generating N*1024, but
then hitting N*512 with odd N...

Presumably '512' would be '64' with USB1.0/1.1, but I guess finding a
USB1.x port/host to test against is likely to be near impossible...

I'll try to see if I can find the source of the bug in the Win
driver's sources (though based on it being Win10 only, may need to
search history)

--
Maciej =C5=BBenczykowski, Kernel Networking Developer @ Google

