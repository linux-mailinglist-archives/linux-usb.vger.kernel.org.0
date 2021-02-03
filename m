Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EB9F430D2B6
	for <lists+linux-usb@lfdr.de>; Wed,  3 Feb 2021 06:00:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231220AbhBCE7V (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 2 Feb 2021 23:59:21 -0500
Received: from mx0b-0014ca01.pphosted.com ([208.86.201.193]:7348 "EHLO
        mx0a-0014ca01.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S229554AbhBCE7T (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 2 Feb 2021 23:59:19 -0500
Received: from pps.filterd (m0042333.ppops.net [127.0.0.1])
        by mx0b-0014ca01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 1134tB7p015801;
        Tue, 2 Feb 2021 20:58:02 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com; h=from : to : subject
 : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=proofpoint;
 bh=0wLMrznFqw/iV1fgCnmalFcHHMQD1BAuGh9mGsu0qy8=;
 b=nGODi5ptezKTFJw6KFlxeUfbcusYBZYaC6AtlY3G6pE+BM/FN4tqw80vH5otO4jHsjgd
 Ah/6y8YRGGVfFYyc4r+DxFUvqssD3/3X3osf89e0soXaSykNhKjGWJIxux3binm7tggf
 V3rVRhWr2OxCmMIHZ9X6zs2+fXXiph0yuGvsIwtxbN4spcd2UwG1JR1qAgY5jRz5GGrY
 o3BAtnaI+lyvsOyY32bHEMIwJU1q5qVnkNRINRxdBabLacryDsAY6ezoJQpHrCQnObcN
 TEGoFTPE0nsN04cmRkTqTV3ye230ejUCjyfMSP+lO9IBb3v0aZAsbfXQ2i0CQO1dlBOS MA== 
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2173.outbound.protection.outlook.com [104.47.58.173])
        by mx0b-0014ca01.pphosted.com with ESMTP id 36d3x3kb50-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 02 Feb 2021 20:58:02 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Mlw8Q5p2iRS7Z6mW2YoqdX+sDJl1zQr3jdayAHh5iEiv8h6bBm5H/JnFLnpn20dR09TgnPTWRyfCJpkLRzSoh6aDJCBkUqbeRaO6xgwCo1UCVEnT6smHnweIuIvVU8bAQby8R+Puc6gn0tKTvlco4ClLXCMc0N6M5xAaHHXI+pcfXJpXx/1hSPp9XXKohlB4dFO4TiqkXXPoWv72Ir2vsvQcciNCmithXEWUqrpLiPv6J+aUEHrr7+c7CuUlQDY+gJW2FOVn23+zsmx6Qwhysf231vlkwSlcPkc0L1qQynsaq6Ek8Sx4G891RjPz0so4PNH3/AHUQwl8EJiAzWaoIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0wLMrznFqw/iV1fgCnmalFcHHMQD1BAuGh9mGsu0qy8=;
 b=G7dMi3NRAvcpzjD9BV6RXweppd/mCOkyC7OiZQ5+FukqNURjCtlibN82kuHOpEbpCpChr3v8RtisFq72MR/N5PGlEBhtyo+QHu3LvqzjIv1a6yu4Mm25eATxlgoe4tiMWxakNqhz7CdZ76ramrjCwsTQKOshPZ8LXs749P9/THA1gz8Woi9KJ+drrWpkoVqZdngXUEM1FqJvhpvN0fO/vSWV//HLNU+0bMaO7DZkOZ5I6o7Joxmzoh1AOmlYc4jNeCtdlpbMw6Q62ovwtHSjbfydek3W5rFAal1r/15YkZgyr0qnCHQQOE9PsZLZchLvW6QBMy2aPiTLbEIsTqanWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cadence.com; dmarc=pass action=none header.from=cadence.com;
 dkim=pass header.d=cadence.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0wLMrznFqw/iV1fgCnmalFcHHMQD1BAuGh9mGsu0qy8=;
 b=Q7wzB0cXIDw9r+RU71S8Mrcem51THnrQhznYUCWVlmd+IGfzHmv98UmVd/jz5XDPazczR05zUBslgX1wBJ6IsndJn3NkXTiX3txrm8uoEZab9ydhAwU4SPAJvYlvAzJwWBCcu+cM4r7B4SG2JC8PKv5/be6FbMuECCmOgTNuXhg=
Received: from BYAPR07MB5381.namprd07.prod.outlook.com (2603:10b6:a03:6d::24)
 by BY5PR07MB7029.namprd07.prod.outlook.com (2603:10b6:a03:1f0::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.17; Wed, 3 Feb
 2021 04:58:00 +0000
Received: from BYAPR07MB5381.namprd07.prod.outlook.com
 ([fe80::34a2:314c:e80b:3be3]) by BYAPR07MB5381.namprd07.prod.outlook.com
 ([fe80::34a2:314c:e80b:3be3%7]) with mapi id 15.20.3805.028; Wed, 3 Feb 2021
 04:58:00 +0000
From:   Pawel Laszczak <pawell@cadence.com>
To:     Frank Li <Frank.Li@nxp.com>,
        "peter.chen@kernel.org" <peter.chen@kernel.org>,
        "a-govindraju@ti.com" <a-govindraju@ti.com>,
        "linux-imx@nxp.com" <linux-imx@nxp.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "lznuaa@gmail.com" <lznuaa@gmail.com>
Subject: RE: [PATCH 1/1] usb: cdns3: add power lost support for system resume
Thread-Topic: [PATCH 1/1] usb: cdns3: add power lost support for system resume
Thread-Index: AQHW+YUbsKrm+I3yDk+cFr7Z9qLQ7qpF3c4g
Date:   Wed, 3 Feb 2021 04:57:59 +0000
Message-ID: <BYAPR07MB538174D05FA1E8EBB5E17780DDB49@BYAPR07MB5381.namprd07.prod.outlook.com>
References: <20210202170121.29777-1-Frank.Li@nxp.com>
In-Reply-To: <20210202170121.29777-1-Frank.Li@nxp.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-dg-ref: PG1ldGE+PGF0IG5tPSJib2R5LnR4dCIgcD0iYzpcdXNlcnNccGF3ZWxsXGFwcGRhdGFccm9hbWluZ1wwOWQ4NDliNi0zMmQzLTRhNDAtODVlZS02Yjg0YmEyOWUzNWJcbXNnc1xtc2ctNWU2NDUxZjgtNjVkYy0xMWViLTg3N2EtMWM0ZDcwMWRmYmE0XGFtZS10ZXN0XDVlNjQ1MWZhLTY1ZGMtMTFlYi04NzdhLTFjNGQ3MDFkZmJhNGJvZHkudHh0IiBzej0iNjQwMSIgdD0iMTMyNTY4MDE4NzI1OTA1MTM0IiBoPSJkaWlQSHJORWlRVDl4ZmI0MW42QnpVcHVxdVE9IiBpZD0iIiBibD0iMCIgYm89IjEiLz48L21ldGE+
x-dg-rorf: true
authentication-results: nxp.com; dkim=none (message not signed)
 header.d=none;nxp.com; dmarc=none action=none header.from=cadence.com;
x-originating-ip: [59.145.174.78]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: abd9eff5-9bd0-42c3-8966-08d8c80047a3
x-ms-traffictypediagnostic: BY5PR07MB7029:
x-microsoft-antispam-prvs: <BY5PR07MB70290078B296380723C149A2DDB49@BY5PR07MB7029.namprd07.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4941;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: lhAIvqvccJWXOsfoLCTnqBNn7AAA6tjCYVbH3TkeRjGwdhBEvI1HYzgG42A6Av1By6mo7j1sOwT5oSFtNbLm7k2ahwUZWeZwtdA4QGIItyDrD/s7h/r+l7m8UK0sIZz+riyzQKByHET7PZXT8Kr6ATO9to7elKsKzc21uiYQI/RFDL+9SpHAj8BbChC+HWTKxuAGjGd+zFXP4ODxk3SgA6p1Y8/W7pN5ALbxfmRV5yB8jnKEER6biW2jOBzrwIQIvRKbGCh+Qui0CBLG0KlbMxJ37hoY40S7fZAKCI1ef/4dGt6mf+V/CP5AgVwUJuQXQKb9+28iQea0V7V9RMQl2xEh0uK1g+dq2kBufplUmg1s5PfSbhWXsSGI+XtbydFLn7jk9Q0QRivcPM3vO9MQz91vZKt3yGJwY76aZZ5kysmquD8Wp43UTGZo0QK9+nkz5h7qWkqaa2k4QwhLlMySnzIAEdSUaK4Kf9v0bcJECQuGzVYzttFzkT4z4FrLujA4e63w0Gu0l/V8CxKqPVeHOuwBw7FzZPCzd6BHYvPvSLo1R0zlsxdRRH4Z7O+e0Sc+q9M7oovO/N5f/s7e44P2DA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR07MB5381.namprd07.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(136003)(39860400002)(366004)(396003)(346002)(36092001)(8676002)(186003)(33656002)(478600001)(52536014)(76116006)(6506007)(110136005)(26005)(9686003)(2906002)(8936002)(66476007)(66946007)(71200400001)(66556008)(5660300002)(316002)(55016002)(83380400001)(86362001)(66446008)(7696005)(64756008);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?pfSIe+CqtlG+M/ExJtrL5mQy2Cz8KomlZ0HlkGToq6d+ku/tFC5+DBTVH2pT?=
 =?us-ascii?Q?3BcmnRl/xEytynHsylYZw5DtfDi2quPap2+ifEjIoXKyy+01Ytwy/vIJuf/w?=
 =?us-ascii?Q?V+1gnxP+MP0aY9gycBCuPZw7KUwA4vivDTUIgNGicKwSzSL58ODiSnaGkdzk?=
 =?us-ascii?Q?EKKHROMHR0Wj3nkz2nYoeRFVfdZ7AWpV7Df9/T0uPHrcuII9xo7/F2e0Lt2Q?=
 =?us-ascii?Q?N89BvFrsPialxAYDj3HTv4nGQns6LwLJlBD9OroOxcIuaGSfaEfK6yTLlSoM?=
 =?us-ascii?Q?EW7PgRcOqR8pslUJNGh8kVHLxSqZ0kLkue96wkYumVbg/FekBI49CpCZ9akK?=
 =?us-ascii?Q?y/xw1EnFh2AMBL2kdZF6RKJXerzhqcl2QiS+mu5+Smdw68UtLkor6hjT3ra3?=
 =?us-ascii?Q?HJ0xTlnbEWqh/ADXF+ZjGlELhhRAm5jm4wZsIVO9WkpiWbVpEDpOM49TMqgT?=
 =?us-ascii?Q?QWG5BQHuP0fzibP6AERuzHuqV23dqMWilbIWkcCq9flk30kjT8J5MwIqPQsf?=
 =?us-ascii?Q?vhQvZXGsbFC77wsMfuGiuxJZQsAsqkQ6Vnp8TIdoYntlHTDJ1wa0pZetVfnR?=
 =?us-ascii?Q?WlmJVYPb3gyjb9iOY92iDogzgTrf7gV737ejKn4h+QJNpQfuUhmLb8/Ay+Xw?=
 =?us-ascii?Q?AIjEYOx4yk2cARqUaxT5mzEymxWaFiv4hwD93lL66tvM34dUrPG6tsOHbzUB?=
 =?us-ascii?Q?AHZ7kmfThGkglKS2RCf/TUND6Y8mvI2IHYBln14nGBMktbctViPLC0Vu43a1?=
 =?us-ascii?Q?wVmd1r8882M305qAI0SMxxMzwJifpg2eZqGN1e2GLupOs4WYfOliIEAHPyex?=
 =?us-ascii?Q?AOvsNLHYUQhUPkVN5+0lj/aBkAPTFmxCq60vARhHlfYarHoZ6dmpj9GQnhOT?=
 =?us-ascii?Q?v3DKeZa4dtwA9b/vXDYPwoFH7qMajw/1oCyHXHZR1QgiL7EWQJEdNKmaommt?=
 =?us-ascii?Q?mGMNmDmvDEsfU0I5lSTCmtON9gP/WsKl575t4+zr8YX6L+VAPoajVNDfU5Cp?=
 =?us-ascii?Q?DDhea9NgBCXgxG9XoUlUX9rdQAnSd7ahbrv+W5++oiaI3FltDYXDpBLiquRj?=
 =?us-ascii?Q?ZgCJr0cJ?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: cadence.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR07MB5381.namprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: abd9eff5-9bd0-42c3-8966-08d8c80047a3
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Feb 2021 04:57:59.9880
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d36035c5-6ce6-4662-a3dc-e762e61ae4c9
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3FI3laa1ZRR4OWlkbH4Y6LZUfYG0CuXAKpsG/GAeRK+Gn1SyGCCpt2WApdq2SuDR4fmnZ0b0Ni4ludhzphVmOXho0dqeZPOnaZAQHVNe7sQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR07MB7029
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369,18.0.737
 definitions=2021-02-03_01:2021-02-02,2021-02-03 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_check_notspam policy=outbound_check score=0 malwarescore=0
 mlxscore=0 phishscore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 mlxlogscore=999 clxscore=1011 lowpriorityscore=0 spamscore=0 adultscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2102030027
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Frank,

>
>
>If the controller lost its power during the system suspend, we need
>to do all initialiation operations.
>
>Signed-off-by: Peter Chen <peter.chen@nxp.com>
>Signed-off-by: Frank Li <Frank.Li@nxp.com>
>---
> drivers/usb/cdns3/cdns3-gadget.c |  2 ++
> drivers/usb/cdns3/cdns3-imx.c    | 34 ++++++++++++++++++++++++++++++++
> drivers/usb/cdns3/cdns3-plat.c   | 22 ++++++++++++++++++++-
> drivers/usb/cdns3/core.c         | 29 ++++++++++++++++++++++++++-
> drivers/usb/cdns3/drd.c          | 16 +++++++++++++++
> drivers/usb/cdns3/drd.h          |  2 +-
> 6 files changed, 102 insertions(+), 3 deletions(-)
>
>diff --git a/drivers/usb/cdns3/cdns3-gadget.c b/drivers/usb/cdns3/cdns3-ga=
dget.c
>index 582bfeceedb4..44b7301b1888 100644
>--- a/drivers/usb/cdns3/cdns3-gadget.c
>+++ b/drivers/usb/cdns3/cdns3-gadget.c
>@@ -3304,6 +3304,8 @@ static int cdns3_gadget_resume(struct cdns *cdns, bo=
ol hibernated)
> 		return 0;
>
> 	cdns3_gadget_config(priv_dev);
>+	if (hibernated)
>+		writel(USB_CONF_DEVEN, &priv_dev->regs->usb_conf);
>
> 	return 0;
> }
>diff --git a/drivers/usb/cdns3/cdns3-imx.c b/drivers/usb/cdns3/cdns3-imx.c
>index 8f88eec0b0ea..708b51cc5844 100644
>--- a/drivers/usb/cdns3/cdns3-imx.c
>+++ b/drivers/usb/cdns3/cdns3-imx.c
>@@ -361,6 +361,39 @@ static int cdns_imx_suspend(struct device *dev)
>
> 	return 0;
> }
>+
>+
>+/* Indicate if the controller was power lost before */
>+static inline bool cdns_imx_is_power_lost(struct cdns_imx *data)
>+{
>+	u32 value;
>+
>+	value =3D cdns_imx_readl(data, USB3_CORE_CTRL1);
>+	if ((value & SW_RESET_MASK) =3D=3D ALL_SW_RESET)
>+		return true;
>+	else
>+		return false;
>+}
>+
>+static int cdns_imx_system_resume(struct device *dev)
>+{
>+	struct cdns_imx *data =3D dev_get_drvdata(dev);
>+	int ret;
>+
>+	ret =3D cdns_imx_resume(dev);
>+	if (ret)
>+		return ret;
>+
>+	if (cdns_imx_is_power_lost(data)) {
>+		dev_dbg(dev, "resume from power lost\n");
>+		ret =3D cdns_imx_noncore_init(data);
>+		if (ret)
>+			cdns_imx_suspend(dev);
>+	}
>+
>+	return ret;
>+}
>+
> #else
> static int cdns_imx_platform_suspend(struct device *dev,
> 	bool suspend, bool wakeup)
>@@ -372,6 +405,7 @@ static int cdns_imx_platform_suspend(struct device *de=
v,
>
> static const struct dev_pm_ops cdns_imx_pm_ops =3D {
> 	SET_RUNTIME_PM_OPS(cdns_imx_suspend, cdns_imx_resume, NULL)
>+	SET_SYSTEM_SLEEP_PM_OPS(cdns_imx_suspend, cdns_imx_system_resume)
> };
>
> static const struct of_device_id cdns_imx_of_match[] =3D {
>diff --git a/drivers/usb/cdns3/cdns3-plat.c b/drivers/usb/cdns3/cdns3-plat=
.c
>index 4b18e1c6a4bb..e61da57fe31a 100644
>--- a/drivers/usb/cdns3/cdns3-plat.c
>+++ b/drivers/usb/cdns3/cdns3-plat.c
>@@ -19,6 +19,7 @@
>
> #include "core.h"
> #include "gadget-export.h"
>+#include "drd.h"
>
> static int set_phy_power_on(struct cdns *cdns)
> {
>@@ -236,6 +237,17 @@ static int cdns3_controller_resume(struct device *dev=
, pm_message_t msg)
> 	if (!cdns->in_lpm)
> 		return 0;
>
>+	if (cdns_power_is_lost(cdns)) {
>+		phy_exit(cdns->usb2_phy);
>+		ret =3D phy_init(cdns->usb2_phy);
>+		if (ret)
>+			return ret;
>+		phy_exit(cdns->usb3_phy);
>+		ret =3D phy_init(cdns->usb3_phy);
>+		if (ret)
>+			return ret;
>+	}
>+
> 	ret =3D set_phy_power_on(cdns);
> 	if (ret)
> 		return ret;
>@@ -270,10 +282,18 @@ static int cdns3_plat_runtime_resume(struct device *=
dev)
> static int cdns3_plat_suspend(struct device *dev)
> {
> 	struct cdns *cdns =3D dev_get_drvdata(dev);
>+	int ret;
>
> 	cdns_suspend(cdns);
>
>-	return cdns3_controller_suspend(dev, PMSG_SUSPEND);
>+	ret =3D cdns3_controller_suspend(dev, PMSG_SUSPEND);
>+	if (ret)
>+		return ret;
>+
>+	if (device_may_wakeup(dev) && cdns->wakeup_irq)
>+		enable_irq_wake(cdns->wakeup_irq);
>+
>+	return ret;
> }
>
> static int cdns3_plat_resume(struct device *dev)
>diff --git a/drivers/usb/cdns3/core.c b/drivers/usb/cdns3/core.c
>index 199713769289..5d486c8a9d99 100644
>--- a/drivers/usb/cdns3/core.c
>+++ b/drivers/usb/cdns3/core.c
>@@ -525,9 +525,36 @@ EXPORT_SYMBOL_GPL(cdns_suspend);
> int cdns_resume(struct cdns *cdns, u8 set_active)
> {
> 	struct device *dev =3D cdns->dev;
>+	enum usb_role real_role;
>+	bool role_changed =3D false;
>+	int ret;
>+
>+	if (cdns_power_is_lost(cdns)) {
>+		if (cdns->role_sw) {
>+			cdns->role =3D cdns_role_get(cdns->role_sw);
>+		} else {
>+			real_role =3D cdns_hw_role_state_machine(cdns);
>+			if (real_role !=3D cdns->role) {
>+				ret =3D cdns_hw_role_switch(cdns);
>+				if (ret)
>+					return ret;
>+				role_changed =3D true;
>+			}
>+		}
>+
>+		if (!role_changed) {
>+			if (cdns->role =3D=3D USB_ROLE_HOST)
>+				ret =3D cdns_drd_host_on(cdns);
>+			else if (cdns->role =3D=3D USB_ROLE_DEVICE)
>+				ret =3D cdns_drd_gadget_on(cdns);
>+
>+			if (ret)
>+				return ret;
>+		}
>+	}
>
> 	if (cdns->roles[cdns->role]->resume)
>-		cdns->roles[cdns->role]->resume(cdns, false);
>+		cdns->roles[cdns->role]->resume(cdns, cdns_power_is_lost(cdns));
>
> 	if (set_active) {
> 		pm_runtime_disable(dev);
>diff --git a/drivers/usb/cdns3/drd.c b/drivers/usb/cdns3/drd.c
>index 605a413db727..8b04e030df4d 100644
>--- a/drivers/usb/cdns3/drd.c
>+++ b/drivers/usb/cdns3/drd.c
>@@ -478,3 +478,19 @@ int cdns_drd_exit(struct cdns *cdns)
>
> 	return 0;
> }
>+
>+
>+/* Indicate the cdns3 core was power lost before */
>+bool cdns_power_is_lost(struct cdns *cdns)
>+{
>+	int ret =3D false;

You don't need this variable.=20

>+
>+	if (cdns->version =3D=3D CDNS3_CONTROLLER_V1) {
>+		if (!(readl(&cdns->otg_v1_regs->simulate) & BIT(0)))
>+			ret =3D true;


return true;

>+	} else {
>+		if (!(readl(&cdns->otg_v0_regs->simulate) & BIT(0)))
>+			ret =3D true;

retrun true;

>+	}
>+	return ret;

return false;

Regards,
Pawel Laszczak

>+}
>diff --git a/drivers/usb/cdns3/drd.h b/drivers/usb/cdns3/drd.h
>index 9724acdecbbb..cbdf94f73ed9 100644
>--- a/drivers/usb/cdns3/drd.h
>+++ b/drivers/usb/cdns3/drd.h
>@@ -215,5 +215,5 @@ int cdns_drd_gadget_on(struct cdns *cdns);
> void cdns_drd_gadget_off(struct cdns *cdns);
> int cdns_drd_host_on(struct cdns *cdns);
> void cdns_drd_host_off(struct cdns *cdns);
>-
>+bool cdns_power_is_lost(struct cdns *cdns);
> #endif /* __LINUX_CDNS3_DRD */
>--
>2.24.0.rc1



