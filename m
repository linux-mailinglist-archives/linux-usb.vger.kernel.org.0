Return-Path: <linux-usb+bounces-7357-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C597E86D149
	for <lists+linux-usb@lfdr.de>; Thu, 29 Feb 2024 18:58:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8049C283F94
	for <lists+linux-usb@lfdr.de>; Thu, 29 Feb 2024 17:58:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 651A675813;
	Thu, 29 Feb 2024 17:58:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="of4uVJ6O"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6636757E0
	for <linux-usb@vger.kernel.org>; Thu, 29 Feb 2024 17:58:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709229491; cv=none; b=dQfzEMSQ9kE+2jzX2amavS2xjkAq8bwgWnDiJkTAJm/X6lm7CSlFhKzN6bRW6SMvinCBjn6TYms46bB/Xt+SV+9C+ep73ZYp9c8DlbnWB8L3QQKeisl4X/yTQkD+fua1HAeEWib84LCw9ZxQR/lsRxbQMv+1MIiSeluMChD1yqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709229491; c=relaxed/simple;
	bh=2Y2t6vvO2M/+nQggEW7KRLkhlRe7ep1amkDpsUeCzsA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AJynIsZjI5ywwn3fOCoIXhEH4a9acvH9BAPZdoIUOj2Dm7BBuSh3qAbYj+TqLuie1IF81cwLvvWUrJga2/pz8uJDIY8z+4EBYvuB9HMDV4oOqg1YxV2lcM0S5djizVPvx4u+7f/tzK3swkEaqNttlTbApCvB8gaKH/n89cl08xs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=of4uVJ6O; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-1dbe7e51f91so2035ad.1
        for <linux-usb@vger.kernel.org>; Thu, 29 Feb 2024 09:58:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1709229489; x=1709834289; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Eqp/rOiCSNKQ/OKACBLykbnoZi7+lcDYG5TVjGWpFQk=;
        b=of4uVJ6O4Am0dpDbWCinqp8gJlA8cJ83zGmHTYZwG9FAZuwmhxl2QjzBQjXP8Cwbu7
         nRsAoSKR0bsrYXQDib08TTTPA1Gl86rq2AsrmP9jKHO8EQczc+EKcij2VcpMcRlpsC/U
         m2WDgOZsmOxtWP3uy69W8CQ2rWEVaTpTcOOmUIxqbuS7Hj2zxBXTORwzS01X5nw8snKF
         7KOPj4heVN5oLKoOqsDmmt0hHoKIiB4xgMGUNo5x26dZY4IJJfCFoJlQyE07y74s4kro
         aAmiG1FhDpxWu9SEKgkyHAPPGiMZ3r3PJa3SsH5n0she8m3rgwq6ua3meIggbau//FgI
         n2EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709229489; x=1709834289;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Eqp/rOiCSNKQ/OKACBLykbnoZi7+lcDYG5TVjGWpFQk=;
        b=f00QZu/ABaLT7I90WqFSAt5mnb325D4rpvakzgEDkGSM0MBAOAnquwS9xhdPIki1kb
         VuKbz3kWUSZl1YgqZZE29m4ksHXZu5A9wzKYiQJt96QJrohMIUpORWGOcQqa/luyDdWW
         vZbSrlbVjA1aRD8Iip71rpRLrcg7KTYHoCqcgpNueeUY3Ovn+++fg+YXJ4PZxXUZcMF4
         urtLBB4ncnitG0ydrdL21S8yFFPcmMBwd3L2iDtp3C/kWog84zJ6Uosd9OGzZwN4Nbp0
         c6+7w8X2m+G1HiOAP6xpqYHwTddVInDIUKj04QIL2Q0XlP6z+DE423T2qsJxuq3bgmhP
         LdTg==
X-Forwarded-Encrypted: i=1; AJvYcCWEHmyI5tLVfxIyl9A+xOW/TlZxwxv82BojELBHOpO+Oxp+mIWwQ1ShubyOab+iebqyHlivgwSMF21kwwOQe2wDAnh+9EFUEitq
X-Gm-Message-State: AOJu0YzISbG6aGJ2PCmk4oVNYc4QOPWk/ct2E2P0MQWYxz8iLsYoCBgY
	GjUCtBczEqrgiozy0HNcihmMF0ElvdkxuWzlg8aX1WudnwHjExh5Xm/nAxi8ABucQ8ALrabJG2m
	BmS0RL+u1dpxiV5OD6xe9ERkXByRe7+jCEMvN
