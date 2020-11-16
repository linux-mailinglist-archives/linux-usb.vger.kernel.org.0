Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C16372B3EE9
	for <lists+linux-usb@lfdr.de>; Mon, 16 Nov 2020 09:42:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726440AbgKPIlR (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 16 Nov 2020 03:41:17 -0500
Received: from mail-db8eur05on2088.outbound.protection.outlook.com ([40.107.20.88]:52193
        "EHLO EUR05-DB8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726302AbgKPIlR (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 16 Nov 2020 03:41:17 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iiDUYBC2A8EktJbCVFuxHig3O0z7aYn+ezaAecMTvI86SXkJOR69rQAZq6Qz6LEpaTspfK/HplvLlbrR9P6e/yWWR4sIpRsxFXx4vLhhaXAUBLKnJv6vXdW/ofKYKrwzUrQZt3hqUYuFmcGY1zPw6RXkVCQO3RFbARJxuiLoWIwFgCw3jIh8wjcXLCsYxZV0pclU2NbtZmNpu1hUqWvO0ozanPVLms0HAKMMofd7bXwxOUeWsZBDRnGOzEWnILuEorC7SW2p+7pJjBFHa+yARySnZb+HNnF1wAqyoN/9EiOmYslPf0ZcwDrLpfkuQvP7CzozXcgRJLFCWjNzqWDzSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=skn/+bWmuguV2l22WZ+Sf4Rkc3H9Ktb2lm/Pg+3MLt8=;
 b=KJVKLufOHvpVJkBkCAH9umh+EFIEY6eKot+4YMX3lxl8QlYk3vlevHXrutBhkIVezvcyfVmno2XsjWr3elx1K6JyjptR0ENjwJb0YJcUV+Gf8JmxDSKPT93+vr+bPvWqsCs+liLgW7x1OH2YSZMsU5f6Zj7TTzJagE+FqJFhg0ojbh41RdvNABaUBhdg110pYvEXxr7X/qriawZVo7JHVaRTy/x2yeLNeMuISAaT/z2vzByCe42lcsS/pl7HifurlY+YcW+uFMwcq3Ok6F4zNMU+P5nr2eXCeNfY+mPoHRX1mZt1DoKfRkBmLoRmtqBCO2olw6Sc5Iwf+7DIPPOKsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=skn/+bWmuguV2l22WZ+Sf4Rkc3H9Ktb2lm/Pg+3MLt8=;
 b=P/sOoodeOd8UrCdC8MSftpBK1ruT8NwmcYGdRNoS1zyblIvjIgqx/BvzfF6MlQ6csx9IgfW69qrUk0F9c7Kk7rJf63XPDxkHxHs0+LfMuMn9QkdnoftlwK/ft83tKtCwlcUwzvCguCyQYaCbzVDg5lyoYIAoY28BkH5t+pd9InQ=
Received: from DBBPR04MB7979.eurprd04.prod.outlook.com (2603:10a6:10:1ec::9)
 by DBBPR04MB6027.eurprd04.prod.outlook.com (2603:10a6:10:c7::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3564.28; Mon, 16 Nov
 2020 08:41:14 +0000
Received: from DBBPR04MB7979.eurprd04.prod.outlook.com
 ([fe80::c8c:888f:3e0c:8d5c]) by DBBPR04MB7979.eurprd04.prod.outlook.com
 ([fe80::c8c:888f:3e0c:8d5c%5]) with mapi id 15.20.3564.028; Mon, 16 Nov 2020
 08:41:14 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
CC:     USB list <linux-usb@vger.kernel.org>
Subject: [GIT PULL] usb: fixes for v5.10-rc5
Thread-Topic: [GIT PULL] usb: fixes for v5.10-rc5
Thread-Index: Ada788nAmCHAIB0lQlmAy9fF+yUfsg==
Date:   Mon, 16 Nov 2020 08:41:14 +0000
Message-ID: <DBBPR04MB79796D9ADEBB335ED878450D8BE30@DBBPR04MB7979.eurprd04.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linuxfoundation.org; dkim=none (message not signed)
 header.d=none;linuxfoundation.org; dmarc=none action=none
 header.from=nxp.com;
x-originating-ip: [222.65.215.201]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: ee076617-e43c-424e-f715-08d88a0b60f6
x-ms-traffictypediagnostic: DBBPR04MB6027:
x-microsoft-antispam-prvs: <DBBPR04MB6027F7E3F05B4428981A4AAC8BE30@DBBPR04MB6027.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:431;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: H5gcAkNkPNcqndORxjjVbrEtROPKE22gCAmeTf1a0+MZdMsNYo90B6EPbkwvCf7oSFOURs0qvzkBdnCCKTk55N4rRdLbTIN3FnGl1/d1hdPdA4/LaXfnlD7YXPWqEmUfu+1Sjv7Z9/InCYOrf739AUq1FFKIkG1Yi1l2GvaE8qxbm9H8wODenWNlu8wjn1osDBUhuNUCDAsxRQhpEs5sx/zbXSffu5WBrNM5+udl5HMmgQrWQYMSL1ac+LiSR9xSh4NeeiXcma36VjUQYEdtBGrvWz2hxouxRKsrwGNWJ9baazxTR4XbTtzJEQ/PldHKI9s/6NeYZgqcRXD52345DA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR04MB7979.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(396003)(39860400002)(136003)(346002)(376002)(7696005)(26005)(71200400001)(6506007)(316002)(52536014)(76116006)(44832011)(5660300002)(186003)(66446008)(66946007)(64756008)(66556008)(66476007)(86362001)(4744005)(33656002)(8936002)(8676002)(4326008)(6916009)(478600001)(2906002)(9686003)(55016002)(4001150100001)(83380400001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: S+e/Zl5LdpygNDTQoEZwF36y4+RlmxWIDdLnOoj3GbgXUIMKMsDr5g32B2KjqOU44bTQYOqV1X5Bq1cUMmhOje/JwzNWWxZExQ68nWdQeOAIPnmmXZFdI4jFQYFAWNMX6ejMVIh6lCUPdHPPH+h7cJ9yEyIZsEkEHjnAFy2FFZM3FcInDVAQd0PDIR7mXQ6f6Bpc+PW25TelyBIgwyGZSf1ZbiT7E5pBjXmoniD2Ahs16nVxoXafvzledsNTjx6Gsp+NVWTuedEh6g/HfEyucvayN4STIOc7R22XHtSqOOYh5acqWjRKrhsLwa6FE6DXmkOABhfxUbEsitxdM+7P7umJqPity7jU0L6wtvLCJqa56iro5G6DGhhVaJCjWUQw5BwbThid+MFjhhBVj+a3ZNv7hxs2HlkwWq8aeTsIUDQHcyDpwzpJSa0HSjE1vZ49eOV8xrEv9Dp9VOhg/g7RnTfXrk/QeAoFfiN8cBmJ9VMSUAcA4XyrcdWlZLtF/uUsSvo2DXP6f1crJTcWRV6nIqp41KYamc5pwLQZJy1VpxTS5b9lucfn3WPRKdoEG+jbyTOMbmz7PIAW/29E/q601IwZgHn37a4r1nmZWSYDwXkzPgAuxS0VpE0FxIc1R/QZpQTm7sbhLfhLDjg8dhSFkg==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DBBPR04MB7979.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ee076617-e43c-424e-f715-08d88a0b60f6
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Nov 2020 08:41:14.7891
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WzxdhG65wVfhbrVTFAxpmLEx/rVXGeksKuQtu10JcANy8HHnBIBhbKr7a8PYpbEVcUau0zNJ/zqw4fPSo4HzTw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB6027
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The following changes since commit afaa2e745a246c5ab95103a65b1ed00101e1bc63=
:

  USB: Add NO_LPM quirk for Kingston flash drive (2020-11-03 10:19:07 +0100=
)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/peter.chen/usb.git/ tags/us=
b-fixes-v5.10-rc5

for you to fetch changes up to 40252dd7cf7cad81c784c695c36bc475b518f0ea:

  usb: cdns3: gadget: calculate TD_SIZE based on TD (2020-11-16 15:08:52 +0=
800)

----------------------------------------------------------------
Two bugs for Cadence USB3 gadget driver
- TD_SIZE entry at descriptor is error for multiple-trb use case
- Possible use uninitialized variables

----------------------------------------------------------------
Peter Chen (2):
      usb: cdns3: gadget: initialize link_trb as NULL
      usb: cdns3: gadget: calculate TD_SIZE based on TD

 drivers/usb/cdns3/gadget.c | 26 ++++++++++++++------------
 1 file changed, 14 insertions(+), 12 deletions(-)
