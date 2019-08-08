Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1C02A8623F
	for <lists+linux-usb@lfdr.de>; Thu,  8 Aug 2019 14:51:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732608AbfHHMvB (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 8 Aug 2019 08:51:01 -0400
Received: from mail-ot1-f72.google.com ([209.85.210.72]:41936 "EHLO
        mail-ot1-f72.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727649AbfHHMvB (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 8 Aug 2019 08:51:01 -0400
Received: by mail-ot1-f72.google.com with SMTP id a8so61472466oti.8
        for <linux-usb@vger.kernel.org>; Thu, 08 Aug 2019 05:51:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
         :from:to;
        bh=CEErlphARtaydDqTgQRNdb74yQCEmh25NXbvc/7QiI8=;
        b=UvG4dK+zf19Mdrp+wRA2Eo1rj+2X+1Z9dmfpaHOIpjwmHJTBK6z3RCn7bhW4PfxkC2
         Z51Qa6qlAM1pdrMaB8E+4vEZTQpz33bKAc0953awvABuxLlX4XaUaFWMP0kdO8ozhvZ8
         EY+U20A7rulmmHEvWjwTlaWKPOgBlIBw5ciaUrCxlwhNQWbWEbCdB9b6T4+OvI4vN4FV
         v9qCQBGn/mmscFkHpDzIfIqUBz7baj4e7mZK75xzyZtkaXnlEQq9oSUFeMTT4uWFOKvg
         KTQTsYJnp3W6i+xMkFcrMN3qnrOMYcsxlAEDSKcRL7WOQFYXfPZTXRYmZ9CvZA3N0TDD
         QtUw==
X-Gm-Message-State: APjAAAUX65Fw7ksF74HfEZFEdvBK3gp7pJ68D8Tk8fLP6yNwjLpJ9YJw
        yHr1uGASuDHHg+aInWHqg6SXZWHv7tKq5y4DsnMVLF/4blPR
X-Google-Smtp-Source: APXvYqykHlapjSYrrJt7Y/KfDR8LnW9sAsqXyA6MZtRuOUiOq/wU1wiKae3gCIaBGfyypEIk+jmD4cHVsM90UKTlAQ9FmMS0hk6d
MIME-Version: 1.0
X-Received: by 2002:a02:9f84:: with SMTP id a4mr16736469jam.20.1565268660528;
 Thu, 08 Aug 2019 05:51:00 -0700 (PDT)
Date:   Thu, 08 Aug 2019 05:51:00 -0700
In-Reply-To: <CAAeHK+yzpyCX4dVKwgYXg5oca1yecJ+T5R=6WbEtLzowRSN-9g@mail.gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000007d2d87058f9a821f@google.com>
Subject: Re: KASAN: use-after-free Read in dvb_usb_device_exit (2)
From:   syzbot <syzbot+c58e976e022432ee60b4@syzkaller.appspotmail.com>
To:     allison@lohutok.net, andreyknvl@google.com, hdanton@sina.com,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-usb@vger.kernel.org, mail@maciej.szmigiero.name,
        mchehab@kernel.org, oneukum@suse.com, sean@mess.org,
        syzkaller-bugs@googlegroups.com, tglx@linutronix.de
Content-Type: text/plain; charset="UTF-8"; format=flowed; delsp=yes
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger  
crash:

Reported-and-tested-by:  
syzbot+c58e976e022432ee60b4@syzkaller.appspotmail.com

Tested on:

commit:         e96407b4 usb-fuzzer: main usb gadget fuzzer driver
git tree:       https://github.com/google/kasan.git
kernel config:  https://syzkaller.appspot.com/x/.config?x=cfa2c18fb6a8068e
compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
patch:          https://syzkaller.appspot.com/x/patch.diff?x=1622161c600000

Note: testing is done by a robot and is best-effort only.
