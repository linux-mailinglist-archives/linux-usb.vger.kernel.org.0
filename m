Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1B45E2C6038
	for <lists+linux-usb@lfdr.de>; Fri, 27 Nov 2020 07:53:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387981AbgK0Gv0 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 27 Nov 2020 01:51:26 -0500
Received: from mail-eopbgr20045.outbound.protection.outlook.com ([40.107.2.45]:41600
        "EHLO EUR02-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2387935AbgK0GvZ (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 27 Nov 2020 01:51:25 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TkIj9lQRn0bgYuiXaAueY16NreLKIS2GTqzh3oUQD+iT3Qu+xC+bNF5NthdNUmKQgMPedctXmK6/JeqM/aiGg2SBxisjDh6jmbAt5f/zv6q9NPoC+7U1OqLTEDlkEhSgTKe2z5NEWIyC+lmXG9q9GQsKPps4k5856o3ewgS4eoyLFlo47jVQ90XRChYHuhXxwEeIwJMoiK9vKJMhfArtJT9ko+kGPYlPUZgFFmJWB1cYvCS91YavoxgpO9oANBeaQkD9XCwhmwYK1ezgLxW3BV0lY1mCT7qzduaauEanuUhYFZQLhrFFvgB1LYlzk7jz1HXqADXd2dXM2MLG+fJ2PQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pUx1FASUypQ+lqUp6IuEm2kCUy0rs0Z04LXDwr8nDxg=;
 b=HrWzoPeFIWWSSpZ5N+XZ7IVFqnhqdyvjigERb05kxG1vPDbz9eE7eQmECYETa66DqKgvvlVzNQXxjRiRcgAyvmxWfEQp50yznasE+4GcDDiraTeaEm/+fudNYbAIZxXdMvTHcouNR4iAjiYdwXXdHIvfE+jAQgugNq3n+hE3EfzKKMDpgxNHOdaTFSHEwEk0/xrf0DORIi0jjl7ObiObZngoij1Qs+eZZwHTowD7o2AHuWrrqGZYwiY/Ps1EMQLoz4maqzdF0rtryt9KJfd8wwUgxnAGyfv0yhWNvhuKjMsxbL5JHD7w6j4c9Wm8Ru1Im1ECSn3qpMBMffkYX8OIZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pUx1FASUypQ+lqUp6IuEm2kCUy0rs0Z04LXDwr8nDxg=;
 b=F14T3G/cGwsuqLAEn32nkvR087zFXKi4Ea+og3YpxHi6L3+CGcb+Aa8rN+TvQF0gZBC3eDU6tUTL/JtFhwyIl5jlit6Kal9H1WZ3CIclhHfYW5/Krn3G3nd68WZteI7mfa8/FtF3faMhjz6gcf6k0kk6gcQnnLDUk6uUSd3Y3Ww=
Received: from DBBPR04MB7979.eurprd04.prod.outlook.com (2603:10a6:10:1ec::9)
 by DBBPR04MB6027.eurprd04.prod.outlook.com (2603:10a6:10:c7::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.23; Fri, 27 Nov
 2020 06:51:21 +0000
Received: from DBBPR04MB7979.eurprd04.prod.outlook.com
 ([fe80::c8c:888f:3e0c:8d5c]) by DBBPR04MB7979.eurprd04.prod.outlook.com
 ([fe80::c8c:888f:3e0c:8d5c%5]) with mapi id 15.20.3611.025; Fri, 27 Nov 2020
 06:51:18 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     Sergei Shtylyov <sergei.shtylyov@gmail.com>
CC:     Peter Chen <peter.chen@kernel.org>,
        "pawell@cadence.com" <pawell@cadence.com>,
        "rogerq@ti.com" <rogerq@ti.com>,
        "balbi@kernel.org" <balbi@kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        dl-linux-imx <linux-imx@nxp.com>, Frank Li <frank.li@nxp.com>
Subject: Re: [PATCH 2/2] usb: cdns3: core: fix goto label for error path
Thread-Topic: [PATCH 2/2] usb: cdns3: core: fix goto label for error path
Thread-Index: AQHWw8D+UOTz4LYHTEawhWrmYc0Hh6naMgAAgAFY+IA=
Date:   Fri, 27 Nov 2020 06:48:26 +0000
Message-ID: <20201127064757.GB22238@b29397-desktop>
References: <20201126065409.7533-1-peter.chen@kernel.org>
 <20201126065409.7533-2-peter.chen@kernel.org>
 <007261b9-92ec-9ca6-e609-f5d3a337f322@gmail.com>
In-Reply-To: <007261b9-92ec-9ca6-e609-f5d3a337f322@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mutt/1.9.4 (2018-02-28)
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [119.31.174.67]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: d65510fb-7039-4142-1bf3-08d892a0d7d0
x-ms-traffictypediagnostic: DBBPR04MB6027:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DBBPR04MB602783794C2433F84287932C8BF80@DBBPR04MB6027.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1775;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: LvtlRco3GODZC2EpJNpHtdopogvBccZwFim0y4zf2QtCrwWhwUJUpN7KGymzmsyGUBd5Ti27fIQxkqgA07iHmp8gdhRRZQKz6hQxotHr25UncmAxQzC1AKzu2MvXUs/PCFIkwHfEFoTknXCfcZ6qW+UrlFkcDMeQk6PDJvXXoJLkKdYm2JfIUQNYDSasgSVQDf41Dn8RW5FtA4rT4JDkdXX/cRj5gJnv6wsY8yrO951e7hbb6wZhMzMtBvkfthBiVZtCTrgyVuCSja+7arQAS8eCeKRc2p7FtzeUs6vakQBjOb7ZiKDRz3jb9lhtVsIT+0BxbJqkZpN+5cTTuMS4YQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR04MB7979.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(39860400002)(136003)(376002)(346002)(396003)(366004)(83380400001)(6916009)(8676002)(66446008)(4744005)(64756008)(6512007)(2906002)(26005)(9686003)(66556008)(66946007)(1076003)(91956017)(66476007)(76116006)(478600001)(33656002)(5660300002)(186003)(6666004)(8936002)(71200400001)(6486002)(6506007)(4326008)(53546011)(33716001)(54906003)(86362001)(316002)(44832011);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?ULRQxYqk2L5T4QNbwItJTPoGe+WNDtXjURKsSq87WYr2sJCoTpRJ+98xbHzA?=
 =?us-ascii?Q?cEL2DwcNAn0AHmxXtnf252J3J2UrL88c78ppPvr/Y7wCtuWs6AXLuq6NGPqT?=
 =?us-ascii?Q?on/w/I+i7n60zHeOoNp4/eQomTQs09NZX4+wv7X/3LMGHlHvEVtJ5Xe5BBmj?=
 =?us-ascii?Q?IGB//wr+nCUER4cdgqGMh5ZMzBM5s4FhQCMDebC2EZT53AXTXGKc0qx86/Ay?=
 =?us-ascii?Q?VEv03087JAd8NLhJvf8owSjDV7jNrW019nmoHv4Rvm8Bji/u7uEgywSNZGPu?=
 =?us-ascii?Q?7wNBUrwxAz60ABA2qgAn5YLfWXqMRItTd3E/5/BeCsJ89MOxoREvUc9EIBgA?=
 =?us-ascii?Q?wndtWLIKCEqmyrEWO0FGIsiem7KDxcO/ysPwrpE7bVoyVev72s3YfW3/8hAb?=
 =?us-ascii?Q?arOdTa61P1Wr07PF6rwW7EfMPq5bz3IPEMxaRF+bCO+tTBLMNW9rC8BWYOkU?=
 =?us-ascii?Q?5GbNIisl3MHXC4+jnQcBs6feluL3zEVPnI6flHD5kRJIuVhVggMdco/6TjK1?=
 =?us-ascii?Q?NyrsVi1kYtZr4lYbRARCx0naIDM/ZACijxUqyjAS1P6g5aIipPFfd11RQyxB?=
 =?us-ascii?Q?5nqOtOuzt52A6LnRez29YXFg1y5ZLv9cDQvtMcSImiOTnt5/9FqwBcVOmNU1?=
 =?us-ascii?Q?MeCBF+LBoVpQmYvlCxnFfi6Tk2na6ac6tIzd6Sv+2/v9+WDKZTjXHdG78viE?=
 =?us-ascii?Q?hOnkiB4g/UjdWFH0iFBHpPpXVJefr2H2WgzAyP5TpnmGo5zwsFfRZXKSvIsd?=
 =?us-ascii?Q?B5N5C25XKIExJ3R/gaduDN5oE6SZihvUoX4YNKPEcorrYfeejNLEsAq+Hjt8?=
 =?us-ascii?Q?kvXG0v7lcaZ9OFlF/vJcSlwPyNwBMYIMnI1TZpM3qlk/Wuv+uRCug560nS3W?=
 =?us-ascii?Q?YQKSq0JQAsXd39vXPPR6WzyciV4PXRpA4JOxsvQxZlA2lYe+sBU/HtVtoy5z?=
 =?us-ascii?Q?Hu0gsEJwQObTdtXMIXfH8+OW2+xjmgubQ1Yhb73/xkqFF6umu5UZdMUv+QC7?=
 =?us-ascii?Q?Oflo?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <D3773895ED142042A485BB97C7C2504B@eurprd04.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DBBPR04MB7979.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d65510fb-7039-4142-1bf3-08d892a0d7d0
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Nov 2020 06:48:26.5101
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jUhwBBWuJq7S07zReQSJOrxA0XdSRSZ3+k8MfiX400IjhT71UaIq97MnsSlhCGWqgvc8BIkAsHpekLoIo4bTKg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB6027
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 20-11-26 13:13:16, Sergei Shtylyov wrote:
> Hello!
>=20
> On 26.11.2020 9:54, Peter Chen wrote:
>=20
> > From: Peter Chen <peter.chen@nxp.com>
> >=20
> > The usb_role_switch_register has already called, so if the devm_request=
_irq
>                                   ^ been
>=20

Thanks, will fix it.

> > has failed, it needs to call usb_role_switch_unregister.
> >=20
> > Fixes: b1234e3b3b26 ("usb: cdns3: add runtime PM support")
> > Signed-off-by: Peter Chen <peter.chen@nxp.com>
> [...]
>=20
> MBR, Sergei

--=20

Thanks,
Peter Chen=
