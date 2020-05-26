Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D0D391D4DC8
	for <lists+linux-usb@lfdr.de>; Fri, 15 May 2020 14:36:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726521AbgEOMfz (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 15 May 2020 08:35:55 -0400
Received: from eu-smtp-delivery-167.mimecast.com ([146.101.78.167]:60086 "EHLO
        eu-smtp-delivery-167.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726197AbgEOMfa (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 15 May 2020 08:35:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=displaylink.com;
        s=mimecast20151025; t=1589546122;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=UaaFTluE1Qc3glP+qtI2+gfeCdu4G7mdlAo9NoDyfMI=;
        b=wv3T0FW6dzrYSbpTV0/0fW6T90qhQg+r4PBi1c6Vl1lYShbDPl4FfWGMNDenUEPcUpEQse
        ATec8v4pYkCRVzEJybS6/WH9gC30C86mlPZEb/xNjlmkzECOw9bxLpDf+EuVsHSZI39INA
        2cGWcScbRT5OcvdhrvINfd2WckzFWHk=
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2053.outbound.protection.outlook.com [104.47.14.53]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 uk-mta-247-j8GRsXlgPH-ApX4OfzLTfA-5; Fri, 15 May 2020 13:35:21 +0100
X-MC-Unique: j8GRsXlgPH-ApX4OfzLTfA-5
Received: from VI1PR1001MB1056.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:800:64::13) by VI1PR1001MB1230.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:800:dd::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3000.25; Fri, 15 May
 2020 12:35:18 +0000
Received: from VI1PR1001MB1056.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::3cc1:941d:635d:99f7]) by VI1PR1001MB1056.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::3cc1:941d:635d:99f7%11]) with mapi id 15.20.3000.016; Fri, 15 May
 2020 12:35:18 +0000
From:   Vladimir Stankovic <vladimir.stankovic@displaylink.com>
To:     gregkh@linuxfoundation.org
Cc:     linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        mausb-host-devel@displaylink.com
Subject: [PATCH v6 4/8] usb: mausb_host: Implement initial hub handlers
Date:   Fri, 15 May 2020 14:34:58 +0200
Message-Id: <20200515123502.12099-5-vladimir.stankovic@displaylink.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200515123502.12099-1-vladimir.stankovic@displaylink.com>
References: <20200425091954.1610-1-vladimir.stankovic@displaylink.com>
 <20200515123502.12099-1-vladimir.stankovic@displaylink.com>
X-ClientProxiedBy: VI1PR09CA0140.eurprd09.prod.outlook.com
 (2603:10a6:803:12c::24) To VI1PR1001MB1056.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:800:64::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from raven-hp.endava.net (94.189.199.177) by VI1PR09CA0140.eurprd09.prod.outlook.com (2603:10a6:803:12c::24) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3000.25 via Frontend Transport; Fri, 15 May 2020 12:35:18 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [94.189.199.177]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c7b7cd0a-ab79-48a4-cf46-08d7f8cc6d0d
X-MS-TrafficTypeDiagnostic: VI1PR1001MB1230:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR1001MB1230D02C9A4241C209E3F04091BD0@VI1PR1001MB1230.EURPRD10.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:126;
X-Forefront-PRVS: 04041A2886
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vSRVbSQDYrq0n50rpIsb+0SHfrGk0dKta/HkXQ116tYjJB0yO/yAMGijC7P/vHP1RuKsCB6NJ4MPeJC3+SfBOSJTWYOtWqlsiVZulV/Hn5o+TXvZa1xxcN+cx7Ky+B+bTdBFw12lPTLdwe2xZM9Pix4j0+CpRO5h2+OHvZAnXQZEsFt/IYptBzATQ4F/5qkTg0Wovq2HoDOgxS5X5jucGGf1y/PBmPqGZjxASfa3l1Urm1MrRR5xR4xHMVHp5uQEAsNFdr1aql5vF1tD2NQk1r2fy+atBfGeL9ouDHfHJqfuH0OHIB4HKFw+g+v84shpGF0ForuZKEn41dBvWu5CLrHeSKVHsIO44Ht2KzMJIBwzRXQU2Auvj2yAfeIsVspLW1Aq6d/A5DmMwbB9AI9f8vB0v47P6g8gQJOfheYANyiLeZhJEc8DS5ic+AarumZe
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR1001MB1056.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(136003)(396003)(39840400004)(366004)(346002)(376002)(36756003)(86362001)(5660300002)(107886003)(6666004)(66946007)(66476007)(66556008)(2906002)(4326008)(16526019)(956004)(6486002)(8676002)(186003)(8936002)(6512007)(6506007)(30864003)(1076003)(478600001)(26005)(44832011)(6916009)(316002)(2616005)(52116002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: busU4DJcxT9t3KSYlYEJlF6bF9Sshp0Gzom4Q76Kddl2E6UnOUINEDjzcuhrYj3q8ec2L5KgxHA0hDO458a8m8YgQIDP9Zbi/+XtaffjikEv3mdFW7P8YDlOaYeNwjA1zqPWs1T53Dov0DWNGqLsdZGUoIz3X0qDqgbZKcrVfnwVziL+8vEnbBUA7oUw9gNKVProcrq0svnIPE+0Q5AyU5xUzp8MUdxMYjlAgwV1jH2qugyfMaAjhtIBxrNJnVZ48Mg8oAuS2ure+Cgt7KQxnwzaTGDcCQWWdM0ueDboDX4WGEapbL4FgIMImUSrfmw4Fm1tluWprpO0PhTQ6IiR4Ce6PtjtW/m4t/djfJekDKhhN0dBQLXTNlMF69kgZPODklQNPE5NMc0pBQbHkTyMTMj1V4ZkxLcr3cdo9AZUNA3nC6Rq3TNh4Gb8XWN7b6Q8334WZajTxxJWtDrtLv/tMWxhui3EPrSTWbwUjjcby/s=
X-OriginatorOrg: displaylink.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c7b7cd0a-ab79-48a4-cf46-08d7f8cc6d0d
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2020 12:35:18.5501
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: a4bda75a-b444-4312-9c90-44a7c4b2c91a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oYaU/lo62rHrC1r+qfx+bG1Qsi4doQWbXOlHSPTO30h2BTMfj0i/kTM9e1P3AkbUiiQ22QpUt01nRjxLibTS74nwpkTvoJuHl0/c9aZ62UhsbZlgUMSG/WuhdhZYMXbV
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR1001MB1230
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: displaylink.com
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Implemented handlers for subset of HCD events.

Signed-off-by: Vladimir Stankovic <vladimir.stankovic@displaylink.com>
---
 drivers/usb/host/mausb/hcd.c | 925 +++++++++++++++++++++++++++++++++++
 drivers/usb/host/mausb/hcd.h |  86 +++-
 2 files changed, 1008 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/host/mausb/hcd.c b/drivers/usb/host/mausb/hcd.c
index 3a6ef9313dcb..41b88b6f97b1 100644
--- a/drivers/usb/host/mausb/hcd.c
+++ b/drivers/usb/host/mausb/hcd.c
@@ -6,6 +6,7 @@
=20
 #include "utils.h"
=20
+static int mausb_bus_probe(struct device *dev);
 static int mausb_bus_match(struct device *dev, struct device_driver *drv);
=20
 static const struct file_operations mausb_fops;
@@ -20,6 +21,7 @@ static struct class=09*mausb_class;
 static struct bus_type=09mausb_bus_type =3D {
 =09.name=09=3D DEVICE_NAME,
 =09.match=09=3D mausb_bus_match,
+=09.probe=09=3D mausb_bus_probe,
 };
=20
 static struct device_driver mausb_driver =3D {
@@ -46,6 +48,11 @@ static void mausb_remove(void)
 =09mhcd->hcd_hs_ctx =3D NULL;
 }
=20
+static int mausb_bus_probe(struct device *dev)
+{
+=09return mausb_probe(dev);
+}
+
 static int mausb_bus_match(struct device *dev, struct device_driver *drv)
 {
 =09if (strncmp(dev->bus->name, drv->name, strlen(drv->name)))
@@ -91,7 +98,13 @@ int mausb_init_hcd(void)
=20
 =09device->driver =3D &mausb_driver;
=20
+=09retval =3D mausb_probe(device);
+=09if (retval)
+=09=09goto mausb_probe_failed;
+
 =09return retval;
+mausb_probe_failed:
+=09device_destroy(mausb_class, devt);
 device_create_error:
 =09kfree(mhcd);
 =09mhcd =3D NULL;
@@ -118,3 +131,915 @@ void mausb_deinit_hcd(void)
 =09=09unregister_chrdev(major, DEVICE_NAME);
 =09}
 }
