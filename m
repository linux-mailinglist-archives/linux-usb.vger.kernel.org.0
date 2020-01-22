Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C6A3914498A
	for <lists+linux-usb@lfdr.de>; Wed, 22 Jan 2020 02:47:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727847AbgAVBrH (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 21 Jan 2020 20:47:07 -0500
Received: from mail-eopbgr20050.outbound.protection.outlook.com ([40.107.2.50]:8523
        "EHLO EUR02-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726968AbgAVBrH (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 21 Jan 2020 20:47:07 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L4J7b0+y/FE/YbXNnkafnBl5UdT1UfVbEV+JvpliXi8PH4kDz4xV50cu2D+61/M/SYQsSVx/aPnoPp8Hf9eFsASINDWdvoDoHsUl4+6So7egDvEKxbvr1q3KYv5MG2D6Ij6bpOKwAfdCiaRDDu+0UrUPrbT1yn6qCUfp1SyLUSljh7ZNDWCDYGBEVWc1iQ00vUk6ko8uZFHWPEkZAnIq0dzj12LwUQGmSiC47WY3Fs1bKxJyB5TldA9KaUhpeJdUayA/oSAK/ZFq1ff5XRVfXPdFf9lzOEM1vsOoxIJ0LwvNo27KYfcsb18ZXMgyH9sHYguxOpv7e57rz8ltNVfB2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tZz0JLBuAFDwch8Zn/G56fLMdBIHN/P9ayT3hTCZ+1M=;
 b=F5MRlD50i0oaF9vutnx5ItrcIhLrazXG5X8shr5TTlujDGKxHf+cYJ/jqncE4MC80UbMboQPkJaY3k5p4q9JLQ9aBN+EwtpmOQeNTxfMFPGPMIQ7KRZI1yux4HtSEcwPmxeeJEHV6lxsvzCVM+KEK60uJgfsX7TTInR+YyUSSqExXa86ZgmJoAs0m6FpPOvRAAJPj3i5sAfglNeWxnwUElsa5zV9dw/LDwmrlREqD9qqKGmFnmhE1FsEnVkZhjlgFjCLLPB2K7AjAM1xtcZfUYVxaWOcMlQY1EO+jlodLJ+JFVsFr1JvLZAsOkNkhK/XsKL8mHOiiAwh7oTa9HecFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tZz0JLBuAFDwch8Zn/G56fLMdBIHN/P9ayT3hTCZ+1M=;
 b=LYST9dtmht4XbSnD/6fgOUHzT23n42PduwrkOSeHuTSTfby9bMQ+W0s+ACwBdybJeOzyR9H3qN/pRYQ4r2j587ACHLM37LsdqI9we0ZPUAm87NUafoYuboeDHH7VE27rAr6KpMT7ZOihGkWZvnSPiV2imClbaq8pI2A3VSsIJaQ=
Received: from VI1PR04MB5327.eurprd04.prod.outlook.com (20.177.51.23) by
 VI1PR04MB5997.eurprd04.prod.outlook.com (20.178.122.25) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2644.19; Wed, 22 Jan 2020 01:47:03 +0000
Received: from VI1PR04MB5327.eurprd04.prod.outlook.com
 ([fe80::c7d:58a2:7265:407e]) by VI1PR04MB5327.eurprd04.prod.outlook.com
 ([fe80::c7d:58a2:7265:407e%6]) with mapi id 15.20.2644.027; Wed, 22 Jan 2020
 01:47:03 +0000
Received: from b29397-desktop.ap.freescale.net (119.31.174.66) by HK2PR04CA0087.apcprd04.prod.outlook.com (2603:1096:202:15::31) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2644.18 via Frontend Transport; Wed, 22 Jan 2020 01:47:01 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
CC:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Jun Li <jun.li@nxp.com>, Peter Chen <peter.chen@nxp.com>
Subject: [PATCH 2/2] usb: chipidea: add inline for ci_hdrc_host_driver_init if
 host is not defined
Thread-Topic: [PATCH 2/2] usb: chipidea: add inline for
 ci_hdrc_host_driver_init if host is not defined
Thread-Index: AQHV0MXY+0CWOEZ2mUCxFM3i5GTD8Q==
Date:   Wed, 22 Jan 2020 01:47:02 +0000
Message-ID: <20200122014639.22667-3-peter.chen@nxp.com>
References: <20200122014639.22667-1-peter.chen@nxp.com>
In-Reply-To: <20200122014639.22667-1-peter.chen@nxp.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.17.1
x-clientproxiedby: HK2PR04CA0087.apcprd04.prod.outlook.com
 (2603:1096:202:15::31) To VI1PR04MB5327.eurprd04.prod.outlook.com
 (2603:10a6:803:5c::23)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=peter.chen@nxp.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [119.31.174.66]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 29969453-c86b-40b4-ec9c-08d79edcfa51
x-ms-traffictypediagnostic: VI1PR04MB5997:|VI1PR04MB5997:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <VI1PR04MB5997C253A284BF4E9B268E828B0C0@VI1PR04MB5997.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:40;
x-forefront-prvs: 029097202E
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(366004)(39860400002)(136003)(346002)(396003)(376002)(199004)(189003)(86362001)(1076003)(52116002)(26005)(66476007)(66446008)(66946007)(66556008)(6512007)(64756008)(5660300002)(8676002)(71200400001)(2616005)(316002)(6916009)(956004)(2906002)(4744005)(4326008)(54906003)(6506007)(478600001)(6486002)(8936002)(81166006)(81156014)(44832011)(186003)(16526019)(36756003);DIR:OUT;SFP:1101;SCL:1;SRVR:VI1PR04MB5997;H:VI1PR04MB5327.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Vb6Lz1NYsX5PW9pS0EBXOaVRvd1d/VudwPo3gWCMG3ZFD8wToffl+V3IdDfsMJPHveNkX7vFHF4vUhxpjsLqvq2UPRLhNX193a8xPBuVlNpfnuU3bi7M+WLRj4n/C92rqUfoePme+ik3pi+BTa4BiW+VRy/dnsj+gTRptHPxacgWdZqjAxI/cVbffvi3awaYG2cfkIZlvemah1/4xlXeYauGzCKCPtG0QZ249ZEuT3Puk4KH8ov3bBtYyY9KJ6m2/xt3Beo44PeRXJT/Ngv+keGkXEuebRrITakD36B2STLWSERsR1E+Y2Nmo9eo72k6v6GcE/Vphf6vO0nmmp5FSI+N1nnv6fGlMUODImRfTEfA3ljPs81SbTEeh0pZpvmMyzj2Z2vJqSV3FKnWIk9jLbBnbwkKeWar21PllX3v/kdH8uEx7Lr504DtchGiDpPY
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 29969453-c86b-40b4-ec9c-08d79edcfa51
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jan 2020 01:47:02.9279
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: L4XgDQ5ZDPZW08bpvw5QDUKiTpbG/24IQ2t/N7trYuDw4j+EYlxOvGK2fhjphLsJckkPIjSQPjP0ARux7vKW/Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5997
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Jun Li <jun.li@nxp.com>

Otherwise, there is a build warning if this header file is included
by non host source file, eg, otg.c.

Signed-off-by: Jun Li <jun.li@nxp.com>
Signed-off-by: Peter Chen <peter.chen@nxp.com>
---
 drivers/usb/chipidea/host.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/chipidea/host.h b/drivers/usb/chipidea/host.h
index 70112cf0f195..2625aa01a911 100644
--- a/drivers/usb/chipidea/host.h
+++ b/drivers/usb/chipidea/host.h
@@ -20,7 +20,7 @@ static inline void ci_hdrc_host_destroy(struct ci_hdrc *c=
i)
=20
 }
=20
-static void ci_hdrc_host_driver_init(void)
+static inline void ci_hdrc_host_driver_init(void)
 {
=20
 }
--=20
2.17.1

