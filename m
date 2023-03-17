Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A07BD6BDEF2
	for <lists+linux-usb@lfdr.de>; Fri, 17 Mar 2023 03:39:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229704AbjCQCjQ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 16 Mar 2023 22:39:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52334 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229549AbjCQCjP (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 16 Mar 2023 22:39:15 -0400
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (mail-dbaeur03on20620.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe1a::620])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 35F6772B7
        for <linux-usb@vger.kernel.org>; Thu, 16 Mar 2023 19:38:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iCRh5V9b3XBlekDmZ7zH4JykqdO9wwlDaDHdNBK4rBeFVnt/F1td+BTPAOdIoIHq6JlOpK1Pp44VGTR67PC288DSqaUHPeqbBO+6Xjyt7AANFlBzNmAz0/X2H0IzAzQmrbjMKoG9EMGvw6AJoevKnDkdY4VYz7B3j7wtop3ch2mU78SE5Vn4JxW4WmMYiC4VfU/p93GKUVi1l0yUHWxscBtVfgb7/Lh7UsHK9n43KdMaIMVeqIVSzkEt+7SSFtv+Qv8wahv9vxvy7fGUBdM6Vu9iN1zfnt2r3Ro/coBLr5ghJk6eq21ix+/qXnDC6aUIDZlsY97BewVXQY8qu0nNTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=13xsArNGTz72yuX2dCTl5WdeRE0cF1c9ek6kZFdsxzM=;
 b=WYDMj8mdDKcuxaw1cVxDBJ3SMJJ9JeHO9+hFTtGGr67+DCm1OyEraoMUolVtzDNbg+/8vFAjyT1k2ZsLyRV4OxOJcw3zCF54xHLy5ThPftbX13AqnOkaz2olqa4G0QzH3VCupkgb/Q+QcQIzLpfjq3SsqXWFuREfxELSI7rCr0FjrSXf2zsysdL16p1BI7DwjEArxhv7Rz5APOiExLNy9mZCcJD34qleada6TAykCTFYUszautZdnRhMBivPdD1+MxMxnJjRhmEnUDyTyoVOe7WtzUfHEVuqqlcNpgQ2rkVNGirRIy0OiiEoi77o+u+zInZeMXn+F7Ox+fTGBdyc1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=13xsArNGTz72yuX2dCTl5WdeRE0cF1c9ek6kZFdsxzM=;
 b=Q3JaWnOKz0Be3r6FbpvbZeyotF7H3LaffHCvwFira+bT6yFSmxJU6xWBmC2lQbLtZ61WuwmV9WgAHaW08hpzdiHqRAFxieub0aOS80t+L4zkpaycLX6xvCLaajyNfB/4ei0asLQINRy4iXWBvkAbPg3y/viCsZ0SYTkBBbe2Wck=
