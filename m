Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 270553E87F5
	for <lists+linux-usb@lfdr.de>; Wed, 11 Aug 2021 04:20:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231533AbhHKCVL (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 10 Aug 2021 22:21:11 -0400
Received: from smtprelay-out1.synopsys.com ([149.117.87.133]:47906 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230099AbhHKCVK (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 10 Aug 2021 22:21:10 -0400
Received: from mailhost.synopsys.com (sv2-mailhost2.synopsys.com [10.205.2.134])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 5AE7CC1043;
        Wed, 11 Aug 2021 02:20:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1628648447; bh=fJ/KIogOMNvaFOdnv1P8vBgISLABxHAK3NwFfQKpYf4=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=ZZ9BJsv5tjFKQVVvRKdRgFl8+Cky/MOj5rd0JN6mYKkaaL1+aEr7teBUbhaXXk9ZJ
         VSnMhkG6FSUecnjTcMfcBNe0++bZeE0MpXk6ekQWz3W+2U6KIwaddBuFVYE9s09Buk
         iZQS1Z390VWeopBlChXKeWZ61kZMf0NL3/6UDx4zxOE29tvVy025KRqhs0oX0zSBGU
         3bKreAT0tnMiCuLK0o2cX6tO8cJIfpiaW9B9NOtzmjXG9M1TKiq+3P14ZZvVxmUttj
         q1XSM+kiGv/+RdXEtGgnxsIRZ3/ucOwMhnOTpMQSj1fXOMTirULNXhrlRCw73U3XBh
         QmEIw7mY+lGmQ==
Received: from o365relay-in.synopsys.com (us03-o365relay3.synopsys.com [10.4.161.139])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (verified OK))
        by mailhost.synopsys.com (Postfix) with ESMTPS id E40DFA00A8;
        Wed, 11 Aug 2021 02:20:46 +0000 (UTC)
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2172.outbound.protection.outlook.com [104.47.59.172])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
        by o365relay-in.synopsys.com (Postfix) with ESMTPS id 418E7800C0;
        Wed, 11 Aug 2021 02:20:46 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=thinhn@synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
        dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="gx9hUMsp";
        dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZBtz1YWixmnF/y1F69RyDCgasOoSqHdKyKbmx9LS6KxwhuHSo3JBgLynb5KtiLaa+5tF+MbD5jaIergydjKor6eLnCct53BUoGNaj02Gid5Qf0GtcPpGf0i8xIThD0PAT0IzylwTh7xdvN+mfHymxB2R3mXmqkhOPH9Gy5WOouyYn4tKUquE6DWQifVpoJ5eBIxPKLW3LEKrVxz3SSO+CsJgsA2dOINUZ/p3dsaKUJtoQm3B1bXkssq18eQSOB36wM1vnabdN337JOcwxGpY3SdGSF9n19bGzJImshCEYnXp9g/fDJu2dFT2OuePjSaVKWpUssetqasREyGnZAJyHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fJ/KIogOMNvaFOdnv1P8vBgISLABxHAK3NwFfQKpYf4=;
 b=Om/4Bd03XlesiZc/evA/tloKiUxdAfd0CgpnrPhlpsEnW4A5bR2GR/qFPnSXRdPK/pseENiZfGsIqhxbGseVQNk2hJS5khwYQjLlLr91ewqJBKVAfz4q2Q0nczG/6bG8vni+ZtxfBxm4UblpLzx/YkVmfNqWJMXPUrcEHuIWCX40tyC3y2s8oFYVE3VM1z2EVeZPntY2nblDJp1YM4vof4zq+2HFAbgNJUlZrk6Hl/qX/2G3f+SJezyow2soimwtsDGoYPctkD+a+Fqszo9rWVsRdHu5Ca9SoyKMr6JYZO6N2IgGqZ0+/P3874GyK1ouifDYMKgtNzZfpoqvPyJddA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fJ/KIogOMNvaFOdnv1P8vBgISLABxHAK3NwFfQKpYf4=;
 b=gx9hUMspyMN5IHVRt5kfyguUwylkDFXXXnTAEUNYpC9ODTHS+g+zRd0IxZjtyFZoLoXmGtkSRdmpQIiL9YxCvQ40rXM2w9YYk5E4HCCvH0nl9NZH8pVWGUAvuevxiiPf4FLEItdGLfPTnsXIe/1hCwGS4TgSNikkyk4uEFTFCrc=
Received: from BYAPR12MB4791.namprd12.prod.outlook.com (2603:10b6:a03:10a::12)
 by BYAPR12MB3590.namprd12.prod.outlook.com (2603:10b6:a03:ae::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.22; Wed, 11 Aug
 2021 02:20:44 +0000
Received: from BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::163:f142:621e:3db9]) by BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::163:f142:621e:3db9%7]) with mapi id 15.20.4415.014; Wed, 11 Aug 2021
 02:20:44 +0000
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To:     Alan Stern <stern@rowland.harvard.edu>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>
CC:     Felipe Balbi <balbi@kernel.org>, USB <linux-usb@vger.kernel.org>
Subject: Re: dwc3 spin_lock_irq flags
Thread-Topic: dwc3 spin_lock_irq flags
Thread-Index: AQHXjjR1NephQujOSESUPURlgcQtrKttiksAgAAIRIA=
Date:   Wed, 11 Aug 2021 02:20:43 +0000
Message-ID: <93a5cfe3-70a5-ae83-d00e-a77342a567be@synopsys.com>
References: <a034f2ef-c2a3-962e-d72b-0db6a34e67a2@synopsys.com>
 <20210811015108.GA618534@rowland.harvard.edu>
