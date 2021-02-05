Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D8A4631039A
	for <lists+linux-usb@lfdr.de>; Fri,  5 Feb 2021 04:32:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230226AbhBEDcE (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 4 Feb 2021 22:32:04 -0500
Received: from smtprelay-out1.synopsys.com ([149.117.87.133]:38466 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229987AbhBEDcD (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 4 Feb 2021 22:32:03 -0500
Received: from mailhost.synopsys.com (badc-mailhost2.synopsys.com [10.192.0.18])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 1C22BC0097;
        Fri,  5 Feb 2021 03:31:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1612495862; bh=/UjFFUvRGHULyD6NdQyyw/KfdvqXwou7XSOxSVe5rrY=;
        h=From:To:Subject:Date:References:In-Reply-To:From;
        b=VWYcwr9OvQ9d194Zpdev3T95LSvlwKZWBptl0Cy/+kSnpG4FrD+y7T7CQAps1xT9B
         ruLqlEO0jo9aK11UNrD5ybd9MUsJq5l/PQjY8iM7S3+AGL05Nl76SI8Am6dZUNOVtf
         LjAj+pYz1660b7LU50rdPoS7W4WeyfXTheDVgkL6g7jjOah65Hp2VfBoU6jIhb172A
         9l9M+ENDqxMYLugyuTXcT7GpAM1L4n6WBITJfgop+uYQlFA9hyf7ORpJ8No1NlRFW2
         UxVJs/fN/iA6kqEDZqCoKHddLhdbBNr7QypbvCq8ezxak8AbZB9Vt/i9Inlx+F70FG
         OFSM8bLxu+XqA==
Received: from o365relay-in.synopsys.com (us03-o365relay1.synopsys.com [10.4.161.137])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPS id 3C14CA0067;
        Fri,  5 Feb 2021 03:31:01 +0000 (UTC)
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (mail-dm6nam08lp2047.outbound.protection.outlook.com [104.47.73.47])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client CN "mail.protection.outlook.com", Issuer "GlobalSign Organization Validation CA - SHA256 - G3" (verified OK))
        by o365relay-in.synopsys.com (Postfix) with ESMTPS id C058F80218;
        Fri,  5 Feb 2021 03:31:00 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=thinhn@synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
        dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="e8C2G3Zq";
        dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X9N245XVB9RI1jy02g4dyO5WOgWmU4xcjdkzTM1swIPjv47vwRE+I8iLpMqx0fQH/IfF5rhdy1Ih7t364Ih2Qmuh0a7fcbuOO3HMtf+/dEKoAMohDQCiRgmhNZIUj24Pr+3NATWcvJyD0ZcbWoKnlxIZiiM+nQIFOcPLZvIaJsPBhsWfAlXNdfTGHc/CCiiKHPyufKicpNYvQRBWT+f2cIiMManVVzfPjMyBSXD+H8RtdS/e9vI8Uc56VCHOzcsZLlT46CTDsZNYhJ0JdH8kEFn/gnKLgVtgTQjeORbBnN8e0vio9fh8X1sxvDf1Ajo6VQtLdwU7SDm5YqJF4OEfRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/UjFFUvRGHULyD6NdQyyw/KfdvqXwou7XSOxSVe5rrY=;
 b=k8361voFQ/CM7RCzIHsjokwW5JW0maYKjjFBJVmyg5S3U3U5ZrRCLgIo8Y/NiUQxlo0AEr0VbaZis6pbUJYgvnUXRx2lYv2uIgruEq+Tms6D8lyrR2QiqKRdcekDpVTZiCVWWXLOfhgYvzbajYDCwg38pQOXMQBR/ZvGd2IsEgCT1nubT5xGYv5SLyMLXkHXODndRFjEtj6sf6FwH/H6O62AhcFTWFnH0mSEU0QODJRTjvdcqWWi2FxVkeJEqbNTabTvifqXcy2HiQJ3vt2545b0ifIpLwbYaWg9YEuFhvKiKUi25A0ITFCUg4MjlhWiSm/aBvNIDiCSMwFFauLwCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/UjFFUvRGHULyD6NdQyyw/KfdvqXwou7XSOxSVe5rrY=;
 b=e8C2G3ZqNLT6uSNKlXm8eG5nFIM4/tACupKeGUV4pyNwBL/nYTQ18m/klVW/mRs0q7nxKZw0DPRj+xoKqJbQYwYV1ksO5FfyPzD+yJpaJ+7iEYIJiQhLWNdnmfKppgwzVBv/gWwhbEg1x99anXQmDn8FlDIfuEmskmL5HMFSGKk=
Received: from BYAPR12MB4791.namprd12.prod.outlook.com (2603:10b6:a03:10a::12)
 by BYAPR12MB3096.namprd12.prod.outlook.com (2603:10b6:a03:ad::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.19; Fri, 5 Feb
 2021 03:30:58 +0000
Received: from BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::895b:620d:8f20:c4d6]) by BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::895b:620d:8f20:c4d6%6]) with mapi id 15.20.3805.026; Fri, 5 Feb 2021
 03:30:58 +0000
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To:     David Laight <David.Laight@ACULAB.COM>,
        Sergei Shtylyov <sergei.shtylyov@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Mathias Nyman <mathias.nyman@intel.com>
