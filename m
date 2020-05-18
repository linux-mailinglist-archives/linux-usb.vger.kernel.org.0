Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CAAC91D6F70
	for <lists+linux-usb@lfdr.de>; Mon, 18 May 2020 05:49:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726726AbgERDt4 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 17 May 2020 23:49:56 -0400
Received: from mail-db8eur05on2061.outbound.protection.outlook.com ([40.107.20.61]:65532
        "EHLO EUR05-DB8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726675AbgERDtz (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sun, 17 May 2020 23:49:55 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CtpE7UIGkmzfNFTuL9iSiZg+fm4ooU8QumheM3EnqUylskKEBZpb1F0oqG+qil3LQ7RsWvakLWzUrTT5z5tG4tNfOjUB9PK9U/jtlgnJWihBfP0c+yWAn1GqQNu6u6xzaqpYq2EELf5ZgUF0bqz5wVlUKbZuF704evfhs2W/84iuIDpJGGyY9O7sjp6t1+RB7IuFNhalYrqSWHVkY5OGpgN2yPxNsU5c+SmOIuBCs6FrJwzZ6bESKKwReGwud5Jpbi7w1ajxUBJ3XUuewqVBocuO5NIUCHGCDp4CA/kpiirbVT0cFBXZMgXA5gIMIyueWCt4/aAW+WQocUlTm6V5GA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jJ0/JM+xrDaq4dSMI8nbBOvuZEhEm1JxJSrQpEqxZks=;
 b=H/K22L2o16dITRPllTi//vUWo7Gts3FTkJL7R0uFrCdBzSAfr31C/v4WsBgcUKxxLUF2KNbUsGXwIssn6Tc3lHOIBj+rPu6tU5+xddeQfc+AgfAWOVF1LwT2RNk4sgMpw5ctWxitkcfCYaQ07TpWdRCqJhCCVJbuXiWOmYeOTUZaSgWnTiJ7HqOKNMLFft7Ftq9BxXWtEWCo6bT6KOnmG5dbOeBGY9W1w7BCOASTfimKsCHA3HAg883iRmnBFGMNhwVaH8NhCA31YU+dbaVnBPiN/HvPsBEbZVcfkd6iBIqJmqsv0K0eBnIrmEznWHcScJXeBP9tbQuGLlNvY3kPrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jJ0/JM+xrDaq4dSMI8nbBOvuZEhEm1JxJSrQpEqxZks=;
 b=X30ms42N7w7vAnbLGtj1ngspf3wnUA9qtaSqTj92Oar1tRugqj5QCDmloZ0y9kY+CbTnR48v4FiFkgJb3/CY/jwRC+cMWmlI+QrYNMH9PvZaE3T2VL8puopTW7cwQPREyD0gZp6UPOIR6zEDsGTpbUQy6037CR/9xj6WIxvgVYQ=
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com (2603:10a6:20b:118::20)
 by AM7PR04MB6872.eurprd04.prod.outlook.com (2603:10a6:20b:106::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3000.25; Mon, 18 May
 2020 03:49:50 +0000
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::7c34:7ade:17d0:b792]) by AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::7c34:7ade:17d0:b792%9]) with mapi id 15.20.3000.034; Mon, 18 May 2020
 03:49:50 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     Felipe Balbi <balbi@kernel.org>
CC:     Peter Chen <hzpeterchen@gmail.com>,
        USB list <linux-usb@vger.kernel.org>,
        dl-linux-imx <linux-imx@nxp.com>,
        "pawell@cadence.com" <pawell@cadence.com>,
        "rogerq@ti.com" <rogerq@ti.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jun Li <jun.li@nxp.com>
Subject: Re: [PATCH 1/1] usb: cdns3: ep0: delete the redundant status stage
Thread-Topic: [PATCH 1/1] usb: cdns3: ep0: delete the redundant status stage
Thread-Index: AQHWG8utTtXaQQv5R0ONjsi6OGoclaiZK+EAgAKs4wCADSf/AIAEVoaA
Date:   Mon, 18 May 2020 03:49:50 +0000
Message-ID: <20200518035015.GB27612@b29397-desktop>
References: <20200426130751.32556-1-peter.chen@nxp.com>
 <87368ebz3d.fsf@kernel.org>
 <CAL411-q4euWFrJ5Sp+tocBEsXXYkviQXt_pz_SyHHC=ELNf_sQ@mail.gmail.com>
 <87ftc135i3.fsf@kernel.org>
