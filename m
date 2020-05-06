Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3EA4C1C6CB3
	for <lists+linux-usb@lfdr.de>; Wed,  6 May 2020 11:17:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729022AbgEFJR2 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 6 May 2020 05:17:28 -0400
Received: from mail-eopbgr80070.outbound.protection.outlook.com ([40.107.8.70]:23631
        "EHLO EUR04-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728385AbgEFJR1 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 6 May 2020 05:17:27 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GYQlidaQa+COmmCJgrz85ZGt5JuQxL3/Z6HGiVgITrPJUtmcGEVtzBeANvobtL/zsJymSWY8Z+xNo0U3if75aeELeQueo0ZWvleLT4rDs29EQiWsrCa6LNs0EcOkkmD8Yu0MK55+GDfzTMKivDrfE8/T6tGmieqTne7Ff3ry2gpOCpoXfFwwvHajcX3rmm6P5I+ia3AKb/zryWkst3Uobg5h3YJadakvgO1l8/5Qyun7AD6CIHwMt0yncozq+T1ZBwNrq7S1htIXrVk7wSVEr4yOuDXH7wtR1rB9ctgmY+17k30QVF4KFVcjzTuoQfToIDPjzM5BGCrBXasZ+6HkVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nHcXX1lmpk9tCHKnn+j3SKZr6aDd4v8e5xwE8Papr54=;
 b=WHDW3k20Y32OtI75xRTRZ81DrsrleWyFlXg/szb3PKJQbUSKcD0Ih4AEYw/yWQhPzn56n9i4u0MAx9XoKbMH9dJLukNkP6LQVIwjb1x3tDQkH+obsCRh258W0bkLJacpTjoXtEfpNdxgCLw1kx4Iq4GGeFWEeGbDB84E+T7wdr2BQOf/d8NLNC7lV2F6jjc96Zdl0inoRQkZO7Uc+TZVrznxeMFMMlpDzvN/7jwt//3/1Ng8EfkgvtC4FsFO4oGILeqzmu/7svWfXyVxC2QUlbdYNH1KUtpOWMaiQ9XQToUx7/JhoOkvmXUSMy0JHTwZiSudPF6lsjumusT6Rm6EKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nHcXX1lmpk9tCHKnn+j3SKZr6aDd4v8e5xwE8Papr54=;
 b=fpXI2bXqgSm3m00GiWi82Zi7rwan+z557YbfKtsLuvePO8xNSqiKekHAw6Fd/vYQKWhknOxcexHRlQAVOGzJx0+5cu4p0LdQ25brkJlt7qmnq3iwJH0Dz7H/7b/bfjlCvDORRPCPuW++pLhVodaZloxliYl+BfVfHn1usRwclZo=
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com (2603:10a6:20b:118::20)
 by AM7PR04MB6856.eurprd04.prod.outlook.com (2603:10a6:20b:108::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2958.27; Wed, 6 May
 2020 09:17:25 +0000
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::7c34:7ade:17d0:b792]) by AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::7c34:7ade:17d0:b792%9]) with mapi id 15.20.2979.028; Wed, 6 May 2020
 09:17:24 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     Sid Spry <sid@aeam.us>
CC:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: Documentation for Raw USB ConfigFS
Thread-Topic: Documentation for Raw USB ConfigFS
Thread-Index: AQHWHxIE3BZgWTm6XUiOBTDqqvXTpqia0EkA
Date:   Wed, 6 May 2020 09:17:24 +0000
Message-ID: <20200506091750.GE30237@b29397-desktop>
References: <0507a041-44f4-4257-adaf-3b17de3baf81@www.fastmail.com>
In-Reply-To: <0507a041-44f4-4257-adaf-3b17de3baf81@www.fastmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: aeam.us; dkim=none (message not signed)
 header.d=none;aeam.us; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [119.31.174.66]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: b74b0257-cc67-4988-8b37-08d7f19e4a43