Subject: Re: [RFC PATCH 6/8] usb: xhci: Fix port minor revision
Thread-Topic: [RFC PATCH 6/8] usb: xhci: Fix port minor revision
Thread-Index: AQHW+RV+hDKTpHds3UON+skS200saKpEkq2AgAEPbgCAAijX8IABAAMAgAAhgYA=
Date:   Fri, 5 Feb 2021 03:30:58 +0000
Message-ID: <4934d352-6d61-a158-f3d3-35171424da1c@synopsys.com>
References: <cover.1612237179.git.Thinh.Nguyen@synopsys.com>
 <4627ca7e922019cd9a37073db90e4e9cd585c97e.1612237179.git.Thinh.Nguyen@synopsys.com>
 <90627b9d-9a39-b5ee-4ae3-054764a57faa@gmail.com>
 <5efc3bb3-1320-f382-c6f6-b8cefd91b8ce@synopsys.com>
 <064f005f25794769b5c551609fcdc3f2@AcuMS.aculab.com>
 <b99c1412-ee58-9215-9e17-70b06d08fe7e@synopsys.com>
In-Reply-To: <b99c1412-ee58-9215-9e17-70b06d08fe7e@synopsys.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
authentication-results: ACULAB.COM; dkim=none (message not signed)
 header.d=none;ACULAB.COM; dmarc=none action=none header.from=synopsys.com;
