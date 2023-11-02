Return-Path: <linux-usb+bounces-2451-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B9DFC7DF0A6
	for <lists+linux-usb@lfdr.de>; Thu,  2 Nov 2023 11:55:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 47372281A0B
	for <lists+linux-usb@lfdr.de>; Thu,  2 Nov 2023 10:55:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0615514006;
	Thu,  2 Nov 2023 10:55:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C84BF13AE6
	for <linux-usb@vger.kernel.org>; Thu,  2 Nov 2023 10:55:09 +0000 (UTC)
Received: from mail-oa1-f72.google.com (mail-oa1-f72.google.com [209.85.160.72])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C780186
	for <linux-usb@vger.kernel.org>; Thu,  2 Nov 2023 03:55:04 -0700 (PDT)
Received: by mail-oa1-f72.google.com with SMTP id 586e51a60fabf-1e98a9dd333so947093fac.2
        for <linux-usb@vger.kernel.org>; Thu, 02 Nov 2023 03:55:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698922503; x=1699527303;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=la7hzjP2zBKUn3oiit+lIJoZEhMcvAayTPixEdh76yQ=;
        b=Rce8d94oqN7XQj/kgXwoUJz436zXXQtrP44t2LWevYyW/mtxnSn4kKd8n0JHgYXAR9
         S2uyFPmzJQUFoYEGZPOP5jZAjbnLZ+WGVuGLkaAlMFITXm5C/y4zE5OBwiciFm5/uKnP
         XMk7azzp/5WZ3a+EAw4AdaGiyBUxb0Oik2m8RpGs+PuIyXaMIGdpZ2vXaCCRmgE9ofpA
         aMa7iYK2zRscqeso3zfPMXHA+swDDn1TiwyspI3Doa+LdOucVhzx0Orha25EbRTVif63
         MosAMDHONpdAxfuZ+EHyfv22Fby0PxeoIjpcJIBOiqfZt+xDo70+ym7y29jQwNY64uQi
         ecLg==
X-Gm-Message-State: AOJu0YwBpv5ugCyDOKe8pg6FTQxA0ZxmHjAdvfrvhCYI4wpSBqxJ4pGx
	HxISCs/WKOdRBWnXn/gN4ICWRXXLX0clfejgmjX2wc9bH5Xs
X-Google-Smtp-Source: AGHT+IElbKg+EeRIp1W9TwX1La69cw8Mn5P2aiLEy92t+6/mJ3coq2apA+VdMgsutl5EcPvBfgvYaOyr/g+K7qN1O8/97/Nr1hUF
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6870:1d0:b0:1e9:90f0:613f with SMTP id
 n16-20020a05687001d000b001e990f0613fmr8462067oad.0.1698922503157; Thu, 02 Nov
 2023 03:55:03 -0700 (PDT)
Date: Thu, 02 Nov 2023 03:55:03 -0700
In-Reply-To: <0000000000009ee19a0609135c34@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000004d3e3d0609293891@google.com>
Subject: Re: [syzbot] [net?] [usb?] INFO: rcu detected stall in
 nsim_dev_trap_report_work (2)
From: syzbot <syzbot+193dae06b6680599fbab@syzkaller.appspotmail.com>
To: davem@davemloft.net, eadavis@qq.com, edumazet@google.com, 
	idosch@nvidia.com, jiri@nvidia.com, kuba@kernel.org, leon@kernel.org, 
	linux-kernel@vger.kernel.org, linux-rdma@vger.kernel.org, 
	linux-usb@vger.kernel.org, netdev@vger.kernel.org, pabeni@redhat.com, 
	petrm@nvidia.com, saeedm@nvidia.com, syzkaller-bugs@googlegroups.com, 
	tariqt@nvidia.com
Content-Type: text/plain; charset="UTF-8"

syzbot has bisected this issue to:

commit 644a66c60f02f302d82c3008ae2ffe67cf495383
Author: Jiri Pirko <jiri@nvidia.com>
Date:   Fri Jul 29 07:10:36 2022 +0000

    net: devlink: convert reload command to take implicit devlink->lock

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=13c76cf3680000
start commit:   66f1e1ea3548 Add linux-next specific files for 20231027
git tree:       linux-next
final oops:     https://syzkaller.appspot.com/x/report.txt?x=10276cf3680000
console output: https://syzkaller.appspot.com/x/log.txt?x=17c76cf3680000
kernel config:  https://syzkaller.appspot.com/x/.config?x=2911330219149de4
dashboard link: https://syzkaller.appspot.com/bug?extid=193dae06b6680599fbab
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=10b8e977680000

Reported-by: syzbot+193dae06b6680599fbab@syzkaller.appspotmail.com
Fixes: 644a66c60f02 ("net: devlink: convert reload command to take implicit devlink->lock")

For information about bisection process see: https://goo.gl/tpsmEJ#bisection

