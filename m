Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 18B3548DD36
	for <lists+linux-usb@lfdr.de>; Thu, 13 Jan 2022 18:53:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237282AbiAMRxe (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 13 Jan 2022 12:53:34 -0500
Received: from smtprelay-out1.synopsys.com ([149.117.87.133]:40708 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S237280AbiAMRxe (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 13 Jan 2022 12:53:34 -0500
Received: from mailhost.synopsys.com (us03-mailhost1.synopsys.com [10.4.17.17])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 7E5A4C0116;
        Thu, 13 Jan 2022 17:53:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1642096413; bh=NxZUg+CY5vyVgz+AMWG8wojYXtHdBA4kT+rZ1GuQYYs=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=DrP4Nzj3cdmAxNTThDc+mw9AGKYCe7Q67DYEw/5dvSjZ9Zz3jPc5MCdL++wCWS9yN
         bT0nn3ysyBM/dX0BpljyTDYP4dfeFAaFIBoOpCUZkow0AEHuO4Gv8ogVEIsa2dxBI5
         XG6HxoDcswDKFeyCvhmP1RhEBu6d9hZ46OC3KzBhTN4g/WiTqK50PbjfZq408qCAIA
         m+gunCVDT+N93aMXLp47q8eCLQf8fkOEX21f7hS4ZJH+aPdCBIsVsUGxoFFF80zf6y
         zB4dyu5cIkJ84jQpnCrGeGrKVEMFueKIqJR9qKFuhlbukehF5rQHOeYmwFEvyVaJNh
         txcrVEm1WkK6w==
Received: from o365relay-in.synopsys.com (us03-o365relay1.synopsys.com [10.4.161.137])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (verified OK))
        by mailhost.synopsys.com (Postfix) with ESMTPS id 86A29A0080;
        Thu, 13 Jan 2022 17:53:32 +0000 (UTC)
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2104.outbound.protection.outlook.com [104.47.58.104])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
        by o365relay-in.synopsys.com (Postfix) with ESMTPS id 7925781494;
        Thu, 13 Jan 2022 17:53:31 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=thinhn@synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
        dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="fpIkJ/4K";
        dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P4xeoOpjOKgFYWeJx/FQaXQZQj59by8vgKUKwXlcz6xLmZPbQPYP8Lp50DypqA0zUhhotV1rPmM0XKzR3ZFZIci/giP+K5QYXbvjIOXvo5qmvresyPcl4dgS81mpb1sVvQF8GuKqprXWmWwvQr4D/5NLtR12lVK7gMeEcds+NY7VyZSbfvG4bFQnxGz0pA1zIiwtXa0e/C6Dx9iv6e6x2N92b4wpWKt0zA+sU7rX6yt6mVup3jKP8mfoHR+7F2mZgO68l2hR0DcluwyOFGy4HSszjH3l/7tt/UQITXYqXgNZsmcEwIqVbfVubT46icfG1zZ5pJ2eBflhyOtuYr5BBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NxZUg+CY5vyVgz+AMWG8wojYXtHdBA4kT+rZ1GuQYYs=;
 b=K11yTY9VOmiyQR140gx4FSxgBzrTAwEi5GtTsqZp+BDnU47pHTDvve5uBqNRSYwdi5ZKe8Ti+pIuaJKRbLPc9StEKTjtQjzxEW8Uj6L5IUJVcti4nkAUc+ZeKwji07qRP/4BeTJt+mmQK4mZGE77OQ98b8bS9tOlCD0uNPBzBo1/DaLDvi9eCIYj2izu+u6/Vex3F+K+RVAwPHhen/XxD2nSs+SchwKv4IgFDCDT9Ojq9vCtNZSaTCebjU9Ki35hByzKs5sVKaoUcSszQ8RC8K4elMUQExJnjO0Kyb6QTvGqZ6hGdgR7wn0MjjfhmAqMnDguS2wpHzRQF+G7em2VOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NxZUg+CY5vyVgz+AMWG8wojYXtHdBA4kT+rZ1GuQYYs=;
 b=fpIkJ/4K/SYqxhukYlQgUK9u0hr7pDvkdL9pdkE+dx0a6QeqCxgNpgOsEIhiLCh/hnGDhInjhBCOxeZB2rpR2HQd59V1Etw4WpZLGyVJJyEVCgIUjZFBOoyck/iC3csYbauOVwPSX7EvChJ1lKqCcZXua2ljLkK75nEmwT8roPs=
Received: from BYAPR12MB4791.namprd12.prod.outlook.com (2603:10b6:a03:10a::12)
 by DM6PR12MB3017.namprd12.prod.outlook.com (2603:10b6:5:3e::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.11; Thu, 13 Jan
 2022 17:53:28 +0000
Received: from BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::8983:6493:8c38:d34a]) by BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::8983:6493:8c38:d34a%3]) with mapi id 15.20.4888.011; Thu, 13 Jan 2022
 17:53:28 +0000
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To:     youling 257 <youling257@gmail.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        "mathias.nyman@intel.com" <mathias.nyman@intel.com>
CC:     Greg KH <gregkh@linuxfoundation.org>,
        "william.allentx@gmail.com" <william.allentx@gmail.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: USB 3.2 Gen 2x2 "Superspeed+20GBps" support for ASM3242
