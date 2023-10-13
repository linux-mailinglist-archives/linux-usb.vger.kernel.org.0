Return-Path: <linux-usb+bounces-1578-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 09A4F7C84D2
	for <lists+linux-usb@lfdr.de>; Fri, 13 Oct 2023 13:46:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A755EB20A82
	for <lists+linux-usb@lfdr.de>; Fri, 13 Oct 2023 11:46:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2087413FF0;
	Fri, 13 Oct 2023 11:46:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5F1713AFD
	for <linux-usb@vger.kernel.org>; Fri, 13 Oct 2023 11:46:32 +0000 (UTC)
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C1511CE
	for <linux-usb@vger.kernel.org>; Fri, 13 Oct 2023 04:46:30 -0700 (PDT)
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-3b2b1aed3d4so598646b6e.0
        for <linux-usb@vger.kernel.org>; Fri, 13 Oct 2023 04:46:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697197590; x=1697802390;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zn0uxRkOLG48mJwkz4jaxTqBOa7f3UFb3XgrawfYgSs=;
        b=jFVMoPtWll7mAO4l5WtenUcaRAQtSB/cBID1i4TNo5dflZ4paMD70RBv4sRxdyAlRh
         Sk1la4cgvVK2Ak9H6LNOWX0Jj5eWIGyuMb8Z+PXiJuPrTjAIdCwieuS9z/w5rIcarPhj
         fODLk238pQ8cHVzn/dG4n8qlpcmj9SgAKsg4VidAo4wqLKaT2iJdvK7xYJmJnLC7oJlq
         4ttBX2dLBwUkToUWD1ZB58T0iXrHPnSfrk4M0UG1HovzAyEJEhXLhXVkE8stMFVoDzQK
         a7Uzpk27zOnlW6ie4sjiIv2G7MyjizY+7XK74Wqh4inrwofZPr01AjULALghRsLgYjCt
         3jlw==
X-Gm-Message-State: AOJu0YzPPZ/q2yvIZMLODFWUacCKYFPWwyeEAuiGH+IWbj6UsiLEOXwt
	GG9xO3Oci7XJC5nn2g8hB9fG/mUVz4/RAvJ0luOcsiDDgJ/w
X-Google-Smtp-Source: AGHT+IEcFSzxJ1KG+9A0ZTvasljz8aZoRl7nJi7R/AFkCoSGaSxjFq0AZu7CaX/6w7mOH2NJC4qbuEQd0hTSXzm0IuMb8h5tIabv
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:18a3:b0:3a4:3c6c:27a1 with SMTP id
 bi35-20020a05680818a300b003a43c6c27a1mr13323007oib.5.1697197590233; Fri, 13
 Oct 2023 04:46:30 -0700 (PDT)
Date: Fri, 13 Oct 2023 04:46:30 -0700
In-Reply-To: <ZSknFd3ywz6e+wNg@Sun>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000007ac87d0607979b6b@google.com>
Subject: Re: [syzbot] [usb?] linux-next boot error: KASAN: slab-out-of-bounds
 Write in vhci_setup
From: syzbot <syzbot+6867a9777f4b8dc4e256@syzkaller.appspotmail.com>
To: gregkh@linuxfoundation.org, i@zenithal.me, linux-kernel@vger.kernel.org, 
	linux-next@vger.kernel.org, linux-usb@vger.kernel.org, sfr@canb.auug.org.au, 
	shuah@kernel.org, syzkaller-bugs@googlegroups.com, 
	valentina.manea.m@gmail.com
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=0.9 required=5.0 tests=BAYES_00,FROM_LOCAL_HEX,
	HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H2,
	SORTED_RECIPS,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-and-tested-by: syzbot+6867a9777f4b8dc4e256@syzkaller.appspotmail.com

Tested on:

commit:         e61eb79d usb/usbip: fix wrong data added to platform d..
git tree:       https://github.com/ZenithalHourlyRate/linux.git usbip-fix-wrong-platform-data
kernel config:  https://syzkaller.appspot.com/x/.config?x=9e549f76cbaa1b13
dashboard link: https://syzkaller.appspot.com/bug?extid=6867a9777f4b8dc4e256
compiler:       gcc (Debian 12.2.0-14) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40

Note: no patches were applied.
Note: testing is done by a robot and is best-effort only.