Received: from DB7PR04MB4505.eurprd04.prod.outlook.com (2603:10a6:5:39::26) by
 PAXPR04MB8525.eurprd04.prod.outlook.com (2603:10a6:102:210::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.35; Fri, 17 Mar
 2023 02:37:47 +0000
Received: from DB7PR04MB4505.eurprd04.prod.outlook.com
 ([fe80::5466:bfa2:3158:97c6]) by DB7PR04MB4505.eurprd04.prod.outlook.com
 ([fe80::5466:bfa2:3158:97c6%3]) with mapi id 15.20.6178.029; Fri, 17 Mar 2023
 02:37:47 +0000
From:   Xu Yang <xu.yang_2@nxp.com>
To:     "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
CC:     Peter Chen <peter.chen@kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        dl-linux-imx <linux-imx@nxp.com>, Jun Li <jun.li@nxp.com>
Subject: RE: [EXT] Re: [PATCH v2 1/3] usb: chipdea: core: don't return -EINVAL
 if request role is the same with current role
Thread-Topic: [EXT] Re: [PATCH v2 1/3] usb: chipdea: core: don't return
 -EINVAL if request role is the same with current role
Thread-Index: AQHZBJNydnXZsKXZC06uObPzR157y67IUZWAgDV/R1CAACIpgIAA9PXQ
Date:   Fri, 17 Mar 2023 02:37:47 +0000
Message-ID: <DB7PR04MB4505ED500F2FE7814C4B61688CBD9@DB7PR04MB4505.eurprd04.prod.outlook.com>
References: <20221130081231.3127369-1-xu.yang_2@nxp.com>
 <20230210085505.GC1991028@nchen-desktop>
 <DB7PR04MB4505C0FFBA12A15D35A0BBED8CBC9@DB7PR04MB4505.eurprd04.prod.outlook.com>
 <ZBMDf6P/xzCP+oOZ@kroah.com>
In-Reply-To: <ZBMDf6P/xzCP+oOZ@kroah.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB7PR04MB4505:EE_|PAXPR04MB8525:EE_
x-ms-office365-filtering-correlation-id: dfdd041b-5050-418f-d3e3-08db26909847
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 59fLTIxYxnZrWdsJgOiYqhZjx0lzgUubjc+vdI8zw1+LNEqtjWb7BHDcj9HO7TIXz9uHp693kthft6y1A1AIBrkaPTIgrYChWYLghLcdtLUR0LThT5DeHBof/Vi9J/SYolHpdtw6DB7d4aLmIZ/Q8OelmZFqjoHSP0ayG3VJZInSEaZ7A1WDZEqS4/ljHdY+5D2ij7pMGrMXgWhtN9nh6Lt342KYMNOsKWAahJdd8XEii9CdHmC9hyM5iT2uhMV4eNTvewWG5ZLxXlCkLF6YiETc6AU8TKQPSv1ZNZ7KfhoYb9lCQc5RZ0Rs5tuGxJPAT6B0Ks3tJXO7c5L98DKEVX1+HBgSVS1DHHBc4kUdZUc/lGq5tR1J/WBZAwVO7YZj/mX0COFfy7il9fNyXTCjkSSjJ8X3XW/MzW9CsYYngBgNC/8LskcrxKnILN9bYfHjaFWnA+w6EnNgyDUOSS0oHBJgxV7WYhrujVLERhevGT2I0DVNkC7IKychfar8XpG2VI3WQxhFiyBZjII++tq6oNBBy/9g9/iQs3HZNTqKOEvCq50lRWsKMWyjJVxDdUMbliVBGg3naM43/SuvwvZ4rJk2xd5XAy2t61FUi3SEt13Er/+dXHJiEQOTP8OvPe39ANuKGMQa3AHH88bdW3t0g2vCfr4WB6o+Ze3kEtXval7DVagWI2gSSiIY9cMQiKEy
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR04MB4505.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(376002)(39860400002)(366004)(346002)(396003)(136003)(451199018)(5660300002)(4326008)(6916009)(8676002)(52536014)(8936002)(41300700001)(55016003)(33656002)(86362001)(38070700005)(38100700002)(122000001)(2906002)(83380400001)(478600001)(71200400001)(7696005)(186003)(9686003)(26005)(6506007)(66476007)(53546011)(66556008)(66946007)(76116006)(64756008)(66446008)(316002)(54906003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?B3ABj/egsh+wdmNkIcN4mSfIMp/UPWh6dYR/7Cn18oTfjfvPdA8MN8n/Lb9A?=
 =?us-ascii?Q?xgfpvtcdpZQBenj/RJTbtJwqy8sbouHgs2l14lt+qV7C2bdxlM+iAb27eUa6?=
 =?us-ascii?Q?aHB5IqHYXROHpCZyyHAkZimIRAb7dsDWGFYDdlxVO/SqJ1BG7AvVDHGvA8M3?=
 =?us-ascii?Q?EKKxgl7et731PeeNnw7dHaHWkcFznZJQxeZcyS0ndf3xMkj0L28LvMWhIqay?=
 =?us-ascii?Q?Iobe/F6bAQZto9KOk7/DgAa1x0AYR0nn39onAKxOq+pyiOjYkKBisIsyahQN?=
 =?us-ascii?Q?aUtFL6MwtX/4zC+goXAOnu6+14ylwWuo54lrogVJeTlXOrTzj3ClWwFI6EJi?=
 =?us-ascii?Q?tMNBNB/4K/ravX/TDK5dgQmaHihrvoRAH2PNKp1bA+5JHGlCngDV90MN06m/?=
 =?us-ascii?Q?wpEurWoPN3ZFjjWjRYTRPpdj2BW1/yBEvWJNXV/8JpksEalali3XG88A9W4K?=
 =?us-ascii?Q?w2bDBTLMqD+qkZiMxA0EE7v79b5zUXdc32zcEW32Ujn6jF3KeZQ+4c8HAGKO?=
 =?us-ascii?Q?+DSUtxaInIHJFnlA8YEYjr2Iobh03V2VHHK2bEMMQQq16QxEmkhmlHB8/qQM?=
 =?us-ascii?Q?Juewa032N++eovCcVZw1pm2nOWUqJXkhqJzmntBVGELyYhz+05S7V2qjg9oh?=
 =?us-ascii?Q?0afZz7VSLGVWDJyQxkAwtJWTurcTrdB+GyLec97jZt2SqdI+KPT2vHVkATVR?=
 =?us-ascii?Q?jRsNLayaeB7pnPp18hXmeqnUB6M1fKl/+Irk/SKlt9VdaQzven7ttp6jFUVb?=
 =?us-ascii?Q?/sxWp7s+iKWN3TqgBw25q8o4tBtal3gLAVUja+iCC0qNTnBsyrl3zbRuXn4R?=
 =?us-ascii?Q?fPrRJZbpi4L5bJpTeRTSQXTgNN+So9l0/4WrfnONHArEYmi1ccLOUbi7Bh0B?=
 =?us-ascii?Q?3P4RlUwm0Drfo1YcpBc5gGdNZTQQkP5cY340qDj9wOOVkCjM2cSgflbj6Xtg?=
 =?us-ascii?Q?XEGAaulafJAeKgr8UxmaK2Dd68e1wWLAQmHR+9WNmuUM/HKD6n7R9a7GXYR6?=
 =?us-ascii?Q?nWEiqL/CaRpeSN4SU8kAD0H/SUzpEbv5jMYfZHO6WApoLBhP1c9XOFfJMNB9?=
 =?us-ascii?Q?5wAV1QVesQkpxlByVuIKkzhodJGLlgZ/rnoaEEepMKqoa473I34EH2TxRb7+?=
 =?us-ascii?Q?eRHh0ZlBzoh6Ki3ZwHpO/Xt1bzURwMt04AlX6ZUOqPUgYpXncTom9WxTuKNZ?=
 =?us-ascii?Q?R0e8x9xLZrIPvNmPD9yoEgUOlxzvThaioxHEpa4OGVq/+3iwkM/mXp96RM4W?=
 =?us-ascii?Q?UwaQBaU+TQ5i5ofoZQ06YSbvfCUsxHjgAl3C4o+XSYL1DSO9I58CED62AXNs?=
 =?us-ascii?Q?YEsZl8P89nTPDswwW/zS3PlQ+jsY5orttq4Y9XWn9+VKicGL7TtwtXb8lt7m?=
 =?us-ascii?Q?R9jAd6Zxo8z+NicNskiD2bj0D8wqxnGWtgVcBJpgwufSON5YYUStW4CbhXoD?=
 =?us-ascii?Q?CwF1TQZvTzXSaB8owouR5NBblhXCmlQUV61P9njGRx249Inc1C4SnaRu2FrL?=
 =?us-ascii?Q?XKyGv98Y7+8ysGhZ6uvBxhW2JmpUw4QOm9kE3/JYAmOgyUWnAI2lMLWCdGeE?=
 =?us-ascii?Q?38saJeTMV0JaifU2JX8=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB7PR04MB4505.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dfdd041b-5050-418f-d3e3-08db26909847
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Mar 2023 02:37:47.4578
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 20TgdkoaDnw0BjQwQdh46EJ+wJtsfoTHPwvGnwBj8lnxsYsxJeE70nte2xnUBbsQtsdf9x5Fa2Eb741wDX6ocQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8525
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,T_SPF_PERMERROR,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Greg,

> -----Original Message-----
> From: gregkh@linuxfoundation.org <gregkh@linuxfoundation.org>
> Sent: Thursday, March 16, 2023 7:55 PM
> To: Xu Yang <xu.yang_2@nxp.com>
> Cc: Peter Chen <peter.chen@kernel.org>; linux-usb@vger.kernel.org; dl-lin=
ux-imx <linux-imx@nxp.com>; Jun Li
> <jun.li@nxp.com>
> Subject: Re: [EXT] Re: [PATCH v2 1/3] usb: chipdea: core: don't return -E=
INVAL if request role is the same with current role
>=20
> Caution: EXT Email
>=20
> On Thu, Mar 16, 2023 at 09:57:05AM +0000, Xu Yang wrote:
> > Hi Greg,
> >
> > > -----Original Message-----
> > > From: Peter Chen <peter.chen@kernel.org>
> > > Sent: Friday, February 10, 2023 4:55 PM
> > > To: Xu Yang <xu.yang_2@nxp.com>
> > > Cc: gregkh@linuxfoundation.org; linux-usb@vger.kernel.org; dl-linux-i=
mx <linux-imx@nxp.com>; Jun Li
> <jun.li@nxp.com>
> > > Subject: [EXT] Re: [PATCH v2 1/3] usb: chipdea: core: don't return -E=
INVAL if request role is the same with current role
> > >
> > > Caution: EXT Email
> > >
> > > On 22-11-30 16:12:29, Xu Yang wrote:
> > > > It should not return -EINVAL if the request role is the same with c=
urrent
> > > > role, return non-error and without do anything instead.
> > > >
> > > > Fixes: a932a8041ff9 ("usb: chipidea: core: add sysfs group")
> > > > cc: <stable@vger.kernel.org>
> > > > Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> > >
> > > Acked-by: Peter Chen <peter.chen@kernel.org>
> >
> > Could you please add these three patches to your repo?
>=20
> Can you please resend them, I don't seem to have them anymore.  Also
> split this into 2 different series, one for bugfixes-only, that needs to
> go to Linus for 6.3-final, and the others that are new features, to go
> for 6.4-rc1.

Patch 2/3 is a bugfix, but it depends on patch 1/3. I cannot simply
separate them. After I resend them, could you please let them all go
to Linus for 6.4-rc1?

Thanks,
Xu Yang

>=20
> thanks,
>=20
> greg k-h
