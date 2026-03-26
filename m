Return-Path: <linux-usb+bounces-35474-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UJAbMd1+xGnAzgQAu9opvQ
	(envelope-from <linux-usb+bounces-35474-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 26 Mar 2026 01:33:33 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 46F6032DA8B
	for <lists+linux-usb@lfdr.de>; Thu, 26 Mar 2026 01:33:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0FA28304B5E7
	for <lists+linux-usb@lfdr.de>; Thu, 26 Mar 2026 00:33:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 007152D9EC4;
	Thu, 26 Mar 2026 00:33:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="XIa5xyKV"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C40F1A9FB7
	for <linux-usb@vger.kernel.org>; Thu, 26 Mar 2026 00:33:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774485209; cv=pass; b=V4C367Kp2lnP9Gf0UDQ9v+97wVEEDKd9Kv7SyOcMW9UjW2rlwqkJw3ReuRegYx/P8U1uvY++S6yzlsR8+iKa4/4BmfULVDgvOWcbuhJC/KQVhi+3f7NCqdThC4XYpAjZ3sLgavAwNzK4488I3b7n5+JPpMkofdh2JyYgBvJYTq0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774485209; c=relaxed/simple;
	bh=xcYoU2EhupfeQFEMz+G4nlS3bJJinaBxrvHwAj3XtDQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=U7zqwThZKP1CD/N5m2yyqbk+/f74YbRzbM1zO+3IGayUs073BOo3NdTbeDF4iZ56+NHd2F38PsNDXYoQCwNKYQgS78GVQ1MxVyjcFsGiu5cittOr8SnbqFJCDin0u0ZfiN40Fhe8ONDiHg+Cw7WTRs1njzRHZbJA2bsQGn7FQYk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=XIa5xyKV; arc=pass smtp.client-ip=74.125.82.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-1274204434bso1186873c88.1
        for <linux-usb@vger.kernel.org>; Wed, 25 Mar 2026 17:33:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774485206; cv=none;
        d=google.com; s=arc-20240605;
        b=Ku1VmANDjNltj976jwwQcWUsWsShl2BeeVL8WB3Qum+a9JWD/Bht7Pn3ZDEWZkWaWR
         rRKzTv2QhMdrHTfck0RQRBO4QtcbqiujOZm1qj6vY682q3+8kPp8Arl1Xu/KBw7cDYOp
         ioNzWRENL/gLdeZAS45MYl0oSedjEvIl1xj8jGKW0CkvZaOKTJ09xd1y8ZGl+T/rXKMM
         TGqsCApIt/FHszwuUyMf8MXPBkrD0izaz3ibSVDBh9C7zW6+trbk1nP5q/LztojMJELW
         WKCc+jJiENXVb5LsjTjHFa4+7xSbTYcMxwo/44q4v5pgRpE2RZh0RK8/U73obkJZd/e/
         v6dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=lo7u2CLCsySezJ/m+R87LTCOQKYhnIiiwQZOPh9KHPw=;
        fh=zxvTll+mUbDn6a5p9MjLlqVwGI46BI+wVuZnjo7vNn4=;
        b=hbiz8kbBp6gqGVDNdfRNfH5Ch8nZTJWKpte6Y2GOH8c9dtjWtWuDAdafEZwknn/hQu
         2jNYhOxFzjx/EVMQqwwG08a/kTzkWMa8sssgaLswjjqo0TYh3v2P2ghkysfk9ZEpXQoQ
         VaQUp7E7rHz2c3jmK0JhwR/bGTDtOE8Kmbyah2cNcklJ+gH0Xq1hSx92Xz8HRKSlZQNa
         jw/MeFFVi6Zklet+O3NO8/4QoHmhke5zQAjFkdZ9kiVldMEH+kPRh9xEs2LsITRqToTA
         /mrfwbopZyoAxI8wag/Ni9kXlFwiv3S69e2Jw+/e3J1wxFfmNVStC/iTbe+amjwhdBtP
         Avfw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1774485206; x=1775090006; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lo7u2CLCsySezJ/m+R87LTCOQKYhnIiiwQZOPh9KHPw=;
        b=XIa5xyKVb5wcqp90foRjJOgtu/n6/sPk6MKrsLHHXNf/vkA9XLIgO88pytb7Eb0gYB
         XL77ZhrAVcUbE/RjNKQCvgDmq6Wb84alrC9vEvKlLLOjqBjmRNP6e9xEWoA3NP3ZITlv
         eICgj0HzpG8VGhbOSE0ULx11plegphK2t5u46KoA8Jj4eF/3gGa/x3G5SgYEPJbIjWwm
         q5ci95tF5P6sxU5xfA6P5yU/ecctgBjDysw+MLuEMUXoU4G4cPotjIr9ZL2kN5egFsSL
         s0Erer7w3ksRsy5xryYzcz9QBxSC5WvrOUYYPjYqorSu4boTDbd6ID86w808+dKH1q6s
         UX3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774485206; x=1775090006;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=lo7u2CLCsySezJ/m+R87LTCOQKYhnIiiwQZOPh9KHPw=;
        b=h/s4hajSMmL/CFoIA7DmLo0dU79GCKDGnzMB1jXGcUREKyQ0Y2cUOrtVF3CHYQaPnn
         g/fbwWtGM6yLiXhaebFsjT7rWN4PXTgrgqHmA7dRj/50RWkWOwGzynGNBtcoKPtXTNet
         DB0HTnfJ0jLUdDl+M8cRc2TaL3g4DdF3s5/kPWvFKKQUL6OIktnYxZwIEweYluyZjn4Z
         lLhG89iSdBXF2EXOvt8v5DN56D/UkpS2yiUlrw4FyAMMtZjnhTAvp1XzAlUWrfOlVMmx
         0Y23np1RXG0tBo92lS9wdU94ma4uU1cWZ5UwbAacy0XQWg5vwHx/sdUE3JAXN22s5UQ0
         cVMQ==
X-Forwarded-Encrypted: i=1; AJvYcCUUYQyvY3sY22jJ3AqG7zIk2hXwseAVoElNDVbH0hRq3NkLoPIRS3Ajw7ROxphlT1V/wJc9V42KuRc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9gJDoDl8nF6t9oNpnhhdKHST4bMgpS7GFkexyDG5fNxD3DAy8
	d16ELFfGozam8i3VXV8BdyahVSY9Ly4HMJ0gKNJNklBUcF4XAGzBPv/6XQ2biX+1ZKsz8V0YK19
	FT/2399C2F9H9L65nDnOy3sqSH+D2W6sT0UVlmyYF
X-Gm-Gg: ATEYQzxtD5nEBFhUDTH08/NbKwtVvoa68afNZ2Q+aNoUpCgjm+YR7BTsVkNiTIaHNIF
	u2OC29L4pg5TgZbcz8VMyDo55FKa2EAdzSjB+N/H1Nmvynn16chblWC20U9sKDPzjJY2d06Kkjz
	DxzskS0px87FWbrUD8na9Ip8jSSaEPaqcitxASR6NEFBDUQRoELCg0Z0/qvAXVAtcwmOAj6R8ee
	cInQgervOz86N3CKjy1pb/kG1el468P+ZfVZUdEDMZI9ryTLSOGFVUYpN+TPicM/nnYUUX6b0PS
	t4Rgvxium7CcD91VNgcm1jey4g6HN/b3Cz6roD6o01kSXgL4gYv92hJlGhqo9miudcpDMg==
X-Received: by 2002:a05:7022:48f:b0:123:2de5:346e with SMTP id
 a92af1059eb24-12a9672ae4fmr2373174c88.0.1774485205821; Wed, 25 Mar 2026
 17:33:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <69c34b1c.050a0220.abc16.000b.GAE@google.com> <20260325091214.24516-1-kohei@enjuk.jp>
In-Reply-To: <20260325091214.24516-1-kohei@enjuk.jp>
From: Kuniyuki Iwashima <kuniyu@google.com>
Date: Wed, 25 Mar 2026 17:33:14 -0700
X-Gm-Features: AaiRm52FZnReW96QyKNXCikodMxR4sLl4Lf1vVIrk4VLmb9KeJp5bh5-WmGGHWs
Message-ID: <CAAVpQUDAMyKqTwneX8TPh1a=+pW-FyR2URWuTzsJOrUO0iuiOA@mail.gmail.com>
Subject: Re: [syzbot] [usb?] [net?] KMSAN: uninit-value in rtl8150_open (2)
To: Kohei Enju <kohei@enjuk.jp>
Cc: syzbot+9db6c624635564ad813c@syzkaller.appspotmail.com, 
	andrew+netdev@lunn.ch, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, netdev@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	URI_HIDDEN_PATH(1.00)[https://syzkaller.appspot.com/x/.config?x=963de479f54c6dbb];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[google.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-35474-lists,linux-usb=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,appspotmail.com:email,storage.googleapis.com:url,syzkaller.appspot.com:url,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[google.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kuniyu@google.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb,9db6c624635564ad813c,netdev];
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	SUBJECT_HAS_QUESTION(0.00)[]
X-Rspamd-Queue-Id: 46F6032DA8B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Mar 25, 2026 at 2:12=E2=80=AFAM Kohei Enju <kohei@enjuk.jp> wrote:
>
> + Iwashima-san
>
> On Tue, 24 Mar 2026 19:40:28 -0700, syzbot wrote:
> > Hello,
> >
> > syzbot found the following issue on:
> >
> > HEAD commit:    c612261bedd6 Merge tag 'io_uring-7.0-20260320' of git:/=
/gi..
> > git tree:       upstream
> > console output: https://syzkaller.appspot.com/x/log.txt?x=3D155801d6580=
000
> > kernel config:  https://syzkaller.appspot.com/x/.config?x=3D963de479f54=
c6dbb
> > dashboard link: https://syzkaller.appspot.com/bug?extid=3D9db6c62463556=
4ad813c
> > compiler:       Debian clang version 21.1.8 (++20251221033036+2078da43e=
25a-1~exp1~20251221153213.50), Debian LLD 21.1.8
> >
> > Unfortunately, I don't have any reproducer for this issue yet.
> >
> > Downloadable assets:
> > disk image: https://storage.googleapis.com/syzbot-assets/aa2bdf537bf6/d=
isk-c612261b.raw.xz
> > vmlinux: https://storage.googleapis.com/syzbot-assets/8fcd98072431/vmli=
nux-c612261b.xz
> > kernel image: https://storage.googleapis.com/syzbot-assets/737b94c52155=
/bzImage-c612261b.xz
> >
> > IMPORTANT: if you fix the issue, please add the following tag to the co=
mmit:
> > Reported-by: syzbot+9db6c624635564ad813c@syzkaller.appspotmail.com
> >
> > usb 2-1: device reset failed
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
> > BUG: KMSAN: uninit-value in set_carrier drivers/net/usb/rtl8150.c:726 [=
inline]
> > BUG: KMSAN: uninit-value in rtl8150_open+0x1131/0x1360 drivers/net/usb/=
rtl8150.c:763
> >  set_carrier drivers/net/usb/rtl8150.c:726 [inline]
> >  rtl8150_open+0x1131/0x1360 drivers/net/usb/rtl8150.c:763
> >  __dev_open+0x8e3/0xd40 net/core/dev.c:1702
> >  __dev_change_flags+0x32f/0x950 net/core/dev.c:9764
> >  netif_change_flags+0x8d/0x1e0 net/core/dev.c:9827
> >  dev_change_flags+0x18c/0x320 net/core/dev_api.c:68
> >  devinet_ioctl+0x10dd/0x25a0 net/ipv4/devinet.c:1199
> >  inet_ioctl+0x4c0/0x6f0 net/ipv4/af_inet.c:1015
> >  sock_do_ioctl net/socket.c:1254 [inline]
> >  sock_ioctl+0x769/0x1140 net/socket.c:1375
> >  vfs_ioctl fs/ioctl.c:51 [inline]
> >  __do_sys_ioctl fs/ioctl.c:597 [inline]
> >  __se_sys_ioctl+0x23c/0x400 fs/ioctl.c:583
> >  __x64_sys_ioctl+0x97/0xe0 fs/ioctl.c:583
> >  x64_sys_call+0x1975/0x3ea0 arch/x86/include/generated/asm/syscalls_64.=
h:17
> >  do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
> >  do_syscall_64+0x134/0xf80 arch/x86/entry/syscall_64.c:94
> >  entry_SYSCALL_64_after_hwframe+0x77/0x7f
> >
> > Local variable tmp.i created at:
> >  set_carrier drivers/net/usb/rtl8150.c:723 [inline]
> >  rtl8150_open+0xc26/0x1360 drivers/net/usb/rtl8150.c:763
> >  __dev_open+0x8e3/0xd40 net/core/dev.c:1702
>
> I see Iwashima-san was previously working on this issue here:
>   https://lore.kernel.org/all/20250827233108.3768855-1-kuniyu@google.com/=
T/
>
> The issue seems to be that set_carrier() ignores the return value of
> get_registers() and may use an uninitialized tmp.
>
> rtl8150 appears to have other call sites that use get_registers() the
> same way as mentioned in the thread above.

Right, feel free to take my patch over ;)

