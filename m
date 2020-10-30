Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 524FE2A1171
	for <lists+linux-usb@lfdr.de>; Sat, 31 Oct 2020 00:10:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725873AbgJ3XKQ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 30 Oct 2020 19:10:16 -0400
Received: from mail-eopbgr20079.outbound.protection.outlook.com ([40.107.2.79]:39168
        "EHLO EUR02-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725780AbgJ3XKQ (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 30 Oct 2020 19:10:16 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bW+qR5Fqtjbb0QiJrD0b3RiTo5a3mSp6nWQrpELmTTmp7mRSosfKxFRzoGCpQ1D+ObOo/SkAwedajm+NKYRq2RXyyUdQIatPmeEiQts6hhQqo0CyAMbTX+6ZIANa+UvzEDdWS9P1ZToyu6ZXxpF1wI8Gsc3QGWAo7N5piIF7p2/0EU5x4tiTMk2JcyntEh/buyXHZxU4VLwQY9Kg/aJYcCCMDPrgrT2z12LadxkGwb9UKnsm5lUlY2GGUNqRpgirhvNjj9oiu4k0rWFa1aZTcWusbgp/93N6YDNIuYpWQs8G/F+ERagikIWANGSwVksvvQP05QpchDGzCXduEF++sQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=no/wsepEp0Fz2YArGLdHcos0rnFncDs6UprtWFl7dAg=;
 b=izq26Eib1s5jC+XxUSM/DmJbnzymuAtPGhwgwJ0OAdNX0JyzUaRMRRNv3xBTJV0OIDU5zoaP8AeJHR3ri1//PS2oT/0upYqAtxwC0h+UUWhwDBk8998xq0EfftuO5DnQBsUK9AyVkN+R7AjQbXb6Wxy+2l2ZvZYwhslYrP8+615W0bV1vUyKqWNFGIRQg0LnRtceYfjxZus3VrgcCCrctcl+UpW/QuAS0ks0uQsfX9t+XEY08b66W2MMqdrBi+R49zLaXC0OYGS/Czrajv+TTu4h6FQMWSEHXOWhg3PFujRFhSbtTvybDYYKKvZ9ur1eL27IuP0FR3nBDYxbtpO7jA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=no/wsepEp0Fz2YArGLdHcos0rnFncDs6UprtWFl7dAg=;
 b=LXgxOvliBgyrIS6teda/Z5KLtdzr39zLDLLFVedd9hXKIxACMaP8YAcFA3TrYkqj0M+5unye0w4auPrbk7pyPNZHwIg9fO9xGwFTwLQ7Jv/fkfGHV6xuDmSNJEMhKp9AZpeHZzd/NTCtgWOsyr0cpOPNfqRWZDMzXQjXrP2V+pg=
Received: from AM8PR04MB7300.eurprd04.prod.outlook.com (2603:10a6:20b:1c7::12)
 by AM0PR04MB7123.eurprd04.prod.outlook.com (2603:10a6:208:197::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.27; Fri, 30 Oct
 2020 23:10:12 +0000
Received: from AM8PR04MB7300.eurprd04.prod.outlook.com
 ([fe80::b902:6be0:622b:26c2]) by AM8PR04MB7300.eurprd04.prod.outlook.com
 ([fe80::b902:6be0:622b:26c2%4]) with mapi id 15.20.3499.029; Fri, 30 Oct 2020
 23:10:12 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     Rob Herring <robh@kernel.org>
CC:     "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        dl-linux-imx <linux-imx@nxp.com>,
        "pawell@cadence.com" <pawell@cadence.com>,
        "rogerq@ti.com" <rogerq@ti.com>, Jun Li <jun.li@nxp.com>
Subject: RE: [PATCH 6/6] doc: dt-binding: cdns,usb3: add wakeup-irq
Thread-Topic: [PATCH 6/6] doc: dt-binding: cdns,usb3: add wakeup-irq
Thread-Index: AQHWqBTuoTzdsxNJfEChDP+mgJs3E6mwUL2AgACCO6A=
Date:   Fri, 30 Oct 2020 23:10:12 +0000
Message-ID: <AM8PR04MB7300D77AAB9261361AD6CCF68B150@AM8PR04MB7300.eurprd04.prod.outlook.com>
References: <20201022014411.2343-1-peter.chen@nxp.com>
 <20201030152217.GA3866290@bogus>
In-Reply-To: <20201030152217.GA3866290@bogus>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [222.65.215.201]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 57558a3c-a5d2-4214-0562-08d87d28f469
x-ms-traffictypediagnostic: AM0PR04MB7123:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM0PR04MB71236990B0E47DA7EC1C5E7C8B150@AM0PR04MB7123.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6108;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: qnRaNZurbZPcrt1vnUU/VLcVvBo0/lfza0zpyy5Mh9iE5jSUKWkL/c6emuvMyxDOsZXWRUDAHKbBUpi0/mmSJN66iWJwO3iVKmWs1Ng3vBSy6+nEZyb9M4vK9TMt14V7I4PnHL4WEd4S4P3KUHjqr7pFIoabnjTfw7wFP5q/wqEpWTHZIrKAZCrtXVdqFXU1G3TZ/JLmS1pcYkDyAPsDzgvftbvn4lon0hBp7YjjRF/kMrbtBLQQfyuHxodD73jT2u9UeAJiCgUOEPwC+x48rXs4yg0dNkGkq9K2ib4jmavlTALrGNuJo6G0ReuX5B3pDoOd47NvMfp1Rhpjf02LAQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7300.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(39850400004)(376002)(366004)(136003)(346002)(66556008)(66946007)(76116006)(66476007)(33656002)(7696005)(66446008)(64756008)(6916009)(316002)(86362001)(44832011)(8676002)(71200400001)(54906003)(478600001)(4326008)(9686003)(26005)(6506007)(55016002)(5660300002)(4744005)(186003)(8936002)(2906002)(83380400001)(52536014);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: ZBvV8S/eEmDDA+q4G21JxR7gnTC1O/YaBLPUN7gEfMWuoDXPZoc7vrIOuXUr0VmuZO4y9N1FH1nNRJzncL+8Tm6haWLFblNFWnVQOUfp1fsg6+vg1KC6sTYpm6rP/zQrjsEr2GHLJt3CDGNtdeZirEDGZKbQRfSxUVO8mEhQnbFUIcUjRfWsQbrziPHyxIvroFhYi8NgZyY41ONJ/UhcG/L0fj/9f9grLOk3RNLASf6laqh15AwnSz+Wb94oAuV5iIUzKWAvILAO60unrTaOXTGvpMgSzPUFqQUQV87/1H999oAthPfKW5p++kyq9Pr4/ncZzpSqPD59mJzcjGwPtKAlAV9q6sPBA3MVnb7vNZkuV0tjcFlUoEhWKHLQopdx8eqd24ZMRL1IeCITFk8pBtvtn2ejUb17qqDXhcEJc24TA7gTZTkg5KEV8yOJqfA7ed0nUbaDa622e4Y3xo2+YowpcWBzLtzNnVeayE/mrSzftdYSRStKSBnwrQWlZ0E34fGOmcJP6cGPO1dSwJhl6es8gbkDZvcnkZv2wy4NAEzyqq9gMTweobJBRSuTmxV6rHCLgS187Lvv3Yz0/XRxCgGVkliPyKjM74x6aQI2B0psqIxck8XczQoIDyFvffdb1uAcUy10KZVib9UL9NrDaw==
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7300.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 57558a3c-a5d2-4214-0562-08d87d28f469
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Oct 2020 23:10:12.4805
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: azERdlbnaMdC6QAgKjWUEWtCB1GnUSMZk9RVFB3EqHC4kC/bAmWcxkny/We3Zreru6FAdEAn4/5r4uZxPL+DaA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB7123
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

=20
> > @@ -30,12 +30,15 @@ properties:
> >        - description: OTG/DRD controller interrupt
> >        - description: XHCI host controller interrupt
> >        - description: Device controller interrupt
> > +      - description: interrupt used to wake up core, eg: when usbcmd.r=
s is
> > +      cleared by xhci core, this interrupt is optional.
>=20
> You need 'minItems: 3' here and below to make this optional. I guess we d=
on't
> have an example for this binding or it would fail.
>=20

Updated, and sent v2. Yes, we don't need it for example, the probe will not=
 fail even
this property is not there.

Peter

> >
> >    interrupt-names:
> >      items:
> >        - const: host
> >        - const: peripheral
> >        - const: otg
> > +      - const: wakeup
> >
> >    dr_mode:
> >      enum: [host, otg, peripheral]
> > --
> > 2.17.1
> >
