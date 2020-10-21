Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 794CF29552D
	for <lists+linux-usb@lfdr.de>; Thu, 22 Oct 2020 01:32:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2507142AbgJUXce (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 21 Oct 2020 19:32:34 -0400
Received: from smtprelay-out1.synopsys.com ([149.117.87.133]:59604 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2507094AbgJUXcd (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 21 Oct 2020 19:32:33 -0400
Received: from mailhost.synopsys.com (badc-mailhost1.synopsys.com [10.192.0.17])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id AD9A0C0092;
        Wed, 21 Oct 2020 23:32:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1603323152; bh=wanKB74JGLz0nx0Ji28+mySRCEqPbRJe7NbmrT+GXD0=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=JaPjfECADGvBZ/W1LL1WQXCi1QE+x/iJnHcoluieMOeCPFCQPthyDEwOJf7NDeFCB
         upYa1uSpqDckSnuepamaKLLs1yIr93VHGJiiuaLu6r0+hG+DeA74nTSJnYv/wT5sKH
         qW6ZuqfXxUSRty1kNSMwZAJcCnV0roNCDdH0vzu/05xikRHkp10u339N0PcfwqJGgY
         88uBCnDPC+SczWFcNt+J5L1fliGVjXhxJJJVHxKsBDtbK/PIwQIV1bpHCHDJ6Bzbxc
         E2+n1nTvKmOs4NBEBTXsHm2zcWFaZxOKOjukB3Qdp3RAZEv3mhJAXSTP6MCRRaD8Km
         yiUUxZq5NssXg==
Received: from o365relay-in.synopsys.com (us03-o365relay1.synopsys.com [10.4.161.137])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPS id 6CBB7A0071;
        Wed, 21 Oct 2020 23:32:32 +0000 (UTC)
Received: from NAM04-CO1-obe.outbound.protection.outlook.com (mail-co1nam04lp2059.outbound.protection.outlook.com [104.47.45.59])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client CN "mail.protection.outlook.com", Issuer "GlobalSign Organization Validation CA - SHA256 - G3" (verified OK))
        by o365relay-in.synopsys.com (Postfix) with ESMTPS id 59B3D800C9;
        Wed, 21 Oct 2020 23:32:31 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=thinhn@synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
        dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="o52MLXVa";
        dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WBn7YeRnUx1wwS8+CQy3pWMyAQYnPzHWfysQIZPPh1XfcJsCW+bQMZvLfRNdIeQsgG7pPxh+azF1EKD/JI1J5J6Hnb4G8qLLg/lI8pxXxdqtSsZfdI7o/WiYZk0lT8aQzxgC2XE0F5QlB8EehHpS8gnLO9Q07XT+4S1wNw7VsZwKxWHmD+bpEPqRHIYqnAQLaJejZUOQ98QwUz1JiDJ2SOynIKUYUII2sPZd/vMiomlm/feErMd2lBY8d7mbJKBcCrf8fLnXyLpt0cqmg4SoeHFJKkxRNoHTTwSc670zazQYizaB5jDuOmPblZpTXMqB5MYWRYgsezrDldhzvLJUDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wanKB74JGLz0nx0Ji28+mySRCEqPbRJe7NbmrT+GXD0=;
 b=CMkCivv3JZzh4f5K8TYAhB0n0eSYgrYtma2Jxxn4aNsNe6koYzg2qRj5c8CpoVGydMPqxTlGbVU8KQiDPylVm+xwAFx1/MRRn/xRefQC/aQOlYUVYwGYWRvQqSci56PddeFDQ+OW/TRFPvzlZ0p9jxaN9vvWlDVmYOmvDHbZtrE01pz3+WQftcfvmDzQAZ41uHHmDb8FD5snvtKzfmG1TJ3cZ8mFSCw63zlw9Nd3Au7lyvJOM+tIaKVBV4YWI1oSH6SrFfAv07byeDybs8IyD+kAwSJzNaVQ0pwl2ZKWTtf4Qc5BGNYHRRsRvxTNapGRJO5KApmj4I+8cZqIgb4oyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wanKB74JGLz0nx0Ji28+mySRCEqPbRJe7NbmrT+GXD0=;
 b=o52MLXVaUQChecLRz40PBE5B0L6at73OEOg8pD9klLDyZBT90XMk2pMt0Ze+2hCcbZsyBET20LxpaGs13Jo2EmjXE6QLeLZu0Q2MTJLBp/ONfvZ/HVOKcx4vtnKYGx0Xokgg5VePBgLCBVTgdQIlKFsHYvRCDEHPgFq2CNd0RgE=
Received: from BYAPR12MB2917.namprd12.prod.outlook.com (2603:10b6:a03:130::14)
 by BYAPR12MB3061.namprd12.prod.outlook.com (2603:10b6:a03:a8::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.20; Wed, 21 Oct
 2020 23:32:29 +0000
Received: from BYAPR12MB2917.namprd12.prod.outlook.com
 ([fe80::c17e:c3dd:7cda:e2dc]) by BYAPR12MB2917.namprd12.prod.outlook.com
 ([fe80::c17e:c3dd:7cda:e2dc%4]) with mapi id 15.20.3477.028; Wed, 21 Oct 2020
 23:32:29 +0000
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To:     Ferry Toth <fntoth@gmail.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
CC:     "felipe.balbi-VuQAYsv1563Yd54FQh9/CA-XMD5yJDbdMReXY1tMh2IBg-XMD5yJDbdMReXY1tMh2IBg@public.gmane.org" 
        <felipe.balbi-VuQAYsv1563Yd54FQh9/CA-XMD5yJDbdMReXY1tMh2IBg-XMD5yJDbdMReXY1tMh2IBg@public.gmane.org>,
        Heikki Krogerus 
        <heikki.krogerus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>,
        Andy Shevchenko 
        <andriy.shevchenko-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Subject: Re: BUG with linux 5.9.0 with dwc3 in gadget mode
Thread-Topic: BUG with linux 5.9.0 with dwc3 in gadget mode
Thread-Index: AQHWo/slg1BGy5aFnEWs2vXEMG8U96mebg0AgAAaCYCAAeoFAIAAh4qAgAAZ9ACAAA2AgIABXG4AgAABPwCAAA6cgIAAL4gA
Date:   Wed, 21 Oct 2020 23:32:28 +0000
Message-ID: <920590dc-5430-7f8b-b2e1-1a4c37f4dfbe@synopsys.com>
References: <913dccca-500d-1938-b199-6eb67cfb60cc@gmail.com>
 <87a6wig461.fsf@kernel.org> <a565dc52-27ab-f5be-4fee-5a8f96d66456@gmail.com>
 <874kmpf583.fsf@kernel.org> <d0aca346-353c-d74e-6f00-ccd2a4ed26ef@gmail.com>
 <976cea12-e54e-fbca-6c53-e6ef5c554094@synopsys.com>
 <645b6ddc-d4f5-3f5b-b85f-b3d27fc365f5@synopsys.com>
 <2b6586e6-528c-86e8-9d92-0061bc44866d@gmail.com>
 <aad327a8-95bc-40ec-abf7-ad216a02fad0@synopsys.com>
 <2cc783ac-6b71-190b-49fc-9e2bceeacd4b@gmail.com>
In-Reply-To: <2cc783ac-6b71-190b-49fc-9e2bceeacd4b@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.1
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=synopsys.com;
x-originating-ip: [98.248.94.126]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c216bb2c-024c-4110-bf18-08d876199347
x-ms-traffictypediagnostic: BYAPR12MB3061:
x-microsoft-antispam-prvs: <BYAPR12MB3061B63A2788918A33F877F4AA1C0@BYAPR12MB3061.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 73xS2mL1JEs9E0NSzYCFfjbCDV/JVPcUN6f9Wx8e20t24Xf2KbJp9PxaIvtjIpLZc97QyFkj64iTcsXbECLV9UzK10bUzHkbdo64jRxbIB6G4T4gCDkvcWNM9Lp+YvijxpP9miaYYSLTtvTWTyGL19Si0S5kvcv6qSAJg8qdPEC+qkZuCn2Vz208gRofAOKZvVuRNy+UtwoAG9/dxfK8h7Hf552D2yFg2Et+RaD5z3+PNd07AQuo3aNB8FutCGi0b2htjwh628MP0me8qipfDuV8ifnFlODAvIjgCVA0qJ/LdjXuhyidQ46tsMaxmOP+HxELXxudL6tv+ezNLNT+9+hMEbMqX9qPEUl2/eSQvXuz75gsZpMfgJDEa/dHLTP/
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB2917.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(346002)(366004)(136003)(376002)(396003)(8676002)(26005)(4326008)(478600001)(66556008)(66476007)(6506007)(54906003)(64756008)(110136005)(5660300002)(6512007)(71200400001)(2616005)(2906002)(36756003)(66446008)(76116006)(83380400001)(8936002)(66946007)(6486002)(86362001)(186003)(31686004)(316002)(31696002)(43740500002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: ObannqiSIyQA9E092WzrOaleDx0G99vSWOxOtdi8fEt9SKstY4OYh7NNVB6yww3zv5bJ5sjTeq/ynjvXgi5tNYn/yO41ceC7toGC7k24EYODEC7vD+a99a2ymUvRAfXFUJ/s1hx7opZVMmhOzB2VpNQtLufU9VTmGbP7QuPmAWkaN1BurLN8bCIZiwLFuFWF4EJgupUDQvY2njaH+AuzvV14OQNc9VQSq/xy7QgGjFEev4oXF5ApHg/EzQAw5PSEKmwQpLV9LqFWPuV7z/iKauGphHruabZVgETi65CUl/OGsrPEiP9XboUr7yY3F0H5TmjWIuwJf2hUdwKERpfd7ryxflpLpurIZwYJ0plv6VMBCuXAvcknNU35LTSyhwOXpheg2+VrnQnjZoDhsBmFN67m9U3HDAE53HVqyByqj5psEcuHAiT4zgd71dCyI2HUYpJzqjL9RQFKgH7V4q5TEzyNaK43Qz/KaM4lztlsLN+3kDhkPQT11EqWaFQ3mOxMnHb0S7HvmLhQ9nCzNnCViCMQTBiWQfDBrTbn4WxmJNCUI/nsEKoBCf692nmvQoDpp7PdE4huujgM9FTMBgVuKL9I5OO9YbdGbwrh8MkknCMWUdRS+1GvBnzr49iLVHm8NnKIHv1VxkefVdIkVtVMfQ==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <B85CC66E759CDB459F9D00694F025903@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB2917.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c216bb2c-024c-4110-bf18-08d876199347
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Oct 2020 23:32:28.9088
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ulNT42e7sflOy40Rj0FCEJzZntpInfc5kWfn0GiONxiwrlq5oke0T/4OvVvoXLHT+KLpGBcRzeoivCDRMXvkZw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3061
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

RmVycnkgVG90aCB3cm90ZToNCj4gT3AgMjEtMTAtMjAyMCBvbSAyMTo1MCBzY2hyZWVmIFRoaW5o
IE5ndXllbjoNCj4+IEZlcnJ5IFRvdGggd3JvdGU6DQo+Pj4gT3AgMjEtMTAtMjAyMCBvbSAwMDo1
OCBzY2hyZWVmIFRoaW5oIE5ndXllbjoNCj4+Pj4gVGhpbmggTmd1eWVuIHdyb3RlOg0KPj4+Pj4g
SGksDQo+Pj4+Pg0KPj4+Pj4gRmVycnkgVG90aCB3cm90ZToNCj4+Pj4+PiBPcCAyMC0xMC0yMDIw
IG9tIDE0OjMyIHNjaHJlZWYgRmVsaXBlIEJhbGJpOg0KPj4+Pj4+PiBIaSwNCj4+Pj4+Pj4NCj4+
Pj4+Pj4gRmVycnkgVG90aCA8Zm50b3RoQGdtYWlsLmNvbT4gd3JpdGVzOg0KPj4+Pj4+Pg0KPj4+
Pj4+PiA4PCBzbmlwDQo+Pj4+Pj4+DQo+Pj4+Pj4+Pj4+IFvCoMKgIDEyLjY1NzQxNl0gQ1IyOiAw
MDAwMDAwMTAwMDAwMDAwDQo+Pj4+Pj4+Pj4+IFvCoMKgIDEyLjY2MDcyOV0gLS0tWyBlbmQgdHJh
Y2UgOWI5MmRlYTZkYTMzYzcxZSBdLS0tDQo+Pj4+Pj4+Pj4gSXQgdGhpcyBzb21ldGhpbmcgeW91
IGNhbiByZXByb2R1Y2Ugb24geW91ciBlbmQ/IEZlcnJ5LCBjYW4NCj4+Pj4+Pj4+PiB5b3UgZ2V0
DQo+Pj4+Pj4+Pj4gZHdjMw0KPj4+Pj4+Pj4+IHRyYWNlIGxvZ3Mgd2hlbiB0aGlzIGhhcHBlbnM/
IGZ0cmFjZV9kdW1wX29uX29vcHMgbWF5IGhlbHAgaGVyZS4NCj4+Pj4+Pj4+IEkgd2lsbCBkbyB0
aGF0IHRvbmlnaHQuIElzIGZsaXBwaW5nIG9uIGZ0cmFjZV9kdW1wX29uX29vcHMNCj4+Pj4+Pj4+
IHN1ZmZpY2llbnQgb3INCj4+Pj4+Pj4+IGRvIEkgbmVlZCB0byBkbyBtb3JlPw0KPj4+Pj4+PiB5
b3UnZCBoYXZlIHRvIGVuYWJsZSBkd2MzIHRyYWNlIGV2ZW50cyBmaXJzdCA7LSkNCj4+Pj4+Pj4N
Cj4+Pj4+Pj4+IEJUVyBhZnRlciBwb3N0aW5nIHRoaXMgSSBmb3VuZCBpbiBob3N0IG1vZGUgZHdj
MyBpcyBub3Qgd29ya2luZw0KPj4+Pj4+Pj4gcHJvcGVybHkNCj4+Pj4+Pj4+IGVpdGhlci4gTm8g
b29wcywgYnV0IG5vIGRyaXZlciBnZXQgbG9hZGVkIG9uIGRldmljZSBwbHVnIGluLg0KPj4+Pj4+
PiBva2F5DQo+Pj4+Pj4+DQo+Pj4+Pj4gRWhlbSwgeW91IG1heWJlIG9ubHkgbWUgdG8gZW5hYmxl
IC9kd2MzL2R3YzNfZXBfZGVxdWV1ZS9lbmFibGU6DQo+Pj4+Pj4NCj4+Pj4+PiByb290QGVkaXNv
bjovYm9vdCMgdW5hbWUgLWENCj4+Pj4+PiBMaW51eCBlZGlzb24gNS45LjAtZWRpc29uLWFjcGkt
c3RhbmRhcmQgIzEgU01QIE1vbiBPY3QgMTkNCj4+Pj4+PiAyMDoxNzowNCBVVEMNCj4+Pj4+PiAy
MDIwIHg4Nl82NCB4ODZfNjQgeDg2XzY0IEdOVS9MaW51eA0KPj4+Pj4+IHJvb3RAZWRpc29uOi9i
b290IyBlY2hvIDEgPg0KPj4+Pj4+IC9zeXMva2VybmVsL2RlYnVnL3RyYWNpbmcvZXZlbnRzL2R3
YzMvZHdjM19lcF9kZXF1ZXVlL2VuYWJsZQ0KPj4+Pj4+IHJvb3RAZWRpc29uOi9ib290IyBlY2hv
IDEgPiAvcHJvYy9zeXMva2VybmVsL2Z0cmFjZV9kdW1wX29uX29vcHMNCj4+Pj4+PiByb290QGVk
aXNvbjovYm9vdCMNCj4+Pj4+PiByb290QGVkaXNvbjovYm9vdCMgWyAyNjA4LjU4NTMyM10gQlVH
OiBrZXJuZWwgTlVMTCBwb2ludGVyDQo+Pj4+Pj4gZGVyZWZlcmVuY2UsIGFkZHJlc3M6IDAwMDAw
MDAwMDAwMDAwMDANCj4+Pj4+PiBbIDI2MDguNTkyMjg4XSAjUEY6IHN1cGVydmlzb3IgcmVhZCBh
Y2Nlc3MgaW4ga2VybmVsIG1vZGUNCj4+Pj4+PiBbIDI2MDguNTk3NDE5XSAjUEY6IGVycm9yX2Nv
ZGUoMHgwMDAwKSAtIG5vdC1wcmVzZW50IHBhZ2UNCj4+Pj4+PiBbIDI2MDguNjAyNTQ5XSBQR0Qg
MCBQNEQgMA0KPj4+Pj4+IFsgMjYwOC42MDUwOTBdIE9vcHM6IDAwMDAgWyMxXSBTTVAgUFRJDQo+
Pj4+Pj4gWyAyNjA4LjYwODU4MF0gQ1BVOiAxIFBJRDogNzMzIENvbW06IGlycS8xNS1kd2MzIE5v
dCB0YWludGVkDQo+Pj4+Pj4gNS45LjAtZWRpc29uLWFjcGktc3RhbmRhcmQgIzENCj4+Pj4+PiBb
IDI2MDguNjE2NTcxXSBIYXJkd2FyZSBuYW1lOiBJbnRlbCBDb3Jwb3JhdGlvbiBNZXJyaWZpZWxk
L0JPREVHQQ0KPj4+Pj4+IEJBWSwNCj4+Pj4+PiBCSU9TIDU0MiAyMDE1LjAxLjIxOjE4LjE5LjQ4
DQo+Pj4+Pj4gWyAyNjA4LjYyNTM1Nl0gUklQOiAwMDEwOmR3YzNfZ2FkZ2V0X2VwX2RlcXVldWUr
MHg0MS8weDFjMA0KPj4+Pj4+IFsgMjYwOC42MzA1ODBdIENvZGU6IGU5IDUxIDAxIDAwIDAwIDRj
IDhkIGEzIDMwIDAxIDAwIDAwIDRjIDg5IGU3IGU4DQo+Pj4+Pj4gMTUgZTYgNDIgMDAgNDkgOGIg
NGUgNDggNDkgODkgYzUgNDkgOGQgNDYgNDggNDggOGQgNTEgYTAgNDggMzkgYzggNzUNCj4+Pj4+
PiAwZiBlYiAyZSA8NDg+IDhiIDRhIDYwIDQ4IDhkIDUxIGEwIDQ4IDM5IGM4IDc0IDIxIDQ4IDM5
IGQ1IDc1IGVlDQo+Pj4+Pj4gNDUgMzENCj4+Pj4+PiBmNiA0Yw0KPj4+Pj4+IFsgMjYwOC42NDkz
MjBdIFJTUDogMDAxODpmZmZmYTgzODAwMmE3YzQwIEVGTEFHUzogMDAwMTAwODcNCj4+Pj4+PiBb
IDI2MDguNjU0NTQzXSBSQVg6IGZmZmY5YTVmNDYwOWMwNDggUkJYOiBmZmZmOWE1ZjQ2ZjQ4MDI4
IFJDWDoNCj4+Pj4+PiAwMDAwMDAwMDAwMDAwMDAwDQo+Pj4+Pj4gWyAyNjA4LjY2MTY2Nl0gUkRY
OiBmZmZmZmZmZmZmZmZmZmEwIFJTSTogMDAwMDAwMDAwMDAwMDAwOCBSREk6DQo+Pj4+Pj4gZmZm
ZjlhNWY0NmY0ODE1OA0KPj4+Pj4+IFsgMjYwOC42Njg3OTBdIFJCUDogZmZmZjlhNWY3YmQwOWI0
MCBSMDg6IDAwMDAwMDAwMDAwMDAyZDggUjA5Og0KPj4+Pj4+IGZmZmY5YTVmN2RkNmEwMDANCj4+
Pj4+PiBbIDI2MDguNjc1OTEzXSBSMTA6IGZmZmZhODM4MDAyYTdkOTAgUjExOiBmZmZmOWE1ZjQ2
ZjQ4MzAwIFIxMjoNCj4+Pj4+PiBmZmZmOWE1ZjQ2ZjQ4MTU4DQo+Pj4+Pj4gWyAyNjA4LjY4MzAz
OV0gUjEzOiAwMDAwMDAwMDAwMDAwMDQ2IFIxNDogZmZmZjlhNWY0NjA5YzAwMCBSMTU6DQo+Pj4+
Pj4gZmZmZjlhNWY3YWQ3N2UwMA0KPj4+Pj4+IFsgMjYwOC42OTAxNjVdIEZTOsKgIDAwMDAwMDAw
MDAwMDAwMDAoMDAwMCkgR1M6ZmZmZjlhNWY3ZTMwMDAwMCgwMDAwKQ0KPj4+Pj4+IGtubEdTOjAw
MDAwMDAwMDAwMDAwMDANCj4+Pj4+PiBbIDI2MDguNjk4MjQ0XSBDUzrCoCAwMDEwIERTOiAwMDAw
IEVTOiAwMDAwIENSMDogMDAwMDAwMDA4MDA1MDAzMw0KPj4+Pj4+IFsgMjYwOC43MDM5ODBdIENS
MjogMDAwMDAwMDAwMDAwMDAwMCBDUjM6IDAwMDAwMDAwMzc4MGEwMDAgQ1I0Og0KPj4+Pj4+IDAw
MDAwMDAwMDAxMDA2ZTANCj4+Pj4+PiBbIDI2MDguNzExMTAyXSBDYWxsIFRyYWNlOg0KPj4+Pj4+
IFsgMjYwOC43MTM1NjFdwqAgdXNiX2VwX2RlcXVldWUrMHgxOS8weDgwDQo+Pj4+Pj4gWyAyNjA4
LjcxNzIzNF3CoCB1X2F1ZGlvX3N0b3BfY2FwdHVyZSsweDU0LzB4OWEgW3VfYXVkaW9dDQo+Pj4+
Pj4gWyAyNjA4LjcyMjI4OV3CoCBhZnVuY19zZXRfYWx0KzB4NzMvMHg4MCBbdXNiX2ZfdWFjMl0N
Cj4+Pj4+IEkgdG9vayBhIGxvb2sgYXQgaG93IHRoZSBhdWRpbyBmdW5jdGlvbiBpcyBoYW5kbGlu
ZyBzd2l0Y2hpbmcNCj4+Pj4+IGFsdGVybmF0ZQ0KPj4+Pj4gc2V0dGluZyBhbmQgZGVxdWV1aW5n
IGVuZHBvaW50cywgYW5kIEkgdGhpbmsgSSBmb3VuZCB0aGUgaXNzdWUuDQo+Pj4+Pg0KPj4+Pj4g
SGVyZSdzIGEgc25pcHBldCBvZiB0aGUgZnJlZV9lcCgpIGNvZGUgaW4gdV9hdWRpby5jOg0KPj4+
Pj4NCj4+Pj4+IHN0YXRpYyBpbmxpbmUgdm9pZCBmcmVlX2VwKHN0cnVjdCB1YWNfcnRkX3BhcmFt
cyAqcHJtLCBzdHJ1Y3QgdXNiX2VwDQo+Pj4+PiAqZXApDQo+Pj4+PiB7DQo+Pj4+PiDCoMKgwqDC
oMKgIC4uLi4uDQo+Pj4+PiDCoMKgwqDCoMKgwqDCoMKgwqAgZm9yIChpID0gMDsgaSA8IHBhcmFt
cy0+cmVxX251bWJlcjsgaSsrKSB7DQo+Pj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIGlmIChwcm0tPnVyZXFbaV0ucmVxKSB7DQo+Pj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB1c2JfZXBfZGVxdWV1ZShlcCwgcHJtLT51
cmVxW2ldLnJlcSk7DQo+Pj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCB1c2JfZXBfZnJlZV9yZXF1ZXN0KGVwLCBwcm0tPnVyZXFbaV0ucmVxKTsN
Cj4+Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IHBybS0+dXJlcVtpXS5yZXEgPSBOVUxMOw0KPj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCB9DQo+Pj4+PiDCoMKgwqDCoMKgwqDCoMKgwqAgfQ0KPj4+Pj4gwqDCoMKgIC4u
Li4NCj4+Pj4+DQo+Pj4+Pg0KPj4+Pj4gdXNiX2VwX2RlcXVldWUoKSBjYW4gYmUgYXN5bmNocm9u
b3VzLiBUaGUgZHdjMyBzdGlsbCBoYXMgb3duZXJzaGlwIG9mDQo+Pj4+PiB0aGUgcmVxdWVzdCB1
bnRpbCBpdCBnaXZlcyBiYWNrIHRoZSByZXF1ZXN0LiBGcmVlaW5nIHRoZSByZXF1ZXN0DQo+Pj4+
PiBpbW1lZGlhdGVseSBoZXJlIHdpbGwgY2F1c2UgYSBwcm9ibGVtLg0KPj4+Pg0KPj4+PiBUbyBj
b25maXJtIG15IHN1c3BpY2lvbiwgY2FuIHlvdSB0cnkgdGhpcyBhbmQgc2VlIGlmIHlvdSBzdGls
bCBnZXQNCj4+Pj4gb29wcz8NCj4+Pj4NCj4+Pj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvdXNiL2R3
YzMvZ2FkZ2V0LmMgYi9kcml2ZXJzL3VzYi9kd2MzL2dhZGdldC5jDQo+Pj4+IGluZGV4IGVlYzhl
OWE5ZTNlZC4uYjY2ZWIyNGVjMDcwIDEwMDY0NA0KPj4+PiAtLS0gYS9kcml2ZXJzL3VzYi9kd2Mz
L2dhZGdldC5jDQo+Pj4+ICsrKyBiL2RyaXZlcnMvdXNiL2R3YzMvZ2FkZ2V0LmMNCj4+Pj4gQEAg
LTIwMzEsNiArMjAzMSw3IEBAIHN0YXRpYyBpbnQgZHdjM19nYWRnZXRfZXBfZGVxdWV1ZShzdHJ1
Y3QgdXNiX2VwDQo+Pj4+ICplcCwNCj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgbGlzdF9mb3JfZWFjaF9lbnRyeV9zYWZlKHIsIHQsDQo+Pj4+
ICZkZXAtPnN0YXJ0ZWRfbGlzdCwgbGlzdCkNCj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgDQo+Pj4+IGR3YzNfZ2Fk
Z2V0X21vdmVfY2FuY2VsbGVkX3JlcXVlc3Qocik7DQo+Pj4+IMKgwqAgKw0KPj4+PiBkd2MzX2dh
ZGdldF9lcF9jbGVhbnVwX2NhbmNlbGxlZF9yZXF1ZXN0cyhkZXApOw0KPj4+PiDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBnb3RvIG91dDsNCj4+Pj4g
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB9DQo+Pj4+IMKgwqDCoMKgwqDCoMKg
wqDCoCB9DQo+Pj4+DQo+Pj4+DQo+Pj4+IFRoaXMgd2lsbCBtYWtlIHVzYl9lcF9kZXF1ZXVlKCkg
c3luY2hyb25vdXMuIChOb3RlIHRoYXQgdGhpcyBpcyBub3QNCj4+Pj4gdGVzdGVkKS4NCj4+Pg0K
Pj4+IFVuZm9ydHVuYXRlbHksIGl0IGRvZXNuJ3Qgd29yay4gVGhlIHRyYWNlIGNoYW5nZXMgdG86
DQo+Pj4gcm9vdEBlZGlzb246fiMgW8KgIDEwNC40MTgyNjRdIEJVRzoga2VybmVsIE5VTEwgcG9p
bnRlciBkZXJlZmVyZW5jZSwNCj4+PiBhZGRyZXNzOiAwMDAwMDAwMDAwMDAwMDAwDQo+Pj4gW8Kg
IDEwNC40MjUyMjddICNQRjogc3VwZXJ2aXNvciBpbnN0cnVjdGlvbiBmZXRjaCBpbiBrZXJuZWwg
bW9kZQ0KPj4+IFvCoCAxMDQuNDMwODc3XSAjUEY6IGVycm9yX2NvZGUoMHgwMDEwKSAtIG5vdC1w
cmVzZW50IHBhZ2UNCj4+PiBbwqAgMTA0LjQzNjAwN10gUEdEIDAgUDREIDANCj4+PiBbwqAgMTA0
LjQzODU0N10gT29wczogMDAxMCBbIzFdIFNNUCBQVEkNCj4+PiBbwqAgMTA0LjQ0MjAzOV0gQ1BV
OiAxIFBJRDogNjA1IENvbW06IGlycS8xNS1kd2MzIE5vdCB0YWludGVkDQo+Pj4gNS45LjAtZWRp
c29uLWFjcGktc3RhbmRhcmQgIzENCj4+PiBbwqAgMTA0LjQ1MDAyN10gSGFyZHdhcmUgbmFtZTog
SW50ZWwgQ29ycG9yYXRpb24gTWVycmlmaWVsZC9CT0RFR0EgQkFZLA0KPj4+IEJJT1MgNTQyIDIw
MTUuMDEuMjE6MTguMTkuNDgNCj4+PiBbwqAgMTA0LjQ1ODgwMl0gUklQOiAwMDEwOjB4MA0KPj4+
IFvCoCAxMDQuNDYxNDI1XSBDb2RlOiBCYWQgUklQIHZhbHVlLg0KPj4+IFvCoCAxMDQuNDY0NjQ5
XSBSU1A6IDAwMTg6ZmZmZmFlNTg0MDM0ZmJmOCBFRkxBR1M6IDAwMDEwMDQ2DQo+Pj4gW8KgIDEw
NC40Njk4NzBdIFJBWDogMDAwMDAwMDAwMDAwMDAwMCBSQlg6IGZmZmY4YzE5ODYwOGEwMjggUkNY
Og0KPj4+IGZmZmY4YzE5YmI4N2ZhMDANCj4+PiBbwqAgMTA0LjQ3Njk5M10gUkRYOiAwMDAwMDAw
MGZmZmZmZjk0IFJTSTogZmZmZjhjMTliYWZhNTRlMCBSREk6DQo+Pj4gZmZmZjhjMTk4NjA5ZWUw
MA0KPj4+IFvCoCAxMDQuNDg0MTE4XSBSQlA6IGZmZmY4YzE5YmFmYTU0ZTAgUjA4OiAwMDAwMDAw
MDAwMDAwMDQ2IFIwOToNCj4+PiAwMDAwMDAwMDAwMDAwMjM4DQo+Pj4gW8KgIDEwNC40OTEyNDFd
IFIxMDogMDAwMDAwMDAwMDAwMDAyYyBSMTE6IGZmZmY4YzE5YmNmNjI0OTAgUjEyOg0KPj4+IGZm
ZmY4YzE5ODYwOWVlMDANCj4+PiBbwqAgMTA0LjQ5ODM2Nl0gUjEzOiBmZmZmOGMxOTg2MDhhMDI4
IFIxNDogMDAwMDAwMDAwMDAwMDAwMiBSMTU6DQo+Pj4gZmZmZjhjMTliYjhmZjAwMA0KPj4+IFvC
oCAxMDQuNTA1NDkzXSBGUzrCoCAwMDAwMDAwMDAwMDAwMDAwKDAwMDApIEdTOmZmZmY4YzE5YmUz
MDAwMDAoMDAwMCkNCj4+PiBrbmxHUzowMDAwMDAwMDAwMDAwMDAwDQo+Pj4gW8KgIDEwNC41MTM1
NzJdIENTOsKgIDAwMTAgRFM6IDAwMDAgRVM6IDAwMDAgQ1IwOiAwMDAwMDAwMDgwMDUwMDMzDQo+
Pj4gW8KgIDEwNC41MTkzMDldIENSMjogZmZmZmZmZmZmZmZmZmZkNiBDUjM6IDAwMDAwMDAwMmU4
MGEwMDAgQ1I0Og0KPj4+IDAwMDAwMDAwMDAxMDA2ZTANCj4+PiBbwqAgMTA0LjUyNjQzMl0gQ2Fs
bCBUcmFjZToNCj4+PiBbwqAgMTA0LjUyODg5Ml3CoCBkd2MzX2dhZGdldF9naXZlYmFjaysweGJm
LzB4MTIwDQo+Pj4gW8KgIDEwNC41MzMxNjldwqAgX19kd2MzX2dhZGdldF9lcF9kaXNhYmxlKzB4
YzUvMHgyNTANCj4+PiBbwqAgMTA0LjUzNzc4OV3CoCBkd2MzX2dhZGdldF9lcF9kaXNhYmxlKzB4
M2QvMHhkMA0KPj4+IFvCoCAxMDQuNTQyMTQ5XcKgIHVzYl9lcF9kaXNhYmxlKzB4MWQvMHg4MA0K
Pj4+IFvCoCAxMDQuNTQ1ODIzXcKgIHVfYXVkaW9fc3RvcF9jYXB0dXJlKzB4ODcvMHg5YSBbdV9h
dWRpb10NCj4+PiBbwqAgMTA0LjU1MDg4MF3CoCBhZnVuY19zZXRfYWx0KzB4NzMvMHg4MCBbdXNi
X2ZfdWFjMl0NCj4+PiBbwqAgMTA0LjU1NTU5NF3CoCBjb21wb3NpdGVfc2V0dXArMHgyMGYvMHgx
YjIwIFtsaWJjb21wb3NpdGVdDQo+Pj4gW8KgIDEwNC41NjA5MTJdwqAgPyBjb25maWdmc19jb21w
b3NpdGVfc2V0dXArMHg2Yi8weDkwIFtsaWJjb21wb3NpdGVdDQo+Pj4gW8KgIDEwNC41NjY5MjFd
wqAgY29uZmlnZnNfY29tcG9zaXRlX3NldHVwKzB4NmIvMHg5MCBbbGliY29tcG9zaXRlXQ0KPj4+
IFvCoCAxMDQuNTcyNzUyXcKgIGR3YzNfZXAwX2RlbGVnYXRlX3JlcSsweDI0LzB4NDANCj4+PiBb
wqAgMTA0LjU3NzAyMl3CoCBkd2MzX2VwMF9pbnRlcnJ1cHQrMHg0MGEvMHg5ZDgNCj4+PiBbwqAg
MTA0LjU4MTIwNV3CoCBkd2MzX3RocmVhZF9pbnRlcnJ1cHQrMHg4ODAvMHhmNzANCj4+Pg0KPj4N
Cj4+IE9vcHMsIGxvb2tzIGxpa2UgSSBjYW4ndCBtYWtlIGl0IHN5bmNocm9ub3VzIHRoaXMgd2F5
LiBDYW4geW91IHRyeQ0KPj4gSmFjaydzIGNoYW5nZSB0byB0aGUgdV9hdWRpby5jIGluc3RlYWQ/
DQo+DQo+IE9vcHMgaW5kZWVkIGdvZXMgYXdheSB3aXRoIEphY2sncyBjaGFuZ2UsIGJ1dCB1c2Ig
Y29ubmVjdGlvbiBnb2VzDQo+IHVwL2Rvd24gY29udGludW91c2x5LCBtZWFuaW5nOiBteSBob3N0
IHNlZXMgdXNiIG5ldHdvcmsgYW5kIGF1ZGlvDQo+IGRldmljZSBhcHBlYXJpbmcgLyBkaXNhcHBl
YXJpbmcuDQo+DQoNCk9rLCB0aGFua3MgZm9yIHZlcmlmeWluZyB0aGF0IGl0IHdlbnQgYXdheS4N
Cg0KPiBtYXNzX3N0b3JhZ2UgZGV2aWNlIGRvZXMgbm90IGFwcGVhciBhbGwuDQoNClRoZXJlIGFy
ZSBzb21lIGZpeGVzIHRvIGR3YzMgaW4ga2VybmVsIG1haW5saW5lLiBJcyBpdCBwb3NzaWJsZSB0
byB0ZXN0DQp0aGlzIGFnYWluc3QgbGludXgtbmV4dD8NCg0KVGhhbmtzLA0KVGhpbmgNCg0KPg0K
PiBIb3N0Og0KPiAyMS0xMC0yMDIwIDIyOjM2wqDCoMKgIGtlcm5lbMKgwqDCoCBzZCA3OjA6MDow
OiBbc2RkXSB0YWcjMCBkZXZpY2Ugb2ZmbGluZQ0KPiBvciBjaGFuZ2VkDQo+IDIxLTEwLTIwMjAg
MjI6MzbCoMKgwqAga2VybmVswqDCoMKgIGJsa191cGRhdGVfcmVxdWVzdDogSS9PIGVycm9yLCBk
ZXYgc2RkLA0KPiBzZWN0b3IgMCBvcCAweDA6KFJFQUQpIGZsYWdzIDB4MCBwaHlzX3NlZyAxIHBy
aW8gY2xhc3MgMA0KPiAyMS0xMC0yMDIwIDIyOjM2wqDCoMKgIGtlcm5lbMKgwqDCoCBCdWZmZXIg
SS9PIGVycm9yIG9uIGRldiBzZGQsIGxvZ2ljYWwNCj4gYmxvY2sgMCwgYXN5bmMgcGFnZSByZWFk
DQo+DQo+IEFuZCBvbiBlZGlzb246DQo+IE9jdCAyMSAyMjozNzozNyBlZGlzb24ga2VybmVsOiBJ
UHY2OiBBRERSQ09ORihORVRERVZfQ0hBTkdFKTogdXNiMDoNCj4gbGluayBiZWNvbWVzIHJlYWR5
DQo+IE9jdCAyMSAyMjozNzozNyBlZGlzb24ga2VybmVsWzQ5OV06IFvCoCA0MzYuNTk1OTUyXSBJ
UHY2Og0KPiBBRERSQ09ORihORVRERVZfQ0hBTkdFKTogdXNiMDogbGluayBiPg0KPiBPY3QgMjEg
MjI6Mzc6MzcgZWRpc29uIHN5c3RlbWQtbmV0d29ya2RbNTIxXTogdXNiMDogR2FpbmVkIGNhcnJp
ZXINCj4gT2N0IDIxIDIyOjM3OjM4IGVkaXNvbiBzeXN0ZW1kLW5ldHdvcmtkWzUyMV06IHVzYjA6
IEdhaW5lZCBJUHY2TEwNCj4gT2N0IDIxIDIyOjM4OjA3IGVkaXNvbiBzeXN0ZW1kLW5ldHdvcmtk
WzUyMV06IHVzYjA6IExvc3QgY2Fycmllcg0KPiBPY3QgMjEgMjI6Mzg6MDcgZWRpc29uIHN5c3Rl
bWQtam91cm5hbGRbNDM1XTogRm9yd2FyZGluZyB0byBzeXNsb2cNCj4gbWlzc2VkIDQgbWVzc2Fn
ZXMuDQo+DQoNCg==
