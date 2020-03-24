Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EF03A19132E
	for <lists+linux-usb@lfdr.de>; Tue, 24 Mar 2020 15:28:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727962AbgCXO2E (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 24 Mar 2020 10:28:04 -0400
Received: from mail-io1-f71.google.com ([209.85.166.71]:33213 "EHLO
        mail-io1-f71.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727393AbgCXO2E (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 24 Mar 2020 10:28:04 -0400
Received: by mail-io1-f71.google.com with SMTP id w25so5924255iom.0
        for <linux-usb@vger.kernel.org>; Tue, 24 Mar 2020 07:28:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
         :from:to;
        bh=5DUdY94kcJjDfuPtHucA1+AoxiUtVx9ckQVqLZpRdfk=;
        b=VMdWPsoy/+UZgsxEk3K9pWNbvoehCuuZ+KQrGxYL3Ms49ZRdZLtKicLYg6KotvRp7W
         rFAmEDT3i7O3Yyv7b4KbSwAhrK/GjDJcEqloK4OBmw98BrqurSYO+7pYv7IUe2++sgdM
         W1aJO4LtOlnYJn+os3gbc5AaVAti+hMZP6F1jwK9CMFFx0h9P/G4i8lUir1aEv8cRf4a
         RwwtzRJahA+cUA1ofXV1DiXg03DK6oaIptcXZYet1/nbcG9H8yKk+AfFPxHAQHY08AXu
         YH5HWNqod1MBgo8bTTV9NEzJ9Za2STX85vdgqnDgNBcFldeRfcSu4tmZwgvi9Z/hqlSG
         yjXQ==
X-Gm-Message-State: ANhLgQ2U48RLGqOeJXy7NSkjtA2t6SsyZf+Sb6u2SAXRx8G7Olp4EnKC
        9xw8A4KVplvHbvKytxU7MJLWt5AFKWFcQFU/FwWTC/3FQAUm
X-Google-Smtp-Source: ADFU+vvS/QTynF8HliyIxM1iRtSlvS+NCm14vMAPvj/NIh43tNV8t9FSiC82R5IcAwB/rWk4CQIMzKiftWKUeamPt5Vex8ADmLfc
MIME-Version: 1.0
X-Received: by 2002:a5e:8401:: with SMTP id h1mr11507780ioj.167.1585060083276;
 Tue, 24 Mar 2020 07:28:03 -0700 (PDT)
Date:   Tue, 24 Mar 2020 07:28:03 -0700
In-Reply-To: <1585057397.7151.22.camel@suse.de>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <00000000000036236e05a19a8f6b@google.com>
Subject: Re: KASAN: slab-out-of-bounds Read in garmin_read_process
From:   syzbot <syzbot+d29e9263e13ce0b9f4fd@syzkaller.appspotmail.com>
To:     andreyknvl@google.com, gregkh@linuxfoundation.org,
        johan@kernel.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, oneukum@suse.de,
        syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger crash:

Reported-and-tested-by: syzbot+d29e9263e13ce0b9f4fd@syzkaller.appspotmail.com

Tested on:

commit:         e17994d1 usb: core: kcov: collect coverage from usb comple..
git tree:       https://github.com/google/kasan.git
kernel config:  https://syzkaller.appspot.com/x/.config?x=5d64370c438bc60
dashboard link: https://syzkaller.appspot.com/bug?extid=d29e9263e13ce0b9f4fd
compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
patch:          https://syzkaller.appspot.com/x/patch.diff?x=17315ad3e00000

Note: testing is done by a robot and is best-effort only.
