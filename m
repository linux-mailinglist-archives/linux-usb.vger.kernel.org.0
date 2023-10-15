Return-Path: <linux-usb+bounces-1630-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 90AB67C9824
	for <lists+linux-usb@lfdr.de>; Sun, 15 Oct 2023 08:20:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 71560B20C7C
	for <lists+linux-usb@lfdr.de>; Sun, 15 Oct 2023 06:20:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C9A01FDF;
	Sun, 15 Oct 2023 06:20:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAA111878
	for <linux-usb@vger.kernel.org>; Sun, 15 Oct 2023 06:20:38 +0000 (UTC)
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DA7C4DC
	for <linux-usb@vger.kernel.org>; Sat, 14 Oct 2023 23:20:36 -0700 (PDT)
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-3af7219c67fso5501553b6e.1
        for <linux-usb@vger.kernel.org>; Sat, 14 Oct 2023 23:20:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697350836; x=1697955636;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JnnxlBZS3D2FK4g6Uy7ps+bfDovN+JjodCSC2jnZejQ=;
        b=UkYUF8sMzo6Qb5L7u+9hxPGD31NK8+212pD64LKaAPOiLRgdqEhVKq+7hK3gb6M7T9
         bqamd8GayvSdaiS+j4/VDpGEuqbKPkH6NhOKJxmDojQvSUtNeKPEL0xs/JK1Knl3JDjv
         nkeuiT73jO3FFVTsxFE6iKnsuI/ZzSMjra6Ti095Ryzxv3sP+oHU7Mj8pvDKsQOCOXGG
         qumA7U/1vpVlRx4ooQlBjwcuihzxbEkrtSLaKzZmKz8RArbqQ+M56UpD0AgrmEo7Yy1m
         4eS7Va/9ViZzgB+RwFx22xNg9uomf01fnpAlJ5rJf4q3DbWm/mDMcgdRIg2ax+UZJWAl
         0Brw==
X-Gm-Message-State: AOJu0YyB+C6i8gTwajWrwSHXwV6gqSM+GMfeCAGZQfnGkg/F6vj+Lg0h
	e608elrnola5I7LJDETllb7xO4+Tt43e0qdW0w4eFQVlax1V
X-Google-Smtp-Source: AGHT+IGdOmApbp1z+C4jkZhnMvLqnC6RfTusIF3Td3gW7xJSBZwQQZ2Gm5r1fGERsRs0BZ48WUtl4POS6SIIi2qUuNZw18KJEBSn
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:2118:b0:3a9:b964:820e with SMTP id
 r24-20020a056808211800b003a9b964820emr15443810oiw.3.1697350836276; Sat, 14
 Oct 2023 23:20:36 -0700 (PDT)
Date: Sat, 14 Oct 2023 23:20:36 -0700
In-Reply-To: <000000000000d04ea90604a6efcc@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000a7d2820607bb49c2@google.com>
Subject: Re: [syzbot] [kernel?] general protection fault in usb_hub_create_port_device
From: syzbot <syzbot+c063a4e176681d2e0380@syzkaller.appspotmail.com>
To: andriy.shevchenko@linux.intel.com, christophe.jaillet@wanadoo.fr, 
	gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, rafael@kernel.org, raychi@google.com, 
	royluo@google.com, stern@rowland.harvard.edu, syzkaller-bugs@googlegroups.com, 
	yuran.pereira@hotmail.com
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=0.9 required=5.0 tests=BAYES_00,FROM_LOCAL_HEX,
	HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H2,
	SORTED_RECIPS,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

syzbot suspects this issue was fixed by commit:

commit fd6f7ad2fd4d53fa14f4fd190f9b05d043973892
Author: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Date:   Mon Aug 28 14:58:24 2023 +0000

    driver core: return an error when dev_set_name() hasn't happened

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=148e8a9d680000
start commit:   7733171926cc Merge tag 'mailbox-v6.6' of git://git.linaro...
git tree:       upstream
kernel config:  https://syzkaller.appspot.com/x/.config?x=b273cdfbc13e9a4b
dashboard link: https://syzkaller.appspot.com/bug?extid=c063a4e176681d2e0380
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=17a4ca00680000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=13bed168680000

If the result looks correct, please mark the issue as fixed by replying with:

#syz fix: driver core: return an error when dev_set_name() hasn't happened

For information about bisection process see: https://goo.gl/tpsmEJ#bisection

