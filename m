Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D3E31BC433
	for <lists+linux-usb@lfdr.de>; Tue, 24 Sep 2019 10:43:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2440682AbfIXIng (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 24 Sep 2019 04:43:36 -0400
Received: from mail-eopbgr140082.outbound.protection.outlook.com ([40.107.14.82]:19416
        "EHLO EUR01-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2439091AbfIXInf (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 24 Sep 2019 04:43:35 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DSk+x/j4v+RtG+OtRiV0oTCiuC5ufAv9uW1TDFolBzFH9b9jb2XpB0aJuAg5283BgqTzcWLdrxPU9514+bDl+z1LeVpIIay3W3Gn3UK5RhMHVzAa0+ICz10OKP7kTCl4hCwxYFLiPBinnJUu7+Wgtha5pKatuN1Iq5tig2dV62DsjFeaEZC+sMpKxzjyQztP9XiBq4WqqQN4T3odGaH2GCvmDKgEgBYir+I8QuKj+trZl31gzgT26UK6hWDS9gAC0heg/+iEVIQf1DKjmPAQthTIz9HB6Qy9qO4Gp/2mEJ557EBR00sBiadhncufXHooEuJHuQ1msHEEjTXkK1MBLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mvmZTceK/W8A2KblKtBYQ/hO+ZHv8F6wAdJzYXmWJWc=;
 b=FolomvpSu9TkvTn49UsVDmoc9bvjnQ3ycYYnRBh5+4pxGWeChHBP3DDvEcFaS4pJ8gllC6nE3lvxDqSS9yJYC/ZiYRvAX0MPY+aCj24kIYfuWaR1VCfesr+eHHOrq98tneFbFpZT7FRC5O19phBz2i6TDUzn9KlPSSLiSmbSkvJED1nK6s4HTkG2Go5vYq7C4zIOH/goX1ygl3ASAW8eKEmDCKkyxPjDnjgbNgzhUrHxe6FVkvy9iWMCCMGmwN66i7N4QrborTVu2GLoUBfmv5XDNWLjMwDITj7WuyOUoWIldogOUDX7S5zAorG0yhFcUzrVOLx8NbJNuC2BuVqOEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mvmZTceK/W8A2KblKtBYQ/hO+ZHv8F6wAdJzYXmWJWc=;
 b=PvC6RxSv5YewyY5CrDcBHM3ob86RJWKUeGMa9kEj1QGMggZg8cn6rbMpphLcRGQHVYDFdiAX87YbInooVPXFDv/l2+BisrGGmJFviTtaW62WyrEVlTkfszFbqZ2Rm5jwLfCdSoMqIg8JnYNhaN6fHqjyTkKdMcWb6Y2T3zY9jEo=
Received: from VI1PR04MB5327.eurprd04.prod.outlook.com (20.177.52.16) by
 VI1PR04MB5181.eurprd04.prod.outlook.com (20.177.51.154) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2284.20; Tue, 24 Sep 2019 08:43:32 +0000
Received: from VI1PR04MB5327.eurprd04.prod.outlook.com
 ([fe80::744a:c78e:b8:633a]) by VI1PR04MB5327.eurprd04.prod.outlook.com
 ([fe80::744a:c78e:b8:633a%7]) with mapi id 15.20.2284.023; Tue, 24 Sep 2019
 08:43:32 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     Mathias Nyman <mathias.nyman@linux.intel.com>
CC:     Suwan Kim <suwan.kim027@gmail.com>,
        Peter Chen <hzpeterchen@gmail.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: Event ring is full when do iozone test on UAS storage
Thread-Topic: Event ring is full when do iozone test on UAS storage
Thread-Index: AQHVbHL4/6e/psj0i0CkLQoN5DU95acuUDcAgAFS6wCAAeGCgIABQuaAgABEf4CABhx8gIAAKU8AgAE+IoA=
Date:   Tue, 24 Sep 2019 08:43:31 +0000
Message-ID: <20190924084535.GA9490@b29397-desktop>
References: <20190916094305.GB21844@b29397-desktop>
 <0aae13f2-04cf-f45a-e6ee-4bf9e515faba@linux.intel.com>
 <CAL411-oirjSLZzwoN8axqpfn-JQ8eEGMWD-w9p24Krap+dPs9g@mail.gmail.com>
 <92a09240-6489-b405-7916-26a77f2e0b06@linux.intel.com>
 <CAL411-p5TPHtBTe2cVtPsX07LhjeHw19qLjxz_XOXigEfG7_DQ@mail.gmail.com>
 <20190919135935.GA3133@localhost.localdomain>
 <e9090913-3ef8-5211-8f70-550df5dbe7ec@linux.intel.com>
 <ba5ab485-cd06-6480-fffb-5b9c6a99d7f1@linux.intel.com>
In-Reply-To: <ba5ab485-cd06-6480-fffb-5b9c6a99d7f1@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=peter.chen@nxp.com; 
x-originating-ip: [119.31.174.66]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7545a3f1-4c6b-413e-4670-08d740cb47a1
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(5600167)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);SRVR:VI1PR04MB5181;
x-ms-traffictypediagnostic: VI1PR04MB5181:
x-microsoft-antispam-prvs: <VI1PR04MB5181A453F87FBF285F854C638B840@VI1PR04MB5181.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0170DAF08C
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(979002)(4636009)(7916004)(366004)(136003)(396003)(39860400002)(376002)(346002)(199004)(189003)(1076003)(6486002)(3846002)(8936002)(81166006)(81156014)(64756008)(66476007)(66556008)(44832011)(54906003)(2906002)(486006)(66446008)(66946007)(14454004)(11346002)(446003)(86362001)(256004)(14444005)(8676002)(91956017)(76116006)(476003)(66066001)(33656002)(6506007)(305945005)(25786009)(76176011)(71190400001)(9686003)(71200400001)(229853002)(6512007)(6436002)(478600001)(4326008)(33716001)(6246003)(561944003)(53546011)(5660300002)(316002)(186003)(26005)(99286004)(7736002)(6116002)(6916009)(102836004)(969003)(989001)(999001)(1009001)(1019001);DIR:OUT;SFP:1101;SCL:1;SRVR:VI1PR04MB5181;H:VI1PR04MB5327.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: O5dvQvJQYQSKL+doMkliXF8BnX541P4akHD7phd0Yt8x+owTJk/e80ET2gxBehZEznN2KcRb1hq4+GMjayZLdS11JqhJah1S9FTwWpJo3buslIWcP+CVFYsjvD8NnOHfzvTPARhamO/j3INXDih5QPj6CL4wqpwLA5LAUNVIrgd+db803gjk0YTY+94MiCQeXMTOmZ6YmbQS6tFopOSBO+5D/lmC1yZrCeUdM7LArJ3uFIRHtdHwjzdNnVqF3V6mDwix2uA3PsE+qgy4Kpwi4edNMHUlwIvYJi1L9/+yEdzv/kFbBY/ZY0ox+jtgUgjVg21oi44IOUrmhy/non+GvzJdxZpL1IfMYg9do6u5pKexXEvNPsGr8V1FYgnhlW0v19PL3Jgm770L2IhRnLrJ157CEj1bgCybYEpU4Wn/2XE=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <6D0BEAB8E9FD914D823F958C59DE7A6F@eurprd04.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7545a3f1-4c6b-413e-4670-08d740cb47a1
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Sep 2019 08:43:31.9235
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: N0M5q+Bih0U+Yo7+Of+iq0k1t2SQyL705gCKYV4aOZV98art+PMM3d7k106/dRfIF1nlEQHRCuyh2xvI1qwhKQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5181
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 19-09-23 16:46:56, Mathias Nyman wrote:
> On 23.9.2019 14.19, Mathias Nyman wrote:
> > On 19.9.2019 16.59, Suwan Kim wrote:
> > > On Thu, Sep 19, 2019 at 05:54:25PM +0800, Peter Chen wrote:
> > > > > On 17.9.2019 12.55, Peter Chen wrote:
> > > > > > > >=20
> > > > > > > > I met "event ring full error" like below, this error is met=
 when
> > > > > > > > I do iozone test on UAS storage at v4.19.35 kernel, but not=
 meet
> > > > > > > > this error at linux-next tree (08/24). The same host and te=
st
> > > > > > > > UAS storage device are used. This issue is due to xhci_hand=
le_event
> > > > > > > > does not return 0 long time, maybe the xHC speed is fast en=
ough
> > > > > > > > at that time. If I force the xhci_handle_event only run 100=
 times
> > > > > > > > before update ERST dequene pointer, it will not occur this =
error.
> > > > > > > > I did not=A0 see any changes for xhci_handle_event at the l=
atest code,
> > > > > > > > so in theory, it should have this issue too. Do you think i=
f we need
> > > > > > > > to improve xhci_handle_event to avoid event ring?
> > > > > > >=20
> > > > > > The root cause is UAS protocol is very fast
> > > > > > protocol, the
> > > > > > other threads at non-CPU0 will add TRBs during we are handling =
event, so if
> > > > > > hardware (xHC) has always consumed TD the non-CPU0s are adding,
> > > > > > the ERST dequene pointer never get change to update, then this
> > > > > > "event ring full" error will occur.
> > > > > >=20
> > > > > > The one reason why v4.19 has this issue is the max request leng=
th is larger
> > > > > > than the latest kernel. At v4.19, it is 512KB, At the latest ke=
rnel,
> > > > > > it is 256 KB.
> > > > > > see /sys/block/sda/queue/max_sectors_kb.
> > > > > > When I change max_sectors_kb as smaller value, the test will be=
 more smooth.
> > > > > > Besides, At v4.19, the UAS completion handler seems take more t=
ime
> > > > > > compares to the latest kernel.
> > > > > >=20
> > > > > > I suggest adding threshold flag for event ring when it closes t=
o full
> > > > > > since we can't
> > > > > > avoid USB3 use cases when the throughput is high, but the syste=
m is a
> > > > > > little slow.
> > > > > > Do you agree?
> > > > >=20
> > > > > I agree that it makes sense to force a ERDP write after handling =
some amount
> > > > > of events, it can solve some event ring full issues, but not the =
fact that
> > > > > we spend a lot of time in the interrupt handler.
> > > >=20
> > > > Ok, I will proposal one patch to fix event ring full issue.
> >=20
> > Great
> >=20
> > > >=20
> > > > >=20
> > > > > Your logs show that you have TDs containing up to 128 TRBs.
> > > > > When a TD like that finishes the driver will increase the sw dequ=
eue pointer of the
> > > > > transfer ring one by one until we reach the end of the TD.
> > > > >=20
> > > > > This means we call inc_deq() function 128 times in interrupt cont=
ext, and each time
> > > > > do a few comparisons. According to traces this takes ~120us. Ther=
e might be some
> > > > > tracing overhead but this could anyway be done in a saner way.
> > > > >=20
> > > > > I'll look into this
> > > > >=20
> > > >=20
> > > > Since we use hard irq for xHCI, for high performance protocol, it m=
ay hard to
> > > > reduce interrupt context time since we have lots of request handlin=
g,
> > > > cache operation,
> > > > and completion are interrupt context.
> >=20
> > I'm working on one improvement at the moment, it would be great if you =
could test
> > it out once i get it done.
>=20
> Got something  done on top of 5.3.
> It's in my tree in the irqoff_optimization branch
>=20
> git://git.kernel.org/pub/scm/linux/kernel/git/mnyman/xhci.git  irqoff_opt=
imization
>=20
> Does it help at all in your case?
>=20

I tested your patch, I am afraid it doesn't help on my case. At my case,
the time is consumed at DMA unmap operation and UAS completion, but not
xHCI internal code.

I have run UAS iozone and iperf tests, it doesn't show error on top of
below three patches.

usb: host: xhci: update event ring dequeue pointer on purpose
usb: host: xhci: Support running urb giveback in tasklet context
xhci: remove extra loop in interrupt context

--=20

Thanks,
Peter Chen=
