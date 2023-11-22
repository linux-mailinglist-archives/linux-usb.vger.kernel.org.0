Return-Path: <linux-usb+bounces-3175-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 375077F4500
	for <lists+linux-usb@lfdr.de>; Wed, 22 Nov 2023 12:40:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 63FF01C209FF
	for <lists+linux-usb@lfdr.de>; Wed, 22 Nov 2023 11:40:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CCB0B584D6;
	Wed, 22 Nov 2023 11:40:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="V2TadWeB"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com [IPv6:2607:f8b0:4864:20::62f])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C1BEC1AC
	for <linux-usb@vger.kernel.org>; Wed, 22 Nov 2023 03:40:11 -0800 (PST)
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-1cc79f73e58so159155ad.1
        for <linux-usb@vger.kernel.org>; Wed, 22 Nov 2023 03:40:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1700653211; x=1701258011; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3Lluk3sxaDufWvRRHog2K6boAXw3L6t6DxADVDkrIhI=;
        b=V2TadWeB3dFTClHliXaf/QTxmNpe00DBBFLjWe9rNTX+1PxBv3ECQZ22Hqf3ojF8Mb
         /oqydbjbLsM8YX5uM/alPM4xrb0QIE/rRwmd6gKqLkkQcdk7QnEw5IFyfy1LdAFNUUDH
         NY3x7a/BDIaRsJgPhdDjTbANsCWSkarfMlgi0TzdTjHrFVivyp0WOHZstJ6422Mf82BE
         WghhsifdXHcKyLi9HpzJMeH7wc62RIJ4b32IokBoycAQbmP6SEhfk573t8xsJzXza5mz
         8LzLIpR0q28/UBRd3TaxOITYiYR4IXssjNQLyr/A9sWesqafX+SnNhODmTRTE9Mlc7L8
         pj8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700653211; x=1701258011;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3Lluk3sxaDufWvRRHog2K6boAXw3L6t6DxADVDkrIhI=;
        b=cnjU5vRsZ90y8sjX5HhWrrz1MmptxvHVZ/zsrfn+XPIRjnp53RUM/TmdLgGN8m+htV
         cOE9/SIjbJ/41yp8VaVjz8x8MhMVehdsOeKpipONd0PfLA51NdlwDfh//XRNQsVTU/Ef
         SSGonZ+LDzdFg8cP/YDDF+YX+IJCXW28VTXnxgE1pkr3YgggUk1lgeBVelGpZ6zZhIzf
         wqt+fNh017Ydcy+zWtj/jBYyTH152buc8HrgWQc3bjMWrShoaZYtUtdHzWNX65ZaiCAw
         j2JC4rifYPEVU+9uxStTlmb7usuKDGq93ygPdF4iaCCefFDzmN6Brpf9OzYFO/wpvZYu
         e/jQ==
X-Gm-Message-State: AOJu0YyAzksl1OUUNH031ZuV0IEqhemsB1WpzQ7IifjhG+rIiZoTohwY
	hBoQHowWJ8nn6VPStl9amHA0MMCmHJdgHUozZhYwfw==
X-Google-Smtp-Source: AGHT+IHJxduaYetIEC6/naZ4h7Q74HCwny7yIKJCmAYpFQsBgE3tvaa7aw/0dNY9WbXigs0npyfK6618r1P9K4U7GnI=
X-Received: by 2002:a17:902:f7c6:b0:1cf:5c9b:bb69 with SMTP id
 h6-20020a170902f7c600b001cf5c9bbb69mr173637plw.11.1700653210859; Wed, 22 Nov
 2023 03:40:10 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <0000000000003ee3610599d20096@google.com> <0000000000002a1fec060ab0120c@google.com>
 <20231121214541.GB3909@pendragon.ideasonboard.com>
In-Reply-To: <20231121214541.GB3909@pendragon.ideasonboard.com>
From: Aleksandr Nogikh <nogikh@google.com>
Date: Wed, 22 Nov 2023 12:39:58 +0100
Message-ID: <CANp29Y5DNhTA8Oi1B2Kdmog-6tbuSL8mz66P7=dHR0hEgGAZnQ@mail.gmail.com>
Subject: Re: [syzbot] KASAN: use-after-free Read in __media_entity_remove_links
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: syzbot <syzbot+0b0095300dfeb8a83dc8@syzkaller.appspotmail.com>, 
	andreyknvl@google.com, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, linux-usb@vger.kernel.org, mchehab@kernel.org, 
	sakari.ailus@linux.intel.com, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks for reporting the problem!

Syzbot looked at the last ~1.5 years of commit history to find the
commit, which is almost always enough, but not in this particular
case.

I've filed https://github.com/google/syzkaller/issues/4347 to fix the
syzbot code.

--=20
Aleksandr

On Tue, Nov 21, 2023 at 10:45=E2=80=AFPM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> On Tue, Nov 21, 2023 at 01:13:15PM -0800, syzbot wrote:
> > This bug is marked as fixed by commit:
> > media: uvcvideo: Avoid cyclic entity chains due to malformed USB descri=
ptors
> >
> > But I can't find it in the tested trees[1] for more than 90 days.
> > Is it a correct commit? Please update it by replying:
> >
> > #syz fix: exact-commit-title
>
> What logic does syzbot use to try and find the commit upstream ? There's
> a commit with the exact same subject, what was missing to find it
> automatically ?
>
> > Until then the bug is still considered open and new crashes with
> > the same signature are ignored.
> >
> > Kernel: Linux
> > Dashboard link: https://syzkaller.appspot.com/bug?extid=3D0b0095300dfeb=
8a83dc8
> >
> > ---
> > [1] I expect the commit to be present in:
> >
> > 1. for-kernelci branch of
> > git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git
> >
> > 2. master branch of
> > git://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git
> >
> > 3. master branch of
> > git://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf.git
> >
> > 4. main branch of
> > git://git.kernel.org/pub/scm/linux/kernel/git/davem/net-next.git
> >
> > The full list of 9 trees can be found at
> > https://syzkaller.appspot.com/upstream/repos
>
> --
> Regards,
>
> Laurent Pinchart

