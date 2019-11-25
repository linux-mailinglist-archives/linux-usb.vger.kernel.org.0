Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 83F991086D0
	for <lists+linux-usb@lfdr.de>; Mon, 25 Nov 2019 04:22:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726939AbfKYDWm (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 24 Nov 2019 22:22:42 -0500
Received: from mail-eopbgr60051.outbound.protection.outlook.com ([40.107.6.51]:22915
        "EHLO EUR04-DB3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726912AbfKYDWm (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sun, 24 Nov 2019 22:22:42 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LP+FRkzR87Rmcom7xqov/S17N9xbEgZVWzjoFcT7P1wbbuainK0jcEuVs4N4qT9CAt9gq3It0mGhXA84jPUF9+Zgha3dyDJBPISEoMX2PHlQKl3H3ufPXZCyOPEbO0E1nRdOPvdqF/RGJLnqgXf05CTfSBoJ5VvJJcjtd9xtvAv/CfXQUZjPuRKauaOWUEIjC/TLaoND2tWOf3l4uBpFKWw2ZVihQ88r7PKiUUt3wEaWeaGLwg1VIzUmBAggupaWbwJ22ryrWHiyxcyeZkxEH84bkooFNwgS+0+/0++0zu/WUZRDVQgw7xTHYfsTCoed7d6ygW8v/1GHDXejgeaWyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JyySgAz7DdQ1ulETp48UW7v5doFedT5MoEfQGyNSvhY=;
 b=FE7MsaLYzTuzzK/l0iK+wpDUP+f1Q2dd3t42aUMTvnOVDblbpEvWYL5ItskK64xDAX6wN0kvXzSf25dgIm2kJ7DR9y7Sks0/RppSJPp0qLRTwpuc5qPzSPrR8I0e/wKDC4F6H+GsnUR7dvMemLys4AEcDHYyz+9z8Sccf0Qgn8kcujtzzZq2foFYQdYcxV/hPFRLt7wHWLzRfojBv2CwDPCQg5WfALB8Kvg83x/DoG4wkpxfrmu9tdXn8XuA3Xg71M4KUUhpbz0gjmD/QIHKMpoORup1oreCaFVWtEP2XDt4hQoEoUvwfu3f6GcT/TU4ibtp25clWZ2OyOklyFc0Qw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JyySgAz7DdQ1ulETp48UW7v5doFedT5MoEfQGyNSvhY=;
 b=Ni5MgDKhp7gdVupNTgyvWhD+t99L/4CEpV2XCXml4lg6xDpueRu2nT82+NDGj+kia03DnuRx1CMPXqeURu+VxuecLkkWTPI/NSDAHj4Fu7L20qK5JqYxTyki+sViFp+DOEqsepzICkV06oF+o7Buow6FamwHgpRI2LTAeqqptIQ=
Received: from VI1PR04MB5327.eurprd04.prod.outlook.com (20.177.51.23) by
 VI1PR04MB6958.eurprd04.prod.outlook.com (52.133.246.144) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2474.21; Mon, 25 Nov 2019 03:22:36 +0000
Received: from VI1PR04MB5327.eurprd04.prod.outlook.com
 ([fe80::cd33:501f:b25:51a9]) by VI1PR04MB5327.eurprd04.prod.outlook.com
 ([fe80::cd33:501f:b25:51a9%7]) with mapi id 15.20.2474.023; Mon, 25 Nov 2019
 03:22:36 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     Bryan Gillespie <rpgillespie6@gmail.com>
CC:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: Debugging usb core/xhci issue
Thread-Topic: Debugging usb core/xhci issue
Thread-Index: AQHVoUt5UXSzp2ypNkyl3WcOsPQOMaebPJCA
Date:   Mon, 25 Nov 2019 03:22:36 +0000
Message-ID: <20191125032233.GA3207@b29397-desktop>
References: <CAPVsg6KP3S78CyL1BhNOXfUq13te2ce1E1Oi+W2CvXfLZcRPFw@mail.gmail.com>
In-Reply-To: <CAPVsg6KP3S78CyL1BhNOXfUq13te2ce1E1Oi+W2CvXfLZcRPFw@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=peter.chen@nxp.com; 
x-originating-ip: [119.31.174.66]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 0cc9121b-2770-450a-ef90-08d77156b81c
x-ms-traffictypediagnostic: VI1PR04MB6958:
x-microsoft-antispam-prvs: <VI1PR04MB6958A48AEE072CCBB47D8EAC8B4A0@VI1PR04MB6958.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0232B30BBC
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(7916004)(4636009)(136003)(396003)(346002)(376002)(366004)(39860400002)(189003)(199004)(25786009)(76116006)(91956017)(256004)(555904003)(229853002)(1411001)(81156014)(11346002)(6486002)(4326008)(8676002)(5660300002)(81166006)(316002)(6436002)(66946007)(66476007)(99286004)(44832011)(8936002)(66556008)(66446008)(64756008)(33716001)(7736002)(446003)(66066001)(305945005)(76176011)(3480700005)(86362001)(478600001)(9686003)(66574012)(71190400001)(6512007)(102836004)(71200400001)(186003)(6916009)(6506007)(53546011)(14454004)(3846002)(6246003)(6116002)(2906002)(33656002)(26005)(1076003);DIR:OUT;SFP:1101;SCL:1;SRVR:VI1PR04MB6958;H:VI1PR04MB5327.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: =?us-ascii?Q?/qNppz25KPkA910k9fm8mxtbZG+B8lqr67ISgYnhjW07N2jA/gRc1xiUFER5?=
 =?us-ascii?Q?+J0UcqZkb6BoVN7Zg1nczL5JmgzfAacwLbmuenPY4cMjbvi4fbNXTFwilIzM?=
 =?us-ascii?Q?U749JmD8444C18FQEemAI0355uyr9J6YEc4ygwR3yRKLsh2HBR0yCSjNR9pQ?=
 =?us-ascii?Q?J+SjUtBvdWtW2VRNS7SKGhnsTYvHegjS7oBAuYDski3uYu6lTeCyaWK3lNlm?=
 =?us-ascii?Q?QcKXKGrDQEDEtsQrQ99L1eB9zPu5O2U5zlc/y4veQrdL7ZIUoh9NOYJ9939z?=
 =?us-ascii?Q?Cy5NWJw58dDSULd+B6Z33FwLVFnf4Onll+2SJWPPbwAt8jNvAYWy/KrfvMbx?=
 =?us-ascii?Q?3NzL0VhBe7GaeRFNX0NI3bQmCG3AwzzDR8dsiR1WokgEVtOoCHrYxEl7QCHS?=
 =?us-ascii?Q?P25ODXCBpM+oLyHNvo28Xjph1TcstBl2gAG0olvFu/sd2ZdyYcsZ9FJK1lva?=
 =?us-ascii?Q?40/tB41Ay2LgrUKtN5iI8buYtdiIwYvPAoC1ChY7Y6D5UDUNDiazi6+StOfN?=
 =?us-ascii?Q?C5p7ZVdDIhlnRGgIR+keZE54LI2EY9dJey+nNWAZIA9WF4Z2+pYYtoZEilHx?=
 =?us-ascii?Q?BxfSIaFhVZ8UxuUjM5zEelBWAoFTo0i5TnkT06Cw3MUSRmVSlU6GsBpLbtU2?=
 =?us-ascii?Q?2Vv7BkVGEVjuIKjgw5myO/Hyi4ybd5EGtsgwMjG/1kBBB8qNjMrMKPz3O6kG?=
 =?us-ascii?Q?rqoZojxrdu3b8huyCxZwrIag+BA0Oej+Wb7hGyQeHDAuQtgaS2/vxjqHyJJ3?=
 =?us-ascii?Q?3K9O6q2EeJOtF650pf1ePtpNPz9H4l1FoiqsXuxyLUw0xL3tkOkPsTLsr2In?=
 =?us-ascii?Q?GtVOcJIoFtH60EbLxgtVx7tdiHje+mt2vAOrxcvdHCItHWhGEqHxOono6tpA?=
 =?us-ascii?Q?0bss7w/P1BhX9xud2LSpr3cgplCLLBizyDrC2WKqzHlvjbOp1xdgYZ8iwoHj?=
 =?us-ascii?Q?8rD35XPHMg6SisvkyT1Dngyjidz5IOHE+HNadxpUDr8c11tUKqIixyWOMAoD?=
 =?us-ascii?Q?zf/Bu2gOQoXoZ5LOuAaqOtd0G4HggT7fbdrxrJ1EfADMlKPmYoPJMBNJNhWX?=
 =?us-ascii?Q?13Tfr4GODhCRJkD0QwKFydrrZDyzMJU0qIyT7aMaCjEi4xrKzkYtP/iGa11Z?=
 =?us-ascii?Q?G/qKXW6pqdqhgLF4yRuLrS6L7BW7iCvSBo775YDc2WcZLhbbBUarzrl2G6gf?=
 =?us-ascii?Q?NCzte1Sla1V04f0I4vgQwj3QMRZCIVZDthCJ48g+5F9rtQXWTkOK1GAXvawd?=
 =?us-ascii?Q?NEQmsYcDUQNP+/OEF0A3olIALpHfzhkYZ409PKvj3T5S2Oj16dbIKaahnlvo?=
 =?us-ascii?Q?mJRr7MfW/l3F12qnpbEANH2sidoWsCjyLgvghRXfF5PdS3ZDOYirkhZSGKrl?=
 =?us-ascii?Q?47y3HaOib/Rxv87YGwQiVf+Rlt2WxZEe6RzeaWYR6tMkSSyE2LgfqICw+uPS?=
 =?us-ascii?Q?FluiqTzLls/nUWDDmRkkVEtgDHpurdVLV2kO7VlYT5m5cR1wSC7u+XulAK1l?=
 =?us-ascii?Q?6tSWkW5VfXA8W24AQhm8SrtibfV7Pd+amvrNE+NbXJC07q8z4q6m8tBuvkaF?=
 =?us-ascii?Q?9nxieFLsIYAY+SUzvBgFt3FzyOKJLDYrjWoA1cIEyJcnAtWJCXefNfPTcV+g?=
 =?us-ascii?Q?bQxol3lRLYWeN/ZSVA1s5Tx4n4namNr7Bb3R98uy8C54KcvlFkZ3BJDh0TRD?=
 =?us-ascii?Q?2HDMz/eVOhpj8szRWK1Y3qxHs8oQJAkCQtNVDGoRMUOjLRgmRxdCHV39ttV3?=
 =?us-ascii?Q?pmTX488LTmknH8Aklzg/CcTTnA+q1FeVjOw51o41rQGQj1MbhoEn7f2bgmvR?=
 =?us-ascii?Q?awhlqQpiE5tnCaplal4LssCuwOrj11Wc5LgLOKkxLIq3/ePt5tYi0SfzEXtV?=
 =?us-ascii?Q?kF0lrKmbUWnsuk7ebA=3D=3D?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-ID: <231A0C7FE618FB4AA7DF957823B52E3C@eurprd04.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0cc9121b-2770-450a-ef90-08d77156b81c
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Nov 2019 03:22:36.4415
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lUbpUbjyVfR44CIcibj+JlurKQ2egCJFox+PrVa/i+BzQWgBKrgArvop6+Y8Zy05ttu7WEmcTCIDb3G5iSlmBg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6958
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 19-11-22 10:42:26, Bryan Gillespie wrote:
> Hello,
>=20
> My name is Bryan Gillespie (RPGillespie6 on GitHub). I'm emailing
> because I'm completely stumped at how to approach debugging a
> USB-related issue on an embedded linux setup and I'm hoping someone
> here might be able to at least be able to give some high level ideas
> on how to approach debug. Also, I've never used mailing lists before
> so let me know if this is completely out of line.
>=20
> Basically, I have a marvell a3700 soc running embedded linux (linux
> version 4.4) connected to a Qualcomm modem (linux version 3.18) via
> USB 3.0 traces on a PCB. The Qualcomm modem enumerates as a devices in
> the a3700 with 6 interfaces and 14 endpoints. There are various
> drivers that are applied to the usb interfaces, from qcserial to
> qmi_wwan, to adb (userspace), to ipcrtr (normally not a usb driver but
> has usb xprt added).
>=20
> Everything seems to work perfectly fine until I start putting the
> system under higher load for longer periods of time. For example, if I
> run iperf traffic through the qmi_wwan/usbnet interface (20 MB up, 200
> MB down) and send control traffic periodically through ipc router
> interface, eventually (~1-3 hours) there is some kind of breakage and
> nothing usb-related works anymore for that device. Not even adb works
> even though it has its own dedicated interface (adb shell just hangs
> indefinitely, for example).
>=20
> **This leads me to believe something in linux's usbcore or xhci
> somehow got foobared by an interface driver since those are the common
> layers shared by all usb interfaces?**
>=20
> I don't understand these layers well enough to know what that could
> possibly be. I should also mention that sometimes (not always) there
> is a single dmesg trace that happens at the time of breakage in the
> a3700:
>=20
> [ 3771.097658] ipcrtr_read_cb Connection Reset 7 urb status -71
>=20
> ipcrtr_read_cb is the urb complete callback and -71 is the feared
> -EPROTO urb code.
>=20

This usually the hardware error.

> If I issue USBDEVFS_RESET to the device with ioctl inside the a3700,
> everything starts magically working again (presumably because all the
> data structures/buffers/etc. in xhci and above are reset and all the
> interfaces are re-probed?). I am pretty sure (but not positive) it is
> not the modem's fault since qualcomm's provided reference processor
> seems to be able to run iperf traffic indefinitely.
>=20
> I should mention that the a3700 processor is very limited on memory;
> it only has about 160 MB of total memory (DRAM) available to linux
> compared to Qualcomm's reference processor which has 4 GB memory (and
> is running linux version 3.10).
>=20
> If you've made it this far in my email, my question is - how would you
> approach debugging this? Are there some key things you would check?
> Are there any known gotchas with linux 4.X as host and linux 3.X as
> device? It is not easily reproducible (at least not without waiting a
> long time - currently exploring if it is possibly to cause the issue
> faster somehow). I have ftrace enabled, but so far I haven't been able
> to get a trace that captures the exact window of breakage. I tried
> turning on all usb-related debug with dynamic debug as well, but this
> appears to cause the kernel to consume 100% cpu as soon as I start
> iperf so currently I'm trying to identify some key files to turn on
> traces for that hopefully won't overwhelm the cpu with logging.
>=20

Hi Byran,

Your kernel for both host and device are too old. xHCI driver improves
a lot these years, Would you please try using newer kernel the hardware
supported to see if any thing changes? It is easier for the driver
maintainer to give some hints for newer kernel.

--=20

Thanks,
Peter Chen=
