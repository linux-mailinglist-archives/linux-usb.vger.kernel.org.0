Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4CE5C2E2B45
	for <lists+linux-usb@lfdr.de>; Fri, 25 Dec 2020 11:57:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729222AbgLYK5H (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 25 Dec 2020 05:57:07 -0500
Received: from smtprelay-out1.synopsys.com ([149.117.73.133]:42718 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729087AbgLYK5G (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 25 Dec 2020 05:57:06 -0500
Received: from mailhost.synopsys.com (sv1-mailhost1.synopsys.com [10.205.2.131])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 4D8814040A;
        Fri, 25 Dec 2020 10:56:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1608893765; bh=Qxyo2ZO+BkISWVqsyqRH7UfAmhBsOZ5hEeAF4et056w=;
        h=From:To:Subject:Date:References:In-Reply-To:From;
        b=hGWqT1o83WsjW+RV/vaAVxwfdvvDrqgkWgX3HSA7StAIgAPMRcqfRdEGfW45QJn0i
         qpYE3YXpn9NpNyu7mMnOb+oKPwohJaAnSkk2WNjEjKVOU/FpRO9lsxiHUDqdBmcqzw
         dVKCxU8e6uldTvI9EYp2L22Tdei6RH17FlY2aT+wv7cO8d9JRleIoxwbSvc+nxVj92
         W3ehQKRmpzObAk8XWs40V1SeEXgs/wni4I7CXB5K7yIy5mAuaAQ8GrO4HwnzO2zq/n
         fUHcTPpu4IcaScmMq0wuYPKVRIFsaQVNE0W0HAiNTJbnGbVtvTce04LtMlg5dEktY6
         MbFnC13rFIdSg==
Received: from o365relay-in.synopsys.com (sv2-o365relay1.synopsys.com [10.202.1.137])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPS id E989AA005E;
        Fri, 25 Dec 2020 10:56:04 +0000 (UTC)
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2102.outbound.protection.outlook.com [104.47.55.102])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client CN "mail.protection.outlook.com", Issuer "GlobalSign Organization Validation CA - SHA256 - G3" (verified OK))
        by o365relay-in.synopsys.com (Postfix) with ESMTPS id B9212400BA;
        Fri, 25 Dec 2020 10:56:04 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=arturp@synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
        dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="preID8F4";
        dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RIGzJH54d+I5jhNCFXWp2yP5hlrD7bbTDTw2ZzSruE693u5vfYQUo1j0+LmUrAE9KyB5b+zXB8bc/Uj+8vr+UgLMZ4hD8b92C7AN6sXlm+CJFgDS44dYpEUg2VpNQJfCdHtQAVSTuIkhGkrs2BPqsLJzFWuMiHx9Ds5PmQ7euREsAHEgcIK0GK4SqGPpupg6lYw16ag/REqVZ1nm0LUv/8ZqLcs8i+RsCOP2H1QScsVBkEvH0XChbsRzH1F/7MY78/eo8HAvG82C1hEjwbY6YErwevy525qvGts6IcxXYUQv1O/oPMFzkHhoKHvlOfHFrBAuKFSb+bKie3nd+s+c8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qxyo2ZO+BkISWVqsyqRH7UfAmhBsOZ5hEeAF4et056w=;
 b=d0T/5wcgyGW5AcZxXAUXd+kd76GFJ1729C7G+dSQ11fnDqKPrCZCyZAVW07PUueD2+qZgYwc8643wo0g7eT/n/DPt9fJAyz93cShHbtRLkk1WLHQssGOcN+NzUDStW0GVh8hy8tOiZdrPkzR1ef8d3j/i8KfTLL+HqEj7pNlmBvKXYIQjMsmZw5aeOQZKzZMg0yGGkqSBhSJk3W23f1vdR8j+2YB24dyuxu5BupSvS91Ea0i2AXuIcI+z7kv7RaXM7wvf4HRWE5jgXMrQa7dO6WIQ4aG6luyS1ImQ3BQpG8mLxeJ7GwUCnuIBTcaP3uEt4ycogmm0jsWgCnU8MVo5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qxyo2ZO+BkISWVqsyqRH7UfAmhBsOZ5hEeAF4et056w=;
 b=preID8F4a2UHI0Tn5hh6ioXVXKaFKRqfZsOM9TV2UplNtybYQVT6RQmtbv0/4RHUUOR7kw9bszGbWvBEPnA8IMzh0SOFXXzpRv64qoaapShcwBPOLRJv8SpryvaWnNdWFY7XBUKOawhbRzVo4m4XttrYsAWTCrkYeY4ASgchss8=
Received: from MW3PR12MB4428.namprd12.prod.outlook.com (2603:10b6:303:57::15)
 by MWHPR12MB1456.namprd12.prod.outlook.com (2603:10b6:301:f::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3700.27; Fri, 25 Dec
 2020 10:56:03 +0000
Received: from MW3PR12MB4428.namprd12.prod.outlook.com
 ([fe80::19f6:62ef:1691:1cdb]) by MW3PR12MB4428.namprd12.prod.outlook.com
 ([fe80::19f6:62ef:1691:1cdb%4]) with mapi id 15.20.3700.028; Fri, 25 Dec 2020
 10:56:02 +0000
X-SNPS-Relay: synopsys.com
From:   Artur Petrosyan <Arthur.Petrosyan@synopsys.com>
To:     Vincent Pelletier <plr.vincent@gmail.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>
Subject: Re: dwc2 gadget rejecting new AIO transfer when bus is suspended
Thread-Topic: dwc2 gadget rejecting new AIO transfer when bus is suspended
Thread-Index: AQHW2fN/WrhhRCNlcU+PgXrG5a9vnqoHpSmA
Date:   Fri, 25 Dec 2020 10:56:02 +0000
Message-ID: <ff11cf43-f185-b123-6cb5-f218ef148d89@synopsys.com>
References: <20201224125012.4df1d26c@gmail.com>
In-Reply-To: <20201224125012.4df1d26c@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=synopsys.com;
x-originating-ip: [176.32.192.178]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: bb4295b7-980d-4dad-be15-08d8a8c3abeb
x-ms-traffictypediagnostic: MWHPR12MB1456:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MWHPR12MB1456F8150150C4B829B15E0BA7DC0@MWHPR12MB1456.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: AhmDHgRpw4K5IyyRYpgyJn+tqDt2fIx/OK4bLMP2j+/C7lfNaMhh9T9WKzpK70tKuVNuo3/Ctfhpz7tinFYoagtNM0IwU/fDQz+n9ngRiob18ODTx+sKEbPTqB6Y+LqdGOjLqha71J569r3o0eooeSrWt82ZVEJU+q9RPTxdU9fhTQMpIT/1K9bcPQvZPyhibsmN30aLbxPJU6CIc/BpLJ5jISU7SIzkz2hlp83a5BzGhHE7nClfwLhMlxWEVHrCSHUYcUEbEaCR+Fhk6eMO3tK0ABrWYDBf1RRsbjvYPTpOMAwxEuPpBF65CzEIZnWrO1eUQJmrs1945K+GZbjgdOx0FB/g2YDKmf9fCukKvIJJh7uZVI6IpYa3zC1PE+xPT1hKeVDzIX7VZfM5H/3FHPu3bqTFYzfCzwx+/ECJbDyuypYI+KWujwx72LCQtUuMnMyOP/75hyJhM8oe08SNzOgpp8EWJh4tVII2YSIS/QTmF7R3QQNjWl+0i/jlSm1c
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW3PR12MB4428.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(346002)(136003)(39850400004)(376002)(366004)(396003)(6636002)(5660300002)(8936002)(83380400001)(8676002)(478600001)(36756003)(186003)(71200400001)(53546011)(26005)(2616005)(31696002)(86362001)(6486002)(15650500001)(31686004)(2906002)(76116006)(66556008)(6512007)(66476007)(91956017)(66446008)(316002)(64756008)(55236004)(66946007)(110136005)(6506007)(45980500001)(414714003)(473944003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: =?utf-8?B?a3ZHZGJzV2pSZXNNZlFsUXZRbG4yYnAxbVdnb0paWEFXemZUUjdsZXRrUHFx?=
 =?utf-8?B?WHhRdEtFYVVzVFJoTjkxMXFzdEk5Q3BmQTNLUDhxRE9Ha2pFNDVxcDVSUE96?=
 =?utf-8?B?alhVUkhiMTRPZ0IyMXFIRXhOUHdyTnVrL3hYVUYzQ3VodkI0c0UwWkVoRll1?=
 =?utf-8?B?VVFULzVaU0U4d2dnOHRLOWUxc3RMNnhYMUxWT2V5cERaRnpubmZQdUp1N3RL?=
 =?utf-8?B?UlBGSVNEc0pTVlBQUzNscXNBcE9yaDhYSVQ2WmVVb2hEYm1FdFZ6RlZEY2hD?=
 =?utf-8?B?OXIvaDV0ckxpazV4aUxSU29XZHdtM1FIYStYaExUVDJ0MWhvbDl6d1czQi93?=
 =?utf-8?B?OTlIVzJ3Rm5LaUFFM3JBaGxFTWozWThCcFZ6RklRckhWb3V5bVJaWkNDajM4?=
 =?utf-8?B?TUcwZCtLd0VkeG5ESEJCL3hhY0NMVzdUM0l3MlZOdCtlOFFjY0daSHFjOUJr?=
 =?utf-8?B?T202S09zOWZpSW9jQlVKUUxTekxHRGR2aFlEdTRmaWlxMzNPdnMrZ2MxQ0Jo?=
 =?utf-8?B?VFRsVGZqOWFoMFI4S2JZZ1VadTFCVEJwZ0ZxcVpQVUhGbDVrMFEzREY3WnFT?=
 =?utf-8?B?cmwvakYvUVV3VWVIdis1SWt1SHc4S09kRklLamNxamxScGhFVFNMelBqYlE2?=
 =?utf-8?B?bzh1S1NVd2wvNzVYNmV5Z20veG9nZW80YVJQbE5FZm5BaCtBQWN2eHpobVlF?=
 =?utf-8?B?TnpwUVZCMTBiLzNTK2NIUWFTaEV6SjJRdGwzZzNGR1FaeXZWT01jZnJ6Y3ZH?=
 =?utf-8?B?WUEvVlJxMlJLTENCTkhZWkZuT0k5N3BOQUw0cWRySllMQy9TM05LR2xjcVB0?=
 =?utf-8?B?aHB6SGc4dUN5Yjg1M1RvVWZzU2drOSsrelJ0eUN6N1RiUlpTd0cxZWd0Y0Fy?=
 =?utf-8?B?cExGbEg1dTF6cEgvcmtUTElETVNCSWFLam1CRURrWmJETlNWTmtabjZaS3ls?=
 =?utf-8?B?UHo4ZFRXS0l0eWFZRWhQczNVTWRMckQ1YzdtcnBoVU5zYWpWK3V5QWVkQ1l4?=
 =?utf-8?B?QVlqSGNYcW1TT0E2UnZUZFhJeUxIcHFDeEQ5TE5ZZncvQmR4U0lZOFlZZTRy?=
 =?utf-8?B?L1Qwd0NsWGRzYXgyQVNtTnVwRzNmSSt2MllHNmdaZTlYU2E3cnlnOUZJUUI0?=
 =?utf-8?B?QzgzY0VjZVBIclJacDlzUm1pZmc0M3NrNFBLNE5aKzlaOXhTVDBNWHdXYXdD?=
 =?utf-8?B?eVowUnVlalQ2akVYSkRvN2Rzdy91bSt6Nm5QRzFPK0t6Znp0TW9mUGhPei9R?=
 =?utf-8?B?S2J0b3hWaE1JY1JTVkhtclJ6UmFDVERLaWp2MGpyWWN0a3ZnOStlbUZRSWFy?=
 =?utf-8?Q?kB0XKwWwJNM38=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <4C6881E6E85D5645B03F52FE63E297B8@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW3PR12MB4428.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bb4295b7-980d-4dad-be15-08d8a8c3abeb
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Dec 2020 10:56:02.8073
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8QRicuU7hJGDtsTnw5JQy78+Q2U1Hwwt6qO6JeTHSek1vBaAWl/npPDhTF3GVkcNK+szvzqCov+MJAfro6X84A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1456
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

SGkgVmluY2VudCwNCg0KT24gMTIvMjQvMjAyMCAxNjo1MCwgVmluY2VudCBQZWxsZXRpZXIgd3Jv
dGU6DQo+IEhlbGxvLA0KPiANCj4gSSBhbSB3cml0aW5nIGEgZnVuY3Rpb25mcy1iYXNlZCBnYWRn
ZXQsIHVzaW5nIHRoZSByYXNwYmVycnkgcGkgemVyby4NCj4gRGVwZW5kaW5nIG9uIHRoZSB0aW1l
IG15IHVzZXJsYW5kIHByb2Nlc3MgdGFrZXMgYmV0d2VlbiB0aGUgbW9tZW50IHRoZQ0KPiBVREMg
aXMgYm91bmQgdG8gdGhlIGdhZGdldCBhbmQgdGhlIG1vbWVudCBpdCBzdWJtaXRzIEFJTyB0cmFu
c2ZlcnMsIGl0DQo+IGVpdGhlciB3b3JrcyBhcyBleHBlY3RlZCBvciByZXN1bHRzIGluIGltbWVk
aWF0ZSB0cmFuc2ZlciBjb21wbGV0aW9uDQo+IHdpdGggc3RhdHVzIC0xMSAoLUVBR0FJTikuDQo+
IA0KPiBFbmFibGluZyBkeW5hbWljIGRlYnVnLCBJIHNlZSB0aGUNCj4gICAgZGV2X2RiZyhocy0+
ZGV2LCAiJXM6IHN1Ym1pdCByZXF1ZXN0IG9ubHkgaW4gYWN0aXZlIHN0YXRlXG4iLA0KPiBsaW5l
IGJlaW5nIG91dHB1dCB3aGVuIHRoaXMgaXNzdWUgb2NjdXJzIChzZWUgbG9nIGV4dHJhY3QgYXQg
dGhlIGVuZCBvZg0KPiB0aGlzIGVtYWlsIC0gbm90ZSB0aGUgNCBzZWNvbmRzIGdhcCBiZXR3ZWVu
IEdJTlRTVFNfRXJseVN1c3AgLSB3aGF0ZXZlcg0KPiB0aGF0IG1lYW5zIC0gYW5kIGlvIGhhcHBl
bmluZyBhbmQgYmVpbmcgcmVqZWN0ZWQpLg0KDQpBY2NvcmRpbmcgeW91ciBkZWJ1ZyBsb2cgY29y
ZSBlbnRlcnMgc3VzcGVuZCBvbiByZWNlaXZpbmcgYW4gDQpHSU5UU1RTX0VybHlTdXNwIGludGVy
cnVwdC4gSXQgbWVhbnMgdGhhdCB0aGUgZHJpdmVyIGdvZXMgdG8gTDIgc3RhdGUgDQooc3VzcGVu
ZCkuIEluIHN1c3BlbmQgbW9kZSBhY2NlcHRpbmcgYW5kIHByb2Nlc3NpbmcgRVAgcmVxdWVzdHMg
Y2FuIGxlYWQgDQp0byB1bmV4cGVjdGVkIGJlaGF2aW9yLiBUaGF0IGlzIHdoeSB0aGUgZHJpdmVy
IHJlamVjdHMgRVAgcmVxdWVzdCB3aXRoIA0KLUVBR0FJTi4NCg0KQXMgY29yZSBtYXkgdXNlIHBv
d2VyIHNhdmluZyBtb2RlcyB3aGljaCBhcmUgaW5pdGlhdGVkIGJ5IHRoZSBTdXNwZW5kIA0KaW50
ZXJydXB0LCB0aGVuIGluIGFueSBzdXNwZW5kIG1vZGUgd2hldGhlciBpdCBpcyBoaWJlcm5hdGlv
biBvciBwYXJ0aWFsIA0KcG93ZXIgZG93biB0aGUgY29yZSByZWdpc3RlcnMgYXJlIG5vdCBhdmFp
bGFibGUuIFRoaXMgaXMgd2h5IHdlIGF2b2lkIHRvIA0KZ2V0IG5ldyBFUCByZXF1ZXN0cy4NCg0K
VGhlIG1haW4gcXVlc3Rpb24gaXMgd2h5IG9uIHVzYiBidXMgc2VlbiBFcmx5U3VzcCBpbnRlcnJ1
cHQuIElzIGl0IA0KaW5pdGlhdGVkIGJ5IGhvc3Q/IElmIHllcywgd2h5Pw0KDQoNCj4gDQo+IFdo
aWxlIEkgYW0gc3VyZSB0aGVyZSBhcmUgaGFyZHdhcmUtZGVwZW5kZW50IHJlYXNvbnMgdG8gcmVq
ZWN0IHRoZXNlDQo+IHRyYW5zZmVycywgYW5kIHdoaWxlIEkgY2FuIHNoaWZ0IHByb2Nlc3Npbmcg
YXJvdW5kIHRvIHJlZHVjZSB0aGlzDQo+IGRlbGF5IGFuZCAoYXBwYXJlbnRseSkgcmVsaWFibHkg
YXZvaWQgdGhpcyBlcnJvciwgSSB0aGluayBpdCBpcyBtYWtpbmcNCj4gdXNpbmcgdGhpcyBVREMg
cmF0aGVyIGhhcmQ6IGlmIG15IHVuZGVyc3RhbmRpbmcgaXMgY29ycmVjdCwgdGhpcyBpcyBhDQo+
IHJhY2UgYmV0d2VlbiB1c2VybGFuZCBhbmQgdGhlIGJ1cy4gSWYgdGhlIEhDSSBzdXNwZW5kcyB0
aGUgYnVzIGZpcnN0LCBJDQo+IGNhbm5vdCBldmVuIHN1Ym1pdCBidWZmZXJzIHRvIGJlIHJlYWR5
IHRvIHJlY2VpdmUgc29tZSBmdXR1cmUgT1VUDQo+IHRyYW5zZmVyLCBidXQgaWYgdGhlIHVzZXJs
YW5kIHN1Ym1pdHMgdGhlc2UgYnVmZmVycyBiZWZvcmUgc3VzcGVuc2lvbg0KPiB0aGVuIHRoZXkg
YXJlIGFjY2VwdGVkIC0gZXZlbiBpZiB0aGV5IGdldCBmaWxsZWQgaG91cnMgbGF0ZXIuDQo+IElu
IG15IGNhc2UsIHRoZSBJTiB0cmFuc2ZlciBpcyBvbiBhbiBpbnRlcnJ1cHQgZW5kcG9pbnQsIHNv
IEkgYWxzbw0KPiB0aGluayBpdCB3b3VsZCBtYWtlIG1vcmUgc2Vuc2UgZm9yIHRoZSBVREMgdG8g
YWNjZXB0IGl0OiB0aGVuLCBkYXRhIGlzDQo+IHJlYWR5IGZvciB3aGVuZXZlciB0aGUgaG9zdCB3
YWtlcyB0aGUgYnVzIGFuZCBwb2xscyBmb3IgaW50ZXJydXB0DQo+IHRyYW5zZmVycy4NCj4gDQo+
IEJlaW5nIGEgdmVyeSBvY2Nhc2lvbmFsIGtlcm5lbCBjb250cmlidXRvciwgaGF2ZSBubyBpbW1l
ZGlhdGUgaWRlYSBvbg0KPiBob3cgYm90aCBzaWRlcyBjb3VsZCBiZSBjb25jaWxpYXRlZCwgc28g
dGhpcyBpcyBtb3JlIGEgIkkgbm90aWNlZCB0aGF0DQo+IGl0IGNvdWxkIGJlIG1vcmUgY29udmVu
aWVudCBpZi4uLiIgdGhhbiBhIHByb3BlciBidWcgcmVwb3J0Lg0KPiANCj4gQ2hlY2tpbmcgdGhl
IGR3YzMgSSBkbyBub3QgaWRlbnRpZnkgc3VjaCBFQUdBSU4gaW4gaXRzIGlvIHN1Ym1pc3Npb24N
Cj4gY29kZSwgYW5kIEkgZGlkIG5vdCAoeWV0ID8pIHRyaWdnZXIgc3VjaCBlcnJvciBvbiBteSBJ
bnRlbCBFZGlzb24uDQo+IA0KPiBEZWMgMjQgMTI6Mjk6MTkgc3VzaGkga2VybmVsOiBbMjE4ODI4
LjQ5NzkzN10gZHdjMiAyMDk4MDAwMC51c2I6IGVwMCBzdGF0ZToxDQo+IERlYyAyNCAxMjoyOTox
OSBzdXNoaSBrZXJuZWw6IFsyMTg4MjguNDk3OTQ4XSBkd2MyIDIwOTgwMDAwLnVzYjogZHdjMl9o
c290Z19zdGFydF9yZXE6IER4RVBDVEw9MHg4NDAyODAwMA0KPiBEZWMgMjQgMTI6Mjk6MTkgc3Vz
aGkga2VybmVsOiBbMjE4ODI4LjQ5Nzk1OV0gZHdjMiAyMDk4MDAwMC51c2I6IGR3YzJfaHNvdGdf
c3RhcnRfcmVxOiBEWEVQQ1RMPTB4ODAwMDgwMDANCj4gRGVjIDI0IDEyOjI5OjE5IHN1c2hpIGtl
cm5lbDogWzIxODgyOC40OTc5ODRdIGR3YzIgMjA5ODAwMDAudXNiOiBkd2MyX2hzb3RnX2lycTog
MDQwNDgwMjggMDAwNDAwMDAgKGQwYmMzY2M0KSByZXRyeSA4DQo+IERlYyAyNCAxMjoyOToxOSBz
dXNoaSBrZXJuZWw6IFsyMTg4MjguNDk3OTk2XSBkd2MyIDIwOTgwMDAwLnVzYjogZHdjMl9oc290
Z19pcnE6IGRhaW50PTAwMDAwMDAxDQo+IERlYyAyNCAxMjoyOToxOSBzdXNoaSBrZXJuZWw6IFsy
MTg4MjguNDk4MDA4XSBkd2MyIDIwOTgwMDAwLnVzYjogZHdjMl9oc290Z19lcGludDogZXAwKGlu
KSBEeEVQSU5UPTB4MDAwMDAwMDENCj4gRGVjIDI0IDEyOjI5OjE5IHN1c2hpIGtlcm5lbDogWzIx
ODgyOC40OTgwMjJdIGR3YzIgMjA5ODAwMDAudXNiOiBkd2MyX2hzb3RnX2VwaW50OiBYZmVyQ29t
cGw6IER4RVBDVEw9MHgwMDAwODAwMCwgRFhFUFRTSVo9MDAwMDAwMDANCj4gRGVjIDI0IDEyOjI5
OjE5IHN1c2hpIGtlcm5lbDogWzIxODgyOC40OTgwMzRdIGR3YzIgMjA5ODAwMDAudXNiOiBkd2My
X2hzb3RnX2NvbXBsZXRlX2luOiBhZGp1c3Rpbmcgc2l6ZSBkb25lIDAgPT4gMzYNCj4gRGVjIDI0
IDEyOjI5OjE5IHN1c2hpIGtlcm5lbDogWzIxODgyOC40OTgwNDZdIGR3YzIgMjA5ODAwMDAudXNi
OiByZXEtPmxlbmd0aDozNiByZXEtPmFjdHVhbDozNiByZXEtPnplcm86MQ0KPiBEZWMgMjQgMTI6
Mjk6MTkgc3VzaGkga2VybmVsOiBbMjE4ODI4LjQ5ODA1Nl0gZHdjMiAyMDk4MDAwMC51c2I6IFJl
Y2VpdmluZyB6ZXJvLWxlbmd0aCBwYWNrZXQgb24gZXAwDQo+IERlYyAyNCAxMjoyOToxOSBzdXNo
aSBrZXJuZWw6IFsyMTg4MjguNDk4MDc4XSBkd2MyIDIwOTgwMDAwLnVzYjogZHdjMl9oc290Z19p
cnE6IDA0MDg4MDI4IDAwMDgwMDAwIChkMGJjM2NjNCkgcmV0cnkgOA0KPiBEZWMgMjQgMTI6Mjk6
MTkgc3VzaGkga2VybmVsOiBbMjE4ODI4LjQ5ODA4OV0gZHdjMiAyMDk4MDAwMC51c2I6IGR3YzJf
aHNvdGdfaXJxOiBkYWludD0wMDAxMDAwMA0KPiBEZWMgMjQgMTI6Mjk6MTkgc3VzaGkga2VybmVs
OiBbMjE4ODI4LjQ5ODEwMV0gZHdjMiAyMDk4MDAwMC51c2I6IGR3YzJfaHNvdGdfZXBpbnQ6IGVw
MChvdXQpIER4RVBJTlQ9MHgwMDAwMDAwMQ0KPiBEZWMgMjQgMTI6Mjk6MTkgc3VzaGkga2VybmVs
OiBbMjE4ODI4LjQ5ODExM10gZHdjMiAyMDk4MDAwMC51c2I6IGR3YzJfaHNvdGdfZXBpbnQ6IFhm
ZXJDb21wbDogRHhFUENUTD0weDAwMDI4MDAwLCBEWEVQVFNJWj0yMDAwMDAwMA0KPiBEZWMgMjQg
MTI6Mjk6MTkgc3VzaGkga2VybmVsOiBbMjE4ODI4LjQ5ODEyMl0gZHdjMiAyMDk4MDAwMC51c2I6
IHpscCBwYWNrZXQgcmVjZWl2ZWQNCj4gRGVjIDI0IDEyOjI5OjE5IHN1c2hpIGtlcm5lbDogWzIx
ODgyOC40OTgxMzhdIGR3YzIgMjA5ODAwMDAudXNiOiBjb21wbGV0ZTogZXAgNDJkZDVhYWQgZXAw
LCByZXEgMjlmMzkyYWIsIDAgPT4gNWMzMTY0MTMNCj4gRGVjIDI0IDEyOjI5OjE5IHN1c2hpIGtl
cm5lbDogWzIxODgyOC40OTgxNTJdIGR3YzIgMjA5ODAwMDAudXNiOiBkd2MyX2hzb3RnX2VucXVl
dWVfc2V0dXA6IHF1ZXVlaW5nIHNldHVwIHJlcXVlc3QNCj4gRGVjIDI0IDEyOjI5OjE5IHN1c2hp
IGtlcm5lbDogWzIxODgyOC40OTgxNjldIGR3YzIgMjA5ODAwMDAudXNiOiBlcDA6IHJlcSA4ZTE0
YzdiMjogOEBkOTFiZmMzOSwgbm9pPTAsIHplcm89MCwgc25vaz0wDQo+IERlYyAyNCAxMjoyOTox
OSBzdXNoaSBrZXJuZWw6IFsyMTg4MjguNDk4MTg2XSBkd2MyIDIwOTgwMDAwLnVzYjogZHdjMl9o
c290Z19zdGFydF9yZXE6IER4RVBDVEw9MHgwMDAyODAwMCwgZXAgMCwgZGlyIG91dA0KPiBEZWMg
MjQgMTI6Mjk6MTkgc3VzaGkga2VybmVsOiBbMjE4ODI4LjQ5ODE5OF0gZHdjMiAyMDk4MDAwMC51
c2I6IHVyZXEtPmxlbmd0aDo4IHVyZXEtPmFjdHVhbDowDQo+IERlYyAyNCAxMjoyOToxOSBzdXNo
aSBrZXJuZWw6IFsyMTg4MjguNDk4MjEyXSBkd2MyIDIwOTgwMDAwLnVzYjogZHdjMl9oc290Z19z
dGFydF9yZXE6IDFAOC84LCAweDAwMDgwMDA4ID0+IDB4MDAwMDBiMTANCj4gRGVjIDI0IDEyOjI5
OjE5IHN1c2hpIGtlcm5lbDogWzIxODgyOC40OTgyMjVdIGR3YzIgMjA5ODAwMDAudXNiOiBkd2My
X2hzb3RnX3N0YXJ0X3JlcTogMHg1NGFiOGEyMCA9PiAweDAwMDAwYjE0DQo+IERlYyAyNCAxMjoy
OToxOSBzdXNoaSBrZXJuZWw6IFsyMTg4MjguNDk4MjM1XSBkd2MyIDIwOTgwMDAwLnVzYjogZXAw
IHN0YXRlOjANCj4gRGVjIDI0IDEyOjI5OjE5IHN1c2hpIGtlcm5lbDogWzIxODgyOC40OTgyNDVd
IGR3YzIgMjA5ODAwMDAudXNiOiBkd2MyX2hzb3RnX3N0YXJ0X3JlcTogRHhFUENUTD0weDgwMDI4
MDAwDQo+IERlYyAyNCAxMjoyOToxOSBzdXNoaSBrZXJuZWw6IFsyMTg4MjguNDk4MjU2XSBkd2My
IDIwOTgwMDAwLnVzYjogZHdjMl9oc290Z19zdGFydF9yZXE6IERYRVBDVEw9MHg4MDAyODAwMA0K
PiBEZWMgMjQgMTI6Mjk6MjIgc3VzaGkga2VybmVsOiBbMjE4ODMwLjk2NzAxNl0gZHdjMiAyMDk4
MDAwMC51c2I6IGR3YzJfaHNvdGdfaXJxOiAwNDAwODQyOCAwMDAwMDQwMCAoZDBiYzNjYzQpIHJl
dHJ5IDgNCj4gRGVjIDI0IDEyOjI5OjIyIHN1c2hpIGtlcm5lbDogWzIxODgzMC45NjcwMzVdIGR3
YzIgMjA5ODAwMDAudXNiOiBHSU5UU1RTX0VybHlTdXNwDQo+IERlYyAyNCAxMjoyOToyMiBzdXNo
aSBrZXJuZWw6IFsyMTg4MzAuOTcwMDM5XSBkd2MyIDIwOTgwMDAwLnVzYjogZHdjMl9oc290Z19p
cnE6IDA0MDA4MDI4IDAwMDAwMDAwIChkMGJjM2NjNCkgcmV0cnkgOA0KPiBEZWMgMjQgMTI6Mjk6
MjUgc3VzaGkga2VybmVsOiBbMjE4ODM0LjQ4NTE1Ml0gZHdjMiAyMDk4MDAwMC51c2I6IGVwMW91
dDogcmVxIDkxODUxYWM1OiAxMDI0MEBlNTVhYTU5Yywgbm9pPTAsIHplcm89MCwgc25vaz0wDQo+
IERlYyAyNCAxMjoyOToyNSBzdXNoaSBrZXJuZWw6IFsyMTg4MzQuNDg1MTcyXSBkd2MyIDIwOTgw
MDAwLnVzYjogZHdjMl9oc290Z19lcF9xdWV1ZTogc3VibWl0IHJlcXVlc3Qgb25seSBpbiBhY3Rp
dmUgc3RhdGUNCj4gRGVjIDI0IDEyOjI5OjI1IHN1c2hpIGtlcm5lbDogWzIxODgzNC40ODUyNjFd
IGR3YzIgMjA5ODAwMDAudXNiOiBlcDFvdXQ6IHJlcSA5MTg1MWFjNTogMTAyNDBAZTU1YWE1OWMs
IG5vaT0wLCB6ZXJvPTAsIHNub2s9MA0KPiBEZWMgMjQgMTI6Mjk6MjUgc3VzaGkga2VybmVsOiBb
MjE4ODM0LjQ4NTI3M10gZHdjMiAyMDk4MDAwMC51c2I6IGR3YzJfaHNvdGdfZXBfcXVldWU6IHN1
Ym1pdCByZXF1ZXN0IG9ubHkgaW4gYWN0aXZlIHN0YXRlDQo+IERlYyAyNCAxMjoyOToyNSBzdXNo
aSBrZXJuZWw6IFsyMTg4MzQuNTE1NTE2XSBkd2MyIDIwOTgwMDAwLnVzYjogZXAyaW46IHJlcSA5
MTg1MWFjNTogMkA4OTI1ZTUzYSwgbm9pPTAsIHplcm89MCwgc25vaz0wDQo+IERlYyAyNCAxMjoy
OToyNSBzdXNoaSBrZXJuZWw6IFsyMTg4MzQuNTE1NTM2XSBkd2MyIDIwOTgwMDAwLnVzYjogZHdj
Ml9oc290Z19lcF9xdWV1ZTogc3VibWl0IHJlcXVlc3Qgb25seSBpbiBhY3RpdmUgc3RhdGUNCj4g
RGVjIDI0IDEyOjI5OjMxIHN1c2hpIGtlcm5lbDogWzIxODg0MC4zMzc4MDldIGR3YzIgMjA5ODAw
MDAudXNiOiBkd2MyX2hzb3RnX3B1bGx1cDogaXNfb246IDAgb3Bfc3RhdGU6IDMNCj4gRGVjIDI0
IDEyOjI5OjMxIHN1c2hpIGtlcm5lbDogWzIxODg0MC4zMzc4NDRdIGR3YzIgMjA5ODAwMDAudXNi
OiBjb21wbGV0ZTogZXAgNDJkZDVhYWQgZXAwLCByZXEgOGUxNGM3YjIsIC0xMDggPT4gOTdlOWJk
MjgNCj4gRGVjIDI0IDEyOjI5OjMxIHN1c2hpIGtlcm5lbDogWzIxODg0MC4zMzc4NjVdIGR3YzIg
MjA5ODAwMDAudXNiOiBkd2MyX2hzb3RnX2NvbXBsZXRlX3NldHVwOiBmYWlsZWQgLTEwOA0KPiAN
Cj4gUmVnYXJkcywNCj4gDQoNClJlZ2FyZHMsDQpBcnR1cg0K
