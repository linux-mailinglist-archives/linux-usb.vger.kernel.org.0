Return-Path: <linux-usb+bounces-17156-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E30CC9BDDD0
	for <lists+linux-usb@lfdr.de>; Wed,  6 Nov 2024 04:53:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0AB031C20C94
	for <lists+linux-usb@lfdr.de>; Wed,  6 Nov 2024 03:53:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4FC7A1917C0;
	Wed,  6 Nov 2024 03:52:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="M0Kdc9z/"
X-Original-To: linux-usb@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42F5218FC85
	for <linux-usb@vger.kernel.org>; Wed,  6 Nov 2024 03:52:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730865176; cv=none; b=lK1ETBDG5TmjNrkWMYpLzKSvO4QRmU/n6Im4ED/zcT4JAjG8BUwyWXjoHpMMhhJPRCZ6PgdM7/mQ6Y0BFZi3QgMLTuKEYPwqGjIqjBDQlHokmxZm8tqO9/8zq+neRp9TqhvQGp2+uXMDq4XuK6fFVScyZJi4ILTt8eI0y8rBsFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730865176; c=relaxed/simple;
	bh=5aE09eJAw+DWO/GK0+6zxMbedIgfEssWtZFIf9Rdfcw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TTOTNs090cPqf9Ta4nJrq0iXwSQ7wL2+SBBVrb8iL41GUA5qXd9R+GY7+wYxTyYy8P5i9drehNmxpXhW2+LWSDkONfZfzJW8BvkBCbf8123UaN6F0mbd+/L5bFD3e28lZ1v0itW7n4+x6Cv8Y9o+ly6Cx7PVUFwyJn7qmy8dTf8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=M0Kdc9z/; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1730865174;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1TiMSpJJDatpGrOSJe9rj+NgTUiSiplFcFvJnfcnFCY=;
	b=M0Kdc9z/5pn60hTknqngCRY/ctNyZr+ZZjJPE7l5bsq5wyI11RyjCTM8yU2JqPf3jp15tY
	DpdQ07z18KN1dNMKrV6mqixPrEeWPZn7NPRTCG+A2pP4si7EHv4bsNcv09eJiFGR1TKYlH
	uedX2McbaX2ji7oM/Fn2JmuamTprFVc=
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com
 [209.85.222.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-448-jl1Gr3hJNkOTIaA2kajr7Q-1; Tue, 05 Nov 2024 22:52:51 -0500
X-MC-Unique: jl1Gr3hJNkOTIaA2kajr7Q-1
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-84ff1850a9dso1480314241.3
        for <linux-usb@vger.kernel.org>; Tue, 05 Nov 2024 19:52:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730865170; x=1731469970;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1TiMSpJJDatpGrOSJe9rj+NgTUiSiplFcFvJnfcnFCY=;
        b=kQvF1bywy2tY9WajT4u1T3NdNdWH/R58Fc4IHg/b6qxUH3q29FSvJdzn6serObXyF+
         lheR2jtzlsbrN1I34lriGkZl2O4Klaxuog7Cv19aXcJOdA0s/9zshtU3vXm8QprUjRmW
         g6ES1VV3QR9cPwApCOkFKWUzfyTWW3g6mRqATw2dUALqeJvCOrROWY40XvInVxJlBcES
         SP61lNTa8OY6JV2BODhPIiLAgCaBIC++o+RhoXvHyessqVOOxM3DNyHDVtVxwO6IzEtr
         N3TPN4EDKwbI7TfiJVcj6XBmSqCVtPBr386fvnB5GOt3K7rmf37QJghiKk1Kt5CSCr0A
         DVBA==
X-Forwarded-Encrypted: i=1; AJvYcCWEHqzB32tY8ao8AyJKd8GNA1S3pzdebrB2QIedcew6FhmbRHhr9lELctCmxXwBRH4+AyNGssrnTfc=@vger.kernel.org
X-Gm-Message-State: AOJu0YxhEi9NagYcu9cpMt6t89NLLeaF/yE37lKA+SPbzc/k7f+rtfrU
	IIISxq8hOUZv1lVjt74IzEiraZOvcUUb+MBAtkS2gSJV94o7vsj3xglHfQvHRXVh5DNJl3NvC8f
	DexmBN865kJgZlnSesMVQKC+1AQujDi4ZbfjWaSRggtNFE2vt9p5notyCmK4ALRdaJRQxN+OSAd
	RBF4zMfR8M/o+nSBlSRNrLgZZL76ujhY6Q
X-Received: by 2002:a05:6102:54a6:b0:4a3:a137:ba7 with SMTP id ada2fe7eead31-4a9542a6648mr20367588137.9.1730865170504;
        Tue, 05 Nov 2024 19:52:50 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEhhXYpi0AcG+0c1Qcso/83tNVaNoAmn2rY1up2L2z39Hn10xr/7RtAngqs2ZydHcl7R3SGQT71bMWdEEDqwlk=
X-Received: by 2002:a05:6102:54a6:b0:4a3:a137:ba7 with SMTP id
 ada2fe7eead31-4a9542a6648mr20367570137.9.1730865170142; Tue, 05 Nov 2024
 19:52:50 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <672ad483.050a0220.2edce.1518.GAE@google.com>
In-Reply-To: <672ad483.050a0220.2edce.1518.GAE@google.com>
From: Ming Lei <ming.lei@redhat.com>
Date: Wed, 6 Nov 2024 11:52:39 +0800
Message-ID: <CAFj5m9+1dZtWufO0xzGgWPyMjD1NZ_a-kfeW+Q3ujH_rnR09hg@mail.gmail.com>
Subject: Re: [syzbot] [block?] [usb?] WARNING: bad unlock balance in blk_mq_update_tag_set_shared
To: syzbot <syzbot+5007209c85ecdb50b5da@syzkaller.appspotmail.com>
Cc: axboe@kernel.dk, linux-block@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 6, 2024 at 10:38=E2=80=AFAM syzbot
<syzbot+5007209c85ecdb50b5da@syzkaller.appspotmail.com> wrote:
>
> Hello,
>
> syzbot found the following issue on:
>
> HEAD commit:    c88416ba074a Add linux-next specific files for 20241101
> git tree:       linux-next
> console output: https://syzkaller.appspot.com/x/log.txt?x=3D12d3474058000=
0
> kernel config:  https://syzkaller.appspot.com/x/.config?x=3D704b6be2ac2f2=
05f
> dashboard link: https://syzkaller.appspot.com/bug?extid=3D5007209c85ecdb5=
0b5da
> compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Deb=
ian) 2.40
> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=3D16d34740580=
000
>
> Downloadable assets:
> disk image: https://storage.googleapis.com/syzbot-assets/760a8c88d0c3/dis=
k-c88416ba.raw.xz
> vmlinux: https://storage.googleapis.com/syzbot-assets/46e4b0a851a2/vmlinu=
x-c88416ba.xz
> kernel image: https://storage.googleapis.com/syzbot-assets/428e2c784b75/b=
zImage-c88416ba.xz
>
> IMPORTANT: if you fix the issue, please add the following tag to the comm=
it:
> Reported-by: syzbot+5007209c85ecdb50b5da@syzkaller.appspotmail.com
>
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> WARNING: bad unlock balance detected!
> 6.12.0-rc5-next-20241101-syzkaller #0 Not tainted
> -------------------------------------
> kworker/1:1/57 is trying to release lock (&q->q_usage_counter(queue)) at:
> [<ffffffff8497aa7f>] blk_mq_update_tag_set_shared+0x27f/0x350 block/blk-m=
q.c:4131
> but there are no more locks to release!

#syz test: https://github.com/ming1/linux.git for-next


