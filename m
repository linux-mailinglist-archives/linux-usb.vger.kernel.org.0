Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A9E9836CE93
	for <lists+linux-usb@lfdr.de>; Wed, 28 Apr 2021 00:30:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235420AbhD0Wbc (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 27 Apr 2021 18:31:32 -0400
Received: from smtprelay-out1.synopsys.com ([149.117.73.133]:48204 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S235382AbhD0Wbc (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 27 Apr 2021 18:31:32 -0400
Received: from mailhost.synopsys.com (badc-mailhost2.synopsys.com [10.192.0.18])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 4E5A74014F;
        Tue, 27 Apr 2021 22:30:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1619562648; bh=l8kC027iVyJFtbmRy/6P0JonhZBCHsRag2YZbJcjyMQ=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=lZ2j1sgzhb6nGBMvX2q/zDC+BlMpZy0/IoD8LtosZ3EZqiHBVQiV8aTW6412ael0A
         W9tK4StBhnJ1RE/5HD55kariDlHlTKF9zTgXR31XIssG2072VpBmbLaBuIU8RkUTJa
         jrpOKIMa9Rq6slB4L1J67tNxjlxOQKbTzgG26bCfByEiN1m3/X8UaJ0irO2zjc8qEN
         sQNuTqq171BtHRMuymGaZDZxlqUuyJmYwjE7EV4Q8h8/vire0rId6XiUlaLKdWGtA9
         KBOwpMbyGtU1xmcWSKU/VF1TTXpPyq/Qdn7f3SCX0tY4z4jJIu+D1b2bIokjEJ6RJi
         S5+vMXgt4AjmA==
Received: from o365relay-in.synopsys.com (sv2-o365relay1.synopsys.com [10.202.1.137])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPS id E4B36A00B8;
        Tue, 27 Apr 2021 22:30:46 +0000 (UTC)
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2041.outbound.protection.outlook.com [104.47.66.41])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
        by o365relay-in.synopsys.com (Postfix) with ESMTPS id DF9DB400F7;
        Tue, 27 Apr 2021 22:30:45 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=thinhn@synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
        dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="M+Yy3nuI";
        dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P+dvq3pjxgjT8IRLnxm0iYAd7dmzids8y35AnG+QgZq8KoOa93ZjXQzbokGj1+sgST2SpwLB1BJOoGbWjRqE7m9PNno+UQLtKmODzO1oSsZ/YBSe2hd7WHQRoHpxa/1RIBkEILAuBE7c0CFPv+KFuJbJ1mL/tQuRhkWAibmBIFMpd9RfHC0kDCuhNkAYartN7qYIFFsoc4xqHX3pSbfG9h4xiFHT1MGJgEJBz9F39mTVFfkwKNYwfnn9Mk2B1FufIa58xAKcGHYGcHrtA5q1MDPuDEux3wJ6eUpcTUIo8VhPHynNV8Bc/9WgyGlzej6ffVZVk1n4Ae0zIc9y8DFTRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l8kC027iVyJFtbmRy/6P0JonhZBCHsRag2YZbJcjyMQ=;
 b=i13MMjldS5hgsTGwZUuPIe46jpT3W4zAssQp77ZaZxMGXj1sV1B7puUbY8w7iq3CiNbrIvr807z+vP8eVvDvjwJ/PJsw83v4xvYU4fSbf8PYfFNu3MNILX1E4vv6JdAm/6ZjwRNboOq2ljM4H1P4wR3RBNUhl3BUSqiHp4DnOppcrbIzF1vG2M2xKxAT8WV6htHjf8cGjro8XnrjdEQvgdSulkgj5fMD5fI7esySMQEyWM0fAuwi8DloOxKgnDTDc3Q7feokMO2LvFnpffcPrYbn+meRGYdodm00qDMT4AkJ/woTdRH8uBnb2M/mXvbwT3LEb0cRnA/mHMvPz4D+QA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l8kC027iVyJFtbmRy/6P0JonhZBCHsRag2YZbJcjyMQ=;
 b=M+Yy3nuI1Z6m8fSUTeeDS3jtRtx31nQg+ePG8k5x6MUg8VIydpsuW7BCVJ1CNsvDWPcKCuqqmn117M2WDnLobs+44b1ED83hqLKVNrtViGn3k9dWOun52V8/BXS+Meg1i1e7cLrZx6dwFPL10s7JwlpVBmOAc6NWziePKVu/Qyw=
Received: from BYAPR12MB4791.namprd12.prod.outlook.com (2603:10b6:a03:10a::12)
 by BY5PR12MB4855.namprd12.prod.outlook.com (2603:10b6:a03:1dd::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.20; Tue, 27 Apr
 2021 22:30:43 +0000
Received: from BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::7c97:6a33:14c4:dd8c]) by BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::7c97:6a33:14c4:dd8c%6]) with mapi id 15.20.4087.025; Tue, 27 Apr 2021
 22:30:43 +0000
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To:     Mathias Nyman <mathias.nyman@linux.intel.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Mathias Nyman <mathias.nyman@intel.com>
CC:     John Youn <John.Youn@synopsys.com>
Subject: Re: [PATCH v2 3/7] usb: xhci: Check for blocked disconnection
Thread-Topic: [PATCH v2 3/7] usb: xhci: Check for blocked disconnection
Thread-Index: AQHXLaMGEnyCiS/nrkqrVSUQ+6GpwqrIcYeAgACdG4A=
Date:   Tue, 27 Apr 2021 22:30:43 +0000
Message-ID: <b5c8bfc8-20cf-fad1-f053-971cb98348ad@synopsys.com>
References: <cover.1618014279.git.Thinh.Nguyen@synopsys.com>
 <07196754c6de290bb46cc235ce6e96c5df304150.1618014279.git.Thinh.Nguyen@synopsys.com>
 <845ec8a0-43f2-a28e-5edc-d7a47ccabdf5@linux.intel.com>
