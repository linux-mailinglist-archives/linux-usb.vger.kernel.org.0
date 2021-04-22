Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9C11136888F
	for <lists+linux-usb@lfdr.de>; Thu, 22 Apr 2021 23:28:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239538AbhDVV3F (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 22 Apr 2021 17:29:05 -0400
Received: from smtprelay-out1.synopsys.com ([149.117.73.133]:38000 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S236851AbhDVV3C (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 22 Apr 2021 17:29:02 -0400
Received: from mailhost.synopsys.com (badc-mailhost1.synopsys.com [10.192.0.17])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 7BFDA40697;
        Thu, 22 Apr 2021 21:28:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1619126907; bh=gXSmPdM4Rb6mScCM3CyxCyGMZBUuLA9KVJ0ohlCRfcc=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=V3qGVD8nTIMl4jIR2SJjFFtw2IqvcH+yAzDz9nupK7hU4QNU0n63dVCUuErz4RlJ+
         g73/g9nllLPrExSMKG5wxuG8sHm8fDfGGp/0sc6cXlS0Ac4NwPkF92+srsK3hnG3By
         q0AuzCWUrxdN23/paukWcN4hljNzNpdDFRg5SZrE7UqgWC7qgQWtSGvYUT269bjHiH
         P4Ib97uNEDfkd1x+g09I73XalnHWIjjKsxQDkRnvjb8ThWqhfnvgLH8MG7Zk+MnBkh
         BHuT6wqgoE9/ohMjaOBDIua2FUW9Czq3jwbf9G+ZSwk+OeENdpJTDqL4neAerT8hAJ
         2HJyZxn0H8alw==
Received: from o365relay-in.synopsys.com (us03-o365relay3.synopsys.com [10.4.161.139])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPS id C2BCEA0079;
        Thu, 22 Apr 2021 21:28:25 +0000 (UTC)
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11lp2168.outbound.protection.outlook.com [104.47.56.168])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
        by o365relay-in.synopsys.com (Postfix) with ESMTPS id 1396F800A8;
        Thu, 22 Apr 2021 21:28:24 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=thinhn@synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
        dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="Xg9V3DO3";
        dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HaMlUCnAd1alzNC3d8Cd1g6fAtGhiQ/6JgrSsizfCuzaQpqnd8hI73CtTygeISYi8OCkxshjMggutqA9pfPalmF8YMvyVvTWyhepzu+pckrxChe3sRCeXrplHVMWWBo9dpNXXeapH+jrSpb3VJEGnAHr0ZBaWvU+IHhm5JAEZxzxgMfIH3e5tleI4riJO8yLKQx7CN91uF1tTy8WIUKDxAWmZlKQhGZGRtGAheODwuOWP4zFFVrzHQq7d34B4m7iJWRm71F3hEPf4T+313jHsd305XlUWnBQrQsh0t6RkQRXqhD4ooD07x/GkcbVEC6TNvJ4Wsv3ORhPbU72rwyWEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gXSmPdM4Rb6mScCM3CyxCyGMZBUuLA9KVJ0ohlCRfcc=;
 b=VmVq+ZMxTJVU/Fx7402WwCIEe9nsiAYdOGMoWyadEtqz1cxEnfyipzn8GiJj6DjduW1VB4c60476HNRJDNI/H5nIf5so623Y5Ax+rJKeeVA2XTma24xsYrm/50Wijl3RXgW3byncQ4YmdfqqJHkZJbx/qCOUe/FMzUxLFyWwaDm1Nm4sRzKPk5PDvpUSpjgz3Jy9Rm0FGeZpyoczsk66HtuDa3wfzUZLL49+E0PNU7sFTYUG3WmiQCnGmXDEwUCDQOV6s2N3PrBn7UiIizuW6UiV0wVnYUoDiZVS2lL5o1a4rB6Pl8vyrnGsoelgDyaii/L1IHlplQHG/+xto9ZviA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gXSmPdM4Rb6mScCM3CyxCyGMZBUuLA9KVJ0ohlCRfcc=;
 b=Xg9V3DO3to+KLA/sGEPe69R8pmV4ff1Sxy2nTRhMUc/IhNjvOw0pDTz/g/zUhKrzXtIFKFtZFuUkpj3BnmgqEda7YIylQhRvvaqLuibMpv804113D819U5Fru9uLUOEqDUZ9CpdbQa4Ru72mcff7toW+qQ95SUtewJvPJ+KlJSg=
Received: from BYAPR12MB4791.namprd12.prod.outlook.com (2603:10b6:a03:10a::12)
 by BY5PR12MB4211.namprd12.prod.outlook.com (2603:10b6:a03:20f::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.23; Thu, 22 Apr
 2021 21:28:23 +0000
Received: from BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::7c97:6a33:14c4:dd8c]) by BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::7c97:6a33:14c4:dd8c%6]) with mapi id 15.20.4042.024; Thu, 22 Apr 2021
 21:28:23 +0000
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To:     Michael Grzeschik <m.grzeschik@pengutronix.de>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
CC:     "balbi@kernel.org" <balbi@kernel.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>
Subject: Re: [PATCH 1/2] dwc3: gadget: fix setting of pending_sgs
Thread-Topic: [PATCH 1/2] dwc3: gadget: fix setting of pending_sgs
Thread-Index: AQHXNu+9QeBBcEiYYEKutQ7yev+/B6rBDvcA
Date:   Thu, 22 Apr 2021 21:28:23 +0000
Message-ID: <88bb18e1-d62c-da11-4d84-9cf416fc9266@synopsys.com>
References: <20210421204837.4185-1-m.grzeschik@pengutronix.de>
 <20210421204837.4185-2-m.grzeschik@pengutronix.de>
