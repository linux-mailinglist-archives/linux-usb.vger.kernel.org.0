Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 98E311D8BEF
	for <lists+linux-usb@lfdr.de>; Tue, 19 May 2020 01:59:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726907AbgERX6f (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 18 May 2020 19:58:35 -0400
Received: from mail-eopbgr40056.outbound.protection.outlook.com ([40.107.4.56]:14150
        "EHLO EUR03-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726302AbgERX6f (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 18 May 2020 19:58:35 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HOyGZDhhWW2nbf0QMbMipJMbLIahECMYG4hdRjCMU2cQ0CJ8FEAwGDhe5c04M//hZkzsLrty23ozVjmzEE/yJtAGxaCNrFO7v8IW1hKdFSLMwnPywhA4+8fi6qSXMUYshCFfHDSyMgiAGBHN8b0fXGDywA++OwulWuRAnCxoycSmqTnYp82bqLTqcvVwyTkXVL3X8pFW1vPKR1pbWcWE4087PVev9M/q3BZb6G8WJ0H+KksQVRYe0vUidH24mHt5clB+vNCa/Rm46Ei8Fi7n5ber06rTQasMw1YUrb9O/VQa67dHG6Hfwo+uNedaPKSefD0IrJ8t25/faQ4UXDqcfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GjW7MvUpcboauwxH+PDQKBqn1sy7t1y9CujFkcJAkoQ=;
 b=LMeiJW5wUkzlHI4HjkXcNyillpcCDvUXtzlmsknFfy3P+dP0Az7aSgBziuFmAXN9kyhvWb79wOTtK5yVumXVVPjQgmNTSggLEZ0r8I6JXoM+CWStb1D2G3YHV4H2/oHPzVqFPz2Y8AjUEG7N8NCJ9xDPPZi+JIbYJF/DrcBG2Hfn18yXZoyxtKUCudx+c0xcs0AvZj2aCTZAslr7Myc0FUaXn5B5cMG1zPzvSA0e1L4avQQpfxFjtjBpjMUhOe43LFybikEMwjpBKP12I4OvYv+A5p6ESBYxKFjUDfWt5KGUMI7wabBPMTsEAkgX2z3zjkvMOQdVFBQvSEcJC1+45w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GjW7MvUpcboauwxH+PDQKBqn1sy7t1y9CujFkcJAkoQ=;
 b=AZlDG7gOnXEsmZX8zcIGT8O0GdmEhfFNggCFb+jzQEvidpLnc4qhoaA0HnPDivj1ycXgxspCO8n6r19SmmOBI11NiHIAdy4IYMmDThOrRRDuNLzKIcEVLkatCBxVBFkTJgNxbqRh9yq7gSWD92AVj0VDIjL3POMcdAD8OqsEvdY=
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com (2603:10a6:20b:118::20)
 by AM7PR04MB7079.eurprd04.prod.outlook.com (2603:10a6:20b:11d::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3000.25; Mon, 18 May
 2020 23:58:32 +0000
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::7c34:7ade:17d0:b792]) by AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::7c34:7ade:17d0:b792%9]) with mapi id 15.20.3000.034; Mon, 18 May 2020
 23:58:31 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     Sid Spry <sid@aeam.us>
CC:     Felipe Balbi <balbi@kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: RE: Documentation for Raw USB ConfigFS
Thread-Topic: Documentation for Raw USB ConfigFS
Thread-Index: AQHWHxIE3BZgWTm6XUiOBTDqqvXTpqia0EkAgAnRnwCAARJFgIAAKfQAgAH+RoCAAIp4IIAB6N+AgAMiPQCAARNLgIAAHDvw
Date:   Mon, 18 May 2020 23:58:31 +0000
Message-ID: <AM7PR04MB71575A56A92CCFDE8B460FC88BB80@AM7PR04MB7157.eurprd04.prod.outlook.com>
References: <0507a041-44f4-4257-adaf-3b17de3baf81@www.fastmail.com>
 <20200506091750.GE30237@b29397-desktop>
 <8ee3914e-7876-46aa-bade-7cf14df7efdc@www.fastmail.com>
 <87h7wkp9qy.fsf@kernel.org> <20200513100614.GA3698@b29397-desktop>
 <6cab4113-b4ad-43d9-85fc-f68682cf0259@www.fastmail.com>
 <AM7PR04MB71571747B1FD3B2FFBB8DC9F8BBD0@AM7PR04MB7157.eurprd04.prod.outlook.com>
 <9fee6fcc-6156-489f-838b-114903f8e751@www.fastmail.com>
 <20200518054914.GC27612@b29397-desktop>
 <83ac8b7b-e0e7-4615-8ebf-4c98e596577b@www.fastmail.com>