In-Reply-To: <845ec8a0-43f2-a28e-5edc-d7a47ccabdf5@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
authentication-results: linux.intel.com; dkim=none (message not signed)
 header.d=none;linux.intel.com; dmarc=none action=none
 header.from=synopsys.com;
x-originating-ip: [98.248.94.126]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 514ec1a2-09d0-4ec7-5346-08d909cc1830
x-ms-traffictypediagnostic: BY5PR12MB4855:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BY5PR12MB485589D9A65E75F1941C05D1AA419@BY5PR12MB4855.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: nrQ6eD86QxMUa5GBDzhnSkaOnCrSciCgY5VPZevGqjIQIyTfsllFdqurPHY8GICxOepnTekaW9KZ2vU/WxOw/orMKs+Jc5DD7tDIAGVGtf7swD5+YD7LUFxfrgYGolalOyiW9xT7dQYtboJJa8ySxZdExAdPZPrOdDcJkj/M0rHePsTcQcmQrOfgG0n+jEzFapSOXoNlpgBNmvUSBXz4eCzgvAJ8k9ZamoUixwONgBARx0m3D4g4xDemHQAUE8kd7BCPVTigXYpS1ud54ORyQCJR4+Fzv27LYUlZMpnOdsOokG2rbygCTwfYYrG0YNunbQUB8aB13tB1Kjc6aFxkOd6S/U1h/amZw6jUo5yBIX1oEpWXkP5talTw0MOYWAcwL+fJbXM6+QuVAZehRmp3RnAX2WNeomvvLMReRMfMPTbV9OIWcSewXIKNmt34M+KYNxADbF0HMFMmXoVfRYvtpolkWRsqubRfmqeUP2XMZttcjbCDosQjVo+hoGSesrL4qRQ8QksC6IVkbcvWbg6pzNvvG3F4dROlzAcdDEc24goP1Hpq2G59Ef2AKxkiYZwC/E5kL9vt19zR9/lJBVqE3uJLD1+KAdutlbg9KBV6VnvHIEaDtO64j4ZzInqZxZOoeM67cDJx4diNGJ5JQOCrs4EZf0QKuwi3WC1/IFoZrhABP7tYtVCMqaOjl0DI08pk
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB4791.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(346002)(39850400004)(376002)(396003)(366004)(136003)(83380400001)(6506007)(31686004)(478600001)(66946007)(5660300002)(2616005)(186003)(36756003)(15650500001)(4326008)(6512007)(8676002)(6486002)(107886003)(64756008)(110136005)(76116006)(66556008)(66446008)(38100700002)(122000001)(71200400001)(2906002)(316002)(86362001)(26005)(31696002)(8936002)(66476007)(45980500001)(43740500002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: =?utf-8?B?T3A3Q2NyVnB4VVJCTmVWeExRR044RENoVm1Lb2FJZGhXUTBpcVlQbEIwS3k0?=
 =?utf-8?B?azJzcm1yR0RkK0hlYmk1UlA0UHdwb3pYaEhrS2xERXdPTGhoK3ArMmpSdVI2?=
 =?utf-8?B?V0xwYXo3SFlMR0pkNWlLZFVHUTFua25COVl3QU1tdS91a0gralVlcS9pVm9k?=
 =?utf-8?B?VWFiK2JWckdXK01GYTNjb2FDbUhLRVQzcEJGVkZ6RDVVRzA5TVhNZDlxV0VF?=
 =?utf-8?B?dW5VQ1Z2cEx6dTZiNXFHUUdjYzFnOVRIbVJaRDBFTG8rZ1BwMWVWbFpTM3FY?=
 =?utf-8?B?eXkwTnh2UnZ0Q3FyQ1VTQ2x5VnlpZ2tHbG5wTStNV09Wb3Jpa3owWFNJZU92?=
 =?utf-8?B?cWJiTkZtR29yMUYrT2JUYVJHTFFtWEZuaUNWUHJJYXJFd1VveXlWMnc0aDF5?=
 =?utf-8?B?RkVyNCtzTmd0YUFlZkpEMnNkaWlaUnhaRmpHYUI2NGRZVExrd0tYY1liN0RE?=
 =?utf-8?B?MnBPRW1pSFN4ODFEWlFiM2NtcnFMMWFqUzVDay9tZGxFYUVYbUtLUEdVVHBU?=
 =?utf-8?B?OVU3MktLdVlaNEM4TTZ6dGovYVFhWUgwdXlzbDlVZEltMThNZEJEWWVwZEhC?=
 =?utf-8?B?M3pXS1VveGVWMFVFRjlzQmpXZG8wajBVVjlwRHo1U0NxZklFNGpaajlnU0J6?=
 =?utf-8?B?eFVDSnlYb25JVitJUkVUb0pmb3RLbGYvOWYvR0dRZldBQXIwLzRsbTM5UGNW?=
 =?utf-8?B?OERHSUNSeFdWVFhFQXRDeXo0TFpvK3RLZ1lsbkNsdDJpSEZVN1BWdHIwVktk?=
 =?utf-8?B?RW9UVElrZjNjczdpQmpCRnB0STY0TzRQR2YwWVdiREVtV3o0WUV3WVJGZG9s?=
 =?utf-8?B?bm55Yldoc1RuWU5EUW9hNzdMN25yNXlQS2tlMGNrck85U1N2RE1GM3YwOEJJ?=
 =?utf-8?B?b29LeXJNRmZPSHNidlJGYllKbmxLeHRxQWZSdENra1NtYnAwR2tXSko5UjBq?=
 =?utf-8?B?aHE0NGg4R3l2bTMxZlowa242Mlh2NEVVb3dLQjYzRGRNWXFGSmZwMmp6TlVu?=
 =?utf-8?B?S3k5UEI5N29BZnFqYThqRUdHZHpPbWVSc0QrbURiUDEvckM3NDF5Ly9QNmxh?=
 =?utf-8?B?SFErYUNld29PWnFKWjV6R0tuSmM2QldqdlI3SDJ5VVU1ZzdOY3ZaY0Zwcnda?=
 =?utf-8?B?Ry9TTzV5bWZsZk15N1VmSENwTElqUTQ5TFFDL0NHWlhab1Ewb3JFWGFweVJT?=
 =?utf-8?B?bEZtZ0RpTE9ld0JSUlozQmVnT3dKM00wOW5COXk1RkFsUERJLzdULzhTLzVL?=
 =?utf-8?B?a1NmWkRldkhQL2laTkUwQUN5ZVZ1clA3N3dpWW5jM3hEa0NzQ0lZcm45cXoz?=
 =?utf-8?B?a1VNWEpjVjdiNm5CUEpYaWFDazZQSmJ3TWFKSlFnRkcxdW14Smt2YmxtNm5i?=
 =?utf-8?B?R01UKzdPNFZ6Zzh0eEcrS2hBQjE5MVg4Z1pKZDRhcitlMWljRFhtWjdBVGNX?=
 =?utf-8?B?WjB3WTV4WFdKOGZiUEh2MlFNMHhSdUU5Slg2aUluQ0Y3MUUxZHVxVjRGTjhY?=
 =?utf-8?B?TmlaRjNBWnYrbkFlelR2WGRDU1lwcU56MGliTkZBVnNmY00xd3BIbVZ3ekpH?=
 =?utf-8?B?eVY2Nk9rYkNnOXJrV1ZwV0k1TjZEZlREV0NUbWtkeHFjYUpDYVQ1dVBzVzBa?=
 =?utf-8?B?cHk1RVY0dndTTm1YWWZvZ2lOMURyZUxSWk1iSFRUR3ZrUjd5SU16Uk9sS1JY?=
 =?utf-8?B?RHVxbyt2NmxtTU8zM0Rtamp1eU1vUndHN2NpUC9uUzRTenY0UHI1YVhYTGlD?=
 =?utf-8?Q?IKFpg/M3ie5Nf1r4VBcrnIPuX+45fukC/3ZKHLY?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <4B3B8DE31D54B741811D8FBCF1862BD3@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB4791.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 514ec1a2-09d0-4ec7-5346-08d909cc1830
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Apr 2021 22:30:43.1995
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kywsxROh5My0oXOz8u8Gvq0TES+laArPdGG2yJeVay1nhdgOkR9RugeMDxLbzyK+ADe5qil1Z2s/cuJzRAQV9g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4855
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

TWF0aGlhcyBOeW1hbiB3cm90ZToNCj4gSGkgVGhpbmgNCj4gDQo+IFNvcnJ5IGFib3V0IHRoZSBk
ZWxheS4gDQoNCk5wIDopDQoNCj4gDQo+IE9uIDEwLjQuMjAyMSAzLjQ3LCBUaGluaCBOZ3V5ZW4g
d3JvdGU6DQo+PiBJZiB0aGVyZSBpcyBhIGRldmljZSB3aXRoIGFjdGl2ZSBlbmhhbmNlZCBzdXBl
ci1zcGVlZCAoZVNTKSBpc29jIElODQo+PiBlbmRwb2ludChzKSBiZWhpbmQgb25lIG9yIG1vcmUg
ZVNTIGh1YnMsIERXQ191c2IzMSAodjEuOTBhIGFuZCBwcmlvcikNCj4+IGhvc3QgY29udHJvbGxl
ciB3aWxsIG5vdCBkZXRlY3QgdGhlIGRldmljZSBkaXNjb25uZWN0aW9uIHVudGlsIG5vIG1vcmUN
Cj4+IGlzb2MgVVJCIGlzIHN1Ym1pdHRlZC4gSWYgdGhlcmUncyBhIGRldmljZSBkaXNjb25uZWN0
aW9uLCBpbnRlcm5hbGx5DQo+PiB0aGUgd2FpdCBmb3IgdEhvc3RUcmFuc2FjdGlvblRpbWVvdXQg
KFVTQiAzLjIgc3BlYyA4LjEzKSBibG9ja3MgdGhlDQo+PiBvdGhlciBlbmRwb2ludHMgZnJvbSBi
ZWluZyBzY2hlZHVsZWQuIFNvLCBpdCBibG9ja3MgdGhlIGludGVycnVwdA0KPj4gZW5kcG9pbnQg
b2YgdGhlIGVTUyBodWIgaW5kaWNhdGluZyB0aGUgcG9ydCBjaGFuZ2Ugc3RhdHVzLg0KPj4NCj4+
IFRoaXMgY2FuIGJlIGFuIGlzc3VlIGZvciBhcHBsaWNhdGlvbnMgdGhhdCBjb250aW51b3VzbHkg
c3VibWl0dGluZyBpc29jDQo+PiBVUkJzIHRvIHRoZSB4SENJLiBUbyB3b3JrIGFyb3VuZCB0aGlz
LCBzdG9wIHByb2Nlc3NpbmcgbmV3IFVSQnMgYWZ0ZXIgMw0KPj4gY29uc2VjdXRpdmUgaXNvYyB0
cmFuc2FjdGlvbiBlcnJvcnMuIElmIG5ldyBpc29jIHRyYW5zZmVycyBhcmUgcXVldWVkDQo+PiBh
ZnRlciB0aGUgZGV2aWNlIGlzIGRpc2Nvbm5lY3RlZCwgdGhlIGhvc3Qgd2lsbCByZXNwb25kIHdp
dGggVVNCDQo+PiB0cmFuc2FjdGlvbiBlcnJvci4gQWZ0ZXIgMyBjb25zZWN1dGl2ZSBVU0IgdHJh
bnNhY3Rpb24gZXJyb3JzLCB0aGUNCj4+IGRyaXZlciBjYW4gd2FpdCBhIHBlcmlvZCBvZiB0aW1l
IChhdCBsZWFzdCAyICogbGFyZ2VzdCBwZXJpb2RpYyBpbnRlcnZhbA0KPj4gb2YgdGhlIHRvcG9s
b2d5KSB3aXRob3V0IHJpbmdpbmcgaXNvYyBlbmRwb2ludCBkb29yYmVsbCB0byBkZXRlY3QgdGhl
DQo+PiBwb3J0IGNoYW5nZSBzdGF0dXMuIElmIHRoZXJlIGlzIG5vIGRpc2Nvbm5lY3Rpb24gZGV0
ZWN0ZWQsIHJpbmcgdGhlDQo+PiBlbmRwb2ludCBkb29yYmVsbCB0byByZXN1bWUgaXNvYyB0cmFu
c2ZlcnMuDQo+IA0KPiBJcyB0aGF0IGVub3VnaD8gbWFueSBJc29jIFVSQnMgcXVldWUgMTYgLSAz
MiBJc29jIFRSQnMgcGVyIFVSQi4NCj4gQW5kIGRyaXZlcnMgbGlrZSBVVkMgcXVldWUgc2V2ZXJh
bCBVUkJzIGluIGFkdmFuY2UuDQoNClRoYXQncyBmaW5lIGFzIGxvbmcgYXMgdGhlIGRyaXZlciBz
dG9wcyByaW5naW5nIG1vcmUgZG9vcmJlbGwgZm9yIGENCmNlcnRhaW4gcGVyaW9kIG9mIHRpbWUg
Y3JlYXRpbmcgYSBnYXAgdGhhdCdzIGVub3VnaCB0byBnZXQgdGhlDQpub3RpZmljYXRpb24gZnJv
bSB0aGUgaW50ZXJydXB0IGVuZHBvaW50LiBXZSB0ZXN0ZWQgd2l0aCAxMjggaXNvYyBVUkJzDQph
bmQgd2FzIGFibGUgdG8gZGV0ZWN0IGEgZGlzY29ubmVjdCBhZnRlciB0aGlzIGRlbGF5Lg0KDQo+
IA0KPiBJZiBJIHJlbWVtYmVyIGNvcnJlY3RseSB0aGVuIGEgdHJhbnNhY3Rpb24gZXJyb3JzIHdv
bid0IHN0b3AgSXNvY2ggZW5kcG9pbnRzLA0KPiBzbyB3YWl0aW5nIGZvciAyICogSW50ZXJ2YWwg
YWZ0ZXIgMyBjb25zZWN1dGl2ZSB0cmFuc2FjdGlvbiBlcnJvcnMgbWlnaHQgbm90DQo+IGJlIGVu
b3VnaC4NCj4gDQo+IEhvdyBhYm91dCBzdG9wcGluZyB0aGUgZW5kcG9pbnQgYWZ0ZXIgMyBjb25z
ZWN1dGl2ZSB0cmFuc2FjdGlvbiBlcnJvcnMsDQo+IGFuZCByZXN0YXRpbmcgaXQgYSBiaXQgbGF0
ZXI/DQoNClRoZXJlJ3Mgbm8gbmVlZCB0byBzdG9wIGFuZCByZXN0YXJ0IHRoZSBlbmRwb2ludC4N
Cg0KPiANCj4+DQo+PiBUaGlzIHdvcmthcm91bmQgdHJhY2tzIHRoZSBtYXggZVNTIHBlcmlvZGlj
IGludGVydmFsIGV2ZXJ5IHRpbWUgdGhlcmUncw0KPj4gYW4gZW5kcG9pbnQgYWRkZWQgb3IgZHJv
cHBlZCwgd2hpY2ggaGFwcGVucyB3aGVuIHRoZXJlJ3MgYmFuZHdpZHRoDQo+PiBjaGVjay4gU28s
IHNjYW4gdGhlIHRvcG9sb2d5IGFuZCB1cGRhdGUgdGhlIHhoY2ktPm1heF9lc3NfaW50ZXJ2YWwN
Cj4+IHdoZW5ldmVyIHRoZXJlJ3MgYSBiYW5kd2lkdGggY2hlY2suIEludHJvZHVjZWQgYSBuZXcg
ZmxhZw0KPj4gVkRFVl9ESVNDT05OX0NIRUNLX1BFTkRJTkcgdG8gcHJldmVudCByaW5naW5nIHRo
ZSBkb29yYmVsbCB3aGlsZSB3YWl0aW5nDQo+PiBmb3IgYSBkaXNjb25uZWN0aW9uIHN0YXR1cy4g
QWZ0ZXIgMiAqIG1heF9lc3NfaW50ZXJ2YWwgdGltZSBhbmQgbm8NCj4+IGRpc2Nvbm5lY3Rpb24g
ZGV0ZWN0ZWQsIGEgZGVsYXllZCB3b3JrIHdpbGwgcmluZyB0aGUgZG9vcmJlbGwgdG8gcmVzdW1l
DQo+PiB0aGUgYWN0aXZlIGlzb2MgdHJhbnNmZXJzLg0KPiANCj4gU291bmRzIHZlcnkgZWxhYm9y
YXRlIGZvciBhIHZlbmRvciBzcGVjaWZpYyBkaXNjb25uZWN0IHdvcmthcm91bmQuDQo+IElzbid0
IHRoZXJlIGEgc2ltcGxlciB3YXk/DQo+IA0KPiBNYXliZSBzdG9wIGFsbCBpc29jIGluIGVuZHBv
aW50cyBpZiBvbmUgdGhlbSBoYXMgMyBjb25zZWN1dGl2ZSB0cmFuc2FjdGlvbiBlcnJvciwNCj4g
d2FpdCBmb3IgMnggaHViIGludGVycnVwdCBpbnRlcnZhbCB0aW1lLCBhbmQgdGhlbiByZXN0YXJ0
IHRoZSBlbmRwb2ludHMgaWYgdGhlcmUgaXMNCj4gbm8gZGlzY29ubmVjdD8NCg0KV2UgY2FuIGFs
c28gZG8gdGhpcyAoYnV0IHdpdGhvdXQgc3RvcCArIHJlc3RhcnQgdGhlIGVuZHBvaW50cykuIEl0
IGp1c3QNCmNyZWF0ZXMgYSBzbGlnaHRseSBsYXJnZXIgZ2FwIHRoYXQgbWF5IGJlIG1vcmUgbm90
aWNlYWJsZSB0byB0aGUgdXNlciBpZg0KdGhlcmUncyBubyBhY3R1YWwgZGlzY29ubmVjdGlvbi4N
Cg0KPiANCj4gVGhlcmUgaXMgYmlnZ2VyIGNvbmNlcm4gd2l0aCB0aGlzIHNlcmllcywgaXQgc2Nh
dHRlcnMgYSBsb3Qgb2YgdmVuZG9yIHNwZWNpZmljIGNvZGUgDQo+IGFyb3VuZCB0aGUgZ2VuZXJp
YyB4aGNpIGRyaXZlci4gSXQncyBub3QgdmVyeSBjbGVhciBhZnRlcndhcmRzIHdoYXQgY29kZSBp
cyBwYXJ0IG9mIHRoZQ0KPiB3b3JrYXJvdW5kIGFuZCB3aGF0IGlzIGdlbmVyaWMgY29kZS4NCj4g
DQo+IFdlIGp1c3QgZ290IGEgbG90IG9mIHRoZSBNZWRpYXRlayBjb2RlIG1vdmVkIHRvIHhoY2kt
bXRrKiwgbWF5YmUgaXRzIHRpbWUgdG8gYWRkIHhoY2ktc25wcy5jDQo+IGluc3RlYWQgb2YgdXNp
bmcgdGhlIGdlbmVyaWMgcGxhdGZvcm0gZHJpdmVyIHdpdGggdG9ucyBvZiB3b3JrYXJvdW5kcyBh
bmQgcXVpcmtzLg0KPiANCg0KVGhhbmtzIGZvciB0aGUgcmV2aWV3cy4gSSBuZWVkIHRvIGxvb2sg
aW50byBob3cgdGhpcyBjYW4gYmUgZG9uZS4gTWF5DQpuZWVkIHlvdXIgc3VnZ2VzdGlvbiBhcyBu
b3QgZXZlcnkgc2NlbmFyaW9zIGNhbiBiZSBvdmVycmlkZGVuDQplYXNpbHkvY2xlYW5seS4NCg0K
V2hhdCBhYm91dCB0aGUgb3RoZXIgcXVpcmtzLCBkbyB5b3UgaGF2ZSBhbnkgY29tbWVudHM/DQoN
ClRoYW5rcywNClRoaW5oDQo=
