Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3C90A29465F
	for <lists+linux-usb@lfdr.de>; Wed, 21 Oct 2020 03:56:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2439907AbgJUB4T (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 20 Oct 2020 21:56:19 -0400
Received: from smtprelay-out1.synopsys.com ([149.117.87.133]:34754 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2439904AbgJUB4R (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 20 Oct 2020 21:56:17 -0400
Received: from mailhost.synopsys.com (sv2-mailhost2.synopsys.com [10.205.2.134])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id F0685C0340;
        Wed, 21 Oct 2020 01:56:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1603245377; bh=j9fos0EnPAvCh+4mFCravb022vhdVulGVzd5CsHs8Mg=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=YrVtiZmJH6WhmE+zcbm4lBj0KlUFtRGEt3it9u/ysJLldt4aopcpdaFKcp+AKWrCO
         G7IOmIgp6ZKMwg9/mlaZMSrh5whl0tCbu2+0yf2fdXo/Q5mrWtWQdOtitUf9PnvbDq
         saEn6NHnUyJOh9FfO8pz7KlUuBOJilJ3Q2LtpRWHhuv8T/fc8WfQh/DdXtZLSrg5pa
         p3ZKoSbU1sU1ldNtYkgA7INMkwhLXymf3s58HbriS6LloJOJ4aP1v4XyT8BJq8/8Js
         UAKQK6/IM1hxNHq5ucExSzO2BGgmWlUWnHdKIy9FmApDUkJNtMW/SaTCZfz0n1go5r
         V0uNWeW2kOnSQ==
Received: from o365relay-in.synopsys.com (us03-o365relay1.synopsys.com [10.4.161.137])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPS id 7E8A8A009C;
        Wed, 21 Oct 2020 01:56:16 +0000 (UTC)
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2169.outbound.protection.outlook.com [104.47.59.169])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client CN "mail.protection.outlook.com", Issuer "GlobalSign Organization Validation CA - SHA256 - G3" (verified OK))
        by o365relay-in.synopsys.com (Postfix) with ESMTPS id B3D79800C9;
        Wed, 21 Oct 2020 01:56:15 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=thinhn@synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
        dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="Xtc5vDWW";
        dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KY8C3oDP5GUTCbgPFslwk/odg6HHKk9BQu7jXNvPECbezz4yZs+p0hgHTnI506/Fazej624h/6byVzLbj/byZ1mQUF47tHM3VcAzUNnUEddAW7nzpmZI37j75mwILlJpQZ9e+vllweZygj2o0GtoQYl4x/ljBeX52p8/IkWHRpm8GN4sX7sE/IKlROBWYxTqXpZz6yxMIWvHYljv0OVWhIzZufLaqKj11+gNhvMOKo87ZjVuZuQdE4eox5xFVA7fwDfzLZSG+S/fk+Vu52CIh0zT3woihnAZV2iXvvjLbLavd+1shqus827Rto7Cf+y0Ko6Oxni5Eq4H2UKzRxeLFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j9fos0EnPAvCh+4mFCravb022vhdVulGVzd5CsHs8Mg=;
 b=iAN15FAheXMopgH4ZvEvXFIMfBiV9kVAbDS0nx8dJ1iHlRQEhRK8cvvsXqYC5UCDndJdhMW0Fy2AY/ZlB64za3nzNpCL2/aXSB4lueLMDJfQT6ucADBmAH0CHZ37Ftcbv5cTC+KcrrVVOPpSkhVhD3znpt1VByGzf/CyUkA4baDmlvdE+XSIqhi6wYjwMaRoG4xtPsUP0fRnrD72LjnYMGQLr780fUG7xAd5Ruf5u93aiSom0Zz7jcsNFqEEV+jo++AGh+tFNZV7/dD+0cVjvyANkLnEgWns18LS11hE2BOipgmYoGCzGDBUu360hXSgkZHGOvUIIble/bk2Rmy3iw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j9fos0EnPAvCh+4mFCravb022vhdVulGVzd5CsHs8Mg=;
 b=Xtc5vDWWVlcayttb6iYoHJh0jOx0zljw6sk74cAsRuHmKBTAYSixlDhpLw5AbmU8xh7bI22F8Hbh6I9hydLoTZeqHRTwAoPVCziwh0Fi/FpUJzZEEA0B7OtvqR7WkMTS/T+ZARwPB9HVcuupUKfsv0rH+OgiMmNt0KufgVcrCME=
Received: from BYAPR12MB2917.namprd12.prod.outlook.com (2603:10b6:a03:130::14)
 by BYAPR12MB3061.namprd12.prod.outlook.com (2603:10b6:a03:a8::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.20; Wed, 21 Oct
 2020 01:56:11 +0000
Received: from BYAPR12MB2917.namprd12.prod.outlook.com
 ([fe80::c17e:c3dd:7cda:e2dc]) by BYAPR12MB2917.namprd12.prod.outlook.com
 ([fe80::c17e:c3dd:7cda:e2dc%4]) with mapi id 15.20.3477.028; Wed, 21 Oct 2020
 01:56:11 +0000
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To:     Jack Pham <jackp@codeaurora.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>
CC:     Ferry Toth <fntoth@gmail.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "felipe.balbi-VuQAYsv1563Yd54FQh9/CA@public.gmane.org" 
        <felipe.balbi-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Subject: Re: BUG with linux 5.9.0 with dwc3 in gadget mode
Thread-Topic: BUG with linux 5.9.0 with dwc3 in gadget mode
Thread-Index: AQHWo/slg1BGy5aFnEWs2vXEMG8U96mebg0AgAAaCYCAAeoFAIAAh4qAgAAZ9ACAAA2AgIAALzCAgAACcgA=
Date:   Wed, 21 Oct 2020 01:56:11 +0000
Message-ID: <3fee07f4-7950-c281-670b-bbc8f0426a8e@synopsys.com>
References: <913dccca-500d-1938-b199-6eb67cfb60cc@gmail.com>
 <87a6wig461.fsf@kernel.org> <a565dc52-27ab-f5be-4fee-5a8f96d66456@gmail.com>
 <874kmpf583.fsf@kernel.org> <d0aca346-353c-d74e-6f00-ccd2a4ed26ef@gmail.com>
 <976cea12-e54e-fbca-6c53-e6ef5c554094@synopsys.com>
 <645b6ddc-d4f5-3f5b-b85f-b3d27fc365f5@synopsys.com>
 <20201021014725.GA26640@jackp-linux.qualcomm.com>
In-Reply-To: <20201021014725.GA26640@jackp-linux.qualcomm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.1
authentication-results: codeaurora.org; dkim=none (message not signed)
 header.d=none;codeaurora.org; dmarc=none action=none
 header.from=synopsys.com;
x-originating-ip: [98.248.94.126]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a3832894-ab48-40b8-e575-08d875647c10
x-ms-traffictypediagnostic: BYAPR12MB3061:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR12MB3061DD970BB22D7581EEC24FAA1C0@BYAPR12MB3061.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: cdJyuk0z5pDZLBkC3BaNA1vn4LAVNsmW95K0ylTnDsBs7+pb0RN4n72xmE6Q7VJ8beJBpafeGDWa8+SNRIs5qEXn1czVZyD85Rzxymel+VsKm43rYzych2ktIcwYltojyb4LzKS9jrBCd65CAQ3EKvBa1giVGbZS7O1m/5BxlUDi85eLWtDnUcdXjqrfqcbFxXcAGpbgOqXzSkgHtZm5V+pYV2Iu8Ho0KbXnNR8uLXuNOJDYdEskDG85+WWY/GtFJfAa9VqUJLIA6W6XGMZPs0cA7sbVR/P5deqrFafkr5L4WRmZ22y4oFngRN2CZ9tOeFuIwMRG6SO2bQwzZR0wo45q1zwBG8iwXKWUkfYYkTAilBpTpmfi1WSRQDfIvfvL
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB2917.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(366004)(136003)(39850400004)(376002)(396003)(8676002)(26005)(478600001)(66556008)(66476007)(54906003)(4326008)(6506007)(110136005)(6512007)(5660300002)(64756008)(71200400001)(2616005)(2906002)(36756003)(66446008)(316002)(76116006)(91956017)(31686004)(83380400001)(66946007)(8936002)(6486002)(186003)(86362001)(31696002)(43740500002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: u6rHCOJxX9W0eactF88s0YDU2QawHLk+z+XPFpHSF+1KtJ25wUSKH2XyyXzyTOdw3bEbYEAkq4awSF8mZLQibL2HFVTGQQF/PrVcif1volaKh1yFph6DaeSjC7u0QK2A1dOnqvuqkaWfU1krJgIUFcMVi/NHLj+bp3dDDRIqutLzttWWxqg420a+wMk1OA6DpxnjuR7uEYEFrlMyJOKlkjhGh2FTY4JfC3XVxdK0ir4zoHBLQERrzxPijlaWgDxT+yEVsPT6JQMxwN64dfTVRfs1xxb24Tr6y48FyqFEEpgl9lavysyuFDH4F+rJ/5vebNpRkHSjSb3RLf3BuAGR3nnx7N40/9DOqgpbr/Yfv+RowafnVRTG09oxGjLQxZsGi9GVjeZzSdnnhCB2ypWNE1fGZVF6cr1p8YQeZ+aBj6WR9t1EyCZkCRiJv1SG2a0DuvTSmpU40NMgt2SjsXR9tnDuzWRqk1F9v96C0D/EDY115wKS0+alFn4eXXx08nGuBaf0yTOnLdcbKpTFFWrC/erDuNfwV7aSxzEmU0jgQe83buAf6TOU+x+B3k3YWdzmXP4akPBnbiiI0U/F332ecczMJMDTid/eeOGXzhlX0Cg2/TAKVnrLKikXd44hiYvUldvPcjURreYewV3QL2utRA==
Content-Type: text/plain; charset="utf-8"
Content-ID: <3F0BA39617513B4F902861CB9D0F5CDB@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB2917.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a3832894-ab48-40b8-e575-08d875647c10
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Oct 2020 01:56:11.0287
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SM4EzOx7S8MEoZ90PN/5u2iPSTjm1aR+jQAzFYO/KfiWLhKU+Q6NwdHyF3niZWi/DzR2l1iM5SnHZTSASWZ4Tg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3061
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

SmFjayBQaGFtIHdyb3RlOg0KPiBIaSBUaGluaCwgRmVycnksDQo+DQo+IE9uIFR1ZSwgT2N0IDIw
LCAyMDIwIGF0IDEwOjU4OjMxUE0gKzAwMDAsIFRoaW5oIE5ndXllbiB3cm90ZToNCj4+IFRoaW5o
IE5ndXllbiB3cm90ZToNCj4+PiBIaSwNCj4+Pg0KPj4+IEZlcnJ5IFRvdGggd3JvdGU6DQo+Pj4+
IE9wIDIwLTEwLTIwMjAgb20gMTQ6MzIgc2NocmVlZiBGZWxpcGUgQmFsYmk6DQo+Pj4+PiBIaSwN
Cj4+Pj4+DQo+Pj4+PiBGZXJyeSBUb3RoIDxmbnRvdGhAZ21haWwuY29tPiB3cml0ZXM6DQo+Pj4+
Pg0KPj4+Pj4gODwgc25pcA0KPj4+Pj4NCj4+Pj4+Pj4+IFvCoMKgIDEyLjY1NzQxNl0gQ1IyOiAw
MDAwMDAwMTAwMDAwMDAwDQo+Pj4+Pj4+PiBbwqDCoCAxMi42NjA3MjldIC0tLVsgZW5kIHRyYWNl
IDliOTJkZWE2ZGEzM2M3MWUgXS0tLQ0KPj4+Pj4+PiBJdCB0aGlzIHNvbWV0aGluZyB5b3UgY2Fu
IHJlcHJvZHVjZSBvbiB5b3VyIGVuZD8gRmVycnksIGNhbiB5b3UgZ2V0DQo+Pj4+Pj4+IGR3YzMN
Cj4+Pj4+Pj4gdHJhY2UgbG9ncyB3aGVuIHRoaXMgaGFwcGVucz8gZnRyYWNlX2R1bXBfb25fb29w
cyBtYXkgaGVscCBoZXJlLg0KPj4+Pj4+IEkgd2lsbCBkbyB0aGF0IHRvbmlnaHQuIElzIGZsaXBw
aW5nIG9uIGZ0cmFjZV9kdW1wX29uX29vcHMNCj4+Pj4+PiBzdWZmaWNpZW50IG9yDQo+Pj4+Pj4g
ZG8gSSBuZWVkIHRvIGRvIG1vcmU/DQo+Pj4+PiB5b3UnZCBoYXZlIHRvIGVuYWJsZSBkd2MzIHRy
YWNlIGV2ZW50cyBmaXJzdCA7LSkNCj4+Pj4+DQo+Pj4+Pj4gQlRXIGFmdGVyIHBvc3RpbmcgdGhp
cyBJIGZvdW5kIGluIGhvc3QgbW9kZSBkd2MzIGlzIG5vdCB3b3JraW5nDQo+Pj4+Pj4gcHJvcGVy
bHkNCj4+Pj4+PiBlaXRoZXIuIE5vIG9vcHMsIGJ1dCBubyBkcml2ZXIgZ2V0IGxvYWRlZCBvbiBk
ZXZpY2UgcGx1ZyBpbi4NCj4+Pj4+IG9rYXkNCj4+Pj4+DQo+Pj4+IEVoZW0sIHlvdSBtYXliZSBv
bmx5IG1lIHRvIGVuYWJsZSAvZHdjMy9kd2MzX2VwX2RlcXVldWUvZW5hYmxlOg0KPj4+Pg0KPj4+
PiByb290QGVkaXNvbjovYm9vdCMgdW5hbWUgLWENCj4+Pj4gTGludXggZWRpc29uIDUuOS4wLWVk
aXNvbi1hY3BpLXN0YW5kYXJkICMxIFNNUCBNb24gT2N0IDE5IDIwOjE3OjA0IFVUQw0KPj4+PiAy
MDIwIHg4Nl82NCB4ODZfNjQgeDg2XzY0IEdOVS9MaW51eA0KPj4+PiByb290QGVkaXNvbjovYm9v
dCMgZWNobyAxID4NCj4+Pj4gL3N5cy9rZXJuZWwvZGVidWcvdHJhY2luZy9ldmVudHMvZHdjMy9k
d2MzX2VwX2RlcXVldWUvZW5hYmxlDQo+Pj4+IHJvb3RAZWRpc29uOi9ib290IyBlY2hvIDEgPiAv
cHJvYy9zeXMva2VybmVsL2Z0cmFjZV9kdW1wX29uX29vcHMNCj4+Pj4gcm9vdEBlZGlzb246L2Jv
b3QjDQo+Pj4+IHJvb3RAZWRpc29uOi9ib290IyBbIDI2MDguNTg1MzIzXSBCVUc6IGtlcm5lbCBO
VUxMIHBvaW50ZXINCj4+Pj4gZGVyZWZlcmVuY2UsIGFkZHJlc3M6IDAwMDAwMDAwMDAwMDAwMDAN
Cj4+Pj4gWyAyNjA4LjU5MjI4OF0gI1BGOiBzdXBlcnZpc29yIHJlYWQgYWNjZXNzIGluIGtlcm5l
bCBtb2RlDQo+Pj4+IFsgMjYwOC41OTc0MTldICNQRjogZXJyb3JfY29kZSgweDAwMDApIC0gbm90
LXByZXNlbnQgcGFnZQ0KPj4+PiBbIDI2MDguNjAyNTQ5XSBQR0QgMCBQNEQgMA0KPj4+PiBbIDI2
MDguNjA1MDkwXSBPb3BzOiAwMDAwIFsjMV0gU01QIFBUSQ0KPj4+PiBbIDI2MDguNjA4NTgwXSBD
UFU6IDEgUElEOiA3MzMgQ29tbTogaXJxLzE1LWR3YzMgTm90IHRhaW50ZWQNCj4+Pj4gNS45LjAt
ZWRpc29uLWFjcGktc3RhbmRhcmQgIzENCj4+Pj4gWyAyNjA4LjYxNjU3MV0gSGFyZHdhcmUgbmFt
ZTogSW50ZWwgQ29ycG9yYXRpb24gTWVycmlmaWVsZC9CT0RFR0EgQkFZLA0KPj4+PiBCSU9TIDU0
MiAyMDE1LjAxLjIxOjE4LjE5LjQ4DQo+Pj4+IFsgMjYwOC42MjUzNTZdIFJJUDogMDAxMDpkd2Mz
X2dhZGdldF9lcF9kZXF1ZXVlKzB4NDEvMHgxYzANCj4+Pj4gWyAyNjA4LjYzMDU4MF0gQ29kZTog
ZTkgNTEgMDEgMDAgMDAgNGMgOGQgYTMgMzAgMDEgMDAgMDAgNGMgODkgZTcgZTgNCj4+Pj4gMTUg
ZTYgNDIgMDAgNDkgOGIgNGUgNDggNDkgODkgYzUgNDkgOGQgNDYgNDggNDggOGQgNTEgYTAgNDgg
MzkgYzggNzUNCj4+Pj4gMGYgZWIgMmUgPDQ4PiA4YiA0YSA2MCA0OCA4ZCA1MSBhMCA0OCAzOSBj
OCA3NCAyMSA0OCAzOSBkNSA3NSBlZSA0NSAzMQ0KPj4+PiBmNiA0Yw0KPj4+PiBbIDI2MDguNjQ5
MzIwXSBSU1A6IDAwMTg6ZmZmZmE4MzgwMDJhN2M0MCBFRkxBR1M6IDAwMDEwMDg3DQo+Pj4+IFsg
MjYwOC42NTQ1NDNdIFJBWDogZmZmZjlhNWY0NjA5YzA0OCBSQlg6IGZmZmY5YTVmNDZmNDgwMjgg
UkNYOg0KPj4+PiAwMDAwMDAwMDAwMDAwMDAwDQo+Pj4+IFsgMjYwOC42NjE2NjZdIFJEWDogZmZm
ZmZmZmZmZmZmZmZhMCBSU0k6IDAwMDAwMDAwMDAwMDAwMDggUkRJOg0KPj4+PiBmZmZmOWE1ZjQ2
ZjQ4MTU4DQo+Pj4+IFsgMjYwOC42Njg3OTBdIFJCUDogZmZmZjlhNWY3YmQwOWI0MCBSMDg6IDAw
MDAwMDAwMDAwMDAyZDggUjA5Og0KPj4+PiBmZmZmOWE1ZjdkZDZhMDAwDQo+Pj4+IFsgMjYwOC42
NzU5MTNdIFIxMDogZmZmZmE4MzgwMDJhN2Q5MCBSMTE6IGZmZmY5YTVmNDZmNDgzMDAgUjEyOg0K
Pj4+PiBmZmZmOWE1ZjQ2ZjQ4MTU4DQo+Pj4+IFsgMjYwOC42ODMwMzldIFIxMzogMDAwMDAwMDAw
MDAwMDA0NiBSMTQ6IGZmZmY5YTVmNDYwOWMwMDAgUjE1Og0KPj4+PiBmZmZmOWE1ZjdhZDc3ZTAw
DQo+Pj4+IFsgMjYwOC42OTAxNjVdIEZTOsKgIDAwMDAwMDAwMDAwMDAwMDAoMDAwMCkgR1M6ZmZm
ZjlhNWY3ZTMwMDAwMCgwMDAwKQ0KPj4+PiBrbmxHUzowMDAwMDAwMDAwMDAwMDAwDQo+Pj4+IFsg
MjYwOC42OTgyNDRdIENTOsKgIDAwMTAgRFM6IDAwMDAgRVM6IDAwMDAgQ1IwOiAwMDAwMDAwMDgw
MDUwMDMzDQo+Pj4+IFsgMjYwOC43MDM5ODBdIENSMjogMDAwMDAwMDAwMDAwMDAwMCBDUjM6IDAw
MDAwMDAwMzc4MGEwMDAgQ1I0Og0KPj4+PiAwMDAwMDAwMDAwMTAwNmUwDQo+Pj4+IFsgMjYwOC43
MTExMDJdIENhbGwgVHJhY2U6DQo+Pj4+IFsgMjYwOC43MTM1NjFdwqAgdXNiX2VwX2RlcXVldWUr
MHgxOS8weDgwDQo+Pj4+IFsgMjYwOC43MTcyMzRdwqAgdV9hdWRpb19zdG9wX2NhcHR1cmUrMHg1
NC8weDlhIFt1X2F1ZGlvXQ0KPj4+PiBbIDI2MDguNzIyMjg5XcKgIGFmdW5jX3NldF9hbHQrMHg3
My8weDgwIFt1c2JfZl91YWMyXQ0KPj4+IEkgdG9vayBhIGxvb2sgYXQgaG93IHRoZSBhdWRpbyBm
dW5jdGlvbiBpcyBoYW5kbGluZyBzd2l0Y2hpbmcgYWx0ZXJuYXRlDQo+Pj4gc2V0dGluZyBhbmQg
ZGVxdWV1aW5nIGVuZHBvaW50cywgYW5kIEkgdGhpbmsgSSBmb3VuZCB0aGUgaXNzdWUuDQo+Pj4N
Cj4+PiBIZXJlJ3MgYSBzbmlwcGV0IG9mIHRoZSBmcmVlX2VwKCkgY29kZSBpbiB1X2F1ZGlvLmM6
DQo+Pj4NCj4+PiBzdGF0aWMgaW5saW5lIHZvaWQgZnJlZV9lcChzdHJ1Y3QgdWFjX3J0ZF9wYXJh
bXMgKnBybSwgc3RydWN0IHVzYl9lcCAqZXApDQo+Pj4gew0KPj4+IMKgwqDCoCAuLi4uLg0KPj4+
IMKgwqDCoMKgwqDCoMKgIGZvciAoaSA9IDA7IGkgPCBwYXJhbXMtPnJlcV9udW1iZXI7IGkrKykg
ew0KPj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBpZiAocHJtLT51cmVxW2ldLnJl
cSkgew0KPj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
dXNiX2VwX2RlcXVldWUoZXAsIHBybS0+dXJlcVtpXS5yZXEpOw0KPj4+IMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgdXNiX2VwX2ZyZWVfcmVxdWVzdChlcCwg
cHJtLT51cmVxW2ldLnJlcSk7DQo+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCBwcm0tPnVyZXFbaV0ucmVxID0gTlVMTDsNCj4+PiDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgfQ0KPj4+IMKgwqDCoMKgwqDCoMKgIH0NCj4+PiDCoCAuLi4uDQo+
Pj4NCj4+Pg0KPj4+IHVzYl9lcF9kZXF1ZXVlKCkgY2FuIGJlIGFzeW5jaHJvbm91cy4gVGhlIGR3
YzMgc3RpbGwgaGFzIG93bmVyc2hpcCBvZg0KPj4+IHRoZSByZXF1ZXN0IHVudGlsIGl0IGdpdmVz
IGJhY2sgdGhlIHJlcXVlc3QuIEZyZWVpbmcgdGhlIHJlcXVlc3QNCj4+PiBpbW1lZGlhdGVseSBo
ZXJlIHdpbGwgY2F1c2UgYSBwcm9ibGVtLg0KPj4gVG8gY29uZmlybSBteSBzdXNwaWNpb24sIGNh
biB5b3UgdHJ5IHRoaXMgYW5kIHNlZSBpZiB5b3Ugc3RpbGwgZ2V0IG9vcHM/DQo+Pg0KPj4gZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvdXNiL2R3YzMvZ2FkZ2V0LmMgYi9kcml2ZXJzL3VzYi9kd2MzL2dh
ZGdldC5jDQo+PiBpbmRleCBlZWM4ZTlhOWUzZWQuLmI2NmViMjRlYzA3MCAxMDA2NDQNCj4+IC0t
LSBhL2RyaXZlcnMvdXNiL2R3YzMvZ2FkZ2V0LmMNCj4+ICsrKyBiL2RyaXZlcnMvdXNiL2R3YzMv
Z2FkZ2V0LmMNCj4+IEBAIC0yMDMxLDYgKzIwMzEsNyBAQCBzdGF0aWMgaW50IGR3YzNfZ2FkZ2V0
X2VwX2RlcXVldWUoc3RydWN0IHVzYl9lcCAqZXAsDQo+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGxpc3RfZm9yX2VhY2hfZW50cnlfc2FmZShyLCB0LA0K
Pj4gJmRlcC0+c3RhcnRlZF9saXN0LCBsaXN0KQ0KPj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZHdjM19nYWRnZXRfbW92ZV9j
YW5jZWxsZWRfcmVxdWVzdChyKTsNCj4+IMKgDQo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgZHdjM19nYWRnZXRfZXBfY2xlYW51cF9jYW5jZWxsZWRfcmVx
dWVzdHMoZGVwKTsNCj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgZ290byBvdXQ7DQo+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfQ0KPj4g
wqDCoMKgwqDCoMKgwqAgfQ0KPj4NCj4+DQo+PiBUaGlzIHdpbGwgbWFrZSB1c2JfZXBfZGVxdWV1
ZSgpIHN5bmNocm9ub3VzLiAoTm90ZSB0aGF0IHRoaXMgaXMgbm90IHRlc3RlZCkuDQo+IEJ1dCBv
bmx5IGZvciBkd2MzIHJpZ2h0PyBJbiBnZW5lcmFsIGRvIG90aGVyIFVEQyBkcml2ZXJzIHByb3Zp
ZGUNCj4gc3luY2hyb25vdXMgYmVoYXZpb3I/IEl0IGRvZXMgc3RhdGVzIGNsZWFybHkgaW4gdGhl
IGtlcm5lbGRvYyBmb3INCj4gdXNiX2VwX2RlcXVldWUoKSB0aGF0IHRoZSBjb21wbGV0aW9uIGlz
IGFzeW5jaHJvbm91cy4gIEZyb20NCj4gZHJpdmVycy91c2IvZ2FkZ2V0L3VkYy9jb3JlLmM6DQo+
DQo+ICAqIElmIHRoZSByZXF1ZXN0IGlzIHN0aWxsIGFjdGl2ZSBvbiB0aGUgZW5kcG9pbnQsIGl0
IGlzIGRlcXVldWVkIGFuZA0KPiAgKiBldmVudHVhbGx5IGl0cyBjb21wbGV0aW9uIHJvdXRpbmUg
aXMgY2FsbGVkICh3aXRoIHN0YXR1cyAtRUNPTk5SRVNFVCk7DQo+ICAqIGVsc2UgYSBuZWdhdGl2
ZSBlcnJvciBjb2RlIGlzIHJldHVybmVkLiAgVGhpcyByb3V0aW5lIGlzIGFzeW5jaHJvbm91cywN
Cj4gICogdGhhdCBpcywgaXQgbWF5IHJldHVybiBiZWZvcmUgdGhlIGNvbXBsZXRpb24gcm91dGlu
ZSBydW5zLg0KPg0KPiBBbHRlcm5hdGl2ZWx5LCBjb3VsZCB3ZSBub3QgZml4IHVwIHVfYXVkaW8u
YyB0byBkZWFsIHdpdGggdGhpcz8NCg0KVGhlIGlzc3VlIGlzIGluIHVfYXVkaW8uYy4gQnV0IEkg
d2FudCB0byBjb25maXJtIG15IHN1c3BpY2lvbiBhYm91dA0Kd2hldGhlciB0aGUgb29wcyB0aGF0
IEZlcnJ5IGlzIGR1ZSB0byB0aGlzIChtb3N0IGxpa2VseSBpdCBpcykuDQoNCldlIGRvbid0IHdh
bnQgdG8gYXBwbHkgdGhpcyBhcyBhIHdvcmthcm91bmQgYW5kIG1hc2sgdGhlIGlzc3VlIGluIGF1
ZGlvLmMuDQoNCj4NCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvdXNiL2dhZGdldC9mdW5jdGlvbi91
X2F1ZGlvLmMgYi9kcml2ZXJzL3VzYi9nYWRnZXQvZnVuY3Rpb24vdV9hdWRpby5jDQo+IGluZGV4
IDU2OTA2ZDE1ZmI1NS4uZjA4ZjAzNmQ1MjBlIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL3VzYi9n
YWRnZXQvZnVuY3Rpb24vdV9hdWRpby5jDQo+ICsrKyBiL2RyaXZlcnMvdXNiL2dhZGdldC9mdW5j
dGlvbi91X2F1ZGlvLmMNCj4gQEAgLTg5LDcgKzg5LDEyIEBAIHN0YXRpYyB2b2lkIHVfYXVkaW9f
aXNvX2NvbXBsZXRlKHN0cnVjdCB1c2JfZXAgKmVwLCBzdHJ1Y3QgdXNiX3JlcXVlc3QgKnJlcSkN
Cj4gCXN0cnVjdCBzbmRfdWFjX2NoaXAgKnVhYyA9IHBybS0+dWFjOw0KPg0KPiAJLyogaS9mIHNo
dXR0aW5nIGRvd24gKi8NCj4gLQlpZiAoIXBybS0+ZXBfZW5hYmxlZCB8fCByZXEtPnN0YXR1cyA9
PSAtRVNIVVRET1dOKQ0KPiArCWlmICghcHJtLT5lcF9lbmFibGVkKSB7DQo+ICsJCXVzYl9lcF9m
cmVlX3JlcXVlc3QoZXAsIHJlcSk7DQo+ICsJCXJldHVybjsNCj4gKwl9DQo+ICsNCj4gKwlpZiAo
cmVxLT5zdGF0dXMgPT0gLUVTSFVURE9XTikNCj4gCQlyZXR1cm47DQo+DQo+IAkvKg0KPiBAQCAt
MzUyLDcgKzM1Nyw2IEBAIHN0YXRpYyBpbmxpbmUgdm9pZCBmcmVlX2VwKHN0cnVjdCB1YWNfcnRk
X3BhcmFtcyAqcHJtLCBzdHJ1Y3QgdXNiX2VwICplcCkNCj4gCWZvciAoaSA9IDA7IGkgPCBwYXJh
bXMtPnJlcV9udW1iZXI7IGkrKykgew0KPiAJCWlmIChwcm0tPnVyZXFbaV0ucmVxKSB7DQo+IAkJ
CXVzYl9lcF9kZXF1ZXVlKGVwLCBwcm0tPnVyZXFbaV0ucmVxKTsNCj4gLQkJCXVzYl9lcF9mcmVl
X3JlcXVlc3QoZXAsIHBybS0+dXJlcVtpXS5yZXEpOw0KPiAJCQlwcm0tPnVyZXFbaV0ucmVxID0g
TlVMTDsNCj4gCQl9DQo+IAl9DQo+DQo+IEphY2sNCg0KWWVzLCB0aGUgdV9hdWRpby5jIG5lZWRz
IHRvIGRvIHNvbWV0aGluZyBsaWtlIHRoYXQuDQoNCkJSLA0KVGhpbmgNCg==
