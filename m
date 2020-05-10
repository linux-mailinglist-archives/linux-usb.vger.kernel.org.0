Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8D51A1CC701
	for <lists+linux-usb@lfdr.de>; Sun, 10 May 2020 07:30:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725895AbgEJFal (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 10 May 2020 01:30:41 -0400
Received: from mail-eopbgr150055.outbound.protection.outlook.com ([40.107.15.55]:55168
        "EHLO EUR01-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725787AbgEJFak (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sun, 10 May 2020 01:30:40 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CmadefXOj8dWHZy35/v1AdJ76XuvKeVYAdw/yNiCrstTdwz9ZMnO5DVrwlOw1jlJjHQ4WXUytPXxJWEgTf6Sx+NC+qG4iepaJ0dmtJB8uNFmS2q1rMhfARxpn44IHKfQYBxqQSmZE/RA3DpfdgkskErk7TEgn/8fROdL3JHfVqc/123kJtG3xHmZ9kKg5cl3tGMDrn+T4p8wHARaaJMOPhNKPYALa45TiXkFOrGxMxDtX9VCtDtEVGQn3x4IQAM9wSmmEsRZLVKyxim3Gm9EwRpcaiKUge6v9rFnnp+bTIOyxEXBUCCDm+ghmUGMOkxtDzX8BKErfl+gv7ojElbDzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ulU6u5vgy15jWC5MmyQjHJJtcci6+nTrdyppAm0l8QI=;
 b=NEOmXt+qahrH8MESO6IWeGJmkrgZ8y1jWTA872RtMy+YfhtIh2BF4RfCj0vnfssuqK5wnWasdzRzbljWINq/rBGbj9LkFCOGROITdLMzkpFkUzU57sRdoMOyP3yN0uHkXw8YHW/pq/saPooScIVYMDdf1cMN/11/5eDA0kCnTdquRiKEWjO8DG1dde1ndMJKgYTCA1b+OieaANtdMzJ/hlp1JFv1Zcevk3zLhtLtf34Oc9xWHLzKC+t+3tD9kmbD5F3eai7rLEFM6ajzTw8M9RIbmKHV0gvRvlAF459GsUKz4qc4xg1jmY4eorNqeixDDj5vln2NpgLbyjgTODatlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ulU6u5vgy15jWC5MmyQjHJJtcci6+nTrdyppAm0l8QI=;
 b=b7rd1I1XTWMaSa6wAlsXb1q6PyB7nCJ7OGO415nNDUhEkhGrY5ez9DHgJigSrG/huHsTQOouJyG+wVfrFxTtX4YM/OKspFN59UdcJGneyhYBnn1jdkCGOFfHIfIFZB9C109j4RBGCHKlAeyTgVRxR1WAqCJRpIbdiqB7PG7rMGQ=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com (2603:10a6:20b:118::20)
 by AM7PR04MB6821.eurprd04.prod.outlook.com (2603:10a6:20b:105::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2979.28; Sun, 10 May
 2020 05:30:36 +0000
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::7c34:7ade:17d0:b792]) by AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::7c34:7ade:17d0:b792%9]) with mapi id 15.20.2979.033; Sun, 10 May 2020
 05:30:36 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     balbi@kernel.org
Cc:     linux-usb@vger.kernel.org, linux-imx@nxp.com, jun.li@nxp.com,
        Peter Chen <peter.chen@nxp.com>
