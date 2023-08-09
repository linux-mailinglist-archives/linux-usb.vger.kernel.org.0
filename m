Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C9CFC7750AA
	for <lists+linux-usb@lfdr.de>; Wed,  9 Aug 2023 04:06:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229832AbjHICGx (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 8 Aug 2023 22:06:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51030 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229494AbjHICGw (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 8 Aug 2023 22:06:52 -0400
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2089.outbound.protection.outlook.com [40.107.20.89])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 75A0D1BCD
        for <linux-usb@vger.kernel.org>; Tue,  8 Aug 2023 19:06:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Huckr8P5WHrE8yl4zn1BOM+Ksk+vMI/bheUv6RnYLdwc3kyZvFydNUGSCXpZ+LZs8KPtxApl+KKKZmiILq9h+VYl1ruZ/jRnI5eb7EMKCImePpKiJUb9O6NoYod67SbkdEKo2ceVmUdnV1SYymZABROfQeBU0VKZ12WtM60k0TdBqfLyjC4/meBnwaXMzUoD6ZDWC2dBeCMrjqAWatIMBX1etieUrZ6pqsyZGk9oM6oKWd44mtdj6calmL5UB98GRDyRMZNcaHVv1eJjeLDOODtwHlAgq26vh9/L6XZo+eS/vOBDOsBW+66BxxhvMFcTqH/q+ckxH8psarkZchsFlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hork2vI9lNs5N03+nHJDYRwEfho1qeLoyGwkgwI2o+8=;
 b=BwnXNYntpKgnEgmEo8h8TjqLoB3Euuo78SWW2Z5x3ShI15QHv6QQPCmQ7D4/BOSNx3xltRnl0k1v7FgDpceI+cDlJR4CiqoHTQCjZcpXQcFvaF9fCRZhj0X+uvnswmCHhKptrRpVDgLMx+fZCdDUefCjxIj//PN7EBJcxZkAkv5ljVx3XLS9ZD86LoYTrCieKtAdu/AxA1iF0dYCmdyfcGgzVJl/fdYn+Tpnie6Ees3npo2SOrFyHoGzCwRlfD4TPtNtz27VrSVXYpcIl2i5GLshblF7rRO2VpxHuqkpoG5lAsiIVzp6ZH2/zzipPsEpl9OrrrzRBGwVGTSV3kO6SA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hork2vI9lNs5N03+nHJDYRwEfho1qeLoyGwkgwI2o+8=;
 b=jjEvIjr6ivgCl8NDm13ZFAzyfiwNv27PYHmfTr4lw9/W9UnmDIeMFOmDJiuHXn4jnf0v0qGnpoBh+xhE7lwhE86MrZ2TSe3nSIM51G7mTspvCn7jnp3lmalMLT8IqAoez4WaMVVerCd39xdKzacw3rwv+2q9e1s1Q4LFMzTqKrQ=
Received: from DB7PR04MB4505.eurprd04.prod.outlook.com (2603:10a6:5:39::26) by
 DU0PR04MB9587.eurprd04.prod.outlook.com (2603:10a6:10:317::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6652.27; Wed, 9 Aug 2023 02:06:49 +0000
Received: from DB7PR04MB4505.eurprd04.prod.outlook.com
 ([fe80::85e5:acf6:574d:a2a1]) by DB7PR04MB4505.eurprd04.prod.outlook.com
 ([fe80::85e5:acf6:574d:a2a1%4]) with mapi id 15.20.6652.028; Wed, 9 Aug 2023
 02:06:49 +0000
From:   Xu Yang <xu.yang_2@nxp.com>
To:     Alan Stern <stern@rowland.harvard.edu>
CC:     "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Jun Li <jun.li@nxp.com>
Subject: RE: [EXT] Re: [PATCH 2/2] usb: ehci: unlink itd/sitds from hardware
 list if the controller has stopped periodic schedule
Thread-Topic: [EXT] Re: [PATCH 2/2] usb: ehci: unlink itd/sitds from hardware
 list if the controller has stopped periodic schedule
Thread-Index: AQHZuWobPyY9hy475kOcvOyONwwurK+/nFYAgBC7uaCAAI4JAIAPXlUggABeawCAALZhgA==
Date:   Wed, 9 Aug 2023 02:06:49 +0000
Message-ID: <DB7PR04MB4505D3FA85E0D9D2F64065208C12A@DB7PR04MB4505.eurprd04.prod.outlook.com>
References: <20230718112600.3969141-1-xu.yang_2@nxp.com>
 <20230718112600.3969141-2-xu.yang_2@nxp.com>
 <52e62d2e-a82a-4c9f-86ce-3ddad3efffb5@rowland.harvard.edu>
 <DB7PR04MB4505A7CDE9FC53EFEFD3D9F58C07A@DB7PR04MB4505.eurprd04.prod.outlook.com>
 <fbd403ba-b6aa-47f3-a361-b122a028334e@rowland.harvard.edu>
 <DB7PR04MB45059312D4FB6ED356E0A7958C0DA@DB7PR04MB4505.eurprd04.prod.outlook.com>
 <1d06506b-e610-4aba-8449-8be87c3bd5f6@rowland.harvard.edu>
In-Reply-To: <1d06506b-e610-4aba-8449-8be87c3bd5f6@rowland.harvard.edu>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB7PR04MB4505:EE_|DU0PR04MB9587:EE_
x-ms-office365-filtering-correlation-id: fe1ab5fb-96b5-4746-c3a3-08db987d4aad
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: WAyshMwf1bqQCP2BGa+Iqf1TvavfKtGhDMvNGsTjYj4saBxqCzgGKxLrK+jnHp0XraO3v2IayMaMhH7krp9Ol5n0+6SQ4/Nvtip7UpmzZLMIdpR9/1OZQIGq5jzka065Om5BN4SFIZdbq4pMPFN6sAa8x50umrvxVm+WwPkzXBEw+zEG+wAx2W+gTYIzfQx+8SGfxF1ni+KfSeRUr2JAn0qoN4RN9/QsHaOe5uNfkzdBCVXBmf7V7rgxgWWsK0nn7qi0ookote/LTBqKhoKl9YGXWsxAqEkk9sc6C9W3GJHrZSbpkTuZFJsZFnOIv0xDOqmPq9tLH9/XISCk9qFi8qRzdpvGHjUOKLfYeOmGrI56o7O8g6j1XKNxIkEPu/pyUXW2J2W7JO2r8e5bxssKQmTDRGW0/9bhp7tciNkZER8kFXOgrMWOfYK8gY8atXKteu8BiPj1A8jj30EfAPW1WXlBqg6g5R7XKKsrm6poRltz9EZ1wQRkY9bIWf2r6sJcvbBxlHd64CHMWrurbpJK94NrHYlGKu0Zm/Z/PB0kCnv2u04T5pqAJ2UJMBFxrOnvHOxeOMxWQy+87+ftobgZcch+2aseqUhxeTLT6HPY821iO3GzO2CIe+chd5ovJ5mD
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR04MB4505.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(396003)(346002)(136003)(39860400002)(366004)(451199021)(1800799006)(186006)(2906002)(55016003)(83380400001)(41300700001)(5660300002)(8676002)(8936002)(38070700005)(33656002)(86362001)(7696005)(52536014)(9686003)(122000001)(478600001)(38100700002)(54906003)(71200400001)(316002)(4326008)(66476007)(6506007)(64756008)(66946007)(26005)(6916009)(76116006)(66556008)(66446008);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?P66Mzq74abELwu4afrgjXk2jHyjOEcP9z/C7eDg1sD2GTex9BOtLW6I1DPsL?=
 =?us-ascii?Q?qRrCPmeTZyNM0iXqKbCvAnm2Q62IrFe4UwEmywzI9xEZdtWdirzhl7qrjkhA?=
 =?us-ascii?Q?VOSNOACfxMZJWkHJnzkXdGqkbKnisT3r/cgn/A4WcPbwVHjNNVzLe9uJQvl4?=
 =?us-ascii?Q?J76LuKL//ACo6UFwaM6L92JL1LLcfsQBMEkKKjcqnV5dXHh+8q7FsijMWVzQ?=
 =?us-ascii?Q?rBI7TbBvT2TGR1aZDhwxqKmYEeLoddtI0JvUhNpyMEMc0Auf0nw2yxPWv5uX?=
 =?us-ascii?Q?H8vpwGd+HM1IlbQWcch3/MJ0ZMaDAVFQN7sZ+pHgxaCDUMpgr4AvHznyRRLT?=
 =?us-ascii?Q?48w6bUODQO8Z4OtM9VpX2Q6ArQKxQx8qFRE7Z7FW45TcFDQXTbh5+g3B/uqq?=
 =?us-ascii?Q?doKQEkc1gPkE2bBA2OGCsLbmsu/8PAzQRDNKuGVIk+E/PNMi/WS005GunR2S?=
 =?us-ascii?Q?I3pNBB2dDQoDPbgjtKOGrQg7m9Ir6wCmjlWGiXreJx5za3Fn+Kaq5U7/3F9D?=
 =?us-ascii?Q?7HzoAeVhykpFYxDNptQDYPsboRd9sU97bS/VhXs5KGeBP9v6lTXMEfrPWTqP?=
 =?us-ascii?Q?PRMc8bRIEMJ35euNLsR1uKl2WQCGvSMYJCevure6YCmr7KqpOmZhdDThp5Ce?=
 =?us-ascii?Q?mYSupDrF9G15ffufcIwrUndJsTY8iqFjNdr8zq2dE8oE2SDVoEHdUH44Li2L?=
 =?us-ascii?Q?FaqdNccZPg52+/aZHolYomZxbHp1miC4vQriwq1ka/Txf0gISGSektk97G9k?=
 =?us-ascii?Q?YdLUMYuHj2XnaJKd/vAdo3wswaWeGCyYXifpcLZwANTdFY1uqPobte8UmnF8?=
 =?us-ascii?Q?SPLG3A5kP9hPSjJlGACNHbgm0q5D2+lXot7uCBhTVwCazakHGug3m2N6FAJv?=
 =?us-ascii?Q?jQ39FwClI80XADPay3jG88FX3p7FdQEfRODOm7IeoHUvRuSN9FEl3SDEDy6/?=
 =?us-ascii?Q?1vcmr4Hvkcc6VvW+iJPFlgkKJ32FZv26UR7HIzlyViyAAfEodHrgNq7wwWHr?=
 =?us-ascii?Q?CYEVW/aUpiHFjjn60EaJznk0o0NVkwsIRUuweAYHGwKG2JP/VK24/nlcG5Yh?=
 =?us-ascii?Q?cvKC6WBtjJ2ZkTNhDeg03j+VmJPnITlPNYo3hMIzcrr1/2+3UwrSL7iVWirU?=
 =?us-ascii?Q?+zZtHtqEtExp/JSvWHW/VcpEew5Rrf9SaGabl2bTzpy7mSspqq7ZBLrLhwOm?=
 =?us-ascii?Q?2D5YQIpiibmi9xaw5R3Z2dlkeMO3hns5CkbNFzIYFS46FHYz4O4qU6IiZvfV?=
 =?us-ascii?Q?RiFEfFAQXPtqsr8EKVJs/ME5atf1yrM8ukSO528oM6bH4hiP2CGEByDo4Yfu?=
 =?us-ascii?Q?zUMY1Oo+HV5yTiRs7tRzJyZqtcOlYk+YpjWf2y0Z2BLnewDk65xoGGDYTrmq?=
 =?us-ascii?Q?3oBLId61PKMkszFbB3U7xsD7VTf4sAuydup/yu9U/Iz5j/uJO/0nqx9TjwFc?=
 =?us-ascii?Q?q9VY5dM0MNMxDJA/aIdQf7/e9CIfdyHZ5dSzBfLN1Y0Vz6fkIcjHZQ2UbOJG?=
 =?us-ascii?Q?iqCdMscRsaWG46Hk/qIogpBzBfQ4pVmjaRMG594pnass+Kpz6nw7QWbwzQjr?=
 =?us-ascii?Q?ArwI4fG3x1pq6awNXGw=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB7PR04MB4505.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fe1ab5fb-96b5-4746-c3a3-08db987d4aad
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Aug 2023 02:06:49.4032
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2/RiLVMSBBwqO3jg+zEWzKYbHBGo9B+nW9dAmwNO+lnMhG0L7oaGeszoGPgnIrvy7lwSVpqw607HvbB72MkocQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR04MB9587
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Alan,

> On Tue, Aug 08, 2023 at 10:03:39AM +0000, Xu Yang wrote:
> > Hi Alan,
> >
> > > On Sat, Jul 29, 2023 at 06:55:07AM +0000, Xu Yang wrote:
> > > > Many thanks for your comments and suggestions.
> > > >
> > > > Yes, there is a "live" variable in scan_isoc() to handle the case w=
here
> > > > root hub has stopped periodic schedule. I have rechecked the root c=
ause
> > > > of the issue , that is the USB controller has disabled the port (PE=
 cleared)
> > > > and asserted USBERRINT when frame babble is detected, but PEC is no=
t
> > > > asserted. Therefore, the SW didn't aware that port has been disable=
d.
> > > > The periodic schedule keeps running at this moment. Then the SW kee=
ps
> > > > sending packets to this port, but all of the transfers will fail. B=
ut periodic
> > > > schedule will also be disabled after a period of time. Finally, all=
 of the linked
> > > > itds are penging there. The code can't enter into scan_isoc() if on=
ly USBERRINT
> > > > is asserted.
> > >
> > > That's not true.  The io_watchdog timer continues to fire periodicall=
y
> > > (at 100 ms intervals) as long as isoc_count > 0.  The timer's handler=
 is
> > > ehci_work(), which calls scan_isoc() if isoc_count > 0.
> >
> > Yes, the io_watchdog timer will cleanup the isoc periodically as long a=
s
> > isoc_count > 0.
> >
> > I did see all of the linked itds are pending there in my case at the en=
d. After my
> > debug, I found the chipidea/host.c had set ehci->need_io_watchdog to 0 =
which
> > will have impact on turn_on_io_watchdog().
> >
> > The host has enabled 1 intr endpoint and 2 isoc endpoints from USB came=
ra.
> > Therefore, ehci->intr_count is always 1 and ehci->isoc_count is changin=
g from
> > time to time during camera is running. When PE is cleared by HW, isoc_c=
ount
> > may be decreased to 0 after scan_isoc(). When turn_on_io_watchdog() is =
called,
> > EHCI_HRTIMER_IO_WATCHDOG event will not be enabled due to isoc_count=3D=
0
> > and need_io_watchdog=3D0 too. When isoc urb is submited again, enable_p=
eriodic()
> > will still not enable EHCI_HRTIMER_IO_WATCHDOG event due to periodic_co=
unt>0.
>=20
> Ooh, that's a bug.  enable_periodic() should call turn_on_io_watchdog()
> no matter what value periodic_count has.  Would you like to fix it?

Sure. Will try to fix it.

Thanks,
Xu Yang

>=20
> Alan Stern
