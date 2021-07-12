Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5AF4A3C49BD
	for <lists+linux-usb@lfdr.de>; Mon, 12 Jul 2021 12:33:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237711AbhGLGq3 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 12 Jul 2021 02:46:29 -0400
Received: from smtprelay-out1.synopsys.com ([149.117.87.133]:54520 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S236163AbhGLGpO (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 12 Jul 2021 02:45:14 -0400
Received: from mailhost.synopsys.com (badc-mailhost3.synopsys.com [10.192.0.81])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 8005BC0519;
        Mon, 12 Jul 2021 06:42:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1626072146; bh=N7wC+DmBmm8EW3+WSv/SWzpwmHo703ERTp50QZrgEwc=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=H3L9a9zvpUdxWCxp2o+o3w6gYe2O4N68HGYmdO0eMCNrLEK0VT+jcupZGJfbb9DYx
         9+3VAAtTy5fniIcimk+hxvVNH+VEARIb5p7PnVKX+jUqbDZC+tRKLBBwxX8RAdo1QJ
         OamBzMRMJ0d7x2rxrKe9xM+Ij+B/wOmtzbFdZl0SqvloWD7FgOdJs+6mHEarQeTnbM
         mqVAjzvAoZit0E9i07ErHNttBDcsPykp7PIeSeq4WA+SUPJRq91qKlYkjQ7M85ImmY
         C7ENM0u1AiLT+Bfc23rxAz60Gji6ztkhXKu7R/btIwZch0goTH8v5fpbbIQYTKiHX8
         orsMTmcYdOVJg==
Received: from o365relay-in.synopsys.com (sv2-o365relay1.synopsys.com [10.202.1.137])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (verified OK))
        by mailhost.synopsys.com (Postfix) with ESMTPS id 00255A0085;
        Mon, 12 Jul 2021 06:42:22 +0000 (UTC)
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2172.outbound.protection.outlook.com [104.47.59.172])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
        by o365relay-in.synopsys.com (Postfix) with ESMTPS id 78EE240099;
        Mon, 12 Jul 2021 06:42:21 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=hminas@synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
        dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="Ev2AxWEZ";
        dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P/McBwouMUPHqQTkZ60bPMx1U31RqEiuNPeEz50HsptPNo+jTKHODz4b12R34ovxNztDFIJhL45v4Ba2UNuRzk41vl3OeUZNCrAUGJtmEM/rmoQ8RUSAlDEwHrFM1Bz54+Qr6d/UVuu8bcUIVWKLRpk2vDx0zu9wSX/J7lLAHYzc8B/37LuNTpGvmoZk5rQS1CW79HiKBS4ESWqtI9A+OsHDQUvOA22UuALzXU9db/GYm9uHQu0vNlIHPLeLWDG3oUzH5Y7hPlEcxnwDNPNJPC48jPVXe827D9P6DMVfopZbKnC3cnLgWrE/3hA9H/ZR+shK7S5dTXB6Xnjkr67vuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N7wC+DmBmm8EW3+WSv/SWzpwmHo703ERTp50QZrgEwc=;
 b=MhL+XAutHeNf2Eg2+Wh6+ZBuavS6y2C7ISwYofKscu6vrkVB4odWwt/RMTcx9C7rXxMBE3R8gWoSXjK6UlBNoPIrHGI1eijCkssTQlgDrj05N8Nvrd00FBhfnS8zIrCxxcQNX0WgKnDWZ+83TDRbrAX1GpoguDVRxnFFsRbyy2bEWON6LorddnvY/oLJPeA4g/prAnPRlxFrwuxJO5exmTqego03SY00Nzs7rfp2VJaLhwJ9uR8g282TJE5FEnCSyYixyVJelmH9Zr3jGpqMbMWsvkyLLKjTtBvFggwRgDXjbFLkBG/0Y5R4kL2Is4JvzjbPCF5mZWg9kBYahwm/Mw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N7wC+DmBmm8EW3+WSv/SWzpwmHo703ERTp50QZrgEwc=;
 b=Ev2AxWEZwxXeH4gJ97QrecYAzLcbI4mnEWuEhrcyaNCRw/fYXd/dudTyJ34gEwrFyeHsfv6lgc2T0Ho2xWXw/nVjM4wTJtb2g0M7QZo/n+ZEbvOwUlf6jvW32yXwZ4uVPBmd7i6Mhdwx1eH35qhSZaQZzV2iJyZxfQz2bbWLC2U=
