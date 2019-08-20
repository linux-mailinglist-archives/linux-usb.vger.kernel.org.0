Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AFE1395485
	for <lists+linux-usb@lfdr.de>; Tue, 20 Aug 2019 04:43:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728800AbfHTCnm (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 19 Aug 2019 22:43:42 -0400
Received: from mail-eopbgr150057.outbound.protection.outlook.com ([40.107.15.57]:53875
        "EHLO EUR01-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728669AbfHTCnm (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 19 Aug 2019 22:43:42 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MsnQJcO+j49SoCL10NBeagN6Uj7ZBVl8OryIeWealZQhapmV+MvwnUDyLG79I02ZbJ9jeiLg4NYX3j760rDyRNcuwWLagA8bnsjcYgzXTtxggIcg4Bf3J9JVEBAvNr8T0yNNUr3mdRTiZ527Iiu0MZECmfOaIJirZuM96vUUSaU1/D6MW+Vxc8SvHAz23FCVOAZuHw3oc/XqBT9iulA0q6mtAC8G8JK2ZBL6uY/L14TrvC5fx/gtQiScI6ZORyGsKImtiM2o6vRaoom/YICL9N1SATsTi0Pm2EbNDn2q6sGjN9LykUAkOvRjrgE+avIfb09OE4rkzLakfYIDH7JKKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gnMt0W0DKU4/hjg79KWJVncPv9Q7sYyYjtCbknKPq58=;
 b=W5CCbfzohf58wGd9pRbfm+9QBfW45PFxw1adCUZOXBbeaatHewmi845DYcpxH/eNj3pn+gxeTxklyYIzuO6D3Igcf6VXbMqOpBnEV5jNPpED44JYuLx2hkPsSp8C7Y8somepf2/LbOUviltRkqvkcZADmtHJBlVw1Hjv8ot2HxnMm8DjAjJBBnTXMsiL2dvktyTZgO5RX3mF5kzIkBOD77N11EB5YnGCavOuUfrRVnDNNedbDojDBqsbGnMYsTfmsF29yOObsKgZt9Qq8f7PdHL4y3d0nKj0RioPiA0IFyb0f4hqv0k2i08XDexTMKpWKn6UuLDUyvtIit9Q/3EkDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gnMt0W0DKU4/hjg79KWJVncPv9Q7sYyYjtCbknKPq58=;
 b=Hns49czno9Fl3X3Sxnf7a+TwWdkILMOBrNi8lEW81JAJQJ+xVUf14R7P6kGxUygTTEOtWU7eFWypJcVgXMxWN+BweAzNYtNzpRrPlhjkYcSCLppUBPf8DzOT7QQu6jNx3/xGYjl+zK2eikE5epOuABuLpGQzVRirfvV+vuUZg8E=
Received: from VI1PR04MB5327.eurprd04.prod.outlook.com (20.177.52.16) by
 VI1PR04MB6158.eurprd04.prod.outlook.com (20.179.27.84) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2157.18; Tue, 20 Aug 2019 02:43:38 +0000
Received: from VI1PR04MB5327.eurprd04.prod.outlook.com
 ([fe80::e039:172d:fe77:320a]) by VI1PR04MB5327.eurprd04.prod.outlook.com
 ([fe80::e039:172d:fe77:320a%4]) with mapi id 15.20.2178.018; Tue, 20 Aug 2019
 02:43:38 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
CC:     dl-linux-imx <linux-imx@nxp.com>, Peter Chen <peter.chen@nxp.com>
Subject: [PATCH 1/2] dt-binding: usb: ci-hdrc-usb2: add imx7ulp compatible
Thread-Topic: [PATCH 1/2] dt-binding: usb: ci-hdrc-usb2: add imx7ulp
 compatible
Thread-Index: AQHVVwESScNIwmUZ20WkBx5cO9zAzw==
Date:   Tue, 20 Aug 2019 02:43:38 +0000
Message-ID: <20190820024046.27755-1-peter.chen@nxp.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.17.1
x-clientproxiedby: HK2PR03CA0065.apcprd03.prod.outlook.com
 (2603:1096:202:17::35) To VI1PR04MB5327.eurprd04.prod.outlook.com
 (2603:10a6:803:60::16)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=peter.chen@nxp.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [119.31.174.66]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 54a3960b-74bd-4a2e-a488-08d72518345b
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);SRVR:VI1PR04MB6158;
x-ms-traffictypediagnostic: VI1PR04MB6158:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <VI1PR04MB615863B7C675FF74E78EBE108BAB0@VI1PR04MB6158.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:296;
x-forefront-prvs: 013568035E
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(39860400002)(136003)(346002)(366004)(376002)(396003)(189003)(199004)(6436002)(3846002)(66066001)(8936002)(6916009)(305945005)(66556008)(2501003)(26005)(52116002)(36756003)(4326008)(2906002)(6116002)(53936002)(6506007)(81166006)(25786009)(476003)(2616005)(486006)(102836004)(8676002)(2351001)(186003)(14454004)(50226002)(7736002)(81156014)(5640700003)(316002)(1076003)(86362001)(478600001)(44832011)(386003)(71200400001)(64756008)(6512007)(66946007)(256004)(5660300002)(99286004)(71190400001)(66476007)(4744005)(54906003)(66446008)(6486002);DIR:OUT;SFP:1101;SCL:1;SRVR:VI1PR04MB6158;H:VI1PR04MB5327.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: l923A29o5qBtxxFJQBI1dUKUkfLQZG/q8XO5Qq7HlSxxUG0I0KbN0qJdbsZ44Rl6Tlf9U6AbS9Ynrv7Z8evS6DAi45SMidSEXaMdz5jmJbAB3d0T3HykoS3pHWIb/0ZmR8PtDEVUZ5V/KPs1sJTwCjL/LFLmr2YFUZwsNEBdRcZYshRTGktqPtTeybaWVLDZC2zEwYG0DbHkBf4pFJcevZFyaoLDnghIea8YNMWeXpgQAte0e6d+SgzGII1fqy8vDDUfksF5gZ1MCX2JHF3W6Z+VWDZ+e8h9oTHmohwFCTb7x2SMARFzLLZx5v3foos0J26TVhUDJheXNXy0u62fBK3JM7o7GQSicwzDB0yY52FB+8UXs+ZoeJDpjWAIHU7ROhKuBdlJvWzTjq5lpDivkVZJwUNLjGbsPoLdyHUKJpE=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 54a3960b-74bd-4a2e-a488-08d72518345b
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Aug 2019 02:43:38.8236
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gk34vHAjbXLV/8XbtmSzSjKhj8zHl3MSegBV4Vv19bkzvlN13xFXFuSI7idKlliALToPcZKiDcWVOTowHSSZLA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6158
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Add imx7ulp and imx8qm compatible

Signed-off-by: Peter Chen <peter.chen@nxp.com>
---
 Documentation/devicetree/bindings/usb/ci-hdrc-usb2.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.txt b/Docum=
entation/devicetree/bindings/usb/ci-hdrc-usb2.txt
index a254386a91ad..cfc9f40ab641 100644
--- a/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.txt
+++ b/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.txt
@@ -10,6 +10,7 @@ Required properties:
 	"fsl,imx6sx-usb"
 	"fsl,imx6ul-usb"
 	"fsl,imx7d-usb"
+	"fsl,imx7ulp-usb"
 	"lsi,zevio-usb"
 	"qcom,ci-hdrc"
 	"chipidea,usb2"
--=20
2.17.1

