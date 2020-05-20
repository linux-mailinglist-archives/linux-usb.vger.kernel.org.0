Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A69951DBC51
	for <lists+linux-usb@lfdr.de>; Wed, 20 May 2020 20:07:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726966AbgETSGz (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 20 May 2020 14:06:55 -0400
Received: from mail-mw2nam12on2135.outbound.protection.outlook.com ([40.107.244.135]:60445
        "EHLO NAM12-MW2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726957AbgETSGx (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 20 May 2020 14:06:53 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZT+mU1xPpLG/+E7arr+Umr1vT7juj93Pc9Ac/6AgKOl341flWoEuHv8ebkMPxVFkE4oNivyhHHniAJpsWay/JOXTdB5R87ijXnImK7kr0xzR1X8+BZrzcjX0Wpu1Ibb2tnY6co6FmGhjtgnAkzhmTDFYuALh4s/XhawidfStXwUYVqTVIzx3FgNOrGuaqicZSzCjcTl1Xk2KQlDU+RZQsxuCVEA2Jt0Zov0SMgSW1/v2u1EbXIVbLNQkhhVI4G0EFA84r9A6yPNgdkRKdOyS53x2KQeLMJBj2Ru0UYXf0GRbNSwSQWC1kKjFU3UiXsye2JvEkSGnlXSNDqvnyq0F6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k/O/9Vh+fpjFcxnIjnCYcwQ9m4yRyF2/ADFMjhR9I58=;
 b=bIPf8vcXoacny2XrRe+6mK0C5jTCciHSRiSj3/5fU5Bdq2V8zyOkGA/joll8E1TrXs1KYSrDshYIGoVIlYw+zLoi3dDpoeJeGrutwj62UndLfRLzaKNwxxIowJGkx8gMFtRvprUrdfQrMuidLH1tgVHXMJh25IjPgUajjop08nUO1PEl1mZdeinlItUHef2LqqDsckIZpzLMkIpGDf/TejbWmITl7vSswdwz67DRpaeCuMW0azUsKqrNqDzjOCIHqjqIGi3FCn2ZjQftE0zC2W67qxALqheMVNKJ2vTKgJzX/CDZP7pEujwSQXa4VNFN1jPohwAeFdybJBtyQ4vuFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=northeastern.edu; dmarc=pass action=none
 header.from=northeastern.edu; dkim=pass header.d=northeastern.edu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=northeastern.edu;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k/O/9Vh+fpjFcxnIjnCYcwQ9m4yRyF2/ADFMjhR9I58=;
 b=eMJGvG12HmK/oXPXS7EAzx01HoS7DjNewIu75oHYKD6aRAh0th+A9wHt13ZIiQlahGdlQ21yWQnpIBdoug/gOH0FoC+VhFpM/5xmKL4jFDNeqeBF64N3kfm6Wr3LKla3z35ZWMPpxbNb6vrEHuiSfVOCs2L2/lecBZNzjxgaXnI=
Received: from BL0PR06MB4548.namprd06.prod.outlook.com (2603:10b6:208:56::26)
 by BL0PR06MB4580.namprd06.prod.outlook.com (2603:10b6:208:55::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3000.20; Wed, 20 May
 2020 18:06:50 +0000
Received: from BL0PR06MB4548.namprd06.prod.outlook.com
 ([fe80::fd87:3891:70a2:bc5d]) by BL0PR06MB4548.namprd06.prod.outlook.com
 ([fe80::fd87:3891:70a2:bc5d%3]) with mapi id 15.20.3000.034; Wed, 20 May 2020
 18:06:50 +0000
From:   Changming Liu <liu.changm@northeastern.edu>
To:     Greg KH <greg@kroah.com>
CC:     "thomas@winischhofer.net" <thomas@winischhofer.net>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: [PATCH] USB: sisusbvga: Fix left shifting a possible negative value
Thread-Topic: [PATCH] USB: sisusbvga: Fix left shifting a possible negative
 value
Thread-Index: AdYu0IANqPvTKmyYS6uxDS+D7m5Wgw==
Date:   Wed, 20 May 2020 18:06:50 +0000
Message-ID: <BL0PR06MB45483EF82A54B8751524A2E7E5B60@BL0PR06MB4548.namprd06.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: kroah.com; dkim=none (message not signed)
 header.d=none;kroah.com; dmarc=none action=none header.from=northeastern.edu;
x-originating-ip: [128.227.216.118]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1b1260c4-3d5a-444f-0eb8-08d7fce8919a
x-ms-traffictypediagnostic: BL0PR06MB4580:
x-microsoft-antispam-prvs: <BL0PR06MB45809EEA3FDAAD002B4161D6E5B60@BL0PR06MB4580.namprd06.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-forefront-prvs: 04097B7F7F
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: VnNB3A++XYnbWqnniEtqVYWlCc5b7/0Qb+wu4DpyoBRwcuUaURXOhaO2f6Ybh5C1/UzF7XFq0hitNz2NXA6Z3KLEyphVdecBgXbUP18ExjKkYi/MzHZK1ldZjnANE4CUmfXo0ybCeVIXga06yq6AtOGmpGV61ew/UxAl83hrWGyurxPMED6z8UNYRmMX7zprWR5qC4HlXLB+LnbShcj9+KPA7V15Zfxz9HoOoD/nGvC0jQuYdyGxMEqeOSEpeADZ2D42hgn9OlQbC2IIJ8i2wiNnvBDXnHqBW5aSYbSXwjiJHvTK4iS6WVnRFuIUmkppFZM0qiSg7ybqd4pDyAa0lHapyJIYNOiAxYMSMe7HrOnD1+OxzrpqmuCBLTljxWpujLXTBkapwjvjwXU/IxeNYSBB2avkd6zlVXg4yfWbyBxP46Ow8JeOp7gnr0drrHE2
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL0PR06MB4548.namprd06.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(136003)(366004)(346002)(39860400002)(376002)(396003)(55016002)(186003)(9686003)(478600001)(7696005)(6506007)(33656002)(786003)(71200400001)(75432002)(4326008)(5660300002)(26005)(8676002)(66556008)(52536014)(66476007)(8936002)(76116006)(66946007)(316002)(64756008)(86362001)(54906003)(66446008)(6916009)(2906002)(4744005);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: f9aIu6VY7RJyIyYr3TINzaapKdCbncgBSrT13nj99dxaTZpNNx7uuId7FCIEWxjEO4Zt+cH3y5zHMYPs5/EECxrr86LfmY0nST2W5cOzs/Oww9gHEoi5m6S9MVcAtawRffSrJNmWhJDKcpUMpiZVAsSbugRE1+LaQoXpRMcDGp5l3vfy7E3VYQ3/FnkNuEFcNYRewnyoMQz8eG8U0O48mAOJjcLVU6vW5C0CucuCH4j6YaCbva14Qx/O6xP1ROpCg6T9h8GnwCR0ojkOGc2p/OyCtR1nbKBySo1rIVqfh9MJClEQA7OUS8L2ADMITDBwxzhYbDxA0jBbejbN1zDqZXV9cBQ509LrrgXJwrzaXKh8BUCaMKzcg5nSKxngXyQcQ+IGW9zkaSBPspKIAmYOU5s4sr29n+WAQuV3/0L7/XVo8zRYuMoDC/uGCqIOjKDCpJ+6i2CRXIulVjVMQ9SICPhUlCLDWI/ZI2T8zlMMABU4wtszrCkDLn2hjaNtvCkp
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: northeastern.edu
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b1260c4-3d5a-444f-0eb8-08d7fce8919a
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 May 2020 18:06:50.0180
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a8eec281-aaa3-4dae-ac9b-9a398b9215e7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BiyEGgBFj6AtPOaroL6Nfc46E+ujm8eHjOWWpm9Nl6MZT5TxmJ+t2e6a/pAlcq+WrPZiLTkQkJpEwiBz6yni7YNFV6KYygctsCybyk22LmM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR06MB4580
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The char buffer buf, accepts user data which might be negative value and
the content is left shifted to form an unsigned integer.

Since left shifting a negative value is undefined behavior, thus change
the char to u8 to fix this

Signed-off-by: Changming Liu <liu.changm@northeastern.edu>
---
 drivers/usb/misc/sisusbvga/sisusb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/misc/sisusbvga/sisusb.c b/drivers/usb/misc/sisusbv=
ga/sisusb.c
index fc8a5da4a07c..0734e6dd9386 100644
--- a/drivers/usb/misc/sisusbvga/sisusb.c
+++ b/drivers/usb/misc/sisusbvga/sisusb.c
@@ -761,7 +761,7 @@ static int sisusb_write_mem_bulk(struct sisusb_usb_data=
 *sisusb, u32 addr,
        u8   swap8, fromkern =3D kernbuffer ? 1 : 0;
        u16  swap16;
        u32  swap32, flag =3D (length >> 28) & 1;
-       char buf[4];
+       u8 buf[4];

        /* if neither kernbuffer not userbuffer are given, assume
         * data in obuf
--
2.17.1
