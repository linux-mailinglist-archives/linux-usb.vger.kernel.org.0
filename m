Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B29BA1AFE80
	for <lists+linux-usb@lfdr.de>; Mon, 20 Apr 2020 00:04:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725959AbgDSWEK (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 19 Apr 2020 18:04:10 -0400
Received: from mail-mw2nam10on2115.outbound.protection.outlook.com ([40.107.94.115]:64737
        "EHLO NAM10-MW2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725848AbgDSWEK (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sun, 19 Apr 2020 18:04:10 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=egS38qpT4eIoxHBF9NylDKfBWJB/6R65ou0CfLp86apnQQVC/N5qk1TOWxb7sTNBSDpvwqLdKbNQtd9ZQwvMHKDi2Tpxt19JNC3zWu6C/5dM12NAfshSnrzs3M9QfJZhQ54ckpiNgMPu0SLrl7GgfO/m4MYim2MD8w6sejlHf5FgvbLsyixR+5Ek6n8I+zd6ShFltxBvf1zV/4/31uvjpKboUcj7tifDrURJwML0+pEGn72KTE+lIiHcrshCMQeYvhxmM24Y1Fcn9Xicmpo1yajxKsJ3ws1cI/CbixAIn6HcjmJVEfSROhtEBW95ck/+sTK2LQoPRIJgKehkTvuMfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K3crJmNXw4KH2h4tMiuIoSGjB/HIlfc6huMot8mWslc=;
 b=Te6oLeiZn4zW4Lr7oeIvZrVgMB97Lhv702j4XhBUmQTCim+yu09Rp7KxwzGkqHQ55lCNja+H/6uzeRSqf19+OdQW0+C9bgof/xMyaREowuNhzsRj/1xmXRk9ZncU0Vy3G0xIkNAiTT8vrAS2v1bwE/2t7nSORP4qxGXgvbp0xT6Qr2eMCQldcuu9must5voRTne4HGb8t4izKROzxqiFWfODI/NBBOEylXLtidsw3OeguuPRWEofLg0cNYuM/tI2gVCKF+c8BbKvbF7Qub78/gnJEbRYPZgOWJfudxJHkzfi8WeeW80OgE5El3sEr9gLwB0RbDJ+sdV4FHyN5QhYJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=northeastern.edu; dmarc=pass action=none
 header.from=northeastern.edu; dkim=pass header.d=northeastern.edu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=northeastern.edu;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K3crJmNXw4KH2h4tMiuIoSGjB/HIlfc6huMot8mWslc=;
 b=vrUPkjxwOXfd10O+trA17PCGJa3/82/dzR2r50VhDztmKBM6fUYaS05+/SqFG8o7lgOIAT3d/U6qE7NxuCwE9fa1X12h3kPZsVfqA74Eg9lxbPNQ6J01N4222By2Zic3la9doyGL4/jfVXNZ87J+zffj878+y6UkCTR82t6AF0U=
Received: from BL0PR06MB4548.namprd06.prod.outlook.com (2603:10b6:208:56::26)
 by BL0PR06MB4674.namprd06.prod.outlook.com (2603:10b6:208:29::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2921.29; Sun, 19 Apr
 2020 22:04:06 +0000
Received: from BL0PR06MB4548.namprd06.prod.outlook.com
 ([fe80::fd87:3891:70a2:bc5d]) by BL0PR06MB4548.namprd06.prod.outlook.com
 ([fe80::fd87:3891:70a2:bc5d%3]) with mapi id 15.20.2921.027; Sun, 19 Apr 2020
 22:04:06 +0000
From:   Changming Liu <liu.changm@northeastern.edu>
To:     "thomas@winischhofer.net" <thomas@winischhofer.net>
CC:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "Lu, Long" <l.lu@northeastern.edu>,
        "yaohway@gmail.com" <yaohway@gmail.com>
Subject: [Bug Report] drivers/usb/misc/sisusbvga: integer overflow in
 sisusb_getidxreg and others
Thread-Topic: [Bug Report] drivers/usb/misc/sisusbvga: integer overflow in
 sisusb_getidxreg and others
Thread-Index: AdYWlZ92yg6LNz1FSfO75HAVsMxGXA==
Date:   Sun, 19 Apr 2020 22:04:06 +0000
Message-ID: <BL0PR06MB4548529DBAEA7075BAE4289EE5D70@BL0PR06MB4548.namprd06.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=liu.changm@northeastern.edu; 
x-originating-ip: [73.167.12.228]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3845c4c6-7ed9-4e63-2eb1-08d7e4ad946a
x-ms-traffictypediagnostic: BL0PR06MB4674:|BL0PR06MB4674:
x-ld-processed: a8eec281-aaa3-4dae-ac9b-9a398b9215e7,ExtFwd
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BL0PR06MB46743BD65A226A68B53791FCE5D70@BL0PR06MB4674.namprd06.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 0378F1E47A
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL0PR06MB4548.namprd06.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(10019020)(4636009)(39860400002)(396003)(376002)(366004)(136003)(346002)(26005)(76116006)(186003)(7696005)(66946007)(64756008)(66446008)(66476007)(8676002)(66556008)(52536014)(71200400001)(6916009)(55016002)(5660300002)(75432002)(9686003)(33656002)(2906002)(81156014)(54906003)(478600001)(86362001)(316002)(786003)(8936002)(4326008)(6506007);DIR:OUT;SFP:1102;
received-spf: None (protection.outlook.com: northeastern.edu does not
 designate permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: cfnwYVf8kizQsSW5xDGpWNuipyAq9ZOBbHBAsaeIEs7++9jEy3web95QcPVbXj9GCvDQF/tHPB6e9KcRGSXnl9HTwWFBANjF0Dr6UG9Qb7DpYpVhmDOTyK8fCuDwqA4GpX8FpdfFqUN9isZPBBAujW3hVIy6Rt6+1MIn4291V/FBDHoF0K8M3uQHvi7+tyfZ4iYRAKQ65GhG4RupxaULCdamT1twY4IETsxQ2eT5fpEZ+MQq5ZUF9l7cTiY67LLp9t8zsnAl5z4ZTwscRbg9MH8cxdD2mJB0sM7ZNQIr6tQBbMX4/4/59DXMal0OFQz56RKe/WggeQgfKJDqbPHAhzONM7MxF0ykFGRTA4/p5AXd/y1K8/DljSedQ62MEI4Ng1RyI+XyyjPtiisVrMDQCqxdA22MhTvUu1ETYMXdRCmXkTrQ2hW0+IMSFjCfKVQf
x-ms-exchange-antispam-messagedata: OqHZiro6zDGtokINCoYjQZJCmiyGEvhYyQRK8wOqRChCgcKraJDuTh09zVWoaim8977X7CKS+CwlawlalujhpqceUlyR2vbq9ogea3Vm2HciqHC8fIQHUETXxqto0v1hzI4GS5g9Z3J/IZAi25VM3A==
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: northeastern.edu
X-MS-Exchange-CrossTenant-Network-Message-Id: 3845c4c6-7ed9-4e63-2eb1-08d7e4ad946a
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Apr 2020 22:04:06.5197
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a8eec281-aaa3-4dae-ac9b-9a398b9215e7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yDakJfvovMfLiG3iZ1S4731RXh7NAB2JV+xSyObT8tqPxiG2TuKzZTcdGgE4/1Js803VeTVAkEdvRt8TpULZWBqZkbHpBDrRYADvec7Ipfk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR06MB4674
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Thomas,
Greetings, I'm a first-year PhD student who is interested in using UBSan fo=
r linux kernel. With some experiments, I found that in
drivers/usb/misc/sisusbvga/sisusb.c sisusb_getidxreg, there is an signed in=
teger overflow which might cause unexpected result.

More specifically, starting from the fetch function in func sisusb_ioctl, l=
ine 2959, struct sisusb_command y is filled with data from user space. Then=
 diving into=20
sisusb_handle_command, the signed integer, named port, is casted from y->da=
ta3.
Then when executing sisusb_getidxreg, the signed integer, port, is used as =
32-bit unsigned address in function sisusb_write_memio_byte.

The suspected problem is that, in sisusb_getidxreg, or other functions that=
 have similar behavior, e.g. sisusb_setidxreg, the port integer value is di=
rectly from user space, and is used as port and port + 1. So port + 1 might=
 overflow in a contrived way. With port being a signed integer, the overflo=
wn value might be undefined. Perhaps change the port integer from signed to=
 unsigned would help?

To change the subject a little bit, I noted that, although all facing user =
input in sisusb_handle_command, sisusb_clear_vram does a good job vetting t=
he address and length input from user to keep them in range, while the othe=
r functions like sisusb_setidxreg mentioned above, used the address without=
 checking. I'm wondering, what caused the difference? Since this kind of ch=
eck can eliminate the possibility of the overflow entirely.

Due to the lack of knowledge of the interactions between this driver and th=
e user space and the real hardware, I'm not able to assess if this is an is=
sue worth being dealt with, I'd be more than happy to hear your valuable op=
inions, this would help with understand UB and linux kernel a lot!

Looking forward to your valuable response!

Changming Liu
