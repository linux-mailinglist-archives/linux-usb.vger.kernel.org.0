Return-Path: <linux-usb+bounces-17549-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EAAB9C6D1D
	for <lists+linux-usb@lfdr.de>; Wed, 13 Nov 2024 11:46:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 33840283B2C
	for <lists+linux-usb@lfdr.de>; Wed, 13 Nov 2024 10:46:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B31891FF03B;
	Wed, 13 Nov 2024 10:46:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="SAI7NdRF"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 886531F80BF
	for <linux-usb@vger.kernel.org>; Wed, 13 Nov 2024 10:46:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731494778; cv=none; b=tmrsGF8MmQTG/5JFGKwZDc3WZSWMXRbSmJG40HA/wUwNu6gLvUNUFm4NgnSNwVDH3z2oYNS+teMSxLLudPvfbWBRLLo2qAvMhj9QACCH/evppSvB7zs1n7fhGAMkSogVOvNia9cX0iU3MV/4kNUgNZMzEfR33wJcbKJETCNkXlM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731494778; c=relaxed/simple;
	bh=Kp+BLfVyWf8Zi8+NKD+dUweFO180UCzKgD06LzuxrHY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jBOFdwTqNGRU1ziS9sTq5C6w264OYbEIxlhGz38VXi4jMNVHw6ymW8SaK8Hr30kGkdtD8WYYG72iML6EwGbb+aOh23x17JNK7TpvsnA7u9pwWsp/gs5nZms6hd/VviZaEAx7LBEzwAItatYt+M/O0IMwV/B+TzS9qg7lMVMjnKE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=SAI7NdRF; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-2e3010478e6so5378770a91.1
        for <linux-usb@vger.kernel.org>; Wed, 13 Nov 2024 02:46:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1731494773; x=1732099573; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JkdjSCY4IBY8cdoM/p6vlIUOl96lMNAE6LT/b/G4P44=;
        b=SAI7NdRFKpW0hbPapeM4kf19Nn+X20x2DP9+x8CbRwCPkHkGYPX4CchxZZfw6mGzuS
         FOoWA0d81rGm3MrXC+EZL2oXhCeBjBN4I5WpCIDYaoGEChQX3mjRbf1qW8Ch2Yd6RRES
         2GNHX8l/VM09uGhADWKlFrGH8QFlFPIhceRmdi2mc0+a81/Q7djeo6k9udc0avXY6OEP
         lBuWRhoUucU/4i4avqm69IN5zdq8vQPZBH5acFZfnCTrXKNTu72ZQuhg5Ss3Sk14YsEU
         fbnwbp09AMor3h4hViut5s8cCiuwKjtqtS1LVjG0xKSzu7Q184zNIqXC/yiCIXSZBpCH
         olzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731494773; x=1732099573;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JkdjSCY4IBY8cdoM/p6vlIUOl96lMNAE6LT/b/G4P44=;
        b=oJUI4gwxlR5Q9S9Ax0hW/6zWY6CrJGzOIQmWVaLQVA4XbYvuGd9wM58jCY624GpQCD
         CRk555xE6nyHqCHCsPkN6rE9su3/K3imcyGxTZi6jlkdSfM0A3N4wZm7Pc8AaKEnrNBn
         Kv+a+zJaE+Usvmfh2slzPKsXcDB+qarftxaLCjew6qbmiGMqvKonIdG0cB2iCeAhDEMU
         ien51IBQDfMf2kB6FrzngHLjy8Qh9MmkCULk0XTWpFHm+hA29tMN9dugu8XYY/b8c0dG
         Zfd3ZBTjuVcQ4sgsTb+NmGbtX2DVDNVtSRzF/8TD7xBySS56Gox0hclTHWWayZWhyiVj
         0Tvg==
X-Forwarded-Encrypted: i=1; AJvYcCVPJwj8jS86o96Pku5KlRleF6dU+pxK9ucNypV+cRsnVcmMV7/dOruf8HQ/niKx6j0uIzIyrTSi+Hw=@vger.kernel.org
X-Gm-Message-State: AOJu0YwAR4llb6M6kcevBMaY7SeLRlJxEUCQWBqu3mSpWjdoa/Uo0BYg
	q3VpVZq3hp2emUYx6odCHyVbx0YdFvbqFZ3zeOIgBtumhpE3tlKcuma9l2fSwTEyhqMG16WSTdj
	++nY6fmoYvsBs9nt8yFr92VTt1uFTFJwmslId
