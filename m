Return-Path: <linux-usb+bounces-17172-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2741F9BE205
	for <lists+linux-usb@lfdr.de>; Wed,  6 Nov 2024 10:12:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D3C721F26F5E
	for <lists+linux-usb@lfdr.de>; Wed,  6 Nov 2024 09:12:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB69D1DB362;
	Wed,  6 Nov 2024 09:10:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="KXKa0dju"
X-Original-To: linux-usb@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 787D51DA60B
	for <linux-usb@vger.kernel.org>; Wed,  6 Nov 2024 09:09:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730884200; cv=none; b=BzrbOeKzn7TEQlEl4Nc2ox3VBT/Y63nyZ2zaGWZEvgfn0/ctTJ14KaNKF7X8xJoTlSXCtToiALYQ6dD9gJG4FGzyrv+rnfJOG9aqKknFUB2ngyDAqaLKW9ljMNUlsKkhsB0bUJt13PtZI9JER+ADsQzqgouflxiNMdDVSzPJ4Uk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730884200; c=relaxed/simple;
	bh=Ve3ngN2EEXHIJllVwR94QiODyXjYWDIRJ59WcErDYVA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fB4R5sNySFriHAWnp+LGAsc9sWIC4KyaQO182A4LjUu8rbSSYDQGroTJcmH8kplTqlSLxz2bZjcD7jrPG5R8xwNVFEusabeuial7UcEzRLS/OdDLERwPgYPV4BdJXdx6QTJvl+rjDMHIbg3cPw0sITmwREMiXFDVDwyzB6ZqdyY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=KXKa0dju; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1730884195;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=eGIM5USzAXYsKg5z2NxV6SvyDptl8f4iMkBBwNNtWVo=;
	b=KXKa0djuH+nT0C8fXaDIQEKAZ8hhYLsMZfCzTqtozArwH3Yl8bRbqyjdHShWIdigaMwhfV
	+3EkJ7By4ju2KGLELnRu7OR0oIrQGa9OEHpe7UkCWpsOvo06afu14qgzhz+Wjkm6j36Mhk
	gMwRMFTphUFTXXcoHyafG+U+Epjd1FY=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-608-10VU-uW7OvaKqGdPvZTmMw-1; Wed, 06 Nov 2024 04:09:52 -0500
X-MC-Unique: 10VU-uW7OvaKqGdPvZTmMw-1
X-Mimecast-MFC-AGG-ID: 10VU-uW7OvaKqGdPvZTmMw
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6d3736a62b0so54186686d6.1
        for <linux-usb@vger.kernel.org>; Wed, 06 Nov 2024 01:09:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730884191; x=1731488991;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eGIM5USzAXYsKg5z2NxV6SvyDptl8f4iMkBBwNNtWVo=;
        b=r30remPPW6u2HyakJzsNp71xQe//rWHOEaAR8lW3jjTuL50yxoSVXo7P/7Y0Hnli3c
         b1bfl+6OHMKbd05jOkNJqY6D40HEBcJd01m9D6l517DekrXGUrVhC4+3itV/cqKFFND6
         5O7fj6O9BbPNi6BC1p6xBgqofw7QFJCL8hFnqika2oSnhEIrJS7/ICQ2rZGuGpsy5V3k
         dmNNKqkPqJhKqHR+4bN3YSl5LWsMGWYKmpw3Vf+iYQAwrb93EX6UlRAnKBVvilrQKMGf
         iazXex9ElY3jODTzj3dGgdgnVzF2+s6J+uaaas987/oUMiosbV04rGXHHxPvapKDI1iN
         HV7w==
X-Forwarded-Encrypted: i=1; AJvYcCVgYMNqn+sGv8f/xZb0tDqMisNm02bj1AlQlPGG5XoOpUJxAdfWY4wYxqKi0wT5PhLtUYnWeYugj2E=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywy6qnMIlAYEHW6n4G8TIjxuDn4wVHNYc9vsfkIJhJ0FLjmJhpY
	9vlXYtukfTpEM6OSVZOYsYGj4tWFIDxDzABmv7uBm6mclMi3hkB5sK01TlD3eJNnd1EYq+9H/JI
	Iyj4ShgobjLWg/SX3+Vdx6m0nOaS1QeT05Fq4fGGBAFVt8BvGe/zpPN2svK7l7iQFrSn+vMzgdP
	Zr7I6+EKJ7MuZ6Xq6CihH3gQzmL9M3Emzn
X-Received: by 2002:a05:6214:2c0f:b0:6d3:71ab:adb9 with SMTP id 6a1803df08f44-6d371abc487mr181889006d6.45.1730884191750;
        Wed, 06 Nov 2024 01:09:51 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGLsFkorkkGw4mojt664zWvWPLr3Scpo66osjjuJqG5oZ4qhtX+rowBC3sywsaK62RI3BDLKaQTGDUzR5Jf7D0=
X-Received: by 2002:a05:6214:2c0f:b0:6d3:71ab:adb9 with SMTP id
 6a1803df08f44-6d371abc487mr181888866d6.45.1730884191530; Wed, 06 Nov 2024
 01:09:51 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <672ad9a8.050a0220.2a847.1aac.GAE@google.com>
In-Reply-To: <672ad9a8.050a0220.2a847.1aac.GAE@google.com>
From: Ming Lei <ming.lei@redhat.com>
Date: Wed, 6 Nov 2024 17:09:40 +0800
Message-ID: <CAFj5m9LSOvbaOdM8Gvgt8HVprB_DAxiFDOW3Qou8bfAtEz_e8g@mail.gmail.com>
Subject: Re: [syzbot] [usb?] [scsi?] WARNING: bad unlock balance in sd_revalidate_disk
To: syzbot <syzbot+331e232a5d7a69fa7c81@syzkaller.appspotmail.com>
Cc: James.Bottomley@hansenpartnership.com, linux-kernel@vger.kernel.org, 
	linux-scsi@vger.kernel.org, linux-usb@vger.kernel.org, 
	martin.petersen@oracle.com, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 6, 2024 at 10:51=E2=80=AFAM syzbot
<syzbot+331e232a5d7a69fa7c81@syzkaller.appspotmail.com> wrote:
>
> Hello,
>
> syzbot found the following issue on:
>
> HEAD commit:    c88416ba074a Add linux-next specific files for 20241101
> git tree:       linux-next
> console output: https://syzkaller.appspot.com/x/log.txt?x=3D1051f55f98000=
0
> kernel config:  https://syzkaller.appspot.com/x/.config?x=3D704b6be2ac2f2=
05f
> dashboard link: https://syzkaller.appspot.com/bug?extid=3D331e232a5d7a69f=
a7c81
> compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Deb=
ian) 2.40
> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=3D16952b40580=
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
> Reported-by: syzbot+331e232a5d7a69fa7c81@syzkaller.appspotmail.com

#syz test: https://github.com/ming1/linux.git for-next


