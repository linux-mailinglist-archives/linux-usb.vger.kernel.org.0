Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 29F4E1B852C
	for <lists+linux-usb@lfdr.de>; Sat, 25 Apr 2020 11:20:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726220AbgDYJU3 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 25 Apr 2020 05:20:29 -0400
Received: from eu-smtp-delivery-167.mimecast.com ([207.82.80.167]:40605 "EHLO
        eu-smtp-delivery-167.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726177AbgDYJU2 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 25 Apr 2020 05:20:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=displaylink.com;
        s=mimecast20151025; t=1587806422;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=zaeUkcjhsxFETuIoca4wVqNqgJA8s7u/nXgm5u0VQZk=;
        b=ZhT/+79JGiszBf9mYR3rTnHreVSPUgJgZPMdgkCWHlGHRXvY0vt6xLoGZ+sAGM8avV2ep0
        clF0oWZWLgRUmZ9/KYoxQX4gpG3/FgkSlrdB99Mb8Ow3IaPyzqo2W743zEC1tt13vGexnK
        XLWgHUmXJaEou/dHuvr0LB84wn1NI/g=
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01lp2050.outbound.protection.outlook.com [104.47.0.50]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 uk-mta-106-Ruq-br9pPGaIKaMVDEVVgA-1; Sat, 25 Apr 2020 10:20:21 +0100
X-MC-Unique: Ruq-br9pPGaIKaMVDEVVgA-1
Received: from VI1PR1001MB1056.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:800:64::13) by VI1PR1001MB1056.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:800:64::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2937.22; Sat, 25 Apr
 2020 09:20:19 +0000
Received: from VI1PR1001MB1056.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::8cba:c335:a57e:9dfd]) by VI1PR1001MB1056.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::8cba:c335:a57e:9dfd%5]) with mapi id 15.20.2937.020; Sat, 25 Apr 2020
 09:20:19 +0000
From:   vladimir.stankovic@displaylink.com
To:     gregkh@linuxfoundation.org
Cc:     linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        mausb-host-devel@displaylink.com
Subject: [PATCH v5 8/8] usb: mausb_host: Process MA-USB data packets
Date:   Sat, 25 Apr 2020 11:19:54 +0200
Message-Id: <20200425091954.1610-9-vladimir.stankovic@displaylink.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200425091954.1610-1-vladimir.stankovic@displaylink.com>
References: <20200327152614.26833-1-vladimir.stankovic@displaylink.com>
 <20200425091954.1610-1-vladimir.stankovic@displaylink.com>
X-ClientProxiedBy: LO2P265CA0131.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:9f::23) To VI1PR1001MB1056.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:800:64::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from raven-hp.endava.net (94.189.199.177) by LO2P265CA0131.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:9f::23) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2937.13 via Frontend Transport; Sat, 25 Apr 2020 09:20:18 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [94.189.199.177]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c271b230-09cc-4488-05fd-08d7e8f9dfae
X-MS-TrafficTypeDiagnostic: VI1PR1001MB1056:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR1001MB1056375A9CB63D64769DA9E991D10@VI1PR1001MB1056.EURPRD10.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:363;
X-Forefront-PRVS: 0384275935
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR1001MB1056.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(346002)(366004)(136003)(39840400004)(396003)(376002)(9686003)(6512007)(8936002)(66946007)(316002)(52116002)(66476007)(6666004)(5660300002)(8676002)(66556008)(81156014)(1076003)(86362001)(30864003)(6486002)(478600001)(6506007)(956004)(6916009)(2906002)(4326008)(26005)(36756003)(2616005)(186003)(16526019)(107886003);DIR:OUT;SFP:1101;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FWbBLB6nQrSukDxKD5bslGGhdfky3DYHis1wHCdMUQs5aAErc6whHs4QrD5UkuilOR3GKVJZTkknU9JUlZ3TiTbaflhjsb/zcIXytqU0uOQgAO4O3uYOXeJFINOYN0AftR6xisSLbHR3T87ZlJJe5+Pm0wWrYOZOvz+cmyi5bA6mchY5fXrb3JPvum9M0V5t/5Gpny7hz8KCOqnhVpK6nw6I+ZHP3Av0aWCssTn8JLRSUCAibIaWhJP4lIGKN9UrSGb1rnuq9w2b4un+rPdSNJGq+j3ismu7MdKARdP3Yb4nnJFwtI/+UTz+u+4GUIsKhILjerKHABJtHpTHOwFXktd6tren8Auxdk7cbR9bHnrCdpgkeLBgWsuhh4qqZ39fwjrE8OqfCt+CM6IcO87YsJZdQKi2mafvZwSRffuf7yHdNdUOxir+HroiupCqdcYC
X-MS-Exchange-AntiSpam-MessageData: XvUbLDB4bcoyJXrnBAplVyqwVlNqrfp4ZfmqnhW64yaYUARQL8mTjSoKOyUCxg76OV2EWsSFW5zZWxU23GuwzuhTw+mSocv4TP9HzCc9zR9GbCtcJBqRUPqF+iJz3dhbt1Xa2tEa9+4Eb8l2b2beXvlAnyGwIGmxza7XuMA5O94iDKDvfSrOF291IMdne5rEVvto4svQf1FPvnzn9qlryVQZfG+0/aQcD0nxJaACXfcwbnu2Oafr4hBCB3new4rbJiqhgMSvis/91yEO/JTH21JNF4DvQ5ZhlzM/ZPupyQy+Dir9Zy0+GEerzqoJUYK6z2tn/6zz3WScMHHaWwHjB38z8l7ZzYhd36+/Klv7ZAs48GBDzAh7UC1IKfmbpo0alXUlTUiMM0JfLeQlVQ3JkMdlWKqmj0rZoiD6lwnPLWl8J5OHCee2PhU/D87GhBTHlXj8TNCE8H3zRpQiguqTF/rsIy4olYQT2Wl4DMp9WKK/tCE7apRL/8T6YtfzAh+JYSZNkBPARcxCZXefIAHWFOcXV/93Rz+QjatQw6w3+OhLP5scmoqO3V1oEQPGEgCQE/eUvSmd3HQ/HnO0PJoojiXoSHlhjXHs11tZaAHejHowFJhGykvaXH+GSHBQxdLadD0qmDFK0FOrRBFoBtwS19/m9a2X0c62KGprviCwz+5CrOAszWsMaGEhjV6BID7tbNUuQz87vQvaSw3f0PWOYBK5MG2hx9/lMeLHsCIKJCi1hMxYA79wuWNIW9GVfO1G8kKjAAi8n18KC1AaRCsYATg2/0rezXu0PSDA9SkrB9g=
X-OriginatorOrg: displaylink.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c271b230-09cc-4488-05fd-08d7e8f9dfae
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Apr 2020 09:20:19.6907
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: a4bda75a-b444-4312-9c90-44a7c4b2c91a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8Dug4/cy+DK7HNlgkytlBaBkpQHQch9vZRv3/A628ih5xn9bBxsm/slf2w80ypwWGImMu6F37X1pKTzqevUGQwMKCPJECAI8aNAOygc8Y/atfarpX9DaWHNb7rGIUyt9
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR1001MB1056
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: displaylink.com
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Added implementation of MA-USB data&isoch packets processing logic,
both for IN and OUT directions.

