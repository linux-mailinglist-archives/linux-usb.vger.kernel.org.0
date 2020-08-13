Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1297824399F
	for <lists+linux-usb@lfdr.de>; Thu, 13 Aug 2020 14:10:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726192AbgHMMKU (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 13 Aug 2020 08:10:20 -0400
Received: from mx0a-0014ca01.pphosted.com ([208.84.65.235]:11824 "EHLO
        mx0a-0014ca01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726106AbgHMMKQ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 13 Aug 2020 08:10:16 -0400
Received: from pps.filterd (m0042385.ppops.net [127.0.0.1])
        by mx0a-0014ca01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 07DC8HeO024366;
        Thu, 13 Aug 2020 05:10:03 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=proofpoint;
 bh=nH0PEpEOSALuJNfSOCBd6PWS9hilbpXGj/of3ykyidU=;
 b=rq168SfPeooVSzcCWUaLvfWSeRKmSX8PUUOSck1V1Mrt/UmTG5hd6mHyeTIZznMC5ejE
 +QQDI54a99e4jF0VlZz5FoZR3MrQP9YX4q/z8ctaHdb3ku/nlGScc2MPtXN04p9OGsK2
 TW8XJHy2EfpadcbqTeV/T0d91VUI3mU27EU68dPWZDMYzrOuIp++HIc6F6cv7wzJ7nlv
 vckTrENL+PRT6m7L32W2mDZFRumbKAvIWqDO9ijZ+IEdLp7WP4+hEttnfuIRPtYn2lq8
 8Upq/K3BGzkeMhQ5s+t28tSXGZTPcw9kbniAKbLkFRUDT4RfZopXBFitBwbwUAgENdK2 yw== 
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2103.outbound.protection.outlook.com [104.47.58.103])
        by mx0a-0014ca01.pphosted.com with ESMTP id 32srkw96pd-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 13 Aug 2020 05:10:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A42oeIvGQH2wi/Ff0RfD6xA6gkYvEyZUmXp1CQd7Qdr39lvpblwHdrAaLr8Q9tCH3kP3GSBFS9fJ0j2wsVHA8c+3Uu5vyrOMDw3zc3IupCczGve4JoOK4HUcmzWDbwbHiM3H6/XKk0844tKN2CKQc2a5J/xRJJk3hvunJ5xA9bOcEo5YdH2loR6Kno97YIhgatcPFWYm36wV7imOG7GvPi26aTVMaohAoJYhbYkxbVlO2Mq0U0aE0epjQVqVcaeDOQ3Ta6ADKuE3+i4aZm7hLrlT50hlvDFVjP4xsApKEhj7oNv9IuLwfF3wTeNWysQr3nYn92wQonuZwsiauJBiJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nH0PEpEOSALuJNfSOCBd6PWS9hilbpXGj/of3ykyidU=;
 b=g/HM0OoE1Yc1ozCeIDWAgED2v2nk8l69yoJj5+fJ9ATin86idMLphtlLyiLUKlyGuujNPZ+e1ItntQx0Dt9V+HIPW3CaR3JbawbYUlajGyGP1nlWksJu8CVWk1rj47GreG4mPhQq+RKWGGBDdzTSIUcgbuCl3htYnk21aJ2Iwwt2QOpHgkTS1PBTmDBthbRQcoG15J1c6sLAismYLcFi6RAa9NUH6taiL0kdGaKybCY8Yfz2/1yQ/NAdvRtavnbuSI0s169z7DvN3wMxUMGQPi9U5W3tkPOa+W7CLNATdo7SMoDQArItVFnzuy9w4ou0lsFPIGEec1F63mfKio76sg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cadence.com; dmarc=pass action=none header.from=cadence.com;
 dkim=pass header.d=cadence.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nH0PEpEOSALuJNfSOCBd6PWS9hilbpXGj/of3ykyidU=;
 b=F+4BvftC/s0BPnGtEz90UDfnx4wNgL8TgWaMsliEe/9Gmi57oe3YWpupqIG5dtE6xiUZJPp0ZJ8ukfun7kAVceNV12yx2y9/4TiDP2KDWVQ6Qq8EG6jxHsS1ieCxbbz+sJNGInuWQ7RtF7tooBR+zDhU5g1HUcpgCYiQjHUYlCs=
Received: from DM6PR07MB5529.namprd07.prod.outlook.com (2603:10b6:5:7a::30) by
 DM6PR07MB6089.namprd07.prod.outlook.com (2603:10b6:5:18a::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3283.16; Thu, 13 Aug 2020 12:09:58 +0000
Received: from DM6PR07MB5529.namprd07.prod.outlook.com
 ([fe80::35cf:ffb3:3776:8362]) by DM6PR07MB5529.namprd07.prod.outlook.com
 ([fe80::35cf:ffb3:3776:8362%4]) with mapi id 15.20.3283.015; Thu, 13 Aug 2020
 12:09:58 +0000
From:   Pawel Laszczak <pawell@cadence.com>
To:     Peter Chen <peter.chen@nxp.com>,
        "balbi@kernel.org" <balbi@kernel.org>,
        "mathias.nyman@intel.com" <mathias.nyman@intel.com>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
CC:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-imx@nxp.com" <linux-imx@nxp.com>,
        "rogerq@ti.com" <rogerq@ti.com>, "jun.li@nxp.com" <jun.li@nxp.com>
Subject: RE: [PATCH v5 1/9] usb: cdns3: introduce set_phy_power_on{off} APIs
Thread-Topic: [PATCH v5 1/9] usb: cdns3: introduce set_phy_power_on{off} APIs
Thread-Index: AQHWVDMzuK76Rek5U0CxlOuNqKbV6qk2KwNw
Date:   Thu, 13 Aug 2020 12:09:58 +0000
Message-ID: <DM6PR07MB55298C1258149664502DCDCFDD430@DM6PR07MB5529.namprd07.prod.outlook.com>
References: <20200707074941.28078-1-peter.chen@nxp.com>
 <20200707074941.28078-2-peter.chen@nxp.com>
In-Reply-To: <20200707074941.28078-2-peter.chen@nxp.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-dg-ref: PG1ldGE+PGF0IG5tPSJib2R5LnR4dCIgcD0iYzpcdXNlcnNccGF3ZWxsXGFwcGRhdGFccm9hbWluZ1wwOWQ4NDliNi0zMmQzLTRhNDAtODVlZS02Yjg0YmEyOWUzNWJcbXNnc1xtc2ctZTVhNjE5Y2ItZGQ1ZC0xMWVhLTg3NjgtMWM0ZDcwMWRmYmE0XGFtZS10ZXN0XGU1YTYxOWNkLWRkNWQtMTFlYS04NzY4LTFjNGQ3MDFkZmJhNGJvZHkudHh0IiBzej0iMzE3NCIgdD0iMTMyNDE3OTQxOTUyOTE1ODI4IiBoPSJaR2I5SC94cjFxQVJQOTR0dWd4RVNjWTZjY2c9IiBpZD0iIiBibD0iMCIgYm89IjEiLz48L21ldGE+
x-dg-rorf: true
authentication-results: nxp.com; dkim=none (message not signed)
 header.d=none;nxp.com; dmarc=none action=none header.from=cadence.com;
x-originating-ip: [185.217.253.59]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f08574a4-5c0b-4797-75ad-08d83f81cc78
x-ms-traffictypediagnostic: DM6PR07MB6089:
x-microsoft-antispam-prvs: <DM6PR07MB608952F95715FFA7CB1ACD93DD430@DM6PR07MB6089.namprd07.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3173;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: JigCar3QLjahugWRSlO7aJ/dASj6rkB1bQijJiQAWao6TPqvP0Hwa8XdNSiT65wF0Eu54Fv1dkrPh+159xzEZjAfMl/Hx/3Bex43Pa76lMi60Mw20/em5gVysfZXml82CUnxI9WnF9R3PlJVk1/1yGwaDkWWyfvZZiJp97MU1jDk0npJ+zwcdTt8BHNyVMT1iAytJsBVzR+/NEcPjEcppdsb2rHktJOoK6d3CmOWxFiUlWpX2+V3m9JXuneFiPgnSvuqXGdwgHyw19C2k93SE3AKSxZosZhTjYprpHEnkXav4Qae4bvb6qvA2ILAyvzqVumC7/az6kvAHWbawyj8LqZri6GaNtmBrMqhtRk8yUAP194Pyj9JPKsSzzDSy6Oa
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR07MB5529.namprd07.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(346002)(366004)(39860400002)(376002)(136003)(36092001)(54906003)(110136005)(316002)(66946007)(66556008)(55016002)(64756008)(71200400001)(76116006)(66476007)(66446008)(8676002)(2906002)(5660300002)(9686003)(52536014)(8936002)(26005)(4326008)(478600001)(7696005)(83380400001)(6506007)(86362001)(186003)(33656002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: DLbAXH4HPxwLRDrBCjvBfvMav1wdis1A66PEiqQ1x/MP+lkmVzvIDSbTEo89b6GJolXcjhn8ovaGTWfDkN5bwdqC9ie2nUpHq+2pUs4cz33Nr5Ih7iVOTs9r1GnM8WOKAgYld0swnr0Knrs7vG/UoW3fPv+z3Fc/6W2Nld03w0UWxhWWXtuOO/uxlYLfqanZ2nbQHl6S3psJMiQF6dXS49DBUoa6Ae4OZmgInCCQt4Hqf5st2wD7jJn/NwUluO4TPr0IwuIrQqXnL5IP6ABDEtmzdpTnSuNHB6X6kAfzCJCBA+upvzZ06QegMrzAe2NXdorniWC+bjEetgdDRTS5TGJJ6cOyOu7hYayJHKPy6yANUxbWwfiShZdcYP6mTRvrxtBsGv+hbrVXps7lHKdp8mUfrVieEPjGaK6FlSjdtir4ShqxrfO4udtTxvZKWFuMo0zULn+h5U1POSioDVWo/nIm/11kCpwBT3UwvB9UofvE5ytyESPfPVusX+1nyNT4RTLbzHmyyWPUwwPyLvrUy9w2ThmReG2SNkoAuaOQd6qcZ8UJX2efzvwXbYxUSSlkim+StRKahh/NW0v/3iw7WZYk0xhYAE6DEVGRN8UVxUpAIeYk4rWhW69C2m0XlE6peOEFV3TxjmsWYj5KeraQug==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: cadence.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR07MB5529.namprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f08574a4-5c0b-4797-75ad-08d83f81cc78
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Aug 2020 12:09:58.5083
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d36035c5-6ce6-4662-a3dc-e762e61ae4c9
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3ZxtouU5KuzjofOhuwgkjPKSQuh3iAvCOoJAeIVl3BFAOU0AyerjKd1NC7I8pEHTyoUBRTjoPfGWe6uq9qAxbuDUMWIjddK/qGjsGoqo0Hc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR07MB6089
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235,18.0.687
 definitions=2020-08-13_10:2020-08-13,2020-08-13 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_check_notspam policy=outbound_check score=0 mlxlogscore=941
 impostorscore=0 mlxscore=0 spamscore=0 clxscore=1011 priorityscore=1501
 malwarescore=0 lowpriorityscore=0 adultscore=0 suspectscore=0 phishscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2008130093
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


>
>Since we have both USB2 and USB3 PHYs for cdns3 controller, it is
>better we have unity APIs to handle both USB2 and USB3's power, it
>could simplify code for error handling and further power management
>implementation.
>
>Reviewed-by: Jun Li <jun.li@nxp.com>
>Signed-off-by: Peter Chen <peter.chen@nxp.com>
>---
> drivers/usb/cdns3/core.c | 43 ++++++++++++++++++++++++++--------------
> 1 file changed, 28 insertions(+), 15 deletions(-)
>
>diff --git a/drivers/usb/cdns3/core.c b/drivers/usb/cdns3/core.c
>index 19bbb5b7e6b6..8818935d157b 100644
>--- a/drivers/usb/cdns3/core.c
>+++ b/drivers/usb/cdns3/core.c
>@@ -384,6 +384,27 @@ static int cdns3_role_set(struct usb_role_switch *sw,=
 enum usb_role role)
> 	return ret;
> }
>
>+static int set_phy_power_on(struct cdns3 *cdns)
>+{
>+	int ret;
>+
>+	ret =3D phy_power_on(cdns->usb2_phy);
>+	if (ret)
>+		return ret;
>+
>+	ret =3D phy_power_on(cdns->usb3_phy);
>+	if (ret)
>+		phy_power_off(cdns->usb2_phy);
>+
>+	return ret;
>+}
>+
>+static void set_phy_power_off(struct cdns3 *cdns)
>+{
>+	phy_power_off(cdns->usb3_phy);
>+	phy_power_off(cdns->usb2_phy);
>+}
>+
> /**
>  * cdns3_probe - probe for cdns3 core device
>  * @pdev: Pointer to cdns3 core platform device
>@@ -477,14 +498,10 @@ static int cdns3_probe(struct platform_device *pdev)
> 	if (ret)
> 		goto err1;
>
>-	ret =3D phy_power_on(cdns->usb2_phy);
>+	ret =3D set_phy_power_on(cdns);
> 	if (ret)
> 		goto err2;
>
>-	ret =3D phy_power_on(cdns->usb3_phy);
>-	if (ret)
>-		goto err3;
>-
> 	sw_desc.set =3D cdns3_role_set;
> 	sw_desc.get =3D cdns3_role_get;
> 	sw_desc.allow_userspace_control =3D true;
>@@ -496,16 +513,16 @@ static int cdns3_probe(struct platform_device *pdev)
> 	if (IS_ERR(cdns->role_sw)) {
> 		ret =3D PTR_ERR(cdns->role_sw);
> 		dev_warn(dev, "Unable to register Role Switch\n");
>-		goto err4;
>+		goto err3;
> 	}
>
> 	ret =3D cdns3_drd_init(cdns);
> 	if (ret)
>-		goto err5;
>+		goto err4;
>
> 	ret =3D cdns3_core_init_role(cdns);
> 	if (ret)
>-		goto err5;
>+		goto err4;
>
> 	device_set_wakeup_capable(dev, true);
> 	pm_runtime_set_active(dev);
>@@ -522,14 +539,11 @@ static int cdns3_probe(struct platform_device *pdev)
> 	dev_dbg(dev, "Cadence USB3 core: probe succeed\n");
>
> 	return 0;
>-err5:
>+err4:
> 	cdns3_drd_exit(cdns);
> 	usb_role_switch_unregister(cdns->role_sw);
>-err4:
>-	phy_power_off(cdns->usb3_phy);
>-
> err3:
>-	phy_power_off(cdns->usb2_phy);
>+	set_phy_power_off(cdns);
> err2:
> 	phy_exit(cdns->usb3_phy);
> err1:

Dan Carpenter suggested me to use more meaningful labels instead err1 .. er=
r5.
=20
Reviewed-by: Pawel Laszczak<pawell@cadence.com>

Pawel

>@@ -553,8 +567,7 @@ static int cdns3_remove(struct platform_device *pdev)
> 	pm_runtime_put_noidle(&pdev->dev);
> 	cdns3_exit_roles(cdns);
> 	usb_role_switch_unregister(cdns->role_sw);
>-	phy_power_off(cdns->usb2_phy);
>-	phy_power_off(cdns->usb3_phy);
>+	set_phy_power_off(cdns);
> 	phy_exit(cdns->usb2_phy);
> 	phy_exit(cdns->usb3_phy);
> 	return 0;
>--
>2.17.1

