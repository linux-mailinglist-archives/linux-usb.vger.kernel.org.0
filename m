Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B1F12473D07
	for <lists+linux-usb@lfdr.de>; Tue, 14 Dec 2021 07:14:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230309AbhLNGOH (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 14 Dec 2021 01:14:07 -0500
Received: from smtprelay-out1.synopsys.com ([149.117.87.133]:46216 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229744AbhLNGOH (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 14 Dec 2021 01:14:07 -0500
Received: from mailhost.synopsys.com (badc-mailhost4.synopsys.com [10.192.0.82])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 56C25C033B;
        Tue, 14 Dec 2021 06:14:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1639462446; bh=7xjnyYz8T8VXj1+f/bm5QV3PFZpRTRFWHn9AMzIvTkw=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=Smh5wR2MPfF+YLvHOd9YjwO+WoctGHwEwpjmhnmM25v+4/Vp15STvFE4rArmWrG20
         aDeLgQH1MIUkmIzyjbP/bt8kLrQuvoa0MyNOKzuktuE7QjyO+qNKkaKo+gvBUQ5CZe
         mvXW3/XWnuHx4hZoNA5OIFoRkMHFdyhGUZOiRERdM8UQOX2DrnIkm4UzyHBdim3ksr
         B+PtrPvN1k6ouyBUdeKKCpeg56jIefdppKDaU1ZgcD2ptlfC+gl//GBLvf/UYfXg8o
         0Edm0FqXDcUeKyD624QncasRuwtpePsgoxA4IHhQUMpbjEJEnnx0GafQXyPB0LfN/V
         47QBt8XqXvv+g==
Received: from o365relay-in.synopsys.com (us03-o365relay3.synopsys.com [10.4.161.139])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (verified OK))
        by mailhost.synopsys.com (Postfix) with ESMTPS id 82DAAA005C;
        Tue, 14 Dec 2021 06:14:05 +0000 (UTC)
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (mail-dm3nam07lp2044.outbound.protection.outlook.com [104.47.56.44])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
        by o365relay-in.synopsys.com (Postfix) with ESMTPS id 01AA6800B9;
        Tue, 14 Dec 2021 06:14:04 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=hminas@synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
        dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="CRz3ietk";
        dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hQZOKAguWlRiCCkB/yrI/m304D43FXaisJHTuJjK/+NdnqitXA1yu3CkF/hLHEoCM07cLJW9LxJupe5LE9TJ+/9jxvzfmAwNiRi7DA31xgvno4Z7qhMdvuyYAXdZh79N0jVLoWCR4A1El0d6Glb3SFMXp3Aiy0DXGzVKnCkd12NydlyegSL3xwWUDPGwseiNB5x7kB9PhyGtwj/KgE3FnobZFtZL/aj/urfAtfhvVhWUUDlREyFv4Z1wgyt77ezNY5FgthookBiSUsn8eMAzxtfE8R8aWIFqVX4SygaXFmmNADcaSbdw6I7qBArVipBVGaNuiTZ+BVUdGqvcW7VZDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7xjnyYz8T8VXj1+f/bm5QV3PFZpRTRFWHn9AMzIvTkw=;
 b=Jw+SI8gtXDuXUfajh2uWS/WfvOC7i4p1fA5rZveWFGPQw3+u1bzLN85gHQuWDXPY9f3l91gEOgMREYWAksxlzLgei0EpfQC3EnDdz4BJOdreOfprSEZUUCl1ddsiTJSmFTj+H1Ivh7tVflju6a73u1u99QKOIs+4poCNVCkXndOEys+8s7pKnyB+gD80k865uCsOMDT89qCauJwRhWRuhl7aMzraJzoVcQUUOYWuyk9GVbliFQ/wqoAqbc96O6q575EXFuN0q00bZoFvdzxUH0wSgclT9b2590u7zso2Hmt6KnCAHU2i+JGytQN0TvuUvvt8R9XbCQhRbGMyWBWDiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7xjnyYz8T8VXj1+f/bm5QV3PFZpRTRFWHn9AMzIvTkw=;
 b=CRz3ietkcDhc5l2S8c08kOE1RShLBDWmvwExfpjNs0xCYNpx56mYNRFgfI3vOAPFVdAuFz2Iy+9ODu89JW8WcfhazGaY4x4o9jnfhkY+srfWjZNYvo+EFtRPhchdOwNfh8vvlFRTNyw8uiwiKdCklDtoOmsP244I9vmQlLBHiWc=
Received: from DM6PR12MB3419.namprd12.prod.outlook.com (2603:10b6:5:3c::32) by
 DM6PR12MB3755.namprd12.prod.outlook.com (2603:10b6:5:1c2::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4778.17; Tue, 14 Dec 2021 06:14:01 +0000
Received: from DM6PR12MB3419.namprd12.prod.outlook.com
 ([fe80::bc96:b3ed:1aa5:57b6]) by DM6PR12MB3419.namprd12.prod.outlook.com
 ([fe80::bc96:b3ed:1aa5:57b6%7]) with mapi id 15.20.4778.018; Tue, 14 Dec 2021
 06:14:01 +0000
X-SNPS-Relay: synopsys.com
From:   Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>
To:     Dinh Nguyen <dinguyen@kernel.org>,
        Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>,
        Artur Petrosyan <Arthur.Petrosyan@synopsys.com>
CC:     "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "dinh.linux@gmail.com" <dinh.linux@gmail.com>
Subject: Re: usb: dwc2: USB on Agilex platform broken after commit
 50fb0c128b6e
Thread-Topic: usb: dwc2: USB on Agilex platform broken after commit
 50fb0c128b6e
Thread-Index: AQHX7HzbUwJuJBhmmke0DEbt7fTUCKwwM9QAgABrygCAAErJAIAAoCqA
Date:   Tue, 14 Dec 2021 06:13:57 +0000
Message-ID: <6551e530-90a4-7c68-d097-7ffbeafbb400@synopsys.com>
References: <81f48bdb-c97b-2f7c-293e-941ec44ee941@kernel.org>
 <5e8cbce0-3260-2971-484f-fc73a3b2bd28@synopsys.com>
 <0fe0ad93-1f17-5e88-e381-94544ac75185@kernel.org>
 <7ffb5888-2001-8de9-7104-db66797b2112@kernel.org>
In-Reply-To: <7ffb5888-2001-8de9-7104-db66797b2112@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=synopsys.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 591ddefa-712a-4104-e6ae-08d9bec8ec01
x-ms-traffictypediagnostic: DM6PR12MB3755:EE_
x-microsoft-antispam-prvs: <DM6PR12MB3755D317A1D9A9E59AA40C77A7759@DM6PR12MB3755.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2803;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: HdCJuXXxJg6XsrBbvvk/SBjW/Ua0QChghADRIXgcOCwdmScTlYOCBGnzY7KZhrlR+8DLbnf7GNnwXDUhJdOfq/5J6GzAlt8UegePIFP6S+9W/3fZjkVfZxz171wM0obygtpUrqnTPSlslYl0pY5joF/dOoW3KgLTr5h1i9rna6F4VH/ktWsWpu1CLTk09nXtoZ7/tqYiwr9n6CiGP5MAvyg2skGp+bRhR9YB/nUqbBFpp8kI47VYO45wwNYz7eZqX7Cter21ubUZ9OD9gq+8VYXKWT73Jxez0RwmM/vjeRvbdHmJtjdBzGPkiF8OfLvVK1p8FYI6/q8sbYv+hpY511xw9kWGqpmTpp/ya16j24cXp647Spjd2Jxk5TR3SjSabO/8B5Xor4DLmQXIfka7okEk3cSMMxDl84etyxV0GuYwLcJSFWLXQIY+x+da0UoJmCoKMhrXya1P/SCgVqCq61mBFsQMg4s4X4Eudafdb0RUrEOJhoWEbXfDUjAzJtkKKYPhWGCZu2+gAc+CKmpbqJbLqQ0hl+vSjXQr3R2vDA6VSLB0U04U0jwUpWtS+vvM0N4bcaV6K2KO07KgnKbAgikdSJY7+6H5eHl6LVfP7PXS1s2NVI9TZbY2z4YBwGEA/ZA71J4frrtT4Xw17hHE8c0vPwsrWIPlozCpHfKwz7c4jhOFUt/6ZvW1AGgHW2k8x66G6XyD6hTpU8llOkuzsWT/olwImm3hbs+AyIpyCA+NQHLNjHqQEyY6unnYWmtp5MHNsc7SiSPFSGJWak6kv1zEA94SVY0lOpBd3nIYyauB0mUj7e3jKTfYErR18f432f//42NXtiUWHpG9CfO846i+IDF/8QcB4RMiwl5Vi6Eot3C6+Oe1BID72mmOlj/A
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR12MB3419.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(31686004)(6666004)(71200400001)(316002)(54906003)(6636002)(8676002)(508600001)(31696002)(8936002)(110136005)(36756003)(186003)(66556008)(38100700002)(4326008)(76116006)(91956017)(66476007)(2616005)(38070700005)(6486002)(5660300002)(6506007)(6512007)(53546011)(64756008)(66446008)(2906002)(66946007)(26005)(83380400001)(122000001)(86362001)(98903001)(45980500001)(43740500002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NTNpSVZUWEhjd1FVb0tzY0IrTU10aVowaGllOW50OUsyZTRGR0poaEJwUkgx?=
 =?utf-8?B?VXRRVXR3VHB3OFRnYk1tdlcwWHdaZjJiZ0VCV3ZUUnpNZDdIMXdNUXdFVWpy?=
 =?utf-8?B?MU9CakV4ZEtVd2J4UTNsdzZ2TitDZ1RuT3RrTEVvcmhQamw0UHhXOFlueSt1?=
 =?utf-8?B?QXBZS21kb0JGenJNdXM1OXdRbE84c2luczBBdG82czAzTlVkbzFuOURWck04?=
 =?utf-8?B?NzRoTEdsSnlDSFdLN3RDNGNRZGhTc1hSd2JCcUdNYzZFTWt0WDhpL1Z3QnF3?=
 =?utf-8?B?YVkzUzNub2VPS0VwdFpOVjRuVm1RUVhuSDNib0R4VWhmZ3dsK3J4ZWhFSXRz?=
 =?utf-8?B?a29IQ2s4MEM2ZVorVExSMFBZaWFKTjliQkhYQXpvR3hLSWROd01HMXBoVU04?=
 =?utf-8?B?TGM5OTh5ZVZ5TXk5OUZBSWtGM1dHbWZYNGFiTzA2SkJOc3ZMQWI5bHhFbnFC?=
 =?utf-8?B?MDVGdmlEY0NWbFhpVUVPeUgwVzF4bzgrcXpHNzIzNkxzYVJmYzBVeE5WNThR?=
 =?utf-8?B?WTNCaW9nVjdEUUs0bzZtQktVMWVVdmc3WkFWZUVaQ24zbGRTT2R5SjBReVZq?=
 =?utf-8?B?K3EzRDh2Nm9aL3VDU2tpbFJDd0l0L0t2bFZ4cmIzSmd4S2hmQ1JIbFVNaE9X?=
 =?utf-8?B?V1dNYzJtY1pKTFRXMUJnM0QxeHFGQzNzUWFPZit5a1J6MTZKRCsxeG1VcXpR?=
 =?utf-8?B?eDUrM04wdElGUmhSZFRqc1VvNi96WTR2ZVIrTXE5U040SFB4SmphMUx4WUw2?=
 =?utf-8?B?L01CeFFMY21HeHN0OUF6VWhNQmV5UDJsUzFlbXlSeXZJaTEvUUZxSnowdmJI?=
 =?utf-8?B?bjdFaEVpV3Q5RzJTais3dFNNbmJ3N3dxWUhtTFJDQUxTSzN2QW5aeHAvVTR0?=
 =?utf-8?B?K0dTVUVhMEVxODdINVAyemlUSENKRzUxWjRKQnQ0dGFTcHNUdkEvc3JrdC9h?=
 =?utf-8?B?K3pZdDhGK3JidjN5UE1CK3BIay9GSG9FRVhlOHE5WmVYWU4rOHJTdnp1WWZj?=
 =?utf-8?B?amF3WE16MHpSWWk4RDBEaW8vRXFabENQNTN0bkJ1T3BSYTkxRWIydjYrL2lr?=
 =?utf-8?B?eE5OckdaeVE2RHpteVU5a20rOG9IaDRYd1VhWGlhZjdCckJKQWhoRkVGZWcz?=
 =?utf-8?B?aWUvT05HVUNCbzJEd3lLcm9hMFpoUmxvSnBrSURNbms4RC9uQ21NQUh1QmRk?=
 =?utf-8?B?UTFJN1RMb0M0MzVSeTJNNncxMTZGSjRWTXM4dm9Wa1RnZWhSMTFvdXdaTmZy?=
 =?utf-8?B?REtnZUc2MUNySURvdUE2cWdwNDdjTVNjVkNUbXJIemdrbHhBL2ZtZUFiQ3pa?=
 =?utf-8?B?QkRSU29EaWRMR01iTVF1RmMwelo0RVBvTWVDQ0I2a2c2WE5PVlZSRE9aVDB4?=
 =?utf-8?B?N1ZCMXNUSmlHeng5Lzdpak12YjZJVlhYbnYyWkRCL0NCKzcxYzlkaW1WQ0s0?=
 =?utf-8?B?cVhRcW9MdG5PbnlpV0w2NTdnbzl3akM3UUxLUEFpdDg3UG1oNUJYOGh5RjBO?=
 =?utf-8?B?blk4TlpxQnJvM29pQVF3dEx3VnVLNEpvVm0yWXg4aWhyazBadmZlSzFQY25t?=
 =?utf-8?B?N3MwQTlQWUVkYWZWd0JKS2E5RGdvSzI2aDRWSXBHVUpYSVVGTk9oUi9OZ0lL?=
 =?utf-8?B?YW50R1N6RmcrS2d2Y2FTYUw2bVdGNnJaUWpTTitqWStnczVzTDZkVUhPN1JO?=
 =?utf-8?B?T0p0Vk5DcDFIRmJGMU1ZTERBQkU0ZTFHQm1teU42K095SlpzbUdGRWRqaTlT?=
 =?utf-8?B?RS9TdlkyT0JmVVFFQmltcmY1TlVieERWNDRKWllVRFN1VFE3dE0vSkpsQWRh?=
 =?utf-8?B?eU4vZmFEVWQ4emVMdjJvTWlZTmY0bUM5NU4zODlrUEMrU1FnL0lDVEdZcEVj?=
 =?utf-8?B?Y2NiaWFpT21La3ZMYjNPWnY5clFiSXU4OXd0dzI4NnhiRUVYaDcvZVJBVmVE?=
 =?utf-8?B?aG9hNFNGbVhzckxFdFBKeHhYbUJJMHZqVUp2S2s2OHA2bW1JQ1pLUDZ4aCth?=
 =?utf-8?B?aGpHdm9PNit2MWVLV09YZ3FIQ2JsYzQ3YkdiSlJHZjNvckxYQ2twdGRWU2Vl?=
 =?utf-8?B?eWc5eGhxK1l3Z0hjUjRReTYvWkJYZVQyVU0zcm1RUlBJVGlhUjN2V0s1Ujcy?=
 =?utf-8?B?bkx6TzNVcStQcEh6YVNUaSthWmhkVnpxckt4cmNRc0w1SUtLMjNZTGlhZ2lN?=
 =?utf-8?B?NlE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <77A46DEB969D7F49A5F4C4C4D3E4524E@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3419.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 591ddefa-712a-4104-e6ae-08d9bec8ec01
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Dec 2021 06:14:00.8791
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mD9e/d2Jzo38e6D24QGWQRNjqS/gkoIKBnC+GCRKPnGhkqiPFg2Tg1chp4D74iNSqd5V6UND2TUcFhvkkJSx9w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3755
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

SGkgRGluaCwNCg0KT24gMTIvMTQvMjAyMSAxMjo0MCBBTSwgRGluaCBOZ3V5ZW4gd3JvdGU6DQo+
IA0KPiANCj4gT24gMTIvMTMvMjEgMTA6MTMgQU0sIERpbmggTmd1eWVuIHdyb3RlOg0KPj4gSGkg
TWluYXMsDQo+Pg0KPj4gVGhhbmtzIGZvciByZXBseWluZyENCj4+DQo+PiBPbiAxMi8xMy8yMSAz
OjQ3IEFNLCBNaW5hcyBIYXJ1dHl1bnlhbiB3cm90ZToNCj4+PiBIaSBEaW5oLA0KPj4+DQo+Pj4g
T24gMTIvOS8yMDIxIDE6NDQgQU0sIERpbmggTmd1eWVuIHdyb3RlOg0KPj4+PiBIaSBBcnRodXIs
DQo+Pj4+DQo+Pj4+IFRoZSB1c2IgZHJpdmVyIGlzIGdldHRpbmcgdGhpcyBlcnJvcjoNCj4+Pj4N
Cj4+Pj4gW8KgwqDCoCAxLjUzOTg1Nl0gSGFyZHdhcmUgbmFtZTogU29DRlBHQSBBZ2lsZXggU29D
REsgKERUKQ0KPj4+PiBbwqDCoMKgIDEuNTQ0Nzk5XSBDYWxsIHRyYWNlOg0KPj4+PiBbwqDCoMKg
IDEuNTQ3MjMzXcKgIGR1bXBfYmFja3RyYWNlKzB4MC8weDFjMA0KPj4+PiBbwqDCoMKgIDEuNTUw
ODk3XcKgIHNob3dfc3RhY2srMHgxOC8weDY4DQo+Pj4+IFvCoMKgwqAgMS41NTQyMDJdwqAgZHVt
cF9zdGFjaysweGQ4LzB4MTM0DQo+Pj4+IFvCoMKgwqAgMS41NTc1OTddwqAgX19yZXBvcnRfYmFk
X2lycSsweDM4LzB4ZjANCj4+Pj4gW8KgwqDCoCAxLjU2MTQyM13CoCBub3RlX2ludGVycnVwdCsw
eDMxYy8weDNlOA0KPj4+PiBbwqDCoMKgIDEuNTY1MjQ0XcKgIGhhbmRsZV9pcnFfZXZlbnRfcGVy
Y3B1KzB4NjAvMHg5MA0KPj4+PiBbwqDCoMKgIDEuNTY5NjcxXcKgIGhhbmRsZV9pcnFfZXZlbnQr
MHg0OC8weGUwDQo+Pj4+IFvCoMKgwqAgMS41NzM0OTFdwqAgaGFuZGxlX2Zhc3Rlb2lfaXJxKzB4
YjAvMHgxMzgNCj4+Pj4gW8KgwqDCoCAxLjU3NzU3NF3CoCBnZW5lcmljX2hhbmRsZV9pcnErMHgz
MC8weDQ4DQo+Pj4+IFvCoMKgwqAgMS41ODE1NjddwqAgX19oYW5kbGVfZG9tYWluX2lycSsweDYw
LzB4YjgNCj4+Pj4gW8KgwqDCoCAxLjU4NTY0Nl3CoCBnaWNfaGFuZGxlX2lycSsweGI0LzB4ZDAN
Cj4+Pj4gW8KgwqDCoCAxLjU4OTMwMF3CoCBlbDFfaXJxKzB4YjgvMHgxNTANCj4+Pj4gW8KgwqDC
oCAxLjU5MjQyOF3CoCBhcmNoX2NwdV9pZGxlKzB4MTgvMHgyOA0KPj4+PiBbwqDCoMKgIDEuNTk1
OTkyXcKgIGRlZmF1bHRfaWRsZV9jYWxsKzB4MjQvMHg1Yw0KPj4+PiBbwqDCoMKgIDEuNTk5ODk5
XcKgIGRvX2lkbGUrMHgxZjQvMHgyOTANCj4+Pj4gW8KgwqDCoCAxLjYwMzExOF3CoCBjcHVfc3Rh
cnR1cF9lbnRyeSsweDI4LzB4NjgNCj4+Pj4gW8KgwqDCoCAxLjYwNzAyNl3CoCByZXN0X2luaXQr
MHhkOC8weGU4DQo+Pj4+IFvCoMKgwqAgMS42MTAyNDJdwqAgYXJjaF9jYWxsX3Jlc3RfaW5pdCsw
eDEwLzB4MWMNCj4+Pj4gW8KgwqDCoCAxLjYxNDMyOV3CoCBzdGFydF9rZXJuZWwrMHg1MGMvMHg1
NDQNCj4+Pj4gW8KgwqDCoCAxLjYxNzk4MF0gaGFuZGxlcnM6DQo+Pj4+IFvCoMKgwqAgMS42MjAy
NDFdIFs8MDAwMDAwMDBhZTYwMWFhYz5dIGR3YzJfaGFuZGxlX2NvbW1vbl9pbnRyDQo+Pj4+IFvC
oMKgwqAgMS42MjU1NDFdIFs8MDAwMDAwMDAyNTVkNzkzYT5dIGR3YzJfaHNvdGdfaXJxDQo+Pj4+
IFvCoMKgwqAgMS42MzAwNTZdIFs8MDAwMDAwMDAwYmM2OGFiND5dIHVzYl9oY2RfaXJxDQo+Pj4+
IFvCoMKgwqAgMS42MzQzMTJdIERpc2FibGluZyBJUlEgIzMzDQo+Pj4+DQo+Pj4+IEFmdGVyIGEg
Z2l0LWJpc2VjdCwgdGhlIHJlc3VsdCBpcyB0aGlzIGNvbW1pdDoNCj4+Pj4NCj4+Pj4NCj4+Pj4g
Y29tbWl0IDUwZmIwYzEyOGI2ZThkZjYyMjAwYmE4NWMwNWVjZDZiMTM5NjQ3NmQNCj4+Pj4gQXV0
aG9yOiBBcnR1ciBQZXRyb3N5YW48QXJ0aHVyLlBldHJvc3lhbkBzeW5vcHN5cy5jb20+DQo+Pj4+
IERhdGU6wqDCoCBUdWUgQXByIDEzIDExOjM3OjE1IDIwMjEgKzA0MDANCj4+Pj4NCj4+Pj4gwqDC
oMKgwqDCoCB1c2I6IGR3YzI6IEFkZCBjbG9jayBnYXRpbmcgZW50ZXJpbmcgZmxvdyBieSBzeXN0
ZW0gc3VzcGVuZA0KPj4+PiDCoMKgwqDCoMKgIElmIG5vdCBoaWJlcm5hdGlvbiBub3IgcGFydGlh
bCBwb3dlciBkb3duIGFyZSBzdXBwb3J0ZWQsDQo+Pj4+IMKgwqDCoMKgwqAgY2xvY2sgZ2F0aW5n
IGlzIHVzZWQgdG8gc2F2ZSBwb3dlci4NCj4+Pj4gwqDCoMKgwqDCoCBBZGRzIGEgbmV3IGZsb3cg
b2YgZW50ZXJpbmcgY2xvY2sgZ2F0aW5nIHdoZW4gUEMgaXMNCj4+Pj4gwqDCoMKgwqDCoCBzdXNw
ZW5kZWQuDQo+Pj4+IMKgwqDCoMKgwqAgU2lnbmVkLW9mZi1ieTogQXJ0dXIgUGV0cm9zeWFuPEFy
dGh1ci5QZXRyb3N5YW5Ac3lub3BzeXMuY29tPg0KPj4+PiBMaW5rOmh0dHBzOi8vdXJsZGVmZW5z
ZS5jb20vdjMvX19odHRwczovL2xvcmUua2VybmVsLm9yZy9yLzIwMjEwNDEzMDczNzE2LjMwQzEz
QTAwOTRAbWFpbGhvc3Quc3lub3BzeXMuY29tX187ISFBNEYyUjlHX3BnIUlqR1M3MGNNWEI5bWlN
blBkY29HcmlVcER2QVJtN1Njd3JsUVhBaUg5cU4tWm5wY2FpTV9nRC1LV3BfX19NVnl2RVBtX2Rq
SiQgDQo+Pj4+DQo+Pj4+IMKgwqDCoMKgwqAgU2lnbmVkLW9mZi1ieTogR3JlZyBLcm9haC1IYXJ0
bWFuPGdyZWdraEBsaW51eGZvdW5kYXRpb24ub3JnPg0KPj4+Pg0KPj4+PiBUaGUgRFdDMiBVU0Ig
dmVyc2lvbiBvbiB0aGUgQWdpbGV4IHBsYXRmb3JtIGlzDQo+Pj4+IDB4NEY1NDMzMEENCj4+Pj4N
Cj4+PiBDb3VsZCB5b3UgcGxlYXNlIHByb3ZpZGUgSFcgY29uZmlndXJhdGlvbiByZWdpc3RlcnMg
dmFsdWVzIChHSFdDRkcxLTQpLg0KPj4+DQo+Pg0KPj4gW8KgwqDCoCAwLjk4Nzc3OV0gZHdjMiBm
ZmIwMDAwMC51c2I6IEdIV0NGRzHCoMKgwqAgQDB4RkZGRjgwMDAxMjk0MDA0NCA6IA0KPj4gMHgw
MDAwMDAwMA0KPj4gW8KgwqDCoCAwLjk5NDY0NF0gZHdjMiBmZmIwMDAwMC51c2I6IEdIV0NGRzLC
oMKgwqAgQDB4RkZGRjgwMDAxMjk0MDA0OCA6IA0KPj4gMHgyMzhGRkM5MA0KPj4gW8KgwqDCoCAx
LjAwMTQ5OF0gZHdjMiBmZmIwMDAwMC51c2I6IEdIV0NGRzPCoMKgwqAgQDB4RkZGRjgwMDAxMjk0
MDA0QyA6IA0KPj4gMHgxRjgwMDJFOA0KPj4gW8KgwqDCoCAxLjAwODM1MF0gZHdjMiBmZmIwMDAw
MC51c2I6IEdIV0NGRzTCoMKgwqAgQDB4RkZGRjgwMDAxMjk0MDA1MCA6IA0KPj4gMHhGRTBGMDAy
MA0KPj4NCj4+DQo+PiBJIGRpZCBhIGxpdHRsZSBkZWJ1Z2dpbmcsIGFuZCBub3RpY2VkIHRoYXQg
dGhlIEdJTlRTVFNfUFJUSU5UIGlzIA0KPj4gZmlyaW5nLCBzbyB0aGUgZHdjMl9oYW5kbGVfY29t
bW9uX2ludHIoKSBpcyBnZXR0aW5nIGNhbGxlZCANCj4+IGNvbnRpbnVvdXNseS4gVGhlcmUncyBk
b2Vzbid0IHNlZW0gdG8gYmUgd2F5IHRvIGhhbmRsZSB0aGUgDQo+PiBHSU5UU1RTX1BSVElOVCBi
aXQsIGJlY2F1c2UgdGhlcmUncyBhIGNoZWNrIGZvciBkZXZpY2VfbW9kZSgpLg0KPj4NCj4gDQo+
IEl0IGxvb2tzIGxpa2UgdGhlIExQTU1vZGUgYml0IGlzIGRpc2FibGVkIGluIHRoZSBHSFdDRkcz
LiBDb3VsZCB0aGF0IGJlIA0KPiB0aGUgcmVhc29uIHdoeT8NCj4gDQo+IERpbmgNCg0KQ291bGQg
eW91IHBsZWFzZSBkaXNhYmxlIGNsb2NrIGdhdGluZyBieSBhZGRpbmcgdG8gDQpkd2MyX3NldF9k
ZWZhdWx0X3BhcmFtcygpIGZ1bmN0aW9uIGZvbGxvdyBsaW5lOg0KcC0+bm9fY2xvY2tfZ2F0aW5n
ID0gdHJ1ZTsNCmxpa2UgaW4gZHdjMl9zZXRfczNjNjQwMF9wYXJhbXMoKSBmdW5jdGlvbi4NCg0K
VGhhbmtzLA0KTWluYXMNCg0KDQo=
