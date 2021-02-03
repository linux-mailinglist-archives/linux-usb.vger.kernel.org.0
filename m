Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 31B7330D0AF
	for <lists+linux-usb@lfdr.de>; Wed,  3 Feb 2021 02:17:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229838AbhBCBRK (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 2 Feb 2021 20:17:10 -0500
Received: from smtprelay-out1.synopsys.com ([149.117.87.133]:58512 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229767AbhBCBRJ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 2 Feb 2021 20:17:09 -0500
Received: from mailhost.synopsys.com (us03-mailhost1.synopsys.com [10.4.17.17])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 8F79CC00A7;
        Wed,  3 Feb 2021 01:16:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1612314968; bh=XgIYFrTwRDSbG+p3OiIUbOwRtPB5AH+0YW5L2j1hL3s=;
        h=From:To:Subject:Date:References:In-Reply-To:From;
        b=AtUNk5yVtKXSaT5oQ4xQuCXe0dEqW3pZqRECLvFD+GuqVew7CHsFiBSi6VewxMQvK
         ehYP3MO+3jEKEDDpo/3x7Bd4VOKwJwA1KF9SYE/dBtpZHrwSPWkmtgRKGfvqvpHmaH
         elLh7Ngg5sjqpZXPujxOhTm3j8aZrmvLIIGwvNdPxk3PzTYBidISppa4Jw58yN6vsP
         TBTUAxkmoyYm7xTihk/ogmCGjqK30Vge7xeiTaC5/CTj+9Q8Q174ckQOTRNd0X5sas
         ukXag2d1D7k+3jfs1wXeZ1cMNiaNUHWu3VLL0cmfshQkx83g8OqfgE8m3+W6NOqqW8
         GVXhhVUDQ3vYw==
Received: from o365relay-in.synopsys.com (us03-o365relay3.synopsys.com [10.4.161.139])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPS id 2075CA0080;
        Wed,  3 Feb 2021 01:16:07 +0000 (UTC)
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2170.outbound.protection.outlook.com [104.47.55.170])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client CN "mail.protection.outlook.com", Issuer "GlobalSign Organization Validation CA - SHA256 - G3" (verified OK))
        by o365relay-in.synopsys.com (Postfix) with ESMTPS id 0F7FB80268;
        Wed,  3 Feb 2021 01:16:06 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=thinhn@synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
        dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="wQqvZbsi";
        dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m7gjAFNpN2hSutrr0ZD/7YSoKlpcGt17BWVhNEVXUVPTGcm2FH3b2iMxDUTNr462kwzIoAdWNk1YjE1IRnyv/xbyC79M9DN7Vw03u5e90mg6G2yNcjwEglTPik3VotTeCVo+WpeE4AeDjNeE8iKo/SqcWaMRjYQPVUI235F4TkrEusOPGOawCPi403OgAsJ7e/0H7MwZt9HXGvdxVEu4PubZYjbd67gqRHE5M7G9E2AW0sZqv4h4Iq0pyxz5qLGsLE2xUsAHbXKJnZCIv8AJ0yionNL5vpMa2ZCitQaElSo6TTN3YfjLxfTV+e7/UCqbkkOeHGkjIAp3KSP4bk6L+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XgIYFrTwRDSbG+p3OiIUbOwRtPB5AH+0YW5L2j1hL3s=;
 b=ehZuHuoekBMOlFm2/vpgOHfQbcS+MTLW6iEt5BTRCFGxdMkQmjUkjYeco+iiF2iuH4kP47cxQJCsc881jJuZAkQNTvJo2gZOI3hSwcr+jnJin/nzprgoqb0lrcCEPY33sfXRCs1nvI1aHX5mEW9y5gjqzabtLAWFi6h3AM+1NBxF5eOGHrsI61cJbJvgJC88j4YX8VS088QfGK7SxhTWQIbMUCRYjWj/+X0dYewTkwelj94A0p7AvUn8jh0ensTLn1vgNIDCvmDF5fWxNtyNgQXXpVpgaeMsfO8tYobC+8Qmx7pvy839wFYqlGCksOv7SK7tnSHfgMgjcydrIwJV7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XgIYFrTwRDSbG+p3OiIUbOwRtPB5AH+0YW5L2j1hL3s=;
 b=wQqvZbsi7Zdt6cupTRCY65xUVQwUSQ9K/kUVduIsZEuPizKhI7dv+BtQw1/KZm8PmyhEiLonDOElT//kAnlN3NDvGcTutW7Onw7eV9XCavOe3+HQjbUy8Z0sSCZxtrkTv9la0VdBZxKEjeZk2Gyh0tNVB/Iwr3Q18mgXojaN9A4=
