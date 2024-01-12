Return-Path: <linux-usb+bounces-4944-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1081F82BC11
	for <lists+linux-usb@lfdr.de>; Fri, 12 Jan 2024 08:55:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B512D283AA5
	for <lists+linux-usb@lfdr.de>; Fri, 12 Jan 2024 07:55:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF73E5D738;
	Fri, 12 Jan 2024 07:55:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="cmMZcEXP"
X-Original-To: linux-usb@vger.kernel.org
Received: from EUR02-DB5-obe.outbound.protection.outlook.com (mail-db5eur02on2063.outbound.protection.outlook.com [40.107.249.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F8225D72A
	for <linux-usb@vger.kernel.org>; Fri, 12 Jan 2024 07:54:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GncZ1eGwa0B3GjCf8vFtjs/OtFB8dhSmBGR/w240yG626dMLjD3etsDL2FhVZwUVpsVXt/Bpu1EbLvQ9WuFbm9PFukVtWUW9IONqmcIZlRe1D3Hyt0Zm5uwrziHKicVIbHIlxchGewJMRlcCgo9u4nhIt4jOAPqGXWsNthAhLBwMHVfFaUAOOpqd7lYbWcjnJaNn3pytG8hf/gr52iQJ9nzKUZ8Vd+SEhzmyBL6vz159zpjDasdmkESFRIHj/zVdY3qYOuywc+kPGQu/k3wOrX2kmZkTw3DA8g4PrsxfrHt77/7QQ62SO0nFDk3/6+EwoPNLz3KCJraeiLApfI5VfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oIa/XGDOp42u49Ag2Ou984IFi9ZCXdrHg2h5EGYbs+M=;
 b=Wg0aYph+MeHhkoMCed0Tv1SJSEbShfwMnNdOEEOhAq9yY/7A9/EC4fkhDTBlqjYyM6uhJu9K6OosVBP8feFg6PqWGzqmpnJXW/pmzSHCzG/Kjh0+bpNTaYTIJAphpTMUH8baD7MzbOxRbkZFQCkKx6k8mNyYOk/YMsVG/BENg4gc15gwHgXZYpHvok+UsD8465udG8/WilaG5JuyUvM+lMoxfln6gQ3BjFzLgZZXkUjmmy/Wxkgul9R1AK5Jwd3Q0yM/PQQUZ8U7jB1ZqZ8LS14RbYYo7SwXUxafOu9cBLu4WJOh64S0toKiJxV6K9ofahddB86Z5kLsG4jXFkSVTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oIa/XGDOp42u49Ag2Ou984IFi9ZCXdrHg2h5EGYbs+M=;
 b=cmMZcEXPmrMDIOwQnK6EY1u7zq5kWrBeupe57oTuQppWI1Rk3xbmx3H2+nTLorXn/WjQSQVk1OB/UUAvFvjd18GqznHgatPkBVQsuofnvRJMRdBLY6auUIh+p4LbGgfeXEsZj1JnRv7l2ogsYfFxpM/nnZ4icQqV9fD2xHD5514=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by PAXPR04MB9220.eurprd04.prod.outlook.com (2603:10a6:102:228::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7181.21; Fri, 12 Jan
 2024 07:54:56 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::efd8:23d4:18bf:630a]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::efd8:23d4:18bf:630a%4]) with mapi id 15.20.7181.019; Fri, 12 Jan 2024
 07:54:56 +0000
From: Xu Yang <xu.yang_2@nxp.com>
To: gregkh@linuxfoundation.org,
	benjamin.tissoires@redhat.com,
	hdegoede@redhat.com,
	ivan.orlov0322@gmail.com,
	heikki.krogerus@linux.intel.com
Cc: linux-usb@vger.kernel.org,
	linux-imx@nxp.com,
	jun.li@nxp.com
Subject: [PATCH] usb: roles: try to get/put all relevant modules
Date: Fri, 12 Jan 2024 16:01:08 +0800
Message-Id: <20240112080108.1147450-1-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR02CA0116.apcprd02.prod.outlook.com
 (2603:1096:4:92::32) To DU2PR04MB8822.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::11)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|PAXPR04MB9220:EE_
