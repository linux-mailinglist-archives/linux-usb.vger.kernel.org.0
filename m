Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 530E21B8531
	for <lists+linux-usb@lfdr.de>; Sat, 25 Apr 2020 11:21:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726230AbgDYJUc (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 25 Apr 2020 05:20:32 -0400
Received: from eu-smtp-delivery-167.mimecast.com ([146.101.78.167]:32560 "EHLO
        eu-smtp-delivery-167.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726151AbgDYJU0 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 25 Apr 2020 05:20:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=displaylink.com;
        s=mimecast20151025; t=1587806420;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=rVbKtepwaMLB01ymQd1j5Iwjw/PZQBhvnYQuJI+VenE=;
        b=QGBEjfQDusdspunjYLBvF6/FLq4TFJfzBGtp50Rv4ojiR3qHtaHwgDMtAnA6qoljOQIRzf
        r53j+ecIMjLZuQmC4ArEazUYxo6JXvLWmJTwbAHax1um6IzXO3K6afik6fe2jjr8WL4NSV
        2U8me/bcLuSXnEFDdqZ10kfendsKPpA=
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01lp2058.outbound.protection.outlook.com [104.47.0.58]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 uk-mta-273-B8dcGEl3Moijy-_GHJiPOQ-1; Sat, 25 Apr 2020 10:20:18 +0100
X-MC-Unique: B8dcGEl3Moijy-_GHJiPOQ-1
Received: from VI1PR1001MB1056.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:800:64::13) by VI1PR1001MB1056.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:800:64::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2937.22; Sat, 25 Apr
 2020 09:20:17 +0000
Received: from VI1PR1001MB1056.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::8cba:c335:a57e:9dfd]) by VI1PR1001MB1056.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::8cba:c335:a57e:9dfd%5]) with mapi id 15.20.2937.020; Sat, 25 Apr 2020
 09:20:16 +0000
From:   vladimir.stankovic@displaylink.com
To:     gregkh@linuxfoundation.org
Cc:     linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        mausb-host-devel@displaylink.com
Subject: [PATCH v5 6/8] usb: mausb_host: Add logic for PAL-to-PAL communication
Date:   Sat, 25 Apr 2020 11:19:52 +0200
Message-Id: <20200425091954.1610-7-vladimir.stankovic@displaylink.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200425091954.1610-1-vladimir.stankovic@displaylink.com>
References: <20200327152614.26833-1-vladimir.stankovic@displaylink.com>
 <20200425091954.1610-1-vladimir.stankovic@displaylink.com>
X-ClientProxiedBy: LO2P265CA0131.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:9f::23) To VI1PR1001MB1056.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:800:64::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from raven-hp.endava.net (94.189.199.177) by LO2P265CA0131.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:9f::23) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2937.13 via Frontend Transport; Sat, 25 Apr 2020 09:20:15 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [94.189.199.177]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bef5a6b1-a806-4366-ddd2-08d7e8f9ddea
X-MS-TrafficTypeDiagnostic: VI1PR1001MB1056:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR1001MB10568BA10A69232DAB284EC391D10@VI1PR1001MB1056.EURPRD10.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:283;
X-Forefront-PRVS: 0384275935
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR1001MB1056.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(346002)(366004)(136003)(39840400004)(396003)(376002)(9686003)(6512007)(8936002)(66946007)(316002)(52116002)(66476007)(6666004)(5660300002)(8676002)(66556008)(81156014)(1076003)(86362001)(30864003)(6486002)(478600001)(6506007)(956004)(6916009)(2906002)(4326008)(26005)(36756003)(2616005)(186003)(16526019)(107886003);DIR:OUT;SFP:1101;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: WXe4Yy91ZmvWtGvaQ1pmQVj1ZRQ/3/Do4dKNlL7QJOXjc3wyz1zYMKXV45NVui4OGazkqXX3xtR2n6YfxnFUopH+XhQTcT+3ulzvity97UKWDv1623elidiMIcv1rgNycwvKBe/pxIJSz+SNJ2bLkw3gdIr1zC6HuTExmJYy5OO6l3r+fCGBOUlNo4s5X740qKrBzkNTkadepTqMIHytRdrFB40BaOIRMZMv63YktmIx8H82RFdnFB7/z710vtPcUA7nQ4CT1MSAmtiVcAUCt1nnhyKIt9taJQBHXxacrXkqpoMh6ZYpnTTCyDUIuyFYUL9dYaE2MJCgljayg/9TXLCegFjpoD+K26yz8/Cd8L6KoCIC6lYd0Dq1Si54qQ9RUu54BZjBCKLwSZjQy3a5IHZXCiTymeshRCSuqkeErlbKG9sdYsc/cRToz9IBZpDu
X-MS-Exchange-AntiSpam-MessageData: NfEtF7d53obUgqql8Bg/y5A30kVoJ/U3fSoR3x6Kd0L5853EOYWll9gJdRHhtDfZ3VEv7xGXmQ00MNadbb+eRqEP+4ly0g2q7S+G1/8ZmmaIcaPm9EzmPhD986oW+k0mkKRwfLRdEhtAkCW2HudJEI+PRYY02GEEtB59TP/BNr4TNFwPDF1w9TwS99cDrBalSBH9r3JjY3ShDI0RkJuDo3HKtOiYJT9xnQxuLC3shKR3rkuiQo7DhD/I6ysrSa2ip5el5s5grz2jgAY+kawKNsHd86XmVe31f7U1Eo+3GnGb2Imu6XYfp513s9SwwiARlLgg/8tdVuAAMpQxQ7sz+6WhC9yyGl0tJRC7aSVkUzl/41KDVPgZxRHeJJvdHxajk0eDPIxnoygZ96IgWFm2H4AYXYvvcRrczKuPUiOXHrobUwnbvDNusho7FyvTyEVREZfgMWubhafrUHvF6dTRoEWeKpBQYCVEUtsFP+qzfBr2XOs+J1KaKYRw7Oe/Bgkp8axcaAPvrSLl53b0ALdMX1M3K08AVC9z4o+iruWHS633q5tsdJ0VgS+eneEc9lCgdjlXSjHysZQw46EcYSuJPcxLUsHR7b1aDzWcj+DZAoglftchznQPyknoooalNZ4S3Ja5nirjBNa3HozoAJ5zjDWN1rmvVKfTWZdR5ChA42KzwhXySfS7PMdRcDEdh0RqycE7/GJxvUEMQ5ac0vE8MwrMRzSqpk/Kz1mfLCsPhV2Q8T0iKT7c8rszjs0sxuxs10+ctRoSWDLn8uZpC5THrj2j8tQ8Ajv15NF7lG1XVGQ=
X-OriginatorOrg: displaylink.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bef5a6b1-a806-4366-ddd2-08d7e8f9ddea
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Apr 2020 09:20:16.8720
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: a4bda75a-b444-4312-9c90-44a7c4b2c91a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xfPO46JIRlngO3t0Lt0zB5S3kjcg5r9IgJ/3bUMH+3FWfPJUIjQF/xABNQWypnq/QE3iT2hrDupbAwn3TNwqM1YkV3hUgukugoceoEQVrr0wf63GuDT7ai28iORD52iY
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR1001MB1056
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: displaylink.com
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Implemeneted connection between PAL and Link layers and set up
environment for exchanging PAL-to-PAL messages.

