Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 39BB617B40F
	for <lists+linux-usb@lfdr.de>; Fri,  6 Mar 2020 02:53:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726271AbgCFBxq (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 5 Mar 2020 20:53:46 -0500
Received: from mail-vi1eur05on2060.outbound.protection.outlook.com ([40.107.21.60]:37921
        "EHLO EUR05-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726251AbgCFBxq (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 5 Mar 2020 20:53:46 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ev4pOF1Fqo8iFXBG44xZKrYLMNPMBG/W3BagYhPnYCWvp0+c3Y0rvarJAMPcZrvaSFIv5HGGA6oTiNuV96JbT92W5y/PElOBLudqiTRLAYQaCpbOHfjxYPY/4dDJ6dTMLyYmoZb0Z2/EZw3rptIi78ukUs5ez7VToRZDClBG7+kbFhEWQN1hdVLOtHqtojm2v+F7cfNGDgFFi+TFLHkdfht0ILbNU/tLlEp2fAarK/byUi+Bulx+hAhMa4XgUmNVYjIO8yAsADKBk1MvykNcSkUNDgBWc/y2zJvEt0QpcwuCnV6Z+X7xs/TX5RidMYXwVDIf/7q3clLi0eGiyYojHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/Ip6Gh9j49nxwQ6fUJZC/YeE3F97bILM7GDkHLl+A1A=;
 b=g5DLo0gQgzKniSo26Gezu2tJoU5hA9Jn+6IE4Ywecbvryxdp8kZNMuazsPjNYh/hEIH9aPkJ0No51gJZoOgMQBs8nPLmc8oXOax9bX0w5v9u3lFfs5Lk5Rt9Z6WdoP9XwLDSTNHrqIo5QPlwHGw0WgGhQMz0LIINX5CqjfKTaHnQJWOjtLsIf4/JACWT8TdNOBxiDpxiIt7pONKYwgCb7/mIQa4EW7ygzCKh7D/Ld1xHTT/voGsGUNhPDnCdILATQ9g0BXjkm7/EtqHNFQS5r/f+yJZxXX9LLX1LW3H3D252ViQr9ae9FXldNOfNLOddG5pgdzAqC532p7WpiCPUSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/Ip6Gh9j49nxwQ6fUJZC/YeE3F97bILM7GDkHLl+A1A=;
 b=hi6uzBIkWihPExHNvT6ZCLB+5c6i/YLRg9NEY8wvCxe2Y968tD6cTJ6zbNAVRhGOkq+7+Mb37UkNnWRPNsimuSM28kSWyWBhQfpRP5Qgl0IGx5HRYWVYk1fvBcWwB8FVlyeBh3W4oJ3NXQQv9CAiWOqmVyOzrQ6eOVGNHwHq89U=
Received: from VI1PR04MB5327.eurprd04.prod.outlook.com (20.177.51.23) by
 VI1PR04MB5694.eurprd04.prod.outlook.com (20.178.126.11) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2793.15; Fri, 6 Mar 2020 01:53:41 +0000
Received: from VI1PR04MB5327.eurprd04.prod.outlook.com
 ([fe80::9547:9dfa:76b8:71b1]) by VI1PR04MB5327.eurprd04.prod.outlook.com
 ([fe80::9547:9dfa:76b8:71b1%7]) with mapi id 15.20.2772.019; Fri, 6 Mar 2020
 01:53:41 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     Dmitry Osipenko <digetx@gmail.com>
CC:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
Subject: Re: usb: chipidea: udc: BUG: sleeping function called from invalid
 context
Thread-Topic: usb: chipidea: udc: BUG: sleeping function called from invalid
 context
Thread-Index: AQHV8j9hwL99AdJQ30udm+i8fapgTKg5QogAgAE5TACAAFPPAA==
Date:   Fri, 6 Mar 2020 01:53:41 +0000
Message-ID: <20200306015344.GA29800@b29397-desktop>
References: <bfa5b2f7-cf52-0055-ffb2-2cb8278a1181@gmail.com>
 <20200305021226.GA12837@b29397-desktop>
 <7a142dd4-9ae8-2560-e5be-25648f88a864@gmail.com>
In-Reply-To: <7a142dd4-9ae8-2560-e5be-25648f88a864@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=peter.chen@nxp.com; 
x-originating-ip: [119.31.174.66]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 8ef1b56b-b8af-4805-6688-08d7c1713241
x-ms-traffictypediagnostic: VI1PR04MB5694:
x-microsoft-antispam-prvs: <VI1PR04MB5694C26BBB3AB24B5C541F768BE30@VI1PR04MB5694.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0334223192
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(7916004)(4636009)(376002)(396003)(346002)(136003)(39860400002)(366004)(189003)(199004)(478600001)(186003)(26005)(8936002)(4326008)(33656002)(66946007)(316002)(6916009)(66476007)(5660300002)(66446008)(1076003)(33716001)(6512007)(64756008)(66556008)(9686003)(8676002)(76116006)(71200400001)(44832011)(6486002)(81156014)(2906002)(91956017)(81166006)(6506007)(86362001)(53546011)(54906003);DIR:OUT;SFP:1101;SCL:1;SRVR:VI1PR04MB5694;H:VI1PR04MB5327.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: eGSfLwR/bRXsIu5QYxcBdjIdB3huYBywfK0zUnEuWeO+rXH7ofp9W5velTbjjXzS/Ptna2KDZKL9IxoPYC9Z5Y8QTazjAFrzSj2KwXcw0LhwFekIR5hcWP7prw2sr+pzrBmSVuPt5djCKo2oJXvFWhH0LUt35osWMnj4AItznlEC8V8JUJMu9yRvsbB17E2+YGi4Yy3T0Sf2k+xXf4kS8KN4jWmjkt7TrqePJEQutvYDP0STDhYRjwcosxbNN8CiFm6HLnOu/2PtKfRjNgSwnHz5rLTHkofGMLfmdkrby9AL8t+wsQ+mZzln2eKYniDYZJI0vTXFyAUpOFzCE1dCn7u9V0gIDy11SyWiCDimPw7M5enHX/L61xZSwY8A1unaQ2TeFl5bKzn+uTZ2eoeFL096YuUEi/XQj/+1bo+4uXtwBPvfhIB/bDyIqW60IEqS
x-ms-exchange-antispam-messagedata: Ns4qEXaWuRfgecjj+fgbVOSIgS8TCunVf2OKbuhHSTdevL/Nu6nf80Av/ZVsVqZ4A4GdMCBYaB4gr4UNzLOr9U3eWRg6QiYMg5zIWm0iXGBQcjEFI2bsW4vU9eJ/34coXQe8+yfAAfQCbBHhuZspGw==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <952D56765ABE2A42AD1B629A96FE1D55@eurprd04.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ef1b56b-b8af-4805-6688-08d7c1713241
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Mar 2020 01:53:41.4087
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Yr9AGT565uTHAcXHidrZH6qQGF2aQdSvnY8wz/uch7T09AZcpmsUAP10d2hjg45F1Q/zZPQcF4aQj2O7xYnefw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5694
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

T24gMjAtMDMtMDUgMjM6NTM6NDYsIERtaXRyeSBPc2lwZW5rbyB3cm90ZToNCj4gMDUuMDMuMjAy
MCAwNToxMiwgUGV0ZXIgQ2hlbiDQv9C40YjQtdGCOg0KPiA+IE9uIDIwLTAzLTA0IDE5OjEwOjA4
LCBEbWl0cnkgT3NpcGVua28gd3JvdGU6DQo+ID4+IEhlbGxvLA0KPiA+Pg0KPiA+PiBJIHdhcyB0
cnlpbmcgb3V0IHRvZGF5J3MgbGludXgtbmV4dC0yMDIwMDMwNCBhbmQgbm90aWNlZCB0aGlzIHNw
bGF0IGluIEtNU0c6DQo+ID4+DQo+IC4uLg0KPiA+PiBJIGhhdmVuJ3QgdHJpZWQgdG8gZmlndXJl
IG91dCB3aGF0IGNoYW5nZSBjYXVzZXMgdGhpcyBwcm9ibGVtLCBpdCBkaWRuJ3QNCj4gPj4gaGFw
cGVuIHVzaW5nIG5leHQtMjAyMDAyMTguIFBsZWFzZSB0YWtlIGEgbG9vaywgdGhhbmtzIGluIGFk
dmFuY2UuDQo+ID4gDQo+ID4gRG1pdHJ5LCB0aGFua3MgZm9yIHJlcG9ydGluZy4gSSBoYXZlbid0
IG1ldCB0aGF0IGlzc3VlLCBpdCBtYXliZSBJDQo+ID4gZW5hYmxlIHJ1bnRpbWUgcG0sIGJ1dCB5
b3UgaGF2ZSBub3Q/IFNvIEkgZG9uJ3QgdHJpZ2dlcg0KPiA+ICJkZXYtPnBvd2VyLnJ1bnRpbWVf
c3RhdHVzICE9IFJQTV9BQ1RJVkUiIGNvbmRpdGlvbiBiZWxvdw0KPiA+IA0KPiA+IAltaWdodF9z
bGVlcF9pZighKHJwbWZsYWdzICYgUlBNX0FTWU5DKSAmJiAhZGV2LT5wb3dlci5pcnFfc2FmZSAm
Jg0KPiA+IAkJCWRldi0+cG93ZXIucnVudGltZV9zdGF0dXMgIT0gUlBNX0FDVElWRSk7DQo+IA0K
PiBUaGUgcnVudGltZSBQTSBhbHdheXMgcHJlc2VudHMgb24gVGVncmEsIGRvIHlvdSBoYXZlDQo+
IENPTkZJR19ERUJVR19BVE9NSUNfU0xFRVA9eSBpbiB0aGUga2VybmVsJ3MgY29uZmlnPw0KPiAN
Cg0KTm8sIHRoZSByZWFzb24gc2hvdWxkIGJlICJkZXYtPnBvd2VyLnJ1bnRpbWVfc3RhdHVzICE9
IFJQTV9BQ1RJVkUiLCB5b3VyDQpjaSBkZXZpY2UncyBydW50aW1lIG1heSBub3QgYmUgYWN0aXZl
IGF0IHRoYXQgdGltZSwgaWYgSSBtb3ZlIHRoZSBzcGlubG9jaw0KYWJvdmUgcG1fcnVudGltZV9n
ZXRfc3luYyBhdCBjaV9oZHJjX2dhZGdldF9jb25uZWN0LCBJIGNvdWxkIHJlcHJvZHVjZSBpdA0K
dG9vLg0KDQpJIGVuYWJsZWQgQ09ORklHX0RFQlVHX0FUT01JQ19TTEVFUCwgYnV0IGNhbid0IHJl
cHJvZHVjZSB0aGUgZHVtcA0Kd2l0aG91dCBhYm92ZSBjaGFuZ2VzLg0KDQotLSANCg0KVGhhbmtz
LA0KUGV0ZXIgQ2hlbg==