Signed-off-by: Vladimir Stankovic <vladimir.stankovic@displaylink.com>
---
 drivers/usb/mausb_host/Makefile    |   1 +
 drivers/usb/mausb_host/hpal.c      |  31 +-
 drivers/usb/mausb_host/hpal_data.c | 714 +++++++++++++++++++++++++++++
 drivers/usb/mausb_host/hpal_data.h |  34 ++
 4 files changed, 778 insertions(+), 2 deletions(-)
 create mode 100644 drivers/usb/mausb_host/hpal_data.c
 create mode 100644 drivers/usb/mausb_host/hpal_data.h

diff --git a/drivers/usb/mausb_host/Makefile b/drivers/usb/mausb_host/Makef=
ile
index fd2a36a04ad6..a5fd033c002e 100644
--- a/drivers/usb/mausb_host/Makefile
+++ b/drivers/usb/mausb_host/Makefile
@@ -12,5 +12,6 @@ mausb_host-y +=3D ip_link.o
 mausb_host-y +=3D hcd.o
 mausb_host-y +=3D hpal.o
 mausb_host-y +=3D hpal_events.o
+mausb_host-y +=3D hpal_data.o
=20
 ccflags-y +=3D -I$(srctree)/$(src)
diff --git a/drivers/usb/mausb_host/hpal.c b/drivers/usb/mausb_host/hpal.c
index bf678f2707b9..cc46f3c5e2e6 100644
--- a/drivers/usb/mausb_host/hpal.c
+++ b/drivers/usb/mausb_host/hpal.c
@@ -11,6 +11,7 @@
 #include <linux/uio.h>
=20
 #include "hcd.h"
+#include "hpal_data.h"
 #include "hpal_events.h"
 #include "utils.h"