Thread-Topic: USB 3.2 Gen 2x2 "Superspeed+20GBps" support for ASM3242
Thread-Index: AQHXFK9aaZXyhujf3U2dpApLGjyr3Kp7QfkAgABMwgCB0UUQAIAABYYAgAAYe4CAALNAgIAAeC8AgBUGVYA=
Date:   Thu, 13 Jan 2022 17:53:27 +0000
Message-ID: <1b916a33-0d7b-c5a9-cca9-5b1a39fdb5c3@synopsys.com>
References: <f5bca159-e8de-3c76-c2b4-6f4efa001fd9@linux.intel.com>
 <20211230131014.21886-1-youling257@gmail.com> <Yc20WPbIad44/3rd@kroah.com>
 <CAOzgRdbeQ69pWbagFwTvV4ZcYGBE5GkwdqcuxxGFLXBJSy-GMA@mail.gmail.com>
 <6908aa69-469b-8f92-8e19-60685f524f9c@synopsys.com>
 <CAOzgRdZKXa9N1-OPEDyRvckbCnx5DFfEx6P7Us7TRFA9aF9LtA@mail.gmail.com>
In-Reply-To: <CAOzgRdZKXa9N1-OPEDyRvckbCnx5DFfEx6P7Us7TRFA9aF9LtA@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=synopsys.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 40122cb6-462c-4107-2312-08d9d6bd9ac6
x-ms-traffictypediagnostic: DM6PR12MB3017:EE_
x-microsoft-antispam-prvs: <DM6PR12MB301732EFAF436484F3246A6EAA539@DM6PR12MB3017.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3383;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: GXD2Fb4fAyPVxyrhwuCa3eqVhwgb1tXT9nPCcrRB6HHI/6rebVMRLK4hlaxN3D4s+KwKlzjfZ/34pdC3Yg1HpUk43E93ciyqseX2d3hv6fgPXRianv402EXeqMforlOW3qNtbk68k939iWPWhMDwd46d3Snv3sLDwUnOtpY/hFQiOSwkrNJpCnz5VdBvEUW3VtXCVR/ENFmetmJ7KvWLfu3O4jO4F6QpTT+NyqPJR4zZd+NGQkpcMW0c7BpPPTQ+ZyD8MjIE5BDXc9OMfzenrdf0MPBln7Y5CQHDCPDJFMGFhD5QP2Q0zOiMNqki7zio6vq5S/6UGPlP+ltGtMO/qjARsdrf2QzaRfJtK+yLI0T3DglYsviEcek07mMxV9WWy3k0tdBgvhOBIhZRhJYFD0lRj5Hm/Jf7pCerlqc0uqseL3hPOvYJPiTvvIGRlaQZOwdJc57g8MBzjb3Np+asnYjOZvkS37JhMPGqiq28/K1cCRGjA6Vsrq8/lUtpHe+wOMr1jJDBwx0VWg7nC/TXgSNpeKr7rmhCI+/DW6qr0XWWdmu0AF0LaSCR1w0bJsw9K5vYOa8ui+y/MjUsFboavCC+c0Q1MEtSsuZVVXvoMhpPC/DWgkDawbGY1vTlSGSVG60AIc30Wbw3mNwKFfDA5ZQPpNnlBWwhdZtBNTPy9I5NhfEjamtlgQ7aeBY3p9QdP0X83sBh28aRaZroF3zccgurR2/KEaX8dUMn/+JFJKL+Zgp3ygHT/rE8+8xsJBKng33k/Rs+38TsL09EY8ZyGw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB4791.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(66476007)(8676002)(8936002)(83380400001)(26005)(66946007)(2616005)(4326008)(6512007)(38100700002)(186003)(36756003)(76116006)(38070700005)(6486002)(4001150100001)(71200400001)(54906003)(316002)(110136005)(122000001)(508600001)(5660300002)(64756008)(66556008)(31686004)(66446008)(6506007)(2906002)(86362001)(31696002)(45980500001)(43740500002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NG5IVlRndHk3dndWRDBFc3pPQWRiNTl6KzIxdURFYWk0ZmhjZlY3Y3k2N1dH?=
 =?utf-8?B?Ti84SEN2ajFwbWtLb0pqU0dNU0IvVTNGMkk0ekxOamNVQSt0dG0wTE1sdUc4?=
 =?utf-8?B?Y1FTM3Z1bnpaUmw1WVh6ZG5VMUFGYmhNR3dCMUdGSkYyY25xdnFnc3h5Y3My?=
 =?utf-8?B?SCt5RHRiZTZoNFV1aVlGTlk3MHlTbWJZVjBtKzZlVHJXU0lKOStzRXB2ckp3?=
 =?utf-8?B?VEp5ZUJFT1V6aWFmelFGcnQ1L01iNHc5WWViMUs3MzUzdkhFeUlIdkxyUXdK?=
 =?utf-8?B?Umw5L3pDRHVNcVhtdmdaTXNiSEJJZVRaMnlCQjFFbEJ6NzFGbGhGeDdXNG92?=
 =?utf-8?B?SVBZSlhHb1ZQaWV1WU5BNi9Ea2dZZ005b0lsRGdYb2wwTXdFeGI4RWUyMUNy?=
 =?utf-8?B?bVpRNnJUZnQza09haEVkSkxKc3Y3WG50Z1BheFpkRXZ6U0VOY25hQWxaNmh6?=
 =?utf-8?B?U3F5cEIyMXJrN1M1M2RoRlNXV25YdTZPb0g4ZTNQbXJHOS9wdGY2Z3Jlc3dh?=
 =?utf-8?B?MWR3Z3UrRDJNZTBUYU5oK1ZFMm5KRmdRa3pDOFcvMnRVTUd5VVRCZDY4Vlha?=
 =?utf-8?B?VjBjbU9EbUFMMHR3UUVKdEFzOEJFOXV1bjhhNDA5N1FCd2Nib0ZxOXR3YVdL?=
 =?utf-8?B?RUFkN1dLRHlEcmRHdHdyUXQzYjYxZ3M2eEljQ1B0ZXhyTHhzbW41cG1BUnZJ?=
 =?utf-8?B?Vlg0YU9YMVN4dVc1clJmcFc3SmliL2V4QjZzRVdjakNaT3JrZXVPTVQxcU5Y?=
 =?utf-8?B?ck44Qkp4dUdnenhISWt6clVxSURoWnF0UG8zR0g0YkxUbGsxajQrMUoxSmFN?=
 =?utf-8?B?ZGx4Tm9DUHF6NUZBeGIrTzAxZS9lbGpDUEdsWXJjL3A1TlNiYS85N1doSkly?=
 =?utf-8?B?cW9sWWFBUVQ1K0F2TnBMZGFQT0R2SGt3N0tsLzNMempQNjB2ODVHbHhWWWVy?=
 =?utf-8?B?a3htSEhGaEhPa3pxUDJocDR3clhnVkpjOGw1RU9lZ3RzT1lSSjYvb3d3M2NV?=
 =?utf-8?B?T3V5dXc1U0FUMW5UZ2x0SnZaaWtpdU5zYWVRS1BQNDA4V2JYUWMrR3BTRyty?=
 =?utf-8?B?eDR6SDA0Mmc1WHNKTEsvWDVzcEpIdGxsbW44YVFrd3kxMERtUnFjK2FqVmJw?=
 =?utf-8?B?L2dNUUR4L3YzM3VleW45STBITUFTZWRPSk9QaC9NYytSemtBNkdwMjFpMURK?=
 =?utf-8?B?QTNURG8vNW05UnczQXFnUjFPMWtLZXEyajJxc1IrQzlXdnpoUko3bk9raEtF?=
 =?utf-8?B?d0VkV0VRUlBhbjBLRTZxaHA2enJXM2w2VDFEQTBxK3VpUUNONVA5OG5IU0V5?=
 =?utf-8?B?VWRQZEZSQUdUby85TG52Zzc3YUY3YnQ4QW9oMjUrUzZubThZRFF0Qmg0NlZG?=
 =?utf-8?B?cXp0TzdjcURjN2xuZ2NUUHMyR0tIWGpaUFJBby9FT1ptSmUrNTlNVWM0OWRR?=
 =?utf-8?B?bUhpQnpIS0RORGViYU4zcElESy9TL2tCQWdmdVF5TFZjcnZzdjRtck5vWlVQ?=
 =?utf-8?B?N3FHa1NHOGhIRmQ5THlpQUMvd1UyTnpvZGFpTStCQ2xUbTNyU2M5eWdGd0R2?=
 =?utf-8?B?dUtINUdNQi9xNUR3bmRKM1lXUmxRTFVKZzRRcUtMcFF4VllsdU5pc0N4b3lT?=
 =?utf-8?B?Y0NHYzJLY2VzOGh4Nnh6T0xUNjBvaG1XZkNBT0E1K0txTVJWSW50YjZtM1Nz?=
 =?utf-8?B?R255OWNxeTJTYWUzRW0za1RBZDRQaXgyeHBteGMwM2Z6R0RHeG5KbWFDdCtB?=
 =?utf-8?B?ZHV4cS9mbGZRRG5lVXFlVm9ldHg5OWZRQlVrN3AvdnhYNlU3TDRid3hzZUFa?=
 =?utf-8?B?QURoZ0hONnREb2psalQrc3ovWmZXdUdaSnRpRnVCc2FjNlEzcUNHQ3JaR1hl?=
 =?utf-8?B?RkFOeHBuaHh3L0ZUeUZYUS9WcUhJUWY5bGxDY3J6dU0zNXV5RWx0WFNlYktN?=
 =?utf-8?B?MGxBRXdRaTA0SkNrVEluZXVLckRyeE1TY3pPWkJPWVB4SXIrM3R3Y1FFTkdQ?=
 =?utf-8?B?UXp4Nmp4VlZKcEJULzY4Mnc0cVdIMnhVaGpiWHIxOUtxejh3bVd3ZWszTElM?=
 =?utf-8?B?WXVBYzNnODJmSFlqOHZDREw2TFlpSzhkbzBLRnVMc0t2NU9NYVRONVc5OVRu?=
 =?utf-8?B?MlJyRlRZbTVkWFdxOTFWMXdOK3NpdUtrNzdvV2M5UmY0KzdQbEdmNU45RnlK?=
 =?utf-8?B?R2c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <13E50DA98E9BBF4DA09F69B1FECBC72A@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB4791.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 40122cb6-462c-4107-2312-08d9d6bd9ac6
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Jan 2022 17:53:27.9256
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: O41bJgbDVlSVusN2zQ7pvISp2Q9TzqVl13fOD6omkOrpG+/+4IA+mkVMz7SIafpwAB/ebfw4tlMxBohENk74dw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3017
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

eW91bGluZyAyNTcgd3JvdGU6DQo+IHBsZWFzZSB5b3Ugc3ViamVjdCBhIHBhdGNoIHRvIGxpbnV4
LXVzYi4NCj4gDQpJJ2xsIHRha2UgYSBsb29rLg0KDQo+IDIwMjEtMTItMzEgOTozOSBHTVQrMDg6
MDAsIFRoaW5oIE5ndXllbiA8VGhpbmguTmd1eWVuQHN5bm9wc3lzLmNvbT46DQo+PiBUaGUgQVNt
ZWRpYSBob3N0IGNvbnRyb2xsZXIgaW5jb3JyZWN0bHkgcmVwb3J0cyB0aGUgc3BlZWQgSUQgaW4g
dGhlDQo+PiBwb3J0LXN0YXR1cyBtaXNtYXRjaGluZyB3aXRoIGl0cyBQU0kgY2FwYWJpbGl0eSBm
b3IgU1NQIGRldmljZXMuIEFzDQo+PiBhIHJlc3VsdCwgdGhlIGhvc3QvaHViIGRyaXZlciB3aWxs
IHJlcG9ydCB0aGUgd3Jvbmcgc3BlZWQuDQo+Pg0KPj4gVG8gcmVzb2x2ZS93b3JrYXJvdW5kIHRo
aXMsIHRoZSB4SENJIGRyaXZlciBjYW4gY2FwdHVyZSB0aGUgZGV2aWNlIHNwZWVkDQo+PiBmcm9t
IHN1Ymxpbmsgc3BlZWQgbm90aWZpY2F0aW9uIG9mIGEgU1NQIGRldmljZS4gQWxsIFNTUCBkZXZp
Y2VzIG11c3QNCj4+IHNlbmQgc3VibGluayBzcGVlZCBkZXZpY2Ugbm90aWZpY2F0aW9uLCBzbyB0
aGlzIG1ldGhvZCBzaG91bGQgcmVzb2x2ZQ0KPj4geW91ciBpc3N1ZS4NCj4+DQo+PiBZb3UgY2Fu
IGFwcGx5IHRoZSBjaGFuZ2UgYmVsb3cuIFRoaXMgc2hvdWxkIHJlc29sdmUgeW91ciBpc3N1ZS4N
Cj4+DQo+PiBCUiwNCj4+IFRoaW5oDQo+Pg0KPj4NCj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3Vz
Yi9ob3N0L3hoY2ktbWVtLmMgYi9kcml2ZXJzL3VzYi9ob3N0L3hoY2ktbWVtLmMNCj4+IGluZGV4
IDlkZGNjMGFiNGRiNy4uNmRlMTVmMDA0Njg0IDEwMDY0NA0KPj4gLS0tIGEvZHJpdmVycy91c2Iv
aG9zdC94aGNpLW1lbS5jDQo+PiArKysgYi9kcml2ZXJzL3VzYi9ob3N0L3hoY2ktbWVtLmMNCj4+
IEBAIC0yNjAyLDcgKzI2MDIsNyBAQCBpbnQgeGhjaV9tZW1faW5pdChzdHJ1Y3QgeGhjaV9oY2Qg
KnhoY2ksIGdmcF90IGZsYWdzKQ0KPj4gIAkgKi8NCj4+ICAJdGVtcCA9IHJlYWRsKCZ4aGNpLT5v
cF9yZWdzLT5kZXZfbm90aWZpY2F0aW9uKTsNCj4+ICAJdGVtcCAmPSB+REVWX05PVEVfTUFTSzsN
Cj4+IC0JdGVtcCB8PSBERVZfTk9URV9GV0FLRTsNCj4+ICsJdGVtcCB8PSBERVZfTk9URV9GV0FL
RSB8IERFVl9OT1RFX1NVQkxJTktfU1BFRUQ7DQo+PiAgCXdyaXRlbCh0ZW1wLCAmeGhjaS0+b3Bf
cmVncy0+ZGV2X25vdGlmaWNhdGlvbik7DQo+Pg0KPj4gIAlyZXR1cm4gMDsNCj4+IGRpZmYgLS1n
aXQgYS9kcml2ZXJzL3VzYi9ob3N0L3hoY2ktcmluZy5jIGIvZHJpdmVycy91c2IvaG9zdC94aGNp
LXJpbmcuYw0KPj4gaW5kZXggOTlkOWQ5Yzg4OTg4Li44MDA4MWIzZmQ1MmEgMTAwNjQ0DQo+PiAt
LS0gYS9kcml2ZXJzL3VzYi9ob3N0L3hoY2ktcmluZy5jDQo+PiArKysgYi9kcml2ZXJzL3VzYi9o
b3N0L3hoY2ktcmluZy5jDQo+PiBAQCAtMTg2MCw2ICsxODYwLDggQEAgc3RhdGljIHZvaWQgaGFu
ZGxlX2RldmljZV9ub3RpZmljYXRpb24oc3RydWN0IHhoY2lfaGNkDQo+PiAqeGhjaSwNCj4+ICB7
DQo+PiAgCXUzMiBzbG90X2lkOw0KPj4gIAlzdHJ1Y3QgdXNiX2RldmljZSAqdWRldjsNCj4+ICsJ
dTMyIHR5cGU7DQo+PiArCXUzMiBkbjsNCj4+DQo+PiAgCXNsb3RfaWQgPSBUUkJfVE9fU0xPVF9J
RChsZTMyX3RvX2NwdShldmVudC0+Z2VuZXJpYy5maWVsZFszXSkpOw0KPj4gIAlpZiAoIXhoY2kt
PmRldnNbc2xvdF9pZF0pIHsNCj4+IEBAIC0xODY4LDExICsxODcwLDQ1IEBAIHN0YXRpYyB2b2lk
IGhhbmRsZV9kZXZpY2Vfbm90aWZpY2F0aW9uKHN0cnVjdA0KPj4geGhjaV9oY2QgKnhoY2ksDQo+
PiAgCQlyZXR1cm47DQo+PiAgCX0NCj4+DQo+PiAtCXhoY2lfZGJnKHhoY2ksICJEZXZpY2UgV2Fr
ZSBOb3RpZmljYXRpb24gZXZlbnQgZm9yIHNsb3QgSUQgJXVcbiIsDQo+PiAtCQkJc2xvdF9pZCk7
DQo+PiAgCXVkZXYgPSB4aGNpLT5kZXZzW3Nsb3RfaWRdLT51ZGV2Ow0KPj4gLQlpZiAodWRldiAm
JiB1ZGV2LT5wYXJlbnQpDQo+PiAtCQl1c2Jfd2FrZXVwX25vdGlmaWNhdGlvbih1ZGV2LT5wYXJl
bnQsIHVkZXYtPnBvcnRudW0pOw0KPj4gKwl0eXBlID0gVFJCX0ROX1RZUEUobGUzMl90b19jcHUo
ZXZlbnQtPmdlbmVyaWMuZmllbGRbMF0pKTsNCj4+ICsNCj4+ICsJc3dpdGNoICh0eXBlKSB7DQo+
PiArCWNhc2UgVFJCX0ROX1RZUEVfRlVOQ19XQUtFOg0KPj4gKwkJeGhjaV9pbmZvKHhoY2ksICJE
ZXZpY2UgV2FrZSBOb3RpZmljYXRpb24gZXZlbnQgZm9yIHNsb3QgSUQgJXVcbiIsDQo+PiArCQkJ
ICBzbG90X2lkKTsNCj4+ICsJCWlmICh1ZGV2ICYmIHVkZXYtPnBhcmVudCkNCj4+ICsJCQl1c2Jf
d2FrZXVwX25vdGlmaWNhdGlvbih1ZGV2LT5wYXJlbnQsIHVkZXYtPnBvcnRudW0pOw0KPj4gKwkJ
YnJlYWs7DQo+PiArCWNhc2UgVFJCX0ROX1RZUEVfU1VCTElOS19TUEVFRDoNCj4+ICsJCWlmICgh
dWRldikNCj4+ICsJCQlicmVhazsNCj4+ICsNCj4+ICsJCWRuID0gbGUzMl90b19jcHUoZXZlbnQt
PmdlbmVyaWMuZmllbGRbMV0pOw0KPj4gKwkJdWRldi0+c3NwX3JhdGUgPSBVU0JfU1NQX0dFTl9V
TktOT1dOOw0KPj4gKw0KPj4gKwkJaWYgKFRSQl9ETl9TVUJMSU5LX1NQRUVEX0xQKGRuKSA9PQ0K
Pj4gKwkJICAgIFRSQl9ETl9TVUJMSU5LX1NQRUVEX0xQX1NTUCkgew0KPj4gKwkJCXVkZXYtPnNw
ZWVkID0gVVNCX1NQRUVEX1NVUEVSX1BMVVM7DQo+PiArDQo+PiArCQkJaWYgKFRSQl9ETl9TVUJM
SU5LX1NQRUVEX0xTRShkbikgIT0NCj4+ICsJCQkgICAgVFJCX0ROX1NVQkxJTktfU1BFRURfTFNF
X0dCUFMpDQo+PiArCQkJCWJyZWFrOw0KPj4gKw0KPj4gKwkJCWlmIChUUkJfRE5fU1VCTElOS19T
UEVFRF9MU00oZG4pID09IDEwKSB7DQo+PiArCQkJCWlmIChUUkJfRE5fU1VCTElOS19TUEVFRF9M
QU5FUyhkbikpDQo+PiArCQkJCQl1ZGV2LT5zc3BfcmF0ZSA9IFVTQl9TU1BfR0VOXzJ4MjsNCj4+
ICsJCQkJZWxzZQ0KPj4gKwkJCQkJdWRldi0+c3NwX3JhdGUgPSBVU0JfU1NQX0dFTl8yeDE7DQo+
PiArCQkJfSBlbHNlIGlmIChUUkJfRE5fU1VCTElOS19TUEVFRF9MU00oZG4pID09IDUpIHsNCj4+
ICsJCQkJaWYgKFRSQl9ETl9TVUJMSU5LX1NQRUVEX0xBTkVTKGRuKSkNCj4+ICsJCQkJCXVkZXYt
PnNzcF9yYXRlID0gVVNCX1NTUF9HRU5fMXgyOw0KPj4gKwkJCX0NCj4+ICsJCX0gZWxzZSB7DQo+
PiArCQkJdWRldi0+c3BlZWQgPSBVU0JfU1BFRURfU1VQRVI7DQo+PiArCQl9DQo+PiArCQlicmVh
azsNCj4+ICsJfQ0KPj4gIH0NCj4+DQo+PiAgLyoNCj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3Vz
Yi9ob3N0L3hoY2kuaCBiL2RyaXZlcnMvdXNiL2hvc3QveGhjaS5oDQo+PiBpbmRleCA5MTkyNDY1
ZmQ1ZjMuLmNlMmNhNjdjMTE1ZiAxMDA2NDQNCj4+IC0tLSBhL2RyaXZlcnMvdXNiL2hvc3QveGhj
aS5oDQo+PiArKysgYi9kcml2ZXJzL3VzYi9ob3N0L3hoY2kuaA0KPj4gQEAgLTI2Nyw2ICsyNjcs
NyBAQCBzdHJ1Y3QgeGhjaV9vcF9yZWdzIHsNCj4+ICAgKiBTVyBkb2VzIG5lZWQgdG8gcGF5IGF0
dGVudGlvbiB0byBmdW5jdGlvbiB3YWtlIG5vdGlmaWNhdGlvbnMuDQo+PiAgICovDQo+PiAgI2Rl
ZmluZQlERVZfTk9URV9GV0FLRQkJRU5BQkxFX0RFVl9OT1RFKDEpDQo+PiArI2RlZmluZQlERVZf
Tk9URV9TVUJMSU5LX1NQRUVECUVOQUJMRV9ERVZfTk9URSg1KQ0KPj4NCj4+ICAvKiBDUkNSIC0g
Q29tbWFuZCBSaW5nIENvbnRyb2wgUmVnaXN0ZXIgLSBjbWRfcmluZyBiaXRtYXNrcyAqLw0KPj4g
IC8qIGJpdCAwIGlzIHRoZSBjb21tYW5kIHJpbmcgY3ljbGUgc3RhdGUgKi8NCj4+IEBAIC0xNDM0
LDYgKzE0MzUsMzAgQEAgdW5pb24geGhjaV90cmIgew0KPj4gIC8qIEdldCBORUMgZmlybXdhcmUg
cmV2aXNpb24uICovDQo+PiAgI2RlZmluZQlUUkJfTkVDX0dFVF9GVwkJNDkNCj4+DQo+PiArLyog
R2V0IERldmljZSBOb3RpZmljYXRpb24gdHlwZSAqLw0KPj4gKyNkZWZpbmUgVFJCX0ROX1RZUEUo
cCkJCQkoKChwKSA+PiA0KSAmIDB4ZikNCj4+ICsNCj4+ICsjZGVmaW5lIFRSQl9ETl9UWVBFX0ZV
TkNfV0FLRQkJMQ0KPj4gKyNkZWZpbmUgVFJCX0ROX1RZUEVfU1VCTElOS19TUEVFRAk1DQo+PiAr
DQo+PiArLyogR2V0IHN1Ymxpbmsgc3BlZWQgYXR0cmlidXRlcyAqLw0KPj4gKyNkZWZpbmUgVFJC
X0ROX1NVQkxJTktfU1BFRURfTFNFKHApCSgoKHApID4+IDQpICYgMHgzKQ0KPj4gKyNkZWZpbmUg
VFJCX0ROX1NVQkxJTktfU1BFRURfTFNFX0JQUwkwDQo+PiArI2RlZmluZSBUUkJfRE5fU1VCTElO
S19TUEVFRF9MU0VfS0JQUwkxDQo+PiArI2RlZmluZSBUUkJfRE5fU1VCTElOS19TUEVFRF9MU0Vf
TUJQUwkyDQo+PiArI2RlZmluZSBUUkJfRE5fU1VCTElOS19TUEVFRF9MU0VfR0JQUwkzDQo+PiAr
I2RlZmluZSBUUkJfRE5fU1VCTElOS19TUEVFRF9TVChwKQkoKChwKSA+PiA2KSAmIDB4MykNCj4+
ICsjZGVmaW5lIFRSQl9ETl9TVUJMSU5LX1NQRUVEX0xBTkVTKHApCSgoKHApID4+IDEwKSAmIDB4
ZikNCj4+ICsjZGVmaW5lIFRSQl9ETl9TVUJMSU5LX1NQRUVEX0xQKHApCSgoKHApID4+IDE0KSAm
IDB4MykNCj4+ICsjZGVmaW5lIFRSQl9ETl9TVUJMSU5LX1NQRUVEX0xQX1NTCTANCj4+ICsjZGVm
aW5lIFRSQl9ETl9TVUJMSU5LX1NQRUVEX0xQX1NTUAkxDQo+PiArI2RlZmluZSBUUkJfRE5fU1VC
TElOS19TUEVFRF9MU00ocCkJKCgocCkgPj4gMTYpICYgMHhmZmZmKQ0KPj4gKw0KPj4gKyNkZWZp
bmUgVFJCX0ROX1NVQkxJTktfU1BFRURfSVNfU1lNTUVUUklDKHApIFwNCj4+ICsJKCEoVFJCX0RO
X1NVQkxJTktfU1BFRURfU1QocCkgJiBCSVQoMCkpKQ0KPj4gKyNkZWZpbmUgVFJCX0ROX1NVQkxJ
TktfU1BFRURfSVNfVFgocCkgXA0KPj4gKwkoISEoVFJCX0ROX1NVQkxJTktfU1BFRURfU1QocCkg
JiBCSVQoMSkpKQ0KPj4gKw0KPj4gIHN0YXRpYyBpbmxpbmUgY29uc3QgY2hhciAqeGhjaV90cmJf
dHlwZV9zdHJpbmcodTggdHlwZSkNCj4+ICB7DQo+PiAgCXN3aXRjaCAodHlwZSkgew0KPj4NCj4+
DQo+Pg0KPj4NCj4+DQoNCg0KSGkgTWF0aGlhcy9hbGwsDQoNClNvbWUgQVNtZWRpYSBob3N0cyBo
YXZlIGlzc3VlIHdpdGggcmVwb3J0aW5nIGNvcnJlY3QgcG9ydCBzcGVlZCBJRCBmb3INCmRldmlj
ZXMgb3BlcmF0aW5nIGluIFNTUC4gV2UgY2FuIHdvcmthcm91bmQgdGhpcyBieSBnZXR0aW5nIHRo
ZSBkZXZpY2UNCnNwZWVkIGZyb20gdGhlIGRldmljZSBub3RpZmljYXRpb24gc3VibGluayBzcGVl
ZCBpbnN0ZWFkLg0KDQpUaGUgcXVlc3Rpb24gaGVyZSBpcyB3aGV0aGVyIHdlIHNob3VsZCBjaGVj
ayBzcGVlZCBmcm9tIGRldmljZQ0Kbm90aWZpY2F0aW9uIChTU1Agb25seSkgb3IgZG8gd2Ugd2Fu
dCB0byBzZWxlY3RpdmVseSBzZXQgcXVpcmsgZm9yDQpBU21lZGlhIGhvc3RzIG9ubHkuIFNob3Vs
ZCB3ZSB0cnVzdCBhIGRldmljZSByZXNwb25zZSBtb3JlIG9yIHRoZSBob3N0IG1vcmU/DQoNClRo
ZSBjaGFuZ2UgYWJvdmUgdGhhdCBZb3VsaW5nIHRlc3RlZCBvdmVycmlkZXMgc3BlZWQgZGV0ZWN0
ZWQgZnJvbSBwb3J0DQpzdGF0dXMgd2l0aCBkZXZpY2Ugbm90aWZpY2F0aW9uIHN1Ymxpbmsgc3Bl
ZWQuDQoNClRoYW5rcywNClRoaW5oDQo=
