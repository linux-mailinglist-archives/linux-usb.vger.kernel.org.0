Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4EC1E38BC4F
	for <lists+linux-usb@lfdr.de>; Fri, 21 May 2021 04:12:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238440AbhEUCOK (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 20 May 2021 22:14:10 -0400
Received: from smtprelay-out1.synopsys.com ([149.117.87.133]:41334 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S238410AbhEUCOJ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 20 May 2021 22:14:09 -0400
Received: from mailhost.synopsys.com (us03-mailhost2.synopsys.com [10.4.17.18])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 36D79C0548;
        Fri, 21 May 2021 02:12:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1621563167; bh=Y/LEpZc2NMa8E2DGJNDTWbIjwdhf3Gcwsi5X+idOjEs=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=hIZtYy4jd6+/HMr8GjmPqyMeHuY32UKEpCq/LCu6P0ackMhwndFoQhWkYi0ORbMow
         zigqf4S/49ak0Hr2AIa3gQUR1nGaF7I4OtOAxINqeXc4moO8wRJgaMhFFAdZoPWpqC
         2wtsbT1NIwVrTDXd9clwq2tZQcmna5LEdywWD6cZgHLi6o2GD02y5H2Wp6/KmzOoqp
         EYAlVCACYESwWNTMaqg3jDyP6406L3uqWuFiVlCMmnuEOGUH4/50ge+jPa4BuY58On
         W1SABneP7obCk2Gpj2faPyOv1UAjswYJkFXHc/CYst7JnYxAxaF/N4yjkBtVT3on0N
         SzyoNpTpkPoQg==
Received: from o365relay-in.synopsys.com (sv2-o365relay3.synopsys.com [10.202.1.139])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPS id 521DAA0084;
        Fri, 21 May 2021 02:12:46 +0000 (UTC)
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2109.outbound.protection.outlook.com [104.47.55.109])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
        by o365relay-in.synopsys.com (Postfix) with ESMTPS id C447C40179;
        Fri, 21 May 2021 02:12:45 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=thinhn@synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
        dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="ReajXZI3";
        dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YjTHKFwoTl8t7cMs/BuZ5OLRIiIpMH0Jn1LZvmgoPS7O7vwx5Jr/fyimWRUJ+QprnpMxIpNZnQgyRL1ITQfjCiaeyZ7rAgzNH0oUTrrv/elCRwDNz//r1EjBMX3QiglmepfajIAmUCKIWSzxJsCHZe4UC1N7ExuK3wUWfQ4Wj+ewmYZIMWnK3QfuyY1SfSKR97g25JAz/kJylHgfG1Mg19lZuhcrfcUHKYprBFtb91eFusMWfpHfi9DAycGTuTVVxsEt2CSZmtfszUaQH7i8eH0H1gzNdjGGdFtr3Odcgd7AToAAlx03rdo8uMcpNbDYe8t7c0XG2r1UwepFOnFKfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y/LEpZc2NMa8E2DGJNDTWbIjwdhf3Gcwsi5X+idOjEs=;
 b=ZrOXmHE4rCf3WtuGqgmF9Drscho6YsabuFwu1FpEqO7wDzEqJLkTXx7B3LBljZtHGVlukKssTGXzX4qI0kO7/9wrkHLVcw1oc3mv9YHTfn7dSseeUDFlSLuJmDv5TLjf46wlaOPOrCrSsLGJGTy7R208UkqrGoModuQVeKMEPenm666wBWZFlchFHSkIkudS8tS54tZi3eNkel8LMDvGwa0aAUalfTkmPjE6CyTlqsyRqnzexrn4SkDQlsvpN1oTtkjRgXeZyQd4CXIRNNqcSiMAlKs61XIAUM4xZenyVip3DrNS+8JwpYcmQws74AYjR9cQzc1cVr/LkCzuywvmmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y/LEpZc2NMa8E2DGJNDTWbIjwdhf3Gcwsi5X+idOjEs=;
 b=ReajXZI3WhwUmPWt5JCxhbVmXFzHE9Vdb3jMQB+zdyA/a8pujAtlEK0iW3EsVfm8DW6gx5xFZEt4a0HrM1q4Hy8jySaUPKaUb/iCoPpMHhlQjqG3AVI+zGW/F7l3UEO1PWfTEtVP9GTO/cYtTku7xBImeaO2lQU3SU5SeUEPqyA=
Received: from BYAPR12MB4791.namprd12.prod.outlook.com (2603:10b6:a03:10a::12)
 by BYAPR12MB4712.namprd12.prod.outlook.com (2603:10b6:a03:9d::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4150.23; Fri, 21 May
 2021 02:12:43 +0000
Received: from BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::88be:f751:f493:25f9]) by BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::88be:f751:f493:25f9%6]) with mapi id 15.20.4129.034; Fri, 21 May 2021
 02:12:43 +0000
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To:     Alan Stern <stern@rowland.harvard.edu>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>
CC:     Mathias Nyman <mathias.nyman@intel.com>,
        Guido Kiener <Guido.Kiener@rohde-schwarz.com>,
        dave penkler <dpenkler@gmail.com>,
        USB list <linux-usb@vger.kernel.org>