In-Reply-To: <87ftc135i3.fsf@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [119.31.174.66]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 4643570c-6a3d-4f4e-0834-08d7fade8441
x-ms-traffictypediagnostic: AM7PR04MB6872:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM7PR04MB6872C489BC5730A22E1D574F8BB80@AM7PR04MB6872.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 04073E895A
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 5B3FpzYfSSobKvnqL22IRAfyJwCTgwfOKZ6d/jlnc2eB8WdR2zTvsass1k2QiRKsv4qSJwX+xDW9A+MBDoRAPjH5udsfuC+6hki3KctDgs8F6AHWo21nUt++lhegnJOzmrLzWTHJ/cdMGumXQfq3e7OWxnjSmU2QFEa8e4G3P4/JQIWXH+6n1q9nTq9nTfSZQkaG6ltJNJSjPHJgpiJ0HFBQ6y+d4hs5/rUUCSFfCe+hRCdOjnIWXePvrHWemzYTjlfyoEhV5aaTP70OVYxct1Bi2we/uW2jei+rapxs+jZsHyi59/ljupx8kwC/zHaNV6c7iAc0h34PIRKl5YKl3ez5dfdMO/b74odDYnHu425ndkzlxsWJ+PsgIoLsZGYKWE93Jeo8zWL2GL8SfANVIIprUxjmn00Jafw8DVpwaeOO1hWtJ8oo++EBGfc4vILM
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR04MB7157.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(7916004)(4636009)(396003)(346002)(366004)(136003)(376002)(39860400002)(6916009)(64756008)(66946007)(54906003)(33716001)(66556008)(66446008)(6486002)(478600001)(86362001)(5660300002)(33656002)(99936003)(9686003)(76116006)(91956017)(6512007)(53546011)(6506007)(4326008)(1076003)(66616009)(2906002)(8676002)(316002)(71200400001)(8936002)(44832011)(26005)(186003)(66476007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 5kmVMkKeLmq50KV2K9e8H6ZUnurztCr2OPS73vqrmHGAl83JXNaJHHASS6JyS8t+/G5XDho2NxGnL8Fzv7H8VDRPgUgie1VbjGawYK/TvCMikflaqGuho9SrEHKnlIp3QFSQoAKXKn/ekbeMy89hFJ0TVCbEt6V8pZoPxkNKqlZr/xHNgbfIiy5ELM4CUDyJXIz6VKMRWJmg3ze/Wj/Eu8Lw4GuRijyPrPBC7maGeDnhcJO+PmmAEI+8jtwd7Z14lZwYQeknZhUpah+Nhcs0h77nopAjiL7Inlc+9lzkjBbGgXJ+/Q9C23nPy8nu3zgvWShKTHEXb1oXPtopqZFn7vi8lDYDFFu9KasPFLqxDuDBzozK7ZNiJb8Rqefgqtxh5ETgGhw4IenbnAIsjAdtn8Bkyk32Fs/yLZzbPIMZ5OUWYNDhotfb5/JUFOhNp0Ai9Scs8Aav6r0Ay0w+ziZuy7W/mFW4ha3j2rhJppI2k5s=
Content-Type: multipart/mixed;
        boundary="_002_20200518035015GB27612b29397desktop_"
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4643570c-6a3d-4f4e-0834-08d7fade8441
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 May 2020 03:49:50.3309
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: If2ovJuRhEk8msYBnvvtQWOyABMDSEPKGpVnza1KxFUrg94ej3ohGbzqEciokqaf8O504oART92t5IzY5/GqZw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6872
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

--_002_20200518035015GB27612b29397desktop_
Content-Type: text/plain; charset="us-ascii"
Content-ID: <C978C28A1C251A47AB697B3A34E4D934@eurprd04.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable

On 20-05-15 12:35:32, Felipe Balbi wrote:
>=20
> Hi,
>=20
> Peter Chen <hzpeterchen@gmail.com> writes:
> > It seems the yesterday's reply from nxp email account is blocked by ML.
> > Send it again.
> >
> >>
> >> Peter Chen <peter.chen@nxp.com> writes:
> >> > Each setup stage will prepare status stage at cdns3_ep0_setup_phase,
> >>
> >> care to explain this a little better? The controller itself will produ=
ce
> >> the status stage?
> >>
> >
> > Unlike the other controllers, the CDNS3 does not need to prepare TD
> > for status stage,
> > it only needs to write register bits EP_CMD.REQ_CMPL to tell the
> > controller the request
> > service is completed, and the controller itself will send ACK answer
> > for the Status Stage after that.
> > The code sequence like below:
> >
> > cdns3_ep0_setup_phase -> cdns3_ep0_complete_setup ->
> >             writel((send_erdy ? EP_CMD_ERDY : 0) | EP_CMD_REQ_CMPL,
> >                    &priv_dev->regs->ep_cmd);
>=20
> got it.
>=20
> >> Usually, the way this works is that SETUP stage must be *always*
> >> prepared by the SW while STATUS stage is prepared on-demand, after we
> >> get an interrupt from the controller.
> >>
> >> Also, I see a possible bug in cdns3_ep0_setup_phase():
> >>
> >>         if (result < 0)
> >>                 cdns3_ep0_complete_setup(priv_dev, 1, 1);
> >>         else if (priv_dev->ep0_stage =3D=3D CDNS3_STATUS_STAGE)
> >>                 cdns3_ep0_complete_setup(priv_dev, 0, 1);
> >>
> >> What happens here if result is 0 but ep0_state !=3D CNDS3_STATUS_STAGE=
?
> >> Seems like you should have a "stall and restart" somewhere here as a
> >> default fallback.
> >>
> >
> > At cdns3_ep0_setup_phase, the status will be CDNS3_DATA_STAGE
> > or CDNS3_STATUS_STAGE according to if there is a data stage.
> > If there is a data stage, it will inform of controller ACKing the statu=
s
> > stage after data stage has finished, it is at: ep0.c,
> > cdns3_transfer_completed->cdns3_ep0_complete_setup
> >
> > But I don't know why it needs to send ERDY for ep0 transfer without
> > data stage, but do need for ep0 transfer with data stage. Maybe Pawel
> > could explain it. At spec, it only says below for ERDY:
>=20
> Would be good, indeed. Pawel?
>=20

Pawel seems not at ML about 2-3 months.

> >> Is this backed by documentation or is this something that just happens
> >> to work? Pawell, can you confirm that this is the correct programming
> >> model?
> >>
> >
> > No documentation, maybe Pawel could confirm with designer.
>=20
> yeah, Pawel?
>=20
> >> Is this working against USBCV? What about LeCroy's compliance suite?
> >>
> >
> > For NXP USB certification flow:
> >
> > The test mode is only used for USB2 electrical test (eg, Eye diagram),
> > The HSETT tool is used for device mode which will send command
> > from Windows PC to let device enter test mode.
> >
> > USBCV is used to test protocol level, like USB CH9, Mass Storage protoc=
ol
> > etc.
>=20
> Entering test modes is part of chapter9 tests, IIRC.

No, test mode is only used for electrical signal test, the communication
between device and host will be stopped once the controller enters test
mode.

>=20
> > For Lecroy's compliance suite, we usually use it for Link test for
> > USB3.
>=20
> You need to run the HS compliance suite ;-) USB3 devices must still
> comply with HS/FS/LS.

No HS compliance suite. Lecroy Compliance Suite are only used for
link test and PD test. I attached the test items for compliance test.


--=20

Thanks,
Peter Chen

--_002_20200518035015GB27612b29397desktop_
Content-Type: image/png; name="test items.PNG"
Content-Description: test items.PNG
Content-Disposition: attachment; filename="test items.PNG"; size=10967;
	creation-date="Mon, 18 May 2020 03:49:50 GMT";
	modification-date="Mon, 18 May 2020 03:49:50 GMT"
Content-ID: <3C0CE679E9C5D5408BBADDBD4EEEA728@eurprd04.prod.outlook.com>
Content-Transfer-Encoding: base64

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
H/4/F0qIC0RUnPwAAAAASUVORK5CYII=

--_002_20200518035015GB27612b29397desktop_--
