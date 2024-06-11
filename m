Return-Path: <linux-usb+bounces-11140-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 51100903D8E
	for <lists+linux-usb@lfdr.de>; Tue, 11 Jun 2024 15:35:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 10A3E1C23426
	for <lists+linux-usb@lfdr.de>; Tue, 11 Jun 2024 13:35:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E50217D34C;
	Tue, 11 Jun 2024 13:35:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="YUKhS8Gl"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5AF61E535
	for <linux-usb@vger.kernel.org>; Tue, 11 Jun 2024 13:35:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718112919; cv=none; b=pjfpWBnZudBtO3AVQE8lew5QMP37SfDrCgcgB9u5y0rP0bHXSbOl6EDxu4twh0Yswl7U6CfrM0atRo4dUdTJJtQ/AlmFvJt8Jo3/t0J3DUZWH1LxfBsW/NF/RU5QvZx3dx+mXzS1F329qoQEgUVaW//RDC6Sw9lioLXoOlPVL+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718112919; c=relaxed/simple;
	bh=3oHoG/rUvG+suNrPba6sWXwasYJyuMVroRrTP18iosU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pX+B9pHbZIn4luuWhpKl7+ad7BpZjydvOYkXsupbdB+MIJV5G9sHeurlkxIbtpqfgGm8lru2Hx932UEkUJ7iWDOn15ddQxK0G37MhBii6qxB5uDwh3RTBEl6+ftbe1KtbEfD/Yf/qSam7De05xdTY7qlLB4B5hsPDWXjUxerdVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=YUKhS8Gl; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-1f70fdc9645so132665ad.1
        for <linux-usb@vger.kernel.org>; Tue, 11 Jun 2024 06:35:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1718112917; x=1718717717; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3oHoG/rUvG+suNrPba6sWXwasYJyuMVroRrTP18iosU=;
        b=YUKhS8Gl+bzm7KA6/i49/oU1PJHKPoqz1yDp2TRDU3Z3cOZSq21mm01/0FdStDZgWr
         jxK1KhOpmdVDhVxiuZnKU+Ofzs2cVZ5k+z9f+XOHO7aeSXVxHO3umBGEINlwY7Reum6C
         aINRNxOxBJfmFyvdKEq+Ofl5lNP3JDUxZmtBdvejMYJ6xrfEIqsFpjlgaQ4oHzt6FLWz
         0WTBWFzOcL1SpqsYX9nwvNYNW+NFEceYDGXk5hYHl/iz1BOW8jPtL/+w0XxAfkfMLSVK
         v1vASHUcj2hE8PowDPrHnBMBeJMrAq6vPRl+8Qi2Qjj9nN0Kd29CyJ1UzQb+1f9+f1lU
         xs1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718112917; x=1718717717;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3oHoG/rUvG+suNrPba6sWXwasYJyuMVroRrTP18iosU=;
        b=sXvyIunmr82CptxW244c29ZwYwbdoJ7pKH/HTUEmjDTVOW+rM1FaPsvunUK0BqDyT4
         OVEu5H9MfozuKJWwSXznvnjjGct53DZqi8KcUM+6oYyUWUkxA1Ms69C+jHSUHDv3JuNm
         4qQYjfcT/NYy43/yuxiVzNVyU9dO0SzaQkdj2slAKTLckhkwq+iyQCCBfR4sdYWZQx+2
         AvolRTfooh2b2Gp0GcHlqkNe/0naDiuMQWV8h+EY8NxfnDQLFd0y4jHHkWLWsUhBAyFm
         aIqT/U/gmHOXv/Ef7/AJeciZNLSmkb7zJbPgfL+0MMzNMVbcdRHPmSQzJO0z0m3SYWZe
         4Nvg==
X-Forwarded-Encrypted: i=1; AJvYcCUD0kqoE9CLzr7PJxOpjxisUSGh/0WGe0Ninjj9bI+eUnrgAsZdSZBT0poo1BFv/aGQAn98DaZod2YHbMBgIRIorwAdJWqPJcig
X-Gm-Message-State: AOJu0YxYX7RIDaw5SkKGqd4EV4EZjziwLHP/Kpxn2Y+EwA0XdmxLclXA
	5N3Rvcmt36kkyrkMUeSWHRQ715z9SYo3+1insg5jmfkvdspERYRZtbMagAD7ltztXsI+i7SDT9X
	nwkp21pwmfZCM7mnmkBFmWWxYWRPLoQsnEJQe
