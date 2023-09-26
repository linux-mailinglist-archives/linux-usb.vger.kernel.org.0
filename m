Return-Path: <linux-usb+bounces-598-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 558097AF05F
	for <lists+linux-usb@lfdr.de>; Tue, 26 Sep 2023 18:13:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sy.mirrors.kernel.org (Postfix) with ESMTP id 3EBA8B20A27
	for <lists+linux-usb@lfdr.de>; Tue, 26 Sep 2023 16:13:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EFBEE31A63;
	Tue, 26 Sep 2023 16:13:26 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 255772E65A
	for <linux-usb@vger.kernel.org>; Tue, 26 Sep 2023 16:13:24 +0000 (UTC)
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 71EA1AF
	for <linux-usb@vger.kernel.org>; Tue, 26 Sep 2023 09:13:23 -0700 (PDT)
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-3ae5ee6624dso1321195b6e.1
        for <linux-usb@vger.kernel.org>; Tue, 26 Sep 2023 09:13:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695744802; x=1696349602;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ghMxj6Q7DUFUv4QcWBQyCNlsSSFlP9qfCWzVXyW67xc=;
        b=oeZVND+8HBd4Pu0tw1yeEZ69AHEWgef9KdveY+LH5391gfvxsvz/5fZjtAOrM44wHw
         4QknmzhmbFPpm+7+YBz+MuwhPWgzlYvslKlA7Asa7WM86ebvvHpuF6jPWL8b1dyhRWTW
         2Y3Gzu0DD6INKWMrytRRna3T+Ehnudg1uh1yMkg26cynUQl9+eXlAasj6F8hOvPJPf5r
         d5oyAS9Aav/BjE4luUTe0abHfUiSZmQ1iPELDvSHTvotj0/uGC/bDkl7VV6r49OP8XHe
         Z718kliu/RepI8r3Xdl8SVLm0fKlrdVtm0a3dTDEhMK6ILl2dWg+4kifYs+ccebv/0a3
         UHIA==
X-Gm-Message-State: AOJu0Yws7S62YNJ0eHq/LE1K3tx3MaQtWDQpKdvihHAz1UG0SV+zuR5V
	Znbz48wZoJIWfiCGXkTNbKJXbeITtvcBQ57Zdd0aEE5z9aKq
X-Google-Smtp-Source: AGHT+IFJu8R7r6R/i2Zmu5Lzt88ngYl65Fkgewf10P4lhSnqWqJcx4CHcghNoc/QOaFcSeISwiqKvZzltzos2fW8FQSYP/dbTcd2
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:2a65:b0:3ae:526e:2634 with SMTP id
 fu5-20020a0568082a6500b003ae526e2634mr1596935oib.9.1695744802823; Tue, 26 Sep
 2023 09:13:22 -0700 (PDT)
Date: Tue, 26 Sep 2023 09:13:22 -0700
In-Reply-To: <kwwrx7p4nfr4qkv5xxpo5nidyyjdbytsulpu7lj6yujmzrnxb6@q63vtmlo3dqa>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000009a28dd0606455a6b@google.com>
Subject: Re: [syzbot] [usb?] [media?] WARNING in imon_probe
From: syzbot <syzbot+1c41b2e045dc086f58be@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-usb@vger.kernel.org, mchehab@kernel.org, ricardo@marliere.net, 
	sean@mess.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=0.9 required=5.0 tests=BAYES_00,FROM_LOCAL_HEX,
	HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H2,
	SORTED_RECIPS,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

Hello,

syzbot tried to test the proposed patch but the build/boot failed:

failed to apply patch:
checking file drivers/media/rc/imon.c
patch: **** unexpected end of file in patch



Tested on:

commit:         a48fa7ef Merge tag 'drm-next-2023-09-08' of git://anon..
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
kernel config:  https://syzkaller.appspot.com/x/.config?x=150188feee7071a7
dashboard link: https://syzkaller.appspot.com/bug?extid=1c41b2e045dc086f58be
compiler:       
patch:          https://syzkaller.appspot.com/x/patch.diff?x=17cadccc680000


