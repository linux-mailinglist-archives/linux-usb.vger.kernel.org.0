Return-Path: <linux-usb+bounces-10305-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B61E8C7E70
	for <lists+linux-usb@lfdr.de>; Fri, 17 May 2024 00:01:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BF86C1F222B6
	for <lists+linux-usb@lfdr.de>; Thu, 16 May 2024 22:01:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F05DF15821A;
	Thu, 16 May 2024 22:01:04 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-io1-f70.google.com (mail-io1-f70.google.com [209.85.166.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EE65156F2A
	for <linux-usb@vger.kernel.org>; Thu, 16 May 2024 22:01:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715896864; cv=none; b=jH5dZ7MkSi9FIYnC6o1LqFEgpITu+l7kdW5FqaYAMweTer4Tv45ePmVjFjXtFa3m31FONNcbdHA7l3dRJ/+ySc3cqzoiR8f1BshXvsWEehQbwyAAfx/FkcmEdACvbTiViAmGzozMVtmcrL/7DGNrXCJvTIfvUqbkeNJ8b8EhAvs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715896864; c=relaxed/simple;
	bh=5ApjjVyG5kOb2GvSyJn4jbkb/QGye5113VwQa+dzRSA=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=MJ1XV7XKRymsTwzbwroHjE7l4VuIxSp9PcSbSebVKnOSPWcQn8ij/ztBgoWMZ4+DzIe1Yizt4uoGVYZdIOxBDC68P8kWZzrEwXc4wOqCwLrrZxRqYF9H4Az6QRF2VoirsVyLCVYvz4M8u79OPZk3c05to2tmKQnKQkcSYjTAJ/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f70.google.com with SMTP id ca18e2360f4ac-7e1b65780b7so907739939f.2
        for <linux-usb@vger.kernel.org>; Thu, 16 May 2024 15:01:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715896862; x=1716501662;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ij9UOEi/rvEspETVKvgQxDYWhFL0r2IXg+Lgbvqktpc=;
        b=MSN7oOsur8X93u/uQ3raNZ3esgzpAS8vnxj3PrTsf6yfyN/B3aW+WXFNzYEUK5WHPG
         QW3VOFHiJaKj2wdaqKbyeBZPiS7TxIYkN4Ygjk/8wZNnIPBh0lPMW0NcoHPQ25QUbIUw
         DAccTVXy+96BkXrLzQF/OGAw2GzgelBheRjiGIKfpWHkF9hvOsQY888aye9HPmNbO15b
         T2+5miY1WWEKseL4+nU5VjtclsJDLpJTrDy4GNknE7rhbGSG+w0+OWrtWmqaRmHgxiBL
         UH4swRGg8LXm90726BOIsWuwg0F1/ta7RWhUoisgxlY4Wj4qU6IwqE4FPcoG3lOv1YyQ
         bUYQ==
X-Forwarded-Encrypted: i=1; AJvYcCURWkHOK6YhUHRPKrtqFIc+Y6wM8DjTNCAjnBNE+jCqWl3ixjWE17bAgGQRN8mqDNWx1tUhtN9496FSkJDW9voDNmlnD7/qK3+y
X-Gm-Message-State: AOJu0Ywhpf6Jhmb1X+jzspVMPc2Cd0zn+QiPseWUpi4yydriQGFc/O/P
	8uiQFyIUgQ7abc2d4jCfL5ypsVhTKggc8V9tXS+7Kz0gZnZsjH4q72omip/rdeha7K02PUfeX84
	AokiZMrcjAoCkY+TS8cCzIPGHZb6ClejeCiteEQi/Tj0cPovfhj1fSUM=
X-Google-Smtp-Source: AGHT+IF4FYXyVi+PNgCKKVgxVWjwAbrtBw5UnExXmcnE5b/QOXgG13UczkaJ42LJBz1xoWmDg6pwDEsXRfDUDYXY3d/3NYS8VAyl
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6602:3ca:b0:7de:e175:fd2d with SMTP id
 ca18e2360f4ac-7e1b521f29dmr162925539f.3.1715896862636; Thu, 16 May 2024
 15:01:02 -0700 (PDT)
Date: Thu, 16 May 2024 15:01:02 -0700
In-Reply-To: <000000000000051b2d06189716c3@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000f8112e0618995e6e@google.com>
Subject: Re: [syzbot] [usb?] INFO: rcu detected stall in schedule_timeout (6)
From: syzbot <syzbot+c793a7eca38803212c61@syzkaller.appspotmail.com>
To: bp@alien8.de, dave.hansen@linux.intel.com, gregkh@linuxfoundation.org, 
	hpa@zytor.com, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
	marcello.bauer@9elements.com, mingo@redhat.com, stern@rowland.harvard.edu, 
	sylv@sylv.io, syzkaller-bugs@googlegroups.com, tglx@linutronix.de, 
	x86@kernel.org
Content-Type: text/plain; charset="UTF-8"

syzbot has bisected this issue to:

commit a7f3813e589fd8e2834720829a47b5eb914a9afe
Author: Marcello Sylvester Bauer <sylv@sylv.io>
Date:   Thu Apr 11 14:51:28 2024 +0000

    usb: gadget: dummy_hcd: Switch to hrtimer transfer scheduler

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=119318d0980000
start commit:   75fa778d74b7 Add linux-next specific files for 20240510
git tree:       linux-next
final oops:     https://syzkaller.appspot.com/x/report.txt?x=139318d0980000
console output: https://syzkaller.appspot.com/x/log.txt?x=159318d0980000
kernel config:  https://syzkaller.appspot.com/x/.config?x=ccdd3ebd6715749a
dashboard link: https://syzkaller.appspot.com/bug?extid=c793a7eca38803212c61
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=16dcd598980000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=151d9c78980000

Reported-by: syzbot+c793a7eca38803212c61@syzkaller.appspotmail.com
Fixes: a7f3813e589f ("usb: gadget: dummy_hcd: Switch to hrtimer transfer scheduler")

For information about bisection process see: https://goo.gl/tpsmEJ#bisection

