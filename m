Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B2F1F10F839
	for <lists+linux-usb@lfdr.de>; Tue,  3 Dec 2019 08:00:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727366AbfLCHAg (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 3 Dec 2019 02:00:36 -0500
Received: from mail-eopbgr130084.outbound.protection.outlook.com ([40.107.13.84]:28871
        "EHLO EUR01-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727365AbfLCHAg (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 3 Dec 2019 02:00:36 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Fv4q0VcE5GBTo9qPxYMQamC8M2aeAU2JmQLbyeZyZF1bXEDYT+2EGgjaRaR/r+GWdwSgbm3o3xV6afn7vrhFNOMgzo829a1QhsYo1DML0El5JvqmxdG47sFmKi/wiBFkmeyX0PXjlYsVYDQZlWapxDiPOpjTFs6qs5/QaSToAgR15kpFdYZ0+jhQgjixc8ng5wfetINVfmipNpovq/HLIV1v1J42wjXyV0SVGcCDuY/16LmIxp9tavENLkzjWONnwoSwSigaXlQMVjCqBRNx9uscfn+5PBNHwTZhWcMV2zqoTXy9fAU+g6b/DIAWAmjC2JOR4UvGZFjItpSSpY39FA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o7xfEvnkNcfgMw/Ijklz55wl4KHbiQpA6OqOtBhpzk0=;
 b=L9oPtrExmGI8J3qGZ5nzky+V1gFcg+Ng2TTdIDl33tw0WDTu6/MokCCUjCcO4tR8v6/TjSchkPAUGdHxb3zBkioQZj6zrgs/YYF6ywGgXaLrZCzUbZ1tdz6wF4LA7FZDuBDVnEX4ZCkG2+rAPhw3IVHn7/Nqy9O5+JO00grdKZ0B1XSljG88lZZVYS4l+VSSnqiDOGe1Z3kwlxKUlwbDTDZ6w5WfrEy+krBPb9zH8dDkaiXIeBeSiDvc3VJZsHSYcCyA+pnjkGtO6l7bg1fW8xcNdFEQmB0XuCqyJd4gCTPK0rUraxSvFtrew31J7+ZQUcVI95y97PJrPgjcCCgSOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o7xfEvnkNcfgMw/Ijklz55wl4KHbiQpA6OqOtBhpzk0=;
 b=TAZpbnZ2wWO1Wy75HTlZ7TVjvW1Gs2EAOlf/ruW3Dc2hp7IunY9P9CmwQzL3LGPJMh0s19K46do3Res3zJDM7IvIBWclNBrL/I0qoru4b/o5b+wDOzNBqOkSQmIcAtnv12XQ5/PJKKHDEPdlWsyJdQ2lcjRrBSidwc5Suvf7zro=
Received: from VI1PR04MB5327.eurprd04.prod.outlook.com (20.177.51.23) by
 VI1PR04MB6782.eurprd04.prod.outlook.com (52.133.247.8) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2495.21; Tue, 3 Dec 2019 07:00:32 +0000
Received: from VI1PR04MB5327.eurprd04.prod.outlook.com
 ([fe80::cd33:501f:b25:51a9]) by VI1PR04MB5327.eurprd04.prod.outlook.com
 ([fe80::cd33:501f:b25:51a9%7]) with mapi id 15.20.2495.014; Tue, 3 Dec 2019
 07:00:32 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     Greg KH <gregkh@linuxfoundation.org>
CC:     "balbi@kernel.org" <balbi@kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        dl-linux-imx <linux-imx@nxp.com>
Subject: RE: [PATCH RESEND v2 2/2] Doc: ABI: add usb charger uevent
Thread-Topic: [PATCH RESEND v2 2/2] Doc: ABI: add usb charger uevent
Thread-Index: AQHVqYaXTOr2EA8GO0q8cUHi/uuUVaen+BYAgAADZ9A=
Date:   Tue, 3 Dec 2019 07:00:32 +0000
Message-ID: <VI1PR04MB53273E387D4D4B87528BCB718B420@VI1PR04MB5327.eurprd04.prod.outlook.com>
References: <1575342235-14791-1-git-send-email-peter.chen@nxp.com>
 <1575342235-14791-2-git-send-email-peter.chen@nxp.com>
 <20191203064746.GB1791585@kroah.com>
In-Reply-To: <20191203064746.GB1791585@kroah.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=peter.chen@nxp.com; 
x-originating-ip: [119.31.174.66]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: fe096256-13d8-4af7-9d9b-08d777be7d3f
x-ms-traffictypediagnostic: VI1PR04MB6782:|VI1PR04MB6782:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <VI1PR04MB6782E45577EC625FF71F28068B420@VI1PR04MB6782.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2887;
x-forefront-prvs: 02408926C4
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(366004)(376002)(39860400002)(396003)(136003)(346002)(189003)(199004)(86362001)(76116006)(6116002)(102836004)(14454004)(25786009)(3846002)(52536014)(33656002)(186003)(26005)(2906002)(8676002)(76176011)(7696005)(81166006)(66446008)(64756008)(66946007)(4001150100001)(99286004)(66556008)(66476007)(6916009)(71200400001)(6506007)(81156014)(71190400001)(7736002)(44832011)(4326008)(6436002)(66066001)(316002)(54906003)(446003)(8936002)(11346002)(4744005)(305945005)(74316002)(229853002)(55016002)(256004)(6246003)(5660300002)(9686003)(478600001);DIR:OUT;SFP:1101;SCL:1;SRVR:VI1PR04MB6782;H:VI1PR04MB5327.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: hp2nJ/XY9O/ncHdXGvvBe/hrAON8Y+oEmyTQ/nKzt1uU615sTt2+k1bDZIsxdj1GyDPidbS6ALQeuKq4YUxefqSpnaetA1kINYACPP3TnsXsCtCgAnzwnv5urfj+HGdCOWHszvqcKSAe4MwqPBRKUnGu9uZU65XfRd9vt2XsekPbyWXKTBAImOwGw1UV0A+McIN7AHen7xgiIdXZQHcBPwkteDc4weFZi/3OwXcYzwekFH+yaXVKxj6pb4DMiz00SYILJqMuWYOfHTLJY/Y+1FScL+Rbj+2eil7LBSvBg/OerU5W2gposMpxezajzV7lsH5Jui4DJPw+WLBHfdFwvfW7S2CTbkUoQ8RCD2zZWA7+YRTJCsFRDc0gGMGY7ClGLcyKi2vzLw5IeqGVvKqI478bf38CGqfTJWYKf7vFbex+rRVBkIamrvC4G7v8RXhi
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fe096256-13d8-4af7-9d9b-08d777be7d3f
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Dec 2019 07:00:32.3488
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WQnBSs/YmaEUIfvo4ZRCDJj+tmv/64thIdLaJCXDYmFbfb98Fol5gZ9NsNoogPEdBfexxUbKoxq4w7NDBtT6Bw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6782
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

=20
> > diff --git a/Documentation/ABI/testing/usb-charger-uevent
> > b/Documentation/ABI/testing/usb-charger-uevent
> > new file mode 100644
> > index 000000000000..93ffd3a54a7f
> > --- /dev/null
> > +++ b/Documentation/ABI/testing/usb-charger-uevent
> > @@ -0,0 +1,45 @@
> > +What:		Raise a uevent when a USB charger is inserted or removed
> > +Date:		2019-11-11
> > +KernelVersion:	5.5
>=20
> No new features for 5.5, this would be 5.6, right?
>=20

Yes, thanks.

Peter
