Return-Path: <linux-usb+bounces-6756-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D6FE885B1FF
	for <lists+linux-usb@lfdr.de>; Tue, 20 Feb 2024 05:51:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6115F283D2B
	for <lists+linux-usb@lfdr.de>; Tue, 20 Feb 2024 04:51:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F0B456777;
	Tue, 20 Feb 2024 04:50:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="oLI2nsWA"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4810456759
	for <linux-usb@vger.kernel.org>; Tue, 20 Feb 2024 04:49:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708404634; cv=none; b=Iz731nSCfN882b1gfFt388PtGUEPnKwswCJ0+thZdRyuRU+vTzLgqCfTX58/rH/IjEubr74IbwCln9Th3/xzDyJUWnNPLu4ZEmvzFCVQv21XajvFVXUYp1BNxI2qFTtzP4FMLdhDwG9VibsWHyJQ0wCkfJtxr6UwHf/KvEdRwFE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708404634; c=relaxed/simple;
	bh=gnYTVEhLa2UI/BXFUj5DRblz/ShatFGmeSySyZRlwEs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PyRL4dGxfN4HNgvR6M/4Tf00nM/Kuy+BR2GlBkNCZiT734ilSeriO51S9OU7c/L+Y+CneEZJDq//4rxSbwfnDSQ3v4Bio5BedKiL/NdHc8r8T+8JZP2VJIjuFw09NPbQAjfk6ujVD7q/GDb3NCr8eVxv+AgXEDUhKXnb5DRpltU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=oLI2nsWA; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-563f675be29so4267634a12.0
        for <linux-usb@vger.kernel.org>; Mon, 19 Feb 2024 20:49:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1708404589; x=1709009389; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JBhO9GN51pgFt/DHFo2a0IcTSs/s3/od7X4R5TK/fL0=;
        b=oLI2nsWAk2u4tJZ11LOn1pGymu9wIL0kYfzpzXPEnpuHM78lZl0YjezwVMXHvNRk/9
         fg9BDdiDVh7pv9szb3DmBCrAXqD7FFwJ+dVKoJN3pnqVBi9koZt6d26mFd7AxFOLpohe
         PxrbZdbAHY8gVSettOPYJiS2Uavxfo1pxYrq0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708404589; x=1709009389;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JBhO9GN51pgFt/DHFo2a0IcTSs/s3/od7X4R5TK/fL0=;
        b=g1c6gnn8AdwDBf0yDiCBOrcXWFeyDWr+pAzDFRD0C7DukFfFpze7pZHau/MQis6pFt
         agpeLyUSbJu0NpPrEJLUd25vqlaFE27MkiNZfidc80PkCtt2HitBLloIiGF7liDfeTUh
         tfINAM8Hq+hd/w8MtdpsmLbINyzIaBA9f90Xu74U1gLDMWW3pPHaCkXxD+jOFt/LSoFP
         h6HEpET5dLwlHkHdYLtiN/PEzpqKkerpqs8cpWbAr3Z9JoaGXcWfnkFCukFsmC+aQPIj
         GHMuu6gm8Q1HF7qLqstYBt+sbAuEuCPt6G0u5mFN1/kyCnF4cyRDFmFX7suJDiiwOuCS
         vClw==
X-Forwarded-Encrypted: i=1; AJvYcCWvr3AjqZ15iK0oKhDEaDp8AQnVteDNS1oejNNMAAbUo22rcYVQpIQaOW763PghKCBQw3z1BN2HA26IvtfVOCqKsQXDKwWaVfVI
X-Gm-Message-State: AOJu0YzuLIUwlb/JGiZe55zCcBbY0Y5pmKhSh/Y/lFTNxEsYoELRTN3o
	s4E5Bmxis/Kje39xB0mc0PwLSr9CB/4LHUyh4jTMO8W49iWoaUUGITyixEDSkBVzgEof/iPmKbb
	YyA==
X-Google-Smtp-Source: AGHT+IF4Kvw+onQowCYe9W5SeFCRpsMoEjXvkl73BuNm+fVx/UWs1zMUiIX2PuW7v/FcfU9OFPIllQ==
X-Received: by 2002:a05:6402:234b:b0:563:c54e:f1 with SMTP id r11-20020a056402234b00b00563c54e00f1mr11488231eda.2.1708404589798;
        Mon, 19 Feb 2024 20:49:49 -0800 (PST)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com. [209.85.221.47])
        by smtp.gmail.com with ESMTPSA id y24-20020aa7ccd8000000b00564063a3391sm3296627edt.4.2024.02.19.20.49.48
        for <linux-usb@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Feb 2024 20:49:48 -0800 (PST)
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-33d6f1f17e5so36813f8f.3
        for <linux-usb@vger.kernel.org>; Mon, 19 Feb 2024 20:49:48 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUKFl/yXkX13F9LlGGIskinZ2/w2Bg+zAV0LpdlZEqjmGUHdBc4WWL/8zaaaJ3HMq2sNVD3gaslgL5TUccLuJdhDDtYNczKVQfB
