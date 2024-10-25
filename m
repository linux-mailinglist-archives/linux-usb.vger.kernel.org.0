Return-Path: <linux-usb+bounces-16718-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 817579B0827
	for <lists+linux-usb@lfdr.de>; Fri, 25 Oct 2024 17:26:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BAB8BB2AAE3
	for <lists+linux-usb@lfdr.de>; Fri, 25 Oct 2024 15:24:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5DD3216132A;
	Fri, 25 Oct 2024 15:21:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="tCfXenP4"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE7E721A4A5
	for <linux-usb@vger.kernel.org>; Fri, 25 Oct 2024 15:21:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729869694; cv=none; b=ZeOzGVgoFBBWQQAVfA/agDIDbPBnuijuYMKrmrDrznxQYO9JF9zJbKjBzeECvC/7ZbJbPdskgjcf22zy+v60J3rQqwdqKKwfYUcxH/q4Cd9NChQpnT/0/8NtrOjr84Q4jHRlRaBY5FXaHYljEoqZ6sazvfaOjMD02PT2kl3LOZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729869694; c=relaxed/simple;
	bh=WfGVJHkjby/sDylyYIOucRttjmywo3StXZcNpeKwnww=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TD+TIkYzj5X87545Vx+Ya5ZfKeZIYYvNX7U07mFRoW0W2zOI7lx0K1gNnqHxxX3WBgu4yYEy11xpA8QEQT+7nvLfR6Yyb57lgMGU7AWDwYAMAgyXCewsXzlwW7q1IWpBPZRlo3YzTmBZdhDbGNaYxjUDtj+kXc0dK/FOceTe3Xw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=tCfXenP4; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4315ee633dcso192635e9.1
        for <linux-usb@vger.kernel.org>; Fri, 25 Oct 2024 08:21:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1729869691; x=1730474491; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F9AJS/J4QubIDUNRMib8hknd43k7UlEr1REupaDva6c=;
        b=tCfXenP4PzlJf6DOEVUf7BVfj8f+9wfxNEz0YFi8ZUtG8Yt7mcMMU17kEYGoaxhDco
         kWGKez+UMYAdJlmgBD7Dr06ZHg9JhsOXxvMWFAWibV29pkPUTDvFFBaepMA/ckza6i7q
         QDqOu8zkHpuiqlbEFWnJ9/1oCJfQSdCLDpWjYqh7v2LX0qI/rlDaLfaquwhmlNRXeUeR
         qmupYmtoDx6iOAm5iC/yOwfRFvPF+mzj+6OXVmjO5y9koRyPcTZwePr3wtaL4t4+AmL3
         BZbHfFfoO6AkMxyoCCUBv+q4aIlql74CNmxjPvUsVy9SCcdxc1HU+7Rls1bpqsC4qIgY
         djrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729869691; x=1730474491;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F9AJS/J4QubIDUNRMib8hknd43k7UlEr1REupaDva6c=;
        b=jOFPPQGzdX43bm8k9ySkvTL87b3JGTaoRey0+aOxkcWQBcimCEgRK4rIqjARMCa9/u
         Z6KJ2JIxBwgYFmxVq53iDsEwq/aEU0qhpFMWaMLxFCJM+Zh5nDE1zulaeCYCIokBsymS
         jTW97UCv4ZkRq13mEVEME/wJ4mi3ZoOz5w4jIPOkoHpQgBowgbDbWBNb5YFO+lWgmhAO
         X4sd+HD9SUjjLVLq03/DkpI+k6v1vxeeEVVVw9VFdPJ5hMv87VN+aApAkyQMBk0c8yQn
         45GVIfnOgcXAIESrdSxwdbxBRVaTZavLIP0pJH/sjj40pe+Fu40kVo49kZTZjv/VMaTf
         ZxMQ==
