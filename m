Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DBAF219BE86
	for <lists+linux-usb@lfdr.de>; Thu,  2 Apr 2020 11:24:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387610AbgDBJY6 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 2 Apr 2020 05:24:58 -0400
Received: from mail-db8eur05on2089.outbound.protection.outlook.com ([40.107.20.89]:35142
        "EHLO EUR05-DB8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725965AbgDBJY6 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 2 Apr 2020 05:24:58 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Opz/5nImRdHV6k4X4QG1V0mMaSHGl68XTTGSY13+nsooIHBXNbGANXUw7EYge+AYy/WIp1ay1Zj3YuQ+bALMHcGK93wSVve+Zm06Rkf0kunYSk7q3ni68CNXsYYAX0TEMPpMy4QX9+8miTHDlAFGZE3JEevh1EZIwl5mGIznnJMExJ58CpcTQ7qCI3DJe7WReO5rg6GOjb+elibLUFBvzbya1acXah+zsPoDj8i+HM8RchCvzgbjfmSmMqHBDq5p/c/C05f+iPOMzEzIuKZlLhfrx3J7PrS0tnsiwWQ1DjunTRQ97+KNB/bMum5ceDkMig6cq9iUVONNlvcCAT+rwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X4ccOs12gimp/fENJC/je6zpG/GNF3X0XebU/p1QUTQ=;
 b=MhBxqnnan/gYrVd5Chs1KpG/U916DkrwFS+Jv6ounm2Hd6zT4v5vdGmKYzqvflJ2zXb3rczpRaG2oBD4Qcjd0I693txKVVnoXu76PDh7wzZ1fHKMyTrbZ+8nb0iQ5I2w+YOHm0lGRDgPc0ewXna85CsyOrBrL4zo+mSnOEjBSWz8Wh4dqrKH4rZdPIGQJVGAHL0SCAkib/vQf0zXss5aWsBGW/PCGaPm3VRu/zdGipsKk3l9QaEr9GUM3nVreUp1J0KLFQqyriW9E0Yym4+1fZt069dcfnMgVGrMnE1cPG+LBC75kVfY7ByIOt3nny4sRc8INZWYoQ1qBompiF2z2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X4ccOs12gimp/fENJC/je6zpG/GNF3X0XebU/p1QUTQ=;
 b=YthnxBq0Z5J/lBCxhEJfotQMRrcEUDmM+OY/7khSkTNPgmruUmjUoRDIV+yqWuyfuhvoqHANIN2pAIDEceCa/6pNf33VLSUqw/GpPOS6UzaezwaYvXBXqr5n4cirHFN/DPeUrgQhWfwg8fr1dMRqG1QaKhN9lju5+btWayaz1/s=
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com (52.135.57.84) by
 AM7PR04MB6918.eurprd04.prod.outlook.com (10.141.174.20) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2856.20; Thu, 2 Apr 2020 09:24:55 +0000
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::902c:71:6377:4273]) by AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::902c:71:6377:4273%5]) with mapi id 15.20.2878.016; Thu, 2 Apr 2020
 09:24:55 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     Roger Quadros <rogerq@ti.com>,
        "balbi@kernel.org" <balbi@kernel.org>
CC:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        dl-linux-imx <linux-imx@nxp.com>,
        "pawell@cadence.com" <pawell@cadence.com>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        Jun Li <jun.li@nxp.com>
Subject: RE: [PATCH 1/4] usb: cdns3: core: get role switch node from firmware
Thread-Topic: [PATCH 1/4] usb: cdns3: core: get role switch node from firmware
Thread-Index: AQHWBzPHmgeMtxTLwk2TQY59TihVrKhlieWAgAAH/6A=
Date:   Thu, 2 Apr 2020 09:24:55 +0000
Message-ID: <AM7PR04MB7157C5ECA0597F2BBB3C29EC8BC60@AM7PR04MB7157.eurprd04.prod.outlook.com>
References: <20200331081005.32752-1-peter.chen@nxp.com>
 <bc2c6e57-accd-ccc9-caec-527773056744@ti.com>
