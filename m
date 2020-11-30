Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5A75D2C7ED4
	for <lists+linux-usb@lfdr.de>; Mon, 30 Nov 2020 08:39:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726998AbgK3Hix (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 30 Nov 2020 02:38:53 -0500
Received: from mail-eopbgr140082.outbound.protection.outlook.com ([40.107.14.82]:45282
        "EHLO EUR01-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726299AbgK3Hix (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 30 Nov 2020 02:38:53 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JmOlMpEl2R/AI5+hnPNNZvE0J0Ae8mHqLCM76Uf8Q1PVx/wzjjJeuUTre8Oi7DGsSf+XSyXhnzr60EeXRB+5bncwvBfQYrV0H5p5OB1FiYEmJlTnDrcOxNvL/L0M+EFc3igYFgW4r8feRhIxY9SF+62n/YNETLOzmBsxCw7W9ueRCyMue5T+R2Po7MD1Ok0A2+DiD9C7TdnAg/BGHwOluuo2FrOQgib0k5OIvrXJODpnjKiY4YExuuDlyo4deU8Q1Ak7txibKNyCuwair7CG4fzDocklOf1nZrS6T76n0FWn6JwGbb8EYQOLl4rvyWAajK8mPRFMvqK7kZ1+v0+55g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YJKEZbHZ2T2ROptGWki1eudq03lcm/Q1iCNSxfG0ylU=;
 b=lBri0dGV/8OlHInBwSku/dHSYf7TsBCIZCvpfXt7bbua6/eJXeVNxP7F2khQb9l0lyUoumhDaz2L9FNGEKRyNJyehQa9HPhv+pejHlp5137V8mOen3IxOZvNwvXFsgrs4frk3+OLiuT4gqqvkseVc6Ix+YfFwJR+RGEyjBi6fn94PXgSEtaK+tPqklPCROzLRhGTOJ/ufEw+QtY7L0oskYZM9qxtm8GW5tLdTmmXEPJFu9irTpUmqkb/WrgazedRNiErew0jmwkP/f8DfUwUbAX6EAOELi/VruffGHJ+q/3/kLf8LzbQRoDImSRB5IXw7YzLQqa28fFUi4AuxzH3vw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YJKEZbHZ2T2ROptGWki1eudq03lcm/Q1iCNSxfG0ylU=;
 b=g6Dtwil0KZMJ/GnQ8ezzPrPZ8vyvkuomTB0RCRO9F0V8sHsKeg+xtWCG34Buj8W/SsjhoIACbUC0o8CK1lSQHYEAqh/iUycgSH5Nfgf0ixWJVxER3I8MRmm2z0N2JZIHMMk5WNqrq7VRtKoLAg2eO9KIaIW/g4YvoIZc2gnpDk8=
Received: from DBBPR04MB7979.eurprd04.prod.outlook.com (2603:10a6:10:1ec::9)
 by DB8PR04MB7179.eurprd04.prod.outlook.com (2603:10a6:10:124::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.22; Mon, 30 Nov
 2020 07:38:05 +0000
Received: from DBBPR04MB7979.eurprd04.prod.outlook.com
 ([fe80::c8c:888f:3e0c:8d5c]) by DBBPR04MB7979.eurprd04.prod.outlook.com
 ([fe80::c8c:888f:3e0c:8d5c%5]) with mapi id 15.20.3611.031; Mon, 30 Nov 2020
 07:38:04 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
CC:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: RE: [GIT PULL] usb: fixes for v5.10
Thread-Topic: [GIT PULL] usb: fixes for v5.10
Thread-Index: AdbG3+atLgWifxo9Q+6uGF8l0hWYEwACs1oAAAAs6IA=
Date:   Mon, 30 Nov 2020 07:38:04 +0000
Message-ID: <DBBPR04MB7979337BA0ED0C99CEF4D0738BF50@DBBPR04MB7979.eurprd04.prod.outlook.com>
References: <DBBPR04MB7979962270A587129B3F7D268BF50@DBBPR04MB7979.eurprd04.prod.outlook.com>
 <X8SfoMVX0XOdLkMr@kroah.com>
In-Reply-To: <X8SfoMVX0XOdLkMr@kroah.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linuxfoundation.org; dkim=none (message not signed)
 header.d=none;linuxfoundation.org; dmarc=none action=none
 header.from=nxp.com;
x-originating-ip: [180.164.155.184]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 6ac2458b-224e-4718-25f6-08d89502dfb8
x-ms-traffictypediagnostic: DB8PR04MB7179:
x-microsoft-antispam-prvs: <DB8PR04MB717932551E58BFABC92641728BF50@DB8PR04MB7179.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:341;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: X1ZT5inLbF/McZ/y9Om3V7S2aI3KYhDHfp0XTxLau35Xux613HHPjQrZre8PIFOnnPG/2mh/kHNPEVHDWQo90v4vZgnmaJpxB01PwC+EjJDV7IvMu26UmUXSzhd79NtaifVetEHEIosnKAsMmdbpjXjr1malYBpZTyYMf6gOTpaWAEK+4Ks1V4OjiQeVYJKgaOu4g3NEc3r3s/RE8ijDVtgPpfUD3OFvrIeJHTp/Bj4rckvIwp/AcPIbSxXLfIkjPqamOx5BSL61wDfC7/0FtKYhlhEAfjjB080LF+Wb0mvsBO4p+n5/2b5t+IkWAx9Jv7T0rWe2l3Gxwtjg0tQivQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR04MB7979.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(396003)(136003)(346002)(376002)(39860400002)(86362001)(55016002)(7696005)(316002)(5660300002)(9686003)(4326008)(4744005)(8936002)(2906002)(26005)(8676002)(66476007)(186003)(52536014)(6506007)(71200400001)(76116006)(44832011)(66446008)(66946007)(4001150100001)(478600001)(33656002)(64756008)(66556008)(6916009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?nfsrXFUUyp2PceM38w4emOZBeBne0bFd+UVwWqnh+3wshcmG6Y6WX7CFMHU7?=
 =?us-ascii?Q?ky27nUgwgKgP2a0pMUej1hBDOeQ/uNLGa/q5wj/XwnZkK3aYX2WYrO4yqGxY?=
 =?us-ascii?Q?zfLjSTrGaJY5Oo2Bv5Opg7bNV0wEfV23fqAzfpKNqqSOIGcqRnTTToT3jFtN?=
 =?us-ascii?Q?zwov6AAQLRWWMJL4Yk8luNCz3nABUJ1KdEc5gCTn5js3Ra3eFG/UuDrV0aoP?=
 =?us-ascii?Q?CgvjmKeomivnH0fxo30CxUgoYZa++Z/Wk8Ux6EcI2ZHPEYY04dSbC6pSn83a?=
 =?us-ascii?Q?/jZpRANrHX5+X52kM6pcoJBh5rcYehZngqhCTBWWvjKyVScx/3Fo7vTKozL1?=
 =?us-ascii?Q?cJxXNs7CT2Q0Td+yBGgZ32CepySoxfvwub44+Ri9YzL/5lnd3DfgiQcHTxQ9?=
 =?us-ascii?Q?TNdYaApIMsI3ESXVkUj15OI3EKvBcnfQtIChjiLxUG+Gp7LlYXgK+hPnRR5n?=
 =?us-ascii?Q?/lF0uFsDZB8fTZq/PH+H5+SxJ2dRYOk9vY3fbIjI637bI/0OeJ6ibjZIjlC+?=
 =?us-ascii?Q?pdnCcewUaJdZDU2cG78cFQ4ZzGwIjrWcCwpy60k4WIm8OWZsIe5/kL6uqe18?=
 =?us-ascii?Q?GP+zM1g7UraPULJa4brqv89siwpE6/QFlbyF84MivF2EuRbEQL6FMLNOcrxe?=
 =?us-ascii?Q?Xw4zNXrzr95r+cgMuf/l2jjflFNLRvMjHnr0x/6DBKoqmKzpJfxj9MBYQjq8?=
 =?us-ascii?Q?GLOjr2qQPwfWsMwGXmnB8j15YA3zA6Hek68Ybi5NWPrSrbVWy98gqy5iYNQ/?=
 =?us-ascii?Q?lIpWPBaZ3YiImw7/XiHGQ9nsTtloC08qvtc5fxo6+A3HmPXC1BLj2u9w/xgC?=
 =?us-ascii?Q?xVW0VfGshahqShip2OThn1cxz6ixoaO6ui6QUgVma5QMjs6xhTH0rZKQU6Sl?=
 =?us-ascii?Q?JawHBAL6f6YsPoKIl4zQn0tTHGpFM90EmnC34+ndrBhuoepWcKl3ujKayaGb?=
 =?us-ascii?Q?yI9VP0+FzYHvlaDE82gcKBRp0Lk+U5VDg7Gqayr+bQY=3D?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DBBPR04MB7979.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ac2458b-224e-4718-25f6-08d89502dfb8
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Nov 2020 07:38:04.3857
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9C91FTZ7R7N55rZkwvuU9nK1GoJSYfZlwLGvG/D7907wGzEEg2jDbUSCyU3rWdHAMfXtuwqt3IYYUSw2HBIcWw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB7179
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

=20
>=20
> On Mon, Nov 30, 2020 at 06:13:22AM +0000, Peter Chen wrote:
> > The following changes since commit
> f3bc432aa8a7a2bfe9ebb432502be5c5d979d7fe:
> >
> >   USB: core: Change %pK for __user pointers to %px (2020-11-20 16:36:31
> +0100)
> >
> > are available in the Git repository at:
> >
> >   git://git.kernel.org/pub/scm/linux/kernel/git/peter.chen/usb.git/
> tags/usb-fixes-v5.10-rc6
>=20
> You sent this twice, which one is correct?  Or are they both the same?
>=20

Both are the same, the 1st one used wrong email format which is denied by
linux-usb ML, so I sent again, sorry about it.

Peter=20
