Return-Path: <linux-usb+bounces-603-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 80CA47AF3F7
	for <lists+linux-usb@lfdr.de>; Tue, 26 Sep 2023 21:14:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sy.mirrors.kernel.org (Postfix) with ESMTP id 96ED5B2096E
	for <lists+linux-usb@lfdr.de>; Tue, 26 Sep 2023 19:14:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE65C48849;
	Tue, 26 Sep 2023 19:14:23 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C8AEF51A
	for <linux-usb@vger.kernel.org>; Tue, 26 Sep 2023 19:14:22 +0000 (UTC)
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com [209.85.210.72])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A9788116
	for <linux-usb@vger.kernel.org>; Tue, 26 Sep 2023 12:14:20 -0700 (PDT)
Received: by mail-ot1-f72.google.com with SMTP id 46e09a7af769-6bd899e2d3aso20312277a34.3
        for <linux-usb@vger.kernel.org>; Tue, 26 Sep 2023 12:14:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695755660; x=1696360460;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=R9PmlP7Y5UoxMXjOGsmxEgQMBWWhN1CDILnI2HWTU3Y=;
        b=G72Macxfx1+i7S4HVcdOpOcTLG6gkmVB/s3w+eeiBVJXoQS38NcTIRUfaqk0nk9fia
         jqJuGMYdsSEgFKDbAQtOwPC2BTPcL0Rh8FKneNaGlfcG1k+6lgNSauM3126fC71Vhpfr
         2lsaW1SRgzwg2VDjSchogTGEz+fETrkJQeBiMT0mDoNZN5I1sjAzNaQb974nUGUSOdfS
         OY2GBgo2Q0o8LtT8jzWi30nM5nn7QQWSajM9SJh5979UFgcLwO3jsLapZJsuXRAPE/cT
         OR6KKz43vGfQtkVgS3ZfAqgd3W3eZ0cBXbRebJqNArNj8v7JN3/rM/SpHfJXBAjOQy/j
         xlzA==
X-Gm-Message-State: AOJu0YyYtwlYAaq+xL9n+8LEeTfrhL10WSYtvCIoMzBMMSrXz9RI6g4z
	ul186+kSQG6NA9Brp4oJFL8CrUlcoheexeekYO+MoUy6qteW
X-Google-Smtp-Source: AGHT+IHCle0c7PN0TBNUEdeiNereyLBhp5ZDwcCTWRfAyhvRKOxdGoC2UAZsjJDu7q4jrEOfhGbQDx8iew5md2qyoO6QdnGM+yOK
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a9d:7d87:0:b0:6c0:a3e0:f9e9 with SMTP id
 j7-20020a9d7d87000000b006c0a3e0f9e9mr2732348otn.4.1695755660088; Tue, 26 Sep
 2023 12:14:20 -0700 (PDT)
Date: Tue, 26 Sep 2023 12:14:20 -0700
In-Reply-To: <mrce6emi7jvmoe4fgxt7lgrgkswkinc5u3hpl57gr5oaxau55o@fdvuaqxcsgu6>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000bedf08060647e102@google.com>
Subject: Re: [syzbot] [usb?] [media?] WARNING in imon_probe
From: syzbot <syzbot+1c41b2e045dc086f58be@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-usb@vger.kernel.org, mchehab@kernel.org, ricardo@marliere.net, 
	sean@mess.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=2.4 required=5.0 tests=BAYES_00,FROM_LOCAL_HEX,
	HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,RCVD_IN_SORBS_WEB,SORTED_RECIPS,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: **
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-and-tested-by: syzbot+1c41b2e045dc086f58be@syzkaller.appspotmail.com

Tested on:

commit:         a48fa7ef Merge tag 'drm-next-2023-09-08' of git://anon..
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
console output: https://syzkaller.appspot.com/x/log.txt?x=13257bd4680000
kernel config:  https://syzkaller.appspot.com/x/.config?x=8dfc2c52f63929e
dashboard link: https://syzkaller.appspot.com/bug?extid=1c41b2e045dc086f58be
compiler:       gcc (Debian 12.2.0-14) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40
patch:          https://syzkaller.appspot.com/x/patch.diff?x=17ca18da680000

Note: testing is done by a robot and is best-effort only.