x-ms-traffictypediagnostic: AM7PR04MB6856:
x-microsoft-antispam-prvs: <AM7PR04MB685674AB43D2892502BB69FC8BA40@AM7PR04MB6856.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 03950F25EC
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: sjP+lV5X2h60qKSaijUUYRIcsXMDkHk41up8Jq2hauvG9xz8JLCfWAC+MrJzGk6Ak2je+pU/z1Z7UXeYnJ3Q2+46kIeUZxoO0bOmCc2UU7lkfjdDtivWYlFYHEyH0m6hhs33B6xjI8ozRjaH5nlgKuA7KpGvApuuBzwQYTBO2SHXMh41mg3DudPu2K41APNdeFPwdYRyW4CvhRv8aAWwCag8YKRRm7Xtd2FkFEDM/ZRobrtGt+AdOqWE0jm2RJn4Eca5MqGLGQMkX2eNjpftMN4ZpnVTfzyW04DVb76yfgU32e/oA/NNsF2CR6kT6s7dPvP3nkyClwIoo2CCBDcV9u5mgSxXA7O2Xc0wM89NuJT2NoerXcFVIl/0zGS9M+yG8TfRZGRXhS/bm37ugr/o+8/CE5tP1KT3yESgFYKQD8TqQILR9HHlI3+sMgUOY0v3lbohd5gT+rjcgzEgZbjD6L48Eef4L/Az+R5qBe7BSQk1ILiXh4fh7HVTbbCQnzHPz6R3vqRQt5gHs+oZc4Qp5A==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR04MB7157.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(7916004)(39860400002)(136003)(366004)(396003)(346002)(376002)(33430700001)(66446008)(64756008)(66556008)(53546011)(478600001)(4744005)(6916009)(1076003)(4326008)(44832011)(8936002)(33716001)(76116006)(9686003)(6512007)(91956017)(8676002)(66946007)(66476007)(186003)(2906002)(6486002)(26005)(71200400001)(33656002)(86362001)(33440700001)(5660300002)(6506007)(316002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: MA2EMOx9Gtly9DlRzRkFIK51ak7T/M7G7mzbmVcVkg8Usg/qPXritnH6Pr0jPQa9PzsKps8FEzrWChSvw+N6rlvWSHRCSiiDBFWcE5jl8lO6w8Zt9dVUNC9J8le/mlpSbEKgmWi72bUkn6Danv2sBYZPf56bsEOCZXEMLNtEIRCR0DY80LBjY/vDP5c87+EP9ZR/vMFgmiY5jYzlY0S3hB0PI1GBlCe4KWk87ND2Lt3Wvoubptki50xf4yG/6NLMv7tvWANJhF+YkGIDefHN7WsUtyi5p4BtA0hXeEbGjCNjfO8kzLWBCZKRJ8JRLXnqyG386gXtdloNIYyIVaOtV1WZIiPZCoqJGfFM1uRO9O8vqZxBRCKZOwo781mDooj2GftncTbiHO8viONMRgxKJUaVraEBzXJEl9mVxnG5ihS9rJN0t/kH9Cgmsn/Ex9w/o52112XWJIAUWJkNPcThM+OtzJKEXVyVfDLuhp8jrNRFH6tN3TW+cKGG8fFC27seKGTTZn2l7T6R6yHuwrvb1qC/dBAoS6cZ3dz8uotdygLBdswP0zmqt16yKfUwr0kS3bv0btEjWOlJyGi45guFGCyQRlW0zCxg4sQAP8ALs0YKjTVdmNx2B2/nAtTTitnw/ZDImB1lE0quLf4+NHUeNk6nsaBhx3Rh6wJUfWiBPE2dJEBPvDUqWWSAd2MvOhVK6JKjWpQ4FaJ23gn83LO65abBL24bSrTRF4N81v5jPOkveIzouukS+RwzmZY/rVCb8fwVt2DylSYIpH1iiv2H9Xm6MDRugkBm9tTeilVKFOM=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-ID: <244F2A9D37437F4696482188D6A7A4C8@eurprd04.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b74b0257-cc67-4988-8b37-08d7f19e4a43
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 May 2020 09:17:24.8754
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: K+0QOsi3FHmYqZpG0uj4QnAL+bNLGi9Z3k/ORIKpZTWlbD8aTcu3hVTw0d9w+HYM7OqN/TOQcodpZLVJbeblQQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6856
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 20-04-30 12:08:13, Sid Spry wrote:
> Hi, I'm having issues finding good documentation for raw USB configfs. It=
 has reached the point I need to look at developing a new driver, but I'd l=
ike my unique endpoint to coexist with a CDC ECM endpoint or similar.
>=20
> Is there a high level description of this? I can refer to the code but it=
 will be quite slow.
>=20

You could write a user application using f_fs for your endpoint, the exampl=
e is at:
tools/usb/ffs-test.c. And add both your specific function and CDC
function together into one configuration, in that case, the host could
see both functions.

--=20

Thanks,
Peter Chen=
