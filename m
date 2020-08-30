Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 265B2256D17
	for <lists+linux-usb@lfdr.de>; Sun, 30 Aug 2020 11:27:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728720AbgH3J0l (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 30 Aug 2020 05:26:41 -0400
Received: from cmta16.telus.net ([209.171.16.89]:37938 "EHLO cmta16.telus.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725869AbgH3J0k (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sun, 30 Aug 2020 05:26:40 -0400
Received: from montezuma.home ([154.5.226.127])
        by cmsmtp with SMTP
        id CJbgkqQj25b7lCJbik71Dm; Sun, 30 Aug 2020 03:26:39 -0600
X-Telus-Authed: none
X-Authority-Analysis: v=2.3 cv=YPHhNiOx c=1 sm=1 tr=0
 a=f8b3WT/FcTuUJCJtQO1udw==:117 a=f8b3WT/FcTuUJCJtQO1udw==:17
 a=kj9zAlcOel0A:10 a=x7bEGLp0ZPQA:10 a=COSDN44dAAMA:10 a=VwQbUJbxAAAA:8
 a=bqw7iSJ4rPpBTeNS0XsA:9 a=KCerzzSDPCyu5tKC:21 a=Ia4AjkFur6I16leF:21
 a=CjuIK1q_8ugA:10 a=AjGcO6oz07-iQ99wixmX:22
Date:   Sun, 30 Aug 2020 02:26:36 -0700 (PDT)
From:   Zwane Mwaikambo <zwanem@gmail.com>
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>
cc:     Randy Dunlap <rdunlap@infradead.org>,
        Greg KH <gregkh@linuxfoundation.org>,
        Zwane Mwaikambo <zwane@yosper.io>, linux-usb@vger.kernel.org
Subject: [PATCH v5 1/2] usb/typec: fix array overruns in ucsi.c
 partner_altmode[]
In-Reply-To: <20200828123328.GF174928@kuha.fi.intel.com>
Message-ID: <alpine.DEB.2.21.2008300220350.37231@montezuma.home>
References: <alpine.DEB.2.21.2008271035320.30454@montezuma.home> <0013fe6c-c0a2-1759-c769-cda025e5eb38@infradead.org> <alpine.DEB.2.21.2008271058220.37762@montezuma.home> <alpine.DEB.2.21.2008271131570.37762@montezuma.home>
 <20200828123328.GF174928@kuha.fi.intel.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-CMAE-Envelope: MS4wfOKm2ie/IPBFKUV6k3Jm7w8bTsggbdsVOYSqhyP9+p7V5Zq4LWlEhrM3c9WHwqvK8O70KgbNEAHtRAc1sF3deFQrTuQNQ7hOHM92ODmugykqDAlLXPLk
 oku6MEy4z05JLNuCe56zvbvasB47cTQcNumZ51vTIC8n0w/hMeVMOV9X+Qg3SanJ1dn3d6eSLw6ACE/rIYKcYutqXCZXsdCNrPavOuFktAZ2x3fkRh5xOz/h
 BadP6krk428jwCVM75uPQ10C+RQv9gMaIw4dVhzQRPq1tZz9D+zUfQVgJsLEQiLnMd7y0JUcNOO+eWtW6FCDzQ==
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

con->partner_altmode[i] ends up with the value 0x2 in the call to 
typec_altmode_update_active because the array has been accessed out of 
bounds causing a random memory read.

This patch fixes the first occurrence and 2/2 the second.

[  565.452023] BUG: kernel NULL pointer dereference, address: 00000000000002fe
[  565.452025] #PF: supervisor read access in kernel mode
[  565.452026] #PF: error_code(0x0000) - not-present page
[  565.452026] PGD 0 P4D 0 
[  565.452028] Oops: 0000 [#1] PREEMPT SMP NOPTI
[  565.452030] CPU: 0 PID: 502 Comm: kworker/0:3 Not tainted 5.8.0-rc3+ #1
[  565.452031] Hardware name: LENOVO 20RD002VUS/20RD002VUS, 
BIOS R16ET25W (1.11 ) 04/21/2020
[  565.452034] Workqueue: events ucsi_handle_connector_change [typec_ucsi]
[  565.452039] RIP: 0010:typec_altmode_update_active+0x1f/0x100 [typec]
[  565.452040] Code: 0f 1f 84 00 00 00 00 00 0f 1f 00 0f 1f 44 00 00 55 48 
89 e5 41 54 53 48 83 ec 10 65 48 8b 04 25 28 00 00 00 48 89 45 e8 31 c0 
<0f> b6 87 fc 02 00 00 83 e0 01 40 38 f0 0f 84 95 00 00 00 48 8b 47
[  565.452041] RSP: 0018:ffffb729c066bdb0 EFLAGS: 00010246
[  565.452042] RAX: 0000000000000000 RBX: ffffa067c3e64a70 RCX: 0000000000000000
[  565.452043] RDX: ffffb729c066bd20 RSI: 0000000000000000 RDI: 0000000000000002
[  565.452044] RBP: ffffb729c066bdd0 R08: 00000083a7910a4f R09: 0000000000000000
[  565.452044] R10: ffffffffa106a220 R11: 0000000000000000 R12: 0000000000000000
[  565.452045] R13: ffffa067c3e64a98 R14: ffffa067c3e64810 R15: ffffa067c3e64800
[  565.452046] FS:  0000000000000000(0000) GS:ffffa067d1400000(0000)
knlGS:0000000000000000
[  565.452047] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  565.452048] CR2: 00000000000002fe CR3: 00000001b060a003 CR4: 00000000003606f0
[  565.452048] Call Trace:
[  565.452052]  ucsi_altmode_update_active+0x83/0xd0 [typec_ucsi]
[  565.452054]  ucsi_handle_connector_change+0x1dc/0x320 [typec_ucsi]
[  565.452057]  process_one_work+0x1df/0x3d0
[  565.452059]  worker_thread+0x4d/0x3d0
[  565.452060]  ? process_one_work+0x3d0/0x3d0
[  565.452062]  kthread+0x127/0x170
[  565.452063]  ? kthread_park+0x90/0x90
[  565.452065]  ret_from_fork+0x1f/0x30

The failing instruction is;

0x0000000000000380 <+0>:     callq  0x385 <typec_altmode_update_active+5>
0x0000000000000385 <+5>:     push   %rbp
0x0000000000000386 <+6>:     mov    %rsp,%rbp
0x0000000000000389 <+9>:     push   %r12
0x000000000000038b <+11>:    push   %rbx
0x000000000000038c <+12>:    sub    $0x10,%rsp
0x0000000000000390 <+16>:    mov    %gs:0x28,%rax
0x0000000000000399 <+25>:    mov    %rax,-0x18(%rbp)
0x000000000000039d <+29>:    xor    %eax,%eax
0x000000000000039f <+31>:    movzbl 0x2fc(%rdi),%eax <======
0x00000000000003a6 <+38>:    and    $0x1,%eax

(gdb) list  *typec_altmode_update_active+0x1f
0x39f is in typec_altmode_update_active (drivers/usb/typec/class.c:221).
216      */
217     void typec_altmode_update_active(struct typec_altmode *adev, bool active)
218     {
219             char dir[6];
220
221             if (adev->active == active)
222                     return;
223
224             if (!is_typec_port(adev->dev.parent) && adev->dev.driver) {
225                     if (!active)

(gdb) list *ucsi_altmode_update_active+0x83
0x12a3 is in ucsi_altmode_update_active (drivers/usb/typec/ucsi/ucsi.c:221).
216             }
217
218             if (cur < UCSI_MAX_ALTMODES)
219                     altmode = typec_altmode_get_partner(con->port_altmode[cur]);
220
221             for (i = 0; con->partner_altmode[i]; i++)
222                     typec_altmode_update_active(con->partner_altmode[i],
223                                                con->partner_altmode[i] == altmode);
224     }

Fixes: ad74b8649beaf ("usb: typec: ucsi: Preliminary support for alternate modes")
Cc: stable@vger.kernel.org
Signed-off-by: Zwane Mwaikambo <zwane@yosper.io>
---
v2 addresses both instances of array overrun
v3 addresses patch submission/formatting issues
v4 addresses patch submission/formatting issues
v5 adds and cc to stable

diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
index affd024190c9..16906519c173 100644
--- a/drivers/usb/typec/ucsi/ucsi.c
+++ b/drivers/usb/typec/ucsi/ucsi.c
@@ -218,9 +218,10 @@ void ucsi_altmode_update_active(struct ucsi_connector *con)
 	if (cur < UCSI_MAX_ALTMODES)
 		altmode = typec_altmode_get_partner(con->port_altmode[cur]);
 
-	for (i = 0; con->partner_altmode[i]; i++)
-		typec_altmode_update_active(con->partner_altmode[i],
-					    con->partner_altmode[i] == altmode);
+	for (i = 0; i < UCSI_MAX_ALTMODES; i++)
+		if (con->partner_altmode[i])
+			typec_altmode_update_active(con->partner_altmode[i],
+				con->partner_altmode[i] == altmode);
 }
 
 static u8 ucsi_altmode_next_mode(struct typec_altmode **alt, u16 svid)
 