X-Google-Smtp-Source: AGHT+IFn3w+1CivlSJtOoLQy9jPd2fijjv21m8eKpPGd9dfHQ1S1RTRG7WMozIirUVRQXxkc9zCZ/vV69nMRKooOd1I=
X-Received: by 2002:a17:90b:1f8b:b0:2e2:ef25:ed35 with SMTP id
 98e67ed59e1d1-2e9b14d565fmr24768577a91.0.1731494772711; Wed, 13 Nov 2024
 02:46:12 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <6731d32b.050a0220.1fb99c.014d.GAE@google.com> <1af819ae-cd88-4db0-af6e-02064489ebb2@rowland.harvard.edu>
In-Reply-To: <1af819ae-cd88-4db0-af6e-02064489ebb2@rowland.harvard.edu>
From: Aleksandr Nogikh <nogikh@google.com>
Date: Wed, 13 Nov 2024 11:46:00 +0100
Message-ID: <CANp29Y7RA00bKOinkjSDBchbkx3RDvWXGs4hr0PrPKyqSEC-_g@mail.gmail.com>
Subject: Re: [syzbot] [usb?] KASAN: slab-use-after-free Read in ld_usb_release
To: Alan Stern <stern@rowland.harvard.edu>
Cc: syzbot <syzbot+e8e879922808870c3437@syzkaller.appspotmail.com>, 
	gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, syzkaller-bugs@googlegroups.com, 
	syzkaller <syzkaller@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Alan,

On Mon, Nov 11, 2024 at 4:45=E2=80=AFPM Alan Stern <stern@rowland.harvard.e=
du> wrote:
>
> On Mon, Nov 11, 2024 at 01:49:31AM -0800, syzbot wrote:
> > Hello,
> >
> > syzbot found the following issue on:
> >
> > HEAD commit:    2e1b3cc9d7f7 Merge tag 'arm-fixes-6.12-2' of git://git.=
ker..
> > git tree:       upstream
> > console output: https://syzkaller.appspot.com/x/log.txt?x=3D1650d6a7980=
000
> > kernel config:  https://syzkaller.appspot.com/x/.config?x=3Db77c8a55ccf=
1d9e2
> > dashboard link: https://syzkaller.appspot.com/bug?extid=3De8e8799228088=
70c3437
> > compiler:       gcc (Debian 12.2.0-14) 12.2.0, GNU ld (GNU Binutils for=
 Debian) 2.40
> > userspace arch: i386
> >
> > Unfortunately, I don't have any reproducer for this issue yet.
>
> Question for the syzbot people:
>
> If I have a patch which I think will cause the issue to become
> reproducible, is there any way to ask syzbot to apply the same test that
> failed here to a kernel including my patch?

No, that's unfortunately not supported.

In this particular case, it's at least evident from `Comm: ` which
exact program was being executed when the kernel crashed:

[  178.539707][ T8305] BUG: KASAN: slab-use-after-free in
do_raw_spin_lock+0x271/0x2c0
[  178.542477][ T8305] Read of size 4 at addr ffff888022387c0c by task
syz.3.600/8305
[  178.546823][ T8305]
[  178.548202][ T8305] CPU: 3 UID: 0 PID: 8305 Comm: syz.3.600 Not
tainted 6.12.0-rc6-syzkaller-00077-g2e1b3cc9d7f7 #0

syz.3.600 means procid=3D3 and id=3D600, so it's the program that comes
after the following line in
https://syzkaller.appspot.com/x/log.txt?x=3D1650d6a7980000:

551.627007ms ago: executing program 3 (id=3D600):
<...>

You may try to treat that program as a normal syz reproducer and run
it against your patched kernel locally, that should be quite
straightforward to do (just several commands). See e.g. the
instructions here:
https://github.com/google/syzkaller/blob/master/docs/syzbot_assets.md#run-a=
-syz-reproducer-directly

--=20
Aleksandr

>
> Alan Stern
>
> --

