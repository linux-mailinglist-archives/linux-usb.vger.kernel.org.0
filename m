Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DBF1B25E4C4
	for <lists+linux-usb@lfdr.de>; Sat,  5 Sep 2020 02:54:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726329AbgIEAyE (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 4 Sep 2020 20:54:04 -0400
Received: from smtprelay-out1.synopsys.com ([149.117.87.133]:49672 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726208AbgIEAyC (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 4 Sep 2020 20:54:02 -0400
Received: from mailhost.synopsys.com (sv2-mailhost1.synopsys.com [10.205.2.133])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id ABC6DC03BD;
        Sat,  5 Sep 2020 00:53:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1599267241; bh=sh5K97v7a1+7SAdKGf4LqvocboQYVTUcLqhLzmlRx8w=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=JzrKHx27EN8DXp9hUS6gfh/9ypa6gVsE/xHjcInq1aFEaiY6y5MHsV8SFkKsG+uyi
         His8M6wDmIb7FXsMcXVfne9pXmeVPLFaqHTMnqPSGYChMKIjCIjlXEVB4CZC7aBnqq
         1PW5QS+s7Gr9ATtSGEwJdjAez8kaAxO/rfItfTQbbk/H96eVPybd1Wl2lPu4PRrNgI
         jxZ5VFAy0Ov0SfXQs+hOZnC7LtCzla141gX5FgyM457KshADmsIZFEx8xSHi6tcfhy
         gEtzyn3Fzh4CQ4cPRQg/ntEG6XUX1J1lkbh4ncHGtXVBOegWG1haLZB19x3Y1mqpC9
         OQ//HDMka3HIQ==
Received: from o365relay-in.synopsys.com (us03-o365relay3.synopsys.com [10.4.161.139])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPS id 1A3FAA007C;
        Sat,  5 Sep 2020 00:53:58 +0000 (UTC)
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2101.outbound.protection.outlook.com [104.47.70.101])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client CN "mail.protection.outlook.com", Issuer "GlobalSign Organization Validation CA - SHA256 - G3" (verified OK))
        by o365relay-in.synopsys.com (Postfix) with ESMTPS id 8308680F76;
        Sat,  5 Sep 2020 00:53:56 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=thinhn@synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
        dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="UEiwKiNo";
        dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OzgZv0PSkAgBIuzVpw2LFPlo4dCK8AWAg7QRFApnQodHec7HdB3nx2WGGgx5z0UHz5h9tfxfl5qsvdGo56wh84t2uvw0150n6uTrn4QJ5wdIgLx0lnlDIHd4NQ7c9oliuSYUnk26imwhuwB6BeqWLULdFHI3+LSklRLJobE7oQOFGaCoDytzj8uZx0XIk55x9mx3lDqzJOKWBXMch25L8GyG0GoLo44FdvAjdvFwpT/hIFogv68f8mnmp8ma383nxxAiFy8fBJZ2SWXxiarN4hURJGsFLWRyXpfGPWTw08ugAo9kaxqSrBRt4nkHHZ8J//fhjNCCBux00R0OPHgcpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sh5K97v7a1+7SAdKGf4LqvocboQYVTUcLqhLzmlRx8w=;
 b=Mi84QBpf/ppX8CdmKilln8LsIbZmg4udLnAFMdWLwHKzQtdiazPIBuAV2BiR2rySr0ixME67lWBWoB9GMOGqP22JwgeAoh4RxKiOeKNhs4LbFmNurvQLFvdLXqzLaJWXYnsTB0W+Xl6xj2CAx3tH3swI2Mz0uQyXZCClpTkK+u8LuiRmNkO02Hmhvqj3ViwhkzrahAfcjmFZPLjRJl4O8EKQVXIs2CFOCMlET59Z04QX730DzjH9yBxbRWRLNO2wbtf6iZTOkzoAMu9/ATg5F2vk1cDz/A5W4wgFQOJYUt4JLpOQmfp3fggOSBJO0bF1G0jMij5je7L3zSZXE7pqdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sh5K97v7a1+7SAdKGf4LqvocboQYVTUcLqhLzmlRx8w=;
 b=UEiwKiNoMg4IiFKcmnC/jeWCIq46ykPSfllYVb/oqg7pfelIb5tCbvz9r4UtIflQJtvWf3dt0iAk1FAdzVjka9dTCYMDbh6syG54+a5Y6xBO01baoP7uS5Tws2b+GbkAAlTCsA0evpb5Km6q+ZoEvRpcc/2Ri34ThQ+27VHE2Cw=
Received: from BYAPR12MB2917.namprd12.prod.outlook.com (2603:10b6:a03:130::14)
 by BYAPR12MB3128.namprd12.prod.outlook.com (2603:10b6:a03:dd::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3348.15; Sat, 5 Sep
 2020 00:53:53 +0000
Received: from BYAPR12MB2917.namprd12.prod.outlook.com
 ([fe80::c98f:a13f:fd88:c209]) by BYAPR12MB2917.namprd12.prod.outlook.com
 ([fe80::c98f:a13f:fd88:c209%7]) with mapi id 15.20.3348.017; Sat, 5 Sep 2020
 00:53:53 +0000
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Peter Chen <peter.chen@nxp.com>,
        Lee Jones <lee.jones@linaro.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        Dejin Zheng <zhengdejin5@gmail.com>,
        Roger Quadros <rogerq@ti.com>
CC:     John Youn <John.Youn@synopsys.com>
Subject: Re: [PATCH v4 00/12] usb: Handle different sublink speeds
Thread-Topic: [PATCH v4 00/12] usb: Handle different sublink speeds
Thread-Index: AQHWYu0bG+7yKi1QUUSp6do7wrlrcKlZeDEA
Date:   Sat, 5 Sep 2020 00:53:53 +0000
Message-ID: <dac6241b-bf6b-effd-1618-5909969611a6@synopsys.com>
References: <cover.1595727196.git.thinhn@synopsys.com>
In-Reply-To: <cover.1595727196.git.thinhn@synopsys.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=synopsys.com;
x-originating-ip: [98.248.94.126]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0c50bee2-a5db-46b3-5f85-08d851362967
x-ms-traffictypediagnostic: BYAPR12MB3128:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR12MB312853A9ED377F7777AD7AEBAA2A0@BYAPR12MB3128.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2657;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: cIEP/qVxBTcuOZBRCtvsCm/8R9B9sc/nXop8PJJEJk12dHjn8mnyAJvTSABvCVuOR9YCcMILr4hlliUdYtKSKmOEBKYvPCZRuJEwvM3xYLdlz3Lvs0wDqJVALqyrbRdldPhxgT1RQtcGJC4sCKHedXGS72gxkiZasdgdVR/xk7mIeHprPDr0YqnYqbUGP0uxPpjNDpXKs0rVrA+xaafLfkv393KUWAd9yMDOoVFxWtWO1o07YGFgzWtTGhsGiBaMqkDugovKZGShCf6QiyFdbiY2yEiBX3bgCWmUniMkedadTpa8uwdiBH5TyJznbAF7cWM1ASgVgBH4Oqi4owQOVc5Rf2JjQ7tMhdcM1wSotkg2S9MR5i57p4cqSABCA/3r+b+ddcspeJGnXtWhksm7gA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB2917.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(39860400002)(396003)(136003)(376002)(346002)(2906002)(66476007)(76116006)(66446008)(71200400001)(6512007)(31686004)(5660300002)(64756008)(66946007)(7416002)(8676002)(66556008)(4326008)(26005)(110136005)(6506007)(83380400001)(316002)(186003)(86362001)(8936002)(107886003)(36756003)(478600001)(6486002)(31696002)(2616005)(921003)(43740500002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: AxpJqHeBNs20/L8k2wock3mThkcilxdaBd74z/YzyqOWkM2XxRbsUvEdIOAJCNmOMLsCLdUXM5x88t6GudxotVZqGROu+Cn674l/JlGdTKTCuxTDZAXRtr8ThQil1MEc1smuST1LKbo4XwsE2KhA973wbSYjC4XF6sB82uBpkX60JDHlWTwVxEwf7dJUVB58poYPa96Ig9yjUnrNi8yQFl8THW5Z9xtrwmP4SeglJ1DX/2BsNXofno4A60ikBfgkVAqzibDNRuDSWQOR/mlhRwPL3p9g1NFeFyLQHW7hp3vl2wFlGz/zlnq5seGT1i7lK7vIAafoor6xYXjQTKqJPPFgkOobUgVtHjFhZmWWXp572p7kOLYU31u+wqVzP2eRO3d4sENOD8Hp2Vgz4NQ3M+pnIBg+0yCqrUmuk/rLpuubgEZM/bYL5NZrcIedFKoxZ8n4LHt15npQ6dFavS6iR8vTReROM/gl7UpL4spJm/3FhDblD46hGdRfZAQbHIS6ru40zpcOjoSVo6OaCKY+wtd1tlNzGg0Zytj2CK8PCp1CP4IJAqIPxxPc42m7j/UP6Bqdt8T7oesY6LOmgyHz4C3Ax86h+DbVNFTgYydbBgUhKVJ3+BLCb+7HKQe8v27NBS6HWqzvjIdlqM/g/RruRA==
Content-Type: text/plain; charset="utf-8"
Content-ID: <D6FABA2177964B489A2113F60AB6816F@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB2917.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c50bee2-a5db-46b3-5f85-08d851362967
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Sep 2020 00:53:53.5520
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9/zVHoGQhtJs+XuSmk01UwqdV5R3Q2A5189nrMMwnt9gEVXSQz+IJ3q/fOVxUIt3cs72ECgpnhM54WrKCdqbTQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3128
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

SGkgYWxsLA0KDQpUaGluaCBOZ3V5ZW4gd3JvdGU6DQo+IEEgVVNCIHN1cGVyLXNwZWVkLXBsdXMg
ZGV2aWNlIG1heSBvcGVyYXRlIGF0IGRpZmZlcmVudCBzdWJsaW5rIHNwZWVkIGFuZCBsYW5lDQo+
IGNvdW50IChlLmcuIGdlbjJ4MiwgZ2VuMXgyLCBvciBnZW4yeDEpLiBUaGUgdXNiIGdhZGdldCBz
dGFjayBuZWVkcyB0byBiZSBhYmxlDQo+IHRvIGhhbmRsZSBhIGNvdXBsZSB0aGluZ3M6DQo+DQo+
IDEpIFJlcG9ydCB0aGUgc3VibGluayBzcGVlZCBhdHRyaWJ1dGVzIHRoZSBkZXZpY2Ugc3VwcG9y
dA0KPiAyKSBTZWxlY3QgdGhlIHN1Ymxpbmsgc3BlZWQgYXR0cmlidXRlDQo+DQo+IFRoaXMgc2Vy
aWVzIGludHJvZHVjZXMgc3VibGluayBzcGVlZCBhdHRyaWJ1dGUgc3RydWN0dXJlIHRvIGNoOS5o
IHRvIGNhcHR1cmUNCj4gdGhlIGRldmljZSBjYXBhYmlsaXR5IG9mIHRoZSBnYWRnZXQuIEl0IGFs
c28gaW50cm9kdWNlcyBhIG5ldyBnYWRnZXQgb3BzDQo+IHVkY19zZXRfbnVtX2xhbmVzX2FuZF9z
cGVlZCB0byBzZWxlY3QgYSBzcGVjaWZpYyBzdWJsaW5rIHNwZWVkLg0KPg0KPiBEV0MzIG5lZWRz
IHRoaXMgc3VwcG9ydCBmb3IgRFdDX3VzYjMyIElQLiBJbXBsZW1lbnQgdGhlIG5ldyBjaGFuZ2Vz
IGZvciBEV0MzLg0KPg0KPiBDaGFuZ2VzIGluIHY0Og0KPiAgLSBJbnN0ZWFkIG9mIHVzaW5nIGEg
c2luZ2xlIGZ1bmN0aW9uIHRvIHBhcnNlICJtYXhpbXVtLXNwZWVkIiBwcm9wZXJ0eSBmb3INCj4g
ICAgc3BlZWQsIGdlbiBYLCBhbmQgbnVtYmVyIG9mIGxhbmVzLCBzcGxpdCB0aG9zZSB0YXNrcyB0
byBzZXBhcmF0ZSBjb21tb24NCj4gICAgZnVuY3Rpb25zDQo+ICAtIFJldmlzZSBEV0MzIGRyaXZl
ciB0byB1c2UgdGhvc2UgbmV3IGNvbW1vbiBmdW5jdGlvbnMNCj4gIC0gRml4IGNoZWNrcGF0Y2gg
d2FybmluZ3MgZm9yIHVzaW5nICJ1bnNpZ25lZCIgcmF0aGVyIHRoYW4gInVuc2lnbmVkIGludCIg
YW5kDQo+ICAgIG1pc3NpbmcgaWRlbnRpZmllciBuYW1lIGluIHVkY19zZXRfbnVtX2xhbmVzX2Fu
ZF9zcGVlZCBnYWRnZXQgb3BzDQo+DQo+IENoYW5nZXMgaW4gdjM6DQo+ICAtIFJlbW92ZSAibnVt
LWxhbmVzIiBhbmQgImxhbmUtc3BlZWQtbWFudGlzc2EtZ2JwcyIgY29tbW9uIHByb3BlcnRpZXMN
Cj4gIC0gUmVtb3ZlICJudW0tbGFuZXMiIGFuZCAibGFuZS1zcGVlZC1tYW50aXNzYS1nYnBzIiBw
cm9wZXJ0aWVzIHZhbGlkYXRpb24gaW4gZHdjMw0KPiAgLSBVcGRhdGUgIm1heGltdW0tc3BlZWQi
IHRvIHN1cHBvcnQgdmFyaWF0aW9ucyBvZiBTU1AgR2VuIFggeCBZDQo+ICAtIFVwZGF0ZSBjb21t
b24gZnVuY3Rpb24gdG8gcGFyc2UgbmV3IHN0cmluZ3MgZm9yICJtYXhpbXVtLXNwZWVkIg0KPiAg
LSBVcGRhdGUgY29tbWl0IG1lc3NhZ2VzIGZvciB0aGUgbmV3IGNoYW5nZXMNCj4NCj4gQ2hhbmdl
cyBpbiB2MjoNCj4gIC0gTW92ZSB1c2Jfc3VibGlua19zcGVlZCBhdHRyaWJ1dGUgc3RydWN0IGFu
ZCBlbnVtIHRvIGluY2x1ZGUvbGludXgvdXNiL2NoOS5oDQo+ICAtIFVzZSAibnVtLWxhbmVzIiBh
bmQgImxhbmUtc3BlZWQtbWFudGlzc2EtZ2JwcyIgYXMgY29tbW9uIHByb3BlcnRpZXMgaW5zdGVh
ZA0KPiAgLSBBZGQgY29tbW9uIGZ1bmN0aW9ucyB0byBnZXQgbnVtLWxhbmVzIGFuZCBsc20gcHJv
cGVydGllcw0KPiAgLSBGaXggbWlzc2luZyBnZW4xeDIgc3VibGluayBzcGVlZCBhdHRyaWJ1dGUg
Y2hlY2sgcmVwb3J0IGluIGR3YzMNCj4NCj4NCj4gVGhpbmggTmd1eWVuICgxMik6DQo+ICAgdXNi
OiBjaDk6IEFkZCBzdWJsaW5rIHNwZWVkIHN0cnVjdA0KPiAgIHVzYjogZ2FkZ2V0OiBjb21wb3Np
dGU6IEF2b2lkIHVzaW5nIG1hZ2ljIG51bWJlcnMNCj4gICB1c2I6IGdhZGdldDogRXhwb3NlIHN1
Ymxpbmsgc3BlZWQgYXR0cmlidXRlcw0KPiAgIHVzYjogZ2FkZ2V0OiBTZXQgbWF4IHNwZWVkIGZv
ciBTU1AgZGV2aWNlcw0KPiAgIHVzYjogY29tcG9zaXRlOiBQcm9wZXJseSByZXBvcnQgc3VibGlu
ayBzcGVlZA0KPiAgIHVzYjogZGV2aWNldHJlZTogSW5jbHVkZSBVU0IgU1NQIEdlbiBYIHggWQ0K
PiAgIHVzYjogY29tbW9uOiBBZGQgYW5kIHVwZGF0ZSBjb21tb24gZnVuY3Rpb25zIGZvciBTU1Ag
c3BlZWRzDQo+ICAgdXNiOiBkd2MzOiBJbml0aWFsaXplIGxhbmUgY291bnQgYW5kIHN1Ymxpbmsg
c3BlZWQNCj4gICB1c2I6IGR3YzM6IGdhZGdldDogUmVwb3J0IHN1Ymxpbmsgc3BlZWQgY2FwYWJp
bGl0eQ0KPiAgIHVzYjogZHdjMzogZ2FkZ2V0OiBJbXBsZW1lbnQgc2V0dGluZyBvZiBzdWJsaW5r
IHNwZWVkDQo+ICAgdXNiOiBkd2MzOiBnYWRnZXQ6IFRyYWNrIGNvbm5lY3RlZCBsYW5lIGFuZCBz
dWJsaW5rIHNwZWVkDQo+ICAgdXNiOiBkd2MzOiBnYWRnZXQ6IFNldCBzcGVlZCBvbmx5IHVwIHRv
IHRoZSBtYXggc3VwcG9ydGVkDQo+DQo+ICBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGlu
Z3MvdXNiL2dlbmVyaWMudHh0IHwgIDExICstDQo+ICBkcml2ZXJzL3VzYi9jb21tb24vY29tbW9u
LmMgICAgICAgICAgICAgICAgICAgICAgIHwgIDQ2ICsrKysrKy0NCj4gIGRyaXZlcnMvdXNiL2R3
YzMvY29yZS5jICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgMjkgKysrKysNCj4gIGRyaXZl
cnMvdXNiL2R3YzMvY29yZS5oICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgMTQgKysrDQo+
ICBkcml2ZXJzL3VzYi9kd2MzL2dhZGdldC5jICAgICAgICAgICAgICAgICAgICAgICAgIHwgMTQz
ICsrKysrKysrKysrKysrKysrKysrKy0NCj4gIGRyaXZlcnMvdXNiL2dhZGdldC9jb21wb3NpdGUu
YyAgICAgICAgICAgICAgICAgICAgfCAgODEgKysrKysrKystLS0tDQo+ICBkcml2ZXJzL3VzYi9n
YWRnZXQvdWRjL2NvcmUuYyAgICAgICAgICAgICAgICAgICAgIHwgIDI0ICsrKy0NCj4gIGluY2x1
ZGUvbGludXgvdXNiL2NoOS5oICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgNzMgKysrKysr
KysrKysNCj4gIGluY2x1ZGUvbGludXgvdXNiL2dhZGdldC5oICAgICAgICAgICAgICAgICAgICAg
ICAgfCAgMjMgKysrKw0KPiAgOSBmaWxlcyBjaGFuZ2VkLCA0MDMgaW5zZXJ0aW9ucygrKSwgNDEg
ZGVsZXRpb25zKC0pDQo+DQo+DQo+IGJhc2UtY29tbWl0OiBhMWZmMmY2NzY5ZTM5MDU1ZTk3M2Iw
NjgwNzBhZWVhMGIzYmNkOTBmDQoNCkdlbnRsZSBwaW5nLi4uDQoNCkxldCBtZSBrbm93IGlmIHlv
dSBoYXZlIGFueSBjb25jZXJuIGZvciBhbnkgb2YgdGhlIHBhdGNoIGluIHRoaXMgc2VyaWVzLg0K
DQpUaGFua3MsDQpUaGluaA0K
