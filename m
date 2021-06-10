Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 389F33A2779
	for <lists+linux-usb@lfdr.de>; Thu, 10 Jun 2021 10:53:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229925AbhFJIzb (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 10 Jun 2021 04:55:31 -0400
Received: from mail-yb1-f196.google.com ([209.85.219.196]:40550 "EHLO
        mail-yb1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229715AbhFJIza (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 10 Jun 2021 04:55:30 -0400
Received: by mail-yb1-f196.google.com with SMTP id e10so39665121ybb.7
        for <linux-usb@vger.kernel.org>; Thu, 10 Jun 2021 01:53:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=DvTD+DpY/N3T+G9Eg5PEtKcFycharukz136TXn4Fd8I=;
        b=iWcG1gc6nmTukPrOs1TqpKhlfCEZ4Yf6kjfxlgXe8gOAk3kWVLvzQN9o9NRIaDKZfm
         rxkWrX5yc9q6aipNQGQFWbY0t9+DSRey04jfkrAk+Q3QhUryJJUL/9ZDQB5dKLjyEfXG
         QSLT8CzYmLFsk4v/CfAlSemzM4uZKFyFlE1/xRnuB3LGbJGA+/RY3m3W7lx0r6TsGIlh
         53URMtEABMlsKZJ1f2RwMBbWmsGKtqG8yUsYD4slpvCze/3PpPfnhXjq/CCR0QJB4X68
         FrhWxM2Wn3wno2mXfjTcWlb9tyLHPQYYON5rdBq4EzQ0hwNAN8N2FN/S65/8xJt8/17K
         Lwfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=DvTD+DpY/N3T+G9Eg5PEtKcFycharukz136TXn4Fd8I=;
        b=gmewxwHO7G1LQv+8YUsWdf+BL00yrnzMWdCfiede1aV0PJxkqRgeNk+zrUWRhC2FLV
         2NyrVK5tOoO9MV8i/g6UDonbjWswHaQt7Yr/qwjB9FIUlafrQuQyKFp0y3j2tNbDGLKc
         yxdmXH2338iAsi8M8qu6gPvYs9BvaMFSrPocJLbPpQ7Famo+Pzhht6R4HIYNzSYt4oNU
         fz310T6HPCIARK8mp4cpW98dmGMG1Jfeuk7eLUA7bFPNUyejLAiyFqyP/+2uOBlyoOrt
         UTI8Njf+9hDLH4o+BJET83gXzo6Ogu6jV2xnx/li4lsNsOxJFqb8Eo5fHm338qEBEenT
         KeDA==
X-Gm-Message-State: AOAM532eWSCV6afp62KHtE1F2lTJgKb3OmDdejdBw7Mb16W8+iHvegXT
        geuNB6ZqI0PnKYYxZf1UAynzL474Bsj6D+VUeGeA4NDqSQgaNw==
X-Google-Smtp-Source: ABdhPJySh8GF90uusTZLNCeQjEmNtzzZ/Mm1gjq220Rsrz/TvN2LvNknRLTZaseh7PoN8qKbr30zBsCyiGHn7BLIXJo=
X-Received: by 2002:a5b:ac9:: with SMTP id a9mr6240867ybr.475.1623315150377;
 Thu, 10 Jun 2021 01:52:30 -0700 (PDT)
MIME-Version: 1.0
From:   kun peng <kunpeng0891@gmail.com>
Date:   Thu, 10 Jun 2021 16:52:19 +0800
Message-ID: <CAJa5FiHh3oWGt3qMRWTBRorENhsKNODTRd+0meK2qpYnMk6U8g@mail.gmail.com>
Subject: usb3.0: dwc3: isoc: missisoc while setting the USB transfer UVC data
To:     linux-usb@vger.kernel.org
Content-Type: multipart/mixed; boundary="000000000000e636bd05c4658244"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

--000000000000e636bd05c4658244
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi =EF=BC=8C I'm using the 4*A53 with DWC3 USB controller, my hardware to w=
ork
like a USB camera and so make use of the USB 3.0 UVC gadget driver=E3=80=82
usb3.0 isoc transfer with  missisoc -18=EF=BC=8Clarger maxburst is set, the
more -18 appears=E3=80=82
but from trace info, the trb has been put in advance=E3=80=82

test setting:
dwc3 driver version=EF=BC=9A5.12
PC=EF=BC=9A potplayer

maxpacket : 3072
maxburst : 15
interval : 1
UVC_NUM_REQUESTS: 8

dmesg info=EF=BC=9A
[  806.696113] configfs-gadget gadget: uvc: VS request completed with
status -18.
[  806.696136] configfs-gadget gadget: uvc: VS request completed with
status -18.
[  806.696361] configfs-gadget gadget: uvc: VS request completed with
status -18.
[  806.696380] configfs-gadget gadget: uvc: VS request completed with
status -18.
[  806.746120] configfs-gadget gadget: uvc: VS request completed with
status -18.
[  806.746145] configfs-gadget gadget: uvc: VS request completed with
status -18.
[  806.746496] configfs-gadget gadget: uvc: VS request completed with
status -18.
[  806.769243] configfs-gadget gadget: uvc: VS request completed with
status -18.
[  806.769265] configfs-gadget gadget: uvc: VS request completed with
status -18.

trace info:
    irq/175-dwc3-2373  [003]  7391.966129: dwc3_event:           event
(9e5f408a): ep2in: Transfer In Progress [40543] (sIm)
    irq/175-dwc3-2373  [003]  7391.966131: dwc3_complete_trb:
[FAILED TO PARSE] name=3Dep2in trb=3D0xffffff8009307250 allocated=3D3276802=
8
queued=3D1764913253 bpl=3D1987444736 bph=3D0 size=3D0 ctrl=3D664259680 type=
=3D1
enqueue=3D45 dequeue=3D38
    irq/175-dwc3-2373  [003]  7391.966134: dwc3_gadget_giveback:
ep2in: req 0xffffffc07a554800 length 49152/49152 zsI =3D=3D> 0
    irq/175-dwc3-2373  [003]  7391.966136:
usb_gadget_giveback_request: ep2in: req 0xffffffc07a554800 length
49152/49152 sgs 0/0 stream 0 zsI status 0 --> 0
    kworker/3:1H-1147  [003]  7391.966171: dwc3_ep_queue:
ep2in: req 0xffffffc07a554800 length 0/49152 zsI =3D=3D> -115
    kworker/3:1H-1147  [003]  7391.966172: dwc3_gadget_ep_info:
ep2in: mps 1024/1024 streams 15 burst 16 ring 45/38 flags 0x29
>c<:>c<>c<>c<>c<:>c<
    kworker/3:1H-1147  [003]  7391.966174: dwc3_gadget_ep_info2:
ep2in: mps 1024/1024 streams 15 burst 16 ring 45/38 flags 0x29
>c<:>c<>c<>c<>c<:>c<
    kworker/3:1H-1147  [003]  7391.966180: dwc3_prepare_trb:
[FAILED TO PARSE] name=3Dep2in trb=3D0xffffff80093072d0 allocated=3D16
queued=3D41 bpl=3D1987444736 bph=3D0 size=3D49152 ctrl=3D3169 type=3D1 enqu=
eue=3D46
dequeue=3D38
    kworker/3:1H-1147  [003]  7391.966183: dwc3_gadget_ep_cmd:
ep2in: cmd 'Update Transfer' [50407] ri:5 params 00000000 00000000
00000000 --> status: Successful
    kworker/3:1H-1147  [003]  7391.966186: usb_ep_queue:
ep2in: req 0xffffffc07a554800 length 0/49152 sgs 0/0 stream 0 zsI
status -115 --> 0
    irq/175-dwc3-2373  [003]  7391.966260: dwc3_event:           event
(9e60408a): ep2in: Transfer In Progress [40544] (sIm)
    irq/175-dwc3-2373  [003]  7391.966262: dwc3_complete_trb:
[FAILED TO PARSE] name=3Dep2in trb=3D0xffffff8009307260 allocated=3D3276802=
8
queued=3D1764913253 bpl=3D1987641344 bph=3D0 size=3D0 ctrl=3D664276064 type=
=3D1
enqueue=3D46 dequeue=3D39
    irq/175-dwc3-2373  [003]  7391.966264: dwc3_gadget_giveback:
ep2in: req 0xffffffc07a554200 length 49152/49152 zsI =3D=3D> 0
    irq/175-dwc3-2373  [003]  7391.966266:
usb_gadget_giveback_request: ep2in: req 0xffffffc07a554200 length
49152/49152 sgs 0/0 stream 0 zsI status 0 --> 0
    kworker/3:1H-1147  [003]  7391.966304: dwc3_ep_queue:
ep2in: req 0xffffffc07a554200 length 0/49152 zsI =3D=3D> -115
    kworker/3:1H-1147  [003]  7391.966306: dwc3_gadget_ep_info:
ep2in: mps 1024/1024 streams 15 burst 16 ring 46/39 flags 0x29
>c<:>c<>c<>c<>c<:>c<
    kworker/3:1H-1147  [003]  7391.966307: dwc3_gadget_ep_info2:
ep2in: mps 1024/1024 streams 15 burst 16 ring 46/39 flags 0x29
>c<:>c<>c<>c<>c<:>c<
    kworker/3:1H-1147  [003]  7391.966314: dwc3_prepare_trb:
[FAILED TO PARSE] name=3Dep2in trb=3D0xffffff80093072e0 allocated=3D16
queued=3D41 bpl=3D1987641344 bph=3D0 size=3D49152 ctrl=3D3169 type=3D1 enqu=
eue=3D47
dequeue=3D39
    kworker/3:1H-1147  [003]  7391.966316: dwc3_gadget_ep_cmd:
ep2in: cmd 'Update Transfer' [50407] ri:5 params 00000000 00000000
00000000 --> status: Successful
    kworker/3:1H-1147  [003]  7391.966319: usb_ep_queue:
ep2in: req 0xffffffc07a554200 length 0/49152 sgs 0/0 stream 0 zsI
status -115 --> 0
    irq/175-dwc3-2373  [003]  7391.966382: dwc3_event:           event
(9e61408a): ep2in: Transfer In Progress [40545] (sIm)
    irq/175-dwc3-2373  [003]  7391.966384: dwc3_complete_trb:
[FAILED TO PARSE] name=3Dep2in trb=3D0xffffff8009307270 allocated=3D3276802=
8
queued=3D1764913253 bpl=3D1987313664 bph=3D0 size=3D0 ctrl=3D664292448 type=
=3D1
enqueue=3D47 dequeue=3D40
    irq/175-dwc3-2373  [003]  7391.966386: dwc3_gadget_giveback:
ep2in: req 0xffffffc07a554000 length 49152/49152 zsI =3D=3D> 0
    irq/175-dwc3-2373  [003]  7391.966388:
usb_gadget_giveback_request: ep2in: req 0xffffffc07a554000 length
49152/49152 sgs 0/0 stream 0 zsI status 0 --> 0
    kworker/3:1H-1147  [003]  7391.966425: dwc3_ep_queue:
ep2in: req 0xffffffc07a554000 length 0/49152 zsI =3D=3D> -115
    kworker/3:1H-1147  [003]  7391.966426: dwc3_gadget_ep_info:
ep2in: mps 1024/1024 streams 15 burst 16 ring 47/40 flags 0x29
>c<:>c<>c<>c<>c<:>c<
    kworker/3:1H-1147  [003]  7391.966428: dwc3_gadget_ep_info2:
ep2in: mps 1024/1024 streams 15 burst 16 ring 47/40 flags 0x29
>c<:>c<>c<>c<>c<:>c<
    kworker/3:1H-1147  [003]  7391.966435: dwc3_prepare_trb:
[FAILED TO PARSE] name=3Dep2in trb=3D0xffffff80093072f0 allocated=3D16
queued=3D41 bpl=3D1987313664 bph=3D0 size=3D49152 ctrl=3D3169 type=3D1 enqu=
eue=3D48
dequeue=3D40
    kworker/3:1H-1147  [003]  7391.966437: dwc3_gadget_ep_cmd:
ep2in: cmd 'Update Transfer' [50407] ri:5 params 00000000 00000000
00000000 --> status: Successful
    kworker/3:1H-1147  [003]  7391.966440: usb_ep_queue:
ep2in: req 0xffffffc07a554000 length 0/49152 sgs 0/0 stream 0 zsI
status -115 --> 0
    irq/175-dwc3-2373  [003]  7391.966507: dwc3_event:           event
(9e62408a): ep2in: Transfer In Progress [40546] (sIm)
    irq/175-dwc3-2373  [003]  7391.966510: dwc3_complete_trb:
[FAILED TO PARSE] name=3Dep2in trb=3D0xffffff8009307280 allocated=3D3276802=
8
queued=3D1764913253 bpl=3D1987510272 bph=3D0 size=3D0 ctrl=3D664308832 type=
=3D1
enqueue=3D48 dequeue=3D41
    irq/175-dwc3-2373  [003]  7391.966512: dwc3_gadget_giveback:
ep2in: req 0xffffffc07a554900 length 49152/49152 zsI =3D=3D> 0
    irq/175-dwc3-2373  [003]  7391.966514:
usb_gadget_giveback_request: ep2in: req 0xffffffc07a554900 length
49152/49152 sgs 0/0 stream 0 zsI status 0 --> 0
    kworker/3:1H-1147  [003]  7391.966553: dwc3_ep_queue:
ep2in: req 0xffffffc07a554900 length 0/49152 zsI =3D=3D> -115
    kworker/3:1H-1147  [003]  7391.966555: dwc3_gadget_ep_info:
ep2in: mps 1024/1024 streams 15 burst 16 ring 48/41 flags 0x29
>c<:>c<>c<>c<>c<:>c<
    kworker/3:1H-1147  [003]  7391.966556: dwc3_gadget_ep_info2:
ep2in: mps 1024/1024 streams 15 burst 16 ring 48/41 flags 0x29
>c<:>c<>c<>c<>c<:>c<
    kworker/3:1H-1147  [003]  7391.966563: dwc3_prepare_trb:
[FAILED TO PARSE] name=3Dep2in trb=3D0xffffff8009307300 allocated=3D16
queued=3D41 bpl=3D1987510272 bph=3D0 size=3D49152 ctrl=3D3169 type=3D1 enqu=
eue=3D49
dequeue=3D41
    kworker/3:1H-1147  [003]  7391.966566: dwc3_gadget_ep_cmd:
ep2in: cmd 'Update Transfer' [50407] ri:5 params 00000000 00000000
00000000 --> status: Successful
    kworker/3:1H-1147  [003]  7391.966568: usb_ep_queue:
ep2in: req 0xffffffc07a554900 length 0/49152 sgs 0/0 stream 0 zsI
status -115 --> 0
    irq/175-dwc3-2373  [003]  7391.966632: dwc3_event:           event
(9e63408a): ep2in: Transfer In Progress [40547] (sIm)
    irq/175-dwc3-2373  [003]  7391.966634: dwc3_complete_trb:
[FAILED TO PARSE] name=3Dep2in trb=3D0xffffff8009307290 allocated=3D3276802=
8
queued=3D1764913253 bpl=3D1987706880 bph=3D0 size=3D0 ctrl=3D664325216 type=
=3D1
enqueue=3D49 dequeue=3D42
    irq/175-dwc3-2373  [003]  7391.966636: dwc3_gadget_giveback:
ep2in: req 0xffffffc07a554300 length 49152/49152 zsI =3D=3D> 0
    irq/175-dwc3-2373  [003]  7391.966638:
usb_gadget_giveback_request: ep2in: req 0xffffffc07a554300 length
49152/49152 sgs 0/0 stream 0 zsI status 0 --> 0
    kworker/3:1H-1147  [003]  7391.966673: dwc3_ep_queue:
ep2in: req 0xffffffc07a554300 length 0/49152 zsI =3D=3D> -115
    kworker/3:1H-1147  [003]  7391.966675: dwc3_gadget_ep_info:
ep2in: mps 1024/1024 streams 15 burst 16 ring 49/42 flags 0x29
>c<:>c<>c<>c<>c<:>c<
    kworker/3:1H-1147  [003]  7391.966676: dwc3_gadget_ep_info2:
ep2in: mps 1024/1024 streams 15 burst 16 ring 49/42 flags 0x29
>c<:>c<>c<>c<>c<:>c<
    kworker/3:1H-1147  [003]  7391.966683: dwc3_prepare_trb:
[FAILED TO PARSE] name=3Dep2in trb=3D0xffffff8009307310 allocated=3D16
queued=3D41 bpl=3D1987706880 bph=3D0 size=3D49152 ctrl=3D3169 type=3D1 enqu=
eue=3D50
dequeue=3D42
    kworker/3:1H-1147  [003]  7391.966686: dwc3_gadget_ep_cmd:
ep2in: cmd 'Update Transfer' [50407] ri:5 params 00000000 00000000
00000000 --> status: Successful
    kworker/3:1H-1147  [003]  7391.966688: usb_ep_queue:
ep2in: req 0xffffffc07a554300 length 0/49152 sgs 0/0 stream 0 zsI
status -115 --> 0
    irq/175-dwc3-2373  [003]  7391.966760: dwc3_event:           event
(9e64408a): ep2in: Transfer In Progress [40548] (sIm)
    irq/175-dwc3-2373  [003]  7391.966762: dwc3_complete_trb:
[FAILED TO PARSE] name=3Dep2in trb=3D0xffffff80093072a0 allocated=3D3276802=
8
queued=3D1764913253 bpl=3D1987575808 bph=3D0 size=3D0 ctrl=3D664341600 type=
=3D1
enqueue=3D50 dequeue=3D43
    irq/175-dwc3-2373  [003]  7391.966764: dwc3_gadget_giveback:
ep2in: req 0xffffffc07a554100 length 49152/49152 zsI =3D=3D> 0
    irq/175-dwc3-2373  [003]  7391.966766:
usb_gadget_giveback_request: ep2in: req 0xffffffc07a554100 length
49152/49152 sgs 0/0 stream 0 zsI status 0 --> 0
    kworker/3:1H-1147  [003]  7391.966806: dwc3_ep_queue:
ep2in: req 0xffffffc07a554100 length 0/49152 zsI =3D=3D> -115
    kworker/3:1H-1147  [003]  7391.966808: dwc3_gadget_ep_info:
ep2in: mps 1024/1024 streams 15 burst 16 ring 50/43 flags 0x29
>c<:>c<>c<>c<>c<:>c<
    kworker/3:1H-1147  [003]  7391.966809: dwc3_gadget_ep_info2:
ep2in: mps 1024/1024 streams 15 burst 16 ring 50/43 flags 0x29
>c<:>c<>c<>c<>c<:>c<
    kworker/3:1H-1147  [003]  7391.966816: dwc3_prepare_trb:
[FAILED TO PARSE] name=3Dep2in trb=3D0xffffff8009307320 allocated=3D16
queued=3D41 bpl=3D1987575808 bph=3D0 size=3D49152 ctrl=3D3169 type=3D1 enqu=
eue=3D51
dequeue=3D43
    kworker/3:1H-1147  [003]  7391.966819: dwc3_gadget_ep_cmd:
ep2in: cmd 'Update Transfer' [50407] ri:5 params 00000000 00000000
00000000 --> status: Successful
    kworker/3:1H-1147  [003]  7391.966821: usb_ep_queue:
ep2in: req 0xffffffc07a554100 length 0/49152 sgs 0/0 stream 0 zsI
status -115 --> 0
    irq/175-dwc3-2373  [003]  7391.966881: dwc3_event:           event
(9e65408a): ep2in: Transfer In Progress [40549] (sIm)
    irq/175-dwc3-2373  [003]  7391.966883: dwc3_complete_trb:
[FAILED TO PARSE] name=3Dep2in trb=3D0xffffff80093072b0 allocated=3D3276802=
8
queued=3D1764913253 bpl=3D1987772416 bph=3D0 size=3D0 ctrl=3D664357984 type=
=3D1
enqueue=3D51 dequeue=3D44
    irq/175-dwc3-2373  [003]  7391.966885: dwc3_gadget_giveback:
ep2in: req 0xffffffc07a554e00 length 49152/49152 zsI =3D=3D> 0
    irq/175-dwc3-2373  [003]  7391.966887:
usb_gadget_giveback_request: ep2in: req 0xffffffc07a554e00 length
49152/49152 sgs 0/0 stream 0 zsI status 0 --> 0
    kworker/3:1H-1147  [003]  7391.966922: dwc3_ep_queue:
ep2in: req 0xffffffc07a554e00 length 0/49152 zsI =3D=3D> -115
    kworker/3:1H-1147  [003]  7391.966924: dwc3_gadget_ep_info:
ep2in: mps 1024/1024 streams 15 burst 16 ring 51/44 flags 0x29
>c<:>c<>c<>c<>c<:>c<
    kworker/3:1H-1147  [003]  7391.966925: dwc3_gadget_ep_info2:
ep2in: mps 1024/1024 streams 15 burst 16 ring 51/44 flags 0x29
>c<:>c<>c<>c<>c<:>c<
    kworker/3:1H-1147  [003]  7391.966932: dwc3_prepare_trb:
[FAILED TO PARSE] name=3Dep2in trb=3D0xffffff8009307330 allocated=3D16
queued=3D41 bpl=3D1987772416 bph=3D0 size=3D49152 ctrl=3D3169 type=3D1 enqu=
eue=3D52
dequeue=3D44
    kworker/3:1H-1147  [003]  7391.966935: dwc3_gadget_ep_cmd:
ep2in: cmd 'Update Transfer' [50407] ri:5 params 00000000 00000000
00000000 --> status: Successful
    kworker/3:1H-1147  [003]  7391.966938: usb_ep_queue:
ep2in: req 0xffffffc07a554e00 length 0/49152 sgs 0/0 stream 0 zsI
status -115 --> 0
    irq/175-dwc3-2373  [003]  7391.967011: dwc3_event:           event
(9e66408a): ep2in: Transfer In Progress [40550] (sIm)
    irq/175-dwc3-2373  [003]  7391.967014: dwc3_complete_trb:
[FAILED TO PARSE] name=3Dep2in trb=3D0xffffff80093072c0 allocated=3D3276802=
8
queued=3D1764913253 bpl=3D1987379200 bph=3D0 size=3D0 ctrl=3D664374368 type=
=3D1
enqueue=3D52 dequeue=3D45
    irq/175-dwc3-2373  [003]  7391.967017: dwc3_gadget_giveback:
ep2in: req 0xffffffc07a554600 length 49152/49152 zsI =3D=3D> 0
    irq/175-dwc3-2373  [003]  7391.967019:
usb_gadget_giveback_request: ep2in: req 0xffffffc07a554600 length
49152/49152 sgs 0/0 stream 0 zsI status 0 --> 0
    kworker/3:1H-1147  [003]  7391.967056: dwc3_ep_queue:
ep2in: req 0xffffffc07a554600 length 0/49152 zsI =3D=3D> -115
    kworker/3:1H-1147  [003]  7391.967058: dwc3_gadget_ep_info:
ep2in: mps 1024/1024 streams 15 burst 16 ring 52/45 flags 0x29
>c<:>c<>c<>c<>c<:>c<
    kworker/3:1H-1147  [003]  7391.967059: dwc3_gadget_ep_info2:
ep2in: mps 1024/1024 streams 15 burst 16 ring 52/45 flags 0x29
>c<:>c<>c<>c<>c<:>c<
    kworker/3:1H-1147  [003]  7391.967066: dwc3_prepare_trb:
[FAILED TO PARSE] name=3Dep2in trb=3D0xffffff8009307340 allocated=3D16
queued=3D41 bpl=3D1987379200 bph=3D0 size=3D49152 ctrl=3D3169 type=3D1 enqu=
eue=3D53
dequeue=3D45
    kworker/3:1H-1147  [003]  7391.967069: dwc3_gadget_ep_cmd:
ep2in: cmd 'Update Transfer' [50407] ri:5 params 00000000 00000000
00000000 --> status: Successful
    kworker/3:1H-1147  [003]  7391.967071: usb_ep_queue:
ep2in: req 0xffffffc07a554600 length 0/49152 sgs 0/0 stream 0 zsI
status -115 --> 0
    irq/175-dwc3-2373  [003]  7391.967141: dwc3_event:           event
(9e67c08a): ep2in: Transfer In Progress [40551] (sIM)
    irq/175-dwc3-2373  [003]  7391.967143: dwc3_complete_trb:
[FAILED TO PARSE] name=3Dep2in trb=3D0xffffff80093072d0 allocated=3D3276802=
8
queued=3D1764913253 bpl=3D1987444736 bph=3D0 size=3D268484608 ctrl=3D664390=
752
type=3D1 enqueue=3D53 dequeue=3D46
    irq/175-dwc3-2373  [003]  7391.967145: dwc3_gadget_giveback:
ep2in: req 0xffffffc07a554800 length 0/49152 zsI =3D=3D> -18
    irq/175-dwc3-2373  [003]  7391.967147:
usb_gadget_giveback_request: ep2in: req 0xffffffc07a554800 length
0/49152 sgs 0/0 stream 0 zsI status -18 --> 0
    irq/175-dwc3-2373  [003]  7391.967171: dwc3_event:           event
(9e68c08a): ep2in: Transfer In Progress [40552] (sIM)
    irq/175-dwc3-2373  [003]  7391.967173: dwc3_complete_trb:
[FAILED TO PARSE] name=3Dep2in trb=3D0xffffff80093072e0 allocated=3D3276802=
8
queued=3D1764913253 bpl=3D1987641344 bph=3D0 size=3D268484608 ctrl=3D664407=
136
type=3D1 enqueue=3D53 dequeue=3D47
    irq/175-dwc3-2373  [003]  7391.967175: dwc3_gadget_giveback:
ep2in: req 0xffffffc07a554200 length 0/49152 zsI =3D=3D> -18


regdump=E3=80=81trace: refer to attachment

hope providing some directions for this bug

Best regards

kun peng

--000000000000e636bd05c4658244
Content-Type: application/zip; name="trace_and_regdump.zip"
Content-Disposition: attachment; filename="trace_and_regdump.zip"
Content-Transfer-Encoding: base64
Content-ID: <f_kpqnx0f20>
X-Attachment-Id: f_kpqnx0f20

UEsDBBQAAAgIAPJ9ylKzluMvzgQAAOAgAAAVAAAAbWlzc19pc29jX3JlZ2R1bXAudHh0fZrNktpK
DIX3qco7ZJns1LKNzSIL/qFqAFfb5OZmk5oh5Bnu49+2sd3CLR12ow/5tI8s0c1waNa3ZrM/0Jfv
X+g/er7c50+HIe5iPCMK8fZne/QByPd3cW/EN+1bH8ro7pgoD6Hdj3Z3mb+vaZs+VD6qMXQLuYO+
o9wtq/fufZe6OW37aFFk4UUfIXqoT9f5FW/D28JfOT3y9+GKz1i3lHDVEAv3ufN+td16ml8hIjdH
tW/Xp/OqTnJGkGQc/6lXfnVunhl5WEFO/aJGMN7qgu7L7EMA7oHjLC8WZSVA9szIl9WSqkKA/KlR
VjxYPoJiyOAgX8lLLZ6gLPMqIAHKJ8ioovdHp7FdH/an/bWpV5vdcI/hcs97DOytbZrzcIvdK+dn
fH2+9VHunqNXq34fG9PGwEzvf+9B3j7NuzVrro//hof0K30bluiIizl030AmI5ghmCNYILhAsESw
QnCJoCNIoUcOmuSgSw7a5HSfTrwJnf1VX/IA9RUPUF/wAPX1DlBf7gDhavWqDlCv6gD1qg5Qr+po
ArYIemRUdaTQJaOqIzWf/tVmY1R1gOZz2EHzMeyg+RR20HwIOwhXa/ZqB81e7aDZqx00e7U3AVsE
PbJ7tafQJbtXe6r6lNWneieb1dEjQJ5Rdc0TVdc8UXXNE1XXPFG8ZrW4E1WrO1G1vBNV6xvdUAsc
MXZLL3HE2C+9yBGnjrU/+w3C6ddr6/Y7gcimNefdlqB8YeOCs3yZsHG1i/C57apXNi61/FMmbFzn
sngkLK1rZGlVI0trGllaUXHvaT0FTKspYFpLAdNKCpjWUUBURYfsccgfhwxyyCFGDjFyiJFDjBxi
5BAjhxg5xMghRg4xcihDDmWpQ17tyoyKFzbmhXiSx4ClvvqkKzWWuupBV3rQlR50pQdd6VFXetSV
HnWlR13pUVd61JUedaVHXelRV3rUlR51pUdd6VFXetSVHnWlR13pUVd61JUedaVHXelRV3rUlbsf
l3a19W/XsSvLv5RnL+x4UrbAHZv1sotkc71dWiVrPNRXEYQT/+dP2/jFTX6nqupDw1clFf0leu/S
t7MvbtiFT9Ht+MUNUcX3+/IeQofNeRuEZup9WMbCfmC7etvVu8tKhPmjU6qfl+D0JibmpGX5KyMr
bxZfvGgl5RFaDmgZeSLuEq2kH4SWzWjG3KQV49lgbdRK2kto2YxmLGrFeJFoJd0qtPLoYTXXMvJE
PEs8TJpfaNmMLCbiBS2petFKZonQshnNWPQwxsvEw2Q0CS2b0YxFrRivEq1k0gktm9GMRa0YXyZa
yeAUWjYji4EcVj7MZTPbkEyIsljZH0g9G5IJURYrWw6phyaIBVEWK7sYqYemiAVRFisbI6lnQzIh
ymJlryX10DSxIMpiZfsm9dBEsSDKYmVHKPXQVLEgymJlkyn10GSxIMpiZd8q9dB0sSDKYmUrLD/A
0XyxIMpiZXct9dB8sSDKYmXDLvXgDsWaLyCLlTOA1EPzxYIoi5VjhdRD88WCKIuVk4rUQ/PFgiiL
lcOP1EPzxYIoi5XzlNRD88WCKIuVI5rUQ/PFgiiLlVOf1EPzxYIoi5WDpNy0o/liQZTFytlU6qH5
YkEFXNMfCFynf8nHUDhnKqHkNwPXePQ0Q/8DUEsDBBQAAAgIABGDylJUzbhqdSEAAC4lAgAYAAAA
bWlzc19pc29jX3RyYWNlX2luZm8udHh01Z1dj2O3kYbvF8h/0F3iC+8hWcWvwU4AI+vFGtjNBk72
yjCMnm71ZJD5cndPss6vX7I9I6mb0lGReqlDOZ+2Z8yimnVe8VQ99f7mX1bpj7/948Pd39Z3E73Q
//m11uxXqx+Uoh9XK09R/2u0Lv3rxermH9f00/rjTz9/Wn9av1h9/mP90bx5/2J1t/55pf7v9vGP
a+WvrOWg1Ort+v3rh7+u1MRRW7P65/13q5cvf79Kq9jfiNf2n9d+fXXzev2QQ3jz/vbDi83a7z7e
r7QyPOX/Wt0/3K2v3qW/YlevPt3dP6y0W929ef96ZYya0n9Wt2+vXt+nYI1erX5//W8v0n82/85/
Ig7Mq72B6ReLB/blE/t4t/54dbf+6eHu1a8/sB/+45vv/uvbf1/95X9Wf/rm+z9/++Pq/dW79cvH
eFfpV7388jNMP7xIyt9cq9XV27cfrq8e1jcvU8CPP/ybl0SrVx/fvtQxeGb25NKf/vWlWt2/+ef6
5a8/6+uHu7cvSbu4evjl4/qlXq3fP/7mlybt72b95f8r8a5C+XFfv7t5sT2D6c9Wv/3zw9Xdw+ov
d1fv72/Xd79d/RDX2itW7sf0Yb9Qq/R55B+C+vzHyt8qjnmbm7/y9de/Tz+rq4dP9y9Wf/50fb2+
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
--000000000000e636bd05c4658244--