Within this patch, driver's sysfs parameters have been created
with intention to configure remote connection parameters.

Signed-off-by: Vladimir Stankovic <vladimir.stankovic@displaylink.com>
---
 drivers/usb/mausb_host/hpal.c       | 522 ++++++++++++++++++++++++++++
 drivers/usb/mausb_host/hpal.h       |   6 +
 drivers/usb/mausb_host/mausb_core.c | 103 +++++-
 3 files changed, 630 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/mausb_host/hpal.c b/drivers/usb/mausb_host/hpal.c
index e10b98002afd..74bebc03d7e6 100644
--- a/drivers/usb/mausb_host/hpal.c
+++ b/drivers/usb/mausb_host/hpal.c
@@ -13,10 +13,15 @@
 #include "hcd.h"
 #include "utils.h"
=20
+#define MAUSB_DELETE_MADEV_TIMEOUT_MS 3000
+
 struct mss mss;
=20
+static int mausb_start_connection_timer(struct mausb_device *dev);
 static int mausb_power_state_cb(struct notifier_block *nb, unsigned long a=
ction,
 =09=09=09=09void *data);
+static void mausb_signal_empty_mss(void);
+static void mausb_remove_madev_from_list(u8 madev_addr);
 static void mausb_execute_urb_dequeue(struct work_struct *dequeue_work);
 static int mausb_start_heartbeat_timer(void);
=20
@@ -177,6 +182,55 @@ static bool mausb_return_urb_ctx_to_tree(struct mausb_=
urb_ctx *urb_ctx,
 =09return true;
 }
=20
+static void mausb_complete_urbs_from_tree(void)
+{
+=09struct mausb_urb_ctx *urb_ctx =3D NULL;
+=09struct urb=09     *current_urb =3D NULL;
+=09struct rb_node=09     *current_node =3D NULL;
+=09unsigned long flags;
+=09int status =3D 0;
+=09int ret;
+
+=09mausb_pr_debug("Completing all urbs from tree");
+
+=09spin_lock_irqsave(&mhcd->lock, flags);
+
+=09while ((current_node =3D rb_first(&mhcd->mausb_urbs))) {
+=09=09urb_ctx =3D rb_entry(current_node, struct mausb_urb_ctx, rb_node);
+
+=09=09current_urb =3D urb_ctx->urb;
+=09=09mausb_delete_urb_ctx_from_tree(urb_ctx);
+=09=09mausb_uninit_data_iterator(&urb_ctx->iterator);
+=09=09kfree(urb_ctx);
+
+=09=09ret =3D usb_hcd_check_unlink_urb(current_urb->hcpriv,
+=09=09=09=09=09       current_urb, status);
+=09=09if (ret =3D=3D -EIDRM)
+=09=09=09mausb_pr_warn("Urb=3D%p is already unlinked",
+=09=09=09=09      current_urb);
+=09=09else
+=09=09=09usb_hcd_unlink_urb_from_ep(current_urb->hcpriv,
+=09=09=09=09=09=09   current_urb);
+
+=09=09spin_unlock_irqrestore(&mhcd->lock, flags);
+
+=09=09/* Prepare urb for completion */
+=09=09mausb_pr_debug("Completing urb=3D%p", current_urb);
+
+=09=09current_urb->status=09   =3D -EPROTO;
+=09=09current_urb->actual_length =3D 0;
+=09=09atomic_dec(&current_urb->use_count);
+=09=09usb_hcd_giveback_urb(current_urb->hcpriv, current_urb,
+=09=09=09=09     current_urb->status);
+
+=09=09spin_lock_irqsave(&mhcd->lock, flags);
+=09}
+
+=09spin_unlock_irqrestore(&mhcd->lock, flags);
+
+=09mausb_pr_debug("Completed all urbs from tree");
+}
+
 /*After this function call only valid thing to do with urb is to give it b=
ack*/
 struct mausb_urb_ctx *mausb_unlink_and_delete_urb_from_tree(struct urb *ur=
b,
 =09=09=09=09=09=09=09    int status)
