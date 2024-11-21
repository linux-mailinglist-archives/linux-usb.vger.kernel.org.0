Return-Path: <linux-usb+bounces-17765-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B97A9D4607
	for <lists+linux-usb@lfdr.de>; Thu, 21 Nov 2024 04:06:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0E5E8280C9F
	for <lists+linux-usb@lfdr.de>; Thu, 21 Nov 2024 03:06:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C964139D1E;
	Thu, 21 Nov 2024 03:06:05 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-il1-f197.google.com (mail-il1-f197.google.com [209.85.166.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B49770817
	for <linux-usb@vger.kernel.org>; Thu, 21 Nov 2024 03:06:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732158364; cv=none; b=QBxE5Y98npX3Hl4uxOzBJkyTimHVxZODUbgOObFCSyDf4r0gUtdezBIS0TeAg9Ntwz7spSz3BqFlt5U8NQzPqxWzgWELcysGHYfYqCRCfiPolhNClZ5wDPwMPxWJrFjakqrUORffemRNAIB6/SelSWfeP/HPld4DR/J44LjgLOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732158364; c=relaxed/simple;
	bh=19lMze4FBt9ZcAS9KWRp6i8uOH9mPAA59vjy+SmM7MU=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=uzWArIT6O51ITygXGV4LaBxHhkCEHH5dae/W7KxSaIEr8P3cxnxIyJU04UN3ektG2ZUwv502q/MwMqvBy+azk6cRPs/1TTuMY+OPtpZbWF+R/e9ykzzlv+wcrY/1VbN2B2sh5wVPhgXs+jn93kU7mT5GWaRPN6KkjM+S5qTeJHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f197.google.com with SMTP id e9e14a558f8ab-3a7932544c4so215755ab.1
        for <linux-usb@vger.kernel.org>; Wed, 20 Nov 2024 19:06:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732158362; x=1732763162;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iT+tkk0XtBVTI1mvaBLoNdXL417sN5a09utqyP6Jzj8=;
        b=Gl3IOLrAs+DKRkXQL2UPe74pL6VLBb/FNBk5kIddeBC/7fYyHUEMg3hkh1ZeX9mNMs
         Go6AhKCEdEVAeXFHvYWinsu4TPKvwPdFjv+ne96FxUKLFVOvWtEhGfoFu0DWQv83g7K+
         0GAq0p3wrU+7qubuRbSaHXl03pBB6wBDlIW7L0K7y9TDU5w8syTRWOGIIXyBsViZiVEU
         5NMCj2E9QLswBR+EySzA88N+nsjypswRrtO1wbqGDc9BSmt2QCa7f9ZVXUzgSLVY6vQ+
         EKMs/oqhdSn1jOSPkfYaCBymhSRAIRxh+wqnQ9uaFa9EU2Ilr+MDi7Mh2i00z9Vpf2Am
         uKog==
X-Forwarded-Encrypted: i=1; AJvYcCVqtQLdLriUt56meTwPBsyYljcJgkyPjwU1mgIiM6uZCfyiZdhTR2m38MXOMFmi4NH0fIincSTLR/A=@vger.kernel.org
X-Gm-Message-State: AOJu0YzOq6p+GM+n7qicCdY5VgKRKzJWCB77s2rIOE9ESsZ3JXIpf5Li
	B5EJoeA5AZNj9B5MYQIGW0PChRFPPHpngWzlpLlPc3C1wVbctLkoQg+rzPhRaRT4fSZtO/BMiWc
	RjHY+jawOf93zyFY0JjEn0BuQ9U0g80cna/5Wk7HsvhFcsUP+2zFzvdA=
X-Google-Smtp-Source: AGHT+IFECs3xXLfzjty274CbuoSdxurVt/fnTybIl9OmWuhos3xSfe2yEatqrch5aDBMJHYLJNfKVj2in1cYGsxmcp6oDAg9FTWC
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:3b87:b0:3a7:87f2:b010 with SMTP id
 e9e14a558f8ab-3a787f2b18fmr50885135ab.5.1732158362777; Wed, 20 Nov 2024
 19:06:02 -0800 (PST)
Date: Wed, 20 Nov 2024 19:06:02 -0800
In-Reply-To: <673de7f9.050a0220.363a1b.0011.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <673ea39a.050a0220.363a1b.0083.GAE@google.com>
Subject: Re: [syzbot] [media?] [usb?] WARNING in iguanair_get_features/usb_submit_urb
From: syzbot <syzbot+e3ae1e7f4b88f3e696f5@syzkaller.appspotmail.com>
To: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, linux-usb@vger.kernel.org, mchehab@kernel.org, 
	oneukum@suse.com, sean@mess.org, stern@rowland.harvard.edu, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

syzbot has bisected this issue to:

commit b3e40fc85735b787ce65909619fcd173107113c2
Author: Oliver Neukum <oneukum@suse.com>
Date:   Thu May 2 11:51:40 2024 +0000

    USB: usb_parse_endpoint: ignore reserved bits

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=13907ae8580000
start commit:   f868cd251776 Merge tag 'drm-fixes-2024-11-16' of https://g..
git tree:       upstream
final oops:     https://syzkaller.appspot.com/x/report.txt?x=10507ae8580000
console output: https://syzkaller.appspot.com/x/log.txt?x=17907ae8580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=d2aeec8c0b2e420c
dashboard link: https://syzkaller.appspot.com/bug?extid=e3ae1e7f4b88f3e696f5
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=10edf1a7980000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=10d892c0580000

Reported-by: syzbot+e3ae1e7f4b88f3e696f5@syzkaller.appspotmail.com
Fixes: b3e40fc85735 ("USB: usb_parse_endpoint: ignore reserved bits")

For information about bisection process see: https://goo.gl/tpsmEJ#bisection