+
+static const char driver_name[] =3D "MA-USB host controller";
+
+static void mausb_get_hub_descriptor(struct usb_hcd *hcd, u16 type_req,
+=09=09=09=09     u16 value, u16 index,
+=09=09=09=09     char *buff, u16 length);
+static void mausb_set_port_feature(struct usb_hcd *hcd, u16 type_req,
+=09=09=09=09   u16 value, u16 index, char *buff,
+=09=09=09=09   u16 length);
+static void mausb_get_port_status(struct usb_hcd *hcd, u16 type_req,
+=09=09=09=09  u16 value, u16 index, char *buff,
+=09=09=09=09  u16 length);
+static void mausb_clear_port_feature(struct usb_hcd *hcd, u16 type_req,
+=09=09=09=09     u16 value, u16 index,
+=09=09=09=09     char *buff, u16 length);
+static void mausb_get_hub_status(struct usb_hcd *hcd, u16 type_req,
+=09=09=09=09 u16 value, u16 index, char *buff,
+=09=09=09=09 u16 length);
+static int mausb_add_endpoint(struct usb_hcd *hcd, struct usb_device *dev,
+=09=09=09      struct usb_host_endpoint *endpoint);
+static int mausb_address_device(struct usb_hcd *hcd, struct usb_device *de=
v);
+static int mausb_alloc_dev(struct usb_hcd *hcd, struct usb_device *dev);
+static int mausb_drop_endpoint(struct usb_hcd *hcd, struct usb_device *dev=
,
+=09=09=09       struct usb_host_endpoint *endpoint);
+static int mausb_enable_device(struct usb_hcd *hcd, struct usb_device *dev=
);
+static void mausb_endpoint_reset(struct usb_hcd *hcd,
+=09=09=09=09 struct usb_host_endpoint *endpoint);
+static void mausb_free_dev(struct usb_hcd *hcd, struct usb_device *dev);
+static int mausb_hcd_bus_resume(struct usb_hcd *hcd);
+static int mausb_hcd_bus_suspend(struct usb_hcd *hcd);
+static int mausb_hcd_get_frame_number(struct usb_hcd *hcd);
+static int mausb_hcd_hub_control(struct usb_hcd *hcd, u16 type_req,
+=09=09=09=09 u16 value, u16 index, char *buff,
+=09=09=09=09 u16 length);
+static int mausb_hcd_hub_status(struct usb_hcd *hcd, char *buff);
+static int mausb_hcd_reset(struct usb_hcd *hcd);
+static int mausb_hcd_start(struct usb_hcd *hcd);
+static int mausb_hub_update_device(struct usb_hcd *hcd, struct usb_device =
*dev,
+=09=09=09=09   struct usb_tt *tt, gfp_t mem_flags);
+static int mausb_reset_device(struct usb_hcd *hcd, struct usb_device *dev)=
;
+static int mausb_update_device(struct usb_hcd *hcd, struct usb_device *dev=
);
+
+static const struct hc_driver mausb_hc_driver =3D {
+=09.description  =3D  driver_name,
+=09.product_desc =3D driver_name,
+=09.flags=09      =3D HCD_USB3 | HCD_SHARED,
+
+=09.hcd_priv_size =3D sizeof(struct hub_ctx),
+
+=09.reset =3D mausb_hcd_reset,
+=09.start =3D mausb_hcd_start,
+
+=09.get_frame_number =3D mausb_hcd_get_frame_number,
+
+=09.hub_status_data   =3D mausb_hcd_hub_status,
+=09.hub_control=09   =3D mausb_hcd_hub_control,
+=09.update_hub_device =3D mausb_hub_update_device,
+=09.bus_suspend=09   =3D mausb_hcd_bus_suspend,
+=09.bus_resume=09   =3D mausb_hcd_bus_resume,
+
+=09.alloc_dev=09=3D mausb_alloc_dev,
+=09.free_dev=09=3D mausb_free_dev,
+=09.enable_device=09=3D mausb_enable_device,
+=09.update_device=09=3D mausb_update_device,
+=09.reset_device=09=3D mausb_reset_device,
+
+=09.add_endpoint=09  =3D mausb_add_endpoint,
+=09.drop_endpoint=09  =3D mausb_drop_endpoint,
+=09.address_device   =3D mausb_address_device,
+=09.endpoint_reset=09  =3D mausb_endpoint_reset,
+};
+
+static struct {
+=09struct usb_bos_descriptor    bos;
+=09struct usb_ss_cap_descriptor ss_cap;
+} usb3_bos_desc =3D {
+=09.bos =3D {
+=09=09.bLength=09 =3D USB_DT_BOS_SIZE,
+=09=09.bDescriptorType =3D USB_DT_BOS,
+=09=09.wTotalLength=09 =3D cpu_to_le16(sizeof(usb3_bos_desc)),
+=09=09.bNumDeviceCaps=09 =3D 1
+=09},
+=09.ss_cap =3D {
+=09=09.bLength=09=09=3D USB_DT_USB_SS_CAP_SIZE,
+=09=09.bDescriptorType=09=3D USB_DT_DEVICE_CAPABILITY,
+=09=09.bDevCapabilityType=09=3D USB_SS_CAP_TYPE,
+=09=09.wSpeedSupported=09=3D cpu_to_le16(USB_5GBPS_OPERATION),
+=09=09.bFunctionalitySupport=09=3D ilog2(USB_5GBPS_OPERATION)
+=09}
+};
+
+static int get_root_hub_port_number(struct usb_device *dev, u8 *port_numbe=
r)
+{
+=09struct usb_device *first_hub_device =3D dev;
+
+=09if (!dev->parent) {
+=09=09(*port_number) =3D 0;
+=09=09return -EINVAL;
+=09}
+
+=09while (first_hub_device->parent->parent)
+=09=09first_hub_device =3D first_hub_device->parent;
+
+=09(*port_number) =3D first_hub_device->portnum - 1;
+
+=09return 0;
+}
+
+static struct mausb_usb_device_ctx *mausb_find_usb_device(struct mausb_dev
+=09=09=09=09=09=09=09*mdevs, void *dev_addr)
+{
+=09struct rb_node *node =3D mdevs->usb_devices.rb_node;
+
+=09while (node) {
+=09=09struct mausb_usb_device_ctx *usb_device =3D
+=09=09    rb_entry(node, struct mausb_usb_device_ctx, rb_node);
+
+=09=09if (dev_addr < usb_device->dev_addr)
+=09=09=09node =3D usb_device->rb_node.rb_left;
+=09=09else if (dev_addr > usb_device->dev_addr)
+=09=09=09node =3D usb_device->rb_node.rb_right;
+=09=09else
+=09=09=09return usb_device;
+=09}
+=09return NULL;
+}
+
+static int mausb_hcd_get_frame_number(struct usb_hcd *hcd)
+{
+=09return 0;
+}
+
+static int mausb_hcd_reset(struct usb_hcd *hcd)
+{
+=09if (usb_hcd_is_primary_hcd(hcd)) {
+=09=09hcd->speed =3D HCD_USB2;
+=09=09hcd->self.root_hub->speed =3D USB_SPEED_HIGH;
+=09} else {
+=09=09hcd->speed =3D HCD_USB3;
+=09=09hcd->self.root_hub->speed =3D USB_SPEED_SUPER;
+=09}
+=09hcd->self.no_sg_constraint =3D 1;
+=09hcd->self.sg_tablesize =3D UINT_MAX;
+
+=09return 0;
+}
+
+static int mausb_hcd_start(struct usb_hcd *hcd)
+{
+=09hcd->power_budget =3D 0;
+=09hcd->uses_new_polling =3D 1;
+=09return 0;
+}
+
+static int mausb_hcd_hub_status(struct usb_hcd *hcd, char *buff)
+{
+=09int retval;
+=09int changed;
+=09int i;
+=09struct hub_ctx *hub;
+=09unsigned long flags =3D 0;
+
+=09hub =3D (struct hub_ctx *)hcd->hcd_priv;
+
+=09retval  =3D DIV_ROUND_UP(NUMBER_OF_PORTS + 1, 8);
+=09changed =3D 0;
+
+=09memset(buff, 0, (unsigned int)retval);
+
+=09spin_lock_irqsave(&mhcd->lock, flags);
+
+=09if (!HCD_HW_ACCESSIBLE(hcd)) {
+=09=09dev_info(mausb_host_dev.this_device, "hcd not accessible, hcd speed=
=3D%d",
+=09=09=09 hcd->speed);
+=09=09spin_unlock_irqrestore(&mhcd->lock, flags);
+=09=09return 0;
+=09}
+
+=09for (i =3D 0; i < NUMBER_OF_PORTS; ++i) {
+=09=09if ((hub->ma_devs[i].port_status & PORT_C_MASK)) {
+=09=09=09buff[(i + 1) / 8] |=3D 1 << (i + 1) % 8;
+=09=09=09changed =3D 1;
+=09=09}
+=09}
+
+=09dev_info(mausb_host_dev.this_device, "Usb %d.0 : changed=3D%d, retval=
=3D%d",
+=09=09 (hcd->speed =3D=3D HCD_USB2) ? 2 : 3, changed, retval);
+
+=09if (hcd->state =3D=3D HC_STATE_SUSPENDED && changed =3D=3D 1) {
+=09=09dev_info(mausb_host_dev.this_device, "hcd state is suspended");
+=09=09usb_hcd_resume_root_hub(hcd);
+=09}
+
+=09spin_unlock_irqrestore(&mhcd->lock, flags);
+
+=09return changed ? retval : 0;
+}
+
+static int mausb_hcd_bus_resume(struct usb_hcd *hcd)
+{
+=09unsigned long flags =3D 0;
+
+=09spin_lock_irqsave(&mhcd->lock, flags);
+=09if (!HCD_HW_ACCESSIBLE(hcd)) {
+=09=09dev_info(mausb_host_dev.this_device, "hcd not accessible, hcd speed=
=3D%d",
+=09=09=09 hcd->speed);
+=09=09spin_unlock_irqrestore(&mhcd->lock, flags);
+=09=09return -ESHUTDOWN;
+=09}
+=09hcd->state =3D HC_STATE_RUNNING;
+=09spin_unlock_irqrestore(&mhcd->lock, flags);
+
+=09return 0;
+}
+
+static int mausb_hcd_bus_suspend(struct usb_hcd *hcd)
+{
+=09unsigned long flags =3D 0;
+
+=09spin_lock_irqsave(&mhcd->lock, flags);
+=09hcd->state =3D HC_STATE_SUSPENDED;
+=09spin_unlock_irqrestore(&mhcd->lock, flags);
+
+=09return 0;
+}
+
+static int mausb_hcd_hub_control(struct usb_hcd *hcd, u16 type_req,
+=09=09=09=09 u16 value, u16 index, char *buff,
+=09=09=09=09 u16 length)
+{
+=09int retval =3D 0;
+=09struct hub_ctx=09 *hub =3D (struct hub_ctx *)hcd->hcd_priv;
+=09struct mausb_hcd *hub_mhcd =3D hub->mhcd;
+=09unsigned long=09 flags;
+=09bool invalid_rhport =3D false;
+
+=09index =3D ((__u8)(index & 0x00ff));
+=09if (index < 1 || index > NUMBER_OF_PORTS)
+=09=09invalid_rhport =3D true;
+
+=09dev_vdbg(mausb_host_dev.this_device, "TypeReq=3D%d", type_req);
+
+=09spin_lock_irqsave(&hub_mhcd->lock, flags);
+
+=09if (!HCD_HW_ACCESSIBLE(hcd)) {
+=09=09dev_err(mausb_host_dev.this_device, "hcd not accessible, hcd speed=
=3D%d",
+=09=09=09hcd->speed);
+=09=09spin_unlock_irqrestore(&hub_mhcd->lock, flags);
+=09=09return -ETIMEDOUT;
+=09}
+
+=09switch (type_req) {
+=09case ClearHubFeature:
+=09=09break;
+=09case ClearPortFeature:
+=09=09if (invalid_rhport)
+=09=09=09goto invalid_port;
+
+=09=09mausb_clear_port_feature(hcd, type_req, value, index, buff,
+=09=09=09=09=09 length);
+=09=09break;
+=09case DeviceRequest | USB_REQ_GET_DESCRIPTOR:
+=09=09memcpy(buff, &usb3_bos_desc, sizeof(usb3_bos_desc));
+=09=09retval =3D sizeof(usb3_bos_desc);
+=09=09break;
+=09case GetHubDescriptor:
+=09=09mausb_get_hub_descriptor(hcd, type_req, value, index, buff,
+=09=09=09=09=09 length);
+=09=09break;
+=09case GetHubStatus:
+=09=09mausb_get_hub_status(hcd, type_req, value, index, buff,
+=09=09=09=09     length);
+=09=09break;
+=09case GetPortStatus:
+=09=09if (invalid_rhport)
+=09=09=09goto invalid_port;
+
+=09=09mausb_get_port_status(hcd, type_req, value, index, buff,
+=09=09=09=09      length);
+=09=09break;
+=09case SetHubFeature:
+=09=09retval =3D -EPIPE;
+=09=09break;
+=09case SetPortFeature:
+=09=09if (invalid_rhport)
+=09=09=09goto invalid_port;
+
+=09=09mausb_set_port_feature(hcd, type_req, value, index, buff,
+=09=09=09=09       length);
+=09=09break;
+=09default:
+=09=09retval =3D -EPIPE;
+=09}
+
+invalid_port:
+=09spin_unlock_irqrestore(&hub_mhcd->lock, flags);
+=09return retval;
+}
+
+int mausb_probe(struct device *dev)
+{
+=09struct mausb_hcd *mausb_hcd;
+=09struct usb_hcd=09 *hcd_ss;
+=09struct usb_hcd=09 *hcd_hs;
+=09int ret;
+
+=09mausb_hcd =3D dev_get_drvdata(dev);
+=09spin_lock_init(&mausb_hcd->lock);
+
+=09hcd_hs =3D usb_create_hcd(&mausb_hc_driver, dev, dev_name(dev));
+=09if (!hcd_hs)
+=09=09return -ENOMEM;
+
+=09hcd_hs->has_tt =3D 1;
+=09mausb_hcd->hcd_hs_ctx=09    =3D (struct hub_ctx *)hcd_hs->hcd_priv;
+=09mausb_hcd->hcd_hs_ctx->mhcd =3D mausb_hcd;
+=09mausb_hcd->hcd_hs_ctx->hcd  =3D hcd_hs;
+=09memset(mausb_hcd->hcd_hs_ctx->ma_devs, 0,
+=09       sizeof(struct mausb_dev) * NUMBER_OF_PORTS);
+
+=09ret =3D usb_add_hcd(hcd_hs, 0, 0);
+=09if (ret) {
+=09=09dev_err(dev, "usb_add_hcd failed");
+=09=09goto put_hcd_hs;
+=09}
+
+=09hcd_ss =3D usb_create_shared_hcd(&mausb_hc_driver, dev, dev_name(dev),
+=09=09=09=09       hcd_hs);
+=09if (!hcd_ss) {
+=09=09ret =3D -ENOMEM;
+=09=09goto remove_hcd_hs;
+=09}
+=09mausb_hcd->hcd_ss_ctx=09    =3D (struct hub_ctx *)hcd_ss->hcd_priv;
+=09mausb_hcd->hcd_ss_ctx->mhcd =3D mausb_hcd;
+=09mausb_hcd->hcd_ss_ctx->hcd  =3D hcd_ss;
+
+=09memset(mausb_hcd->hcd_ss_ctx->ma_devs, 0,
+=09       sizeof(struct mausb_dev) * NUMBER_OF_PORTS);
+
+=09ret =3D usb_add_hcd(hcd_ss, 0, 0);
+=09if (ret) {
+=09=09dev_err(dev, "usb_add_hcd failed");
+=09=09goto put_hcd_ss;
+=09}
+
+=09return ret;
+
+put_hcd_ss:
+=09usb_put_hcd(hcd_ss);
+remove_hcd_hs:
+=09usb_remove_hcd(hcd_hs);
+put_hcd_hs:
+=09usb_put_hcd(hcd_hs);
+=09mausb_hcd->hcd_hs_ctx =3D NULL;
+=09mausb_hcd->hcd_ss_ctx =3D NULL;
+=09return ret;
+}
+
+static void mausb_get_hub_descriptor(struct usb_hcd *hcd, u16 type_req,
+=09=09=09=09     u16 value, u16 index,
+=09=09=09=09     char *buff, u16 length)
+{
+=09u8 width;
+=09struct usb_hub_descriptor *desc =3D (struct usb_hub_descriptor *)buff;
+
+=09memset(desc, 0, sizeof(struct usb_hub_descriptor));
+
+=09if (hcd->speed =3D=3D HCD_USB3) {
+=09=09desc->bDescriptorType=09   =3D USB_DT_SS_HUB;
+=09=09desc->bDescLength=09   =3D 12;
+=09=09desc->wHubCharacteristics  =3D
+=09=09    cpu_to_le16(HUB_CHAR_INDV_PORT_LPSM | HUB_CHAR_COMMON_OCPM);
+=09=09desc->bNbrPorts=09=09   =3D NUMBER_OF_PORTS;
+=09=09desc->u.ss.bHubHdrDecLat   =3D 0x04;
+=09=09desc->u.ss.DeviceRemovable =3D cpu_to_le16(0xffff);
+=09} else {
+=09=09desc->bDescriptorType=09  =3D USB_DT_HUB;
+=09=09desc->wHubCharacteristics =3D
+=09=09    cpu_to_le16(HUB_CHAR_INDV_PORT_LPSM | HUB_CHAR_COMMON_OCPM);
+=09=09desc->bNbrPorts=09=09  =3D NUMBER_OF_PORTS;
+=09=09width=09=09=09  =3D (u8)(desc->bNbrPorts / 8 + 1);
+=09=09desc->bDescLength=09  =3D USB_DT_HUB_NONVAR_SIZE + 2 * width;
+
+=09=09memset(&desc->u.hs.DeviceRemovable[0], 0, width);
+=09=09memset(&desc->u.hs.DeviceRemovable[width], 0xff, width);
+=09}
+}
+
+static void mausb_set_port_feature(struct usb_hcd *hcd, u16 type_req,
+=09=09=09=09   u16 value, u16 index, char *buff,
+=09=09=09=09   u16 length)
+{
+=09struct hub_ctx *hub =3D (struct hub_ctx *)hcd->hcd_priv;
+
+=09index =3D ((__u8)(index & 0x00ff));
+
+=09switch (value) {
+=09case USB_PORT_FEAT_LINK_STATE:
+=09=09dev_vdbg(mausb_host_dev.this_device, "USB_PORT_FEAT_LINK_STATE");
+=09=09if (hcd->speed =3D=3D HCD_USB3) {
+=09=09=09if ((hub->ma_devs[index - 1].port_status &
+=09=09=09     USB_SS_PORT_STAT_POWER) !=3D 0) {
+=09=09=09=09hub->ma_devs[index - 1].port_status |=3D
+=09=09=09=09    (1U << value);
+=09=09=09}
+=09=09} else {
+=09=09=09if ((hub->ma_devs[index - 1].port_status &
+=09=09=09     USB_PORT_STAT_POWER) !=3D 0) {
+=09=09=09=09hub->ma_devs[index - 1].port_status |=3D
+=09=09=09=09    (1U << value);
+=09=09=09}
+=09=09}
+=09=09break;
+=09case USB_PORT_FEAT_U1_TIMEOUT:
+=09case USB_PORT_FEAT_U2_TIMEOUT:
+=09=09break;
+=09case USB_PORT_FEAT_SUSPEND:
+=09=09break;
+=09case USB_PORT_FEAT_POWER:
+=09=09dev_vdbg(mausb_host_dev.this_device, "USB_PORT_FEAT_POWER");
+
+=09=09if (hcd->speed =3D=3D HCD_USB3) {
+=09=09=09hub->ma_devs[index - 1].port_status |=3D
+=09=09=09    USB_SS_PORT_STAT_POWER;
+=09=09} else {
+=09=09=09hub->ma_devs[index - 1].port_status |=3D
+=09=09=09    USB_PORT_STAT_POWER;
+=09=09}
+=09=09break;
+=09case USB_PORT_FEAT_BH_PORT_RESET:
+=09=09dev_dbg(mausb_host_dev.this_device, "USB_PORT_FEAT_BH_PORT_RESET");
+=09=09/* fall through */
+=09case USB_PORT_FEAT_RESET:
+=09=09dev_vdbg(mausb_host_dev.this_device, "USB_PORT_FEAT_RESET hcd->speed=
=3D%d",
+=09=09=09 hcd->speed);
+
+=09=09if (hcd->speed =3D=3D HCD_USB3) {
+=09=09=09hub->ma_devs[index - 1].port_status =3D 0;
+=09=09=09hub->ma_devs[index - 1].port_status =3D
+=09=09=09    (USB_SS_PORT_STAT_POWER |
+=09=09=09     USB_PORT_STAT_CONNECTION | USB_PORT_STAT_RESET);
+=09=09} else if (hub->ma_devs[index - 1].port_status
+=09=09=09   & USB_PORT_STAT_ENABLE) {
+=09=09=09hub->ma_devs[index - 1].port_status &=3D
+=09=09=09    ~(USB_PORT_STAT_ENABLE |
+=09=09=09      USB_PORT_STAT_LOW_SPEED |
+=09=09=09      USB_PORT_STAT_HIGH_SPEED);
+=09=09}
+=09=09/* fall through */
+=09default:
+=09=09dev_vdbg(mausb_host_dev.this_device, "Default value=3D%d", value);
+
+=09=09if (hcd->speed =3D=3D HCD_USB3) {
+=09=09=09if ((hub->ma_devs[index - 1].port_status &
+=09=09=09     USB_SS_PORT_STAT_POWER) !=3D 0) {
+=09=09=09=09hub->ma_devs[index - 1].port_status |=3D
+=09=09=09=09    (1U << value);
+=09=09=09}
+=09=09} else {
+=09=09=09if ((hub->ma_devs[index - 1].port_status &
+=09=09=09     USB_PORT_STAT_POWER) !=3D 0) {
+=09=09=09=09hub->ma_devs[index - 1].port_status |=3D
+=09=09=09=09    (1U << value);
+=09=09=09}
+=09=09}
+=09}
+}
+
+static void mausb_get_port_status(struct usb_hcd *hcd, u16 type_req,
+=09=09=09=09  u16 value, u16 index, char *buff,
+=09=09=09=09  u16 length)
+{
+=09u8 dev_speed;
+=09struct hub_ctx *hub =3D (struct hub_ctx *)hcd->hcd_priv;
+
+=09index =3D ((__u8)(index & 0x00ff));
+
+=09if ((hub->ma_devs[index - 1].port_status &
+=09=09=09=09(1 << USB_PORT_FEAT_RESET)) !=3D 0) {
+=09=09dev_info(mausb_host_dev.this_device, "Finished reset hcd->speed=3D%d=
",
+=09=09=09 hcd->speed);
+
+=09=09dev_speed =3D hub->ma_devs[index - 1].dev_speed;
+=09=09switch (dev_speed) {
+=09=09case LOW_SPEED:
+=09=09=09hub->ma_devs[index - 1].port_status |=3D
+=09=09=09    USB_PORT_STAT_LOW_SPEED;
+=09=09=09break;
+=09=09case HIGH_SPEED:
+=09=09=09hub->ma_devs[index - 1].port_status |=3D
+=09=09=09    USB_PORT_STAT_HIGH_SPEED;
+=09=09=09break;
+=09=09default:
+=09=09=09dev_info(mausb_host_dev.this_device, "Not updating port_status fo=
r device speed %d",
+=09=09=09=09 dev_speed);
+=09=09}
+
+=09=09hub->ma_devs[index - 1].port_status |=3D
+=09=09    (1 << USB_PORT_FEAT_C_RESET) | USB_PORT_STAT_ENABLE;
+=09=09hub->ma_devs[index - 1].port_status &=3D
+=09=09    ~(1 << USB_PORT_FEAT_RESET);
+=09}
+
+=09((__le16 *)buff)[0] =3D cpu_to_le16(hub->ma_devs[index - 1].port_status=
);
+=09((__le16 *)buff)[1] =3D
+=09    cpu_to_le16(hub->ma_devs[index - 1].port_status >> 16);
+
+=09dev_vdbg(mausb_host_dev.this_device, "port_status=3D%d",
+=09=09 hub->ma_devs[index - 1].port_status);
+}
+
+static void mausb_clear_port_feature(struct usb_hcd *hcd, u16 type_req,
+=09=09=09=09     u16 value, u16 index,
+=09=09=09=09     char *buff, u16 length)
+{
+=09struct hub_ctx *hub =3D (struct hub_ctx *)hcd->hcd_priv;
+
+=09index =3D ((__u8)(index & 0x00ff));
+
+=09switch (value) {
+=09case USB_PORT_FEAT_SUSPEND:
+=09=09break;
+=09case USB_PORT_FEAT_POWER:
+=09=09dev_vdbg(mausb_host_dev.this_device, "USB_PORT_FEAT_POWER");
+
+=09=09if (hcd->speed =3D=3D HCD_USB3) {
+=09=09=09hub->ma_devs[index - 1].port_status &=3D
+=09=09=09    ~USB_SS_PORT_STAT_POWER;
+=09=09} else {
+=09=09=09hub->ma_devs[index - 1].port_status &=3D
+=09=09=09    ~USB_PORT_STAT_POWER;
+=09=09}
+=09=09break;
+=09case USB_PORT_FEAT_RESET:
+=09case USB_PORT_FEAT_C_RESET:
+=09default:
+=09=09dev_vdbg(mausb_host_dev.this_device, "Default value: %d",
+=09=09=09 value);
+
+=09=09hub->ma_devs[index - 1].port_status &=3D ~(1 << value);
+=09}
+}
+
+static void mausb_get_hub_status(struct usb_hcd *hcd, u16 type_req,
+=09=09=09=09 u16 value, u16 index, char *buff,
+=09=09=09=09 u16 length)
+{
+=09*(__le32 *)buff =3D cpu_to_le32(0);
+}
+
+static int mausb_alloc_dev(struct usb_hcd *hcd, struct usb_device *dev)
+{
+=09dev_info(mausb_host_dev.this_device, "Usb device=3D%p", dev);
+
+=09return 1;
+}
+
+static void mausb_free_dev(struct usb_hcd *hcd, struct usb_device *dev)
+{
+=09u8=09port_number;
+=09s16=09dev_handle;
+=09int=09status;
+=09struct hub_ctx   *hub  =3D (struct hub_ctx *)hcd->hcd_priv;
+=09struct mausb_dev=09    *mdev =3D NULL;
+=09struct mausb_usb_device_ctx *usb_device_ctx;
+=09struct mausb_endpoint_ctx   *ep_ctx =3D dev->ep0.hcpriv;
+
+=09status =3D get_root_hub_port_number(dev, &port_number);
+=09if (status < 0 || port_number >=3D NUMBER_OF_PORTS) {
+=09=09dev_dbg(mausb_host_dev.this_device, "port_number out of range, port_=
number=3D%x",
+=09=09=09port_number);
+=09=09return;
+=09}
+
+=09mdev  =3D &hub->ma_devs[port_number];
+
+=09usb_device_ctx =3D mausb_find_usb_device(mdev, dev);
+=09if (!usb_device_ctx) {
+=09=09dev_warn(mausb_host_dev.this_device, "device_ctx is not found");
+=09=09return;
+=09}
+
+=09dev_handle =3D usb_device_ctx->dev_handle;
+
+=09if (ep_ctx) {
+=09=09dev->ep0.hcpriv =3D NULL;
+=09=09kfree(ep_ctx);
+=09} else {
+=09=09dev_warn(mausb_host_dev.this_device, "ep_ctx is NULL: dev_handle=3D%=
#x",
+=09=09=09 dev_handle);
+=09}
+
+=09rb_erase(&usb_device_ctx->rb_node, &mdev->usb_devices);
+=09dev_info(mausb_host_dev.this_device, "USB device deleted device=3D%p",
+=09=09 usb_device_ctx->dev_addr);
+=09kfree(usb_device_ctx);
+}
+
+static int mausb_address_device(struct usb_hcd *hcd, struct usb_device *de=
v)
+{
+=09u8=09port_number;
+=09int=09status;
+=09struct hub_ctx=09*hub =3D (struct hub_ctx *)hcd->hcd_priv;
+=09struct mausb_usb_device_ctx *usb_device_ctx;
+=09struct mausb_endpoint_ctx   *endpoint_ctx;
+
+=09status =3D get_root_hub_port_number(dev, &port_number);
+=09if (status < 0 || port_number >=3D NUMBER_OF_PORTS) {
+=09=09dev_warn(&dev->dev, "port_number out of range, port_number=3D%x",
+=09=09=09 port_number);
+=09=09return -EINVAL;
+=09}
+
+=09usb_device_ctx =3D mausb_find_usb_device(&hub->ma_devs[port_number], de=
v);
+=09if (!usb_device_ctx)
+=09=09return -ENODEV;
+
+=09dev_info(&dev->dev, "dev_handle=3D%#x, dev_speed=3D%#x",
+=09=09 usb_device_ctx->dev_handle, dev->speed);
+
+=09if (dev->speed >=3D USB_SPEED_SUPER)
+=09=09dev_info(&dev->dev, "USB 3.0");
+=09else
+=09=09dev_info(&dev->dev, "USB 2.0");
+
+=09if (usb_device_ctx->dev_handle =3D=3D DEV_HANDLE_NOT_ASSIGNED) {
+=09=09status =3D mausb_enable_device(hcd, dev);
+=09=09if (status < 0)
+=09=09=09return status;
+=09}
+
+=09endpoint_ctx =3D dev->ep0.hcpriv;
+=09if (!endpoint_ctx) {
+=09=09dev_err(&dev->dev, "endpoint_ctx is NULL: dev_handle=3D%#x",
+=09=09=09usb_device_ctx->dev_handle);
+=09=09return -EINVAL;
+=09}
+
+=09return 0;
+}
+
+static int mausb_add_endpoint(struct usb_hcd *hcd, struct usb_device *dev,
+=09=09=09      struct usb_host_endpoint *endpoint)
+{
+=09int=09status;
+=09u8=09port_number;
+=09struct hub_ctx=09=09    *hub =3D (struct hub_ctx *)hcd->hcd_priv;
+=09struct mausb_usb_device_ctx *usb_dev_ctx;
+=09struct mausb_endpoint_ctx   *endpoint_ctx;
+
+=09status =3D get_root_hub_port_number(dev, &port_number);
+=09if (status < 0 || port_number >=3D NUMBER_OF_PORTS) {
+=09=09dev_dbg(&dev->dev, "port_number out of range, port_number=3D%x",
+=09=09=09port_number);
+=09=09return 0;
+=09}
+
+=09usb_dev_ctx =3D mausb_find_usb_device(&hub->ma_devs[port_number], dev);
+=09if (!usb_dev_ctx) {
+=09=09dev_warn(&dev->dev, "Device not found");
+=09=09return -ENODEV;
+=09}
+
+=09endpoint_ctx =3D kzalloc(sizeof(*endpoint_ctx), GFP_ATOMIC);
+=09if (!endpoint_ctx)
+=09=09return -ENOMEM;
+
+=09endpoint_ctx->dev_handle=09=3D usb_dev_ctx->dev_handle;
+=09endpoint_ctx->usb_device_ctx=09=3D usb_dev_ctx;
+=09endpoint->hcpriv=09=09=3D endpoint_ctx;
+
+=09return 0;
+}
+
+static int mausb_drop_endpoint(struct usb_hcd *hcd, struct usb_device *dev=
,
+=09=09=09       struct usb_host_endpoint *endpoint)
+{
+=09u8=09port_number;
+=09int=09status;
+=09struct hub_ctx=09=09    *hub =3D (struct hub_ctx *)hcd->hcd_priv;
+=09struct mausb_usb_device_ctx *usb_dev_ctx;
+=09struct mausb_endpoint_ctx   *endpoint_ctx =3D endpoint->hcpriv;
+
+=09status =3D get_root_hub_port_number(dev, &port_number);
+=09if (status < 0 || port_number >=3D NUMBER_OF_PORTS) {
+=09=09dev_dbg(&dev->dev, "port_number out of range, port_number=3D%x",
+=09=09=09port_number);
+=09=09return -EINVAL;
+=09}
+
+=09usb_dev_ctx =3D mausb_find_usb_device(&hub->ma_devs[port_number], dev);
+
+=09if (!endpoint_ctx) {
+=09=09dev_err(&dev->dev, "Endpoint context doesn't exist");
+=09=09return 0;
+=09}
+=09if (!usb_dev_ctx) {
+=09=09dev_err(&dev->dev, "Usb device context doesn't exist");
+=09=09return -ENODEV;
+=09}
+
+=09endpoint->hcpriv =3D NULL;
+=09kfree(endpoint_ctx);
+=09return 0;
+}
+
+static int mausb_enable_device(struct usb_hcd *hcd, struct usb_device *dev=
)
+{
+=09int status;
+=09u8 port_number;
+=09struct hub_ctx=09=09    *hub =3D (struct hub_ctx *)hcd->hcd_priv;
+=09struct mausb_usb_device_ctx *usb_device_ctx;
+
+=09status =3D get_root_hub_port_number(dev, &port_number);
+=09if (status < 0 || port_number >=3D NUMBER_OF_PORTS) {
+=09=09dev_dbg(mausb_host_dev.this_device, "port_number out of range, port_=
number=3D%x",
+=09=09=09port_number);
+=09=09return -EINVAL;
+=09}
+
+=09usb_device_ctx =3D mausb_find_usb_device(&hub->ma_devs[port_number], de=
v);
+=09if (!usb_device_ctx)
+=09=09return -ENODEV;
+
+=09dev_info(mausb_host_dev.this_device, "Device assigned and addressed usb=
_device_ctx=3D%p",
+=09=09 usb_device_ctx);
+
+=09return 0;
+}
+
+static int mausb_is_hub_device(struct usb_device *dev)
+{
+=09return dev->descriptor.bDeviceClass =3D=3D 0x09;
+}
+
+static int mausb_update_device(struct usb_hcd *hcd, struct usb_device *dev=
)
+{
+=09u8=09port_number =3D 0;
+=09int=09status=09    =3D 0;
+=09struct hub_ctx=09=09    *hub =3D (struct hub_ctx *)hcd->hcd_priv;
+=09struct mausb_usb_device_ctx *usb_device_ctx =3D NULL;
+
+=09if (mausb_is_hub_device(dev)) {
+=09=09dev_warn(mausb_host_dev.this_device, "Device is hub");
+=09=09return 0;
+=09}
+
+=09status =3D get_root_hub_port_number(dev, &port_number);
+=09if (status < 0 || port_number >=3D NUMBER_OF_PORTS) {
+=09=09dev_dbg(mausb_host_dev.this_device, "port_number out of range, port_=
number=3D%x",
+=09=09=09port_number);
+=09=09return -EINVAL;
+=09}
+
+=09usb_device_ctx =3D mausb_find_usb_device(&hub->ma_devs[port_number], de=
v);
+=09if (!usb_device_ctx) {
+=09=09dev_warn(mausb_host_dev.this_device, "Device not found");
+=09=09return -ENODEV;
+=09}
+
+=09return 0;
+}
+
+static int mausb_hub_update_device(struct usb_hcd *hcd, struct usb_device =
*dev,
+=09=09=09=09   struct usb_tt *tt, gfp_t mem_flags)
+{
+=09int=09status;
+=09u8=09port_number;
+=09u16 max_exit_latency =3D 0;
+=09u8  mtt =3D 0;
+=09u8  ttt =3D 0;
+=09struct hub_ctx=09=09    *hub =3D (struct hub_ctx *)hcd->hcd_priv;
+=09struct mausb_usb_device_ctx *usb_device_ctx;
+
+=09if (dev->speed =3D=3D USB_SPEED_HIGH) {
+=09=09mtt =3D tt->multi =3D=3D 0 ? 1 : 0;
+=09=09ttt =3D (u8)tt->think_time;
+=09}
+
+=09status =3D get_root_hub_port_number(dev, &port_number);
+=09if (status < 0 || port_number >=3D NUMBER_OF_PORTS) {
+=09=09dev_dbg(mausb_host_dev.this_device, "port_number out of range, port_=
number=3D%x",
+=09=09=09port_number);
+=09=09return 0;
+=09}
+
+=09usb_device_ctx =3D mausb_find_usb_device(&hub->ma_devs[port_number],
+=09=09=09=09=09       dev);
+
+=09if (!usb_device_ctx) {
+=09=09dev_err(mausb_host_dev.this_device, "USB device not found");
+=09=09return -ENODEV;
+=09}
+
+=09if (dev->usb3_lpm_u1_enabled)
+=09=09max_exit_latency =3D (u16)dev->u1_params.mel;
+=09else if (dev->usb3_lpm_u2_enabled)
+=09=09max_exit_latency =3D (u16)dev->u2_params.mel;
+
+=09return 0;
+}
+
+static void mausb_endpoint_reset(struct usb_hcd *hcd,
+=09=09=09=09 struct usb_host_endpoint *endpoint)
+{
+=09int status;
+=09int is_control;
+=09int epnum;
+=09int is_out;
+=09u16=09dev_handle;
+=09u8=09tsp;
+=09u8=09port_number;
+=09struct hub_ctx=09=09    *hub;
+=09struct mausb_usb_device_ctx *usb_device_ctx;
+=09struct usb_device=09    *dev;
+=09struct mausb_endpoint_ctx   *ep_ctx;
+
+=09ep_ctx =3D endpoint->hcpriv;
+=09if (!ep_ctx)
+=09=09return;
+
+=09usb_device_ctx=09=3D ep_ctx->usb_device_ctx;
+=09dev_handle=09=3D usb_device_ctx->dev_handle;
+=09dev=09=09=3D usb_device_ctx->dev_addr;
+
+=09status =3D get_root_hub_port_number(dev, &port_number);
+=09if (status < 0 || port_number >=3D NUMBER_OF_PORTS) {
+=09=09dev_dbg(&dev->dev, "port_number out of range, port_number=3D%x",
+=09=09=09port_number);
+=09=09return;
+=09}
+=09hub =3D (struct hub_ctx *)hcd->hcd_priv;
+
+=09is_control =3D usb_endpoint_xfer_control(&endpoint->desc);
+=09epnum =3D usb_endpoint_num(&endpoint->desc);
+=09is_out =3D usb_endpoint_dir_out(&endpoint->desc);
+=09tsp =3D (u8)(is_out ? dev->toggle[1] : dev->toggle[0]);
+
+=09if (status < 0)
+=09=09return;
+
+=09if (status !=3D EUCLEAN) {
+=09=09if (!tsp) {
+=09=09=09usb_settoggle(dev, epnum, is_out, 0U);
+=09=09=09if (is_control)
+=09=09=09=09usb_settoggle(dev, epnum, !is_out, 0U);
+=09=09}
+
+=09=09return;
+=09}
+
+=09if (tsp)
+=09=09return;
+
+=09dev_info(&dev->dev, "ep_handle request status=3D%d, ep_handle=3D%#x, de=
v_handle=3D%#x",
+=09=09 status, ep_ctx->ep_handle, dev_handle);
+}
+
+static int mausb_reset_device(struct usb_hcd *hcd, struct usb_device *dev)
+{
+=09int status;
+=09u8  port_number;
+=09u16 dev_handle;
+=09struct hub_ctx=09=09    *hub;
+=09struct mausb_usb_device_ctx *usb_device_ctx;
+
+=09hub =3D (struct hub_ctx *)hcd->hcd_priv;
+
+=09status =3D get_root_hub_port_number(dev, &port_number);
+=09if (status < 0 || port_number >=3D NUMBER_OF_PORTS) {
+=09=09dev_dbg(mausb_host_dev.this_device, "port_number out of range, port_=
number=3D%x",
+=09=09=09port_number);
+=09=09return -EINVAL;
+=09}
+
+=09usb_device_ctx =3D mausb_find_usb_device(&hub->ma_devs[port_number], de=
v);
+
+=09if (!usb_device_ctx ||
+=09    usb_device_ctx->dev_handle =3D=3D DEV_HANDLE_NOT_ASSIGNED)
+=09=09return 0;
+
+=09dev_handle =3D usb_device_ctx->dev_handle;
+
+=09return 0;
+}
+
+void mausb_clear_hcd_madev(u16 port_number)
+{
+=09unsigned long flags =3D 0;
+
+=09if (port_number >=3D NUMBER_OF_PORTS) {
+=09=09dev_err(mausb_host_dev.this_device, "port_number out of range, port_=
number=3D%x",
+=09=09=09port_number);
+=09=09return;
+=09}
+
+=09spin_lock_irqsave(&mhcd->lock, flags);
+
+=09memset(&mhcd->hcd_hs_ctx->ma_devs[port_number], 0,
+=09       sizeof(struct mausb_dev));
+=09memset(&mhcd->hcd_ss_ctx->ma_devs[port_number], 0,
+=09       sizeof(struct mausb_dev));
+
+=09mhcd->connected_ports &=3D ~(1 << port_number);
+
+=09mhcd->hcd_hs_ctx->ma_devs[port_number].port_status =3D
+=09=09=09=09=09=09=09USB_PORT_STAT_POWER;
+=09mhcd->hcd_ss_ctx->ma_devs[port_number].port_status =3D
+=09=09=09=09=09=09=09USB_SS_PORT_STAT_POWER;
+
+=09spin_unlock_irqrestore(&mhcd->lock, flags);
+}
diff --git a/drivers/usb/host/mausb/hcd.h b/drivers/usb/host/mausb/hcd.h
index e2374af67663..c0818edc0266 100644
--- a/drivers/usb/host/mausb/hcd.h
+++ b/drivers/usb/host/mausb/hcd.h
@@ -18,9 +18,6 @@
=20
 #define RESPONSE_TIMEOUT=095000
