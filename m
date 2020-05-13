Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1E61D1D0F3E
	for <lists+linux-usb@lfdr.de>; Wed, 13 May 2020 12:06:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732589AbgEMKFx (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 13 May 2020 06:05:53 -0400
Received: from mail-eopbgr10079.outbound.protection.outlook.com ([40.107.1.79]:59150
        "EHLO EUR02-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1732579AbgEMKFw (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 13 May 2020 06:05:52 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mh++8LSUgAKCgKp2ZlZbVKocTmckd7RNpYa/lXel3E9GNQpHv9fv1f845j+zMH8SzZhAvE8zwjpz1uUkD4BSsGwpMcLtC0yQ9UGOOmYKTOIK70qbHclFxiCznVZ4BCNhOKUtbPqmuaoSiO3JOugntpZvZuAh3tZeRRygN27WDSQae2AtaUM/qEklDrqHUDuksiwHnt4PK8ts6BTQSahf/rhjbLXVoIlUADGC33vy3T9nXBnm3WOfLtaUvqxtHyIbRseZhtOOHomDk39Ohkf3lILixRZ32O6mj10i2DmAbddgLRxVWGwYaZmRbz8K32Ca8LMECKSfV7EbyHb34q17Yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+CO2sExzUKEmjxmHUDAClisVqNLd5h0oH4xy9GS6W7w=;
 b=hepcOFm1cvjb3nuKVK0yeQFuEYa1Ks7nHGIt0VtJqDHiNjBax+SAS7ChB+x/fbG3bRwOQgOYKTNlPAh4Xrw9OfNH2INygc8zqi6/b+OHVZZr7qpDsByWHXseLdVszOEbSwyse/4ZHt066lov/OKdMlkVgP0UsJqM5Pjd1JPry455tk0BH4UuFnAopx9hMr0wOTupFkzAgTY7G6uAsl6SKsTxXLWiY9jGsIgvrSpCwJ0rqmldiBVAupHSHWmdd4fGpKOwYRPGfgjE7Xv70lreBYR8kHt6a2/o2Iw+uFwG4hSyUqw1XmXMuBoBI9AqRFJVdHCoesu0mR2IbrQgl39nzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+CO2sExzUKEmjxmHUDAClisVqNLd5h0oH4xy9GS6W7w=;
 b=Cm4+dzPZ4JKZ7QjtEzBmjUtRre6EcfJEFiZRDcONrGj0Vt9P1ZnMJ2wBr9snvENpjPVXuJUdYZsNGf+fuSxv4GMrQS5TUWLgJIX+mnyrHPGPiEIj9iUmyB10Q9jLiklFFD8+qHCCC0EF+FahJI2Lzg6MVL1zIE0ra+BTca93rIk=
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com (2603:10a6:20b:118::20)
 by AM7PR04MB6838.eurprd04.prod.outlook.com (2603:10a6:20b:10a::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2979.28; Wed, 13 May
 2020 10:05:48 +0000
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::7c34:7ade:17d0:b792]) by AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::7c34:7ade:17d0:b792%9]) with mapi id 15.20.2979.033; Wed, 13 May 2020
 10:05:48 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     Felipe Balbi <balbi@kernel.org>, Sid Spry <sid@aeam.us>
CC:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: Documentation for Raw USB ConfigFS
Thread-Topic: Documentation for Raw USB ConfigFS
Thread-Index: AQHWHxIE3BZgWTm6XUiOBTDqqvXTpqia0EkAgAnRnwCAARJFgIAAKfQA
Date:   Wed, 13 May 2020 10:05:48 +0000
Message-ID: <20200513100614.GA3698@b29397-desktop>
References: <0507a041-44f4-4257-adaf-3b17de3baf81@www.fastmail.com>
 <20200506091750.GE30237@b29397-desktop>
 <8ee3914e-7876-46aa-bade-7cf14df7efdc@www.fastmail.com>
 <87h7wkp9qy.fsf@kernel.org>