Received: from DM4PR12MB5390.namprd12.prod.outlook.com (2603:10b6:5:39a::12)
 by DM4PR12MB5373.namprd12.prod.outlook.com (2603:10b6:5:39a::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.21; Mon, 12 Jul
 2021 06:42:19 +0000
Received: from DM4PR12MB5390.namprd12.prod.outlook.com
 ([fe80::d97c:7079:8a93:cd4]) by DM4PR12MB5390.namprd12.prod.outlook.com
 ([fe80::d97c:7079:8a93:cd4%3]) with mapi id 15.20.4308.026; Mon, 12 Jul 2021
 06:42:19 +0000
X-SNPS-Relay: synopsys.com
From:   Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>
To:     Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>
CC:     Alan Stern <stern@rowland.harvard.edu>,
        Matt Corallo <oc2udbzfd@mattcorallo.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-amlogic@lists.infradead.org" 
        <linux-amlogic@lists.infradead.org>,
        "linux.amoon@gmail.com" <linux.amoon@gmail.com>,
        Artur Petrosyan <Arthur.Petrosyan@synopsys.com>
Subject: Re: ODROID-C1/-C2 USB Detection only triggered by some devices dwc2
Thread-Topic: ODROID-C1/-C2 USB Detection only triggered by some devices dwc2
Thread-Index: AQHXdizqoaSvbv4TcUGwLN6CtBbUjas+D7KAgADWEQA=
Date:   Mon, 12 Jul 2021 06:42:19 +0000
Message-ID: <822c3852-1d15-2976-8672-e49ae34c328f@synopsys.com>
References: <0badab7c-f12e-e9ed-2f90-2cf5f25f4038@bluematt.me>
 <20210628005825.GA638648@rowland.harvard.edu>
 <e421818c-dea4-ba6b-e737-bb8d99582588@bluematt.me>
 <20210628011628.GC638648@rowland.harvard.edu>
 <0c62655d-738c-4d71-6b7b-fe7fa90b54e3@bluematt.me>
 <20210628142418.GC656159@rowland.harvard.edu>
 <CAFBinCA9Y16Ej3PEBN1Rsqo=6V1AZXKOpTfc_siHP0rvVo7wWQ@mail.gmail.com>
 <20210629150541.GB699290@rowland.harvard.edu>
 <CAFBinCCOGJfHSSHgRrOO-FQJZAUB=QuMr=BoddPLt19spp0QBg@mail.gmail.com>
 <20210629161807.GB703497@rowland.harvard.edu>
 <CAFBinCDsGtQaPLhMAb+A6DBihWzQiU409i2oer_ud5yQBvfM5w@mail.gmail.com>
 <CAFBinCDc6RUypJpujmYdkjo6j-xsg0HkZEZGxTCsTW4tZ-bJPA@mail.gmail.com>
 <CAFBinCA083iP4T2b1+MoDGZFKMO8eyy-WceRBA-QibatqboO1A@mail.gmail.com>
 <f084f45a-5be0-9542-260a-f4641e1215d0@synopsys.com>
 <CAFBinCCj5zUiv9LS2jKRxzX5pfcFTr4tVZwR7TA2CRQg68qwTw@mail.gmail.com>
In-Reply-To: <CAFBinCCj5zUiv9LS2jKRxzX5pfcFTr4tVZwR7TA2CRQg68qwTw@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
authentication-results: googlemail.com; dkim=none (message not signed)
 header.d=none;googlemail.com; dmarc=none action=none
 header.from=synopsys.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a48f1af6-420a-4521-2eda-08d94500327a
x-ms-traffictypediagnostic: DM4PR12MB5373:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM4PR12MB5373C90D9DFC9D3CD663E10CA7159@DM4PR12MB5373.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: r84ulsw/Oy4SXbMl3t/xEJsaXYrL0X+AaFvz1CReUYHw9KvbP3C6ytx8J7m8nARjcx+yJxXiq+cHtZsOXQR4Y1fJAmXrs5Gb8npfCM9w/huCvopXM4c+x6uDc3ljY5/75oAFY4Db8GHVRePKyuq3BPDe7/vX5EsWuZkGA2FfRjaRAnN/00SnqWfmc+WjBUlJNMIMwvVc1LGM1bIH7TM+lPdDN31ONIDODtk9j8T9MSOjgim+rztQPUrbFZ6M2ETgU4q9I73/8BX4518tvQj5jPuQ1dX1YUS4E2QblVvg1DH2OwJdvExRaeiqtI9PAYqUSF0gLM+BtGXqXOa+3r3mOk31hIXeeAgB+VNqtW4A5kYS3XrYfygaSt5qPvyP+LR1z/yQvTD5oiqSqZJ5g8w8YLzeS5bG6UBgljrVb2ZKYwJ87v1G14XFfULqyIhsRbqq+c3tqfh66dx4zwldsrqvHAPIOeWUjEPcZs5cV9hfdFHyKiUyc4MHh5si4Yx4tXttMEzG61SiLdht3FgdCaW7yrwE60RJpYEMBlXVtKTFKaSqfbw7mNDcKZ/Vc+xoVPEWcMULFSVWF+jOaPVsFJmJP+Tz/kh1zWrg+ZS1BnJ2sBW+UHwwb/BOw1qRbDxadokElTwRe+xG+aLJP3SxbNUpeB+xpee8EEDBb9WK/D6j0ZnIR8vWxD/g3Yeq0axP7W7zWjuPh4hFsdgln19PRMtE+fpGOkpTVbkCkklACps20ww=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB5390.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(396003)(39850400004)(136003)(366004)(376002)(346002)(64756008)(66476007)(186003)(4326008)(76116006)(91956017)(38100700002)(2906002)(5660300002)(45080400002)(6512007)(478600001)(66946007)(53546011)(26005)(6486002)(66556008)(6506007)(107886003)(66446008)(86362001)(71200400001)(83380400001)(31696002)(316002)(2616005)(110136005)(54906003)(36756003)(122000001)(8676002)(8936002)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UGExSjA2S1lZVVMzbDd4VVZlTjFqYk5sVlV2M3dQTEdSUXBsOWppL2NYZWN4?=
 =?utf-8?B?NnoyN0lnQ3dIcnF4djNJTndhZy9BZmVlRXN5alFiQkVyRTJGR2tyR1VnQmR5?=
 =?utf-8?B?WS9vVHg1cTZHNWNkSC9FU3lMd1FFY1V0Q0h5dXZQdEVlUFU2bGo5eDlPYlVi?=
 =?utf-8?B?WHhPYTJZQlZUY0hnZ3VCY1V6bHVnb1VUMTJValA2MUp2TGt1Y2FPb2dvNVM0?=
 =?utf-8?B?T09NUVJsRHpvK3BlYmpJS2s1V3pkZ1BnUnpIWWJMaXpQdWYrclNWVTRDblBu?=
 =?utf-8?B?UFdSbjNCUEtVenlwZU1YNU01V2xUV3EyTzVnZG1IL2Y5NU0zQTlzL0RRU2Zy?=
 =?utf-8?B?bSt4cnVvRnZRcXpqQ3JMVnVUU1hLWkpxM2ZDcHFUMzJSV2g4S25lZWorV09R?=
 =?utf-8?B?dlBjL2Rka3pGWkVRbGszdlNzR0NxRG9vM3Y5czZZTHRRTDhDOUhTR1lnQkJW?=
 =?utf-8?B?WDRicW45aHZFV3lsOEZnWmR0RW44MkJvR1N6TjUybkZ0Y2tKYTlFVUh4WjNB?=
 =?utf-8?B?UlZOdXhsYlRLd0lLelFva29BcTNObVIzUTFIdXY2YzFLUUNsZXNwMUpPZnA1?=
 =?utf-8?B?UTh2VEwyQmErL29zQUNTZnJGZUN5STFBUUUzZFhEdFk4NjVKNlVWek1Xb1kx?=
 =?utf-8?B?VEplcXhSbGVYb3FWYnp0VzI5UjhrQjdxaXpDM0IzOHlsZTY4SEVsRTg0WDk4?=
 =?utf-8?B?WE5ZUkN1UFJ4cHM0VFM1aWxpMTEzM0ZDSW9rN3lGRll4ajh4bnp0NVl1bGNN?=
 =?utf-8?B?bXJMbHAvS0g2MW04L09WTW9ZZHRjWnBLRDg5MUVDZUNFemFZL01WTXNUc1lv?=
 =?utf-8?B?L1Y1N0labmZRYlJqeEVPc1EyWk9jSG50WmlkTURvRVQ2cGdLeStyS2MwRys2?=
 =?utf-8?B?dyttZ1VaRDEzemNoUm9SallUa1pxa1Y2NmNLTGpGVyszSWRhaFRobUd6WC9X?=
 =?utf-8?B?enZFN2R0bnU4UDFSZDNSZk5memF3NDUzQ0hTdVVMTkNIUmpSY3haSE1Dd1dO?=
 =?utf-8?B?OG1uUUNDc1ZPeG9MN2Z5QUUzOHdOSmJPMTl4a2UyTkIveU96Vk9mWjAvK1cr?=
 =?utf-8?B?ZUhWeGNUMHIyZnZPM3dtUERQbnp0ODFFckM3R2hvV1NBK0FPdjJ0RHFiSTA0?=
 =?utf-8?B?dnU5UXhFVEVLeXZta2FaTFRCMVd5QXBBYnlXc0RCd3d3QnFXc25zRXFmRTJG?=
 =?utf-8?B?VnhsQ0lpckpUQXB6MFhIZjE3RFlUNDhZSStjMnhDNDhOVWNnU091Q2hCUXcy?=
 =?utf-8?B?RngvTy9WTTFGSmtja2VuZ3FDZFRMdVhmZGdIc1BNNDFvSXlleEZTaU1FMzNj?=
 =?utf-8?B?bEFGQjdlem1TT1l6TDZ6ZnQrcTBwdS85NDMxa2xCem05a2R0bzRlK3VYR0Yv?=
 =?utf-8?B?dWZqc05VbmVvU0VqWk0yMG44TjZzZTU5eWJVTGpwcnFGRkdvQ2tkeHV6VVpY?=
 =?utf-8?B?akEzeUcrSm9GMy91UU53VVNPLzQwWjcrand6R3dFTGhVMUtzMzZpN0M3UXVS?=
 =?utf-8?B?UVZFYmxCYi9QVnMycThkWmNZQnlFaWFFdE1TdFdRRjlHblJuU2FuSnQ3SGJS?=
 =?utf-8?B?UDZyU3lVZUc1Y05xZHlNZWtFTzM3amdqMlRRa0Z1cXFETGNQZzVuM3hCVEJT?=
 =?utf-8?B?RVpBeFF1ZU53MVQzdU5qY3kzVFV2R2NKNEJaamgzMHBjRXVyVUF6cmIwczZM?=
 =?utf-8?B?dUF0QkhPaTRDMm1ETE5OLzFaY0tycUR0NVRMSExzQ2lPVXk4ZlV3MHV0UWRE?=
 =?utf-8?Q?gAoEr/9e3tI2VWo+W4=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <D59D5016237AA740928DBA1470AFEF19@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5390.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a48f1af6-420a-4521-2eda-08d94500327a
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jul 2021 06:42:19.8103
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +u2WjPraRWUPEQzSJYyHLw/987v0vJWKNuUxnAsdPQtM8ULChgVLyDgUg3JHLJX5JcyQ4E15+XPZqqdbLsqb0Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5373
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

SGkgTWFydGluLA0KDQpPbiA3LzExLzIwMjEgOTo1NiBQTSwgTWFydGluIEJsdW1lbnN0aW5nbCB3
cm90ZToNCj4gSGkgTWluYXMsDQo+IA0KPiB0aGFua3MgZm9yIHRha2luZyB0aGUgdGltZSB0byBn
ZXQgYmFjayB0byB1cyENCj4gDQo+IE9uIFN1biwgSnVsIDExLCAyMDIxIGF0IDEwOjE1IEFNIE1p
bmFzIEhhcnV0eXVueWFuDQo+IDxNaW5hcy5IYXJ1dHl1bnlhbkBzeW5vcHN5cy5jb20+IHdyb3Rl
Og0KPj4NCj4+IEhpIE1hcnRpbiwNCj4+DQo+PiBPbiA3LzEwLzIwMjEgOTowNyBQTSwgTWFydGlu
IEJsdW1lbnN0aW5nbCB3cm90ZToNCj4+PiBIaSBNaW5hcywNCj4+Pg0KPj4+IE9uIFRodSwgSnVs
IDEsIDIwMjEgYXQgMTowOSBBTSBNYXJ0aW4gQmx1bWVuc3RpbmdsDQo+Pj4gPG1hcnRpbi5ibHVt
ZW5zdGluZ2xAZ29vZ2xlbWFpbC5jb20+IHdyb3RlOg0KPj4+Pg0KPj4+PiBIaSBNaW5hcywNCj4+
Pj4NCj4+PiBJdCdzIGJlZW4gYSB3ZWVrIHNpbmNlIEkgc2VudCBteSBsYXN0IG1haWwNCj4+PiBJ
biBjYXNlIHlvdSBhcmUgdGFraW5nIHNvbWUgZGF5cyBvZmY6IGVuam95IHRoYXQgdGltZSENCj4+
PiBQbGVhc2UgbGV0IHVzIGtub3cgaWYgeW91IGhhdmUgYW55IHF1ZXN0aW9ucyBhYm91dCB0aGlz
IGFzIHdlJ3JlDQo+Pj4gbG9va2luZyBmb3J3YXJkIHRvIHNvbWUgaGludHMgb24gaG93IHRvIGRl
YnVnIChhbmQgb2YgY291cnNlIGZpeCEpDQo+Pj4gdGhpcy4NCj4+Pg0KPj4gRmlyc3Qgb2YgYWxs
IHNvcnJ5IGZvciBsYXRlIGZlZWRiYWNrLiBJIG1pc3NlZCB0aGlzIGVtYWlsIHRocmVhZCBiZWNh
dXNlDQo+PiBpbiB0aGUgc3ViamVjdCB0aGVyZSBhcmUgbm8gImR3YzIiIGFuZCBteSBPdXRsb29r
IG5vdCBtb3ZlIGl0IHRvICJkd2MyIg0KPj4gZm9sZGVyIG9mIG15IG1haWxib3ggYmFzZWQgb24g
cnVsZXMuIFRvZGF5LCBiZWNhdXNlIG9mIHJlYXIgY291bnQgb2YNCj4+IGVtYWlscyBpbiBsaW51
eC11c2IgSSB3YXMgYWJsZSB0byBjYXRjaCBpdC4NCj4+IEkgaGF2ZSBhZGRlZCAiZHdjMiIgd29y
ZCBpbiBzdWJqZWN0IHRvIGF2b2lkIHRoaXMgc2l0dWF0aW9uIGxhdGVyLg0KPiBVbmRlcnN0b29k
IC0gSSdsbCB0cnkgdG8ga2VlcCB0aGF0IGluIG1pbmQgZm9yIHRoZSBmdXR1cmUuDQo+IA0KPj4g
Q291cGxlIG9mIHF1ZXN0aW9ucyB0byB1bmRlcnN0YW5kIHRoZSBjYXNlLg0KPj4NCj4+IDEuIElz
IGl0IHdvcmsgbm9ybWFsbHkgZWFybGllcj8gSWYgaXQgd2FzIHdvcmtzIGZpbmUgZWFybGllciB0
aGVuIHdoaWNoDQo+PiBLZXJuZWwgdmVyc2lvbiBhbmQgYWZ0ZXIgd2hpY2ggdmVyc2lvbiBicm9r
ZT8NCj4gSSBhbSBub3Qgc3VyZSBpbiB3aGljaCBrZXJuZWwgdmVyc2lvbiBpdCBicm9rZS4NCj4g
Q29tbWl0IGNjMTBjZTBjNTFiMTNkICgidXNiOiBkd2MyOiBkaXNhYmxlIHBvd2VyX2Rvd24gb24g
QW1sb2dpYw0KPiBkZXZpY2VzIikgc3VibWl0dGVkIGJ5IG15c2VsZiBtYWRlIFVTQiBob3RwbHVn
IHdvcmsgKGF0IGxlYXN0IHRoYXQncw0KPiB3aGF0IHRoZSBjb21taXQgbWVzc2FnZSBzYXlzIGFu
ZCB0aGF0J3Mgd2hhdCBJIHJlbWVtYmVyKS4NCj4gSSBoYXZlbid0IGRvbmUgYW55IGdpdCBiaXNl
Y3QgdGhvdWdoIHlldA0KPiANCj4+IDIuIERvIHlvdSBzYXcgaW4gZG1lc2c6DQo+PiBkd2MyX2Nv
cmVfcmVzZXQ6IEhBTkchIFNvZnQgUmVzZXQgdGltZW91dCBHUlNUQ1RMX0NTRlRSU1QNCj4+IElm
IHllcywgdGhlbiBQSFkgbm90IGluaXRpYWxpemVkIGNvcnJlY3RseS4gQ29yZSBjYW4ndCByZXNl
dCBpZiBzb21lDQo+PiBjbG9ja3MgZnJvbSBQSFkgYXJlIG5vdCBhdmFpbGFibGUuDQo+IEkgdGhp
bmsgeW91IHNhdyB0aGlzIGluIEFuYW5kJ3Mga2VybmVsIGxvZyBvdXRwdXQuDQo+IFdlIGNhbWUg
dG8gdGhlIGNvbmNsdXNpb24gdGhhdCBzb21lIG9mIGhpcyBvdXQtb2YtdHJlZSBwYXRjaGVzIGJy
b2tlDQo+IFVTQiBmb3IgaGltLg0KPiANCj4+IDMuIER1cmluZyBvdXIgcmVjZW50IHRlc3Rpbmdz
IHdlIG1ldCB0aGUgaXNzdWUgd2l0aCBQSFkgZHJpdmVyLiBBcnR1cg0KPj4gZm91bmQgYSBidWcg
aW4gcGh5X2dlbmVyaWMgZHJpdmVyIGFuZCBzdWJtaXR0ZWQgcGF0Y2ggb24gSnVseSAxMDoNCj4+
IFtQQVRDSCB2Ml0gdXNiOiBwaHk6IEZpeCBwYWdlIGZhdWx0IGZyb20gdXNiX3BoeV91ZXZlbnQN
Cj4+IEluIHlvdXIgY2FzZSwgYXMgSSB1bmRlcnN0YW5kIGNvcnJlY3RseSwgdXNlZA0KPj4gZHJp
dmVycy9waHkvYW1sb2dpYy9waHktbWVzb244Yi11c2IyLmMuIENvdWxkIHlvdSBwbGVhc2UgY2hl
Y2sgaWYgc2FtZQ0KPj4gaXNzdWUgZXhpc3QgdGhlcmUuDQo+IHBoeS1tZXNvbjhiLXVzYjIuYyB1
c2VzIHRoZSBnZW5lcmljIFBIWSBmcmFtZXdvcmsgKGZyb20gZHJpdmVycy9waHkpDQo+IGluc3Rl
YWQgb2YgdGhlIFVTQiBQSFkgZnJhbWV3b3JrIChmcm9tIGRyaXZlcnMvdXNiL3BoeSkuDQo+IFRo
ZSBnZW5lcmljIFBIWSBmcmFtZXdvcmsgZG9lcyBub3QgaGF2ZSBhbnkgZXZlbnQgc3VwcG9ydC4N
Cj4gSSBhbSBhbHNvIG5vdCBzZWVpbmcgYW55IGtlcm5lbCBCVUcgb3IgV0FSTiBpbiBkbWVzZy4g
U28gbXkgY29uY2x1c2lvbg0KPiBpcyB0aGF0IHRoZSBwaHktbWVzb244Yi11c2IyLmMgZHJpdmVy
IGlzIG5vdCBhZmZlY3RlZCBieSB0aGUgc2FtZQ0KPiBpc3N1ZS4NCj4gDQo+PiA0LiBDYW4geW91
IHByb3ZpZGUgZnVsbCBkZWJ1ZyBsb2cgZm9yIGZhaWxlZCBjYXNlPw0KPiBzdXJlLCBpbiBteSBr
ZXJuZWwgY29uZmlnIEkgbm93IGhhdmU6DQo+IENPTkZJR19VU0JfRFdDMl9EVUFMX1JPTEU9eQ0K
PiBDT05GSUdfVVNCX0RXQzJfREVCVUc9eQ0KPiAjIENPTkZJR19VU0JfRFdDMl9WRVJCT1NFIGlz
IG5vdCBzZXQNCj4gIyBDT05GSUdfVVNCX0RXQzJfVFJBQ0tfTUlTU0VEX1NPRlMgaXMgbm90IHNl
dA0KPiBDT05GSUdfVVNCX0RXQzJfREVCVUdfUEVSSU9ESUM9eQ0KPiANCj4gV2l0aCB0aGF0LCBo
ZXJlJ3MgdGhlIG91dHB1dCBJIGdldCAoaW5jbHVkaW5nIGxzdXNiIC10KToNCj4gMS4gYm9vdGlu
ZyBteSBPZHJvaWQtQzEgd2l0aCBubyBleHRlcm5hbCBVU0IgZGV2aWNlIHBsdWdnZWQgaW4gKHRo
ZQ0KPiBVU0IgaHViIHlvdSBzZWUgaW4gdGhlIGxzdXNiIG91dHB1dCBpcyBzb2xkZXJlZCBkb3du
IG9uIHRoZSBQQ0IsIHNvDQo+IGl0J3MgImFsd2F5cyB0aGVyZSIpDQo+IDIuIHBsdWdnaW5nIGlu
IGEgQ29yc2FpciBWb3lhZ2VyIFVTQiAzLjAgZmxhc2ggZHJpdmUgKG5vdGhpbmcNCj4gYXV0b21h
dGljYWxseSBoYXBwZW5lZCksIHRoZW4gcnVubmluZyBsc3VzYiAtdnYgYW5kIGxzdXNiIC10DQo+
IDMuIHVucGx1Z2dpbmcgdGhlIENvcnNhaXIgVm95YWdlciBhbmQgcGx1Z2dpbmcgaW4gYSBVU0Ig
My4wIGNhcmQNCj4gcmVhZGVyIChub3RoaW5nIGF1dG9tYXRpY2FsbHkgaGFwcGVuZWQpLCB0aGVu
IHJ1bm5pbmcgbHN1c2IgLXZ2IGFuZA0KPiBsc3VzYiAtdA0KQ291bGQgeW91IHBsZWFzZSBzZXQg
dmVyYm9zZSBkZWJ1Z2dpbmc6DQpDT05GSUdfVVNCX0RXQzJfVkVSQk9TRT15DQoNCmFuZCByZXBl
YXQgdGVzdCAzLiBUaGVyZSBhcmUgY291cGxlIG9mIHRyYW5zYWN0aW9uIGVycm9ycyBhbmQgc29t
ZSBFUCANCnN0YWxsZWQuIEkgd2FudCB0byB1bmRlcnN0YW5kIG9uIHdoaWNoIGRldmljZS9lcCB0
aGlzIGhhcHBlbi4NCg0KVGhhbmssDQpNaW5hcw0KDQo+IDQuIHJlYm9vdCwga2VlcGluZyB0aGUg
VVNCIDMuMCBjYXJkIHJlYWRlciBwbHVnZ2VkIGluIGR1cmluZyBib290DQo+IA0KPiBsc3VzYiAt
dnYgaXMgbmVlZGVkIHRvIG1ha2UgbmV3bHkgcGx1Z2dlZCBpbiBkZXZpY2VzIHNob3cgdXAgYWZ0
ZXIgYm9vdC4NCj4gVGhpcyB3b3JrcyBmaW5lIHdpdGggYSBmZXcgY2hlYXAgVVNCIDIuMCBmbGFz
aCBkcml2ZXMgYW5kIGFuIFVTQiAzLjANCj4gY2FyZCByZWFkZXIgdGhhdCBJIGhhdmUuDQo+IEhv
d2V2ZXIsIHdpdGggYSBDb3JzYWlyIFZveWFnZXIgVVNCIDMuMCBmbGFzaCBkcml2ZSB0aGlzIGRv
ZXNuJ3Qgd29yaywNCj4gSSBjYW5ub3Qgc2VlIHRoYXQgb24gdGhlIGJ1cyBhdCBhbGwuDQo+IA0K
PiBUaGVyZSdzIGFsc28gYSBmaWZ0aCBjYXNlIGZvciB3aGljaCBJIGhhdmUgbm90IGF0dGFjaGVk
IGFueSBsb2dzIChidXQNCj4gSSBjYW4gZG8gc28gaWYgcmVxdWlyZWQpOg0KPiBJZiBJIGhhdmUg
Zm9yIGV4YW1wbGUgdGhlIFVTQiAzLjAgY2FyZCByZWFkZXIgb3IgYSBjaGVhcCBVU0IgMi4wIGZs
YXNoDQo+IGRyaXZlIHBsdWdnZWQgaW4gZHVyaW5nIGJvb3QgdGhlbiBVU0IgaG90cGx1ZyBpcyB3
b3JraW5nLg0KPiBFdmVuIHRoZSBDb3JzYWlyIFZveWFnZXIgVVNCIDMuMCBmbGFzaCBkcml2ZSBp
cyBkZXRlY3RlZC4NCj4gDQo+IFBsZWFzZSBub3RlIHRoYXQgbG9nZmlsZSAyIGFuZCAzIGNvbnRh
aW4gc29tZSAib3ZlcmxhcCIgd2l0aCB0aGUNCj4gcHJldmlvdXMgbG9nIGluIHRoZSBkbWVzZyBv
dXRwdXQuDQo+IEZvciBleGFtcGxlOiB0aGUgZmlyc3QgdHdvIGxpbmVzIGluIHRoZSAiZG1lc2cg
fCB0YWlsICAtbjEzIiBvdXRwdXQgaW4NCj4gbG9nZmlsZSAyIGFyZSBmcm9tIHRoZSBmaXJzdCBs
b2dmaWxlLg0KPiBJIGRpZCB0aGlzIHRvIHNob3cgdGhhdCBJIGRpZG4ndCBvbWl0IGFueXRoaW5n
IGJ5IGFjY2lkZW50Lg0KPiANCj4+IDUuIEkgd291bGQgcHJlZmVycmVkIHRvIHNlZSBvdXRwdXQg
b2YgJ2xzdXNiIC10JyBmb3IgcGFzcyBhbmQgZmFpbCBjYXNlcy4NCj4gSSBpbmNsdWRlZCB0aGF0
IG91dHB1dCBpbiBhbGwgYXR0YWNoZWQgbG9ncw0KPiANCj4gSWYgeW91IG5lZWQgYW55IGFkZGl0
aW9uYWwgaW5mbywgbG9ncywgZXRjLiB0aGVuIHBsZWFzZSBkb24ndCBoZXNpdGF0ZSB0byBhc2sh
DQo+IA0KPiANCj4gQmVzdCByZWdhcmRzLA0KPiBNYXJ0aW4NCj4gDQoNCg==
