Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1A981472610
	for <lists+linux-usb@lfdr.de>; Mon, 13 Dec 2021 10:51:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235902AbhLMJsz (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 13 Dec 2021 04:48:55 -0500
Received: from smtprelay-out1.synopsys.com ([149.117.87.133]:44924 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S236615AbhLMJrU (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 13 Dec 2021 04:47:20 -0500
Received: from mailhost.synopsys.com (us03-mailhost2.synopsys.com [10.4.17.18])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 39045C1821;
        Mon, 13 Dec 2021 09:47:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1639388839; bh=CrnZyK99rI3TJCMgEsOksJBfJhID8j+Nk5s1BEtDGog=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=SzEXngx5DJCqQT8D0zxdA0FaW0XZiiLMIc24JKRA4iEaTTt7Ib7oRfTo2LH2GlIGx
         jaI73y3kWMQd2gBn1idA8hMgUSpoqNS6nitD3naM+QalhgXMKko6CtbKhpwr2cKx2D
         oJs0hE+zi8HB1l4pP8Y1l7RhxjZVKvzOYkT+Yu4ciw68SCK3UCQ6l5HvPOLTG91mM/
         1XUo1kkNBVFH7F6Dn39EODc6MloeRDr78YwW7QqCzz/I3gjIhNUm62/2fFCTK2tgNF
         DbX6omexcXRj7nPf5T3XbchkWLMVOZ2BlKoTOW9erP9HGEoTp5ufS/XbHg90QiWtkc
         pnyNvdh0rUs/w==
Received: from o365relay-in.synopsys.com (us03-o365relay1.synopsys.com [10.4.161.137])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (verified OK))
        by mailhost.synopsys.com (Postfix) with ESMTPS id BDC32A00A0;
        Mon, 13 Dec 2021 09:47:18 +0000 (UTC)
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (mail-dm6nam08lp2040.outbound.protection.outlook.com [104.47.73.40])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
        by o365relay-in.synopsys.com (Postfix) with ESMTPS id 1541D8007A;
        Mon, 13 Dec 2021 09:47:17 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=hminas@synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
        dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="ZxpmLvfh";
        dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WkS4xxCLBUd3h6hIRhiw9Fv6PSmEzsOAAzKXn5gaVgY/EV7SPTU3V/X4bSXwOqoJZx1tIO8g+aevg8U1fqpkSKz7Cvst2PKsyM5RM1haxMSnYZtVgNDNcEvovv/vjXxyziS9/eDweocvcdiC1asQ4mMSrrR4LPhfPGwU+Pq0fis2UUf0HwADXsYHUR3UNnqU2u/+U5YYBfzzPp8i/9Hb9lyzvkjHXjxWN6y222VVc6QJF0kC3SLvjPqDgyb1oC2Tea1Ovz8lK9ucplgJX60v42+uKlgkwJvwkhRChhrnMXRZ9EzEZSHVW8EjJP5Wt8g6Wk2j+LKgwkfUs/tvX/29aA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CrnZyK99rI3TJCMgEsOksJBfJhID8j+Nk5s1BEtDGog=;
 b=NggR+hFFnmd7e+vI8ydQ/Ea4zn343jX3bFwI/4Som27TP5ZMqn7bp4Pei7pNnmCoxfXWGDBnz8NH+cVbS+i6EdLKGuGKIuWucRIVXA6Ue3MhcK2OSw/2ybNMPEx62iKk5Sh4QdcGFkqImBxIGORFcWJoY9QT8n5Cr+QH8digyqEbYtcoQe9gXwWZ6kpYvv9dRpynuMwyoOBO7vjIXRLHe5MXivVXFb1TZYdwsT3e3MKRlzEXFlY15nopTCZIGCzLnUTL7UmYHePiklFOab+154d6G6g52qH9aJa2FgcxxILBCUefi3VxJie+9AAHOZ0in7hyg1xzdSxBsHqSDt67PA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CrnZyK99rI3TJCMgEsOksJBfJhID8j+Nk5s1BEtDGog=;
 b=ZxpmLvfhr1hNLKPC9ii7WgSsAfWiMwnHTK9+R4jE+vnri6JW1MHwBE5bfOXIxlfXzwaqqLPGBVhHJ8dGR0Yzt463jiOvgF4rZEhyALi1bEFKiyd/KuuNiMbTGw5CKBBbP/CLjzL0K2MYOus6vKaUlfDqMJ9qO+KC2IPO57Sj53o=
Received: from DM6PR12MB3419.namprd12.prod.outlook.com (2603:10b6:5:3c::32) by
 DM5PR1201MB0170.namprd12.prod.outlook.com (2603:10b6:4:59::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4778.16; Mon, 13 Dec 2021 09:47:13 +0000
Received: from DM6PR12MB3419.namprd12.prod.outlook.com
 ([fe80::bc96:b3ed:1aa5:57b6]) by DM6PR12MB3419.namprd12.prod.outlook.com
 ([fe80::bc96:b3ed:1aa5:57b6%7]) with mapi id 15.20.4778.017; Mon, 13 Dec 2021
 09:47:13 +0000
X-SNPS-Relay: synopsys.com
From:   Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>
To:     Dinh Nguyen <dinguyen@kernel.org>,
        Artur Petrosyan <Arthur.Petrosyan@synopsys.com>
CC:     "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: usb: dwc2: USB on Agilex platform broken after commit
 50fb0c128b6e
Thread-Topic: usb: dwc2: USB on Agilex platform broken after commit
 50fb0c128b6e
Thread-Index: AQHX7HzbUwJuJBhmmke0DEbt7fTUCKwwM9QA
Date:   Mon, 13 Dec 2021 09:47:13 +0000
Message-ID: <5e8cbce0-3260-2971-484f-fc73a3b2bd28@synopsys.com>
References: <81f48bdb-c97b-2f7c-293e-941ec44ee941@kernel.org>
In-Reply-To: <81f48bdb-c97b-2f7c-293e-941ec44ee941@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=synopsys.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9f33b2e7-14f8-48d7-0a55-08d9be1d8a85
x-ms-traffictypediagnostic: DM5PR1201MB0170:EE_
x-microsoft-antispam-prvs: <DM5PR1201MB01708CDA1FCDCCEF69FDF2D4A7749@DM5PR1201MB0170.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1091;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: VqmmzeYv+OgJcVywByZDg7w/2zb7J85nrNsKM1PtWj0mZOPWqEjqZv2sA2+NAQ1I9jjwqV136iR3skKj+mmF3m+v2dxXopOJx4WbKfOdeWgbQ1rsv0PUTMY9YPXbDXo6MVihkyf7MPvp7/e6JHf2G4Ayd5rqDgTROckkDZdbAD51/5kzOAEXI9298gTfLdyBtUZQPLgZA+9OsEHzta+MvnA4KJG9wwnWoo4lbGFF4sWICMaeb8SnFhD0GvMHEEuV0Z6T4n9+i5rXVQzCOb24Kiv6Ks9OQRSI+Onkac66ScjYCUCqg//PrZE4g/PPW9yyjIyvBOSts32+MqteR5X5GsRy2MQJwV/5tvc02nPA1M+lPt+ZjCcomSw5/aWvO9RQxWS7iGWE8ZzASMqPOveMB5r+O0gBtRMGbhvd2D/yvIl7cydORI4MeItpUTUyzgumBjtWkuHe5sP9ypRRdeCy7kkOD1m8vPNhivw+PQCPrnlPix5fAvnGIPXUmUOtBwR9S+9R0+Ajm0hz/1dPcKKsZni7XcCpzI02c2BmImrroN/EgxOcAARwmZhTgmlX9JW5zV6VgmuWHmGSUHTx2rdO5IDU3MzuCF0hKWHxp+8EzHd1rku0F1h13D+kjjbkAr/5gq+3Oj4SWJg1giKD/Phdq1AjUaLR3Z7+fFIee7AQv4/3buqXSsgaN8+SMJYhx9yHQnzLvGayod4O0B2vTL9euZ0AEDm77tRc+AR8A6HIbhvjgPyIdPa8LPXvHAhaiJtGFVkm3OCG1gvpVbg5V/tQrHWn4O08jWh0IFGV/ZM3/Wwyg8YvtMQKQTdt7Fc/aa6J2M5+1ce5UYGTRjtGoEGYbs87g+9iFeTeV64l9hKdwZs3hT7eT6YwrxBkHMl43qf+
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR12MB3419.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(38100700002)(122000001)(186003)(110136005)(2616005)(6512007)(54906003)(36756003)(508600001)(83380400001)(316002)(6636002)(66556008)(2906002)(8676002)(31696002)(91956017)(71200400001)(53546011)(64756008)(26005)(6506007)(31686004)(86362001)(66446008)(6486002)(66476007)(8936002)(4326008)(38070700005)(5660300002)(76116006)(66946007)(98903001)(45980500001)(43740500002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TUFtZ3hQVzBnK1Z0Q3FRbXoxZkVTQWFTeVBWM2lWZWliK1k2dy9vTGROWVNz?=
 =?utf-8?B?ZWVKa0s4MFlzemtaMnJCNjlKREMzYzQwZWRxdmVTcGUyT041VzUwY1RVMDZD?=
 =?utf-8?B?WEQ2UEg0S2hicUx5RjhCeEg0T09qNTNuQ29rWGhHRnR6NlR0NmxhRjhLV01W?=
 =?utf-8?B?aDMrQ2tiU3FJZzM3Vmc5SnU2NUxrV2NGT0JGUkdiWGhKajdoMUgwTDl4a2x1?=
 =?utf-8?B?WHlUQ0VrZkdnVFA3V2h4NTdBWVpOMUhVNlBZZlVISGlvV0sxMTFZZlhvMXFz?=
 =?utf-8?B?SHkwQ2tpWmpkNnBrcFIxRkViUmpZL2dsUVRtN2VhUnViQUNQMFdyanNBVFB4?=
 =?utf-8?B?Vkk4WU4yckdKRTBqRldPdzdKTzhwV0JtbHFmYk5LeDhXeE0vNDNRNVByQzND?=
 =?utf-8?B?bzUxOEUzODk4V0tqaEFiRENuYWhNMWdXWHFjSHBKYWNTMFR6VGFQNVlwMmtS?=
 =?utf-8?B?Wi9Fd3V2bnhLZSs4eGRjSmFzSDVLWXFCTjAzYWhIUi9PZHlLYkdZaFcrMzJj?=
 =?utf-8?B?MDFLUERUeXpweWxBRjh4MkpUQlhSWkhYTHVGdytQNG9IZW9VUFVwZzJwenhS?=
 =?utf-8?B?L2lMNHdZWisxRGlpQjZhenlRa2ZVTVlqcXpMNnB2U0VyWVR0NWt2NHZuVnEw?=
 =?utf-8?B?TkNuWCtpVmpCai83Y2s5MWpOR2E5U2p3bmZqam1UZlBEZjlXdEdrR0dhNmx6?=
 =?utf-8?B?NmxGSVgxR3RGYTFlUzFJcHVmK1psRHphL2psOG5teTBYdzlJcUhxKzVSR0pR?=
 =?utf-8?B?bitKaVJIY2RlVEQ0ZUF4a1BYZ1k4ZHExbjFLT010Um9xQ2pJUzhUQ25JbFRZ?=
 =?utf-8?B?ZEdzWnhRclUxaEVNM1JyenBXbi9MeUhNaHJOa1VmdUZHZmV0RjdLUFRVSW5p?=
 =?utf-8?B?cHo4eHhXWW01VUZDVWRhKzl2NDliaTU0VGkxV3dGWXczN29FT0UvMDgvK05l?=
 =?utf-8?B?RTZMbzZILzhZbGpuS09HSGVFYWpBV2sxWnpPdDRLbG9QUVBLRmxUTXRIQUFP?=
 =?utf-8?B?MDNuQjJ2TTlERkxVdlllbno1aldYSFFOVWhucFZPeHVjam12dTFUY05ieDJj?=
 =?utf-8?B?bkwyZGZnUXdUbTdDVmhHeWZjZERsQVA2VjRNSE5uTHdXVFNrRkh4TEpWbVVs?=
 =?utf-8?B?SjVxZ2tXYnZZaG5PVEkyWWRvMkszTks1TEtzcmVKSC83bWhBalF1S0RGTGdo?=
 =?utf-8?B?VVdkVkRZS1YrOHRnS2hDZ3BnWXQ2VUhjaTVyQ1N0TGRCdGlyNGQ3cU9Nc1pm?=
 =?utf-8?B?Y1FPcHRnank5N1owWTJZN0VkY3JVc3MzOFpNZXAvY2lQSmpjVVVGcFlmdTRP?=
 =?utf-8?B?dFV3RUJUdG9pN2JJaUROZStjdmFSNzVBdUxWYVlGclhLbjJtNEhRU1VlU1Uv?=
 =?utf-8?B?ZDVCTzVsTnVNS1RHdGFDRC9leHFsQU9OMjZTVkhZYTc3M0Y5djh1QkQ5S2ow?=
 =?utf-8?B?VnR0aDR0YkduaFdpTFFXWWdBRzRucDVNSWFMcUpoTmUwejlRdkt1V1FWK3Rm?=
 =?utf-8?B?amlXK0dKaFAwK2NMcHl6L1VNZFFPYWZQcGRqL0J2d25qNUo3NmQvTG1jRUM5?=
 =?utf-8?B?NW5TMWVBMXFHUmVKbFFocnYzaVdhL2Y4dnh4NThTK0dFTS84clk3N1VBZE9J?=
 =?utf-8?B?ODNFMzhQQW1BNjArQVdyOGtrdERMZ1FVYVJGM0RzWWtNQ1JBbTFzTWNNSjQ5?=
 =?utf-8?B?b3hMd2RhMGpZOU1Zako4YW1uRWlVR2t0d1ZXcGdSUnFyNjFvMG43WGszSlF5?=
 =?utf-8?B?NkhMd1BDbmdVckRDbkp6end4eER3M3BKeGlTOVloVFVtZFpuWTNjb2pTQlA4?=
 =?utf-8?B?cnZVd1BYWXJBRlpJYnVNdDZIdHlsYm9aSklRR3JpeHphRld0RG1SL2JxdmNn?=
 =?utf-8?B?U0s1YWxESVdTNjhrcTYxbVRFWUp5b0t3VDJkSlZSM2ZYLzYrUURGY0JWc3Js?=
 =?utf-8?B?ZENsS1cxSll0OC95ZWFzbURydmQ0S0p5Y2lGd2V5WVlZSWxidWQrRTVOQkYy?=
 =?utf-8?B?anNwK3RRV1FUaXpZZE1uVnZpTGZEdVhtRFNQQlhKcWFpdmVWQ2RJQitmZGpu?=
 =?utf-8?B?eEpocXloUHRZSDFpdGxxejNkRnpLU3BqVFdYMXlzcldPa3dqdzJ6RUVyZnRr?=
 =?utf-8?B?c1dqK2dBQ2ZDeTRIVS9PNENlMlFwQ0V6aUJ1R01uVnk0YndxT09rNTBqQzFJ?=
 =?utf-8?B?WWc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <439D0759F60F5E4690DE922191E988B4@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3419.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f33b2e7-14f8-48d7-0a55-08d9be1d8a85
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Dec 2021 09:47:13.3751
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kd272CZisC9K38dLcmAEb3QjNuAP0I5JTfJD+g+luHp90hvxz5NfN0KV9q/wNYryIJNJ8DRJ0ZZMPvvN/1zo8Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR1201MB0170
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

SGkgRGluaCwNCg0KT24gMTIvOS8yMDIxIDE6NDQgQU0sIERpbmggTmd1eWVuIHdyb3RlOg0KPiBI
aSBBcnRodXIsDQo+IA0KPiBUaGUgdXNiIGRyaXZlciBpcyBnZXR0aW5nIHRoaXMgZXJyb3I6DQo+
IA0KPiBbICAgIDEuNTM5ODU2XSBIYXJkd2FyZSBuYW1lOiBTb0NGUEdBIEFnaWxleCBTb0NESyAo
RFQpDQo+IFsgICAgMS41NDQ3OTldIENhbGwgdHJhY2U6DQo+IFsgICAgMS41NDcyMzNdICBkdW1w
X2JhY2t0cmFjZSsweDAvMHgxYzANCj4gWyAgICAxLjU1MDg5N10gIHNob3dfc3RhY2srMHgxOC8w
eDY4DQo+IFsgICAgMS41NTQyMDJdICBkdW1wX3N0YWNrKzB4ZDgvMHgxMzQNCj4gWyAgICAxLjU1
NzU5N10gIF9fcmVwb3J0X2JhZF9pcnErMHgzOC8weGYwDQo+IFsgICAgMS41NjE0MjNdICBub3Rl
X2ludGVycnVwdCsweDMxYy8weDNlOA0KPiBbICAgIDEuNTY1MjQ0XSAgaGFuZGxlX2lycV9ldmVu
dF9wZXJjcHUrMHg2MC8weDkwDQo+IFsgICAgMS41Njk2NzFdICBoYW5kbGVfaXJxX2V2ZW50KzB4
NDgvMHhlMA0KPiBbICAgIDEuNTczNDkxXSAgaGFuZGxlX2Zhc3Rlb2lfaXJxKzB4YjAvMHgxMzgN
Cj4gWyAgICAxLjU3NzU3NF0gIGdlbmVyaWNfaGFuZGxlX2lycSsweDMwLzB4NDgNCj4gWyAgICAx
LjU4MTU2N10gIF9faGFuZGxlX2RvbWFpbl9pcnErMHg2MC8weGI4DQo+IFsgICAgMS41ODU2NDZd
ICBnaWNfaGFuZGxlX2lycSsweGI0LzB4ZDANCj4gWyAgICAxLjU4OTMwMF0gIGVsMV9pcnErMHhi
OC8weDE1MA0KPiBbICAgIDEuNTkyNDI4XSAgYXJjaF9jcHVfaWRsZSsweDE4LzB4MjgNCj4gWyAg
ICAxLjU5NTk5Ml0gIGRlZmF1bHRfaWRsZV9jYWxsKzB4MjQvMHg1Yw0KPiBbICAgIDEuNTk5ODk5
XSAgZG9faWRsZSsweDFmNC8weDI5MA0KPiBbICAgIDEuNjAzMTE4XSAgY3B1X3N0YXJ0dXBfZW50
cnkrMHgyOC8weDY4DQo+IFsgICAgMS42MDcwMjZdICByZXN0X2luaXQrMHhkOC8weGU4DQo+IFsg
ICAgMS42MTAyNDJdICBhcmNoX2NhbGxfcmVzdF9pbml0KzB4MTAvMHgxYw0KPiBbICAgIDEuNjE0
MzI5XSAgc3RhcnRfa2VybmVsKzB4NTBjLzB4NTQ0DQo+IFsgICAgMS42MTc5ODBdIGhhbmRsZXJz
Og0KPiBbICAgIDEuNjIwMjQxXSBbPDAwMDAwMDAwYWU2MDFhYWM+XSBkd2MyX2hhbmRsZV9jb21t
b25faW50cg0KPiBbICAgIDEuNjI1NTQxXSBbPDAwMDAwMDAwMjU1ZDc5M2E+XSBkd2MyX2hzb3Rn
X2lycQ0KPiBbICAgIDEuNjMwMDU2XSBbPDAwMDAwMDAwMGJjNjhhYjQ+XSB1c2JfaGNkX2lycQ0K
PiBbICAgIDEuNjM0MzEyXSBEaXNhYmxpbmcgSVJRICMzMw0KPiANCj4gQWZ0ZXIgYSBnaXQtYmlz
ZWN0LCB0aGUgcmVzdWx0IGlzIHRoaXMgY29tbWl0Og0KPiANCj4gDQo+IGNvbW1pdCA1MGZiMGMx
MjhiNmU4ZGY2MjIwMGJhODVjMDVlY2Q2YjEzOTY0NzZkDQo+IEF1dGhvcjogQXJ0dXIgUGV0cm9z
eWFuPEFydGh1ci5QZXRyb3N5YW5Ac3lub3BzeXMuY29tPg0KPiBEYXRlOiAgIFR1ZSBBcHIgMTMg
MTE6Mzc6MTUgMjAyMSArMDQwMA0KPiANCj4gICAgICB1c2I6IGR3YzI6IEFkZCBjbG9jayBnYXRp
bmcgZW50ZXJpbmcgZmxvdyBieSBzeXN0ZW0gc3VzcGVuZA0KPiAgICAgIA0KPiAgICAgIElmIG5v
dCBoaWJlcm5hdGlvbiBub3IgcGFydGlhbCBwb3dlciBkb3duIGFyZSBzdXBwb3J0ZWQsDQo+ICAg
ICAgY2xvY2sgZ2F0aW5nIGlzIHVzZWQgdG8gc2F2ZSBwb3dlci4NCj4gICAgICANCj4gICAgICBB
ZGRzIGEgbmV3IGZsb3cgb2YgZW50ZXJpbmcgY2xvY2sgZ2F0aW5nIHdoZW4gUEMgaXMNCj4gICAg
ICBzdXNwZW5kZWQuDQo+ICAgICAgDQo+ICAgICAgU2lnbmVkLW9mZi1ieTogQXJ0dXIgUGV0cm9z
eWFuPEFydGh1ci5QZXRyb3N5YW5Ac3lub3BzeXMuY29tPg0KPiAgICAgIExpbms6aHR0cHM6Ly9s
b3JlLmtlcm5lbC5vcmcvci8yMDIxMDQxMzA3MzcxNi4zMEMxM0EwMDk0QG1haWxob3N0LnN5bm9w
c3lzLmNvbQ0KPiAgICAgIFNpZ25lZC1vZmYtYnk6IEdyZWcgS3JvYWgtSGFydG1hbjxncmVna2hA
bGludXhmb3VuZGF0aW9uLm9yZz4NCj4gDQo+IFRoZSBEV0MyIFVTQiB2ZXJzaW9uIG9uIHRoZSBB
Z2lsZXggcGxhdGZvcm0gaXMNCj4gMHg0RjU0MzMwQQ0KPiANCkNvdWxkIHlvdSBwbGVhc2UgcHJv
dmlkZSBIVyBjb25maWd1cmF0aW9uIHJlZ2lzdGVycyB2YWx1ZXMgKEdIV0NGRzEtNCkuDQoNClRo
YW5rcywNCk1pbmFzDQoNCj4gRG8geW91IGhhdmUgYSBzdWdnZXN0aW9uIG9uIHBvc3NpYmxlIHNv
bHV0aW9uPw0KPiANCj4gVGhhbmtzLA0KPiBEaW5oDQo+IA0KDQo=
