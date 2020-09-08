Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 470AE260DA1
	for <lists+linux-usb@lfdr.de>; Tue,  8 Sep 2020 10:35:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730055AbgIHIfB (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 8 Sep 2020 04:35:01 -0400
Received: from mail-eopbgr150077.outbound.protection.outlook.com ([40.107.15.77]:56304
        "EHLO EUR01-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1730045AbgIHIew (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 8 Sep 2020 04:34:52 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W1iC+fTibp037uof4P+owvmTG8/FpZJJVL0ymgbuWxSDVfSWgxvIsxIWD/0Pymmu8hsWXY0xpm2kV5ToFWoIL/cYycD9/suEDD2Ua3NMV5wODz/PjrZ3GQgnl3/2gonr1q37605C3j/rGt7rE/rbuMbm3JdG3I3IeasrwW6a4Jju5664LURj4fkOkpyg2FqMSj2txt2VxQI1PxUv1I5gRWwwLr5w4OCLRHiuLIFs8mtlw7dLV+IugLTN0lDlH6Zn+/dotmGhTcfDAwJ442iuWr4Z3DN69QZHstClP9+fJAxBgJFu9GSy3ZG29ud4r8SFSSx5PkwbhauavhgbN4bTgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XZXSwB9D0s3R/itGoaCpJAHC26ZFjFLd8Q4LkUuR7Ck=;
 b=Weym7ROTkuusU6e7XKheI28cDlVDWXsS8lQTxi9P0uy80uaPiC9oqsbh4Z3flfWLSGISzvmVmnBdh/SGnkr5BiuduQgz5+G7qxBbSV2k2fxogCHXD3anGfVWVpMwoGZ7+nfDdkdwBLdcppUC/yF5GAagy8qSFdxY12hU42bHfiezeGo113+Wezb3LUTJem1S3bEenYRYEtWqIV/ZATXV/M8PKjfJdbE+AQWD/GYxc4no93/nBji6XeN3SSJ9pAneXjxQLxZ11yXXV9IWPzSMzDE2UC66G25vuDqN8/bE/iz5HPCHpKNTMp0Uq2uH0AGuWAiYQeapDea5sSj5bnX+Tg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XZXSwB9D0s3R/itGoaCpJAHC26ZFjFLd8Q4LkUuR7Ck=;
 b=Vj/Pf6ll41XIMEXKgJOwHlaSnDmIDiyomoPPV+T4RwxBOp370BNHDo9+6/jYIfXSqc/wWZHYsucZf1DJ/YkjyqBGiUp2UWCk+j8DO+5in07H6FfY1LdSJQaCJUFjmf3pTTZXIjOTRg9CNhejt1WXR/gCgRS7+Ryn+oCLYLjS/7c=
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com (2603:10a6:20b:118::20)
 by AM6PR04MB6152.eurprd04.prod.outlook.com (2603:10a6:20b:b9::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3370.16; Tue, 8 Sep
 2020 08:34:48 +0000
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::1023:be8d:40c:efe1]) by AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::1023:be8d:40c:efe1%3]) with mapi id 15.20.3348.019; Tue, 8 Sep 2020
 08:34:48 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     Felipe Balbi <balbi@kernel.org>
CC:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        dl-linux-imx <linux-imx@nxp.com>,
        "pawell@cadence.com" <pawell@cadence.com>,
        "rogerq@ti.com" <rogerq@ti.com>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        Jun Li <jun.li@nxp.com>
Subject: Re: [PATCH 5/8] usb: cdns3: gadget: handle sg list use case at
 completion correctly
Thread-Topic: [PATCH 5/8] usb: cdns3: gadget: handle sg list use case at
 completion correctly
Thread-Index: AQHWgDxDB58nIRxd40yfTFLDkPKoTqleUUeAgAAj8QA=
Date:   Tue, 8 Sep 2020 08:34:48 +0000
Message-ID: <20200908083420.GE17366@b29397-desktop>
References: <20200901084454.28649-1-peter.chen@nxp.com>
 <20200901084454.28649-6-peter.chen@nxp.com> <87a6y0n5sq.fsf@kernel.org>
