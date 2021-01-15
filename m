Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C37B02F70AE
	for <lists+linux-usb@lfdr.de>; Fri, 15 Jan 2021 03:42:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732280AbhAOCmB (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 14 Jan 2021 21:42:01 -0500
Received: from smtprelay-out1.synopsys.com ([149.117.87.133]:59194 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1732281AbhAOCmA (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 14 Jan 2021 21:42:00 -0500
Received: from mailhost.synopsys.com (us03-mailhost2.synopsys.com [10.4.17.18])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id C9FDEC041F;
        Fri, 15 Jan 2021 02:40:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1610678459; bh=jT2AhQILoDZ4ICoebXgQCJvTbNIcswgm6GOWb5JwOxs=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=SY3fw1hMiI2yMLHkDgYiZ3K6Ow+f2hWfLGV7XrnxZdvVvP1vAEkolvAqmI6USwtJk
         mX7P3Iy0OqvSphS5HK1sJvfPxLmRVT2YzjagowWKMVL0/5AWOHS99q6zfyxz3PvjmU
         zqVUTJ7GaYpHbKoqlmsLnAw0FYvAN5pwDY/EEfvmdQVkIWOYqOyPL1PskqQJpKgGRG
         9cqXDmzdLOak0CceQHYNUTD1TCgq5EPSF1w28C8KH9CaqHmTHdAidUtcVd30SG5KMO
         /iv3Ufcbfnmf5SVCHwWgDaWR5Er6IryE3HPVju9wWzZxny1URJBqSmCIaxMGNb4CmY
         dLJOAvjymMc3Q==
Received: from o365relay-in.synopsys.com (us03-o365relay3.synopsys.com [10.4.161.139])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPS id 378ACA0084;
        Fri, 15 Jan 2021 02:40:58 +0000 (UTC)
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2103.outbound.protection.outlook.com [104.47.55.103])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client CN "mail.protection.outlook.com", Issuer "GlobalSign Organization Validation CA - SHA256 - G3" (verified OK))
        by o365relay-in.synopsys.com (Postfix) with ESMTPS id 0A8D3802BC;
        Fri, 15 Jan 2021 02:40:57 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=thinhn@synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
        dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="a4cHhiZY";
        dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LYRTd8SDa7ozNJZ55HdduVAjnWbLtWtJS75J99aoUFwnto1ffnSWAVmI9MMLPsi1B3Khu4ocuyw08XiB0lCDlsI0Ihi8aiafUZwKUNg1JbT/oEWDv0m213G5yYWaEwYBXTj7NmpGdaJ4e3i8bnmxnjoC63n5WzNx3qijfuIO4KlSQU9LMTt8K9B9wfZhSKMwdhnQNTpXFbwBOmj11tJaRRhJOQL9+UdazTTpnrRkL4J7N/7zKNq3T+sKgNrQNPIijzXADhOGQm92I02ktMQqRFovmHBLmOKYLXYbKS5qHWWtGKNCKwXETsKcxPmUGInaagEqEya8FZMv2hRADw/kqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jT2AhQILoDZ4ICoebXgQCJvTbNIcswgm6GOWb5JwOxs=;
 b=SVsGU6DWndA3TxHFrC5CUhM7MmYwDOfoz1Gc76na4PCFJV0jAI4oxSx2hKXn0DmmImQlbQArbDSyl8NMbcDaxgQePUK9puVXtOgZtS6+Gv5kUvQoxhlg6UEHEzq1/aShe2EFvJ4K0lBjTtAoidzxehxoWRSwT0VO1BAn22AZO37K75vVxL21zgsWPlx0VclgAaYLOeyu8z4tnsD+4QRp4W88KLlccV6whBYkeRHPsPXlCr0S96SZhb52YnM+R1uBBUNVKIOC5URo8Ycql/5BhIPyTcBwYJ0e7MYE31xRBudlNHnzLTL0Cidus63qw9a6WJFbaoTP1HM8ricFgFq8TA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jT2AhQILoDZ4ICoebXgQCJvTbNIcswgm6GOWb5JwOxs=;
 b=a4cHhiZYPwQ81MpkPfFgrZ41lpsVe7QtcmAPEONIP3DgJzYflZJsYV/cQUm3NYnJDPkZq3WPRJ5qZASNJAQ4Mmviy+X7CnATV/kt8u7MtfGBhRBn2IDFhNXPqcWJ0NF/6T5pDTn4ydTRR3Gnwte6t1E0q6d2K9eYVIZ1v7oOnJ8=
Received: from BYAPR12MB4791.namprd12.prod.outlook.com (2603:10b6:a03:10a::12)
 by BYAPR12MB2902.namprd12.prod.outlook.com (2603:10b6:a03:12f::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.9; Fri, 15 Jan
 2021 02:40:55 +0000
Received: from BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::895b:620d:8f20:c4d6]) by BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::895b:620d:8f20:c4d6%6]) with mapi id 15.20.3742.012; Fri, 15 Jan 2021
 02:40:55 +0000
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To:     Peter Chen <hzpeterchen@gmail.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>
CC:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        John Youn <John.Youn@synopsys.com>
Subject: Re: [PATCH v6 05/11] usb: gadget: composite: Report various SSP
 sublink speeds
