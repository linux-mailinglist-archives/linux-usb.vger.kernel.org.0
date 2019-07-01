Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A0438EBDA
	for <lists+linux-usb@lfdr.de>; Mon, 29 Apr 2019 22:52:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729405AbfD2UwC (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 29 Apr 2019 16:52:02 -0400
Received: from mail-it1-f197.google.com ([209.85.166.197]:59240 "EHLO
        mail-it1-f197.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729393AbfD2UwC (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 29 Apr 2019 16:52:02 -0400
Received: by mail-it1-f197.google.com with SMTP id j203so619069itb.8
        for <linux-usb@vger.kernel.org>; Mon, 29 Apr 2019 13:52:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
         :from:to;
        bh=cAm7uQCoto51MF3DbmJ8qiz81JKkTC17o7TMeFgJuaY=;
        b=db9BmTQ/p2HZWZ7KW/d+8Ev5X2pRms3gnowBctbYo8FRiOOJN+2bnDjTp4Y/L30QUU
         WlnNB1ppKAXVJi8X2s+huYr1iWSSWI640QDVmoZfw5wiuhoPuAn7qygnm4JHQrvfs3qb
         OC4y39QlSD2GqKcmS7CmO1ne1N2kdXKCrIqq9r5EPa0fg5j1F7F9Ch25k9Hoxxuijf/j
         SZ0K9iSUaCao4VlPM1HghR89UIi8+UUhWMmubN2hvgLZmdil+sdf9p08npcNRCcOY4un
         M2vx3BS1pB1B/xn7Wx1+LwqL2q3Xf5IuOelHT85MzxftX+lFoJGO02lZcn0fT8Y2ur1r
         9H4g==
X-Gm-Message-State: APjAAAWzLU10WGyVR7v6sRcX3F3cU9z8bZQu4BBGqhutnh7Fau5uokgI
        9Uycbl4HZamVkJyyMkT0yMo1bdDgTowElMK/9WUaOJNWhsT4
X-Google-Smtp-Source: APXvYqyg99LXgoRoX1mVoG+8rJWflXeP0VnHXkeYnUb/6Pad7ERsbjPwrPKxbVCLbUsaqJ76+2WrDzCRDW1FhvTF17AK/n1I2Fcz
MIME-Version: 1.0
X-Received: by 2002:a6b:b989:: with SMTP id j131mr27265452iof.131.1556571121028;
 Mon, 29 Apr 2019 13:52:01 -0700 (PDT)
Date:   Mon, 29 Apr 2019 13:52:01 -0700
In-Reply-To: <Pine.LNX.4.44L0.1904291604510.1632-100000@iolanthe.rowland.org>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000bc95620587b1748e@google.com>
Subject: Re: KASAN: slab-out-of-bounds Read in hex_string
From:   syzbot <syzbot+a9fefd18c7b240f19c54@syzkaller.appspotmail.com>
To:     andreyknvl@google.com, gregkh@linuxfoundation.org,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        rafael@kernel.org, stern@rowland.harvard.edu,
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
syzbot+a9fefd18c7b240f19c54@syzkaller.appspotmail.com

Tested on:

commit:         43151d6c usb-fuzzer: main usb gadget fuzzer driver
git tree:       https://github.com/google/kasan.git usb-fuzzer
kernel config:  https://syzkaller.appspot.com/x/.config?x=4183eeef650d1234
compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
patch:          https://syzkaller.appspot.com/x/patch.diff?x=16c59788a00000

Note: testing is done by a robot and is best-effort only.