Subject: Re: Recovering from transaction errors [was: Re: [syzbot] INFO: rcu
 detected stall in tx]
Thread-Topic: Recovering from transaction errors [was: Re: [syzbot] INFO: rcu
 detected stall in tx]
Thread-Index: AQHXTbvS7ox14Htpek+B5N8MnuAJ7qrs4WkAgABCd4CAAA43AA==
Date:   Fri, 21 May 2021 02:12:43 +0000
Message-ID: <c5ac1967-fcae-1e85-57d3-ec610aebd97e@synopsys.com>
References: <d673611ca53f42a3a629eb051cabc6eb@rohde-schwarz.com>
 <20210519173545.GA1173157@rowland.harvard.edu>
 <12088413-2f7d-a1e5-5e8a-25876d85d18a@synopsys.com>
 <20210520020117.GA1186755@rowland.harvard.edu>
 <74b2133b-2f77-c86f-4c8b-1189332617d3@synopsys.com>
 <20210520210506.GA1218545@rowland.harvard.edu>
 <4f73f443-7509-e740-c6b9-884614dcfd4b@synopsys.com>
 <20210521012149.GB1224757@rowland.harvard.edu>
In-Reply-To: <20210521012149.GB1224757@rowland.harvard.edu>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
authentication-results: rowland.harvard.edu; dkim=none (message not signed)
 header.d=none;rowland.harvard.edu; dmarc=none action=none
 header.from=synopsys.com;
