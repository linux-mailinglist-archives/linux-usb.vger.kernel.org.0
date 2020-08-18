Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0C95924828D
	for <lists+linux-usb@lfdr.de>; Tue, 18 Aug 2020 12:07:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726391AbgHRKHh (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 18 Aug 2020 06:07:37 -0400
Received: from mail-db8eur05on2044.outbound.protection.outlook.com ([40.107.20.44]:44704
        "EHLO EUR05-DB8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726043AbgHRKHg (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 18 Aug 2020 06:07:36 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N94FYzT4tUYquECEqZ1VBQ6KfQJoFzFhqyihjLhmcJyFdzCrMT+aBWN9Q4lSvUdG7E51IIu5hE16srJUZQYNjQfQTZwmokRdK0wbcw5kz8h1hobyJ84CUoVYialNXoP08Nd81ZoPLCTn183IXFXVuUpK9dWd49c8LEGka1oevsxDTBOKjNRfqL1q+azUZutK7/3B1vkSS0fPWRctRuQrwsr1p2CnY2nfYaKUfpzXfLzP1CZfqK+psK5eBP13wIudGDXU7NpkuKwcDJeBBsE+R5VhPosRSEy54kSJ63mZ6H2cBAMPnPY9bpbyXY26saX28vPfhtzcCH7a5HUzAJV7lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uVy+QdknpGjtbqLhPlnVH63NJwUaKLmrY7o0WnRdk2s=;
 b=CnDRuu5omWlpYGgewqZfKbLtN98e3PJBqi/9aJwo8We0sGB4uBHAp1tE3XlCc6p/aycGmsMhpmNn4bV18ewMIq//uHB/rnKRRVSB9LOBfvrvJnRgLJTklN6dplRMbsnkot9eMf856QpdzoF5HIZv2JUtrJPuytARg2Cg8LT3kGsmgFaHBdO7faSVe3GTbBJrIZPNG2DWbMZQOI5xCuhfayOxszZr7Wm5qx9aZQOHhGyuutnLJOnThMneHn61Twpf1+pXASlkadQo+WU9f3K8VHCQ8tFA3PjkofO49W0uErgDHfefhtp4kEXataH5ks74JrhZakGljldVW40Ln9cNMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uVy+QdknpGjtbqLhPlnVH63NJwUaKLmrY7o0WnRdk2s=;
 b=aYZ5adsAS3qqE0ZPiTerEudomYORk9r48SLSJCn3aWTSPaPdWbQ2u6TYKVMKAQnD0rrmY4hPHfxTsa3XmXCkxxn5pkhlXTsBnsbgEIorXL9FZbw99tEqRDBdMY+7JQmEZ8WVW6Nkq2cFl+w06gvjgb2/QXT3V6aNzwd7uRqvO+k=
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com (2603:10a6:20b:118::20)
 by AM6PR04MB4534.eurprd04.prod.outlook.com (2603:10a6:20b:24::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3283.20; Tue, 18 Aug
 2020 10:07:33 +0000
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::1023:be8d:40c:efe1]) by AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::1023:be8d:40c:efe1%3]) with mapi id 15.20.3283.028; Tue, 18 Aug 2020
 10:07:33 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     Greg KH <gregkh@linuxfoundation.org>
CC:     "balbi@kernel.org" <balbi@kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        dl-linux-imx <linux-imx@nxp.com>,
        "stern@rowland.harvard.edu" <stern@rowland.harvard.edu>
Subject: RE: [PATCH v2 0/6] USB: UDC: Fix memory leaks by expanding the API
Thread-Topic: [PATCH v2 0/6] USB: UDC: Fix memory leaks by expanding the API
Thread-Index: AQHWbr2bA/9hRw8p2kOY3rr3tzW5a6k9p76AgAAJMYA=
Date:   Tue, 18 Aug 2020 10:07:33 +0000
Message-ID: <AM7PR04MB71574E3EEA0AEBE5348BEEA58B5C0@AM7PR04MB7157.eurprd04.prod.outlook.com>
References: <20200810022510.6516-1-peter.chen@nxp.com>
 <20200818093321.GB34785@kroah.com>
In-Reply-To: <20200818093321.GB34785@kroah.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linuxfoundation.org; dkim=none (message not signed)
 header.d=none;linuxfoundation.org; dmarc=none action=none
 header.from=nxp.com;
