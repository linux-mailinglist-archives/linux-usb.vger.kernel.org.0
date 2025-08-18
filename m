Return-Path: <linux-usb+bounces-26992-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E16DBB2B1E1
	for <lists+linux-usb@lfdr.de>; Mon, 18 Aug 2025 21:49:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 584751B65885
	for <lists+linux-usb@lfdr.de>; Mon, 18 Aug 2025 19:49:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 71A1F27466C;
	Mon, 18 Aug 2025 19:49:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G7YeZIk2"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 257B91F37D3
	for <linux-usb@vger.kernel.org>; Mon, 18 Aug 2025 19:49:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755546568; cv=none; b=SZycsj03qdtCZ00MGuMETpR5vJDhVBCkGyYvwlwi/ZRRduhVlTSH69doIipj0gYGb0neqCw+2vDIhd5P4+KgtfLnQNjAABxlGL1tqQN5NhbADGaqwqIZzM/QYJlVZIVpDQ6CALJcYYmLkFllNi7IeRGyRbn9E/mOLZ37g8YBx9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755546568; c=relaxed/simple;
	bh=QnaTRjbXWXHVKA1yp5+UcsMsVlyGYVtpbmG6LkuJ1UY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VoVgSo78m5bRRwVGYvxxpFt1JdBzPb+aW1Mk+v1j8YznxpG4hmrwBda7/SpswMuwTgTqul4Lk+sBCLl8+D/pUgWmfRHPZWRAGpcpb2kyMgKO7tSq6oYqNe71HErQGElid0VU1em0o/uBUSYKibwCFohgn0jHVObM/wVKVL6Nikw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G7YeZIk2; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-45a1b04f8b5so22703205e9.1
        for <linux-usb@vger.kernel.org>; Mon, 18 Aug 2025 12:49:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755546564; x=1756151364; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vYmMdVURkWTTR/wj2CkwKLf34zUz6vfpLh0Zo9oetsk=;
        b=G7YeZIk2H3zgDjFy3PKJAjikj1w76BF0U2lxoikFJMop2ZJ9dZE+HsTW0Zhe9tzxYE
         fhWFhuxeY9H1MdNQWsQUmEgJ4tSqPTPwdT/bLYHHp/KAvHfqrH6vUj8IXto1RX0hpho9
         pfTs1MHWiRucfj+OmBSItYRkrqIvRRfWj6xuCATdLlm7QRSO4UmbrF2/slhlnqVYfW3z
         s8zxIw0+PWE+I+HR9+NCNJHMttAQ9QgOKzyorR3I1Hli6cQfEYt5McToTQm1X4QkBgdb
         EXGpmUhfh2/fUidY2sgmsPCVhR/My4qyxepA5EuT5494HixMdbX71xvGsGuh7Vd7siE3
         WpUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755546564; x=1756151364;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vYmMdVURkWTTR/wj2CkwKLf34zUz6vfpLh0Zo9oetsk=;
        b=RB2OFcpq43LetaQTV7KC0x5XVYpqljXKgvNsmewM+Kq4ASjqsz3R8VL07omXI7X4ht
         Us4rY3/fijY0NasbI53s6RmqV37+/p/WIQiCFIAE+K5J3gMvqFkfAaCaPDfyPe8rSX+t
         uDUptq34vbOEip3l/9nvcQS8jJGViwkPPxbAorwWyG3KmFYpwajUypyC8zEpUyztHVyq
         b71d+H0Rcf3JyCqpUO5xD/846UkVSNG/yAJauteqS5tUOeLp/azKPyHIr5EviJeJfHr8
         QfVtNjOtZkSVmnOH2UYM2NkWKaeeqyVbWVON8CDoUipyj2cHnSHQc/2nC/WSXuO1ymxq
         EglQ==
X-Gm-Message-State: AOJu0YwYM2FE4haudlekYHf/QW/UMp4THRlM0XFirhMyeEB6Jdd/+/6M
	t2yhUk8HxMvMoaEv4wIm/0PLf5nJ4gG7B4H3+t5Tp8+yTfjDQHZSI1k7A2OI4LezT9eqIpXzngt
	xmfeoXHGcIReEPYihXsaqmn7f1E3so4Y=
