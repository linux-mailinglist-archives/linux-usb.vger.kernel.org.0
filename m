Return-Path: <linux-usb+bounces-24752-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2727DAD9CC6
	for <lists+linux-usb@lfdr.de>; Sat, 14 Jun 2025 14:54:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C82551766EF
	for <lists+linux-usb@lfdr.de>; Sat, 14 Jun 2025 12:54:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0BD8C2C15BD;
	Sat, 14 Jun 2025 12:54:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="PND+rT13"
X-Original-To: linux-usb@vger.kernel.org
Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011062.outbound.protection.outlook.com [40.107.130.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9845427BF80
	for <linux-usb@vger.kernel.org>; Sat, 14 Jun 2025 12:54:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.62
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749905682; cv=fail; b=RnuIAJFUa+nwGpbIx5/Zyc97IZQfcreKheMkaqUfxz8m6oVelphyta+aWt7NiDOYrXys8Et3DWrlY7uCnVTmVpcHUl2pGQ71DyAE+4swIsqrrPhEU1eksz480Fdo+b2BVgPtyqbCSdsytPbRvv9J/VHGEU9RfsaF6ag7NthDvW0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749905682; c=relaxed/simple;
	bh=CwhGOsGs/HgsJeggh6OpKrRDIfuCNdrXrxaA/5FdP+Y=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=BF/2bCu59uN/suZCCzO8Wm2AzB3qgIhAgR8EoB5h7xKQO/go1eoFSifEbTMY99es2o1wZXUERN0vvVJbO0KrfRzPeuEqlqQhX4kqeW/VwYn+dHtweRs/XYKRxkf9AgSQQtoWHfvgWzipV93tJL7EBtg+eNO6wCSKSaKKersEYNM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=PND+rT13; arc=fail smtp.client-ip=40.107.130.62
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jO9i94lloL2jYOjia3/KP8NTu+QWc1cXwe5NasKiCHJbh7BH+W0ngj1bXdUicEa67HkFhgBCeCO0ni085ef7biSjCdlp1RAZ92aDe2oaTmLtPuQAFcxwDAULn1eWsvf4FlUCbzG77HrBd6iPpxXwkQ8bSqu9OkeRs/qt3C1fXr/3j0sFDhqrq+COLBxhLcrsBBv4PW17utw7q0cCKYgwdhuDcJDTApJjpJ2HoHXshlXRCVmoLXKIJPY2U2vV/C5re6lGAHOzC/2KmobD86k+RtK2VZgmBQbszMngs0xkTVqmn7PrFlERGMZyBwFzo254IUjZS1PgESxCdrmPQ9OXMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q78OT8fm+ifRRsyfm9wiEB7/jrovv156VhuBxqexZiM=;
 b=GKwfoguAbGYyW4SSExA2i0kOlE29fZV6BVH9F0tFI6MkM/Ogb5rE+8r0ggxYT9Gkq8baTD+RsaASx2QQmrTCl+RuKzuc9QBXS2/wFrNMbjkvSsMk3oKJ7k68+oE+owQz3zvw8ISyJim2xowI88FX+fOehchxO/lT9LCbWUTpGXfSovdBTn90rdAZSJMg1ufjq2swJFW+HaIfcWInXnydG1rrk9oe9Idv9cS+EMHtBP68y+Cg7F12LZTxN+MY0iWMApcd43gSVMLbRTu3BBoqJkr+SfDvD/G5QGGCGwshlooyi1Py3zaZ+uTMrMR1QqU+hlEnDb6EgOQjs5VY6IroEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q78OT8fm+ifRRsyfm9wiEB7/jrovv156VhuBxqexZiM=;
 b=PND+rT13HIEpS7krruCUdfogcuBdPj8yQxNTDADeUQ3vin8VermAymvA9QULK6mVHvlky1ojGWxSu6fbEMgCyyxYcsN+aISTw6RwQAtEd2TtjrRWsCTDTd6O5APqK9suIBHfq4R4IKp/pV180udhZd12Oe5o8qT34d6g/wVERQFdQLhET3uyHyInuptsfUrQSt516S2iqmEVCIq9L2xM4RDG1QbE60bXgrgejPc9PvRRh1TYQ6MBMcBIxWM0CebZWl/o7ibzYBpGobEJut3CZxccOWKU8zAtr977AnZtokil8CGYLLt3VboHbYCayFQIuj1HtICb/QXFS6agyD/ylw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by DU4PR04MB10958.eurprd04.prod.outlook.com (2603:10a6:10:581::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.19; Sat, 14 Jun
 2025 12:54:37 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7%6]) with mapi id 15.20.8835.026; Sat, 14 Jun 2025
 12:54:37 +0000
