Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 800C714268D
	for <lists+linux-usb@lfdr.de>; Mon, 20 Jan 2020 10:04:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726798AbgATJED (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 20 Jan 2020 04:04:03 -0500
Received: from mail-db8eur05on2074.outbound.protection.outlook.com ([40.107.20.74]:6045
        "EHLO EUR05-DB8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725872AbgATJED (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 20 Jan 2020 04:04:03 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BxDxL/yvwGh51CXI9McbWpPvR6caTKu74wL5+JHXSFiKPKAY3hWklazioJnP/Ksnqsqh/WifV/i9pAv941UHLh9WtFoS3hmNh3Dw8Y8ftAvTlRa0LqI+K+W6BtRMyyMNiXCadNaUG4AaIsNPEQSblu05XbTunVYNwDNzbnRejc9m1sUnFED67vDsSnj1sTDTTJLydXpD1uzNJdJVevsvuN1YGB4lAhqyzVkJzmTj3oKjOVul7VO/by26yj0AFbM482eqTXDFtcx6lY9tWJHgvt08m5OGyBXaWPnv24RlZ461C1Fs93owi9OjCTpNmEJJTEhiIBnKzkQPC4A60HzBkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gPYze3RsZFuz616l1hQvTf2gjHHzIWCHPnBjzN6u6ws=;
 b=HBriO2E+gjj0NIH+Zyse2MAM/QVQ5sIqGZe/e7l0hXElv+FRMQ31tVuE7du1oz+w6TE/RGRADW1AH7qCddiD+qmVypaEWhv/kICVdZKIshCZdNiCBjFeG3TSEv31N1/OVMCd0buFiSuA+amhPVzt5iBAwIp+S5kY13szgkuJ4VycNGTgLQlwcKCDLucshaO3Ye+wz/h5fdPdmdzZRwt/XEW1JeQ39s66odvmw544cpetquqLxL5LfHLCT07u7QyXK74ij96QgODMsZ4AFnnqcNNc0Zv3LJMNKl+LQK6CWJpsZN28drqjexwKtV8wIgTZA4pxYc6+r3QJWGnByR4O1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gPYze3RsZFuz616l1hQvTf2gjHHzIWCHPnBjzN6u6ws=;
 b=b96mrwlEUClKM9feFPANh0kh+Vuc8i9l9kCp6gMiFy0PaO0n/8NnL9BMcgrPNEYPCdc9WuEHP/z467nG6HJwUbPtVsLN9hb88JCKciMZQgp3NRVsIv2vXfyVFvzdwWH3LiKNphLi2AtO1MRJjHnVCqC4MT51y4eRV8nriyXcVuo=
Received: from VI1PR04MB5327.eurprd04.prod.outlook.com (20.177.51.23) by
 VI1PR04MB5935.eurprd04.prod.outlook.com (20.178.204.81) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2644.20; Mon, 20 Jan 2020 09:03:59 +0000
Received: from VI1PR04MB5327.eurprd04.prod.outlook.com
 ([fe80::c7d:58a2:7265:407e]) by VI1PR04MB5327.eurprd04.prod.outlook.com
 ([fe80::c7d:58a2:7265:407e%6]) with mapi id 15.20.2644.024; Mon, 20 Jan 2020
 09:03:59 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
CC:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: No message is showed after USB gadget has configured
Thread-Topic: No message is showed after USB gadget has configured
Thread-Index: AQHVz3CN7pnWzUHGy0mcC5tRnuvKLg==
Date:   Mon, 20 Jan 2020 09:03:59 +0000
Message-ID: <20200120090357.GB19938@b29397-desktop>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=peter.chen@nxp.com; 
x-originating-ip: [119.31.174.66]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: db276a33-1786-48d3-6d7d-08d79d87b006
x-ms-traffictypediagnostic: VI1PR04MB5935:
x-microsoft-antispam-prvs: <VI1PR04MB593533D457FC8B08E406D4F58B320@VI1PR04MB5935.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3044;
x-forefront-prvs: 0288CD37D9
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(7916004)(4636009)(396003)(39860400002)(136003)(366004)(376002)(346002)(199004)(189003)(4744005)(81166006)(26005)(5660300002)(1076003)(8936002)(15650500001)(6506007)(71200400001)(54906003)(9686003)(6512007)(33716001)(86362001)(6486002)(186003)(33656002)(66556008)(91956017)(66476007)(76116006)(66946007)(2906002)(66446008)(64756008)(6916009)(478600001)(316002)(44832011)(8676002)(81156014)(4326008);DIR:OUT;SFP:1101;SCL:1;SRVR:VI1PR04MB5935;H:VI1PR04MB5327.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: hB8uFOwEAwgCBiMO5yTutsb0GedqNb9WW6hzuDaa5vPpKc3xIPw+HNWDCZgbwySUsMnw76WnzZ4+z/unQ9ip3KoL4eHn1bwKT8+Xa8Yf6Por/wxaogfhopv1xUgUzDyaPj7eg6CeZq2Hz1hbbC+nX9ONudi1+gYviszcy9cedq0w4AGR5fjk9PqF5YRZR7LLcedTD1fXjn3QOHfz7e3fxUGxiCvy5TdZjM6i/1xY0x1Z3KFgccwEnWqrYn/IKqqy6RdtSIuBGj4YpsmL1VOFG6wDujCLFKT/D21wB9d4ezYC07pOpU3hCYdqO6klwUbNo98foAmma1ZUrb+7LgOwZ3p/X79hbf/lYEkJib7T0r10U8D4UxDfK4unvF3bLuorzuE2BMUuSWXNC16HMj2WtT2W7eem3LH4Wpsn1JiuxWfu5+tszvoJzjgaLtMJDMho
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-ID: <B867728D4B0EA3489BC2FB9F3F54DFC2@eurprd04.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: db276a33-1786-48d3-6d7d-08d79d87b006
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jan 2020 09:03:59.4152
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Hj1aicSqmuQE6BlY9TOre9gkrzg84MouJ8VavoDSX56HaQGMdMC2VeKTq6ZEPWB0/NYTfYj038w1W3HNIIPXEA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5935
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi all,

From commit 1cbfb8c4f62d ("usb: gadget: Quieten gadget config message"),
there is no any message from gadget side after it connects to host
and works correctly. Although we could cat "state" under
/sys/class/udc/$CONTROLLER/ to know its state, we can't easily
know if the gadget works or not from console, USB host could have
many messages after one device has connected, why we can't keep one
for USB gadget?

--=20

Thanks,
Peter Chen=