In-Reply-To: <20210421204837.4185-2-m.grzeschik@pengutronix.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.1
authentication-results: pengutronix.de; dkim=none (message not signed)
 header.d=none;pengutronix.de; dmarc=none action=none
 header.from=synopsys.com;
x-originating-ip: [98.248.94.126]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9cdb4509-2ae4-4241-3506-08d905d58ec2
x-ms-traffictypediagnostic: BY5PR12MB4211:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BY5PR12MB421113E999336FA91DC34972AA469@BY5PR12MB4211.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: cAoB60doNf7fucFRSkMq6ePYZgfNy4kz1kcSYzo1sOmZvZk9Z9k0gycT6Ju0KUvpRlUleSFFyGOGozxVR6onSEThjBt/sigfd62Gi2YqN+9uIGLQ4g+RqQl067ldCGfzgfn+7xVr233d/PaeC8eifTy/m10SRojP+ylCFlM31X8LYufyQEKS8x7Hiu1iABpfFEyKWNQyM/i36hPJRwYpBlv+jlg+GqzbJQfE2J/NNF0NAb1ZIyiyjI9eWjlwkqbs43c3/BsvmzPhj48sAXEE+P/CFAwqdxXySEfRr1Nf6+qB0Wx548PzqfbQJpTpBH6hozmuyQ7b/YIyiSiVqq9MvSxjMFP6POgEXJizny+0SZKH3o6hduJx6IWjIAvpHk5kMkAOGK86yz65b7i37MjJMVT5BW390htsAwk1xTruRgZxLiFu3jjM3eAY5hJeidJIB270xufOaddi1d+Gh0XYJXkYwy2nUzZ5yrS19aeDZEKpxX+e10xsWYjmMs35hO1Q2vyWOmSI0Q3b1QBEYpLH1WRchUMgleos+7vOvUddbSV4ea/XBiRCKB9oCtrt+JEdRIt6PtcVvIH8nPgsLoV9tCSdYE6pCpiuCoN46nzp8rAkqs06gnH2B9FR8Ldi68NihVSO5SeETYZZO6jUTrTCOBUIK/VIMauHZ9Rb1irDrztSutAZE40O+Y6MHMuY8om5
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB4791.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(396003)(136003)(346002)(39850400004)(366004)(376002)(76116006)(66946007)(66476007)(64756008)(66556008)(66446008)(6506007)(71200400001)(54906003)(8936002)(8676002)(2906002)(36756003)(31686004)(38100700002)(6486002)(26005)(186003)(5660300002)(83380400001)(31696002)(316002)(110136005)(4326008)(86362001)(6512007)(2616005)(122000001)(478600001)(45980500001)(43740500002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: =?utf-8?B?cFFVRTF1ZzhuVWRZcWFSNjdoeTNLUDR0VEIyU1VHbk0xWUVhUWpiU1ZtZmRr?=
 =?utf-8?B?U2Ftbml6UnI1Vjk2WXRST09UWm45WXpRWEkxVklpV3dWS1R4L29ZVkJLZmE4?=
 =?utf-8?B?NDhBTlJjQXozSE5XUHFiNmowOHJ5Tkh2Qk1BSXBpeENLeTNSanR3UFVrTzBk?=
 =?utf-8?B?dWxhUmh5V3NldUdWZU1NOWtIYkpIY3dQaUVCYjlpcHRhRmE2cFBvMkI2Ykg3?=
 =?utf-8?B?SC83M1VPcDRYaUNia0Jnb09FellnTlAvZVZ0S1pZbjhQUDkyNnozdCtMeW1G?=
 =?utf-8?B?NWgrSVB2VFVzSjB4WUs0RHdHSFlPdEE2Q2NDdy9KUlo1SmtMeXg3a3E2OXVK?=
 =?utf-8?B?ZDVyeTQ3T1BiOUliRzF1UWZxRzFQaGdzc3JCRm5ZYmVFL3dUSDZJZjEyRmUv?=
 =?utf-8?B?R0pqbG5DeUt0NGtUa04wSlJ2MDFteDdBRlZlemMyVUF3TDJLbU5Hb092eDF6?=
 =?utf-8?B?b3QvU3E4ZEllY3JXZkpUWDBDZEFSenhsWi8rSG1DdXAzYXdpNnJNUWxmaWFD?=
 =?utf-8?B?bHBQWEd3T3p4ZXlvVHNrTCtvU2hWRStvSFZ5YnRIQlBGcjBGLy9FRGtrY0lT?=
 =?utf-8?B?ZG5WS2tCWlpmQ1FoK0E1VXFkR3F4Z2J4OVhjc21zbk9xc0hua1BlMzg4dHNH?=
 =?utf-8?B?WnZpdDh5bUpVeXVSdzFRcTNaUUZoMllnMjdONkFQYlJwdTM5ZGJ2NGxaMmJs?=
 =?utf-8?B?RmFrVWFNVVBLK1p3NE5UZ2VxTGlBMHM0QW9sU0ZLb3NINlNzRkdMcE9pZTlT?=
 =?utf-8?B?dnlEZ0N4THI3Yk1mN3pTSkRCYkxRdktVUXJpYlg4cnlGSVZYZWpYQWp6aVN0?=
 =?utf-8?B?bW1CRG8vc0hrL21FdkN6cGRCLzJGS2ZPUmZMWkdFTzNmU1ZESTluZzBMUWU4?=
 =?utf-8?B?M0JiaU45T3VPN3BEYVNjdjdsV3RsMWx3eVFUNlBKQktjNTRnK29XZWQ1ZjBu?=
 =?utf-8?B?cWgvcVJDdkxSanhjNnB3V0ZQRHVwYWVHczc3NFdCZ3NxTHFROHVWYkZPZDlL?=
 =?utf-8?B?QlAvN0NQWFd0TmZFUUd4aG9nVzF6Q2s3VjZWTGNDRWFsRXJYazE5SXAyUWRv?=
 =?utf-8?B?UmtCSG5aeDVaWU9uNVdRT3lzL0hIMi9zczBsUCt1N0M2RytRVlJ6MTBWZVVG?=
 =?utf-8?B?aEFkQjRXNkNxRmdxOExzampDSGNoTzc2TzMveDA2Vkxpc1NWMXpEbEtuK21L?=
 =?utf-8?B?YVJtdHhLNUNjb3lkRDBvdWpZNHhOQWxScUw0QUJ6VXZzK0xIdTZXSmQxVDJU?=
 =?utf-8?B?eUNpZGVaVDZoTGFJd0ticC9wSUxSTUhCQnpGSmRGc2FtY3BTL1JWQkdXeHlB?=
 =?utf-8?B?MWxmQkIyS0QyN2pWZVRsbVlVQ1p2UGRoUTMzL3FISzJFVnlEN1I1M0diZTc2?=
 =?utf-8?B?R1R3ajJ0Z3JjRTEvaWxmVldQTW1sMzBqWk9FQUh0WEFpV2lsYk1DV1k4TnRk?=
 =?utf-8?B?UjNvTGZTSnNtMFg4Y0VmWERSem83ZW1SemNEYTlGRVUyd2NscTJCSXFxWDNO?=
 =?utf-8?B?cW0rS3QwN0F0MlRLdDVyVno2aktjUi9kQXFlemtqRlhqREcvNG9qbUNzcytS?=
 =?utf-8?B?NlZoSjJReGY1NVYyMGE4ckg2MFRkNUMwV2tpWlE0cGRXSUZ3Y0JXaWQ3Ti8y?=
 =?utf-8?B?VVh5b2dtc3FkOFdYNkJTM01hZ0o3SkJYZHYrVitDaS9TKzFRZW1DRFd3OXpq?=
 =?utf-8?B?TWgwMkFFZGVnY0lTZmtDb09YYnNXYkRySUZZOWpaNTZBNWN3OWNqb1FxWDZM?=
 =?utf-8?Q?6N8aANheripAw990ZA=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <0F3D4D458D5F8840B78C340BCD711AFE@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB4791.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9cdb4509-2ae4-4241-3506-08d905d58ec2
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Apr 2021 21:28:23.0251
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: u7GDT09NkH2YVx2bwojXfqc0+zgVcwSaKvdYk5WokxOdcDNn3AWYYj6q6V/NaWqIYbz8MNGX7dvxZxjoxIfB5g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4211
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

TWljaGFlbCBHcnplc2NoaWsgd3JvdGU6DQo+IEluIHRoZSBkd2MzX3ByZXBhcmVfdHJic19zZyBy
b3V0aW5lLCB3aGVuIGFsbCBkYXRhIGZyb20gcmVxdWVzdCB3YXMNCj4gaGFuZGxlZCBwZW5kaW5n
X3NncyBzaG91bGQgYmUgc2V0IHRvIHRoZSBudW1iZXIgb2YgbWFwcGVkIHNncyB0aGF0IGFyZQ0K
PiBub3QgcXVldWVkIHVwLg0KPiANCj4gQ3VycmVudGx5IHRoZSBjb2RlIHdpbGwgcmVzdWx0IGlu
IHBlbmRpbmdfc2dzID09IHF1ZXVlZF9zZ3MuIFRoYXQNCj4gdmFyaWFibGVzIHZhbHVlIHdpbGwg
bGlrZWx5IG5vdCBiZSB6ZXJvIGFuZCBicmVhayBkd2MzX3ByZXBhcmVfdHJicy4NCj4gDQo+IFRo
aXMgcGF0Y2ggZml4ZXMgdGhlIHNldHRpbmcgb2YgdGhlIHZhcmlhYmxlIHRvIGl0cyBpbnRlbmRl
ZCBwdXJwb3NlLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogTWljaGFlbCBHcnplc2NoaWsgPG0uZ3J6
ZXNjaGlrQHBlbmd1dHJvbml4LmRlPg0KPiAtLS0NCj4gIGRyaXZlcnMvdXNiL2R3YzMvZ2FkZ2V0
LmMgfCAyICstDQo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24o
LSkNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3VzYi9kd2MzL2dhZGdldC5jIGIvZHJpdmVy
cy91c2IvZHdjMy9nYWRnZXQuYw0KPiBpbmRleCA2MjI3NjQxZjJkMzE4Li4xMThiNWJjYzU2NWQ2
IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL3VzYi9kd2MzL2dhZGdldC5jDQo+ICsrKyBiL2RyaXZl
cnMvdXNiL2R3YzMvZ2FkZ2V0LmMNCj4gQEAgLTEyNDIsNyArMTI0Miw3IEBAIHN0YXRpYyBpbnQg
ZHdjM19wcmVwYXJlX3RyYnNfc2coc3RydWN0IGR3YzNfZXAgKmRlcCwNCj4gIAkJICogZG9uJ3Qg
aW5jbHVkZSB1bnVzZWQgU0cgZW50cmllcy4NCj4gIAkJICovDQo+ICAJCWlmIChsZW5ndGggPT0g
MCkgew0KPiAtCQkJcmVxLT5udW1fcGVuZGluZ19zZ3MgLT0gcmVxLT5yZXF1ZXN0Lm51bV9tYXBw
ZWRfc2dzIC0gcmVxLT5udW1fcXVldWVkX3NnczsNCj4gKwkJCXJlcS0+bnVtX3BlbmRpbmdfc2dz
ID0gcmVxLT5yZXF1ZXN0Lm51bV9tYXBwZWRfc2dzIC0gcmVxLT5udW1fcXVldWVkX3NnczsNCj4g
IAkJCWJyZWFrOw0KPiAgCQl9DQo+ICANCj4gDQoNCldlIHVwZGF0ZSB0aGUgcmVxLT5udW1fcGVu
ZGluZ19zZ3MgZXZlcnkgVFJCIGNvbXBsZXRpb24gaW50ZXJydXB0LiBEb2luZw0KdGhpcyB3aWxs
IGJyZWFrIHRoZSBjdXJyZW50IGxvZ2ljLiBJZiB0aGVyZSdzIGEgY2hhbmdlIHRvIHRoZSBjdXJy
ZW50DQpsb2dpYywgaXQgc2hvdWxkIGJlIHBhcnQgb2YgdGhpcyBwYXRjaC4gT3RoZXJ3aXNlIGJp
c2VjdGlvbiB3aWxsIGZhaWwgaGVyZS4NCg0KQlIsDQpUaGluaA0K
