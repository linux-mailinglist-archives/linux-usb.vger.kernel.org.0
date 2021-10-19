Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 76BF3433139
	for <lists+linux-usb@lfdr.de>; Tue, 19 Oct 2021 10:41:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234748AbhJSInM convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-usb@lfdr.de>); Tue, 19 Oct 2021 04:43:12 -0400
Received: from mail-il1-f197.google.com ([209.85.166.197]:37469 "EHLO
        mail-il1-f197.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234698AbhJSInL (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 19 Oct 2021 04:43:11 -0400
Received: by mail-il1-f197.google.com with SMTP id c10-20020a92d3ca000000b002595f56ca9aso9688274ilh.4
        for <linux-usb@vger.kernel.org>; Tue, 19 Oct 2021 01:40:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
         :from:to:cc:content-transfer-encoding;
        bh=zmoEaV0HwzX7oDzswsR/tmadU98uVZ2rFKJ//gLFLec=;
        b=qr3YSzDoz/A7wVnxxLxkRKvmSQGwNgZLv6sxrQFIH1c31FwzEVT6G1pobkzJBhQkrH
         zOut3vKoU5ixoKOTxxWzmEBhNLyMrLsh5rNEzbrWsyMxbOSdrXVcEPQGSX4igpXqmwSX
         f4eE+9rs6RG4dNPWfZqGLhkVFbkZjEeMa0k4hI1Q7WEI4X1ygbq9MpgF6kXerTi0DgDm
         MVbSEwATuccdDzTFXHS4Cp9sgy5q6/dCSq2SgCv0kYS9WT1Il97k2Y97b17VnOuerBk5
         MyEezjAx1dqbnDK1bHjhhH31OcDw0ezgFSlOHfzCdCwYSkfWMhQuMW+o9d39+Sx3iEg8
         ZQwQ==
X-Gm-Message-State: AOAM532QJUo70Rv0anL8K1Iegh5aSN+WC2/NLUBTofqyb+7dmHH2NUGB
        P0zkqpAtOr8jYc4IG1G+Yq4eZBCwFzsBgQ2lGAyY1dx+RfrU
X-Google-Smtp-Source: ABdhPJxJiLZQoMLgnK+lCq76ABC1JNwHSYsXZXueokW1agP8zOU7LSqZ97CvfFHXuqHaxTg1WOfjiIcvzD54dN5k2KPtbvRdgz23
MIME-Version: 1.0
X-Received: by 2002:a02:cac6:: with SMTP id f6mr3136897jap.81.1634632858981;
 Tue, 19 Oct 2021 01:40:58 -0700 (PDT)
Date:   Tue, 19 Oct 2021 01:40:58 -0700
In-Reply-To: <649fd15d-4e23-f283-3a58-f294d59305c7@suse.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000e5d81305ceb09ead@google.com>
Subject: Re: [syzbot] divide error in genelink_tx_fixup
From:   syzbot <syzbot+a6ec4dd9d38cb9261a77@syzkaller.appspotmail.com>
To:     Oliver Neukum <oneukum@suse.com>
Cc:     davem@davemloft.net, kuba@kernel.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, netdev@vger.kernel.org,
        oneukum@suse.com, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

>
> On 18.10.21 20:55, syzbot wrote:
>> Hello,
>>
>> syzbot found the following issue on:
>>
>> HEAD commit:    660a92a59b9e usb: xhci: Enable runtime-pm by default on AM..
>> git tree:       https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
>> console output: https://syzkaller.appspot.com/x/log.txt?x=1506ccf0b00000
>> kernel config:  https://syzkaller.appspot.com/x/.config?x=5016916cdc0a4a84
>> dashboard link: https://syzkaller.appspot.com/bug?extid=a6ec4dd9d38cb9261a77
>> compiler:       gcc (Debian 10.2.1-6) 10.2.1 20210110, GNU ld (GNU Binutils for Debian) 2.35.2
>> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=11308734b00000
>> C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=12f56f68b00000
>>
>> IMPORTANT: if you fix the issue, please add the following tag to the commit:
>> Reported-by: syzbot+a6ec4dd9d38cb9261a77@syzkaller.appspotmail.com
>
> #syz test   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git c03fb16bafdf

unknown command "test\u00a0\u00a0"

>
>
>
>
>
>
>