X-MS-Office365-Filtering-Correlation-Id: f74d5c64-571e-4d2e-b2e3-08dc1343c4dc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	PZsVqoIZhViSMibm24aptriMEuRM/zkZAjrJCFITvB8P+tLlp6rz4GHkiCkqgGyKI5LNWJjiqLPjIf7RnioLTe/M/CC4Fg2YB02Qp+OY5s+7nHOg5rwcMy63jBFTnT6kfE0PhbCh0cz9uHhJ0XTSbExde7+5nDzdbD2k5XQqsIQtPKPFT+Ol7ppjEJjg+xz8651kbzVShNqZL8+Z5ZRKvlshlE/kXeAPWXtgYu0kK+Lm4C+EGiNq4Mt4HgE60vihsPjZbm3vKyvX9duYbQ4A8HhmR3sMDFlP97y/j5/qmFv6dvcgb53Q/2SIQRIVc9Lj4hRaFd6FT74zV/FvN9V9URN3+zfiNbiK2WNXQOqQ9JeFDr3OZNhuU2tVS2JmI9rF57W2qQE0SdOq4j5Wn2TrZm2Dz4JHhMXuUw6K8ehsQJNip6g2qig13aDkpJ56m/PsswpEwKFcZLtjUx/1IPi/am+StQkq+leBQvKMLECaOxAIKHofwFS3f6e8P9TTZPeuwrc0F/0q9bSjdfS9QxYCC7fVsCi0ZCEjWlC60wV92IV+p+XGFor9ovdW1M8bVJGkuC727oHDYbLlmhmnj0zUlitHireciK3HY1/XUdR7k9WNbI+4grGi2nkH0IM7+gGb
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(39860400002)(136003)(396003)(366004)(346002)(230922051799003)(451199024)(1800799012)(64100799003)(186009)(52116002)(26005)(83380400001)(6506007)(6512007)(2616005)(8936002)(5660300002)(1076003)(4326008)(2906002)(41300700001)(8676002)(478600001)(316002)(66556008)(66476007)(66946007)(6486002)(36756003)(38350700005)(86362001)(38100700002)(6666004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?XVFjTsv8Trt1qcms8DQ4ubpsTzftwKGQMf4fcGHRjs8zlMuV6t4UEom8HhlS?=
 =?us-ascii?Q?uaI+rHKMKHRpJ8RRwMJc/Hozmo5y7+TtPZxGhjPQQkuuzImRWEgzKN45nm2t?=
 =?us-ascii?Q?Ao7YvC/ig7kM8x/LMp9cyPBHK9nGUNecV0SngIzktHCm7e3vZ8H09DWZ98Gt?=
 =?us-ascii?Q?DVbSxaOkjlUoWjyv5yxD/qdPwN29/3n+fU6HzffPpt0MMqzHS24/s6Qdp/ru?=
 =?us-ascii?Q?8XznV1y5PWpVg/+F/8tpQhXUZof0zjsgBtFgUYLEqvlfocjzr8Qrsq8/XDSi?=
 =?us-ascii?Q?P1uP0F709wzqnUdYtfHlsqesWz1T2CHHYFXxitedV6HshFNeQuJQdc23qYkk?=
 =?us-ascii?Q?6rRZ7R9Wt6EKd+EUhezxkSOAeJElCGkiwARldWZkT4FTaHnhj4mWUzbSSd6i?=
 =?us-ascii?Q?HdkWwfEiNLAsyXxRvJ5bycLFaKq2+zaaxMyuxGBbYD1TLMOzToFqS9Dv6zng?=
 =?us-ascii?Q?snGb3lS3Wefy8BfBbjnqBreW54BVPDCEkqS27eJIQlzldgJcTYyEYrW7lgeB?=
 =?us-ascii?Q?SmxgTDlKqmf4+Kaj25RO9WoXU+CYYyZigRyhbDoocZFh98JDpoNQbh8yDWnC?=
 =?us-ascii?Q?RFO/YFSsTYPHmBcLT7p/1EVvpPkz1umjraLclAOYzGZaQu4GxM8wI69fabqJ?=
 =?us-ascii?Q?iE6/RumsVHvg8Jhfdqh9qnar5Vyg/aQaZnC/ZwkOeT8QRhB8BeQAmfY1G2Ub?=
 =?us-ascii?Q?/6iGqoF7aSKCjjKHNR5ucEyKnXSKxmE8rdoL+lEou/SjNIgjd+5oYM/utO92?=
 =?us-ascii?Q?pKk+oW/eX/CPs0tZ3ATyk5BmUNH21sgkgLiu1h8aez+Cijz0KScHwbYNVrxr?=
 =?us-ascii?Q?Z8b097i6jtKzbkZx3p1uy2MZ77uNSsbPovibQk3tG/8d+iScRL3q5v3+ULed?=
 =?us-ascii?Q?zesHEO9P1qXRGLrEZq4Alg1F6llcRWlTzUrOmR1fCQINjUaZeFxdIDovS6qx?=
 =?us-ascii?Q?jPKmJiOuiZA0EnzAu0ZHOrntMUXfF1OzKKLPIxQmjndQqqjkVBe2ADA/5ddV?=
 =?us-ascii?Q?lIJOLZCbESoXtcPWp8/Y7673sIImRt3+4Lzeaorcbscj/rRHrdQAAHzKMX5Z?=
 =?us-ascii?Q?hmXjGzdZPjdYDhTJKo9T4sxlNxUvHQQp6B4TG4Bl6JEZjCSGpJ82/hCSh4vv?=
 =?us-ascii?Q?NVFa2feVkaaIP1M6HEOi+VMXZERB/SpP8M/hNulrQv6sPD9re0aL1V9wCREA?=
 =?us-ascii?Q?FJzTxk+v8qnT6RPuDP18qrJ6ZWXtknX0QF13i179jevjZByRPs3vE+3juUYf?=
 =?us-ascii?Q?voisjPmLNmn7LEqH/xibJqdWreWLKm4bmGfpEdgfrbGwb4YewweVG42axa6n?=
 =?us-ascii?Q?/q2TyaNRO62ydnNot7idegGqru2fIkwN34lfmjo0DnDj13ls2wfJoC3vvz+m?=
 =?us-ascii?Q?xZbZZpF7xiuEI9cnlJCC9WV74d4EGVkfFfhygjB4NLAnJlGoy4mgDKVOGW+p?=
 =?us-ascii?Q?8bL8eLEe2lN6FCx1E9aSKfZmq23OpjuIG+gM+peUPCG3cJBPmJmtMhgDu+4f?=
 =?us-ascii?Q?G29f4vLXZgBWA8YgMn6JNL3zt6HIeWvd+d71zA4JxqtRBbFZZM7z/oc9sBUv?=
 =?us-ascii?Q?3DmvybwsaS2mOwj6SkpP4IGzxA11qUOVGUHGUS1s?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f74d5c64-571e-4d2e-b2e3-08dc1343c4dc
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2024 07:54:56.8660
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GUfJ4bpvlRlvpZ7gwCRsSP+5NzO+MxsEQAcgLAE9TgFV7hqrv5nPfZ7S/0rP1N3/QTsnH7Z34K4nx8Qxn4PzNw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9220

Generally, usb role switch device will be registered by usb controller
driver. Then this usb controller device will be the parent of the usb
role switch device. And also the usb controller device will not be a
standalone device, it may be registered by other glue drivers. Currently,
the glue driver can't aware the usage of usb role switch device. So it
will remove usb controller device when the glue driver is deregistered.
In this case, below kernel dump will be shown if the user of usb role
swich (such as tcpm) tries to put it.

[  248.891875] Hardware name: NXP i.MX95 19X19 board (DT)
[  248.896998] pstate: 80400009 (Nzcv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
[  248.903948] pc : usb_role_switch_put+0x28/0x4c
[  248.908385] lr : tcpm_unregister_port+0xb8/0xf8 [tcpm]
[  248.913533] sp : ffff8000836fbbc0
[  248.916835] x29: ffff8000836fbbc0 x28: ffff0000899fd880 x27: 0000000000000000
[  248.923959] x26: 0000000000000000 x25: 0000000000000000 x24: 0000000000000000
[  248.931083] x23: ffff000081417970 x22: ffff00008aab10e8 x21: ffff00008aab0080
[  248.938207] x20: ffff00008aab3110 x19: ffff00008a138c00 x18: ffffffffffffffff
[  248.945331] x17: 0000000000000000 x16: 00e0030000000000 x15: 0000000000000000
[  248.952455] x14: 0000000000000001 x13: 0000000000000040 x12: 0000000000000000
[  248.959579] x11: 0000000000000000 x10: ffffffffffffffff x9 : ffff8000836fbaf0
[  248.966703] x8 : ffff8000836fbaf0 x7 : ffff000084237728 x6 : 0000000000000400
[  248.973827] x5 : 0000000041001000 x4 : fffffc000228ee60 x3 : 00000000820000f4
[  248.980951] x2 : ffff00008a3b9b28 x1 : 00000000820000f5 x0 : 0000000000000000
[  248.988076] Call trace:
[  248.990512]  usb_role_switch_put+0x28/0x4c
[  248.994602]  tcpm_unregister_port+0xb8/0xf8 [tcpm]
[  248.999385]  tcpci_remove+0x5c/0xbc [tcpci]
[  249.003571]  i2c_device_remove+0x2c/0x9c
[  249.007489]  device_remove+0x4c/0x80
[  249.011059]  device_release_driver_internal+0x1c8/0x224
[  249.016268]  driver_detach+0x50/0x98
[  249.019830]  bus_remove_driver+0x6c/0xbc
[  249.023739]  driver_unregister+0x30/0x60
[  249.027647]  i2c_del_driver+0x54/0x68
[  249.031296]  tcpci_i2c_driver_exit+0x18/0x990 [tcpci]
[  249.036340]  __arm64_sys_delete_module+0x180/0x260
[  249.041124]  invoke_syscall+0x48/0x114
[  249.044868]  el0_svc_common.constprop.0+0xc8/0xe8
[  249.049557]  do_el0_svc+0x20/0x2c
[  249.052858]  el0_svc+0x40/0xf4
[  249.055909]  el0t_64_sync_handler+0x13c/0x158
[  249.060251]  el0t_64_sync+0x190/0x194
[  249.063904] Code: b140041f 540000e8 f9402000 f9403400 (f9400800)
[  249.069985] ---[ end trace 0000000000000000 ]---

To fix this issue, this will try to get/put all relevant modules when the
user tries to get/put usb role switch device.

Fixes: 5c54fcac9a9d ("usb: roles: Take care of driver module reference counting")
cc: <stable@vger.kernel.org>
Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
---
 drivers/usb/roles/class.c | 26 ++++++++++++++++++++++----
 1 file changed, 22 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/roles/class.c b/drivers/usb/roles/class.c
index ae41578bd014..41060e354174 100644
--- a/drivers/usb/roles/class.c
+++ b/drivers/usb/roles/class.c
@@ -34,6 +34,24 @@ struct usb_role_switch {
 
 #define to_role_switch(d)	container_of(d, struct usb_role_switch, dev)
 
+void usb_role_switch_get_modules(struct device *dev)
+{
+	while (dev) {
+		if (dev->driver)
+			WARN_ON(!try_module_get(dev->driver->owner));
+		dev = dev->parent;
+	}
+}
+
+void usb_role_switch_put_modules(struct device *dev)
+{
+	while (dev) {
+		if (dev->driver)
+			module_put(dev->driver->owner);
+		dev = dev->parent;
+	}
+}
+
 /**
  * usb_role_switch_set_role - Set USB role for a switch
  * @sw: USB role switch
@@ -135,7 +153,7 @@ struct usb_role_switch *usb_role_switch_get(struct device *dev)
 						  usb_role_switch_match);
 
 	if (!IS_ERR_OR_NULL(sw))
-		WARN_ON(!try_module_get(sw->dev.parent->driver->owner));
+		usb_role_switch_get_modules(sw->dev.parent);
 
 	return sw;
 }
@@ -157,7 +175,7 @@ struct usb_role_switch *fwnode_usb_role_switch_get(struct fwnode_handle *fwnode)
 		sw = fwnode_connection_find_match(fwnode, "usb-role-switch",
 						  NULL, usb_role_switch_match);
 	if (!IS_ERR_OR_NULL(sw))
-		WARN_ON(!try_module_get(sw->dev.parent->driver->owner));
+		usb_role_switch_get_modules(sw->dev.parent);
 
 	return sw;
 }
@@ -172,7 +190,7 @@ EXPORT_SYMBOL_GPL(fwnode_usb_role_switch_get);
 void usb_role_switch_put(struct usb_role_switch *sw)
 {
 	if (!IS_ERR_OR_NULL(sw)) {
-		module_put(sw->dev.parent->driver->owner);
+		usb_role_switch_put_modules(sw->dev.parent);
 		put_device(&sw->dev);
 	}
 }
@@ -195,7 +213,7 @@ usb_role_switch_find_by_fwnode(const struct fwnode_handle *fwnode)
 
 	dev = class_find_device_by_fwnode(&role_class, fwnode);
 	if (dev)
-		WARN_ON(!try_module_get(dev->parent->driver->owner));
+		usb_role_switch_get_modules(dev->parent);
 
 	return dev ? to_role_switch(dev) : NULL;
 }
-- 
2.34.1