x-originating-ip: [98.248.94.126]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f065d8b9-2f21-4627-84b6-08d8c9867442
x-ms-traffictypediagnostic: BYAPR12MB3096:
x-microsoft-antispam-prvs: <BYAPR12MB30963211EF3371E48A40EB57AAB29@BYAPR12MB3096.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: vMM0doObIdG94V1U5Z1PSrFhc9dK4YzDvGYWkW5m2jWI+DKQJPO5FBVXw6k89qrTvoGeGUWxQBtUf7XS/ld0B/VOcrh58/XyYrNpIvQyI2+XJyMCjrZiRGCfFNR2QKN59gmSgqe4BtSHBFapmzieB/HNDQSyVwD3ImHhQL+yXpaJ2MP3mcTEZ4+UV5hyI98SxK2Ik2AXbH10KRvPzlAmcbNjUIBQ+reC7HHxz5W8oGDWAauXSPuRyLT4kNm4I8wPuF5Qdh9kbTDe6bms0tClNFe4oOLfYwinnirJqbihKj6fm3oleMrpG/pccNRkyip8tWuX9aNaqQI5D0wzD78kPJvUSBgfjh1sJDsYqjWvCJrzcYt8TnN1QH4lI0DHlcGah39u0VMGYjtudPowJGRg9+I65lykNwvX5D0Lr9R3/jI5K3hG1ufKrfyytNaZgx3w6/+ajtS+2lplVOhpOa+9uXjDz5xAfiT2s/nKTj0ZTQbJ/wQChSTu7U/NAx4HThbOA+336RVBaQ1gkqiLWcorQ4U0BRBTrElzzls8Q19D+lkzo00mZOFXLJOz46tdxH+oFV6FLMRaX0v1AZTta6oySqpGyKAG/x97acVTzZ01HTc=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB4791.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(376002)(39860400002)(366004)(346002)(396003)(136003)(2906002)(186003)(76116006)(53546011)(6506007)(64756008)(86362001)(66476007)(5660300002)(31696002)(110136005)(8676002)(316002)(478600001)(36756003)(6486002)(2616005)(66446008)(71200400001)(6512007)(31686004)(8936002)(26005)(66946007)(66556008)(43740500002)(45980500001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: =?utf-8?B?Z2trbWxrOG9uVjhEWi82dHpYcEF5UmF0K01qZDNyY3FaSFQ2ZG43MWRMMkQx?=
 =?utf-8?B?b2psaEV2bGkwQnhEazRzV0RNZzREUDR0VldRbTh5a2JyN2loNzVzVk5KNkZF?=
 =?utf-8?B?R0lsM2dERjlxU1VaWm5rRjdlTmExbHA2RktGRE5HbEkwd0c3ZjhYUjVRK2pz?=
 =?utf-8?B?dmRMcU9FVXgvTGFaaitsYUlTOTlHdkllREw2U1Z0eHpSZWJKQTR6WS8rbGFZ?=
 =?utf-8?B?TWM3cys0UXVWYU13K2RmaDVyMUc4UHgyUnBlckxYcUZibXJUcUN0UG1TQU5I?=
 =?utf-8?B?S3pWQXZDTXh1MFJSQitRYmtmL1F3K290RlVEaGhMRldvajNheXp4OUdYd2xs?=
 =?utf-8?B?YWg2SVNHUGd1TDhab3k5bE9GbldhTDFBTzd5NURqSFRVUE1wOVV4TTcvb3dI?=
 =?utf-8?B?NXpoSTh6eUg4V3phTXNNU1FqS0R2TVZUWkE4RVZvQk54NXF0Z1VOZExaN1E2?=
 =?utf-8?B?a3BVckJ5TXJONUpCTlhjUzdBYjJJRnlUdVg2VDRQVDNtNEUvTXlwUkhwbEJh?=
 =?utf-8?B?THFkZGFseWNUakxDa3c4M2Q3RW0ydmFoUkw3ZUlyMWhxOWtrN2MyQmc2NEpT?=
 =?utf-8?B?QW12d3hNWWszYjZrM1FqK0YzbStXODMrL1RCdjNJQWhyRHp4R2hMVmpCWmk4?=
 =?utf-8?B?ak5STDh4eUk1SlVTb1ZSdjQ2K1NUVnJwYmVyekpNMnZLeHFUbjBET01LUlM5?=
 =?utf-8?B?RzdqYXVGYThQSWtEMUlYbXh6Z3J0MDFxcE0xVHQ1MkNENyt4MlRXcjIyUjU4?=
 =?utf-8?B?VkcvQmQ2YUtvTGhSamtuZTJLS1hMRmxtOGJDcmRtOGlaalIrVGo3VHJ5cW1z?=
 =?utf-8?B?ZmRvZmpoMHg2NklFWGVOU1FWSmdMNjVKdG9FU3NOMUdCUm5LaUY3a2JORFd2?=
 =?utf-8?B?bERpbTQvZklqQVBzYjhuUSs1WEpIVWlySTJEYndNVHNETDFNYStlc01ybjJu?=
 =?utf-8?B?elZ5VDZSYzRzcU1ROTZsVmU3WTIwdk92UHkwZUpYNUNtcnlGdWl0U21LMEVp?=
 =?utf-8?B?MjYyTmFBcFZFak52bWFIQVdHT2N4K0ZnNkNWSk5MK0RQeE9OVjcxQ3BMc3FR?=
 =?utf-8?B?QXY2SFdIbjhIY1ArREJmYzJIWFlIL2VRTkcyZjVhb1RjQnpmTWJQV2dtcTV2?=
 =?utf-8?B?bVJnNmRTRDRmMDlTZ2VCSUZ4cDROb1FkU25ST0tKMDF3YWRoSUk1bkdtb2U5?=
 =?utf-8?B?MVFQUDNsR0dFalc1SEFCSWwzZTFIMllHeTVVNlBSbzVMVS9tWGpQOTgvM1du?=
 =?utf-8?B?Z0RIZDVWeXZPWmowVFVWQUxqZGE1L3o1RU41azdVSkw5RFVqbjVUOCt3bkdm?=
 =?utf-8?B?YU0vOEk1YzhIYXcwMTlwN3UxYzdWbURaV1g0V3V6dGZ6dTVrRWRPWUQ1Y1Fn?=
 =?utf-8?B?SmVzT0lhaWFDSER5R29XQ29HWTZkQmViWlpwWVhaTnNHYXJ5WmxOZTJGR2tN?=
 =?utf-8?B?R3QyWGszQkFFdjRHTDMyZWdLWDAzQjZvd1p5NGQxZ1F0eEUrbm1ka2YvVHBL?=
 =?utf-8?B?Y1Rxdk9rYnFJSVduOUhHZ1NUMlphY3NyTjU0QzFVUGREdmxoblBYelR3em5k?=
 =?utf-8?B?T0s4TUkzeFRnejA5cE5raW1jUm9UMVhEQzRiRHV3NFlHVDRTNkY5RXNoR1NH?=
 =?utf-8?B?bUN2WHZmZ2FGYzFXYVFRUmlSMWdNeU5LdjJ6cTRGU2Jwck1jZW5OSC9PNU5L?=
 =?utf-8?B?U3JGbzJDMWdGdE5KUERsVXpqdUFhbFdQcnNrVlN2alJ1NWVrSTlHdVBRZ0VL?=
 =?utf-8?Q?7Trh96tMg479gCEc7/C8wb8lzlWiVWwOH83FlD5?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <650CB762541DE04A8ECE6B290534AE77@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB4791.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f065d8b9-2f21-4627-84b6-08d8c9867442
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Feb 2021 03:30:58.4932
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mBjNAllUNmzXB3FJUt4AnF1kyxO7ULkXKB1266e1KKDnkj/SvIOtDaeCaWop/ICFUBLw0v4RSyFp+RRvw7TE3Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3096
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

VGhpbmggTmd1eWVuIHdyb3RlOg0KPiBEYXZpZCBMYWlnaHQgd3JvdGU6DQo+PiBGcm9tOiBUaGlu
aCBOZ3V5ZW4NCj4+PiBTZW50OiAwMyBGZWJydWFyeSAyMDIxIDAxOjE2DQo+Pj4NCj4+PiBTZXJn
ZWkgU2h0eWx5b3Ygd3JvdGU6DQo+Pj4+IEhlbGxvIQ0KPj4+Pg0KPj4+PiBPbiAwMi4wMi4yMDIx
IDY6NDIsIFRoaW5oIE5ndXllbiB3cm90ZToNCj4+Pj4NCj4+Pj4+IFNvbWUgaG9zdHMgaW5jb3Jy
ZWN0bHkgdXNlIHN1Yi1taW5vciB2ZXJzaW9uIGZvciBtaW5vciB2ZXJzaW9uIChpLmUuDQo+Pj4+
PiAweDAyIGluc3RlYWQgb2YgMHgyMCBmb3IgYmNkVVNCIDB4MzIwIGFuZCAweDAxIGZvciBiY2RV
U0IgMHgzMTApLg0KPj4+Pj4gQ3VycmVudGx5IHRoZSB4SENJIGRyaXZlciB3b3JrcyBhcm91bmQg
dGhpcyBieSBqdXN0IGNoZWNraW5nIGZvciBtaW5vcg0KPj4+Pj4gcmV2aXNpb24gPiAweDAxIGZv
ciBVU0IgMy4xIGV2ZXJ5d2hlcmUuIFdpdGggdGhlIGFkZGl0aW9uIG9mIFVTQiAzLjIsDQo+Pj4+
PiBjaGVja2luZyB0aGlzIGdldHMgYSBiaXQgY3VtYmVyc29tZS4gU2luY2UgdGhlcmUgaXMgbm8g
VVNCIHJlbGVhc2Ugd2l0aA0KPj4+Pj4gYmNkVVNCIDB4MzAxIHRvIDB4MzA5LCB3ZSBjYW4gYXNz
dW1lIHRoYXQgc3ViLW1pbm9yIHZlcnNpb24gMDEgdG8gMDkgaXMNCj4+Pj4+IGluY29ycmVjdC4g
TGV0J3MgdHJ5IHRvIGZpeCB0aGlzIGFuZCB1c2UgdGhlIG1pbm9yIHJldmlzaW9uIHRoYXQgbWF0
Y2hlcw0KPj4+Pj4gd2l0aCB0aGUgVVNCL3hIQ0kgc3BlYyB0byBoZWxwIHdpdGggdGhlIHZlcnNp
b24gY2hlY2tpbmcgd2l0aGluIHRoZQ0KPj4+Pj4gZHJpdmVyLg0KPj4+Pj4NCj4+Pj4+IFNpZ25l
ZC1vZmYtYnk6IFRoaW5oIE5ndXllbiA8VGhpbmguTmd1eWVuQHN5bm9wc3lzLmNvbT4NCj4+Pj4+
IC0tLQ0KPj4+Pj4gwqAgZHJpdmVycy91c2IvaG9zdC94aGNpLW1lbS5jIHwgOSArKysrKysrKysN
Cj4+Pj4+IMKgIDEgZmlsZSBjaGFuZ2VkLCA5IGluc2VydGlvbnMoKykNCj4+Pj4+DQo+Pj4+PiBk
aWZmIC0tZ2l0IGEvZHJpdmVycy91c2IvaG9zdC94aGNpLW1lbS5jIGIvZHJpdmVycy91c2IvaG9z
dC94aGNpLW1lbS5jDQo+Pj4+PiBpbmRleCBmMmM0ZWU3YzQ3ODYuLjM0MTA1YjQ3N2M2MiAxMDA2
NDQNCj4+Pj4+IC0tLSBhL2RyaXZlcnMvdXNiL2hvc3QveGhjaS1tZW0uYw0KPj4+Pj4gKysrIGIv
ZHJpdmVycy91c2IvaG9zdC94aGNpLW1lbS5jDQo+Pj4+PiBAQCAtMjEyOSw2ICsyMTI5LDE1IEBA
IHN0YXRpYyB2b2lkIHhoY2lfYWRkX2luX3BvcnQoc3RydWN0IHhoY2lfaGNkDQo+Pj4+PiAqeGhj
aSwgdW5zaWduZWQgaW50IG51bV9wb3J0cywNCj4+Pj4+IMKgIMKgwqDCoMKgwqAgaWYgKG1ham9y
X3JldmlzaW9uID09IDB4MDMpIHsNCj4+Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoCByaHViID0gJnho
Y2ktPnVzYjNfcmh1YjsNCj4+Pj4+ICvCoMKgwqDCoMKgwqDCoCAvKg0KPj4+Pj4gK8KgwqDCoMKg
wqDCoMKgwqAgKiBTb21lIGhvc3RzIGluY29ycmVjdGx5IHVzZSBzdWItbWlub3IgdmVyc2lvbiBm
b3IgbWlub3INCj4+Pj4+ICvCoMKgwqDCoMKgwqDCoMKgICogdmVyc2lvbiAoaS5lLiAweDAyIGlu
c3RlYWQgb2YgMHgyMCBmb3IgYmNkVVNCIDB4MzIwIGFuZCAweDAxDQo+Pj4+PiArwqDCoMKgwqDC
oMKgwqDCoCAqIGZvciBiY2RVU0IgMHgzMTApLiBTaW5jZSB0aGVyZSBpcyBubyBVU0IgcmVsZWFz
ZSB3aXRoIHN1Yg0KPj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqAgKiBtaW5vciB2ZXJzaW9uIDB4MzAx
IHRvIDB4MzA5LCB3ZSBjYW4gYXNzdW1lIHRoYXQgdGhleSBhcmUNCj4+Pj4+ICvCoMKgwqDCoMKg
wqDCoMKgICogaW5jb3JyZWN0IGFuZCBmaXggaXQgaGVyZS4NCj4+Pj4+ICvCoMKgwqDCoMKgwqDC
oMKgICovDQo+Pj4+PiArwqDCoMKgwqDCoMKgwqAgaWYgKCEobWlub3JfcmV2aXNpb24gJiAweGYw
KSAmJiAobWlub3JfcmV2aXNpb24gJiAweDBmKSkNCj4+Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIG1pbm9yX3JldmlzaW9uID0gbWlub3JfcmV2aXNpb24gPDwgNDsNCj4+Pj4gwqDCoCBXaHkg
bm90Og0KPj4+Pg0KPj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIG1pbm9yX3JldmlzaW9uIDw8
PSA0Ow0KPj4+Pg0KPj4+PiBbLi4uXQ0KPj4+Pg0KPj4+PiBNQlIsIFNlcmdlaQ0KPj4+IFN1cmUs
IHdlIGNhbiBkbyB0aGF0Lg0KPj4gSXNuJ3QgaXQganVzdDoNCj4+IAkJaWYgKG1pbm9yX3Jldmlz
aW9uIDwgMHgxMCkNCj4+IAkJCW1pbm9yX3JldmlzaW9uIDw8PSA0Ow0KPj4NCj4+IAlEYXZpZA0K
Pj4NCj4+DQo+IEFoLi4uLiBOb3Qgc3VyZSB3aGF0IEkgd2FzIHRoaW5raW5nIHdoZW4gSSBtYWRl
IHRoYXQgcm91bmRhYm91dCBjaGVjay4NCj4gVGhhbmtzIGZvciBwb2ludGluZyBpdCBvdXQuDQoN
CkJ0dywgdGhlIGludGVudGlvbiBpcyB0aGlzOg0KaWYgKG1pbm9yX3JldmlzaW9uID7CoCAweDAw
ICYmIG1pbm9yX3JldmlzaW9uIDwgMHgxMCkgLi4uDQoNCkl0J3MgbXVjaCBjbGVhcmVyIHRoaXMg
d2F5LiBJJ2xsIG1ha2UgdGhlIGNoYW5nZSBhZnRlciBtb3JlIGZlZWRiYWNrcyBvbg0Kb3RoZXIg
cGF0Y2hlcy4NCg0KQlIsDQpUaGluaA0K
