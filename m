Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 550551D7827
	for <lists+linux-usb@lfdr.de>; Mon, 18 May 2020 14:09:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727770AbgERMJQ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 18 May 2020 08:09:16 -0400
Received: from mail-vi1eur05on2044.outbound.protection.outlook.com ([40.107.21.44]:23791
        "EHLO EUR05-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726448AbgERMJP (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 18 May 2020 08:09:15 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Nh/vK3qFCEc9U22582Ax10qg+Zh8Idz4JZkyfKNQJbiYiG7cyBcV8hnuRFAW8t4r+5MsiH2jFSEN9XW/47RxOHWnDjm2Of8eCBAABWLPclI1VxAsbQodHl0fZl+rm90C0znAfoan7tdylJAEBznaVTui6H3xy+9uvdprBLvYYgcV0Eyv/VaTnYqkevVJDnnVD+YA2mNPCDAkQOm2f/0VmymOJbC+RaeZ3oDGqvfijBDRAXaaTEPn94w8e9OGGBeGIIpkAdADC2ZIS6SVe1hCpb+X70mc1422jxehiwuJmXEB9n5SAFI+VLMQFrivFNnP3twz3xRKVVgM35lirbqcDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L3vMY2P822QOhu6YxuXnd5ATGCd2IhGialazrUUDcOc=;
 b=CV8QG1Qov2ElOTv0parGPbCGIKg5GXWrFwDSvIN+oq8YoJHa5iKsONFN+5ri9haEYkWuYyl9W70nLQuyVnrh0pDEDsQTQpHI9+cW2vqLwhEiJIKf48alD9P1e/Ro29V/TbxcNPcPuFv/RYmlFWH2lZETN3ZqB7BYsJuKq6grfspeme27b5bZh+bm6Y2nZoR+xdYieio3DFDPVFL7qNyPo01g7i6ELHk3aFxEfO++E0pyjzb7viKNolIBwYFiAfvia9ksxTSC/cxHa+tc6aJrL/B88UdgWh/ialXVAzR7lzFd6BCAi0Y1ha0G003kGOqKK9TH7tg/XCeYWbjBguJzhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L3vMY2P822QOhu6YxuXnd5ATGCd2IhGialazrUUDcOc=;
 b=QKtprJEYwfZB5I+QSbZTZ/nL6CxhepRGFG+QnbI6qsswuz5cabB5ie9fokYHcMPqbg4UQVpb3dNzls+B/FCs8LADCSLIs3RfPDJiXsF7OUQX+85oWOvYoeXeGB7UsdDI8ETU1x+yoQ/UoqD4vBft6lMN/e/5mQIBkc4OcH+gEiA=
Received: from VE1PR04MB6528.eurprd04.prod.outlook.com (2603:10a6:803:127::18)
 by VE1PR04MB6608.eurprd04.prod.outlook.com (2603:10a6:803:125::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3000.27; Mon, 18 May
 2020 12:09:12 +0000
Received: from VE1PR04MB6528.eurprd04.prod.outlook.com
 ([fe80::5086:ae9e:6397:6b03]) by VE1PR04MB6528.eurprd04.prod.outlook.com
 ([fe80::5086:ae9e:6397:6b03%7]) with mapi id 15.20.3000.034; Mon, 18 May 2020
 12:09:12 +0000
From:   Jun Li <jun.li@nxp.com>
To:     Fabio Estevam <festevam@gmail.com>
CC:     Peter Chen <peter.chen@nxp.com>,
        USB list <linux-usb@vger.kernel.org>
Subject: RE: usbmisc_imx: charger detection errors
Thread-Topic: usbmisc_imx: charger detection errors
Thread-Index: AQHWKv1KRkkKUYB0Ek+1137XmW5syKiqPm5AgABX3gCAAyvIQA==
Date:   Mon, 18 May 2020 12:09:12 +0000
Message-ID: <VE1PR04MB652825D4B99C4EE47F75216789B80@VE1PR04MB6528.eurprd04.prod.outlook.com>
References: <CAOMZO5C1jm4Nr4uTvn14sRqe3mb1Li-iTJ4EhZSBju-x1pzyXg@mail.gmail.com>
 <VE1PR04MB6528C12091A5B0BD2DA0E51A89BA0@VE1PR04MB6528.eurprd04.prod.outlook.com>
 <CAOMZO5DzV6Kcxtd=UUL6iYW82rArviB7SA_y2eOzkKa3YjWe8g@mail.gmail.com>
In-Reply-To: <CAOMZO5DzV6Kcxtd=UUL6iYW82rArviB7SA_y2eOzkKa3YjWe8g@mail.gmail.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [119.31.174.71]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 6b47e193-625e-43d0-c41f-08d7fb2446df
x-ms-traffictypediagnostic: VE1PR04MB6608:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <VE1PR04MB6608AF59D1AF966BE12E021E89B80@VE1PR04MB6608.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5516;
x-forefront-prvs: 04073E895A
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: JE5y2ZYZEzFYgSZPAohhg/Q2vPQvsJQdE09X8ea0X3zZnrszT3smGY3IjgGngHTuVaQPmrmQ92rkhMRML34Atc5Ld0V+zH2qvuCEmmqryNfMhUlJyw4OSzsGiAlrqMLEQoIMi40wJfzYa98RLeKOe1BMrRrLCEnBPqW3O6tp7QL2zLnt+8OOqRyxfUH+9Gv5nhlRVVftodGuctPiCHefkl3/EoxqAz7Za7y130L+149qZ2VRwAe9FIpZdFma3z3R5IKxhMD0CgLZYZhRW0G6iy/sA3nC+r6snJwNvBw5PahgvN3lMLvVqT9J3AZZxvTB8HDk4a3gP5bmHUInQD/+JXQcKzNBE/E4nQL8hrEOHyDGoyJSnTR0CrBu4NWxO53IKuEU7RHAFUovHlHuTz0GwX9jdbcCLK5veNZqyw7XFklx8lUwiYKrjxU0wS73Vy7h
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6528.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(366004)(39860400002)(346002)(136003)(396003)(376002)(52536014)(66446008)(5660300002)(64756008)(66946007)(26005)(4326008)(6506007)(66556008)(66476007)(6916009)(33656002)(186003)(86362001)(76116006)(7696005)(53546011)(9686003)(54906003)(316002)(55016002)(2906002)(4744005)(71200400001)(8676002)(478600001)(44832011)(8936002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: u3L212fgeBZwBHWMDIodwa9dw98zc0r92M+bW41Hac+B1tMLv7yt6r/3WBxbUQrRuRJJg8i6/j07n0WPUQj4qACJX6KQX3t/Xp3Z73cDVK+hBQQzir8ZOs60HqX8e0LbxODbXRGTqjhFZMWtWMM8sYRUu6sjRBYTBKncV6IlvTJDsj+Xm5vHTiNyYGZDf2fs/BBcJ8Tvmdm1sNa255C/Sv5GFIfKQNfMpYUbshy5o5UCIm5NKZ0mWZ3QmYa30QmEvPkIc35fUw3L0C+plYxfIGrGbBoufHINK9I/mRaZThMXr30iAnnxqqRTQ2Guf0B36oy4nVhoZx9a5NnrH8xec4cWA0CW5oMFxV6+CuHWdrwnB7oOvs7EVB5doQTn0tI9DuAAcTIX3PN4YY9gUj19qCWkry4MxAHMM1bKBQBpsIDBBD4Rtc0kyiTInIHtF6ZcM7uI0kKU97rTILibP5ab9On67A8Jp/wmGvUZ6txBItA=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b47e193-625e-43d0-c41f-08d7fb2446df
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 May 2020 12:09:12.0240
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5mORxgdX6BKlS+a/HSHM5Pr/s4yi7ADXqcu0jH3FRmet77pq9fS2FDOdHiFaZrts
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB6608
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

SGkgRmFiaW8NCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogRmFiaW8gRXN0
ZXZhbSA8ZmVzdGV2YW1AZ21haWwuY29tPg0KPiBTZW50OiAyMDIw5bm0NeaciDE25pelIDE5OjM2
DQo+IFRvOiBKdW4gTGkgPGp1bi5saUBueHAuY29tPg0KPiBDYzogUGV0ZXIgQ2hlbiA8cGV0ZXIu
Y2hlbkBueHAuY29tPjsgVVNCIGxpc3QgPGxpbnV4LXVzYkB2Z2VyLmtlcm5lbC5vcmc+DQo+IFN1
YmplY3Q6IFJlOiB1c2JtaXNjX2lteDogY2hhcmdlciBkZXRlY3Rpb24gZXJyb3JzDQo+IA0KPiBI
aSBMaSBKdW4sDQo+IA0KPiBPbiBTYXQsIE1heSAxNiwgMjAyMCBhdCAzOjMzIEFNIEp1biBMaSA8
anVuLmxpQG54cC5jb20+IHdyb3RlOg0KPiANCj4gPiBUaGlzIGluZGljYXRlcyB0aGUgdm9sdGFn
ZSBvZiBWQlVTIHBhZCBpcyBiZWxvdyBWQlVTIHZhbGlkDQo+ID4gdGhyZXNob2xkKGRlZmF1dCBp
cyA0Ljc1diksIGhvdyBpcyB2YnVzIGNvbm5lY3RlZCBvbiB5b3VyIGlteDdzLXdhcnANCj4gPiBi
b2FyZD8gaXMgdGhlIHZidXMgY29ubmVjdGVkIGZyb20gVVNCIGNvbm5lY3RvciB0byB2YnVzIHBh
ZCBvZiBpbXg3cyBTb0M/DQo+IA0KPiBJIGhhdmUgc2VudCB5b3UgdGhlIHNjaGVtYXRpY3Mgb2Zm
LWxpc3QuDQoNCkZyb20gdGhlIHNjaGVtYXRpY3MsIHRoZSB2YnVzIGlzIGNvbm5lY3RlZCBmcm9t
IGNvbm5lY3RvciB0bw0KVmJ1cyBwYWQgb2YgaW14N3MuDQpUaGlzIGVycm9yIGNhbiBiZSBzZWVu
IHdoZW4geW91IGNvbm5lY3QgeW91ciBpbXg3cyBib2FyZCB0byB3aGF0ZXZlcg0KUG93ZXIgc291
cmNlPyhDaGFyZ2VyLCBQQyBob3N0KT8gIA0KDQpQbGVhc2UgZHVtcCB0aGUgYmVsb3cgcmVnaXN0
ZXJzIGFmdGVyIGNvbm5lY3QgdGhlIG90ZyBwb3J0DQp0byB0aGUgcG93ZXIgc291cmNlIGZvciBp
c3N1ZSBjYXNlOg0KDQpOb24tY29yZToNCjB4MzBiMTA0MDAgfiAweDMwYjEwNDQwDQoNCkxpIEp1
bg0KPiANCj4gVGhhbmtzDQo=