Thread-Topic: [PATCH v6 05/11] usb: gadget: composite: Report various SSP
 sublink speeds
Thread-Index: AQHW6iBokEo/rqeRGkeerJ/I0Ocn+6omnSMAgAAIJYCAATedAIAAHooA
Date:   Fri, 15 Jan 2021 02:40:55 +0000
Message-ID: <3803df98-0321-ad69-babe-ceb41f95229d@synopsys.com>
References: <cover.1610592135.git.Thinh.Nguyen@synopsys.com>
 <eb0386fdd5d87a858281e8006a72723d3732240f.1610592135.git.Thinh.Nguyen@synopsys.com>
 <20210114054708.GB18650@b29397-desktop>
 <227f3064-8016-33db-6575-fc1a642ef485@synopsys.com>
 <20210115005135.GB3443@b29397-desktop>
In-Reply-To: <20210115005135.GB3443@b29397-desktop>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=synopsys.com;
x-originating-ip: [98.248.94.126]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 31be4433-df70-4420-3ccc-08d8b8fefb94
x-ms-traffictypediagnostic: BYAPR12MB2902:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR12MB2902EC069FAB5BF8D8739EEDAAA70@BYAPR12MB2902.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Og3Tr66eBksYveRznrX8Zkfh6muc4H9pb4DHNg+2X4KsGprDP0xA7fphqGpAf0twrB30f+C3+Yql+ibxzazPdy+DH3PDJxMjle19dqdh7crc1YjW6jQNVcZkttOWk4ld+iLimeq/U9/9giP1kztMHQJbnmUScojNv8JSA4CE9NSVA6AejF7JRkW2xB7yY8WYmyMW6xhnB4Ew84v+eHcRnF9G1yePg65SUrJ+rndaWm1Nl2zuEU6xuDYlBNUa6e15kJ8nYWpkfhjDka7FL+MRG5UK0E/RA5QSt6yR7HadlDP3oZ48IECxNTM+rr/y1W6K6LHP2vkcSN+VNACjgZSKJkQaurlSv6+o9yS7f60xb0FE1ijS2FLzBs7+UMuh1JiwMuBohPFaUjMXalscv4dCmEB6Qm2AT4qXZRZcQtxtiqkVTH8hzoQZyWF7dFXx25+Q6ZSXazutoPCbGZ5iDcV7H7BCugtCk/gf1NVZzteUrcc=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB4791.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(346002)(39860400002)(376002)(396003)(136003)(5660300002)(2906002)(53546011)(6486002)(8936002)(4326008)(6506007)(31696002)(76116006)(316002)(66556008)(54906003)(64756008)(86362001)(66446008)(66476007)(66946007)(110136005)(8676002)(31686004)(6512007)(71200400001)(186003)(107886003)(83380400001)(478600001)(2616005)(36756003)(26005)(45980500001)(43740500002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: =?utf-8?B?ZHBmWEl3Y2RHUmc4czMwbzJ4a3FxUjNmVGI4cGZNTGIySjExL0Z1blVnNzRx?=
 =?utf-8?B?VG5VSHYvcUdCcVZLeU9SdmN6Y3ROYlpNY3dQS01KQWFxejdyYmJFMlEyZVV1?=
 =?utf-8?B?TnlYK0wrREN5YXVmaVhJOHliRnJWRG5pQXFYZTRiWStyRW1KbkdDMXQvSHM3?=
 =?utf-8?B?UThZZ215Vm1mSU44T2JKOSt2am1CWTR6ZVR0RlZSL2d4V0g3THZZUzVrbC9i?=
 =?utf-8?B?NG1xNGdKL2lJYVcyNE1kQy9zb1N3SERTZ1lDUW1oZnc0YWpxa09UT2pTNHVS?=
 =?utf-8?B?TnVYUVhqdFNOWnRsSCtRM2lOMlk5dkE5SjVLV3kzS3F1ZXpaYngzYkVOeVNG?=
 =?utf-8?B?UzY2bDlUQlI2cTFLdlNKRFp3L1Q3TlcvcWZHRGVCSWhGbTB1VlBzbXFKUmhm?=
 =?utf-8?B?K2hhMkduc0tBajF1Q0xWM2QwNkp6VDNBdGZnNG5SU1ZOTmNHZFZHVUwyK0NZ?=
 =?utf-8?B?SXFMVi96UEZiYzkzNi9vY2R5bmt0eHlPNkpONFZHdEV1VFhXa2trK3YxcGV2?=
 =?utf-8?B?RlNWRStGSmFEdkFPZG1BTk5KQUVwWHozeXI2QTBrcDRjZDZsRFBNdFBKbFFw?=
 =?utf-8?B?VXhnb1dvdU5INkNnNFVGTng1c3plUENEUGJ0QlR2RS9vZXJFeVExRUJqcWli?=
 =?utf-8?B?d3VMa08rOEVSZEVqRkdVNmN0dEhJU0pIZ1lCTGRwYzBXMEpoamYzRlJtd0c0?=
 =?utf-8?B?bk1sbzV2WmRRWllHYUU4cmI4UG9BNWhCNy84QTJhWVlQMkVOR1FCajhncUVJ?=
 =?utf-8?B?WFUyb29SemxXV2c2THBRWWxRRkM2cnJseFBkbzdrd3c0VnliRmRoRDhWd1F4?=
 =?utf-8?B?aTFQU3lKRDlCNllDVUdXVUU1QWxGZzZYV0F0aHRuN0pKWFRlN2hpZUtQY3Fj?=
 =?utf-8?B?cGRnaWFBanAyMlBJLzVEK0p2SFBvb2dQSlRHYXJIVVlUSWJ6M2hXNnhHVkFo?=
 =?utf-8?B?c0xla2ZMOWh0NC9MTFF5dkdCdTRrUlpUd0d1Z1hkbXJUV2xtQlhyREFmaks1?=
 =?utf-8?B?OXVrcW9nZzRuVFYwTTJFV2I3NjR5ZGU4Ukc1OFpibjlOUUxLWFJpcjVuVnNy?=
 =?utf-8?B?Sk92TUIrcHJ4bkgrQy9WWjVnSnFFTGs4KzIyNWRGNG5lWllNR0FsZk5nUDZz?=
 =?utf-8?B?UEc2UU40azRhUUtZS2grL1k0MVh2d1dBYUlzMlBvb29FOXNVTXBkTGxUTXhr?=
 =?utf-8?B?cThzcWUxU2VLU3lWM2NyMFhFZU9uOFB5Q2NScTFhWGlGelliZitYUE52Q1RC?=
 =?utf-8?B?TnF4ZlRycE1ieWpRWmdnQ2tneGtCNWNhOUgzbVBuWUMwRFpqMkNOR2RGekVh?=
 =?utf-8?Q?M7u12pcbIVeEs=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <46744C69D7899D41AB15FAE677593A87@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB4791.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 31be4433-df70-4420-3ccc-08d8b8fefb94
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jan 2021 02:40:55.4365
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ilmSL69ATcMCXmfnIzNR82R0At3mmn9sbnA/q1ya9Ans1d5rkIRSHCVwAod8J62brFA+NuxbR3R6WbrNZTi13g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB2902
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

UGV0ZXIgQ2hlbiB3cm90ZToNCj4gT24gMjEtMDEtMTQgMDY6MTY6MTgsIFRoaW5oIE5ndXllbiB3
cm90ZToNCj4+IEhpIFBldGVyLA0KPj4NCj4+IFBldGVyIENoZW4gd3JvdGU6DQo+Pj4gT24gMjEt
MDEtMTMgMTg6NTM6MTQsIFRoaW5oIE5ndXllbiB3cm90ZToNCj4+Pj4gSWYgYSBnYWRnZXQgc3Vw
cG9ydHMgU3VwZXJTcGVlZCBQbHVzLCB0aGVuIGl0IG1heSBvcGVyYXRlIGluIGRpZmZlcmVudA0K
Pj4+PiBzdWJsaW5rIHNwZWVkcy4gRm9yIGV4YW1wbGUsIGlmIHRoZSBnYWRnZXQgc3VwcG9ydHMg
U3VwZXJTcGVlZCBQbHVzDQo+Pj4+IGdlbjJ4MiwgdGhlbiBpdCBjYW4gc3VwcG9ydCAyIHN1Ymxp
bmsgc3BlZWRzIGdlbjEgYW5kIGdlbjIuIEluZm9ybSB0aGUNCj4+Pj4gaG9zdCBvZiB0aGVzZSBz
cGVlZHMgaW4gdGhlIEJPUyBkZXNjcmlwdG9yLg0KPj4+Pg0KPj4+IEhpIFRoaW5oLA0KPj4+DQo+
Pj4gSSByZWFkIFVTQiAzLjIgc3BlYzogY2g5LjYuMi41IFN1cGVyU3BlZWRQbHVzIFVTQiBEZXZp
Y2UgQ2FwYWJpbGl0eQ0KPj4+DQo+Pj4gU3ltbWV0cmljLiBSeCBhbmQgVHggU3VibGlua3MgaGF2
ZSB0aGUgc2FtZSBudW1iZXIgb2YgbGFuZXMgYW5kIG9wZXJhdGUNCj4+PiBhdCB0aGUgc2FtZSBz
cGVlZC4NCj4+PiBBc3ltbWV0cmljLiBSeCBhbmQgVHggU3VibGluayBoYXZlIGRpZmZlcmVudCBu
dW1iZXIgb2YgbGFuZXMgYW5kL29yDQo+Pj4gb3BlcmF0ZSBhdCBkaWZmZXJlbnQgc3BlZWRzLg0K
Pj4+DQo+Pj4gV2h5IHlvdXIgYmVsb3cgY2FzZXMgYXJlIGFsbCBmb3Igc3ltbWV0cmljLCBhdCBs
ZWFzdCwgdGhlIGV4YW1wbGUgMw0KPj4+IGlzIGFzeW1tZXRyaWMsIGl0IGhhcyBkaWZmZXJlbnQg
c3BlZWQgZm9yIHN1YmxpbmsgcGFpcnM/DQo+Pj4gRG9lcyB5b3VyIGJlbG93IGNhc2VzIGFyZSBz
cGVjaWZpY2F0aW9uIGRlZmluZWQgb3IgdXNlciBkZWZpbmVkPw0KPj4gVVNCIDMuMiBzcGVjIHNl
Y3Rpb24gOC41LjYuNzoNCj4+IEFzeW1tZXRyaWMgbGFuZSB0eXBlcyBhcmUgb25seSBmb3IgU3Vw
ZXJTcGVlZCBJbnRlcmNoaXAgKFNTSUMpLiBJTU8sDQo+PiBJdCdzIHVubGlrZWx5IHRoYXQgU1NJ
QyB1c2VyIHdpbGwgdXNlIExpbnV4IGtlcm5lbC4gV2UgY2FuIGV4dGVuZCBhbmQNCj4+IHVwZGF0
ZSB0aGUgZ2FkZ2V0IGZyYW1ld29yayBpZiB0aGVyZSdzIGFueSB1c2UgY2FzZSBmb3IgdGhhdC4N
Cj4+DQo+Pg0KPj4+PiBVc2UgMSBTU0lEIGlmIHRoZSBnYWRnZXQgc3VwcG9ydHMgdXAgdG8gZ2Vu
MngxLCBvciBub3Qgc3BlY2lmaWVkOg0KPj4+PiAtIFNTSUQgMCBmb3Igc3ltbWV0cmljIFJYL1RY
IHN1Ymxpbmsgc3BlZWQgb2YgMTAgR2Jwcy4NCj4+Pj4NCj4+Pj4gVXNlIDEgU1NJRCBpZiB0aGUg
Z2FkZ2V0IHN1cHBvcnRzIHVwIHRvIGdlbjF4MjoNCj4+Pj4gLSBTU0lEIDAgZm9yIHN5bW1ldHJp
YyBSWC9UWCBzdWJsaW5rIHNwZWVkIG9mIDUgR2Jwcy4NCj4+Pj4NCj4+Pj4gVXNlIDIgU1NJRHMg
aWYgdGhlIGdhZGdldCBzdXBwb3J0cyB1cCB0byBnZW4yeDI6DQo+Pj4+IC0gU1NJRCAwIGZvciBz
eW1tZXRyaWMgUlgvVFggc3VibGluayBzcGVlZCBvZiA1IEdicHMuDQo+Pj4gV2h5IFNTSUQgMCBp
cyBub3QgMTBHYnBzPw0KPj4gU1NJRCAwIGFuZCAxIGFyZSBhcmJpdHJhcnksIHdlIGNhbiBkbyAw
IGZvciAxMEdicHMuIFRoZXJlJ3Mgbm8NCj4+IGNvbnN0cmFpbnQgb3Igc3RhbmRhcmQgZnJvbSB0
aGUgVVNCIDMuMiBzcGVjLiBIb3dldmVyLCB5b3UgbmVlZCB0byBzZXQNCj4+IHRoZSBkZXNjcmlw
dG9yIHdGdW5jdGlvbmFsaXR5U3VwcG9ydC5TU0lEIHRvIGJlIHRoZSBtaW5pbXVtIGxhbmUgc3Bl
ZWQNCj4+IFNTSUQgaXQgc3VwcG9ydHMuIFVzaW5nIFNTSUQgMCBtYWtlcyBpdCBlYXNpZXIgc2lu
Y2Ugd2UgZG9uJ3QgaGF2ZSB0bw0KPj4gY29uZGl0aW9uIGl0IGZvciBtdWx0aXBsZSBTU0lEcy4N
Cj4+DQo+Pj4+IC0gU1NJRCAxIGZvciBzeW1tZXRyaWMgUlgvVFggc3VibGluayBzcGVlZCBvZiAx
MCBHYnBzLg0KPj4+IEJlc2lkZXMsIHdvdWxkIHlvdSBnaXZlIG1lIGFuIGV4YW1wbGUgd2hhdCBr
aW5kcyBvZiBzeXN0ZW0gZGVzaWduDQo+Pj4gd2lsbCB1c2UgYmVsb3cgc3VibGluayBzcGVlZD8N
Cj4+PiAtIFNTSUQgMCBmb3Igc3ltbWV0cmljIFJYL1RYIHN1Ymxpbmsgc3BlZWQgb2YgNSBHYnBz
Lg0KPj4+IC0gU1NJRCAxIGZvciBzeW1tZXRyaWMgUlgvVFggc3VibGluayBzcGVlZCBvZiAxMCBH
YnBzLg0KPj4+DQo+Pj4gUGV0ZXINCj4+IFRoZXNlIDIgU1NJRHMgaW5kaWNhdGUgdGhhdCB0aGUg
ZGV2aWNlIGlzIGNhcGFibGUgb2YgcnVubmluZyBpbiBnZW4xIGFuZA0KPj4gZ2VuMiBpbiBTU1Au
DQo+Pg0KPiBIaSBUaGluaCwNCj4NCj4gSSBhbSBwdXp6bGVkLCBHRU4yIGlzIGJhY2sgY29tcGF0
aWJsZSBmb3IgR0VOMS4gVGhlbiwgd2hhdCdzIHRoZSB1c2FnZQ0KPiBvZiB0aGlzIGRlc2NyaXB0
b3IsIHdoYXQga2luZHMgb2Ygc3BlY2lmaWMgaW5mb3JtYXRpb24gdGhlIGhvc3Qgd2FudHMgdG8g
Z2V0Pw0KPiBJIHRoaW5rIHRoZSBob3N0IHdhbnRzIHRvIGdldCBpZiB0d28gcGFpcnMgb2YgdHgv
cnggYXJlIHN1cHBvcnRlZCwgdGhhdA0KPiBpcyB3aGF0IFVTQiAzLjIgYWRkcy4NCj4NCg0KSGkg
UGV0ZXIsDQoNClllcywgaXQncyBiYWNrd2FyZCBjb21wYXRpYmxlLiBIb3dldmVyIEdlbjF4MiB1
c2VzIFN1cGVyU3BlZWQgUGx1cyBMaW5rDQpQcm90b2NvbC4gU2luZ2xlIGxhbmUgR2VuIDEgZG9l
c24ndC4gVGhpcyBhZGRpdGlvbmFsIFJYL1RYIHN1Ymxpbmsgc3BlZWQNCmF0dHJpYnV0ZSBwYWly
IGlzIHRlbGxpbmcgdGhlIGhvc3QgdGhhdCB0aGUgZGV2aWNlIGlzIGNhcGFibGUgb2YgcnVubmlu
Zw0KYXQgR2VuMXgyIGFuZCBHZW4yeDIuIEhvc3QgY2FuIHVzZSB0aGlzIGluZm9ybWF0aW9uIHRv
IGtub3cgdGhhdCB0aGUNCmRldmljZSBzdXBwb3J0cyBHZW4gMSBhcyBTU1AsIGFuZCBpdCBjYW4g
aW5mZXIgdGhhdCB0aGUgZGV2aWNlIHN1cHBvcnRzDQpkdWFsLWxhbmUuIE90aGVyd2lzZSwgdGhl
IGhvc3QgY2FuIG9ubHkgY2hlY2sgZm9yIGR1YWwtbGFuZSBzdXBwb3J0DQphZnRlciBpdCByZWNl
aXZlcyBhIHBvcnQgc3RhdHVzIG9yIHN1Ymxpbmsgc3BlZWQgZGV2aWNlIG5vdGlmaWNhdGlvbiBU
UC4NClJlZ2FyZGxlc3MsIHRoZSBnYWRnZXQgc2hvdWxkIGRlc2NyaWJlIGFsbCB0aGUgc3VibGlu
ayBzcGVlZHMgdGhlIGRldmljZQ0KaXMgY2FwYWJsZSBvZiBpbiB0aGUgU1NQIGNhcGFiaWxpdHkg
ZGVzY3JpcHRvci4NCg0KQlIsDQpUaGluaA0KDQo=
