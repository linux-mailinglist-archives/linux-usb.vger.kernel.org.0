Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9D80A2D70C8
	for <lists+linux-usb@lfdr.de>; Fri, 11 Dec 2020 08:24:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404420AbgLKHXc (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 11 Dec 2020 02:23:32 -0500
Received: from mail-eopbgr80072.outbound.protection.outlook.com ([40.107.8.72]:2081
        "EHLO EUR04-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2391921AbgLKHXV (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 11 Dec 2020 02:23:21 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CFfD+957QDxwqHNrKXnYKsdCy6tX8YDVGyWlK0Es31ga79CdmjW4PaoQTffY0faWZKsjnRL0kL1mdaYVsKXKVWgnIVqfsDP3samyPNHjNeH6jGobEgF5FP4EKeRE39Dmmfwz7IGT+KCrNsv3rJt1UXwl6XuZK7sf1HrBH1N6pPrRdPaLcZROBRN4gez8NMBR6JlZ9CT7Q80FJ9fIKWGjNBf6tWqm+wfKLqhBGiW3vT9PrHxCcKJgCvETNhPrgfHWugxZPeQbR8DGP8f36gvkbHKr7SK2t8h4KaUe0UxKpdUgXDtl+QnQqC2PDfhqOJ6wAhiPJC3RRXp89mGiN4NlQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oT+NoEFMIcE5uvUbC1DAcHGKhI2M8li7K4rgMJ+6fDg=;
 b=bI/sLCfO02q5kDdY9tTYtLyI/GIdHiRMuZYOYUbUH2SFDtNvt1WJElGeKVdPVWGLxh0OjP5bnO7PrSCSf5a+YAbvycU8lXvLOoCq2diOMIO2guarlK8pLKNRQ2+qBACk3no2Hc4qmeBxkPtI3spD5qzeXc0HAf3j87thkovdIOEouwgr4UFVWfOsq90Tt3JaM8lxP1odPguEdTAndXj0ABCfALOMfPpNrF+rTMjlquF/gKDNT+LC4/GYEbv6BsXgAq66olkkIgxUKFGZHlSgqZkB60A5qGOvZUmU4OrEnAJMlpio1mHPlA4KXMu4FovsAcnfUH3RBz3HQJO30GSYAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oT+NoEFMIcE5uvUbC1DAcHGKhI2M8li7K4rgMJ+6fDg=;
 b=ifS8Psyye5yDobienMqtl1ZC0qcCVTMheEQ9sG3NeWO93gGW+E+lv7HqZ3Rh8A4ogmv/WIlPJQdxdsRQJJIzSs8Gsxz8V39U0xD3wU5+EJ94USsriOi/piRHA+LDKHfQFQD4nWeDYilYX/U0/RCOYf9bRMDnHuAigwd/u8d2xCQ=
Received: from DBBPR04MB7979.eurprd04.prod.outlook.com (2603:10a6:10:1ec::9)
 by DB3PR0402MB3914.eurprd04.prod.outlook.com (2603:10a6:8:f::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.23; Fri, 11 Dec
 2020 07:22:28 +0000
Received: from DBBPR04MB7979.eurprd04.prod.outlook.com
 ([fe80::c8c:888f:3e0c:8d5c]) by DBBPR04MB7979.eurprd04.prod.outlook.com
 ([fe80::c8c:888f:3e0c:8d5c%5]) with mapi id 15.20.3632.023; Fri, 11 Dec 2020
 07:22:28 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     Ruslan Bilovol <ruslan.bilovol@gmail.com>
CC:     Glenn Schmottlach <gschmottlach@gmail.com>,
        "balbi@kernel.org" <balbi@kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: [PATCH 0/3] UAC2 Gadget: feedback endpoint support
Thread-Topic: [PATCH 0/3] UAC2 Gadget: feedback endpoint support
Thread-Index: AQHWtWS1eBj0g+rqvUaS5l3jJzoDC6nCr5OAgAJ6iICAARA/AIAObLIAgASwk4CABPlXgIAEml8AgAGYLYCAAMpmAIALL98AgAE0DgA=
Date:   Fri, 11 Dec 2020 07:22:28 +0000
Message-ID: <20201211072158.GB490@b29397-desktop>
References: <20201111092941.GJ14896@b29397-desktop>
 <CAB=otbSAGhDYxim9_fsyH4pZCLqgq+bxNJfv5hXqgQRVngVaig@mail.gmail.com>
 <CAMS2kBF5Gvhnf7AzdeSFeVeWBLhtHM_hHfTvMLTN-3Jkh=BwHw@mail.gmail.com>
 <CAB=otbTK0j03HjiLS-tqqaBTuavaFEJs49hpKPj2Df8e1_WN+A@mail.gmail.com>
 <CAMS2kBEnUDi5jKiNu5ZKihyucCikfoGor4n7=e+xX=7WU_rrog@mail.gmail.com>
 <CAB=otbRrLjeTjhBGtMqpeWeYZB9v62SDjSWzRk8uGQE3Ld8T2A@mail.gmail.com>
 <CAMS2kBGRrozHQj9wfLmcQMSCb8On+5HcSF=8PsUJAtqXz2QG1w@mail.gmail.com>
 <CAMS2kBGcDu-02dboEwxygMDE1r1c9Q3Lzrw6TcsoKEMvOzLmDQ@mail.gmail.com>
 <20201203100912.GA2881@b29397-desktop>
 <CAB=otbSHvP3CXUFK_iAjgsDoWPeKxLjumUnELMf1jiAw6ZCY0g@mail.gmail.com>
In-Reply-To: <CAB=otbSHvP3CXUFK_iAjgsDoWPeKxLjumUnELMf1jiAw6ZCY0g@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
user-agent: Mutt/1.9.4 (2018-02-28)
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [119.31.174.67]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 30a96ad6-6d04-45e6-0223-08d89da58449
x-ms-traffictypediagnostic: DB3PR0402MB3914:
x-microsoft-antispam-prvs: <DB3PR0402MB3914F6CDA5DAE1EA3BC4DCF08BCA0@DB3PR0402MB3914.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: QIWXb56uIYJcRa5npgiXCJiOXFRicsdkrfe7wjWa0VodvQfKP3Vh5/8iM1jR5zWVRNWggnag+b49uF3/wGSpTumJn+HFxS0gIcwyXsUiyhZKng2vJDDUzw8RL0MYW0zKqA5sd9reGBQOUsxSAaVSgYA1/5POEWeJ/xO5R5pqqBo89JWCrxG0VteqqhrgS2qZfffqSz/3mUOABI7t22DiW/apAKzd5TcnT9JzwRnhmED2DDfBi91FzmIKU+40lzEHatvDgxOMZxKMXgu2jdHpA94m6XU6GARXIOMzxvj4XkModyD0ymBZlXlIhQdSuCfuIAHuPnHoAeu98YpvDt9brpb6Y/GHdpBPksoYR+9TJ3VQWMLxWiWDxdSEwjJ8dOZl6uTo3NE5TtO7ML3RihzddA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR04MB7979.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(376002)(346002)(366004)(39850400004)(136003)(396003)(6506007)(5660300002)(6486002)(1076003)(8936002)(44832011)(9686003)(91956017)(6512007)(66946007)(316002)(53546011)(66556008)(66616009)(76116006)(54906003)(6916009)(86362001)(478600001)(64756008)(33656002)(66476007)(83380400001)(45080400002)(33716001)(2906002)(66446008)(26005)(4326008)(186003)(8676002)(99936003)(71200400001)(966005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?4o7pRFlRrUaWpoTau/2rSqKOhon8dsA0Fa80eVceam6GorfYbNtAiVFKCVPf?=
 =?us-ascii?Q?qgJgH28WqcHu7Zpa/j9xxklnAGgXRf2dtyX0zUw+JHvvV/Ir81x/lgBlBYkJ?=
 =?us-ascii?Q?OEBQBSrzYObmPtmySiaQiWmsgemDAGV+nK62o2DudjDlIHYk5JEQr9V8V5qv?=
 =?us-ascii?Q?wVCJWuahXelnH7Gtovav+dX76PAsbnn0qutYzQIkWORpr4mEALYfpf2mXK4o?=
 =?us-ascii?Q?G2aH8tTFxm8YZfaCEUIdYDKXkmfa8KXTHHHA6gVyINYVx0sUudN5eJJYN2EN?=
 =?us-ascii?Q?R3w0P/kN921X7PZXk355Rd/MF7BAIAa1pgzNqVzajKrXoaAIenZoLglahgFa?=
 =?us-ascii?Q?MQoouFL5dpsQc4hGHsm15mkoVbao2Npua8fBtbAkylMTyaif4ROAQQZBThLp?=
 =?us-ascii?Q?rHUODIE9pgtAN9Xm1ix0Hj0nPuhLZ///XZ2CKzIwEgOtPDSjzB8YjnIpg3A4?=
 =?us-ascii?Q?EY523qMgvngpBkJKqXd4jV+boo2F91g7/djfE9flfnrWy+GdBkZ5lBVfybbF?=
 =?us-ascii?Q?h2mzm250J7p7IHbj2fYQ1W6Tb6uzkDeOz+m7FpFGc+wMKIrJOeMmsM4YA53U?=
 =?us-ascii?Q?J30jCOeBVTEHkrC2U7a94kyTMUD0MPqUamPDufYEYMHzzM9htmmQleTdBI/F?=
 =?us-ascii?Q?ycTAHG0XO/Ff1vc6hfd5cCmD75d2v9N4SE9k2w5XivUuSiQZKqNkKwNTnG0U?=
 =?us-ascii?Q?L2R5/PR+3pYk+FJ3/jUELC+UMEy21pb9aGKA5RoGaW7O32rgLl9uOUNfwIYR?=
 =?us-ascii?Q?f4fXlENg2+wXv+J3oc9Ivi39hrGLE/JIg6Mr5BSME3rvD/5PCUIJvu9PyBeX?=
 =?us-ascii?Q?S6imEPzBjR+vadO0llad9ltDVd0H6KSn6QOUewUsnMH8tuyKTfX6hkHxRAgD?=
 =?us-ascii?Q?9DYcmI3gsMor5gyJ/xLnttfN52mS9P1albfLZifVtXdT1fNQK9MtLnEH5kOc?=
 =?us-ascii?Q?C0YDRLIBs4HSmY2xTxiTqaQ+ha6j16HhdGdCUwYSEURz3XMTqLEM3p8PaEaK?=
 =?us-ascii?Q?PiSV?=
x-ms-exchange-transport-forked: True
Content-Type: multipart/mixed;
        boundary="_002_20201211072158GB490b29397desktop_"
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DBBPR04MB7979.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 30a96ad6-6d04-45e6-0223-08d89da58449
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Dec 2020 07:22:28.6312
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +n92oXhrXi8NYVOBjygFBNj9/7sdz5fTc+Mb5PxHHcHSvrIOf/BB/XUuf7tOXwQBL24QiOYEDay+sVL1wQEAgQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR0402MB3914
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

--_002_20201211072158GB490b29397desktop_
Content-Type: text/plain; charset="us-ascii"
Content-ID: <74C9617E0794474F971A15F81BF8050A@eurprd04.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable

On 20-12-10 14:59:24, Ruslan Bilovol wrote:
> On Thu, Dec 3, 2020 at 12:09 PM Peter Chen <peter.chen@nxp.com> wrote:
> >
> > On 20-12-02 17:04:47, Glenn Schmottlach wrote:
> > > On Tue, Dec 1, 2020 at 4:43 PM Glenn Schmottlach <gschmottlach@gmail.=
com> wrote:
> > > > Hi Ruslan -
> > > >
> > > > Thanks for the feedback but unfortunately I've experienced mixed
> > > > results with the gadget UAC2 driver on both Windows/Linux. Let me
> > > > describe my environment. My host platform is either a Linux Ubuntu
> > > > 18.04 or Windows 10 laptop while the target environment is a
> > > > BeagleBone Black (Linux beaglebone 5.4.74-g9574bba32a #1 PREEMPT). =
I'm
> > > > testing two different scenarios:
> > > >
> > > > Scenario #1:
> > > > BeagleBone Black (BBB) runs speaker-test generating a single channe=
l
> > > > (S32_LE) audio stream containing a 1KHz tone with a 48K sample rate=
,
> > > > e.g.
> > > >
> > > > > speaker-test -D hw:1,0 -r 48000 -c 1 -f 1000 -F S32_LE -t sine
> > > >
> > > > The host laptop is running Audacity and recording the tone over the
> > > > UAC2 adapter. On the Linux host the capture is correct and the tone=
 is
> > > > bit-perfect. On the Windows 10 the capture contains numerous missin=
g
> > > > samples which translates into a lot of audible pops and clicks.
> > > >
> > > > Scenario #2:
> > > > The Linux/Windows host plays a single channel, 48K, S32_LE 1K sine
> > > > tone to the target using either Audacity (on Windows) or 'aplay' (o=
n
> > > > Linux), e.g.
> > > >
> > > > > aplay -D hw:4,0 -c 1  -r 48000 -t wav  tone_1k.wav  (Linux)
> > > >
> > > > On the BBB target I use 'arecord' to record the tone to a RAM disk =
and
> > > > then copy the recorded file back to the host where I can verify the
> > > > quality of the recording. In both instances (e.g. using either Wind=
ows
> > > > or Linux for playback) the recording on the target results in a
> > > > captured file with missing samples and audible pops/clicks. In this
> > > > scenario the UAC2 gadget is configured with c_sync =3D=3D asynchron=
ous. I
> > > > wouldn't expect things to improve with c_sync =3D=3D adaptive since=
 you
> > > > mentioned in your patch that it always reports back the nominal
> > > > frequency to the host from the feedback endpoint.
> > > >
> > > > Do you have any suggestions that might explain (the above) behavior=
.
> > > > Can you describe your test environment in more detail so that I can
> > > > perhaps re-create it? What Linux target are you using with your tes=
ts?
> > > > You mentioned you tested an 8x8 playback/capture scenario. Can you
> > > > provide any details of how you performed this test and the method y=
ou
> > > > used to confirm the audio quality for the capture/playback?
> > > >
> > > > Thanks for any insights you might be able to offer . . .
> > > >
> > > > Glenn
> > >
> > > Hi Ruslan -
> > >
> > > This is a follow-up from my post yesterday. I recompiled my kernel
> > > *WITHOUT* your UAC2 patches and repeated Scenario #2 where the Linux
> > > PC plays a single channel tone to the BeagleBone Black where it's
> > > recorded with 'arecord'. Yesterday, I recorded garbled audio on the
> > > target but today, without any UAC2 kernel patches, the recorded audio
> > > on the target is glitch-free and appears to be bit-perfect.
> > >
> > > This experiment leads me to believe your patches may be inadvertently
> > > corrupting the data-path. Have you been able to repeat my experiment
> > > and either confirm or refute my findings? I am interested to learn
> > > more how you tested your patches and whether it's something I can
> > > recreate here.
> > >
> > > Assuming we can sort out this data corruption issue, what are your
> > > thoughts on how the Linux target device can properly provide the
> > > Windows feedback endpoint with real frequency updates rather than the
> > > constant nominal frequency. If I understood your patch notes correctl=
y
> > > it seems this is an outstanding issue that requires additional
> > > attention. I'm a bit of a noob when it comes to how this might be
> > > addressed.
> > >
> > > Thanks for your continued insights and support . . .
> > >
> > > Glenn
> >
> > Hi Glenn & Ruslan,
> >
> > Do you know why WIN10 can't recognized UAC2 device if I configure the
> > sample rate as 48000HZ? Configuring sample rate as 44100HZ, the playbac=
k
> > function would work well at my platforms (chipidea IP), no glitch is
> > heard. At WIN10, I use Windows Media Player, at board side I use comman=
d:
>=20
> That's known issue, Windows is more strict with UAC2 descriptors, try to =
apply
> my patch "usb: gadget: f_uac2: always increase endpoint max_packet_size
> by one audio slot" that I shared in this email:
> https://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fwww.s=
pinics.net%2Flists%2Flinux-usb%2Fmsg205077.html&amp;data=3D04%7C01%7Cpeter.=
chen%40nxp.com%7C1c037c406a47423725e008d89d0b77c1%7C686ea1d3bc2b4c6fa92cd99=
c5c301635%7C0%7C0%7C637432019865845335%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4w=
LjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sdata=3D7=
jE6EEi4ZifLMVNgs3%2FygUkBjCrcIrtvIjX2%2FVwbwUM%3D&amp;reserved=3D0
>=20

Better than before, the Device Manager could recognize this sound device,
But Windows Media Player can't play it, see attached.

Meanwhile, I find your proposal patch [1] is not based on your UAC2 patch w=
hich
changed bmAttributes as USB_ENDPOINT_XFER_ISOC only at descriptor.

[1] https://www.spinics.net/lists/linux-usb/msg205077.html
--=20

Thanks,
Peter Chen

--_002_20201211072158GB490b29397desktop_
Content-Type: image/png; name="wmp_can't_play.PNG"
Content-Description: wmp_can't_play.PNG
Content-Disposition: attachment; filename="wmp_can't_play.PNG"; size=6717;
	creation-date="Fri, 11 Dec 2020 07:22:28 GMT";
	modification-date="Fri, 11 Dec 2020 07:22:28 GMT"
Content-ID: <34D203D5F4B2C94BB5A805124AC06A8F@eurprd04.prod.outlook.com>
Content-Transfer-Encoding: base64

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

--_002_20201211072158GB490b29397desktop_--