Received: from BYAPR12MB4791.namprd12.prod.outlook.com (2603:10b6:a03:10a::12)
 by BY5PR12MB3747.namprd12.prod.outlook.com (2603:10b6:a03:1ac::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.22; Wed, 3 Feb
 2021 01:16:03 +0000
Received: from BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::895b:620d:8f20:c4d6]) by BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::895b:620d:8f20:c4d6%6]) with mapi id 15.20.3805.026; Wed, 3 Feb 2021
 01:16:03 +0000
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To:     Sergei Shtylyov <sergei.shtylyov@gmail.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Mathias Nyman <mathias.nyman@intel.com>
Subject: Re: [RFC PATCH 6/8] usb: xhci: Fix port minor revision
Thread-Topic: [RFC PATCH 6/8] usb: xhci: Fix port minor revision
Thread-Index: AQHW+RV+hDKTpHds3UON+skS200saKpEkq2AgAEPbgA=
Date:   Wed, 3 Feb 2021 01:16:03 +0000
Message-ID: <5efc3bb3-1320-f382-c6f6-b8cefd91b8ce@synopsys.com>
References: <cover.1612237179.git.Thinh.Nguyen@synopsys.com>
 <4627ca7e922019cd9a37073db90e4e9cd585c97e.1612237179.git.Thinh.Nguyen@synopsys.com>
 <90627b9d-9a39-b5ee-4ae3-054764a57faa@gmail.com>
