Return-Path: <linux-usb+bounces-1546-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 201687C7A00
	for <lists+linux-usb@lfdr.de>; Fri, 13 Oct 2023 00:54:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 514451C20F14
	for <lists+linux-usb@lfdr.de>; Thu, 12 Oct 2023 22:54:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 024A23D026;
	Thu, 12 Oct 2023 22:54:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACCB72B5C1
	for <linux-usb@vger.kernel.org>; Thu, 12 Oct 2023 22:54:29 +0000 (UTC)
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1A630CA
	for <linux-usb@vger.kernel.org>; Thu, 12 Oct 2023 15:54:27 -0700 (PDT)
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-3af6a12b2a8so2433836b6e.1
        for <linux-usb@vger.kernel.org>; Thu, 12 Oct 2023 15:54:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697151266; x=1697756066;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gb4GepxVdDqnOhbaVFfKyJNSNxiwxVpwbYv24b5W+rg=;
        b=OSH0lP5niMCchD/3/CHvCzc+DK0jva98bajEg5stHjEpbdyuNdlX+ymPx0WsAAJK8s
         8xSuhgNQSUdk5oVpYfrJDDT+W7u9nG+1Lsu36M0GUEqMY/p7EScd/jxua68vnQmHW9AI
         +QUk+w7IGzL5ieG1qPtmI94y8ouREfWBPLNQlHPLQbrVwiM6AVISmhZPingrryETaW0Y
         m8+Oitk+Lt6f9k4kqH1oZcob/qsX9+vhSAMoHMRsy9MsQC60aB2cgMg9EfM2fBesN/hF
         lV+z6h734NMWUosoqJgpsMKIC/s0rprHCh0h+g+Zuc3ZWlBBBIFVJiJsCdUGNbx/svA7
         kFWA==
X-Gm-Message-State: AOJu0YzOIp44VDLjM2h828za+IpP4serco3K5NR/ROM6fYB0uJ9Kj1eR
	t+sZQQg/Tv/9WePDK8rFR6d0sHpLgaD+XjcSPKtuBmnVA9sO
X-Google-Smtp-Source: AGHT+IFiFZCMZCnrYzOGO0I8ReDLC4j6yQVUiDVIELqVouH34B2TrIHyrLW5aeNBURvFTdw4IZu44eAbjHQFOC1ShPajiGKi6zhk
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:1916:b0:3ae:2024:837d with SMTP id
 bf22-20020a056808191600b003ae2024837dmr13564961oib.8.1697151266486; Thu, 12
 Oct 2023 15:54:26 -0700 (PDT)
Date: Thu, 12 Oct 2023 15:54:26 -0700
In-Reply-To: <cwc32sg4vzz6akduyvze6tu2dkzpljtvpycuhz43t7lmbzbyvb@jgywtsrcvuzw>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000005e814006078cd293@google.com>
Subject: Re: [syzbot] [usb?] [pvrusb2?] KASAN: slab-use-after-free Read in pvr2_context_set_notify
From: syzbot <syzbot+621409285c4156a009b3@syzkaller.appspotmail.com>
To: isely@pobox.com, linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-usb@vger.kernel.org, mchehab@kernel.org, pvrusb2@isely.net, 
	ricardo@marliere.net, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=2.4 required=5.0 tests=BAYES_00,FROM_LOCAL_HEX,
	HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H2,
	RCVD_IN_SORBS_WEB,SORTED_RECIPS,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.6
X-Spam-Level: **
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-and-tested-by: syzbot+621409285c4156a009b3@syzkaller.appspotmail.com

Tested on:

commit:         ce9ecca0 Linux 6.6-rc2
git tree:       https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git
console output: https://syzkaller.appspot.com/x/log.txt?x=10be5209680000
kernel config:  https://syzkaller.appspot.com/x/.config?x=59eae8406319284a
dashboard link: https://syzkaller.appspot.com/bug?extid=621409285c4156a009b3
compiler:       gcc (Debian 12.2.0-14) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40
patch:          https://syzkaller.appspot.com/x/patch.diff?x=131dd84d680000

Note: testing is done by a robot and is best-effort only.