@@ -284,6 +338,161 @@ static inline void mausb_port_has_changed_event(struc=
t mausb_device *dev,
 =09=09mausb_port_has_changed(USB20HUB, HIGH_SPEED, dev);
 }
=20
+static void mausb_socket_disconnect_event(struct work_struct *work)
+{
+=09struct mausb_device *dev =3D container_of(work, struct mausb_device,
+=09=09=09=09=09=09socket_disconnect_work);
+=09struct mausb_event event;
+
+=09mausb_pr_info("madev_addr=3D%d", dev->madev_addr);
+
+=09mausb_ip_disconnect(dev->ctrl_channel);
+=09mausb_destroy_ip_ctx(dev->ctrl_channel);
+=09dev->ctrl_channel =3D NULL;
+
+=09mausb_ip_disconnect(dev->bulk_channel);
+=09mausb_destroy_ip_ctx(dev->bulk_channel);
+=09dev->bulk_channel =3D NULL;
+
+=09mausb_ip_disconnect(dev->isoch_channel);
+=09mausb_destroy_ip_ctx(dev->isoch_channel);
+=09dev->isoch_channel =3D NULL;
+
+=09if (dev->mgmt_channel) {
+=09=09memset(&event, 0, sizeof(event));
+=09=09event.type =3D MAUSB_EVENT_TYPE_NETWORK_DISCONNECTED;
+=09=09event.data.device_id =3D dev->id;
+
+=09=09mausb_pr_info("Releasing MAUSB device ref");
+=09=09kref_put(&dev->refcount, mausb_release_ma_dev_async);
+=09}
+
+=09mausb_ip_disconnect(dev->mgmt_channel);
+=09mausb_destroy_ip_ctx(dev->mgmt_channel);
+=09dev->mgmt_channel =3D NULL;
+
+=09memset(dev->channel_map, 0, sizeof(dev->channel_map));
+}
+
+static void mausb_disconnect_ma_dev(struct mausb_device *dev)
+{
+=09mausb_pr_info("Disconnecting MAUSB device madev_addr=3D%d",
+=09=09      dev->madev_addr);
+
+=09if (!dev->dev_connected) {
+=09=09mausb_pr_warn("MAUSB device is not connected");
+=09=09kref_put(&dev->refcount, mausb_release_ma_dev_async);
+=09=09return;
+=09}
+=09mausb_hcd_disconnect(dev->port_number, dev->dev_type, dev->dev_speed);
+
+=09if (dev->dev_type =3D=3D USB30HUB)
+=09=09mausb_hcd_disconnect(dev->port_number, USB20HUB, HIGH_SPEED);
+}
+
+static void mausb_hcd_disconnect_event(struct work_struct *work)
+{
+=09struct mausb_device *ma_dev =3D container_of(work, struct mausb_device,
+=09=09=09=09=09=09   hcd_disconnect_work);
+
+=09mausb_disconnect_ma_dev(ma_dev);
+}
+
+static void mausb_delete_madev(struct work_struct *work)
+{
+=09struct mausb_device *dev =3D container_of(work, struct mausb_device,
+=09=09=09=09=09=09madev_delete_work);
+=09struct mausb_event=09event;
+=09struct completion=09completion;
+=09struct completion=09*user_event;
+=09struct mausb_completion mausb_completion;
+=09long status;
+=09unsigned long timeout =3D msecs_to_jiffies(MAUSB_DELETE_MADEV_TIMEOUT_M=
S);
+
+=09mausb_pr_info("Deleting MAUSB device madev_addr=3D%d", dev->madev_addr)=
;
+
+=09del_timer_sync(&dev->connection_timer);
+
+=09/* Client IS responsive */
+=09if (!atomic_read(&dev->unresponsive_client)) {
+=09=09memset(&event, 0, sizeof(event));
+=09=09event.type =3D MAUSB_EVENT_TYPE_DELETE_MA_DEV;
+=09=09event.mgmt.delete_ma_dev.device_id =3D dev->id;
+=09=09event.mgmt.delete_ma_dev.event_id  =3D mausb_event_id(dev);
+
+=09=09init_completion(&completion);
+=09=09mausb_completion.completion_event =3D &completion;
+=09=09mausb_completion.event_id =3D event.mgmt.delete_ma_dev.event_id;
+=09=09mausb_completion.mausb_event =3D &event;
+
+=09=09mausb_insert_event(dev, &mausb_completion);
+
+=09=09mausb_pr_debug("Deleting MAUSB device...");
+
+=09=09status =3D wait_for_completion_interruptible_timeout(&completion,
+=09=09=09=09=09=09=09=09   timeout);
+
+=09=09mausb_pr_debug("Deleting MAUSB device event finished with %ld",
+=09=09=09       status);
+
+=09=09mausb_remove_event(dev, &mausb_completion);
+
+=09=09user_event =3D &dev->user_finished_event;
+
+=09=09status =3D wait_for_completion_interruptible_timeout(user_event,
+=09=09=09=09=09=09=09=09   timeout);
+=09=09mausb_pr_info("User event finished with %ld", status);
+=09}
+
+=09flush_workqueue(dev->workq);
+=09destroy_workqueue(dev->workq);
+
+=09mausb_clear_hcd_madev(dev->port_number);
+
+=09mausb_remove_madev_from_list(dev->madev_addr);
+
+=09put_net(dev->net_ns);
+
+=09kfree(dev);
+=09mausb_signal_empty_mss();
+
+=09mausb_pr_info("MAUSB device deleted. Version=3D%s", MAUSB_DRIVER_VERSIO=
N);
+}
+
+static void mausb_ping_work(struct work_struct *work)
+{
+=09struct mausb_device *dev =3D container_of(work, struct mausb_device,
+=09=09=09=09=09=09ping_work);
+
+=09if (mausb_start_connection_timer(dev) < 0) {
+=09=09mausb_pr_err("Device disconnecting due to session timeout madev_addr=
=3D%d",
+=09=09=09     dev->madev_addr);
+=09=09queue_work(dev->workq, &dev->socket_disconnect_work);
+=09=09queue_work(dev->workq, &dev->hcd_disconnect_work);
+=09=09return;
+=09}
+}
+
+static void mausb_heartbeat_work(struct work_struct *work)
+{
+=09struct mausb_device *dev =3D container_of(work, struct mausb_device,
+=09=09=09=09=09=09heartbeat_work);
+
+=09mausb_pr_err("Device disconnecting - app is unresponsive");
+=09atomic_set(&dev->unresponsive_client, 1);
+=09mausb_complete_urbs_from_tree();
+=09queue_work(dev->workq, &dev->socket_disconnect_work);
+=09queue_work(dev->workq, &dev->hcd_disconnect_work);
+}
+
+static void mausb_connection_timer_func(struct timer_list *timer)
+{
+=09struct mausb_device *dev =3D container_of(timer, struct mausb_device,
+=09=09=09=09=09=09connection_timer);
+
+=09queue_work(dev->workq, &dev->ping_work);
+}
+
 static void mausb_heartbeat_timer_func(struct timer_list *timer)
 {
 =09unsigned long flags =3D 0;
@@ -308,6 +517,99 @@ static void mausb_heartbeat_timer_func(struct timer_li=
st *timer)
 =09}
 }
