Return-Path: <linux-usb+bounces-3146-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 80B9A7F37E5
	for <lists+linux-usb@lfdr.de>; Tue, 21 Nov 2023 22:13:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 459472829ED
	for <lists+linux-usb@lfdr.de>; Tue, 21 Nov 2023 21:13:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 893435B1FA;
	Tue, 21 Nov 2023 21:13:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 052E0D40
	for <linux-usb@vger.kernel.org>; Tue, 21 Nov 2023 13:13:16 -0800 (PST)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-1ce66b44deaso56108345ad.1
        for <linux-usb@vger.kernel.org>; Tue, 21 Nov 2023 13:13:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700601195; x=1701205995;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DZWvcvFWT3P94ESec92OyEYUrt6Ss1wkXtTKq4rDYxM=;
        b=pL8929/mobH5sxZ3UrteBimUoV13anYReHu9x/fymsZAoFIX8tUgXBFvNaSL3PiuSf
         Epl7H/58GMAfBIidylXazsPSEaGNyD9weVV4kkM4h3gbNNo7znkL4ECJblsM24p6rEPy
         cDF8OLVkcmYs3TFlRDI5ggMUnckglDbA2/KQ75MWorZ9mvd6fD1NAnSV6qm2ggXYtmpk
         8fp7R8gc6HAB8KhmawVoCxZA6Q2IxOKhe50e5QWhaF9gxDyv7q+TSGKKF4r/ThPGdNBZ
         tvctSKp0qSZL8wu9V/mA2BamMCnV35HAph5eOCTPNi5IjSkH4vIDnG+cECKGkUKLIeT4
         /u7g==
X-Gm-Message-State: AOJu0YzfpkhEYd5fk4ByvDAyRZzbS2L6RxLEq9ubT7lrMg5n+9UVM9yP
	C0tuY9YUZTOS12v9O4SEoOH3rGrh+GtKpWTbrzGiU4tj4fVK
X-Google-Smtp-Source: AGHT+IHM9W+C7Oq0Uv4PwRYXwS33JJ9uK/HjdaAoEujXz7jU6ukhsoO+N83LgpXYrU44Q8AnLhnEdLDIby2oGWjGRHsGykut9M7s
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a17:902:f688:b0:1cc:fd93:ab34 with SMTP id
 l8-20020a170902f68800b001ccfd93ab34mr79222plg.1.1700601195534; Tue, 21 Nov
 2023 13:13:15 -0800 (PST)
Date: Tue, 21 Nov 2023 13:13:15 -0800
In-Reply-To: <0000000000003ee3610599d20096@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000002a1fec060ab0120c@google.com>
Subject: Re: [syzbot] KASAN: use-after-free Read in __media_entity_remove_links
From: syzbot <syzbot+0b0095300dfeb8a83dc8@syzkaller.appspotmail.com>
To: andreyknvl@google.com, laurent.pinchart@ideasonboard.com, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-usb@vger.kernel.org, mchehab@kernel.org, nogikh@google.com, 
	sakari.ailus@linux.intel.com, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

This bug is marked as fixed by commit:
media: uvcvideo: Avoid cyclic entity chains due to malformed USB descriptors

But I can't find it in the tested trees[1] for more than 90 days.
Is it a correct commit? Please update it by replying:

#syz fix: exact-commit-title

Until then the bug is still considered open and new crashes with
the same signature are ignored.

Kernel: Linux
Dashboard link: https://syzkaller.appspot.com/bug?extid=0b0095300dfeb8a83dc8

---
[1] I expect the commit to be present in:

1. for-kernelci branch of
git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git

2. master branch of
git://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git

3. master branch of
git://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf.git

4. main branch of
git://git.kernel.org/pub/scm/linux/kernel/git/davem/net-next.git

The full list of 9 trees can be found at
https://syzkaller.appspot.com/upstream/repos