In-Reply-To: <20210811015108.GA618534@rowland.harvard.edu>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
authentication-results: rowland.harvard.edu; dkim=none (message not signed)
 header.d=none;rowland.harvard.edu; dmarc=none action=none
 header.from=synopsys.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a39815ba-4f4f-4346-850e-08d95c6e9f78
x-ms-traffictypediagnostic: BYAPR12MB3590:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR12MB35904FAA8F217D3C964C9997AAF89@BYAPR12MB3590.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 2OSyHL8LVXrM2skwSK2J/6xkitNz64AV3zz1xwBaFGQaDQimnC4LNYONPDgghAewAhot/1BvPmB0U085+FM5zEydbO3U9YAiCripa1p1CW2Uqp/M9pQbGDu5Ks4eXcYEs12qUro2AF9T0lCWBYPBCnfZCO/FqpngzS7b4Gr/Uq9fEvdKJKmkpcuoSqFG63rExvkq6JbFdoFmBfGf/jKcqzYSzmVADYJUE84r4XQHGOUDQhxIjsubISymH6dRixp2ORameMEFPARARoBUFS8airvKhgtkE9SaDcZl5417e5rixFyu8Dbnr4V4g2HPNv+xVBu8hbMc9yzbiMctI59g7AD/7RHS44D8JOBC+y7Y2/jzpQPEkBSUFWD49SvvIMxYjCMqglZUPxRkggm9IVeFHe+CWmBT9z7EQNMJtd0u2Pg7xC9pFWyj0i969jdup8LHBmBxEjcoqQFR15ozjMX/PN/uIMYJRVI0ywWMp/DlbZnNojsD5oC8YnICYv+yUHwpEzKpZmXpBtVOXQ+Zz8nYV1axKFyNRh8oM0/gcSlgdKleXa4cf8vcJRjF8fidq5FxyHnWAEaguyDUKGZE/ON7sTg3Lyku6YSvgXTxnuDt+axPfk3nsBZuLEH1LVDjN4bTlvhNsiSoaFxswgZzLFkeQ0G6gnCqLFDp8na5Nb4TRgAjWmnN5wCxpwqM3C740qyP7ypzTZ4LeS5SLjoIDxxFBcYUf3KfbK12/NeJQ8d+icGg+prtFM4YVz/WabDkMBVF36OU6/2RlltWP62Xfxfbtg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB4791.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(39860400002)(136003)(396003)(346002)(376002)(71200400001)(6486002)(5660300002)(31686004)(316002)(38100700002)(31696002)(4326008)(38070700005)(86362001)(36756003)(122000001)(8936002)(64756008)(2616005)(76116006)(83380400001)(66476007)(66446008)(2906002)(6506007)(8676002)(66946007)(66556008)(6512007)(54906003)(7116003)(26005)(186003)(478600001)(110136005)(45980500001)(43740500002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SUcweEFjQnJrcE1jaG1UZG9jYkpkcklraFBUenlSZVlKWGFBd0tXZjRNK0Zt?=
 =?utf-8?B?UTBHQmZZODlna2VXNzR5QngrMHZYOUh0MnNORzYzNTNUeklIbmErVzBXV3ov?=
 =?utf-8?B?ZStuR0xWbXRlNW1sR1k0NnN3d0M2YXF6M1R4VDZMZEVpL2NVNHU0ek1xaWZP?=
 =?utf-8?B?ZXVYNW5SUlQ5V3RGU05EOVJSdlhZakNwTUhpYnF5Nk1MbnJOamxndlUzQWV6?=
 =?utf-8?B?cTVVSlBYZnlDdWo2enQ2N0dqTFY1MjRURU9mOUl2MlZxQi8xcTVhRzBzMUtO?=
 =?utf-8?B?WXdWRXdRTGNaV2psUkR2MERWWUtOVmxCNWw2UHFMVjM2bW5PR29KUEo5Tmd1?=
 =?utf-8?B?bEtTd2lIL2JpdEYzOEMzUnY4UlZQZGh4SEVVNDlXWkplSWNGODBONXY0dGpC?=
 =?utf-8?B?MHlkL2lzVlQ1UWpTMG95ODdtQ0JqRnlYUzdSYTBISnczcFUwdWZoVVVqMUkv?=
 =?utf-8?B?eDQzNDlTaEpseVZFdGNWVlVzd3drOW9ycWUwNHBkWVpUS2JOQ3VCQ0xKRUlp?=
 =?utf-8?B?NldWQ3RMZkVpTVpFZnRudEk1blExdXNlbm93WWJzNGdwQzVQb05JM3NvT1VB?=
 =?utf-8?B?SUVXV3pBSjJnSGtpcEtwR2thWndjdU5TbkwyOS9jUW5HSUpLYTY4RUUzeUVp?=
 =?utf-8?B?Vk4yN1dhTDJ2NlZqc2VzVy93UHV1aTVaa3JWb3Z4T2NEcVFNaTA3Tzkxa2p1?=
 =?utf-8?B?MnNFQUhvUC9LQ2oyYUdFZVR1RTJ4SGx4U3FhRWVmK3dKdkdOaElidzJzMm83?=
 =?utf-8?B?MnBOYWVVOWVIM1Q1S0Nob1BmMm00bGxCbDNnUElxS01xUWh0T1BaU2x5U1VY?=
 =?utf-8?B?MStBNENObFhuNnR4UzIvOHNodWdoTDZjb1dQTjBqcWh4N3R3VDVRR0JJMWxF?=
 =?utf-8?B?V0NmU2c5K1hBYzk4NDhPcDBMZ2Z3YW9xSDYyS1pScTZ6V0xTcENTWGVXZFg2?=
 =?utf-8?B?ZmtUb3pRSmR2Sk5aaFZCNW0rV1lyUGtWU1Fpa2pDRzZCZkxSbmFFSWVYSnVV?=
 =?utf-8?B?ME11aU5oNmFwdXB4OEk1MDA0STdtaWNhTTBPaC9PZDJnSS9MZk93ZWw5Ri96?=
 =?utf-8?B?cnpnR0czQ0NXRHdKRE5tVVpwUHVLQ1ZTVCtLN3hGTDJia0NvMHhMaE92OWZ0?=
 =?utf-8?B?aDEzRFZXRjByd01OaGtKcFZkRVl0eUEwRTJ6MzMweFM3OUNmaXg0V1RZWnpN?=
 =?utf-8?B?QUUrTkJ1dHZNWGx1Q1lIZFN1Sk9Bbm1hc2g4Y2NQUmQ3dFR6L0hvdzFlN0pU?=
 =?utf-8?B?UDlDNXF1c3ZwQUQ3L3hqR0tyS2ZUT09hVFRsREJvS1N5UjVwZjREdElUbi9G?=
 =?utf-8?B?WjBCUGpJNmo5cGtVM2s0cUxsSkZKS0N3YWJMNUtFazBLRUhjSzkzbm83TkUz?=
 =?utf-8?B?S3NHYTJXNlpFY3dFNlNmbFZlSE1qQ0drdnlnY2xCeStUS0FBVzVwUjFyVllr?=
 =?utf-8?B?TXkvMWpyTFFic1VZYmxhZCtwZTJpMktUVWwyeWFTc2JnWFJpUXpLTUhNT3hQ?=
 =?utf-8?B?ckZUd2xCMDB2K0VLelJLU0VNMk12d2RvTElPUytraGZWSG94VjR2eGZ3aVZw?=
 =?utf-8?B?aWF0bFFqSTRHZkNTQ3FGQzhEY2RReXdGWDJwSnVZWFNpanR3dGFMcFhPVG5T?=
 =?utf-8?B?UExxT281dFZZY1JEQzdSUWhuMXU0Z3FaSHVhN0V0WlJNMXhaNWtFNTFhYTRR?=
 =?utf-8?B?elYyWklSTmdmK0RUblNGL2RuVkdaNGdoV3NleVJmTkdEUFN5NGVrOFRGYU5H?=
 =?utf-8?Q?PuGmnFXh7v34mAQnhs=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <D22CC70BF200B54BAB9974ABE62F270D@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB4791.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a39815ba-4f4f-4346-850e-08d95c6e9f78
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Aug 2021 02:20:43.9220
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Vce9n10017oBVYHASCAIIsiqhLS9BWq/juqFljdQ5o3LpK8GxGAO/tp1ugnNRDwbCCiO95OZ65KQEe8ha713sw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3590
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

QWxhbiBTdGVybiB3cm90ZToNCj4gT24gVHVlLCBBdWcgMTAsIDIwMjEgYXQgMTA6MTA6MDBQTSAr
MDAwMCwgVGhpbmggTmd1eWVuIHdyb3RlOg0KPj4gSGksDQo+Pg0KPj4gVHlwaWNhbGx5IHdoZW4g
d2UgdXNlIHNwaW5fbG9ja19pcnFzYXZlIGFuZCBzcGluX3VubG9ja19pcnFyZXN0b3JlLA0KPj4g
d2Ugc2F2ZSB0aGUgaXJxIHN0YXRlIGluIHRoZSAiZmxhZ3MiIHZhcmlhYmxlIGFuZCBwYXNzIGl0
IGRvd24gdG8gYW55DQo+PiBmdW5jdGlvbiB0aGF0IG1heSBuZWVkIHRvIGRvIHNwaW5fdW5sb2Nr
X2lycXJlc3RvcmUgYW5kIHVwZGF0ZSB0aGUgZmxhZ3MNCj4+IGFnYWluLg0KPj4NCj4+IEkgZG9u
J3Qgc2VlIHRoYXQgd2UncmUgZG9pbmcgaXQgZm9yIGR3YzMgd2hlbiB3ZSBnaXZlIGJhY2sgdGhl
IHJlcXVlc3RzOg0KPj4NCj4+IHZvaWQgZHdjM19nYWRnZXRfZ2l2ZWJhY2soc3RydWN0IGR3YzNf
ZXAgKmRlcCwgc3RydWN0IGR3YzNfcmVxdWVzdCAqcmVxLA0KPj4gCQlpbnQgc3RhdHVzKQ0KPj4g
ew0KPj4gCXN0cnVjdCBkd2MzCQkJKmR3YyA9IGRlcC0+ZHdjOw0KPj4NCj4+IAlkd2MzX2dhZGdl
dF9kZWxfYW5kX3VubWFwX3JlcXVlc3QoZGVwLCByZXEsIHN0YXR1cyk7DQo+PiAJcmVxLT5zdGF0
dXMgPSBEV0MzX1JFUVVFU1RfU1RBVFVTX0NPTVBMRVRFRDsNCj4+DQo+PiAJc3Bpbl91bmxvY2so
JmR3Yy0+bG9jayk7DQo+PiAJdXNiX2dhZGdldF9naXZlYmFja19yZXF1ZXN0KCZkZXAtPmVuZHBv
aW50LCAmcmVxLT5yZXF1ZXN0KTsNCj4+IAlzcGluX2xvY2soJmR3Yy0+bG9jayk7DQo+PiB9DQo+
Pg0KPj4gVGhlbiB3ZSB3b3VsZCB1c2UgdGhlIHN0YWxlICJmbGFncyIgdG8gZG8gc3Bpbl91bmxv
Y2tfaXJxcmVzdG9yZSgpIGF0IGEgbGF0ZXINCj4+IHRpbWUuIE1heWJlIHNvbWVvbmUgY2FuIGhl
bHAgc2hlZCBzb21lIGxpZ2h0IG9uIHdoYXQgaXNzdWUgdGhpcyB3b3VsZCBjYXVzZQ0KPj4gKGlm
IGFueSkuIEZyb20gb3VyIGhhcmR3YXJlIHRlc3RpbmcsIHRoZXJlJ3Mgbm8gb2J2aW91cyBmYWls
dXJlIG9yIHBlcmZvcm1hbmNlDQo+PiBpbXBhY3QgdGhhdCB3ZSBzZWUuDQo+IA0KPiBUaGVyZSBh
cmUgbm8gaXNzdWVzIHdpdGggdGhpcyBjb2RlIHBhdHRlcm47IGl0IGlzIHBlcmZlY3RsIHZhbGlk
LiAgSXRzIA0KPiBvbmx5IGVmZmVjdCBpcyB0aGF0IHNvbWV0aW1lcyB0aGUgcmVxdWVzdCdzIGNv
bXBsZXRpb24gaGFuZGxlciB3aWxsIGJlIA0KPiBjYWxsZWQgd2l0aCBpbnRlcnJ1cHRzIGRpc2Fi
bGVkIHdoZW4gaW4gdGhlb3J5LCBpdCBjb3VsZCBoYXZlIGJlZW4gDQo+IGNhbGxlZCB3aXRoIGlu
dGVycnVwdHMgZW5hYmxlZC4gIFRoaXMgd29uJ3QgY2F1c2UgYW55IHByb2JsZW0gYmVjYXVzZSAN
Cj4gY29tcGxldGlvbiBoYW5kbGVycyBhcmUgX2Fsd2F5c18gY2FsbGVkIHdpdGggaW50ZXJydXB0
cyBkaXNhYmxlZDsgdGhpcyANCj4gaXMgbWVudGlvbmVkIGluIHRoZSBrZXJuZWxkb2MgZm9yIHRo
ZSBAY29tcGxldGUgbWVtYmVyIG9mIHN0cnVjdCANCj4gdXNiX3JlcXVlc3QuDQo+IA0KPiBXaGVu
IHRoZSBzcGluX3VubG9ja19pcnFyZXN0b3JlKCkgY2FsbCBydW5zIGxhdGVyIG9uLCBpdHMgImZs
YWdzIiANCj4gYXJndW1lbnQgd29uJ3QgYmUgc3RhbGUuICBJdCB3aWxsIGFjY3VyYXRlbHkgcmVm
bGVjdCB3aGV0aGVyIGludGVycnVwdHMgDQo+IHdlcmUgZW5hYmxlZCB3aGVuIHRoZSBvcmlnaW5h
bCBzcGluX2xvY2tfaXJxc2F2ZSgpIHJhbi4gIEJ5IHRoZW1zZWx2ZXMsIA0KPiBzcGluX3VubG9j
aygpIGFuZCBzcGluX2xvY2soKSBkb24ndCBjaGFuZ2UgdGhlIGVuYWJsZSBzdGF0ZSBmb3IgDQo+
IGludGVycnVwdHMuDQo+IA0KPiBBbGFuIFN0ZXJuDQo+IA0KDQpJdCdzIGNsZWFyIG5vdy4gVGhh
bmtzIGZvciB0aGUgZXhwbGFuYXRpb24gQWxhbi4NCg0KQlIsDQpUaGluaA0K
