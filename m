Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6DBE623EB66
	for <lists+linux-usb@lfdr.de>; Fri,  7 Aug 2020 12:21:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727915AbgHGKV6 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 7 Aug 2020 06:21:58 -0400
Received: from mail-eopbgr70050.outbound.protection.outlook.com ([40.107.7.50]:44822
        "EHLO EUR04-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726511AbgHGKV6 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 7 Aug 2020 06:21:58 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z6mk9sF7ehAQW5UYpzQUZ0600rY/r8D/ConC89gDqjl7kSefLaKjhAFGEe9R/6qfP5sM0UskXk/l4xu5GUlS1U3/SgGezIt0fPijFsm9SEPdBLpg2/a2n0YuM+1BbMrXJyjZq1ikfQJA+Vk/ZqzwytaU7X37xSZKHq6w3Vq61HB4Mw4oLbUcLTnCTsqvJCwfaLvpJ4Q5UfrdFts32+pJaQd+Flg+PXrsDnMSwtcW146mDjjNZ8mDOuYs2o74SrkNr4mL29QRHOUBmHBS+RLsfW/0Q3/o1raCybVIQxOu1dzCNs2hg9uNVUE/gOKbZQnZEyX2btewutlWr76CmA0D7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bGJctN5QQyvYdHWln0t7AGo0SDq6VWnEyOkpNj/B8eA=;
 b=MnK2AsWaInjRJ0KeMkLSGX2Lb9Rfp9UMSIUg0XXCUe61kH/+v+4FL1TyaS/9MvZNy8rCaZ0II32cwKD9qhrGCZ/gPWPinovdUdf6XD674PPdluOYe70LMOEKt8ZpMRAd3ACoAakpk8NtIjVxgtk+jdwx8IKcs2ysJyhTW1W+RiiQveDX/H1p66zO+L/Du0yUo5FtX27WYpvQQZtf5lb/uTyiULYwq6okfRljjdS0dG2KhdzFKWyc+3e6cMuQ0hPN9aezHsqfLAwnbheMusY0N0y0SdDVoyfU7Z79uXsbRUFtYBjC+3QB8z2SEClgFoBFtvVCQTIjE52ACGKCgJVTKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bGJctN5QQyvYdHWln0t7AGo0SDq6VWnEyOkpNj/B8eA=;
 b=HJjdOa/eGUaeIAnWetmzWYLbg4dhwAMDbMYsZxpDKOgiO74Aa/LynDFGHCMyaduOUQVQpMzkJIwq9tFhritMaMKBQ83xmkQAbzdkDrycY40OWNtFJucCml8tbDjoMDXoCpusMZQVUsWdGrk4UDUBWLsVJdyT9umml1iobLa1qW0=
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com (2603:10a6:20b:118::20)
 by AM6PR04MB6278.eurprd04.prod.outlook.com (2603:10a6:20b:be::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.19; Fri, 7 Aug
 2020 10:21:53 +0000
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::ed7f:8755:5994:7fcf]) by AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::ed7f:8755:5994:7fcf%5]) with mapi id 15.20.3261.020; Fri, 7 Aug 2020
 10:21:53 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     Greg KH <gregkh@linuxfoundation.org>
CC:     "balbi@kernel.org" <balbi@kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        dl-linux-imx <linux-imx@nxp.com>,
        "stern@rowland.harvard.edu" <stern@rowland.harvard.edu>,
        Anton Vasilyev <vasilyev@ispras.ru>,
        Evgeny Novikov <novikov@ispras.ru>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>
Subject: RE: [PATCH 1/6] USB: UDC: Expand device model API interface
Thread-Topic: [PATCH 1/6] USB: UDC: Expand device model API interface
Thread-Index: AQHWbJ8b8D/PbyQkFEK98mIaluJVZ6ksZ6SAgAAHumA=
Date:   Fri, 7 Aug 2020 10:21:53 +0000
Message-ID: <AM7PR04MB7157A52930B8F6D0CD38BE2A8B490@AM7PR04MB7157.eurprd04.prod.outlook.com>
References: <20200807094151.13526-1-peter.chen@nxp.com>
 <20200807094151.13526-2-peter.chen@nxp.com>
 <20200807095221.GA3071081@kroah.com>
