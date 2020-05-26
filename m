Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F01D51D4DC1
	for <lists+linux-usb@lfdr.de>; Fri, 15 May 2020 14:36:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726341AbgEOMfk (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 15 May 2020 08:35:40 -0400
Received: from eu-smtp-delivery-167.mimecast.com ([146.101.78.167]:35276 "EHLO
        eu-smtp-delivery-167.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726171AbgEOMfi (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 15 May 2020 08:35:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=displaylink.com;
        s=mimecast20151025; t=1589546126;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=yExyGwkrjOGVqAeidAs1cSAknzL27pJJ5lJawnBGOOo=;
        b=LbCo5XboYeF0SCnYKNT60pkNZQQSeO4+gNaIa6LqWyMZGg5iVGbFb2KRK6ZZVkkyi2FeEB
        dhGz0Qp7I/umvm7xoAUy9553yIF34QX5YSiS98bRPWD8HboxVXM4dtFZwsoNZwN8zIdohO
        sZHw8JbUAJbOM4f99sJKXI3unUfC8i4=
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2053.outbound.protection.outlook.com [104.47.14.53]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 uk-mta-247-0o3JdklrP9mNoXg3Itm6Aw-9; Fri, 15 May 2020 13:35:24 +0100
X-MC-Unique: 0o3JdklrP9mNoXg3Itm6Aw-9
Received: from VI1PR1001MB1056.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:800:64::13) by VI1PR1001MB1230.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:800:dd::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3000.25; Fri, 15 May
 2020 12:35:20 +0000
Received: from VI1PR1001MB1056.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::3cc1:941d:635d:99f7]) by VI1PR1001MB1056.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::3cc1:941d:635d:99f7%11]) with mapi id 15.20.3000.016; Fri, 15 May
 2020 12:35:20 +0000
From:   Vladimir Stankovic <vladimir.stankovic@displaylink.com>
To:     gregkh@linuxfoundation.org
Cc:     linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        mausb-host-devel@displaylink.com
Subject: [PATCH v6 7/8] usb: mausb_host: MA-USB PAL events processing
Date:   Fri, 15 May 2020 14:35:01 +0200
Message-Id: <20200515123502.12099-8-vladimir.stankovic@displaylink.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200515123502.12099-1-vladimir.stankovic@displaylink.com>
References: <20200425091954.1610-1-vladimir.stankovic@displaylink.com>
 <20200515123502.12099-1-vladimir.stankovic@displaylink.com>
X-ClientProxiedBy: VI1PR09CA0140.eurprd09.prod.outlook.com
 (2603:10a6:803:12c::24) To VI1PR1001MB1056.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:800:64::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from raven-hp.endava.net (94.189.199.177) by VI1PR09CA0140.eurprd09.prod.outlook.com (2603:10a6:803:12c::24) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3000.25 via Frontend Transport; Fri, 15 May 2020 12:35:19 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [94.189.199.177]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 33fecbec-dbfd-425b-64cd-08d7f8cc6e1a
X-MS-TrafficTypeDiagnostic: VI1PR1001MB1230:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR1001MB12302CF371CF001FF9E6940B91BD0@VI1PR1001MB1230.EURPRD10.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:935;
X-Forefront-PRVS: 04041A2886
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: sQNj9laPUVbO4cf8T6J71PSnlsTEZu/SJ/Jl75saBIG8AyzrxK6RhIbeFUSmh6FqCBcTdp3WSwWR83SReyRKsiZ27T4v1ZOVyiI0RQZmG99z15etZ4fDteCXHmOTfAWVVl6fWYzrqH25ZR5Qm238CENfK90Y88SeccEDWYsJHqwPWbtg8AjG7kaEqQzyytanouzKyS9jVI5KPfpFl++jj890301odkxB6rrK4gbZOAecPeuDKfb2P7HqdhY/taLAOcR+Qqjr5J5CX758SDlYK/SYKXZqALsbuAXtq8lN4DGIjFi0SEb9PSLhIlNYWy/pX8ES+yJJUZyo73ITwr3Zz5ATKpUSyw7tC5GEPgXW4532eLLQKHwTeyIv6i/jliXtBRJXads0tZWuZIOSh1FmapxE+r6FsitEuNUx1hFIHKo76TXttbat1OB8JJ8Ao1VW
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR1001MB1056.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(136003)(396003)(39840400004)(366004)(346002)(376002)(36756003)(86362001)(5660300002)(107886003)(6666004)(66946007)(66476007)(66556008)(2906002)(4326008)(16526019)(956004)(6486002)(8676002)(186003)(8936002)(6512007)(6506007)(30864003)(1076003)(478600001)(26005)(44832011)(6916009)(316002)(2616005)(52116002)(579004)(559001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: mA6a5EGCQAiKtIjd1P6vV8NMVsZmIP0PxfwMknHRROkFcbyvyu7Rv+41pZZIDPzl9yVKD4DXI6twHzZEwXfSflH7nqbnHjcPDRnGTqAnWr2WiHJN293BEDKEKWKKpGVRjs+kGSuJmK86sMZXuaOP6pJokBLo4PMQr/avgodS7Y2P53m3fclFXrqQRGQZ62YKP6KRdoDN0o0hB07P4W8yTTMpLb+0geOtD1l99Ns0XVTnRV9JtdbyAHpXsSjLauS7M3sK8hCXWenR4qEC3StQ0JqQILc+QDKNJ4uHWvvaRwbVDpva6htkAc7gnwUGjcukZVQJdfcjukcvkgpUsldr8vzQoh6Fajo+wpO/P+/fMik1bzLZ3l6oZPpFnvjtAAtqG56PIqF3WI8XxwE/o7dmWRVFUvpiSvfT30EU6BvOwKZzMpEzyj8efcL6IDYa5W+Wd87QEOxWHjzhKhLR9poGiKPJURC00vQV51qiiqmf+Dc=
X-OriginatorOrg: displaylink.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 33fecbec-dbfd-425b-64cd-08d7f8cc6e1a
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2020 12:35:20.2843
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: a4bda75a-b444-4312-9c90-44a7c4b2c91a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +CUB3SQZ5KQG5wzd/PH0FW3l/foVgvC0Nw4+5qikZBfM8y04uLX28nU9jUUMTRFsaLsupF/CuoIffUDfaG0VgWrl0JmlYcL5s7O5WHXnyc5WWrIcndJBEV4L6t22HsQM
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR1001MB1230
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: displaylink.com
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Implemented MA-USB management messages processing and communication
with user-space driver via mapped memory.

MA USB PAL events are being enqueued into ring buffer from which
data is being send/received to/from user-space.

Signed-off-by: Vladimir Stankovic <vladimir.stankovic@displaylink.com>
---
 drivers/usb/host/mausb/Makefile              |   1 +
 drivers/usb/host/mausb/hcd.c                 | 245 +++++++-
 drivers/usb/host/mausb/hpal.c                | 456 +++++++++++++-
 drivers/usb/host/mausb/hpal.h                |  47 +-
 drivers/usb/host/mausb/hpal_events.c         | 614 +++++++++++++++++++
 drivers/usb/host/mausb/hpal_events.h         |  85 +++
 drivers/usb/host/mausb/mausb_driver_status.h |  17 +
 drivers/usb/host/mausb/utils.c               | 270 ++++++++
 drivers/usb/host/mausb/utils.h               |   7 +-
 9 files changed, 1726 insertions(+), 16 deletions(-)
 create mode 100644 drivers/usb/host/mausb/hpal_events.c
 create mode 100644 drivers/usb/host/mausb/hpal_events.h
 create mode 100644 drivers/usb/host/mausb/mausb_driver_status.h

diff --git a/drivers/usb/host/mausb/Makefile b/drivers/usb/host/mausb/Makef=
ile
index 0f9b9be38907..b0423f5d6a14 100644
--- a/drivers/usb/host/mausb/Makefile
+++ b/drivers/usb/host/mausb/Makefile
@@ -11,3 +11,4 @@ mausb_host-y +=3D utils.o
 mausb_host-y +=3D ip_link.o
 mausb_host-y +=3D hcd.o
 mausb_host-y +=3D hpal.o
+mausb_host-y +=3D hpal_events.o
diff --git a/drivers/usb/host/mausb/hcd.c b/drivers/usb/host/mausb/hcd.c
index 26d582ee06e9..b6160c894d25 100644
--- a/drivers/usb/host/mausb/hcd.c
+++ b/drivers/usb/host/mausb/hcd.c
@@ -4,6 +4,9 @@
  */
 #include "hcd.h"
=20
+#include <linux/miscdevice.h>
+
+#include "hpal_events.h"
 #include "utils.h"
=20
 static int mausb_bus_probe(struct device *dev);
@@ -15,9 +18,9 @@ static unsigned int major;
 static unsigned int minor =3D 1;
 static dev_t devt;
 static struct device *device;
-
 struct mausb_hcd=09*mhcd;
 static struct class=09*mausb_class;
+
 static struct bus_type=09mausb_bus_type =3D {
 =09.name=09=3D DEVICE_NAME,
 =09.match=09=3D mausb_bus_match,
@@ -997,6 +1000,17 @@ static void mausb_free_dev(struct usb_hcd *hcd, struc=
t usb_device *dev)
 =09}
=20
 =09if (ep_ctx) {
+=09=09status =3D mausb_epinactivate_event_to_user(ma_dev, dev_handle,
+=09=09=09=09=09=09=09  ep_ctx->ep_handle);
+
+=09=09dev_info(mausb_host_dev.this_device, "epinactivate request ep_handle=
=3D%#x, dev_handle=3D%#x, status=3D%d",
+=09=09=09 ep_ctx->ep_handle, dev_handle, status);
+
+=09=09status =3D mausb_epdelete_event_to_user(ma_dev, dev_handle,
+=09=09=09=09=09=09      ep_ctx->ep_handle);
+=09=09if (status < 0)
+=09=09=09dev_warn(mausb_host_dev.this_device, "ep_handle_del request faile=
d for ep0: ep_handle=3D%#x, dev_handle=3D%#x",
+=09=09=09=09 ep_ctx->ep_handle, dev_handle);
 =09=09dev->ep0.hcpriv =3D NULL;
 =09=09kfree(ep_ctx);
 =09} else {
@@ -1004,6 +1018,14 @@ static void mausb_free_dev(struct usb_hcd *hcd, stru=
ct usb_device *dev)
 =09=09=09 dev_handle);
 =09}
