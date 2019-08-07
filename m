Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 307068446C
	for <lists+linux-usb@lfdr.de>; Wed,  7 Aug 2019 08:22:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726733AbfHGGWj (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 7 Aug 2019 02:22:39 -0400
Received: from mail-eopbgr40065.outbound.protection.outlook.com ([40.107.4.65]:20774
        "EHLO EUR03-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726700AbfHGGWj (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 7 Aug 2019 02:22:39 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Wpe9UWf7a9bMRCadBJxHTp9aWVQ1WIFh575pmcb2ru9dlddYnvvTBmEXCyqH8Qdbz5hwuLFJuunnmOyo08HmaeTvJ3LEylxKU5c0Wc3x3pnTEIpQCBiY20+wOudYt2PJ+wiMv658oevaAp5klBNwVzp2FlWou9aPMLoD3UlnEKCNfkjlm1se57XoKYoyjUQNapOaxLHaW7+YDPG2CB4E09bYZeNbu3DvyqktENn2h4fd5A06icwfFwBrucODJYKjpFfLUcv0nXJvHI9rORxPNTvWIYd03lAk34mKNdu6MRrBTtiRT7IbmCbDch4PAfmc2vbZXUOhnSjNzE1X8/VHEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=soO3IRCzTNr+HyqefbJWGTFcs4BNXrI2j3Sx2XTCPOs=;
 b=EGwf7wvMvBOeLZXHYduFZbPDh2ZSMHvGFk64Y8TlxL6LazT06Hary/mvCKIKSE0FH8J99+C3fs18XJaXNX3Cz8j2S+XQMpUlDCH/rWpIn2AVbyedT2mUuIVMFE6ryDNEHYsZHd/ly5XfhW2qwoaLNIBzoM10l2bgnccXYZgx4+8f/Hak+Fn6PpV0uX6VOtX/Qmzfo1FcYexw6GruW7hKIM1CSdWH4v7B6K+BkL+uS0sqJU0+gBkCmqC4qMC4RLtF6Iv+IsfGxYCfeQ7ZUttO4NRulfwkH1OzVTFsGhts2wx1jf6uuZ+XDAh86EhZKMPQL6v8JPIUbdcb9rvLT+QSPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=soO3IRCzTNr+HyqefbJWGTFcs4BNXrI2j3Sx2XTCPOs=;
 b=CwJJ0KwdOoJ9Yu10IKDYRC2S5FjeNUmzCZYnmpR/0EmcVgkg4o6Ijk+/ZOp8u/VuwjbQTfmLDPizfKGEhJqqyR85Ot7vP5K8F9GC30tAx8s/czAF8DMX1Zj/TVLlBKq8AbjxYM0xXZYwvs0SLKnKi1rRyDJz1nN1CddAjV9SYN8=
Received: from VI1PR04MB5327.eurprd04.prod.outlook.com (20.177.52.16) by
 VI1PR04MB5645.eurprd04.prod.outlook.com (20.178.125.218) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2157.16; Wed, 7 Aug 2019 06:22:29 +0000
Received: from VI1PR04MB5327.eurprd04.prod.outlook.com
 ([fe80::81ec:c8ec:54d9:5dc5]) by VI1PR04MB5327.eurprd04.prod.outlook.com
 ([fe80::81ec:c8ec:54d9:5dc5%2]) with mapi id 15.20.2136.018; Wed, 7 Aug 2019
 06:22:29 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     Rob Weber <rob@gnarbox.com>, Peter Chen <hzpeterchen@gmail.com>,
        "mathias.nyman@linux.intel.com" <mathias.nyman@linux.intel.com>
CC:     Evan Gates <evan@gnarbox.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: RE: EHSET USB testing
Thread-Topic: EHSET USB testing
Thread-Index: AQHVSW1bqdO3+ep3pUG3iKoU4x0TJ6bsFT2AgAMIDwCAACBqMA==
Date:   Wed, 7 Aug 2019 06:22:29 +0000
Message-ID: <VI1PR04MB5327B131A958695EDD251B8A8BD40@VI1PR04MB5327.eurprd04.prod.outlook.com>
References: <20190802200325.22897-1-evan@gnarbox.com>
 <CAL411-q1Hxkh+i3WRcAPM7QZ_yC-96jBfAx-t4PRJH7Cs1fvjA@mail.gmail.com>
 <20190807042500.GA10249@coops>
In-Reply-To: <20190807042500.GA10249@coops>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=peter.chen@nxp.com; 
x-originating-ip: [119.31.174.66]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b5fcf4fb-e5a6-421f-b8bc-08d71aff9ffe
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);SRVR:VI1PR04MB5645;
x-ms-traffictypediagnostic: VI1PR04MB5645:
x-microsoft-antispam-prvs: <VI1PR04MB56452B4E14CBCA9BEBFE020C8BD40@VI1PR04MB5645.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 01221E3973
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(39860400002)(376002)(366004)(346002)(396003)(136003)(189003)(199004)(53754006)(51874003)(76176011)(14454004)(7696005)(186003)(6116002)(99286004)(8936002)(3846002)(316002)(44832011)(11346002)(26005)(81156014)(81166006)(446003)(54906003)(110136005)(33656002)(486006)(66946007)(2501003)(6436002)(5024004)(14444005)(256004)(2906002)(229853002)(66476007)(66446008)(66556008)(64756008)(53546011)(76116006)(6506007)(478600001)(102836004)(86362001)(5660300002)(6246003)(305945005)(7736002)(3480700005)(52536014)(25786009)(4326008)(68736007)(476003)(66066001)(7116003)(53936002)(9686003)(74316002)(55016002)(71200400001)(8676002)(71190400001);DIR:OUT;SFP:1101;SCL:1;SRVR:VI1PR04MB5645;H:VI1PR04MB5327.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: xEd+2P80QDucbz+2squoaZD8U5IFG0mKBaxofnCpZba47NlEr6/ffkf+UtxddK3y+ZlZ3n1S2vuv/7xrCJK7RXN9w1VjM5C9Sp8pspgq5axvdMOXoXFmEbGSEzP64LhyqQ024SSysNMExMW5agXNbgLwxqORCIfq//AAOzPAsk29YdriRIUsqLTs9GhCna6fm4HnMdEi2DNB5qsYXynYf9lLEioSo8raTqilcnlgRGMVlzS5qqvi8lnQTJjYTOIVpKzcTJe4ZyrmGA2IfdOE2vXYiJ5QewcSlotsA/Xdd0vcEvuew3guJdZXXtejiT66ifdGpq44xEzgugbZXHS2DEKxUKea5E874dlE6bd0rBz+t2wkcJ0fuOCKqiCVQUe2WFJGtBUZZMDZjpi8zZ/yzibfGginYmJJFT37YfoYND0=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b5fcf4fb-e5a6-421f-b8bc-08d71aff9ffe
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Aug 2019 06:22:29.7898
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: peter.chen@nxp.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5645
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

=20
> Hi Everyone,
>=20
> (Pinging Mathias regarding xHCI support of the USB 2.0 test modes)
>=20
> On Mon, Aug 05, 2019 at 02:07:23PM +0800, Peter Chen wrote:
> > On Sun, Aug 4, 2019 at 10:45 AM Evan Gates <evan@gnarbox.com> wrote:
> > >
> > > I'm trying to get my device to pass the EHSET tests.  I found the
> > > thread "Using EHSET module" from March.  I'm having similar issues.
> > >
> > > I don't have access to the PID VID board that the lab uses.  Instead
> > > I'm using another computer setup as a mass storage gadget but set
> > > the VID:PID to 1a0a:0102 (TEST_J).  If that sounds like a problem or
> > > there is another, better way to do this please let me know.
> > >
> > > > The usb-storage driver bound to your device first.  Try building a
> > > > kernel without that driver and then it shoudl bind to the other dri=
ver.
> > > >
> > > > Or manually bind the ehset driver to your device through sysfs.
> > > > Read up on the documentation for the "new_id" and "bind" and
> > > > "unbind" sysfs files for how to do that.
> > >
> > > I did this.  I was able to unbind from usb-storage but binding to
> > > usb_ehset_test failed with error -32 (AFAICT EPIPE).  I tried both
> > > the usb_ehset_test/bind and usb_ehset_test/new_id methods.  In both
> > > cases I got the same error.
> > >
> > > I did another build without usb-storage.  Now I don't have to go
> > > through the unbind step but I still get the same error while probing.
> > >
> > >         [  296.089877] usb 1-1: new high-speed USB device number 2 us=
ing
> xhci_hcd
> > >         [  296.271081] usb_ehset_test: probe of 1-1:1.0 failed with
> > > error -32
> > >
> > > I notice that it says "using xhci_hcd."  Is that a problem?  Does it
> > > need to be ehci?  I tried a build without xhci but that caused other
> > > problems for me.
> > >
> > > 1) Can I use a computer in device mode to present a VID:PID to get
> > > into EHSET mode?  If so how should I do that?
> > >
> >
> > Afaik, you can't. No Host computer will act as USB device. You may try
> > to configure your box as USB device mode, for gadget driver, you could
> > using legacy g_zero module, or source_sink function using configfs.
> >
> > > 2) What else do I need to do in order to get my box into EHSET mode?
> > Only thing is your box need to be at host mode. For testing USB2 for
> > xHCI, the mainline code should not support
> > TEST_SINGLE_STEP_SET_FEATURE at my last access.
>=20
> Today I was able to get access to a PID/VID test fixture that is used in =
USB 2.0
> EHSET testing. Some of the major findings include:
>=20
> 1. The only test mode that works properly is
>    TEST_HS_HOST_PORT_SUSPEND_RESUME. All other probes of the ehset
> module
>    fail with errno -32 as shown above. This test mode is likely the only
>    one to work because it does not set the PORT_FEAT_TEST feature for the
>    appropriate port, but rather sets and clears the PORT_FEAT_SUSPEND fea=
ture.
>=20
> 2. The same issue was observed on not only our custom hardware, but also
>    a Dell XPS 13 running Ubuntu 18.04 with kernel version 4.15. I've
>    attached the dmesg logs with xhci_hcd dynamic debug enabled for both
>    hosts. The logs were captured while testing the TEST_PACKET test
>    mode, but the logs looked similar for every other rest mode besides
>    HS_HOST_PORT_SUSPEND_RESUME.
>=20
>=20
> Mathias, I would appreciate your feedback on the attached dmesg logs with
> xhci_hcd dynamic debug enabled. If you have a moment, could you please ta=
ke a
> look at the logs and let me know if there are any clues as to why the tes=
t mode is
> not working with xhci_hcd? I've also attached the lsusb output for this p=
articular
> EHSET test fixture made by Allion.
>=20
> I've been digging into the xHCI specification to see what details it migh=
t contain
> about the USB 2.0 test modes we are trying to use.
> Section 4.19.6 describes the proper sequence for enabling the USB 2.0 por=
t test
> modes. This requires setting the appropriate bits in the USB
> 2.0 PORTPMSC register, which is described in full detail in section 5.4.9=
.2. It's clear
> that xHCI should support the EHSET test modes, but we're not able to set =
the
> appropriate port features for some reason.
>=20
> My next thought is to double-check the logic of the ehset driver as it re=
lates to
> xhci_hcd. I would like to make sure that we are enabling the USB 2.0 test=
 modes
> according to the xHCI spec. I'm concerned that we might be experiencing a=
n error
> because we aren't setting the test mode acording to section 4.19.6 of the=
 xHCI
> specification.
>=20
> Thanks in advance for reviewing the logs, Mathias! I appreciate any time =
and
> feedback you may be able to provide. Let me know if you have any further
> questions or need more information from me. I look forward to hearing fro=
m you
> soon!
>=20
=20
You may not enter test mode at all.

Check flow: xhci_hub_control->xhci_enter_test_mode.

Peter
