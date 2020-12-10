Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 087432D57A4
	for <lists+linux-usb@lfdr.de>; Thu, 10 Dec 2020 10:58:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725953AbgLJJzw (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 10 Dec 2020 04:55:52 -0500
Received: from mail-eopbgr20072.outbound.protection.outlook.com ([40.107.2.72]:1254
        "EHLO EUR02-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725765AbgLJJzu (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 10 Dec 2020 04:55:50 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dBsyGC807wPAtpla1VOR5RIceJM8NoJTWsDJeV7bFpRD3d1EyyqFIrZv1Vf9rwheIFs5Y8IbxjTbVIwe6ZgdVCrT+eugwvUgiA0YCDfH2RySHj30n7lHLzWf1B17UqtZ12bk2QrD24b3pSRD1QOT2BYqLnkV7VjYF01sAO71gbIy/pJm84l9lQjaBO04ZwBXH0qfPaEIv6SVg5c2aenaocwpNpTE3b4Qfs7Z1QU5TN4g0mWXi08Iai5rITRipYi9UL49jsWThgBtztYYYXfqIoIaLBX3s29zcepKqngPig/1o3kQFNrj1MDxu+Z7/E5jGUewj9VIUEtSoojT0zK+Dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jrA8F3oGLzc+m7hI8u9WmgBKNb5nzm8gEg5HytjH518=;
 b=dlEvewKVeXBRt0ZBep6M2yUvIz2w7j15koZBN5fUD+ZhevVuiGXap3Tgm9NUODgT5+3HsV7qFyv0WCPGCqD6JZdj28KIR7HBPjeCbm7H8JeDFEPDY8YbrzOrx5E+BHwNaDOxvqXNUx1ZS1QSfnp5SQ+E04q5n72K+jvCJIYltd2pwtd54yP5kMbaygRsqQUEcVGP+oqLcnXixblKRRQaRxS78dciK+dpaDDFt9TL0mvUAJt2EXTPtEu1lAsqqFBvdFJ0etbPYRgIUc5GxgL4YpoL7loBCHa+KJhIKM24C0s5l7K5UKr8fmm0zytH5V7PNXy8plN+lkLlGMQovqZ6BA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jrA8F3oGLzc+m7hI8u9WmgBKNb5nzm8gEg5HytjH518=;
 b=bLF4ZPtNsbxXigvaU3khn1YcAEr25uW6UsVmH7muq0ETivTcMQvpbtux8B3KtJLHbq5q3OH9vQ03p82u9fXcyHzWMXHceJakHOQnYLm8zhM+ZmChUmAyGFoN4rx2K3ELG1My4m7Mq/E+OeP1vEMeGfnUgp5/bbY/j/XAQR55dM0=
Received: from DBBPR04MB7979.eurprd04.prod.outlook.com (2603:10a6:10:1ec::9)
 by DB7PR04MB4764.eurprd04.prod.outlook.com (2603:10a6:10:15::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.13; Thu, 10 Dec
 2020 09:55:02 +0000
Received: from DBBPR04MB7979.eurprd04.prod.outlook.com
 ([fe80::c8c:888f:3e0c:8d5c]) by DBBPR04MB7979.eurprd04.prod.outlook.com
 ([fe80::c8c:888f:3e0c:8d5c%5]) with mapi id 15.20.3632.023; Thu, 10 Dec 2020
 09:55:02 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: [GIT PULL] usb: changes for v5.11-rc1
Thread-Topic: [GIT PULL] usb: changes for v5.11-rc1
Thread-Index: AdbOkJNKdD/GWGK5THaEHNAiUEpgVwAReA2AAAALU4AAAPUgAA==
Date:   Thu, 10 Dec 2020 09:55:02 +0000
Message-ID: <20201210095432.GC2388@b29397-desktop>
References: <DBBPR04MB79797539F005D75D9717E0D28BCB0@DBBPR04MB7979.eurprd04.prod.outlook.com>
 <X9Hpn6mJhrjGUp7b@kroah.com> <X9Hp6/9j/UCNxZKk@kroah.com>
In-Reply-To: <X9Hp6/9j/UCNxZKk@kroah.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mutt/1.9.4 (2018-02-28)
authentication-results: linuxfoundation.org; dkim=none (message not signed)
 header.d=none;linuxfoundation.org; dmarc=none action=none
 header.from=nxp.com;
x-originating-ip: [119.31.174.67]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 5a8b4e70-781a-41d8-24f2-08d89cf1a9e0
x-ms-traffictypediagnostic: DB7PR04MB4764:
x-microsoft-antispam-prvs: <DB7PR04MB47643784739E43A5F66C517D8BCB0@DB7PR04MB4764.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4714;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: LA19uXNxOlJGLbsXYnN5onuQ2pbzkfQ0N/P+LTNVFxYX+qUeCl/TsytGD9NXomOgGECM99HUJM3dR+ygK0s6dSTCR/b60Wk8UwDu+EmH+lBfZQXvgzakwJEf4Ynv8wssOdb4lvoeJNF6T3bk4J2Y5V7jpszUK0YGJ46AZk4F5ppyiLNBKWCsD4kNFyTa1t5oFu/l3SfK6Ph90bmKDjHcuv9fe9NTaY8FrUTQacqlmwjR8zCgi+ee/KqjkCE9J+jMIVaIHDXyS8JXTqk2IUz2TyAiImktUKKiFvih8Be5gVLdneTmFTlxU7BXIPkmkzml
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR04MB7979.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(346002)(376002)(366004)(136003)(39850400004)(396003)(6512007)(5660300002)(6506007)(4326008)(33716001)(6916009)(8676002)(6486002)(86362001)(71200400001)(186003)(9686003)(4001150100001)(1076003)(44832011)(33656002)(316002)(4744005)(2906002)(53546011)(66556008)(8936002)(66446008)(66476007)(66946007)(64756008)(76116006)(478600001)(26005)(91956017);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?FlCNDwQKjn7IBSYeqaAs5ckwpASatMdmBC6wsyUb5qIdQxXOtTJl/S2xcmRB?=
 =?us-ascii?Q?PgT0Mn3WEmgHfAj9FuV+h2jD5SWbdp3vCR3nRCf/ztdgBxexi33FPMHj7TCC?=
 =?us-ascii?Q?tacsHdkKXB/T1dxUkSd4U3EQFQxcNNfqrVWHFBoSqWda2JMTQYW2ZjGpLRtt?=
 =?us-ascii?Q?QWIdDB5g05g2h98HVJp1IjPPpLu92plvpw8rUPtyZqoL5eJ66WcLyzVF9PDf?=
 =?us-ascii?Q?rA1IB4IUXRLfdEXOWcA7Dj9ntesgGVzyjMs8IEMJvK8ZkBIgND+Kmg8UhDRz?=
 =?us-ascii?Q?v0tidvnF4ZgReNtE2XkOhrSwKHgz2eMvzYGb5t5IilrrpdC7cug+a5Xn+kHk?=
 =?us-ascii?Q?fVscsZYoJTZ3F6yPDldC4JfNMBB1QiI5IjpQ/O/MbkmgltehaftPjCs5bhzs?=
 =?us-ascii?Q?HdiDukccNFxIu7R8VOs9UP0N8eTIV2W40ULasrcJX/YqKpHa5ZJXq4zxTEXG?=
 =?us-ascii?Q?LaVenN1EYyvcRVAvYa9sBps8DA2xn2Vk4DKZV6FPQTprmLlUPoARvL5eHehN?=
 =?us-ascii?Q?FKx6SGbDgopq15bhuO9W8wPffadLaJTVlYLj1fsryusKoTI7bpreUuVTXydw?=
 =?us-ascii?Q?LoWT9PHqJnv95ODN7iLnpFJrkR9ZTvXBksDxFWGkDGq9iw1NiJVRBNciv9tv?=
 =?us-ascii?Q?LmXZyuWWHO284rOBt7FMhqPBHNRohP8C6K9lffK4kp+HzorMeUz5CuEMADOe?=
 =?us-ascii?Q?6GYQIlJBEj1JOVnX0SvEFTxq3DIIKUNFvOVfZK6nzq35bYhedc35iziOqQcu?=
 =?us-ascii?Q?si5w3KRQAQ8IdfMXItDBxgEAFIQWNB/3M85Fm8SLjumeqLrlaSsDf7bRRleL?=
 =?us-ascii?Q?4YR/IwDsYh5Rp8v7PY+a5huCnTq/oGT9v/DHm6jwWZ0a0JymkpEFH53BN0im?=
 =?us-ascii?Q?gXF/vF+3GL1LUcOvicxju8wTuacn7ZjMfH/fIPVc5RPC0ExY6EIbRNA8VrWq?=
 =?us-ascii?Q?FkYa+kGLiwgQUm8zWj0dqAnQvGba7GcFoPmVTZk1c3qIDruyRykvoSRp4mc5?=
 =?us-ascii?Q?bR2b?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-ID: <7F718A0CC37E30429716F0AF5CE4A1C3@eurprd04.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DBBPR04MB7979.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a8b4e70-781a-41d8-24f2-08d89cf1a9e0
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Dec 2020 09:55:02.3368
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kYMhr0BLvYtEjYSQgJmHVb7jWj2xR0cerh5NKLypoIxpRYynD4BCXHq0FRpWClXvzI/T6K+GdmGxaMtFRUPnYQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB4764
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 20-12-10 10:27:07, Greg Kroah-Hartman wrote:
> On Thu, Dec 10, 2020 at 10:25:51AM +0100, Greg Kroah-Hartman wrote:
> > On Thu, Dec 10, 2020 at 01:12:21AM +0000, Peter Chen wrote:
> > > The following changes since commit b65054597872ce3aefbc6a666385eabdf9=
e288da:
> > >=20
> > >   Linux 5.10-rc6 (2020-11-29 15:50:50 -0800)
> > >=20
> > > are available in the Git repository at:
> > >=20
> > >   git://git.kernel.org/pub/scm/linux/kernel/git/peter.chen/usb.git/ t=
ags/usb-v5.11-rc1
> >=20
> > Pulled and pushed out, thanks.
>=20
> Oops, no, it fails my push tests with the following error:
> Commit: 107000a83af0 ("usb: cdns3: fix NULL pointer dereference on no pla=
tform data")
> 	Fixes tag: Fixes: a284b7fd1b8f ("usb: cdns3: add quirk for enable runtim=
e pm by default")
> 	Has these problem(s):
> 	        - Target SHA1 does not exist
>=20
> Can you fix that up please?
>=20

Sorry.

Force pushed, please re-pull.

--=20

Thanks,
Peter Chen=