X-Gm-Gg: ASbGncvW+bDKQsO7uHDiKO9neaDp+5PPT6FBtJYMVsy0L1PACaZB/gsPf/RD+u+MAjB
	CBKd7/7xh8TSSfG86acBDL0Y6i9ifiRrKc2XKF8rlfqsTk2OWkmHrij6HOX+HirM1w8Q5fGCBLe
	yn4bowUFHnjLWtgLJUUNU1jUgzrK2c5u8hYDczbrFdzG0EWP7ad16bSGg1defV26w/rySheIp0u
	xfPzOI=
X-Google-Smtp-Source: AGHT+IFEPEcfBlyJZO76XJkA30Shzh4YmP/bwG2XwZSbuF+aWn/29kRiORnyDiJ+79t1XZr7AehepSxtVCQ0QtXa4IU=
X-Received: by 2002:a05:600c:190e:b0:450:d4a6:799e with SMTP id
 5b1f17b1804b1-45a26785296mr76164475e9.20.1755546564193; Mon, 18 Aug 2025
 12:49:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <64e36d3b-606f-4fa7-bb6a-1dfd8a144de6@mmeacs.de>
 <2c13a7f8-647e-4199-b0e6-451128bdd61e@linux.intel.com> <1b1391ef-b8f4-48bd-952c-0530ebc97be4@mmeacs.de>
 <CAGRyCJEaysizTYu=bsP2mhg54-iiP-rWeS6_9h5sfm4yr705yw@mail.gmail.com> <8a7d28ac-a269-4ce5-ba72-a685541f4c16@mmeacs.de>
In-Reply-To: <8a7d28ac-a269-4ce5-ba72-a685541f4c16@mmeacs.de>
From: Daniele Palmas <dnlplm@gmail.com>
Date: Mon, 18 Aug 2025 21:49:13 +0200
X-Gm-Features: Ac12FXzPZ4nLyErN2ozPHL_nXlI3exmETYFXiF07llSl7I4DGIJfHyk4VF_NW-0
Message-ID: <CAGRyCJHX4r_Q3sLhgfzhD9J8CreH-YWkSmmuXfZrEQemzhD7Rw@mail.gmail.com>
Subject: Re: Problem hanging Bulk IN, with USB 3.x, perhaps due to
 wMaxPacketSize = 1024 and wMaxBurst = 6 (OUT) and 2 (IN), tested and
 reproduceable with i.MX8MP and Raspberry Pi Compute Module 5 (CM5)
To: Martin Maurer <martin.maurer@mmeacs.de>
Cc: linux-usb@vger.kernel.org, michal.pecio@gmail.com, 
	mathias.nyman@linux.intel.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Martin,

Il giorno dom 17 ago 2025 alle ore 19:01 Martin Maurer
<martin.maurer@mmeacs.de> ha scritto:
>
> Hi Daniele,
>
> many thanks for your reply!
>
> I can only partly open
>
> https://www.spinics.net
>
> pages, often pages time out...
>
> Have I understood correctly, that there is a known bug, but it was not
> fixed (from 2020 till now).
>
> But as workaround enabling qmux/qmimux could work?

If the problem is the same, it should. If your kernel version supports
the passthrough sysfs file, you can also use the rmnet module (much
better than the inbox qmap implementation).

If enabling QMAP is too complicated in your setup, you can just try to
increase the rx_urb_size by increasing the mtu (at least 2048).

Regards,
Daniele

