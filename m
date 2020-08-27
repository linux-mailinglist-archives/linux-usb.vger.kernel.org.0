Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D9442254D29
	for <lists+linux-usb@lfdr.de>; Thu, 27 Aug 2020 20:35:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726293AbgH0Sf6 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 27 Aug 2020 14:35:58 -0400
Received: from cmta19.telus.net ([209.171.16.92]:38699 "EHLO cmta19.telus.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726009AbgH0Sf6 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 27 Aug 2020 14:35:58 -0400
Received: from montezuma.home ([154.5.226.127])
        by cmsmtp with SMTP
        id BMkbkMHrRpULuBMkckGrwZ; Thu, 27 Aug 2020 12:35:56 -0600
X-Telus-Authed: none
X-Authority-Analysis: v=2.3 cv=T9TysMCQ c=1 sm=1 tr=0
 a=f8b3WT/FcTuUJCJtQO1udw==:117 a=f8b3WT/FcTuUJCJtQO1udw==:17
 a=kj9zAlcOel0A:10 a=x7bEGLp0ZPQA:10 a=COSDN44dAAMA:10
 a=jNnXH0EP_Q_1qWgQMt0A:9 a=Qrgh2-pzD7IEZrUX:21 a=Lk6__FW6HkGyzfbv:21
 a=CjuIK1q_8ugA:10
Date:   Thu, 27 Aug 2020 11:35:53 -0700 (PDT)
From:   Zwane Mwaikambo <zwanem@gmail.com>
To:     Randy Dunlap <rdunlap@infradead.org>
cc:     Greg KH <gregkh@linuxfoundation.org>,
        Zwane Mwaikambo <zwane@yosper.io>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        linux-usb@vger.kernel.org
Subject: [PATCH v4 2/2] usb/typec: fix array overruns in ucsi.c
 partner_altmode[]
In-Reply-To: <alpine.DEB.2.21.2008271131570.37762@montezuma.home>
Message-ID: <alpine.DEB.2.21.2008271135000.37762@montezuma.home>
References: <alpine.DEB.2.21.2008271035320.30454@montezuma.home> <0013fe6c-c0a2-1759-c769-cda025e5eb38@infradead.org> <alpine.DEB.2.21.2008271058220.37762@montezuma.home> <alpine.DEB.2.21.2008271131570.37762@montezuma.home>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-CMAE-Envelope: MS4wfDR6g2XGTVaIglc1GJEI7YgeTR45GVylKOHle62GsUAQKSWfUrMRoLSygeEMHFcU1SRJiwRMBsk5lwpYw4GZ2uJJdnLj3V0uAMx3e5DGzQvJ2HeexcGu
 h9kkL0wEq3+aSFq/hkoe2NM5VzHW3OaUWTV/ohg/teoxFbAVcHDELkdn9nRX9BWBN4DeBC/rZOjTZg71GLKXucytK/Q2ayaTIJU/5WUQzoldmdSz4hf5q4Wh
 EvUQiVaxLae5luxncd4lGh4xdG895UqK+gu6Ak8V2nMiH4AFM4+e98CwnUc23n+ZNzV7ByHfRkV/t7F8iJjjtQ==
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This fixes the second array overrun occurrence (similar failure mode to 
the first), this time in ucsi_unregister_altmodes.

[ 4373.153246] BUG: kernel NULL pointer dereference, address: 
00000000000002f2
[ 4373.153267] #PF: supervisor read access in kernel mode
[ 4373.153271] #PF: error_code(0x0000) - not-present page
[ 4373.153275] PGD 0 P4D 0 
[ 4373.153284] Oops: 0000 [#2] PREEMPT SMP NOPTI
[ 4373.153292] CPU: 0 PID: 13242 Comm: kworker/0:0 Tainted: G      D           
5.8.0-rc6+ #1
[ 4373.153296] Hardware name: LENOVO 20RD002VUS/20RD002VUS, BIOS R16ET25W 
(1.11 ) 04/21/2020
[ 4373.153308] Workqueue: events ucsi_handle_connector_change [typec_ucsi]
[ 4373.153320] RIP: 0010:ucsi_unregister_altmodes+0x5f/0xa0 [typec_ucsi]
[ 4373.153326] Code: 54 48 8b 3b 41 83 c4 01 e8 9e f9 0c 00 49 63 c4 48 c7 
03 00 00 00 00 49 8d 5c c5 00 48 8b 3b 48 85 ff 74 31 41 80 fe 01 75 d7 
<0f> b7 87 f0 02 00 00 66 3d 01 ff 74 0f 66 3d 55 09 75 c4 83 bf f8
[ 4373.153332] RSP: 0018:ffffb2ef036b3dc8 EFLAGS: 00010246
[ 4373.153338] RAX: 000000000000001e RBX: ffff94268b006a60 RCX: 
0000000080800067
[ 4373.153342] RDX: 0000000080800068 RSI: 0000000000000001 RDI: 
0000000000000002
[ 4373.153347] RBP: ffffb2ef036b3de8 R08: 0000000000000000 R09: 
ffffffff8dc65400
[ 4373.153351] R10: ffff9426678d7200 R11: 0000000000000001 R12: 
000000000000001e
[ 4373.153355] R13: ffff94268b006970 R14: 0000000000000001 R15: 
ffff94268b006800
[ 4373.153361] FS:  0000000000000000(0000) GS:ffff942691400000(0000) 
knlGS:0000000000000000
[ 4373.153366] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[ 4373.153371] CR2: 00000000000002f2 CR3: 00000004445a6005 CR4: 
00000000003606f0
[ 4373.153375] Call Trace:
[ 4373.153389]  ucsi_unregister_partner.part.0+0x17/0x30 [typec_ucsi]
[ 4373.153400]  ucsi_handle_connector_change+0x25c/0x320 [typec_ucsi]
[ 4373.153418]  process_one_work+0x1df/0x3d0
[ 4373.153428]  worker_thread+0x4a/0x3d0
[ 4373.153436]  ? process_one_work+0x3d0/0x3d0
[ 4373.153444]  kthread+0x127/0x170
[ 4373.153451]  ? kthread_park+0x90/0x90
[ 4373.153461]  ret_from_fork+0x1f/0x30
[ 4373.153661] CR2: 00000000000002f2

Signed-off-by: Zwane Mwaikambo <zwane@yosper.io>
---

This v4 addresses patch formatting and submission issues with the 
previous versions.

diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
index d0c63afaf..79061705e 100644
--- a/drivers/usb/typec/ucsi/ucsi.c
+++ b/drivers/usb/typec/ucsi/ucsi.c
@@ -479,7 +480,10 @@ static void ucsi_unregister_altmodes(struct ucsi_connector *con, u8 recipient)
 		return;
 	}
 
-	while (adev[i]) {
+	for (i = 0; i < UCSI_MAX_ALTMODES; i++) {
+		if (!adev[i])
+			break;
+
 		if (recipient == UCSI_RECIPIENT_SOP &&
 		    (adev[i]->svid == USB_TYPEC_DP_SID ||
 			(adev[i]->svid == USB_TYPEC_NVIDIA_VLINK_SID &&
@@ -488,7 +492,7 @@ static void ucsi_unregister_altmodes(struct ucsi_connector *con, u8 recipient)
 			ucsi_displayport_remove_partner((void *)pdev);
 		}
 		typec_unregister_altmode(adev[i]);
-		adev[i++] = NULL;
+		adev[i] = NULL;
 	}
 }
 