=20
@@ -1387,6 +1388,7 @@ int mausb_send_transfer_ack(struct mausb_device *dev,=
 struct mausb_event *event)
 int mausb_send_data_msg(struct mausb_device *dev, struct mausb_event *even=
t)
 {
 =09struct mausb_urb_ctx *urb_ctx;
+=09int status =3D 0;
=20
 =09if (event->status !=3D 0) {
 =09=09mausb_pr_err("Event %d failed with status %d",
@@ -1401,9 +1403,22 @@ int mausb_send_data_msg(struct mausb_device *dev, st=
ruct mausb_event *event)
 =09=09/* Transfer will be deleted from dequeue task */
 =09=09mausb_pr_warn("Urb is already cancelled for event=3D%d",
 =09=09=09      event->type);
+=09=09return status;
 =09}
=20
-=09return 0;
+=09if (mausb_isoch_data_event(event)) {
+=09=09if (event->data.direction =3D=3D MAUSB_DATA_MSG_DIRECTION_IN)
+=09=09=09status =3D mausb_send_isoch_in_msg(dev, event);
+=09=09else
+=09=09=09status =3D mausb_send_isoch_out_msg(dev, event, urb_ctx);
+=09} else {
+=09=09if (event->data.direction =3D=3D MAUSB_DATA_MSG_DIRECTION_IN)
+=09=09=09status =3D mausb_send_in_data_msg(dev, event);
+=09=09else
+=09=09=09status =3D mausb_send_out_data_msg(dev, event, urb_ctx);
+=09}
+
+=09return status;
 }
=20
 int mausb_receive_data_msg(struct mausb_device *dev, struct mausb_event *e=
vent)
@@ -1426,6 +1441,19 @@ int mausb_receive_data_msg(struct mausb_device *dev,=
 struct mausb_event *event)
 =09if (!urb_ctx) {
 =09=09/* Transfer will be deleted from dequeue task */
 =09=09mausb_pr_warn("Urb is already cancelled");
+=09=09goto cleanup;
+=09}
+
+=09if (mausb_isoch_data_event(event)) {
+=09=09if (event->data.direction =3D=3D MAUSB_DATA_MSG_DIRECTION_IN)
+=09=09=09mausb_receive_isoch_in_data(dev, event, urb_ctx);
+=09=09else
+=09=09=09mausb_receive_isoch_out(event);
+=09} else {
+=09=09if (event->data.direction =3D=3D MAUSB_DATA_MSG_DIRECTION_IN)
+=09=09=09mausb_receive_in_data(event, urb_ctx);
+=09=09else
+=09=09=09mausb_receive_out_data(event, urb_ctx);
 =09}
=20
 cleanup:
@@ -1593,7 +1621,6 @@ static void mausb_handle_receive_event(struct mausb_d=
evice *dev,
 =09status =3D mausb_msg_received_event(&event,
 =09=09=09=09=09  (struct ma_usb_hdr_common *)data,
 =09=09=09=09=09  channel);
-
 =09if (status =3D=3D 0)
 =09=09status =3D mausb_enqueue_event_to_user(dev, &event);
=20
diff --git a/drivers/usb/mausb_host/hpal_data.c b/drivers/usb/mausb_host/hp=
al_data.c
new file mode 100644
index 000000000000..4357a23afea0
--- /dev/null
+++ b/drivers/usb/mausb_host/hpal_data.c
@@ -0,0 +1,714 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2019 - 2020 DisplayLink (UK) Ltd.
+ */
+#include "hpal_data.h"
+
+#include <linux/slab.h>
+#include <linux/uio.h>
+
+#include "hcd.h"
+#include "hpal.h"
+#include "hpal_events.h"
+#include "utils.h"
+
+int mausb_send_in_data_msg(struct mausb_device *dev, struct mausb_event *e=
vent)
+{
+=09struct mausb_kvec_data_wrapper data_to_send;
+=09struct kvec kvec[2];
+=09struct urb *urb   =3D (struct urb *)(event->data.urb);
+=09bool setup_packet =3D (usb_endpoint_xfer_control(&urb->ep->desc) &&
+=09=09=09     urb->setup_packet);
+=09u32 kvec_num =3D setup_packet ? 2 : 1;
+=09enum mausb_channel channel;
+
+=09data_to_send.kvec_num=09=3D kvec_num;
+=09data_to_send.length=09=3D MAUSB_TRANSFER_HDR_SIZE +
+=09=09=09(setup_packet ? MAUSB_CONTROL_SETUP_SIZE : 0);
+
+=09/* Prepare transfer header kvec */
+=09kvec[0].iov_base =3D event->data.hdr;
+=09kvec[0].iov_len  =3D MAUSB_TRANSFER_HDR_SIZE;
+
+=09/* Prepare setup packet kvec */
+=09if (setup_packet) {
+=09=09kvec[1].iov_base =3D urb->setup_packet;
+=09=09kvec[1].iov_len  =3D MAUSB_CONTROL_SETUP_SIZE;
+=09}
+=09data_to_send.kvec =3D kvec;
+
+=09channel =3D mausb_transfer_type_to_channel(event->data.transfer_type);
+=09return mausb_send_data(dev, channel, &data_to_send);
+}
+
+void mausb_receive_in_data(struct mausb_event *event,
+=09=09=09   struct mausb_urb_ctx *urb_ctx)
+{
+=09struct urb *urb =3D urb_ctx->urb;
+=09struct mausb_data_iter *iterator     =3D &urb_ctx->iterator;
+=09struct ma_usb_hdr_common *common_hdr =3D
+=09=09=09(struct ma_usb_hdr_common *)event->data.recv_buf;
+=09void *buffer;
+=09u32 payload_size =3D common_hdr->length - MAUSB_TRANSFER_HDR_SIZE;
+=09u32 data_written =3D 0;
+
+=09buffer =3D shift_ptr(common_hdr, MAUSB_TRANSFER_HDR_SIZE);
+=09data_written =3D mausb_data_iterator_write(iterator, buffer,
+=09=09=09=09=09=09 payload_size);
+
+=09mausb_pr_debug("data_written=3D%d, payload_size=3D%d", data_written,
+=09=09       payload_size);
+=09event->data.rem_transfer_size -=3D data_written;
+
+=09if (event->data.transfer_eot) {
+=09=09mausb_pr_debug("transfer_size=3D%d, rem_transfer_size=3D%d, status=
=3D%d",
+=09=09=09       event->data.transfer_size,
+=09=09=09       event->data.rem_transfer_size, event->status);
+=09=09mausb_complete_request(urb, event->data.transfer_size -
+=09=09=09=09       event->data.rem_transfer_size,
+=09=09=09=09       event->status);
+=09}
+}
+
+static int
+mausb_init_data_out_header_chunk(struct ma_usb_hdr_common *common_hdr,
+=09=09=09=09 struct list_head *chunks_list,
+=09=09=09=09 u32 *num_of_data_chunks)
+{
+=09int status =3D mausb_add_data_chunk(common_hdr, MAUSB_TRANSFER_HDR_SIZE=
,
+=09=09=09=09=09  chunks_list);
+=09if (!status)
+=09=09++(*num_of_data_chunks);
+
+=09return status;
+}
+
+static int mausb_init_control_data_chunk(struct mausb_event *event,
+=09=09=09=09=09 struct list_head *chunks_list,
+=09=09=09=09=09 u32 *num_of_data_chunks)
+{
+=09int status;
+=09void *buffer =3D ((struct urb *)event->data.urb)->setup_packet;
+
+=09if (!event->data.first_control_packet)
+=09=09return 0;
+
+=09status =3D mausb_add_data_chunk(buffer, MAUSB_CONTROL_SETUP_SIZE,
+=09=09=09=09      chunks_list);
+=09if (!status)
+=09=09++(*num_of_data_chunks);
+
+=09return status;
+}
+
+static int
+mausb_prepare_transfer_packet(struct mausb_kvec_data_wrapper *wrapper,
+=09=09=09      struct mausb_event *event,
+=09=09=09      struct mausb_data_iter *iterator)
+{
+=09u32 num_of_data_chunks=09=09=3D 0;
+=09u32 num_of_payload_data_chunks=09=3D 0;
+=09u32 payload_data_size=09=09=3D 0;
+=09int status =3D 0;
+=09struct list_head chunks_list;
+=09struct list_head payload_data_chunks;
+=09struct ma_usb_hdr_common *data_hdr =3D (struct ma_usb_hdr_common *)
+=09=09=09event->data.hdr;
+
+=09INIT_LIST_HEAD(&chunks_list);
+
+=09/* Initialize data chunk for MAUSB header and add it to chunks list */
+=09if (mausb_init_data_out_header_chunk(data_hdr, &chunks_list,
+=09=09=09=09=09     &num_of_data_chunks) < 0) {
+=09=09status =3D -ENOMEM;
+=09=09goto cleanup_data_chunks;
+=09}
+
+=09/*
+=09 * Initialize data chunk for MAUSB control setup packet and
+=09 * add it to chunks list
+=09 */
+=09if (mausb_init_control_data_chunk(event, &chunks_list,
+=09=09=09=09=09  &num_of_data_chunks) < 0) {
+=09=09status =3D -ENOMEM;
+=09=09goto cleanup_data_chunks;
+=09}
+
+=09/* Get data chunks for data payload to send */
+=09INIT_LIST_HEAD(&payload_data_chunks);
+=09payload_data_size =3D
+=09=09=09((struct ma_usb_hdr_common *)event->data.hdr)->length -
+=09=09=09 MAUSB_TRANSFER_HDR_SIZE -
+=09=09=09 (event->data.first_control_packet ?
+=09=09=09  MAUSB_CONTROL_SETUP_SIZE : 0);
+
+=09if (mausb_data_iterator_read(iterator, payload_data_size,
+=09=09=09=09     &payload_data_chunks,
+=09=09=09=09     &num_of_payload_data_chunks) < 0) {
+=09=09status =3D -ENOMEM;
+=09=09goto cleanup_data_chunks;
+=09}
+
+=09list_splice_tail(&payload_data_chunks, &chunks_list);
+=09num_of_data_chunks +=3D num_of_payload_data_chunks;
+
+=09/* Map all data chunks to data wrapper */
+=09if (mausb_init_data_wrapper(wrapper, &chunks_list,
+=09=09=09=09    num_of_data_chunks) < 0) {
+=09=09status =3D -ENOMEM;
+=09=09goto cleanup_data_chunks;
+=09}
+
+cleanup_data_chunks: /* Cleanup all allocated data chunks */
+=09mausb_cleanup_chunks_list(&chunks_list);
+=09return status;
+}
+
+int mausb_send_out_data_msg(struct mausb_device *dev, struct mausb_event *=
event,
+=09=09=09    struct mausb_urb_ctx *urb_ctx)
+{
+=09int status;
+=09struct mausb_kvec_data_wrapper data;
+=09enum mausb_channel channel;
+
+=09status =3D mausb_prepare_transfer_packet(&data, event,
+=09=09=09=09=09       &urb_ctx->iterator);
+
+=09if (status < 0) {
+=09=09mausb_pr_err("Failed to prepare transfer packet");
+=09=09return status;
+=09}
+
+=09channel =3D mausb_transfer_type_to_channel(event->data.transfer_type);
+=09status =3D mausb_send_data(dev, channel, &data);
+
+=09kfree(data.kvec);
+
+=09return status;
+}
+
+void mausb_receive_out_data(struct mausb_event *event,
+=09=09=09    struct mausb_urb_ctx *urb_ctx)
+{
+=09struct urb *urb =3D urb_ctx->urb;
+
+=09mausb_pr_debug("transfer_size=3D%d, rem_transfer_size=3D%d, status=3D%d=
",
+=09=09       event->data.transfer_size, event->data.rem_transfer_size,
+=09=09       event->status);
+
+=09if (event->data.transfer_eot) {
+=09=09mausb_complete_request(urb, urb->transfer_buffer_length -
+=09=09=09=09       event->data.rem_transfer_size,
+=09=09=09=09       event->status);
+=09}
+}
+
+static inline u32
+__mausb_isoch_prepare_read_size_block(struct ma_usb_hdr_isochreadsizeblock=
_std *
+=09=09=09=09      isoch_readsize_block, struct urb *urb)
+{
+=09u32 i;
+=09u32 number_of_packets =3D (u32)urb->number_of_packets;
+
+=09if (number_of_packets =3D=3D 0)
+=09=09return 0;
+
+=09isoch_readsize_block->service_intervals  =3D number_of_packets;
+=09isoch_readsize_block->max_segment_length =3D
+=09=09=09=09=09(u32)urb->iso_frame_desc[0].length;
+
+=09for (i =3D 0; i < number_of_packets; ++i) {
+=09=09urb->iso_frame_desc[i].status =3D 0;
+=09=09urb->iso_frame_desc[i].actual_length =3D 0;
+=09}
+
+=09return sizeof(struct ma_usb_hdr_isochreadsizeblock_std);
+}
+
+int mausb_send_isoch_in_msg(struct mausb_device *dev, struct mausb_event *=
event)
+{
+=09u32 read_size_block_length =3D 0;
+=09struct mausb_kvec_data_wrapper data_to_send;
+=09struct kvec kvec[MAUSB_ISOCH_IN_KVEC_NUM];
+=09struct ma_usb_hdr_isochtransfer_optional opt_isoch_hdr;
+=09struct ma_usb_hdr_isochreadsizeblock_std isoch_readsize_block;
+=09struct ma_usb_hdr_common *hdr =3D
+=09=09=09=09(struct ma_usb_hdr_common *)event->data.hdr;
+=09struct urb *urb =3D (struct urb *)event->data.urb;
+=09enum mausb_channel channel;
+
+=09data_to_send.kvec_num=09=3D 0;
+=09data_to_send.length=09=3D 0;
+
+=09/* Prepare transfer header kvec */
+=09kvec[0].iov_base     =3D event->data.hdr;
+=09kvec[0].iov_len=09     =3D MAUSB_TRANSFER_HDR_SIZE;
+=09data_to_send.length +=3D (u32)kvec[0].iov_len;
+=09data_to_send.kvec_num++;
+
+=09/* Prepare optional header kvec */
+=09opt_isoch_hdr.timestamp =3D MA_USB_TRANSFER_RESERVED;
+=09opt_isoch_hdr.mtd=09=3D MA_USB_TRANSFER_RESERVED;
+
+=09kvec[1].iov_base     =3D &opt_isoch_hdr;
+=09kvec[1].iov_len=09     =3D sizeof(struct ma_usb_hdr_isochtransfer_optio=
nal);
+=09data_to_send.length +=3D (u32)kvec[1].iov_len;
+=09data_to_send.kvec_num++;
+
+=09/* Prepare read size blocks */
+=09read_size_block_length =3D
+=09=09__mausb_isoch_prepare_read_size_block(&isoch_readsize_block,
+=09=09=09=09=09=09      urb);
+=09if (read_size_block_length > 0) {
+=09=09kvec[2].iov_base     =3D &isoch_readsize_block;
+=09=09kvec[2].iov_len=09     =3D read_size_block_length;
+=09=09data_to_send.length +=3D (u32)kvec[2].iov_len;
+=09=09data_to_send.kvec_num++;
+=09}
+
+=09hdr->length =3D (u16)data_to_send.length;
+=09data_to_send.kvec =3D kvec;
+
+=09channel =3D mausb_transfer_type_to_channel(event->data.transfer_type);
+=09return mausb_send_data(dev, channel, &data_to_send);
+}
+
+static void __mausb_process_in_isoch_short_resp(struct mausb_event *event,
+=09=09=09=09=09=09struct ma_usb_hdr_common *hdr,
+=09=09=09=09=09=09struct mausb_urb_ctx *urb_ctx)
+{
+=09u8 opt_hdr_shift =3D (hdr->flags & MA_USB_HDR_FLAGS_TIMESTAMP) ?
+=09=09=09   sizeof(struct ma_usb_hdr_isochtransfer_optional) : 0;
+=09struct ma_usb_hdr_isochdatablock_short *data_block_hdr =3D
+=09=09=09(struct ma_usb_hdr_isochdatablock_short *)
+=09=09=09shift_ptr(mausb_hdr_isochtransfer_optional_hdr(hdr),
+=09=09=09=09  opt_hdr_shift);
+=09u8 *isoch_data =3D shift_ptr(data_block_hdr, hdr->data.headers *
+=09=09=09=09   sizeof(*data_block_hdr));
+=09u8 *end_of_packet =3D shift_ptr(hdr, hdr->length);
+=09struct urb *urb =3D urb_ctx->urb;
+=09int i;
+
+=09if (isoch_data >=3D end_of_packet) {
+=09=09mausb_pr_err("Bad header data. Data start pointer after end of packe=
t: ep_handle=3D%#x",
+=09=09=09     event->data.ep_handle);
+=09=09return;
+=09}
+
+=09for (i =3D 0; i < hdr->data.headers; ++i) {
+=09=09u16 seg_num  =3D data_block_hdr[i].segment_number;
+=09=09u16 seg_size =3D data_block_hdr[i].block_length;
+
+=09=09if (seg_num >=3D urb->number_of_packets) {
+=09=09=09mausb_pr_err("Too many segments: ep_handle=3D%#x, seg_num=3D%d, u=
rb.number_of_packets=3D%d",
+=09=09=09=09     event->data.ep_handle, seg_num,
+=09=09=09=09     urb->number_of_packets);
+=09=09=09break;
+=09=09}
+
+=09=09if (seg_size > urb->iso_frame_desc[seg_num].length) {
+=09=09=09mausb_pr_err("Block to long for segment: ep_handle=3D%#x",
+=09=09=09=09     event->data.ep_handle);
+=09=09=09break;
+=09=09}
+
+=09=09if (shift_ptr(isoch_data, seg_size) > end_of_packet) {
+=09=09=09mausb_pr_err("End of segment after enf of packet: ep_handle=3D%#x=
",
+=09=09=09=09     event->data.ep_handle);
+=09=09=09break;
+=09=09}
+
+=09=09mausb_reset_data_iterator(&urb_ctx->iterator);
+=09=09mausb_data_iterator_seek(&urb_ctx->iterator,
+=09=09=09=09=09 urb->iso_frame_desc[seg_num].offset);
+=09=09mausb_data_iterator_write(&urb_ctx->iterator, isoch_data,
+=09=09=09=09=09  seg_size);
+
+=09=09isoch_data =3D shift_ptr(isoch_data, seg_size);
+
+=09=09urb->iso_frame_desc[seg_num].actual_length =3D seg_size;
+=09=09urb->iso_frame_desc[seg_num].status =3D 0;
+=09}
+}
+
+static void __mausb_process_in_isoch_std_resp(struct mausb_event *event,
+=09=09=09=09=09      struct ma_usb_hdr_common *hdr,
+=09=09=09=09=09      struct mausb_urb_ctx *urb_ctx)
+{
+=09u8 opt_hdr_shift =3D (hdr->flags & MA_USB_HDR_FLAGS_TIMESTAMP) ?
+=09=09=09   sizeof(struct ma_usb_hdr_isochtransfer_optional) : 0;
+=09struct ma_usb_hdr_isochdatablock_std *data_block_hdr =3D
+=09=09(struct ma_usb_hdr_isochdatablock_std *)
+=09=09shift_ptr(mausb_hdr_isochtransfer_optional_hdr(hdr),
+=09=09=09  opt_hdr_shift);
+=09u8 *isoch_data =3D
+=09=09shift_ptr(data_block_hdr, hdr->data.headers *
+=09=09=09  sizeof(struct ma_usb_hdr_isochdatablock_std));
+=09u8 *end_of_packet =3D shift_ptr(hdr, hdr->length);
+=09struct urb *urb =3D (struct urb *)event->data.urb;
+=09int i;
+
+=09if (isoch_data >=3D end_of_packet) {
+=09=09mausb_pr_err("Bad header data. Data start pointer after end of packe=
t: ep_handle=3D%#x",
+=09=09=09     event->data.ep_handle);
+=09=09return;
+=09}
+
+=09for (i =3D 0; i < hdr->data.headers; ++i) {
+=09=09u16 seg_num   =3D data_block_hdr[i].segment_number;
+=09=09u16 seg_len   =3D data_block_hdr[i].segment_length;
+=09=09u16 block_len =3D data_block_hdr[i].block_length;
+
+=09=09if (seg_num >=3D urb->number_of_packets) {
+=09=09=09mausb_pr_err("Too many segments: ep_handle=3D%#x, seg_num=3D%d, n=
umber_of_packets=3D%d",
+=09=09=09=09     event->data.ep_handle, seg_num,
+=09=09=09=09     urb->number_of_packets);
+=09=09=09break;
+=09=09}
+
+=09=09if (block_len > urb->iso_frame_desc[seg_num].length -
+=09=09=09     urb->iso_frame_desc[seg_num].actual_length) {
+=09=09=09mausb_pr_err("Block too long for segment: ep_handle=3D%#x",
+=09=09=09=09     event->data.ep_handle);
+=09=09=09break;
+=09=09}
+
+=09=09if (shift_ptr(isoch_data, block_len) >
+=09=09=09=09       end_of_packet) {
+=09=09=09mausb_pr_err("End of fragment after end of packet: ep_handle=3D%#=
x",
+=09=09=09=09     event->data.ep_handle);
+=09=09=09break;
+=09=09}
+
+=09=09mausb_reset_data_iterator(&urb_ctx->iterator);
+=09=09mausb_data_iterator_seek(&urb_ctx->iterator,
+=09=09=09=09=09 urb->iso_frame_desc[seg_num].offset +
+=09=09=09=09=09 data_block_hdr[i].fragment_offset);
+=09=09mausb_data_iterator_write(&urb_ctx->iterator,
+=09=09=09=09=09  isoch_data, block_len);
+=09=09isoch_data =3D shift_ptr(isoch_data, block_len);
+
+=09=09urb->iso_frame_desc[seg_num].actual_length +=3D block_len;
+
+=09=09if (urb->iso_frame_desc[seg_num].actual_length =3D=3D seg_len)
+=09=09=09urb->iso_frame_desc[seg_num].status =3D 0;
+=09}
+}
+
+void mausb_receive_isoch_in_data(struct mausb_device *dev,
+=09=09=09=09 struct mausb_event *event,
+=09=09=09=09 struct mausb_urb_ctx *urb_ctx)
+{
+=09struct ma_usb_hdr_common *common_hdr =3D
+=09=09=09(struct ma_usb_hdr_common *)event->data.recv_buf;
+=09struct ma_usb_hdr_transfer *transfer_hdr =3D
+=09=09=09=09=09mausb_get_data_transfer_hdr(common_hdr);
+
+=09if (!(common_hdr->data.i_flags & MA_USB_DATA_IFLAGS_FMT_MASK)) {
+=09=09/* Short ISO headers response */
+=09=09__mausb_process_in_isoch_short_resp(event, common_hdr, urb_ctx);
+=09} else if ((common_hdr->data.i_flags & MA_USB_DATA_IFLAGS_FMT_MASK) &
+=09=09MA_USB_DATA_IFLAGS_HDR_FMT_STD) {
+=09=09/* Standard ISO headers response */
+=09=09__mausb_process_in_isoch_std_resp(event, common_hdr, urb_ctx);
+=09} else if ((common_hdr->data.i_flags & MA_USB_DATA_IFLAGS_FMT_MASK) &
+=09=09MA_USB_DATA_IFLAGS_HDR_FMT_LONG) {
+=09=09/* Long ISO headers response */
+=09=09mausb_pr_warn("Long isoc headers in response: ep_handle=3D%#x, req_i=
d=3D%#x",
+=09=09=09      event->data.ep_handle, transfer_hdr->req_id);
+=09} else {
+=09=09/* Error */
+=09=09mausb_pr_err("Isoc header error in response: ep_handle=3D%#x, req_id=
=3D%#x",
+=09=09=09     event->data.ep_handle, transfer_hdr->req_id);
+=09}
+}
+
+static inline u32
+__mausb_calculate_isoch_common_header_size(u32 num_of_segments)
+{
+=09return MAUSB_ISOCH_TRANSFER_HDR_SIZE +
+=09=09=09MAUSB_ISOCH_STANDARD_FORMAT_SIZE * num_of_segments;
+}
+
+static struct ma_usb_hdr_common *
+__mausb_create_isoch_out_transfer_packet(struct mausb_event *event,
+=09=09=09=09=09 struct mausb_urb_ctx *urb_ctx,
+=09=09=09=09=09 u16 payload_size, u32 seq_n,
+=09=09=09=09=09 u32 start_of_segments,
+=09=09=09=09=09 u32 number_of_segments)
+{
+=09struct ma_usb_hdr_common=09=09 *hdr;
+=09struct ma_usb_hdr_isochtransfer=09=09 *hdr_isochtransfer;
+=09struct ma_usb_hdr_isochdatablock_std=09 *isoc_header_std;
+=09struct ma_usb_hdr_isochtransfer_optional *hdr_opt_isochtransfer;
+=09struct urb *urb =3D (struct urb *)event->data.urb;
+=09void *isoc_headers =3D NULL;
+=09u32 length;
+=09u16 i;
+=09unsigned long block_length;
+=09u32 number_of_packets =3D (u32)event->data.isoch_seg_num;
+=09u32 size_of_request =3D
+=09=09__mausb_calculate_isoch_common_header_size(number_of_segments);
+
+=09hdr =3D kzalloc(size_of_request, GFP_KERNEL);
+=09if (!hdr)
+=09=09return NULL;
+
+=09hdr->version=09  =3D MA_USB_HDR_VERSION_1_0;
+=09hdr->ssid=09  =3D event->data.mausb_ssid;
+=09hdr->flags=09  =3D MA_USB_HDR_FLAGS_HOST;
+=09hdr->dev_addr=09  =3D event->data.mausb_address;
+=09hdr->handle.epv=09  =3D event->data.ep_handle;
+=09hdr->data.status  =3D MA_USB_HDR_STATUS_NO_ERROR;
+=09hdr->data.eps=09  =3D MAUSB_TRANSFER_RESERVED;
+=09hdr->data.t_flags =3D (u8)(usb_endpoint_type(&urb->ep->desc) << 3);
+
+=09isoc_headers =3D shift_ptr(hdr, MAUSB_ISOCH_TRANSFER_HDR_SIZE);
+
+=09for (i =3D (u16)start_of_segments;
+=09     i < number_of_segments + start_of_segments; ++i) {
+=09=09block_length =3D i < number_of_packets - 1 ?
+=09=09=09urb->iso_frame_desc[i + 1].offset -
+=09=09=09urb->iso_frame_desc[i].offset :
+=09=09=09mausb_data_iterator_length(&urb_ctx->iterator) -
+=09=09=09urb->iso_frame_desc[i].offset;
+
+=09=09urb->iso_frame_desc[i].status =3D MA_USB_HDR_STATUS_UNSUCCESSFUL;
+=09=09isoc_header_std =3D (struct ma_usb_hdr_isochdatablock_std *)
+=09=09=09shift_ptr(isoc_headers,
+=09=09=09=09  (u64)MAUSB_ISOCH_STANDARD_FORMAT_SIZE *
+=09=09=09=09  (i - start_of_segments));
+=09=09isoc_header_std->block_length=09 =3D (u16)block_length;
+=09=09isoc_header_std->segment_number  =3D i;
+=09=09isoc_header_std->s_flags=09 =3D 0;
+=09=09isoc_header_std->segment_length  =3D (u16)block_length;
+=09=09isoc_header_std->fragment_offset =3D 0;
+=09}
+
+=09length =3D __mausb_calculate_isoch_common_header_size(number_of_segment=
s);
+
+=09hdr->flags=09=09|=3D MA_USB_HDR_FLAGS_TIMESTAMP;
+=09hdr->type=09=09 =3D (u8)MA_USB_HDR_TYPE_DATA_REQ(ISOCHTRANSFER);
+=09hdr->data.headers=09 =3D (u16)number_of_segments;
+=09hdr->data.i_flags=09 =3D MA_USB_DATA_IFLAGS_HDR_FMT_STD |
+=09=09=09=09      MA_USB_DATA_IFLAGS_ASAP;
+=09hdr_opt_isochtransfer=09    =3D mausb_hdr_isochtransfer_optional_hdr(hd=
r);
+=09hdr_isochtransfer=09    =3D mausb_get_isochtransfer_hdr(hdr);
+=09hdr_isochtransfer->req_id   =3D event->data.req_id;
+=09hdr_isochtransfer->seq_n    =3D seq_n;
+=09hdr_isochtransfer->segments =3D number_of_packets;
+
+=09hdr_isochtransfer->presentation_time =3D MA_USB_TRANSFER_RESERVED;
+
+=09hdr_opt_isochtransfer->timestamp =3D MA_USB_TRANSFER_RESERVED;
+=09hdr_opt_isochtransfer->mtd=09 =3D MA_USB_TRANSFER_RESERVED;
+
+=09hdr->length =3D (u16)length + payload_size;
+
+=09return hdr;
+}
+
+static int
+mausb_init_isoch_out_header_chunk(struct ma_usb_hdr_common *common_hdr,
+=09=09=09=09  struct list_head *chunks_list,
+=09=09=09=09  u32 *num_of_data_chunks,
+=09=09=09=09  u32 num_of_packets)
+{
+=09u32 header_size =3D
+=09=09__mausb_calculate_isoch_common_header_size(num_of_packets);
+=09int status =3D mausb_add_data_chunk(common_hdr, header_size, chunks_lis=
t);
+
+=09if (!status)
+=09=09++(*num_of_data_chunks);
+
+=09return status;
+}
+
+static
+int mausb_prepare_isoch_out_transfer_packet(struct ma_usb_hdr_common *hdr,
+=09=09=09=09=09    struct mausb_event *event,
+=09=09=09=09=09    struct mausb_urb_ctx *urb_ctx,
+=09=09=09=09=09    struct mausb_kvec_data_wrapper *
+=09=09=09=09=09    result_data_wrapper)
+{
+=09u32 num_of_data_chunks=09       =3D 0;
+=09u32 num_of_payload_data_chunks =3D 0;
+=09u32 segment_number=09       =3D event->data.isoch_seg_num;
+=09u32 payload_data_size;
+=09struct list_head chunks_list;
+=09struct list_head payload_data_chunks;
+=09int status =3D 0;
+
+=09INIT_LIST_HEAD(&chunks_list);
+
+=09/* Initialize data chunk for MAUSB header and add it to chunks list */
+=09if (mausb_init_isoch_out_header_chunk(hdr, &chunks_list,
+=09=09=09=09=09      &num_of_data_chunks,
+=09=09=09=09=09      segment_number) < 0) {
+=09=09status =3D -ENOMEM;
+=09=09goto cleanup_data_chunks;
+=09}
+
+=09/* Get data chunks for data payload to send */
+=09INIT_LIST_HEAD(&payload_data_chunks);
+=09payload_data_size =3D hdr->length -
+=09=09__mausb_calculate_isoch_common_header_size(segment_number);
+
+=09if (mausb_data_iterator_read(&urb_ctx->iterator, payload_data_size,
+=09=09=09=09     &payload_data_chunks,
+=09=09=09=09     &num_of_payload_data_chunks) < 0) {
+=09=09mausb_pr_err("Data iterator read failed");
+=09=09status =3D -ENOMEM;
+=09=09goto cleanup_data_chunks;
+=09}
+
+=09list_splice_tail(&payload_data_chunks, &chunks_list);
+=09num_of_data_chunks +=3D num_of_payload_data_chunks;
+
+=09/* Map all data chunks to data wrapper */
+=09if (mausb_init_data_wrapper(result_data_wrapper, &chunks_list,
+=09=09=09=09    num_of_data_chunks) < 0) {
+=09=09mausb_pr_err("Data wrapper init failed");
+=09=09status =3D -ENOMEM;
+=09=09goto cleanup_data_chunks;
+=09}
+
+cleanup_data_chunks:
+=09mausb_cleanup_chunks_list(&chunks_list);
+=09return status;
+}
+
+static int mausb_create_and_send_isoch_transfer_req(struct mausb_device *d=
ev,
+=09=09=09=09=09=09    struct mausb_event *event,
+=09=09=09=09=09=09    struct mausb_urb_ctx
+=09=09=09=09=09=09    *urb_ctx, u32 *seq_n,
+=09=09=09=09=09=09    u32 payload_size,
+=09=09=09=09=09=09    u32 start_of_segments,
+=09=09=09=09=09=09    u32 number_of_segments)
+{
+=09struct ma_usb_hdr_common *hdr;
+=09struct mausb_kvec_data_wrapper data_to_send;
+=09int status;
+=09enum mausb_channel channel;
+
+=09hdr =3D __mausb_create_isoch_out_transfer_packet(event, urb_ctx,
+=09=09=09=09=09=09       (u16)payload_size,
+=09=09=09=09=09=09       *seq_n,
+=09=09=09=09=09=09       start_of_segments,
+=09=09=09=09=09=09       number_of_segments);
+=09if (!hdr) {
+=09=09mausb_pr_alert("Isoch transfer packet alloc failed");
+=09=09return -ENOMEM;
+=09}
+=09*seq_n =3D (*seq_n + 1) % (MA_USB_TRANSFER_SEQN_MAX + 1);
+
+=09status =3D mausb_prepare_isoch_out_transfer_packet(hdr, event, urb_ctx,
+=09=09=09=09=09=09=09 &data_to_send);
+=09if (status < 0) {
+=09=09mausb_pr_alert("Failed to prepare transfer packet");
+=09=09kfree(hdr);
+=09=09return status;
+=09}
+
+=09channel =3D mausb_transfer_type_to_channel(event->data.transfer_type);
+=09status =3D mausb_send_data(dev, channel, &data_to_send);
+
+=09kfree(hdr);
+=09kfree(data_to_send.kvec);
+
+=09return status;
+}
+
+static inline int __mausb_send_isoch_out_packet(struct mausb_device *dev,
+=09=09=09=09=09=09struct mausb_event *event,
+=09=09=09=09=09=09struct mausb_urb_ctx *urb_ctx,
+=09=09=09=09=09=09u32 *seq_n,
+=09=09=09=09=09=09u32 *starting_segments,
+=09=09=09=09=09=09u32 *rem_transfer_buf,
+=09=09=09=09=09=09u32 *payload_size, u32 index)
+{
+=09int status =3D mausb_create_and_send_isoch_transfer_req(dev, event,
+=09=09=09=09=09urb_ctx, seq_n, *payload_size,
+=09=09=09=09=09*starting_segments,
+=09=09=09=09=09index - *starting_segments);
+=09if (status < 0) {
+=09=09mausb_pr_err("ISOCH transfer request create and send failed");
+=09=09return status;
+=09}
+=09*starting_segments =3D index;
+=09*rem_transfer_buf  =3D MAX_ISOCH_ASAP_PACKET_SIZE;
+=09*payload_size=09   =3D 0;
+
+=09return 0;
+}
+
+int mausb_send_isoch_out_msg(struct mausb_device *ma_dev,
+=09=09=09     struct mausb_event *mausb_event,
+=09=09=09     struct mausb_urb_ctx *urb_ctx)
+{
+=09u32   starting_segments =3D 0;
+=09u32   rem_transfer_buf  =3D MAX_ISOCH_ASAP_PACKET_SIZE;
+=09struct urb *urb =3D (struct urb *)mausb_event->data.urb;
+=09u32 number_of_packets =3D (u32)urb->number_of_packets;
+=09u32 payload_size   =3D 0;
+=09u32 chunk_size;
+=09u32 seq_n=09   =3D 0;
+=09int status;
+=09u32 i;
+
+=09for (i =3D 0; i < number_of_packets; ++i) {
+=09=09if (i < number_of_packets - 1)
+=09=09=09chunk_size =3D urb->iso_frame_desc[i + 1].offset -
+=09=09=09=09=09urb->iso_frame_desc[i].offset;
+=09=09else
+=09=09=09chunk_size =3D
+=09=09=09=09mausb_data_iterator_length(&urb_ctx->iterator) -
+=09=09=09=09=09=09urb->iso_frame_desc[i].offset;
+
+=09=09if (chunk_size + MAUSB_ISOCH_STANDARD_FORMAT_SIZE >
+=09=09    rem_transfer_buf) {
+=09=09=09if (payload_size =3D=3D 0) {
+=09=09=09=09mausb_pr_warn("Fragmentation");
+=09=09=09} else {
+=09=09=09=09status =3D __mausb_send_isoch_out_packet
+=09=09=09=09=09=09(ma_dev, mausb_event, urb_ctx,
+=09=09=09=09=09=09 &seq_n, &starting_segments,
+=09=09=09=09=09=09 &rem_transfer_buf,
+=09=09=09=09=09=09 &payload_size, i);
+=09=09=09=09if (status < 0)
+=09=09=09=09=09return status;
+=09=09=09=09i--;
+=09=09=09=09continue;
+=09=09=09}
+=09=09} else {
+=09=09=09rem_transfer_buf -=3D
+=09=09=09=09chunk_size + MAUSB_ISOCH_STANDARD_FORMAT_SIZE;
+=09=09=09payload_size +=3D chunk_size;
+=09=09}
+
+=09=09if (i =3D=3D number_of_packets - 1 || rem_transfer_buf =3D=3D 0) {
+=09=09=09status =3D __mausb_send_isoch_out_packet
+=09=09=09=09=09(ma_dev, mausb_event, urb_ctx, &seq_n,
+=09=09=09=09=09 &starting_segments, &rem_transfer_buf,
+=09=09=09=09=09 &payload_size, i + 1);
+=09=09=09if (status < 0)
+=09=09=09=09return status;
+=09=09}
+=09}
+=09return 0;
+}
+
+void mausb_receive_isoch_out(struct mausb_event *event)
+{
+=09struct urb *urb =3D (struct urb *)event->data.urb;
+=09u16 i;
+
+=09mausb_pr_debug("transfer_size=3D%d, rem_transfer_size=3D%d, status=3D%d=
",
+=09=09       event->data.transfer_size, event->data.rem_transfer_size,
+=09=09       event->status);
+
+=09for (i =3D 0; i < urb->number_of_packets; ++i)
+=09=09urb->iso_frame_desc[i].status =3D event->status;
+
+=09mausb_complete_request(urb, event->data.payload_size, event->status);
+}
diff --git a/drivers/usb/mausb_host/hpal_data.h b/drivers/usb/mausb_host/hp=
al_data.h
new file mode 100644
index 000000000000..4b351d508966
--- /dev/null
+++ b/drivers/usb/mausb_host/hpal_data.h
@@ -0,0 +1,34 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2019 - 2020 DisplayLink (UK) Ltd.
+ */
+#ifndef __MAUSB_HPAL_DATA_H__
+#define __MAUSB_HPAL_DATA_H__
+
+#include <linux/types.h>
+
+#include "hpal_events.h"
+
+int mausb_send_in_data_msg(struct mausb_device *dev, struct mausb_event *e=
vent);
+void mausb_receive_in_data(struct mausb_event *event,
+=09=09=09   struct mausb_urb_ctx *urb_ctx);
+
+int mausb_send_out_data_msg(struct mausb_device *dev, struct mausb_event *=
event,
+=09=09=09    struct mausb_urb_ctx *urb_ctx);
+void mausb_receive_out_data(struct mausb_event *event,
+=09=09=09    struct mausb_urb_ctx *urb_ctx);
+
+#define MAUSB_ISOCH_IN_KVEC_NUM 3
+
+int mausb_send_isoch_in_msg(struct mausb_device *dev,
+=09=09=09    struct mausb_event *event);
+void mausb_receive_isoch_in_data(struct mausb_device *dev,
+=09=09=09=09 struct mausb_event *event,
+=09=09=09=09 struct mausb_urb_ctx *urb_ctx);
+
+int mausb_send_isoch_out_msg(struct mausb_device *ma_dev,
+=09=09=09     struct mausb_event *mausb_event,
+=09=09=09     struct mausb_urb_ctx *urb_ctx);
+void mausb_receive_isoch_out(struct mausb_event *event);
+
+#endif /* __MAUSB_HPAL_DATA_H__ */
--=20
2.17.1

