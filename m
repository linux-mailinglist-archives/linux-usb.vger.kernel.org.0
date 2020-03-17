Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E1A121883EB
	for <lists+linux-usb@lfdr.de>; Tue, 17 Mar 2020 13:25:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727270AbgCQMYA (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 17 Mar 2020 08:24:00 -0400
Received: from mail-eopbgr40077.outbound.protection.outlook.com ([40.107.4.77]:46551
        "EHLO EUR03-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727290AbgCQMX7 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 17 Mar 2020 08:23:59 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ai8Hy9uuLh/pg47Z2ZSWweaT8AgPrFLmMbo6mr5jO84LdgQlGOXL5fKvRmTPil4rjjFzxS670KF3tcq05cCJ5uZPQOtfOI50rf/i5IFS8yI5E1sDXUVCAejTGbJpEe79Mn77SnJ7qSMymRQ026lozmRmASVxFwJhATXIwbiej+RnwYVGHYKcU4+pB89gRM0yr3vLm3paQ1F6RTbB6gN5pBX21AqwgM/v5euu1IdwZMU+Tlz3IxxRwb7CS2GFHZBBVDwwjW+RHV52R6R0mwFSGCCBL7zvQBioP6p8hEdxxQYmaYZ8c+m0sL/Tihot1JCCVm5NYAxSkQmy1xyTEhHmrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U2MEo8BINt+p/Vw9kO0SCR2Co2F6+CXUZ5xlzSzlS5c=;
 b=FmicudZ7007nw2Sw/+sLgFyKQ5AGdgU8em5C4QXH+ULb0vZypLu3BYk82EiGX9322C86sbMMwvNCnXw3RfT2lpw8JyCt+F+f6Q082xn8nfh0h12l3YjVLxICOTiEKKOpOUEGbCVZr5O5IJ/cEfVcsqA4SumopGsY4pGdE53KEQ5kmTTXfbE27B8Q6kymcjfLJu7dlJwYILvoQpFVX/m8f5hLwuC9sj7hsXVp6LchG+QRfzfKc7T9NotdzJpNSLVoHqWfogXs9L8i5kx8/zgNnyLhv4rksI93rUvhsVN6fSlSHzB1lDVeibg834bwbxRWlFUGCcwc2gLjOrqn2R9Niw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U2MEo8BINt+p/Vw9kO0SCR2Co2F6+CXUZ5xlzSzlS5c=;
 b=nyJ5GfF47tHlzvuaiWSnwndiq9oByIbfJ3isJrPK4GhmCkOfGUBYDcv8Wdo/DrpSYXMYpRvVMhd+5GUjIhXon7qupebOERA3q0EzG5thDxMX227NMoD2LIr8mN8ndI5ZERm0JIxByVThkWonKY0nXwHCN40oD6orpTUxYyOQzig=
Received: from VI1PR04MB5327.eurprd04.prod.outlook.com (20.177.51.23) by
 VI1PR04MB5856.eurprd04.prod.outlook.com (20.178.204.210) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2814.18; Tue, 17 Mar 2020 12:23:57 +0000
Received: from VI1PR04MB5327.eurprd04.prod.outlook.com
 ([fe80::9547:9dfa:76b8:71b1]) by VI1PR04MB5327.eurprd04.prod.outlook.com
 ([fe80::9547:9dfa:76b8:71b1%7]) with mapi id 15.20.2814.021; Tue, 17 Mar 2020
 12:23:56 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: [GIT PULL] usb: chipidea: changes for v5.7-rc1
Thread-Topic: [GIT PULL] usb: chipidea: changes for v5.7-rc1
Thread-Index: AQHV/Fbt143Qmbnl6EChFL8TjUAw1g==
Date:   Tue, 17 Mar 2020 12:23:56 +0000
Message-ID: <20200317122414.GA11834@b29397-desktop>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=peter.chen@nxp.com; 
x-originating-ip: [119.31.174.66]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 0ab7c625-db0f-4218-fbc7-08d7ca6e1089
x-ms-traffictypediagnostic: VI1PR04MB5856:
x-microsoft-antispam-prvs: <VI1PR04MB58567BFC62937595BD76B12A8BF60@VI1PR04MB5856.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:849;
x-forefront-prvs: 0345CFD558
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(7916004)(4636009)(39860400002)(396003)(136003)(366004)(346002)(376002)(199004)(71200400001)(5660300002)(478600001)(2906002)(8936002)(33656002)(186003)(1076003)(8676002)(26005)(44832011)(33716001)(81166006)(6916009)(86362001)(81156014)(66556008)(66476007)(66946007)(6486002)(64756008)(66446008)(6512007)(91956017)(76116006)(9686003)(6506007)(316002)(4326008);DIR:OUT;SFP:1101;SCL:1;SRVR:VI1PR04MB5856;H:VI1PR04MB5327.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: b5ttih7FLvSLxYlC7cvkKTn5h+PJaDPa8XmTNIP9M4erdl2hcFuA+7lWAHQatraboyVTi7XPLE8ck2r8m0h8lQ9Tn0RvyNs2ICc0aKiD4UzLYDrpxM9gU0CUrl8vQkhujPNBDQsAl5qvX86Zxckca98CNW7xGIJEEkQWvYBzXdDdd4z2m5QnoVJUQBQ/V+bb55d+E7yxBE21OhzZ9bCDGnVFkG0WgPdjv0NA8xKbtHLivx0+nUPw29/dFbYGx336RdZPISPHsL/LsOBGHDtZUolR2HS+I1gO1LgRPDTEAfsIzzvHhaySrKjB1ekCMoi5NjXD1bCBWQVLoj+NseySx0//TbY9nX+7z1qVHqRIu2GLSS+C76EpAO8ZBvIoOYqKJx237q1rsDv9kfB0UrolX41lwXxYQtvJBKYMX6ck7FR/mSNntc85CoXZDrkVYtt3
x-ms-exchange-antispam-messagedata: 2vgx8A1nyEx6xgGor3VYlr0xTA3bmUAibhjhYo69JqdHxZSJy19WSE+rfTbgNyeR47MSyk6bcyehoJ0EPeYrkfJDUxpx8YSqDLQJ0mPyoQwuc57T1qa1mpCx8gxFQYty0mpiNfAGC3f+2WQvpHxsLw==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-ID: <30A4B9AC845BAD4BBB4EBD91A9B584ED@eurprd04.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ab7c625-db0f-4218-fbc7-08d7ca6e1089
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Mar 2020 12:23:56.7656
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5W99JV5OKZUyvmpFuS/mpOxtf8HyzFCf53QuRbk5zL/8gXZyM3jwZwFk+WnFMrdg/v8uojI33Iojv2b8xMaiGw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5856
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The following changes since commit 6a7c533d4a1854f54901a065d8c672e890400d8a=
:

  xhci-pci: Allow host runtime PM as default for Intel Tiger Lake xHCI (202=
0-03-12 17:34:49 +0100)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/peter.chen/usb.git/ tags/us=
b-ci-v5.7-rc1

for you to fetch changes up to d9958306d4be14f4c7466242b38ed3893a7b1386:

  USB: chipidea: Use the correct style for SPDX License Identifier (2020-03=
-16 11:13:47 +0800)

----------------------------------------------------------------
- Improve the runtime pm
- Cover one cover case during suspend/resume
- Some SPDX License changes

The code changes are at my ci-for-usb-next many days,
no issue is reported.

----------------------------------------------------------------
Nishad Kamdar (1):
      USB: chipidea: Use the correct style for SPDX License Identifier

Peter Chen (2):
      usb: chipidea: udc: using structure ci_hdrc device for runtime PM
      usb: chipidea: otg: handling vbus disconnect event occurred during sy=
stem suspend

 drivers/usb/chipidea/bits.h        |  2 +-
 drivers/usb/chipidea/ci.h          |  2 +-
 drivers/usb/chipidea/ci_hdrc_imx.h |  2 +-
 drivers/usb/chipidea/otg.c         |  7 +++++++
 drivers/usb/chipidea/otg.h         |  2 +-
 drivers/usb/chipidea/otg_fsm.h     |  2 +-
 drivers/usb/chipidea/udc.c         | 13 +++++--------
 drivers/usb/chipidea/udc.h         |  2 +-
 8 files changed, 18 insertions(+), 14 deletions(-)

--=20

Thanks,
Peter Chen=
