Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A45E768063E
	for <lists+linux-usb@lfdr.de>; Mon, 30 Jan 2023 07:50:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235573AbjA3Guc (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 30 Jan 2023 01:50:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34108 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235504AbjA3Gua (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 30 Jan 2023 01:50:30 -0500
Received: from mail-io1-f72.google.com (mail-io1-f72.google.com [209.85.166.72])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4470AA5E9
        for <linux-usb@vger.kernel.org>; Sun, 29 Jan 2023 22:50:19 -0800 (PST)
Received: by mail-io1-f72.google.com with SMTP id b10-20020a5ea70a000000b0071a96a509a7so1481765iod.22
        for <linux-usb@vger.kernel.org>; Sun, 29 Jan 2023 22:50:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Oa5ai5GL3vgKUKle+VKAr5dROC4CldLbzyie3VnJ+yQ=;
        b=N31E+uJ9Ic7ugSqYPspdy4d8WVuzjAqyMhAqs3aZjuIVFG4Z9XOuYlo+mZmMAkfwAR
         JqWMYe8WLJQnzVycX8zqDXHqW2GlWLWVb5cM6Nw/O6edsPmIM9qfK3nGeNg8Lmq58h6H
         /ef+yKzQbimrDSTQLLMunqG6bseAUC9v7R+Ow2hF0Db08H5lPAxrP3o/Qiz/2f9btci0
         7BAxy4pnGtvZ8y23Q2STHnbom06iP8UsrBqSj4z4Eik6X1Ng956F3uRKWUgYxWT0Yt3B
         sXq2vm6qxXPiwg8R01nSJHxkJ4VOltcJELalIQESz+zc+zNFaDX0peo8x50Z9FyjzXi+
         KB1g==
X-Gm-Message-State: AFqh2ko8mY/l3TgA+aYdhBSSXv2qmFYv85OjExgcmXxewGRy5XpLXcjI
        84mHIV+i9RF7Dv0zJfyzAfsjADEdHtUsOCCNIpSIdpcbVWG6
X-Google-Smtp-Source: AMrXdXvdC+QErAlVG7uJMgNQ9lTgBFDx8bCpdbG8lK11Lf/u7Qj+dQBdFWzASs8r7KUmd/iYPqFVKZPMme/w94wlhO5NXaRYEgiw
MIME-Version: 1.0
X-Received: by 2002:a92:3601:0:b0:30b:dae5:c56 with SMTP id
 d1-20020a923601000000b0030bdae50c56mr5711752ila.99.1675061418554; Sun, 29 Jan
 2023 22:50:18 -0800 (PST)
Date:   Sun, 29 Jan 2023 22:50:18 -0800
In-Reply-To: <000000000000021e6b05b0ea60bd@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000d47cbe05f375a0f1@google.com>
Subject: Re: [syzbot] WARNING in hif_usb_send/usb_submit_urb
From:   syzbot <syzbot+f5378bcf0f0cab45c1c6@syzkaller.appspotmail.com>
To:     andreyknvl@google.com, ath9k-devel@qca.qualcomm.com,
        ca@plazainn.com.qa, davem@davemloft.net, edumazet@google.com,
        eli.billauer@gmail.com, gregkh@linuxfoundation.org,
        gustavoars@kernel.org, ingrassia@epigenesys.com,
        khoroshilov@ispras.ru, kuba@kernel.org, kvalo@kernel.org,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-wireless@vger.kernel.org, netdev@vger.kernel.org,
        oneukum@suse.com, pabeni@redhat.com, pchelkin@ispras.ru,
        quic_kvalo@quicinc.com, stern@rowland.harvard.edu,
        syzkaller-bugs@googlegroups.com, tiwai@suse.de, toke@toke.dk
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=0.9 required=5.0 tests=BAYES_00,FROM_LOCAL_HEX,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SORTED_RECIPS,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

syzbot suspects this issue was fixed by commit:

commit 16ef02bad239f11f322df8425d302be62f0443ce
Author: Fedor Pchelkin <pchelkin@ispras.ru>
Date:   Sat Oct 8 21:15:32 2022 +0000

    wifi: ath9k: verify the expected usb_endpoints are present

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=1162ac2d480000
start commit:   274a2eebf80c Merge tag 'for_linus' of git://git.kernel.org..
git tree:       upstream
kernel config:  https://syzkaller.appspot.com/x/.config?x=f267ed4fb258122a
dashboard link: https://syzkaller.appspot.com/bug?extid=f5378bcf0f0cab45c1c6
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=1343a8eb080000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=17dc40eb080000

If the result looks correct, please mark the issue as fixed by replying with:

#syz fix: wifi: ath9k: verify the expected usb_endpoints are present

For information about bisection process see: https://goo.gl/tpsmEJ#bisection