Subject: [PATCH 1/2] usb: gadget: core: sync interrupt before unbind the udc
Date:   Sun, 10 May 2020 13:30:41 +0800
Message-Id: <20200510053042.25994-1-peter.chen@nxp.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain
X-ClientProxiedBy: SG2PR06CA0204.apcprd06.prod.outlook.com (2603:1096:4:1::36)
 To AM7PR04MB7157.eurprd04.prod.outlook.com (2603:10a6:20b:118::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from b29397-desktop.ap.freescale.net (119.31.174.66) by SG2PR06CA0204.apcprd06.prod.outlook.com (2603:1096:4:1::36) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2979.28 via Frontend Transport; Sun, 10 May 2020 05:30:34 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [119.31.174.66]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 3972b602-e800-4a01-f299-08d7f4a3448d
X-MS-TrafficTypeDiagnostic: AM7PR04MB6821:|AM7PR04MB6821:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM7PR04MB68217037CF52DAE41A00B8438BA00@AM7PR04MB6821.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-Forefront-PRVS: 039975700A
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4YianF9d+veDHPKKcvjYZLP//zuE8+hbiKb/SoRltly48y3Ur+fYNjeSb7PQiuRTy51gPC79eq+n3hAVoLX2nBKqNOLE+T04IOEV6HeVG1Hyh1QrmVQhMxjUbSRoyyHb59Y8C2sY7YiKE/7eVledPQ1LJkIo1YTJAMEwo8zSOKjCKA43KWGv6Nrr/o/obidiG42AxzG5087bC/E1QYNnTD+ESxEmAM2w3vjVUFvOx1bobraUjoupRh7Y72nPdifvRrKhn8yKQThwvAIOXK0CXaE2HV2Lns14KyCYiA9a+cHSOt6p8QCFBpx5wuqsoEtgiYSqr7J70hp++qsb2DVwqA3/wdXYt2eQmUdaAqrFpJqk+SGn9fIYVF4aXxDf6d6uhDHuphdiGG9tPbxKTwqvtjM1TZXkT2iMgWZj2yVihjvfmyiFigvmXO6+g2swysJZrktGGP1V9BY84UDtfDeWX+nqJXZac/FFO0KHdp4Jy9fgfz9WcCydDCuqhC3NeAjAqSojZX2Fw2x6LkCoLsrm3w==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR04MB7157.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(396003)(366004)(346002)(376002)(136003)(39860400002)(33430700001)(6916009)(478600001)(66476007)(66556008)(66946007)(45080400002)(316002)(2616005)(956004)(52116002)(44832011)(36756003)(8676002)(6666004)(6512007)(5660300002)(33440700001)(4326008)(6506007)(86362001)(8936002)(2906002)(26005)(6486002)(1076003)(16526019)(186003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: CXhB+2WWEdC6aCEtepuM5W1L9bVlHLgX+ie2RjOxA3EzvOoc0BPKGmGg04J6tYwnjRXcW70+NF4DbLNWUTFPLH6CP8XQag90ge2wekT34LN9W9PHrIPpK1UyorIpJYgsPgoghXmuduktZZY8Yf3J3T2t9q1nZ9ossMXgmmAHPsK63v+c+TH2EtOYZLrnTnO+u64xcalWA4gTq/JgbZhIah8ujgix3iDpPcu3SyYlOJHVj7UqIm1dRF1VJ5sQ4Zefpqr1Y+JbFOtmk5F5YZFqJNkgQc2bLvyXX55b/SDunleb4eMO7PhENyWOKnEvqw10bRD9PMUyqufh/1w1ouergDcivQrfNvkIHgXULXrpUeTHh/qa5FFADABKIHMIcmC5GBUIt9uHlEJ6f/TGke4WH+XTwBGYvNcdGtO6JKaQwuALoXTsE2qlnUZtc0f2eYlrZIB/R+8gVb5rSSaa16/DCqVry6Dy4PShFE11Mdy8poI=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3972b602-e800-4a01-f299-08d7f4a3448d
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 May 2020 05:30:36.5375
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5h4tCNEh1Vg7HxjLZlBtirDQwEM1V8LUb5jaOvKEI58XegWSvAX0otCGsGayJoEWmYX7X1P1bk6DSb/PnjHPfg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6821
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The threaded interrupt handler may still be called after the
usb_gadget_disconnect is called, it causes the structures used
at interrupt handler was freed before it uses, eg the
usb_request. This issue usually occurs we remove the udc function
during the transfer. Below is the example when doing stress
test for android switch function, the EP0's request is freed
by .unbind (configfs_composite_unbind -> composite_dev_cleanup),
but the threaded handler accesses this request during handling
setup packet request.

In fact, there is no protection between unbind the udc
and udc interrupt handling, so we have to avoid the interrupt
handler is occurred or scheduled during the .unbind flow.

init: Sending signal 9 to service 'adbd' (pid 18077) process group...
android_work: did not send uevent (0 0 000000007bec2039)
libprocessgroup: Successfully killed process cgroup uid 0 pid 18077 in 6ms
init: Service 'adbd' (pid 18077) received signal 9
init: Sending signal 9 to service 'adbd' (pid 18077) process group...
libprocessgroup: Successfully killed process cgroup uid 0 pid 18077 in 0ms
init: processing action (init.svc.adbd=stopped) from (/init.usb.configfs.rc:14)
init: Received control message 'start' for 'adbd' from pid: 399 (/vendor/bin/hw/android.hardware.usb@1.

init: starting service 'adbd'...
read descriptors
read strings
Unable to handle kernel read from unreadable memory at virtual address 000000000000002a
android_work: sent uevent USB_STATE=CONNECTED
Mem abort info:
  ESR = 0x96000004
  EC = 0x25: DABT (current EL), IL = 32 bits
  SET = 0, FnV = 0
  EA = 0, S1PTW = 0
Data abort info:
  ISV = 0, ISS = 0x00000004
  CM = 0, WnR = 0
user pgtable: 4k pages, 48-bit VAs, pgdp=00000000e97f1000
using random self ethernet address
[000000000000002a] pgd=0000000000000000
Internal error: Oops: 96000004 [#1] PREEMPT SMP
Modules linked in:
CPU: 0 PID: 232 Comm: irq/68-5b110000 Not tainted 5.4.24-06075-g94a6b52b5815 #92
Hardware name: Freescale i.MX8QXP MEK (DT)
pstate: 00400085 (nzcv daIf +PAN -UAO)
using random host ethernet address
pc : composite_setup+0x5c/0x1730
lr : android_setup+0xc0/0x148
sp : ffff80001349bba0
x29: ffff80001349bba0 x28: ffff00083a50da00
x27: ffff8000124e6000 x26: ffff800010177950
x25: 0000000000000040 x24: ffff000834e18010
x23: 0000000000000000 x22: 0000000000000000
x21: ffff00083a50da00 x20: ffff00082e75ec40
x19: 0000000000000000 x18: 0000000000000000
x17: 0000000000000000 x16: 0000000000000000
x15: 0000000000000000 x14: 0000000000000000
x13: 0000000000000000 x12: 0000000000000001
x11: ffff80001180fb58 x10: 0000000000000040
x9 : ffff8000120fc980 x8 : 0000000000000000
x7 : ffff00083f98df50 x6 : 0000000000000100
x5 : 00000307e8978431 x4 : ffff800011386788
x3 : 0000000000000000 x2 : ffff800012342000
x1 : 0000000000000000 x0 : ffff800010c6d3a0
Call trace:
 composite_setup+0x5c/0x1730
 android_setup+0xc0/0x148
 cdns3_ep0_delegate_req+0x64/0x90
 cdns3_check_ep0_interrupt_proceed+0x384/0x738
 cdns3_device_thread_irq_handler+0x124/0x6e0
 cdns3_thread_irq+0x94/0xa0
 irq_thread_fn+0x30/0xa0
 irq_thread+0x150/0x248
 kthread+0xfc/0x128
 ret_from_fork+0x10/0x18
Code: 910e8000 f9400693 12001ed7 79400f79 (3940aa61)
---[ end trace c685db37f8773fba ]---
Kernel panic - not syncing: Fatal exception
SMP: stopping secondary CPUs
Kernel Offset: disabled
CPU features: 0x0002,20002008
Memory Limit: none
Rebooting in 5 seconds..

Reviewed-by: Jun Li <jun.li@nxp.com>
Signed-off-by: Peter Chen <peter.chen@nxp.com>
---
 drivers/usb/gadget/udc/core.c | 2 ++
 include/linux/usb/gadget.h    | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/drivers/usb/gadget/udc/core.c b/drivers/usb/gadget/udc/core.c
index 9b11046480fe..2e28dde8376f 100644
--- a/drivers/usb/gadget/udc/core.c
+++ b/drivers/usb/gadget/udc/core.c
@@ -1297,6 +1297,8 @@ static void usb_gadget_remove_driver(struct usb_udc *udc)
 	kobject_uevent(&udc->dev.kobj, KOBJ_CHANGE);
 
 	usb_gadget_disconnect(udc->gadget);
+	if (udc->gadget->irq)
+		synchronize_irq(udc->gadget->irq);
 	udc->driver->unbind(udc->gadget);
 	usb_gadget_udc_stop(udc);
 
diff --git a/include/linux/usb/gadget.h b/include/linux/usb/gadget.h
index 9411c08a5c7e..73a6113322c6 100644
--- a/include/linux/usb/gadget.h
+++ b/include/linux/usb/gadget.h
@@ -373,6 +373,7 @@ struct usb_gadget_ops {
  * @connected: True if gadget is connected.
  * @lpm_capable: If the gadget max_speed is FULL or HIGH, this flag
  *	indicates that it supports LPM as per the LPM ECN & errata.
+ * @irq: the interrupt number for device controller.
  *
  * Gadgets have a mostly-portable "gadget driver" implementing device
  * functions, handling all usb configurations and interfaces.  Gadget
@@ -427,6 +428,7 @@ struct usb_gadget {
 	unsigned			deactivated:1;
 	unsigned			connected:1;
 	unsigned			lpm_capable:1;
+	int				irq;
 };
 #define work_to_gadget(w)	(container_of((w), struct usb_gadget, work))
 
-- 
2.17.1

