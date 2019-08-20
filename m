Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B9B0195F1F
	for <lists+linux-usb@lfdr.de>; Tue, 20 Aug 2019 14:48:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729706AbfHTMsB (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 20 Aug 2019 08:48:01 -0400
Received: from mail-io1-f69.google.com ([209.85.166.69]:40304 "EHLO
        mail-io1-f69.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727006AbfHTMsB (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 20 Aug 2019 08:48:01 -0400
Received: by mail-io1-f69.google.com with SMTP id v16so7738711ioh.7
        for <linux-usb@vger.kernel.org>; Tue, 20 Aug 2019 05:48:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
         :from:to;
        bh=xThjsI/B5prp49i1OGpnvNe/I+3GpGvVrc+oJfr+5yo=;
        b=FlufY+NmCKNMMG0XX77nnIx056+1hAC1ps7ZLjYe1JkJmTG1XkmCOxAs4wxqgd5vLV
         fU8ELJ1uX4oWI/v7cNFUooweqO5ncn20Js5XD2bnsPjZ+TCSNDd+ZMP4SpocDq3WkRkY
         gC0ERnxlPylqHuBWuFo9O/mZnB3STLzIy4hFlbZvrz8hsdwKZfsqEXtYC7llPz05zEVm
         E+N23bCnk/lIjKvZBi30mSZhyAjvqbfQWGVO4SUSa6VvLKQ99w/KOFHzrQE3xPu13Rqc
         SL4MDfbXerHJmoLX/DsWbfxGD5fgBa9TLo20jwm3GJ8N+OnRPIW/piYkL2yc1YtWyaid
         arfw==
X-Gm-Message-State: APjAAAWGWdhoe+D/tXVhYq60arHTl7G1U2aLepJVSMgoLlCcRDVNBU+o
        OTsUtTd9FCYPF46pjT93sQfkNBKGvV3iH9E0PywpRTLQJi6+
X-Google-Smtp-Source: APXvYqx+SYRY/Nz3y+m4INdnL1DszprgwEdnN+553xWUkVxJmhnggf2XFlSli7fZ4i/hOmkMPelk7ugaG47Z6OQb+JEBezY/urqp
MIME-Version: 1.0
X-Received: by 2002:a5d:9dcb:: with SMTP id 11mr6985848ioo.116.1566305280891;
 Tue, 20 Aug 2019 05:48:00 -0700 (PDT)
Date:   Tue, 20 Aug 2019 05:48:00 -0700
In-Reply-To: <1566304128.11678.14.camel@suse.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000e0a37205908bdd78@google.com>
Subject: Re: WARNING in wdm_write/usb_submit_urb
From:   syzbot <syzbot+d232cca6ec42c2edb3fc@syzkaller.appspotmail.com>
To:     andreyknvl@google.com, bjorn@mork.no, gregkh@linuxfoundation.org,
        gustavo@embeddedor.com, linux-usb@vger.kernel.org,
        oneukum@suse.com, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"; format=flowed; delsp=yes
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger  
crash:

Reported-and-tested-by:  
syzbot+d232cca6ec42c2edb3fc@syzkaller.appspotmail.com

Tested on:

commit:         e06ce4da usb-fuzzer: main usb gadget fuzzer driver
git tree:       https://github.com/google/kasan.git
kernel config:  https://syzkaller.appspot.com/x/.config?x=d0c62209eedfd54e
compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
patch:          https://syzkaller.appspot.com/x/patch.diff?x=15b207e2600000

Note: testing is done by a robot and is best-effort only.
