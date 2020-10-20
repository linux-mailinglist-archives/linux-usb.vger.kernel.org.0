Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5DE032939A7
	for <lists+linux-usb@lfdr.de>; Tue, 20 Oct 2020 13:13:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392663AbgJTLNx (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 20 Oct 2020 07:13:53 -0400
Received: from mail-eopbgr30088.outbound.protection.outlook.com ([40.107.3.88]:43172
        "EHLO EUR03-AM5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2391166AbgJTLNx (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 20 Oct 2020 07:13:53 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z5s3GLR6B1INTy9KsLm7neSRCjDRBgw10UMVGLucOyev/Wdcq/37JM6pK4hBsn3A7z8Uot4EVYopTAM7qOqqavQQlMlTExs0rEEkVCHOjGkWp+FBV4+UUVw1TFbucfe/YU/3Kc40/+QrWxqZSpF32IXciPlS05XzftKL1sVZztYQ8jeaqvq3MmNcQaXk10ZOXOewweJxdPDI3mxCOadp2UBf5k9lBxzNFmdVHKiVOrzKH/ZQF2R1PrkQIl1JNmfRCxzvheEXvTt254T1u/UywsT5gyDhkjy8ewMfIai6sXIPkV9+q9V0tybsFl8t2a/q3Z0aeqDbPSauDPi0dQIE9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7lg/a1ydCqctaCe18NJ7yWmwzI158m6gMP2NAkbB2Tk=;
 b=kvsQUI/yT3tm7dgFvfDQYyOvf5z1rsvWbU7BzIchKQiwS0FwFottL4tngpxMzQ6/8oRyzc0kcLmWHemHPkUtLLSsLiqDHgY+mzXuiglpbrkra9dKwKdV5tQKEhX7aeWEMcJL+3u/zduyXnON/CnFR+1xmeaFeHjlMMD+anX5hQDcTqWgARezWL6u4az4ymfLSugs6zEU+Hlb9NpWnsLfYp7q0YDycExdg7sl7JBov++WD2WHLFVloyzaOxIppcMxhsqnvJizlIrL1wOsJRzObidlIDZpAfjsxEmTnng9GOSGSF4AsmuRlN0ID6JdcIwitrfpLJFK6V1CPhdu0nT12g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7lg/a1ydCqctaCe18NJ7yWmwzI158m6gMP2NAkbB2Tk=;
 b=qiN1QCkIloS86/gDAJWyK5N97pRK84MVFgSvipUOLOfft+0v08HN3QvWJ2K+m+OOgrFaPFrS7HKtMnVcQ3UbJEtiMWaRuCuuloZ4KT3WocXQjectdlNNlbBTIeENnSYrD2iIbmoZHOhT1LHynkGTdX56J28jsuWL0X/CXQQjJa0=
Received: from VE1PR04MB6528.eurprd04.prod.outlook.com (2603:10a6:803:127::18)
 by VI1PR04MB4751.eurprd04.prod.outlook.com (2603:10a6:803:53::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.28; Tue, 20 Oct
 2020 11:13:47 +0000
Received: from VE1PR04MB6528.eurprd04.prod.outlook.com
 ([fe80::d9da:5c3:c978:43f8]) by VE1PR04MB6528.eurprd04.prod.outlook.com
 ([fe80::d9da:5c3:c978:43f8%7]) with mapi id 15.20.3477.028; Tue, 20 Oct 2020
 11:13:47 +0000
From:   Jun Li <jun.li@nxp.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
CC:     "heikki.krogerus@linux.intel.com" <heikki.krogerus@linux.intel.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "rafael@kernel.org" <rafael@kernel.org>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "hdegoede@redhat.com" <hdegoede@redhat.com>,
        "lee.jones@linaro.org" <lee.jones@linaro.org>,
        "mika.westerberg@linux.intel.com" <mika.westerberg@linux.intel.com>,
        "dmitry.torokhov@gmail.com" <dmitry.torokhov@gmail.com>,
        "prabhakar.mahadev-lad.rj@bp.renesas.com" 
        <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        "laurent.pinchart+renesas@ideasonboard.com" 
        <laurent.pinchart+renesas@ideasonboard.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        dl-linux-imx <linux-imx@nxp.com>, Peter Chen <peter.chen@nxp.com>
Subject: RE: [PATCH v4 2/4] device property: Add fwnode_is_compatible() and
 device_is_compatible() helpers
Thread-Topic: [PATCH v4 2/4] device property: Add fwnode_is_compatible() and
 device_is_compatible() helpers
Thread-Index: AQHWpfenpObIkrsbWE2m9D0IeMq/2qme2d0AgAF5EWA=
Date:   Tue, 20 Oct 2020 11:13:47 +0000
Message-ID: <VE1PR04MB652805416A0A85E45FFD106E891F0@VE1PR04MB6528.eurprd04.prod.outlook.com>
References: <1603098195-9923-1-git-send-email-jun.li@nxp.com>
 <1603098195-9923-2-git-send-email-jun.li@nxp.com>
 <20201019122516.GN4077@smile.fi.intel.com>
In-Reply-To: <20201019122516.GN4077@smile.fi.intel.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linux.intel.com; dkim=none (message not signed)
 header.d=none;linux.intel.com; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [119.31.174.71]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 58d23814-237b-4003-b206-08d874e93703
x-ms-traffictypediagnostic: VI1PR04MB4751:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <VI1PR04MB4751EA96C414E142E2214F3D891F0@VI1PR04MB4751.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: uWEH5hMGjWMws+k0c9RCdIQGKRIxXAFEKArtDJcNJ6imh+Sr17TaghU5cze0Nj4qXTAzD6iYysbce8CLZ4XP7HJEMYz4vZRaHaoXF0scO8UUo3g9zdBY43Ra/XXOfML1LUKnDxdaRmiHQn63nes7dHYnIUHVMBtRNWJGETcUORXUKRRHGO64U80Yt06Kg5BFJl/k9G+ls124kwv9ugN7gtk0RI0oNjJ6q1zIXDJ1UB3ttcy+ESEje5Lr1+HfATKRvm6UZq2PtFO37ZbmYHb/b6dx7bmXvfe4IYNEfUn3Kwm9r7I0hyUZMvcbfSouxYtX
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6528.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(7696005)(33656002)(186003)(53546011)(54906003)(26005)(6916009)(83380400001)(6506007)(44832011)(55016002)(498600001)(5660300002)(64756008)(4326008)(71200400001)(2906002)(86362001)(66446008)(8676002)(66946007)(66556008)(66476007)(9686003)(8936002)(76116006)(7416002)(52536014);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: KDuFzoZyeAnyOkveoOjf7ATznF7UG+5yOm9EYi1GBobMF7oVw1qF4E9MPvJUOaNb9klg+OFFztdaPGjngbqcXW/MKf3KeCTLZP1olTSn4E+8G3pQft9awmPay2H3SQF4o94HNox7MtwB+dOGYQ3LdcyJF5bueT97qlxfcMzycOkxOPaueEvYLoylP3Sy4nJoaZJHkC2DNOK1KWKLJ1LRwuVcs7D3+4FUG3hhglBwnJ4SymLMB3+TjN3/XQnm/XeSlHlBA+aPKWoJc4BGBSBobghDKCH2ctaWHo5q/DdzP0gDSofyVXg3COB5Xbdkksv9bmWK9ME1KZ1grQq0YYfEzLEt6dzFqW+NtVmK25lDsgUyiYYpVUW7h0VotD9h9DJe/WEFBJxglJMInoX9CYIx7b4O6K2l+9RrAqsdlq/VQU+T1HOP9GvCWjtUbEXR+NGb5Cebftbk2vMOn9f9I4fZc/xwUuvXkkBG1sdE66AEwPhBWV7elAU4MMuwEz16uUCL2jOIzooS1ogIMXBvp1Zp2+blmdelJ7lOAOhy7z9perN0V9IKtrTae5t+tdrtB+BRmp7Nr4IYt39DpSE55NWziEKmCHE3OIwovBhrFTX0vji34m2i6Z2J+DMJtr5JuGjOFsCgc6B8Mbdez0/H7YypJA==
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6528.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 58d23814-237b-4003-b206-08d874e93703
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Oct 2020 11:13:47.0767
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7OYOqp5xJYXfORttjvazlGjfwU4wAm+v87sxXpaY8HsTzLUa5b03i/VN+t41Jgft
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4751
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org



> -----Original Message-----
> From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Sent: Monday, October 19, 2020 8:25 PM
> To: Jun Li <jun.li@nxp.com>
> Cc: heikki.krogerus@linux.intel.com; robh+dt@kernel.org;
> rafael@kernel.org; gregkh@linuxfoundation.org; hdegoede@redhat.com;
> lee.jones@linaro.org; mika.westerberg@linux.intel.com;
> dmitry.torokhov@gmail.com; prabhakar.mahadev-lad.rj@bp.renesas.com;
> laurent.pinchart+renesas@ideasonboard.com; linux-usb@vger.kernel.org;
> devicetree@vger.kernel.org; dl-linux-imx <linux-imx@nxp.com>; Peter Chen
> <peter.chen@nxp.com>
> Subject: Re: [PATCH v4 2/4] device property: Add fwnode_is_compatible() a=
nd
> device_is_compatible() helpers
>=20
> On Mon, Oct 19, 2020 at 05:03:13PM +0800, Li Jun wrote:
> > From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> >
> > Since there are also some ACPI platforms where the "compatible"
> > property is used, introducing a generic helper function
> > fwnode_is_compatible() that can be used with DT, ACPI and swnodes, and
> > a wrapper function
> > device_is_compatible() with it.
> >
> > The function calls of_device_is_comaptible() with OF nodes, and with
> > ACPI and swnodes it matches the given string against the "compatible"
> > string property array.
>=20
> ...
>=20
> > + * Match the compatible strings of @fwnode against @compat. Returns
> > + positive
> > + * value on match, and 0 when no matching compatible string is found.
>=20
> Please move Returns... to a separate paragraph.

OK, will change.

>=20
> Btw, this is not true...
>=20
> > +int fwnode_is_compatible(struct fwnode_handle *fwnode, const char
> > +*compat) {
> > +	int ret;
> > +
> > +	if (is_of_node(fwnode))
> > +		return of_device_is_compatible(to_of_node(fwnode), compat);
> > +
> > +	ret =3D fwnode_property_match_string(fwnode, "compatible", compat);
> > +
>=20
> > +	return ret < 0 ? 0 : 1;
>=20
> ...and this is at least strange after all.

of_device_is_compatible() will return positive value on match, and 0
when no matching,
fwnode_property_match_string() will return 0 if the property was found
(success); and negative error code on failure. so the return conversion
of fwnode_property_match_string () should work here.

>=20
> > +}
>=20
> > + * Match the compatible strings of @dev against @compat. Returns
> > + positive value
> > + * on match, and 0 when no matching compatible string is found.
>=20
> So does this.

Yes, will change.

>=20
> ...
>=20
> > +int fwnode_is_compatible(struct fwnode_handle *fwnode, const char
> > +*compat); int device_is_compatible(struct device *dev, const char
> > +*compat);
>=20
> Please, group them rather device_is_compatible() with device_* and fwnode=
_*
> ones respectively.

Ok, will move them in next version.

Thanks
Li Jun

>=20
> --
> With Best Regards,
> Andy Shevchenko
>=20

