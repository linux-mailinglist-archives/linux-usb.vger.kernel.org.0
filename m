Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6E323295D25
	for <lists+linux-usb@lfdr.de>; Thu, 22 Oct 2020 13:03:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2896943AbgJVLDu (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 22 Oct 2020 07:03:50 -0400
Received: from mail-eopbgr60085.outbound.protection.outlook.com ([40.107.6.85]:13063
        "EHLO EUR04-DB3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2896935AbgJVLDt (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 22 Oct 2020 07:03:49 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H6/mH9RgPXoYAKLbBElHgGFVZp8LLg4VF2iCMk0Ny5vPJIErQX25YNfsp/lsy2qQh+dNPwHovBQ4sL57u+YWGC0C51tzd2NjqNgToyFl6iBY20WIHlf2NuEMp1AWKWRcKr8vDPszKp7RM8DF7BBUA6DKxtc4nlKH/AvWBE21o/ARjPkwVIEGkhkVmGIsu+JkVb5K3I8FAoMwLus4qBulimhmJEKITll5fQfZJzTBgdUj+9s3tE3G4/Rt1SCxub/0obP/kn7XkizOrqw5Zt/j3gRc6qDxo3y0b+LGU1cj6fSxQtEWzUsnYAdmjFTsudohwdDEpJ/rG4gPmjjCWpT0kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9Cq0tGOx/aPUBp6Gy3ra4X8TnBNyfuKm5Zq+zVzX2iE=;
 b=bGgwKdj1LY7tadofzE1j6g6DRHCd9qo4KmL09ogExWo/RIwDiBtkuVGDE+EIn0ZbGCvFus4um/gZmZ1Oo4Kj0rKv/kX5iPJm4YN1OcWZ6ZBOTdFCqndGM4OnXD4rIUaE3gXbGZmXTup3tPdiuXH0jpW5XQWKSwIoRxh1L/aj56mpr8HvUYQvFsGkj1xj2M6fPMyEo8GXIJxIALpQ19M5WsRoZz4+UW/g+7K7SoJa+g0f+afNwJaYt52q4EoUutbKqL8QChvpoVsxCHOVEKZ7TVkbPeU5rbNTNe/IwhcQReSmVDRnzgcYyO8BkXcChtg3tacVqcNUgW6CT/WlR+QbNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9Cq0tGOx/aPUBp6Gy3ra4X8TnBNyfuKm5Zq+zVzX2iE=;
 b=TX16wJY3OoLdZzs5DnsgbKYDev5tUbo0wjgJ82B30NKXRFkv1w32wzxOdu8y9L5JYmm9QVjP8pRv/SnySFP/5LfW201iWTeEj3dEZ51EuQEBX/XscD5XMEJ2nWJ000qtG5GJb1VTbmPAk5GMwQLCrQSI7sWbEtWt07j1TZEjgrU=
Received: from VE1PR04MB6528.eurprd04.prod.outlook.com (2603:10a6:803:127::18)
 by VI1PR04MB3102.eurprd04.prod.outlook.com (2603:10a6:802:9::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.25; Thu, 22 Oct
 2020 11:03:44 +0000
Received: from VE1PR04MB6528.eurprd04.prod.outlook.com
 ([fe80::d9da:5c3:c978:43f8]) by VE1PR04MB6528.eurprd04.prod.outlook.com
 ([fe80::d9da:5c3:c978:43f8%7]) with mapi id 15.20.3477.028; Thu, 22 Oct 2020
 11:03:44 +0000
From:   Jun Li <jun.li@nxp.com>
To:     "dmitry.torokhov@gmail.com" <dmitry.torokhov@gmail.com>
CC:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        "heikki.krogerus@linux.intel.com" <heikki.krogerus@linux.intel.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "rafael@kernel.org" <rafael@kernel.org>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "hdegoede@redhat.com" <hdegoede@redhat.com>,
        "lee.jones@linaro.org" <lee.jones@linaro.org>,
        "mika.westerberg@linux.intel.com" <mika.westerberg@linux.intel.com>,
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
Thread-Index: AQHWpfenpObIkrsbWE2m9D0IeMq/2qme2d0AgAF5EWCAAhi1gIAAzRjA
Date:   Thu, 22 Oct 2020 11:03:44 +0000
Message-ID: <VE1PR04MB652857B592C4CDBEB2D1EFAC891D0@VE1PR04MB6528.eurprd04.prod.outlook.com>
References: <1603098195-9923-1-git-send-email-jun.li@nxp.com>
 <1603098195-9923-2-git-send-email-jun.li@nxp.com>
 <20201019122516.GN4077@smile.fi.intel.com>
 <VE1PR04MB652805416A0A85E45FFD106E891F0@VE1PR04MB6528.eurprd04.prod.outlook.com>
 <20201021185547.GC444962@dtor-ws>
In-Reply-To: <20201021185547.GC444962@dtor-ws>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [119.31.174.71]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 98aac4b3-2437-4c56-ed3d-08d8767a2499
x-ms-traffictypediagnostic: VI1PR04MB3102:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <VI1PR04MB31029EDD017B1EA1FF20B26A891D0@VI1PR04MB3102.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: rR+e9CU37CwuGaUhMNK5kEkJDrkw+HTXFQ2PJFVp8YTkT/oWE9DAW889vCOnzJm0+fj2VAYVs/NcgABSNXWYq4jomRQM21E/RM0BqTGVbxOP3cMZm6Vgh3VTetC9/Yjlm28f268PYhiOakuuG05vPM16I+11LaFGfph+WvfvAU8z7N/PVS15J/yibABdYmXJW1bH9l06C8mictCGNlTsprpL8mkSYKvdNu4Xo6IhZo+UiLr8aHRCuQEiUEq3Xp4iHswiFZYtMNIj5WuFQNt+ahwkowef/d9/1XxqnwMMNlgc7L60qIDBRWr+1CU9LSoU
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6528.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(396003)(39860400002)(366004)(346002)(376002)(26005)(33656002)(2906002)(66446008)(86362001)(8936002)(64756008)(8676002)(66946007)(71200400001)(55016002)(316002)(6506007)(4326008)(66556008)(83380400001)(53546011)(76116006)(66476007)(7416002)(9686003)(52536014)(6916009)(7696005)(54906003)(478600001)(5660300002)(186003)(44832011);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: ozE30r4R+x1gjL5QE7xkzMll0H5lHTs67+N/F4X5W6cVFhqXJXK1ysQFYO+EHGkuyp05Zh+mR+42EXKuv54VSaL/ehZi3IWwVBT4KxENhFtvWfK5/rjg6TeBNntUbsuyU0wmVZ8AZ0yDBjTnBJJ5x3TPclolWbVuRuNBEVCZhk7F+io7qmCvGpGIUmBUxYUpfop1fONJb9g9On7w2lOg3A0ly3mgT38pZR5SOfLBEAsJtAzpEHpPUJEm2Q7Aal/BK2z2DbSyDfAntMyihB2Wh2UZNSEc48qZR2cki8YAVz/DD3ykg0XoSXKBSNtlmusQ8P3Yg+hiXdqlj4vT1JiWmPAaSJA7YBUMcFPTlsED2y3/cGzMXOB3JpS9qoUsT542f+LdXFGZX7CeR2M2YrencKyd8wCQjKInUgCEYLVyW3dplM+Qthp8xmHdQYrnmrXQqoa3HN11uE0nX0wuCjxMzOvMYB0jOXzvaqt3qIR+Oet8qE6jUXK5jual2RABl3fmAeYr5gN28GeF8Mab6iYiMC+V0EJHGCDot2/sIaCXDi9QDvuEpqqiqDIplbX5XfrHO/vxQWFQwx0qTflhQ6zoMpqSW3I6BJN5DMSvRSmU1btBLY9n94MTB5n6FqmGqw45dhU1J3dYL2vrSZCi0uDbag==
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6528.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 98aac4b3-2437-4c56-ed3d-08d8767a2499
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Oct 2020 11:03:44.4190
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1q9eHwxEbQUvVbil5xOCkNB1ubCDjqCTNHJee/il1TlO1lgs4iFVWRa4uF4EyUg3
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB3102
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org



> -----Original Message-----
> From: dmitry.torokhov@gmail.com <dmitry.torokhov@gmail.com>
> Sent: Thursday, October 22, 2020 2:56 AM
> To: Jun Li <jun.li@nxp.com>
> Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>;
> heikki.krogerus@linux.intel.com; robh+dt@kernel.org; rafael@kernel.org;
> gregkh@linuxfoundation.org; hdegoede@redhat.com; lee.jones@linaro.org;
> mika.westerberg@linux.intel.com;
> prabhakar.mahadev-lad.rj@bp.renesas.com;
> laurent.pinchart+renesas@ideasonboard.com; linux-usb@vger.kernel.org;
> devicetree@vger.kernel.org; dl-linux-imx <linux-imx@nxp.com>; Peter Chen
> <peter.chen@nxp.com>
> Subject: Re: [PATCH v4 2/4] device property: Add fwnode_is_compatible() a=
nd
> device_is_compatible() helpers
>=20
> On Tue, Oct 20, 2020 at 11:13:47AM +0000, Jun Li wrote:
> >
> >
> > > -----Original Message-----
> > > From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > > Sent: Monday, October 19, 2020 8:25 PM
> > > To: Jun Li <jun.li@nxp.com>
> > > Cc: heikki.krogerus@linux.intel.com; robh+dt@kernel.org;
> > > rafael@kernel.org; gregkh@linuxfoundation.org; hdegoede@redhat.com;
> > > lee.jones@linaro.org; mika.westerberg@linux.intel.com;
> > > dmitry.torokhov@gmail.com; prabhakar.mahadev-lad.rj@bp.renesas.com;
> > > laurent.pinchart+renesas@ideasonboard.com;
> > > linux-usb@vger.kernel.org; devicetree@vger.kernel.org; dl-linux-imx
> > > <linux-imx@nxp.com>; Peter Chen <peter.chen@nxp.com>
> > > Subject: Re: [PATCH v4 2/4] device property: Add
> > > fwnode_is_compatible() and
> > > device_is_compatible() helpers
> > >
> > > On Mon, Oct 19, 2020 at 05:03:13PM +0800, Li Jun wrote:
> > > > From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> > > >
> > > > Since there are also some ACPI platforms where the "compatible"
> > > > property is used, introducing a generic helper function
> > > > fwnode_is_compatible() that can be used with DT, ACPI and swnodes,
> > > > and a wrapper function
> > > > device_is_compatible() with it.
> > > >
> > > > The function calls of_device_is_comaptible() with OF nodes, and
> > > > with ACPI and swnodes it matches the given string against the "comp=
atible"
> > > > string property array.
> > >
> > > ...
> > >
> > > > + * Match the compatible strings of @fwnode against @compat.
> > > > + Returns positive
> > > > + * value on match, and 0 when no matching compatible string is fou=
nd.
> > >
> > > Please move Returns... to a separate paragraph.
> >
> > OK, will change.
> >
> > >
> > > Btw, this is not true...
> > >
> > > > +int fwnode_is_compatible(struct fwnode_handle *fwnode, const char
> > > > +*compat) {
> > > > +	int ret;
> > > > +
> > > > +	if (is_of_node(fwnode))
> > > > +		return of_device_is_compatible(to_of_node(fwnode),
> compat);
> > > > +
> > > > +	ret =3D fwnode_property_match_string(fwnode, "compatible",
> > > > +compat);
> > > > +
> > >
> > > > +	return ret < 0 ? 0 : 1;
> > >
> > > ...and this is at least strange after all.
> >
> > of_device_is_compatible() will return positive value on match, and 0
> > when no matching,
> > fwnode_property_match_string() will return 0 if the property was found
> > (success); and negative error code on failure. so the return
> > conversion of fwnode_property_match_string () should work here.
>=20
> Yes, but please make the function return bool instead of int.
> of_device_is_compatible() returns "score", so it is int, but here we only
> want yes/no.
>=20
> So
>=20
> 	return fwnode_property_match_string(...) =3D=3D 0;

My understanding this is to keep this new API fwnode_is_compatible() consis=
tent
with of_device_is_compatible(). I would wait patch author Heikki to comment=
 this.

thanks
Li Jun=20
>=20
> Thanks.
>=20
> --
> Dmitry
