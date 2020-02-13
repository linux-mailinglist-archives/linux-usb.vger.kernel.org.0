Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0752415BB87
	for <lists+linux-usb@lfdr.de>; Thu, 13 Feb 2020 10:20:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729600AbgBMJUz (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 13 Feb 2020 04:20:55 -0500
Received: from mail-eopbgr70075.outbound.protection.outlook.com ([40.107.7.75]:36430
        "EHLO EUR04-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1729576AbgBMJUz (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 13 Feb 2020 04:20:55 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ld+QWEIcoLmsF4B7S9pFy/NJk8VlB5mNzQE5ljdSHvZ9fbfIbCp706Hwf8enUrhigj1vsx10jX5rd7TmkTLtmmoNBBUCT9Al6RduLrdBqfY+8ZU1hxULt2ntWZMBykuuhIs/fdS2S01Q9SLulKQwNlM6cD4HB7wtOuKjkVuH5RmfA+hMqR9LyZbrRAtSPe1p8ip45nliw2lgF11qld/veTw/4GC1J/SKgNL+D8lUU23/IhvKCi60QfueoyqqlvzOeQc5gydZAiiFJ+TmyQ5SfTkStUT5KtE7ts9vUEtvcU72ip0f08xC7LrqmJvzaQfgSLXBK6ropr1D6WG2OpOKKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VcAKV3Uix/2QUXi7PGb1IBYoF41lR6sDiL+8t+mcW3s=;
 b=CHG+LiSYkvgmJzIDgu/zwyeZDIb/8ZAMtXBls2MKzQvPNEPM88UOasNgL/TcWkGMOvU8OfW9Yu63cFMof9dC8BJhhDa22EsuropP9pFsGEg9MB9y32QWInVIwwtK1uuFbnNgcXdBFKPbFDQ7rll0GOv2JZSPI7l+E0oSIVte6+8tL1fCZi0zTD8PW9LQfvTs62dXripTv8pkiO/iUsOruETJOynwN1XkE+vH5vvLEz98FJSx0gw/K4F+vCfDL5X/s7b7rHUWPGVgKt86b6eY7/Wad0OylUNx5Y0wH9+qxc99pTodY//gLHXy8P+/F71ixwFNXGT96/jB+CloL9hVHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VcAKV3Uix/2QUXi7PGb1IBYoF41lR6sDiL+8t+mcW3s=;
 b=TrcxxY4Be+5bhI5LXtPW+g+g3kBeA6XMSe54vV/2ZJT72y5CXELZH7ehAnK1KaNT5Z9Fz4N3omwZm/2O1d9pb8R76IoEjhyTGYdwWLg9KjMFXVC/cjTDqXkZUGOa4Renf800Ql6e9C4UrexHa26VPx+KqzvUub+1G5zIgHvrphw=
Received: from VI1PR04MB5327.eurprd04.prod.outlook.com (20.177.51.23) by
 VI1PR04MB5629.eurprd04.prod.outlook.com (20.178.125.158) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2729.22; Thu, 13 Feb 2020 09:20:51 +0000
Received: from VI1PR04MB5327.eurprd04.prod.outlook.com
 ([fe80::c7d:58a2:7265:407e]) by VI1PR04MB5327.eurprd04.prod.outlook.com
 ([fe80::c7d:58a2:7265:407e%6]) with mapi id 15.20.2729.025; Thu, 13 Feb 2020
 09:20:51 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     "pawell@cadence.com" <pawell@cadence.com>
CC:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "rogerq@ti.com" <rogerq@ti.com>
Subject: usb.org CV MSC test for CDNS3
Thread-Topic: usb.org CV MSC test for CDNS3
Thread-Index: AQHV4k7iMwl0AD9LN0GAVjv3FxutlA==
Date:   Thu, 13 Feb 2020 09:20:51 +0000
Message-ID: <20200213092051.GA11142@b29397-desktop>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=peter.chen@nxp.com; 
x-originating-ip: [119.31.174.66]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 7791a528-2d67-45b4-2afe-08d7b066051e
x-ms-traffictypediagnostic: VI1PR04MB5629:
x-microsoft-antispam-prvs: <VI1PR04MB56292420552DC0F68C677F2A8B1A0@VI1PR04MB5629.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 031257FE13
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(7916004)(396003)(376002)(346002)(136003)(366004)(39860400002)(189003)(199004)(186003)(33656002)(478600001)(26005)(316002)(54906003)(6486002)(44832011)(71200400001)(81166006)(8676002)(81156014)(1076003)(4744005)(6512007)(9686003)(6916009)(6506007)(4326008)(8936002)(33716001)(86362001)(5660300002)(66946007)(66556008)(91956017)(66476007)(76116006)(64756008)(66446008)(2906002);DIR:OUT;SFP:1101;SCL:1;SRVR:VI1PR04MB5629;H:VI1PR04MB5327.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: XCP2sySzGGYWu44bd87WG2i6m10Vo+8fKHAmJBGn5RUtEyo6vFBZ/1FXFL5eCXmH/ABmJNcnIfcNNalcnWH8CxqqZSSadh71ChL8KRqEX5T2qh0/J8pHhX6j56PUET43zUYgcUOGnJl5nk+RcZcsgOEnVklwOTV479Uf3q/ORXpc7t1VgBthIZnyYP4qcXuWO1GFsHgA+X26pw/mMrnIfY/IWs9APzlI+kw6HRniOpkHRqcPt7pHpK9TKQaH6mzjQMs+uYCCN3r8m9ydcHrbAfr0z8fRJqxmDMp8qCxpooPTduUygQwxcSf7E+wiuVPM91Zjiu4nXGBMdxCaHL7oiKsNyIu5kQC5TUwIPGvmgExHOliSsc8jqlikBrbqsbqt/F0r/3sxhsOrQ4F4fX4QmFXkB9ypgxEehdk9qJrdSbgmMcGKeILVyNx17B0VOQ1u
x-ms-exchange-antispam-messagedata: oKSHBSmFodmdqOLVQs/z0pMUslArxiU/pFIuJG6AUh53krOuTDr8nohiVwkx2qOIvBE9PmXJkHJQ8l28nsvTjSqMnxdtGeKxQlABzBE9MKAFcvP5T59BVWFteZlT+cEkWB60Z1Jchxy41gcT0q+c1w==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <C52F499675E70C40BB299952FFAE6CF9@eurprd04.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7791a528-2d67-45b4-2afe-08d7b066051e
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Feb 2020 09:20:51.3531
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JpBFuCzmqD0i5OLw8+wN4U1eusRskhmAAa0cNr4CO3n0EK3Z/xvOqdhMRLp830a4sTDdpKuNHwFdmV4lgwrjmQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5629
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

SGkgUGF3ZWwsDQoNCkRvZXMgdGhlIHVwc3RyZWFtIHZlcnNpb24gQ2FkZW5jZSBkcml2ZXIgcGFz
cyBDViBNU0MgdGVzdCBhdCB5b3VyDQpzaWRlPyBJIG1ldCBhbiBpc3N1ZSBmb3Ig4oCcRXJyb3Ig
UmVjb3ZlcnkgVGVzdOKAnSwgSXQgbmVlZHMgdG8gY2xlYXIgaGFsdA0KZm9yIGVwMS1vdXQsIGJ1
dCBlcDEtb3V04oCZcyByZXF1ZXN0IGlzIHBlbmRpbmcuIEFmdGVyIGVwIGlzIHJlc2V0LA0KYW5k
IHNldCBkb29yYmVsbCBhZ2FpbiwgdGhlIHRyYW5zZmVyIGJlZ2lucyBhdCBvbmNlLCBhbmQgcmVj
ZWl2ZSBUUkJFUlINCmludGVycnVwdCwgYnV0IHRoZSBob3N0IHN0aWxsIG5vdCBzZW5kcyBDQlcs
IHNvIHdoZW4gdGhlIGhvc3Qgc2VuZHMgQ0JXLA0KdGhlIGRldmljZSBzaWRlIGNhbuKAmXQgcmVj
ZWl2ZSBhbnkgaW50ZXJydXB0cyBkdWUgdG8gdGhlcmUgaXMgbm8gVFJCIGlzDQpwZW5kaW5nLg0K
DQpDYWxsIF9fY2RuczNfZ2FkZ2V0X2VwX2NsZWFyX2hhbHQgZm9yIE9VVCB3aWxsIHRyaWdnZXIg
VFJCRVJSIGludGVycnVwdCwNCmFuZCBhZHZhbmNlIHRoZSBUUkFERFIgdmFsdWUgaWYgdGhlcmUg
aXMgYSBwZW5kaW5nIFRSQiwgZG9lcyBpdCBiZQ0KZXhwZWN0ZWQ/DQoNClRvIGZpeCB0aGlzIGlz
c3VlLCBpdCBuZWVkcyB0byBjaGFuZ2Ugc2V2ZXJhbCBwbGFjZXMsIGFuZCBJIG1ha2UgaXQNCnBh
cnRpYWwgd29yayB0byB1c2UgdGhlIG5leHQgVFJCIGZvciB0aGUgc2FtZSBwZW5kaW5nIHJlcXVl
c3QuDQpJIGRvbid0IGtub3cgaWYgaXQgaXMgY29ycmVjdCB3YXksIHNpbmNlIHlvdSBtYXkgbW9y
ZSBmYW1pbGlhciB3aXRoDQp5b3VyIElQLCB5b3UgY291bGQgZ2l2ZSBtZSBzb21lIHN1Z2dlc3Rp
b25zIGlmIHBvc3NpYmxlLA0KdGhhbmtzIGluIGFkdmFuY2UuDQoNCi0tIA0KDQpUaGFua3MsDQpQ
ZXRlciBDaGVu
