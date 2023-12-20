Return-Path: <linux-usb+bounces-4417-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B53B3819E44
	for <lists+linux-usb@lfdr.de>; Wed, 20 Dec 2023 12:41:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 296111F23282
	for <lists+linux-usb@lfdr.de>; Wed, 20 Dec 2023 11:41:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DDEC8219FE;
	Wed, 20 Dec 2023 11:41:13 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-il1-f197.google.com (mail-il1-f197.google.com [209.85.166.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BBE3219EF
	for <linux-usb@vger.kernel.org>; Wed, 20 Dec 2023 11:41:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f197.google.com with SMTP id e9e14a558f8ab-35fce5a5d3cso1117015ab.0
        for <linux-usb@vger.kernel.org>; Wed, 20 Dec 2023 03:41:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703072471; x=1703677271;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DZWvcvFWT3P94ESec92OyEYUrt6Ss1wkXtTKq4rDYxM=;
        b=Oc7Eq2x9qGzbbDYbca/43UQiwbAggzdY3XPYZd7O55qa0iafsRmjj1XoNmk7GkxnlZ
         XjKdJBzntZIOzzPJiMjwWKGYfAEyzEt7AkOYOssdtPLea/fLdFo9/Jg9kF8Sl20487KL
         sfAVL2KwklHz5xe2JZjo6x0Y+ultX6qhlM5hO4eLAjFyPxELj0skxBiULkqn+n33IOoE
         GmH2KvPKfCLoE+XHMZ1JmmLd4EBUUDlkOOxOWBin2AjNK7EjOJwKT3l7qgrZBBx+osDC
         eccKjJVofkM+qkfLtIYGKdO/f6jnk+vjr5ObIeWUg7uET3kxLawkVbub4T/9l37ygVAy
         tRdg==
X-Gm-Message-State: AOJu0Yxl1ah/PbvGkv6S2UZr088ulfQ3wXR9vrH3VwmhCQqG77nOvcWP
	U3VUAIrx10meD03JteF2cjmcyxfBwozfo+myfFBgUaEtmj8A
X-Google-Smtp-Source: AGHT+IE19RIDA8rceZNYE3OLPKGLd85fED/iwIB9sfne/rp8fCvDjEJpyKLGSD0MG8Ds1QeX4ZBjL/dllhWrP8WcEKStgSvPvqXO
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1bab:b0:35f:ce83:9590 with SMTP id
 n11-20020a056e021bab00b0035fce839590mr27397ili.1.1703072471625; Wed, 20 Dec
 2023 03:41:11 -0800 (PST)
Date: Wed, 20 Dec 2023 03:41:11 -0800
In-Reply-To: <0000000000003ee3610599d20096@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000b2bbd0060cef75c4@google.com>
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

