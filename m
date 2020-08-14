Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0E50024448D
	for <lists+linux-usb@lfdr.de>; Fri, 14 Aug 2020 07:29:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726340AbgHNF3k (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 14 Aug 2020 01:29:40 -0400
Received: from mail-eopbgr70059.outbound.protection.outlook.com ([40.107.7.59]:27701
        "EHLO EUR04-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726091AbgHNF3k (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 14 Aug 2020 01:29:40 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m9assuwj5a6VEuGK9OlCDTI++7STgxf4IUouv+AkXTUazFw7PpDZoy3HesqLCpBi/bjg/3WL30o8ajdHI/2P3IOeLuXhMugdkkwgmeeQDJrVqxIX0/4EAp9cxgHpXRSc/OwY+mdmds0+ItSL70qiqd9FM59262tYTtvwS9YhoB3srSM3OPAjcRmDV5MiuybvmVKa4Rkb5oNmGPzRhb3NOSzgzM8GNOa5NV1QCIFH2MGgKA8axVoCEuEoGYvZdGMvo0cNmhO75kRpqB++N9yI1gEJVVJcnBgPV2qKBrvj6i12R9gMddQewzQSWYNf3wKtCPr4Ok1cv42++qdCeakRZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N4o+MZO1Q1eHiyPV1PZV7y+iiUZ+76V9NwQbCfEZG1o=;
 b=EdgT394Bb3G4eGLk5TAM4spkiq66bX37aC3tNm5jAXJ/3x+t09cdBLctwswfQ+P7LPyT8TJAEB1v8GK5OZ1xpTuWn+zKD98gj73yHhLFoWExPkN5nQqNUiV8OCKZG164Ap3NHrMJKPzl7sGi2i7bSOv7wx656DFQr9BtL9CbqBCjncgXt+4QaBT2WIXlyh18y3SaXakhoPr7cl1NuU/nBPsnRH8AE8cKfTWCDe8M2IBM/5pSfsXxqi77Y9OYvyEvvw1oQa9VVtqbgJjLSQUKWfzDr6FWQ3AEhg/l3ahWJ+SzxL6NXbC7o3Maj57+6K0VBwP7v6kvrGU+Asffo00rww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N4o+MZO1Q1eHiyPV1PZV7y+iiUZ+76V9NwQbCfEZG1o=;
 b=Ljh1FIA160fW56x/wqHxDh3o00n5S1vkjBboBns8fnYOVnfJNIZKFWRb95sr6kjzVbAFVIYD/rtSGsu+fDI/zp20ZPkDY2NrTA+FE7o9keG3xKDw13qRSxZdR+ZoVSpOANzxEh4YkyadXQgWIFE2k5KD0KwkPD1aHzaxjN8qB60=
Received: from DB8PR04MB7162.eurprd04.prod.outlook.com (2603:10a6:10:12c::13)
 by DB3PR0402MB3641.eurprd04.prod.outlook.com (2603:10a6:8:b::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3283.16; Fri, 14 Aug
 2020 05:29:32 +0000
Received: from DB8PR04MB7162.eurprd04.prod.outlook.com
 ([fe80::acee:9763:7898:84a2]) by DB8PR04MB7162.eurprd04.prod.outlook.com
 ([fe80::acee:9763:7898:84a2%9]) with mapi id 15.20.3261.025; Fri, 14 Aug 2020
 05:29:32 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     Pawel Laszczak <pawell@cadence.com>
CC:     "balbi@kernel.org" <balbi@kernel.org>,
        "mathias.nyman@intel.com" <mathias.nyman@intel.com>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        dl-linux-imx <linux-imx@nxp.com>,
        "rogerq@ti.com" <rogerq@ti.com>, Jun Li <jun.li@nxp.com>
Subject: Re: [PATCH v5 1/9] usb: cdns3: introduce set_phy_power_on{off} APIs
Thread-Topic: [PATCH v5 1/9] usb: cdns3: introduce set_phy_power_on{off} APIs
Thread-Index: AQHWVDMv69m1Bo7FyU6Dwmwi2hXQ5Kk2LOwAgAEiNgA=
Date:   Fri, 14 Aug 2020 05:29:32 +0000
Message-ID: <20200814052840.GB22554@b29397-desktop>
References: <20200707074941.28078-1-peter.chen@nxp.com>
 <20200707074941.28078-2-peter.chen@nxp.com>
 <DM6PR07MB55298C1258149664502DCDCFDD430@DM6PR07MB5529.namprd07.prod.outlook.com>
In-Reply-To: <DM6PR07MB55298C1258149664502DCDCFDD430@DM6PR07MB5529.namprd07.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: cadence.com; dkim=none (message not signed)
 header.d=none;cadence.com; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [119.31.174.67]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 20bd0dee-3869-44f7-be55-08d840130639
x-ms-traffictypediagnostic: DB3PR0402MB3641:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DB3PR0402MB3641C1927A43FF920CE593338B400@DB3PR0402MB3641.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5797;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: qXMC6+SNAJKJIrgeNbmLHuFb7g65pvLGzVMruL3BY4nRY5prlU7BJt3TRTUHdIQJra1rOLSPMRqyELhtWrzptiTAG7VACODRa+JBJEsrB7p1PfQSnymXKUlnSlKrvdsPp2f2f1rm2l/VecpW1zTFgJ88Nh09N5PXtU4IK9YvHFMzBHvNXd8Jk2dkFQT6nM7cZ/IgLRIjrZskZ7Qg5wuURpy9mbVQ4tG4Gx1YkAiHL7cs0Wgxr4jjacf9L1ai9mmET8+s4D3ptujXBfIIMFD4sMqJyGNB2fQ5/YZ8udL+mGPHOd4CFYnif/yAmh3s1oz0xZQToXR8m03tVOGmu87K+A==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR04MB7162.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(366004)(396003)(136003)(39860400002)(376002)(346002)(186003)(66446008)(64756008)(33716001)(66476007)(44832011)(83380400001)(76116006)(66946007)(5660300002)(478600001)(26005)(1076003)(66556008)(91956017)(71200400001)(6916009)(33656002)(8936002)(6486002)(53546011)(6506007)(86362001)(54906003)(6512007)(9686003)(8676002)(316002)(4326008)(2906002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: l+v8pC106ptUTh2rZIM9XY39G/yp4UQ2doqvqPyEK6Gpa3J166V10C0RXmB1KkPdVnk0VW1IaCUL9rhhFaE1VP4nBOh9p4v5y9VegbhOh1ddf4SoytW6ie4DGeW5cSV5qxsRRXzEOOx3GYQUGeV9N8ar+WFA9nKyapuslranroQipu7DveJ2W6PXaeteERJmiSSyyoc4eA71wXc8BxYLb4qrqag2hjWenTdzyt9VvIGrjA89T3AZZjdyAi3eqmxMkUBBxasmUEZmwkkpi6euo0YTfymsR9ZeANuegoplAs5MIXrQ7Mb25ByU5veXqUdYCWvBdbTDreqmQc96u1ghT/N46Oni65JxcyPfaZ683LZEQ47bHKb9H/FR3GkU78qnv2hhdKpnK26ouUspGkoMVgZgAN5Lbqb/eIf1QfS1BiF9KUrGjmEwd2+36En38CLI2J7u8bBAjufZ1JlD6G8hdRdGPRZFWHgv726vjwyww3ChVE0jJFlnQtcMi6meBzIHkmAnvLx2It9a9HcDufIPwzHjDei8ueqJb4VRJnLbQkWXljuYPrfPIXFenhQvRZ+viPCEoCIA3k+LtpkGi8KtVxfiD9vhnI/WyznGxafzTfbp2n0kTCoJe78XuxzMeXJQrIZ8lJqJjspHjzxDtFMLiQ==
Content-Type: text/plain; charset="us-ascii"
Content-ID: <D261420CAEC3B047AE092A9CAA2CCAAB@eurprd04.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB8PR04MB7162.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 20bd0dee-3869-44f7-be55-08d840130639
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Aug 2020 05:29:32.4385
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hmqI6tx816hNSmxaR/snpbQOUe59kt6/MIC+LNpXU3YWxXw0ZQ+IgBj60FssNEMRHF+Lh6S2rO1euG15EqVVsg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR0402MB3641
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 20-08-13 12:09:58, Pawel Laszczak wrote:
>=20
> >
> >Since we have both USB2 and USB3 PHYs for cdns3 controller, it is
> >better we have unity APIs to handle both USB2 and USB3's power, it
> >could simplify code for error handling and further power management
> >implementation.
> >
> >Reviewed-by: Jun Li <jun.li@nxp.com>
> >Signed-off-by: Peter Chen <peter.chen@nxp.com>
> >---
> > drivers/usb/cdns3/core.c | 43 ++++++++++++++++++++++++++--------------
> > 1 file changed, 28 insertions(+), 15 deletions(-)
> >
> >diff --git a/drivers/usb/cdns3/core.c b/drivers/usb/cdns3/core.c
> >index 19bbb5b7e6b6..8818935d157b 100644
> >--- a/drivers/usb/cdns3/core.c
> >+++ b/drivers/usb/cdns3/core.c
> >@@ -384,6 +384,27 @@ static int cdns3_role_set(struct usb_role_switch *s=
w, enum usb_role role)
> > 	return ret;
> > }
> >
> >+static int set_phy_power_on(struct cdns3 *cdns)
> >+{
> >+	int ret;
> >+
> >+	ret =3D phy_power_on(cdns->usb2_phy);
> >+	if (ret)
> >+		return ret;
> >+
> >+	ret =3D phy_power_on(cdns->usb3_phy);
> >+	if (ret)
> >+		phy_power_off(cdns->usb2_phy);
> >+
> >+	return ret;
> >+}
> >+
> >+static void set_phy_power_off(struct cdns3 *cdns)
> >+{
> >+	phy_power_off(cdns->usb3_phy);
> >+	phy_power_off(cdns->usb2_phy);
> >+}
> >+
> > /**
> >  * cdns3_probe - probe for cdns3 core device
> >  * @pdev: Pointer to cdns3 core platform device
> >@@ -477,14 +498,10 @@ static int cdns3_probe(struct platform_device *pde=
v)
> > 	if (ret)
> > 		goto err1;
> >
> >-	ret =3D phy_power_on(cdns->usb2_phy);
> >+	ret =3D set_phy_power_on(cdns);
> > 	if (ret)
> > 		goto err2;
> >
> >-	ret =3D phy_power_on(cdns->usb3_phy);
> >-	if (ret)
> >-		goto err3;
> >-
> > 	sw_desc.set =3D cdns3_role_set;
> > 	sw_desc.get =3D cdns3_role_get;
> > 	sw_desc.allow_userspace_control =3D true;
> >@@ -496,16 +513,16 @@ static int cdns3_probe(struct platform_device *pde=
v)
> > 	if (IS_ERR(cdns->role_sw)) {
> > 		ret =3D PTR_ERR(cdns->role_sw);
> > 		dev_warn(dev, "Unable to register Role Switch\n");
> >-		goto err4;
> >+		goto err3;
> > 	}
> >
> > 	ret =3D cdns3_drd_init(cdns);
> > 	if (ret)
> >-		goto err5;
> >+		goto err4;
> >
> > 	ret =3D cdns3_core_init_role(cdns);
> > 	if (ret)
> >-		goto err5;
> >+		goto err4;
> >
> > 	device_set_wakeup_capable(dev, true);
> > 	pm_runtime_set_active(dev);
> >@@ -522,14 +539,11 @@ static int cdns3_probe(struct platform_device *pde=
v)
> > 	dev_dbg(dev, "Cadence USB3 core: probe succeed\n");
> >
> > 	return 0;
> >-err5:
> >+err4:
> > 	cdns3_drd_exit(cdns);
> > 	usb_role_switch_unregister(cdns->role_sw);
> >-err4:
> >-	phy_power_off(cdns->usb3_phy);
> >-
> > err3:
> >-	phy_power_off(cdns->usb2_phy);
> >+	set_phy_power_off(cdns);
> > err2:
> > 	phy_exit(cdns->usb3_phy);
> > err1:
>=20
> Dan Carpenter suggested me to use more meaningful labels instead err1 .. =
err5.

Yes, it is reasonable, we could follow this rule when design the new
function.

Peter
> =20
> Reviewed-by: Pawel Laszczak<pawell@cadence.com>
>=20
> Pawel
>=20
> >@@ -553,8 +567,7 @@ static int cdns3_remove(struct platform_device *pdev=
)
> > 	pm_runtime_put_noidle(&pdev->dev);
> > 	cdns3_exit_roles(cdns);
> > 	usb_role_switch_unregister(cdns->role_sw);
> >-	phy_power_off(cdns->usb2_phy);
> >-	phy_power_off(cdns->usb3_phy);
> >+	set_phy_power_off(cdns);
> > 	phy_exit(cdns->usb2_phy);
> > 	phy_exit(cdns->usb3_phy);
> > 	return 0;
> >--
> >2.17.1
>=20

--=20

Thanks,
Peter Chen=
