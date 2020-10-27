Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 82DA329A58B
	for <lists+linux-usb@lfdr.de>; Tue, 27 Oct 2020 08:31:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2507694AbgJ0HbB (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 27 Oct 2020 03:31:01 -0400
Received: from mail-dm6nam10on2052.outbound.protection.outlook.com ([40.107.93.52]:63626
        "EHLO NAM10-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1729486AbgJ0HbB (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 27 Oct 2020 03:31:01 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oQnbk6Jaop1BgI8NBxxcbGQvFb1aCnceI+2PwIKf6zZB3kta/wiXsX2i8vWMn1SMAmNrav80PhsyeacrnFKJlYefyCZbzTejlzrrZ5sL118LbhjTNIhUL9o3XGUgoViGdLa7VWqklmjbRTMRdbPyLWKlu0GuM35lU6Kutjj819Oykq7YZF6XR5FXa6GuGas6S7wn+uiNwDE4YCQ81x+EFFjL9M1gh+6iHn5ATYQDqkYpzLWHYyUytps01sRTEswPaG1CiSae89UTW3qahdOIxpdnEuHpdGq0GN8pw6KpdTuc2JQznDvHbSiqaqMg9HtEUI5FssNivzppZe6EPjhoog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EE02ZeR3GMoNx/UkKN6XGkYViIEk4mH2vgn3YYLteMg=;
 b=Ub+uWAk40C8m9eHviiPMQ0Qc8P5kUYV7rkSMiDve/wEq112vMoZyOKEuJTe/h56uvttllgfV+ilgAINmbGyaA8yVGhjNmCEeUhmp0PUAeLTNgsX3WokUeGe6CH44WiSffkTc0CY0W3dE4MObcL6GXEqx5kYkPqQjIgub8gw/1so6i+5QnxO/J3sSSG2Hm5EY2zE3xq9GcqtGBe0dbu1RI7iNQWYXGB+liUhWzFry2GHU8HsdVTYQPC37z7Xkh2qnYiDG7HgxGAHz+GS0c0Q693ky544oTk9duM8wfa/SGhNE5vVJ4XAnijdtsQsQ7snlPdv6CMUB4kvwqYGj29LZ1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EE02ZeR3GMoNx/UkKN6XGkYViIEk4mH2vgn3YYLteMg=;
 b=CZcJlN4yh9EItY571aROkOUkew5zAzBNDxGHBbe4EXF0FMEVeOEppSbqSEIq/79bp7RH8ACKSsqok1c/aJkgzI4odzPs5yJO+z6hVJabeCUw/rV7Ajrnip+GA4kBfZJQNSgg0ybYSqmbO4CV2xrV7tsmTF0gmZMlcPoADoA1m+A=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=windriver.com;
Received: from BYAPR11MB2632.namprd11.prod.outlook.com (2603:10b6:a02:c4::17)
 by BY5PR11MB4241.namprd11.prod.outlook.com (2603:10b6:a03:1ca::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.25; Tue, 27 Oct
 2020 07:30:58 +0000
Received: from BYAPR11MB2632.namprd11.prod.outlook.com
 ([fe80::80e9:e002:eeff:4d05]) by BYAPR11MB2632.namprd11.prod.outlook.com
 ([fe80::80e9:e002:eeff:4d05%3]) with mapi id 15.20.3455.030; Tue, 27 Oct 2020
 07:30:57 +0000
From:   qiang.zhang@windriver.com
To:     balbi@kernel.org, gregkh@linuxfoundation.org,
        dan.carpenter@oracle.com
Cc:     linux-usb@vger.kernel.org
Subject: [PATCH] usb: raw-gadget: fix memory leak in gadget_setup
Date:   Tue, 27 Oct 2020 15:30:44 +0800
Message-Id: <20201027073044.20538-1-qiang.zhang@windriver.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: HK2PR02CA0174.apcprd02.prod.outlook.com
 (2603:1096:201:1f::34) To BYAPR11MB2632.namprd11.prod.outlook.com
 (2603:10b6:a02:c4::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from pek-qzhang2-d1.wrs.com (60.247.85.82) by HK2PR02CA0174.apcprd02.prod.outlook.com (2603:1096:201:1f::34) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.19 via Frontend Transport; Tue, 27 Oct 2020 07:30:56 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3afa449f-6691-437d-cfe6-08d87a4a3ed8
X-MS-TrafficTypeDiagnostic: BY5PR11MB4241:
X-Microsoft-Antispam-PRVS: <BY5PR11MB4241BDE30D65E0FC43D53E11FF160@BY5PR11MB4241.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DX4tfYm5Sp0ywxbcsj9ZY9h6t58l9Cph4ICDTadpCwwd+LS1bwhiJwx/HlIrBKrZNlV7pBhlZKGKNSlxMXtOVKGCG0BBatpJZfbqLSbzeelaDRQLsGTEf+f9ia3QLGuP5HNNeO/eRpf+ZKq4uMevtNft2/ms2x7wu1zmkDoM01oSnyMBsTnmFvPXN0ppz9XjhFSlZJWkD+c2yKmEZQ30w0e7QiOOSvdZv6GMw8WY9SgtfPJrVEOYWvIpbeF8VJh7+VXu4+5gVCN8XFyj1mWz1KNe0tK9WQZNT9jEtu7r3NTqj3VdHTLMfdmVk0q4AO9NBpQ8qpFfCBTKJF2C9VNM20Zo+3xu3oFyl9wsSWLe2JIMX3PYsQ8w7w4oislwPsOC
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR11MB2632.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(376002)(366004)(346002)(39850400004)(396003)(8676002)(9686003)(66556008)(6512007)(5660300002)(66946007)(66476007)(2906002)(1076003)(86362001)(6666004)(16526019)(52116002)(36756003)(83380400001)(956004)(6486002)(6506007)(2616005)(316002)(26005)(8936002)(478600001)(186003)(4326008)(505234006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: WkEtVeWevgQssrAu9gpL14S/sRsmtSEWdjDYBfJpNeS1XdVb8zT9GspLQy9Ig6plNnlN2DX3voKy5sW0xcEkmb7KQJ1BzZoxT7G1ugyZJCWYAfawJyJF2jyCXQgCln3CSAJaEl7IdovFIFx0eFECrnK470eY+hshQdxQE0pP+i9QsLnSb/a8eHv4szkVmGFWxPaUdWzTnsVNux5jdoLapHRv82XX22Mfu9DQdYFLunlhkGgJyPG69UFJkWFkfItN5nXOcBRbTPBtyg9J3POVvW6/hhiS8N2pyL49ks5bfKfwKwpz2/2zCi0UWmlVSBadbaUPve+jGc7Pb6xfKMnKtRmQJ6GHyxQGVCUPbcLFeSljWZQ6r/LwJCaSWIrtpvmuAz89YtSO9zmnKVueaBQRg4SHdW4AmTEa5mkFxIp7RUw24NyCvobscKOPq7sAU6pwbtOFdxnLd33oD/4JAsIxRAEmShWF2x9q1qqmGLfPfXfGItdWcMnnSkuTrAopkgKr9ZbFQ/Z6Nsu4l3nHdRVfZqq2E2P51rrIa16anWgRXk9tsSkNm7TWZqAmgupFUbxEa94sXcAKiZ4czCr4NY30ZGYRKMSmtVsKygDvI87XYaxR9g9FKqq8cZNMysSqwrfwvytmUioaWmysu2PuA8UTcw==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3afa449f-6691-437d-cfe6-08d87a4a3ed8
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2632.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2020 07:30:57.6358
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: J/ggYIghRZOJ/zl5dumuKVxsrUwUPDT/NfSjhKcSmAvwDNwj71Va1w1/avZzyPOOIvIi5Jzf3NQuqU2a2ztuZYyllZDP4Wgvr7EikVhgFCw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4241
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Zqiang <qiang.zhang@windriver.com>

When fetch 'event' from event queue, after copy its address
space content to user space, the 'event' the memory space
pointed to by the 'event' pointer need be freed.

BUG: memory leak
unreferenced object 0xffff888110622660 (size 32):
  comm "softirq", pid 0, jiffies 4294941981 (age 12.480s)
  hex dump (first 32 bytes):
    02 00 00 00 08 00 00 00 80 06 00 01 00 00 40 00  ..............@.
    00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
  backtrace:
    [<00000000efd29abd>] kmalloc include/linux/slab.h:554 [inline]
    [<00000000efd29abd>] raw_event_queue_add drivers/usb/gadget/legacy/raw_gadget.c:66 [inline]
    [<00000000efd29abd>] raw_queue_event drivers/usb/gadget/legacy/raw_gadget.c:225 [inline]
    [<00000000efd29abd>] gadget_setup+0xf6/0x220 drivers/usb/gadget/legacy/raw_gadget.c:343
    [<00000000952c4a46>] dummy_timer+0xb9f/0x14c0 drivers/usb/gadget/udc/dummy_hcd.c:1899
    [<0000000074ac2c54>] call_timer_fn+0x38/0x200 kernel/time/timer.c:1415
    [<00000000560a3a79>] expire_timers kernel/time/timer.c:1460 [inline]
    [<00000000560a3a79>] __run_timers.part.0+0x319/0x400 kernel/time/timer.c:1757
    [<000000009d9503d0>] __run_timers kernel/time/timer.c:1738 [inline]
    [<000000009d9503d0>] run_timer_softirq+0x3d/0x80 kernel/time/timer.c:1770
    [<000000009df27c89>] __do_softirq+0xcc/0x2c2 kernel/softirq.c:298
    [<000000007a3f1a47>] asm_call_irq_on_stack+0xf/0x20
    [<000000004a62cc2e>] __run_on_irqstack arch/x86/include/asm/irq_stack.h:26 [inline]
    [<000000004a62cc2e>] run_on_irqstack_cond arch/x86/include/asm/irq_stack.h:77 [inline]
    [<000000004a62cc2e>] do_softirq_own_stack+0x32/0x40 arch/x86/kernel/irq_64.c:77
    [<00000000b0086800>] invoke_softirq kernel/softirq.c:393 [inline]
    [<00000000b0086800>] __irq_exit_rcu kernel/softirq.c:423 [inline]
    [<00000000b0086800>] irq_exit_rcu+0x91/0xc0 kernel/softirq.c:435
    [<00000000175f9523>] sysvec_apic_timer_interrupt+0x36/0x80 arch/x86/kernel/apic/apic.c:1091
    [<00000000a348e847>] asm_sysvec_apic_timer_interrupt+0x12/0x20 arch/x86/include/asm/idtentry.h:631
    [<0000000060661100>] native_safe_halt arch/x86/include/asm/irqflags.h:60 [inline]
    [<0000000060661100>] arch_safe_halt arch/x86/include/asm/irqflags.h:103 [inline]
    [<0000000060661100>] acpi_safe_halt drivers/acpi/processor_idle.c:111 [inline]
    [<0000000060661100>] acpi_idle_do_entry+0xc3/0xd0 drivers/acpi/processor_idle.c:517
    [<000000003f413b99>] acpi_idle_enter+0x128/0x1f0 drivers/acpi/processor_idle.c:648
    [<00000000f5e5afb8>] cpuidle_enter_state+0xc9/0x650 drivers/cpuidle/cpuidle.c:237
    [<00000000d50d51fc>] cpuidle_enter+0x29/0x40 drivers/cpuidle/cpuidle.c:351
    [<00000000d674baed>] call_cpuidle kernel/sched/idle.c:132 [inline]
    [<00000000d674baed>] cpuidle_idle_call kernel/sched/idle.c:213 [inline]
    [<00000000d674baed>] do_idle+0x1c8/0x250 kernel/sched/idle.c:273

Reported-by: syzbot+bd38200f53df6259e6bf@syzkaller.appspotmail.com
Signed-off-by: Zqiang <qiang.zhang@windriver.com>
---
 drivers/usb/gadget/legacy/raw_gadget.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/gadget/legacy/raw_gadget.c b/drivers/usb/gadget/legacy/raw_gadget.c
index e01e366d89cd..062dfac30399 100644
--- a/drivers/usb/gadget/legacy/raw_gadget.c
+++ b/drivers/usb/gadget/legacy/raw_gadget.c
@@ -564,9 +564,12 @@ static int raw_ioctl_event_fetch(struct raw_dev *dev, unsigned long value)
 		return -ENODEV;
 	}
 	length = min(arg.length, event->length);
-	if (copy_to_user((void __user *)value, event, sizeof(*event) + length))
+	if (copy_to_user((void __user *)value, event, sizeof(*event) + length)) {
+		kfree(event);
 		return -EFAULT;
+	}
 
+	kfree(event);
 	return 0;
 }
 
-- 
2.17.1