=20
+static struct mausb_device *
+mausb_create_madev(struct mausb_device_address dev_addr, u8 madev_address,
+=09=09   int *status)
+{
+=09struct mausb_device *dev;
+=09unsigned long flags =3D 0;
+=09char workq_name[16];
+=09struct workqueue_struct *workq;
+
+=09memset(workq_name, 0, sizeof(workq_name));
+=09sprintf(workq_name, "%x", madev_address);
+=09strcat(workq_name, "_madev_workq");
+
+=09mausb_pr_debug("madev_workq_name =3D %s", workq_name);
+
+=09workq =3D alloc_ordered_workqueue(workq_name, WQ_MEM_RECLAIM);
+=09if (!workq) {
+=09=09mausb_pr_alert("Could not allocate workqueue!");
+=09=09*status =3D -ENOMEM;
+=09=09return NULL;
+=09}
+
+=09spin_lock_irqsave(&mss.lock, flags);
+
+=09if (mss.deinit_in_progress) {
+=09=09spin_unlock_irqrestore(&mss.lock, flags);
+=09=09mausb_pr_alert("Device creating failed - mss deinit in progress");
+=09=09flush_workqueue(workq);
+=09=09destroy_workqueue(workq);
+=09=09*status =3D -ESHUTDOWN;
+=09=09return NULL;
+=09}
+
+=09dev =3D mausb_get_dev_from_addr_unsafe(madev_address);
+=09if (dev) {
+=09=09spin_unlock_irqrestore(&mss.lock, flags);
+=09=09mausb_pr_debug("MAUSB device already connected, madev_address=3D%x",
+=09=09=09       madev_address);
+=09=09flush_workqueue(workq);
+=09=09destroy_workqueue(workq);
+=09=09*status =3D -EEXIST;
+=09=09return NULL;
+=09}
+
+=09dev =3D kzalloc(sizeof(*dev), GFP_ATOMIC);
+
+=09if (!dev) {
+=09=09spin_unlock_irqrestore(&mss.lock, flags);
+=09=09mausb_pr_alert("Could not allocate MAUSB device!");
+=09=09flush_workqueue(workq);
+=09=09destroy_workqueue(workq);
+=09=09*status =3D -ENOMEM;
+=09=09return NULL;
+=09}
+
+=09mausb_pr_info("Create MAUSB device. Version=3D%s", MAUSB_DRIVER_VERSION=
);
+
+=09dev->workq =3D workq;
+
+=09INIT_WORK(&dev->socket_disconnect_work, mausb_socket_disconnect_event);
+=09INIT_WORK(&dev->hcd_disconnect_work, mausb_hcd_disconnect_event);
+=09INIT_WORK(&dev->madev_delete_work, mausb_delete_madev);
+=09INIT_WORK(&dev->ping_work, mausb_ping_work);
+=09INIT_WORK(&dev->heartbeat_work, mausb_heartbeat_work);
+
+=09kref_init(&dev->refcount);
+
+=09dev->event_id =3D 0;
+=09spin_lock_init(&dev->event_id_lock);
+
+=09INIT_LIST_HEAD(&dev->completion_events);
+=09spin_lock_init(&dev->completion_events_lock);
+=09spin_lock_init(&dev->num_of_user_events_lock);
+=09spin_lock_init(&dev->connection_timer_lock);
+
+=09init_completion(&dev->user_finished_event);
+=09atomic_set(&dev->unresponsive_client, 0);
+
+=09timer_setup(&dev->connection_timer, mausb_connection_timer_func, 0);
+
+=09dev->dev_addr =3D dev_addr;
+=09dev->madev_addr =3D madev_address;
+=09dev->net_ns =3D get_net(current->nsproxy->net_ns);
+
+=09list_add_tail(&dev->list_entry, &mss.madev_list);
+
+=09reinit_completion(&mss.empty);
+
+=09spin_unlock_irqrestore(&mss.lock, flags);
+
+=09return dev;
+}
+
 void mausb_release_ma_dev_async(struct kref *kref)
 {
 =09struct mausb_device *dev =3D container_of(kref, struct mausb_device,
@@ -318,6 +620,45 @@ void mausb_release_ma_dev_async(struct kref *kref)
 =09schedule_work(&dev->madev_delete_work);
 }
=20
+int mausb_initiate_dev_connection(struct mausb_device_address dev_addr,
+=09=09=09=09  u8 madev_address)
+{
+=09int error =3D 0;
+=09struct mausb_device *dev;
+=09unsigned long flags =3D 0;
+
+=09spin_lock_irqsave(&mss.lock, flags);
+=09dev =3D mausb_get_dev_from_addr_unsafe(madev_address);
+=09spin_unlock_irqrestore(&mss.lock, flags);
+
+=09if (dev) {
+=09=09mausb_pr_debug("MAUSB device already connected, madev_address=3D%x",
+=09=09=09       madev_address);
+=09=09return -EEXIST;
+=09}
+
+=09dev =3D mausb_create_madev(dev_addr, madev_address, &error);
+
+=09if (!dev)
+=09=09return error;
+
+=09mausb_pr_info("New MAUSB device created madev_addr=3D%d", madev_address=
);
+
+=09error =3D mausb_init_ip_ctx(&dev->mgmt_channel, dev->net_ns,
+=09=09=09=09  dev->dev_addr.ip.address,
+=09=09=09=09  dev->dev_addr.ip.port.management, dev,
+=09=09=09=09  mausb_ip_callback, MAUSB_MGMT_CHANNEL);
+=09if (error) {
+=09=09mausb_pr_err("Mgmt ip context init failed: error=3D%d", error);
+=09=09kref_put(&dev->refcount, mausb_release_ma_dev_async);
+=09=09return error;
+=09}
+
+=09mausb_ip_connect_async(dev->mgmt_channel);
+
+=09return 0;
+}
+
 int mausb_enqueue_event_from_user(u8 madev_addr, u16 num_of_events,
 =09=09=09=09  u16 num_of_completed)
 {
@@ -418,6 +759,26 @@ int mausb_signal_event(struct mausb_device *dev,
 =09return -ETIMEDOUT;
 }
=20
+static int mausb_start_connection_timer(struct mausb_device *dev)
+{
+=09unsigned long flags =3D 0;
+
+=09spin_lock_irqsave(&dev->connection_timer_lock, flags);
+
+=09if (++dev->receive_failures_num > MAUSB_MAX_RECEIVE_FAILURES) {
+=09=09mausb_pr_err("Missed more than %d ping responses",
+=09=09=09     MAUSB_MAX_RECEIVE_FAILURES);
+=09=09spin_unlock_irqrestore(&dev->connection_timer_lock, flags);
+=09=09return -ETIMEDOUT;
+=09}
+
+=09mod_timer(&dev->connection_timer, jiffies + msecs_to_jiffies(1000));
+
+=09spin_unlock_irqrestore(&dev->connection_timer_lock, flags);
+
+=09return 0;
+}
+
 void mausb_reset_connection_timer(struct mausb_device *dev)
 {
 =09unsigned long flags =3D 0;
@@ -661,6 +1022,36 @@ struct mausb_device *mausb_get_dev_from_addr_unsafe(u=
8 madev_addr)
 =09return NULL;
 }
=20
+static void mausb_remove_madev_from_list(u8 madev_addr)
+{
+=09unsigned long flags =3D 0;
+=09struct mausb_device *ma_dev, *tmp =3D NULL;
+
+=09spin_lock_irqsave(&mss.lock, flags);
+
+=09list_for_each_entry_safe(ma_dev, tmp, &mss.madev_list, list_entry) {
+=09=09if (ma_dev->madev_addr =3D=3D madev_addr) {
+=09=09=09list_del(&ma_dev->list_entry);
+=09=09=09break;
+=09=09}
+=09}
+
+=09if (list_empty(&mss.madev_list))
+=09=09reinit_completion(&mss.rings_events.mausb_ring_has_events);
+
+=09spin_unlock_irqrestore(&mss.lock, flags);
+}
+
+static void mausb_signal_empty_mss(void)
+{
+=09unsigned long flags =3D 0;
+
+=09spin_lock_irqsave(&mss.lock, flags);
+=09if (list_empty(&mss.madev_list))
+=09=09complete(&mss.empty);
+=09spin_unlock_irqrestore(&mss.lock, flags);
+}
+
 static inline
 struct mausb_ip_ctx *mausb_get_data_channel(struct mausb_device *ma_dev,
 =09=09=09=09=09    enum mausb_channel channel)
@@ -814,6 +1205,137 @@ void mausb_cleanup_chunks_list(struct list_head *chu=
nks_list)
 =09}
 }
