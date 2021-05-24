Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8DE7D38F401
	for <lists+linux-usb@lfdr.de>; Mon, 24 May 2021 22:00:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232107AbhEXUBo (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 24 May 2021 16:01:44 -0400
Received: from mail-io1-f70.google.com ([209.85.166.70]:49994 "EHLO
        mail-io1-f70.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233038AbhEXUBn (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 24 May 2021 16:01:43 -0400
Received: by mail-io1-f70.google.com with SMTP id z14-20020a6be20e0000b029043a04a24070so28338091ioc.16
        for <linux-usb@vger.kernel.org>; Mon, 24 May 2021 13:00:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
         :from:to;
        bh=UxdQh88rvBJTStyCsXUz5phO00MIhSQveuUIqhOKQ3E=;
        b=tWg6IWdid4zc5JWKG56ECxvZa+QWaLvmfgICmoFhC/zLDHQugVHLByP+oqhOBBOnk/
         N3k9LgbuGIkwEszX7DoE/VaE90jOIkTc/M+g9iCarAuVpdWnMj9fWkSQSug0a8LWA5kZ
         WH7NQqLIo1cswrt/abenn0inZRb+v0P261t/zqoactXi0vRAhwCkV15tS46UnMHyDftS
         lE7F4lAPikgCjjgA5UXsW8ME5TNTNzHAr7WE2xQSvnu7uGoa4iChUcwqCX3og0WkFXK0
         YJDET+PH1JumMO+wwEHtG41lBoR7ZeaBu04MIXoeaYSQSNFZDkjZ5ubFkzsZ5X9t9Qcv
         q+7A==
X-Gm-Message-State: AOAM531viS08mbqaCrCRq1aYBiXbbIehuY0xql/V9MTZlw+zexjGhPs+
        3KK6yM4nKwyxiuq5E1+6EwQhTaZew73nGxbI5NNejxLcAnbB
X-Google-Smtp-Source: ABdhPJxBi9ip3XWcomrql0oioeeL8xRGVpJK0qKKtYMWiP0u+HE6DkjDMrYcciPvJA3Bp7ydRzWdBAtUfomYqbdUm+Mmr4rBOuba
MIME-Version: 1.0
X-Received: by 2002:a05:6602:14cd:: with SMTP id b13mr8633555iow.163.1621886413024;
 Mon, 24 May 2021 13:00:13 -0700 (PDT)
Date:   Mon, 24 May 2021 13:00:13 -0700
In-Reply-To: <20210524224449.544eab2f@gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <00000000000083b7cf05c318db2c@google.com>
Subject: Re: [syzbot] memory leak in smsc75xx_bind
From:   syzbot <syzbot+b558506ba8165425fee2@syzkaller.appspotmail.com>
To:     davem@davemloft.net, kuba@kernel.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, netdev@vger.kernel.org,
        paskripkin@gmail.com, steve.glendinning@shawell.net,
        syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-and-tested-by: syzbot+b558506ba8165425fee2@syzkaller.appspotmail.com

Tested on:

commit:         1434a312 Merge branch 'for-5.13-fixes' of git://git.kernel..
git tree:       upstream
kernel config:  https://syzkaller.appspot.com/x/.config?x=eb6cff3094efa258
dashboard link: https://syzkaller.appspot.com/bug?extid=b558506ba8165425fee2
compiler:       
patch:          https://syzkaller.appspot.com/x/patch.diff?x=15dfdf1dd00000

Note: testing is done by a robot and is best-effort only.
