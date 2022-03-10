Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 21C254D4555
	for <lists+linux-usb@lfdr.de>; Thu, 10 Mar 2022 12:07:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240860AbiCJLIo convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-usb@lfdr.de>); Thu, 10 Mar 2022 06:08:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33380 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230085AbiCJLIn (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 10 Mar 2022 06:08:43 -0500
Received: from mail-io1-f69.google.com (mail-io1-f69.google.com [209.85.166.69])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4B31822BFB
        for <linux-usb@vger.kernel.org>; Thu, 10 Mar 2022 03:07:41 -0800 (PST)
Received: by mail-io1-f69.google.com with SMTP id z10-20020a056602080a00b00645b9fdc630so3603262iow.5
        for <linux-usb@vger.kernel.org>; Thu, 10 Mar 2022 03:07:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
         :from:to:cc:content-transfer-encoding;
        bh=ley6AiQa9kytHCGEuHlxzUEN+VCZUDMbILTNBl2UYjA=;
        b=Q+4ymZNkse6w9CtE/K8tToBWHjSf6BfrL6qWcKyI2A8OvWMtGLK32hpli9HsCZH4MP
         sHwXRkP15ZWJLddCJapSt/CRRsFIBunhNNKrpPYXLMIQv3MZoWjMJvkMuNW3/MrWoLpd
         KMP01x+ZuklcSfCGo51Sf5MB85cAj4evdC7X9ZXbt5o+a6HM8Utzco0bi6ZiXwZ4oHB1
         dx089Unh4XBXjB67QJdQOKfp58fyhK08acXfyc+GxSHYPHkN5vnoMUPrgYZW8dmgWtks
         30Ft1WVCWNlhjPAicqWOpn8Jj0mic4vW3McmKukzLTPzdZdfISYJP1GrorVcozsPbakz
         MDlw==
X-Gm-Message-State: AOAM531B8lU4uSJSbnOYsiivsIOhzgSHuO0bfynINaqGjBgA2Du7sLGf
        m7WhPirsYuehGI4LcsAY6tomOqLGM+n55Xzl17GF1L5bahX+
X-Google-Smtp-Source: ABdhPJz5Q0JnQINs+ynbn7+RQ1iAfUnfgwPcmZ5Yr6MhThm7O+7lT440FWhDffjLyz2TzWOHxYWmMjDIRBBHrkS0LRiJ1okR764a
MIME-Version: 1.0
X-Received: by 2002:a02:c6c9:0:b0:308:3586:f407 with SMTP id
 r9-20020a02c6c9000000b003083586f407mr3596147jan.173.1646910460611; Thu, 10
 Mar 2022 03:07:40 -0800 (PST)
Date:   Thu, 10 Mar 2022 03:07:40 -0800
In-Reply-To: <602855d8-9c9c-ad0e-3aab-06befb0c343c@suse.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000fb524d05d9db389a@google.com>
Subject: Re: [syzbot] memory leak in usb_get_configuration
From:   syzbot <syzbot+f0fae482604e6d9a87c9@syzkaller.appspotmail.com>
To:     Oliver Neukum <oneukum@suse.com>
Cc:     gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, oneukum@suse.com,
        pavel.hofman@ivitera.com, rob@robgreener.com,
        stern@rowland.harvard.edu, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,FROM_LOCAL_HEX,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

>
> On 10.03.22 00:54, syzbot wrote:
>
>> Hello,
>>
>> syzbot found the following issue on:
>>
>> HEAD commit:    0014404f9c18 Merge branch 'akpm' (patches from Andrew)
>> git tree:       upstream
>> console output: https://syzkaller.appspot.com/x/log.txt?x=15864216700000
>> kernel config:  https://syzkaller.appspot.com/x/.config?x=3f0a704147ec8e32
>> dashboard link: https://syzkaller.appspot.com/bug?extid=f0fae482604e6d9a87c9
>> compiler:       gcc (Debian 10.2.1-6) 10.2.1 20210110, GNU ld (GNU Binutils for Debian) 2.35.2
>> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=13a63dbe700000
>> C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=10e150a1700000
>>
>> IMPORTANT: if you fix the issue, please add the following tag to the commit:
>> Reported-by: syzbot+f0fae482604e6d9a87c9@syzkaller.appspotmail.com
>>
> #syz test: upstream 0014404f9c18

"upstream" does not look like a valid git repo address.

>
>  
