Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 46E221F17F5
	for <lists+linux-usb@lfdr.de>; Mon,  8 Jun 2020 13:39:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729565AbgFHLjd (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 8 Jun 2020 07:39:33 -0400
Received: from mail-bn8nam12on2082.outbound.protection.outlook.com ([40.107.237.82]:6080
        "EHLO NAM12-BN8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1729559AbgFHLjd (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 8 Jun 2020 07:39:33 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y1YmwQEUBVJmEJktqAVwLyqsGZrEasKNzX1Sdm0ZnRuLHbqETuM4cWKW0zNuSjxttCz0Ffygfh85wuq13paDNW1z095x2NAhQzBOkk041HCXyNLYeIVZEfQER6M9LdUMm4OKD5Ue7BFyj6J1GAumHmhXttgqWG7p665KJQVgIm7mSFtNPAUJhxS/XSSiz8hYcJs9/DHuicfGIZfobWoDF2fSrmLegfdb47r9HXok0zsCkcgLwGFffywmjKuEm2LPwn7IbXRnEICKioHLpcOzkgF2Jdr+C+D2UUps8uqA3JKXyjCvBn3ZDqWkva4Z1wKCreT7gKBFIF4u1iYz5fIIuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RgXLeljybjJlWd9AXzw9+lHfvDol69WP2ojTQL979/g=;
 b=VOTFjkhjGXIMjok70IptC2W9CBxu9iKYMTfpy2suWjhAPeIji/orv/Fl/2YFj9fktTMP1B/1oXrguZGYqfovYcw7ozqOPJvwP1Ywi7UYO8ng3xyumek2oOg/svNiq0WHxurUGRINahObHvwRU5i0tmpMZER9lR2MAD9ZbfZtRx7RGnEJ8w0mzkHcmf0C/M+XQ53G6yQiDGehO1FsYbZyVm9k7nYyYIceo+4vk+gEKMnGhGMaanJXHSXCovwDm+CaFmgeYxH5aSMcA0zonSXzK8Z/d+U7pa8BNaq+Pb13GvyldlRCAeEdVv4zXvpA11zxBn731a8RnllcltiZXIjscA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=infinera.com; dmarc=pass action=none header.from=infinera.com;
 dkim=pass header.d=infinera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=infinera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RgXLeljybjJlWd9AXzw9+lHfvDol69WP2ojTQL979/g=;
 b=CC+vpFmXMjmfl+kwwRrhnJ0Fnw8RqVqlaV6rh+mTJ3pmoy8yDF0SVBO8NUgiiKkYk1uSWWsSPw63FY5GwjAcVoZIL/JBgR6jSbQtT/fMTTGKpRzoLamn25XZFSO1VQ1x3TcNC56zaMIr5KiSLKgZXMF8ChgbfhT7ioCNsCgRHCM=
Received: from BN8PR10MB3540.namprd10.prod.outlook.com (2603:10b6:408:ae::24)
 by BN8PR10MB3265.namprd10.prod.outlook.com (2603:10b6:408:cb::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3066.18; Mon, 8 Jun
 2020 11:39:31 +0000
Received: from BN8PR10MB3540.namprd10.prod.outlook.com
 ([fe80::c158:d59f:e3bc:1941]) by BN8PR10MB3540.namprd10.prod.outlook.com
 ([fe80::c158:d59f:e3bc:1941%2]) with mapi id 15.20.3066.023; Mon, 8 Jun 2020
 11:39:31 +0000
From:   Joakim Tjernlund <Joakim.Tjernlund@infinera.com>
To:     "oneukum@suse.com" <oneukum@suse.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: ttyACM: disabled by hub (EMI?), re-enabling... Causes garbage
 chars & disconnect
Thread-Topic: ttyACM: disabled by hub (EMI?), re-enabling... Causes garbage
 chars & disconnect
Thread-Index: AQHWMqM6W5iP9Jkv9UCEGIiDuBaJw6i45d+AgAADdICAABpkAIABC5qAgAADbYCAABTvAIAAbWUAgAAJUgCAAQCagIAAEYeAgAAQ3QCAACtYAIAAKHAAgA3IaoCABKdlgIAAKLCA
Date:   Mon, 8 Jun 2020 11:39:30 +0000
Message-ID: <914176111c9eee651f402b499bc5ec49ff634e00.camel@infinera.com>
References: <6a4fe396ab5ae6cda548e904c57bc823103999d7.camel@infinera.com>
         <1590418977.2838.16.camel@suse.com>
         <b39259fc7f397b27f4af145eeafb33ec36638660.camel@infinera.com>
         <a3f4a9bbde9efd2827b2a02c46f86c8ba7853bc6.camel@infinera.com>
         <1590482853.2838.26.camel@suse.com>
         <8cf71160e703a18b28d27a844406d42f6cadf39b.camel@infinera.com>
         <1590488084.2838.34.camel@suse.com>
         <42c92312c74e90e5507de4103bd15bbbe175f98d.camel@infinera.com>
         <4c2bd25aa7f6672cb132487f7af6a787ffc1fab6.camel@infinera.com>
         <1590568683.2838.42.camel@suse.com>
         <f4a809ba4ca132266e476ca1805e4ff9e5663f9f.camel@infinera.com>
         <1590576068.2838.56.camel@suse.com>
         <c2c3eed27aa13f981690779aca00c420ce0beb06.camel@infinera.com>
         <d7f2750db8c2616fb74fc2e7ea006354e546c7fc.camel@infinera.com>
         <9971e8a97ea0f9d63864829fd8f2f4db897fc131.camel@infinera.com>
         <1591607631.24937.3.camel@suse.com>
In-Reply-To: <1591607631.24937.3.camel@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.36.3 
authentication-results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=infinera.com;
x-originating-ip: [88.131.87.201]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0b978668-482c-430c-bfef-08d80ba09bd7
x-ms-traffictypediagnostic: BN8PR10MB3265:
x-microsoft-antispam-prvs: <BN8PR10MB3265A840110A394213FA6B3DF4850@BN8PR10MB3265.namprd10.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 042857DBB5
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Xl89fxTSnjnGPmV94rTu0l2bTbl0WEuewmUA38APKNaEykDexdjFVIRSE5k5NreKwpXnP5eWOlfQWspeTvP/uhp039xttYvKv9ZxVhCw5OGxq8GkitIoTA/HUVjLpZvXnov5kTJB8MKN7ummfF3ZEZz4SPLEdHj0ppUtLWr8lPsq+RPnYwEAmUTOP2gRc0LRs9cqZAlgQg5M8KVUZmCoPvbuCEVRVpFQN+l0hspqFwGI5bu2uKmUb3VPn8eOqKvgIN7aZm+YBe+HhrZYH0ig3G1jxK8vjqz1KO72Rvx0ahW6ninJ+NcTdNcp6uYwyRqDjz9Be8dMi6ZdKrB/8ov+7w==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN8PR10MB3540.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(39860400002)(366004)(136003)(346002)(396003)(376002)(186003)(8676002)(6512007)(6506007)(26005)(110136005)(8936002)(2616005)(316002)(478600001)(66556008)(6486002)(86362001)(91956017)(76116006)(66946007)(66476007)(71200400001)(4744005)(5660300002)(2906002)(36756003)(66446008)(64756008);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: WY7Fj64Bl9b6Dmj5/Qu8PDGgo110AghU2KzMduPFzrw4qEJWBO7Wm87ikRb2dkPkN3bsB0Of5ZpZd8drM52K2gBYR7sevT/uverqhM/pe+Nn1QqYz3pnWcIokVtl53hx0n7TrFUzaPz/iCwJvSPCNPb8c+rfVbKB3n5nrf8QcAxglgthx+mcZFPsWLeZ7DGaGu215SZALscyjn3RC+9IxPVJWYmAizwFOF+ENBRFMrHitCVVyyM1s22I2uC3UmS2SbF6TPLoQQcmewzO7EmjP3bPO7+b0E8xTAMGTmNUHpzO9lzOOYhLJ6V7ZOuXnSz3neea5fNuYYisbu+Op+hRcUX0VldSzRQwu5QuULf818cX1WmxJjUVUvhUHwxDoP+Z2Fh8UI9q5UkbP7Oz++V6RlrPrSAXWV6m2zB76UF/U8e7Hud2M+bFMuEU+p+SDAbgaXRmclXWsyBx6qroxfdgxjdZobSj+rH9VVKM0an2lik=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <440D385C3B5AE2439E58A06E42345AB7@namprd10.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: infinera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b978668-482c-430c-bfef-08d80ba09bd7
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jun 2020 11:39:30.7707
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 285643de-5f5b-4b03-a153-0ae2dc8aaf77
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9+HWk4aCarUXgmd2KK2dgnbJ2kpkkHO/9yg7dQ9QQrsxxTvNtnmucbixkGn+crqL9lowsMhyz05IH+8ZmJKa9g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR10MB3265
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

T24gTW9uLCAyMDIwLTA2LTA4IGF0IDExOjEzICswMjAwLCBPbGl2ZXIgTmV1a3VtIHdyb3RlOg0K
PiANCj4gQW0gRnJlaXRhZywgZGVuIDA1LjA2LjIwMjAsIDEwOjA5ICswMDAwIHNjaHJpZWIgSm9h
a2ltIFRqZXJubHVuZDoNCj4gDQo+ID4gSSBjYW4gc2VlIHRoYXQgd2hlbiBJIG9wZW4gdGhlIHR0
eSwgYSBVU0IgcmVhZCBpcyBwZXJmb3JtZWQgYW5kIHRoZW4gZWNob2VkIGJhY2suDQo+ID4gU2hv
dWxkIGFuIG9wZW4gcmVhbGx5IGRvIHRoYXQ/DQo+IA0KPiBZZXMuIFRoZSB0dHkgaW50ZXJmYWNl
IGRvZXMgbm90IHBhc3MgcmVhZCgyKSBkb3duIHRvIHRoZSBkcml2ZXIuDQo+IA0KPiA+IElmIHNv
LCBhbiBmbGFnIHRvIG9wZW4oMiksIHRlbGxpbmcgaXQgdG8gZHJvcCB0aGUgaW5wdXQgYnVmZmVy
IHdvdWxkIGJlIHJlYWxseSBoYW5keS4NCj4gDQo+IFRoYXQgYWN0dWFsbHkgbG9va3MgbGlrZSBh
biB1bmF2b2lkYWJsZSByYWNlIGNvbmRpdGlvbiB0byBtZS4NCj4gSG93IHdvdWxkIHlvdSB0ZWxs
IHRoZSBkaWZmZXJlbmNlIGJldHdlZW4gb2xkIGRhdGEgYW5kIG5ld2x5DQo+IGFycml2aW5nIGRh
dGE/DQoNCk1vc3QgdGVybWluYWwgcHJvZ3JhbXMgSSB1c2UgdHJpZXMgdG8gZW1wdHkgdGhlIHJl
YWQgcXVldWUgYWZ0ZXIgb3BlbiwganVzdCB0byBhdm9pZA0Kb2xkIGdhcmJhZ2Ugc8OlIEkgZG9u
J3Qgc2VlIGEgcHJvYmxlbSBoZXJlLiBJdCBpdCB1cCB0byB0aGUgdGVybWluYWwgYXBwLg0KTWF5
YmUgb25lIGNvdWxkIHVzZSBPX0RJUkVDVCBmb3IgdGhpcyBwdXJwb3NlID8NCg0KICAgSm9ja2UN
Cg==
