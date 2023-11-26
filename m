Return-Path: <linux-usb+bounces-3330-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E7087F93AE
	for <lists+linux-usb@lfdr.de>; Sun, 26 Nov 2023 17:12:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B09E11C20C10
	for <lists+linux-usb@lfdr.de>; Sun, 26 Nov 2023 16:12:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D97CFDDBA;
	Sun, 26 Nov 2023 16:12:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HN2CC0k9"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com [IPv6:2607:f8b0:4864:20::62a])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C513494
	for <linux-usb@vger.kernel.org>; Sun, 26 Nov 2023 08:12:32 -0800 (PST)
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-1cc9b626a96so23459675ad.2
        for <linux-usb@vger.kernel.org>; Sun, 26 Nov 2023 08:12:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701015152; x=1701619952; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jx1vwNxY8sfzGHnhlOePT8EU1LRTlTtAecKFFptNgPA=;
        b=HN2CC0k9hVDq3JztuNKWtSxvOUq2QWaanTCiMXNN5duQBiYD1EmZupT4vDGrfOkViY
         4aifdApek/XyGpvZJ2ANwxHFNdv6S0aTY1ppY4VasWZEqrOKjYFwny4NbXVVj+KG5PG1
         HqNhzTqe9GK+JgcEsBVM6K4eerv0ibxJuHLFY/RV4ZbXtfZypXEGSqHEJIA6TklncWQH
         cU4zLguzBJn9U7syRJJseexXJ6I4lsos5EHu5n8t1epiGVAv7y5Qpx2iMCshq7L2pfNG
         n2TF9FW0jP1HEAIWbkYM/vzSaggXFEVkltKxExMmko8kOh1X+5jFHI/+TWf08xqPe9/I
         i/+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701015152; x=1701619952;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jx1vwNxY8sfzGHnhlOePT8EU1LRTlTtAecKFFptNgPA=;
        b=Oj0Eu3cNcNGUnrXFQLWaynsDfPJsm/ii1TUy3LD4v8N4A5j2aMInrgpLFg9VGFtrok
         GmkhYRnp6cuKee45ewndhK+pCNN4y5RUmKuNd0cPRUySu1y9f8PSD2Zro+8MEn3zM3y7
         9qvSJwJ9dICPo3G++cXeMrVO6Javm7zP5ZLC8IwEiNYAHTQAZwodb4V4KwmWNq9Ex+WW
         EnfqIGjUjRoTWe+EsjC8nbTXoYnE/uDg+Q3GUE0+0d/pvIX5+i3oLutD5oysuyiWx6PF
         PPepBLT6Tesjnbjx6+CAWqHnx2+yeyQIzALL76wSCROJ3NCNPdz/BqLGBCY9Uv/sXjLm
         Zxzg==
X-Gm-Message-State: AOJu0YyOJY+xZusZbBMcZh6q0/HZJmXMPI54IqmNrnfTYf2MK5KiTxXT
	rUm6KK9S4rVuJ310gPSlyV+YfBDj74RB9GDpgyL5sQySbyc=
X-Google-Smtp-Source: AGHT+IFPtFRKo/cqnI1LNnhf69l/Juc4gVwT+pKNL3CJNuPxVUyPpKIybJtd//B/9nmhZRDgVDJtQGTr92ZZyQ1nTuU=
X-Received: by 2002:a17:90b:1d0f:b0:285:a2af:31aa with SMTP id
 on15-20020a17090b1d0f00b00285a2af31aamr3229068pjb.37.1701015152076; Sun, 26
 Nov 2023 08:12:32 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAJrDFhpoOLNx-RX_raU4v++ZPYVShg_pmaxv0V2WfkfgcFdUGg@mail.gmail.com>
 <2023112652-scowling-submarine-5071@gregkh> <CAJrDFhoXrXry+gXL6477P-WHJfN58RreHSQ=7dyw-L=rx7E6mA@mail.gmail.com>
 <2023112636-entail-blend-8680@gregkh>
In-Reply-To: <2023112636-entail-blend-8680@gregkh>
From: Ian Zurutuza <ian.zurutuza@gmail.com>
Date: Sun, 26 Nov 2023 10:12:20 -0600
Message-ID: <CAJrDFhrm7F26rtQnmwMXkwio0DC7ZmTzpxPdJEFnL1wbU370mA@mail.gmail.com>
Subject: Re: device driver association
To: Greg KH <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Sorry, I wasn't paying attention, need coffee.

It won't attach, no /dev/ttyACM node were created.

I had attempted to manually set the driver with `modprobe cdc-acm
vendor=3D0x04b8 product=3D0x0d12`, It didn't attach, but I removed it just
in case.