x-originating-ip: [218.82.62.103]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 9a69c126-42ef-4934-62cd-08d8435e8676
x-ms-traffictypediagnostic: AM6PR04MB4534:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM6PR04MB45349F587B762231E3BE46D88B5C0@AM6PR04MB4534.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5236;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: +kj7vV1Yy4o/1gw6O47ihqWgMJCkoQg7ffcSJ9Xwk/sHAKKucKX0b2Jp3Hb89NOePWHrpTs3lHnGK+1UPZyBT4xr2aqSuNgvKEZcAE2/MswTJ62HoQk5VhA5RyhjMY5TG1KL5PlOv3XPJURiE6bUrIiZec2pYRPYIX7NlplbBDsxIB6zMI4uoqWGYYcs68m64aGRhdBDRVyULmLuTWBQ+EiV3OEh0xnRe1GkAZNUCAKznOAKyVLlAMclwjQOch0yv6I8AMyWiyVEkzE0819GsS36m3wbq++CvELk8Q7Cl+LujN7ygAeNaiJPtc1NnRdnECQwaO4pmmPqPh0nr6qeLMk8s9iSNJzZ96Oq06k7xZFIXfzeyPa2UB0BVmhzO+GjirsXhTdlF2tWKDd2kkg3Pg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR04MB7157.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(396003)(376002)(39860400002)(366004)(136003)(4744005)(6506007)(186003)(9686003)(2906002)(7696005)(55016002)(6916009)(33656002)(52536014)(8676002)(478600001)(966005)(316002)(26005)(66556008)(66446008)(66476007)(44832011)(64756008)(8936002)(71200400001)(66946007)(4326008)(86362001)(76116006)(5660300002)(54906003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: st8YDQ/Yki6JZRa688Vm/Tv1NY0SswAdWGiuoIhRaSyKn9PMeMUmDRpki2Z0SHJDRYYsmUP9nWFRZLKplVh4wCbJOlqoju6Xzh/So9t+aCidUYuWBVpe5isL7cNpcfmEIUrfiSQsdDQJo6wniEKA2hI8YKiVXHT76ip48hBHd70JcIxPhC+0gxv1BuiW7xAH6Ovwx/PVPCxdGdW+M2KVbR/GA+tfk+QAsmSEnuS0DkDGivYClHSuMgXoxWQ0jv+/UXtoraeyPUXNPHvIGBk4g4nOqtzS1uQTuzLNYLQoW11ulGZtorLZooEgHbVLQsLUXOs/69X/RKFYCXkLE3DIL0sJGqGC+6EoJSx339y82dwTMihLRFtQ7OAn7BavrxsnCuXbSWs32s+22r0/cVwb3e4nRkwDtkcdSnSEDX3cEvyxNVwtylZCVUWeQYQdrGsPoLsD8ENg6+43J+qgljuI3wmjtWwpJWIx3zWVuo2BYwGoVr1m2nLCagvxiBOwa9/klCR2Flhk8dVEqyKTA4Fj2gvP5PHrKO3byL2+zHJ9SwXGBLoiyDg9Kd7GB/tzSUEs/ZrXTbC3AfrSsi2+CgVAzxlSgn/t4KHKQw3ktEl139xVXEmFXGstT2JPVZN80Nq78NAJpIT850sVxm4z4JDTCg==
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7157.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a69c126-42ef-4934-62cd-08d8435e8676
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Aug 2020 10:07:33.3901
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XHMaI41LN26EmpOjaRQn9EGw7o2HuErAffstruAQPebOD9Et0hDKeOQTkOx92rJgzNCe93JtWzmcBck5a7RiBw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB4534
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

=20
> On Mon, Aug 10, 2020 at 10:25:04AM +0800, Peter Chen wrote:
> > This series expands the UDC API to fix some long-standing memory leaks
> > in the net2280 and net2272 drivers. And with expanding APIs, it could
> > manage cdns3 and dwc3 gadget device memory better without the hacks at
> > UDC core.
> >
> > Alan Stern (3):
> >   USB: UDC: Expand device model API interface
> >   USB: UDC: net2280: Fix memory leaks
> >   USB: UDC: net2272: Fix memory leaks
> >
> > Peter Chen (3):
> >   usb: cdns3: gadget: fix possible memory leak
> >   usb: dwc3: allocate gadget structure dynamically
> >   Revert "usb: udc: allow adding and removing the same gadget device"
> >
>=20
> Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

Thanks, Greg. The latest revision is at:
https://www.spinics.net/lists/linux-usb/msg199291.html

Peter