=20
-#define MAUSB_PORT_20_STATUS_LOW_SPEED       0x0200
-#define MAUSB_PORT_20_STATUS_HIGH_SPEED      0x0400
-
 enum mausb_device_type {
 =09USBDEVICE =3D 0,
 =09USB20HUB  =3D 1,
@@ -62,4 +59,87 @@ struct hub_ctx {
 int mausb_init_hcd(void);
 void mausb_deinit_hcd(void);
=20
+#define PORT_C_MASK \
+=09=09((USB_PORT_STAT_C_CONNECTION \
+=09=09| USB_PORT_STAT_C_ENABLE \
+=09=09| USB_PORT_STAT_C_SUSPEND \
+=09=09| USB_PORT_STAT_C_OVERCURRENT \
+=09=09| USB_PORT_STAT_C_RESET) << 16)
+
+#define MAUSB_PORT_20_STATUS_CONNECT         0x0001
+#define MAUSB_PORT_20_STATUS_ENABLE          0x0002
+#define MAUSB_PORT_20_STATUS_SUSPEND         0x0004
+#define MAUSB_PORT_20_STATUS_OVER_CURRENT    0x0008
+#define MAUSB_PORT_20_STATUS_RESET           0x0010
+#define MAUSB_PORT_20_STATUS_POWER           0x0100
+#define MAUSB_PORT_20_STATUS_LOW_SPEED       0x0200
+#define MAUSB_PORT_20_STATUS_HIGH_SPEED      0x0400
+
+#define MAUSB_CHANGE_PORT_20_STATUS_CONNECT  0x010000
+#define MAUSB_CHANGE_PORT_20_STATUS_RESET    0x100000
+
+/* USB 3.2 specification chapter 10.16.2.6.1 table 10-13 page 440 */
+#define MAUSB_PORT_30_STATUS_CONNECT              0x0001
+#define MAUSB_PORT_30_STATUS_ENABLE               0x0002
+#define MAUSB_PORT_30_STATUS_OVER_CURRENT         0x0008
+#define MAUSB_PORT_30_STATUS_RESET                0x0010
+#define MAUSB_PORT_30_LINK_STATE_U0               0x0000
+#define MAUSB_PORT_30_LINK_STATE_U1               0x0020
+#define MAUSB_PORT_30_LINK_STATE_U2               0x0040
+#define MAUSB_PORT_30_LINK_STATE_U3               0x0060
+#define MAUSB_PORT_30_LINK_STATE_DISABLED         0x0080
+#define MAUSB_PORT_30_LINK_STATE_RX_DETECT        0x00A0
+#define MAUSB_PORT_30_LINK_STATE_INACTIVE         0x00C0
+#define MAUSB_PORT_30_LINK_STATE_POLLING          0x00E0
+#define MAUSB_PORT_30_LINK_STATE_RECOVERY         0x0100
+#define MAUSB_PORT_30_LINK_STATE_HOT_RESET        0x0120
+#define MAUSB_PORT_30_LINK_STATE_COMPLIANCE_MODE  0x0140
+#define MAUSB_PORT_30_LINK_STATE_LOOPBACK         0x0160
+#define MAUSB_PORT_30_STATUS_POWER                0x0200
+#define MAUSB_PORT_30_STATUS_SUPER_SPEED          0x0400
+#define MAUSB_PORT_30_CLEAR_LINK_STATE            0xFE1F
+
+/* USB 3.2 specification chapter 10.16.2.6.2 table 10-14 page 443 */
+#define MAUSB_CHANGE_PORT_30_STATUS_CONNECT              0x010000
+#define MAUSB_CHANGE_PORT_30_STATUS_OVER_CURRENT         0x080000
+#define MAUSB_CHANGE_PORT_30_STATUS_RESET                0x100000
+#define MAUSB_CHANGE_PORT_30_BH_STATUS_RESET             0x200000
+#define MAUSB_CHANGE_PORT_30_LINK_STATE                  0x400000
+#define MAUSB_CHANGE_PORT_30_CONFIG_ERROR                0x800000
+
+/* USB 3.2 specification chapter 10.16.2.4 table 10-10 page 438 */
+#define MAUSB_HUB_30_POWER_GOOD              0x00
+#define MAUSB_HUB_30_LOCAL_POWER_SOURCE_LOST 0x01
+#define MAUSB_HUB_30_OVER_CURRENT            0x02
+
+/* USB 3.2 specification chapter 10.16.2.4 table 10-11 page 438 */
+#define MAUSB_CHANGE_HUB_30_LOCAL_POWER_SOURCE_LOST  0x10000
+#define MAUSB_CHANGE_HUB_30_OVER_CURRENT             0x20000
+
+#define DEV_HANDLE_NOT_ASSIGNED=09-1
+
+struct mausb_usb_device_ctx {
+=09s32=09=09dev_handle;
+=09bool=09=09addressed;
+=09void=09=09*dev_addr;
+=09struct rb_node=09rb_node;
+};
+
+struct mausb_endpoint_ctx {
+=09u16=09ep_handle;
+=09u16=09dev_handle;
+=09void=09*ma_dev;
+=09struct mausb_usb_device_ctx *usb_device_ctx;
+};
+
+struct mausb_urb_ctx {
+=09struct urb=09=09*urb;
+=09struct rb_node=09=09rb_node;
+=09struct work_struct=09work;
+};
+
+int mausb_probe(struct device *dev);
+
+void mausb_clear_hcd_madev(u16 port_number);
+
 #endif /* __MAUSB_HCD_H__ */
--=20
2.17.1