=20
+static void mausb_init_ip_ctx_helper(struct mausb_device *dev,
+=09=09=09=09     struct mausb_ip_ctx **ip_ctx,
+=09=09=09=09     u16 port,
+=09=09=09=09     enum mausb_channel channel)
+{
+=09int status =3D mausb_init_ip_ctx(ip_ctx, dev->net_ns,
+=09=09=09=09       dev->dev_addr.ip.address, port, dev,
+=09=09=09=09       mausb_ip_callback, channel);
+=09if (status < 0) {
+=09=09mausb_pr_err("Init ip context failed with error=3D%d", status);
+=09=09queue_work(dev->workq, &dev->socket_disconnect_work);
+=09=09return;
+=09}
+
+=09dev->channel_map[channel] =3D *ip_ctx;
+=09mausb_ip_connect_async(*ip_ctx);
+}
+
+static void mausb_connect_callback(struct mausb_device *dev,
+=09=09=09=09   enum mausb_channel channel, int status)
+{
+=09struct mausb_device_address *dev_addr =3D &dev->dev_addr;
+
+=09mausb_pr_info("Connect callback for channel=3D%d with status=3D%d",
+=09=09      channel, status);
+
+=09if (status < 0) {
+=09=09queue_work(dev->workq, &dev->socket_disconnect_work);
+=09=09return;
+=09}
+
+=09if (channel =3D=3D MAUSB_MGMT_CHANNEL) {
+=09=09if (dev_addr->ip.port.control =3D=3D 0) {
+=09=09=09dev->channel_map[MAUSB_CTRL_CHANNEL] =3D
+=09=09=09=09dev->mgmt_channel;
+=09=09=09channel =3D MAUSB_CTRL_CHANNEL;
+=09=09} else {
+=09=09=09mausb_init_ip_ctx_helper(dev, &dev->ctrl_channel,
+=09=09=09=09=09=09 dev_addr->ip.port.control,
+=09=09=09=09=09=09 MAUSB_CTRL_CHANNEL);
+=09=09=09return;
+=09=09}
+=09}
+
+=09if (channel =3D=3D MAUSB_CTRL_CHANNEL) {
+=09=09if (dev_addr->ip.port.bulk =3D=3D 0) {
+=09=09=09dev->channel_map[MAUSB_BULK_CHANNEL] =3D
+=09=09=09=09dev->channel_map[MAUSB_CTRL_CHANNEL];
+=09=09=09channel =3D MAUSB_BULK_CHANNEL;
+=09=09} else {
+=09=09=09mausb_init_ip_ctx_helper(dev, &dev->bulk_channel,
+=09=09=09=09=09=09 dev_addr->ip.port.bulk,
+=09=09=09=09=09=09 MAUSB_BULK_CHANNEL);
+=09=09=09return;
+=09=09}
+=09}
+
+=09if (channel =3D=3D MAUSB_BULK_CHANNEL) {
+=09=09if (dev_addr->ip.port.isochronous =3D=3D 0) {
+=09=09=09/* if there is no isoch port use tcp for it */
+=09=09=09dev->channel_map[MAUSB_ISOCH_CHANNEL] =3D
+=09=09=09=09dev->channel_map[MAUSB_BULK_CHANNEL];
+=09=09=09channel =3D MAUSB_ISOCH_CHANNEL;
+=09=09} else {
+=09=09=09mausb_init_ip_ctx_helper(dev, &dev->isoch_channel,
+=09=09=09=09=09=09 dev_addr->ip.port.isochronous,
+=09=09=09=09=09=09 MAUSB_ISOCH_CHANNEL);
+=09=09=09return;
+=09=09}
+=09}
+
+=09if (channel =3D=3D MAUSB_ISOCH_CHANNEL) {
+=09=09dev->channel_map[MAUSB_INTR_CHANNEL] =3D
+=09=09=09=09dev->channel_map[MAUSB_CTRL_CHANNEL];
+=09}
+}
+
+static void mausb_handle_connect_event(struct mausb_device *dev,
+=09=09=09=09       enum mausb_channel channel, int status,
+=09=09=09=09       void *data)
+{
+=09mausb_connect_callback(dev, channel, status);
+}
+
+static void mausb_handle_receive_event(struct mausb_device *dev,
+=09=09=09=09       enum mausb_channel channel, int status,
+=09=09=09=09       void *data)
+{
+=09struct mausb_event event;
+
+=09event.madev_addr =3D dev->madev_addr;
+
+=09if (status <=3D 0) {
+=09=09mausb_pr_err("Receive event error status=3D%d", status);
+=09=09queue_work(dev->workq, &dev->socket_disconnect_work);
+=09=09queue_work(dev->workq, &dev->hcd_disconnect_work);
+=09=09return;
+=09}
+
+=09mausb_reset_connection_timer(dev);
+}
+
+void mausb_ip_callback(void *ctx, enum mausb_channel channel,
+=09=09       enum mausb_link_action action, int status, void *data)
+{
+=09struct mausb_device *dev =3D (struct mausb_device *)ctx;
+
+=09switch (action) {
+=09case MAUSB_LINK_CONNECT:
+=09=09mausb_handle_connect_event(dev, channel, status, data);
+=09=09break;
+=09case MAUSB_LINK_SEND:
+=09=09/*
+=09=09 * Currently there is nothing to do, as send operation is
+=09=09 * synchronous
+=09=09 */
+=09=09break;
+=09case MAUSB_LINK_RECV:
+=09=09mausb_handle_receive_event(dev, channel, status, data);
+=09=09break;
+=09case MAUSB_LINK_DISCONNECT:
+=09=09/*
+=09=09 * Currently there is nothing to do, as disconnect operation is
+=09=09 * synchronous
+=09=09 */
+=09=09break;
+=09default:
+=09=09mausb_pr_warn("Unknown network action");
+=09}
+}
+
 static int mausb_read_virtual_buffer(struct mausb_data_iter *iterator,
 =09=09=09=09     u32 byte_num,
 =09=09=09=09     struct list_head *data_chunks_list,
diff --git a/drivers/usb/mausb_host/hpal.h b/drivers/usb/mausb_host/hpal.h
index f184bbc07783..a04ed120ba5e 100644
--- a/drivers/usb/mausb_host/hpal.h
+++ b/drivers/usb/mausb_host/hpal.h
@@ -131,6 +131,8 @@ static inline u64 mausb_event_id(struct mausb_device *d=
ev)
 =09return val;
 }
