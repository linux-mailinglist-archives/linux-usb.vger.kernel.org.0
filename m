Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C0EEA2EB118
	for <lists+linux-usb@lfdr.de>; Tue,  5 Jan 2021 18:11:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729285AbhAERLE (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 5 Jan 2021 12:11:04 -0500
Received: from mx0b-00154904.pphosted.com ([148.163.137.20]:52382 "EHLO
        mx0b-00154904.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729230AbhAERLD (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 5 Jan 2021 12:11:03 -0500
Received: from pps.filterd (m0170394.ppops.net [127.0.0.1])
        by mx0b-00154904.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 105H79FZ023384;
        Tue, 5 Jan 2021 12:10:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dell.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=smtpout1;
 bh=g9ljEtmm1fd0PP8xidml2TD1nKZjnFomiXwNe3aMGYY=;
 b=w3DcPBeXpJuPRrPuqW9izUEQupkrD+20aUhDnu8Mim+Izimq9meBWo5b00hj8WdlAToF
 2+Qir466OTFDQPmc9YlBl3bEvI6DaiKvXY52m1gKk/umT6M7y2/sAfvaVetqY3hekZDv
 BNGSRmBzKBQ1qxN+iAhEeo5siQf7nPRbMPN8Jw4qSnRGSys7Hc3sC3QqgktaN9xJ01UB
 MMKDCw7eQgqptmZCfCQTwatJrFEGBl89kohYHxLbq1+mHF0xBiGKi56owLVqIcoN5QEA
 zrZ9njrLjqncA6amIEK9yWTLWz3QJTHLDWMpwxyRXQQIAr3Nqnlju/4dDR11t82etFpm Zg== 
Received: from mx0b-00154901.pphosted.com (mx0b-00154901.pphosted.com [67.231.157.37])
        by mx0b-00154904.pphosted.com with ESMTP id 35tm9aa586-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 05 Jan 2021 12:10:16 -0500
Received: from pps.filterd (m0144104.ppops.net [127.0.0.1])
        by mx0b-00154901.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 105HA9lG110331;
        Tue, 5 Jan 2021 12:10:15 -0500
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2109.outbound.protection.outlook.com [104.47.55.109])
        by mx0b-00154901.pphosted.com with ESMTP id 35vt35tfw7-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 05 Jan 2021 12:10:15 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LL/SuwuXy666EFKWkioaQFwtplF4gnXYlX5kbT4h8E+ODoXARwSVu0Kg5P9aAX9rKiSxGRFxmXvfeeUKUKLtXxpoak4m/aStq5U6TyaIJ74EBw49e0Z0lO3OD2JCr13xt4Kh7axQz/i3XiKR3DIf+vrlOn9wwhhCJu43of/r4bD3Z5o9jzftAretgMugr1MoYE3kgkFZnOi3NflbTiOkULeyt+pqr88oHlF3VHWjF22o871bytSY8qrTfzYhJMPyBsPpBH0hwsHgnLNI+4KQkl/+MkDG4nW9ka04I/grxDnxk4H5SziInj7g+mZJ5tc5FsbCaERg2MMg633p24wfSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g9ljEtmm1fd0PP8xidml2TD1nKZjnFomiXwNe3aMGYY=;
 b=oYvuT1Wdp3BtTg3LItaruvic29IdfTxVvVMdeSxhy+lZKijJ01fdSLXpsQJiNTaqRMjFDXq0sWEZ7smAuu3l2F844WpTl/WXphpjNoWYce8rBImnQ5KH8d8TttE2G3W52qXw8ANZCr0ltIUYyJFItBKKmMhy4UABYJg0cPJvrEHXIEBnkdBsnIq/e711e9xcjrHYQ3E+bRjF5nMtCdOdwZxhHCsisJUtGBPTWLkjdbSXskogaFE96MoFlE/gFngOyVi6ioLyP2ZcHmzrSXsMu/Jx+syvbx/8ofPIQfDLnwdl5ci2nzeNECsnZ8Q8EbUCrZiIu7apXZ00bCst1jVBFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=dell.com; dmarc=pass action=none header.from=dell.com;
 dkim=pass header.d=dell.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Dell.onmicrosoft.com;
 s=selector1-Dell-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g9ljEtmm1fd0PP8xidml2TD1nKZjnFomiXwNe3aMGYY=;
 b=kMI5z0cGMEWO8mjB6xk32I4FJ5GCswyW5pQqOYqco0iUhlzkBP3O/Osx268mK+l8wFFpxCkETCWEXGqiknhf5J4WV+D13FKpodHm3BVeTXaQlT6g4JaevYS1RPKLrBsIyTBWqo1b4lCuSDt0yE3oKpqR2sRuFFw2rcF7RaVwJkQ=
Received: from SA1PR19MB4926.namprd19.prod.outlook.com (2603:10b6:806:1a6::18)
 by SA0PR19MB4368.namprd19.prod.outlook.com (2603:10b6:806:81::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6; Tue, 5 Jan
 2021 17:08:47 +0000
Received: from SA1PR19MB4926.namprd19.prod.outlook.com
 ([fe80::e14a:eb33:4847:6cba]) by SA1PR19MB4926.namprd19.prod.outlook.com
 ([fe80::e14a:eb33:4847:6cba%3]) with mapi id 15.20.3721.024; Tue, 5 Jan 2021
 17:08:47 +0000
From:   "Limonciello, Mario" <Mario.Limonciello@dell.com>
To:     Mika Westerberg <mika.westerberg@linux.intel.com>
CC:     Yehezkel Bernat <yehezkelshb@gmail.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Michael Jamet <michael.jamet@intel.com>,
        Lukas Wunner <lukas@wunner.de>,
        Andreas Noever <andreas.noever@gmail.com>,
        Christian Kellner <christian@kellner.me>
Subject: RE: [PATCH 2/2] thunderbolt: Add support for de-authorizing devices
Thread-Topic: [PATCH 2/2] thunderbolt: Add support for de-authorizing devices
Thread-Index: AQHW40UbuPmeFcyxZ0GCSFVJ5I1lb6oZDcWAgAAtgACAAAEnwIAABy8AgAAAbtA=
Date:   Tue, 5 Jan 2021 17:08:47 +0000
Message-ID: <SA1PR19MB492650ECDB56E0F2EACA574CFAD10@SA1PR19MB4926.namprd19.prod.outlook.com>
References: <20210105092808.15817-1-mika.westerberg@linux.intel.com>
 <20210105092808.15817-2-mika.westerberg@linux.intel.com>
 <CA+CmpXuFcirdh_bp1=MmXr9KHJ2XdoMiBL9ORyntoFcxpJyJYA@mail.gmail.com>
 <20210105163624.GH968855@lahna.fi.intel.com>
 <SA1PR19MB4926E78435DD9276364D0818FAD10@SA1PR19MB4926.namprd19.prod.outlook.com>
 <20210105170614.GI968855@lahna.fi.intel.com>
In-Reply-To: <20210105170614.GI968855@lahna.fi.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_Enabled=True;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_SiteId=945c199a-83a2-4e80-9f8c-5a91be5752dd;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_Owner=Mario_Limonciello@Dell.com;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_SetDate=2021-01-05T17:07:48.4500661Z;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_Name=External Public;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_Application=Microsoft Azure
 Information Protection;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_ActionId=5d51d40f-f5dd-4cbb-9a09-87f9e2f02b0c;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_Extended_MSFT_Method=Manual
authentication-results: linux.intel.com; dkim=none (message not signed)
 header.d=none;linux.intel.com; dmarc=none action=none header.from=Dell.com;
x-originating-ip: [76.251.167.31]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: db00cf88-94a4-436e-71cd-08d8b19c9104
x-ms-traffictypediagnostic: SA0PR19MB4368:
x-microsoft-antispam-prvs: <SA0PR19MB43682232916CCC076E3AA92AFAD10@SA0PR19MB4368.namprd19.prod.outlook.com>
x-exotenant: 2khUwGVqB6N9v58KS13ncyUmMJd8q4
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 4qUnGZGpZgbV5W7JhepLwU2rfOWWSNKb89LvfzjhTZzwDcAfsiYiHwu8RUOG85UOteD3SHTyf74XEpsgiuONYV8XZtRMVbi9C1stMArsQq6Se4kZ4TPso3mw55uXLw/z5IFR5jsGKjKyH0nGeFfwELXbeDFhmbngSjkmgCXAT/m5QeBgBVds/m9CV6JNYWi3MdU0HXwhyEqMnrHqqFdo2xAgaknEifstH4ylRYm8c4HVqU4T7bNB4yM57XPMK0SoVSm4bd0yaoOyDAiyZW5iU3kB128sO3Nsyzwt5XvdUjuu2q31TKqQBnOh4glJW0WW+Yigm31YPgg0YhZMvzcL9vswxbS/A/Tg/d1s11z8/8FHd42J/mVnXjBp6lqsPwNMBZhzvQ/V5Khl/KBN4ge7nA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA1PR19MB4926.namprd19.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(136003)(346002)(366004)(396003)(376002)(64756008)(55016002)(66946007)(66446008)(66556008)(53546011)(66476007)(54906003)(6506007)(7696005)(4326008)(76116006)(6916009)(786003)(5660300002)(9686003)(8936002)(316002)(86362001)(2906002)(8676002)(83380400001)(26005)(186003)(52536014)(33656002)(71200400001)(478600001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?Yhd3u8tpvSEV+xN4NZIotNlJRgwnzXu0U1lPIzARI736cqva95YKNqdmmC+K?=
 =?us-ascii?Q?KF9tItcmMR4ROmSM9SoW1OLppzvpuwABEj0gfz6y/9JPjB7m1rX6EPPFauvd?=
 =?us-ascii?Q?ys61rubCRVgA6/yT/vc/7UAh3jd2VXVzmxiR49I39zRQQrm77UwtOUBJbbQB?=
 =?us-ascii?Q?Nk/ptw+YicmYBDc6LxAPX90l92Tw7mDhxMH/4lN3rSXMcd4NTEtVKdDl5usZ?=
 =?us-ascii?Q?4npQ5ydq5dHAieGLtf7iF9mwGYmkdMHDAA/NMvzqe0pdkEtJ888FoZroNq2a?=
 =?us-ascii?Q?u8Ozqcqu+GevvUSzDxG/HBjyWPhadQnkl8bDTmHSKjs7vFtXD52ZNQF6gKRe?=
 =?us-ascii?Q?UeJN09dhJHmZNT1jJrYT6LviloxawBSheTAoM/MtCtZR2AlIHLOAp1RrmXcp?=
 =?us-ascii?Q?snb6x4N07UilDkhivWSwi0Tt4yg2wW7krqI8AQv0ptCCpSb4qxYen3D3DEVn?=
 =?us-ascii?Q?tT9AJFZdYhr+sQv9J1gHpz4bIdybmQT7AmeLhq7nDMFts5zjc83lYydvgebU?=
 =?us-ascii?Q?0j9xCJSVcaPOJuknelHOd6ZNpGdqlXV9996vTqFahA9K8dx9rPhQMGA2IJ52?=
 =?us-ascii?Q?DZ++SS/HBxmiLfRYMaunhMPNDJ3wlb70/N3tIz8cLieIONKuf/TZ0bn4bB/x?=
 =?us-ascii?Q?LvOVfsiIh6RjfxbXVzUdvRi5MXr9ysH+PTBuUoRX2R+Fm+h5lCJGbYsJzUz5?=
 =?us-ascii?Q?X2Gqeaq/Yn+Qaf4pP8OVBneTdG9uNiW66OPmrkOcwhbzF7q3ta+2FyF0yZoB?=
 =?us-ascii?Q?rz4bINT9KOrffXkL/d1sFBZG1vyLYmJY6bPbprAeMnvMbe3FV0zp7l7lGHM2?=
 =?us-ascii?Q?EYhGWNQ8bkKo6GpSzwh3fK8F9uL2HoV00Invv7Awg900ZlOO3ZN8DM7fBB+6?=
 =?us-ascii?Q?gjQrAiIpvHUFcg0PiHN8c55Ttq1unzSUOjDvMSixsqcA3fBwGfil8i0lBKng?=
 =?us-ascii?Q?fbPLZQwGPagUiQ6vp/0H/PSObfOZYdCnlh2UpdeDBcA=3D?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: Dell.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR19MB4926.namprd19.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: db00cf88-94a4-436e-71cd-08d8b19c9104
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Jan 2021 17:08:47.7503
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 945c199a-83a2-4e80-9f8c-5a91be5752dd
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JL2XVZEqKiWftZe8YFwx/5Bo+CtPnNnvTw63v1pseG+0EnHmf5zekYFfCwEUJ+36ADr95bNKEEMj0MvoZ4k65+xRInguWVEpiFswHMiLkUE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR19MB4368
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343,18.0.737
 definitions=2021-01-05_05:2021-01-05,2021-01-05 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 priorityscore=1501 adultscore=0 clxscore=1015 mlxscore=0 spamscore=0
 impostorscore=0 bulkscore=0 malwarescore=0 suspectscore=0 phishscore=0
 mlxlogscore=764 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2101050102
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 adultscore=0
 suspectscore=0 mlxscore=0 bulkscore=0 spamscore=0 mlxlogscore=886
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2101050102
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org



> -----Original Message-----
> From: Mika Westerberg <mika.westerberg@linux.intel.com>
> Sent: Tuesday, January 5, 2021 11:06
> To: Limonciello, Mario
> Cc: Yehezkel Bernat; linux-usb@vger.kernel.org; Michael Jamet; Lukas Wunn=
er;
> Andreas Noever; Christian Kellner
> Subject: Re: [PATCH 2/2] thunderbolt: Add support for de-authorizing devi=
ces
>=20
>=20
> [EXTERNAL EMAIL]
>=20
> On Tue, Jan 05, 2021 at 04:48:23PM +0000, Limonciello, Mario wrote:
> > > -----Original Message-----
> > > From: Mika Westerberg <mika.westerberg@linux.intel.com>
> > > Sent: Tuesday, January 5, 2021 10:36
> > > To: Yehezkel Bernat
> > > Cc: linux-usb@vger.kernel.org; Michael Jamet; Lukas Wunner; Andreas
> Noever;
> > > Christian Kellner; Limonciello, Mario
> > > Subject: Re: [PATCH 2/2] thunderbolt: Add support for de-authorizing
> devices
> > >
> > >
> > > [EXTERNAL EMAIL]
> > >
> > > Hi,
> > >
> > > On Tue, Jan 05, 2021 at 03:53:33PM +0200, Yehezkel Bernat wrote:
> > > > On Tue, Jan 5, 2021 at 11:28 AM Mika Westerberg
> > > > <mika.westerberg@linux.intel.com> wrote:
> > > > >
> > > > > In some cases it is useful to be able de-authorize devices. For
> example
> > > > > if user logs out the userspace can have a policy that disconnects=
 PCIe
> > > > > devices until logged in again. This is only possible for software
> based
> > > > > connection manager as it directly controls the tunnels.
> > > > >
> > > > > For this reason make the authorized attribute accept writing 0 wh=
ich
> > > > > makes the software connection manager to tear down the correspond=
ing
> > > > > PCIe tunnel. Userspace can check if this is supported by reading =
a new
> > > > > domain attribute deauthorization, that holds 1 in that case.
> >
> > Just another idea, rather than the value of a new "deauthorize" attribu=
te
> indicating
> > whether this is supported how about instead a "connection_manager"
> attribute?
> >
> > My thought being userspace can potentially make a judgement call from t=
he
> information
> > on how tunnels are going to behave (particularly in long chains from th=
e
> suspend/resume
> > cycle coming back differently).
>=20
> I went for "deauthorization" because that kind of allows this to work on
> systems with firmware based connection manager too (yes, Intel Maple
> Ridge is using FW CM even if it is USB4 :( ). However, at the moment the
> FW CM does not support any if this but nobody knows if something like
> this will be implemented there.
>=20
> That said, I'm fine to change this to whatever you guys think is the
> best :) If "connection_manager=3Dsw/fw" or so is better then no problem
> changing that.

In that case I think you're right to leave it as deauthorization.  If there
is a strong enough use case to detect connection manager at userspace (IE i=
t
will actually do something differently from that information) that attribut=
e
can always be exported later.

>=20
> > > > What a great feature! Thanks for implementing it.
> >
> > I agree, this sounds like a great idea.
> >
> > > >
> > > > BTW, is there any general way to disable the device operations befo=
re
> such a
> > > > disconnection? The user has a way to stop removable disks, for exam=
ple,
> but
> > > > maybe other devices need additional precaution from the user (eGPU?=
).
> > >
> > > There are ways but it depends on the driver, I guess. For instance eG=
PUS
> > > at the moment (the ones I've tested) simply crash as their driver doe=
s
> > > not support hot-remove ;-)
> > >
> > > What ends up happening is essentially PCIe hot-remove so drivers that
> > > are prepared for that should be fine. Of course if you had mounted
> > > filesystem behind the PCIe link that was torn down you end up losing
> > > your data, so the user interface should make sure the user is aware o=
f
> > > that.
> >
> > I think it's also worth mentioning this risk in the thunderbolt.rst
> documentation
> > directly.
>=20
> Sure, I'll add there mention about this.