Original /sys/kernel/debug/usb/devices
```
T:  Bus=3D07 Lev=3D02 Prnt=3D48 Port=3D00 Cnt=3D01 Dev#=3D 49 Spd=3D480  Mx=
Ch=3D 0
D:  Ver=3D 2.01 Cls=3Def(misc ) Sub=3D02 Prot=3D01 MxPS=3D64 #Cfgs=3D  1
P:  Vendor=3D04b8 ProdID=3D0335 Rev=3D 0.03
S:  Manufacturer=3DEPSON
S:  Product=3DEPSON HMD Audio
C:* #Ifs=3D 1 Cfg#=3D 1 Atr=3De0 MxPwr=3D100mA
I:* If#=3D 0 Alt=3D 0 #EPs=3D 1 Cls=3D03(HID  ) Sub=3D00 Prot=3D00 Driver=
=3Dusbhid
E:  Ad=3D86(I) Atr=3D03(Int.) MxPS=3D  64 Ivl=3D1ms

T:  Bus=3D07 Lev=3D02 Prnt=3D48 Port=3D01 Cnt=3D02 Dev#=3D 50 Spd=3D12   Mx=
Ch=3D 0
D:  Ver=3D 2.00 Cls=3Def(misc ) Sub=3D02 Prot=3D01 MxPS=3D64 #Cfgs=3D  1
P:  Vendor=3D04b8 ProdID=3D0d12 Rev=3D 2.00
S:  Manufacturer=3DSeiko Epson Corporation
S:  Product=3DEPSON HMD Com&Sens
S:  SerialNumber=3DNPH269690577
C:* #Ifs=3D 4 Cfg#=3D 1 Atr=3Dc0 MxPwr=3D100mA
A:  FirstIf#=3D 1 IfCount=3D 2 Cls=3D02(comm.) Sub=3D02 Prot=3D01
I:* If#=3D 0 Alt=3D 0 #EPs=3D 1 Cls=3D03(HID  ) Sub=3D00 Prot=3D00 Driver=
=3Dusbhid
E:  Ad=3D83(I) Atr=3D03(Int.) MxPS=3D  64 Ivl=3D1ms
I:* If#=3D 1 Alt=3D 0 #EPs=3D 1 Cls=3D02(comm.) Sub=3D02 Prot=3D01 Driver=
=3D(none)
E:  Ad=3D84(I) Atr=3D03(Int.) MxPS=3D   8 Ivl=3D16ms
I:* If#=3D 2 Alt=3D 0 #EPs=3D 2 Cls=3D0a(data ) Sub=3D00 Prot=3D00 Driver=
=3D(none)
E:  Ad=3D01(O) Atr=3D02(Bulk) MxPS=3D  64 Ivl=3D0ms
E:  Ad=3D81(I) Atr=3D02(Bulk) MxPS=3D  64 Ivl=3D0ms
I:* If#=3D 3 Alt=3D 0 #EPs=3D 1 Cls=3D03(HID  ) Sub=3D00 Prot=3D00 Driver=
=3Dusbhid
E:  Ad=3D82(I) Atr=3D03(Int.) MxPS=3D  64 Ivl=3D1ms
```

/sys/kernel/debug/usb/devices after `sudo modprobe usbserial
vendor=3D0x04b8 product=3D0x0d12`
```
T:  Bus=3D07 Lev=3D02 Prnt=3D48 Port=3D01 Cnt=3D02 Dev#=3D 50 Spd=3D12   Mx=
Ch=3D 0
D:  Ver=3D 2.00 Cls=3Def(misc ) Sub=3D02 Prot=3D01 MxPS=3D64 #Cfgs=3D  1
P:  Vendor=3D04b8 ProdID=3D0d12 Rev=3D 2.00
S:  Manufacturer=3DSeiko Epson Corporation
S:  Product=3DEPSON HMD Com&Sens
S:  SerialNumber=3DNPH269690577
C:* #Ifs=3D 4 Cfg#=3D 1 Atr=3Dc0 MxPwr=3D100mA
A:  FirstIf#=3D 1 IfCount=3D 2 Cls=3D02(comm.) Sub=3D02 Prot=3D01
I:* If#=3D 0 Alt=3D 0 #EPs=3D 1 Cls=3D03(HID  ) Sub=3D00 Prot=3D00 Driver=
=3Dusbhid
E:  Ad=3D83(I) Atr=3D03(Int.) MxPS=3D  64 Ivl=3D1ms
I:* If#=3D 1 Alt=3D 0 #EPs=3D 1 Cls=3D02(comm.) Sub=3D02 Prot=3D01 Driver=
=3D(none)
E:  Ad=3D84(I) Atr=3D03(Int.) MxPS=3D   8 Ivl=3D16ms
I:* If#=3D 2 Alt=3D 0 #EPs=3D 2 Cls=3D0a(data ) Sub=3D00 Prot=3D00 Driver=
=3Dusbserial_generic
E:  Ad=3D01(O) Atr=3D02(Bulk) MxPS=3D  64 Ivl=3D0ms
E:  Ad=3D81(I) Atr=3D02(Bulk) MxPS=3D  64 Ivl=3D0ms
I:* If#=3D 3 Alt=3D 0 #EPs=3D 1 Cls=3D03(HID  ) Sub=3D00 Prot=3D00 Driver=
=3Dusbhid
E:  Ad=3D82(I) Atr=3D03(Int.) MxPS=3D  64 Ivl=3D1ms
```

Thank you,
Ian

On Sun, Nov 26, 2023 at 10:08=E2=80=AFAM Greg KH <gregkh@linuxfoundation.or=
g> wrote:
>
> On Sun, Nov 26, 2023 at 10:03:24AM -0600, Ian Zurutuza wrote:
> > It won't attach, no /dev/ttyACM node were created.
>
> <snip>
>
> For some reason you sent this only to me, which is a bit rude to
> everyone else on the mailing list.  I'll be glad to respond if you
> resend it to everyone.
>
> thanks,
>
> greg k-h

