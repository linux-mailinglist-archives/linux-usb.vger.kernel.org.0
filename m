Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AA3EC1665B8
	for <lists+linux-usb@lfdr.de>; Thu, 20 Feb 2020 19:01:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728064AbgBTSB3 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 20 Feb 2020 13:01:29 -0500
Received: from hqnvemgate24.nvidia.com ([216.228.121.143]:16480 "EHLO
        hqnvemgate24.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727553AbgBTSB3 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 20 Feb 2020 13:01:29 -0500
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate24.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5e4ec92f0001>; Thu, 20 Feb 2020 10:00:15 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate102.nvidia.com (PGP Universal service);
  Thu, 20 Feb 2020 10:01:27 -0800
X-PGP-Universal: processed;
        by hqpgpgate102.nvidia.com on Thu, 20 Feb 2020 10:01:27 -0800
Received: from HQMAIL107.nvidia.com (172.20.187.13) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 20 Feb
 2020 18:01:27 +0000
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.36.59) by
 HQMAIL107.nvidia.com (172.20.187.13) with Microsoft SMTP Server (TLS) id
 15.0.1473.3 via Frontend Transport; Thu, 20 Feb 2020 18:01:27 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=il3v/D0cQlo+2f0BPDr2GPMRbjVGgZV2Y9K+Gz/H+BwAEcn5+iN1uRTOZFOV4LrQD+v/YVCAPUT7wHAUWlnUNkUJy43PP2tIctwKWOpMV6ChFzOQdSWK34JiuHJzticnlG0xXaTSPBPlSmhlmV5JfZgagUV1pyCWHg6clAD2lM0X0Yls+awFWw2XoQzFiSpnQ7V8T6nOPtW4vPSEcD9kfiw8PFEPhoMJ3qJDrIlgKdGkUYBAuiGau2Ep9tibQYTFByyZVFa4Js0IUfvqTW1YT5qeeyKP+3x1KfmtvWwPRkS65kScmulpAmQC8EBuz1oj0aupvfZrq637p0AgngdBow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7IWjuCS578MB9xTqy19UADfVndoIRQh2R+1yPUNxzgI=;
 b=RcZyblwTsW7eDhfKCqrMSXgHrnbijsSLNDB2szUbhrRQ9hL3f9WDqPRFkk7XeO4eEwd0Jddhlw3VXbmPi/RlLu5zww/ILiPywER1OX56ccbDMW18MFBlP905Bok3CX/KqutMNMPMe2J4GrfQmFXz3nR+O3bj59xZNIlY+lOBO6BpBTx4LfKlAlOSWtXYRi3vo21wlDnUDgvjwkUmGBtJMID0wylAacDcUgQpqh5Lo/Ii0RYRjOvKVO9RY+rX6Kkd+D3sbWGCXn7PvygFhucg1XzCfR5zrQspMOgnBepp6hPetqTIClRau+mB+pPMlWGV/YYAbimizQDjCvhYtDA5LA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