=20
+=09if (dev_handle !=3D DEV_HANDLE_NOT_ASSIGNED) {
+=09=09status =3D mausb_usbdevdisconnect_event_to_user(ma_dev,
+=09=09=09=09=09=09=09      dev_handle);
+=09=09if (status < 0)
+=09=09=09dev_warn(mausb_host_dev.this_device, "usb_dev_disconnect req fail=
ed for dev_handle=3D%#x",
+=09=09=09=09 dev_handle);
+=09}
+
 free_dev:
 =09if (atomic_sub_and_test(1, &ma_dev->num_of_usb_devices)) {
 =09=09dev_info(mausb_host_dev.this_device, "All usb devices destroyed - pr=
oceed with disconnecting");
@@ -1019,6 +1041,22 @@ static void mausb_free_dev(struct usb_hcd *hcd, stru=
ct usb_device *dev)
 =09=09mausb_clear_hcd_madev(port_number);
 }
=20
+static int mausb_device_assign_address(struct mausb_device *dev,
+=09=09=09=09       struct mausb_usb_device_ctx *usb_dev_ctx)
+{
+=09int status =3D
+=09=09mausb_setusbdevaddress_event_to_user(dev,
+=09=09=09=09=09=09     usb_dev_ctx->dev_handle,
+=09=09=09=09=09=09     RESPONSE_TIMEOUT);
+
+=09dev_info(mausb_host_dev.this_device, "dev_handle=3D%#x, status=3D%d",
+=09=09 usb_dev_ctx->dev_handle, status);
+
+=09usb_dev_ctx->addressed =3D (status =3D=3D 0);
+
+=09return status;
+}
+
 static struct mausb_usb_device_ctx *
 mausb_alloc_device_ctx(struct hub_ctx *hub, struct usb_device *dev,
 =09=09       struct mausb_device *ma_dev, u16 port_number,
@@ -1101,6 +1139,12 @@ static int mausb_address_device(struct usb_hcd *hcd,=
 struct usb_device *dev)
 =09=09=09return status;
 =09}
=20
+=09if (!usb_device_ctx->addressed) {
+=09=09status =3D mausb_device_assign_address(ma_dev, usb_device_ctx);
+=09=09if (status < 0)
+=09=09=09return status;
+=09}
+
 =09endpoint_ctx =3D dev->ep0.hcpriv;
 =09if (!endpoint_ctx) {
 =09=09dev_err(&dev->dev, "endpoint_ctx is NULL: dev_handle=3D%#x",
@@ -1108,7 +1152,18 @@ static int mausb_address_device(struct usb_hcd *hcd,=
 struct usb_device *dev)
 =09=09return -EINVAL;
 =09}
=20
-=09return 0;
+=09if (dev->speed < USB_SPEED_SUPER && endpoint_ctx->ep_handle !=3D 0)
+=09=09return 0;
+
+=09status =3D mausb_modifyep0_event_to_user(ma_dev,
+=09=09=09=09=09       usb_device_ctx->dev_handle,
+=09=09=09=09=09       &endpoint_ctx->ep_handle,
+=09=09=09=09=09       dev->ep0.desc.wMaxPacketSize);
+
+=09dev_info(&dev->dev, "modify ep0 response, ep_handle=3D%#x, dev_handle=
=3D%#x, status=3D%d",
+=09=09 endpoint_ctx->ep_handle, endpoint_ctx->dev_handle, status);
+
+=09return status;
 }
=20
 static int mausb_add_endpoint(struct usb_hcd *hcd, struct usb_device *dev,
@@ -1160,10 +1215,32 @@ static int mausb_add_endpoint(struct usb_hcd *hcd, =
struct usb_device *dev,
 =09=09mausb_init_superspeed_ep_descriptor(&descriptor_ss,
 =09=09=09=09=09=09    &endpoint->desc,
 =09=09=09=09=09=09    &endpoint->ss_ep_comp);
+=09=09status =3D mausb_ephandle_event_to_user(ma_dev,
+=09=09=09=09=09=09      usb_dev_ctx->dev_handle,
+=09=09=09=09=09=09      sizeof(descriptor_ss),
+=09=09=09=09=09=09      &descriptor_ss,
+=09=09=09=09=09=09      &endpoint_ctx->ep_handle);
+
 =09} else {
 =09=09mausb_init_standard_ep_descriptor(&descriptor, &endpoint->desc);
+=09=09status =3D mausb_ephandle_event_to_user(ma_dev,
+=09=09=09=09=09=09      usb_dev_ctx->dev_handle,
+=09=09=09=09=09=09      sizeof(descriptor),
+=09=09=09=09=09=09      &descriptor,
+=09=09=09=09=09=09      &endpoint_ctx->ep_handle);
 =09}
=20
+=09if (status < 0) {
+=09=09dev_err(&dev->dev, "ep_handle_request failed dev_handle=3D%#x",
+=09=09=09usb_dev_ctx->dev_handle);
+=09=09endpoint->hcpriv =3D NULL;
+=09=09kfree(endpoint_ctx);
+=09=09return status;
+=09}
+
+=09dev_info(&dev->dev, "Endpoint added ep_handle=3D%#x, dev_handle=3D%#x",
+=09=09 endpoint_ctx->ep_handle, endpoint_ctx->dev_handle);
+
 =09return 0;
 }
=20
@@ -1172,6 +1249,7 @@ static int mausb_drop_endpoint(struct usb_hcd *hcd, s=
truct usb_device *dev,
 {
 =09u8=09port_number;
 =09int=09status;
+=09int=09retries=09    =3D 0;
 =09struct hub_ctx=09=09    *hub =3D (struct hub_ctx *)hcd->hcd_priv;
 =09struct mausb_device=09    *ma_dev;
 =09struct mausb_usb_device_ctx *usb_dev_ctx;
@@ -1206,9 +1284,48 @@ static int mausb_drop_endpoint(struct usb_hcd *hcd, =
struct usb_device *dev,
 =09=09return -ENODEV;
 =09}
=20
+=09dev_info(&dev->dev, "Start dropping ep_handle=3D%#x, dev_handle=3D%#x",
+=09=09 endpoint_ctx->ep_handle, endpoint_ctx->dev_handle);
+
+=09if (atomic_read(&ma_dev->unresponsive_client)) {
+=09=09dev_err(&dev->dev, "Client is not responsive anymore - drop endpoint=
 immediately");
+=09=09endpoint->hcpriv =3D NULL;
+=09=09kfree(endpoint_ctx);
+=09=09return -ESHUTDOWN;
+=09}
+
+=09status =3D mausb_epinactivate_event_to_user(ma_dev,
+=09=09=09=09=09=09  usb_dev_ctx->dev_handle,
+=09=09=09=09=09=09  endpoint_ctx->ep_handle);
+
+=09dev_info(&dev->dev, "epinactivate request ep_handle=3D%#x, dev_handle=
=3D%#x, status=3D%d",
+=09=09 endpoint_ctx->ep_handle, endpoint_ctx->dev_handle, status);
+
+=09while (true) {
+=09=09status =3D mausb_epdelete_event_to_user(ma_dev,
+=09=09=09=09=09=09      usb_dev_ctx->dev_handle,
+=09=09=09=09=09=09      endpoint_ctx->ep_handle);
+
+=09=09dev_info(&dev->dev, "ep_handle_delete_request, ep_handle=3D%#x, dev_=
handle=3D%#x, status=3D%d",
+=09=09=09 endpoint_ctx->ep_handle, endpoint_ctx->dev_handle,
+=09=09=09 status);
+
+=09=09if (status =3D=3D -EBUSY) {
+=09=09=09if (++retries < MAUSB_BUSY_RETRIES_COUNT)
+=09=09=09=09usleep_range(10000, 10001);
+=09=09=09else
+=09=09=09=09return -EBUSY;
+=09=09} else {
+=09=09=09break;
+=09=09}
+=09}
+
+=09dev_info(&dev->dev, "Endpoint dropped ep_handle=3D%#x, dev_handle=3D%#x=
",
+=09=09 endpoint_ctx->ep_handle, endpoint_ctx->dev_handle);
+
 =09endpoint->hcpriv =3D NULL;
 =09kfree(endpoint_ctx);
-=09return 0;
+=09return status;
 }
=20
 static int mausb_device_assign_dev_handle(struct usb_hcd *hcd,
@@ -1261,6 +1378,22 @@ static int mausb_device_assign_dev_handle(struct usb=
_hcd *hcd,
 =09=09return -EINVAL;
 =09}
=20
+=09status =3D mausb_usbdevhandle_event_to_user(ma_dev, (u8)dev_speed,
+=09=09=09=09=09=09  dev->route, hub_dev_handle,
+=09=09=09=09=09=09  parent_hs_hub_dev_handle,
+=09=09=09=09=09=09  parent_hs_hub_port, 0,
+=09=09=09=09=09=09  ma_dev->lse,
+=09=09=09=09=09=09  &usb_device_ctx->dev_handle);
+
+=09dev_dbg(mausb_host_dev.this_device, "mausb_usbdevhandle_event status=3D=
%d",
+=09=09status);
+
+=09if (status < 0)
+=09=09return status;
+
+=09dev_vdbg(mausb_host_dev.this_device, "dev_handle=3D%#x",
+=09=09 usb_device_ctx->dev_handle);
+
 =09endpoint_ctx =3D kzalloc(sizeof(*endpoint_ctx), GFP_ATOMIC);
 =09if (!endpoint_ctx)
 =09=09return -ENOMEM;
@@ -1272,6 +1405,21 @@ static int mausb_device_assign_dev_handle(struct usb=
_hcd *hcd,
=20
 =09mausb_init_standard_ep_descriptor(&descriptor, &dev->ep0.desc);
=20
+=09status =3D mausb_ephandle_event_to_user(ma_dev,
+=09=09=09=09=09      usb_device_ctx->dev_handle,
+=09=09=09=09=09      sizeof(descriptor),
+=09=09=09=09=09      &descriptor,
+=09=09=09=09=09      &endpoint_ctx->ep_handle);
+
+=09dev_info(mausb_host_dev.this_device, "mausb_ephandle_event ep_handle=3D=
%#x, dev_handle=3D%#x, status=3D%d",
+=09=09 endpoint_ctx->ep_handle, endpoint_ctx->dev_handle, status);
+
+=09if (status < 0) {
+=09=09dev->ep0.hcpriv =3D NULL;
+=09=09kfree(endpoint_ctx);
+=09=09return status;
+=09}
+
 =09return 0;
 }
=20
@@ -1315,6 +1463,12 @@ static int mausb_enable_device(struct usb_hcd *hcd, =
struct usb_device *dev)
 =09if (usb_device_ctx->dev_handle =3D=3D DEV_HANDLE_NOT_ASSIGNED)
 =09=09return mausb_device_assign_dev_handle(hcd, dev, hub, ma_dev,
 =09=09=09=09=09=09      usb_device_ctx);
+
+=09if (!usb_device_ctx->addressed)
+=09=09return mausb_device_assign_address(ma_dev, usb_device_ctx);
+
+=09dev_info(mausb_host_dev.this_device, "Device assigned and addressed dev=
_handle=3D%#x",
+=09=09 usb_device_ctx->dev_handle);
 =09return 0;
 }
=20
@@ -1360,7 +1514,15 @@ static int mausb_update_device(struct usb_hcd *hcd, =
struct usb_device *dev)
 =09=09return -ENODEV;
 =09}
=20
-=09return 0;
+=09status =3D mausb_updatedev_event_to_user(ma_dev,
+=09=09=09=09=09       usb_device_ctx->dev_handle,
+=09=09=09=09=09       0, 0, 0, 0, 0, 0,
+=09=09=09=09=09       &dev->descriptor);
+
+=09dev_info(mausb_host_dev.this_device, "Finished dev_handle=3D%#x, status=
=3D%d",
+=09=09 usb_device_ctx->dev_handle, status);
+
+=09return status;
 }
=20
 static int mausb_hub_update_device(struct usb_hcd *hcd, struct usb_device =
*dev,
@@ -1370,8 +1532,10 @@ static int mausb_hub_update_device(struct usb_hcd *h=
cd, struct usb_device *dev,
 =09u8=09port_number;
 =09unsigned long flags;
 =09u16 max_exit_latency =3D 0;
+=09u8  number_of_ports =3D (u8)dev->maxchild;
 =09u8  mtt =3D 0;
 =09u8  ttt =3D 0;
+=09u8  integrated_hub_latency =3D 0;
 =09struct hub_ctx=09=09    *hub =3D (struct hub_ctx *)hcd->hcd_priv;
 =09struct mausb_device=09    *ma_dev;
 =09struct mausb_usb_device_ctx *usb_device_ctx;
@@ -1411,7 +1575,17 @@ static int mausb_hub_update_device(struct usb_hcd *h=
cd, struct usb_device *dev,
 =09else if (dev->usb3_lpm_u2_enabled)
 =09=09max_exit_latency =3D (u16)dev->u2_params.mel;
=20
-=09return 0;
+=09status =3D mausb_updatedev_event_to_user(ma_dev,
+=09=09=09=09=09       usb_device_ctx->dev_handle,
+=09=09=09=09=09       max_exit_latency, 1,
+=09=09=09=09=09       number_of_ports, mtt, ttt,
+=09=09=09=09=09       integrated_hub_latency,
+=09=09=09=09=09       &dev->descriptor);
+
+=09dev_info(mausb_host_dev.this_device, "Finished dev_handle=3D%#x, status=
=3D%d",
+=09=09 usb_device_ctx->dev_handle, status);
+
+=09return status;
 }
=20
 static void mausb_endpoint_reset(struct usb_hcd *hcd,
@@ -1430,6 +1604,8 @@ static void mausb_endpoint_reset(struct usb_hcd *hcd,
 =09struct mausb_usb_device_ctx *usb_device_ctx;
 =09struct usb_device=09    *dev;
 =09struct mausb_endpoint_ctx   *ep_ctx;
+=09struct ma_usb_ephandlereq_desc_ss  descriptor_ss;
+=09struct ma_usb_ephandlereq_desc_std descriptor;
=20
 =09ep_ctx =3D endpoint->hcpriv;
 =09if (!ep_ctx)
@@ -1462,6 +1638,15 @@ static void mausb_endpoint_reset(struct usb_hcd *hcd=
,
 =09is_out =3D usb_endpoint_dir_out(&endpoint->desc);
 =09tsp =3D (u8)(is_out ? dev->toggle[1] : dev->toggle[0]);
=20
+=09status =3D mausb_epreset_event_to_user(ma_dev, dev_handle,
+=09=09=09=09=09     ep_ctx->ep_handle, tsp);
+
+=09dev_info(&dev->dev, "ep_reset status=3D%d, ep_handle=3D%#x, dev_handle=
=3D%#x",
+=09=09 status, ep_ctx->ep_handle, dev_handle);
+
+=09if (status < 0)
+=09=09return;
+
 =09if (status !=3D EUCLEAN) {
 =09=09if (!tsp) {
 =09=09=09usb_settoggle(dev, epnum, is_out, 0U);
@@ -1469,12 +1654,52 @@ static void mausb_endpoint_reset(struct usb_hcd *hc=
d,
 =09=09=09=09usb_settoggle(dev, epnum, !is_out, 0U);
 =09=09}
=20
+=09=09status =3D mausb_epactivate_event_to_user(ma_dev, dev_handle,
+=09=09=09=09=09=09=09ep_ctx->ep_handle);
+
+=09=09dev_err(&dev->dev, "ep_activate failed, status=3D%d, ep_handle=3D%#x=
, dev_handle=3D%#x",
+=09=09=09status, ep_ctx->ep_handle, dev_handle);
+
 =09=09return;
 =09}
=20
 =09if (tsp)
 =09=09return;
=20
+=09status =3D mausb_epinactivate_event_to_user(ma_dev, dev_handle,
+=09=09=09=09=09=09  ep_ctx->ep_handle);
+
+=09dev_info(&dev->dev, "ep_inactivate status=3D%d, ep_handle=3D%#x, dev_ha=
ndle=3D%#x",
+=09=09 status, ep_ctx->ep_handle, dev_handle);
+
+=09if (status < 0)
+=09=09return;
+
+=09status =3D mausb_epdelete_event_to_user(ma_dev, dev_handle,
+=09=09=09=09=09      ep_ctx->ep_handle);
+
+=09dev_info(&dev->dev, "ep_handle_delete status=3D%d, ep_handle=3D%#x, dev=
_handle=3D%#x",
+=09=09 status, ep_ctx->ep_handle, dev_handle);
+
+=09if (status < 0)
+=09=09return;
+
+=09if (dev->speed >=3D USB_SPEED_SUPER) {
+=09=09mausb_init_superspeed_ep_descriptor(&descriptor_ss,
+=09=09=09=09=09=09    &endpoint->desc,
+=09=09=09=09=09=09    &endpoint->ss_ep_comp);
+=09=09status =3D mausb_ephandle_event_to_user(ma_dev, dev_handle,
+=09=09=09=09=09=09      sizeof(descriptor_ss),
+=09=09=09=09=09=09      &descriptor_ss,
+=09=09=09=09=09=09      &ep_ctx->ep_handle);
+=09} else {
+=09=09mausb_init_standard_ep_descriptor(&descriptor, &endpoint->desc);
+=09=09status =3D mausb_ephandle_event_to_user(ma_dev, dev_handle,
+=09=09=09=09=09=09      sizeof(descriptor),
+=09=09=09=09=09=09      &descriptor,
+=09=09=09=09=09=09      &ep_ctx->ep_handle);
+=09}
+
 =09dev_info(&dev->dev, "ep_handle request status=3D%d, ep_handle=3D%#x, de=
v_handle=3D%#x",
 =09=09 status, ep_ctx->ep_handle, dev_handle);
 }
@@ -1516,7 +1741,15 @@ static int mausb_reset_device(struct usb_hcd *hcd, s=
truct usb_device *dev)
=20
 =09dev_handle =3D usb_device_ctx->dev_handle;
=20
-=09return 0;
+=09status =3D mausb_usbdevreset_event_to_user(ma_dev, dev_handle);
+
+=09dev_info(mausb_host_dev.this_device, "usb_dev_reset dev_handle=3D%#x, s=
tatus=3D%d",
+=09=09 dev_handle, status);
+
+=09if (status =3D=3D 0)
+=09=09usb_device_ctx->addressed =3D false;
+
+=09return status;
 }
=20
 void mausb_clear_hcd_madev(u16 port_number)
diff --git a/drivers/usb/host/mausb/hpal.c b/drivers/usb/host/mausb/hpal.c
index be600e8c30ec..19d74ffb1610 100644
--- a/drivers/usb/host/mausb/hpal.c
+++ b/drivers/usb/host/mausb/hpal.c
@@ -7,6 +7,7 @@
 #include <linux/circ_buf.h>
=20
 #include "hcd.h"
+#include "hpal_events.h"
 #include "utils.h"
=20
 #define MAUSB_DELETE_MADEV_TIMEOUT_MS 3000
@@ -275,6 +276,31 @@ void mausb_release_event_resources(struct mausb_event =
*event)
 =09kfree(receive_buffer);
 }
=20
+static void mausb_iterator_reset(struct mausb_device *dev,
+=09=09=09=09 struct mausb_event *event)
+{
+=09struct urb=09     *urb =3D (struct urb *)event->data.urb;
+=09struct mausb_urb_ctx *urb_ctx;
+
+=09urb_ctx =3D mausb_find_urb_in_tree(urb);
+
+=09if (urb_ctx)
+=09=09mausb_reset_data_iterator(&urb_ctx->iterator);
+}
+
+static void mausb_iterator_seek(struct mausb_device *dev,
+=09=09=09=09struct mausb_event *event)
+{
+=09struct urb=09     *urb =3D (struct urb *)event->data.urb;
+=09struct mausb_urb_ctx *urb_ctx;
+
+=09urb_ctx =3D mausb_find_urb_in_tree(urb);
+
+=09if (urb_ctx)
+=09=09mausb_data_iterator_seek(&urb_ctx->iterator,
+=09=09=09=09=09 event->data.iterator_seek_delta);
+}
+
 void mausb_complete_urb(struct mausb_event *event)
 {
 =09struct urb *urb =3D (struct urb *)event->data.urb;
@@ -288,6 +314,48 @@ void mausb_complete_urb(struct mausb_event *event)
 =09=09=09       event->status);
 }
=20
+static void mausb_delete_ma_dev(struct mausb_device *dev,
+=09=09=09=09struct mausb_event *event)
+{
+=09mausb_signal_event(dev, event, event->mgmt.delete_ma_dev.event_id);
+}
+
+static void mausb_process_user_finished(struct mausb_device *dev,
+=09=09=09=09=09struct mausb_event *event)
+{
+=09complete(&dev->user_finished_event);
+}
+
+static int mausb_send_mgmt_msg(struct mausb_device *dev,
+=09=09=09       struct mausb_event *event)
+{
+=09struct mausb_kvec_data_wrapper wrapper;
+=09struct kvec kvec;
+=09struct ma_usb_hdr_common *hdr;
+=09int status;
+
+=09hdr =3D (struct ma_usb_hdr_common *)event->mgmt.mgmt_hdr.hdr;
+
+=09dev_info(mausb_host_dev.this_device, "Sending event=3D%d, type=3D%d",
+=09=09 event->type, hdr->type);
+
+=09kvec.iov_base=09 =3D hdr;
+=09kvec.iov_len=09 =3D hdr->length;
+=09wrapper.kvec=09 =3D &kvec;
+=09wrapper.kvec_num =3D 1;
+=09wrapper.length=09 =3D hdr->length;
+
+=09status =3D mausb_ip_send(dev->mgmt_channel, &wrapper);
+=09if (status < 0) {
+=09=09dev_err(mausb_host_dev.this_device, "Send failed. Disconnecting... s=
tatus=3D%d",
+=09=09=09status);
+=09=09queue_work(dev->workq, &dev->socket_disconnect_work);
+=09=09queue_work(dev->workq, &dev->hcd_disconnect_work);
+=09}
+
+=09return status;
+}
+
 static int mausb_get_first_free_port_number(u16 *port_number)
 {
 =09(*port_number) =3D 0;
@@ -335,11 +403,144 @@ static inline void mausb_port_has_changed_event(stru=
ct mausb_device *dev,
 =09=09mausb_port_has_changed(USB20HUB, HIGH_SPEED, dev);
 }
=20
+static void mausb_complete_timeout_event(struct mausb_device *dev,
+=09=09=09=09=09 struct mausb_event *event)
+{
+=09dev_vdbg(mausb_host_dev.this_device, "Event type=3D%d, event_id=3D%llu"=
,
+=09=09 event->type, event->mgmt.mgmt_req_timedout.event_id);
+=09mausb_signal_event(dev, event, event->mgmt.mgmt_req_timedout.event_id);
+}
+
+static void mausb_process_event(struct mausb_device *dev,
+=09=09=09=09struct mausb_event *event)
+{
+=09dev_vdbg(mausb_host_dev.this_device, "Process event of type=3D%d",
+=09=09 event->type);
+
+=09switch (event->type) {
+=09case MAUSB_EVENT_TYPE_USB_DEV_HANDLE:
+=09=09mausb_usbdevhandle_event_from_user(dev, event);
+=09=09break;
+=09case MAUSB_EVENT_TYPE_EP_HANDLE:
+=09=09mausb_ephandle_event_from_user(dev, event);
+=09=09break;
+=09case MAUSB_EVENT_TYPE_EP_HANDLE_ACTIVATE:
+=09=09mausb_epactivate_event_from_user(dev, event);
+=09=09break;
+=09case MAUSB_EVENT_TYPE_EP_HANDLE_INACTIVATE:
+=09=09mausb_epinactivate_event_from_user(dev, event);
+=09=09break;
+=09case MAUSB_EVENT_TYPE_EP_HANDLE_RESET:
+=09=09mausb_epreset_event_from_user(dev, event);
+=09=09break;
+=09case MAUSB_EVENT_TYPE_EP_HANDLE_DELETE:
+=09=09mausb_epdelete_event_from_user(dev, event);
+=09=09break;
+=09case MAUSB_EVENT_TYPE_MODIFY_EP0:
+=09=09mausb_modifyep0_event_from_user(dev, event);
+=09=09break;
+=09case MAUSB_EVENT_TYPE_SET_USB_DEV_ADDRESS:
+=09=09mausb_setusbdevaddress_event_from_user(dev, event);
+=09=09break;
+=09case MAUSB_EVENT_TYPE_UPDATE_DEV:
+=09=09mausb_updatedev_event_from_user(dev, event);
+=09=09break;
+=09case MAUSB_EVENT_TYPE_USB_DEV_RESET:
+=09=09mausb_usbdevreset_event_from_user(dev, event);
+=09=09break;
+=09case MAUSB_EVENT_TYPE_CANCEL_TRANSFER:
+=09=09mausb_canceltransfer_event_from_user(dev, event);
+=09=09break;
+=09case MAUSB_EVENT_TYPE_PORT_CHANGED:
+=09=09mausb_port_has_changed_event(dev, event);
+=09=09break;
+=09case MAUSB_EVENT_TYPE_PING:
+=09=09mausb_send_mgmt_msg(dev, event);
+=09=09break;
+=09case MAUSB_EVENT_TYPE_SEND_MGMT_MSG:
+=09=09mausb_send_mgmt_msg(dev, event);
+=09=09break;
+=09case MAUSB_EVENT_TYPE_SEND_DATA_MSG:
+=09=09mausb_send_data_msg(dev, event);
+=09=09break;
+=09case MAUSB_EVENT_TYPE_RECEIVED_DATA_MSG:
+=09=09mausb_receive_data_msg(dev, event);
+=09=09break;
+=09case MAUSB_EVENT_TYPE_URB_COMPLETE:
+=09=09mausb_complete_urb(event);
+=09=09break;
+=09case MAUSB_EVENT_TYPE_SEND_ACK:
+=09=09mausb_send_transfer_ack(dev, event);
+=09=09mausb_release_event_resources(event);
+=09=09break;
+=09case MAUSB_EVENT_TYPE_ITERATOR_RESET:
+=09=09mausb_iterator_reset(dev, event);
+=09=09break;
+=09case MAUSB_EVENT_TYPE_ITERATOR_SEEK:
+=09=09mausb_iterator_seek(dev, event);
+=09=09break;
+=09case MAUSB_EVENT_TYPE_DELETE_MA_DEV:
+=09=09mausb_delete_ma_dev(dev, event);
+=09=09break;
+=09case MAUSB_EVENT_TYPE_USER_FINISHED:
+=09=09mausb_process_user_finished(dev, event);
+=09=09break;
+=09case MAUSB_EVENT_TYPE_RELEASE_EVENT_RESOURCES:
+=09=09mausb_release_event_resources(event);
+=09=09break;
+=09case MAUSB_EVENT_TYPE_NONE:
+=09=09mausb_release_event_resources(event);
+=09=09break;
+=09case MAUSB_EVENT_TYPE_MGMT_REQUEST_TIMED_OUT:
+=09=09mausb_complete_timeout_event(dev, event);
+=09=09break;
+=09default:
+=09=09break;
+=09}
+
+=09mausb_notify_completed_user_events(dev->ring_buffer);
+}
+
+static void mausb_hpal_kernel_work(struct work_struct *work)
+{
+=09struct mausb_device *dev =3D container_of(work, struct mausb_device,
+=09=09=09=09=09=09work);
+=09struct mausb_event *event;
+=09int status;
+=09u16 i;
+=09u16 events;
+=09u16 completed_events;
+=09unsigned long flags;
+=09struct mausb_ring_buffer *dev_mausb_ring =3D dev->ring_buffer;
+
+=09spin_lock_irqsave(&dev->num_of_user_events_lock, flags);
+=09events =3D dev->num_of_user_events;
+=09completed_events =3D dev->num_of_completed_events;
+=09dev->num_of_user_events =3D 0;
+=09dev->num_of_completed_events =3D 0;
+=09spin_unlock_irqrestore(&dev->num_of_user_events_lock, flags);
+
+=09status =3D mausb_ring_buffer_move_tail(dev_mausb_ring, completed_events=
);
+=09if (status < 0) {
+=09=09dev_err(mausb_host_dev.this_device, "Dequeue failed, status=3D%d",
+=09=09=09status);
+=09=09kref_put(&dev->refcount, mausb_release_ma_dev_async);
+=09=09return;
+=09}
+
+=09for (i =3D 0; i < events; ++i) {
+=09=09event =3D mausb_ring_current_from_user(dev_mausb_ring);
+=09=09mausb_ring_next_from_user(dev_mausb_ring);
+=09=09mausb_process_event(dev, event);
+=09}
+}
+
 static void mausb_socket_disconnect_event(struct work_struct *work)
 {
 =09struct mausb_device *dev =3D container_of(work, struct mausb_device,
 =09=09=09=09=09=09socket_disconnect_work);
 =09struct mausb_event event;
+=09int status;
=20
 =09dev_info(mausb_host_dev.this_device, "Disconnect madev_addr=3D%d",
 =09=09 dev->madev_addr);
@@ -361,6 +562,11 @@ static void mausb_socket_disconnect_event(struct work_=
struct *work)
 =09=09event.type =3D MAUSB_EVENT_TYPE_NETWORK_DISCONNECTED;
 =09=09event.data.device_id =3D dev->id;
=20
+=09=09status =3D mausb_enqueue_event_to_user(dev, &event);
+
+=09=09dev_info(mausb_host_dev.this_device, "Network disconnected notificat=
ion sent status=3D%d",
+=09=09=09 status);
+
 =09=09dev_info(mausb_host_dev.this_device, "Releasing MAUSB device ref");
 =09=09kref_put(&dev->refcount, mausb_release_ma_dev_async);
 =09}
@@ -426,6 +632,13 @@ static void mausb_delete_madev(struct work_struct *wor=
k)
=20
 =09=09mausb_insert_event(dev, &mausb_completion);
=20
+=09=09status =3D mausb_enqueue_event_to_user(dev, &event);
+=09=09if (status < 0) {
+=09=09=09mausb_remove_event(dev, &mausb_completion);
+=09=09=09dev_err(mausb_host_dev.this_device, "Ring buffer full, enqueue fa=
iled");
+=09=09=09return;
+=09=09}
+
 =09=09dev_dbg(mausb_host_dev.this_device, "Deleting MAUSB device...");
=20
 =09=09status =3D wait_for_completion_interruptible_timeout(&completion,
@@ -449,10 +662,14 @@ static void mausb_delete_madev(struct work_struct *wo=
rk)
=20
 =09mausb_clear_hcd_madev(dev->port_number);
=20
+=09mausb_ring_buffer_cleanup(dev->ring_buffer);
+=09mausb_ring_buffer_destroy(dev->ring_buffer);
+
 =09mausb_remove_madev_from_list(dev->madev_addr);
=20
 =09put_net(dev->net_ns);
=20
+=09kfree(dev->ring_buffer);
 =09kfree(dev);
 =09mausb_signal_empty_mss();
=20
@@ -463,6 +680,7 @@ static void mausb_ping_work(struct work_struct *work)
 {
 =09struct mausb_device *dev =3D container_of(work, struct mausb_device,
 =09=09=09=09=09=09ping_work);
+=09int status =3D 0;
=20
 =09if (mausb_start_connection_timer(dev) < 0) {
 =09=09dev_err(mausb_host_dev.this_device, "Session timeout - disconnnectin=
g device madev_addr=3D%d",
@@ -471,6 +689,12 @@ static void mausb_ping_work(struct work_struct *work)
 =09=09queue_work(dev->workq, &dev->hcd_disconnect_work);
 =09=09return;
 =09}
+
+=09status =3D mausb_ping_event_to_user(dev);
+=09if (status < 0) {
+=09=09dev_err(mausb_host_dev.this_device, "Ring buffer full");
+=09=09return;
+=09}
 }
=20
 static void mausb_heartbeat_work(struct work_struct *work)
@@ -576,6 +800,7 @@ mausb_create_madev(struct mausb_device_address dev_addr=
, u8 madev_address,
=20
 =09dev->workq =3D workq;
=20
+=09INIT_WORK(&dev->work, mausb_hpal_kernel_work);
 =09INIT_WORK(&dev->socket_disconnect_work, mausb_socket_disconnect_event);
 =09INIT_WORK(&dev->hcd_disconnect_work, mausb_hcd_disconnect_event);
 =09INIT_WORK(&dev->madev_delete_work, mausb_delete_madev);
@@ -601,6 +826,15 @@ mausb_create_madev(struct mausb_device_address dev_add=
r, u8 madev_address,
 =09dev->madev_addr =3D madev_address;
 =09dev->net_ns =3D get_net(current->nsproxy->net_ns);
=20
+=09if (!list_empty(&mss.available_ring_buffers)) {
+=09=09dev->ring_buffer =3D container_of(mss.available_ring_buffers.next,
+=09=09=09=09=09=09struct mausb_ring_buffer,
+=09=09=09=09=09=09list_entry);
+=09=09list_del(mss.available_ring_buffers.next);
+=09} else {
+=09=09dev_alert(mausb_host_dev.this_device, "Ring buffer for mausb device =
is not available!");
+=09}
+
 =09list_add_tail(&dev->list_entry, &mss.madev_list);
=20
 =09reinit_completion(&mss.empty);
@@ -660,6 +894,14 @@ int mausb_initiate_dev_connection(struct mausb_device_=
address dev_addr,
 =09return 0;
 }
=20
+void mausb_on_madev_connected(struct mausb_device *dev)
+{
+=09struct mausb_event mausb_event;
+
+=09mausb_dev_reset_req_event(&mausb_event);
+=09mausb_enqueue_event_to_user(dev, &mausb_event);
+}
+
 int mausb_enqueue_event_from_user(u8 madev_addr, u16 num_of_events,
 =09=09=09=09  u16 num_of_completed)
 {
@@ -684,9 +926,29 @@ int mausb_enqueue_event_from_user(u8 madev_addr, u16 n=
um_of_events,
 =09return 0;
 }
=20
+int mausb_enqueue_event_to_user(struct mausb_device *dev,
+=09=09=09=09struct mausb_event *event)
+{
+=09int status;
+
+=09event->madev_addr =3D dev->madev_addr;
+=09status =3D mausb_ring_buffer_put(dev->ring_buffer, event);
+=09if (status < 0) {
+=09=09dev_err(mausb_host_dev.this_device, "Ring buffer operation failed");
+=09=09mausb_cleanup_ring_buffer_event(event);
+=09=09return status;
+=09}
+
+=09mausb_notify_ring_events(dev->ring_buffer);
+=09dev_vdbg(mausb_host_dev.this_device, "User-space notification sent.");
+
+=09return 0;
+}
+
 int mausb_data_req_enqueue_event(struct mausb_device *dev, u16 ep_handle,
 =09=09=09=09 struct urb *request)
 {
+=09int status;
 =09struct mausb_event mausb_event;
=20
 =09mausb_event.type   =3D MAUSB_EVENT_TYPE_SEND_DATA_MSG;
@@ -729,7 +991,12 @@ int mausb_data_req_enqueue_event(struct mausb_device *=
dev, u16 ep_handle,
 =09=09       &request->dev->route, sizeof(request->dev->route));
 =09}
=20
-=09return 0;
+=09status =3D mausb_enqueue_event_to_user(dev, &mausb_event);
+=09if (status < 0)
+=09=09dev_err(&request->dev->dev, "Failed to enqueue event to user-space e=
p_handle=3D%#x, status=3D%d",
+=09=09=09mausb_event.data.ep_handle, status);
+
+=09return status;
 }
=20
 void mausb_complete_request(struct urb *urb, u32 actual_length, int status=
)
@@ -842,6 +1109,17 @@ static void mausb_execute_urb_dequeue(struct work_str=
uct *dequeue_work)
 =09dev_vdbg(mausb_host_dev.this_device, "urb=3D%p, ep_handle=3D%#x, dev_ha=
ndle=3D%#x",
 =09=09 urb, ep_ctx->ep_handle, ep_ctx->dev_handle);
=20
+=09if (!usb_endpoint_xfer_isoc(&urb->ep->desc)) {
+=09=09status =3D mausb_canceltransfer_event_to_user(ep_ctx->ma_dev,
+=09=09=09=09=09=09=09    ep_ctx->dev_handle,
+=09=09=09=09=09=09=09    ep_ctx->ep_handle,
+=09=09=09=09=09=09=09    (uintptr_t)urb);
+=09=09if (status < 0) {
+=09=09=09dev_err(mausb_host_dev.this_device, "Failed to enqueue cancel tra=
nsfer to user");
+=09=09=09goto complete_urb;
+=09=09}
+=09}
+
 =09memset(&mausb_event, 0, sizeof(mausb_event));
=20
 =09mausb_event.type   =3D MAUSB_EVENT_TYPE_DELETE_DATA_TRANSFER;
@@ -856,6 +1134,13 @@ static void mausb_execute_urb_dequeue(struct work_str=
uct *dequeue_work)
 =09=09=09=09=09=09MAUSB_DATA_MSG_DIRECTION_IN :
 =09=09=09=09=09=09MAUSB_DATA_MSG_DIRECTION_OUT);
=20
+=09status =3D mausb_enqueue_event_to_user(ep_ctx->ma_dev, &mausb_event);
+=09if (status < 0) {
+=09=09dev_alert(mausb_host_dev.this_device, "Failed to enqueue event to us=
er-space ep_handle=3D%#x, status=3D%d",
+=09=09=09  mausb_event.data.ep_handle, status);
+=09=09goto complete_urb;
+=09}
+
 =09if (!mausb_return_urb_ctx_to_tree(urb_ctx, false)) {
 =09=09dev_alert(mausb_host_dev.this_device, "Failed to insert in tree urb=
=3D%p ep_handle=3D%#x, status=3D%d",
 =09=09=09  urb, mausb_event.data.ep_handle, status);
@@ -917,6 +1202,7 @@ void mausb_deinitialize_mss(void)
=20
 =09wait_for_completion(&mss.empty);
 =09dev_dbg(mausb_host_dev.this_device, "Waiting for completion on disconne=
ct_event ended");
+=09mausb_stop_ring_events();
=20
 =09timeout =3D wait_for_completion_timeout(&mss.client_stopped, timeout);
 =09dev_info(mausb_host_dev.this_device, "Remaining time after waiting for =
stopping client %ld",
@@ -1106,7 +1392,6 @@ int mausb_send_transfer_ack(struct mausb_device *dev,=
 struct mausb_event *event)
 int mausb_send_data_msg(struct mausb_device *dev, struct mausb_event *even=
t)
 {
 =09struct mausb_urb_ctx *urb_ctx;
-=09int status =3D 0;
=20
 =09if (event->status !=3D 0) {
 =09=09dev_err(mausb_host_dev.this_device, "Event %d failed with status %d"=
,
@@ -1116,15 +1401,13 @@ int mausb_send_data_msg(struct mausb_device *dev, s=
truct mausb_event *event)
 =09}
=20
 =09urb_ctx =3D mausb_find_urb_in_tree((struct urb *)event->data.urb);
-
 =09if (!urb_ctx) {
 =09=09/* Transfer will be deleted from dequeue task */
 =09=09dev_warn(mausb_host_dev.this_device, "Urb is already cancelled for e=
vent=3D%d",
 =09=09=09 event->type);
-=09=09return status;
 =09}
=20
-=09return status;
+=09return 0;
 }
=20
 int mausb_receive_data_msg(struct mausb_device *dev, struct mausb_event *e=
vent)
@@ -1144,7 +1427,6 @@ int mausb_receive_data_msg(struct mausb_device *dev, =
struct mausb_event *event)
 =09}
=20
 =09urb_ctx =3D mausb_find_urb_in_tree((struct urb *)event->data.urb);
-
 =09if (!urb_ctx)
 =09=09dev_warn(mausb_host_dev.this_device, "Urb is already cancelled");
=20
@@ -1283,6 +1565,7 @@ static void mausb_connect_callback(struct mausb_devic=
e *dev,
 =09if (channel =3D=3D MAUSB_ISOCH_CHANNEL) {
 =09=09dev->channel_map[MAUSB_INTR_CHANNEL] =3D
 =09=09=09=09dev->channel_map[MAUSB_CTRL_CHANNEL];
+=09=09mausb_on_madev_connected(dev);
 =09}
 }
=20
@@ -1310,6 +1593,16 @@ static void mausb_handle_receive_event(struct mausb_=
device *dev,
 =09}
=20
 =09mausb_reset_connection_timer(dev);
+
+=09status =3D mausb_msg_received_event(&event,
+=09=09=09=09=09  (struct ma_usb_hdr_common *)data,
+=09=09=09=09=09  channel);
+=09if (status =3D=3D 0)
+=09=09status =3D mausb_enqueue_event_to_user(dev, &event);
+
+=09if (status < 0)
+=09=09dev_err(mausb_host_dev.this_device, "Failed to enqueue, status=3D%d"=
,
+=09=09=09status);
 }
=20
 void mausb_ip_callback(void *ctx, enum mausb_channel channel,
@@ -1619,3 +1912,154 @@ u32 mausb_data_iterator_length(struct mausb_data_it=
er *iterator)
 {
 =09return iterator->length;
 }
+
+static int mausb_ring_buffer_get(struct mausb_ring_buffer *ring,
+=09=09=09=09 struct mausb_event *event)
+{
+=09unsigned long flags =3D 0;
+
+=09spin_lock_irqsave(&ring->lock, flags);
+=09if (CIRC_CNT(ring->head, ring->tail, MAUSB_RING_BUFFER_SIZE) < 1) {
+=09=09spin_unlock_irqrestore(&ring->lock, flags);
+=09=09return -ENOSPC;
+=09}
+=09memcpy(event, ring->to_user_buffer + ring->tail, sizeof(*event));
+=09dev_vdbg(mausb_host_dev.this_device, "HEAD=3D%d, TAIL=3D%d", ring->head=
,
+=09=09 ring->tail);
+=09ring->tail =3D (ring->tail + 1) & (MAUSB_RING_BUFFER_SIZE - 1);
+=09dev_vdbg(mausb_host_dev.this_device, "HEAD=3D%d, TAIL=3D%d", ring->head=
,
+=09=09 ring->tail);
+=09spin_unlock_irqrestore(&ring->lock, flags);
+=09return 0;
+}
+
+int mausb_ring_buffer_init(struct mausb_ring_buffer *ring)
+{
+=09unsigned int page_order =3D
+=09=09mausb_get_page_order(2 * MAUSB_RING_BUFFER_SIZE,
+=09=09=09=09     sizeof(struct mausb_event));
+=09ring->to_user_buffer =3D
+=09=09(struct mausb_event *)__get_free_pages(GFP_KERNEL, page_order);
+=09if (!ring->to_user_buffer)
+=09=09return -ENOMEM;
+=09ring->from_user_buffer =3D ring->to_user_buffer + MAUSB_RING_BUFFER_SIZ=
E;
+=09ring->head =3D 0;
+=09ring->tail =3D 0;
+=09ring->current_from_user =3D 0;
+=09ring->buffer_full =3D false;
+=09spin_lock_init(&ring->lock);
+
+=09return 0;
+}
+
+int mausb_ring_buffer_put(struct mausb_ring_buffer *ring,
+=09=09=09  struct mausb_event *event)
+{
+=09unsigned long flags =3D 0;
+
+=09spin_lock_irqsave(&ring->lock, flags);
+
+=09if (ring->buffer_full) {
+=09=09dev_err(mausb_host_dev.this_device, "Ring buffer is full");
+=09=09spin_unlock_irqrestore(&ring->lock, flags);
+=09=09return -ENOSPC;
+=09}
+
+=09if (CIRC_SPACE(ring->head, ring->tail, MAUSB_RING_BUFFER_SIZE) < 2) {
+=09=09dev_err(mausb_host_dev.this_device, "Ring buffer capacity exceeded, =
disconnecting device");
+=09=09ring->buffer_full =3D true;
+=09=09mausb_disconect_event_unsafe(ring, event->madev_addr);
+=09=09ring->head =3D (ring->head + 1) & (MAUSB_RING_BUFFER_SIZE - 1);
+=09=09spin_unlock_irqrestore(&ring->lock, flags);
+=09=09return -ENOSPC;
+=09}
+=09memcpy(ring->to_user_buffer + ring->head, event, sizeof(*event));
+=09dev_vdbg(mausb_host_dev.this_device, "HEAD=3D%d, TAIL=3D%d",
+=09=09 ring->head, ring->tail);
+=09ring->head =3D (ring->head + 1) & (MAUSB_RING_BUFFER_SIZE - 1);
+=09dev_vdbg(mausb_host_dev.this_device, "HEAD=3D%d, TAIL=3D%d",
+=09=09 ring->head, ring->tail);
+=09spin_unlock_irqrestore(&ring->lock, flags);
+=09return 0;
+}
+
+int mausb_ring_buffer_move_tail(struct mausb_ring_buffer *ring, u32 count)
+{
+=09unsigned long flags =3D 0;
+
+=09spin_lock_irqsave(&ring->lock, flags);
+=09if (CIRC_CNT(ring->head, ring->tail, MAUSB_RING_BUFFER_SIZE) < count) {
+=09=09spin_unlock_irqrestore(&ring->lock, flags);
+=09=09return -ENOSPC;
+=09}
+=09dev_vdbg(mausb_host_dev.this_device, "old HEAD=3D%d, TAIL=3D%d",
+=09=09 ring->head, ring->tail);
+=09ring->tail =3D (ring->tail + (int)count) & (MAUSB_RING_BUFFER_SIZE - 1)=
;
+=09dev_vdbg(mausb_host_dev.this_device, "new HEAD=3D%d, TAIL=3D%d",
+=09=09 ring->head, ring->tail);
+=09spin_unlock_irqrestore(&ring->lock, flags);
+=09return 0;
+}
+
+void mausb_ring_buffer_cleanup(struct mausb_ring_buffer *ring)
+{
+=09struct mausb_event event;
+
+=09while (mausb_ring_buffer_get(ring, &event) =3D=3D 0)
+=09=09mausb_cleanup_ring_buffer_event(&event);
+}
+
+void mausb_ring_buffer_destroy(struct mausb_ring_buffer *ring)
+{
+=09unsigned int page_order =3D
+=09=09mausb_get_page_order(2 * MAUSB_RING_BUFFER_SIZE,
+=09=09=09=09     sizeof(struct mausb_event));
+=09if (ring && ring->to_user_buffer)
+=09=09free_pages((unsigned long)ring->to_user_buffer, page_order);
+}
+
+void mausb_cleanup_ring_buffer_event(struct mausb_event *event)
+{
+=09dev_dbg(mausb_host_dev.this_device, "Cleanup ring buffer event=3D%d",
+=09=09event->type);
+=09switch (event->type) {
+=09case MAUSB_EVENT_TYPE_SEND_DATA_MSG:
+=09=09mausb_cleanup_send_data_msg_event(event);
+=09=09break;
+=09case MAUSB_EVENT_TYPE_RECEIVED_DATA_MSG:
+=09=09mausb_cleanup_received_data_msg_event(event);
+=09=09break;
+=09case MAUSB_EVENT_TYPE_DELETE_DATA_TRANSFER:
+=09=09mausb_cleanup_delete_data_transfer_event(event);
+=09=09break;
+=09case MAUSB_EVENT_TYPE_NONE:
+=09=09break;
+=09default:
+=09=09dev_warn(mausb_host_dev.this_device, "Unknown event type");
+=09=09break;
+=09}
+}
+
+void mausb_disconect_event_unsafe(struct mausb_ring_buffer *ring,
+=09=09=09=09  uint8_t madev_addr)
+{
+=09struct mausb_event disconnect_event;
+=09struct mausb_device *dev =3D mausb_get_dev_from_addr_unsafe(madev_addr)=
;
+
+=09if (!dev) {
+=09=09dev_err(mausb_host_dev.this_device, "Device not found, madev_addr=3D=
%#x",
+=09=09=09madev_addr);
+=09=09return;
+=09}
+
+=09disconnect_event.type =3D MAUSB_EVENT_TYPE_DEV_DISCONNECT;
+=09disconnect_event.status =3D -EINVAL;
+=09disconnect_event.madev_addr =3D madev_addr;
+
+=09memcpy(ring->to_user_buffer + ring->head, &disconnect_event,
+=09       sizeof(disconnect_event));
+
+=09dev_dbg(mausb_host_dev.this_device, "Adding hcd_disconnect_work to dev =
workq, madev_addr=3D%#x",
+=09=09madev_addr);
+=09queue_work(dev->workq, &dev->hcd_disconnect_work);
+}
diff --git a/drivers/usb/host/mausb/hpal.h b/drivers/usb/host/mausb/hpal.h
index a04ed120ba5e..ac684f9b3612 100644
--- a/drivers/usb/host/mausb/hpal.h
+++ b/drivers/usb/host/mausb/hpal.h
@@ -5,7 +5,7 @@
 #ifndef __MAUSB_HPAL_H__
 #define __MAUSB_HPAL_H__
=20
-#include <linux/kref.h>
+#include <linux/miscdevice.h>
 #include <linux/suspend.h>
 #include <linux/usb.h>
=20
@@ -26,6 +26,7 @@
=20
 extern struct mss mss;
 extern struct mausb_hcd *mhcd;
+extern struct miscdevice mausb_host_dev;
=20
 enum mausb_isoch_header_format_size {
 =09MAUSB_ISOCH_SHORT_FORMAT_SIZE=09 =3D 4,
@@ -67,6 +68,7 @@ struct mss {
 struct mausb_device {
 =09struct mausb_device_address dev_addr;
 =09struct net=09=09    *net_ns;
+=09struct mausb_ring_buffer    *ring_buffer;
 =09struct list_head=09    list_entry;
=20
 =09struct mausb_ip_ctx *mgmt_channel;
@@ -133,6 +135,10 @@ static inline u64 mausb_event_id(struct mausb_device *=
dev)
=20
 int mausb_initiate_dev_connection(struct mausb_device_address device_addre=
ss,
 =09=09=09=09  u8 madev_address);
+int mausb_enqueue_event_from_user(u8 madev_addr, u16 num_of_events,
+=09=09=09=09  u16 num_of_completed);
+int mausb_enqueue_event_to_user(struct mausb_device *dev,
+=09=09=09=09struct mausb_event *event);
 int mausb_data_req_enqueue_event(struct mausb_device *dev, u16 ep_handle,
 =09=09=09=09 struct urb *request);
 int mausb_signal_event(struct mausb_device *dev, struct mausb_event *event=
,
@@ -282,6 +288,33 @@ void mausb_reset_data_iterator(struct mausb_data_iter =
*iterator);
 void mausb_uninit_data_iterator(struct mausb_data_iter *iterator);
 void mausb_data_iterator_seek(struct mausb_data_iter *iterator, u32 seek_d=
elta);
=20
+struct mausb_ring_buffer {
+=09atomic_t mausb_ring_events;
+=09atomic_t mausb_completed_user_events;
+
+=09struct mausb_event *to_user_buffer;
+=09int=09=09head;
+=09int=09=09tail;
+=09spinlock_t=09lock; /* Protect ring buffer */
+=09u64=09=09id;
+
+=09struct mausb_event *from_user_buffer;
+=09int current_from_user;
+
+=09struct list_head list_entry;
+=09bool buffer_full;
+};
+
+int mausb_ring_buffer_init(struct mausb_ring_buffer *ring);
+int mausb_ring_buffer_put(struct mausb_ring_buffer *ring,
+=09=09=09  struct mausb_event *event);
+int mausb_ring_buffer_move_tail(struct mausb_ring_buffer *ring, u32 count)=
;
+void mausb_ring_buffer_cleanup(struct mausb_ring_buffer *ring);
+void mausb_ring_buffer_destroy(struct mausb_ring_buffer *ring);
+void mausb_cleanup_ring_buffer_event(struct mausb_event *event);
+void mausb_disconect_event_unsafe(struct mausb_ring_buffer *ring,
+=09=09=09=09  uint8_t madev_addr);
+
 static inline unsigned int mausb_get_page_order(unsigned int num_of_elems,
 =09=09=09=09=09=09unsigned int elem_size)
 {
@@ -292,4 +325,16 @@ static inline unsigned int mausb_get_page_order(unsign=
ed int num_of_elems,
 =09return order;
 }
=20
+static inline
+struct mausb_event *mausb_ring_current_from_user(struct mausb_ring_buffer =
*ring)
+{
+=09return ring->from_user_buffer + ring->current_from_user;
+}
+
+static inline void mausb_ring_next_from_user(struct mausb_ring_buffer *rin=
g)
+{
+=09ring->current_from_user =3D (ring->current_from_user + 1) &
+=09=09=09=09  (MAUSB_RING_BUFFER_SIZE - 1);
+}
+
 #endif /* __MAUSB_HPAL_H__ */
diff --git a/drivers/usb/host/mausb/hpal_events.c b/drivers/usb/host/mausb/=
hpal_events.c
new file mode 100644
index 000000000000..92ab918bb339
--- /dev/null
+++ b/drivers/usb/host/mausb/hpal_events.c
@@ -0,0 +1,614 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2019 - 2020 DisplayLink (UK) Ltd.
+ */
+#include "hpal_events.h"
+
+#include "hcd.h"
+#include "utils.h"
+
+void mausb_dev_reset_req_event(struct mausb_event *event)
+{
+=09event->type =3D MAUSB_EVENT_TYPE_DEV_RESET;
+}
+
+static int mausb_mgmt_msg_received_event(struct mausb_event *event,
+=09=09=09=09=09 struct ma_usb_hdr_common *hdr,
+=09=09=09=09=09 enum mausb_channel channel)
+{
+=09int status =3D 0;
+
+=09dev_info(mausb_host_dev.this_device, "channel=3D%d, type=3D%d", channel=
,
+=09=09 hdr->type);
+=09if (hdr->length <=3D MAUSB_MAX_MGMT_SIZE) {
+=09=09event->type =3D MAUSB_EVENT_TYPE_RECEIVED_MGMT_MSG;
+=09=09memcpy(event->mgmt.mgmt_hdr.hdr, hdr, hdr->length);
+=09} else {
+=09=09dev_err(mausb_host_dev.this_device, "MGMT message to long, failed to=
 copy");
+=09=09status =3D -EINVAL;
+=09}
+
+=09kfree(hdr);
+=09return status;
+}
+
+static int mausb_data_msg_received_event(struct mausb_event *event,
+=09=09=09=09=09 struct ma_usb_hdr_common *hdr,
+=09=09=09=09=09 enum mausb_channel channel)
+{
+=09event->type=09=09  =3D MAUSB_EVENT_TYPE_RECEIVED_DATA_MSG;
+=09event->data.transfer_type =3D mausb_transfer_type_from_hdr(hdr);
+=09event->data.device_id=09  =3D (u16)((hdr->ssid << 8) | hdr->dev_addr);
+=09event->data.ep_handle=09  =3D hdr->handle.epv;
+=09event->data.recv_buf=09  =3D (uintptr_t)hdr;
+
+=09memcpy(event->data.hdr, hdr, MAUSB_TRANSFER_HDR_SIZE);
+
+=09if (mausb_ctrl_transfer(hdr) &&
+=09    hdr->length <=3D 2 * MAUSB_TRANSFER_HDR_SIZE) {
+=09=09memcpy(event->data.hdr_ack,
+=09=09       shift_ptr(hdr, MAUSB_TRANSFER_HDR_SIZE),
+=09=09       (size_t)(hdr->length - MAUSB_TRANSFER_HDR_SIZE));
+=09}
+
+=09return 0;
+}
+
+static int mausb_isoch_msg_received_event(struct mausb_event *event,
+=09=09=09=09=09  struct ma_usb_hdr_common *hdr,
+=09=09=09=09=09  enum mausb_channel channel)
+{
+=09event->type=09=09  =3D MAUSB_EVENT_TYPE_RECEIVED_DATA_MSG;
+=09event->data.transfer_type =3D mausb_transfer_type_from_hdr(hdr);
+=09event->data.device_id=09  =3D (u16)((hdr->ssid << 8) | hdr->dev_addr);
+=09event->data.ep_handle=09  =3D hdr->handle.epv;
+=09event->data.recv_buf=09  =3D (uintptr_t)hdr;
+
+=09memcpy(event->data.hdr, hdr, MAUSB_TRANSFER_HDR_SIZE);
+
+=09return 0;
+}
+
+int mausb_msg_received_event(struct mausb_event *event,
+=09=09=09     struct ma_usb_hdr_common *hdr,
+=09=09=09     enum mausb_channel channel)
+{
+=09dev_vdbg(mausb_host_dev.this_device, "channel=3D%d, type=3D%d", channel=
,
+=09=09 hdr->type);
+=09if (mausb_is_management_hdr_type(hdr->type))
+=09=09return mausb_mgmt_msg_received_event(event, hdr, channel);
+=09else if (hdr->type =3D=3D MA_USB_HDR_TYPE_DATA_RESP(TRANSFER))
+=09=09return mausb_data_msg_received_event(event, hdr, channel);
+=09else if (hdr->type =3D=3D MA_USB_HDR_TYPE_DATA_RESP(ISOCHTRANSFER))
+=09=09return mausb_isoch_msg_received_event(event, hdr, channel);
+
+=09dev_warn(mausb_host_dev.this_device, "Unknown event type event=3D%d",
+=09=09 hdr->type);
+=09kfree(hdr);
+=09return -EBADR;
+}
+
+static void mausb_prepare_completion(struct mausb_completion *mausb_comple=
tion,
+=09=09=09=09     struct completion *completion,
+=09=09=09=09     struct mausb_event *event, u64 event_id)
+{
+=09init_completion(completion);
+
+=09mausb_completion->completion_event =3D completion;
+=09mausb_completion->event_id=09   =3D event_id;
+=09mausb_completion->mausb_event=09   =3D event;
+}
+
+static int mausb_wait_for_completion(struct mausb_event *event, u64 event_=
id,
+=09=09=09=09     struct mausb_device *dev)
+{
+=09struct completion=09completion;
+=09struct mausb_completion mausb_completion;
+=09long status;
+=09unsigned long timeout;
+
+=09mausb_prepare_completion(&mausb_completion, &completion, event,
+=09=09=09=09 event_id);
+=09mausb_insert_event(dev, &mausb_completion);
+
+=09status =3D mausb_enqueue_event_to_user(dev, event);
+=09if (status < 0) {
+=09=09mausb_remove_event(dev, &mausb_completion);
+=09=09dev_err(mausb_host_dev.this_device, "Ring buffer full, event_id=3D%l=
ld",
+=09=09=09event_id);
+=09=09return (int)status;
+=09}
+
+=09timeout =3D msecs_to_jiffies(MANAGEMENT_EVENT_TIMEOUT);
+=09status =3D wait_for_completion_interruptible_timeout(&completion,
+=09=09=09=09=09=09=09   timeout);
+
+=09mausb_remove_event(dev, &mausb_completion);
+
+=09if (status =3D=3D 0) {
+=09=09queue_work(dev->workq, &dev->socket_disconnect_work);
+=09=09queue_work(dev->workq, &dev->hcd_disconnect_work);
+=09=09return -ETIMEDOUT;
+=09}
+
+=09return 0;
+}
+
+int mausb_usbdevhandle_event_to_user(struct mausb_device *dev,
+=09=09=09=09     u8 device_speed,
+=09=09=09=09     u32 route_string,
+=09=09=09=09     u16 hub_dev_handle,
+=09=09=09=09     u16 parent_hs_hub_dev_handle,
+=09=09=09=09     u16 parent_hs_hub_port, u16 mtt,
+=09=09=09=09     u8 lse, s32 *usb_dev_handle)
+{
+=09struct mausb_event event;
+=09int status;
+=09u64 event_id =3D mausb_event_id(dev);
+
+=09event.type =3D MAUSB_EVENT_TYPE_USB_DEV_HANDLE;
+=09event.mgmt.dev_handle.device_speed=09 =3D device_speed;
+=09event.mgmt.dev_handle.route_string=09 =3D route_string;
+=09event.mgmt.dev_handle.hub_dev_handle=09 =3D hub_dev_handle;
+=09event.mgmt.dev_handle.parent_hs_hub_port =3D parent_hs_hub_port;
+=09event.mgmt.dev_handle.mtt=09=09 =3D mtt;
+=09event.mgmt.dev_handle.lse=09=09 =3D lse;
+=09event.mgmt.dev_handle.event_id=09=09 =3D event_id;
+=09event.madev_addr=09=09=09 =3D dev->madev_addr;
+=09event.mgmt.dev_handle.parent_hs_hub_dev_handle =3D
+=09=09=09=09=09=09   parent_hs_hub_dev_handle;
+
+=09status =3D mausb_wait_for_completion(&event, event_id, dev);
+=09if (status < 0) {
+=09=09dev_err(mausb_host_dev.this_device, "Usbdevhandle failed, event_id=
=3D%lld",
+=09=09=09event_id);
+=09=09return status;
+=09}
+
+=09if (event.status < 0)
+=09=09return event.status;
+
+=09*usb_dev_handle =3D event.mgmt.dev_handle.dev_handle;
+
+=09return 0;
+}
+
+int mausb_usbdevhandle_event_from_user(struct mausb_device *dev,
+=09=09=09=09       struct mausb_event *event)
+{
+=09return mausb_signal_event(dev, event, event->mgmt.dev_handle.event_id);
+}
+
+int mausb_ephandle_event_to_user(struct mausb_device *dev,
+=09=09=09=09 u16 device_handle,
+=09=09=09=09 u16 descriptor_size, void *descriptor,
+=09=09=09=09 u16 *ep_handle)
+{
+=09struct mausb_event event;
+=09int  status;
+=09u64 event_id =3D mausb_event_id(dev);
+
+=09event.type=09=09=09     =3D MAUSB_EVENT_TYPE_EP_HANDLE;
+=09event.mgmt.ep_handle.device_handle   =3D device_handle;
+=09event.mgmt.ep_handle.descriptor_size =3D descriptor_size;
+=09event.mgmt.ep_handle.event_id=09     =3D event_id;
+=09event.madev_addr=09=09     =3D dev->madev_addr;
+
+=09memcpy(event.mgmt.ep_handle.descriptor, descriptor, descriptor_size);
+
+=09status =3D mausb_wait_for_completion(&event, event_id, dev);
+=09if (status < 0) {
+=09=09dev_err(mausb_host_dev.this_device, "Ephandle failed, event_id=3D%ll=
d",
+=09=09=09event_id);
+=09=09return status;
+=09}
+
+=09if (event.status < 0)
+=09=09return event.status;
+
+=09*ep_handle =3D event.mgmt.ep_handle.ep_handle;
+
+=09return 0;
+}
+
+int mausb_ephandle_event_from_user(struct mausb_device *dev,
+=09=09=09=09   struct mausb_event *event)
+{
+=09return mausb_signal_event(dev, event, event->mgmt.ep_handle.event_id);
+}
+
+int mausb_epactivate_event_to_user(struct mausb_device *dev,
+=09=09=09=09   u16 device_handle, u16 ep_handle)
+{
+=09struct mausb_event event;
+=09int  status;
+=09u64 event_id =3D mausb_event_id(dev);
+
+=09event.type =3D MAUSB_EVENT_TYPE_EP_HANDLE_ACTIVATE;
+=09event.mgmt.ep_activate.device_handle =3D device_handle;
+=09event.mgmt.ep_activate.ep_handle     =3D ep_handle;
+=09event.mgmt.ep_activate.event_id=09     =3D event_id;
+=09event.madev_addr=09=09     =3D dev->madev_addr;
+
+=09status =3D mausb_wait_for_completion(&event, event_id, dev);
+=09if (status < 0) {
+=09=09dev_err(mausb_host_dev.this_device, "Epactivate failed, event_id=3D%=
lld",
+=09=09=09event_id);
+=09=09return status;
+=09}
+
+=09return event.status;
+}
+
+int mausb_epactivate_event_from_user(struct mausb_device *dev,
+=09=09=09=09     struct mausb_event *event)
+{
+=09return mausb_signal_event(dev, event,
+=09=09event->mgmt.ep_activate.event_id);
+}
+
+int mausb_epinactivate_event_to_user(struct mausb_device *dev,
+=09=09=09=09     u16 device_handle, u16 ep_handle)
+{
+=09struct mausb_event event;
+=09int  status;
+=09u64 event_id =3D mausb_event_id(dev);
+
+=09event.type =3D MAUSB_EVENT_TYPE_EP_HANDLE_INACTIVATE;
+=09event.mgmt.ep_inactivate.device_handle=09=3D device_handle;
+=09event.mgmt.ep_inactivate.ep_handle=09=3D ep_handle;
+=09event.mgmt.ep_inactivate.event_id=09=3D event_id;
+=09event.madev_addr=09=09=09=3D dev->madev_addr;
+
+=09status =3D mausb_wait_for_completion(&event, event_id, dev);
+
+=09if (status < 0) {
+=09=09dev_err(mausb_host_dev.this_device, "Epinactivate failed, event_id=
=3D%lld",
+=09=09=09event_id);
+=09=09return status;
+=09}
+
+=09return event.status;
+}
+
+int mausb_epinactivate_event_from_user(struct mausb_device *dev,
+=09=09=09=09       struct mausb_event *event)
+{
+=09return mausb_signal_event(dev, event,
+=09=09=09=09  event->mgmt.ep_inactivate.event_id);
+}
+
+int mausb_epreset_event_to_user(struct mausb_device *dev,
+=09=09=09=09u16 device_handle, u16 ep_handle,
+=09=09=09=09u8 tsp_flag)
+{
+=09struct mausb_event event;
+=09int  status;
+=09u64 event_id =3D mausb_event_id(dev);
+
+=09event.type=09=09=09  =3D MAUSB_EVENT_TYPE_EP_HANDLE_RESET;
+=09event.mgmt.ep_reset.device_handle =3D device_handle;
+=09event.mgmt.ep_reset.ep_handle=09  =3D ep_handle;
+=09event.mgmt.ep_reset.tsp=09=09  =3D tsp_flag;
+=09event.mgmt.ep_reset.event_id=09  =3D event_id;
+=09event.madev_addr=09=09  =3D dev->madev_addr;
+
+=09status =3D mausb_wait_for_completion(&event, event_id, dev);
+=09if (status < 0) {
+=09=09dev_err(mausb_host_dev.this_device, "Epreset failed, event_id=3D%lld=
",
+=09=09=09event_id);
+=09=09return status;
+=09}
+
+=09return event.status;
+}
+
+int mausb_epreset_event_from_user(struct mausb_device *dev,
+=09=09=09=09  struct mausb_event *event)
+{
+=09return mausb_signal_event(dev, event, event->mgmt.ep_reset.event_id);
+}
+
+int mausb_epdelete_event_to_user(struct mausb_device *dev,
+=09=09=09=09 u16 device_handle, u16 ep_handle)
+{
+=09struct mausb_event event;
+=09int  status;
+=09u64 event_id =3D mausb_event_id(dev);
+
+=09event.type=09=09=09   =3D MAUSB_EVENT_TYPE_EP_HANDLE_DELETE;
+=09event.mgmt.ep_delete.device_handle =3D device_handle;
+=09event.mgmt.ep_delete.ep_handle=09   =3D ep_handle;
+=09event.mgmt.ep_delete.event_id=09   =3D event_id;
+=09event.madev_addr=09=09   =3D dev->madev_addr;
+
+=09status =3D mausb_wait_for_completion(&event, event_id, dev);
+=09if (status < 0) {
+=09=09dev_err(mausb_host_dev.this_device, "Epdelete failed, event_id=3D%ll=
d",
+=09=09=09event_id);
+=09=09return status;
+=09}
+
+=09return event.status;
+}
+
+int mausb_epdelete_event_from_user(struct mausb_device *dev,
+=09=09=09=09   struct mausb_event *event)
+{
+=09return mausb_signal_event(dev, event, event->mgmt.ep_delete.event_id);
+}
+
+int mausb_modifyep0_event_to_user(struct mausb_device *dev,
+=09=09=09=09  u16 device_handle, u16 *ep_handle,
+=09=09=09=09  __le16 max_packet_size)
+{
+=09struct mausb_event event;
+=09int  status;
+=09u64 event_id =3D mausb_event_id(dev);
+
+=09event.type=09=09=09=09=3D MAUSB_EVENT_TYPE_MODIFY_EP0;
+=09event.mgmt.modify_ep0.device_handle=09=3D device_handle;
+=09event.mgmt.modify_ep0.ep_handle=09=09=3D *ep_handle;
+=09event.mgmt.modify_ep0.max_packet_size=09=3D max_packet_size;
+=09event.mgmt.modify_ep0.event_id=09=09=3D event_id;
+=09event.madev_addr=09=09=09=3D dev->madev_addr;
+
+=09status =3D mausb_wait_for_completion(&event, event_id, dev);
+=09if (status < 0) {
+=09=09dev_err(mausb_host_dev.this_device, "ModifyEP0 failed, event_id=3D%l=
ld",
+=09=09=09event_id);
+=09=09return status;
+=09}
+
+=09if (event.status < 0)
+=09=09return event.status;
+
+=09*ep_handle =3D event.mgmt.modify_ep0.ep_handle;
+
+=09return 0;
+}
+
+int mausb_modifyep0_event_from_user(struct mausb_device *dev,
+=09=09=09=09    struct mausb_event *event)
+{
+=09return mausb_signal_event(dev, event, event->mgmt.modify_ep0.event_id);
+}
+
+int mausb_setusbdevaddress_event_to_user(struct mausb_device *dev,
+=09=09=09=09=09 u16 device_handle,
+=09=09=09=09=09 u16 response_timeout)
+{
+=09struct mausb_event event;
+=09int  status;
+=09u64 event_id =3D mausb_event_id(dev);
+
+=09event.type =3D MAUSB_EVENT_TYPE_SET_USB_DEV_ADDRESS;
+=09event.mgmt.set_usb_dev_address.device_handle=09=3D device_handle;
+=09event.mgmt.set_usb_dev_address.response_timeout=09=3D response_timeout;
+=09event.mgmt.set_usb_dev_address.event_id=09=09=3D event_id;
+=09event.madev_addr=09=09=09=09=3D dev->madev_addr;
+
+=09status =3D mausb_wait_for_completion(&event, event_id, dev);
+=09if (status < 0) {
+=09=09dev_err(mausb_host_dev.this_device, "SetUSBDevAddress failed, event_=
id=3D%lld",
+=09=09=09event_id);
+=09=09return status;
+=09}
+
+=09return event.status;
+}
+
+int mausb_setusbdevaddress_event_from_user(struct mausb_device *dev,
+=09=09=09=09=09   struct mausb_event *event)
+{
+=09return mausb_signal_event(dev, event,
+=09=09event->mgmt.set_usb_dev_address.event_id);
+}
+
+static void
+mausb_init_device_descriptor(struct ma_usb_updatedevreq_desc *update_descr=
iptor,
+=09=09=09     struct usb_device_descriptor *device_descriptor)
+{
+=09update_descriptor->usb20.bLength =3D device_descriptor->bLength;
+=09update_descriptor->usb20.bDescriptorType =3D
+=09=09=09=09=09device_descriptor->bDescriptorType;
+=09update_descriptor->usb20.bcdUSB =3D device_descriptor->bcdUSB;
+=09update_descriptor->usb20.bDeviceClass =3D
+=09=09=09=09=09device_descriptor->bDeviceClass;
+=09update_descriptor->usb20.bDeviceSubClass =3D
+=09=09=09=09=09device_descriptor->bDeviceSubClass;
+=09update_descriptor->usb20.bDeviceProtocol =3D
+=09=09=09=09=09device_descriptor->bDeviceProtocol;
+=09update_descriptor->usb20.bMaxPacketSize0 =3D
+=09=09=09=09=09device_descriptor->bMaxPacketSize0;
+=09update_descriptor->usb20.idVendor  =3D device_descriptor->idVendor;
+=09update_descriptor->usb20.idProduct =3D device_descriptor->idProduct;
+=09update_descriptor->usb20.bcdDevice =3D device_descriptor->bcdDevice;
+=09update_descriptor->usb20.iManufacturer =3D
+=09=09=09=09=09device_descriptor->iManufacturer;
+=09update_descriptor->usb20.iProduct  =3D device_descriptor->iProduct;
+=09update_descriptor->usb20.iSerialNumber =3D
+=09=09=09=09=09device_descriptor->iSerialNumber;
+=09update_descriptor->usb20.bNumConfigurations =3D
+=09=09=09=09=09device_descriptor->bNumConfigurations;
+}
+
+int mausb_updatedev_event_to_user(struct mausb_device *dev,
+=09=09=09=09  u16 device_handle,
+=09=09=09=09  u16 max_exit_latency, u8 hub,
+=09=09=09=09  u8 number_of_ports, u8 mtt,
+=09=09=09=09  u8 ttt, u8 integrated_hub_latency,
+=09=09=09=09  struct usb_device_descriptor *dev_descriptor)
+{
+=09struct mausb_event event;
+=09int status;
+=09u64 event_id =3D mausb_event_id(dev);
+
+=09event.type =3D MAUSB_EVENT_TYPE_UPDATE_DEV;
+=09event.mgmt.update_dev.device_handle=09     =3D device_handle;
+=09event.mgmt.update_dev.max_exit_latency=09     =3D max_exit_latency;
+=09event.mgmt.update_dev.hub=09=09     =3D hub;
+=09event.mgmt.update_dev.number_of_ports=09     =3D number_of_ports;
+=09event.mgmt.update_dev.mtt=09=09     =3D mtt;
+=09event.mgmt.update_dev.ttt=09=09     =3D ttt;
+=09event.mgmt.update_dev.integrated_hub_latency =3D integrated_hub_latency=
;
+=09event.mgmt.update_dev.event_id=09=09     =3D event_id;
+=09event.madev_addr=09=09=09     =3D dev->madev_addr;
+
+=09mausb_init_device_descriptor(&event.mgmt.update_dev.update_descriptor,
+=09=09=09=09     dev_descriptor);
+
+=09status =3D mausb_wait_for_completion(&event, event_id, dev);
+=09if (status < 0) {
+=09=09dev_err(mausb_host_dev.this_device, "UpdateDev failed, event_id=3D%l=
ld",
+=09=09=09event_id);
+=09=09return status;
+=09}
+
+=09return event.status;
+}
+
+int mausb_updatedev_event_from_user(struct mausb_device *dev,
+=09=09=09=09    struct mausb_event *event)
+{
+=09return mausb_signal_event(dev, event, event->mgmt.update_dev.event_id);
+}
+
+int mausb_usbdevdisconnect_event_to_user(struct mausb_device *dev,
+=09=09=09=09=09 u16 dev_handle)
+{
+=09struct mausb_event event;
+=09int status;
+
+=09event.type =3D MAUSB_EVENT_TYPE_USB_DEV_DISCONNECT;
+=09event.mgmt.usb_dev_disconnect.device_handle =3D dev_handle;
+=09event.madev_addr=09=09=09    =3D dev->madev_addr;
+
+=09status =3D mausb_enqueue_event_to_user(dev, &event);
+=09if (status < 0)
+=09=09dev_err(mausb_host_dev.this_device, "Ring buffer full, usbdevdisconn=
ect failed");
+
+=09return status;
+}
+
+int mausb_ping_event_to_user(struct mausb_device *dev)
+{
+=09struct mausb_event event;
+=09int status;
+
+=09event.type=09 =3D MAUSB_EVENT_TYPE_PING;
+=09event.madev_addr =3D dev->madev_addr;
+
+=09status =3D mausb_enqueue_event_to_user(dev, &event);
+=09if (status < 0)
+=09=09dev_err(mausb_host_dev.this_device, "Ring buffer full, devdisconnect=
 failed");
+
+=09return status;
+}
+
+__attribute__((unused))
+static int mausb_devdisconnect_event_to_user(struct mausb_device *dev)
+{
+=09struct mausb_event event;
+=09int status;
+
+=09event.type=09 =3D MAUSB_EVENT_TYPE_DEV_DISCONNECT;
+=09event.madev_addr =3D dev->madev_addr;
+
+=09status =3D mausb_enqueue_event_to_user(dev, &event);
+=09if (status < 0)
+=09=09dev_err(mausb_host_dev.this_device, "Ring buffer full, devdisconnect=
 failed");
+
+=09return status;
+}
+
+int mausb_usbdevreset_event_to_user(struct mausb_device *dev,
+=09=09=09=09    u16 device_handle)
+{
+=09struct mausb_event event;
+=09int  status;
+=09u64 event_id =3D mausb_event_id(dev);
+
+=09event.type=09=09=09       =3D MAUSB_EVENT_TYPE_USB_DEV_RESET;
+=09event.mgmt.usb_dev_reset.device_handle =3D device_handle;
+=09event.mgmt.usb_dev_reset.event_id      =3D event_id;
+=09event.madev_addr=09=09       =3D dev->madev_addr;
+
+=09status =3D mausb_wait_for_completion(&event, event_id, dev);
+
+=09if (status < 0) {
+=09=09dev_err(mausb_host_dev.this_device, "UsbDevReset failed, event_id=3D=
%lld",
+=09=09=09event_id);
+=09=09return status;
+=09}
+
+=09return event.status;
+}
+
+int mausb_usbdevreset_event_from_user(struct mausb_device *dev,
+=09=09=09=09      struct mausb_event *event)
+{
+=09return mausb_signal_event(dev, event,
+=09=09=09=09  event->mgmt.usb_dev_reset.event_id);
+}
+
+int mausb_canceltransfer_event_to_user(struct mausb_device *dev,
+=09=09=09=09       u16 device_handle, u16 ep_handle,
+=09=09=09=09       uintptr_t urb)
+{
+=09struct mausb_event event;
+=09int status;
+
+=09event.type =3D MAUSB_EVENT_TYPE_CANCEL_TRANSFER;
+=09event.mgmt.cancel_transfer.device_handle =3D device_handle;
+=09event.mgmt.cancel_transfer.ep_handle=09 =3D ep_handle;
+=09event.mgmt.cancel_transfer.urb=09=09 =3D urb;
+=09event.madev_addr=09=09=09 =3D dev->madev_addr;
+
+=09status =3D mausb_enqueue_event_to_user(dev, &event);
+=09if (status < 0) {
+=09=09dev_err(mausb_host_dev.this_device, "Ring buffer full, canceltransfe=
r failed");
+=09=09return status;
+=09}
+
+=09return status;
+}
+
+int mausb_canceltransfer_event_from_user(struct mausb_device *dev,
+=09=09=09=09=09 struct mausb_event *event)
+{
+=09return 0;
+}
+
+void mausb_cleanup_send_data_msg_event(struct mausb_event *event)
+{
+=09mausb_complete_urb(event);
+}
+
+void mausb_cleanup_received_data_msg_event(struct mausb_event *event)
+{
+=09mausb_release_event_resources(event);
+}
+
+void mausb_cleanup_delete_data_transfer_event(struct mausb_event *event)
+{
+=09struct urb *urb =3D (struct urb *)event->data.urb;
+=09struct mausb_urb_ctx *urb_ctx;
+=09int status =3D 0;
+
+=09urb_ctx =3D mausb_unlink_and_delete_urb_from_tree(urb, status);
+=09if (!urb_ctx) {
+=09=09dev_warn(mausb_host_dev.this_device, "Urb=3D%p is not in tree",
+=09=09=09 urb);
+=09=09return;
+=09}
+
+=09/* Deallocate urb_ctx */
+=09mausb_uninit_data_iterator(&urb_ctx->iterator);
+=09kfree(urb_ctx);
+
+=09urb->status =3D -EPROTO;
+=09urb->actual_length =3D 0;
+=09atomic_dec(&urb->use_count);
+=09usb_hcd_giveback_urb(urb->hcpriv, urb, urb->status);
+}
diff --git a/drivers/usb/host/mausb/hpal_events.h b/drivers/usb/host/mausb/=
hpal_events.h
new file mode 100644
index 000000000000..1535a814c2a7
--- /dev/null
+++ b/drivers/usb/host/mausb/hpal_events.h
@@ -0,0 +1,85 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2019 - 2020 DisplayLink (UK) Ltd.
+ */
+#ifndef __MAUSB_HPAL_EVENTS_H__
+#define __MAUSB_HPAL_EVENTS_H__
+
+#include "hpal.h"
+
+#define MANAGEMENT_EVENT_TIMEOUT 3000
+
+int mausb_msg_received_event(struct mausb_event *event,
+=09=09=09     struct ma_usb_hdr_common *hdr,
+=09=09=09     enum mausb_channel channel);
+int mausb_usbdevhandle_event_to_user(struct mausb_device *dev,
+=09=09=09=09     u8 device_speed,
+=09=09=09=09     u32 route_string,
+=09=09=09=09     u16 hub_dev_handle,
+=09=09=09=09     u16 parent_hs_hub_dev_handle,
+=09=09=09=09     u16 parent_hs_hub_port, u16 mtt,
+=09=09=09=09     u8 lse, s32 *usb_dev_handle);
+int mausb_usbdevhandle_event_from_user(struct mausb_device *dev,
+=09=09=09=09       struct mausb_event *event);
+int mausb_ephandle_event_to_user(struct mausb_device *dev, u16 device_hand=
le,
+=09=09=09=09 u16 descriptor_size, void *descriptor,
+=09=09=09=09 u16 *ep_handle);
+int mausb_ephandle_event_from_user(struct mausb_device *dev,
+=09=09=09=09   struct mausb_event *event);
+int mausb_epactivate_event_to_user(struct mausb_device *dev,
+=09=09=09=09   u16 device_handle, u16 ep_handle);
+int mausb_epactivate_event_from_user(struct mausb_device *dev,
+=09=09=09=09     struct mausb_event *event);
+int mausb_epinactivate_event_to_user(struct mausb_device *dev,
+=09=09=09=09     u16 device_handle,
+=09=09=09=09     u16 ep_handle);
+int mausb_epinactivate_event_from_user(struct mausb_device *dev,
+=09=09=09=09       struct mausb_event *event);
+int mausb_epreset_event_to_user(struct mausb_device *dev,
+=09=09=09=09u16 device_handle, u16 ep_handle,
+=09=09=09=09u8 tsp_flag);
+int mausb_epreset_event_from_user(struct mausb_device *dev,
+=09=09=09=09  struct mausb_event *event);
+int mausb_epdelete_event_to_user(struct mausb_device *dev,
+=09=09=09=09 u16 device_handle, u16 ep_handle);
+int mausb_epdelete_event_from_user(struct mausb_device *dev,
+=09=09=09=09   struct mausb_event *event);
+int mausb_modifyep0_event_to_user(struct mausb_device *dev,
+=09=09=09=09  u16 device_handle, u16 *ep_handle,
+=09=09=09=09  __le16 max_packet_size);
+int mausb_modifyep0_event_from_user(struct mausb_device *dev,
+=09=09=09=09    struct mausb_event *event);
+int mausb_setusbdevaddress_event_to_user(struct mausb_device *dev,
+=09=09=09=09=09 u16 device_handle,
+=09=09=09=09=09 u16 response_timeout);
+int mausb_setusbdevaddress_event_from_user(struct mausb_device *dev,
+=09=09=09=09=09   struct mausb_event *event);
+int mausb_updatedev_event_to_user(struct mausb_device *dev,
+=09=09=09=09  u16 device_handle,
+=09=09=09=09  u16 max_exit_latency, u8 hub,
+=09=09=09=09  u8 number_of_ports, u8 mtt,
+=09=09=09=09  u8 ttt, u8 integrated_hub_latency,
+=09=09=09=09  struct usb_device_descriptor *dev_descriptor);
+int mausb_updatedev_event_from_user(struct mausb_device *dev,
+=09=09=09=09    struct mausb_event *event);
+int mausb_usbdevdisconnect_event_to_user(struct mausb_device *dev,
+=09=09=09=09=09 u16 dev_handle);
+int mausb_ping_event_to_user(struct mausb_device *dev);
+int mausb_usbdevreset_event_to_user(struct mausb_device *dev,
+=09=09=09=09    u16 device_handle);
+int mausb_usbdevreset_event_from_user(struct mausb_device *dev,
+=09=09=09=09      struct mausb_event *event);
+int mausb_canceltransfer_event_to_user(struct mausb_device *dev,
+=09=09=09=09       u16 device_handle, u16 ep_handle,
+=09=09=09=09       uintptr_t urb);
+int mausb_canceltransfer_event_from_user(struct mausb_device *dev,
+=09=09=09=09=09 struct mausb_event *event);
+
+void mausb_dev_reset_req_event(struct mausb_event *event);
+int mausb_canceltransfer_event_from_user(struct mausb_device *dev,
+=09=09=09=09=09 struct mausb_event *event);
+void mausb_cleanup_send_data_msg_event(struct mausb_event *event);
+void mausb_cleanup_received_data_msg_event(struct mausb_event *event);
+void mausb_cleanup_delete_data_transfer_event(struct mausb_event *event);
+
+#endif /* __MAUSB_HPAL_EVENTS_H__ */
diff --git a/drivers/usb/host/mausb/mausb_driver_status.h b/drivers/usb/hos=
t/mausb/mausb_driver_status.h
new file mode 100644
index 000000000000..9b55befe9cae
--- /dev/null
+++ b/drivers/usb/host/mausb/mausb_driver_status.h
@@ -0,0 +1,17 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2019 - 2020 DisplayLink (UK) Ltd.
+ */
+#ifndef __MAUSB_MAUSB_DRIVER_STATUS_H__
+#define __MAUSB_MAUSB_DRIVER_STATUS_H__
+
+#define MAUSB_DRIVER_BAD_READ_BUFFER_SIZE  -1
+#define MAUSB_DRIVER_RING_EVENTS_STOPPED   -2
+#define MAUSB_DRIVER_SYSTEM_SUSPENDED      -3
+#define MAUSB_DRIVER_COPY_TO_BUFFER_FAILED -4
+
+#define MAUSB_DRIVER_READ_TIMEOUT 0
+#define MAUSB_DRIVER_READ_ERROR  -1
+#define MAUSB_DRIVER_WRITE_ERROR  -2
+
+#endif /* __MAUSB_MAUSB_DRIVER_STATUS_H__ */
diff --git a/drivers/usb/host/mausb/utils.c b/drivers/usb/host/mausb/utils.=
c
index 1cfa2140311e..05ecf03ebdca 100644
--- a/drivers/usb/host/mausb/utils.c
+++ b/drivers/usb/host/mausb/utils.c
@@ -5,13 +5,51 @@
 #include "utils.h"
=20
 #include <linux/fs.h>
+#include <linux/miscdevice.h>
 #include <linux/slab.h>
=20
+#include "mausb_driver_status.h"
+
 #define MAUSB_KERNEL_DEV_NAME "mausb_host"
 #define MAUSB_READ_DEVICE_TIMEOUT_MS 500
=20
 struct miscdevice mausb_host_dev;
=20
+static void mausb_vm_close(struct vm_area_struct *vma)
+{
+=09struct mausb_ring_buffer *buffer =3D NULL, *next =3D NULL;
+=09unsigned long flags =3D 0;
+=09u64 ring_buffer_id =3D *(u64 *)(vma->vm_private_data);
+
+=09dev_info(mausb_host_dev.this_device, "Releasing ring buffer with id: %l=
lu",
+=09=09 ring_buffer_id);
+=09spin_lock_irqsave(&mss.lock, flags);
+=09list_for_each_entry_safe(buffer, next, &mss.available_ring_buffers,
+=09=09=09=09 list_entry) {
+=09=09if (buffer->id =3D=3D ring_buffer_id) {
+=09=09=09list_del(&buffer->list_entry);
+=09=09=09mausb_ring_buffer_destroy(buffer);
+=09=09=09kfree(buffer);
+=09=09=09break;
+=09=09}
+=09}
+=09spin_unlock_irqrestore(&mss.lock, flags);
+}
+
+/*
+ * mausb_vm_fault is called the first time a memory area is accessed which=
 is
+ * not in memory
+ */
+static vm_fault_t mausb_vm_fault(struct vm_fault *vmf)
+{
+=09return 0;
+}
+
+static const struct vm_operations_struct mausb_vm_ops =3D {
+=09.close =3D mausb_vm_close,
+=09.fault =3D mausb_vm_fault,
+};
+
 static int mausb_host_dev_open(struct inode *inode, struct file *filp)
 {
 =09filp->private_data =3D NULL;
@@ -27,9 +65,214 @@ static int mausb_host_dev_release(struct inode *inode, =
struct file *filp)
 =09return 0;
 }
=20
+static ssize_t mausb_host_dev_read(struct file *filp, char __user *user_bu=
ffer,
+=09=09=09=09   size_t size, loff_t *offset)
+{
+=09ssize_t num_of_bytes_to_read =3D MAUSB_MAX_NUM_OF_MA_DEVS *
+=09=09=09=09       sizeof(struct mausb_events_notification);
+=09unsigned long num_of_bytes_not_copied;
+=09int completed_events;
+=09int ring_events;
+=09struct mausb_ring_buffer *ring_buffer;
+=09struct mausb_device=09 *dev;
+=09struct completion=09 *ring_has_events;
+=09u8 current_device =3D 0;
+=09s8 fail_ret_val;
+=09unsigned long flags;
+=09unsigned long timeout;
+=09long status;
+
+=09/* Reset heartbeat timer events */
+=09mausb_reset_heartbeat_cnt();
+
+=09if ((ssize_t)size !=3D num_of_bytes_to_read) {
+=09=09dev_alert(mausb_host_dev.this_device, "The actual size differs from =
the expected number of bytes");
+=09=09fail_ret_val =3D MAUSB_DRIVER_BAD_READ_BUFFER_SIZE;
+=09=09if (copy_to_user(user_buffer, &fail_ret_val,
+=09=09=09=09 sizeof(fail_ret_val)) !=3D 0) {
+=09=09=09dev_warn(mausb_host_dev.this_device, "Failed to set error code.")=
;
+=09=09}
+=09=09return MAUSB_DRIVER_READ_ERROR;
+=09}
+
+=09/* If suspend/hibernate happened delete all devices */
+=09if (atomic_xchg(&mss.num_of_transitions_to_sleep, 0)) {
+=09=09dev_alert(mausb_host_dev.this_device, "Suspend system event detected=
");
+=09=09fail_ret_val =3D MAUSB_DRIVER_SYSTEM_SUSPENDED;
+=09=09if (copy_to_user(user_buffer, &fail_ret_val,
+=09=09=09=09 sizeof(fail_ret_val)) !=3D 0) {
+=09=09=09dev_warn(mausb_host_dev.this_device, "Failed to set error code.")=
;
+=09=09}
+=09=09return MAUSB_DRIVER_READ_ERROR;
+=09}
+
+=09ring_has_events =3D &mss.rings_events.mausb_ring_has_events;
+=09timeout =3D msecs_to_jiffies(MAUSB_READ_DEVICE_TIMEOUT_MS);
+=09status =3D wait_for_completion_interruptible_timeout(ring_has_events,
+=09=09=09=09=09=09=09   timeout);
+=09reinit_completion(ring_has_events);
+
+=09if (atomic_read(&mss.rings_events.mausb_stop_reading_ring_events)) {
+=09=09dev_alert(mausb_host_dev.this_device, "Ring events stopped");
+=09=09fail_ret_val =3D MAUSB_DRIVER_RING_EVENTS_STOPPED;
+=09=09if (copy_to_user(user_buffer, &fail_ret_val,
+=09=09=09=09 sizeof(fail_ret_val)) !=3D 0) {
+=09=09=09dev_warn(mausb_host_dev.this_device, "Failed to set error code.")=
;
+=09=09}
+=09=09return MAUSB_DRIVER_READ_ERROR;
+=09}
+
+=09/* There are no new events - waiting for events hit timeout */
+=09if (status =3D=3D 0)
+=09=09return MAUSB_DRIVER_READ_TIMEOUT;
+
+=09spin_lock_irqsave(&mss.lock, flags);
+
+=09list_for_each_entry(dev, &mss.madev_list, list_entry) {
+=09=09mss.events[current_device].madev_addr =3D dev->madev_addr;
+=09=09ring_buffer =3D dev->ring_buffer;
+=09=09ring_events =3D atomic_xchg(&ring_buffer->mausb_ring_events, 0);
+=09=09completed_events =3D
+=09=09=09atomic_xchg(&ring_buffer->mausb_completed_user_events,
+=09=09=09=09    0);
+=09=09mss.events[current_device].num_of_events =3D (u16)ring_events;
+=09=09mss.events[current_device].num_of_completed_events =3D
+=09=09=09=09(u16)completed_events;
+=09=09if (++current_device =3D=3D MAUSB_MAX_NUM_OF_MA_DEVS)
+=09=09=09break;
+=09}
+
+=09spin_unlock_irqrestore(&mss.lock, flags);
+
+=09num_of_bytes_to_read =3D
+=09=09(ssize_t)(current_device *
+=09=09=09  sizeof(struct mausb_events_notification));
+=09num_of_bytes_not_copied =3D
+=09=09copy_to_user(user_buffer, &mss.events,
+=09=09=09     (unsigned long)num_of_bytes_to_read);
+
+=09dev_vdbg(mausb_host_dev.this_device, "num_of_bytes_not_copied %lu, num_=
of_bytes_to_read %zd",
+=09=09 num_of_bytes_not_copied, num_of_bytes_to_read);
+
+=09if (num_of_bytes_not_copied) {
+=09=09fail_ret_val =3D MAUSB_DRIVER_COPY_TO_BUFFER_FAILED;
+=09=09if (copy_to_user(user_buffer, &fail_ret_val,
+=09=09=09=09 sizeof(fail_ret_val)) !=3D 0) {
+=09=09=09dev_warn(mausb_host_dev.this_device, "Failed to set error code.")=
;
+=09=09}
+=09=09return MAUSB_DRIVER_READ_ERROR;
+=09}
+
+=09return num_of_bytes_to_read;
+}
+
+static ssize_t mausb_host_dev_write(struct file *filp,
+=09=09=09=09    const char __user *buffer, size_t size,
+=09=09=09=09    loff_t *offset)
+{
+=09ssize_t num_of_bytes_to_write =3D
+=09=09=09=09sizeof(struct mausb_events_notification);
+=09struct mausb_events_notification notification;
+=09unsigned long flags;
+=09struct mausb_device *dev;
+
+=09if (size !=3D (size_t)num_of_bytes_to_write) {
+=09=09dev_alert(mausb_host_dev.this_device, "The actual size differs from =
the expected number of bytes");
+=09=09return MAUSB_DRIVER_WRITE_ERROR;
+=09}
+
+=09if (copy_from_user(&notification, buffer, size))
+=09=09return MAUSB_DRIVER_WRITE_ERROR;
+
+=09spin_lock_irqsave(&mss.lock, flags);
+=09dev =3D mausb_get_dev_from_addr_unsafe(notification.madev_addr);
+
+=09if (!dev) {
+=09=09spin_unlock_irqrestore(&mss.lock, flags);
+=09=09return 0;
+=09}
+
+=09spin_lock(&dev->num_of_user_events_lock);
+=09dev->num_of_user_events +=3D notification.num_of_events;
+=09dev->num_of_completed_events +=3D notification.num_of_completed_events;
+=09spin_unlock(&dev->num_of_user_events_lock);
+
+=09queue_work(dev->workq, &dev->work);
+=09spin_unlock_irqrestore(&mss.lock, flags);
+
+=09return num_of_bytes_to_write;
+}
+
+static inline unsigned long mausb_ring_buffer_length(void)
+{
+=09int page_order =3D mausb_get_page_order(2 * MAUSB_RING_BUFFER_SIZE,
+=09=09=09=09=09      sizeof(struct mausb_event));
+=09return PAGE_SIZE << page_order;
+}
+
+static int mausb_mmap(struct file *filp, struct vm_area_struct *vma)
+{
+=09unsigned long size =3D vma->vm_end - vma->vm_start;
+=09int ret;
+=09struct page *page =3D NULL;
+=09unsigned long flags =3D 0;
+=09struct mausb_ring_buffer *ring_buffer =3D kzalloc(sizeof(*ring_buffer),
+=09=09=09=09=09=09=09GFP_KERNEL);
+=09if (!ring_buffer)
+=09=09return -ENOMEM;
+
+=09ret =3D mausb_ring_buffer_init(ring_buffer);
+=09if (ret < 0) {
+=09=09dev_err(mausb_host_dev.this_device, "Ring buffer init failed");
+=09=09goto release_ring_buffer;
+=09}
+
+=09vma->vm_private_data =3D kzalloc(sizeof(ring_buffer->id), GFP_KERNEL);
+=09if (!vma->vm_private_data) {
+=09=09ret =3D -ENOMEM;
+=09=09goto release_ring_buffer;
+=09}
+
+=09filp->private_data =3D vma->vm_private_data;
+
+=09if (size > mausb_ring_buffer_length()) {
+=09=09dev_err(mausb_host_dev.this_device, "Invalid memory size to map");
+=09=09ret =3D -EINVAL;
+=09=09goto release_ring_buffer;
+=09}
+
+=09vma->vm_ops =3D &mausb_vm_ops;
+
+=09page =3D virt_to_page(ring_buffer->to_user_buffer);
+=09ret =3D remap_pfn_range(vma, vma->vm_start, page_to_pfn(page), size,
+=09=09=09      vma->vm_page_prot);
+=09if (ret < 0) {
+=09=09dev_err(mausb_host_dev.this_device, "Could not map the address area"=
);
+=09=09goto release_ring_buffer;
+=09}
+
+=09spin_lock_irqsave(&mss.lock, flags);
+=09ring_buffer->id =3D mss.ring_buffer_id++;
+=09*(u64 *)(vma->vm_private_data) =3D ring_buffer->id;
+=09list_add_tail(&ring_buffer->list_entry, &mss.available_ring_buffers);
+=09dev_info(mausb_host_dev.this_device, "Allocated ring buffer with id: %l=
lu",
+=09=09 ring_buffer->id);
+=09spin_unlock_irqrestore(&mss.lock, flags);
+
+=09return 0;
+
+release_ring_buffer:
+=09mausb_ring_buffer_destroy(ring_buffer);
+=09kfree(ring_buffer);
+=09return ret;
+}
+
 static const struct file_operations mausb_host_dev_fops =3D {
 =09.open=09 =3D mausb_host_dev_open,
 =09.release =3D mausb_host_dev_release,
+=09.read=09 =3D mausb_host_dev_read,
+=09.write   =3D mausb_host_dev_write,
+=09.mmap=09 =3D mausb_mmap,
 };
=20
 int mausb_host_dev_register(void)
@@ -45,3 +288,30 @@ void mausb_host_dev_deregister(void)
 {
 =09misc_deregister(&mausb_host_dev);
 }
+
+void mausb_notify_completed_user_events(struct mausb_ring_buffer *ring_buf=
fer)
+{
+=09int completed;
+
+=09completed =3D
+=09=09atomic_inc_return(&ring_buffer->mausb_completed_user_events);
+=09dev_vdbg(mausb_host_dev.this_device, "mausb_completed_user_events INCRE=
MENTED %d",
+=09=09 completed);
+=09if (completed > MAUSB_RING_BUFFER_SIZE / 16)
+=09=09complete(&mss.rings_events.mausb_ring_has_events);
+}
+
+void mausb_notify_ring_events(struct mausb_ring_buffer *ring_buffer)
+{
+=09int events;
+
+=09events =3D atomic_inc_return(&ring_buffer->mausb_ring_events);
+=09if (events =3D=3D 1)
+=09=09complete(&mss.rings_events.mausb_ring_has_events);
+}
+
+void mausb_stop_ring_events(void)
+{
+=09atomic_set(&mss.rings_events.mausb_stop_reading_ring_events, 1);
+=09complete(&mss.rings_events.mausb_ring_has_events);
+}
diff --git a/drivers/usb/host/mausb/utils.h b/drivers/usb/host/mausb/utils.=
h
index e810e691c39d..37bcf73bc590 100644
--- a/drivers/usb/host/mausb/utils.h
+++ b/drivers/usb/host/mausb/utils.h
@@ -5,11 +5,12 @@
 #ifndef __MAUSB_UTILS_H__
 #define __MAUSB_UTILS_H__
=20
-#include <linux/miscdevice.h>
-
-extern struct miscdevice mausb_host_dev;
+#include "hpal.h"
=20
 int mausb_host_dev_register(void);
 void mausb_host_dev_deregister(void);
+void mausb_notify_completed_user_events(struct mausb_ring_buffer *ring_buf=
fer);
+void mausb_notify_ring_events(struct mausb_ring_buffer *ring_buffer);
+void mausb_stop_ring_events(void);
=20
 #endif /* __MAUSB_UTILS_H__ */
--=20
2.17.1

