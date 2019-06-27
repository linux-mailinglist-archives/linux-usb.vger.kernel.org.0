Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4D33E579EA
	for <lists+linux-usb@lfdr.de>; Thu, 27 Jun 2019 05:22:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726762AbfF0DWd (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 26 Jun 2019 23:22:33 -0400
Received: from mail-eopbgr20080.outbound.protection.outlook.com ([40.107.2.80]:18919
        "EHLO EUR02-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726663AbfF0DWc (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 26 Jun 2019 23:22:32 -0400
ARC-Seal: i=1; a=rsa-sha256; s=testarcselector01; d=microsoft.com; cv=none;
 b=rs7/FJp+TBuxazlr2h3qhZx7IoOMzZ7ttlGG96WX6eqPp7slkNfq/wwoGY19NjoYCac4Ew0ukUpD6MqoeUjjenHTdpzbRMQKX8WxgzztEXS1Z9eKDAXgk4vu3AZq8oeFk+DAj3P/ybqTXiZIDOY7vCVw5V5xCTxH/SM+hjLct3c=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=testarcselector01;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TKCaCzqk8iPMb0NaVEzmbNvV2P8j5hv99P06lISxRF8=;
 b=XbQsPUSXkkH5szlN3BvmP/53n3liDhea2jvtdciOj4p3GmSCJCS/yaGMcGzh8XeLPyAGDKCneB0tsIAqFj/sDwSC+XkPqCqXNirmaAsIgiwVPeyO6exAv8nt5KxyWF5GkWylNCSUrrtBygaxAaxMJ6h7c/4uJEXE3tL34QelRPk=
ARC-Authentication-Results: i=1; test.office365.com
 1;spf=none;dmarc=none;dkim=none;arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TKCaCzqk8iPMb0NaVEzmbNvV2P8j5hv99P06lISxRF8=;
 b=KaVYPVGqIOD0AIQY7lzLagITF5HslABdTXRrAO9s9zNkHBfI7obm5Qg+2hCwHVj68R/p7JED5QKBw929V/KfNOYtwYRvKX6kTfLWxVIKLUxK52fOZ4zGr88DjLYgJC0Dr27V1plBsZFeLJg2Nh/KTvgRCDRz2XxQ4P0Sdt8ucdY=
Received: from VI1PR04MB5327.eurprd04.prod.outlook.com (20.177.52.16) by
 VI1PR04MB6237.eurprd04.prod.outlook.com (20.179.24.74) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2008.17; Thu, 27 Jun 2019 03:22:26 +0000
Received: from VI1PR04MB5327.eurprd04.prod.outlook.com
 ([fe80::c1bf:7842:6630:b87a]) by VI1PR04MB5327.eurprd04.prod.outlook.com
 ([fe80::c1bf:7842:6630:b87a%7]) with mapi id 15.20.2008.014; Thu, 27 Jun 2019
 03:22:26 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     Krzysztof Michonski <michonskikrzysztof@gmail.com>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
CC:     "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
        "festevam@gmail.com" <festevam@gmail.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "afenkart@gmail.com" <afenkart@gmail.com>
Subject: RE: [PATCH] imx: usb: get pinctrl if it's not yet initialized
Thread-Topic: [PATCH] imx: usb: get pinctrl if it's not yet initialized
Thread-Index: AQHVK/i90+WXqSm7OU2u5W2oAqYjPaau1pkA
Date:   Thu, 27 Jun 2019 03:22:26 +0000
Message-ID: <VI1PR04MB53274E7E20C099F0F84B18198BFD0@VI1PR04MB5327.eurprd04.prod.outlook.com>
References: <20190626082512.7637-1-michonskikrzysztof@gmail.com>
In-Reply-To: <20190626082512.7637-1-michonskikrzysztof@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=peter.chen@nxp.com; 
x-originating-ip: [119.31.174.66]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ca7090bc-5d98-4848-9050-08d6faaeadba
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);SRVR:VI1PR04MB6237;
x-ms-traffictypediagnostic: VI1PR04MB6237:
x-microsoft-antispam-prvs: <VI1PR04MB6237CBCB19EB5D9637F52FCD8BFD0@VI1PR04MB6237.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2887;
x-forefront-prvs: 008184426E
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(396003)(346002)(366004)(136003)(376002)(39860400002)(199004)(189003)(66446008)(55016002)(71200400001)(81166006)(73956011)(81156014)(14454004)(52536014)(5660300002)(66066001)(6436002)(4744005)(71190400001)(8936002)(478600001)(9686003)(14444005)(256004)(66556008)(64756008)(66476007)(26005)(74316002)(53936002)(6246003)(8676002)(305945005)(7736002)(25786009)(99286004)(54906003)(76176011)(7696005)(476003)(44832011)(6116002)(76116006)(2906002)(186003)(486006)(66946007)(4326008)(11346002)(86362001)(446003)(229853002)(110136005)(3846002)(102836004)(68736007)(2501003)(33656002)(6506007)(316002);DIR:OUT;SFP:1101;SCL:1;SRVR:VI1PR04MB6237;H:VI1PR04MB5327.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: aUEjglVWCvjl4F1uf4GhK9ceJV8s7MLu9CmnlJYWrw8mss22L8gQxVIBoX9uTH5IgxBWjoUKenw+8HpQvhld4n9R2XNWSGIfi6EqqzNOxGbFeDCjEX27sYlXW41hGJBsVf5Fz0GG5kgDOCncyAJfwplkmvcs59TpBqsTOgaH3ItT5fTdXkjJq+6YiADIePWZqb7ux42goYYY1gNulp5DBOk02YwuTin0ColPU0Uh3a9DAAynz0WsAMKnTKOOgk51VRzo4KUgFNaJUqi23XMJIIsKlf1X9OuWrHxFfZ+Cy+ShXoTwkJ4GyveZKl1mbnN+OhenjYw0L2hvIGpM+pmJkOAxYVWiSjxtjX/F9vqmFf/s2vIb9vZ/lQACIrnwAW/dn15nc8F+Qipc5tCLwS5lLDRipiIvvBylEKVr4TmEbfY=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ca7090bc-5d98-4848-9050-08d6faaeadba
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Jun 2019 03:22:26.4812
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: peter.chen@nxp.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6237
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

=20
> In case usb phy mode is other than USBPHY_INTERFACE_MODE_HSIC the pinctrl
> for device is not acquired. It is however used later regardless of the mo=
de, hence
> leads to requesting access to uninitialized data.
>=20
> Signed-off-by: Krzysztof Michonski <michonskikrzysztof@gmail.com>
> ---
>  drivers/usb/chipidea/ci_hdrc_imx.c | 3 +++
>  1 file changed, 3 insertions(+)
>=20
> diff --git a/drivers/usb/chipidea/ci_hdrc_imx.c b/drivers/usb/chipidea/ci=
_hdrc_imx.c
> index a4b482c3dc65..2f02b35c40b6 100644
> --- a/drivers/usb/chipidea/ci_hdrc_imx.c
> +++ b/drivers/usb/chipidea/ci_hdrc_imx.c
> @@ -428,6 +428,9 @@ static int ci_hdrc_imx_probe(struct platform_device *=
pdev)
>  		pm_runtime_enable(dev);
>  	}
>=20
> +	if (!data->pinctrl)
> +		data->pinctrl =3D devm_pinctrl_get(dev);
> +
>  	if (!IS_ERR(data->pinctrl)) {
>  		struct pinctrl_state *state;
>=20

Sorry, what kernel version you are using? The recent kernel is different wi=
th the patch you posted.

Peter