In-Reply-To: <83ac8b7b-e0e7-4615-8ebf-4c98e596577b@www.fastmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: aeam.us; dkim=none (message not signed)
 header.d=none;aeam.us; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [119.31.174.66]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 76b013a6-4f5b-4353-3f44-08d7fb875e70
x-ms-traffictypediagnostic: AM7PR04MB7079:
x-microsoft-antispam-prvs: <AM7PR04MB7079087619B6225AC3B6D5F88BB80@AM7PR04MB7079.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 04073E895A
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 6hvM3mYFp8+8hlN0xDEeEh6onKYz0rvWVo9XgpPicfAQigQe7rGC4FIRLkqicrePbF2w4ug/1tyKL68e9k+6Obnu/93yQc3A/qHExaGd6eAmnQgkjorUVTGqIMRXDjnU4oB6zB542CnkBbRnwOLGSyLrXF3nxxnxlutf2fPSyh7fkmMsG26WsC3rLjEgzpd59lj5hA/E2+irfBBK1adUgFaGEMQspz89vdRE+ep+O3T03dz9eu3VbOkmXJIelfqhBDUoYlUJVeHsSqbuZsTwOexLl/28Q9VC/GQWvEZq2GQ0b5VV+edyWpQsjz31TBPrUFYk4muq1qbpIEnXSRknv4EyxGa4//Tc6lXA+IWZUlrQzk3UKLMJKqAkTzkWQEZi8Hhazj09lz0vmtILw6GjuiEzMixgQkduvQOmtlf2oRBYG73WRuc3UVnJljGZ1zgv
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR04MB7157.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(39860400002)(366004)(396003)(346002)(376002)(136003)(478600001)(186003)(6506007)(9686003)(8936002)(64756008)(66446008)(52536014)(66556008)(6916009)(26005)(66476007)(33656002)(44832011)(86362001)(66946007)(55016002)(5660300002)(8676002)(54906003)(7696005)(2906002)(71200400001)(76116006)(316002)(4326008);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: reb3fDSO3uyjav/r+Ttcm7Q/LT0DPniZlYHFIl7sBAEBoBl9Yvx5N4vN8VYE+O35taTIU6rRai3mkMPZ/5/A658UEORCltZ/BI/vsqckqjEyRTAE3RC3HK8cA1bAsLble4bwqnYgskX/x6GNGcrNWiiG7Wu5kUp1EMO3SH47+hoRxRBzcMBc/kD+i/oingBouXIbg/dKMfYR7P1YEHX57sZp8D9NnMMNJKfWQOLCjN+nibsjVogebbQxnEI+377shYkEoP/wo5ESsTe0LYrMj6pK207C9/vJzvXXxm4f0u2RJPB5w/egrSs0VBTTCMC8Bt8wKA2vLSyzvjWzd2Hgsl8gB27RANHn0QcexsO4Dg+rH0irpNkPYbnSfJ9ameSrE3EYvPStFU5Cub+pASHO1eoksD+gyOjnsIb0MR2DrZ0CQIQ5hydK+ysL4415UZNVx8UUyVG7wzASG/JuUwp11rTl2kVQei7TmILmxsLYqoo=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 76b013a6-4f5b-4353-3f44-08d7fb875e70
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 May 2020 23:58:31.8481
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RMI/AYqLXj7vSEdbYuXCN939tMkPsX4b5gwh5AWnUOa3Jw0B/zmDS1UaVAFKpPbhL7clyP13q2L6415ru/HlGw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB7079
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

=20
> > 2. Try exactly the same script I gave you, do not try change any
> > charaters (except the position for your application)
> >
> > > > cd /sys/kernel/config/usb_gadget
> > > > cd g1
> > > > echo "0x1d6b" > idVendor
> > > > echo "0x0105" > idProduct
> > > > mkdir /dev/usb-ffs
> > > > mkdir functions/ffs.usb
> > > > mount -t functionfs usb /dev/usb-ffs ln -s functions/ffs.usb
> > > > configs/c.1 /home/root/usb_test/ffs_test/ffs-test & /* your own
> > > > test application */ while [ ! -e /dev/usb-ffs/ep1 ] do  echo "."
> > > >  sleep 1;
> > > > done
> >
> > >
> > > [1]: I actually did not have CONFIG_USB_CONFIGFS_F_FS nor F_NCM/ECM
> set however the necessary code seemed to have been pulled in some other w=
ay
> and the modules were available. They were loaded, and as explained my she=
ll-
> based configfs code worked. They are set now and the problem persists.
> >
>=20
> Hi, sorry I was not clear. The kernel config is fine, and
> CONFIG_USB_CONFIGFS_F_FS is set. I run your exact script (minus the ffs-t=
est
> line) and it fails to create the functions/ffs.usb directory as I describ=
ed before. I can
> create other functions just fine.

You may enable debug at configfs.c, f_fs.c and your udc driver to see what =
happened.

Peter=20
