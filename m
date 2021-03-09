Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2150F331FC1
	for <lists+linux-usb@lfdr.de>; Tue,  9 Mar 2021 08:28:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230086AbhCIH1s (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 9 Mar 2021 02:27:48 -0500
Received: from smtprelay-out1.synopsys.com ([149.117.73.133]:45078 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229620AbhCIH1i (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 9 Mar 2021 02:27:38 -0500
Received: from mailhost.synopsys.com (sv2-mailhost2.synopsys.com [10.205.2.134])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id C6A5140443;
        Tue,  9 Mar 2021 07:27:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1615274857; bh=dGHW6BOazIyoXx5cGbVJdquDfuxb/AzK647yl0dxMVI=;
        h=From:To:Subject:Date:References:In-Reply-To:From;
        b=V9AdXOOmAp7wKzVp7F5KGnRLmGucPlscPa9e7hPC7CCzHMVlNnlf0FXsAg7kDkGQ7
         UEQP+0hZRo2+Er6NgL08U0aYuDi6PLn0aanPt/RI8C3qttO15S2pexnzJS8PLzS8RV
         sGGJZVo0/dOE13HaYKMgIupQr7JmvZf1KGWRDVGy/gpoQXk1onDGgI6jpKVuJRfbT9
         QTJYDTsRbuPnrglXFBQekC0X8cveJHuSC118l9hIrBjxmqAQMZmikgU85uOL3A1aAM
         HolnjOC1aEXPj+4d+nLme61ZF6wZeRtixfrV7PrGJNnL9kTJnPC5Isfu4Pmoo1B7kL
         OfxyAVZTJdKZg==
Received: from o365relay-in.synopsys.com (sv2-o365relay1.synopsys.com [10.202.1.137])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPS id 39D01A0096;
        Tue,  9 Mar 2021 07:27:37 +0000 (UTC)
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11lp2171.outbound.protection.outlook.com [104.47.56.171])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
        by o365relay-in.synopsys.com (Postfix) with ESMTPS id 0426E400BA;
        Tue,  9 Mar 2021 07:27:37 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=thinhn@synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
        dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="NH5tl0DN";
        dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Djuk2Hl5qSvQriv0QJx7hT0Qa5B3TssQD8UzWuHND1l9aGaRiuZgwO9Iqyxo6tXuvTGimu8Y1hACSmfTT6uZXyxX5QT0770kQJ0D8FJAwDowDezw+KEPFayeRgEsm+RmjUxzaAyUJAF2MJATNlG3g3xFSMrAPEst9h2e/JxRiC7qG4+vJ05959kIEfNZR/4xrC/UDE2rSy3moVFgGL2U7GelWuYxaVemo7Byyb9rzoFkkvnNVSV3y7Ke11R+TK99ko6uvM89I7ILr8k6UW+iMp0oYO2ORTVaKFkuRZcCkkVfP+3ipq0HvS6ivCxcxGZPe32DaxpAj7UTso+hUwZr6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dGHW6BOazIyoXx5cGbVJdquDfuxb/AzK647yl0dxMVI=;
 b=Cx48rvTF6PUs3cDxN75x0bM9ltcSvsdzWTaDrWqwx1ZhLdVXbnCLA2rqizAl0vK6rf3U1ioDnBfAl7Phwa8QILlcWf8Z/IlAsHUsI4UpOqCotbtTkUmXYXJnRXXx59tzQCFQOoLurUGoPKaP0VHFDOoMI1uWYteGIFpt7+rWsiywBOxg4fGN4C5jcW1w9pKJ1bEM3r2QE3xvjx4IKlmsxfcIMPguW+3poiAr6oUFNWcdRdx6YB8tIet84aj4QVBeu8YDRB0L6c08RyogApCoWkEIOrRiwyZe3DpCSo+3XOUC3ElsBf9lWJFzcgpyqGmmjSpTxUAPNcBcauter3Nn1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dGHW6BOazIyoXx5cGbVJdquDfuxb/AzK647yl0dxMVI=;
 b=NH5tl0DNZYiCFbPPOnOK/b7jRkHJSW7H4pJ5A4UeZH6tqALMgODIBN1kiuNtOYF0kyerw8O+Dl79tCI9pzlgp2ZyANMDOQWSOrxXriYRiOyLyJiITpuFEkFyI78OmgXO2gGXg5rj+YZPMmEu4+Oap00/ZTFTRQ+dB3FBYm4sdf0=
Received: from BYAPR12MB4791.namprd12.prod.outlook.com (2603:10b6:a03:10a::12)
 by BY5PR12MB4050.namprd12.prod.outlook.com (2603:10b6:a03:207::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.17; Tue, 9 Mar
 2021 07:27:35 +0000
Received: from BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::895b:620d:8f20:c4d6]) by BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::895b:620d:8f20:c4d6%6]) with mapi id 15.20.3912.027; Tue, 9 Mar 2021
 07:27:35 +0000
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To:     William Allen <william.allentx@gmail.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Mathias Nyman <mathias.nyman@intel.com>
Subject: Re: USB 3.2 Gen 2x2 "Superspeed+20GBps" support for ASM3242
Thread-Topic: USB 3.2 Gen 2x2 "Superspeed+20GBps" support for ASM3242
Thread-Index: AQHXFK9aaZXyhujf3U2dpApLGjyr3Kp7QfkA
Date:   Tue, 9 Mar 2021 07:27:35 +0000
Message-ID: <221f3bec-e1cc-0b03-6860-c8660d72185a@synopsys.com>
References: <CAKRa1U6rukBBwWx0vN2wqiHMbUH9zWsc-y1wknOCvhueqWsT7w@mail.gmail.com>
In-Reply-To: <CAKRa1U6rukBBwWx0vN2wqiHMbUH9zWsc-y1wknOCvhueqWsT7w@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=synopsys.com;
x-originating-ip: [98.248.94.126]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8bf57f69-8328-4785-82cf-08d8e2cccfb6
x-ms-traffictypediagnostic: BY5PR12MB4050:
x-microsoft-antispam-prvs: <BY5PR12MB405036678C98312AC23228F3AA929@BY5PR12MB4050.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: PnilE78pwauMVPX/pbspFv9jxjlWeFDLgf2TA86J/Zfcy54FLRmTXv+WM64lm/b+QOkA14dApSF6EI5wM4o8HSD95ICFHJU834EsAVecvEOxmptDqdr7QSIV8Y4SmaJvjEnfkVJTzYAp+PTjmPbW4NO08HA7I/0CT402YA9J/EMMNkzxQIGatr6ENNtd3fvetQWiV7v78Z4O+HdR5zTPTgzjVbJUtME8q+sf7YBS0yw8q1Ge5Ose0zpNHm4tTIrqDI/rpb3iogGVWMdsuWvZioqfpKPXPay5m9ogm62B8zF68PQh9VP+ro60IWvFNy5gv2+2MH9hMFQJbNeCvtKpswEq8U/oVUvuPPFMw5Mt7xrqPMHqeZZSWB1qNc8gKGU6aoZpT/xNUIUkqcNWzi4j0LZBq/1eiWPqxVBvSc3J5exWtD7qugH7q+j57pyUt/kLOAuF33wPIo81MK2Kqj8yslc79riCCxJ2cG/91Ymgpu1/nqO4Y+RElwRgSk8ugYEjNdRbKumli+MNBZF+jAvT2HKcc94AbfsN4zsl2TSBIQ6Nsw/EGIlc3zlm0faoInJ44RPVvGAely98JRkLpvMqgfzblCJmFfowfAEGn+hvp7NemeawXUudEuJ7bMlMUD7hxU8zhVkO5P9luQyoW+gauProx417vDW5s8xOeFTT5kt2zAuMw81SsQQ7e9NpHEBT
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB4791.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(376002)(396003)(136003)(39860400002)(346002)(366004)(478600001)(2616005)(86362001)(5660300002)(8676002)(6486002)(83380400001)(316002)(6512007)(966005)(110136005)(2906002)(31696002)(31686004)(66946007)(6506007)(76116006)(66476007)(64756008)(186003)(66446008)(66556008)(71200400001)(8936002)(36756003)(26005)(45980500001)(43740500002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: =?utf-8?B?ZXV3cWlacGtaR2hoOFlERm1KbXJqQloyYlBkeUV3WjNnUFFPYjdPRHBUS0J5?=
 =?utf-8?B?NzhZNFEyY1FKbUt0OW1CQ0lzQzNkMjdMS0pnR1BoWnAxTXU1VGhVb1JyNGdK?=
 =?utf-8?B?OFhUeU9qTVlibHdJVURBQU1PZDY1STFmb0FXT3ZoVGoxZDdEWFlkWi9WZ0Rj?=
 =?utf-8?B?cjRhdEk2NE9aWCtkUmFybWhaV2Zab3ByVTdLdThuOWdibkorYUlUUnpNTUc2?=
 =?utf-8?B?Y1BHVmY4ZlNNcmkyM3NseTcra2FSNFlqN3VhV0hLKzhYSEE5aTI1aTdGQ3RP?=
 =?utf-8?B?Sk0wa3lDNHU1WmRwU3NtcGdaTmpBSG5zL3lDa3R1UEVlOFlWd0xHOERvNVgv?=
 =?utf-8?B?M2w0UzFldkEwTVJKdUJWOGpSc25BWE1PNUw2aTJDK1pNMXB4Yi9EdHM0eXht?=
 =?utf-8?B?RmFrcEdveStqQXpNYnV1OWk2Ujk4YU4zdFFhL0NmSzJnclZKV2tJNUlRS3JO?=
 =?utf-8?B?aE9lUGQ3MjFmVzU0QUcwSk9SdzA5cDV3M1dFSWNIOWQ4RHN0Qi84a3RQeDJG?=
 =?utf-8?B?Ym5TRUJYcTFJOFFyYVRpMStFeDhubFNGS0gzUE8rekVHbjhHbW5FckIxSjZn?=
 =?utf-8?B?ZzlGNjEzeUxLQUt0WER2eGZWWlBwK2VxSFEydVJYWW5EQXZzYU42S3VPSk84?=
 =?utf-8?B?MGlJRFZueGc0cGp2cVBCTXdWakp4M0kwTFlFMk5WK0lsZTFTbnlCb2JJMHBP?=
 =?utf-8?B?RXRxUlpGcGN1d0NVQ2JWb0dvSnJ3dWlUeTZndGpOaTlnUUsrQXJudHJUQWxB?=
 =?utf-8?B?dk00Y0pKOTMvZ3dGazZIQXhDZmExbm1oVEFuZkFMUTR5eTAyQmRHak81Y3Jv?=
 =?utf-8?B?dDdYeStyc1RuczhGYi94MDVuenpPZFVhYzZyOVZMR21sdzVONTZEcXhscVZm?=
 =?utf-8?B?OUdndkpjbnRCZmNZajdtYzgxdE54cmozTHd2V0JNd1o1OGhGQ1dSaG56Vk1F?=
 =?utf-8?B?eEsvQVhWdk1mK21YUFZ6YUFuOW9RYUNSejFGZEdWdjYwT2p1cmR4dnNPTUoy?=
 =?utf-8?B?OG9kNEhwUC9vem5MeFh1QmFsL0Z0dlFiemhWdlZZVEFKV3NpQU10UVppaEo0?=
 =?utf-8?B?OEFkZlFGSWZGbCt3c3A0L3NOdDJQKzJEbk5hdmlienliVUJnZHF4enRCcHM2?=
 =?utf-8?B?U0tiaURBRW1PUUMzSDFoU2d0TDVXMkVseURkdmJUbm9TNEdKbVdIaWtGSW1j?=
 =?utf-8?B?d2pVT05BUzR1blNMd0xuNUwwSmpKdHpxSUYvMGlZRCthRWpRZkU3dUNVODBl?=
 =?utf-8?B?SlE5dTVCTER4Z1JPc3ZETjgyUHhyb2RkOE90RFdoM1p6NUNJOEdheHlFbWZV?=
 =?utf-8?B?cXJvYTh6elFGUjVlREs5R0V0TE95QUdzMUhSUGpSVEh1YmFPZy82b1RxVmZI?=
 =?utf-8?B?WnVQSDRyK2ppZ3JQNlh5bFAwbi91TEhYUlk2T0orN01WdFU3eVg4SGxFenhQ?=
 =?utf-8?B?R2Z2Q1p3UGRLMi9KRTRxcW1iTkc4RkdKcUJ0Sy90Y1NVTm1RV1FCZDVYZzZR?=
 =?utf-8?B?T2E4ZEhvSEM5U0JJYnhwK2dTZVhZQmc1OFNpc1kxUHB4dlhrQlFIOGJjVXo0?=
 =?utf-8?B?YnFOMHRXSTZKTW40a1dtUG9rYS8wMTJSZWRGMU9ZcWt3QW9tRlI0Mm84bWFh?=
 =?utf-8?B?Q2F0ZjBkRkxGTTdqb0k5d2IzTTlMUFZodDgwUTBEQ29MRVVDM0NyaU5hbWVC?=
 =?utf-8?B?dzhkbnRjbTRQWUljZ000eVJXZm91Tnc4UlJzaHBmcExBRHVWSWlGTU41ZnF1?=
 =?utf-8?Q?a+D2xdR5z+2DX34GglhP7ZsRnZHzbwiDtsdVT6N?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <FC20E1D0C1554349ABEB6A022613CEBF@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB4791.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8bf57f69-8328-4785-82cf-08d8e2cccfb6
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Mar 2021 07:27:35.7986
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fUyrXsPbARUW8NosuXt2Apg0MF1v2+8uqXwHjNV+Cn0JsqRCBLwDkSYqmYtsQinyj9HBRVikvS/YGlcmongqEw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4050
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

KyBNYXRoaWFzDQoNCkhpLA0KDQpXaWxsaWFtIEFsbGVuIHdyb3RlOg0KPiBJJ3ZlIG5ldmVyIHN1
Ym1pdHRlZCB0byB0aGUgbWFpbGluZyBsaXN0IGJlZm9yZSwgc28gcGxlYXNlIGV4Y3VzZSBhbnkN
Cj4gZm9ybWFsaXRpZXMgdGhhdCBJIG1heSBub3QgYmUgb2JzZXJ2aW5nLg0KPiBJIHdvdWxkIGxp
a2UgdG8gYmUgYWJsZSB0byB1c2UgVVNCIDMuMiBHZW4yeDIgIlN1cGVyU3BlZWQrwrLigbBHYnBz
Ig0KPiB1bmRlciBMaW51eC4gSSd2ZSB0cmllZCBzZXZlcmFsIGRpZmZlcmVudCBrZXJuZWwgdmVy
c2lvbnMsIGFuZCBoYXZlDQo+IGJ1aWx0IHRoZSBrZXJuZWwgZnJvbSB0aGUgdXNiLW5leHQgdHJl
ZS4gQWxsIHdpdGhvdXQgZmluZGluZyBwcm9wZXINCj4gZnVuY3Rpb25hbGl0eS4NCj4NCj4gSSBo
YXZlIGFuIEFibGVjb25uIFBFWC1VQjE1OSBVU0IgMy4yIEdlbiAyeDIgUENJZSBleHBhbnNpb24g
Y2FyZCwgd2l0aA0KPiB0aGUgQVNNMzI0MiBjb250cm9sbGVyLiBUaGlzIGNvbnRyb2xsZXIgYXBw
ZWFycyB0byBiZSB0aGUgb25seSBHZW4yeDINCj4gY2FwYWJsZSBjb250cm9sbGVyIHRoYXQgZXhp
c3RzIGluIGNvbW1lcmNpYWwgcHJvZHVjdHMtIHNvIGZhciBhcyBJJ3ZlDQo+IGZvdW5kLiBFdmVy
eXRoaW5nIGFwcGVhcnMgdG8gd29yaywgZXhjZXB0IGZvciAiU3VwZXJTcGVlZCvCsuKBsEdicHMi
IHdoZW4NCj4gSSBwbHVnIGluIGEgY2FwYWJsZSBkZXZpY2UuDQo+IEhlcmUgaXMgdGhlIGRtZXNn
IG91dHB1dCBhcyBzb29uIGFzIEkgcGx1ZyBpbiBhIEdlbjJ4MiBXRCBQNTAgQmxhY2sNCj4gRXh0
ZXJuYWwgTlZNZSBTU0QsIHVzaW5nIGFuIGFwcHJvcHJpYXRlIFN1cGVyU3BlZWQrwrLigbBHYnBz
IGNlcnRpZmllZA0KPiBjYWJsZToNCj4gNS4xMS4yLWFyY2gxLTENCj4gLS0tLS0tLS0tLS0tLS0t
LS0tLS0NCj4gdXNiIDctMjogbmV3IFN1cGVyU3BlZWRQbHVzIEdlbiAyIFVTQiBkZXZpY2UgbnVt
YmVyIDMgdXNpbmcgeGhjaV9oY2QNCj4gdXNiIDctMjogTmV3IFVTQiBkZXZpY2UgZm91bmQsIGlk
VmVuZG9yPTEwNTgsIGlkUHJvZHVjdD0yNjQyLCBiY2REZXZpY2U9MTAuMDMNCj4gdXNiIDctMjog
TmV3IFVTQiBkZXZpY2Ugc3RyaW5nczogTWZyPTIsIFByb2R1Y3Q9MywgU2VyaWFsTnVtYmVyPTEN
Cj4gdXNiIDctMjogUHJvZHVjdDogR2FtZSBEcml2ZQ0KPiB1c2IgNy0yOiBNYW51ZmFjdHVyZXI6
IFdlc3Rlcm4gRGlnaXRhbA0KPiB1c2IgNy0yOiBTZXJpYWxOdW1iZXI6IDMyMzEzMDMzNDQzMTM0
MzAzMDMwMzczNg0KPiBzY3NpIGhvc3QxMTogdWFzDQo+IHNjc2kgMTE6MDowOjA6IERpcmVjdC1B
Y2Nlc3MgICAgIFdEICAgICAgIEdhbWUgRHJpdmUgICAgICAgMTAwMyBQUTogMCBBTlNJOiA2DQo+
IHNjc2kgMTE6MDowOjE6IEVuY2xvc3VyZSAgICAgICAgIFdEICAgICAgIFNFUyBEZXZpY2UgICAg
ICAgMTAwMyBQUTogMCBBTlNJOiA2DQo+IHNkIDExOjA6MDowOiBbc2RmXSAzOTA3MDI5MTY4IDUx
Mi1ieXRlIGxvZ2ljYWwgYmxvY2tzOiAoMi4wMCBUQi8xLjgyIFRpQikNCj4gc2QgMTE6MDowOjA6
IFtzZGZdIFdyaXRlIFByb3RlY3QgaXMgb2ZmDQo+IHNkIDExOjA6MDowOiBbc2RmXSBNb2RlIFNl
bnNlOiA1NyAwMCAxMCAwMA0KPiBzZCAxMTowOjA6MDogW3NkZl0gV3JpdGUgY2FjaGU6IGVuYWJs
ZWQsIHJlYWQgY2FjaGU6IGVuYWJsZWQsIHN1cHBvcnRzDQo+IERQTyBhbmQgRlVBDQo+IHNkIDEx
OjA6MDowOiBbc2RmXSBPcHRpbWFsIHRyYW5zZmVyIHNpemUgMzM1NTM5MjAgYnl0ZXMNCj4gc2Qg
MTE6MDowOjA6IFtzZGZdIEF0dGFjaGVkIFNDU0kgZGlzaw0KPg0KPiAgV2hlbiBJIHNhdyBjb21t
aXRzIHJlZmVycmluZyB0byBHZW4yeDIgaW4gdGhlIHVzYi1uZXh0IHJlcG8sIEkgYnVpbHQNCj4g
b2ZmIHRoYXQsIGFuZCBhbHNvIHJhbiBsaW51eC1uZXh0LWdpdC5yMC5nYWJhZjZmNjAxNzZmLTEg
ZnJvbSBBVVIsDQo+IGJvdGggZ2l2aW5nIG1lIHRoZSBzYW1lIHJlc3VsdHMvb3V0cHV0Og0KPiBs
aW51eC1uZXh0LWdpdC5yMC5nYWJhZjZmNjAxNzZmLTENCj4gLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQ0KPiB1c2IgNS0xOiBuZXcgU3VwZXJTcGVlZCBHZW4g
MXgyIFVTQiBkZXZpY2UgbnVtYmVyIDMgdXNpbmcgeGhjaV9oY2QNCj4gdXNiIDUtMTogTmV3IFVT
QiBkZXZpY2UgZm91bmQsIGlkVmVuZG9yPTEwNTgsIGlkUHJvZHVjdD0yNjQyLCBiY2REZXZpY2U9
MTAuMDMNCj4gdXNiIDUtMTogTmV3IFVTQiBkZXZpY2Ugc3RyaW5nczogTWZyPTIsIFByb2R1Y3Q9
MywgU2VyaWFsTnVtYmVyPTENCj4gdXNiIDUtMTogUHJvZHVjdDogR2FtZSBEcml2ZQ0KPiB1c2Ig
NS0xOiBNYW51ZmFjdHVyZXI6IFdlc3Rlcm4gRGlnaXRhbA0KPiB1c2IgNS0xOiBTZXJpYWxOdW1i
ZXI6IDMyMzEzMDMzNDQzMTM0MzAzMDMwMzczNg0KPiBzY3NpIGhvc3Q3OiB1YXMNCj4gc2NzaSA3
OjA6MDowOiBEaXJlY3QtQWNjZXNzICAgICBXRCAgICAgICBHYW1lIERyaXZlICAgICAgIDEwMDMg
UFE6IDAgQU5TSTogNg0KPiBzY3NpIDc6MDowOjE6IEVuY2xvc3VyZSAgICAgICAgIFdEICAgICAg
IFNFUyBEZXZpY2UgICAgICAgMTAwMyBQUTogMCBBTlNJOiA2DQo+IHNlcyA3OjA6MDoxOiBBdHRh
Y2hlZCBFbmNsb3N1cmUgZGV2aWNlDQo+IHNlcyA3OjA6MDoxOiBGYWlsZWQgdG8gZ2V0IGRpYWdu
b3N0aWMgcGFnZSAweDENCj4gc2VzIDc6MDowOjE6IEZhaWxlZCB0byBiaW5kIGVuY2xvc3VyZSAt
MTkNCj4gc2QgNzowOjA6MDogW3NkZl0gMzkwNzAyOTE2OCA1MTItYnl0ZSBsb2dpY2FsIGJsb2Nr
czogKDIuMDAgVEIvMS44MiBUaUIpDQo+IHNkIDc6MDowOjA6IFtzZGZdIFdyaXRlIFByb3RlY3Qg
aXMgb2ZmDQo+IHNkIDc6MDowOjA6IFtzZGZdIE1vZGUgU2Vuc2U6IDU3IDAwIDEwIDAwDQo+IHNk
IDc6MDowOjA6IFtzZGZdIFdyaXRlIGNhY2hlOiBlbmFibGVkLCByZWFkIGNhY2hlOiBlbmFibGVk
LCBzdXBwb3J0cw0KPiBEUE8gYW5kIEZVQQ0KPiBzZCA3OjA6MDowOiBbc2RmXSBPcHRpbWFsIHRy
YW5zZmVyIHNpemUgMzM1NTM5MjAgYnl0ZXMNCj4gc2QgNzowOjA6MDogW3NkZl0gQXR0YWNoZWQg
U0NTSSBkaXNrDQo+DQo+IFNlZSB0aGF0IGl0J3MgZGV0ZWN0aW5nIGl0IGFzIEdlbiAxeDIuDQo+
IFRoZSBvdXRwdXQgb2YgbHN1c2IgLXQgc2hvd3MgdGhhdCBpdCBpcyBjb25uZWN0ZWQgYXQgNTAw
ME0gdXNpbmcgdGhlDQo+IHVhcyBkcml2ZXIuIEV2ZW4gbXkgbXVjaCBzbG93ZXIgVVNCIDMuMSBT
U0RzIGNvbm5lY3QgYXQgMTAwMDBNIG9uIHRoZQ0KPiBleGFjdCBzYW1lIHBvcnQuDQo+IFdoZW4g
SSBhdHRhY2ggdGhlIEdlbjJ4MiBOVk1lIFNTRCB0byBteSBvdGhlciAzLjIgR2VuMiBjYXJkLCBp
dA0KPiBjb25uZWN0cyBhdCAxMDAwME0sIHNvIEl0IHNlZW1zIHRvIGJlIGRpcmVjdGx5IHJlbGF0
ZWQgdG8gYQ0KPiBtaXNoYW5kbGluZyB3aGVuIHRoZSBHZW4yeDIgZGV2aWNlIGdldHMgcmVjb2du
aXplZCBieSB0aGUgR2VuMngyIGNhcmQuDQo+DQo+IGxzcGNpIG91dHB1dCBmcm9tIDUuMTEuMi1h
cmNoMS0xOg0KPiAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tDQo+
IFVTQiBjb250cm9sbGVyOiBBU01lZGlhIFRlY2hub2xvZ3kgSW5jLiBBU00zMjQyIFVTQiAzLjIg
SG9zdA0KPiBDb250cm9sbGVyIChwcm9nLWlmIDMwIFtYSENJXSkNCj4gU3Vic3lzdGVtOiBBU01l
ZGlhIFRlY2hub2xvZ3kgSW5jLiBBU00zMjQyIFVTQiAzLjIgSG9zdCBDb250cm9sbGVyDQo+IFBo
eXNpY2FsIFNsb3Q6IDENCj4gRmxhZ3M6IGJ1cyBtYXN0ZXIsIGZhc3QgZGV2c2VsLCBsYXRlbmN5
IDAsIElSUSA2MiwgTlVNQSBub2RlIDANCj4gTWVtb3J5IGF0IGY3ZGYwMDAwICg2NC1iaXQsIG5v
bi1wcmVmZXRjaGFibGUpIFtzaXplPTMyS10NCj4gQ2FwYWJpbGl0aWVzOiBbNTBdIE1TSTogRW5h
YmxlLSBDb3VudD0xLzggTWFza2FibGUtIDY0Yml0Kw0KPiBDYXBhYmlsaXRpZXM6IFs2OF0gTVNJ
LVg6IEVuYWJsZSsgQ291bnQ9OCBNYXNrZWQtDQo+IENhcGFiaWxpdGllczogWzc4XSBQb3dlciBN
YW5hZ2VtZW50IHZlcnNpb24gMw0KPiBDYXBhYmlsaXRpZXM6IFs4MF0gRXhwcmVzcyBMZWdhY3kg
RW5kcG9pbnQsIE1TSSAwMA0KPiBDYXBhYmlsaXRpZXM6IFtjMF0gU3Vic3lzdGVtOiBBU01lZGlh
IFRlY2hub2xvZ3kgSW5jLiBEZXZpY2UgMDIwMQ0KPiBDYXBhYmlsaXRpZXM6IFsxMDBdIEFkdmFu
Y2VkIEVycm9yIFJlcG9ydGluZw0KPiBDYXBhYmlsaXRpZXM6IFsyMDBdIFNlY29uZGFyeSBQQ0kg
RXhwcmVzcw0KPiBDYXBhYmlsaXRpZXM6IFszMDBdIExhdGVuY3kgVG9sZXJhbmNlIFJlcG9ydGlu
Zw0KPiBDYXBhYmlsaXRpZXM6IFs0MDBdIEwxIFBNIFN1YnN0YXRlcw0KPiBLZXJuZWwgZHJpdmVy
IGluIHVzZTogeGhjaV9oY2QNCj4gS2VybmVsIG1vZHVsZXM6IHhoY2lfcGNpDQo+DQo+IEknbSBo
YXBweSB0byB0ZXN0IGFueXRoaW5nLCBvciBmaWxlIHRoaXMgc29tZXdoZXJlIG1vcmUgYXBwcm9w
cmlhdGUgaWYNCj4geW91IGNvdWxkIHBvaW50IG1lIGluIHRoZSByaWdodCBkaXJlY3Rpb24uDQoN
CkN1cnJlbnRseSB0aGUgdXNiIGhvc3Qgc3RhY2sgZG9lc24ndCByZWFsbHkgc3VwcG9ydCBVU0Ig
My4yIHlldCwgYXQNCmxlYXN0IHRoZSBzcGVlZCBjaGVjayBwYXJ0LiBJIG1hZGUgc29tZSB1cGRh
dGVzIHRvIGhhbmRsZSB0aGF0Lg0KDQpZb3UgYXBwbHkgdGhlc2UgcGF0Y2hlcyBhbmQgdGVzdCBv
biB5b3VyIHNldHVwDQpodHRwczovL3BhdGNod29yay5rZXJuZWwub3JnL3Byb2plY3QvbGludXgt
dXNiL2xpc3QvP3Nlcmllcz00Mjc1NjENCg0KSG9wZWZ1bGx5IE1hdGhpYXMgd2lsbCBoYXZlIHRp
bWUgdG8gcmV2aWV3IGFuZCBBY2sgdGhlbSBmb3IgdGhlIG5leHQNCnJlbGVhc2UgY3ljbGUuDQoN
CkJSLA0KVGhpbmgNCg==
