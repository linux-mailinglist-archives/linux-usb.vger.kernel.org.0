Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EC345290DD4
	for <lists+linux-usb@lfdr.de>; Sat, 17 Oct 2020 00:42:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388136AbgJPWm3 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 16 Oct 2020 18:42:29 -0400
Received: from smtprelay-out1.synopsys.com ([149.117.87.133]:58706 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1731899AbgJPWm3 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 16 Oct 2020 18:42:29 -0400
Received: from mailhost.synopsys.com (us03-mailhost1.synopsys.com [10.4.17.17])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 599A5C00C3;
        Fri, 16 Oct 2020 22:42:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1602888148; bh=42+Hm8MeZhal44Pa0vZMmGfpvrR3OydSGkdQEevibRk=;
        h=From:To:Subject:Date:References:In-Reply-To:From;
        b=gUL3Q6L0MnlFlg0/5hiRgPocnD83ANdePnJAQ3vcmSV4cbnawBTnkPgGaYfr6NA0K
         bgtkZIFhweLmt1Bfxgin6UQFdZOswW0OzHy5VFvDg/WPoccACgx+lsWrslGqUqNpnz
         KSwLOtr30qL9glG73yiowhpMcNXdO7uv9eI54C4odFiDNIabO03H9d/WXJzVXtsJr5
         5bsKK7UyXvxCyEPjo/U1v9+6b2Gc5sjzuEyFxBR0vJ3cQa7jy2c4ByXLxlT6t8k0JJ
         BlXvn1xdMQqZwzHRTWN0xs35xCPoHN6V2MrY759wMDf+AKkSmVDZArkNI/oM55owvS
         XuxwuMQNCr7VQ==
Received: from o365relay-in.synopsys.com (sv2-o365relay1.synopsys.com [10.202.1.137])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPS id 42EB7A0077;
        Fri, 16 Oct 2020 22:42:27 +0000 (UTC)
Received: from NAM02-CY1-obe.outbound.protection.outlook.com (mail-cys01nam02lp2051.outbound.protection.outlook.com [104.47.37.51])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client CN "mail.protection.outlook.com", Issuer "GlobalSign Organization Validation CA - SHA256 - G3" (verified OK))
        by o365relay-in.synopsys.com (Postfix) with ESMTPS id 2A2F0400E7;
        Fri, 16 Oct 2020 22:42:25 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=thinhn@synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
        dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="XCtgScyE";
        dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MVx0cUwNVOukMn8fYb/aY1HpwabZgd7NRww4uJ5hCQgml96lAKWsBCIQ2yYK5JWEKPAWtn/F1bgoq8YwpEdI/ccEYS1NvFseTw9JSaTamWwbrTNf6rk81papgJfH9A0TCYuow0VbQEazCKTWROs6wKMWLLgb0v4EpgS02olWj5sEcQU0UpXi17iaauBj3hldxl5Ydw55X+NqHEnw6ofZR1Uj1PU/qSXMDqs2AWbXHzAc75tiYil9D1w5cWSQpgpHdrNDWCw8OahpAc2J/gQKPmBExlFLBa77mAOSdeezvNOMOZTCUAOsDYGt6JjAp70VdiSH3/JGClIM+emiO67dAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=42+Hm8MeZhal44Pa0vZMmGfpvrR3OydSGkdQEevibRk=;
 b=R/PsfwssZTbWx8wDD7m7JCQBtS1gbXIKASCpI8+Heg0b+w+Iu82gmTiWNYz2jmFMewOUyxIlE9LVXG9FnuAN7yB7hh9SWAHMzfw4QtM7MBwFVZtjsIWGYfa0bMFsOnqV8WQrzmPocfT6EjkdU3sbOJoqgvbZpPrtVRLC0JYmzyX8rjWyy2CXt/QYnGQ2UJ1IeX1IAZnk5jhNnr5D/fld7Enbxa4+l+jUJoSc+Jw4nUQkCVBR3XCau4E7aDxcOug6L6/OGUTDwVHIjqViPqndtKKAXldjWfW6lZMSSq0Y2ouyvxo7GpKM7zeeSwJZHxOtGzP4LJHOPVFlano31ZY3ag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=42+Hm8MeZhal44Pa0vZMmGfpvrR3OydSGkdQEevibRk=;
 b=XCtgScyE+SxGzVjnMlQvVUAcPbdv358HQa1yUz4Kspi6+Mzh7qOwiQhCydmE3ZPWRElh/E+BoKG4bD2yGX7z68ZFzyOPiJXTjOg1kWfYNb1pSQTxSUzi0yFKX2YxzXIdw1u4ZyGo1phsT6SjR+7ldF6m3ZGe9Sxp2qNmndleCRg=
