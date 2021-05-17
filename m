Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6202B383D10
	for <lists+linux-usb@lfdr.de>; Mon, 17 May 2021 21:17:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232295AbhEQTSZ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 17 May 2021 15:18:25 -0400
Received: from mail-io1-f69.google.com ([209.85.166.69]:52192 "EHLO
        mail-io1-f69.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232153AbhEQTSY (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 17 May 2021 15:18:24 -0400
Received: by mail-io1-f69.google.com with SMTP id h7-20020a5d9e070000b029041a1f6bccc8so4151600ioh.18
        for <linux-usb@vger.kernel.org>; Mon, 17 May 2021 12:17:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
         :from:to;
        bh=+kErfEtNYwu/Ybclt9+KOG1egC5Rd9gjqzB3omTYpbk=;
        b=IOZF6+j98L7FbeBOJMZ7LtIgAjYF+0RgsWHvpYffJ1kHtcyQiWi4IVyU66ZzUe/GOx
         nCZ/tsV/gifpxlwu/1WZBYRGszTEp1c7U6vCDkM1V1pJ1relXyfSqWiTn5vdnsj/Lmh6
         la6Sk+GbuQe4nD8EMcd8fO4CYA43Ekw28bt8uurlRouokrg0qzN6z/Y8cPWVA7n7H+BF
         F+qiZGRsp9+rUmuqTWBww+h4arzobKy6CdcszxkDaRckSJs7JEezyHkeQj0UIysTvIJz
         vmh7xFdkvt2TY3E5t71LdK9ubnQCd6VCxXGJeG/BxDHZuSvEgSWWowk9cq1BiG9PmxjI
         77+w==
X-Gm-Message-State: AOAM53040h2B1y3DukN7hoC4IyW8MBUOicw9HlCPfS/pLza+P1mxi3D6
        mw6EDxSqS6dCe7Ls0mK9Ws7d9Nr8/gcvqze2ER6/vMUROs6b
X-Google-Smtp-Source: ABdhPJz7zkN9b8IfVdrGey2sJgHjnLLqDvLusS/BcEN5YJqN6eyAnKsNyHkgRQQVj44NE68p1mcX55PJfr0Eo4uuuFJEhaxq9slE
MIME-Version: 1.0
X-Received: by 2002:a92:dd04:: with SMTP id n4mr994688ilm.165.1621279026606;
 Mon, 17 May 2021 12:17:06 -0700 (PDT)
Date:   Mon, 17 May 2021 12:17:06 -0700
In-Reply-To: <20210517215904.7d915011@gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000007676b005c28b70f6@google.com>
Subject: Re: [syzbot] memory leak in zr364xx_start_readpipe
From:   syzbot <syzbot+af4fa391ef18efdd5f69@syzkaller.appspotmail.com>
To:     linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-usb@vger.kernel.org, mchehab@kernel.org,
        paskripkin@gmail.com, royale@zerezo.com,
        syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-and-tested-by: syzbot+af4fa391ef18efdd5f69@syzkaller.appspotmail.com

Tested on:

commit:         0723f73e media: zr364xx: fix memory leak in zr364xx_start_..
git tree:       https://linux.googlesource.com/linux/kernel/git/torvalds/linux refs/changes/96/11196/1
kernel config:  https://syzkaller.appspot.com/x/.config?x=cb9a486f2f311b2e
dashboard link: https://syzkaller.appspot.com/bug?extid=af4fa391ef18efdd5f69
compiler:       

Note: testing is done by a robot and is best-effort only.