X-Google-Smtp-Source: AGHT+IEK0q5c0fOeePWxI1kndlWeXHa189JuFjovs0uVI6F2cibFC/FJFNCEuCRgweCXTQezqsroI5viJDocfoIVIaU=
X-Received: by 2002:a17:902:ce85:b0:1db:e5e3:f7ac with SMTP id
 f5-20020a170902ce8500b001dbe5e3f7acmr158969plg.7.1709229488598; Thu, 29 Feb
 2024 09:58:08 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <8fe3f46c-4ee5-4597-bf2d-12a5d634a264@rowland.harvard.edu>
 <0000000000008b026406126a4bbe@google.com> <13add23d-af18-4f84-9f1a-043932a9712b@rowland.harvard.edu>
 <CANp29Y4DUvL5zsnqQmhPGkbc=EN6UjFrWF9EZGE5U_=0C9+1Nw@mail.gmail.com>
 <380909e4-6e0a-402f-b3ac-de07e520c910@rowland.harvard.edu>
 <CANp29Y6hPF--pjWCa4bsAXWY15XoP2kmSg8BFP4ATGUpVbQgHQ@mail.gmail.com> <914a01e5-9c7d-4f2c-9d2b-c5c8c99b4a0e@rowland.harvard.edu>
In-Reply-To: <914a01e5-9c7d-4f2c-9d2b-c5c8c99b4a0e@rowland.harvard.edu>
From: Aleksandr Nogikh <nogikh@google.com>
Date: Thu, 29 Feb 2024 18:57:54 +0100
Message-ID: <CANp29Y65auc=aaxrpMS12x7g6GegQ9QFK7wVmc9HuTo=LNXTHw@mail.gmail.com>
Subject: Re: [syzbot] [usb-storage?] divide error in isd200_ata_command
To: Alan Stern <stern@rowland.harvard.edu>
Cc: syzbot <syzbot+28748250ab47a8f04100@syzkaller.appspotmail.com>, 
	bvanassche@acm.org, emilne@redhat.com, gregkh@linuxfoundation.org, 
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
	martin.petersen@oracle.com, syzkaller-bugs@googlegroups.com, 
	tasos@tasossah.com, usb-storage@lists.one-eyed-alien.net
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 29, 2024 at 5:12=E2=80=AFPM Alan Stern <stern@rowland.harvard.e=
du> wrote:
>
> On Thu, Feb 29, 2024 at 04:40:05PM +0100, Aleksandr Nogikh wrote:
> > On Wed, Feb 28, 2024 at 8:18=E2=80=AFPM Alan Stern <stern@rowland.harva=
rd.edu> wrote:
> > >
> > > On Wed, Feb 28, 2024 at 05:52:50PM +0100, Aleksandr Nogikh wrote:
> > > > Hi Alan,
> > > >
> > > > Please try it once more with the full commit hash.
> > >
> > > Thanks for the advice.  Are you a good person to complain to about th=
e
> > > difference between what syzbot provides and what it will accept?  Thi=
s
> > > bug report states
> > >
> > > HEAD commit:    f2e367d6ad3b Merge tag 'for-6.8/dm-fix-3' of git://gi=
t.ker..
> > > git tree:       upstream
> > >
> > > But if I specify "upstream" as the git tree on a syz test request, it
> > > doesn't accept it.  Now you're suggesting that if I put f2e367d6ad3b =
as
> > > the commit ID, it won't accept it.
> > >
> > > There's probably already a bugfix request for this, but I'd like to p=
ush
> > > on it some more.  Syzbot's output should be acceptable as its input!
> >
> > That all totally makes sense. Thanks for highlighting the problems!
> >
> > For accepting "upstream" (and alike) as input, there was already a gith=
ub issue:
> > https://github.com/google/syzkaller/issues/2265
> > That syzbot is not able to fetch commits by their short hashes was
> > only discovered yesterday.
> >
> > I've just sent PRs with fixes for both issues.
> >
> > If there's anything else that can make syzbot reports better, please
> > let me know :)
>
> That's great news!  Thanks a lot.
>
> How will we know when the fixes have been accepted and we can use them?

The features will become available several hours after these PRs are
approved and merged:
https://github.com/google/syzkaller/pull/4538
https://github.com/google/syzkaller/pull/4539

I think Tuesday or Wednesday next week are reasonable estimates :)

--=20
Aleksandr

>
> Alan Stern

