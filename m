Return-Path: <linux-usb+bounces-1387-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E6117C4216
	for <lists+linux-usb@lfdr.de>; Tue, 10 Oct 2023 23:11:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 01A91281BC3
	for <lists+linux-usb@lfdr.de>; Tue, 10 Oct 2023 21:11:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C5803225CF;
	Tue, 10 Oct 2023 21:11:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5173315B2
	for <linux-usb@vger.kernel.org>; Tue, 10 Oct 2023 21:11:37 +0000 (UTC)
Received: from mail-oa1-f69.google.com (mail-oa1-f69.google.com [209.85.160.69])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0044B92
	for <linux-usb@vger.kernel.org>; Tue, 10 Oct 2023 14:11:35 -0700 (PDT)
Received: by mail-oa1-f69.google.com with SMTP id 586e51a60fabf-1e5a506de8fso343379fac.1
        for <linux-usb@vger.kernel.org>; Tue, 10 Oct 2023 14:11:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696972295; x=1697577095;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DZWvcvFWT3P94ESec92OyEYUrt6Ss1wkXtTKq4rDYxM=;
        b=C1D5SKRQOz/Ie+hwj2+3NRJ1gd+OqaHsJ3MVTmgNgdDuQAl8poSDKEgr50/HzsVlWS
         oWZggBq2yIpJlRMEUAMzjmLpFiUTylUy7Iwts5DAj9oIh0KOJMv7xRvcqpwnwgBCY1/A
         zD5bZ/kJi9cn+qpOwkzqC9QsUh0LkS4Q+Yef9oWWHwPfg0Iid5vZEdWV/ru0brLcEWnw
         j2RaXv5Jv7MQzVAWc0Tjqd6v+BjdvmQlltUlUAbOpP9l8rFfNmT8KFpR97bi32zMS+FQ
         /CK4oN49UHspBlPcbsgI+dE6R0ALmWN9ds1FfpVi+Y3aU8EtZwStE17WdVK5obBfRm6E
         4P1Q==
X-Gm-Message-State: AOJu0Ywe71rG54VY70QlSZGC/Z/aDHSJRlzpEYDOm2Pm25JGHHGGXh9v
	Y85Lb5MoqpL1ekC/WDmjr2v0s4ZDFZM5ZxkO+jH1uoBLQxCa
X-Google-Smtp-Source: AGHT+IEip8/WB1KxD/i7SHZr01hyD5rCMbCsYc9ryFGNuYKojxiyUdRD1sIhFjIPArPGKDz+S+ZWIZzEf6rVWxHmkHDUZdRTKIGt
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6870:b79c:b0:1e9:6d19:935b with SMTP id
 ed28-20020a056870b79c00b001e96d19935bmr1140796oab.5.1696972295375; Tue, 10
 Oct 2023 14:11:35 -0700 (PDT)
Date: Tue, 10 Oct 2023 14:11:35 -0700
In-Reply-To: <0000000000003ee3610599d20096@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000dc11d106076326fe@google.com>
Subject: Re: [syzbot] KASAN: use-after-free Read in __media_entity_remove_links
From: syzbot <syzbot+0b0095300dfeb8a83dc8@syzkaller.appspotmail.com>
To: andreyknvl@google.com, laurent.pinchart@ideasonboard.com, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-usb@vger.kernel.org, mchehab@kernel.org, nogikh@google.com, 
	sakari.ailus@linux.intel.com, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=0.9 required=5.0 tests=BAYES_00,FROM_LOCAL_HEX,
	HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SORTED_RECIPS,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

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

