Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D094B472AB8
	for <lists+linux-usb@lfdr.de>; Mon, 13 Dec 2021 11:58:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232022AbhLMK6Q (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 13 Dec 2021 05:58:16 -0500
Received: from smtprelay-out1.synopsys.com ([149.117.73.133]:34934 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229866AbhLMK6P (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 13 Dec 2021 05:58:15 -0500
Received: from mailhost.synopsys.com (badc-mailhost1.synopsys.com [10.192.0.17])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id BE68441C3F;
        Mon, 13 Dec 2021 10:58:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1639393094; bh=5lAe4yGYGax8o0BN2aTxVfrXSH+/Khh9yCQ570CxA0M=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=HfqoGl5DMnoQvjfpe1dVfJufgSXBPYjJ7nol0iau2tF64yPgqrYBAr+4AfLm0AfMv
         /iHon+9pMBvVOuzhZkxDc7p8AHN6QITN0OaacCfwNF40KGLaA0M3yxEpeVKCzpwzgp
         dp+oGuIyQpG5xw10FQKFzC0RMX4laTAszpjnGTLPQfUcONGUUO66b4vzbYuDofFHW1
         7RU3io7E7dIO06amoKbl4YbR1aQ4zLXiXkZE2A/957n94rWk0XyCfTaO48H1YKH7G1
         RH0oZc0Yd2iEKLsDR1Eir+4SX2693sOHnTOVS/VnLl6Qp2Akl549eeElHzvK5gcpXQ
         mRInQrHF5Csxg==
Received: from o365relay-in.synopsys.com (us03-o365relay1.synopsys.com [10.4.161.137])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (verified OK))
        by mailhost.synopsys.com (Postfix) with ESMTPS id 29267A0071;
        Mon, 13 Dec 2021 10:58:13 +0000 (UTC)
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2176.outbound.protection.outlook.com [104.47.59.176])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
        by o365relay-in.synopsys.com (Postfix) with ESMTPS id A2F308007A;
        Mon, 13 Dec 2021 10:58:13 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=hminas@synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
        dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="GLBXO+zY";
        dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EmXIeRhyuW4U2AqwCSHpF0AAqbdEsrYpm/Cny/M5oKXuV/Km7TA4fwbG6v7jG3lbQGoBkn4engXAtszugogxjO9U4m+yy7dIX97COs5citR+fJ1w0FKhAvczqIApeeIgh4TYvBdCWle/b+LbgT0k33/mYSMj2AZgaBxq/YPntdcJoRqRtMvy1VyMQJ5QUtBaSacvbe+j5GdxGaNjRTSdVLegE6U8oRTjuI7B93aWeumYVdcMGqpaNQQq7zTQZk3qyYhRW5T2n/iYExONOy6J8b/BMNN8NXO8aoZgSzwTT+wZncEnUkEt/zKit7BKuZrQ/xXvs8iBnz9KUJQTQbglig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5lAe4yGYGax8o0BN2aTxVfrXSH+/Khh9yCQ570CxA0M=;
 b=E0D9HjNUldlfRvBqkcv5UOZGt1WE6W3hpfY4vPbyAzt6QVmnznNxzoyoHOel6ZkHhCJ24Xmef4ZNNGXuszZkBYk2EXP1EaZGt1roQDU28W4uUp7u9VLUQC0b9HpA8NE0EshMezd0Y5UimTJJOgC+3HWo1CHIpuP6JOrYORb+PuwByxecU7/y8wetAUEBCkiyAILPa250OqfXu1PHLy3hZGYI6g3I1gtSR0VDbs4T6nevSqTH3mifZa9itjeKHF9vX0l24V6zMwjCkqC+ZhvQ1bgAft6LDMXA/4A+dPOu6PIT8IrJWBnHIymTqXTYU8gCRKtXl8oNWnVXsJj3jHuTBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5lAe4yGYGax8o0BN2aTxVfrXSH+/Khh9yCQ570CxA0M=;
 b=GLBXO+zYMoCjce962rHR9Jco5Hgzpe6Kd7b0zqQhQ6JmzmTpFDosSbjwhXGwEXqEMSoTPlo+hM4VB2cwgX5DT+KAb+0nbnYYMCctN0OttaHe8+Szjc9LsDQfJg9j/jf9NMc6RIweu7x8fFPtJ2WkSwa9iilvcZgzKz8o7ZP26bo=
Received: from DM6PR12MB3419.namprd12.prod.outlook.com (2603:10b6:5:3c::32) by
 DM5PR12MB1691.namprd12.prod.outlook.com (2603:10b6:4:8::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4778.17; Mon, 13 Dec 2021 10:58:11 +0000
Received: from DM6PR12MB3419.namprd12.prod.outlook.com
 ([fe80::bc96:b3ed:1aa5:57b6]) by DM6PR12MB3419.namprd12.prod.outlook.com
 ([fe80::bc96:b3ed:1aa5:57b6%7]) with mapi id 15.20.4778.017; Mon, 13 Dec 2021
 10:58:11 +0000
X-SNPS-Relay: synopsys.com
From:   Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>
To:     Pavel Hofman <pavel.hofman@ivitera.com>,
        Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>
CC:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: usb: dwc2: Detecting cable disconnection in OTG mode?
Thread-Topic: usb: dwc2: Detecting cable disconnection in OTG mode?
Thread-Index: AQHX7nVKrmA9DuVb002cjzuCK2YFPawtDqwAgAHR/wCAAWMMAA==
Date:   Mon, 13 Dec 2021 10:58:10 +0000
Message-ID: <5aada8e3-f385-0589-8d58-187abd1a924d@synopsys.com>
References: <7cce9f05-d659-1fe8-2862-aeca75693808@ivitera.com>
 <ace0e7e0-bf55-e2e4-a17f-c411de8a5266@ivitera.com>
 <897c79d2-eb88-01f5-95b6-67d5ab12954d@ivitera.com>
In-Reply-To: <897c79d2-eb88-01f5-95b6-67d5ab12954d@ivitera.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=synopsys.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b7223fe8-7b64-4bac-a5b7-08d9be27742b
x-ms-traffictypediagnostic: DM5PR12MB1691:EE_
x-microsoft-antispam-prvs: <DM5PR12MB1691F4A322D3BADC5BDD046FA7749@DM5PR12MB1691.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: X+5/dqeehi1PkN3eP/BZiWNIsXdhm9O2tCGb/m3T7ofknj0n4yy8nxFfCn31JGPN/q2OTNlHJanTFLSgKc0eVbwDyWE7LVuvfeuBeAPaayTulcgtPHfvYvUh+W0iaXzvm6KJ7Bh02VJe6//Jr7IX2SA+6U9BMcZUiP8V2P2YtffWYkrSRtRMwBfcc/MkOXoTHNnIMFMmZVLdbECr/oDckhpnmVGNaocy/r8ZPrVt+BAj9Ql2CWd7D+W2rmXFcyzlvIXQvoOS6+XCOt9U2rpYU98UAHv9QIFvAeU1HZQh8itpRgB8e6Qazprd2EUoDt2Fn9RsuH+cFX4+Gt3QHf3Jn/fr/JEuXoH4rqCZH/FPL/zH4HNZmXKDG9QcqU6IGx7CgM81eBsaEWROr25PzuLq8Q125frX8/sygvYurHLWXGFRdhfowRdkIbuWakC/5LHmYsp46wMeCTYKXv9rlAjCqUgVrhOpwx7e9N5XnS6M/1B2ZsVQ/s5hjtaxWwNvSGsBLyW45oGcMIlZqj9RBXJi0th69BX6PzwF/9iWYjw89+mdsz521hBsErbvBP0/nZzopm16cggXZU/5+JoHsHhoCcGLx7aJpf3Qa6ubboUHtU/SD4X4GwMtgQdlrKwZvB9seBYmPsYfeS9dYQspNrdMn8UKZaV84X5/r7ZFBAtojPyEGHD/tXIWxdnIhynKyBNJ3ahBIYLtghl1hVfHgdQ84jgnSh24qoDKUg9vRRv1MQT8gc1RqID00RNrS9rMQzCfTqQRj9xnJFtq7clFln26ET2Fs7l10wIaQYy4lMxgszG6kcZIIacHevzfVboxcbwSLijTjlTfP5C37++H22fCxhEBuHVTL+Iqsa2bUPtR7WxZ1BTH5BgzcB1wdF0gpgYkVbOXu+pjmDNGYn+336BFRQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR12MB3419.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(71200400001)(86362001)(4326008)(6486002)(31696002)(508600001)(2906002)(36756003)(83380400001)(31686004)(53546011)(66476007)(66556008)(66446008)(38100700002)(5660300002)(26005)(64756008)(966005)(8676002)(316002)(186003)(38070700005)(110136005)(66946007)(2616005)(6512007)(76116006)(91956017)(6506007)(8936002)(122000001)(43740500002)(45980500001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZWVmeTBzUEx6a1g2RGVYQ29RRXMyamNDbG1PSzdQQXhrZzhGUU5DV3owd093?=
 =?utf-8?B?aWRYMW9BNUZ1dm56VGx3dUdsMXdIbUc1ays3T0ttWkMxc2ZxUmdNNUFpY3Zw?=
 =?utf-8?B?ekp0S0pDNGJBcjRJZkpVQjZOZXRXUzJabDRVREFKMXgwZjh3bDRrWEd3Mm4x?=
 =?utf-8?B?NUdORWU0VTVSYkVXRE85dDRoZ3FQUURqenZpNko3bVJNSDZmWW1UZEgrMjdj?=
 =?utf-8?B?bGZqSEgxYjdma0x0ZEpCZ0MrOEhkMmtWUnovUllzT1kzMTdtTGc3ZFdsRXRG?=
 =?utf-8?B?YUs4V0RVUEZZRUxmYUVXc1J3N2syNUMxTDE2bUcyRmszK29reTQzc2c1Q2ty?=
 =?utf-8?B?NUlVVlJKSysybjJ3VUFOSVBDM2tvaTRtempjdTJ3N1h6NnllRmlFNEN2YmtV?=
 =?utf-8?B?V2RVeEtraHlkWW84N3RjZThpa3NNa3JXbEVQdXUyaS9VNlpKYnE4ZUNmM0RU?=
 =?utf-8?B?MlJiY1Y2MlFIWWVTWWIxcFBGWVNFU0hlcDhxNTBRSTR1VUs1bVFNSm1CRnpU?=
 =?utf-8?B?TGNqVWtqWGxBeGwyV1ZxV01UTUh4NzJQQURDdVA5UmVFb2h0K2VvUTVRUms0?=
 =?utf-8?B?MVhHc04xdU1HRUdkU3FjSllTY3hwcWxodU1adEZiUExrL0JFVTc3NmpXNldF?=
 =?utf-8?B?MDVocHpOeXFLVHNpejFVUW1qa0RBWVk4eTRGWFhiTG1PTmVjQ0lLRW5JbGVy?=
 =?utf-8?B?NXNPd3JMUjVLS2s2RVB3TEdoZWF1dEVtYkFjS285VjV4ZUYrUGtURlFMblBa?=
 =?utf-8?B?Yi9wRjM4TWllK0xnakh4NlQ2aWE1YkE0YXRaSy80WGQ0c3o0Zk55dHVTTWF5?=
 =?utf-8?B?MllvRWxsL2xrc0h6NVBDNlBVWUhBb20xWklEbGN3QmhBQlh1WWZwR2g0WVJQ?=
 =?utf-8?B?Ulh0eldqS09CQmxzK3VNVG9zZzNSTjNERkIyL0lyME5ZV2crSnRTOFNUWDdj?=
 =?utf-8?B?a0JjRWZqSWtlN2xKV1MwTktGMWovbS9wcFoyY3VnS09wSDNuNVNuRmhHMjBk?=
 =?utf-8?B?dml4NzF1SGdlaTZCN0krMyt6ZWcwVUV0aE5VcHUxWVVFSDFhSjNVeU9uT0VD?=
 =?utf-8?B?WGI1NWJ5VUJtWVNXTDBUeVI0RzJNUk1JTkx6R0xuS1JhLzN6K0pEbC9wK3J6?=
 =?utf-8?B?VmFJNjU5cE5oQ3g2ZUNlaDRtWjY0dzRzODVrWHRVbDFTam9iRXRWSk84RDdh?=
 =?utf-8?B?R254ZTFtdDJjZkNHYlZzOW9uYmZsUWVlQjlUQWRtQmlsczkyNEN2TDAzbWpz?=
 =?utf-8?B?UGNZSUU2bTBOMWRXTEJVZFBJeTNFTk9SYU1veVl5enFLd1NDUlcwZWZXZE5p?=
 =?utf-8?B?ekJjQ3RsSXpMVW4zTWxna3MvSUpqTnZRNjltK1lMaU5qVWxpWTl0cllibDlH?=
 =?utf-8?B?a211eDJSRnprakFuY051dWQxTmtIbGc4blpJNmo5KzRZbWYyalE4anRjRTYv?=
 =?utf-8?B?ZHVPVzdHQWJxVmZxNzd2VU4vTDE2WHFuS3dyclBtN3RKMGVPRUV3aFB3MnFx?=
 =?utf-8?B?WWQ5OEFUOHh2dWZTRWQrSkZlRW4yVDJJUXNjTmVDSHVraDhFZVNuY3Nqall5?=
 =?utf-8?B?aHNJbjEzOU1teTMyUktIQzVFMkpiamVLOFhOV0hHQ05oZXVwdVJXbkJybDVp?=
 =?utf-8?B?M2ZyVGk4SDgzZ0tmSW5za0NZRm9tZ1JCZ21PQ2pEZDdES2dRU2VVdTJqSnZT?=
 =?utf-8?B?NE5uUmNhQzN2V0tmSTBROXR2WXhzS0orSXNGMDdTdTZhbEd6dWx6RHIzUWsx?=
 =?utf-8?B?N3g4T3Z3azVXM1dUNFBBVkRDN2RidDJ4VWttSVFCZjg0TEhHQjJ1bVJrZGk2?=
 =?utf-8?B?Rmg3QlpJdThjSkZmeUdQVkFKL1JJOTRUbGxEb1VJWXpYWEU3ZVVCODkyY2xs?=
 =?utf-8?B?SHBmUDhQd0V2RUg2UGt2NDYyazRVS0pBZnNrZkkzSVNzZVhTTE95MkJsbnRR?=
 =?utf-8?B?VGdWSG4vTkRMWG5VT3JhUzJ3Q2NQUzJBZ29iSFVSdUVVUGxycjhJaVFNa1Ni?=
 =?utf-8?B?eHgwQ25TTFBKVG9hakY1MkZGOHREbWQwOFVPbVl4OTFxRlhIU0NoUGZGUUdM?=
 =?utf-8?B?ZXBRMFpHMDQ4RkpBM3Z2U3ZSRTVMQnl5N2pkVms1Y2Rkd1I1YmM0Tk1nK3Fq?=
 =?utf-8?B?aEhvN1Q1c2hheHVLRGNnNkF0ZC95akhsYmgzTnNOMXM5US9TanhuOTZ3N1Z5?=
 =?utf-8?B?MUE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <F8C722BA4CDF5F40A53EA81D70EBFC38@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3419.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b7223fe8-7b64-4bac-a5b7-08d9be27742b
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Dec 2021 10:58:10.8567
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nrErbJzAu3wNlF3han8hDz52JqtzTzFCW3B6xp4PMh9VpL3BYxydG2uFGbzBsR0bUg07rZogFzPaFJqKi54ELg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1691
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

SGkgUGF2ZWwsDQoNCk9uIDEyLzEyLzIwMjEgNTo0NyBQTSwgUGF2ZWwgSG9mbWFuIHdyb3RlOg0K
PiBEbmUgMTEuIDEyLiAyMSB2IDEwOjU5IFBhdmVsIEhvZm1hbiBuYXBzYWwoYSk6DQo+PiBEbmUg
MTEuIDEyLiAyMSB2IDEwOjU1IFBhdmVsIEhvZm1hbiBuYXBzYWwoYSk6DQo+Pj4gSGkgTWluYXMs
DQo+Pj4NCj4+PiBJIGFtIHRyeWluZyB0byBmaW5kIGlmIGR3YzIgaW4gT1RHIG1vZGUgY2FuIHBh
c3MgaW5mb3JtYXRpb24gdG8gDQo+Pj4gZ2FkZ2V0IGZ1bmN0aW9ucyB0aGF0IHRoZSBob3N0IGhh
cyBiZWVuIGRpc2Nvbm5lY3RlZC4gSSBhbSB0ZXN0aW5nIG9uIA0KPj4+IFJQaTQuIEluIGEgZGF0
YXNoZWV0IGZvciBhIGRpZmZlcmVudCBkd2MyIGltcGxlbWVudGF0aW9uIA0KPj4+IGh0dHBzOi8v
dXJsZGVmZW5zZS5jb20vdjMvX19odHRwczovL3d3dy5tb3VzZXIuY24vZGF0YXNoZWV0LzIvMTk2
L0luZmluZW9uLXhtYzQ1MDBfcm1fdjEuNl8yMDE2LVVNLXYwMV8wNi1FTi01OTgxNTcucGRmX187
ISFBNEYyUjlHX3BnIU1FSHRXQllMTkZtcmNxcmdXRlZQRUJUQ2dPOHVjMC1Dc2VrZzFxazZXa2lT
RXF6b0drV0g4T01vOWFadGdSSkd1Z2trYzZLcSQgDQo+Pj4gLSBjaGFwdGVyICIxNi44LjMgRGV2
aWNlIERpc2Nvbm5lY3Rpb24iIEkgZm91bmQ6DQo+Pj4NCj4+Pg0KPj4+ID09PT09PT09PT09DQo+
Pj4gVGhlIGRldmljZSBzZXNzaW9uIGVuZHMgd2hlbiB0aGUgVVNCIGNhYmxlIGlzIGRpc2Nvbm5l
Y3RlZCBvciBpZiB0aGUgDQo+Pj4gVkJVUyBpcyBzd2l0Y2hlZCBvZmYgYnkgdGhlIGhvc3QuDQo+
Pj4gVGhlIGRldmljZSBkaXNjb25uZWN0IGZsb3cgaXMgYXMgZm9sbG93czoNCj4+Pg0KPj4+IDEu
IFdoZW4gdGhlIFVTQiBjYWJsZSBpcyB1bnBsdWdnZWQgb3Igd2hlbiB0aGUgVkJVUyBpcyBzd2l0
Y2hlZCBvZmYgDQo+Pj4gYnkgdGhlIGhvc3QsIHRoZSBkZXZpY2UgY29yZSB0cmlnZ2VycyBHSU5U
U1RTLk9UR0ludCBbYml0IDJdIA0KPj4+IGludGVycnVwdCBiaXQNCj4+PiA9PT09PT09PT09PT0N
Cj4+Pg0KPj4+IEkgcHV0IGEgcHJpbnRrIHRvIGNvcmVfaW50ci5jOmR3YzJfaGFuZGxlX290Z19p
bnRyKCkgd2hpY2ggaXMgY2FsbGVkIA0KPj4+IG9ubHkgZnJvbSBoYW5kbGluZyB0aGUgT1RHSW50
IGludGVycnVwdCANCj4+PiBodHRwczovL3VybGRlZmVuc2UuY29tL3YzL19faHR0cHM6Ly9lbGl4
aXIuYm9vdGxpbi5jb20vbGludXgvdjUuMS45L3NvdXJjZS9kcml2ZXJzL3VzYi9kd2MyL2NvcmVf
aW50ci5jKkw4MDNfXztJdyEhQTRGMlI5R19wZyFNRUh0V0JZTE5GbXJjcXJnV0ZWUEVCVENnTzh1
YzAtQ3Nla2cxcWs2V2tpU0Vxem9Ha1dIOE9NbzlhWnRnUkpHdW1rSUM1RUEkIA0KPj4+IC4gQnV0
IHRoaXMgbWV0aG9kIGlzIG5vdCBjYWxsZWQgYXQgYWxsIHdoZW4gZGlzY29ubmVjdGluZyB0aGUg
VVNCIA0KPj4+IGNhYmxlIG9uIFJQaTQgaW4gZ2FkZ2V0IG1vZGUuDQo+Pj4NCj4+DQo+PiBUbyBh
ZGQsIHRoZSBtZXRob2QgZHdjMl9oc290Z19kaXNjb25uZWN0IGlzIGNhbGxlZCwgYnV0IGFmdGVy
IA0KPj4gcmVjb25uZWN0aW5nIHRoZSBjYWJsZSwgYXMgcGFydCBvZiB0aGUgZ2FkZ2V0IHJlc2V0
wqAgd2hlbiBoYW5kbGluZyANCj4+IHJlc2V0IGludGVycnVwdHMgKGdpbnRzdHMgJiAoR0lOVFNU
U19VU0JSU1QgfCBHSU5UU1RTX1JFU0VUREVUKSkgaGVyZSANCj4+IGh0dHBzOi8vdXJsZGVmZW5z
ZS5jb20vdjMvX19odHRwczovL2VsaXhpci5ib290bGluLmNvbS9saW51eC92NS4xLjkvc291cmNl
L2RyaXZlcnMvdXNiL2R3YzIvZ2FkZ2V0LmMqTDM2NTNfXztJdyEhQTRGMlI5R19wZyFNRUh0V0JZ
TE5GbXJjcXJnV0ZWUEVCVENnTzh1YzAtQ3Nla2cxcWs2V2tpU0Vxem9Ha1dIOE9NbzlhWnRnUkpH
dWdnN3dibUskIA0KPj4NCj4gDQo+IA0KPiBNYXliZSB0aGUgcmVhc29uIGZvciB0aGUgT1RHSW50
IG5vdCBiZWluZyB0aHJvd24gYXQgY2FibGUgZGlzY29ubmVjdCBpcyANCj4gdGhlIGZhY3QgdGhh
dCBSUGk0IG1vc3QgbGlrZWx5IGRvZXMgbm90IGhhbmRsZSBVU0JfT1RHX0lEIHNpZ25hbC4gSSAN
Cj4gYXNrZWQgYWJvdXQgVVNCX09UR19JRCB3aXJpbmcgb24gUlBpNCBhdCB0aGVpciBmb3J1bS4N
Cj4gDQo+IE5ldmVydGhlbGVzcyBpdCB0dXJucyBvdXQgdGhhdCBEV0MyIHRocm93cyBTdXNwZW5k
IGludGVycnVwdCANCj4gR0lOVFNUU19VU0JTVVNQICgxMSkgYXQgY2FibGUgZGlzY29ubmVjdGlv
biBvbiB0aGUgUlBpNCwgYW5kIHRoZSBnYWRnZXQgDQo+IGNvbXBvc2l0ZSBkcml2ZXIgY2FsbHMg
c3VzcGVuZCBob29rIG9mIHN0cnVjdCB1c2JfZnVuY3Rpb24uIEkgd29uZGVyIGlmIA0KPiBpbXBs
ZW1lbnRpbmcgdGhlIHN1c3BlbmQgaGFuZGxlciB3b3VsZCBiZSBhIHNvbHV0aW9uIGZvciBvdGhl
ciBkd2MyIA0KPiBpbXBsZW1lbnRhdGlvbnMsIG9yIGlmIHRoZSBhdWRpbyBmdW5jdGlvbiBzaG91
bGQgaW1wbGVtZW50IGFsc28gc29tZSANCj4gb3RoZXIgaGFuZGxlciBpbiBvcmRlciB0byBjb3Jy
ZWN0bHkgc2VydmUgdGhlIGNhYmxlIGRpc2Nvbm5lY3Rpb24gZm9yIA0KPiBhbGwgZHdjMiBpbXBs
ZW1lbnRhdGlvbnMuDQo+IA0KPiBUaGFua3MgYSBsb3QsDQo+IA0KPiBQYXZlbC4NCj4gDQo+IA0K
PiANCkRpc2Nvbm5lY3QgZXZlbnQgb24gZGlmZmVyZW50IHBsYXRmb3JtIGJlaGF2ZSBkaWZmZXJl
bnRseS4gSXQncyBkZXBlbmQgDQpvbiBwbGF0Zm9ybSBkZXNpZ24sIFBIWSwgZXRjLiBZZXMsIEdJ
TlRTVFNfVVNCU1VTUCAoMTEpIGF0IGNhYmxlIA0KZGlzY29ubmVjdGlvbiBjYW4gYmUgdXNlZCB0
byBkZXRlY3QgZGlzY29ubmVjdCBldmVudC4NCg0KVGhhbmtzLA0KTWluYXMNCg0KDQo=
