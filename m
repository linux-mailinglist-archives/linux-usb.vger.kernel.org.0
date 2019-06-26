Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B4DB25681B
	for <lists+linux-usb@lfdr.de>; Wed, 26 Jun 2019 14:00:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726242AbfFZMA2 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 26 Jun 2019 08:00:28 -0400
Received: from mail-eopbgr30091.outbound.protection.outlook.com ([40.107.3.91]:58432
        "EHLO EUR03-AM5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726104AbfFZMA2 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 26 Jun 2019 08:00:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=targetsg.onmicrosoft.com; s=selector1-targetsg-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YAjZT1y4h8huJIfF8gnd1gTv/bao8Vb8dYcD+uojBNw=;
 b=Npbye1fQDvAuXz0dFNI0rMpM/s8u1SJbqanCtJBStkpJDrv5duxJ3LO3JTca48DF9HtXwpQD7fQCm4ptJRGK3FNc7xFRbGcAYXMCXJxYkrDYwidvGM/WzUITD1nLaEfghs8CYnyx/J2jm7xPPYIL1lufWmMr7kPEoHRqrmJooMM=
Received: from AM0PR02MB3841.eurprd02.prod.outlook.com (52.134.87.30) by
 AM0PR02MB4337.eurprd02.prod.outlook.com (20.177.109.150) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2008.16; Wed, 26 Jun 2019 12:00:22 +0000
Received: from AM0PR02MB3841.eurprd02.prod.outlook.com
 ([fe80::31ee:1319:473f:66e3]) by AM0PR02MB3841.eurprd02.prod.outlook.com
 ([fe80::31ee:1319:473f:66e3%3]) with mapi id 15.20.2008.014; Wed, 26 Jun 2019
 12:00:22 +0000
From:   Kai Ruhnau <kai.ruhnau@target-sg.com>
To:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: No carrier lost information with gadget RNDIS/ECM
Thread-Topic: No carrier lost information with gadget RNDIS/ECM
Thread-Index: AdUsFPmU+UglLYdrSGuD1S1toRllig==
Date:   Wed, 26 Jun 2019 12:00:22 +0000
Message-ID: <AM0PR02MB3841F110F7B6931A087DF566C5E20@AM0PR02MB3841.eurprd02.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=kai.ruhnau@target-sg.com; 
x-originating-ip: [2003:c5:174d:e100:5155:be7d:c1b3:c36a]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: acac5fce-bf8b-4dc8-0ae8-08d6fa2dde02
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(7021145)(8989299)(4534185)(7022145)(4603075)(4627221)(201702281549075)(8990200)(7048125)(7024125)(7027125)(7023125)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);SRVR:AM0PR02MB4337;
x-ms-traffictypediagnostic: AM0PR02MB4337:
x-microsoft-antispam-prvs: <AM0PR02MB43379A3260F0B6B8C1EDCE06C5E20@AM0PR02MB4337.eurprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-forefront-prvs: 00808B16F3
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(376002)(396003)(136003)(39830400003)(366004)(346002)(189003)(199004)(76116006)(7696005)(44832011)(2501003)(316002)(46003)(486006)(71200400001)(99286004)(68736007)(71190400001)(52536014)(73956011)(256004)(508600001)(64756008)(66476007)(6916009)(14454004)(66446008)(5024004)(66556008)(66946007)(33656002)(476003)(86362001)(8676002)(81156014)(81166006)(6436002)(55016002)(2906002)(53936002)(9686003)(74316002)(305945005)(5660300002)(7736002)(8936002)(25786009)(186003)(102836004)(6506007)(6116002)(5640700003)(2351001);DIR:OUT;SFP:1102;SCL:1;SRVR:AM0PR02MB4337;H:AM0PR02MB3841.eurprd02.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: target-sg.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: UBeb8rTODC970I3vHmFp/Fx+lBxeuatRb5u0aECagNurWLmG1xxfBF/crJyiMqOwOKQ8q7H0T5cNCzxPNf4sJzBd7QtfclPhYPwY+Jz5DqSMv4GoUXk2r8sjTjmQnp8S0cjSvu79XrW7unC7m+1WRrkmWMSr2EhO+nKZT6X2jCrNpBFNKuHQd81WtW60S422qs/ppor1aA92lFuIgvC4WqdyUs0bR0Sq+H+yAiLGcbQMCvq5OX4caWiKmPfih0gdviS7shyLdPkz4RNP6kC2pd0LLwVoTbCAMi1MO4bUMdUqAkaN/Yzl6HBT6ARfGcgMTB4nTe4bkgvMeo0HjfkUTGey+2evd/iBSEZfzq8Zf3j83XGQjOVLR3uo8XiQ3/sLU/GM7WDChFrsbtZSuqmsIEEo36efeKkJ+dlKYf3BStk=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: target-sg.com
X-MS-Exchange-CrossTenant-Network-Message-Id: acac5fce-bf8b-4dc8-0ae8-08d6fa2dde02
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Jun 2019 12:00:22.4312
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 52a4fe2f-f30a-452d-90b1-03ecc8ab0c0d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kai.ruhnau@target-sg.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR02MB4337
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

On my i.MX6 SoloX, I have configured one of the OTG ports for a combined RN=
DIS/ECM gadget. After boot, I have two network interfaces (usb0 and usb1) w=
hich are managed by systemd-networkd.

With kernel 4.9.153, systemd-networkd reports an immediate carrier loss whe=
n I pull the USB cable from a Windows or macOS host. With 4.19.53 or 5.1.15=
 that carrier loss is only reported when I re-attach the cable, meaning the=
re is a "Lost carrier" for the last used interface immediately followed by =
a "Gained carrier" for the newly connected interface.

I have activated CONFIG_USB_GADGET_DEBUG_FILES, and the contents of /proc/d=
river/rndis-000 don't change when I pull the cable:
Config Nr. 0
used      : y
state     : RNDIS_DATA_INITIALIZED
medium    : 0x00000000
speed     : 425984000
cable     : connected
vendor ID : 0x00000000
vendor    : (null)

Only when changing the host to a Mac, it's different:
Config Nr. 0
used      : y
state     : RNDIS_UNINITIALIZED
medium    : 0x00000000
speed     : 425984000
cable     : connected
vendor ID : 0x00000000
vendor    : (null)

Thanks for any help.

Cheers,
Kai
