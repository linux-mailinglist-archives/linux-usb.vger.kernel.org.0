Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5B1B32C7E0D
	for <lists+linux-usb@lfdr.de>; Mon, 30 Nov 2020 07:15:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725898AbgK3GOL (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 30 Nov 2020 01:14:11 -0500
Received: from mail-am6eur05on2079.outbound.protection.outlook.com ([40.107.22.79]:62880
        "EHLO EUR05-AM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725884AbgK3GOL (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 30 Nov 2020 01:14:11 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FCAE5h9mrzlWdlKEKVYWV3AivO7bLah+JuSxz7Zc2NGn2i7446Ur3VHn0eLUBdCW6X0Epc8JM77YuA/R0ou4Wn6xP0ER9JwguN0OyN4qZhdZFr25ih05piO+IPSSvXmAvCKmSPBgsyZPrOgqVicZffn5dTIXmszLwRGT/PaqvE9/WT1Bo9KqhdcxtMa4y/0V7Ifr8UaPHph4jaj5gtT+12lmU2tPiXJRB/OnFhP0+FUv9FcJLqcQ1cT87N0horGEGhi8wq1i6nfrmVNkcXXN1es/KFH8s3o4tzSpygm7kJw8UXWXLkPx9qFmrkQFEXib30Gc5fI6g5HFerJHW17vAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8JcXey6RawZUbaUKZRG+fdG30C2YG3v65+TOubjW1i4=;
 b=VoEeHOKYiDr0iLDfZ5Nd+9kduW3mTPX4XTnp/mzT6KOP9MtTLgGeNlq3AJiJo/PiX0RpL92jQ3OidvOnXACci+osBo6XPpv0tAVSvH2fl8eTO8IlSj1RkNtlrRNsLkADr/UG5qOUByPIDNhGO+eXwqeR5KvZ9xHU3o2/n7w16Z6oCAd6IwDt/vpu3M0Bsg2NLwpJFB8yzOWXMj+p/q8mGjunaAELigoyNv0+B1quDr/askbflk72WslsOaCNNdmS564FFNkgdLsl+mC0BHE0cIG5Aux+YefqeQqiKovj7oZQCTTaahK/PfU7imsb2rWqLf5VATWRLT1i63IktBQWYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8JcXey6RawZUbaUKZRG+fdG30C2YG3v65+TOubjW1i4=;
 b=Jt4q/4coJPkOqKOkD/eD3/fhOShA8J3fTPaTG1eOiHxeRbfNIdIm1qNRgn9xRoseDkjmLOiSJwEmbPTMwbM+gKYTtDXdxy6wmSBzslh/nnPNGs1O2ajeJOMWPALfV6MG6p9JbJ9zR9xiRx1nKer7tCm+S9xPJgFal1PFlSS9rTE=
Received: from DBBPR04MB7979.eurprd04.prod.outlook.com (2603:10a6:10:1ec::9)
 by DB7PR04MB4233.eurprd04.prod.outlook.com (2603:10a6:5:25::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.22; Mon, 30 Nov
 2020 06:13:22 +0000
Received: from DBBPR04MB7979.eurprd04.prod.outlook.com
 ([fe80::c8c:888f:3e0c:8d5c]) by DBBPR04MB7979.eurprd04.prod.outlook.com
 ([fe80::c8c:888f:3e0c:8d5c%5]) with mapi id 15.20.3611.031; Mon, 30 Nov 2020
 06:13:22 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
CC:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: [GIT PULL] usb: fixes for v5.10
Thread-Topic: [GIT PULL] usb: fixes for v5.10
Thread-Index: AdbG3+atLgWifxo9Q+6uGF8l0hWYEw==
Date:   Mon, 30 Nov 2020 06:13:22 +0000
Message-ID: <DBBPR04MB7979962270A587129B3F7D268BF50@DBBPR04MB7979.eurprd04.prod.outlook.com>
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
x-ms-office365-filtering-correlation-id: 4aa3dfa3-d10c-4d03-f4fb-08d894f70a79
x-ms-traffictypediagnostic: DB7PR04MB4233:
x-microsoft-antispam-prvs: <DB7PR04MB42330D16F96DBC64078A3FDF8BF50@DB7PR04MB4233.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:389;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: HXVdkQjBlO8wdBtwiAqt6bAG6ldWy2f2ZuFSJ39sjQmezMrXYOxyVpA8JJWg+S3OgwbEQpPvwCioUWXA9ceQpIMFzETRcgODjARmP4hBxxJmzwSk0Uo+yu5xwYZs6a+IsMQVf2ZprjOiLxilFF9daEkcVb3x79kkfzNITFqe37cIt+RcYNHiMB6w2iHzc5kg8YebaV+mkb2bw+/idNNVrqbXiC4GXUaN+qqw086fdR4YpQCT78Nu1O31UcQaoVg0o//aLg6iD8wHLEjEjQ/9q4F84wYigA0CESilCvupXQ7y1n6Q4yjKuYPzhNVtMuFXLxJtycuixMh8UUO1HW+uOA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR04MB7979.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(136003)(396003)(346002)(376002)(39860400002)(76116006)(4326008)(55016002)(71200400001)(7696005)(9686003)(478600001)(66946007)(66556008)(8676002)(66446008)(66476007)(64756008)(2906002)(33656002)(86362001)(26005)(8936002)(186003)(6506007)(44832011)(5660300002)(4001150100001)(316002)(6916009)(52536014)(83380400001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?xEBh3h3TRnXEtZOVrJ+CxLrrgPt5almNruLnx7jruvc1uN2IGLwezuAaNpql?=
 =?us-ascii?Q?ZZx/qFjVLphO77AtnztgKZI8jxluu2XAudR3ZIwqCHZ0R83h3+wvNx1gwUsG?=
 =?us-ascii?Q?qGX0SthEgwtBL6MIX8XNgk1SGro/ItUFOz7Pbz2Pgex6o1uPz7c5ltYgf95B?=
 =?us-ascii?Q?uf8EwZY1XUK9hATqcIC39nk8iVgJpdL3SBmGP1tLWYMz+r0AhG4nFHPZw7I3?=
 =?us-ascii?Q?0kDed0xQRo9sQyivBhwcdicRaebNHzJ9ApIBtsYNHBQxqp/VmLzFs6C5kNXz?=
 =?us-ascii?Q?VnGXX2wIfcF9crQz3C0GkMK0uHDEp8IRNTbPoIkKsSpf3QXk1uFTd2A+D3Ru?=
 =?us-ascii?Q?iyQUl3sNGFCwT00zUDu6a2t02Dqqdn6M8MVQyXjfWndNOEICDjORBT4txUxZ?=
 =?us-ascii?Q?5Ut2Fvxzm4g83bkgqL+pGs8+px4gZiMj+AhPSK6lpjio54my/Mc4eVTPNeEu?=
 =?us-ascii?Q?qnzdM3QGBLeJ9yjL6LwS0EhrM8i51JvySDfYGxT6gNUqJi1Qf6VviMnsLDy5?=
 =?us-ascii?Q?aoxvhJWBXRpkY04wAkTRKlIHASbBPRatwtnVjVdV+734YY0jOBiI4FHE+tjB?=
 =?us-ascii?Q?hjMr1eGPDBfyuQNVPaOcPvFHLGmsN6aW2yB0TZj/yB8eOK96yZrd6ux2PHDS?=
 =?us-ascii?Q?ckVnNjprbN+qZLNrNG1/21wa5rrtfmrYivE9BNAo7EQu3MK/Hu8MYakXcloY?=
 =?us-ascii?Q?cy/X1JRDb1Hld5yVY87j+BeoPhiG54US6QiBqM7XAs1Cusagyi0sqJciAYJq?=
 =?us-ascii?Q?aTJzSM5PXgJQksB1Eg8YkLs4vAMakfwo3pE1uGC5urgHx8VWE6ab0TAImNz+?=
 =?us-ascii?Q?znRiO5JEXgf3beXmo8HzTomehspCTw8iXLKQs3usux5kc0NJ4vtmE4CaTFrI?=
 =?us-ascii?Q?8xUnS9UjiDLeMAkhpAtdDOuIneeQw2i7jszdLRi9vMOA/m7VD8CVnzXEd1EI?=
 =?us-ascii?Q?O26HNH4K0rJXtopJmUf1H4EraFma42onPYRd09V4Bsw=3D?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DBBPR04MB7979.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4aa3dfa3-d10c-4d03-f4fb-08d894f70a79
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Nov 2020 06:13:22.5358
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: m4mjurirZCN5Zp0kDv4Kt+goqycEncmm/XHM76bwzRYlwCZXyaH20C92nRhc7lElTUMELEHXHxBJ8sANKEauLA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB4233
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The following changes since commit f3bc432aa8a7a2bfe9ebb432502be5c5d979d7fe=
:

  USB: core: Change %pK for __user pointers to %px (2020-11-20 16:36:31 +01=
00)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/peter.chen/usb.git/ tags/us=
b-fixes-v5.10-rc6

for you to fetch changes up to 6b8137517e70f6e96d0251a98930b1f29d0be161:

  usb: cdns3: core: fix goto label for error path (2020-11-30 13:48:32 +080=
0)

----------------------------------------------------------------
- Fixed hardware role switch issue at TI platform
- Fixed scatter-list buffer handling
- Fixed error goto label issue

----------------------------------------------------------------
Peter Chen (2):
      usb: cdns3: gadget: clear trb->length as zero after preparing every t=
rb
      usb: cdns3: core: fix goto label for error path

Roger Quadros (1):
      usb: cdns3: Fix hardware based role switch

 drivers/usb/cdns3/core.c   | 29 ++++++++++++++++-------------
 drivers/usb/cdns3/gadget.c |  1 +
 2 files changed, 17 insertions(+), 13 deletions(-)