> Best regards,
>
> Martin
>
>
>
> Am 17.08.2025 um 17:22 schrieb Daniele Palmas:
> > Hello Martin,
> >
> > Il giorno dom 17 ago 2025 alle ore 17:09 Martin Maurer
> > <martin.maurer@mmeacs.de> ha scritto:
> >> Hello Micha=C5=82, hello Mathias at all,
> >>
> >> many thanks for your answers!
> >>
> >> I have tried if I can reproduce it with a AMD Linux PC, but
> >> unfortunately I was not able to reproduce (but setup is a bit differen=
t).
> >>
> >> So I went back to Raspberry Pi Compute Module 5, where I mainly
> >> connected the radio module (Quectel RM520N-GL) via USB3,
> >>
> >> and installed a Wifi access point. All data/all connections from Wifi
> >> access point are routed directly via wwan0 to radio module.
> >>
> >> This is currently my easiest setup to be able to reproduce the error.
> >> Mostly in a few seconds.
> >>
> >> My knowledge in area Linux Kernel + USB is unfortunately not yet enoug=
h
> >> to analyze and fix it by myself.
> >>
> >> But I used the help of ChatGPT-5 to create an usbmon and xhci kernel t=
race.
> >>
> >> I create an usbmon trace as well as a trace from xhci (both recorded i=
n
> >> parallel):
> >>
> >> https://www.file-upload.net/en/download-15523936/usbmon_bus5_20250817-=
150158.log.html
> >>
> >> https://www.file-upload.net/en/download-15523937/xhci_20250817-150158.=
trace.html
> >>
> >> This was the last output, my ping in a shell has shown:
> >>
> >> 64 bytes from 8.8.8.8: icmp_seq=3D2323 ttl=3D112 time=3D26.0 ms
> >> 64 bytes from 8.8.8.8: icmp_seq=3D2324 ttl=3D112 time=3D25.0 ms
> >> 64 bytes from 8.8.8.8: icmp_seq=3D2325 ttl=3D112 time=3D29.1 ms
> >> 64 bytes from 8.8.8.8: icmp_seq=3D2326 ttl=3D112 time=3D37.8 ms
> >>
> >> In parallel created more data traffic, but with ping I see first when =
IP
> >> data connection does not work stable anymore.
> >>
> >> According to ChatGPT-5 the following places contain errors:
> >>
> >> *** USBMON ***
> >>
> >> In your usbmon_bus5_20250817-150158.log:
> >>
> >> First -71 (EPROTO) on the QMI Bulk-IN (Bi:5:005:14): line 2161,
> >> timestamp 493245744
> >>
> >> 2161: ffffff8003c8cb40 493245744 C Bi:5:005:14 -71 0
> >>
> >> Just before that, there=E2=80=99s a -75 (EOVERFLOW) on the same IN EP,=
 which is
> >> often the first sign of trouble: line 2159, timestamp 493245221
> >>
> > I did not have the chance to look at the usbmon traces so I'm not sure
> > that this is really the same scenario, but you could take a look at
> > the whole thread at
> > https://www.spinics.net/lists/netdev/msg635944.html
> >
> > If it is the same issue, basically, if you setup the data connection
> > with QMAP you should not face the issue.
> >
> > Regards,
> > Daniele
> >
> >> 2159: ffffff8003c8cd80 493245221 C Bi:5:005:14 -75 1024 =3D ...
> >>
> >> So the sequence is: several good completions =E2=86=92 EOVERFLOW (-75)=
 =E2=86=92 then a
> >> stream of EPROTO (-71) errors on Bi:5:005:14, which kills further ping
> >> replies after your last good seq (2326).
> >>
> >>
> >> *** XHCI TRACE ***
> >>
> >> I found the first failure in your xHCI trace.
> >>
> >> First error line: line 8216
> >>
> >> Timestamp: 758267.000115
> >>
> >> Event: xhci_handle_event =E2=80=A6 type 'Transfer Event' =E2=80=A6 'Er=
ror' =E2=80=A6 slot 1 ep
> >> 29 =E2=80=A6 len 1472
> >>
> >> Why ep 29? In xHCI, the endpoint context index is ep_index =3D 2 *
> >> ep_number + (direction), where direction is 0=3DOUT, 1=3DIN.
> >> So for Bulk IN ep 14: 2*14+1 =3D 29 =E2=86=92 that=E2=80=99s your IN 0=
x87 pipe.
> >>
> >> Right after that line you can see the driver react:
> >>
> >> xhci_handle_transfer =E2=80=A6 length 1472 =E2=80=A6 (the failed TD)
> >>
> >> xhci_queue_command: Reset Endpoint Command =E2=80=A6 ep 29 (host tries=
 to recover)
> >>
> >> xhci_handle_event: =E2=80=A6 'Command Completion Event' (reset complet=
es)
> >>
> >> But from this point on, completions for that IN EP correspond to usbmo=
n
> >> -71 (EPROTO) =E2=80=94 matching what you saw.
> >>
> >>
> >> Does this give a clue, where it could be coming from?
> >>
> >> It is 100% reproduceable in a few seconds on Raspberry Pi Ccompute
> >> Module 5 (and I same behaviour on different kernel of i.MX8MP).
> >>
> >> Could it be a hardware problem? I already tried different radio module
> >> (all Qualcomm, X62/X65 and X72/X75),
> >>
> >> different cables (all same length, all from same source), different ev=
al
> >> board for the M.2 radio modules (but from same source).
> >>
> >>
> >> Can you give me a hint, what to try next?
> >>
> >>
> >> ChatGPT-5 pinpoints me to try to disable LPM for USB3, could this be a
> >> next step? Or is it something  else?
> >>
> >>
> >> Many thanks for your help!
> >>
> >> Best regards,
> >>
> >> Martin
> >>
> >>

