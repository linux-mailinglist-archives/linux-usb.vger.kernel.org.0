Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4C4FB143588
	for <lists+linux-usb@lfdr.de>; Tue, 21 Jan 2020 03:04:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727144AbgAUCEf (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 20 Jan 2020 21:04:35 -0500
Received: from mail-eopbgr30041.outbound.protection.outlook.com ([40.107.3.41]:26503
        "EHLO EUR03-AM5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726890AbgAUCEf (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 20 Jan 2020 21:04:35 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GJDede206ylHwgytWmrrvpHjP8GkOvCaRVT1Ta5VVZ4c56uk//EEebQI19WJcCFONzMgEzaOOKZd50GEpKGPFjuHD1y+nyOi+IAz81PK6PSsFc0LkDqnogDZEHkJLdHQp/BVMBaEI8v2imm6nD5dD7vpLjUH1f5an94swLRqc5E21X5cfM0EyB1tRaskNNqOYB1aT0pFF5yVawRG2HOxaCYVcp8fHcCl+9hLeqcfYxS5Y4Qx6QSQNw6GS4mY9KajOfrEiHeFwC87y4oR7yKDUR9DAkbHLLQeZy1SwZWN/ndQbcfewyV562VW5Yi6MGaJ5VGgsjDPnw3piIWD3aEHVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s4FTipw81Q9duIZFb6xaBdl2o7Q6WPBB/tHpX4fyfNM=;
 b=dVHheKMuJ3fAmVDcZL6r70mDDkyKhix59ElG20n4QCgsGXjpPdM6aCro6VnE40I42d+bhVv5lhEKW7g+t2yQEix45TlY5ni6YEA0C/v82rr3bLSmkYkMfeJU4NOcGQ+lFz+WaEf6H7d16yneTFh1bl3nzvCqgPnmEDbDKvvAla7oQwA1Q+GTpK/sA+BtQyzFm0O/dvKHnawvnGBGydxacfEPVnqzHW35yKDQY0JyZJjrBLfEfvw2amPXGQDWISRAyY9R2NlKPvs2+TcjS9KmmV0YzGzukmj3wm8JDyAKKfvg/WIZ/muMPLIWyWfqBvdYzh9S4IexW5OONnD0nnxu4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s4FTipw81Q9duIZFb6xaBdl2o7Q6WPBB/tHpX4fyfNM=;
 b=QZadm3346zkHYeAHYjpG/l7x4gwH3doL4XQi5ioaNxaWMs45RYehBdMU0ufeJ5BKs2zgUyOkQue0YsMQeiaNfxVGENgRMjZUtSgzm9S1Cvmw8USaRLojtqVDCNP0J3EjrtUPoaI4iuDk+ueofvep5lvrmah0+EOIqgExNlMgkhs=
Received: from VI1PR04MB5327.eurprd04.prod.outlook.com (20.177.51.23) by
 VI1PR04MB4877.eurprd04.prod.outlook.com (20.177.52.79) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2644.19; Tue, 21 Jan 2020 02:04:32 +0000
Received: from VI1PR04MB5327.eurprd04.prod.outlook.com
 ([fe80::c7d:58a2:7265:407e]) by VI1PR04MB5327.eurprd04.prod.outlook.com
 ([fe80::c7d:58a2:7265:407e%6]) with mapi id 15.20.2644.027; Tue, 21 Jan 2020
 02:04:31 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Felipe Balbi <balbi@kernel.org>
Subject: RE: No message is showed after USB gadget has configured
Thread-Topic: No message is showed after USB gadget has configured
Thread-Index: AQHVz3CN7pnWzUHGy0mcC5tRnuvKLqfzSV8AgAABQeCAABSqgIAA/ouQ
Date:   Tue, 21 Jan 2020 02:04:31 +0000
Message-ID: <VI1PR04MB53273947E7B3DE9949DBB94D8B0D0@VI1PR04MB5327.eurprd04.prod.outlook.com>
References: <20200120090357.GB19938@b29397-desktop>
 <20200120092934.GA382520@kroah.com>
 <VI1PR04MB53272657D56EE193CEB29CC68B320@VI1PR04MB5327.eurprd04.prod.outlook.com>
 <20200120104801.GA421434@kroah.com>
In-Reply-To: <20200120104801.GA421434@kroah.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=peter.chen@nxp.com; 
x-originating-ip: [119.31.174.66]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: a7b55059-2ddf-4ec0-d50b-08d79e164161
x-ms-traffictypediagnostic: VI1PR04MB4877:
x-microsoft-antispam-prvs: <VI1PR04MB4877074B06CD1A98669A8B118B0D0@VI1PR04MB4877.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2043;
x-forefront-prvs: 0289B6431E
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(39860400002)(136003)(376002)(366004)(346002)(396003)(189003)(199004)(2906002)(478600001)(81156014)(81166006)(8936002)(8676002)(54906003)(33656002)(71200400001)(15650500001)(4326008)(9686003)(44832011)(86362001)(7696005)(55016002)(6506007)(6916009)(26005)(66946007)(316002)(52536014)(66476007)(5660300002)(64756008)(66446008)(66556008)(186003)(76116006);DIR:OUT;SFP:1101;SCL:1;SRVR:VI1PR04MB4877;H:VI1PR04MB5327.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: NLosf3EDdzZIhg0wfhFqaR1PotWOSoV4r4yeSLDT1xP2gbHUh2tHmucYq/Q3tv1hOe9d+KQVuyZHZra4oRKjXg0oJsbAij7r79/1Chsu/Hmebl1OxZnddv4YiAgHxfyb7nUBUMnQdce0ucj0x8ivvIyRkYeLA1eHfoTfShyirUPIlIQ6JTLg2BbVOdwAQ0UenygnC1R+wqfylxPDqCRYB/E1kzKJi98XT675hw5RNn0EzzjOdXoAnA9vKBqQ0LdtdjmNn6NjsGV9EqbkVRA75fjb87aP+7j8RtRYlonv3tLBVisN0bD6ARsi+mJxupPA4qtY0ORh+2ZxArgIkbRzbLCqUG4Udv1b817NwxpI/Pr7L2hVf/9CJVcE8lr4L42xkt49YylzIG6B1rHGk5Y+9HH98Rhh0FvB2rJAMeCNWfbFgPdJtzJkoG8cStLvQ/Aa
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a7b55059-2ddf-4ec0-d50b-08d79e164161
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jan 2020 02:04:31.7865
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 31ifNa8fMjDIZdgDxELTKMUt9cF7gbFols813+AT1C8WvfGhiUnIHC/JGTyKrwm79W7hhXm4FVsPfIEBjCZCCA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4877
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

=20
>=20
> On Mon, Jan 20, 2020 at 09:48:24AM +0000, Peter Chen wrote:
> >
> > > On Mon, Jan 20, 2020 at 09:03:59AM +0000, Peter Chen wrote:
> > > > Hi all,
> > > >
> > > > >From commit 1cbfb8c4f62d ("usb: gadget: Quieten gadget config
> > > > >message"),
> > > > there is no any message from gadget side after it connects to host
> > > > and works correctly. Although we could cat "state" under
> > > > /sys/class/udc/$CONTROLLER/ to know its state, we can't easily
> > > > know if the gadget works or not from console, USB host could have
> > > > many messages after one device has connected, why we can't keep
> > > > one for USB gadget?
> > >
> > > Why not make "normal" USB devices quieter too? :)
> > >
> > > Surely you do not have tools that watch syslog to determine if a
> > > device is working properly or not, right?  That's what sysfs is for, =
not syslog
> entries.
> > >
> >
> > Yes, we use our eyes during the hot plug test for device or count the
> > number of messages for it, with this change, it may cause difficult
> > for hot plug test. For other tests, we could judge sysfs before later t=
ests.
> >
> > Since this message in there many years, we (and tester) may need time
> > to adapt for this change.
>=20
> Can you just turn on dynamic debugging for that one line with a simple ec=
ho to the
> debugfs file so that you still see this in your test framework?
>=20
=20
No, most released kernel or end user's kernel doesn't enable dynamic debug.
In fact, we use this message in formal release product to quick judge if th=
e
device function is ok, not just in development periods.

Peter
