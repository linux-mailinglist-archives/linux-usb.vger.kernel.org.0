Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 92C8639B7A3
	for <lists+linux-usb@lfdr.de>; Fri,  4 Jun 2021 13:10:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230075AbhFDLLw (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 4 Jun 2021 07:11:52 -0400
Received: from mail-eopbgr10049.outbound.protection.outlook.com ([40.107.1.49]:40891
        "EHLO EUR02-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229854AbhFDLLw (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 4 Jun 2021 07:11:52 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GK0HMWtltIz9HR6+pU/tjE8G+KSX/CMigV01rdBnr/oxmyl0YrYB+CBmIiKoCXFs2XGCLeA38zzJnwOTKcEt2hTYpEu0GQQj38sQLKa67p3GdWVdPbTEgDM0W6L9N6AGgMf8eWDASEYD5Wm2jo3BTOE9WFP9G8ajElL7IoYgmdmsq7CUICzDLegY014PCQCUaoa4O3A89QZ3Oau699vTosNZGfs7eHqU5nAIFGD+LnNGtjqXq3E/VrKd7MIvj7WON8NdNWM/DCPY+2biGcBUqbaXLzP0TjU/edJQxpsSx6cifavrGY98RhOi+NQyzzcjUusdJ0xF1Mo3pdl5NUn2pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0lBlUmVtO3qiCUQkfRDJgnuXkk8loZLXpG59BtqGMYA=;
 b=hTqcw5bqnR1B3SaZ8U3ZNlPuY/Oo960liA/IKe4k+WfUtaAyrp84+zsnZR8NXw2rAYMhCEJN+bVLLan6+VRxTStu8y7DULxWGitnmk13kjgW0kdjfCyQptZMqMi6FvopkJ3TOVoqoLtVR3mH9iE/ZA+x9CNvV4f9OgWA2fHzlM0PVU+tlu0N6xO1ZeTxf4K8EixPUr85LwoAsP0JvOqhvOL0ymv14Vm4d8da+/I2wfF5BU9RollFluCkuMnU89G3YNzYpbp6xhGYTkIAo25DIDgUhrMQXb2xjW3ztoLoCiBYYBT6/CTJgrnLpRAFA8Y4UKxDKfiVeqDB/7yRq1/ixw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0lBlUmVtO3qiCUQkfRDJgnuXkk8loZLXpG59BtqGMYA=;
 b=SwUUU1uooCJDGr+ZQugMwi1lQV8ErY4gIbe3YtO7WmjSmgMAtAxQsZLQ8mmwjhjnqdyXw5PH87O9lnN6JfF8I10yQQXt4kdt4bGZZ0POrow1EXi26J4Av+dO8CNCIrZZiJVWufNV1DG6Kq33LQ3Zs1wkgCG9dBtfK5VT9vFq9MQ=
Received: from VI1PR04MB5935.eurprd04.prod.outlook.com (2603:10a6:803:e9::17)
 by VI1PR04MB7072.eurprd04.prod.outlook.com (2603:10a6:800:12c::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.22; Fri, 4 Jun
 2021 11:10:02 +0000
Received: from VI1PR04MB5935.eurprd04.prod.outlook.com
 ([fe80::453c:f24d:af8e:f194]) by VI1PR04MB5935.eurprd04.prod.outlook.com
 ([fe80::453c:f24d:af8e:f194%7]) with mapi id 15.20.4195.024; Fri, 4 Jun 2021
 11:10:02 +0000
From:   Jun Li <jun.li@nxp.com>
To:     Greg KH <gregkh@linuxfoundation.org>
CC:     "peter.chen@kernel.org" <peter.chen@kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        dl-linux-imx <linux-imx@nxp.com>,
        Faqiang Zhu <faqiang.zhu@nxp.com>
Subject: RE: [PATCH] usb: chipidea: udc: assign interrupt number to USB gadget
 structure
Thread-Topic: [PATCH] usb: chipidea: udc: assign interrupt number to USB
 gadget structure
Thread-Index: AQHXSLKZL5icc46Z3UyHEkdV9jYDQasDzdsAgAAEoRA=
Date:   Fri, 4 Jun 2021 11:10:02 +0000
Message-ID: <VI1PR04MB59356EF043AFBFEF160410F6893B9@VI1PR04MB5935.eurprd04.prod.outlook.com>
References: <1620989984-7653-1-git-send-email-jun.li@nxp.com>
 <YLoFyCyRofg/Jz9r@kroah.com>
In-Reply-To: <YLoFyCyRofg/Jz9r@kroah.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linuxfoundation.org; dkim=none (message not signed)
 header.d=none;linuxfoundation.org; dmarc=none action=none
 header.from=nxp.com;
x-originating-ip: [119.31.174.71]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: fdd7b05e-ef68-4f87-9fca-08d927494ce2
x-ms-traffictypediagnostic: VI1PR04MB7072:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <VI1PR04MB70723E58F5DDDE0CF10E28A3893B9@VI1PR04MB7072.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1303;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Lzs2Z6p8xRj4lasKL9pRhhQNMqJFWz4cV27UCSVDvnoiJG9AcVE7gMuiXp6embQt7NjJ4NeaT+rjNcTLp8jVYRCFaK+ET5bAmD9JgYEaI4EM5bBKb7cLczOXRf8/YnDTmc8O+phuq9epRYscmL1kdvL7AY8RSJghTAAGwN/Q1YlkfqW5z3Q1oY9tL9F3JJHQQuY/vlqXVo0yQwinHWLXYEf65NFMCc4eYksIEtiUNDmQf8XMydkRUFc9jmbKfyMNOviScQzRGTZtksNknT5FzF21omzjT4JmmoHpRS1dfeQeg5lgKGCJl6j5caUCCHfevVFO2Bhb+Yz2+McgEeRUfPG8f+FGb2chOezkAMbLQ8rVUTNUEejAtK0nJ4tjNzWur8Iz0kS3T8P2p58vW1YsGmHRs2cZ5xMjwEAxlhwN0KgyKQm3jbkRbWd/jd14QaGm4H6Wb34au6Q8PJ7YDmEyeEyeg2NoLj2P4OdY9IlfKtHsY0dC1YraGeDTXTa1aTQhuC/159uxGvrUbVaVmGeXIaPl7GAX/WZ1XNA0EPw2gna/z16kyIoOEKxBxZmlK/mFr+lzRLJwytVaHpAMVmzNCvAIjp2UiZDWeQHTLLXH7NE=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5935.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(346002)(396003)(376002)(366004)(39860400002)(7696005)(5660300002)(71200400001)(33656002)(122000001)(44832011)(8676002)(316002)(4326008)(6506007)(2906002)(38100700002)(478600001)(66946007)(66556008)(6916009)(76116006)(66476007)(53546011)(64756008)(55016002)(26005)(66446008)(54906003)(8936002)(186003)(83380400001)(4744005)(9686003)(52536014)(86362001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?ck8mnyEa1/JcGGohfg/7iMgiPjldKqeWp70rAeKxYPumssP6Lubeyfy5lRdH?=
 =?us-ascii?Q?CZDVgvYxrC+PV+9xDY9g/zFmrD+3Wpv7VkkstKU9AibM4dkptpsobwUhQ0RD?=
 =?us-ascii?Q?BYY91Tb9UMXXauFCbWwlt1nxfnbrgpoq8FOCn7NyxAlupD5PaUjTnw/Yt7Ry?=
 =?us-ascii?Q?rPiXiqZTnyMhNAdDNbNrHk+7pqQXk2ne/2ADo6z8AA7IfKMYVJSDYyl4IXxJ?=
 =?us-ascii?Q?5sMLcOsluWaOI5S0uaNi4n/VXsvpLEe9s7JLARgxtnrfESjCQrhrJgl3FJ9g?=
 =?us-ascii?Q?nIoqwXq1nsXwaNO3xe7w0JGxymn5N9p6rzwDawZ21yJamK9lQwowlyGsAs+y?=
 =?us-ascii?Q?X+M0u4y2BDgIlyRWxXeEmLENzRjvbfLATU9qC7gKeKD7cpdcpcAU2NeOezrD?=
 =?us-ascii?Q?Qt2SYRuooqI45YQ7cVI3u7TZIVW6qs4jCXxOdFeVnQ6FwmypYcxwU0x3NI41?=
 =?us-ascii?Q?lJ9EURrn5jiDWrVdCYsMfun3HpBoDls8fqRTbD5IPbaByMJWY4Jtl5Kw7B1H?=
 =?us-ascii?Q?hQFYTjJ/Q65BgNYMo7lrcJUqp9m6KPVFNb+Ej0oEG6mrISM/f2hBoK25Hur1?=
 =?us-ascii?Q?kg5TekPtdcmeUmLevVPdgvKNjrPtA/VR0Po1gs3aYgnW9t26Xc2iMls32G2R?=
 =?us-ascii?Q?c5yC9gVuP5StgkOxlDioXQgWSohK0DMsgm9Wmg4TmmWppYfbd0x7Dvb+Unuh?=
 =?us-ascii?Q?Gms+EynbzpF7dZ9O79N7xp8D2O2zE1OAsfFpI3x2fm+SJO5lTLDVTV6YRYOr?=
 =?us-ascii?Q?M0U00BQqX5zzIVJwozFEVITmO3ddKCn3Katb1AeUaZGXk5fT7AhB84AJ4/7x?=
 =?us-ascii?Q?SxDrVXlADuqUPk5JSp9wzczTO7C2YTxaxQ2o6uUFuZ0LMEveE1zH4mEC+xYZ?=
 =?us-ascii?Q?fnTOspKc5/3K0qV6Jr7kXir19TMRZxBx93UzJgqrr5ckeEEoOMevcoOdUij0?=
 =?us-ascii?Q?eBKglfMiL0ZfVlw5sYyALuOaJxLwvaIJdyIkDdvsfUgUCDQk/SecX0cbJ7Za?=
 =?us-ascii?Q?T4YlZgJsjeztZgTC5heGqGWbArNHbmvrPSymV8TiwsKwdofqaRWTWvAjab5F?=
 =?us-ascii?Q?AxWnpzfzBFpIFT7qa0irdXpJzEBCvcRmjSJePQ7T3C6LTfZNMLIApn265Ie/?=
 =?us-ascii?Q?Q4Y6n6/CU+7LF58UoemxJ2/BQ5scbGMmIrCC6Qq3nb25xbJHn4lc2f1SkPY7?=
 =?us-ascii?Q?3iZDGAlcF9NxSRh9C3gWv4fGNruph06w6VXpbYAsEjgucwjvO1DZUcG8Kadf?=
 =?us-ascii?Q?RAVo3QZz9RWD6ZPLPh9BYBbCPjEWNgLfdRZTyERA5fn2BJapVek4vduEkuPi?=
 =?us-ascii?Q?72w=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5935.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fdd7b05e-ef68-4f87-9fca-08d927494ce2
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Jun 2021 11:10:02.4422
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Y7CHq09L+nsTPSDgJJQ1FWfd0+uhf//+udCIOszyQ/hG/XR/ZksgqmWu3QimU/Rd
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7072
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

> -----Original Message-----
> From: Greg KH <gregkh@linuxfoundation.org>
> Sent: Friday, June 4, 2021 6:52 PM
> To: Jun Li <jun.li@nxp.com>
> Cc: peter.chen@kernel.org; linux-usb@vger.kernel.org; dl-linux-imx
> <linux-imx@nxp.com>; Faqiang Zhu <faqiang.zhu@nxp.com>
> Subject: Re: [PATCH] usb: chipidea: udc: assign interrupt number to USB g=
adget
> structure
>=20
> On Fri, May 14, 2021 at 06:59:44PM +0800, Li Jun wrote:
> > Chipidea also need sync interrupt before unbind the udc while gadget
> > remove driver, otherwise setup irq handling may happen while unbind,
> > see below dump generated from android function switch stress test:
> >
...
> >
>=20
> What commit does this fix?  Should it go to stable kernels, and if so,
> how far back?

I will resend the patch with fix tag added.

Li Jun
>=20
> thanks,
>=20
> greg k-h
