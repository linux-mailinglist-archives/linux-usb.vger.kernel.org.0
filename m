Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 30A20243AB9
	for <lists+linux-usb@lfdr.de>; Thu, 13 Aug 2020 15:21:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726664AbgHMNVD (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 13 Aug 2020 09:21:03 -0400
Received: from mx0a-0014ca01.pphosted.com ([208.84.65.235]:2166 "EHLO
        mx0a-0014ca01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726604AbgHMNVC (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 13 Aug 2020 09:21:02 -0400
Received: from pps.filterd (m0042385.ppops.net [127.0.0.1])
        by mx0a-0014ca01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 07DDIKfX019608;
        Thu, 13 Aug 2020 06:20:51 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=proofpoint;
 bh=4WCFopSBMQb644Ue3DA9a5X3g3Fpm0Nmkxq/EnGDB98=;
 b=J2P6IjqqYiVu26lkgEV7qlHAZN0sHkoxXtuIqyNGNG9ToRC9RTTgn+seXhSvNc35uaRH
 M552woKB9FzGKrk8jsmJ1IStoafBgSItJpIR9J4+/WN/TuZBEAorvxUg2vlS/7stmJ7s
 IZdUEZUmVJlTRTfXQDBWxNfFxoCi+JxoX9/0Mld1yGqmhOFgmoR5wLDAEt2ACsPEvNcb
 CTi6X68jLOCzcT8q+ay71Qz3rJSehWK4GjeuFbAMZ2iaT8xx0YlGD+jewl1okoXJsiIh
 XKLvcXAsu8BfVKk+dTkdKS66oKnh+7KXY4u8FCyLGUyi+q0Qrvd146Dyic174LjT6r+l hQ== 
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2168.outbound.protection.outlook.com [104.47.55.168])
        by mx0a-0014ca01.pphosted.com with ESMTP id 32srkw9d3t-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 13 Aug 2020 06:20:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B/Xp3R99V5uaSS0kqWkzIcFYI2DGT4wsln0iIe9EfBal4dP7x8B5o5sBaqqyuf17PuJh2mhDS3Cw9TqaF/lkzEkvxICO7mB3/o3ohtQW/J0Mp+qKdGqVDT9W6zqRwyjjAH5wsjOxyFSEx6gtJT/WeCszeWr0KcLbjMbdZDgII19u5jnD5sysi1teQOCm/4ouAhWgt5nKX0Pas/WvARphyrxcaKqSZDgAeG6pzCcDZyuSb9KCWiShUDteqmzPCKYQgtLehB1jxShE66hLwNKC6aBNmehV8afvttM1o+njCONet8lxQpJr5ZjRwfJVRvTYg8Au3HkebLHeDjCc3hRq2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4WCFopSBMQb644Ue3DA9a5X3g3Fpm0Nmkxq/EnGDB98=;
 b=g8n0j0ZXwNl7GjBxiOYjuf1FZ/0n/2hezKts2xtLPLyip/jfhOTyChKWqFNWKO0U6ROBiJaJCnqBS1Q9Y0GtkYzyoihhRTyQdABzmJVpWwUfivjCh6tZU6SjKjnhVvyq3ObspL8rkNMO7O7n8QbXElddKotXYsUqUDHLmTNjLJAtLWuiTyJhFev3sTsDznB8KQNx7ioASob9a72VOQ1TJlyeHy2PYOu04lo1tEhNtl85Xo8E0cSp/woHEE3I5nCia3fS1NqqOqhH4BV2Mvg66foqg6wFmfJnUdNgw1ZLYVIKThd209u8kiUATyyMT5qWUJU6SkvKEvmBlE0wyiMcKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cadence.com; dmarc=pass action=none header.from=cadence.com;
 dkim=pass header.d=cadence.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4WCFopSBMQb644Ue3DA9a5X3g3Fpm0Nmkxq/EnGDB98=;
 b=ECCA0M/IK/+3SPht1qKSXWirsOoDZ8DRjXf+8E5lq1Dy/k5E6IO2v+HvEl883Zsb4Qr9dXiqVig6dd783KoUghbs8KvsQY0umnQceleJxMTEdAAQFS4nSIGB3ijFhcSo/weMjLuyNoK4l+5MSPzNT6PEAPfC8drjlFtHJAQJNzE=
Received: from DM6PR07MB5529.namprd07.prod.outlook.com (2603:10b6:5:7a::30) by
 DM5PR0701MB3653.namprd07.prod.outlook.com (2603:10b6:4:81::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3283.16; Thu, 13 Aug 2020 13:20:45 +0000
Received: from DM6PR07MB5529.namprd07.prod.outlook.com
 ([fe80::35cf:ffb3:3776:8362]) by DM6PR07MB5529.namprd07.prod.outlook.com
 ([fe80::35cf:ffb3:3776:8362%4]) with mapi id 15.20.3283.015; Thu, 13 Aug 2020
 13:20:45 +0000
From:   Pawel Laszczak <pawell@cadence.com>
To:     Peter Chen <peter.chen@nxp.com>,
        "balbi@kernel.org" <balbi@kernel.org>,
        "mathias.nyman@intel.com" <mathias.nyman@intel.com>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
CC:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-imx@nxp.com" <linux-imx@nxp.com>,
        "rogerq@ti.com" <rogerq@ti.com>, "jun.li@nxp.com" <jun.li@nxp.com>
Subject: RE: [PATCH v5 3/9] usb: cdns3: imx: add glue layer runtime pm
 implementation
Thread-Topic: [PATCH v5 3/9] usb: cdns3: imx: add glue layer runtime pm
 implementation
Thread-Index: AQHWVDM4KjaNDDU980uaI0GVprIq/Kk2QEJA
Date:   Thu, 13 Aug 2020 13:20:44 +0000
Message-ID: <DM6PR07MB5529C3F25DC7498D2AF850D9DD430@DM6PR07MB5529.namprd07.prod.outlook.com>
References: <20200707074941.28078-1-peter.chen@nxp.com>
 <20200707074941.28078-4-peter.chen@nxp.com>
In-Reply-To: <20200707074941.28078-4-peter.chen@nxp.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-dg-ref: PG1ldGE+PGF0IG5tPSJib2R5LnR4dCIgcD0iYzpcdXNlcnNccGF3ZWxsXGFwcGRhdGFccm9hbWluZ1wwOWQ4NDliNi0zMmQzLTRhNDAtODVlZS02Yjg0YmEyOWUzNWJcbXNnc1xtc2ctYzk4YmM2NGYtZGQ2Ny0xMWVhLTg3NjgtMWM0ZDcwMWRmYmE0XGFtZS10ZXN0XGM5OGJjNjUxLWRkNjctMTFlYS04NzY4LTFjNGQ3MDFkZmJhNGJvZHkudHh0IiBzej0iODcyMSIgdD0iMTMyNDE3OTg0NDMxMDkxNzc3IiBoPSJTZ0FSdFF6c0Rhdzh5OS94ZFd0cGliYTg1UjQ9IiBpZD0iIiBibD0iMCIgYm89IjEiLz48L21ldGE+
x-dg-rorf: true
authentication-results: nxp.com; dkim=none (message not signed)
 header.d=none;nxp.com; dmarc=none action=none header.from=cadence.com;
x-originating-ip: [185.217.253.59]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: bd3fd9cd-d351-4cfe-58fa-08d83f8baf83
x-ms-traffictypediagnostic: DM5PR0701MB3653:
x-microsoft-antispam-prvs: <DM5PR0701MB3653D217A2A6A981110945FADD430@DM5PR0701MB3653.namprd07.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5236;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 4ruUmcy0A599Dqa429xH/C9qm5O/Dfgp6OqyamWpR47p+lX3bFr6OXZiBUaa45btryW4ETe8yRkvdn+wWKPZE1MShPA0/bgHBUhQVqWmpCVBFk2P1RsVHVTUN4k56V8HQNk+OcyG+vlEsld8u8tzxzWhCbjWK1ZaoHMZTPuwKyecJ4G3ce0bmM4ouwl5eO8hay2CG7tXSkEu+VHzTjh6xVu58H03Z6xDo2aHIZ/RZfod6L+QjDdywLyyMDwRm9N+nSvYi8qBUp36Jnhrd9LHapaJGvKZT+9if5eKZCZZvnuNKVZfRFlzgAOba0YXK0Uuiu4JZygaFrMLyWsPmE8Ac0QEJOm4kbEkjWhPpOSNgdb7ujRvVfi0KrEo6KNJSy4m
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR07MB5529.namprd07.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(376002)(366004)(396003)(136003)(39860400002)(36092001)(55016002)(71200400001)(33656002)(54906003)(6506007)(4326008)(86362001)(52536014)(316002)(110136005)(8936002)(9686003)(478600001)(83380400001)(186003)(5660300002)(26005)(64756008)(66476007)(66556008)(7696005)(76116006)(2906002)(66446008)(8676002)(66946007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: EKMZCt3Kf9X8ER4rIosGFM+ypCjkT/yf6eEKjR/a6B7aZJAZ7llQJp26tX8MsOom4DsPuKTelK6IjwtXy4Pg9Qx7EKhpOxDqvbntL0eWgXyMKaQN+nvIVwc+hwB0OFp7jlZR3USDCQ9XGMHwK/Q+hboQtLmm071nTks4K2qrR4oSIHcfwvNMI08KjFsCz4YmuvEPbeuMOiDkZCMSZjtB5iJCULxoxrNMzSmZ+ELmZMaAAaUnThSHOeA0umx7B9UgxYIcuHmo02dKBwAzcv++liJ2DykTzWmUYo8JrqjnGLKrwnXFiK+BqaP2xsvCF6cNVZ+BMlr+ZgqVZXF0+u+pFHqn6n3le+VnezhOyRHzAz5x8CFhOnh2A3NF9a6iX6mSCdr8ScfvgDMv7gLq3aWStQ88fqFspBhJ5HKJbrRYjHufLC/uIWl4GHAge13ONdxC+CLTEb6dc2jrjrKPG57yQ3TLRuJYJSsedclaICE1SSMjnLgoUDpuGhjN44cny15+s05vEo/jr0KWcWiFnwPnECWjbNNOQX191uZcSYx9VZPE80ZDBkzDFs3CL+iOQ6uCgM7B7z2iBtbN+POfA1bYuIjanOQ/UZkzM+fHXEZ7rpMhela0kejGL8hdzbGH3Bdm1ZNDrzX3bcRMt4UqUaTVKg==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: cadence.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR07MB5529.namprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bd3fd9cd-d351-4cfe-58fa-08d83f8baf83
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Aug 2020 13:20:44.9480
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d36035c5-6ce6-4662-a3dc-e762e61ae4c9
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: T0p5r2oBLGN/rxWU5iBP7zx3KaGFZddW8ITJnyqmY5kDkYFPko382UjLqtO8CUYcEjsgdDhidXzSVF3EAn5IMlo/nA1eP6mXLHFTWEIfSjM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR0701MB3653
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235,18.0.687
 definitions=2020-08-13_10:2020-08-13,2020-08-13 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_check_notspam policy=outbound_check score=0 mlxlogscore=999
 impostorscore=0 mlxscore=0 spamscore=0 clxscore=1015 priorityscore=1501
 malwarescore=0 lowpriorityscore=0 adultscore=0 suspectscore=0 phishscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2008130100
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

>
>Add imx glue layer runtime pm implementation, and the runtime
>pm is default off.
>
>Signed-off-by: Peter Chen <peter.chen@nxp.com>

Reviewed-by: Pawel Laszczak <pawell@cadence.com>

>---
> drivers/usb/cdns3/cdns3-imx.c | 203 ++++++++++++++++++++++++++++++++--
> 1 file changed, 192 insertions(+), 11 deletions(-)
>
>diff --git a/drivers/usb/cdns3/cdns3-imx.c b/drivers/usb/cdns3/cdns3-imx.c
>index aba988e71958..5d2a4e19fa83 100644
>--- a/drivers/usb/cdns3/cdns3-imx.c
>+++ b/drivers/usb/cdns3/cdns3-imx.c
>@@ -15,6 +15,8 @@
> #include <linux/io.h>
> #include <linux/of_platform.h>
> #include <linux/iopoll.h>
>+#include <linux/pm_runtime.h>
>+#include "core.h"
>
> #define USB3_CORE_CTRL1    0x00
> #define USB3_CORE_CTRL2    0x04
>@@ -32,7 +34,7 @@
> /* Register bits definition */
>
> /* USB3_CORE_CTRL1 */
>-#define SW_RESET_MASK	(0x3f << 26)
>+#define SW_RESET_MASK	GENMASK(31, 26)
> #define PWR_SW_RESET	BIT(31)
> #define APB_SW_RESET	BIT(30)
> #define AXI_SW_RESET	BIT(29)
>@@ -44,17 +46,17 @@
> #define OC_DISABLE	BIT(9)
> #define MDCTRL_CLK_SEL	BIT(7)
> #define MODE_STRAP_MASK	(0x7)
>-#define DEV_MODE	(1 << 2)
>-#define HOST_MODE	(1 << 1)
>-#define OTG_MODE	(1 << 0)
>+#define DEV_MODE	BIT(2)
>+#define HOST_MODE	BIT(1)
>+#define OTG_MODE	BIT(0)
>
> /* USB3_INT_REG */
> #define CLK_125_REQ	BIT(29)
> #define LPM_CLK_REQ	BIT(28)
> #define DEVU3_WAEKUP_EN	BIT(14)
> #define OTG_WAKEUP_EN	BIT(12)
>-#define DEV_INT_EN (3 << 8) /* DEV INT b9:8 */
>-#define HOST_INT1_EN (1 << 0) /* HOST INT b7:0 */
>+#define DEV_INT_EN	GENMASK(9, 8) /* DEV INT b9:8 */
>+#define HOST_INT1_EN	BIT(0) /* HOST INT b7:0 */
>
> /* USB3_CORE_STATUS */
> #define MDCTRL_CLK_STATUS	BIT(15)
>@@ -62,15 +64,34 @@
> #define HOST_POWER_ON_READY	BIT(12)
>
> /* USB3_SSPHY_STATUS */
>-#define CLK_VALID_MASK		(0x3f << 26)
>-#define CLK_VALID_COMPARE_BITS	(0xf << 28)
>-#define PHY_REFCLK_REQ		(1 << 0)
>+#define CLK_VALID_MASK		GENMASK(31, 26)
>+#define CLK_VALID_COMPARE_BITS	GENMASK(31, 28)
>+#define PHY_REFCLK_REQ		BIT(0)
>+
>+/* OTG registers definition */
>+#define OTGSTS		0x4
>+/* OTGSTS */
>+#define OTG_NRDY	BIT(11)
>+
>+/* xHCI registers definition  */
>+#define XECP_PM_PMCSR		0x8018
>+#define XECP_AUX_CTRL_REG1	0x8120
>+
>+/* Register bits definition */
>+/* XECP_AUX_CTRL_REG1 */
>+#define CFG_RXDET_P3_EN		BIT(15)
>+
>+/* XECP_PM_PMCSR */
>+#define PS_MASK			GENMASK(1, 0)
>+#define PS_D0			0
>+#define PS_D1			1
>
> struct cdns_imx {
> 	struct device *dev;
> 	void __iomem *noncore;
> 	struct clk_bulk_data *clks;
> 	int num_clks;
>+	struct platform_device *cdns3_pdev;
> };
>
> static inline u32 cdns_imx_readl(struct cdns_imx *data, u32 offset)
>@@ -126,6 +147,20 @@ static int cdns_imx_noncore_init(struct cdns_imx *dat=
a)
> 	return ret;
> }
>
>+static int cdns_imx_platform_suspend(struct device *dev,
>+	bool suspend, bool wakeup);
>+static struct cdns3_platform_data cdns_imx_pdata =3D {
>+	.platform_suspend =3D cdns_imx_platform_suspend,
>+};
>+
>+static struct of_dev_auxdata cdns_imx_auxdata[] =3D {
>+	{
>+	.compatible =3D "cdns,usb3",
>+	.platform_data =3D &cdns_imx_pdata,
>+	},
>+	{},
>+};
>+
> static int cdns_imx_probe(struct platform_device *pdev)
> {
> 	struct device *dev =3D &pdev->dev;
>@@ -162,14 +197,18 @@ static int cdns_imx_probe(struct platform_device *pd=
ev)
> 	if (ret)
> 		goto err;
>
>-	ret =3D of_platform_populate(node, NULL, NULL, dev);
>+	ret =3D of_platform_populate(node, NULL, cdns_imx_auxdata, dev);
> 	if (ret) {
> 		dev_err(dev, "failed to create children: %d\n", ret);
> 		goto err;
> 	}
>
>-	return ret;
>+	device_set_wakeup_capable(dev, true);
>+	pm_runtime_set_active(dev);
>+	pm_runtime_enable(dev);
>+	pm_runtime_forbid(dev);
>
>+	return ret;
> err:
> 	clk_bulk_disable_unprepare(data->num_clks, data->clks);
> 	return ret;
>@@ -194,6 +233,147 @@ static int cdns_imx_remove(struct platform_device *p=
dev)
> 	return 0;
> }
>
>+#ifdef CONFIG_PM
>+static void cdns3_set_wakeup(struct cdns_imx *data, bool enable)
>+{
>+	u32 value;
>+
>+	value =3D cdns_imx_readl(data, USB3_INT_REG);
>+	if (enable)
>+		value |=3D OTG_WAKEUP_EN | DEVU3_WAEKUP_EN;
>+	else
>+		value &=3D ~(OTG_WAKEUP_EN | DEVU3_WAEKUP_EN);
>+
>+	cdns_imx_writel(data, USB3_INT_REG, value);
>+}
>+
>+static int cdns_imx_platform_suspend(struct device *dev,
>+		bool suspend, bool wakeup)
>+{
>+	struct cdns3 *cdns =3D dev_get_drvdata(dev);
>+	struct device *parent =3D dev->parent;
>+	struct cdns_imx *data =3D dev_get_drvdata(parent);
>+	void __iomem *otg_regs =3D (void *)(cdns->otg_regs);
>+	void __iomem *xhci_regs =3D cdns->xhci_regs;
>+	u32 value;
>+	int ret =3D 0;
>+
>+	if (cdns->role !=3D USB_ROLE_HOST)
>+		return 0;
>+
>+	if (suspend) {
>+		/* SW request low power when all usb ports allow to it ??? */
>+		value =3D readl(xhci_regs + XECP_PM_PMCSR);
>+		value &=3D ~PS_MASK;
>+		value |=3D PS_D1;
>+		writel(value, xhci_regs + XECP_PM_PMCSR);
>+
>+		/* mdctrl_clk_sel */
>+		value =3D cdns_imx_readl(data, USB3_CORE_CTRL1);
>+		value |=3D MDCTRL_CLK_SEL;
>+		cdns_imx_writel(data, USB3_CORE_CTRL1, value);
>+
>+		/* wait for mdctrl_clk_status */
>+		value =3D cdns_imx_readl(data, USB3_CORE_STATUS);
>+		ret =3D readl_poll_timeout(data->noncore + USB3_CORE_STATUS, value,
>+			(value & MDCTRL_CLK_STATUS) =3D=3D MDCTRL_CLK_STATUS,
>+			10, 100000);
>+		if (ret)
>+			dev_warn(parent, "wait mdctrl_clk_status timeout\n");
>+
>+		/* wait lpm_clk_req to be 0 */
>+		value =3D cdns_imx_readl(data, USB3_INT_REG);
>+		ret =3D readl_poll_timeout(data->noncore + USB3_INT_REG, value,
>+			(value & LPM_CLK_REQ) !=3D LPM_CLK_REQ,
>+			10, 100000);
>+		if (ret)
>+			dev_warn(parent, "wait lpm_clk_req timeout\n");
>+
>+		/* wait phy_refclk_req to be 0 */
>+		value =3D cdns_imx_readl(data, USB3_SSPHY_STATUS);
>+		ret =3D readl_poll_timeout(data->noncore + USB3_SSPHY_STATUS, value,
>+			(value & PHY_REFCLK_REQ) !=3D PHY_REFCLK_REQ,
>+			10, 100000);
>+		if (ret)
>+			dev_warn(parent, "wait phy_refclk_req timeout\n");
>+
>+		cdns3_set_wakeup(data, wakeup);
>+	} else {
>+		cdns3_set_wakeup(data, false);
>+
>+		/* SW request D0 */
>+		value =3D readl(xhci_regs + XECP_PM_PMCSR);
>+		value &=3D ~PS_MASK;
>+		value |=3D PS_D0;
>+		writel(value, xhci_regs + XECP_PM_PMCSR);
>+
>+		/* clr CFG_RXDET_P3_EN */
>+		value =3D readl(xhci_regs + XECP_AUX_CTRL_REG1);
>+		value &=3D ~CFG_RXDET_P3_EN;
>+		writel(value, xhci_regs + XECP_AUX_CTRL_REG1);
>+
>+		/* clear mdctrl_clk_sel */
>+		value =3D cdns_imx_readl(data, USB3_CORE_CTRL1);
>+		value &=3D ~MDCTRL_CLK_SEL;
>+		cdns_imx_writel(data, USB3_CORE_CTRL1, value);
>+
>+		/* wait CLK_125_REQ to be 1 */
>+		value =3D cdns_imx_readl(data, USB3_INT_REG);
>+		ret =3D readl_poll_timeout(data->noncore + USB3_INT_REG, value,
>+			(value & CLK_125_REQ) =3D=3D CLK_125_REQ,
>+			10, 100000);
>+		if (ret)
>+			dev_warn(parent, "wait CLK_125_REQ timeout\n");
>+
>+		/* wait for mdctrl_clk_status is cleared */
>+		value =3D cdns_imx_readl(data, USB3_CORE_STATUS);
>+		ret =3D readl_poll_timeout(data->noncore + USB3_CORE_STATUS, value,
>+			(value & MDCTRL_CLK_STATUS) !=3D MDCTRL_CLK_STATUS,
>+			10, 100000);
>+		if (ret)
>+			dev_warn(parent, "wait mdctrl_clk_status cleared timeout\n");
>+
>+		/* Wait until OTG_NRDY is 0 */
>+		value =3D readl(otg_regs + OTGSTS);
>+		ret =3D readl_poll_timeout(otg_regs + OTGSTS, value,
>+			(value & OTG_NRDY) !=3D OTG_NRDY,
>+			10, 100000);
>+		if (ret)
>+			dev_warn(parent, "wait OTG ready timeout\n");
>+	}
>+
>+	return ret;
>+
>+}
>+
>+static int cdns_imx_resume(struct device *dev)
>+{
>+	struct cdns_imx *data =3D dev_get_drvdata(dev);
>+
>+	return clk_bulk_prepare_enable(data->num_clks, data->clks);
>+}
>+
>+static int cdns_imx_suspend(struct device *dev)
>+{
>+	struct cdns_imx *data =3D dev_get_drvdata(dev);
>+
>+	clk_bulk_disable_unprepare(data->num_clks, data->clks);
>+
>+	return 0;
>+}
>+#else
>+static int cdns_imx_platform_suspend(struct device *dev,
>+	bool suspend, bool wakeup)
>+{
>+	return 0;
>+}
>+
>+#endif /* CONFIG_PM */
>+
>+static const struct dev_pm_ops cdns_imx_pm_ops =3D {
>+	SET_RUNTIME_PM_OPS(cdns_imx_suspend, cdns_imx_resume, NULL)
>+};
>+
> static const struct of_device_id cdns_imx_of_match[] =3D {
> 	{ .compatible =3D "fsl,imx8qm-usb3", },
> 	{},
>@@ -206,6 +386,7 @@ static struct platform_driver cdns_imx_driver =3D {
> 	.driver		=3D {
> 		.name	=3D "cdns3-imx",
> 		.of_match_table	=3D cdns_imx_of_match,
>+		.pm	=3D &cdns_imx_pm_ops,
> 	},
> };
> module_platform_driver(cdns_imx_driver);
>--
>2.17.1

