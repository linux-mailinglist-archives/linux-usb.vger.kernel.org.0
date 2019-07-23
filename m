Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EFE4C72335
	for <lists+linux-usb@lfdr.de>; Wed, 24 Jul 2019 01:55:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727082AbfGWXzO (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 23 Jul 2019 19:55:14 -0400
Received: from mail-pg1-f196.google.com ([209.85.215.196]:44852 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726520AbfGWXzO (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 23 Jul 2019 19:55:14 -0400
Received: by mail-pg1-f196.google.com with SMTP id i18so20202307pgl.11
        for <linux-usb@vger.kernel.org>; Tue, 23 Jul 2019 16:55:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=gbLOkP3Zk+05iV/76VtkINMHige630DMWAurznznUXU=;
        b=TJOAfNJZMWpg0ynXINtYh6LkuNV5DY6F1GtsYBp2XZhgzBBH1pGDD0VtYUH11XDM4R
         echwfqk1h0YJqCT991lo58t1M0a29FOtE2ET7vfS/tc2LX3RfR6+N0mFfIHa0uuJAc5s
         69JIO9YIKUTZHfiT0i/fvc9bpEr6MWUWakNXtL5BndSuBhBPzPfhMBDXytK290BtDkrY
         iQLclOIPglGNOm2V13UFleiiqi0pljZZzhveg0+5+mZEykkhCRUNeovnqjjSveuFaE8c
         EyXu+MRhJTtuQ3lGAjZ+aPxtofcdtPalYGFaPurJmsNEW2w79hfLhCxBgAqzy4z7Lj+C
         MjBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=gbLOkP3Zk+05iV/76VtkINMHige630DMWAurznznUXU=;
        b=Mjd3RAspvHBQ+MGmfrhrmY344QOye9xypvN5MxEusfINSu3O/Uga8pfiTR29fHDUjs
         MiB7l6jOPYIYbTdgMjdsGB28I7Q+qA94NIi7yWG9R6l3Wu9R13xeAgeNhMRiNqDCefCu
         hbaPfXcf7tQFd+h1AWgWhaaQnMDNWFOPwNuiD9CVDm5K3WFb9XAM1H9qKFuoN7/gIsdr
         RoRuDcFCcAXzsHcew2E+19QQ6xl+yQFmu/xnrtSRbNK5b467Pl0mpi4aiM/CKFg9jbJt
         NR8ocVHTuAsRVM4J5Pxb7cKXfOqCqMcy+7BmE5QODGkutmh4Uao5L7VxhTfHzsVa5yxU
         VVWg==
X-Gm-Message-State: APjAAAXxOnua1lRqZioCF9JKjfwBqSJ635hLVVlTlkU9MvITHuc5M1aP
        RYjcFgVkZLD+z/d3q7Zn44apBr0m
X-Google-Smtp-Source: APXvYqyZL9BuhOikrL5mBm6/YjDnvyU9sSUUlxG9LLeREHnF2rLjXqvcwrAp+y0cemyaygiBObbZIQ==
X-Received: by 2002:a63:1020:: with SMTP id f32mr48950343pgl.203.1563926112955;
        Tue, 23 Jul 2019 16:55:12 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 22sm51500400pfu.179.2019.07.23.16.55.12
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 23 Jul 2019 16:55:12 -0700 (PDT)
Date:   Tue, 23 Jul 2019 16:55:11 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Douglas Gilbert <dgilbert@interlog.com>
Cc:     heikki.krogerus@linux.intel.com, linux-usb@vger.kernel.org
Subject: Re: 5.1.18 oops: echo source > /sys/class/typec/port0/preferred_role
Message-ID: <20190723235511.GB11756@roeck-us.net>
References: <fab64d97-19f3-057a-c5c4-926e9551e788@interlog.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fab64d97-19f3-057a-c5c4-926e9551e788@interlog.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Doug,

On Tue, Jul 23, 2019 at 07:26:34PM -0400, Douglas Gilbert wrote:
> Hi,
> Apologies if this is not code you maintain or the wrong medium.
> 
No worries. You should copy the respective mailing lists, but I'll do that
for you.

> I'm experimenting with a NXP OM 13588 board (USB Type C Arduino shield)
> on a Atmel SAMA5D2_XPLAINED board running lk 5.1.18 and Debian 10 .
> When I did the "echo" command in the subject line to sysfs I saw the
> following:
> 
> [28988.750000] Unable to handle kernel NULL pointer dereference at virtual
> address 00000028
> [28988.750000] pgd = f69149ad
> [28988.760000] [00000028] *pgd=00000000
> [28988.760000] Internal error: Oops: 5 [#1] THUMB2
> [28988.760000] Modules linked in: tcpci tcpm
> [28988.760000] CPU: 0 PID: 1882 Comm: bash Not tainted 5.1.18-sama5-armv7-r2 #4
> [28988.760000] Hardware name: Atmel SAMA5
> [28988.760000] PC is at tcpm_try_role+0x3a/0x4c [tcpm]
> [28988.760000] LR is at tcpm_try_role+0x15/0x4c [tcpm]
> [28988.760000] pc : [<bf8000e2>]    lr : [<bf8000bd>]    psr: 60030033
> [28988.760000] sp : dc1a1e88  ip : c03fb47d  fp : 00000000
> [28988.760000] r10: dc216190  r9 : dc1a1f78  r8 : 00000001
> [28988.760000] r7 : df4ae044  r6 : dd032e90  r5 : dd1ce340  r4 : df4ae054
> [28988.760000] r3 : 00000000  r2 : 00000000  r1 : 00000000  r0 : df4ae044
> [28988.760000] Flags: nZCv  IRQs on  FIQs on  Mode SVC_32  ISA Thumb  Segment none
> [28988.760000] Control: 50c53c7d  Table: 3efec059  DAC: 00000051
> [28988.760000] Process bash (pid: 1882, stack limit = 0x6a6d4aa5)
> [28988.760000] Stack: (0xdc1a1e88 to 0xdc1a2000)
> [28988.760000] 1e80:                   dd05d808 dd1ce340 00000001 00000007
> dd1ce340 c03fb4a7
> [28988.760000] 1ea0: 00000007 00000007 dc216180 00000000 00000000 c01e1e03
> 00000000 00000000
> [28988.760000] 1ec0: c0907008 dee98b40 c01e1d5d c06106c4 00000000 00000000
> 00000007 c0194e8b
> [28988.760000] 1ee0: 0000000a 00000400 00000000 c01a97db dc22bf00 ffffe000
> df4b6a00 df745900
> [28988.760000] 1f00: 00000001 00000001 000000dd c01a9c2f 7aeab3be c0907008
> 00000000 dc22bf00
> [28988.760000] 1f20: c0907008 00000000 00000000 00000000 00000000 7aeab3be
> 00000007 dee98b40
> [28988.760000] 1f40: 005dc318 dc1a1f78 00000000 00000000 00000007 c01969f7
> 0000000a c01a20cb
> [28988.760000] 1f60: dee98b40 c0907008 dee98b40 005dc318 00000000 c0196b9b
> 00000000 00000000
> [28988.760000] 1f80: dee98b40 7aeab3be 00000074 005dc318 b6f3bdb0 00000004
> c0101224 dc1a0000
> [28988.760000] 1fa0: 00000004 c0101001 00000074 005dc318 00000001 005dc318
> 00000007 00000000
> [28988.760000] 1fc0: 00000074 005dc318 b6f3bdb0 00000004 00000007 00000007
> 00000000 00000000
> [28988.760000] 1fe0: 00000004 be800880 b6ed35b3 b6e5c746 60030030 00000001
> 00000000 00000000
> [28988.760000] [<bf8000e2>] (tcpm_try_role [tcpm]) from [<c03fb4a7>]
> (preferred_role_store+0x2b/0x5c)
> [28988.760000] [<c03fb4a7>] (preferred_role_store) from [<c01e1e03>]
> (kernfs_fop_write+0xa7/0x150)
> [28988.760000] [<c01e1e03>] (kernfs_fop_write) from [<c0194e8b>]
> (__vfs_write+0x1f/0x104)
> [28988.760000] [<c0194e8b>] (__vfs_write) from [<c01969f7>] (vfs_write+0x6b/0x104)
> [28988.760000] [<c01969f7>] (vfs_write) from [<c0196b9b>] (ksys_write+0x43/0x94)
> [28988.760000] [<c0196b9b>] (ksys_write) from [<c0101001>]
> (ret_fast_syscall+0x1/0x62)
> [28988.760000] Exception stack(0xdc1a1fa8 to 0xdc1a1ff0)
> [28988.760000] 1fa0:                   00000074 005dc318 00000001 005dc318
> 00000007 00000000
> [28988.760000] 1fc0: 00000074 005dc318 b6f3bdb0 00000004 00000007 00000007
> 00000000 00000000
> [28988.760000] 1fe0: 00000004 be800880 b6ed35b3 b6e5c746
> [28988.760000] Code: 4628 e8bd 81f0 6833 (f893) 5028
> [28989.020000] ---[ end trace d842183af2e975d9 ]---
> 
> The dts file is attached. It is not quite right since OF complains it
> can't find that port (but there really isn't a "port" from the
> "xplained" board's Point of view with my set up). The full oops is
> also attached.
> 
> Doug Gilbert

Can you try the following ?

Thanks,
Guenter

---
diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
index fba32d84e578..6edacf60a226 100644
--- a/drivers/usb/typec/tcpm/tcpm.c
+++ b/drivers/usb/typec/tcpm/tcpm.c
@@ -4114,7 +4114,7 @@ static int tcpm_try_role(const struct typec_capability *cap, int role)
 	mutex_lock(&port->lock);
 	if (tcpc->try_role)
 		ret = tcpc->try_role(tcpc, role);
-	if (!ret && !tcpc->config->try_role_hw)
+	if (!ret && (!tcpc->config || !tcpc->config->try_role_hw))
 		port->try_role = role;
 	port->try_src_count = 0;
 	port->try_snk_count = 0;
