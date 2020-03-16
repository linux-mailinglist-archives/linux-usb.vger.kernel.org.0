Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 02EDF1860D3
	for <lists+linux-usb@lfdr.de>; Mon, 16 Mar 2020 01:34:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729291AbgCPAep (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 15 Mar 2020 20:34:45 -0400
Received: from smtprelay-out1.synopsys.com ([149.117.73.133]:59616 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729228AbgCPAep (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 15 Mar 2020 20:34:45 -0400
Received: from mailhost.synopsys.com (badc-mailhost2.synopsys.com [10.192.0.18])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 67065403C0;
        Mon, 16 Mar 2020 00:34:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1584318884; bh=eFNtwf1nElxUjw4XuZF4OCOP2libHPowxTs41evzeCM=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=QU6b8lyFm2Fxihks0fSokraxtG5pqESAktxo/2CTqKoIrErJuGX2ulaAkeXMV7e62
         o8CNoyfoWbOpscbZNFKR9eeWmK/Io2WfeTahp1hqUD/UeXij3lglejS8qSdtJccbM0
         HbmPx3Ct1pO6YrDOLnYtYwACkPGEOZAj9sND1nImRKkAnkj9F4jOpL3E9HOjXcJ2jB
         PvHs34nnIUoMANy+XfNtSiApfIm4ppOMC7R0PRE5q3PlffyCLJBMK0LzUHsr1JwVRS
         TgIO/XFmFHDB3McqZ/KCgL8tGtPgr3G4HV7+rje6i/7tMyCW4c44cURQFSy7uQMyK+
         VfV9GM7PBiO9Q==
Received: from US01WEHTC3.internal.synopsys.com (us01wehtc3.internal.synopsys.com [10.15.84.232])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPS id 094B3A006B;
        Mon, 16 Mar 2020 00:34:44 +0000 (UTC)
Received: from US01HYBRID2.internal.synopsys.com (10.15.246.24) by
 US01WEHTC3.internal.synopsys.com (10.15.84.232) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Sun, 15 Mar 2020 17:34:44 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (10.202.3.67) by
 mrs.synopsys.com (10.15.246.24) with Microsoft SMTP Server (TLS) id
 14.3.408.0; Sun, 15 Mar 2020 17:34:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Updteezi/EUfY/v/g1BfA7IPFsa1qq7qwXjXHF9RETAw/4174Vrz0YBLb//B8b/5N7AJKycQtyyozLBno0XiuBQ+lSy4ZiPavECe1n5DRW9gNdALEVUuo9kO0o22HjlrJYI//Fy3PU6xFLpTjstQJyIebO3X/RTILPRj8Kx/Pq/UPm7dydFMy6QQZ8Rj4dGeZq3/m+gSSwTyhmLiZIGn+oRMB3yPLtlBT5nLYH6kEWNGNKR1yhsU0UBlc/7NG8TbZQFqXAe9bTPZ4oauE/2clPvn36xg3lE3rBhKvhevxBakTNb5wSgz3MEpKvzF8Z4POLxT/2vxhBCAIr13hfsB5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eFNtwf1nElxUjw4XuZF4OCOP2libHPowxTs41evzeCM=;
 b=fNcJe09YnsAB0j+UIIaDKrdt/NViE6zJTo/nFwq2Mb4xq8CqvwadRd0Ysz6rdZzhslYzmJz8ANd0co8fu3MjgCFQ+FnShChL2tpo8ocfJ3vLyWJmfSVlGRUwLOUqhVWce5e8+ZoisNzflzpsdrILH+dmNvaqycKfFwL0dudn4/V1Gup8GW9h2ijK+635K3q8XlBc/B1dBbxfIPm/0qh3PgqZG8BDyJNyVheJhl4tE/8G2VxWVedoDA44W/vyJmiULK9M7DWd8CZRdn9fTjP70A2iotOpowkeia5s9XcetA6khYJtl8pvpxsw0/TCaUUz3kA62GZxUT3zXRZ5AOkNUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eFNtwf1nElxUjw4XuZF4OCOP2libHPowxTs41evzeCM=;
 b=pShxLxiq6B0RI6e+/D6DQ5FRFTF6/b5WRIa5xZiunh/9Qx4BNgSJMEKSxYWEr+HKhP4+ZCv8m+bNBUH8J9KDJY7LRebwUycCiiJK0hB5OILgErPNHsfmQC7I3lhZbq7ylRptEWHkF856SpREeoffpBKJ//PxyNsIc05fPPtF+Ag=
Received: from BYAPR12MB2710.namprd12.prod.outlook.com (2603:10b6:a03:68::11)
 by BYAPR12MB2807.namprd12.prod.outlook.com (2603:10b6:a03:6d::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2814.19; Mon, 16 Mar
 2020 00:34:42 +0000
Received: from BYAPR12MB2710.namprd12.prod.outlook.com
 ([fe80::e5d1:8cdd:a09d:7a08]) by BYAPR12MB2710.namprd12.prod.outlook.com
 ([fe80::e5d1:8cdd:a09d:7a08%7]) with mapi id 15.20.2814.021; Mon, 16 Mar 2020
 00:34:42 +0000
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To:     Felipe Balbi <balbi@kernel.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
CC:     John Youn <John.Youn@synopsys.com>
Subject: Re: [PATCH 2/6] usb: dwc3: gadget: Properly handle ClearFeature(halt)
Thread-Topic: [PATCH 2/6] usb: dwc3: gadget: Properly handle
 ClearFeature(halt)
Thread-Index: AQHV8zRtfKN5PAxEHE+SwE9AqfOLuqhJb9kAgAD/GoA=
Date:   Mon, 16 Mar 2020 00:34:42 +0000
Message-ID: <2edccc70-5fab-4227-3d27-a06140523d62@synopsys.com>
References: <cover.1583443184.git.thinhn@synopsys.com>
 <4f9b6acbff2cd0be417fd4a943c1975bf41f8fda.1583443184.git.thinhn@synopsys.com>
 <87a74iezx9.fsf@kernel.org>
In-Reply-To: <87a74iezx9.fsf@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=thinhn@synopsys.com; 
x-originating-ip: [149.117.75.11]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7e028948-adc8-4edb-a59d-08d7c941d1cd
x-ms-traffictypediagnostic: BYAPR12MB2807:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR12MB28072CBC4B7EC1EDBABB1FECAAF90@BYAPR12MB2807.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-forefront-prvs: 03449D5DD1
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(366004)(39850400004)(376002)(346002)(396003)(136003)(199004)(86362001)(316002)(66946007)(66446008)(64756008)(66556008)(66476007)(110136005)(31686004)(76116006)(8676002)(36756003)(81166006)(71200400001)(4744005)(8936002)(81156014)(6506007)(2906002)(6512007)(6486002)(4326008)(107886003)(186003)(26005)(2616005)(478600001)(31696002)(5660300002);DIR:OUT;SFP:1102;SCL:1;SRVR:BYAPR12MB2807;H:BYAPR12MB2710.namprd12.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;
received-spf: None (protection.outlook.com: synopsys.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 9VeNX75eGJ1sMLk5YkypAWBGLwegyZpBAbBn8OU5Zb/2gWmMdYB/BbkUTkHWJi6+pN1FXYX3DLIuTuUTGiP+NNREDocbn3KqlG3/g4irG9/we/n3QdsjN76nV1Ty7sJ677t7vdskUuJsWOgf9Zf9AgGb4WErzPJ6qwAp8hOGrLznwBf71WDyJowPMfu9r3mqYPywPsWpR8w1T1GFMAa1tA+t77PpG/+9Uv69QNr7GYpiCByaQbfuz/s4fgPx6JYMhbVExgG4LzjoAUleZmHS8kJJsl913S+R3iO0YgIjVEyG1d4yAYR9u9VAHLusJ4D/eO2Zp8pvAvOj3VtJMBer7NpeBbMGza/4kJVKNMWQGgbIUm5JiaPBnCI6Q9kJgktcw2tbIS1xT0Z6HrJl1TYTjiHLvh3B3GbvHBnIiGIiJ8COXHVH3aR5gb/0ypKYkSlA
x-ms-exchange-antispam-messagedata: gyPoQeKOhSpGdc8/pG801/IblnjpLrjasteFzc7icqw1t/XbBm6rFtv5cb3Tte61bEs8gbFau4P4It55y5k4G+IKxLZBH72BTR7BaiXSrSICAi/65a6tumeCDzj00qjhzSvoiLpW1UgIfYsgFI0pzA==
Content-Type: text/plain; charset="utf-8"
Content-ID: <C7CC7ED4ABF4C045AA974DC1581074DE@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e028948-adc8-4edb-a59d-08d7c941d1cd
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Mar 2020 00:34:42.3938
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tGzEnQhm0VS+DYzw/Bp0VszoDQ0tYQ7VLObnEhAg76ACKFNAq7ehvAgF9Wz6iqwgS1rr6aeN4/wLfubIKL5LRQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB2807
X-OriginatorOrg: synopsys.com
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

SGksDQoNCkZlbGlwZSBCYWxiaSB3cm90ZToNCj4gSGksDQo+DQo+IFRoaW5oIE5ndXllbiA8VGhp
bmguTmd1eWVuQHN5bm9wc3lzLmNvbT4gd3JpdGVzOg0KPj4gQEAgLTE2MjcsMTMgKzE2MzMsMzcg
QEAgaW50IF9fZHdjM19nYWRnZXRfZXBfc2V0X2hhbHQoc3RydWN0IGR3YzNfZXAgKmRlcCwgaW50
IHZhbHVlLCBpbnQgcHJvdG9jb2wpDQo+PiAgIAkJZWxzZQ0KPj4gICAJCQlkZXAtPmZsYWdzIHw9
IERXQzNfRVBfU1RBTEw7DQo+PiAgIAl9IGVsc2Ugew0KPj4gKwkJLyoNCj4+ICsJCSAqIERvbid0
IGlzc3VlIENMRUFSX1NUQUxMIGNvbW1hbmQgdG8gY29udHJvbCBlbmRwb2ludHMuIFRoZQ0KPj4g
KwkJICogY29udHJvbGxlciBhdXRvbWF0aWNhbGx5IGNsZWFycyB0aGUgU1RBTEwgd2hlbiBpdCBy
ZWNlaXZlcw0KPj4gKwkJICogdGhlIFNFVFVQIHRva2VuLg0KPj4gKwkJICovDQo+IHdlIGhhdmUg
YSBzZXBhcmF0ZSBkd2MzX2dhZGdldF9lcDBfc2V0X2hhbHQoKSB0byBoYW5kbGUgdGhhdC4gSG93
IHdhcw0KPiB0aGlzIHRyaWdnZXJlZD8NCj4NCg0KSSB0aGluayBpdCdzIGEgYml0IGNvbmZ1c2lu
ZyBoZXJlIHRoYXQgdGhlIGR3YzNfZ2FkZ2V0X2VwMF9zZXRfaGFsdCgpIA0KaGFzIHRoZSBzaW1p
bGFyIG5hbWUgYXMgX19kd2MzX2dhZGdldF9lcF9zZXRfaGFsdCgpLiBIb3dldmVyLCB0aGF0IA0K
ZnVuY3Rpb24gb25seSBjYWxscyBkd2MzX2VwMF9zdGFsbF9hbmRfcmVzdGFydCgpIGFuZCBub3Qg
aGFuZGxlZCB0aHJvdWdoIA0KU0VUL0NMRUFSX0ZFQVRVUkUoaGFsdCkgcmVxdWVzdC4NCg0KSWYg
aG9zdCBpc3N1ZXMgU0VUX0ZFQVRVUkUoaGFsdCkgb3IgQ0xFQVJfRkVBVFVSRShoYWx0KSB0byBj
b250cm9sIA0KZW5kcG9pbnRzLCBpdCBzdGlsbCBnb2VzIHRocm91Z2ggX19kd2MzX2dhZGdldF9l
cF9zZXRfaGFsdCgpLg0KDQpCUiwNClRoaW5oDQo=