Received: from BYAPR12MB2917.namprd12.prod.outlook.com (2603:10b6:a03:130::14)
 by BYAPR12MB4630.namprd12.prod.outlook.com (2603:10b6:a03:107::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.23; Fri, 16 Oct
 2020 22:42:22 +0000
Received: from BYAPR12MB2917.namprd12.prod.outlook.com
 ([fe80::c17e:c3dd:7cda:e2dc]) by BYAPR12MB2917.namprd12.prod.outlook.com
 ([fe80::c17e:c3dd:7cda:e2dc%4]) with mapi id 15.20.3477.025; Fri, 16 Oct 2020
 22:42:22 +0000
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To:     Wesley Cheng <wcheng@codeaurora.org>,
        Linux USB List <linux-usb@vger.kernel.org>
Subject: Re: dwc3: Power management for cable disconnect
Thread-Topic: dwc3: Power management for cable disconnect
Thread-Index: AQHWo44UyubKdG4eRUeVTXMl1dwJB6ma1BuA
Date:   Fri, 16 Oct 2020 22:42:22 +0000
Message-ID: <50611524-6211-02e7-73b8-71a728234e91@synopsys.com>
References: <0fe1cf51-c9d4-9780-e542-a613bba58928@codeaurora.org>
In-Reply-To: <0fe1cf51-c9d4-9780-e542-a613bba58928@codeaurora.org>
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
x-ms-office365-filtering-correlation-id: fd323235-1a54-4394-55ec-08d87224bf2a
x-ms-traffictypediagnostic: BYAPR12MB4630:
x-microsoft-antispam-prvs: <BYAPR12MB4630BE2BDA1F6376189A6F96AA030@BYAPR12MB4630.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: b5kEa3xgBIjUvFPNWhFkUAg+NQSl+BeChNxuVHN7AjYuZFvEGVCCsH6eQymRNNkabqm1R24gghsaPMTS/oSOMbWBGpU/NO3cLclKHy7SDnGAJsIWlpsFaTycYEJI2v+mSqlf4AtlfYOSZktbcDuV95LYeWd91uTSmqWDDXF+Fw0JF+JX67s4SqZOUw79mBgw49BpCPIVhgrr3btI8ZYMLo6UkccUFJmQ7FLhYj1d/F9QxWtE9yNLkvPa6BB+Q42VInMBq4/MwEarivFn58u4jKVuVoZ90c+v0OLZFyMpjp/2xKl/5fi69bhtuKPd1LLOm3J2vYbwL6dKTzA9IqqQ3jgPG3PiF9ABSJ8JR7FIxU7KVA3driMKfTlZr1Iuf0IF
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB2917.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(39860400002)(376002)(346002)(366004)(136003)(6506007)(31686004)(6486002)(110136005)(8676002)(8936002)(186003)(316002)(26005)(2616005)(478600001)(31696002)(6512007)(86362001)(2906002)(36756003)(71200400001)(83380400001)(66446008)(76116006)(66556008)(66476007)(5660300002)(64756008)(66946007)(43740500002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: e6E8+1B2zn/cTllzt7v+3Xx1e2bQZ0YbQMynTmI/Jumqn9bAddXJpv7UgKfI/6ZkxgK6hOgf286iRdvu3pJQs0d6RNdSO1G4vNqPq9uzv8CF/L2MLZEcO4JaH7XUdUhu4unIW26sCDCBffoMItMq4LHdIFexMqvshxS4objl2LaQ8Wx9S0pNkCXD9DALpq/6xXt1rFf0dBaQUiO0zmPfS9AeHYF+VJDZTOf/37Zb1vQt2nnBF4gyZRbSqUG/QTbdKI09FBL1abIWIFmRtvWgvcrU4eK858fqLKTAzc7jccTxmwVx3GVzPBfL19VifflxiajnterO598PHolY1lROnhnrvFuh76+rHFmIjILRTUcnBGWC+a6KG/fsuhGhWRdl9ocvaCJ/lZ+ZRammzNEnN1rPISOvXnbrtmQFtaxmj8Sf6tpAYVjaZ04r8gLqcV3znj4p8XkdGkQcBebNqNXTQYzJ1YbfsEsCgCqGqzGEeujI8cDgX9MwFxLcHJIc+62X7Qcyuce7HKO4dvxJeHn0pTEI8ybyEzkVGK70z/tNaSY8LB1dWibjAY43Y/5O1h9xQLf96nZrKl25mSVsTQNAVhTsViwOTYtMeamDxllAmjowIzJEbEaeOl7h5m245cbP1KWcRQDOkyX0vNY6VgE+bA==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <66F59D0C021CA44B8AD2474F1E3B4BC7@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB2917.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fd323235-1a54-4394-55ec-08d87224bf2a
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Oct 2020 22:42:22.3057
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Yyf6HBeKQpVDzvZ0wcwH9eR2Tr3TMgmndaa4CNQIgg8XkLLVfLzpnr6I4FlOGr090t8fOikrmmce+HUowZTz2Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB4630
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

SGksDQoNCldlc2xleSBDaGVuZyB3cm90ZToNCj4gSGkgbGludXgtdXNiIG1lbWJlcnMhDQo+DQo+
IEkgd2FzIGxvb2tpbmcgYXQgc2VlaW5nIGhvdyB0aGUgRFdDMyBkcml2ZXJzIGFyZSBoYW5kbGlu
ZyB0aGUgVVNCIGNhYmxlDQo+IGRpc2Nvbm5lY3Qgcm91dGluZSAoVkJVUyBsb3cgc2l0dWF0aW9u
KSB3aGVuIHRoZXJlIGlzIG5vIFVEQyBiaW5kZWQuICBJcw0KPiB0aGUgYmVsb3cgYmVoYXZpb3Ig
ZXhwZWN0ZWQ/DQo+DQo+IDEuICBFbnVtZXJhdGUgZGV2aWNlIHcvIGhvc3QuDQo+IDIuICBHYWRn
ZXQgaXMgdW5iaW5kZWQNCj4gCS0gZWNobyAiIiA+IC9zeXMva2VybmVsL2NvbmZpZy91c2JfZ2Fk
Z2V0L2cxL1VEQw0KPiAzLiAgRGlzY29ubmVjdCB0aGUgVVNCIGNhYmxlIChWQlVTIGxvdykNCj4g
NC4gIE5vIGR3YzNfZ2FkZ2V0X2Rpc2Nvbm5lY3RfaW50ZXJydXB0KCkgc2VlbiAoc2luY2UgY29u
dHJvbGxlciBpcw0KPiAgICBoYWx0ZWQgZnJvbSBzdGVwIzEpDQoNCkkgdGhpbmsgeW91IG1lYW4g
YWZ0ZXIgc3RlcCMyPw0KDQo+IDUuICBSdW50aW1lIFBNIGF1dG9zdXNwZW5kIGZhaWxzIGR1ZSB0
byAiZHdjLT5jb25uZWN0ZWQiIGJlaW5nIHRydWUNCj4gKGNsZWFyZWQgaW4gZHdjM19nYWRnZXRf
ZGlzY29ubmVjdF9pbnRlcnJ1cHQoKSkNCg0KVGhpcyBpcyBwcm9iYWJseSBhIG1pc2hhcCBpbiB0
aGUgZHdjMyBkcml2ZXIuIFdoZW4gdGhlIGZ1bmN0aW9uIGRyaXZlcg0KaXMgdW5yZWdpc3RlcmVk
LCB0aGUgcHVsbHVwKCkgY2FsbGJhY2sgd2lsbCBoYWx0IHRoZSBjb250cm9sbGVyLiBUaGlzIGlz
DQphIHNvZnQtZGlzY29ubmVjdCwgYW5kIGR3Yy0+Y29ubmVjdGVkIHNob3VsZCBiZSBmYWxzZS4N
Cg0KPiA2LiAgR2FkZ2V0IGJpbmRlZA0KPiAJLSBlY2hvIHVkY19uYW1lID4gL3N5cy9rZXJuZWwv
Y29uZmlnL3VzYl9nYWRnZXQvZzEvVURDDQoNCkFmdGVyIHRoaXMgc3RlcCwgdGhlIGRldmljZSB3
aWxsIHN0aWxsIHJlbWFpbiBkaXNjb25uZWN0ZWQuDQoNCj4gNy4gIE5vIHJ1bnRpbWUgc3VzcGVu
ZCB1bnRpbCBjYWJsZSBpcyBwbHVnZ2VkIGluIGFuZCBvdXQNCg0KLi4uIHVudGlsIHRoZSByZXNl
dCBhbmQgY29ubmVjdGlvbiBkb25lIGludGVycnVwdCB0ZWxsaW5nIHRoZSBkcml2ZXINCnRoYXQg
dGhlIGRldmljZSBpcyBub3cgY29ubmVjdGVkLg0KDQo+DQo+IFRoaXMgd291bGQgYmUgcHJvYmxl
bWF0aWMgZm9yIGRldmljZXMgd2hpY2ggaGF2ZSB0byByZWxpYWJseSBlbnRlcg0KPiBzdXNwZW5k
LiAgSSBqdXN0IHdhbnRlZCB0byBzZWUgaWYgdGhpcyBpcyBhIHNjZW5hcmlvIHdoaWNoIGhhcyBi
ZWVuDQo+IGNvbnNpZGVyZWQ/ICBTZWVtcyBvZGQgdGhhdCB3ZSB3b3VsZCBzdGlsbCBrZWVwIHRo
ZSBjb250cm9sbGVyIG91dCBvZg0KPiBsb3cgcG93ZXIgaWYgdGhlcmUgd2FzIG5vIGNhYmxlIGNv
bm5lY3RlZC4NCj4NCg0KVGhpcyBzaG91bGQgYmUgYSBzaW1wbGUgZml4LiBXb3VsZCB5b3UgY3Jl
YXRlIGEgcGF0Y2ggZm9yIHRoaXM/DQoNClRoYW5rcywNClRoaW5oDQo=