From: Xu Yang <xu.yang_2@nxp.com>
To: peter.chen@kernel.org,
	gregkh@linuxfoundation.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.d,
	kernel@pengutronix.de,
	festevam@gmail.com
Cc: jun.li@nxp.com,
	linux-usb@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 2/3] usb: chipidea: imx: add imx_usbmisc_pullup() hook
Date: Sat, 14 Jun 2025 20:56:44 +0800
Message-Id: <20250614125645.207732-3-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250614125645.207732-1-xu.yang_2@nxp.com>
References: <20250614125645.207732-1-xu.yang_2@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR04CA0007.apcprd04.prod.outlook.com
 (2603:1096:4:197::19) To DU2PR04MB8822.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::11)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|DU4PR04MB10958:EE_
X-MS-Office365-Filtering-Correlation-Id: 99dc810b-a117-44ad-b4b7-08ddab429e6f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?o/BAPsX0yYuwsfF1cQWSyBTiowlkaUoqO/X/ZOI3TCQCuG0zuvOCSoMeMzf4?=
 =?us-ascii?Q?ImF1hmNZJdKJei1vFnzT+PBTXqrPvavLGeR/4gscplMT6k77W4ElYrTHlpYz?=
 =?us-ascii?Q?hnuwqx+IqkNo6Ymsu/aZsn6zv9dvkHdcJb4h++rzEVmDwDehVjSwIebILK7p?=
 =?us-ascii?Q?asOBquypUVHyBE69lh8Km7nMJfMywwU+c9LPGDO1Xt1SX5qtbAGSINcRgC0A?=
 =?us-ascii?Q?F2umtzDrPU/oEUOk+VY9PjODnKUrwxi3k+ovzVL47HLlnJLEzZhwEMIUnSAt?=
 =?us-ascii?Q?GKcckBrSVTLOsUViGrYTge6nc/780KzDVG3tRuDTBLbmCC7PN8r1o+RNOB7R?=
 =?us-ascii?Q?VfZ9kAISQyk/qRBgClr6Ey0eGe09p//m7x5QdfOsaY+poYJp7s6VOvh9q3DK?=
 =?us-ascii?Q?7onq1FdPrdR0OBflCXr24a3dTQrCrsDsqeuF3I5rQ5XuAt2Yg60hci3lH5Rd?=
 =?us-ascii?Q?uW3/BU5LnXi9bii3uq54Xb6t5dORao3wSuNxywpgX3G41QZFtZXIftFvIoOy?=
 =?us-ascii?Q?f1Tdc3ZGsb38QvinYKS/M1+YTAKlwqkSmJWdUTfzzIMWCMbNCL99hZ6ZxzQz?=
 =?us-ascii?Q?8lMGMD8uqVXL9c24jyWrsXTPI4l1TaEB7ajAQGre7X+E2srDZF8vVnOVGpPU?=
 =?us-ascii?Q?4rCCgbOWJA6C2CTMl5WxQCwcDINCGlU7C1NUul9rBHspIjI6ITrb3qGHKQam?=
 =?us-ascii?Q?Bg0lobkL3p4+kDqeUSdEDOy6BKzKYBCeJJ5BjC5yDS6qQnxH50lrSQcuamIH?=
 =?us-ascii?Q?MYBVR9OWok0rfIPCCgtMzJmc5m9YCJrDkBn+KMTCSdggZdNsJd9qV7HYKe1Y?=
 =?us-ascii?Q?BJafGBvikroQmk/FGm7MSWI27YQ7ylw3mZxuvsv5Z6dFwecckx70oaLbNsvA?=
 =?us-ascii?Q?7XDVq8xOa+m37mqSZnG/aFBc741D8RtBPOm/m6E4LbXD7YCRPCoScfziogvU?=
 =?us-ascii?Q?MZi2grbInzLeS07aaJOrj7PqKir+bvP4YT/qo8JTwY27mNZXJO0JioYnEGN3?=
 =?us-ascii?Q?FVsNoDlXdiaR3lHUyYby9fmNKfu0/+1cuLGMSYMJsXMkHqGC/oAyOCAWmNmW?=
 =?us-ascii?Q?keOOcR/Xh2Kwq2QHeR4wa+yt8L4EBOVZKk8MHK+CfcIAJWICdZF4PbqOHIlL?=
 =?us-ascii?Q?3p6pTi2ln6EZxnQxDG/7eSXwTsyWvUldiMV+px1RUn0ansLicF/MDxsZhw+n?=
 =?us-ascii?Q?aK3qU+80DsANuN6iwKn4wWrHQzLfeIwd/8eYg/4FttYFw/ZdipUK5CLLMlgq?=
 =?us-ascii?Q?uE96iKDe2AhQk4FXpVsauxP6saOLsewgCFjByLTczUQQOo+7PEPrl322IQ20?=
 =?us-ascii?Q?IpxO4IQpmI6VCnBZo9XU7sK2fazTjBzF70622E5VPwKfSSHlc01Cgq60NjQl?=
 =?us-ascii?Q?Wb1WnLbjv98k5ImOjorKB2D9NsIYBdvWzUZaEDDEk3n55aVLKn4XpEN/Rso9?=
 =?us-ascii?Q?2i9pJKdaDoC4D7TKgGvtl2XPVw3EzbMxJGsnHeGiRAvAKhyS4TMHNA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?S/5Nn3buH3PPbe/1UjI7AMPpEhSEFchkCZQuZjsjOtVtaINtw+md6XbGQI2G?=
 =?us-ascii?Q?qgnEU1V00WyNTSflp9hJqvOtgYgr65mJpjbDohKB/5luQSpPLjJz56CSyTMx?=
 =?us-ascii?Q?cnjUGBBQgKKsf99CXUgQX9DkY71ZUlAcr83Nj78hlE72rVBPHLtZo5i5km1t?=
 =?us-ascii?Q?k4YBCsoco3AhXPjAEpyl/KBGEHj4DnoeJfZr1YIfZOHSZj7gFD8eSSzEa9mD?=
 =?us-ascii?Q?EmY/POaVJD9axVmGFxVpftsncE2h4eHPnqt/QxNtgVQTOybdUL/050sf0gt+?=
 =?us-ascii?Q?QpDjg2K6/qiNXxCGsd0VOKpeqmftYdb1oop4BBJkHWQWehik6dve5ACEYwxX?=
 =?us-ascii?Q?PjiGXOlGG0zlPTTc1ZRswcVU3LNtOM6JE368J6alXi7BlIlJqDDtUEHENR5q?=
 =?us-ascii?Q?FH7vc2DCMaYFpYxjbrpznsPWKkhZh/7uw7V3qFnw4tG5t7CHoQLdgeYWl/d8?=
 =?us-ascii?Q?4EsoiX/tzXAoTpJgYmscLHCo06YByA/D/NtiUSPYQgMJCUwV6yZ+JJjuzkZM?=
 =?us-ascii?Q?5Rm0H69thKpXADBHdFl3nMF5jxc0lFPHOgbTBKuPfA48Yfe7/BMBqPmIPOTH?=
 =?us-ascii?Q?ntBHojJDC7AqDjEYe0OPwvxEKvGDkLyxLH67AQAiEcZSvKLR7iEaUEBpPPlh?=
 =?us-ascii?Q?mgByswl6lWoQsdAcNWjXiUUXlpjlBATT0TwY3IxkpVx+qPXtG3YXL6TpHqt2?=
 =?us-ascii?Q?XexhW3GdabmiW7EzoKswTlkBclduLY0yg02brYejOxkP/1pRiQbdY5VG86KY?=
 =?us-ascii?Q?Y0Cm0hIbD/mVGOB+UaaO+kGWVTqBusK15HeknrqCXvGgHz46IaDlnc0kMSQb?=
 =?us-ascii?Q?KjyWx3MoZKoxmDx66a88WUu/U+tl21Ic+NEBcqhX57rd4D7r9meRmuxB0CdM?=
 =?us-ascii?Q?ncqd6txIKVEJ2HB0orWuS2JxapBvxl9cgd56wJe9ONIIPGQJCPqQumbmBX+r?=
 =?us-ascii?Q?h+KNFpoWZuTNmkgKo8aBbD3dGjNC1mIwuecn1uXmNjitWva5IZesYtT7IAqU?=
 =?us-ascii?Q?0QPIIlHYZ6aPhJeSOXGnJ5dsVEykRI0BHTRMA5Yf7/sAPpUk8LQSla4D/hWA?=
 =?us-ascii?Q?t5xALUoR2LMpcagpmwJWwLEHK8nXOpEvBiF1j4UpSc+7zHFA10U22Wi8BogT?=
 =?us-ascii?Q?Y7KjX8rzXuK///UFhOc68qA0kK/xjiB5QjnhjpMOYLqf8E1beQtBpHA/Luwv?=
 =?us-ascii?Q?Y537nJeN0LmzL3fjAprzu22vLz1NQcQufSh0GupTxPvJU4DdXgeTKhNFtAJl?=
 =?us-ascii?Q?uD0sP4oMHVfFrwjjMkT014zZ0ckyFz1Ww/UYzMID9WhUfe5tu5MnhuOjqeY6?=
 =?us-ascii?Q?zuhjwNMcJUWJqcndfJ6Hz898WQ+8dH8GVKv9OUoZblyBf4fiz11RJhAzPFO3?=
 =?us-ascii?Q?rURb/eZIQ6T3aWZJPnjVGDUEaCU390KxbwSyc9cHpg9LlJq6pPOWjjUHPTUn?=
 =?us-ascii?Q?/vz6IltEnyE8nEbvoflUEM8ynRAtSul++VR2XURdNcBR7fWHmWIDLMJqW7G6?=
 =?us-ascii?Q?PzFdUDRqfrYCxlrVZ4dFavbHlntWtf5YOvWD2J1Fv6fRDJQXfjvcxA4L1FsX?=
 =?us-ascii?Q?IhQp+LwkyeVajN8ajtnaBWrau6nAZz/7cPWqO5VU?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 99dc810b-a117-44ad-b4b7-08ddab429e6f
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jun 2025 12:54:37.3976
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uYthUV2ToYFWfkAY/vHcOKaGBKdyhD+VjXg7IxT5W50GQeyWLXDybIUDA/cWtkYVprnIySQ4AxY1wCYvPorJlw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB10958

