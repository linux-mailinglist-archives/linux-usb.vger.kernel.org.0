Return-Path: <linux-usb+bounces-18401-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F62A9ED097
	for <lists+linux-usb@lfdr.de>; Wed, 11 Dec 2024 16:59:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7337C28F516
	for <lists+linux-usb@lfdr.de>; Wed, 11 Dec 2024 15:59:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E8C71D6DBE;
	Wed, 11 Dec 2024 15:59:05 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-il1-f197.google.com (mail-il1-f197.google.com [209.85.166.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCB1D246340
	for <linux-usb@vger.kernel.org>; Wed, 11 Dec 2024 15:59:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733932745; cv=none; b=Ckz6dc4xejksOTHi7BXHRQj9E3Opt1xfZXR8PeLHO4iJjmvzB6p8V+9tD/qDTYxLRyx/2jbbu4cWD+MeTUq0XPHjtzIwwUlj1+AHjBLF1gaOd4DTZjrmbsS6KC1L+bxAAZO6WwIiw6FE5HG/eBdZOf/7Ia4xtk6GGxIpVkIZLMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733932745; c=relaxed/simple;
	bh=0/Vw5d5yOtudfwTIu9urOUrFiXLWivKI9DLs+LdBcPg=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=diJAZ/OJK3sSxJ3FJvhnN5aS5fvFDfYKCI2GpsVEmLH4SgK2C+BQxVT0kyEyjXt7YTdMgIZKnYLmLuxkO6eotwxBezOt4AIpfkJSZuaMT/9Xm2j9C0K8EEVcZCUxAVb42svdZXeOwEKWPlL0Y3Rcb8VPld+KLc0kPtYjzB9nhxs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f197.google.com with SMTP id e9e14a558f8ab-3a7de3ab182so143876845ab.1
        for <linux-usb@vger.kernel.org>; Wed, 11 Dec 2024 07:59:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733932743; x=1734537543;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Zj6T53eA5aQ2odejJoDohrPW2sAzNQlf1f+jwWd2Ack=;
        b=SHAq7YuEjNk+JcpsdCnPFOtbVM1656p1DpgK1qADwBTE69AvYHtlANObOXlNb6lgkb
         gmyLzqLStSBszF8X2oc9Q/6qcIc4Bp/ES2pNamTExcKdHUcJxH6KFQi6ACdciFo8GKC/
         U3uAMrS+hoy3KjYPEaSliQwYyu9SnIr0M8/OXnZB3qZdNSUQCynvkONMD2BAQonUgH+h
         wF3awl/aAjppYy4MTpBNmQAZSrnu7gzejvxvkJVCb9e6ZAb92A7Sv8Qy6ZvgWtXtRket
         UwWOzOd7JJh58hb1XoMGaN+NNegmVAJQesM1sTVkxKH/RtPC/Y0LTHanx5Qy0c25Q0J4
         tcEg==
X-Forwarded-Encrypted: i=1; AJvYcCUIJjgwPmv9o95aB/EEKx54Kv4cigOoi6qHCD/wT5Baq6E6up0aiGnI/o+S1VByQMR5vzPRDv45gVE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxo4UG4bffOtuW0q0C9dVLaMddTKP4roM6zfPmU46aGYr6Qg2gE
	6Ekn1oyLIZoeGz5WTSrh11R8fLe05L/pBl7qrFO0uE5Hu/vOvOMlzQ9nj4461To0B/rbzIK4JJp
	sVlkAZ9FW8H4ln6u/VL/oJOONkfW+72TtF1xoiINjJvrcWOcGRoe5Y4g=
X-Google-Smtp-Source: AGHT+IEEdlHtCcs6pgaXG9IhBvQUaCMmLQBHZ2UcOp4P4DbnRkRT5JDDXDstbwp2NkhgqGweFj2OIyOScjAfsUjoi5I3aY+/Z59X
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1c46:b0:3a7:4e3e:d03a with SMTP id
 e9e14a558f8ab-3aa0ab3889fmr28024725ab.22.1733932743110; Wed, 11 Dec 2024
 07:59:03 -0800 (PST)
Date: Wed, 11 Dec 2024 07:59:03 -0800
In-Reply-To: <67230d7e.050a0220.529b6.0005.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6759b6c7.050a0220.17f54a.003f.GAE@google.com>
Subject: Re: [syzbot] [mm?] kernel BUG in __page_table_check_zero (2)
From: syzbot <syzbot+ccc0e1cfdb72b664f0d8@syzkaller.appspotmail.com>
To: akpm@linux-foundation.org, broonie@kernel.org, hdanton@sina.com, 
	liam.howlett@oracle.com, linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	linux-usb@vger.kernel.org, lorenzo.stoakes@oracle.com, 
	pasha.tatashin@soleen.com, stern@rowland.harvard.edu, 
	syzkaller-bugs@googlegroups.com, vbabka@suse.cz
Content-Type: text/plain; charset="UTF-8"

syzbot suspects this issue was fixed by commit:

commit 5de195060b2e251a835f622759550e6202167641
Author: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Date:   Tue Oct 29 18:11:48 2024 +0000

    mm: resolve faulty mmap_region() error path behaviour

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=1507b8f8580000
start commit:   850925a8133c Merge tag '9p-for-6.12-rc5' of https://github..
git tree:       upstream
kernel config:  https://syzkaller.appspot.com/x/.config?x=309bb816d40abc28
dashboard link: https://syzkaller.appspot.com/bug?extid=ccc0e1cfdb72b664f0d8
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=158ab65f980000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=120e6a87980000

If the result looks correct, please mark the issue as fixed by replying with:

#syz fix: mm: resolve faulty mmap_region() error path behaviour

For information about bisection process see: https://goo.gl/tpsmEJ#bisection

