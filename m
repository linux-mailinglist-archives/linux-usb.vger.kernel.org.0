Return-Path: <linux-usb+bounces-2635-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 383437E4A5D
	for <lists+linux-usb@lfdr.de>; Tue,  7 Nov 2023 22:14:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 679581C20BD2
	for <lists+linux-usb@lfdr.de>; Tue,  7 Nov 2023 21:14:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0849342BE2;
	Tue,  7 Nov 2023 21:14:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D88C041E2F
	for <linux-usb@vger.kernel.org>; Tue,  7 Nov 2023 21:14:13 +0000 (UTC)
Received: from mail-oa1-f71.google.com (mail-oa1-f71.google.com [209.85.160.71])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 255331733
	for <linux-usb@vger.kernel.org>; Tue,  7 Nov 2023 13:12:14 -0800 (PST)
Received: by mail-oa1-f71.google.com with SMTP id 586e51a60fabf-1eb83f1d150so7958299fac.0
        for <linux-usb@vger.kernel.org>; Tue, 07 Nov 2023 13:12:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699391533; x=1699996333;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DZWvcvFWT3P94ESec92OyEYUrt6Ss1wkXtTKq4rDYxM=;
        b=UY22iKwGioUM4ZfdjeofgHzKmj1o5Xo1OfVJMKX5Wn7dlq7GfBw6BXme7RRNk6vCr9
         ZBVFPJEIkOlZuNldK1jHUYtTbSdtVpmgMUxKrM6ahK5jQPI8foEJXEwsBO/KvpXFUi1M
         jYLlZVOMTeHrzCdsxPV+j88vriUWJ1o8DR/uaZ/a1nOaUGMEnZ0jYrBIsUxzZ3/b7n0w
         2fkdYIdtq9wvGmBxSo1bZ/y8NcDNJQEAOOo04HHi7ls9PSVz+y4+C0erIwu+N0Fe8brY
         BPdkMOzukA5O4dzgkxVdB1e0OxNPY+kkZFdMSB53/WsvIGyM+E0TJUa8xGWoBS72qbz3
         Ye6Q==
X-Gm-Message-State: AOJu0YznE/pk7kRmuVm8cvhowTgxBy3Wb9I+r+JUoML9P2DIqkTA/8CU
	lFNfW3Xto1tb/Z6G02FeKtj7GazjOLz9EvUI2/ZN1Kt1b7lq
X-Google-Smtp-Source: AGHT+IGLHHUmMnRU46DQFfD8S2H72t+cm9IJUOhFoEozLFTonUls6+08qYbjyWR1qTuXgbDu8Q8Varcnsio8An9CiRXWhSej/lyS
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6870:2397:b0:1e9:8db0:383 with SMTP id
 e23-20020a056870239700b001e98db00383mr2216610oap.1.1699391533429; Tue, 07 Nov
 2023 13:12:13 -0800 (PST)
Date: Tue, 07 Nov 2023 13:12:13 -0800
In-Reply-To: <0000000000003ee3610599d20096@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000af3ad30609966cee@google.com>
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