It's used to do other pullup related operations if needs.

Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
---
 drivers/usb/chipidea/ci_hdrc_imx.h |  1 +
 drivers/usb/chipidea/usbmisc_imx.c | 18 ++++++++++++++++++
 2 files changed, 19 insertions(+)

diff --git a/drivers/usb/chipidea/ci_hdrc_imx.h b/drivers/usb/chipidea/ci_hdrc_imx.h
index 88b8da79d518..cb95c84d0322 100644
--- a/drivers/usb/chipidea/ci_hdrc_imx.h
+++ b/drivers/usb/chipidea/ci_hdrc_imx.h
@@ -37,5 +37,6 @@ int imx_usbmisc_hsic_set_connect(struct imx_usbmisc_data *data);
 int imx_usbmisc_charger_detection(struct imx_usbmisc_data *data, bool connect);
 int imx_usbmisc_suspend(struct imx_usbmisc_data *data, bool wakeup);
 int imx_usbmisc_resume(struct imx_usbmisc_data *data, bool wakeup);
+int imx_usbmisc_pullup(struct imx_usbmisc_data *data, bool on);
 
 #endif /* __DRIVER_USB_CHIPIDEA_CI_HDRC_IMX_H */
diff --git a/drivers/usb/chipidea/usbmisc_imx.c b/drivers/usb/chipidea/usbmisc_imx.c
index 118b9a68496b..9db67d6d0ec4 100644
--- a/drivers/usb/chipidea/usbmisc_imx.c
+++ b/drivers/usb/chipidea/usbmisc_imx.c
@@ -170,6 +170,9 @@ struct usbmisc_ops {
 	int (*charger_detection)(struct imx_usbmisc_data *data);
 	/* It's called when system resume from usb power lost */
 	int (*power_lost_check)(struct imx_usbmisc_data *data);
+	/* It's called when device controller changed pullup status */
+	void (*pullup)(struct imx_usbmisc_data *data, bool on);
+	/* It's called during suspend/resume to save power */
 	void (*vbus_comparator_on)(struct imx_usbmisc_data *data, bool on);
 };
 
@@ -1225,6 +1228,21 @@ int imx_usbmisc_charger_detection(struct imx_usbmisc_data *data, bool connect)
 }
 EXPORT_SYMBOL_GPL(imx_usbmisc_charger_detection);
 
+int imx_usbmisc_pullup(struct imx_usbmisc_data *data, bool on)
+{
+	struct imx_usbmisc *usbmisc;
+
+	if (!data)
+		return 0;
+
+	usbmisc = dev_get_drvdata(data->dev);
+	if (usbmisc->ops->pullup)
+		usbmisc->ops->pullup(data, on);
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(imx_usbmisc_pullup);
+
 int imx_usbmisc_suspend(struct imx_usbmisc_data *data, bool wakeup)
 {
 	struct imx_usbmisc *usbmisc;
-- 
2.34.1


