Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2F8553AC922
	for <lists+linux-usb@lfdr.de>; Fri, 18 Jun 2021 12:49:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233726AbhFRKvQ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 18 Jun 2021 06:51:16 -0400
Received: from mail-io1-f69.google.com ([209.85.166.69]:51054 "EHLO
        mail-io1-f69.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233653AbhFRKvP (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 18 Jun 2021 06:51:15 -0400
Received: by mail-io1-f69.google.com with SMTP id x4-20020a5eda040000b02904a91aa10037so3881685ioj.17
        for <linux-usb@vger.kernel.org>; Fri, 18 Jun 2021 03:49:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
         :from:to;
        bh=HrK3zoZ7mBoYxTNh9K06ogvFxCCPaWcCp7U6uUfuszg=;
        b=ts+S0YaUkam3drObcba8xNAJtcf+23I+d9EDsl5iwsyNajRcLdMjuyMqUNit6BMYMZ
         5RAmz18qbbycBy+EOsijTM+2O1PIwz226mmQSapSSKehvJSk+u/vhq/zY1IkJq6wh2It
         hWdbuSIEXEgR2pzeANwaLyPAVBo5crW38BTMzTSUGckksAF7xYPh4jfNf9+BPjAyT86t
         OJlYFcpNxPpeu0c2RMop0DLiJy10CvfGTNDjDmGhKk/wWetzXAQ8JR4xfPYdA+rYOLhp
         rzJPIKbiYZyBq1BKHCq06Bgro2qHiBCj9okoW7ZyDZpCwmvJUz2LfnbeVq5M3Hp2cFuf
         ktiA==
X-Gm-Message-State: AOAM533eGkj2tnHPnbQmrapPxddSUVzjH6tBnIS21WTCbOXQG71EkM6/
        fgPXy5F/GQCwp/fF7q8fxRV0dMC5iMPXcdAi0Ke9PSQ0RFlQ
X-Google-Smtp-Source: ABdhPJzCs/4OA4IQ6EdpX5w7LDi1TyMBN9jVHynWWJ1IIwL1ilVww+diOFD/9gDfLlvjM0MAPMOEjUjnAUdQpIPV/79GfMvNceNj
MIME-Version: 1.0
X-Received: by 2002:a05:6602:38d:: with SMTP id f13mr7558181iov.109.1624013345667;
 Fri, 18 Jun 2021 03:49:05 -0700 (PDT)
Date:   Fri, 18 Jun 2021 03:49:05 -0700
In-Reply-To: <20210618133112.596c60d8@gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000943f6e05c50812c3@google.com>
Subject: Re: [syzbot] divide error in ath9k_htc_swba
From:   syzbot <syzbot+90d241d7661ca2493f0b@syzkaller.appspotmail.com>
To:     ath9k-devel@qca.qualcomm.com, davem@davemloft.net, kuba@kernel.org,
        kvalo@codeaurora.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-wireless@vger.kernel.org,
        netdev@vger.kernel.org, paskripkin@gmail.com,
        syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-and-tested-by: syzbot+90d241d7661ca2493f0b@syzkaller.appspotmail.com

Tested on:

commit:         fd0aa1a4 Merge tag 'for-linus' of git://git.kernel.org/pub..
git tree:       upstream
kernel config:  https://syzkaller.appspot.com/x/.config?x=5a4fe6d9e0a3e71f
dashboard link: https://syzkaller.appspot.com/bug?extid=90d241d7661ca2493f0b
compiler:       
patch:          https://syzkaller.appspot.com/x/patch.diff?x=14f9aff0300000

Note: testing is done by a robot and is best-effort only.
