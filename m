Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8CA1F95408
	for <lists+linux-usb@lfdr.de>; Tue, 20 Aug 2019 04:09:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728819AbfHTCIA (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 19 Aug 2019 22:08:00 -0400
Received: from mail-eopbgr50042.outbound.protection.outlook.com ([40.107.5.42]:56194
        "EHLO EUR03-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728615AbfHTCIA (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 19 Aug 2019 22:08:00 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PN2zK8Da7IF+LltjjMNm/9ZGQrmzMEW0vOBNUNd/WZN4MqKz0vqQ5KtLSftkOPAZa8ZdpaZQ2+8VkigQqfnVsqQeX6UpaLV3kX76jDtTivkFG2raFEJ4iMqF4GfoNArW/aRf4f7ynzEIKAbsttqqiQyojqTzq0Vrt+LbT2LX9+qoGMghdZU+rJx9QFFLyn2CZHFb5ZshLaI5PTpOJ+1aAzMobe+0yJGmjfKM5fNUmQWFSmgZ3y4WrJQdj/5kwvs2BEIPnZnfeolpJNv6gbH73Jc9qiuWOB37KaqXMjMlJLvIfYysJZlLgYCInDe8e9iIchLhYji600tKzB5Xe4ugnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZHB7x/n6wdSSZ9nMcJ7Lbq7CdufO6Z+oEqoa3EuU1Cs=;
 b=O9IiJp1d7oMovQ71uqAcIblNHN8Br4tp40vSMBTaZCKZbbDuOsjP1FiriWWVqQGkP22XTSrvR/QdTos0/Z/KjZgNScYHL1ExTE2yX3ulhmnVX4GAn6P7AOT+UmD9o8Fw/n5RNwFYiB6CbByJhQwSH5Jpx2P3bgo9GOZV/8HaNGZwbC18Q/04ykekfQr3DKeCxr3cdfXFu4a0y4p3TBrXVC9JmjujWrxSQNvy9gCHuDMleDGEJBy1g6hsELwGXk0IWI2BNsKjsGC0OKBpU4ZQkFKrfOxLUyvf0FQ9Ju7gvJt5lutz2JsS8LoHLXaBG6aVcI5JSgDOgK6Kos0wptj43g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZHB7x/n6wdSSZ9nMcJ7Lbq7CdufO6Z+oEqoa3EuU1Cs=;
 b=qHcGnlCEXlPc8qVJTrcNx7gHJubi6xJJWJfZSngxuXGJROl9HEf9v8KdLiE/Dsn7isseGLVX5jjBjYf5OyVmeXQqc3+bSiCULLKwagKCZ+2JrPG0eKF50M8riFlS5+1xM2I6wnk4zBbYCITWguzOe3BG03AYdI+W5jGAYAh+nQc=
Received: from VI1PR04MB5327.eurprd04.prod.outlook.com (20.177.52.16) by
 VI1PR04MB5151.eurprd04.prod.outlook.com (20.177.50.204) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2178.16; Tue, 20 Aug 2019 02:07:56 +0000
Received: from VI1PR04MB5327.eurprd04.prod.outlook.com
 ([fe80::e039:172d:fe77:320a]) by VI1PR04MB5327.eurprd04.prod.outlook.com
 ([fe80::e039:172d:fe77:320a%4]) with mapi id 15.20.2178.018; Tue, 20 Aug 2019
 02:07:56 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
CC:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Peter Chen <peter.chen@nxp.com>
Subject: [PATCH 0/1] usb: chipidea: fix for v5.3-rc
Thread-Topic: [PATCH 0/1] usb: chipidea: fix for v5.3-rc
Thread-Index: AQHVVvwUo8IVBBDjq0mdGoNMLElXcA==
Date:   Tue, 20 Aug 2019 02:07:56 +0000
Message-ID: <20190820020503.27080-1-peter.chen@nxp.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.17.1
x-clientproxiedby: HK2PR02CA0213.apcprd02.prod.outlook.com
 (2603:1096:201:20::25) To VI1PR04MB5327.eurprd04.prod.outlook.com
 (2603:10a6:803:60::16)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=peter.chen@nxp.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [119.31.174.66]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 483a312e-28b6-4f69-8708-08d72513373f
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);SRVR:VI1PR04MB5151;
x-ms-traffictypediagnostic: VI1PR04MB5151:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <VI1PR04MB51517B911DAD4C03D32DDC188BAB0@VI1PR04MB5151.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-forefront-prvs: 013568035E
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(346002)(376002)(396003)(39860400002)(366004)(136003)(199004)(189003)(50226002)(1730700003)(36756003)(6916009)(5660300002)(186003)(7736002)(66446008)(8936002)(81166006)(6116002)(81156014)(66476007)(2351001)(66066001)(4744005)(71190400001)(386003)(26005)(66556008)(6486002)(5640700003)(6506007)(25786009)(8676002)(2906002)(64756008)(66946007)(102836004)(54906003)(6436002)(99286004)(316002)(6512007)(44832011)(305945005)(2616005)(1076003)(71200400001)(486006)(86362001)(476003)(478600001)(52116002)(3846002)(2501003)(53936002)(256004)(14454004)(14444005)(4326008);DIR:OUT;SFP:1101;SCL:1;SRVR:VI1PR04MB5151;H:VI1PR04MB5327.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: hDZKV5GVWgs/L4U/Q18RPBkkXTQfqTSc+1ddBiqMY4AZ3mrv0PHNhq2OD5Wz0yTaJOhMECB7gixu88PmAWMAeHnAuk9iBPe1sxIlmmb2UBySvsAOEradheCvXmfXkbMlNaL4spdVfuFIWs2vvjj9plcCBbhxQIIOoZFLI9HKqA7NNS92KV4nRPhIph5XKyJWngnFh200115mqTaZMRglTiD8dNVc3pRMPOY5siQuo1wiF/kBCfnQTNUgWAxLK4i5PuWamUDA/D56QIT9HOZLQlJ+RyoaFwIbRlW3eqiFjF7zKbsdYF+o9cdtQdQEEqJoXnSV/q+hMAYqF9z0Qk5balJWt9rt8crS1v3Ogg85U40wjFwwpJUZzbcGLukJeYIiLBmAYSpp2OBS3C9iCuh5BTAwlLc44rgXdisenoTAmU4=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 483a312e-28b6-4f69-8708-08d72513373f
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Aug 2019 02:07:56.2288
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: n2LNO8XiNKzNZeOEoq1nCS90o0D3jH5ZGONmhnXVGZh46PFMtm07Y2vm09knFwFEu2pkMDC1yBRkzFl/2nt7bg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5151
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Greg,

When the driver enables runtime pm, it may cause the system hang
when plug out the cable from PC. The patch fixes this issue by
avoiding hardware accessing at this situation.

Peter Chen (1):
  usb: chipidea: udc: don't do hardware access if gadget has stopped

 drivers/usb/chipidea/udc.c | 32 ++++++++++++++++++++++++--------
 1 file changed, 24 insertions(+), 8 deletions(-)

--=20
2.17.1