X-Forwarded-Encrypted: i=1; AJvYcCXiHoXScVVvl0r/CF6fH6n9NhcN6cDELv8swmr0EMIRNfLcZ0D6n9h33q1p2WJJAWbcfS5T0dM2/TQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YyJkXOIUyBHfgrOEhnheNkX+5qhm5N4Q9crThF9nMxq7oxU2Nzw
	Uyv1ejRdVLIPFfaDc+kU2lXX9HPWJaSjgypasUMpgyFjczuukUFMpllQUi1LVhbMNQr3nrtgTE0
	xDf+qXxH9O4PZwChmt2PCF6yaASx8JDL3s3BW
X-Google-Smtp-Source: AGHT+IF8THsb2wXUWrQi/D1S4TzCOI1qytUeBb9QnU2xNlDnWEvJQNfuwMXJJZLZG1BicrLdftQVMdA6xmzVUJwrZNg=
X-Received: by 2002:a05:600c:5013:b0:426:6edd:61a7 with SMTP id
 5b1f17b1804b1-43192ece940mr3856365e9.7.1729869690704; Fri, 25 Oct 2024
 08:21:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <671b7fb2.050a0220.2e773.0000.GAE@google.com> <832afb0c-98b7-4d29-8436-1ff6a65133b8@lucifer.local>
In-Reply-To: <832afb0c-98b7-4d29-8436-1ff6a65133b8@lucifer.local>
From: Jann Horn <jannh@google.com>
Date: Fri, 25 Oct 2024 17:20:52 +0200
Message-ID: <CAG48ez3c=KS68hnLu26mw2qwkaT8__4cvFw8vdzK=R3QHv7XeQ@mail.gmail.com>
Subject: Re: [syzbot] [mm?] INFO: rcu detected stall in vms_complete_munmap_vmas
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: syzbot <syzbot+0ca979b86eaec7337a89@syzkaller.appspotmail.com>, 
	Liam.Howlett@oracle.com, akpm@linux-foundation.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, linux-usb@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com, vbabka@suse.cz, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 25, 2024 at 1:37=E2=80=AFPM Lorenzo Stoakes
<lorenzo.stoakes@oracle.com> wrote:
> On Fri, Oct 25, 2024 at 04:23:30AM -0700, syzbot wrote:
> > Hello,
> >
> > syzbot found the following issue on:
> >
> > HEAD commit:    c6d9e43954bf Merge 6.12-rc4 into usb-next
> > git tree:       https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/=
usb.git usb-testing
> > console output: https://syzkaller.appspot.com/x/log.txt?x=3D139f225f980=
000
> > kernel config:  https://syzkaller.appspot.com/x/.config?x=3D4a2bb21f91d=
75c65
> > dashboard link: https://syzkaller.appspot.com/bug?extid=3D0ca979b86eaec=
7337a89
> > compiler:       gcc (Debian 12.2.0-14) 12.2.0, GNU ld (GNU Binutils for=
 Debian) 2.40
> > syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=3D179f225f9=
80000
> >
> > Downloadable assets:
> > disk image: https://storage.googleapis.com/syzbot-assets/3bf4a453ec2f/d=
isk-c6d9e439.raw.xz
> > vmlinux: https://storage.googleapis.com/syzbot-assets/e4a2db2a5d95/vmli=
nux-c6d9e439.xz
> > kernel image: https://storage.googleapis.com/syzbot-assets/8eb8e481b288=
/bzImage-c6d9e439.xz
> >
> > IMPORTANT: if you fix the issue, please add the following tag to the co=
mmit:
> > Reported-by: syzbot+0ca979b86eaec7337a89@syzkaller.appspotmail.com
> >
>
> Isn't this just the same thing as [0]?
>
> Again I think we're just happening to hit a stall in the unmap logic rath=
er than
> this being an mm thing.
>
> We retried that one a few times and it didn't hit any mm code after the
> first time.

Random side comment: It would be nice if the kernel was able to report
hangs in two steps; somehow scan and mark the stack in a first pass,
then wait another minute or so, then scan the stack again to see which
functions we haven't returned out of within that minute, or something
along those lines...