x-originating-ip: [73.15.163.8]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8acca478-2685-4468-85a0-08d91bfdeaee
x-ms-traffictypediagnostic: BYAPR12MB4712:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR12MB4712069B902861B4E8249337AA299@BYAPR12MB4712.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: NDqZBXx9oy78Rs/Alj9rqH1ZU+yOt9sZZks6KFTq8CgmQk1RTMwgcz4avgYVvo6AMRitTFtnnJ9rZIXQ4Y05KbxIrMFEcRh9xB2gqJAPIWtq2zoR/m2jkdvsUiszi8RMu+WCkpx8Z1vvg1oO1G9NA9Dipwh8WBqbVDnyvt9qQ4bdqGjv8PUzY84vam7kP4Fp/xe3k3vu4RVICl+MWuOVNtcMnLML3Emxr3n/b+pcET3urC4gcZYz7kx0DrbuEbidDc1hcU3XKAiHJPnyJR/tl8yadW2i56+A2aU20j3LGAywJ7uNKQMecqZ05EIcxZ9sNUYiVgi17JxkXM47yZIAdHk2PhuQTSaF5hIcP7FcA96Zm4eZ49GozuVpWia2kXDVIBURsFEB2OptpZ4SRT3sMwIRHBS1+wBTVJnOIYwaZDG+5yWgiBd7BZyIP+uhAMhtuX8Or7eZPt5lv6XeRcDrB1OGhOo77lMg26j7pk8f47EKa0OoPGBpvRdboQED1IMbcJIuT/jTgGeRXUzFxuq2GD+fbXbl5xn83C8NuOcmAve8KKGFxG+ALPmCTJYaVTnJOeEensIK8OIIMs1i2HDLK+uHC3i/5szMu+6sG5sDeTmtFvkktV0Ljjl6r0+FAS6r8vwC/9quVNebhVuDApE3x1c3bZFg3SDEgL9PtPuk1iZylO9/CG9e3qEmX6D7W3zE
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB4791.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(376002)(396003)(346002)(39860400002)(136003)(8936002)(2906002)(8676002)(31696002)(6512007)(64756008)(122000001)(66946007)(66446008)(6486002)(66476007)(66556008)(83380400001)(6506007)(76116006)(186003)(26005)(54906003)(478600001)(316002)(110136005)(38100700002)(31686004)(2616005)(86362001)(71200400001)(36756003)(5660300002)(4326008)(43740500002)(45980500001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: =?utf-8?B?a2lWNlQ3dDA4bFlrcS9hZlhZbFdraEI2K0R1cXcvTlZpQ05UNm4wOWNqOHp4?=
 =?utf-8?B?b3ZLbXVkZkdJU01BY2JOQ2dHcmZDanMwbEsrRjB5WW8wcjVOQ05GMGNvTkRF?=
 =?utf-8?B?czBnZWlKdm9CQ3M1dmZ0WnF3VmZYRnBLYUJPTHVveXNKSTZXTlFyZEUwaThO?=
 =?utf-8?B?QXg3WC9SZmVLQkRpQXc2N0NBbXdmYXJYbWwvaFFOMGV4L0ZDb1FRUWZEc04y?=
 =?utf-8?B?NDNZQ1haOHYwVm9abVB3c1E5b2M3WWNZSGVOck9uOWozVmcwL3htVFdrMlF3?=
 =?utf-8?B?U1ZQaHBHRENMN2VrWk9nbjdtcit5WjA0VEI5MnIrdWE5WjBJekRVTHpFZUlH?=
 =?utf-8?B?SSt6Mm13UDJDZEE1UGdWaGw3SE4xWDFFMng3MlZiTTZDRXp5YXJsVmppRW0x?=
 =?utf-8?B?bW5URk8rZXVkWVRqRWxWY3hLR0w5K1Y3bUE1ZWVGeFRjNlRvdjBjN1dkRjZD?=
 =?utf-8?B?TzBOWUxUNU1zOHU1RlFidlY4bW5OY3VWVzUxdWMvTmdZOWhHanNZcklEbTNO?=
 =?utf-8?B?b0ZBWE5wVTMvSTJOVTllRFE3Y3llTXdWQ09QN1BQMVBaOXROd2EveDZKazZ3?=
 =?utf-8?B?Z3JoUUkreTFzaDdYU3JJNHFIcHUzcHVwL2V5TDlpcStnZitTd0VvMjIyVlFq?=
 =?utf-8?B?Y3dVcWg3clgrTGlOMEhHYXlTTlBMNVExdlBkd1krNk5icEtFbU93NDF5MWV2?=
 =?utf-8?B?SUR0ZXZIUlV4OC8ydTR2Z1lJVXJNRHJkRUtGU0FZMmExY2VNTGZFMmNtUi95?=
 =?utf-8?B?SzNXYTNEU2k0T1paUVVrVjJrYUpscmZoRGlSRXp0aXp2Qlh0bkFsVlhnR2My?=
 =?utf-8?B?bW01K0JWTmV5cjVVOGxtSTRJa0tlc0Qrc2lIUnR6ekYxdnB5WVFrbmlZRmFu?=
 =?utf-8?B?TkNPNUE2UTkwUWFnejk1b3VtUFEzR0lZK0VVV0ROMlpEOVlUZ1JuVFkzSnZu?=
 =?utf-8?B?bTc2V3ZITFBKWWNkbENLOG1vVStXeC80eUJZWG53bmhoZTNBQkd1L0lnc0NT?=
 =?utf-8?B?VTFhanhtNXE0WVlCQkVrdFhwRkdPY1c2YUt3UmkvOE52ZkZHZEExM1hFcmM0?=
 =?utf-8?B?Mm95RlpUOGs3NmpqVUM1cFdJUGl3cGt4ZFE1U25LcXhiVFlNWFY2cXlWekRE?=
 =?utf-8?B?OXZWL3RUdDhVelBJUyt0L3ZIOVBTZWh6d3IzUmZwKzRzWGdGU0lHNmtoNy95?=
 =?utf-8?B?OGJWaFlhT1ZRVHVVcmdCelhNMWFSOG9qaFlPK0o4TStPbVR3T2UxVVJmNDlK?=
 =?utf-8?B?N1Iwa3BrWFFqWG94aEpZNEhDTndoQmEwTFd1SnRMdUd3dkxFT3doY3E4Ylpu?=
 =?utf-8?B?d1VSdUJ2bFVBT1lEZDZSM0JWZFE1WFlKVGEwYmxSYmpWV3JlaGZoSFFoSmY4?=
 =?utf-8?B?QVZLczZTR3BaSjQ5SDVualN4TG5WZDlXeEZlY1RBc00xVlo2OXhhb2JiR1R5?=
 =?utf-8?B?YUgvbzd6b1pLamJBZXQza2VRT0hSMDlkaGx5K1puKzczeFkrclNJckp4Mktx?=
 =?utf-8?B?NC9QNS83ckM4TDNuem9Qa2QyRnZDQ3ptZjJtaXR3T1ZkMG9wYlRscWg4cjJU?=
 =?utf-8?B?dG1TY0wyei9XcGhCV3NCUVljVStRQnM5T29hdWlndmxKaDQwaUV3ay9xOGdU?=
 =?utf-8?B?OE42M3dUc00vaFMvVVRKOVNNYThmTitRR1puVXZjTWJuVSs4ZHI5UkhNT3Fh?=
 =?utf-8?B?YmtjdXFTVElYQzc5WTVqMDNZZkxUaTYxNFB1MUQwUHh6S1V3SktZZTN0N3ZH?=
 =?utf-8?Q?Nhs2DGu0y8+zCku6DY=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <F45125D6947C5A4389549908A24D55EF@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB4791.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8acca478-2685-4468-85a0-08d91bfdeaee
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 May 2021 02:12:43.0262
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ivS6jqzId0zLadnvEK8mtW2jWztKBBqC6yK9RVNt5CfB8T7NYrH5V2gI31mLe632wxyFgWfn3sZ782iGbMkAwA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB4712
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

QWxhbiBTdGVybiB3cm90ZToNCj4gT24gVGh1LCBNYXkgMjAsIDIwMjEgYXQgMDk6MjM6NTdQTSAr
MDAwMCwgVGhpbmggTmd1eWVuIHdyb3RlOg0KPj4gQWxhbiBTdGVybiB3cm90ZToNCj4+Pj4gSWYg
dGhlIGNhYmxlIGlzIHVucGx1Z2dlZCwgdGhlbiB3ZSBzaG91bGQgZ2V0IGEgY29ubmVjdGlvbiBj
aGFuZ2UgZXZlbnQNCj4+Pj4gYW5kIHRoZSBkcml2ZXIgY2FuIGhhbmRsZSBpdCBwcm9wZXJseS4N
Cj4+Pg0KPj4+IFllcyAtLSB1bmxlc3MgdGhlIGRyaXZlciBpcyBpbiBzdWNoIGEgdGlnaHQgcmV0
cnkgbG9vcCB0aGF0IHRoZSByZXN0IG9mIA0KPj4+IHRoZSBzeXN0ZW0gbmV2ZXIgZ2V0cyBhIGNo
YW5jZSB0byBwcm9jZXNzIHRoZSBjb25uZWN0aW9uIGNoYW5nZSBldmVudC4gIA0KPj4+IEkndmUg
c2VlbiBidWcgcmVwb3J0cyB3aGVyZSB0aGF0IGhhcHBlbmVkLg0KPj4NCj4+IEkgc2VlLiBJJ2xs
IGtlZXAgdGhhdCBpbiBtaW5kLCBidXQgaXQgc291bmRzIGxpa2UgSFcgaXNzdWU/IFRoZSBkcml2
ZXINCj4+IGhhbmRsZXMgcmV0cnkgYmFzZSBvbiBldmVudHMgZ2VuZXJhdGVkIGZyb20gdGhlIEhX
IGFuZCB0aGUgSFcgc2hvdWxkDQo+PiBwcm9wZXJseSBnZW5lcmF0ZSBjb25uZWN0aW9uIGV2ZW50
IGFuZCBub3QgZ2V0IHN0dWNrIGluIHNvbWUgbG9vcC4NCj4gDQo+IFRoZSBoYXJkd2FyZSBfZG9l
c18gZ2VuZXJhdGUgZGlzY29ubmVjdCBldmVudHMuICBUaGUgcHJvYmxlbSBpcyB0aGF0IHRoZSAN
Cj4gY2xhc3MgZHJpdmVyIGRvZXNuJ3QgcmVhY3QgcHJvcGVybHkgdG8gdHJhbnNhY3Rpb24gZXJy
b3JzIGFuZCB0aGVyZWJ5IA0KPiBwcmV2ZW50cyB0aGUgcmVzdCBvZiB0aGUgc3lzdGVtIGZyb20g
aGFuZGxpbmcgdGhlIGRpc2Nvbm5lY3QgZXZlbnRzLiAgDQo+IEl0J3MgYSBidWcgaW4gdGhlIGNs
YXNzIGRyaXZlciwgbm90IGluIHRoZSBoYXJkd2FyZS4NCg0KT2suIEdvdCBpdC4NCg0KPiANCj4+
Pj4+IEZvciB0aGUgY2FzZSBpbiBxdWVzdGlvbiAodGhlIHN5emJvdCBidWcgcmVwb3J0IHRoYXQg
c3RhcnRlZCB0aGlzIA0KPj4+Pj4gdGhyZWFkKSwgdGhlIGNsYXNzIGRyaXZlciBkb2Vzbid0IHRy
eSB0byBwZXJmb3JtIGFueSByZWNvdmVyeS4gIEl0IGp1c3QgDQo+Pj4+PiByZXN1Ym1pdHMgdGhl
IFVSQiwgZ2V0dGluZyBpbnRvIGEgdGlnaHQgcmV0cnkgbG9vcCB3aGljaCBjb25zdW1lcyB0b28g
DQo+Pj4+PiBtdWNoIENQVSB0aW1lLiAgU2ltcGx5IGdpdmluZyB1cCB3b3VsZCBiZSBwcmVmZXJh
YmxlLg0KPj4+Pj4NCj4+Pj4+IEFsYW4gU3Rlcm4NCj4+Pj4+DQo+Pj4+DQo+Pj4+IEkgc2VlLiBC
eSBnaXZpbmcgdXAsIHlvdSBtZWFuIGRvaW5nIHBvcnQgcmVzZXQgcmlnaHQ/IE90aGVyd2lzZSBp
dCBuZWVkcw0KPj4+PiBzb21lIG90aGVyIG1lY2hhbmlzbSB0byBzeW5jaHJvbml6ZSB3aXRoIHRo
ZSBkZXZpY2Ugc2lkZS4NCj4+Pg0KPj4+IE5vLCBJIG1lYW4gdGhlIGRyaXZlciBzaG91bGQganVz
dCBzdG9wIGNvbW11bmljYXRpbmcgd2l0aCB0aGUgZGV2aWNlLiAgDQo+Pj4gVGhhdCdzIGFuIGFw
cHJvcHJpYXRlIGFjdGlvbiBmb3IgbG90cyBvZiBkcml2ZXJzLiAgSWYgdGhlIHVzZXIgd2FudHMg
dG8gDQo+Pj4gcmUtc3luY2hyb25pemUgd2l0aCB0aGUgZGV2aWNlLCBoZSBjYW4gdW5wbHVnIHRo
ZSBVU0IgY2FibGUgYW5kIHBsdWcgaXQgDQo+Pj4gYmFjayBpbiBhZ2Fpbi4NCj4+Pg0KPj4+IEFs
YW4gU3Rlcm4NCj4+Pg0KPj4NCj4+IE9rLiBXb3VsZCBpdCBiZSBtb3JlIGRpZmZpY3VsdCB0byBh
dXRvbWF0ZSB0aGlzIGlmIGl0IHJlcXVpcmVzIHVzZXINCj4+IGludGVydmVudGlvbj8gSSBhc3N1
bWUgc3l6Ym90IGRvZXNuJ3Qgd2FudCB0aGUgdXNlciB0byBkbyB0aGF0Lg0KPiANCj4gRGlmZmlj
dWx0IHRvIGF1dG9tYXRlIHdoYXQsIGV4YWN0bHk/ICBVbnBsdWdnaW5nIHRoZSBVU0IgY2FibGU/
ICBIb3cgDQo+IGNvdWxkIHlvdSBwb3NzaWJseSBhdXRvbWF0ZSB0aGF0Pw0KPiANCj4gQXQgdGhl
IG1vbWVudCwgSSB0aGluayB0aGUgYmVzdCBhcHByb2FjaCBpcyBHdWlkbydzIHN1Z2dlc3Rpb24g
dG8gcmVqZWN0IA0KPiBVUkJzIHN1Ym1pdHRlZCB0byBlbmRwb2ludHMgdGhhdCBoYXZlIGdvdHRl
biBhIHRyYW5zYWN0aW9uIGVycm9yLCB1bnRpbCANCj4gdGhlIGVycm9yIHN0YXR1cyBoYXMgc29t
ZWhvdyBiZWVuIGNsZWFyZWQuICBJcyB0aGF0IHdoYXQgeW91IHdvdWxkIGxpa2UgDQo+IHRvIHNl
ZSBhdXRvbWF0ZWQ/DQo+IA0KDQpGaXJzdCwganVzdCB3YW50IHRvIHBvaW50IG91dCB0aGF0IEkn
bSBub3QgZmFtaWxpYXIgd2l0aCBzeXpib3QuIEkgd2FzDQpqdXN0IHRoaW5raW5nIGlmIHRoaXMg
aXNzdWUgb2NjdXJzLCBhbmQgaWYgdGhlIHVzZXIgd2FudHMgdG8gc3RhcnQgYSBuZXcNCnRlc3Qs
IHRoZW4gc2hlIGRvZXNuJ3QgaGF2ZSB0byB1bnBsdWcrcGx1ZyB0aGUgZGV2aWNlIGJhY2sgYW5k
IGFsbG93DQpzb21lIGFwcGxpY2F0aW9uIHRvIGF1dG9tYXRpY2FsbHkgdHJpZ2dlciBhIG5ldyB0
ZXN0IGFmdGVyIGEgZmFpbHVyZS4NCg0KQlIsDQpUaGluaA0K