=20
+int mausb_initiate_dev_connection(struct mausb_device_address device_addre=
ss,
+=09=09=09=09  u8 madev_address);
 int mausb_data_req_enqueue_event(struct mausb_device *dev, u16 ep_handle,
 =09=09=09=09 struct urb *request);
 int mausb_signal_event(struct mausb_device *dev, struct mausb_event *event=
,
@@ -158,6 +160,7 @@ static inline void mausb_remove_event(struct mausb_devi=
ce *dev,
 }
=20
 void mausb_release_ma_dev_async(struct kref *kref);
+void mausb_on_madev_connected(struct mausb_device *dev);
 void mausb_complete_request(struct urb *urb, u32 actual_length, int status=
);
 void mausb_complete_urb(struct mausb_event *event);
 void mausb_reset_connection_timer(struct mausb_device *dev);
@@ -240,6 +243,9 @@ enum mausb_channel mausb_transfer_type_to_channel(u8 tr=
ansfer_type)
 =09return transfer_type >> 3;
 }
=20
+void mausb_ip_callback(void *ctx, enum mausb_channel channel,
+=09=09       enum mausb_link_action action, int status, void *data);
+
 struct mausb_data_iter {
 =09u32 length;
=20
diff --git a/drivers/usb/mausb_host/mausb_core.c b/drivers/usb/mausb_host/m=
ausb_core.c
index 8730590126ea..101afd0b9deb 100644
--- a/drivers/usb/mausb_host/mausb_core.c
+++ b/drivers/usb/mausb_host/mausb_core.c
@@ -13,41 +13,122 @@
=20
 #include "hcd.h"
 #include "hpal.h"
+#include "mausb_address.h"
 #include "utils.h"
=20
 MODULE_LICENSE("GPL");
 MODULE_AUTHOR("DisplayLink (UK) Ltd.");
 MODULE_VERSION(MAUSB_DRIVER_VERSION);
=20
+static struct mausb_device_address=09device_address;
+static int=09=09=09=09mausb_device_disconnect_param;
+static u16=09=09=09=09madev_addr;
+static u8=09=09=09=09mausb_client_connect_param;
+static u8=09=09=09=09mausb_client_disconnect_param;
+
 static int mausb_client_connect(const char *value,
 =09=09=09=09const struct kernel_param *kp)
 {
+=09unsigned long flags =3D 0;
+
 =09mausb_pr_info("Version=3D%s", MAUSB_DRIVER_VERSION);
=20
+=09spin_lock_irqsave(&mss.lock, flags);
+=09if (mss.client_connected) {
+=09=09mausb_pr_err("MA-USB client is already connected");
+=09=09spin_unlock_irqrestore(&mss.lock, flags);
+=09=09return -EEXIST;
+=09}
+=09/* Save heartbeat client information */
+=09mss.client_connected =3D true;
+=09mss.missed_heartbeats =3D 0;
+=09reinit_completion(&mss.client_stopped);
+=09spin_unlock_irqrestore(&mss.lock, flags);
+=09/* Start hearbeat timer */
+=09mod_timer(&mss.heartbeat_timer,
+=09=09  jiffies + msecs_to_jiffies(MAUSB_HEARTBEAT_TIMEOUT_MS));
+
 =09return 0;
 }
=20
 static int mausb_client_disconnect(const char *value,
 =09=09=09=09   const struct kernel_param *kp)
 {
+=09unsigned long flags =3D 0;
+=09struct mausb_device *dev =3D NULL;
+
 =09mausb_pr_info("Version=3D%s", MAUSB_DRIVER_VERSION);
=20
+=09spin_lock_irqsave(&mss.lock, flags);
+=09if (!mss.client_connected) {
+=09=09mausb_pr_err("MA-USB client is not connected");
+=09=09spin_unlock_irqrestore(&mss.lock, flags);
+=09=09return -ENODEV;
+=09}
+
+=09spin_unlock_irqrestore(&mss.lock, flags);
+
+=09/* Stop heartbeat timer */
+=09del_timer_sync(&mss.heartbeat_timer);
+
+=09/* Clear heartbeat client information */
+=09spin_lock_irqsave(&mss.lock, flags);
+=09mss.client_connected =3D false;
+=09mss.missed_heartbeats =3D 0;
+=09list_for_each_entry(dev, &mss.madev_list, list_entry) {
+=09=09mausb_pr_debug("Enqueue heartbeat_work madev_addr=3D%x",
+=09=09=09       dev->madev_addr);
+=09=09queue_work(dev->workq, &dev->heartbeat_work);
+=09}
+=09complete(&mss.client_stopped);
+=09spin_unlock_irqrestore(&mss.lock, flags);
+
 =09return 0;
 }
=20
 static int mausb_device_connect(const char *value,
 =09=09=09=09const struct kernel_param *kp)
 {
+=09int status =3D 0;
+
 =09mausb_pr_info("Version=3D%s", MAUSB_DRIVER_VERSION);
=20
-=09return 0;
+=09if (strlen(value) <=3D INET6_ADDRSTRLEN) {
+=09=09strcpy(device_address.ip.address, value);
+=09=09mausb_pr_info("Processing '%s' address",
+=09=09=09      device_address.ip.address);
+=09} else {
+=09=09mausb_pr_err("Invalid IP format");
+=09=09return 0;
+=09}
+=09status =3D mausb_initiate_dev_connection(device_address, madev_addr);
+=09memset(&device_address, 0, sizeof(device_address));
+
+=09return status;
 }
=20
 static int mausb_device_disconnect(const char *value,
 =09=09=09=09   const struct kernel_param *kp)
 {
+=09u8 dev_address =3D 0;
+=09int status =3D 0;
+=09unsigned long flags =3D 0;
+=09struct mausb_device *dev =3D NULL;
+
 =09mausb_pr_info("Version=3D%s", MAUSB_DRIVER_VERSION);
=20
+=09status =3D kstrtou8(value, 0, &dev_address);
+=09if (status < 0)
+=09=09return -EINVAL;
+
+=09spin_lock_irqsave(&mss.lock, flags);
+
+=09dev =3D mausb_get_dev_from_addr_unsafe(dev_address);
+=09if (dev)
+=09=09queue_work(dev->workq, &dev->hcd_disconnect_work);
+
+=09spin_unlock_irqrestore(&mss.lock, flags);
+
 =09return 0;
 }
=20
@@ -67,6 +148,26 @@ static const struct kernel_param_ops mausb_client_disco=
nnect_ops =3D {
 =09.set =3D mausb_client_disconnect
 };
=20
+module_param_named(mgmt, device_address.ip.port.management, ushort, 0664);
+MODULE_PARM_DESC(mgmt, "MA-USB management port");
+module_param_named(ctrl, device_address.ip.port.control, ushort, 0664);
+MODULE_PARM_DESC(ctrl, "MA-USB control port");
+module_param_named(bulk, device_address.ip.port.bulk, ushort, 0664);
+MODULE_PARM_DESC(bulk, "MA-USB bulk port");
+module_param_named(isoch, device_address.ip.port.isochronous, ushort, 0664=
);
+MODULE_PARM_DESC(isoch, "MA-USB isochronous port");
+module_param_named(madev_addr, madev_addr, ushort, 0664);
+MODULE_PARM_DESC(madev_addr, "MA-USB device address");
+
+module_param_cb(client_connect, &mausb_client_connect_ops,
+=09=09&mausb_client_connect_param, 0664);
+module_param_cb(client_disconnect, &mausb_client_disconnect_ops,
+=09=09&mausb_client_disconnect_param, 0664);
+module_param_cb(ip, &mausb_device_connect_ops,
+=09=09device_address.ip.address, 0664);
+module_param_cb(disconnect, &mausb_device_disconnect_ops,
+=09=09&mausb_device_disconnect_param, 0664);
+
 static int mausb_host_init(void)
 {
 =09int status;
--=20
2.17.1

