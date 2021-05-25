Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AD1F4390040
	for <lists+linux-usb@lfdr.de>; Tue, 25 May 2021 13:46:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231912AbhEYLrz (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 25 May 2021 07:47:55 -0400
Received: from mail-eopbgr140058.outbound.protection.outlook.com ([40.107.14.58]:47360
        "EHLO EUR01-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S231765AbhEYLry (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 25 May 2021 07:47:54 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RNV/ZHNkjy0+TBbfuJofBVh3aA3gtTR1RGMQ+Czrb+xBsKz9kvFsCXRelHnDgnuCT+ZNsGIhEWrYE95h5TCYlUjPpWjzCCgmc7PSFo6sn9a8MtX9NIgYtxmBQtQKNpaYXA1HhoPrNvKrICVgEoai5HsxhrlgwwzA2g7IRrgSQUvTNET2T7m4AWUIXBmErX51LbHdPBRhbvDut/QfIEdT5LQHxiO3HlrkDEUFtQdVYY7gxRggybr7vZjuvuTsdWfK6nJ0SeKjmbEAMx/NXvs4qss2JnQoX6uD3hnpduJO2TxkurHiKKzCLCJVpvWSg6/0bvFVVzrufOjj2vh2UDf58g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6PUA6WZ4iVLNCQNYhCAHT6b0Z7upnTeVaRUj3y5E6V8=;
 b=kPEv9EfEX0FiAWlMvj0+mx0xHXxv53Pc0c2AIaFxbsOmcsRQ7vhQUdVlhuGFWOIUh7tEiURtbhBrmvWr4lhhTgzE7aGAXh3PCRPK3XZb+84puV+AFJt0CXKEAuhXR7LqXb4HWz++PG1jYStuEomwQwNzzG3dxk4qi4HnUVTmFf91ob1mbIRFAa27zdHcXfKUC17sG5vna5skOpNIB7Vx0xskTo8wKC2NrdHZItd3gWzMf6jqsEsKLHiC0zLEngIj576OMWpSrAZaqEnXK7Hc/KZ0mbO0uNr6akJJOhHwLRGfSX7z6VhlJ5fhai/KgJ7lLWTplRVYR5AQ+LUXs944Xw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6PUA6WZ4iVLNCQNYhCAHT6b0Z7upnTeVaRUj3y5E6V8=;
 b=FEXXy00VZeUutbnallvrKkx/CY5FepKM8i4u2s4IhWefsLutTResD7sObBZgVpCCkl+UlsxDyYKxe3HdFe0rG62tnxg86PUSpDl3deDTAywLpMegBhgfVhkfmsE92TKT7pJZbjF2zlcMb9zU7/4nKNYPoduK2NScnp2kEeueXK4=
Received: from VI1PR04MB5935.eurprd04.prod.outlook.com (2603:10a6:803:e9::17)
 by VI1PR04MB4783.eurprd04.prod.outlook.com (2603:10a6:803:5e::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4150.25; Tue, 25 May
 2021 11:46:19 +0000
Received: from VI1PR04MB5935.eurprd04.prod.outlook.com
 ([fe80::453c:f24d:af8e:f194]) by VI1PR04MB5935.eurprd04.prod.outlook.com
 ([fe80::453c:f24d:af8e:f194%7]) with mapi id 15.20.4150.027; Tue, 25 May 2021
 11:46:18 +0000
From:   Jun Li <jun.li@nxp.com>
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>
CC:     "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "linux@roeck-us.net" <linux@roeck-us.net>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        dl-linux-imx <linux-imx@nxp.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>
Subject: RE: [PATCH 3/4] usb: typec: add typec orientation switch support via
 mux controller
Thread-Topic: [PATCH 3/4] usb: typec: add typec orientation switch support via
 mux controller
Thread-Index: AQHXTIEKNobfiQu7YEKZBxd9HIlDqqrsT64AgAFQdoCAA4FacA==
Date:   Tue, 25 May 2021 11:46:18 +0000
Message-ID: <VI1PR04MB593521FEBF947882E6A394D489259@VI1PR04MB5935.eurprd04.prod.outlook.com>
References: <1621408490-23811-1-git-send-email-jun.li@nxp.com>
 <1621408490-23811-4-git-send-email-jun.li@nxp.com>
 <YKZXHG7BSSZssiBg@kuha.fi.intel.com> <YKdxW8SFntFYcyv+@kuha.fi.intel.com>
In-Reply-To: <YKdxW8SFntFYcyv+@kuha.fi.intel.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linux.intel.com; dkim=none (message not signed)
 header.d=none;linux.intel.com; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [119.31.174.71]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7b0b21db-4b07-4f7b-5897-08d91f72b601
x-ms-traffictypediagnostic: VI1PR04MB4783:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <VI1PR04MB47835C23E72058B4A2B51C2889259@VI1PR04MB4783.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 6y589E/L+csE2btpq9BkrhMYTMynTCJimo2nBwozFtGPjCpfOLs3AU0Ub/dk9OKBKFpbzQ+taHRCau/UYOfNR0a40Ji83CqMAdWZx5IGI7kWsZskPqMIfSoNCTaJbtOZR8XpfZHufRbrqf+0kg+K6OjwwiVe5r8YXDlIyQcCzq+rnFoTa891GBCebdZNJb/vFMLHmysiO7DUTHxhPCNv0G+T37r10e/VqpemPr7nnnXBanXgj63gMSgs/QUL9n82jqSwfNV55F9vwI6P04AxEEW6IGMmoaGL7ve8NwKZjbjIk0Oh6eg7JqlPJ4eLdh2b7Nfetb/h+4iq0MAAGP0iL+FKvdRy8wsu44WaFOLXXqXq4RlV2s9R6N5yT8TR4RTCQK0jX9xQwzj80VKdLAaVut16qk/feuIi8mKFcB5le2WmCl+7s2LUBOwotozYSlF3ecGQq1zWnUHJ6UMZAsgXwEajDNMaKMER2FH489Z5P2dYdKmzljLym3lshFHaf5WNF5awJ0qkbwCn3ZDRS8dqdoNM/BBN+Hy8UMHlqOk4Odgkl//c01wcOCDUYeH/A/UBCSK2tjTIvQ/Vx0e1DPf7/bAoT4bKFYUzxFSL3DztXKk=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5935.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(52536014)(54906003)(86362001)(26005)(76116006)(7696005)(498600001)(66476007)(66946007)(66446008)(64756008)(66556008)(8936002)(33656002)(53546011)(71200400001)(6916009)(44832011)(6506007)(4326008)(38100700002)(83380400001)(8676002)(122000001)(2906002)(186003)(55016002)(5660300002)(9686003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?SGZUttODdPtCihUhsYWwB6QRBVju0DI3VkwxzxE+BPirJ2HugIpRHWsTcLux?=
 =?us-ascii?Q?zE2PdN98VviZeiPHXxMIPmAnWMU/Pg7FmcOMbNmJ4xyLyMq8bkXcJP9Tg2oA?=
 =?us-ascii?Q?4mS5H2WuifQiS5L0n58KM7LKekuO0bMcS0/amRc2R54tFkVr2HA8ZXPQqSO4?=
 =?us-ascii?Q?dF68reVguf6cwd4sBYtLsieDyqN6dtx8Ewo/hz+k0cySVvkGn/jjco59fihN?=
 =?us-ascii?Q?0dfrRXZN6mpAFYjiAth9mTzrPMMcWkmVC7pTm3M8K53iZfWpEjGppFbf2H5t?=
 =?us-ascii?Q?+0X6FDB/QGi4VXOejDCFrL29sjfQesFWW9zheucxCyPMoBYJuV0Gx9yUy/Ew?=
 =?us-ascii?Q?XcloJF2PRUw6Um6N27WCIlFLkilowgNJPBiNVH15NfupBDvLdxuThUL3N4EY?=
 =?us-ascii?Q?uQNYD1t7F/b4+6e4cpaV7tof0+8ARcLcOBYLMB7CHE/6TCE1xV8iVOurz+Ev?=
 =?us-ascii?Q?RncBrmDzW3ujWsGNto9Aezv01N5BpjGsC7Fhzes7uHL+KV1hgWJTx2ZCeRMp?=
 =?us-ascii?Q?ggxxqUYn85E3fyleL1sCha9hgs9mkNrrwKdqXgzcGqz6cRm/D34K6H9myit8?=
 =?us-ascii?Q?9hbMS+64LzNQ1klnfWHvYdgTxNMhcbZt0YMoSzi3JqMB8H1jhS4ugTcN5VUV?=
 =?us-ascii?Q?e1GMkpbXo6k4oHLQo/TURG91zn7qjjWDAH5TLzT7D/wkvzU1U/wpIDnJ6GcI?=
 =?us-ascii?Q?+sklLwNAO5LiXhQwiYP/z2uVf6lwMHXoV2SmpU2GKN2niPCFz75ncz7GOUE7?=
 =?us-ascii?Q?Hy667cGrY+1IDn0bT4OlocB7Zc5PgH1jqNjMV/diO1DmjXN8/N/eUM/wrlVS?=
 =?us-ascii?Q?bEEHVleOV0yKRN0djQRukyueT2OO4URZW80XVn+4krFZK0bwR30r6492bXqc?=
 =?us-ascii?Q?/gSwcSYHwto1cP+tUCEA5RgGwnTFE4qxqHtg8M3KvjzftVMP9e5LegCy+Uhw?=
 =?us-ascii?Q?WCHJzWqQU0W+7nXN+v0oLPq2E/F9SxBk47Z3Ed5IxvDw8JWxG4HYbgowmww9?=
 =?us-ascii?Q?rKi2D/j/Tc/97jLVBOcc3hVXA3mk7PqdUoIHKD+x7biQUzfjqzw/FI2fjkq7?=
 =?us-ascii?Q?zZwEuGIL/ykx/Lo4Hc0me4dnbvt6LgkEdnJ91XptdwRuovFjerZtf6eeHkoH?=
 =?us-ascii?Q?awAYS2rYD0tLjF2RY/QVu/VxPiAChnQlCupQ90aVgBUcabIAiW0+6n5tcGXR?=
 =?us-ascii?Q?w67x3Y5XaW8+DfjirIa23fAPK3YK97XfroYSC5oK7OxVOW1FBlu2y1vgnF6p?=
 =?us-ascii?Q?M2UfbyTgaM7+Q9yUlWGc+ikq0oLM7p715v6tDm17IQg2w4LsDaC42CCncOoy?=
 =?us-ascii?Q?xXHFKwTaHGHXVukmdi5IzO6Y?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5935.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b0b21db-4b07-4f7b-5897-08d91f72b601
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 May 2021 11:46:18.9490
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: uWXL6GHA9uMOqucVwAjL6AohT5CcEqrDr4FDnMRVBNY5+sTuQNJZl7PQFzijJUAr
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4783
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Heikki,

> -----Original Message-----
> From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> Sent: Friday, May 21, 2021 4:38 PM
> To: Jun Li <jun.li@nxp.com>
> Cc: robh+dt@kernel.org; shawnguo@kernel.org; gregkh@linuxfoundation.org;
> linux@roeck-us.net; linux-usb@vger.kernel.org; dl-linux-imx
> <linux-imx@nxp.com>; devicetree@vger.kernel.org;
> linux-arm-kernel@lists.infradead.org
> Subject: Re: [PATCH 3/4] usb: typec: add typec orientation switch support
> via mux controller
>=20
> Hi,
>=20
> On Thu, May 20, 2021 at 03:33:36PM +0300, Heikki Krogerus wrote:
> > Why not just do that inside fwnode_typec_switch_get() and handle the
> > whole thing in drivers/usb/typec/mux.c (or in its own file if you
> > prefer)?
> >
> > You'll just need to register a "wrapper" Type-C switch object for the
> > OF mux controller, but that should not be a problem. That way you
> > don't need to export any new functions, touch this file or anything
> > else.
>=20
> I wrote a bit of code just to see how that would look. I'm attaching you
> the hack I made. I guess something like that would not be too bad.
> A wrapper is probable always a bit clumsy, but I'm not sure that in this
> case it's a huge problem. Of course if there are any better ideas, let's
> here them :-)

Thanks for your patch, I am pasting the patch as below.

seems we need consider more than that.

diff --git a/drivers/usb/typec/Makefile b/drivers/usb/typec/Makefile
index a0adb8947a301..d85231b2fe10b 100644
--- a/drivers/usb/typec/Makefile
+++ b/drivers/usb/typec/Makefile
@@ -1,6 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0
 obj-$(CONFIG_TYPEC)		+=3D typec.o
 typec-y				:=3D class.o mux.o bus.o port-mapper.o
+typec-$(MULTIPLEXER)		+=3D of_mux.o
 obj-$(CONFIG_TYPEC)		+=3D altmodes/
 obj-$(CONFIG_TYPEC_TCPM)	+=3D tcpm/
 obj-$(CONFIG_TYPEC_UCSI)	+=3D ucsi/
diff --git a/drivers/usb/typec/mux.c b/drivers/usb/typec/mux.c
index 9da22ae3006c9..282622276d97b 100644
--- a/drivers/usb/typec/mux.c
+++ b/drivers/usb/typec/mux.c
@@ -63,6 +63,9 @@ struct typec_switch *fwnode_typec_switch_get(struct fwnod=
e_handle *fwnode)
=20
 	sw =3D fwnode_connection_find_match(fwnode, "orientation-switch", NULL,
 					  typec_switch_match);
+	if (!sw)
+		sw =3D of_switch_register(fwnode);
+

How to support multiple typec_switch_get() for of_mux case?
the second call to fwnode_typec_switch_get() will get the switch
via fwnode_connection_find_match()? This means we still need
a property "orientation-switch" for mux controller node, this
seems not the expected way for a mux consumer, even with this
property, we will get a EPROBE_DEFER for the first call.

If we use mux_control_get() for multiple caller/consumer, then
we need some other device as input.
 =20
typec_switch object looks to me is a provider, if we create
and maintain it in consumer side, I have not come out a better
way:-).

Thanks
Li Jun


 	if (!IS_ERR_OR_NULL(sw))
 		WARN_ON(!try_module_get(sw->dev.parent->driver->owner));
=20
@@ -78,10 +81,12 @@ EXPORT_SYMBOL_GPL(fwnode_typec_switch_get);
  */
 void typec_switch_put(struct typec_switch *sw)
 {
-	if (!IS_ERR_OR_NULL(sw)) {
-		module_put(sw->dev.parent->driver->owner);
-		put_device(&sw->dev);
-	}
+	if (IS_ERR_OR_NULL(sw))
+		return;
+
+	module_put(sw->dev.parent->driver->owner);
+	of_switch_unregister(sw);
+	put_device(&sw->dev);
 }
 EXPORT_SYMBOL_GPL(typec_switch_put);
=20
diff --git a/drivers/usb/typec/mux.h b/drivers/usb/typec/mux.h
index 4fd9426ee44f6..c99caab766313 100644
--- a/drivers/usb/typec/mux.h
+++ b/drivers/usb/typec/mux.h
@@ -5,8 +5,11 @@
=20
 #include <linux/usb/typec_mux.h>
=20
+struct of_switch;
+
 struct typec_switch {
 	struct device dev;
+	struct of_switch *osw;
 	typec_switch_set_fn_t set;
 };
=20
@@ -18,4 +21,16 @@ struct typec_mux {
 #define to_typec_switch(_dev_) container_of(_dev_, struct typec_switch, de=
v)
 #define to_typec_mux(_dev_) container_of(_dev_, struct typec_mux, dev)
=20
+#ifdef CONFIG_MULTIPLEXER
+struct typec_switch *of_switch_register(struct fwnode_handle *fwnode);
+void of_switch_unregister(struct typec_switch *sw);
+#else
+static inline struct typec_switch *of_switch_register(struct fwnode_handle=
 *fwnode)
+{
+	return NULL;
+}
+
+static inline void of_switch_unregister(struct typec_switch *sw) { }
+#endif /* MULTIPLEXER */
+
 #endif /* __USB_TYPEC_MUX__ */
diff --git a/drivers/usb/typec/of_mux.c b/drivers/usb/typec/of_mux.c
new file mode 100644
index 0000000000000..48686a92331d7
--- /dev/null
+++ b/drivers/usb/typec/of_mux.c
@@ -0,0 +1,97 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Wrapper for mux controllers handling orientation
+ *
+ * Copyright (C) 2021 Intel Corporation
+ */
+
+#include <linux/device.h>
+#include <linux/slab.h>
+#include <linux/of.h>
+#include <linux/mux/consumer.h>
+#include <linux/usb/typec_mux.h>
+
+#include "mux.h"
+
+struct of_switch {
+	struct mux_control *mc;
+	unsigned int state[3];
+};
+
+static int of_switch_set(struct typec_switch *sw, enum typec_orientation o=
rientation)
+{
+	int ret;
+
+	/* Checking has the switch been unregistered - just not released yet */
+	if (!sw->osw)
+		return -ENODEV;
+
+	ret =3D mux_control_deselect(sw->osw->mc);
+	if (ret)
+		return ret;
+
+	return mux_control_select(sw->osw->mc, sw->osw->state[orientation]);
+}
+
+struct typec_switch *of_switch_register(struct fwnode_handle *fwnode)
+{
+	struct typec_switch_desc desc;
+	struct typec_switch *sw;
+	struct mux_control *mc;
+	unsigned int state[3];
+	struct of_switch *osw;
+	int ret;
+
+	if (!fwnode_property_present(fwnode, "mux-control-names"))
+		return NULL;
+
+	ret =3D fwnode_property_read_u32_array(fwnode, "mux-control-switch-states=
",
+					     state, 3);
+	if (ret)
+		return ERR_PTR(ret);
+
+	desc.fwnode =3D fwnode;
+	desc.set =3D of_switch_set;
+	desc.name =3D fwnode_get_name(fwnode);
+	desc.drvdata =3D NULL;
+
+	sw =3D typec_switch_register(NULL, &desc);
+	if (IS_ERR(sw))
+		return sw;
+
+	sw->dev.of_node =3D to_of_node(fwnode);
+
+	mc =3D mux_control_get(&sw->dev, "typec-orientation-switch");
+	if (IS_ERR_OR_NULL(mc)) {
+		typec_switch_unregister(sw);
+		if (IS_ERR(mc))
+			return ERR_CAST(mc);
+		return ERR_PTR(-ENODEV);
+	}
+
+	osw =3D kzalloc(sizeof(osw), GFP_KERNEL);
+	if (!osw) {
+		typec_switch_unregister(sw);
+		mux_control_put(mc);
+		return ERR_PTR(-ENOMEM);
+	}
+
+	memcpy(osw->state, state, sizeof(unsigned int) * 3);
+	osw->mc =3D mc;
+	sw->osw =3D osw;
+
+	return sw;
+}
+
+void of_switch_unregister(struct typec_switch *sw)
+{
+	struct of_switch *osw =3D sw->osw;
+
+	if (!osw)
+		return;
+
+	sw->osw =3D NULL;
+	typec_switch_unregister(sw);
+	mux_control_put(osw->mc);
+	kfree(osw);
+}
--=20
2.30.2
>=20
>=20
> thanks,
>=20
> --
> heikki
