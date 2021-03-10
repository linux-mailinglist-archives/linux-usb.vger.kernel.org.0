Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D6358334BE2
	for <lists+linux-usb@lfdr.de>; Wed, 10 Mar 2021 23:46:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232874AbhCJWpn (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 10 Mar 2021 17:45:43 -0500
Received: from outbound-ip23b.ess.barracuda.com ([209.222.82.220]:49602 "EHLO
        outbound-ip23b.ess.barracuda.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232446AbhCJWpg (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 10 Mar 2021 17:45:36 -0500
Received: from NAM02-BL2-obe.outbound.protection.outlook.com (mail-bl2nam02lp2058.outbound.protection.outlook.com [104.47.38.58]) by mx-outbound47-157.us-east-2c.ess.aws.cudaops.com (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO); Wed, 10 Mar 2021 22:45:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cgVt7GIgPRdOMxXHpxJEep7od09d580YktZ5cPdHCrt2lr0dCeqDV35ZXgo2F2wXL+L8WqsyiMVnQ4I8eJOHNuSBEyr0PXtpDOkOQi9qxEuXkZOYzBOqzT0H3rSg9Dsf2gUQ0tEMBH32UVz85WJZXZFoqFaEPphLFGcwFSLIEHSaoCcNVhL6ZnU1+TQy9wgGfQNBVQROuUbZ+vHI217F2nN6cNnY08fTRZaqL0slcUZVHRKpFFq54kN8ebGvHL+CGgtw62h5XYquDTFGYk/Jax3J8Sj1rPk4I2d5BEIEDG+LXg8P6lDvztxo6ohysxr+Mt+ObvD5olVtH2SGw3OGkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k4hgm9lLlaFYrpXpxOFbm2z0BX/4nQT56wAxQNmp2Ig=;
 b=mHrPhs3OwpBa4VXZrlzsCv90vDmEWGTRl1DEQMXc5x69firwBu12kBr9FK7vYRgjp5B1uh2/Ze7nwAIEBX5aO0EOI9X73Sr8YLc8vmc/E9MG2vopgPJG3IzadTt9wQ9H0ndGqQ+LgVwed836IpvdEwDQoXxA1gONvrlxxgikoqgu5Sm3RHklckOXUqBxqIaLeEydMrtAImsQqGhbakxi3WERVuRfCMhnL6Y7TY2D+H58UQCxnS5pVjTQXYNG5NzTQ9J+e697IqPH+cZnOayABymdkGiAOLOtq2Cj+408nf1/09N1mQIy2vYZW5aDEaG4w+DWBf/PMnjWHiB+iF88Sg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=digi.com; dmarc=pass action=none header.from=digi.com;
 dkim=pass header.d=digi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=digi.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k4hgm9lLlaFYrpXpxOFbm2z0BX/4nQT56wAxQNmp2Ig=;
 b=HkBtBCwLvwiRAO0raNeTeDMN2FC+NxcInAFEy+3ihcz2dA4i5iiFVqQzCexjKpE56QPJJWa/SxCT3xsplI1AEGL+x1eZlWi37SOJIPB5hq6ZH5pWMYZSMHiFQIEMtV+olXwGzGJrWwbJzzTJVdRtpZu0+PbL2F2pv5lrNK2bd9c=
Received: from BN8PR10MB3698.namprd10.prod.outlook.com (2603:10b6:408:ae::22)
 by BN8PR10MB3556.namprd10.prod.outlook.com (2603:10b6:408:b5::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.30; Wed, 10 Mar
 2021 22:45:30 +0000
Received: from BN8PR10MB3698.namprd10.prod.outlook.com
 ([fe80::e8e5:3b9:fd26:51e]) by BN8PR10MB3698.namprd10.prod.outlook.com
 ([fe80::e8e5:3b9:fd26:51e%6]) with mapi id 15.20.3912.026; Wed, 10 Mar 2021
 22:45:30 +0000
From:   "Ramsay, Lincoln" <Lincoln.Ramsay@digi.com>
To:     Oliver Neukum <oneukum@suse.com>
CC:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: cdc-acm cooldown + Cisco 2960-X = kernel warning + dead USB
Thread-Topic: cdc-acm cooldown + Cisco 2960-X = kernel warning + dead USB
Thread-Index: AQHXEUVE10rvB6LegkO+mDb2t9kGFKp7o46AgACJqhWAAMOYAIAA6oT+
Date:   Wed, 10 Mar 2021 22:45:30 +0000
Message-ID: <BN8PR10MB369812D5752326AABA0769D8E8919@BN8PR10MB3698.namprd10.prod.outlook.com>
References: <BN8PR10MB36989D7DC6402FDB1256ADAAE8979@BN8PR10MB3698.namprd10.prod.outlook.com>
        ,<395fc28de485f33071d358abf74b70ed1bcbbbad.camel@suse.com>
         <BN8PR10MB36988867624ADD97964F9EB3E8929@BN8PR10MB3698.namprd10.prod.outlook.com>,<d63ec5a9624d91ec1eb629cdc68349ede9e06c9c.camel@suse.com>
In-Reply-To: <d63ec5a9624d91ec1eb629cdc68349ede9e06c9c.camel@suse.com>
Accept-Language: en-AU, en-US
Content-Language: en-AU
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=digi.com;
x-originating-ip: [158.140.192.188]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2a731e74-e124-47d2-f110-08d8e41634fa
x-ms-traffictypediagnostic: BN8PR10MB3556:
x-microsoft-antispam-prvs: <BN8PR10MB3556186687C95059D5A1E76EE8919@BN8PR10MB3556.namprd10.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: R+fz4VNDCiajZiqz177SwluER9d8o6zXn2mIGE+HlmdrCGdb9SS8D1eZ1rr1yKLxn6mJTax4/iOU/PzNTw5+rhEZhh7JahmmjvqWyph6E+wCIaNrBFd6znkdvRFV2/unFMeIAkxPrdMgK0QWs1yMKWNXCeAxT0+XD96Bf0tgAvtcyCYXfrUbqxqT7dIk/FQLiseZ3xoTX2GP+p8osJnF2BV2HlALuKBB5bFnfxRty2qxMlBkPRdv6PEh8NkrYaNYxYPrPJ2YfkBO4vTJMeLGvivJyCZN8b6R+E6NhcxMEYd4ncKjbjGljY63WzLYUcTGW5O/E3LowoSuHErXgY3KxAp4vxtVV/D0chm9Dsrm6QjjLB1TNfDAaiK9M/4KKTgwypn7B4E2rUFHpH5nuYOLRzd41ZTuCtyIUrRCnrbR5cB9yEUMR7tyvqlFBLPrTE4NQc36sExqYD1BKSWkA+B1/NXIGp/Eai2nhl5RgYkeUaJ4MvucPsD+7gcqpxSYrv9O3mBOOVNekr8lFSzYR+Dq7A==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN8PR10MB3698.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(376002)(366004)(346002)(396003)(39850400004)(6506007)(66446008)(86362001)(76116006)(66946007)(2906002)(7696005)(66476007)(64756008)(66556008)(55016002)(8676002)(5660300002)(6916009)(91956017)(9686003)(33656002)(4326008)(558084003)(26005)(52536014)(83380400001)(71200400001)(478600001)(316002)(186003)(8936002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: =?iso-8859-1?Q?RsF7B7kTUOo/XO+K7x/KAUWFGGbncaxTis4ArzpsIZl0DCo5mbvgy0xd+d?=
 =?iso-8859-1?Q?lJQbQBdUFPgSonuewDoDesx5C7l9LC6W0gDJCIWXQLvj586XLhP3A5uv1f?=
 =?iso-8859-1?Q?pk1LHm0vgZ9FuJA0/s+zsikoUoAFVpQ9Vqh7HzEWkC+ZutJenUQo/Sm0Ej?=
 =?iso-8859-1?Q?q1tdKHoJF4CZR6w9ZcEIBxJ/epyinhTQwkYrvzcqTPZKtfa9nGRVVCwPpn?=
 =?iso-8859-1?Q?Bi9I+l1dqzKjJdFDobpOSeTTtpgVFgWFvF/Wx6A/FAUd24F5PD3SdUozQ+?=
 =?iso-8859-1?Q?YLuPZ8mT8vdVFw+KVDYosUUu0PFvrT4ejL+aaNKt+S/HAuc523kE1V0kXx?=
 =?iso-8859-1?Q?4e8WX2pJ2jJPs6Nt/QgCtfqx8f+dV7EaLphwcsqiSthxnHoKaWbWV43MmD?=
 =?iso-8859-1?Q?DxoCZyZ/Ntl4dbGYReoeZNJ5FAposrEhHFuUxQG65fAcHKffI7DSm4NUQy?=
 =?iso-8859-1?Q?No7uFg+fGIhqzcUF9jjinXtS0j30PlwpiRtkE+uZbMTQtDXneeM3HuIjgk?=
 =?iso-8859-1?Q?/xQ0dE08R/1miaKauQMXhszRMCsfjrYL9kfHKaP2NJVR4A08nCPxO5iYg6?=
 =?iso-8859-1?Q?Ckc/NQyFA3oPv7rU7DrUDAQ0qAqMiKwle4em83VNJuNIkl/6+rVAhU9b+H?=
 =?iso-8859-1?Q?xfVEwtgvISWepN/m7GwzG6G+NdgqWrcRc9gWmXsw1Rlf5nrISUukxGyLlL?=
 =?iso-8859-1?Q?YMzbrz/N1lM0m0VlMEEZJ9i5be48uYIU/P35Q/QW4oklnvYSrY6DDgqd2B?=
 =?iso-8859-1?Q?3G9wWjYCYFot88yqKnLnDWXnv1LSbFiShK8taP2/9wLaQ+eVKXX2IJdI06?=
 =?iso-8859-1?Q?u6JzGtZevMN5FTSNPlS6KR63OtcCxD7/gVK1Md/hpvJ/A9NZcSHLNQ2zEw?=
 =?iso-8859-1?Q?zYj24u9TA9QDhHav/gYnRKz9DCJGTnbIrEyLiGYPGWpvmU4+bF04DH+Dee?=
 =?iso-8859-1?Q?vMlvE2PGLIl/aOMfdVb4zAzn9UkOKRl2B1Vo3mFRKlgg2yk3VBzRltSi0y?=
 =?iso-8859-1?Q?/jGo3CzP9hn4Ulsa9i3RPq8eTT/O0KEMrdNr5AJjLLjAk42YHv2IehXtzD?=
 =?iso-8859-1?Q?3pEws6h7tguM2MA+wxlo1vhDmKCh7SCmRadWh0cruRDjTo4zWEZlwM90Ls?=
 =?iso-8859-1?Q?hcr6GOe0gNyv688teg4glCCxYSBtyt4PPjY90Pgt+CB1HZex84jVpzLAK/?=
 =?iso-8859-1?Q?C1AUMeBiaeYd3f71v3l3NxBQXcC22SFCxzIrDttDy9V56OzsHnAlnot1Fu?=
 =?iso-8859-1?Q?x64H1ynLa7RbjksqOk1AhkIPf1r3nqMRI56jPFJtLW4cHXw05GnZL/6FeP?=
 =?iso-8859-1?Q?1/217ksPZWTIj2vmDa/PFxffscsA+hPk8EwEHbpx9yqMxrgDxv/lc02hSo?=
 =?iso-8859-1?Q?qnAn/eKkoW?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: digi.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN8PR10MB3698.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a731e74-e124-47d2-f110-08d8e41634fa
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Mar 2021 22:45:30.0330
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: abb4cdb7-1b7e-483e-a143-7ebfd1184b9e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ScgedZMGNs4zgf94Kpc7jfhPY8J27YLn5BUlaziUV1oHaQ5X97bST2WqrDP+uqw7ComtrHZr9lMyHRrt2zrjew==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR10MB3556
X-BESS-ID: 1615416331-112189-31644-23508-1
X-BESS-VER: 2019.1_20210308.2238
X-BESS-Apparent-Source-IP: 104.47.38.58
X-BESS-Outbound-Spam-Score: 0.00
X-BESS-Outbound-Spam-Report: Code version 3.2, rules version 3.2.2.230745 [from 
        cloudscan11-218.us-east-2a.ess.aws.cudaops.com]
        Rule breakdown below
         pts rule name              description
        ---- ---------------------- --------------------------------
        0.00 BSF_BESS_OUTBOUND      META: BESS Outbound 
X-BESS-Outbound-Spam-Status: SCORE=0.00 using account:ESS112744 scores of KILL_LEVEL=7.0 tests=BSF_BESS_OUTBOUND
X-BESS-BRTS-Status: 1
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

> Good. So are the two failure modes identical now?=0A=
=0A=
Yes.=0A=
=0A=
>> Unless you've got any tips for dealing with the Cisco's brokenness, I gu=
ess we're all good.=0A=
>=0A=
> You could try the reset utility from the newest set of usb tools.=0A=
=0A=
I'll take a look.=0A=
=0A=
Thanks!=0A=
Lincoln=0A=
