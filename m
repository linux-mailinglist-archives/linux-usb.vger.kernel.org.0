Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 044C06D0A90
	for <lists+linux-usb@lfdr.de>; Thu, 30 Mar 2023 18:00:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233518AbjC3QAi (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 30 Mar 2023 12:00:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53140 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233504AbjC3QAf (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 30 Mar 2023 12:00:35 -0400
Received: from mail-io1-f71.google.com (mail-io1-f71.google.com [209.85.166.71])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2FE66D317
        for <linux-usb@vger.kernel.org>; Thu, 30 Mar 2023 09:00:30 -0700 (PDT)
Received: by mail-io1-f71.google.com with SMTP id s3-20020a056602240300b007589413aea0so11661476ioa.5
        for <linux-usb@vger.kernel.org>; Thu, 30 Mar 2023 09:00:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680192030; x=1682784030;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AFd4Vv+1QlOQI+H4u8kgcpRfOkpOstzxf4ODCKTbTXE=;
        b=3TYr+PQsHNQlwm9bVl86xJ8b9dQO5ntp7Ljub8aOjEPbSWDN7Unab6OOqJQ6VJXJE2
         1vfszXvDqxhlo7X8/JPbWLWFOHB/s9y9ZrBRsJyklu4OowG59t3ofIKB/8WBi2sMgM7Q
         pcjwPSDtxX5o0CmVkuFgIIia3mzNQ9/sBLCESyt1IakrWRp55ZSG3uafwbUTqiMYjWXq
         8mOagemfeqQP+m9dW/PLITD9DRyH7VIGQ0nrjUZjhMe/RMl7+dct94M+znhmLrCwyUPo
         fF8SoE9qkwjaz+N3xhFRmhPXiCQ4D89ZYL4avw1cViYBalpv43n3dNYMo5q7K/7ZfUoL
         goJA==
X-Gm-Message-State: AO0yUKVs5vmgnk/tcGhw/3T/oaXDUdhox/gJ/Z+9qFhUzUsm/QSl+ft0
        dv068eJ+s/7U4bgQwb++uBtJeaZIg5YJvnzNI8a+18AFZ8LU
X-Google-Smtp-Source: AK7set9zMzME+5Sql6iouCqcaECY6f0i9FUvslzaxRbKCppicvh8rUlxD9aczW/rP3CUtus4FG9SA2BzVGZ9p0ffb/ym+1BylAkN
MIME-Version: 1.0
X-Received: by 2002:a5d:9446:0:b0:753:2ab8:aff7 with SMTP id
 x6-20020a5d9446000000b007532ab8aff7mr8414673ior.1.1680192030243; Thu, 30 Mar
 2023 09:00:30 -0700 (PDT)
Date:   Thu, 30 Mar 2023 09:00:30 -0700
In-Reply-To: <b799fc68-8840-43e7-85f5-27e1e6457a44@rowland.harvard.edu>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000001e03d605f8203164@google.com>
Subject: Re: [syzbot] [usb?] WARNING in sisusb_send_bulk_msg/usb_submit_urb
From:   syzbot <syzbot+23be03b56c5259385d79@syzkaller.appspotmail.com>
To:     linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        stern@rowland.harvard.edu, syzkaller-bugs@googlegroups.com,
        thomas@winischhofer.net
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=0.6 required=5.0 tests=FROM_LOCAL_HEX,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-and-tested-by: syzbot+23be03b56c5259385d79@syzkaller.appspotmail.com

Tested on:

commit:         c9c3395d Linux 6.2
git tree:       https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/ v6.2
console output: https://syzkaller.appspot.com/x/log.txt?x=16fe503ec80000
kernel config:  https://syzkaller.appspot.com/x/.config?x=8b64e70ff2a55d53
dashboard link: https://syzkaller.appspot.com/bug?extid=23be03b56c5259385d79
compiler:       gcc (Debian 10.2.1-6) 10.2.1 20210110, GNU ld (GNU Binutils for Debian) 2.35.2
patch:          https://syzkaller.appspot.com/x/patch.diff?x=10b3a60dc80000

Note: testing is done by a robot and is best-effort only.
