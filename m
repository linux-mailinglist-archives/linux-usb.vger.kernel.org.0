Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4CDB7D0A84
	for <lists+linux-usb@lfdr.de>; Wed,  9 Oct 2019 11:05:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729915AbfJIJFV (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 9 Oct 2019 05:05:21 -0400
Received: from Mailgw01.mediatek.com ([1.203.163.78]:17409 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1725776AbfJIJFV (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 9 Oct 2019 05:05:21 -0400
X-UUID: 9d9bf73284104f7db2e055d7b6849c23-20191009
X-UUID: 9d9bf73284104f7db2e055d7b6849c23-20191009
Received: from mtkcas34.mediatek.inc [(172.27.4.253)] by mailgw01.mediatek.com
        (envelope-from <chunfeng.yun@mediatek.com>)
        (mailgw01.mediatek.com ESMTP with TLS)
        with ESMTP id 1219660673; Wed, 09 Oct 2019 17:05:09 +0800
Received: from mtkcas09.mediatek.inc (172.21.101.178) by
 MTKMBS31DR.mediatek.inc (172.27.6.102) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Wed, 9 Oct 2019 17:05:05 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas09.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Wed, 9 Oct 2019 17:05:04 +0800
From:   Chunfeng Yun <chunfeng.yun@mediatek.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC:     Felipe Balbi <felipe.balbi@linux.intel.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        <linux-usb@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-mediatek@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>,
        Chunfeng Yun <chunfeng.yun@mediatek.com>
Subject: [PATCH 2/2] usb: mtu3: fix race condition about delayed_status
Date:   Wed, 9 Oct 2019 17:05:00 +0800
Message-ID: <1570611900-7112-2-git-send-email-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1570611900-7112-1-git-send-email-chunfeng.yun@mediatek.com>
References: <1570611900-7112-1-git-send-email-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-SNTS-SMTP: 1984517D90B470CD343F26B3BA7716B584D48C68D26AABCE3CE16C6BDD6E72ED2000:8
X-MTK:  N
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

usb_composite_setup_continue() may be called before composite_setup()
return USB_GADGET_DELAYED_STATUS, then the controller driver will
delay status stage after composite_setup() finish, but the class driver
don't ask the controller to continue delayed status anymore, this will
cause control transfer timeout.

happens when use mass storage (also enabled other class driver):

cpu1:                               cpu2
handle_setup(SET_CONFIG) //gadget driver
  unlock (g->lock)
  gadget_driver->setup()
    composite_setup()
      lock(cdev->lock)
        set_config()
          fsg_set_alt() // maybe some times due to many class are enabled
            raise FSG_STATE_CONFIG_CHANGE
            return USB_GADGET_DELAYED_STATUS
                                    handle_exception()
                                    usb_composite_setup_continue()
      unlock(cdev->lock)
                                      lock(cdev->lock)
                                        ep0_queue()
                                          lock (g->lock)
                                          //no delayed status, nothing todo
                                          unlock (g->lock)
                                      unlock(cdev->lock)
    return USB_GADGET_DELAYED_STATUS // composite_setup
  lock (g->lock)
get USB_GADGET_DELAYED_STATUS //handle_setup [1]

Try to fix the race condition as following:
After the driver gets USB_GADGET_DELAYED_STATUS at [1], if we find
there is a usb_request in ep0 request list, it means composite already
asked us to continue delayed status by usb_composite_setup_continue(),
so we skip request about delayed_status by composite_setup() and still
do status stage.

Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
 drivers/usb/mtu3/mtu3_gadget_ep0.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/mtu3/mtu3_gadget_ep0.c b/drivers/usb/mtu3/mtu3_gadget_ep0.c
index df3fd055792f..2be182bd793a 100644
--- a/drivers/usb/mtu3/mtu3_gadget_ep0.c
+++ b/drivers/usb/mtu3/mtu3_gadget_ep0.c
@@ -671,8 +671,16 @@ __acquires(mtu->lock)
 	if (mtu->test_mode) {
 		;	/* nothing to do */
 	} else if (handled == USB_GADGET_DELAYED_STATUS) {
-		/* handle the delay STATUS phase till receive ep_queue on ep0 */
-		mtu->delayed_status = true;
+
+		mreq = next_ep0_request(mtu);
+		if (mreq) {
+			/* already asked us to continue delayed status */
+			ep0_do_status_stage(mtu);
+			ep0_req_giveback(mtu, &mreq->request);
+		} else {
+			/* do delayed STATUS stage till receive ep0_queue */
+			mtu->delayed_status = true;
+		}
 	} else if (le16_to_cpu(setup.wLength) == 0) { /* no data stage */
 
 		ep0_do_status_stage(mtu);
-- 
2.23.0

