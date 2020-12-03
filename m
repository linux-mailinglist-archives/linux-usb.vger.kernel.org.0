Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BB8052CD336
	for <lists+linux-usb@lfdr.de>; Thu,  3 Dec 2020 11:11:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388067AbgLCKKb (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 3 Dec 2020 05:10:31 -0500
Received: from mail-eopbgr60062.outbound.protection.outlook.com ([40.107.6.62]:6982
        "EHLO EUR04-DB3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2387611AbgLCKKa (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 3 Dec 2020 05:10:30 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lO5HCc3HEZE+gtcJFVzqBx4FhpyvSzBvkKS5dOKmtPFFCkz0rg5nZPsw1LyRx2w10oBbsjXXuMQgAl+laNYqQBPDgKrPBwQpIwa7WXnonIYnCOmz1Rh/uqjGT8ifGDlVb0CrrKT659fns+u2ltj71gc+5lMFuWTD/kDCTUB1QDjjm/8Ilg6wh3lVkBjhClt6IhbCuajyelU4m93uOrAGxIQPZCaKjXNWq/hjA2Lt4cCEFOgdi458NPhTQqZ3cXbpffCOaNlxL3pw/5CTdsza1gvBc75CVpJwTdUqquPzuP2yFfOR+JhpidGy5cqnXRPW39NBCOanFkJPU7qsz6Wz6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PoqZwFs9u3QRqAP+1ryZ1hWgc87ZKLE4g3GyZNiqYAA=;
 b=Fj61wNrhpwVpyHzfxM9KarzJTZivJkhCzHATqV/+sAEV4a4Rjf1Nbm+d7VkRqVm1cnu2vBr5LC+Fj4K0R44ncfP0gR8iRzqaZaxonOlqIi4+7Vv2nyWxDC5ZnuuX2x5wHORi+/O3yn5d6Gkt+4uCxmFd9WC+YqYVPLER0SEfUWZw7GaTlGEatlPYsllb4W0ak75Crg0PcNAUYs7oQw7AL/5EnQAA1DhVX8+2dIlIuKw0T0lG+QvWeBD8kox7LAzoJYQULt/tXmOUwub0MaZPtsXKh4SI7gwFLNJV542iBZAyZn/blrMJsrKeuUBELvDJqhTKQybZK+CQkHhyyGGlIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PoqZwFs9u3QRqAP+1ryZ1hWgc87ZKLE4g3GyZNiqYAA=;
 b=IBmKBaJS29giwY/0FRDSTjd2o8CrU7xiH6EduyMq9/u+w5aY0676HvPRKYTWs2AFWE4Fgq/9uEnDYIIPqu4HOC1oX/uXL0MSfrU2ZlIj9FZGfVlMNKxgq/6zKA2nJPe77haOFmkX1cLOpjntS4TKMAyuhlWCvHbygLA4A+6hh6Q=
Received: from DBBPR04MB7979.eurprd04.prod.outlook.com (2603:10a6:10:1ec::9)
 by DB7PR04MB4234.eurprd04.prod.outlook.com (2603:10a6:5:19::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.17; Thu, 3 Dec
 2020 10:09:42 +0000
Received: from DBBPR04MB7979.eurprd04.prod.outlook.com
 ([fe80::c8c:888f:3e0c:8d5c]) by DBBPR04MB7979.eurprd04.prod.outlook.com
 ([fe80::c8c:888f:3e0c:8d5c%5]) with mapi id 15.20.3632.021; Thu, 3 Dec 2020
 10:09:42 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     Glenn Schmottlach <gschmottlach@gmail.com>
CC:     Ruslan Bilovol <ruslan.bilovol@gmail.com>,
        "balbi@kernel.org" <balbi@kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: [PATCH 0/3] UAC2 Gadget: feedback endpoint support
Thread-Topic: [PATCH 0/3] UAC2 Gadget: feedback endpoint support
Thread-Index: AQHWtWS1eBj0g+rqvUaS5l3jJzoDC6nCr5OAgAJ6iICAARA/AIAObLIAgASwk4CABPlXgIAEml8AgAGYLYCAAMpmAA==
Date:   Thu, 3 Dec 2020 10:09:42 +0000
Message-ID: <20201203100912.GA2881@b29397-desktop>
References: <1604794711-8661-1-git-send-email-ruslan.bilovol@gmail.com>
 <20201111092941.GJ14896@b29397-desktop>
 <CAB=otbSAGhDYxim9_fsyH4pZCLqgq+bxNJfv5hXqgQRVngVaig@mail.gmail.com>
 <CAMS2kBF5Gvhnf7AzdeSFeVeWBLhtHM_hHfTvMLTN-3Jkh=BwHw@mail.gmail.com>
 <CAB=otbTK0j03HjiLS-tqqaBTuavaFEJs49hpKPj2Df8e1_WN+A@mail.gmail.com>
 <CAMS2kBEnUDi5jKiNu5ZKihyucCikfoGor4n7=e+xX=7WU_rrog@mail.gmail.com>
 <CAB=otbRrLjeTjhBGtMqpeWeYZB9v62SDjSWzRk8uGQE3Ld8T2A@mail.gmail.com>
 <CAMS2kBGRrozHQj9wfLmcQMSCb8On+5HcSF=8PsUJAtqXz2QG1w@mail.gmail.com>
 <CAMS2kBGcDu-02dboEwxygMDE1r1c9Q3Lzrw6TcsoKEMvOzLmDQ@mail.gmail.com>
In-Reply-To: <CAMS2kBGcDu-02dboEwxygMDE1r1c9Q3Lzrw6TcsoKEMvOzLmDQ@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mutt/1.9.4 (2018-02-28)
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [119.31.174.67]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 429d4f08-d4bf-4c40-58df-08d897738d6e
x-ms-traffictypediagnostic: DB7PR04MB4234:
x-microsoft-antispam-prvs: <DB7PR04MB423420FC955A975B09FA253F8BF20@DB7PR04MB4234.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: bLwwzsciQQNLcuw8y0FI99WDdhnlkVfm0m1YXEKxu4/vuZy6vv/gtfAimuaUm5ixaZ2gG5mKG1t2vm3xM3Cn3m62ptmpRxOyxcs38mOJXzoIQ2ORBeUnXj5flUBfankAi3KIbAVlXDiNY/QYpXdYfdue1pIgm78O5MG+jhsfddPnUqZsXjur1py2rdIafsr4AvrpnxOSMxwYGKrKy6QwDe8NyDu/bcqbkcHpWiDBPwYrFDumSdEIR9G5TCJBRds1gQfuS+AfcTCQ2oOs3JsXVpCbDwUjyJi9QnTP/7qSlN8OVkB8l2V9sntq0hMKjHxFxZ33mVE2lUfAs9MOw2G3kQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR04MB7979.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(396003)(136003)(366004)(376002)(346002)(39860400002)(8676002)(44832011)(26005)(5660300002)(54906003)(478600001)(83380400001)(66446008)(66556008)(64756008)(66946007)(66476007)(316002)(33716001)(1076003)(86362001)(91956017)(2906002)(76116006)(6506007)(71200400001)(33656002)(4326008)(53546011)(6512007)(6486002)(186003)(6916009)(8936002)(9686003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?LBo40j1ixjJPcNTcOxbVrPnqm222TaAwybYHnCJBGTpBe4mo1ZqJs3TmTBGg?=
 =?us-ascii?Q?Nz+LqFbt7i/P0ho+LR1GRVm1KlNr5ZIpuAVJX/srPbymsb9hXe4S4w99s124?=
 =?us-ascii?Q?2KK3WQRTNqhZtEwIHNZi4iN4CzJE4PMywgmVmHL0ni9uLgOxqzlsbDxN+CJ8?=
 =?us-ascii?Q?eQbvX/76Ui+OJ4jZvV5NEHJR0G6H8NZnA+xHmV4uudMwKUoHaI6CCeCQZOiI?=
 =?us-ascii?Q?Dxnd6H1T6iMK4q/DxHYWCRhwCeLmho4FYa6y/rDA8RIODpmwtbKS+kb09kE7?=
 =?us-ascii?Q?UpZ6xmTDiLtairXtYzyyFtgv3Be4r2M2ypE7RF4KEO7UfcuPyANRIOh2stDe?=
 =?us-ascii?Q?nexskutODMEcnMxuuvnTbVKwJWPYjYD6PFmMjISZLz25FWJw1YFwUGwQLxjQ?=
 =?us-ascii?Q?7SIK87N5V03SozlciS4iMBFh8mQt4wcbPU8ED2vw2q+dVNF898AXAIVm6w6h?=
 =?us-ascii?Q?JDzNKPbj0xm34QKtLd6bd2RU1/9aEpHHBigOfbT1/c5NaZ7wh5DPi5Nm7wXK?=
 =?us-ascii?Q?Hp/pHVb2PuZcIue0vrl3jtzvfGImxMgKSOwxiR0qRcZqGXi0AZh4VlJxNpjW?=
 =?us-ascii?Q?XqSJmXRir/td3GZWKVRemPccvAL6wHcHzKpglKAcZEwNzEYOQ5HLNt1lq/TD?=
 =?us-ascii?Q?0lJxRb0gmCR3wZ+sfJh0jipc/y4qNb7Rp/lHmDgqEQxOfujG0bfrJWlzQ7yg?=
 =?us-ascii?Q?8hbOjQ4IFjOZpAKULbRHG3d52HD6w3pjOln0P+o8r3s9M0vWEAqhwIAx99bC?=
 =?us-ascii?Q?JEijWVOGkLg2fT2b09EdY+D1EPgPyI5CgtkDy0Z+/0vdTAwmulZ7tZwmRP9R?=
 =?us-ascii?Q?PVeJHSiuzKvgRRNA+J0J9V6dKp++M10zuh3IVbAwrcINUPdmlImmaSl7wJqk?=
 =?us-ascii?Q?2RkvYKomfs7ZPsZqVMgHwvQohaxm+6OgKhmQmWFqoHx/zSviPP7YU35aExMT?=
 =?us-ascii?Q?3VsscTwVm6tU6V5Y5tkhdgF6znaiZsZsOTSNlZmLIrw+8yx0BAlvfwx3HtIz?=
 =?us-ascii?Q?5yqy?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-ID: <8F382CC9F9FB824DAE578A95CB7C9962@eurprd04.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DBBPR04MB7979.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 429d4f08-d4bf-4c40-58df-08d897738d6e
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Dec 2020 10:09:42.1851
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CX9RakjUV+SklG4y5lXD9oDg0zfTI3tejE2NqzTPjJfekr7WUwVSPusJWQT+yAkkhBIiKVlMYY/DuHFWHa9jtQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB4234
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 20-12-02 17:04:47, Glenn Schmottlach wrote:
> On Tue, Dec 1, 2020 at 4:43 PM Glenn Schmottlach <gschmottlach@gmail.com>=
 wrote:
> > Hi Ruslan -
> >
> > Thanks for the feedback but unfortunately I've experienced mixed
> > results with the gadget UAC2 driver on both Windows/Linux. Let me
> > describe my environment. My host platform is either a Linux Ubuntu
> > 18.04 or Windows 10 laptop while the target environment is a
> > BeagleBone Black (Linux beaglebone 5.4.74-g9574bba32a #1 PREEMPT). I'm
> > testing two different scenarios:
> >
> > Scenario #1:
> > BeagleBone Black (BBB) runs speaker-test generating a single channel
> > (S32_LE) audio stream containing a 1KHz tone with a 48K sample rate,
> > e.g.
> >
> > > speaker-test -D hw:1,0 -r 48000 -c 1 -f 1000 -F S32_LE -t sine
> >
> > The host laptop is running Audacity and recording the tone over the
> > UAC2 adapter. On the Linux host the capture is correct and the tone is
> > bit-perfect. On the Windows 10 the capture contains numerous missing
> > samples which translates into a lot of audible pops and clicks.
> >
> > Scenario #2:
> > The Linux/Windows host plays a single channel, 48K, S32_LE 1K sine
> > tone to the target using either Audacity (on Windows) or 'aplay' (on
> > Linux), e.g.
> >
> > > aplay -D hw:4,0 -c 1  -r 48000 -t wav  tone_1k.wav  (Linux)
> >
> > On the BBB target I use 'arecord' to record the tone to a RAM disk and
> > then copy the recorded file back to the host where I can verify the
> > quality of the recording. In both instances (e.g. using either Windows
> > or Linux for playback) the recording on the target results in a
> > captured file with missing samples and audible pops/clicks. In this
> > scenario the UAC2 gadget is configured with c_sync =3D=3D asynchronous.=
 I
> > wouldn't expect things to improve with c_sync =3D=3D adaptive since you
> > mentioned in your patch that it always reports back the nominal
> > frequency to the host from the feedback endpoint.
> >
> > Do you have any suggestions that might explain (the above) behavior.
> > Can you describe your test environment in more detail so that I can
> > perhaps re-create it? What Linux target are you using with your tests?
> > You mentioned you tested an 8x8 playback/capture scenario. Can you
> > provide any details of how you performed this test and the method you
> > used to confirm the audio quality for the capture/playback?
> >
> > Thanks for any insights you might be able to offer . . .
> >
> > Glenn
>=20
> Hi Ruslan -
>=20
> This is a follow-up from my post yesterday. I recompiled my kernel
> *WITHOUT* your UAC2 patches and repeated Scenario #2 where the Linux
> PC plays a single channel tone to the BeagleBone Black where it's
> recorded with 'arecord'. Yesterday, I recorded garbled audio on the
> target but today, without any UAC2 kernel patches, the recorded audio
> on the target is glitch-free and appears to be bit-perfect.
>=20
> This experiment leads me to believe your patches may be inadvertently
> corrupting the data-path. Have you been able to repeat my experiment
> and either confirm or refute my findings? I am interested to learn
> more how you tested your patches and whether it's something I can
> recreate here.
>=20
> Assuming we can sort out this data corruption issue, what are your
> thoughts on how the Linux target device can properly provide the
> Windows feedback endpoint with real frequency updates rather than the
> constant nominal frequency. If I understood your patch notes correctly
> it seems this is an outstanding issue that requires additional
> attention. I'm a bit of a noob when it comes to how this might be
> addressed.
>=20
> Thanks for your continued insights and support . . .
>=20
> Glenn

Hi Glenn & Ruslan,

Do you know why WIN10 can't recognized UAC2 device if I configure the
sample rate as 48000HZ? Configuring sample rate as 44100HZ, the playback
function would work well at my platforms (chipidea IP), no glitch is
heard. At WIN10, I use Windows Media Player, at board side I use command:=20

arecord -f cd -t wav -D hw:4,0 | aplay -f cd -Dplughw:3,0 &

From the USB Bus analyzer:

Feedback EP is scheduled every 1ms, there are nine 176-byte packets and one
180-byte packet among 10ms transfers.

--=20

Thanks,
Peter Chen=