In-Reply-To: <87a6y0n5sq.fsf@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [119.31.174.67]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 1e30afe9-26c8-4ad0-1d4e-08d853d20c01
x-ms-traffictypediagnostic: AM6PR04MB6152:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM6PR04MB6152B0FD73F1A4A730E072EF8B290@AM6PR04MB6152.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: KyYn2XKaIb95tcuO5TU1J+1QCsLFIZgy1APFs1dwLp3I1VrGTYMQGLfIF8zPnm0JuqrOAaT0u9lWqdUYhnkyWgfOvz7bgebb1qkgr8l1x24qcCLjZgW0xtRlv7U8kiIst+3jYNtZftQR25RZfpj4LdNPEwqvCv073bJwUCndO2mcwZO9QjzoMylLHwlKoTBr5YVp+k2DsCNYsdTB7uJTrt+3TX3SA4+yeDcOuc0kwkEAVDMpSntrqXpSK8xDj1DXMKK00slZDdTRl3rAR5Yte2wl4L6IjUSYNHfLRP+/pymWnDxWkaQl+bSQxCmQxW61EfeAt/g/sg7OS+g7tb4E6A==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR04MB7157.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(136003)(366004)(376002)(39860400002)(396003)(346002)(33656002)(44832011)(66556008)(478600001)(83380400001)(4326008)(2906002)(33716001)(186003)(9686003)(6512007)(8936002)(1076003)(26005)(54906003)(8676002)(66476007)(5660300002)(86362001)(71200400001)(6506007)(66946007)(76116006)(91956017)(64756008)(66446008)(6486002)(316002)(53546011)(6916009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: R1NlDN6jRW5TrwVVxatibMtJeLAV6O3OizM0J3jAQ0s42cCwlgjuOrg/DNwHlBW/evSu8hYwWobFMOWT6r8sHln/l0E6jdxJSZPmkyg09whdrHTFBotv0HC0gKaVWElXGG7z9ONSsI4AzdxJeSpt85los6OLzbFIu3eqZaDf7NtNww+F9o+ZeTP6AE36HLPvIv+tgeEDPOJsUz+dnBazzkPrCspxVcd27+AmXiO+MS10UbYXvUgZYAaL0jNlQ7aSOV6bpgsE7f+cKLC0N99M8eFLsBTrfdUIeD66YsNUqRDook6x6Q+TAFW3H2nItfFM03HdMqmgq14PdEcpxfqK5Sf8aiaCA8kdRro5TbtBw9Pun6nmYZu3Qwt9Rw52PTyLtE0hW6l+k2Oh/hcGDhM+4YTNR2HvRUedjjuXOuQi0NlOVydxyxfAC07OMesk/Uo5z+EBd0ePTiM7nVMSLkZlDIJ2a8TVgoT/axdqA/NbJRwzZ/wdhq+0F0yTfQ3bSmoUnzf1wr9TkfSSvexOuoBkn6/kd9UF1S3nnAMBKRbO8OvQn/9Ed1L4Jmoad1ms/Q4MG8F/OwWRXSZiXwa3IAaWI8wZv94cTGdRt8k/bWCNsaDJlrUAu+NyNOuTlUCdpe5J+000wHFlPeMtBJL3qDhKbQ==
Content-Type: text/plain; charset="us-ascii"
Content-ID: <2D31AB4010E6E042B4BCF6AF0D7148BC@eurprd04.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7157.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e30afe9-26c8-4ad0-1d4e-08d853d20c01
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Sep 2020 08:34:48.1268
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Y7vIvXcVzr8dpJD2PVagkp+sGHh7y8NK375eY6NP1Nqvbbfsxnbuz0E5SFO12X9FvaC/RYByWlG/Ho++U8I04g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB6152
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 20-09-08 09:25:41, Felipe Balbi wrote:
> Peter Chen <peter.chen@nxp.com> writes:
>=20
> > - Judge each TRB has been handled at cdns3_trb_handled, since
> > the DMA pointer may be at the middle of the TD, we can't consider
> > this TD has finished at that time.
> > - Calcuate req->actual according to finished TRBs.
>     ^^^^^^^^
>     calculate
>=20
> > - Handle short transfer for sg list use case correctly. When the
> > short transfer occurs, we check OUT_SMM at TRB to see if it is
> > the last TRB.
>=20
> it looks like each of these should be split to its own patch.

When I debug sg use case, it indeed took several patches for all
functions work, and some patches improved the old patches since
some short transfers use case did not be considered well.

Using this patch, it could let the completion work for both normal
transfer and short transfer. So I prefer keeping one patch.

> > + * Then, we check if cycle bit for index priv_ep->dequeue
> > + * is correct.
> >   *
> >   * some rules:
> > - * 1. priv_ep->dequeue never exceed current_index.
> > + * 1. priv_ep->dequeue never equals to current_index.
> >   * 2  priv_ep->enqueue never exceed priv_ep->dequeue
> >   * 3. exception: priv_ep->enqueue =3D=3D priv_ep->dequeue
> >   *    and priv_ep->free_trbs is zero.
> >   *    This case indicate that TR is full.
> >   *
> > - * Then We can split recognition into two parts:
> > + * At below two cases, the request have been handled.
> >   * Case 1 - priv_ep->dequeue < current_index
> >   *      SR ... EQ ... DQ ... CI ... ER
> >   *      SR ... DQ ... CI ... EQ ... ER
> >   *
> > - *      Request has been handled by DMA if ST and ET is between DQ and=
 CI.
> > - *
> >   * Case 2 - priv_ep->dequeue > current_index
> > - * This situation take place when CI go through the LINK TRB at the en=
d of
> > + * This situation takes place when CI go through the LINK TRB at the e=
nd of
>=20
> not part of $subject
>=20

I will make another patch for comment improvement, thanks.

--=20

Thanks,
Peter Chen=