Received: from BYAPR12MB2727.namprd12.prod.outlook.com (2603:10b6:a03:71::22)
 by BYAPR12MB3592.namprd12.prod.outlook.com (2603:10b6:a03:db::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2729.22; Thu, 20 Feb
 2020 18:01:25 +0000
Received: from BYAPR12MB2727.namprd12.prod.outlook.com
 ([fe80::9c2:6e7d:37ee:5643]) by BYAPR12MB2727.namprd12.prod.outlook.com
 ([fe80::9c2:6e7d:37ee:5643%7]) with mapi id 15.20.2729.033; Thu, 20 Feb 2020
 18:01:25 +0000
From:   Ajay Gupta <ajayg@nvidia.com>
To:     Mathias Nyman <mathias.nyman@linux.intel.com>,
        Ajay Gupta <ajaykuee@gmail.com>,
        "mathias.nyman@intel.com" <mathias.nyman@intel.com>
CC:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: RE: [PATCH] usb: xhci: enable interrupt only after xhci_start()
Thread-Topic: [PATCH] usb: xhci: enable interrupt only after xhci_start()
Thread-Index: AQHV5rY29sfrwJzffEWAmuFUzyNFBagkEycAgABCPJA=
Date:   Thu, 20 Feb 2020 18:01:25 +0000
Message-ID: <BYAPR12MB2727D0D0D4A2D193AFCC6BA1DC130@BYAPR12MB2727.namprd12.prod.outlook.com>
References: <20200218235024.15266-1-ajayg@nvidia.com>
 <85ae3a52-f968-ce02-af51-e4d2aa140f8b@linux.intel.com>
In-Reply-To: <85ae3a52-f968-ce02-af51-e4d2aa140f8b@linux.intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_Enabled=True;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_SiteId=43083d15-7273-40c1-b7db-39efd9ccc17a;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_Owner=ajayg@nvidia.com;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_SetDate=2020-02-20T18:01:24.0839619Z;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_Name=Unrestricted;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_Application=Microsoft Azure
 Information Protection;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_ActionId=646f1187-0036-410e-9abc-30f4d3fea415;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_Extended_MSFT_Method=Automatic
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=ajayg@nvidia.com; 
x-originating-ip: [216.228.112.22]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 57793eaf-f5ed-4c7c-5d51-08d7b62ee70e
x-ms-traffictypediagnostic: BYAPR12MB3592:
x-microsoft-antispam-prvs: <BYAPR12MB3592BBF153EDF8CADA17AC30DC130@BYAPR12MB3592.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 031996B7EF
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(366004)(346002)(396003)(39860400002)(136003)(376002)(199004)(189003)(9686003)(55016002)(478600001)(26005)(52536014)(2906002)(5660300002)(4326008)(71200400001)(186003)(66446008)(8676002)(33656002)(76116006)(66556008)(86362001)(316002)(64756008)(110136005)(6506007)(81166006)(81156014)(8936002)(66946007)(66476007)(7696005);DIR:OUT;SFP:1101;SCL:1;SRVR:BYAPR12MB3592;H:BYAPR12MB2727.namprd12.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: nvidia.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: e/wlH0FSoOgs99M4uvFxqETqttUZ3Qq08mGPc2tAJ9UrMFmlhW3t4uUIJ9Q6ld4TOKRjMrg3qF9R8PlyIoWsZvRVcLiFL6HpA06IEr3TdwhYCgFhsOcklV8ydtlvMFOauJLSDYTS7NpRtPofBJsCAT9jJEfHLCo+2a6uS5klQ63O771sO/UKvP2fp+/laGzgNnP2+iWHHP8y2vboeXX6yP7p4qV9UbRGpxRJYxgMBKg46HkQ3IcwVf1qbGhcy+3IZmLAA+9jciy5/TbUkj4gor7nlAKx4fm5LvSbwUp//AfDHUCvFYrDXjzQcD8YckIauf2ndo4GbRWzkocV1uz63MsC1HjQ2dxR3BIw2jw/Y5nipjWFIepC7lrGqVPU5vTw2ilNY8UonNqc5sJEWzuB7Oo3flT0BI6qcxXMs9J6oR7hdwH2DRBC9GAR8xXGPpcr
x-ms-exchange-antispam-messagedata: ksdU4ry3RYosqbClGRY9s2RXR9k0/+ZZIXsleaAo/cXO0wv/UrHv8fi6+aI92kBGoGtSrKKs3p501j9na4Y6XuO0fEfAnwNce9WmQj7m+vgW5gDAfsSr+6wjr0NONJy85Eoa8ywstZ6fcr2YRCTbuA==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 57793eaf-f5ed-4c7c-5d51-08d7b62ee70e
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Feb 2020 18:01:25.5824
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0OLyUWRUCcKXxHNwGW+v5DpVEkIHhfS3wkm4OWcDgfu3xkdRotQWm1otNtq82SB4jPMzq0OBeF3B8b8q4u1h8Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3592
X-OriginatorOrg: Nvidia.com
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1582221615; bh=7IWjuCS578MB9xTqy19UADfVndoIRQh2R+1yPUNxzgI=;
        h=X-PGP-Universal:ARC-Seal:ARC-Message-Signature:
         ARC-Authentication-Results:From:To:CC:Subject:Thread-Topic:
         Thread-Index:Date:Message-ID:References:In-Reply-To:
         Accept-Language:X-MS-Has-Attach:X-MS-TNEF-Correlator:msip_labels:
         authentication-results:x-originating-ip:x-ms-publictraffictype:
         x-ms-office365-filtering-correlation-id:x-ms-traffictypediagnostic:
         x-microsoft-antispam-prvs:x-ms-oob-tlc-oobclassifiers:
         x-forefront-prvs:x-forefront-antispam-report:received-spf:
         x-ms-exchange-senderadcheck:x-microsoft-antispam:
         x-microsoft-antispam-message-info:
         x-ms-exchange-antispam-messagedata:x-ms-exchange-transport-forked:
         MIME-Version:X-MS-Exchange-CrossTenant-Network-Message-Id:
         X-MS-Exchange-CrossTenant-originalarrivaltime:
         X-MS-Exchange-CrossTenant-fromentityheader:
         X-MS-Exchange-CrossTenant-id:X-MS-Exchange-CrossTenant-mailboxtype:
         X-MS-Exchange-CrossTenant-userprincipalname:
         X-MS-Exchange-Transport-CrossTenantHeadersStamped:X-OriginatorOrg:
         Content-Language:Content-Type:Content-Transfer-Encoding;
        b=Lp1yeJD3TCgCn3ubWZAXMAvHcTuX/9TB7HWRJIVXimo2+J+zLQpnxlf8d9O691KIb
         nf9OFyjs/1TJcokHW2OoZn2U2i1tLTexwIji/zLR+z7zdLTAJNp1zIlOCDz4s/M+7b
         3ZnRxJx+Zlaz42syk4EPX7YjLfR+HUqtj/fZDLJZ2/Uyl74iWxm3fGWRFk2c5rvMcJ
         pV3dl0YhpYwHIPwEXWwrBTISx7MR5ca1PWIBJXAAb0kUk2L+vpCLHoHr6lN7gTsWxC
         Y6n77a5nnoj92PUKgLt3jS5UykePQs4y0/pvyfD8I5PtRFaAJbVdzqwZlPBvgEpQua
         WyRjZutzRI0Rg==
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

SGkgTWF0aGlhcywNCg0KPiBPbiAxOS4yLjIwMjAgMS41MCwgQWpheSBHdXB0YSB3cm90ZToNCj4g
PiBGcm9tOiBBamF5IEd1cHRhIDxhamF5Z0BudmlkaWEuY29tPg0KPiA+DQo+ID4gWGhjaSBpbnRl
cnJ1cHQgbXVzdCBiZSBlbmFibGVkIG9ubHkgYWZ0ZXIgY29udHJvbGxlciBpcyBpbml0aWFsaXpl
ZA0KPiA+IGFuZCBzdGFydGVkLiBDdXJyZW50bHkgaW50ZXJydXB0IGlzIGVuYWJsZWQgZmlyc3Qg
aW4geGhjaV9ydW4oKSBhbmQNCj4gPiBsYXRlciBoY2Qgc3RhdGUgaXMgc2V0IHRvIHJ1bm5pbmcg
aW4geGhjaV9ydW5fZmluaXNoZWQoKS4NCj4gPg0KPiA+IE9uIGEgc2xvdyBzeXN0ZW0gKHN1Y2gg
YXMgRlBHQSBiYXNlZCBwbGF0Zm9ybSkgdGhlIHRpbWUgZGlmZmVyZW5jZQ0KPiA+IGJldHdlZW4g
ZW5hYmxpbmcgaW50ZXJydXB0IGFuZCBzZXR0aW5nIHRoZSBoY2Qgc3RhdGUgYmVjb21lcyBodWdl
DQo+ID4gZW5vdWdoIHdoZXJlIGludGVycnVwdCBpcyB0cmlnZ2VyZWQgYnV0IGNvbnRyb2xsZXIg
aW5pdGlhbGl6YXRpb24gaXMNCj4gPiBub3QgY29tcGxldGUgeWV0Lg0KPiA+DQo+ID4gRml4aW5n
IHRoZSBzYW1lIGJ5IG1vdmluZyB0aGUgaW50ZXJydXB0IGVuYWJsZSAoQ01EX0VJRSkgcGFydCBv
ZiBjb2RlDQo+ID4gc25pcHBldCBmcm9tIHhoY2lfcnVuKCkgdG8geGhjaV9ydW5fZmluaXNoZWQo
KS4NCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IEFqYXkgR3VwdGEgPGFqYXlnQG52aWRpYS5jb20+
DQo+ID4gLS0tDQo+IA0KPiBTb3VuZHMgcmVhc29uYWJsZSwgYnV0IHhIQ0kgc3BlY3Mgd2FudHMg
aW50ZXJydXB0cyBzZXQgYW5kIGVuYWJsZWQgYmVmb3JlDQo+IHhIQyBpcyBydW5uaW5nIHN0YXRl
Lg0KPiANCj4gSSBzZWUgdGhpcyBjYW4gYmUgYW4gaXNzdWUgaWYgd2UgZ2V0IGEgcG9ydCBldmVu
dCBmb3IgYSBVU0IgMyBwb3J0IGJlZm9yZSB0aGUNCj4gVVNCMyBoY2QgaXMgYWRkZWQuDQo+IFdo
YXQga2luZCBvZiBpc3N1ZXMgZGlkIHlvdSBzZWU/IEknZCBndWVzcyBOVUxMIHBvaW50ZXIgZGVy
ZWZlcmVuY2UgaW4NCj4gaGFuZGxlX3BvcnRfc3RhdHVzKCk/Lg0KV2Ugc2F3IGEga2VybmVsIHNv
ZnQgbG9ja3VwIHdpdGggZm9sbG93aW5nIGR1bXAgd2hlbiBhIEZQR0EgYmFzZWQgc3lzdGVtDQpp
cyBib290ZWQgd2l0aCBBU1VTIHhIQ0kgKEdlbiAyKSBQQ0llIGNhcmQgYXR0YWNoZWQuIEl0IHdh
cyBzZWVuIHdpdGgga2VybmVsDQp2NC45Lg0KDQpbICAgIDYuMTEwMTIwXSBlaGNpX2hjZDogVVNC
IDIuMCAnRW5oYW5jZWQnIEhvc3QgQ29udHJvbGxlciAoRUhDSSkgRHJpdmVyICAgICAgIA0KWyAg
ICA2LjExMDYwMl0gZWhjaS1wY2k6IEVIQ0kgUENJIHBsYXRmb3JtIGRyaXZlciAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICANClsgICAgNi4xMTIxMDRdIG9oY2lfaGNkOiBVU0IgMS4xICdP
cGVuJyBIb3N0IENvbnRyb2xsZXIgKE9IQ0kpIERyaXZlciAgICAgICAgICAgDQpbICAgIDYuMTEy
NTg2XSBvaGNpLXBjaTogT0hDSSBQQ0kgcGxhdGZvcm0gZHJpdmVyICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIA0KWyAgICA2LjExMzk4Ml0gb2hjaS1wbGF0Zm9ybTogT0hDSSBnZW5lcmlj
IHBsYXRmb3JtIGRyaXZlciAgICAgICAgICAgICAgICAgICAgICANClsgICAgNi4xMTc1NzddIHho
Y2lfaGNkIDAwMDA6MDE6MDAuMDogeEhDSSBIb3N0IENvbnRyb2xsZXIgICAgICAgICAgICAgICAg
ICAgICAgDQpbICAgIDYuMTE4MDIyXSB4aGNpX2hjZCAwMDAwOjAxOjAwLjA6IG5ldyBVU0IgYnVz
IHJlZ2lzdGVyZWQsIGFzc2lnbmVkIGJ1cyBudW1iMQ0KWyAgICA2LjEzMTY3NF0geGhjaV9oY2Qg
MDAwMDowMTowMC4wOiBoY2MgcGFyYW1zIDB4MDIwMGVlYzEgaGNpIHZlcnNpb24gMHgxMTAgcTAN
ClsgICAgNi4xMzQ4ODJdIHVzYiB1c2IxOiBOZXcgVVNCIGRldmljZSBmb3VuZCwgaWRWZW5kb3I9
MWQ2YiwgaWRQcm9kdWN0PTAwMDIgICAgDQpbICAgIDYuMTM1NzMxXSB1c2IgdXNiMTogTmV3IFVT
QiBkZXZpY2Ugc3RyaW5nczogTWZyPTMsIFByb2R1Y3Q9MiwgU2VyaWFsTnVtYmVyMQ0KWyAgICA2
LjEzNjE3Ml0gdXNiIHVzYjE6IFByb2R1Y3Q6IHhIQ0kgSG9zdCBDb250cm9sbGVyICAgICAgICAg
ICAgICAgICAgICAgICAgICANClsgICAgNi4xMzY0ODhdIHVzYiB1c2IxOiBNYW51ZmFjdHVyZXI6
IExpbnV4IDQuOS4zOC10ZWdyYS1nMDE3N2MwYi1kaXJ0eSB4aGNpLWhkDQpbICAgIDYuMTM2OTE3
XSB1c2IgdXNiMTogU2VyaWFsTnVtYmVyOiAwMDAwOjAxOjAwLjAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIA0KWyAgICA2LjE0MjMzNF0gaHViIDEtMDoxLjA6IFVTQiBodWIgZm91bmQgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICANClsgICAgNi4xNDI4NjZdIGh1YiAx
LTA6MS4wOiAyIHBvcnRzIGRldGVjdGVkICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgDQpbICAgIDYuMTQ4MTEwXSB4aGNpX2hjZCAwMDAwOjAxOjAwLjA6IHhIQ0kgSG9zdCBDb250
cm9sbGVyICAgICAgICAgICAgICAgICAgICAgIA0KWyAgICA2LjE0ODUwMF0geGhjaV9oY2QgMDAw
MDowMTowMC4wOiBuZXcgVVNCIGJ1cyByZWdpc3RlcmVkLCBhc3NpZ25lZCBidXMgbnVtYjINClsg
ICAgNi4xNTY2NjBdIHJhbmRvbTogZmFzdCBpbml0IGRvbmUgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgDQpbICAgIDYuNzU0OTgxXSByYW5kb206IGNybmcgaW5pdCBk
b25lICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIA0KWyAgIDI3LjE0
NzM0MV0gSU5GTzogcmN1X3ByZWVtcHQgc2VsZi1kZXRlY3RlZCBzdGFsbCBvbiBDUFUgICAgICAg
ICAgICAgICAgICAgICANClsgICAyNy4xNDc3NTddICAwLS4uLjogKDUyNTAgdGlja3MgdGhpcyBH
UCkgaWRsZT0xZWQvMTQwMDAwMDAwMDAwMDAyLzAgc29mdGlycT0gDQpbICAgMjcuMTQ4MjQzXSAg
ICh0PTUyNTAgamlmZmllcyBnPTYyMiBjPTYyMSBxPTEyKSAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIA0KWyAgIDI3LjE0ODYxOF0gcmN1X3ByZWVtcHQga3RocmVhZCBzdGFydmVkIGZvciA1
MjUwIGppZmZpZXMhIGc2MjIgYzYyMSBmMHgwIFJDVTENClsgICAyNy4xNDkxNThdIHJjdV9wcmVl
bXB0ICAgICBTICAgIDAgICAgIDcgICAgICAyIDB4MDAwMDAwMDAgICAgICAgICAgICAgICAgICAg
DQpbICAgMjcuMTQ5NTYzXSBDYWxsIHRyYWNlOiAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIA0KWyAgIDI3LjE0OTc5OV0gWzxmZmZmZmY4MDA4MDg1
NzkwPl0gX19zd2l0Y2hfdG8rMHgzYy8weDQ4ICAgICAgICAgICAgICAgICAgICAgICANClsgICAy
Ny4xNTAxNDldIFs8ZmZmZmZmODAwOGVlNjM3ND5dIF9fc2NoZWR1bGUrMHgyNWMvMHg3NDQgICAg
ICAgICAgICAgICAgICAgICAgDQpbICAgMjcuMTUwNDc5XSBbPGZmZmZmZjgwMDhlZTY4OTg+XSBz
Y2hlZHVsZSsweDNjLzB4YTAgICAgICAgICAgICAgICAgICAgICAgICAgIA0KWyAgIDI3LjE1MDgw
OF0gWzxmZmZmZmY4MDA4ZWU5YWE4Pl0gc2NoZWR1bGVfdGltZW91dCsweDE4Yy8weDM3YyAgICAg
ICAgICAgICAgICANClsgICAyNy4xNTExODZdIFs8ZmZmZmZmODAwODExZDk4OD5dIHJjdV9ncF9r
dGhyZWFkKzB4NGQ4LzB4NzljICAgICAgICAgICAgICAgICAgDQpbICAgMjcuMTUxNTcxXSBbPGZm
ZmZmZjgwMDgwY2IxYTA+XSBrdGhyZWFkKzB4ZjAvMHgxMDQgICAgICAgICAgICAgICAgICAgICAg
ICAgIA0KWyAgIDI3LjE1MTg4OF0gWzxmZmZmZmY4MDA4MDgyYWQwPl0gcmV0X2Zyb21fZm9yaysw
eDEwLzB4NDAgICAgICAgICAgICAgICAgICAgICANClsgICAyNy4xNTIyNzJdIFRhc2sgZHVtcCBm
b3IgQ1BVIDA6ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgDQpb
ICAgMjcuMTUyNDk3XSBzd2FwcGVyLzAgICAgICAgUiAgcnVubmluZyB0YXNrICAgICAgICAwICAg
ICAxICAgICAgMCAweDAwMDAwMDAyIA0KWyAgIDI3LjE1MzAyMF0gQ2FsbCB0cmFjZTogICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICANClsgICAyNy4x
NTMyMjRdIFs8ZmZmZmZmODAwODA4OWM1Yz5dIGR1bXBfYmFja3RyYWNlKzB4MC8weDE2YyAgICAg
ICAgICAgICAgICAgICAgDQpbICAgMjcuMTUzNTgyXSBbPGZmZmZmZjgwMDgwODlmNzA+XSBzaG93
X3N0YWNrKzB4MTQvMHgxYyAgICAgICAgICAgICAgICAgICAgICAgIA0KWyAgIDI3LjE1MzkxNF0g
WzxmZmZmZmY4MDA4MTliYzk0Pl0gc2NoZWRfc2hvd190YXNrLnBhcnQuMTM1KzB4NmMvMHg3OCAg
ICAgICAgICANClsgICAyNy4xNTQzMThdIFs8ZmZmZmZmODAwODBkZWIzMD5dIGR1bXBfY3B1X3Rh
c2srMHg4OC8weGM4ICAgICAgICAgICAgICAgICAgICAgDQpbICAgMjcuMTU0NjY3XSBbPGZmZmZm
ZjgwMDgxOWMwZDQ+XSByY3VfZHVtcF9jcHVfc3RhY2tzKzB4YTQvMHhlYyAgICAgICAgICAgICAg
IA0KWyAgIDI3LjE1NTAzNl0gWzxmZmZmZmY4MDA4MTFhYWNjPl0gY2hlY2tfY3B1X3N0YWxsLmlz
cmEuNjErMHgzMzQvMHg1YzggICAgICAgICANClsgICAyNy4xNTU0MTldIFs8ZmZmZmZmODAwODEx
YWQ5ND5dIF9fcmN1X3BlbmRpbmcrMHgzNC8weDE4YyAgICAgICAgICAgICAgICAgICAgDQpbICAg
MjcuMTU1NzcyXSBbPGZmZmZmZjgwMDgxMWUwNDA+XSByY3VfY2hlY2tfY2FsbGJhY2tzKzB4MTA0
LzB4MmM0ICAgICAgICAgICAgIA0KWyAgIDI3LjE1NjE2Nl0gWzxmZmZmZmY4MDA4MTIzZTYwPl0g
dXBkYXRlX3Byb2Nlc3NfdGltZXMrMHg2MC8weGFjICAgICAgICAgICAgICANClsgICAyNy4xNTY1
NDddIFs8ZmZmZmZmODAwODEzNGY4MD5dIHRpY2tfc2NoZWRfdGltZXIrMHg2Yy8weGVjICAgICAg
ICAgICAgICAgICAgDQpbICAgMjcuMTU2OTExXSBbPGZmZmZmZjgwMDgxMjQ2ZTA+XSBfX2hydGlt
ZXJfcnVuX3F1ZXVlcysweGQ0LzB4MzMwICAgICAgICAgICAgIA0KWyAgIDI3LjE1NzI5MV0gWzxm
ZmZmZmY4MDA4MTI1M2M4Pl0gaHJ0aW1lcl9pbnRlcnJ1cHQrMHg5Yy8weDFlMCAgICAgICAgICAg
ICAgICANClsgICAyNy4xNTc2NzldIFs8ZmZmZmZmODAwODllMmYxMD5dIGFyY2hfdGltZXJfaGFu
ZGxlcl9waHlzKzB4MmMvMHgzOCAgICAgICAgICAgDQpbICAgMjcuMTU4MDY5XSBbPGZmZmZmZjgw
MDgxMTM0NDQ+XSBoYW5kbGVfcGVyY3B1X2RldmlkX2lycSsweDgwLzB4MjQ4ICAgICAgICAgIA0K
WyAgIDI3LjE1ODQ4M10gWzxmZmZmZmY4MDA4MTBlMzA0Pl0gX19oYW5kbGVfZG9tYWluX2lycSsw
eDcwLzB4YzQgICAgICAgICAgICAgICANClsgICAyNy4xNTg4NDhdIFs8ZmZmZmZmODAwODA4MGRl
ND5dIGdpY19oYW5kbGVfaXJxKzB4NTAvMHhhMCAgICAgICAgICAgICAgICAgICAgDQpbICAgMjcu
MTU5MTk2XSBbPGZmZmZmZjgwMDgwODIxOTg+XSBlbDFfaXJxKzB4ZDgvMHgxNjggICAgICAgICAg
ICAgICAgICAgICAgICAgIA0KWyAgIDI3LjE1OTUzMF0gWzxmZmZmZmY4MDA4MGFkZjE4Pl0gaXJx
X2V4aXQrMHhiYy8weGU4ICAgICAgICAgICAgICAgICAgICAgICAgICANClsgICAyNy4xNTk4NTBd
IFs8ZmZmZmZmODAwODEwZTMwOD5dIF9faGFuZGxlX2RvbWFpbl9pcnErMHg3NC8weGM0ICAgICAg
ICAgICAgICAgDQpbICAgMjcuMTYwMjEzXSBbPGZmZmZmZjgwMDgwODBkZTQ+XSBnaWNfaGFuZGxl
X2lycSsweDUwLzB4YTAgICAgICAgICAgICAgICAgICAgIA0KWyAgIDI3LjE2MDU2MF0gWzxmZmZm
ZmY4MDA4MDgyMTk4Pl0gZWwxX2lycSsweGQ4LzB4MTY4ICAgICAgICAgICAgICAgICAgICAgICAg
ICANClsgICAyNy4xNjA4OTddIFs8ZmZmZmZmODAwODhiY2E4OD5dIHhoY2lfaGFuZHNoYWtlKzB4
MzgvMHg5MCAgICAgICAgICAgICAgICAgICAgDQpbICAgMjcuMTYxMjUwXSBbPGZmZmZmZjgwMDg4
YmQzY2M+XSB4aGNpX3J1bisweDMwMC8weDUzNCAgICAgICAgICAgICAgICAgICAgICAgIA0KWyAg
IDI3LjE2MTU3NF0gWzxmZmZmZmY4MDA4ODg4ZWY4Pl0gdXNiX2FkZF9oY2QrMHgyZjAvMHg4Njgg
ICAgICAgICAgICAgICAgICAgICANClsgICAyNy4xNjE5MjldIFs8ZmZmZmZmODAwODhkMjU5OD5d
IHhoY2lfcGNpX3Byb2JlKzB4MTIwLzB4MjI0ICAgICAgICAgICAgICAgICAgDQpbICAgMjcuMTYy
MzAwXSBbPGZmZmZmZjgwMDg0YzFmMTA+XSBwY2lfZGV2aWNlX3Byb2JlKzB4OTgvMHgxMGMgICAg
ICAgICAgICAgICAgIA0KWyAgIDI3LjE2MjY3MV0gWzxmZmZmZmY4MDA4NjU1NzQwPl0gZHJpdmVy
X3Byb2JlX2RldmljZSsweDI5Yy8weDQzOCAgICAgICAgICAgICANClsgICAyNy4xNjMwNDRdIFs8
ZmZmZmZmODAwODY1NTllYz5dIF9fZHJpdmVyX2F0dGFjaCsweDExMC8weDExNCAgICAgICAgICAg
ICAgICAgDQpbICAgMjcuMTYzNDQ1XSBbPGZmZmZmZjgwMDg2NTMwMzg+XSBidXNfZm9yX2VhY2hf
ZGV2KzB4NjQvMHhiNCAgICAgICAgICAgICAgICAgIA0KWyAgIDI3LjE2MzgwMV0gWzxmZmZmZmY4
MDA4NjU0ZjljPl0gZHJpdmVyX2F0dGFjaCsweDIwLzB4MjggICAgICAgICAgICAgICAgICAgICAN
ClsgICAyNy4xNjQxNDddIFs8ZmZmZmZmODAwODY1NGE3ND5dIGJ1c19hZGRfZHJpdmVyKzB4MjNj
LzB4MmE4ICAgICAgICAgICAgICAgICAgDQpbICAgMjcuMTY0NTA2XSBbPGZmZmZmZjgwMDg2NTY5
YjA+XSBkcml2ZXJfcmVnaXN0ZXIrMHg3NC8weDEwYyAgICAgICAgICAgICAgICAgIA0KWyAgIDI3
LjE2NDg2Ml0gWzxmZmZmZmY4MDA4NGMwYzQ0Pl0gX19wY2lfcmVnaXN0ZXJfZHJpdmVyKzB4NDQv
MHg0YyAgICAgICAgICAgICANClsgICAyNy4xNjUyNTJdIFs8ZmZmZmZmODAwOTUzMDYxND5dIHho
Y2lfcGNpX2luaXQrMHg1NC8weDYwICAgICAgICAgICAgICAgICAgICAgDQpbICAgMjcuMTY1NjAx
XSBbPGZmZmZmZjgwMDgwODMxYjQ+XSBkb19vbmVfaW5pdGNhbGwrMHg0OC8weDE1MCAgICAgICAg
ICAgICAgICAgIA0KWyAgIDI3LjE2NTk5N10gWzxmZmZmZmY4MDA5NGYwZTU0Pl0ga2VybmVsX2lu
aXRfZnJlZWFibGUrMHgxZDAvMHgyODQgICAgICAgICAgICANClsgICAyNy4xNjY0MDBdIFs8ZmZm
ZmZmODAwOGVlMjdmOD5dIGtlcm5lbF9pbml0KzB4MTAvMHhmYyAgICAgICAgICAgICAgICAgICAg
ICAgDQpbICAgMjcuMTY2NzIzXSBbPGZmZmZmZjgwMDgwODJhZDA+XSByZXRfZnJvbV9mb3JrKzB4
MTAvMHg0MCAgIA0KIA0KPiBXZSBjb3VsZCBtb3ZlIGludGVycnVwdCBlbmFibGluZyB0byB4aGNp
X3J1bl9maW5pc2hlZCgpIGJlZm9yZQ0KPiB4aGNpX3N0YXJ0KCkgaXMgY2FsbGVkLCB0aGVuIHRo
ZSBVU0IzIGhjZCBzaG91bGQgYmUgaW5pdGlhbGl6ZWQgYmVmb3JlIHdlIHJlY2VpdmUNCj4gaW50
ZXJydXB0cy4NCj4gRG9lcyB0aGF0IHdvcmsgZm9yIHlvdT8NCkxldCBtZSBjaGVjayBpZiBJIGNh
biBmaW5kIHRoZSBzeXN0ZW0gYW5kIHRlc3QgaXQuDQoNClRoYW5rcw0KPm52cHVibGljDQo+IA0K
PiBEZXRhaWxzOg0KPiB4SENJIHNlY3Rpb24gNC4yICJIb3N0IENvbnRyb2xsZXIgSW5pdGlhbGl6
YXRpb24iIGhhcyB0aGUgZm9sbG93aW5nIHNlcXVlbmNlOg0KPiANCj4gLSBFbmFibGUgaG9zdCBz
eXN0ZW0gaW50ZXJydXB0IChDTURfRUlFKSwNCj4gLSBFbmFibGUgcHJpbWFyeSBpbnRlcnVwdGVy
IChzZXQgSUUgYml0IGluIElNQU4gcmVnaXN0ZXIpDQo+IC0gc2V0IHJ1biBiaXQgaW4gVVNCQ01E
IHJlZ2lzdGVyLg0KPiANCj4gQW5kIHNlY3Rpb24gNS41LjIgaGFzIGEgbm90ZToNCj4gDQo+ICJB
bGwgcmVnaXN0ZXJzIG9mIHRoZSBQcmltYXJ5IEludGVycnVwdGVyIHNoYWxsIGJlIGluaXRpYWxp
emVkIGJlZm9yZSBzZXR0aW5nIHRoZQ0KPiBSdW4vU3RvcCAoUlMpIGZsYWcgaW4gdGhlIFVTQkNN
RCByZWdpc3RlciB0byDigJgx4oCZLiINCj4gDQo+IC1NYXRoaWFzDQo=