In-Reply-To: <90627b9d-9a39-b5ee-4ae3-054764a57faa@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=synopsys.com;
x-originating-ip: [98.248.94.126]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b26e4a25-2540-454a-3acc-08d8c7e1467c
x-ms-traffictypediagnostic: BY5PR12MB3747:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BY5PR12MB37476D8CF9589398CA3A1517AAB49@BY5PR12MB3747.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: RA/gHD4K6zKltX9or0uUyNcIbvXgHCuf5pvFGumHKMTTLqu797YStgUzXqjH9XS82oayYKR6rfKm2cZ3SY+A/mwAF92RuIuOS3iwpLVe5PsBtkCd2vep8XmX0qt0/qSLZ0Y1NFeTihkXC5glaeC9SjO1T+rrdvkWYuaE9KABDSyXs+OwN1BZUDLqc+9lh+ECwVRbsFzx+4uyiqva1Oas9jXeabeUQSPYfClxMg7VGnQx3pZU+QyrHJgmmqb4Wx4WfAmYsOf/CEMDBZ4tfvj8cJau2mA7K6Lke4VQ7yPsU9oYDubHJyYpEX0tL6SJEYizL4GZBqIwHH/1qgqz5oOYD7kdC7Z8m3lrhrYsamBK/BW7gF8KtAYQjnV4ixRyu4Q1siRdgFjt/lUjZdgerw8isHlbqZ7OmZbMsxKbMVu7vh5gWn58WoQFoEuHGkB1RFVd4lIwcR+37ZzHz8XGYGBPVmvjnopcAQCe+Hygbm3y0oo4A5Q1/LkLlL500yAhoQ9DVSKGrA2N8ERZa/ctpUfdrL+zTjf/C3Nbj7Ux8f/KAfg9OeWKUPqL5+5nOS0bMd7hAuaM4LcW0r2G/+1kVa+/pTgR1vVRk9HnagClse4+yj4=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB4791.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(376002)(346002)(396003)(136003)(366004)(39860400002)(53546011)(6486002)(2906002)(66946007)(8676002)(76116006)(64756008)(66446008)(6512007)(66556008)(66476007)(5660300002)(6506007)(36756003)(110136005)(2616005)(71200400001)(186003)(26005)(86362001)(316002)(31686004)(478600001)(31696002)(8936002)(45980500001)(43740500002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: =?utf-8?B?ajR4c0dPREhBSCtJOVhBUW9IVThLL1Y3SkdUaFF1QmdDWVprV2haQ00ybjJy?=
 =?utf-8?B?VWMvQ2ttUnI5SUhlVVpwSWFYN1FuV3UrKzR3ekZjRE9oQnc1TDZrRTlzMllZ?=
 =?utf-8?B?aEhFeXJNNTJXK00wd2p6b2U5em5NQ1p6VEhMeWFCd0dCR0VQbXpVSzBQUVlI?=
 =?utf-8?B?Yk9UNTJJQ2lhT3gvTURZWUNpd0lHTEJpWllHWE5ENkx1WWJmalhUU042UDNQ?=
 =?utf-8?B?ZWxVVVllTFhjTGJOZDJQbEJlL1JYdHQwV3NDQ3JuNXhqczA1MTFVeFhPaDJ5?=
 =?utf-8?B?NDl0RjE1dXhndVlhb2k5RFpWeS9Na1pTQkRzeVJTWFdZb0RZeEhuT1E4YTJX?=
 =?utf-8?B?ZndmTWIzV3ltSU4zS1lhWWdlVkYxWWJXdmF0MEFMM1dBWTNVdWJDM1NIMXNJ?=
 =?utf-8?B?aTlCY29TMDFlaUd4R1R3SnhwNjZ6bDdjYjg1eXhLUjdvUkVzNTJoYStwQXg1?=
 =?utf-8?B?VllrMzkzSmFLeTJUV3o3ZzZLbmVvZVN6cmhhSEpadVoyMVFtbG5aazk2enZ2?=
 =?utf-8?B?ZEt5aDNocGRtMUthSkZFY1cra05uUGNzNGVtYm1GTXdTK3I1U1VRZ2hqOVQy?=
 =?utf-8?B?SjlORElZRTV6YlFjWGVaNWZHRUo5TXRTbUswSlRobjhhTUFDK08yVkozU0M3?=
 =?utf-8?B?bWVUTUpwaDNTVFpZZnFSOVpINWx4WnFwWjNGRDFIbUFsbjlTRmtPZGxEa1JX?=
 =?utf-8?B?ZlFtNmxHa0JkWC85Ym9Jd1BLR3Z2RWtNajdJZ0FBMzBXTGVhYk1aQ2poU0R6?=
 =?utf-8?B?WFRKRE9zMS9MZFpEQmxGV0ZIdHV5VXNNT3kxcm5UMXNkZFh4VGcyeTBXMVhV?=
 =?utf-8?B?eHkwNGZHSWY4SFZ5NmZ3eXo1UVRrOERXQ1FiTU5ycTBDaWkyMWpXckVkWFdN?=
 =?utf-8?B?Mkg4U2hFTlVJQUlsMWpNWjFNcTZTUjNRalZmTzNaZHhxRVdFZGEydkE3aGRL?=
 =?utf-8?B?Zy9kODAzY0dzY29DcjhnUk4xK0h1OUpQUHJkTEhzVDF6V1hPNWgzNUtWb0lu?=
 =?utf-8?B?Nmh5VjAwNk03VXExQzBLKzlXZWZhSS80OU5laDJJdmJVV05XZ0QvSyszSWlz?=
 =?utf-8?B?eHRjUWFrNEV3WU5pclc3eUUydUcyT0Q3bk4xZXcxMkd0eXFtNXRMUVpiRHFU?=
 =?utf-8?B?eGRVdHRLN1daaENIYktuMldMWXVUaTFsc0hZaTBBSWRIditTV0EyZG44SEk3?=
 =?utf-8?B?ZUNCL0lNV1B3MzRmSjdseW5vRHlSZW9tR3JYcXR3UnhFRlcva3BRYnQvNTha?=
 =?utf-8?B?NkYzbUYzNmhrZktpZFhPRlNjRlhFanlLUEdMeHlBaVNJdGRiV21kS2U2VjJ6?=
 =?utf-8?B?cmpRNkllR0Z5QThST25tbmUvUnhRbFJjbTNaVXBsMmZVVlRyRGVVdXhmc2V3?=
 =?utf-8?B?dDdPbjJuRVNGUWo0aE1IMlgyazRNTXhic3dtTEtWZWNwWGhuWTlVN0hyWXJr?=
 =?utf-8?Q?BkJTsxAj?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <9371B23C4FF7DF4189FB4455B33DE951@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB4791.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b26e4a25-2540-454a-3acc-08d8c7e1467c
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Feb 2021 01:16:03.6121
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DXDHvxRYRTqH79jn0+4xsoSr+VE4oDn8riFJkKSrz0pEYTh/9LUQCyBowI0QDDEoGvnYkIvtMVpM4OFFL8M5+w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB3747
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

U2VyZ2VpIFNodHlseW92IHdyb3RlOg0KPiBIZWxsbyENCj4NCj4gT24gMDIuMDIuMjAyMSA2OjQy
LCBUaGluaCBOZ3V5ZW4gd3JvdGU6DQo+DQo+PiBTb21lIGhvc3RzIGluY29ycmVjdGx5IHVzZSBz
dWItbWlub3IgdmVyc2lvbiBmb3IgbWlub3IgdmVyc2lvbiAoaS5lLg0KPj4gMHgwMiBpbnN0ZWFk
IG9mIDB4MjAgZm9yIGJjZFVTQiAweDMyMCBhbmQgMHgwMSBmb3IgYmNkVVNCIDB4MzEwKS4NCj4+
IEN1cnJlbnRseSB0aGUgeEhDSSBkcml2ZXIgd29ya3MgYXJvdW5kIHRoaXMgYnkganVzdCBjaGVj
a2luZyBmb3IgbWlub3INCj4+IHJldmlzaW9uID4gMHgwMSBmb3IgVVNCIDMuMSBldmVyeXdoZXJl
LiBXaXRoIHRoZSBhZGRpdGlvbiBvZiBVU0IgMy4yLA0KPj4gY2hlY2tpbmcgdGhpcyBnZXRzIGEg
Yml0IGN1bWJlcnNvbWUuIFNpbmNlIHRoZXJlIGlzIG5vIFVTQiByZWxlYXNlIHdpdGgNCj4+IGJj
ZFVTQiAweDMwMSB0byAweDMwOSwgd2UgY2FuIGFzc3VtZSB0aGF0IHN1Yi1taW5vciB2ZXJzaW9u
IDAxIHRvIDA5IGlzDQo+PiBpbmNvcnJlY3QuIExldCdzIHRyeSB0byBmaXggdGhpcyBhbmQgdXNl
IHRoZSBtaW5vciByZXZpc2lvbiB0aGF0IG1hdGNoZXMNCj4+IHdpdGggdGhlIFVTQi94SENJIHNw
ZWMgdG8gaGVscCB3aXRoIHRoZSB2ZXJzaW9uIGNoZWNraW5nIHdpdGhpbiB0aGUNCj4+IGRyaXZl
ci4NCj4+DQo+PiBTaWduZWQtb2ZmLWJ5OiBUaGluaCBOZ3V5ZW4gPFRoaW5oLk5ndXllbkBzeW5v
cHN5cy5jb20+DQo+PiAtLS0NCj4+IMKgIGRyaXZlcnMvdXNiL2hvc3QveGhjaS1tZW0uYyB8IDkg
KysrKysrKysrDQo+PiDCoCAxIGZpbGUgY2hhbmdlZCwgOSBpbnNlcnRpb25zKCspDQo+Pg0KPj4g
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvdXNiL2hvc3QveGhjaS1tZW0uYyBiL2RyaXZlcnMvdXNiL2hv
c3QveGhjaS1tZW0uYw0KPj4gaW5kZXggZjJjNGVlN2M0Nzg2Li4zNDEwNWI0NzdjNjIgMTAwNjQ0
DQo+PiAtLS0gYS9kcml2ZXJzL3VzYi9ob3N0L3hoY2ktbWVtLmMNCj4+ICsrKyBiL2RyaXZlcnMv
dXNiL2hvc3QveGhjaS1tZW0uYw0KPj4gQEAgLTIxMjksNiArMjEyOSwxNSBAQCBzdGF0aWMgdm9p
ZCB4aGNpX2FkZF9pbl9wb3J0KHN0cnVjdCB4aGNpX2hjZA0KPj4gKnhoY2ksIHVuc2lnbmVkIGlu
dCBudW1fcG9ydHMsDQo+PiDCoCDCoMKgwqDCoMKgIGlmIChtYWpvcl9yZXZpc2lvbiA9PSAweDAz
KSB7DQo+PiDCoMKgwqDCoMKgwqDCoMKgwqAgcmh1YiA9ICZ4aGNpLT51c2IzX3JodWI7DQo+PiAr
wqDCoMKgwqDCoMKgwqAgLyoNCj4+ICvCoMKgwqDCoMKgwqDCoMKgICogU29tZSBob3N0cyBpbmNv
cnJlY3RseSB1c2Ugc3ViLW1pbm9yIHZlcnNpb24gZm9yIG1pbm9yDQo+PiArwqDCoMKgwqDCoMKg
wqDCoCAqIHZlcnNpb24gKGkuZS4gMHgwMiBpbnN0ZWFkIG9mIDB4MjAgZm9yIGJjZFVTQiAweDMy
MCBhbmQgMHgwMQ0KPj4gK8KgwqDCoMKgwqDCoMKgwqAgKiBmb3IgYmNkVVNCIDB4MzEwKS4gU2lu
Y2UgdGhlcmUgaXMgbm8gVVNCIHJlbGVhc2Ugd2l0aCBzdWINCj4+ICvCoMKgwqDCoMKgwqDCoMKg
ICogbWlub3IgdmVyc2lvbiAweDMwMSB0byAweDMwOSwgd2UgY2FuIGFzc3VtZSB0aGF0IHRoZXkg
YXJlDQo+PiArwqDCoMKgwqDCoMKgwqDCoCAqIGluY29ycmVjdCBhbmQgZml4IGl0IGhlcmUuDQo+
PiArwqDCoMKgwqDCoMKgwqDCoCAqLw0KPj4gK8KgwqDCoMKgwqDCoMKgIGlmICghKG1pbm9yX3Jl
dmlzaW9uICYgMHhmMCkgJiYgKG1pbm9yX3JldmlzaW9uICYgMHgwZikpDQo+PiArwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCBtaW5vcl9yZXZpc2lvbiA9IG1pbm9yX3JldmlzaW9uIDw8IDQ7DQo+DQo+
IMKgwqAgV2h5IG5vdDoNCj4NCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBtaW5vcl9yZXZpc2lv
biA8PD0gNDsNCj4NCj4gWy4uLl0NCj4NCj4gTUJSLCBTZXJnZWkNCg0KU3VyZSwgd2UgY2FuIGRv
IHRoYXQuDQoNClRoYW5rcywNClRoaW5oDQo=
