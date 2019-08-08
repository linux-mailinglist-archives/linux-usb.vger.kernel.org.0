Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C15EC857C3
	for <lists+linux-usb@lfdr.de>; Thu,  8 Aug 2019 03:47:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389617AbfHHBrR (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 7 Aug 2019 21:47:17 -0400
Received: from mail-eopbgr70051.outbound.protection.outlook.com ([40.107.7.51]:45274
        "EHLO EUR04-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2389488AbfHHBrR (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 7 Aug 2019 21:47:17 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=csNJcd27/oTvKI+9c2Dho5UZUPIwbaaj2iJ4K7o0HqgsjccNpSZy7ye+sQpXPdbHkKskgckIwjNGYdjsHbrGl45JMPcetRn+VJktMM/nelHWjEC/cjSf3vU/xK0aIMJRtU0r1+Z6zsyDUbMkbBqY4V7DOvZ3U5C7EApjh0wKqPbSCvlI6jrkOpfuuSuqJ4Rv2IoNZreX7HRAN6oTi/2gDO7WSaJ6P7hNlORqac9A/MVkS5WcrIw3vbyCrBQ6bymmMRKTRh3LDH45qGkIV0IQdIQqd60lyfRs3AcIgpiIhqLMNTCWp3JBaWOHvvTscPUgyxIBI7q7US1TbdHnDtOIwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NWEVxBR8FNi9ALgti7iqe5h+h5sfggGVC9iPebyGzNI=;
 b=mdjwrgxUT9DyTcg9KGICyhlqk8SwM3tpSGVzZSzEVDVqD+XBBUou7HC7aRQHNuU8sSKwx76ig+W6WqXhmyHE3qwhNWtM4csQK56bty9hbIAJkQYy1SicRu82dh4xqjzgMT6sqDQMOnhUzUtGUs88p6PRTUEmLzM/nyNdF4uobYrz9pxkDw/LOYI38g3I+VQy5PHxpfCaRt3hPrL0CBweakPti40HSxNt+ieF4BzlZA1EieeIuaXLuPDUDBUILkbutGYiLQokVMuYmCoFFgatgdt3SkRw4QOCO46qkX5vnH/DtMn9fbhdDuo+cQGgGTm45G2QIC/qDIihqgEE2GfifA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NWEVxBR8FNi9ALgti7iqe5h+h5sfggGVC9iPebyGzNI=;
 b=m0oOKuqKz3utjCY6q7qV5wJki0sAHMTrZ+rkqFh5DsSh27UirfciTOv8NQOSRfeTysimdesgSWBwsvQ+FUDqwg98bBh7lHSLfs3MXP1+BBntetTCwEudZ5ii8We5BwyElp6vIL9fyFxj2O5uPtwUkHWs0rF/1qP5H7bTE8NsSJE=
Received: from VI1PR04MB5327.eurprd04.prod.outlook.com (20.177.52.16) by
 VI1PR04MB6893.eurprd04.prod.outlook.com (52.133.245.135) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2157.15; Thu, 8 Aug 2019 01:47:12 +0000
Received: from VI1PR04MB5327.eurprd04.prod.outlook.com
 ([fe80::81ec:c8ec:54d9:5dc5]) by VI1PR04MB5327.eurprd04.prod.outlook.com
 ([fe80::81ec:c8ec:54d9:5dc5%2]) with mapi id 15.20.2136.018; Thu, 8 Aug 2019
 01:47:12 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     Rob Weber <rob@gnarbox.com>,
        Felipe Balbi <felipe.balbi@linux.intel.com>
CC:     Peter Chen <hzpeterchen@gmail.com>,
        "mathias.nyman@linux.intel.com" <mathias.nyman@linux.intel.com>,
        Evan Gates <evan@gnarbox.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: RE: EHSET USB testing
Thread-Topic: EHSET USB testing
Thread-Index: AQHVSW1bqdO3+ep3pUG3iKoU4x0TJ6bsFT2AgAMIDwCAACBqMIAAGECAgACE4QCAAKcNAA==
Date:   Thu, 8 Aug 2019 01:47:11 +0000
Message-ID: <VI1PR04MB53279420050000AF88A3AC7A8BD70@VI1PR04MB5327.eurprd04.prod.outlook.com>
References: <20190802200325.22897-1-evan@gnarbox.com>
 <CAL411-q1Hxkh+i3WRcAPM7QZ_yC-96jBfAx-t4PRJH7Cs1fvjA@mail.gmail.com>
 <20190807042500.GA10249@coops>
 <VI1PR04MB5327B131A958695EDD251B8A8BD40@VI1PR04MB5327.eurprd04.prod.outlook.com>
 <87v9v9l8m2.fsf@gmail.com> <20190807154324.GB14395@coops>
In-Reply-To: <20190807154324.GB14395@coops>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=peter.chen@nxp.com; 
x-originating-ip: [119.31.174.66]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 66bb1ec9-f81c-4bac-19b4-08d71ba25506
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);SRVR:VI1PR04MB6893;
x-ms-traffictypediagnostic: VI1PR04MB6893:
x-microsoft-antispam-prvs: <VI1PR04MB6893034A974ED3FC824EF1E98BD70@VI1PR04MB6893.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 012349AD1C
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(346002)(136003)(366004)(39860400002)(376002)(396003)(199004)(189003)(51874003)(81166006)(81156014)(99286004)(2906002)(4326008)(55016002)(54906003)(7116003)(256004)(5024004)(14444005)(6246003)(6436002)(53936002)(229853002)(9686003)(76176011)(7696005)(33656002)(3480700005)(102836004)(71200400001)(71190400001)(478600001)(6506007)(5660300002)(3846002)(6116002)(66476007)(74316002)(305945005)(66066001)(66446008)(66946007)(64756008)(66556008)(76116006)(14454004)(8676002)(8936002)(11346002)(486006)(446003)(52536014)(110136005)(186003)(25786009)(316002)(44832011)(26005)(476003)(53546011)(7736002)(86362001);DIR:OUT;SFP:1101;SCL:1;SRVR:VI1PR04MB6893;H:VI1PR04MB5327.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: hRDJL8xFBKxFyu6cbpYqQ+AXrcChx1S5Zx42JlMqeS+G/grFwtu1J29q9b9hynLpqItm8yHbPMGdImwpmstdW9El1PJcbO1M8zZM+NP/FMNFsrykIEo4H/Hi3GwQOHLiSeM3RvQ6oyaRG8PZbeN0IIsXfSCNi0fOVSi2fJeIRnPRaSvxVjoOjtkGbxJkcsAwBKh09teXEfbFZevbayG+kq/wpGr9vKSaaLKx8qhbvpjkVUksfz7fnu2C/1JZEtut0JpMZ1wTGsxkRyAEr3Nw04Pr2IAWNKjOu4oThTuJFesomI0/KBYzlOhtdMZjxQd0bv+NZwLUC5ZnoOb8Q44DpLPwg0tIeKruOM9gyL29n/3Vj01wrEG4NWrsG3IkkfKZBPpM3t1sjHHzeZCy85c55U1aGfKizgbmJTAhnuRpqHY=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 66bb1ec9-f81c-4bac-19b4-08d71ba25506
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Aug 2019 01:47:12.0460
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: peter.chen@nxp.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6893
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

=20
>=20
> On Wed, Aug 07, 2019 at 10:47:49AM +0300, Felipe Balbi wrote:
> > Peter Chen <peter.chen@nxp.com> writes:
> > >> (Pinging Mathias regarding xHCI support of the USB 2.0 test modes)
> > >>
> > >> On Mon, Aug 05, 2019 at 02:07:23PM +0800, Peter Chen wrote:
> > >> > On Sun, Aug 4, 2019 at 10:45 AM Evan Gates <evan@gnarbox.com> wrot=
e:
> > >> > >
> > >> > > I'm trying to get my device to pass the EHSET tests.  I found
> > >> > > the thread "Using EHSET module" from March.  I'm having similar =
issues.
> > >> > >
> > >> > > I don't have access to the PID VID board that the lab uses.
> > >> > > Instead I'm using another computer setup as a mass storage
> > >> > > gadget but set the VID:PID to 1a0a:0102 (TEST_J).  If that
> > >> > > sounds like a problem or there is another, better way to do this=
 please let
> me know.
> > >> > >
> > >> > > > The usb-storage driver bound to your device first.  Try
> > >> > > > building a kernel without that driver and then it shoudl bind =
to the other
> driver.
> > >> > > >
> > >> > > > Or manually bind the ehset driver to your device through sysfs=
.
> > >> > > > Read up on the documentation for the "new_id" and "bind" and
> > >> > > > "unbind" sysfs files for how to do that.
> > >> > >
> > >> > > I did this.  I was able to unbind from usb-storage but binding
> > >> > > to usb_ehset_test failed with error -32 (AFAICT EPIPE).  I
> > >> > > tried both the usb_ehset_test/bind and usb_ehset_test/new_id
> > >> > > methods.  In both cases I got the same error.
> > >> > >
> > >> > > I did another build without usb-storage.  Now I don't have to
> > >> > > go through the unbind step but I still get the same error while =
probing.
> > >> > >
> > >> > >         [  296.089877] usb 1-1: new high-speed USB device
> > >> > > number 2 using
> > >> xhci_hcd
> > >> > >         [  296.271081] usb_ehset_test: probe of 1-1:1.0 failed
> > >> > > with error -32
> > >> > >
> > >> > > I notice that it says "using xhci_hcd."  Is that a problem?
> > >> > > Does it need to be ehci?  I tried a build without xhci but that
> > >> > > caused other problems for me.
> > >> > >
> > >> > > 1) Can I use a computer in device mode to present a VID:PID to
> > >> > > get into EHSET mode?  If so how should I do that?
> > >> > >
> > >> >
> > >> > Afaik, you can't. No Host computer will act as USB device. You
> > >> > may try to configure your box as USB device mode, for gadget
> > >> > driver, you could using legacy g_zero module, or source_sink funct=
ion using
> configfs.
> > >> >
> > >> > > 2) What else do I need to do in order to get my box into EHSET m=
ode?
> > >> > Only thing is your box need to be at host mode. For testing USB2
> > >> > for xHCI, the mainline code should not support
> > >> > TEST_SINGLE_STEP_SET_FEATURE at my last access.
> > >>
> > >> Today I was able to get access to a PID/VID test fixture that is
> > >> used in USB 2.0 EHSET testing. Some of the major findings include:
> > >>
> > >> 1. The only test mode that works properly is
> > >>    TEST_HS_HOST_PORT_SUSPEND_RESUME. All other probes of the
> ehset
> > >> module
> > >>    fail with errno -32 as shown above. This test mode is likely the =
only
> > >>    one to work because it does not set the PORT_FEAT_TEST feature fo=
r the
> > >>    appropriate port, but rather sets and clears the PORT_FEAT_SUSPEN=
D
> feature.
> > >>
> > >> 2. The same issue was observed on not only our custom hardware, but =
also
> > >>    a Dell XPS 13 running Ubuntu 18.04 with kernel version 4.15. I've
> > >>    attached the dmesg logs with xhci_hcd dynamic debug enabled for b=
oth
> > >>    hosts. The logs were captured while testing the TEST_PACKET test
> > >>    mode, but the logs looked similar for every other rest mode besid=
es
> > >>    HS_HOST_PORT_SUSPEND_RESUME.
> > >>
> > >>
> > >> Mathias, I would appreciate your feedback on the attached dmesg
> > >> logs with xhci_hcd dynamic debug enabled. If you have a moment,
> > >> could you please take a look at the logs and let me know if there
> > >> are any clues as to why the test mode is not working with xhci_hcd?
> > >> I've also attached the lsusb output for this particular EHSET test f=
ixture made
> by Allion.
> > >>
> > >> I've been digging into the xHCI specification to see what details
> > >> it might contain about the USB 2.0 test modes we are trying to use.
> > >> Section 4.19.6 describes the proper sequence for enabling the USB
> > >> 2.0 port test modes. This requires setting the appropriate bits in
> > >> the USB
> > >> 2.0 PORTPMSC register, which is described in full detail in section
> > >> 5.4.9.2. It's clear that xHCI should support the EHSET test modes,
> > >> but we're not able to set the appropriate port features for some rea=
son.
> > >>
> > >> My next thought is to double-check the logic of the ehset driver as
> > >> it relates to xhci_hcd. I would like to make sure that we are
> > >> enabling the USB 2.0 test modes according to the xHCI spec. I'm
> > >> concerned that we might be experiencing an error because we aren't
> > >> setting the test mode acording to section 4.19.6 of the xHCI specifi=
cation.
> > >>
> > >> Thanks in advance for reviewing the logs, Mathias! I appreciate any
> > >> time and feedback you may be able to provide. Let me know if you
> > >> have any further questions or need more information from me. I look
> > >> forward to hearing from you soon!
> > >>
> > >
> > > You may not enter test mode at all.
> > >
> > > Check flow: xhci_hub_control->xhci_enter_test_mode.
> >
> > The thing is that we need to enable certification test as well,
> > otherwise we will never have a chance of getting linux products with a
> > USB-IF logo out of vanilla mainline tree.
>=20
> Absolutely. USB-IF testing is important to us and our customers, so we wo=
uld
> definitely like to continue working towards a solution.
>=20
> Peter - you are saying that it is not possible to enter test mode, but yo=
ur
> explanation is unclear to me. Could you please elaborate as to why you th=
ink this is
> not possible? The only issue I can see is that I'm missing a patch that e=
nables
> SetPortFeature(TEST_MODE) (see below, and Mathias's response to this thre=
ad),
> but I would like to know if there are other issues that I am not yet awar=
e of.
>=20
=20
From your dmesg, your host box may not enter test mode. Mathias has already=
 given
you the correct check point, and you may need to cherry-pick some patches f=
rom
newer kernel to support it, please have a check. Like I mentioned, except t=
he last command
TEST_SINGLE_STEP_SET_FEATURE, the mainline kernel could support this
USB IF electrical test well. Besides, do not connect HUB between your host =
board
and emulation board (for sending VID/PID).

Peter

