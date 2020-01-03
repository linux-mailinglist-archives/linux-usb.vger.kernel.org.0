Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 25B4812F379
	for <lists+linux-usb@lfdr.de>; Fri,  3 Jan 2020 04:20:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727134AbgACDUX (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 2 Jan 2020 22:20:23 -0500
Received: from mail-eopbgr80081.outbound.protection.outlook.com ([40.107.8.81]:43813
        "EHLO EUR04-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726136AbgACDUW (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 2 Jan 2020 22:20:22 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nkpAV5OECZCX6A3YiqAINAveWBwqOvdxpriupj8A6Lri4SX+LdyUnCprW25wu4bIYXlOeakIqSaHWzMX4cz6kHiJEQcjrJxLSad5OmrCKYARk6Nh48vpnhIXnaG50/y4YlbkFzBLUcScOTXH0M7PhhnD4fHmJ8SZuUN3mHLW4zVfnPuyYF9UyuxwbfIPbL/ioffh8aH/VvEVZYXnFV5m3R7Tu5qUmKpvR4TcjacvkuFrxkq30iUWJnYkgpyuhFXEICFoMrdDAwzQ47iMJYLp3r263iNB0IWvR7mexBcxjvuGahG0QMAGkkPAodVZG3sz0ftZEXtL6YLLN33OKpj0+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FsBzd3NaUaz9AArLujREqjzOpRdiBw0gAqfDyx07Yhg=;
 b=iJ/41Bfs4NOphCdeXsyOlP9qqQvTUJhGGMD9mqt1abXSL7GfWo0xCS3JQV3Rci8DUOcH6yLSfmjwMuhSibjk4n+QRbN49ZTFmafiRSA9ndLEU3qkfUlUaAU03tTScf8Tu/NeEVAeys9icd9dUcWUx7qZXs8ps/wZNGKBhkPHWllnErlSCqZppiU6fGBQPCcnQ8nNbOQiith+LuRTEkxJwgiw8NfM8348PEoJM0s8X3J2+R/K7fXU9XUm0ixTZoFLj+bflz3PuDC+QYD9E2VvukzUYvosaipSL/+uBvz7jD0DgxPPgJY9rjpLIw1CEdDpGZ6Z1EXMoOzCH2OdKGfluw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FsBzd3NaUaz9AArLujREqjzOpRdiBw0gAqfDyx07Yhg=;
 b=RHcoCURnARDlc3OHiTCbVqElYFPEj/FHW47DCOYmdtrYXzIrjGzBzfmrTviGl85ydmUHmFh1PXh8sESiBM0v/GAbAWyD41UY/tnajZqU6ztToSAYvmd6BYBIf6QlvSPtY+Caylcr8M55weRcWUXjOP0jn2APZDTVaiAr0I3ctag=
Received: from VI1PR04MB5327.eurprd04.prod.outlook.com (20.177.51.23) by
 VI1PR04MB7038.eurprd04.prod.outlook.com (10.186.159.9) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2602.10; Fri, 3 Jan 2020 03:20:17 +0000
Received: from VI1PR04MB5327.eurprd04.prod.outlook.com
 ([fe80::c7d:58a2:7265:407e]) by VI1PR04MB5327.eurprd04.prod.outlook.com
 ([fe80::c7d:58a2:7265:407e%6]) with mapi id 15.20.2602.010; Fri, 3 Jan 2020
 03:20:17 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     Baolin Wang <baolin.wang7@gmail.com>
CC:     Felipe Balbi <balbi@kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        dl-linux-imx <linux-imx@nxp.com>,
        "pawell@cadence.com" <pawell@cadence.com>,
        "rogerq@ti.com" <rogerq@ti.com>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
Subject: RE: [PATCH 1/1] usb: cdns3: add NXP imx8qm glue layer
Thread-Topic: [PATCH 1/1] usb: cdns3: add NXP imx8qm glue layer
Thread-Index: AQHVvHs151j0fHhAcE+5mb4ylkF2s6fXRheAgAD8RMCAAANJAIAABk1A
Date:   Fri, 3 Jan 2020 03:20:17 +0000
Message-ID: <VI1PR04MB53274DD899A84806D84C5FBB8B230@VI1PR04MB5327.eurprd04.prod.outlook.com>
References: <1577426348-31227-1-git-send-email-peter.chen@nxp.com>
 <878smqksjo.fsf@kernel.org>
 <VI1PR04MB532770282A2C0701BD2A0EBA8B230@VI1PR04MB5327.eurprd04.prod.outlook.com>
 <CADBw62roaEi6UWV3X2NtqQ55w_SONactEn=JxrPShMV7oj98vQ@mail.gmail.com>
In-Reply-To: <CADBw62roaEi6UWV3X2NtqQ55w_SONactEn=JxrPShMV7oj98vQ@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=peter.chen@nxp.com; 
x-originating-ip: [119.31.174.67]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: c4e391d5-ec53-4aee-400b-08d78ffbdb47
x-ms-traffictypediagnostic: VI1PR04MB7038:|VI1PR04MB7038:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <VI1PR04MB703873772186E25DAED07B698B230@VI1PR04MB7038.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 0271483E06
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(376002)(346002)(136003)(39860400002)(366004)(396003)(199004)(189003)(66476007)(71200400001)(4326008)(6506007)(66446008)(186003)(5660300002)(6916009)(86362001)(66946007)(7696005)(478600001)(4744005)(76116006)(52536014)(26005)(64756008)(66556008)(55016002)(9686003)(8676002)(33656002)(81156014)(44832011)(316002)(54906003)(8936002)(81166006)(2906002)(32563001);DIR:OUT;SFP:1101;SCL:1;SRVR:VI1PR04MB7038;H:VI1PR04MB5327.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: sXOUKYpnhmM7P6VnbA5pNebBeW3CV7oKic6oqWagtylY02zrAPhTE1xXDIFMY5QjddfeDiRxnBrGDeS9pdeZMiCSu+mQ2ntyzIAcuLpAi4A1wnu6CruEK/VElEjbtis5TXRRN0a5j9lwyuykLcg0FSCpLYQysjSC0PtyQGXkcOh+/LwGMEWuSrGM6hQo27Yy6QEHc9xESFS8nOb2156XTKTru9g/yMFMJA0mKVk/vkhNqBPzhvhNUmoAH57JkNQ6PpHYz0nzhGmCNJa3u77XdhD971dRrxb/X/f4UewntKGuf8i/aD4GKOCdOHFHjjmIJooSWNqZ3GrAXIFA4fbQiotYNnik1wx4W2/4DceUCQ+aiosZd8lUgsiMP+dqGVi0Z7ZOPEfi+hyBekcz/0aCiscJ9DOnonIoh07jv49BRy1EOuRB23QuIgdLdxUOMkZJgPglxhK9zwsYIXfRwcHCK4LeQzcSb0Pn7rV+unRPpJc=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c4e391d5-ec53-4aee-400b-08d78ffbdb47
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Jan 2020 03:20:17.3018
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YjOCgetK9aPRvuOR8jmzkfcQY7Bz0f1R/CudtfsD0O/B/XwDLSZtOajQE/gAwBUQF2/LiaoQuH8u810IMtNjsA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7038
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

IA0KPiA+IEhpIEZlbGlwZSwNCj4gPg0KPiA+IEhvdyB0byBtYWtlIHN1cmUgaXQgd29ya3M/IEV4
Y2VwdCBmb3IgZW5hYmxpbmcgQ09ORklHX0NPTVBMSUVfVEVTVCwNCj4gPiB3aGF0IGVsc2UgSSBu
ZWVkIHRvIGRvPyBUaGFua3MuDQo+IA0KPiBGZWxpcGUncyBzdWdnZXN0aW9uIGlzIHlvdSBzaG91
bGQgY2hhbmdlIHlvdXIgY29uZmlnIGRlcGVuZGVuY3kgYXM6DQo+IGRlcGVuZHMgb24gQVJDSF9N
WEMgfHwgQ09NUElMRV9URVNUDQo+IA0KPiBUaGVuIHVzZXIgY2FuIGNvbXBpbGUgeW91ciBkcml2
ZXIgdG8gZmluZCB3YXJuaW5nIG9yIHNvbWV0aGluZyBlbHNlIHRob3VnaCB0aGUNCj4gQVJDSF9N
WEMgY29uZmlnIGlzIG5vdCBlbmFibGVkLg0KDQpIaSBCYW9saW4sDQoNCkkga25vdyB0aGF0LCBJ
IGhhdmUgYWxyZWFkeSBjaGFuZ2VkIHRoYXQsICB1bnNldCBBUkNIX01YQyBhbmQgZW5hYmxlDQpD
T05GSUdfQ09NUElMRV9URVNULiBXaGF0IGVsc2UgSSBjb3VsZCBkbyB0byBtYWtlIHN1cmUgaXQg
Y291bGQgY29tcGlsZSBPSw0KYXQgZXZlcnkgYXJjaGl0ZWN0dXJlPw0KDQpQZXRlcg0K
