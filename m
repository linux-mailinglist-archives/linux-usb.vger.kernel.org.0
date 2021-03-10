Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F21E33332C3
	for <lists+linux-usb@lfdr.de>; Wed, 10 Mar 2021 02:31:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229875AbhCJBam (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 9 Mar 2021 20:30:42 -0500
Received: from outbound-ip23a.ess.barracuda.com ([209.222.82.205]:44726 "EHLO
        outbound-ip23a.ess.barracuda.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232283AbhCJBab (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 9 Mar 2021 20:30:31 -0500
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2105.outbound.protection.outlook.com [104.47.58.105]) by mx-outbound41-128.us-east-2c.ess.aws.cudaops.com (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO); Wed, 10 Mar 2021 01:30:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=noVts0KAcp0YhS8qTGNXM8nOjxw3aUBeVeQ4WT4F+dV4b3FsZstA9sUm3+A/knUDJhDWMlxVBQ6k/XqY1tNElsC1k8tNha2U/1KhHf/cHc4YgvcF+rjxETZUcEkHoSrfdtrHWuYWGfloFhrH3zMVdCCiL0nd4jzhKrA6A5q8Kkz9fK2gFJkVFaeA2w3usnHRDuT+jG86NscVjEwwUudK/Qs84OKgaBE+86ykRhRojBK1ho0ZXhfNXD5updzUb8c4riVL9JpQ3wSwu79M0cw9G3PrSwWs0P09R/GY7tKUvuvgqheTqbqBn+W8PORCXjSiKdVxYAS3wLwLBJDr0V80Og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZXpODWUZ3QnguIs3BtpJLWI1qwOL96dzJ+hM9XZ37K0=;
 b=Cvb7zmrhqp5tD/ugeaUZAM5vQ8irTIKgZugoEaPDLmw+2Bg9XQeqHhqVMpXIQlu+AlWNpCuXAVFuFMay0uo9McrDVEUdZtxweQfUJYY+hjEuP+5qfCQRebe4WsRMpB7SIpW5GkUczPC5Hwa8LABcr1Jt5HnWoIULkSVZU2Z9FJos1sicCiOxTnE3ZXXM0fIce5F5PDugjPps1b4Zkr7ttz9GTV/HrKpI43+2ZeZ88lo867RWzrtJ4HNSVZ3Tumy+f3qhW+UKE7CX4NQcT0cyZDPlSebLKgLLAYjkN3ORMeKghZsZtRiBteGzlyBuiMd8jzgoQKloQQi+l33ebS/tuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=digi.com; dmarc=pass action=none header.from=digi.com;
 dkim=pass header.d=digi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=digi.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZXpODWUZ3QnguIs3BtpJLWI1qwOL96dzJ+hM9XZ37K0=;
 b=XtItdLh2w24kE4XLZmhKliVfOuT6cxdYTUG/2Nqcyz3vij0zUzncTajparwdKtIY+aMQgCJj4IMN+BFlYNN/O53FFhMhyMoijZR3tq/nhCFqjgH3ZHQG8EWrPtDgDGH2+5DYaAVnHys4wEuN5umrEWRdFalD7Q/EzM60b3mxtUQ=
Received: from BN8PR10MB3698.namprd10.prod.outlook.com (2603:10b6:408:ae::22)
 by BN6PR1001MB2177.namprd10.prod.outlook.com (2603:10b6:405:2c::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3868.32; Wed, 10 Mar
 2021 01:30:21 +0000
Received: from BN8PR10MB3698.namprd10.prod.outlook.com
 ([fe80::e8e5:3b9:fd26:51e]) by BN8PR10MB3698.namprd10.prod.outlook.com
 ([fe80::e8e5:3b9:fd26:51e%6]) with mapi id 15.20.3912.026; Wed, 10 Mar 2021
 01:30:21 +0000
From:   "Ramsay, Lincoln" <Lincoln.Ramsay@digi.com>
To:     Oliver Neukum <oneukum@suse.com>
CC:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: cdc-acm cooldown + Cisco 2960-X = kernel warning + dead USB
Thread-Topic: cdc-acm cooldown + Cisco 2960-X = kernel warning + dead USB
Thread-Index: AQHXEUVE10rvB6LegkO+mDb2t9kGFKp7o46AgACJqhU=
Date:   Wed, 10 Mar 2021 01:30:21 +0000
Message-ID: <BN8PR10MB36988867624ADD97964F9EB3E8929@BN8PR10MB3698.namprd10.prod.outlook.com>
References: <BN8PR10MB36989D7DC6402FDB1256ADAAE8979@BN8PR10MB3698.namprd10.prod.outlook.com>,<395fc28de485f33071d358abf74b70ed1bcbbbad.camel@suse.com>
In-Reply-To: <395fc28de485f33071d358abf74b70ed1bcbbbad.camel@suse.com>
Accept-Language: en-AU, en-US
Content-Language: en-AU
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=digi.com;
x-originating-ip: [158.140.192.188]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 803bc8be-5219-4cde-a354-08d8e3641242
x-ms-traffictypediagnostic: BN6PR1001MB2177:
x-microsoft-antispam-prvs: <BN6PR1001MB21775977DF5A71B2EFDFFF3DE8919@BN6PR1001MB2177.namprd10.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2150;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: FeYbmOFaZ+v08+vQFR0bE1gj2KrRkFGWF9CShHjp9m8Xx2Kh5PHOJGWz3HjUoA1uoIIn7mOOFehMdPjvcG/kH18PJMxEmajU+hTGfmI7uIUKFszGKxl128upkm8C5D5fkrVh7lqv9mkdb+mDnnIAebRSISYZjX5h4hN1pzdHfAc5inJsRZ2p4G6uYRGf2/BsSTlKV7mjxf8vCMBF3ZestqdWhVLnITrAP/N252SmuExOJtKD2GphixicHgAywC7/W/rONOo9XkUSIAFhm4R9lIc56rppS+LJsm26ESCrnh0+HlBEEN24q0yf7+aQqtIfzl61ulDfdsxi0nKD+F9syzOQBqmABOV8yH1tf8VFBZmrOacObNNN//LjGj2Tdjnn9p0OlUqZ8ColutKlqG2S3HU6hh4Q5/pWdUstkmom5Fa2dpJ/dLDALaT7pMxuqN26aFVauiNUT7KwEZLDtgkQLsjb/XTXmQJ0KweIaf7J4n+iR2GU84jOf/FJfis+Fbv0MMer7qt14YueKSQlBLCGYA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN8PR10MB3698.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(346002)(396003)(376002)(39840400004)(136003)(2906002)(83380400001)(33656002)(86362001)(76116006)(66946007)(55016002)(64756008)(6506007)(66446008)(52536014)(9686003)(8676002)(26005)(478600001)(91956017)(6916009)(186003)(4326008)(8936002)(71200400001)(5660300002)(66556008)(66476007)(316002)(7696005);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: =?iso-8859-1?Q?CgaiWX6bCsEsqrwyZUHZJOptCb04JV4L0NfecvxTLJEhxve744wTOAc72W?=
 =?iso-8859-1?Q?KatWLZiiMoDz01x4OwE6/vQhCfc7ldBfn3NXoYjlvgdvFSLJR9IxxmP2uL?=
 =?iso-8859-1?Q?uT1TY/56oxIomGUJ5tmLQMiBAe8UOwyT+Ca+qiYDvWPs4X5dMtwRKlOrqD?=
 =?iso-8859-1?Q?X3lla7/0C0iQFnyw/Oucw49rp6CtYGgAPDq1CKxw0+BWeJ6jOTbW8xSjeB?=
 =?iso-8859-1?Q?QyJwFGftVnD985xP+QpoSM3pgcD4nF3K/e0vVDmQaW8Fbsb6nOTUz9+xXz?=
 =?iso-8859-1?Q?hBhX3bLCDc4L5HIVVCrPXvmu1dad/WqTyEqLYkp4Stw7aeAYQurBSYcmBz?=
 =?iso-8859-1?Q?Mo2FLeD2Jh80t30MT2nrdQTTuEygHkG71Mudz5t5ouobTUSrNHnPnXOlAy?=
 =?iso-8859-1?Q?ZIou4DZvdD+WfxjYvyyWbvzpPFn/ULcc+juy++auYjUU30gtnGdCHTm4RQ?=
 =?iso-8859-1?Q?5ljWGUiOQx2V/DV54hfblkhDT3Mlvsq2N9f7NGs6tlbsCczxSIEHhbqIQL?=
 =?iso-8859-1?Q?OrUtOPu7AMTTc9Rc204I4+3FrfRm7mrRUxJTFnt04EjowGyRrZBPV0ANLC?=
 =?iso-8859-1?Q?kNylp1PMrQ642LAIpw3GPRno7b7zAi49XPOXTzPzeToiK7BtDfZs4BTr2f?=
 =?iso-8859-1?Q?lZZsazHuNO3cKpGxzYVqGyp5RlFcU5uOVU6NftYNfJbx1HqfA79cs9qF35?=
 =?iso-8859-1?Q?kkkvlHsre2qwW3xqkYuM6O06eOf5ygmnK3uTT9BYLpyU+3ZNQBGTSddVmq?=
 =?iso-8859-1?Q?h3Y/P/OkhD8OjjEcgmK5xGQPmST1eezBevVRpUsjXj4R+TxJfgR79EBFl9?=
 =?iso-8859-1?Q?RwiYK7jAHy763Z9PjSDvLdppb1zN5gVbOs81kKrSqGn0RFxnzOwsEMb88z?=
 =?iso-8859-1?Q?1reqJYLi1VmhP+gZbKwUPiS5vc6hqH9VLTu1fuaKO6YyARcaRsR12hEdme?=
 =?iso-8859-1?Q?NRaJwz+oKXIvNb7/lSWGxTnhaN/1FK721pKu5x2oKEF7+dtEg7NPGAFCJl?=
 =?iso-8859-1?Q?YNd2BVNj1E+HRaK26CqcJW84YNYKxxXVqYrZevttfhaAbdy+Utfqkr4Tbm?=
 =?iso-8859-1?Q?Cp0QEeeBqD+OSRZZ5slQMsMNDJsDlJrvG89R4yOr410aKtRnjdhIaMVDsb?=
 =?iso-8859-1?Q?56tHU4W+DqGRVGiof/dCUtO0joXllhC4nn2mG3Sn3Rd30xcbQbHN4Rt5xz?=
 =?iso-8859-1?Q?h4SQE4s3WWN1+SuLbSwgy3DvsdFvmwmSyRsPFzq7YPzfPLhgQXp6kbCAlZ?=
 =?iso-8859-1?Q?MXhbKYtfvI6eRBDWDoyHAdG7cLvKltdKlXLYY1fT6VEqWNueDYKh8mD+MZ?=
 =?iso-8859-1?Q?sM1qlkD4xC6+XZIskTLfQ1J/cLRZGGUUvUxJ8F/7GwPo00E=3D?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: digi.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN8PR10MB3698.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 803bc8be-5219-4cde-a354-08d8e3641242
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Mar 2021 01:30:21.3558
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: abb4cdb7-1b7e-483e-a143-7ebfd1184b9e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: N2+7ZiKayOh6mog7SeuhUdKrU8uV3XOBkj6zJNBw7N6Sagy2Tg3gFGcm6aOu3LcLaoNwUxardBhw9YPI6YHqmQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR1001MB2177
X-BESS-ID: 1615339823-110624-5578-72144-1
X-BESS-VER: 2019.1_20210308.2238
X-BESS-Apparent-Source-IP: 104.47.58.105
X-BESS-Outbound-Spam-Score: 0.00
X-BESS-Outbound-Spam-Report: Code version 3.2, rules version 3.2.2.230724 [from 
        cloudscan22-191.us-east-2b.ess.aws.cudaops.com]
        Rule breakdown below
         pts rule name              description
        ---- ---------------------- --------------------------------
        0.00 BSF_BESS_OUTBOUND      META: BESS Outbound 
X-BESS-Outbound-Spam-Status: SCORE=0.00 using account:ESS112744 scores of KILL_LEVEL=7.0 tests=BSF_BESS_OUTBOUND
X-BESS-BRTS-Status: 1
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

> Am Donnerstag, den 04.03.2021, 22:59 +0000 schrieb Ramsay, Lincoln:=0A=
> > 1. Connect the Cisco 2960-X console.=0A=
> > 2. (Re)boot our device.=0A=
> > 3. Open the Cisco's console device (/dev/ttyACM0) and write to it.=0A=
> =0A=
> What exactly happens after that?=0A=
=0A=
The kernel warning about the empty work on the queue is printed to the cons=
ole (and journal) and then nothing. Reading/writing doesn't work (but it di=
dn't work before the cooldown patch either). The system doesn't die (ie. ne=
tworking is still going) but USB appears to be dead (though I only tested t=
he same console being connected to different USB ports).=0A=
=0A=
> Did your test kernel contain 38203b8385bf6283537162bde7d499f83096471 ?=0A=
=0A=
No... our newest builds use kernel 5.8.18 and that commit seems to be in 5.=
10. But backporting that to our kernel seems like a much nicer fix than rev=
erting the cooldown patch.=0A=
=0A=
I tried doing that and it is good. It doesn't make the Cisco magically work=
 but there's no kernel warning and USB isn't dead so the console can be dis=
connected and re-connected and it works again. Nice.=0A=
=0A=
Unless you've got any tips for dealing with the Cisco's brokenness, I guess=
 we're all good.=0A=
=0A=
Thanks,=0A=
Lincoln=
