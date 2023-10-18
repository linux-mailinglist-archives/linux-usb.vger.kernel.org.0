Return-Path: <linux-usb+bounces-1851-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 838587CD934
	for <lists+linux-usb@lfdr.de>; Wed, 18 Oct 2023 12:30:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6BF431C20D4E
	for <lists+linux-usb@lfdr.de>; Wed, 18 Oct 2023 10:30:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A51318C1E;
	Wed, 18 Oct 2023 10:30:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2563019440
	for <linux-usb@vger.kernel.org>; Wed, 18 Oct 2023 10:30:37 +0000 (UTC)
Received: from mail-oa1-f71.google.com (mail-oa1-f71.google.com [209.85.160.71])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 92100FD
	for <linux-usb@vger.kernel.org>; Wed, 18 Oct 2023 03:30:35 -0700 (PDT)
Received: by mail-oa1-f71.google.com with SMTP id 586e51a60fabf-1e9b6561650so8040554fac.3
        for <linux-usb@vger.kernel.org>; Wed, 18 Oct 2023 03:30:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697625035; x=1698229835;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vEOUFvFLj8BGIeeDw6dbDN1dpAqq/KfWUcaxHojzWJo=;
        b=Q1aW755yFG6fntPJy4s/L5y+oi5QQqMVpW+eB9W0Ugg0WKZ9PslZ22cLgot4tHXchy
         Fke1TN2AwlgVPAHUrIHtvat4WrL+2hYa4/ybLRAxOK99NAN7S7qip8/5HaI4W0jYPeyA
         N4JDAU5hE9qZ7pvFc0y4R3hwstu/yBkH3MVWwvFxcH6pp42kX6//m4KHiQWXRmd6w8cS
         7bukeu2yJzrjfL8GR/JEnUdoUl1g6ALnTGElP06qgW98VMxE014XXXWEaxeXTIMbEY/x
         nGQBG58BFEHMeWOHUNUspmd/t1ZMcfuMt/BjWKowOuSwGjIRskQpOhrL66m3i3fad9Cc
         meLA==
X-Gm-Message-State: AOJu0Yw96E8u8PTdNtgkL+/eVMKB9rtv0ngQv7hME1QMSUOfvinVwNtk
	AyX5a+pv1E/2ocDkgPiCrd75KVgvvgNK3LiWkR44/TRmgq23
X-Google-Smtp-Source: AGHT+IFrcWUt2XQ7APuRZBXOaspIaSCG1TmV5W/FBR2ZFo2UKJYfeGEIbuwQMt4XFWTWRYI3xdRZdkFDjTElmSGYtyLsVenMinzO
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6870:9113:b0:1dc:709b:4d3a with SMTP id
 o19-20020a056870911300b001dc709b4d3amr2072102oae.11.1697625034911; Wed, 18
 Oct 2023 03:30:34 -0700 (PDT)
Date: Wed, 18 Oct 2023 03:30:34 -0700
In-Reply-To: <dc016529-51f7-4a8a-8c67-54a15b19b78b@collabora.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000002af93d0607fb2163@google.com>
Subject: Re: [syzbot] [usb?] INFO: task hung in usbdev_open (2)
From: syzbot <syzbot+b73659f5bb96fac34820@syzkaller.appspotmail.com>
To: gregkh@linuxfoundation.org, jeremy.linton@arm.com, 
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
	stern@rowland.harvard.edu, syzkaller-bugs@googlegroups.com, 
	usama.anjum@collabora.com, viro@zeniv.linux.org.uk
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=0.9 required=5.0 tests=BAYES_00,FROM_LOCAL_HEX,
	HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SORTED_RECIPS,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-and-tested-by: syzbot+b73659f5bb96fac34820@syzkaller.appspotmail.com

Tested on:

commit:         2dac7569 Add linux-next specific files for 20231018
git tree:       https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git next-20231018
console output: https://syzkaller.appspot.com/x/log.txt?x=161f5833680000
kernel config:  https://syzkaller.appspot.com/x/.config?x=b9f4d682cd6282b3
dashboard link: https://syzkaller.appspot.com/bug?extid=b73659f5bb96fac34820
compiler:       gcc (Debian 12.2.0-14) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40

Note: no patches were applied.
Note: testing is done by a robot and is best-effort only.

