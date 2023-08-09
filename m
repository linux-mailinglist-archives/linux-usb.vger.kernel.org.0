Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 479A07750A7
	for <lists+linux-usb@lfdr.de>; Wed,  9 Aug 2023 04:05:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229719AbjHICF6 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 8 Aug 2023 22:05:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60652 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229494AbjHICF5 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 8 Aug 2023 22:05:57 -0400
Received: from EUR01-DB5-obe.outbound.protection.outlook.com (mail-db5eur01on060a.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe02::60a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CA571F3
        for <linux-usb@vger.kernel.org>; Tue,  8 Aug 2023 19:05:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RIeLW/iKy0iuIKqgWBUIhDsT25We+v416yCxV8Zb1NVKmEJnNjI9bridEYMXOWYE4BYC5/+mmIc+1tl9bqHg5o/Iyt0jWnPZZZ25OmoRsE3V27uvo3lN5o5zOKQSp/dj+TNAAHz4rhtfKNQEGP119IkhA87U8t6gSv/dWqY+0jS8941Pdtl3J1hfDQ41xJDFD5Ivw4G/BA+UWeRY3B3/bnxpCt9BjYfv5pKrLHnNbIIBknQUb7TLUFVr7dO0/MZzuKe9orkT5zowHhJPd8tu6gy+315A8FElaGdHrCuG0lSIq4LFVJ1kcRSnv/2ze00TRDHyxh7hU+Jsl/jzEM4MaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pEq8r2YvXGxwpTvl+3nv44SwO7W9AsXUWTaWaWcWv+g=;
 b=Y3n8LzJ2+Moh2vTC8KI0s2rRn4ue8g41ug5gTGXlUTFG8iqdfrjijrWQdW5me2CW6k7OyPUEdSMlbwMwEUk1Tb2ElnOE+elDdWCAfOWrdKBcqnyB6x06wH8Fvbg7CeqjD9jFU3XRFvJNL7UxTDhWZyq5f2TiyfHKqRKBLSgpIkOfF8IQXkxRzKwvjOsR0lkOdRbWFwXbwWvciV6Qg7I7Cx0jPtTXawyw70ZdnYj7xo431WpctOKbbX+mMIaKsRWaFXL/bSRNHu/rEY3UZL9EgnD2L7p9Cv3f+Ske5EP42c5zjx/LE+VVacO2I5tt3kW6WD1mL764amTK3xnBPOyuTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pEq8r2YvXGxwpTvl+3nv44SwO7W9AsXUWTaWaWcWv+g=;
 b=DoFuzuxTperxiD3fSrL8AlBuU2ddbjCULtlmUnTlZ1UrO6SJXo7xQnM46suDl0N1RJPG8CpOhZzLWk5g5ZMb4Nn/t2nM4/HlMHGPrLnsrXWiVDy9oJvp0TTeVXH0jjoMgQDSqQPHgxkfhDra8yQKY1YmY4Np76MfJqu7y5Y0dno=
Received: from DB7PR04MB4505.eurprd04.prod.outlook.com (2603:10a6:5:39::26) by
 DU0PR04MB9587.eurprd04.prod.outlook.com (2603:10a6:10:317::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6652.27; Wed, 9 Aug 2023 02:05:52 +0000
Received: from DB7PR04MB4505.eurprd04.prod.outlook.com
 ([fe80::85e5:acf6:574d:a2a1]) by DB7PR04MB4505.eurprd04.prod.outlook.com
 ([fe80::85e5:acf6:574d:a2a1%4]) with mapi id 15.20.6652.028; Wed, 9 Aug 2023
 02:05:52 +0000
From:   Xu Yang <xu.yang_2@nxp.com>
To:     Alan Stern <stern@rowland.harvard.edu>
CC:     "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Jun Li <jun.li@nxp.com>
Subject: RE: [EXT] Re: [PATCH 1/2] usb: ehci: add workaround for chipidea
 PORTSC.PEC bug
Thread-Topic: [EXT] Re: [PATCH 1/2] usb: ehci: add workaround for chipidea
 PORTSC.PEC bug
Thread-Index: AQHZyeK0cK9Sff+MUkeU5Px1a/49kK/ghTuAgACydoA=
Date:   Wed, 9 Aug 2023 02:05:52 +0000
Message-ID: <DB7PR04MB45051B93615D3E8EFA17BA918C12A@DB7PR04MB4505.eurprd04.prod.outlook.com>
References: <20230808102959.479264-1-xu.yang_2@nxp.com>
 <b0e64bd2-b4fa-4570-97ed-c2ab5898ede5@rowland.harvard.edu>
In-Reply-To: <b0e64bd2-b4fa-4570-97ed-c2ab5898ede5@rowland.harvard.edu>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB7PR04MB4505:EE_|DU0PR04MB9587:EE_
x-ms-office365-filtering-correlation-id: 987a1859-f75f-4572-aaf1-08db987d287b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: /zlXrX/4zZbrxWqRwVdGnFh/VfzkRgnw0mv5BN9BwlGRsTtuSFa2TZuVukr4aKTTN1fVeHBLyIZ76EPcOLVAD3CJ/S1VaCzjz2BhfJjXuLeMUPkyj4q4r3algE5szGeARYA0XvWPkAK9frGTT5ef6SDzztwwYdr3yB6scX9fjJFp7G2OfFe82rdWstrAmQPuRaolcCqeEretBxpKixlePQ5WxOKZbXYxhv9/I3ofMtSVb6iUd9N+Z25pIOlLdTNKrwoZM/WQVj8NPWmYoynX4Xrrv/yld+zioosb7l4pVIPY9D8NasquYrMT0rEN4PbGWkCDmOfgCqQVDEy6JC5dvhWRy6E6dlWHPEqfmeR2/pqmqTj0ixrqBXglAZ09kNFWwsihF2c6wMJ7FRrqalGniTR4qu7s5G+cqzlBdMI2zKa/yztK3AgRSZeHkgE7uk0E381xLwczrOQNcQbUv+eceTI75SPE6SLzULwwL20q+TEHrur6GFO46p1Br8fjsXwhw9mzwV7RUcwUj5Aun5WEAq7lDR0tZBYuKCaHXGDtggD/JyymlZtyegPeXzNUPVmTngt0KxGov81VpSj5vj3ceHKGleVNI6IJ+QyeJsfHAbjogDGMdIsyVmfYXpt9ng8F
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR04MB4505.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(396003)(346002)(136003)(39860400002)(366004)(451199021)(1800799006)(186006)(2906002)(55016003)(83380400001)(41300700001)(5660300002)(8676002)(8936002)(38070700005)(33656002)(86362001)(7696005)(52536014)(9686003)(122000001)(478600001)(38100700002)(54906003)(71200400001)(316002)(4326008)(66476007)(6506007)(64756008)(66946007)(26005)(6916009)(76116006)(66556008)(66446008);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?uYkVtMi9RD2AmmqEPy0oBU3bVZYedVt1UkfoONBKGz3H5Tu3U6UxCq9ZaXdc?=
 =?us-ascii?Q?2FByDFoFRNLqgWD/8dtizxChLh+AgwGiqt0geITOcMCp24lzp8/hPU1ssilF?=
 =?us-ascii?Q?3VsyogOkU04X31DZZsSjLQ8DGUVRfnOZU7iVGU8r7ao9ZgYm4Is1qw3M7yNw?=
 =?us-ascii?Q?J3zrIpvYrCCeVsDDenqSVpq8QATFHlH/I4/Y1KZUVb/PT4u6LIAkGujfflZc?=
 =?us-ascii?Q?bPQYEFx362y/fnOpipcXPsEe3Onj8DfGc5Km5s8Fa/XUIcmJKw2y3bgenoPh?=
 =?us-ascii?Q?ISqwN5lR0GL5HoQjr9nbZOzWa2GRhuSxaMEnssAcx05pMixGA67iztzvwBjh?=
 =?us-ascii?Q?UuSQQ0a9WBE7CBhyB+8qmUxc6cvggbTOKguzmPeVjTG/xvAOPKTX6k36842L?=
 =?us-ascii?Q?6XMXfd/mSmUPm2i7u3VPW1mj2hvTgJp3T60n0B/ZmQuiX8QFbVKHRsEKY8T6?=
 =?us-ascii?Q?OACserac5reL8IU+O3x0Oy+98ks1QhQflyawBKTu/zYSvBj91aMp+AJ4mOqU?=
 =?us-ascii?Q?L8f/M0TUMsrBooEOEJ6zOJfxp7F6EXpnsivUU0CQ9fna7c3udFlbAiuFgjfV?=
 =?us-ascii?Q?hR+psOqz7F72CgmsiaaenDRtzpdDoOyHiKVkaAMvsXBc9BAPaCpwehYH6KW7?=
 =?us-ascii?Q?ynPyo5cmNjAT1JQ8O4ql2WZG21QVPiM9KHneaEigs/L9OAhTjUZZ7WgtJilJ?=
 =?us-ascii?Q?hrE+f28GcaHWETsfzxg55UuPACCkeQqUZuG/UzkZKNHzM4A6eQfHFs+LFv9d?=
 =?us-ascii?Q?VXdMmmtMjL2nQV3MePhZqjsK8Dt1I3dEHuFaJEvXQDQ/gDwZIR5Vaep6gCv/?=
 =?us-ascii?Q?fRRH3Kq3XTOkP3IdAsI5w5Dg4war5JKPCuQaYDSSzCq4Kp055GX9nqR+Aobu?=
 =?us-ascii?Q?wh360ook9L/BlFkUOYtOVJCXso/AzRrpDd7bB5VuN3Gb78tfHdxCRPbBSBU9?=
 =?us-ascii?Q?ev/AnYLBhJfoXl1F79awHX/Q4YjArvWnuMuWMfMQORxGN8Oz8BIE4uhrp9X0?=
 =?us-ascii?Q?wQ3nA4D9qpjAi25kStMeyV8fg7KnJfRxWXiTyLtk2k0fSA2Y7se0pL70FMFi?=
 =?us-ascii?Q?1NaTZ03biE566NVN1mYk6jboqtqLtDR9X1FRXUcYAtDCK5RPfZA4UgeeEzUh?=
 =?us-ascii?Q?OM3whMAKy+shRtI0ugC2gcKzunDq1ivMiLYCIhLK+kfz5KK0LTEFWznWyi1C?=
 =?us-ascii?Q?Y5az+e+KZ0pVmZ9KPzP1tTGEi4WfDNLLKmmHaDny3sWq5RbLfN69dBgvITZP?=
 =?us-ascii?Q?tXEdf4qL4BBfMjE26i5YQT+5bs2vppeVkpemFhiVmqRPAakPTYMmfYARJlzZ?=
 =?us-ascii?Q?fi11ZzyXPjsEXFtML/2DUAc6dmaLjOeUOsp5XU0AaTuEjSO+OvoirLw1SS+r?=
 =?us-ascii?Q?tWW7WkCgQW5B1PsS5QQLHOf1ATsgSBXiHgd5m3DlYP06jgNSJPV/ojdLVV12?=
 =?us-ascii?Q?0or4mhzddHxy+C9KXtaZvLx2CPM4Bl/NpZzB396MPfXSqd5ONqeb1O9cGRw7?=
 =?us-ascii?Q?TQ5Dq9wA43Visv5Qjn5W8wORc6E65vY1+y2hnx0KGTmkzFh2KU4KFq6plpVJ?=
 =?us-ascii?Q?H8hqQYTPaV/Q1BmJ8bY=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB7PR04MB4505.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 987a1859-f75f-4572-aaf1-08db987d287b
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Aug 2023 02:05:52.0331
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YKsSnhsT4DwdGIRxfugNSMnYplICNidhe83FC1L1hCqcrwOkIIec6+Lu9AQNuPadHSLj5G+/eEnY8klSIOUr2A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR04MB9587
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_PASS,T_SPF_PERMERROR,URIBL_BLOCKED
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Alan,

> On Tue, Aug 08, 2023 at 06:29:58PM +0800, Xu Yang wrote:
> > Some NXP processor using chipidea IP has a bug when frame babble is
> > detected.
> >
> > As per 4.15.1.1.1 Serial Bus Babble:
> >   A babble condition also exists if IN transaction is in progress at
> > High-speed SOF2 point. This is called frame balle. The host controller
>=20
> s/balle/babble/

Okay.

>=20
> > must disable the port to which the frame babble is detected.
> >
> > The USB controller has disabled the port (PE cleared) and has asserted
> > USBERRINT when frame babble is detected, but PEC is not asserted.
> > Therefore, the SW didn't aware that port has been disabled. Then the
>=20
> s/didn't/isn't/

Okay.

>=20
> > SW keeps sending packets to this port, but all of the transfers will
> > fail.
> >
> > This workaround will firstly assert PCD by SW when USBERRINT is detecte=
d
> > and then judge whether port change has really occurred or not by pollin=
g
> > roothub status. Because the PEC doesn't get asserted in our case, this
> > patch will also assert it by SW when specific conditions are satisfied.
> >
> > Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> > ---
> >  drivers/usb/host/ehci-hcd.c |  5 +++++
> >  drivers/usb/host/ehci-hub.c | 10 +++++++++-
> >  drivers/usb/host/ehci.h     | 10 ++++++++++
> >  3 files changed, 24 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/usb/host/ehci-hcd.c b/drivers/usb/host/ehci-hcd.c
> > index a1930db0da1c..d6b276c354db 100644
> > --- a/drivers/usb/host/ehci-hcd.c
> > +++ b/drivers/usb/host/ehci-hcd.c
> > @@ -762,6 +762,11 @@ static irqreturn_t ehci_irq (struct usb_hcd *hcd)
> >               bh =3D 1;
> >       }
> >
> > +     /* Force to check port status */
> > +     if (ehci->has_ci_pec_bug && (status & STS_ERR)
> > +                     && !(status & STS_PCD))
> > +             status |=3D STS_PCD;
>=20
> Suggestion for minor improvement: First, you don't really need the
> (status & STS_PCD) test, because if the bit is already set then turning
> it again on won't matter.  Second, after that test has been removed you
> can merge this code with the INCR(ehci->stats.error) line above,
> removing the (status & STS_ERR) test.

Okay. Will try this.

Thanks,
Xu Yang

>=20
> The rest of the patch looks okay.
>=20
> Alan Stern