In-Reply-To: <20200807095221.GA3071081@kroah.com>
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
x-ms-office365-filtering-correlation-id: 0f0d3585-1b99-4201-a576-08d83abbb4a5
x-ms-traffictypediagnostic: AM6PR04MB6278:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM6PR04MB6278ADAD40DB234FBBE137B58B490@AM6PR04MB6278.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: TLyquilR/uVZ47gRJZGAZA9WF9K3pjSkSAZQO5SULzv1LB3WS5lCH7UFYooj02qxcFRdZV2rokBa43kxW0bcLaS2Rhd/ZPIkalZAj0UHi8OIdp7pwFkpSkr5NGKpnVCeyOkPUfX+xhQAUd75KrVyCOmfLHk37kem9XIVvvuIt8LyuvS6XA8WXwn013+cq7g3DurXMK50cruNA7jXKUvWErwv9JUGqYB4x82yMm+aJqmAr1DpEcKXJeYfZu13CRNbccnq1diVjFACfbmzkBmOMmmYctxyTUIosIUOHWlEK1IuKXtnTU6cuebqIXQVpbbfUN/trM4p6hjumboI2c6Frw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR04MB7157.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(346002)(136003)(376002)(39860400002)(396003)(366004)(8676002)(71200400001)(66946007)(83380400001)(66556008)(76116006)(7696005)(64756008)(6506007)(55016002)(186003)(8936002)(44832011)(26005)(52536014)(66446008)(6916009)(86362001)(316002)(2906002)(66476007)(478600001)(5660300002)(9686003)(4326008)(33656002)(54906003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: JQLe/UoJbRhok3ddOOhnjs4GxGGxiOLQFCCqLFV5gxd9flvWDf3ObXbUGmiUMhlo8NXFcgN6UhBLtfMPt27waq/qV2ATghzSBX5UrreGEJklcgK0z7pCfu8/0BsJsgSFsc/YHLiVvEmj7MOgmS7Nq5s0NmLp/lCbryfbb6H9IplMVFKFBB4ShUEQ+x60X0g8lcVz9F+B7AOIyXiDaJSN1eDzsLQkjjV2Ac3HSkyj6x1X7GdVUjOEAih8/qQC/DDc6ZZaoC/+jX0Wd7DoGBZIuk4lKpHJttiYcr+UbPQYOjZQrQxGSyXeLDu3zo6Lw9iqOJq+WTVSTyIcyMjTtqZEO4i5SDS0xkG7X6NyNPW/QtWRCaBg/TKtSaacMT5kviiyKUxu0fkvCl2CV55qbxpKvhoIofxuYXmd52+rPt8kqKvnfWKo3EBlozKqUc/2fBCgrcnHpTBg/Eu6HfK8aHxJ5NU8X0vkysGVze4iOhvyYqkoLnBdoscHQoQOzSvQwuIhA9YAoyMBn6v/r230EZgVCbpsF1McSQFriutLQBtIh3XSEJaYLjo3h2FCa+tHieC66Y96bgW18KZBe7BobE0jvpMW0YzZ53pnMKnN8boLdZpAjOS6tMSuZ8nRusAT/rayXTiB5gRi7Ek0cEtIkdPLBg==
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7157.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f0d3585-1b99-4201-a576-08d83abbb4a5
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Aug 2020 10:21:53.5302
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: G8XFqZNhnE77T3wxqQnt6CSnnQrjP+pu9+60Z0DxK5ezzl/no9Uz7WkmwS6mBaZorgvQ6qzlkSmfF59INOo9PQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB6278
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

=20
>=20
> On Fri, Aug 07, 2020 at 05:41:46PM +0800, Peter Chen wrote:
> > From: Alan Stern <stern@rowland.harvard.edu>
> >
> > The routines used by the UDC core to interface with the kernel's
> > device model, namely usb_add_gadget_udc(),
> > usb_add_gadget_udc_release(), and usb_del_gadget_udc(), provide access
> > to only a subset of the device model's full API.  They include
> > functionality equivalent to device_register() and device_unregister()
> > for gadgets, but they omit device_initialize(), device_add(),
> > device_del(), get_device(), and put_device().
> >
> > This patch expands the UDC API by adding usb_initialize_gadget(),
> > usb_add_gadget(), usb_del_gadget(), usb_get_gadget(), and
> > usb_put_gadget() to fill in the gap.  It rewrites the existing
> > routines to call the new ones.
> >
> > CC: Anton Vasilyev <vasilyev@ispras.ru>
> > CC: Evgeny Novikov <novikov@ispras.ru>
> > CC: Benjamin Herrenschmidt <benh@kernel.crashing.org>
> > Signed-off-by: Alan Stern <stern@rowland.harvard.edu>
>=20
> You can not forward on patches from someone else without also signing off=
 on
> them.
>=20
=20
So, even without contribution for the patch, we also need to add signing of=
f when
submit?

Peter