X-Received: by 2002:a5d:44cd:0:b0:33d:3893:838a with SMTP id
 z13-20020a5d44cd000000b0033d3893838amr5261433wrr.56.1708404587902; Mon, 19
 Feb 2024 20:49:47 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <000000000000cb40790611bbcffd@google.com> <98b81fbf-4905-4b45-a8c0-33e7399ef84a@collabora.com>
In-Reply-To: <98b81fbf-4905-4b45-a8c0-33e7399ef84a@collabora.com>
From: Tomasz Figa <tfiga@chromium.org>
Date: Tue, 20 Feb 2024 13:49:30 +0900
X-Gmail-Original-Message-ID: <CAAFQd5Cs-eeHsCZ6VWrzChTJqd4FSqBS4z6ncd8tPQPNMdN68Q@mail.gmail.com>
Message-ID: <CAAFQd5Cs-eeHsCZ6VWrzChTJqd4FSqBS4z6ncd8tPQPNMdN68Q@mail.gmail.com>
Subject: Re: [syzbot] [usb?] [media?] possible deadlock in vb2_video_unregister_device
To: Benjamin Gaignard <benjamin.gaignard@collabora.com>
Cc: syzbot <syzbot+3b1d4b3d5f7a358bf9a9@syzkaller.appspotmail.com>, hdanton@sina.com, 
	hverkuil-cisco@xs4all.nl, hverkuil@xs4all.nl, 
	laurent.pinchart@ideasonboard.com, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, linux-usb@vger.kernel.org, 
	m.szyprowski@samsung.com, mchehab@kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 20, 2024 at 12:49=E2=80=AFAM Benjamin Gaignard
<benjamin.gaignard@collabora.com> wrote:
>
>
> Le 19/02/2024 =C3=A0 14:10, syzbot a =C3=A9crit :
> > syzbot has bisected this issue to:
> >
> > commit c838530d230bc638d79b78737fc4488ffc28c1ee
> > Author: Benjamin Gaignard <benjamin.gaignard@collabora.com>
> > Date:   Thu Nov 9 16:34:59 2023 +0000
> >
> >      media: media videobuf2: Be more flexible on the number of queue st=
ored buffers
> >
> > bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=3D166dc872=
180000
> > start commit:   b401b621758e Linux 6.8-rc5
> > git tree:       upstream
> > final oops:     https://syzkaller.appspot.com/x/report.txt?x=3D156dc872=
180000
> > console output: https://syzkaller.appspot.com/x/log.txt?x=3D116dc872180=
000
> > kernel config:  https://syzkaller.appspot.com/x/.config?x=3Deff9f3183d0=
a20dd
> > dashboard link: https://syzkaller.appspot.com/bug?extid=3D3b1d4b3d5f7a3=
58bf9a9
> > syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=3D13ffaae81=
80000
> > C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=3D13ef909c180=
000
> >
> > Reported-by: syzbot+3b1d4b3d5f7a358bf9a9@syzkaller.appspotmail.com
> > Fixes: c838530d230b ("media: media videobuf2: Be more flexible on the n=
umber of queue stored buffers")
> >
> > For information about bisection process see: https://goo.gl/tpsmEJ#bise=
ction
>
> Hans,
> I think the issue occur because of this part of the commit:
> @@ -1264,7 +1264,7 @@ void vb2_video_unregister_device(struct video_devic=
e *vdev)
>           */
>          get_device(&vdev->dev);
>          video_unregister_device(vdev);
> -       if (vdev->queue && vdev->queue->owner) {
> +       if (vdev->queue) {
>                  struct mutex *lock =3D vdev->queue->lock ?
>                          vdev->queue->lock : vdev->lock;
>
> but I wonder if the correction shouldn't be to remove usbtv->vb2q_lock mu=
tex in usbtv_video_free().
>
> Any opinion ?

That is probably what triggered the failure detected by syzbot, but I
don't think we've ever had a guarantee that owner is NULL in that
code.

Looking at the uvc driver [1], it doesn't seem to need any special
locking there (after all the vb2 code acquires them).  (It also
doesn't have the custom clean-up code that the usbtv driver has in
usbtv_stop(), but that's another story). So maybe all we need to fix
it is removing the mutex_lock/unlock() calls?

[1] https://elixir.bootlin.com/linux/v6.8-rc4/source/drivers/media/usb/uvc/=
uvc_driver.c#L1906

Best,
Tomasz

