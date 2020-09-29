Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DDB6C27BDDC
	for <lists+linux-usb@lfdr.de>; Tue, 29 Sep 2020 09:19:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725535AbgI2HTp (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 29 Sep 2020 03:19:45 -0400
Received: from smtprelay-out1.synopsys.com ([149.117.73.133]:60210 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725306AbgI2HTp (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 29 Sep 2020 03:19:45 -0400
Received: from mailhost.synopsys.com (badc-mailhost1.synopsys.com [10.192.0.17])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 944324017E;
        Tue, 29 Sep 2020 07:19:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1601363984; bh=S5Xt6dEAdJhwG3ZVOk78uG/K1BZJ0z6UUQIKuzJy10w=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=AH6I0t3cW7dGXueLoelRrgzzlV/UbU2ye2F7z2fXFpcoV2FcLkv/qjTdvBGE3IKgP
         +g72RWgaQgFsvhIEfEog+rJWOesAn5fIWAUQqv9lWCmnIX5uP6royCOuYUInyXD5e+
         csnRDEqa6OTYn3SyfR/Zcxqznsy+KuQ3glBRErpGntq41kenD9gMZuMHCLnofM7VNm
         HWlk+GWnxR20vLn3zIRxDrXpLwQnDZEcdltxR7JFelmMGHpyVSjVmt3jAdlSUYgwQ0
         DYXIXKeNAJCIgH52OzRxT6FMZKh3zMbyjIuCD1J4YmSh+R1O08CVHTuazVCb2uXexD
         b7eX0SL7uwNfw==
Received: from o365relay-in.synopsys.com (us03-o365relay1.synopsys.com [10.4.161.137])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPS id 303B5A0071;
        Tue, 29 Sep 2020 07:19:43 +0000 (UTC)
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2171.outbound.protection.outlook.com [104.47.55.171])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client CN "mail.protection.outlook.com", Issuer "GlobalSign Organization Validation CA - SHA256 - G3" (verified OK))
        by o365relay-in.synopsys.com (Postfix) with ESMTPS id 731AE801DE;
        Tue, 29 Sep 2020 07:19:42 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=thinhn@synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
        dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="lFIVRp3m";
        dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=goS5kY3aNEdhvfmDZdwn/tnOGR3jmvc3l7AtBM9Ih49zE1CCOYhHB+aOj/hi5/RldSzeaX3a4LN5B+s/fu0c3hvW/aZNYLwdCH8ctMS9HRbImn+5D6Ejey5X1UDPDNp/2ICdJaF3nvZTgM6TMGv5Rg+53kuaId+L/yuuSGn80wjRmGRrMvfW+rDD7X2EHF6HzbvHbC7WT0LdQ57aaS7c6iqvDR/Qe7083xfgwE7zI3JfCbAWh7DZtv0nBU11+AaCT89PrTnLHwl6bGV/lpiq9SniDIuJpwc0vlwkZ7IJNhFg18JRGqKNIT6xmjuNC2b/mM985JBot3C/hUSp93LI0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S5Xt6dEAdJhwG3ZVOk78uG/K1BZJ0z6UUQIKuzJy10w=;
 b=irmbjTrQ51nZx/Lk7hZkW7yg8ruQGKpR+21MQptgIJn48eqSNbXt85axkQemE/tQaZpiooNdW2QgeeWLWqB1h7ZlQVgDgx2+pQRYhcWJlJIYjlMNwSmr/hkEFHgIEYei0G3w34+wnkdSLZRPW0zrPBzpIRkcVT0DUD3NiRJbeRWKo2IJRxZzH+1qhbv1S2CMVMJ7+ic6osawbUIlfDSUsPVC6e7pAO9Dx3UgS5s93Wm/oRg8GYwPS/rjdCa4sdxeEhzf61SH3ySBL22dEeVOElS8q3feqw3y15wnoTjUsxkJyjcuacWCMhI50LZ4NMdGPGGb3Y8T/aJgNn2nRuN2SQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S5Xt6dEAdJhwG3ZVOk78uG/K1BZJ0z6UUQIKuzJy10w=;
 b=lFIVRp3mjCgt/Cm+z9C7AIXeP26l48sO9ZyZWoC3TAmWVcV4DGyty5vBaJDpo+UwXEGEQj92Npw5Dk0aXSBu6jRFxW/VdRSDlZEDL8c/vxMwmUE5OPNuULP24jCld8p78TIERq5/xa2tLDWc0nPzq9fdKqtUZw5GKWpYWmNaqEc=
Received: from BYAPR12MB2917.namprd12.prod.outlook.com (2603:10b6:a03:130::14)
 by BY5PR12MB4999.namprd12.prod.outlook.com (2603:10b6:a03:1da::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3412.20; Tue, 29 Sep
 2020 07:19:40 +0000
Received: from BYAPR12MB2917.namprd12.prod.outlook.com
 ([fe80::c98f:a13f:fd88:c209]) by BYAPR12MB2917.namprd12.prod.outlook.com
 ([fe80::c98f:a13f:fd88:c209%7]) with mapi id 15.20.3412.029; Tue, 29 Sep 2020
 07:19:39 +0000
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To:     Felipe Balbi <balbi@kernel.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
CC:     John Youn <John.Youn@synopsys.com>
Subject: Re: [PATCH] usb: dwc3: gadget: Allow restarting a transfer
Thread-Topic: [PATCH] usb: dwc3: gadget: Allow restarting a transfer
Thread-Index: AQHWlf9O5ZA+lSt5NEqMI/xxG3ENY6l/KVcAgAAMc4A=
Date:   Tue, 29 Sep 2020 07:19:39 +0000
Message-ID: <b36122b9-5692-4199-cc1e-3dfa47ffc1d8@synopsys.com>
References: <d2664c6b9cbaa091c1ce7bea25e02989fc7f6272.1601342393.git.Thinh.Nguyen@synopsys.com>
 <87h7rh9jl1.fsf@kernel.org>
In-Reply-To: <87h7rh9jl1.fsf@kernel.org>
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
x-ms-office365-filtering-correlation-id: 5dffdeea-4c11-4add-0ffd-08d86448077e
x-ms-traffictypediagnostic: BY5PR12MB4999:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BY5PR12MB499920DC66A51A241B6C9B53AA320@BY5PR12MB4999.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4502;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: t3OpUwl5CRawhALONPie4qe0ffMsvxrPM0Z/t3R+IBLiiRhKUvTrbubaOGCcCbjmclRNE8gs91Y1+NWWmZPpxBa24cQW8BA8VLp4JR2R1MESRz1kMYZ7R+QfM+S9ojIK2xYuWFYssO4zyp04LsFxO6KjWhGXDYVpv3S+2n9qA1ETwC1ZEm33RkF3znzP5cC67GwNHUYcnOXLgupkfciRpI1ZcE2XxqCg8bQPBduAe1R4q4XQ2X0LwN/j9zHL5OBzEFHgFhrFyifvH/ujAbJf6O/TvN633xmRxC1wPTacqd8KkVMx+eaU0pgz7Yt2FJsNQab2qmc4HdnLU1zWYZV9hD2RGHbtDTW63Mh2msIUYYMOvk2vNe66og7aLw+Wws1Zz1uunE5rpCAVsllCboeL7a5N3hh/tUgD4yBbS8QoZXgN4XPwz7qJerLUpSbYBw11
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB2917.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(396003)(39860400002)(366004)(346002)(376002)(6506007)(478600001)(2906002)(110136005)(31686004)(107886003)(2616005)(71200400001)(186003)(5660300002)(66556008)(64756008)(6512007)(66476007)(66446008)(316002)(4326008)(83380400001)(86362001)(66946007)(8936002)(36756003)(8676002)(26005)(76116006)(31696002)(6486002)(43740500002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: GfAPpwlwpEjQ/+JHOCvPdqSATEacE2WpfuLtu3zEX80grqFK0+7JwzTUeK8nZC3/XCJpajQGqng2Zd3KrFa5b2pGv2c6aptrMPJe/plMfK9NMqf2n38a69NoDVOqqMpD90A8Y0WxnTRLhJSREb3B/FevhxnFYW9xhhOL5TV+WSJX+XzT3FXzckJg74qVfZOP9/K1Rugus4Zjtl+3KM4vuljHujYYijfOZTzxeOwtNnAhXnpvmaY8bZ8zOOdedxoI2JoEWRpz+rjV8ceHM8YLBBcOVpN8bJusRVSZyHWFEWmmQN58ulDUwDE4YsiPFB/dnWvh/mg30zMl1Tvx2p8ZpIcCo/rk6RTyHDEcRdnz7HDMxQMF01jUwh94yVucWuS8q7bIzP3sjlglDmwQssYBscevuk7avOOU/EfVHIz1smrl61bxFGbV8xWU53x5LgRULlLQDfyVl8p2xYuc5azpVxEKIx5N+A18YdWu5T6WhavwUZr3UByqhiuokbN8KJjVuNxokVGUstusK18Htbrrrg7686YtRNH0DhCGyB+wvCN5j0Dzf0REBUPJxwm1C4TDH1NAKFoUjJSitflnkUKUMUdtu44Fs8/jXPdtP2GKoHik5Q5B4lWFnDLP6Im0pz2tDDcizqKQ7h3HyUMlijZWgg==
Content-Type: text/plain; charset="utf-8"
Content-ID: <DA80930B6EDE374AAC861428762965F2@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB2917.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5dffdeea-4c11-4add-0ffd-08d86448077e
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Sep 2020 07:19:39.7561
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hmygRlPdeMNzx3Z9Hvjz9XYau8rz9ScWTamSprlEHOu0RFAUhz23kndyEKGZ5U7D5Cuu1ezg/P7ueQORYpB1Pg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4999
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

RmVsaXBlIEJhbGJpIHdyb3RlOg0KPiBUaGluaCBOZ3V5ZW4gPFRoaW5oLk5ndXllbkBzeW5vcHN5
cy5jb20+IHdyaXRlczoNCj4NCj4+IEZvciBzdHJlYW1zLCBzb21ldGltZSBob3N0IG1heSByZWpl
Y3QgYSBzdHJlYW0gYW5kIHRoZSBkZXZpY2UgbWF5IG5lZWQNCj4+IHRvIHJlaW5pdGlhdGUgdGhh
dCBzdHJlYW0gYnkgc3RvcHBpbmcgYW5kIHJlc3RhcnRpbmcgYSB0cmFuc2Zlci4gSW4gdGhpcw0K
Pj4gY2FzZSwgYWxsIHRoZSBUUkJzIG1heSBoYXZlIGFscmVhZHkgYmVlbiBwcmVwYXJlZC4gQWxs
b3cgdGhlDQo+PiBfX2R3YzNfZ2FkZ2V0X2tpY2tfdHJhbnNmZXIoKSB0byBnbyB0aHJvdWdoIHRv
IHJlaW5pdGlhdGUgdGhlIHN0cmVhbS4NCj4+DQo+PiBTaWduZWQtb2ZmLWJ5OiBUaGluaCBOZ3V5
ZW4gPFRoaW5oLk5ndXllbkBzeW5vcHN5cy5jb20+DQo+PiAtLS0NCj4+ICBkcml2ZXJzL3VzYi9k
d2MzL2dhZGdldC5jIHwgMiArLQ0KPj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwg
MSBkZWxldGlvbigtKQ0KPj4NCj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3VzYi9kd2MzL2dhZGdl
dC5jIGIvZHJpdmVycy91c2IvZHdjMy9nYWRnZXQuYw0KPj4gaW5kZXggODJiYzA3NWJhOTdjLi5j
NTNhMjJmMGQ5NTIgMTAwNjQ0DQo+PiAtLS0gYS9kcml2ZXJzL3VzYi9kd2MzL2dhZGdldC5jDQo+
PiArKysgYi9kcml2ZXJzL3VzYi9kd2MzL2dhZGdldC5jDQo+PiBAQCAtMTMyNyw3ICsxMzI3LDcg
QEAgc3RhdGljIGludCBfX2R3YzNfZ2FkZ2V0X2tpY2tfdHJhbnNmZXIoc3RydWN0IGR3YzNfZXAg
KmRlcCkNCj4+ICAJdTMyCQkJCWNtZDsNCj4+ICANCj4+ICAJcmV0ID0gZHdjM19wcmVwYXJlX3Ry
YnMoZGVwKTsNCj4+IC0JaWYgKHJldCA8PSAwKQ0KPj4gKwlpZiAocmV0IDwgMCkNCj4gZG8geW91
IG1pbmQgYWRkaW5nIGEgY29tbWVudCBoZXJlIHN0YXRpbmcgdGhlIGRldGFpbCBhYm91dCByZXQg
PT0gMCBhbmQNCj4gd2h5IHdlJ3JlIHN0aWxsIGNvbnRpbnVpbmcgd2l0aCBpdD8gVGhpcyB3b3Vs
ZCBwcmV2ZW50IHNvbWVvbmUgZnJvbQ0KPiByZXZlcnRpbmcgdGhpcyBjaGFuZ2UgeWVhcnMgZG93
biB0aGUgbGluZS4NCj4NCj4gVGhhbmtzDQoNClN1cmUuIEkganVzdCByZXNlbnQuDQoNClRoYW5r
cywNClRoaW5oDQo=
