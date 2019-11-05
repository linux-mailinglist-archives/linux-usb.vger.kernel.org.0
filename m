Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B9CB5EFDA5
	for <lists+linux-usb@lfdr.de>; Tue,  5 Nov 2019 13:51:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388791AbfKEMvE (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 5 Nov 2019 07:51:04 -0500
Received: from mail-io1-f69.google.com ([209.85.166.69]:44041 "EHLO
        mail-io1-f69.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388635AbfKEMvD (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 5 Nov 2019 07:51:03 -0500
Received: by mail-io1-f69.google.com with SMTP id q13so15440179iot.11
        for <linux-usb@vger.kernel.org>; Tue, 05 Nov 2019 04:51:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
         :from:to;
        bh=/lWajsW87pe+jU9auqaIDGr38Nf06GOlbpdLBf+DWPk=;
        b=DRQSX12hdowbtXfqKNXo2RzgVI3o3u6dsAIni7Er8RD4U8RHZHPoMsnUc0MI6qBDhE
         LNz6W4vIClqVAQQxIOY/sUa1dTquoq/McdXIzhKvp4FB39995OMthqujEjGcnVD1OoPm
         I1Q1KOPkitMdaZB9QgEdsawTosh+Cr+0ewE0Y1vabrcdsqv3mTSt4aV4ffkgMdWvTLBA
         GrS4RCa/DmzBF2/iRH+HAdEvhayHbrf/7Qq1YrHXYmXrbvDbEIOitnCGAtF7TC+uHt/U
         Gniwu03VvLQyuTaI5/Fuz5DQTzMxBR3xMBpizmam2MnftUyZEX9WaQe7PXpUTL8nfFvV
         tVPg==
X-Gm-Message-State: APjAAAW7UoUS5xzkwyPLLtAocEPOWuLTqeTi24/PGtjFcSRvXzs693/c
        MUOBMxT1MPjEfVaPV+7Kcgc+dbz+gvZBwHuj2FauyMezEmGU
X-Google-Smtp-Source: APXvYqzaWIg1tdrmzLbrJ+5MbJ3oMtwvvbO3F0xFNyd06idM/Zc7zKv0xAb30Rx4+qrlCabNIqwresbUOQGkA4+PyMw3U30e2QZG
MIME-Version: 1.0
X-Received: by 2002:a5d:9856:: with SMTP id p22mr15367560ios.29.1572958261043;
 Tue, 05 Nov 2019 04:51:01 -0800 (PST)
Date:   Tue, 05 Nov 2019 04:51:01 -0800
In-Reply-To: <1572952316.2921.3.camel@suse.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <00000000000065678d059698e26c@google.com>
Subject: Re: KMSAN: uninit-value in cdc_ncm_set_dgram_size
From:   syzbot <syzbot+0631d878823ce2411636@syzkaller.appspotmail.com>
To:     davem@davemloft.net, glider@google.com,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        netdev@vger.kernel.org, oneukum@suse.com,
        syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"; format=flowed; delsp=yes
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger  
crash:

Reported-and-tested-by:  
syzbot+0631d878823ce2411636@syzkaller.appspotmail.com

Tested on:

commit:         96c6c319 net: kasan: kmsan: support CONFIG_GENERIC_CSUM on..
git tree:       https://github.com/google/kmsan.git
kernel config:  https://syzkaller.appspot.com/x/.config?x=9e324dfe9c7b0360
dashboard link: https://syzkaller.appspot.com/bug?extid=0631d878823ce2411636
compiler:       clang version 9.0.0 (/home/glider/llvm/clang  
80fee25776c2fb61e74c1ecb1a523375c2500b69)
patch:          https://syzkaller.appspot.com/x/patch.diff?x=16b798dce00000

Note: testing is done by a robot and is best-effort only.