In-Reply-To: <87h7wkp9qy.fsf@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [119.31.174.66]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: efd2d15b-0784-4952-2751-08d7f72535f4
x-ms-traffictypediagnostic: AM7PR04MB6838:
x-microsoft-antispam-prvs: <AM7PR04MB6838CDB1AFA7CF99D3D41A3C8BBF0@AM7PR04MB6838.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 0402872DA1
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: YsJuR+ScGqU3mur6MFJ0Wl7eSIKiB7uMkOAy+caQcmMwsq1EGXDNkTJH8vA8w5BOCjYtKNrdIro391UXJF5YlsMFVMqu9v/zV9h2AIan3YBCSu6NGhp5fxVBAFHlBweCapesFLUfrIu1bWbC6pcMUBMReqmrw45EhdcU2ha01Pj0x5BM10h2K8IZ7pg06Vo8wJ1jeUf0qm2VqYug4SZWLXkLlYRbLyr6AaxTpmB6B4U2M9rtNQXCrJ7Kk0+3J9ge4spxPESwG3D6GMEVblFQAqNxyaPnr46F5Rgd9IBAkY2Lp3fPAZslOnEhZ5ysjB7TSS9welTPsNm5akwgZ4a6Kw+p2g+HSoloYKEnZLyjegc5fpTBHycuI4xNyR8QtXTLYyJZR1pVzQ74/dgPWOOd6QTzOj7KEMNQ7MbDJ3WcdE4esY9NTcJKvGcOvTYtvEzBz87vdQwCA9lkwyiAc5q7Ex30asGOejImcfSeELjGC4nM1f4zUIJnWwGBqgWcgUwXHyAPJ6G+zF7kWwlyBEAnQQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR04MB7157.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(7916004)(4636009)(136003)(366004)(396003)(39860400002)(376002)(346002)(33430700001)(186003)(6506007)(66446008)(9686003)(66476007)(71200400001)(91956017)(76116006)(64756008)(66556008)(478600001)(2906002)(44832011)(4326008)(6486002)(53546011)(86362001)(66946007)(6512007)(26005)(33656002)(8936002)(4744005)(1076003)(8676002)(33440700001)(33716001)(5660300002)(110136005)(316002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: XEKgCiOmX1He8Y1BDfdVZs3wQbxPfCR80S9F5U0gxrAr2DkQb43G6F71yqeUBltjy1G8n73r+A30czLUZjJxo6mjCieawTmArEvMl5GZc2THYAkhb7RcofQgiFauF5ldkSp3DXVMMtzZATJBfjn+5KPzT7ImFtMCjwU0AiP0qwLUskI2DNqjE8yhutw3LGVEnokMZVelFH3O/UGRHhHbU0cEo8iSJLaMnNPBPnx0HyGMwWZXyFSAfJEZ0+hV0IwxpV1PvEIf7a4H/K8QMN4lJ/H3A9VkqpEUdEqjzjv7vQ+o37DvP6MrRgE1lmWB/+vnHrIICrYQ+jGNBAnlt9ULexe/4wxLf5f5+dEoAjfga2ate9lI1OTgm8UunV2YGLLY63Ro7S+pW3MuLPEqN+ubpV6AyxLwL4HNNa9pEyzbvHdPtbBS6H5GziJpZ47BtjFJ2usSFC7dsIPKaX55L78xAhvVQpBMcPoN4sFsfIKyO7U=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-ID: <99315C56E1A87B4E94F7EF394B4E2BD1@eurprd04.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: efd2d15b-0784-4952-2751-08d7f72535f4
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 May 2020 10:05:48.6163
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: s9lzR+PhCuBpnlKGUhrTjEifjFQTHxNpVSpTHyJZFmiwAOGmPB2bM3lkky00PGJgz8OLbJJ/AVS7eE7wrybXAw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6838
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 20-05-13 10:36:05, Felipe Balbi wrote:
>=20
> Hi,
>=20
> "Sid Spry" <sid@aeam.us> writes:
>=20
> > Hi Peter, thanks for pointing me towards the ffs-test. Unfortunately af=
ter
> > some exploration in that area I still don't see how I would add a preex=
isting
> > function to the configuration to be handled by the kernel.
> >
> > I do see something in an AIO test in the host code where libusb is used=
 to
> > bind a kernel driver to an endpoint. Is that something that will be nec=
essary?
> > Device side, I'm still unsure how I tell the function to handle ECM/eth=
ernet
> > on a collection of endpoints.
> >
> > I understand how USB works fairly well, especially on microcontrollers,=
 but am
> > a little lost still in understanding the Linux machinery for USB.
>=20

Would you please let ECM gadget work first at your board, then let f_fs wor=
k
using test application (you need to compile both host and device
application for it). After that, you may have more precise concept for
Linux USB gadget framework.

--=20

Thanks,
Peter Chen=