X-Google-Smtp-Source: AGHT+IENKHS0NoBs4cyqgpGoRNyPxksHkycSf8opjaFulUlxyZTryoU2tZupVe2gq2Hjucms5rUTtXgRgSO7S/tk71M=
X-Received: by 2002:a17:902:f646:b0:1f6:262c:6750 with SMTP id
 d9443c01a7336-1f72ab8fa78mr3268835ad.0.1718112916889; Tue, 11 Jun 2024
 06:35:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240520205856.162910-1-andrey.konovalov@linux.dev>
 <CACT4Y+bO03Efd48XW7V6F2D9FMUoWytV8L9BL8OK2DR8scJgmQ@mail.gmail.com> <CA+fCnZcd2nJ6XLmJcPfwVJf9wUcHqWjYnafDdV8pmm3HpjY7Wg@mail.gmail.com>
In-Reply-To: <CA+fCnZcd2nJ6XLmJcPfwVJf9wUcHqWjYnafDdV8pmm3HpjY7Wg@mail.gmail.com>
From: Aleksandr Nogikh <nogikh@google.com>
Date: Tue, 11 Jun 2024 15:35:05 +0200
Message-ID: <CANp29Y4ds327opXYv0VXyfZ0fT4srDjO5r9Y6grDZigARFfWaA@mail.gmail.com>
Subject: Re: [PATCH] kcov, usb: disable interrupts in kcov_remote_start_usb_softirq
To: Andrey Konovalov <andreyknvl@gmail.com>
Cc: Dmitry Vyukov <dvyukov@google.com>, andrey.konovalov@linux.dev, 
	Alan Stern <stern@rowland.harvard.edu>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Marco Elver <elver@google.com>, Alexander Potapenko <glider@google.com>, kasan-dev@googlegroups.com, 
	Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>, Tejun Heo <tj@kernel.org>, 
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 21, 2024 at 10:46=E2=80=AFPM Andrey Konovalov <andreyknvl@gmail=
.com> wrote:
>
> On Tue, May 21, 2024 at 6:35=E2=80=AFAM Dmitry Vyukov <dvyukov@google.com=
> wrote:
> >
> > On Mon, 20 May 2024 at 22:59, <andrey.konovalov@linux.dev> wrote:
> > >
> > > From: Andrey Konovalov <andreyknvl@gmail.com>
> > >
> > > After commit 8fea0c8fda30 ("usb: core: hcd: Convert from tasklet to B=
H
> > > workqueue"), usb_giveback_urb_bh() runs in the BH workqueue with
> > > interrupts enabled.
> > >
> > > Thus, the remote coverage collection section in usb_giveback_urb_bh()=
->
> > > __usb_hcd_giveback_urb() might be interrupted, and the interrupt hand=
ler
> > > might invoke __usb_hcd_giveback_urb() again.
> > >
> > > This breaks KCOV, as it does not support nested remote coverage colle=
ction
> > > sections within the same context (neither in task nor in softirq).
> > >
> > > Update kcov_remote_start/stop_usb_softirq() to disable interrupts for=
 the
> > > duration of the coverage collection section to avoid nested sections =
in
> > > the softirq context (in addition to such in the task context, which a=
re
> > > already handled).
> >
> > Besides the issue pointed by the test robot:
> >
> > Acked-by: Dmitry Vyukov <dvyukov@google.com>
> >
> > Thanks for fixing this.
>
> Thanks for the ack!
>
> > This section of code does not rely on reentrancy, right? E.g. one
> > callback won't wait for completion of another callback?
>
> I think all should be good. Before the BH workqueue change, the code
> ran with interrupts disabled.
>
> > At some point we started seeing lots of "remote cover enable write
> > trace failed (errno 17)" errors while running syzkaller. Can these
> > errors be caused by this issue?
>
> This looks like a different issue. I also noticed this when I tried
> running a log with a bunch of USB programs via syz-execprog. Not sure
> why this happens, but I still see it with this patch applied.

For the record:
https://lore.kernel.org/all/20240611133229.527822-1-nogikh@google.com/
should address that problem.

--=20
Aleksandr

>
> Thanks!
>

