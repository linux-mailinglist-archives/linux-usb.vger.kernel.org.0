Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DF06A1BED46
	for <lists+linux-usb@lfdr.de>; Thu, 30 Apr 2020 03:00:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726501AbgD3BAd (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 29 Apr 2020 21:00:33 -0400
Received: from smtprelay-out1.synopsys.com ([149.117.87.133]:46138 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726279AbgD3BAd (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 29 Apr 2020 21:00:33 -0400
Received: from mailhost.synopsys.com (badc-mailhost2.synopsys.com [10.192.0.18])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 29FD7C054D;
        Thu, 30 Apr 2020 01:00:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1588208432; bh=mPrmrBGF/SccgaU8r7y9AZ42k+BfVr510ZgT8Wykhnw=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=iS32SHaK62m0c5CoQUuiIZJ+kX3eStrsVurDamJDupfg/AbGnQbw0jPvlCxRPu41A
         ddTO+sRBe/V/Srn+Q3xFcrkwpg01BUEmCFkZFxM5zWuE2BhiJ3y/BWSoAYTVLBjCw5
         RNmDCaM0Ju/tcig9wBGBWMQ9bGzDIlo3wbMmk5whWnk0aPVArNJvnxXK0tI9ODdyzj
         VYB/tow91pigVsUfdPSr+8jxy0wWDmQP9l1bQTYxSg03gDvQeQUBz+RsQGGlkZpUBX
         tFav7iEl7nHhYWh5paiind2f2r80ymi9mOL6N/i0WVXIjmnFLnSJoWt2tfFoo6JcMg
         A1PVyHi3639SA==
Received: from US01WEHTC3.internal.synopsys.com (us01wehtc3.internal.synopsys.com [10.15.84.232])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPS id 3E4CAA0069;
        Thu, 30 Apr 2020 01:00:31 +0000 (UTC)
Received: from US01HYBRID2.internal.synopsys.com (10.15.246.24) by
 US01WEHTC3.internal.synopsys.com (10.15.84.232) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Wed, 29 Apr 2020 18:00:28 -0700
Received: from NAM04-BN3-obe.outbound.protection.outlook.com (10.202.3.67) by
 mrs.synopsys.com (10.15.246.24) with Microsoft SMTP Server (TLS) id
 14.3.487.0; Wed, 29 Apr 2020 18:00:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j0EGCLT5zv3kWYGO4CTrwZTJZf3ccliP7geRwj7jll1Sfc14W/Hu3vvRj4qJBEM2gPQrjm4oEjkFtj4b6qM57PXIv7dgUwIXv23TwZ3oam82QCzAuEPwcLMy8AcF6zSGrxtUmhZbxH8UGXF3Y5FsR8J6CrORmCndGLLoNv2Hw6fqKBSQucCR+SlWeOSqvtRDn5RHEXdtCr1DVszyVb42AsrF9OWyPte4izKqF7+ndGSRAroM1LTxLT7it10cT2Ud95BmroAmxd7kWUo2VlTmBWZyaOMuyZem9TEghEVfAurHpFVZGcR9inhwV9X9jp3C6a0/EfHPyihHsNngdeO+DQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mPrmrBGF/SccgaU8r7y9AZ42k+BfVr510ZgT8Wykhnw=;
 b=E92dfZzAFZ6Kz+4bmN39KCrbkqFa2mPA0So4hecDvYSi332bNpB+e04DcTXRJZ2h8KDPxYiA6bSOwB2iTfRYJybsc8K3pRvtR6EwB/7hYQ6D4imVGNlf0v34h90/3MHHtrec0AlFkfOtcl4cqpX6pBXkfye5FbW8gs5IACmzYW9Uz1D14LVoekyujbq0ZuZXmp0w/NEk3WRhsNHsucjyqz+aPbghApWjjaFlHLNXNaXbzjzGav37HwdOpCQOL515mjE1jhFO8EOVve/W2oIQnevx82Kwm5CK2gQtCQ7lwE7eQ+Uab1QsD0MbFmYPCU8lHK4GGvEjpqXWi4ZjUoY5ow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mPrmrBGF/SccgaU8r7y9AZ42k+BfVr510ZgT8Wykhnw=;
 b=VTbaRefU9+/D8KaOzPr61T9JKuGyuRlik6LFaUKPJkzjB1mgSht/ZlOW8VARGi5A7dAI+eb/iKGU0lqa7GO6Z03aw1uBg8JybDyaCtXXdVpTWhd6kYpCqUoElMbVta/rErkWlZkPs9NWTf9t7BmjRiSVgHOvOlLmlRxRJCL7KEc=
Received: from DM6PR12MB2924.namprd12.prod.outlook.com (2603:10b6:5:183::23)
 by DM6PR12MB3964.namprd12.prod.outlook.com (2603:10b6:5:1c5::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2937.13; Thu, 30 Apr
 2020 01:00:27 +0000
Received: from DM6PR12MB2924.namprd12.prod.outlook.com
 ([fe80::102:1678:4c4d:e5c]) by DM6PR12MB2924.namprd12.prod.outlook.com
 ([fe80::102:1678:4c4d:e5c%6]) with mapi id 15.20.2958.020; Thu, 30 Apr 2020
 01:00:26 +0000
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To:     Peter Chen <peter.chen@nxp.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>
CC:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        John Youn <John.Youn@synopsys.com>
Subject: Re: [PATCH 1/5] usb: gadget: Introduce usb_request->is_last field
Thread-Topic: [PATCH 1/5] usb: gadget: Introduce usb_request->is_last field
Thread-Index: AQHWHOMiP7xQ0M6cVEqSUTmaHa412aiPbxIAgAFsnwA=
Date:   Thu, 30 Apr 2020 01:00:26 +0000
Message-ID: <6c13582a-476e-a217-32ca-482dd78793b6@synopsys.com>
References: <cover.1588025916.git.thinhn@synopsys.com>
 <456f864b86a72ab9490ce095d5ba3f59b39d6a09.1588025916.git.thinhn@synopsys.com>
 <20200429031549.GB20222@b29397-desktop>
In-Reply-To: <20200429031549.GB20222@b29397-desktop>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
authentication-results: nxp.com; dkim=none (message not signed)
 header.d=none;nxp.com; dmarc=none action=none header.from=synopsys.com;
x-originating-ip: [149.117.7.23]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ee83ccc2-56e8-4aef-7e63-08d7eca1dec3
x-ms-traffictypediagnostic: DM6PR12MB3964:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR12MB3964F192D73818B34C5DE300AAAA0@DM6PR12MB3964.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 0389EDA07F
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR12MB2924.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(366004)(376002)(136003)(39860400002)(396003)(346002)(66946007)(4326008)(107886003)(2906002)(8676002)(110136005)(54906003)(66476007)(66556008)(31686004)(2616005)(66446008)(64756008)(76116006)(36756003)(8936002)(53546011)(186003)(6486002)(6512007)(26005)(6506007)(5660300002)(31696002)(71200400001)(316002)(478600001)(86362001);DIR:OUT;SFP:1102;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: mxImPfC19Zj3RVkzs38Loy+A/JBTr9d08FZ0TysyF7HDMJuxFFzNroCcrvTNjEV7VfFShukzTpbKWmWfeo4kyeVrlX0S2YMq5bR3nM379O0ObeRFpUns8CifTokhM5MxB6FkGEBvD09XC96/TUIJ3jj3lOJ3JxNkGgM8YRkcSvqguQ8Gpk3bUjsSPCShC3ABqDJNG3Pno9KMHf4yTc0XY85/Bv7MF4c2fGu6lTPwTQqFNhjt97NjLhvmChlZbea4W2HxPktOeXIqGqztoWY0/dAJzIExn1K1BMrsiq/mmiNVwY5pjxB7KfSm/bTJPxK2P7RFfJv7EyjMY/BPl/fB6Y1B1l430dffZhVQ3A/peTZeOl6ukKkFQdy31+NJAaX3T8ipv0pY5U8gxDUAYbzPDXsMEPb1F+d3rEHsClmDfYecOFShl3OPh9ExH09fcMD/
x-ms-exchange-antispam-messagedata: yyJOD8gEg+YvwOJMNVHopvQTHJyJgqUePnOZ0JU6nRQhEnSE78J8EzCyvA8JX518US3mEjkMXxjAbpqrIhXSfkXhzOYdqkvDDiqydaX/U4Ld2ip9l1Y1n1OfIYeWpmINOAzJihmNofSNdS4lpSDP4A2TjYx+Odc2ONoEKWLxfD/W6GKFN0+8FJQ29QNENOlO3BeSfOBbw7W/1Wn0aq+0tCgOsRmU1iHd6DlUWFGGtoI11HBXCHLlGyeeMr7cQ4gS3Mo4wCzMwfC49OVRSEmcLuL5Xw4rIizrcnBMeOIzXVzcrR1/dClfdK53bIugZfqHtL9BwKZlD6tV+e9eE8QsZqVT9isz7sw62QnUzgTtI2wIyJz6VoHqo5SRkFArDNbMAH5/2Z+jBlPgVdaaHqfYHDtSZTt0L1bzF3QxGk/YjJzC+oAJVeym0wiGTfS6wPHE5gIz+OL2Wd0tpM4vuTxOmipFRhvjgfIeVQy9GLpprb+yR/dJgCr+gl2+WpeUT7kryku9nOtb3suyw1kVzNNHYbOPwTmgzcOiyGPVlT7oEiabIW8D8tKa4CGKMYBlwf0SycIM2zwYmWxSMiMjixwfxMw5iUdxuBkvq2GXW8DN5S3C2uWSimx8/wY0nRHqPpYFI1wRAjyIvnzk+96KNk1JuIePxsOWMpX3lAk/QzV9KTtVwILpwmuJWsCC51qpa8WJrnAJe1vzbfViI4WtuQMEEf187ZtPutEeiYNUS5fv/hucj02eZlhjxzRr8/YCPOy/XJSBAMgy9So73QfHABPQAhkN+PzZ3F6Xgd4BS7Y2ghw=
Content-Type: text/plain; charset="utf-8"
Content-ID: <B4A5AD5D3C8A244B83951FD3B37E3759@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: ee83ccc2-56e8-4aef-7e63-08d7eca1dec3
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Apr 2020 01:00:26.6548
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: h9/nfeBQliaPNGMZu565RCkvLO8MrF13pciIjeGo9PFyiexwWBzmvwnf3Iwj5YkKK55GFJMYEqs3EyKZKO0QZA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3964
X-OriginatorOrg: synopsys.com
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

SGksDQoNClBldGVyIENoZW4gd3JvdGU6DQo+IE9uIDIwLTA0LTI3IDE1OjI3OjQxLCBUaGluaCBO
Z3V5ZW4gd3JvdGU6DQo+PiBBIHRyYW5zZmVyIGlzIGNvbXBvc2VkIG9mIG9uZSBvciBtb3JlIHVz
Yl9yZXF1ZXN0cy4gQ3VycmVudGx5LCBvbmx5IHRoZQ0KPj4gZnVuY3Rpb24gZHJpdmVyIGtub3dz
IHRoaXMgYmFzZWQgb24gaXRzIGltcGxlbWVudGF0aW9uIGFuZCBpdHMgY2xhc3MNCj4+IHByb3Rv
Y29sLiBIb3dldmVyLCBzb21lIHVzYiBjb250cm9sbGVycyBuZWVkIHRvIGtub3cgdGhpcyB0byB1
cGRhdGUgaXRzDQo+PiByZXNvdXJjZXMuIEZvciBleGFtcGxlLCB0aGUgRFdDMyBjb250cm9sbGVy
IG5lZWRzIHRoaXMgaW5mbyB0byB1cGRhdGUNCj4+IGl0cyBpbnRlcm5hbCByZXNvdXJjZXMgYW5k
IGluaXRpYXRlIGRpZmZlcmVudCBzdHJlYW1zLg0KPj4NCj4+IEludHJvZHVjZSBhIG5ldyBmaWVs
ZCBpc19sYXN0IHRvIHVzYl9yZXF1ZXN0IHRvIGluZm9ybSB0aGUgY29udHJvbGxlcg0KPj4gZHJp
dmVyIHdoZXRoZXIgdGhlIHJlcXVlc3QgaXMgdGhlIGxhc3Qgb2YgaXRzIHRyYW5zZmVyLg0KPj4N
Cj4+IFNpZ25lZC1vZmYtYnk6IFRoaW5oIE5ndXllbiA8dGhpbmhuQHN5bm9wc3lzLmNvbT4NCj4+
IC0tLQ0KPj4gICBpbmNsdWRlL2xpbnV4L3VzYi9nYWRnZXQuaCB8IDIgKysNCj4+ICAgMSBmaWxl
IGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKQ0KPj4NCj4+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2xp
bnV4L3VzYi9nYWRnZXQuaCBiL2luY2x1ZGUvbGludXgvdXNiL2dhZGdldC5oDQo+PiBpbmRleCBl
OTU5YzA5YTk3YzkuLjc0MmM1MmY3ZTQ3MCAxMDA2NDQNCj4+IC0tLSBhL2luY2x1ZGUvbGludXgv
dXNiL2dhZGdldC5oDQo+PiArKysgYi9pbmNsdWRlL2xpbnV4L3VzYi9nYWRnZXQuaA0KPj4gQEAg
LTUwLDYgKzUwLDcgQEAgc3RydWN0IHVzYl9lcDsNCj4+ICAgICogQHNob3J0X25vdF9vazogV2hl
biByZWFkaW5nIGRhdGEsIG1ha2VzIHNob3J0IHBhY2tldHMgYmUNCj4+ICAgICogICAgIHRyZWF0
ZWQgYXMgZXJyb3JzIChxdWV1ZSBzdG9wcyBhZHZhbmNpbmcgdGlsbCBjbGVhbnVwKS4NCj4+ICAg
ICogQGRtYV9tYXBwZWQ6IEluZGljYXRlcyBpZiByZXF1ZXN0IGhhcyBiZWVuIG1hcHBlZCB0byBE
TUEgKGludGVybmFsKQ0KPj4gKyAqIEBpc19sYXN0OiBJbmRpY2F0ZXMgaWYgdGhpcyByZXF1ZXN0
IGlzIHRoZSBsYXN0IG9mIGEgdHJhbnNmZXIuDQo+IFdvdWxkIHlvdSBwbGVhc2UgZGVzY3JpYmUg
dGhlIHVzZSBjYXNlIGZvciBpdCwgYW5kIHdoYXQncyAndHJhbnNmZXInDQo+IGFuZCAncmVxdWVz
dCcgaW4geW91ciB1c2UgY2FzZT8NCj4NCg0KVGhlIHRyYW5zZmVyIHNpemUgaXMgZGVmaW5lZCBi
eSBhIGNsYXNzIHByb3RvY29sLiBUaGUgZnVuY3Rpb24gZHJpdmVyIA0Kd2lsbCBkZXRlcm1pbmUg
aG93IG1hbnkgdXNiX3JlcXVlc3RzIGFyZSBuZWVkZWQgdG8gZnVsZmlsbCB0aGF0IHRyYW5zZmVy
Lg0KDQpGb3IgZXhhbXBsZSwgaW4gTVNDLCBhIFJFQUQvV1JJVEUgY29tbWFuZCBjYW4gcmVxdWVz
dCBmb3IgYSB0cmFuc2ZlciANCnNpemUgdXAgdG8gKDUxMiAqIDJeMzEtMSkgYnl0ZXMuIEl0J2Qg
YmUgdG9vIGxhcmdlIGZvciBhIHNpbmdsZSANCnVzYl9yZXF1ZXN0LCB3aGljaCBpcyB3aHkgdGhl
IG1hc3Nfc3RvcmFnZSBmdW5jdGlvbiBkcml2ZXIgbGltaXRzIGVhY2ggDQpyZXF1ZXN0IHRvIDE2
S0IgbWF4IGJ5IGRlZmF1bHQuIEEgTVNDIGNvbW1hbmQgaXRzZWxmIGlzIGEgdHJhbnNmZXIsIHNh
bWUgDQp3aXRoIGl0cyBzdGF0dXMuDQoNClRoaXMgaXMgYSBzaW1pbGFyIGNhc2UgZm9yIFVBU1Au
IEhvd2V2ZXIsIHRoZSBmX3RjbSBhbmQgdGhlIHRhcmdldCANCmRyaXZlcnMgY3VycmVudCBpbXBs
ZW1lbnRhdGlvbiBvbmx5IHVzZSBhIHNpbmdsZSByZXF1ZXN0IHBlciB0cmFuc2Zlci4gDQooVGhp
cyBuZWVkcyB0byBiZSBmaXhlZCwgYWxvbmcgd2l0aCBzb21lIG90aGVyIGlzc3VlcyBpbiBmX3Rj
bSkuDQoNClRoZSB1c2UgY2FzZSBoZXJlIGlzIHRoYXQgRFdDM3ggY29udHJvbGxlciBuZWVkcyB0
byB1cGRhdGUgaXRzIHJlc291cmNlcyANCndoZW5ldmVyIGEgdHJhbnNmZXIgaXMgY29tcGxldGVk
LiBUaGlzIGlzIGEgcmVxdWlyZW1lbnQgZm9yIHN0cmVhbXMgd2hlbiANCml0IG5lZWRzIHRvIGZy
ZWUgdXAgc29tZSByZXNvdXJjZXMgZm9yIGRpZmZlcmVudCBzdHJlYW0gdHJhbnNmZXJzLiBUaGUg
DQpmdW5jdGlvbiBkcml2ZXIgbXVzdCBwYXNzIHRoaXMgaW5mb3JtYXRpb24gdG8gdGhlIGNvbnRy
b2xsZXIgZHJpdmVyIGZvciANCnN0cmVhbXMgdG8gd29yayBwcm9wZXJseS4NCg0KUG90ZW50aWFs
bHksIGFub3RoZXIgdXNlIGNhc2UgZm9yIHRoaXMgaXMgdG8gdXBkYXRlIHRoZSBkb2N1bWVudGF0
aW9uIG9uIA0KdXNiX2RlcXVldWVfcmVxdWVzdCgpLiBCeSBwcm92aWRpbmcgdGhlIGNvbmNlcHQg
b2YgYSB0cmFuc2Zlciwgd2UgY2FuIA0Kc2F5IHRoYXQgZGVxdWV1aW5nIGFuIGluLWZsaWdodCBy
ZXF1ZXN0IHdpbGwgY2FuY2VsIHRoZSB0cmFuc2ZlciwgYW5kIA0KYW55IGluY29tcGxldGUgcmVx
dWVzdCB3aXRoaW4gdGhlIHRyYW5zZmVyIG11c3QgYmUgZ2l2ZW4gYmFjayB0byB0aGUgDQpmdW5j
dGlvbiBkcml2ZXIuIFRoaXMgd291bGQgbWFrZSBzZW5zZSBmb3IgY29udHJvbGxlcnMgdGhhdCB1
c2UgVFJCIHJpbmcgDQpidWZmZXIgYW5kIGRlcXVldWUvZW5xdWV1ZSBUUkIgcG9pbnRlcnMuIEJ1
dCB0aGlzIGlkZWEgc3RpbGwgbmVlZHMgbW9yZSANCnRob3VnaHRzLg0KDQpCUiwNClRoaW5oDQoN
Cg==
