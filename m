Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 59BF5213654
	for <lists+linux-usb@lfdr.de>; Fri,  3 Jul 2020 10:24:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725949AbgGCIYU (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 3 Jul 2020 04:24:20 -0400
Received: from smtprelay-out1.synopsys.com ([149.117.73.133]:46250 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725779AbgGCIYT (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 3 Jul 2020 04:24:19 -0400
Received: from mailhost.synopsys.com (us03-mailhost2.synopsys.com [10.4.17.18])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id D4A3D40A64;
        Fri,  3 Jul 2020 08:24:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1593764659; bh=ty0TwGlsaOoYFo8BRZ5XpEgfih/kfe/t+XEO6TjLhqQ=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=GdJgVG9WOyCTM1W7FWFDjJTj7Lu6eO3KkYidN1ed/2Zdx08YYNRc3XK0fX3m2xa6h
         Gn8GZ+zoiSy/pr+CEhfLUQwmbZ8Q71sBk4ST5nKPoGAakcz9tnWRzBYXh8HwOdDK68
         QKYfitpyePoIBfCsYGBaAGjkez0bbXaMEZIBld12ddz7Z7VTYy2PKvnHwbE8HCM5gx
         08CmkaM609u49cNyjNuNmPxvOPAibuaNsB5698u5qf+CyISc1oHp03LkRV5966UVBE
         8kgo7dIm7D6C9qmEEc0kmcDmvwO+pyy2AXZn51cEym40+uqRL6n01DwpPWbMTDuOW7
         ysp7MevMP7lrQ==
Received: from o365relay-in.synopsys.com (us03-o365relay1.synopsys.com [10.4.161.137])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPS id 50671A0081;
        Fri,  3 Jul 2020 08:24:16 +0000 (UTC)
Received: from NAM02-CY1-obe.outbound.protection.outlook.com (mail-cys01nam02lp2052.outbound.protection.outlook.com [104.47.37.52])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client CN "mail.protection.outlook.com", Issuer "GlobalSign Organization Validation CA - SHA256 - G3" (verified OK))
        by o365relay-in.synopsys.com (Postfix) with ESMTPS id B619F8119B;
        Fri,  3 Jul 2020 08:24:16 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=hminas@synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
        dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="r1KepD89";
        dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Dw7aJ/Zus4IIXDqJ8rynAy+3GnT/jLgx9pe4bTCBNOKp0NPTP13DuZd8aAoFdlVFVt7K4OJwl0r7aTgnmK24hHluLsrBuVjfa497gILbgut0yKVgz2fYR4kvmtyvUJ7Aru9jJuNSTDHB+1gz2dL2HlHFpMAWK0Txx3y7Tq25pVxwRqMwbBKeWqIhQqJzT8G2J9QVhir9XvVOcAzUKzoMKxHHoYoUZOylL/UM10Nr7tpSGRiAHx+RoTAhvF53Ud5JTQeVvy1BHC7iiVf5/VL9LyfOpj9gEHHCmgamL4zSEWO0iP2TzQqF7bKuxedxA4+vutX43N1J7tOELa/+poGZ6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ty0TwGlsaOoYFo8BRZ5XpEgfih/kfe/t+XEO6TjLhqQ=;
 b=jCPcXhPheMXSJIjR3I2If63QIDb4tv4dbSSC80j698AjIqKRGapTyihOXFB1ylqQrTTblXW6zQgLx1CP7V210QaABSCU6ZN+mUTe9YGikxt1WiPF1XwXz5Hx+W3I2RFae8VZh+EsmmQXGn6EMrK9j+Gp/3MOxodeGDBDbqy17TOEE+RDlzKg3hXNjUXsqPMtVMUJk0OC+Va/jstDnd67Xm9oOfAhguOhOezfwa4Ia7s6k9Tkzrcn4/bxAYcA3K4mNPpQ9ymyTzciyC2IVk07KOfwYXyd+o+T7H52HoJd8DsDO63VkZU28SQ+piKcbPmY7bPxlRsZN7Lq/yrZ7UmyPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ty0TwGlsaOoYFo8BRZ5XpEgfih/kfe/t+XEO6TjLhqQ=;
 b=r1KepD891ibxZviFEmQN3Lm2b0CnBA8MFZtQHhXorpyS25W1plk1ntNY7MjNHe0jgbajQOoJKqhs/Dly9RoWbbEphqOv1ppcA56urA6I0X5qzw97HNpyqhCzO9ZwgZ35aPcQWgBK5M5OWgjfqxsYRJx15nmqRvLmbbqLKQkXDRo=
Received: from CY4PR12MB1432.namprd12.prod.outlook.com (2603:10b6:903:44::11)
 by CY4PR12MB1240.namprd12.prod.outlook.com (2603:10b6:903:3f::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3153.22; Fri, 3 Jul
 2020 08:24:15 +0000
Received: from CY4PR12MB1432.namprd12.prod.outlook.com
 ([fe80::3cb9:e2f2:a4ff:14bd]) by CY4PR12MB1432.namprd12.prod.outlook.com
 ([fe80::3cb9:e2f2:a4ff:14bd%10]) with mapi id 15.20.3153.023; Fri, 3 Jul 2020
 08:24:15 +0000
X-SNPS-Relay: synopsys.com
From:   Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>
To:     "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>
CC:     "lee.jones@linaro.org" <lee.jones@linaro.org>,
        "ben@simtec.co.uk" <ben@simtec.co.uk>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: patch "usb: dwc2: gadget: Remove assigned but never used
 'maxsize'" added to usb-testing
Thread-Topic: patch "usb: dwc2: gadget: Remove assigned but never used
 'maxsize'" added to usb-testing
Thread-Index: AQHWUQx1DzdHtP3ay0e5/fuE4d4vL6j1fHKAgAACrQCAAARKgIAAASkA
Date:   Fri, 3 Jul 2020 08:24:15 +0000
Message-ID: <576396a8-729f-83ba-c58e-481bfd68a1db@synopsys.com>
References: <1593761680160133@kroah.com>
 <825601ce-ba13-2160-8fe6-449c2617658f@synopsys.com>
 <b9a40f7b-cc22-72b5-74ef-a4ab239b8789@synopsys.com>
 <20200703082005.GB2396807@kroah.com>
In-Reply-To: <20200703082005.GB2396807@kroah.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
authentication-results: linuxfoundation.org; dkim=none (message not signed)
 header.d=none;linuxfoundation.org; dmarc=none action=none
 header.from=synopsys.com;
x-originating-ip: [37.252.92.106]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6232e6c5-50a2-4f4e-6f5c-08d81f2a7900
x-ms-traffictypediagnostic: CY4PR12MB1240:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CY4PR12MB1240709DF86527DD55CD7704A76A0@CY4PR12MB1240.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 045315E1EE
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: k5S0McL5+9n+MpfE5meKR9PL1lUxy9SQjVUnAIWc8OQ3nSWrlQwn14v37QdyQdzv3nN+VNkQNV6+miu2rL89V0b4mwMarS3dxEmrlKoZZ53V1dlxIQIMKAmtT/jcTml1Q78A/ilMcl88Hz4/fTGBEmxi/7SSZaN7dFoypgx/+tl5hBHjRyf9nRXTIjy/ihTRJhoi53iAj8FtgEeUXO/+1xFesUT8xnSSN+Pdq0noO86poIQl5f9al/b/Bfoerkjnp81bt81U3sJYH6a46LycVerir6vmV6l+8UFHNSRUNX0x6XPYTgCC7iAB5QfhnYFTLpHdUlA2Sp9RQCCCvNLy0JJW6jJFXtoqd1a/Tr2RQ19CyJL3/3hHMxNsZLIdRSsr
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY4PR12MB1432.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(396003)(136003)(376002)(39860400002)(346002)(366004)(5660300002)(6512007)(4326008)(8936002)(66556008)(64756008)(66476007)(66946007)(91956017)(478600001)(76116006)(110136005)(66446008)(54906003)(316002)(6506007)(31696002)(6486002)(26005)(8676002)(2616005)(53546011)(86362001)(186003)(83380400001)(71200400001)(31686004)(2906002)(36756003)(43740500002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: fh/p/ZiM1FNXCETrO5wpymHeVPCPw36qPMB7hu2XCnW3HvWij+ZeaaV9oyVvv3W9LaYhDyOmkr4iIW3TaQvlQDa5sihaia+RXNCKNFxny3EIl3ao/CRVIOSxLE7iIA3TFbU0hHXgd5XoFxkvR2UkevGTbIk4Lf/xC1r8qd/EhEH0BB10hcZfZ1x2OhhP36J4PgvMvozP+/AIsbIuVHZyqLTWfJ0FT9JRV3AgNZyqFVpkDTXaAnmTb1qD4CnJlFchyjrUbD4mr+lRU1ekk8wb7dxzRblVTlrv19NtpkI+8niAi6KN4HRpGoaQrSP/Auu+Ms7ylO3mJCUVlRGY3e+Q42yOMqLwqeAZdPb18P4PJTZk3uq7FkSe6yGIYTV6IgrH9UhF4OeeXKB49L9HWrPoUtdJsiMeaCX2jqYIgoXpt0vuqjo9ToQyIs6p+vpPF2zaiT5Ygk8yJ64YX3C3EKuCeC3XZpCbdC/T+voLMoTgxYA=
Content-Type: text/plain; charset="utf-8"
Content-ID: <D61D1B0B195EF34DBBB9E327B86A7349@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY4PR12MB1432.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6232e6c5-50a2-4f4e-6f5c-08d81f2a7900
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Jul 2020 08:24:15.0505
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KAbPHyHUqkwW9ZJjOgUEaFn7y++dXLiz1DKFiIbqdzZ2xYuTl6zsNVaqi5s9hGbTyK3cBMdAnt1EELSEopMK+g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR12MB1240
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

SGksDQoNCk9uIDcvMy8yMDIwIDEyOjIwIFBNLCBncmVna2hAbGludXhmb3VuZGF0aW9uLm9yZyB3
cm90ZToNCj4gT24gRnJpLCBKdWwgMDMsIDIwMjAgYXQgMDg6MDQ6NDVBTSArMDAwMCwgTWluYXMg
SGFydXR5dW55YW4gd3JvdGU6DQo+PiBBZGRlZCBsaW51eC11c2JAdmdlci5rZXJuZWwub3JnIHRv
IHJlY2lwaWVudCBsaXN0Lg0KPj4gTWluYXMNCj4+DQo+Pg0KPj4gT24gNy8zLzIwMjAgMTE6NTUg
QU0sIE1pbmFzIEhhcnV0eXVueWFuIHdyb3RlOg0KPj4+IEhpLA0KPj4+DQo+Pj4gT24gNy8zLzIw
MjAgMTE6MzQgQU0sIGdyZWdraEBsaW51eGZvdW5kYXRpb24ub3JnIHdyb3RlOg0KPj4+Pg0KPj4+
PiBUaGlzIGlzIGEgbm90ZSB0byBsZXQgeW91IGtub3cgdGhhdCBJJ3ZlIGp1c3QgYWRkZWQgdGhl
IHBhdGNoIHRpdGxlZA0KPj4+Pg0KPj4+PiAgICAgICAgdXNiOiBkd2MyOiBnYWRnZXQ6IFJlbW92
ZSBhc3NpZ25lZCBidXQgbmV2ZXIgdXNlZCAnbWF4c2l6ZScNCj4+Pj4NCj4+Pj4gdG8gbXkgdXNi
IGdpdCB0cmVlIHdoaWNoIGNhbiBiZSBmb3VuZCBhdA0KPj4+PiAgICAgICAgZ2l0Oi8vZ2l0Lmtl
cm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L2dyZWdraC91c2IuZ2l0DQo+Pj4+IGlu
IHRoZSB1c2ItdGVzdGluZyBicmFuY2guDQo+Pj4+DQo+Pj4+IFRoZSBwYXRjaCB3aWxsIHNob3cg
dXAgaW4gdGhlIG5leHQgcmVsZWFzZSBvZiB0aGUgbGludXgtbmV4dCB0cmVlDQo+Pj4+ICh1c3Vh
bGx5IHNvbWV0aW1lIHdpdGhpbiB0aGUgbmV4dCAyNCBob3VycyBkdXJpbmcgdGhlIHdlZWsuKQ0K
Pj4+Pg0KPj4+PiBUaGUgcGF0Y2ggd2lsbCBiZSBtZXJnZWQgdG8gdGhlIHVzYi1uZXh0IGJyYW5j
aCBzb21ldGltZSBzb29uLA0KPj4+PiBhZnRlciBpdCBwYXNzZXMgdGVzdGluZywgYW5kIHRoZSBt
ZXJnZSB3aW5kb3cgaXMgb3Blbi4NCj4+Pj4NCj4+Pj4gSWYgeW91IGhhdmUgYW55IHF1ZXN0aW9u
cyBhYm91dCB0aGlzIHByb2Nlc3MsIHBsZWFzZSBsZXQgbWUga25vdy4NCj4+Pj4NCj4+Pj4NCj4+
Pg0KPj4+IEdyZWcsIEknbGwgcHJlZmVyIGlmIExlZSBKb25lcyBhZGQgIkZpeGVzOiIgdGFnIGFu
ZCByZXN1Ym1pdCB2Mi4NCj4gDQo+IFRoZXJlIGlzIG5vICJGaXhlczoiIG5lZWRlZCBmb3Igc29t
ZXRoaW5nIGxpa2UgdGhpcywgSSdtIGdvaWduIHRvIGxlYXZlDQo+IGl0IGFzLWlzLCB0aGFua3Mu
DQo+IA0KT2suDQoNCkFja2VkLWJ5OiBNaW5hcyBIYXJ1dHl1bnlhbiA8aG1pbmFzQHN5bm9wc3lz
LmNvbT4NCg0KVGhhbmtzLA0KTWluYXMNCg0KDQo+IGdyZWcgay1oDQo+IA0K
