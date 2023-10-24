Return-Path: <linux-usb+bounces-2151-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B69D87D5CEE
	for <lists+linux-usb@lfdr.de>; Tue, 24 Oct 2023 23:11:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E40E31C20CC4
	for <lists+linux-usb@lfdr.de>; Tue, 24 Oct 2023 21:11:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F8E63E496;
	Tue, 24 Oct 2023 21:11:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0703E15B4
	for <linux-usb@vger.kernel.org>; Tue, 24 Oct 2023 21:11:41 +0000 (UTC)
Received: from mail-oo1-f69.google.com (mail-oo1-f69.google.com [209.85.161.69])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4038110CF
	for <linux-usb@vger.kernel.org>; Tue, 24 Oct 2023 14:11:40 -0700 (PDT)
Received: by mail-oo1-f69.google.com with SMTP id 006d021491bc7-583f706347dso6883659eaf.2
        for <linux-usb@vger.kernel.org>; Tue, 24 Oct 2023 14:11:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698181899; x=1698786699;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DZWvcvFWT3P94ESec92OyEYUrt6Ss1wkXtTKq4rDYxM=;
        b=FZ5MvWrnxqOGVrxZ5Df1KGqcWF7TOiLhFV+F7AQ17aUNRUAtXIrKHifteiG3zjPwDV
         +tJJUP+QqVZYSv8z3eqjY5El5xhHxtHlZmJkk52IuZHDPq/5CvPQ0cpgzJdDrX6f36p6
         HHQwHh8FiGyDuvlDCRWyrvbAC1G5uPFrl+9mBtANSbjmGlAfeymMCWuDbXUOegDo1MG0
         dztRikQ+xS9zhtrxfP01o0enyDbVnGnA3T8ohdcVMrbnAupJcS0jacqhdsflnPOR0LGO
         t4npJaNKqUQixQVAaqpcJTpmKgJ4y5XkCNsCUDZp8up4+pWE8u+jBc9E3ZQx2kXU6rzI
         XoDg==
X-Gm-Message-State: AOJu0YykwPslAm7QSajCojjSgx0FbWtutS58PAj3H3zFdM+w5hw+raBr
	oPNy16GSJnMZrXAMjfLbDAQhV43MrehgPs5t6ePouD2Cy7xx
X-Google-Smtp-Source: AGHT+IFIGdjAGzKoTrnYimPKPHmDG1kjuJTZCw+8fwLQZBt4HO+eQF/KgxqQt+0nli6xsdzu/gL97sZ4XmiD0ErEiKHID+MmReGv
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a4a:350f:0:b0:581:def4:738d with SMTP id
 l15-20020a4a350f000000b00581def4738dmr3989735ooa.0.1698181899638; Tue, 24 Oct
 2023 14:11:39 -0700 (PDT)
Date: Tue, 24 Oct 2023 14:11:39 -0700
In-Reply-To: <0000000000003ee3610599d20096@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000e45f1006087cc8ea@google.com>
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