In-Reply-To: <bc2c6e57-accd-ccc9-caec-527773056744@ti.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=peter.chen@nxp.com; 
x-originating-ip: [119.31.174.68]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: ba27f782-6c45-48ef-16c2-08d7d6e7b4ea
x-ms-traffictypediagnostic: AM7PR04MB6918:|AM7PR04MB6918:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM7PR04MB691860C86246F8295BA484228BC60@AM7PR04MB6918.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4714;
x-forefront-prvs: 0361212EA8
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR04MB7157.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(10009020)(4636009)(396003)(136003)(346002)(376002)(39860400002)(366004)(55016002)(53546011)(66476007)(6506007)(9686003)(186003)(26005)(5660300002)(33656002)(44832011)(4744005)(2906002)(478600001)(316002)(110136005)(71200400001)(81166006)(66946007)(54906003)(81156014)(76116006)(52536014)(64756008)(86362001)(66446008)(7696005)(8676002)(8936002)(66556008)(4326008);DIR:OUT;SFP:1101;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: L1fGiMUIDEPWztpDQ27r1NC2aXAoFmZXSVdzFIAswW2IoG4sucTKSEB+6zjQHBz7mzKz6TTm5tDNTriyOJFpxpxFehk38KjZZQ6+Yx2rh85lS62WHxq7qd5Qmq+1c3CyRZYhchdxnQ29t8DY5uH4Mqmnltpivetjvma1mbzUeYBVvIzxwrTb1W66i7Jn9ErWkGsYYvoRz5lUkxpJMDLtyl8+2SVHwzWTdnXAHcWvjx+ut8oFOU/65PBcWc1+mJY5P0nX1rMJNReDPZr9ldGJcxsOdVo+ZliKvpcYbBRx6IMqgxexDZ61HdKOS5qNTl9fw3/EPvlLOEYp+A15vldq487kKP7sNCikoxSBxeBQaS/ThACNoIcmPHkhldTUhRmyRi258ODjIZEVpZTHHRLnRCJIfgHL+bLGQvoRHjVZ35hbaEUPx2ahko7TaArbloZh
x-ms-exchange-antispam-messagedata: f/xTs6uYUIcgiV96Wd8i+WCo2E/868ItmG7jaX7Cz9VEYDLYiLk8IXgiWR0XAY8Y3eTz2IQhY8n70M/o/JishYxuA35mMWWX1rqBOB9DYi/yo26FV8bk/Kfxm+5UJ9PBUjAbP5MfXpcpQcCvu6Uejw==
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ba27f782-6c45-48ef-16c2-08d7d6e7b4ea
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Apr 2020 09:24:55.6208
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zUj+MOdJEAP0IMbuGhfAk00GHBCh5/5wTyiNHcRbD7/CUEsaAcFy6IwMmkwF7YqVqzbb43wqFMnGcMfRlt7AxQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6918
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

DQogDQo+IA0KPiBPbiAzMS8wMy8yMDIwIDExOjEwLCBQZXRlciBDaGVuIHdyb3RlOg0KPiA+IEFm
dGVyIHRoYXQsIHRoZSByb2xlIHN3aXRjaCBkZXZpY2UgKGVnLCBUeXBlLUMgZGV2aWNlKSBjb3Vs
ZCBjYWxsDQo+ID4gY2RuczNfcm9sZV9zZXQgdG8gZmluaXNoIHRoZSByb2xlIHN3aXRjaC4NCj4g
Pg0KPiA+IFNpZ25lZC1vZmYtYnk6IFBldGVyIENoZW4gPHBldGVyLmNoZW5AbnhwLmNvbT4NCj4g
DQo+IFRoaXMgZG9lcyBub3QgYXBwbHkgb24gdjUuNi4gV2hhdCBicmFuY2ggZGlkIHlvdSB0ZXN0
IHRoaXMgb24/DQo+IA0KDQpIaSBSb2dlciwNCiANCkkgdXNlIDUuNi1yYzQuICBXaGljaCBjb25m
bGljdCB5b3UgaGF2ZSBtZXQ/IERvIHlvdSBoYXZlIGJlbG93IHBhdGNoPw0KDQo4NzA4YTlmYTI5
MzggdXNiOiByb2xlczogUHJvdmlkZSB0aGUgc3dpdGNoIGRyaXZlcnMgaGFuZGxlIHRvIHRoZSBz
d2l0Y2ggaW4gdGhlIEFQSQ0KDQpQZXRlcg0K
