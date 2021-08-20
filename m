Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F01023F246F
	for <lists+linux-usb@lfdr.de>; Fri, 20 Aug 2021 03:52:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234909AbhHTBwr (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 19 Aug 2021 21:52:47 -0400
Received: from smtprelay-out1.synopsys.com ([149.117.73.133]:57640 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234428AbhHTBwq (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 19 Aug 2021 21:52:46 -0400
Received: from mailhost.synopsys.com (badc-mailhost3.synopsys.com [10.192.0.81])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 5BAA046494;
        Fri, 20 Aug 2021 01:52:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1629424329; bh=wKd7KXvq4vTU88EyIHLTNRggz9Y8Z/i92VXKoG1Xty8=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=H7CJsd/Bf/e2xVQNbPPWBBDoPDULaWbptCTXN+vL9LEsk4weZEgGnI4sW1vEipvWx
         F3kBL0wYUHOH8lMhMbx8EqUVOt2NKXTvCqHW6jTwfw8yWIHo4vq6Vp8hGpdtbucQGC
         Vvo0r7r/ErkoGuBdUmSsEaZ6OuFqyByPuZul6Nb6XXcQXtVZxzVywBRH0i+gbf82LG
         1wjiYSeqsbJluyRJGNq/oY2ftRT1jV4Yam/ULdFnatDwYUeokVjhZ0aUoCajUOxnsd
         FPRnrNyp4UjRm+j0WWOKR6zfl+a5RcyWuECg3kFa2YWU/5X4SPXDo4LeEJmyrhVK7D
         SPKJHl0ko5XaA==
Received: from o365relay-in.synopsys.com (sv2-o365relay1.synopsys.com [10.202.1.137])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (verified OK))
        by mailhost.synopsys.com (Postfix) with ESMTPS id 99CF4A0068;
        Fri, 20 Aug 2021 01:52:08 +0000 (UTC)
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2043.outbound.protection.outlook.com [104.47.66.43])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
        by o365relay-in.synopsys.com (Postfix) with ESMTPS id 297B7400B0;
        Fri, 20 Aug 2021 01:52:06 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=thinhn@synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
        dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="G89D/Z4I";
        dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PSB4KtKCeqLn70EtxYYZtnVxawbY9c4ZUNbV8NlgkCM422SgTFI33dnWbRMZuaDti7UY8XCEjVOajovMIfRLBkbk3W+eG3ErMg9fUBf6FkHbw02BlKRN+zDzrXtOGpr4eLhYRyMeH8NN7TJ8vMMBY1gg4eHG1jMTIb4rYfPa0uC1EZ53qp8eKqC7o9H1/EC9fKOt4/3Gdgn21aAvU/Dt0fj2FZPlTO6d9kETgxudhFTqQdQzSM7+3ubNeBK/JB5wINVNzXcbQfra8aIICIDog67CALn9qXDA+05mp5Ikffb3qYxz1qBCQhIMXrqDPuTRP+FXa8LIaLzPe+YiLhhNDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wKd7KXvq4vTU88EyIHLTNRggz9Y8Z/i92VXKoG1Xty8=;
 b=UQikaFgPcBW5nOeSVe6RtTj3ODP6qngP+YfebTYeHcvRbq2u3wPFVkrUtXJfisubj/fcGz/NP4BiH5BkHcx4mdXqSJwWczT7iBCKhZ2ONITOehr/rdoHWAU3KCK8j3R54L9XEHEBQPjuMbq84D6WK4KK+QFo2LTx7A8pdgu2IkTal0UR7gLjL3kU8c1wQ8DCWrSbmwcDOMije54SsrXgAbny1gMLHF/qo5bjmPydBYa13R/Go9rZuvGDG814OWiWfek3kdQWMqWJ7L7HUZmaSVuB7gjTpbXgvkSRA3gsBPFnHm3b+CQN3ZFLnfLSV74wLgc2pT7SAseTTIvf+bloKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wKd7KXvq4vTU88EyIHLTNRggz9Y8Z/i92VXKoG1Xty8=;
 b=G89D/Z4IqrMULC7Ct/bAwl+wLCG1U4Upn1B2NiwqTmx0oF/auxRaZ5H1va2YC7h4YUTB9YnVWx8wRrfmiBzeYN8f/9u8EbtYmp9n/Fwc4op5gbISjYqu3GtHnXGtbaQXIhSIFvaYTKwyqlH8x5cKOYTX1BReaZoog8/yps5yi5Q=
Received: from BYAPR12MB4791.namprd12.prod.outlook.com (2603:10b6:a03:10a::12)
 by BYAPR12MB3447.namprd12.prod.outlook.com (2603:10b6:a03:a9::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.19; Fri, 20 Aug
 2021 01:52:05 +0000
Received: from BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::163:f142:621e:3db9]) by BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::163:f142:621e:3db9%7]) with mapi id 15.20.4436.019; Fri, 20 Aug 2021
 01:52:04 +0000
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To:     Wesley Cheng <wcheng@codeaurora.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Felipe Balbi <balbi@kernel.org>
CC:     "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "jackp@codeauora.org" <jackp@codeauora.org>
Subject: Re: [RFC][PATCH] usb: dwc3: usb: dwc3: Force stop EP0 transfers
 during pullup disable
Thread-Topic: [RFC][PATCH] usb: dwc3: usb: dwc3: Force stop EP0 transfers
 during pullup disable
Thread-Index: AQHXjlfnBCk6lwHDK0Kvf9A7ww7BQqtvCnaAgAETMgCAAEh3AIAAHhwAgAGTEQCAAAe1gIAAC4YAgAGREQCAAF71AIABNUyAgAE5FYCAA0k9gIAANtcAgAFSW4CAAFPkgA==
Date:   Fri, 20 Aug 2021 01:52:04 +0000
Message-ID: <f2cdd897-dc8d-a506-9ce4-6d38ef355420@synopsys.com>
References: <1628648608-15239-1-git-send-email-wcheng@codeaurora.org>
 <bcc8ff30-5c49-bddd-2f61-05da859b2647@synopsys.com>
 <3edf74ba-d167-0589-a7ab-827b57aa5d9c@codeaurora.org>
 <e07b7061-e9cf-3146-d115-56967298051e@synopsys.com>
 <c82ee8f3-a364-f96f-76ac-2b78c1dc0517@codeaurora.org>
 <f760fdcf-cd59-2c71-8c85-a4624620edeb@synopsys.com>
 <5be881a9-c79d-3f21-9e2e-173307fef734@codeaurora.org>
 <dc37617c-0fe4-47b3-cbd0-1d729ce6201a@synopsys.com>
 <00952bdc-acc2-f373-9286-6a8380e0b7d1@synopsys.com>
 <875yw7jkz6.fsf@kernel.org>
 <89b4d57c-f44a-ceff-45f3-a308e1d8d135@synopsys.com>
 <4c5ee1be-5cda-f56b-7f69-73124a16abba@codeaurora.org>
 <278cc2b5-9f0d-840e-372a-7949b79e858d@codeaurora.org>
 <096a03e0-a913-7188-2c2e-d801d9617160@synopsys.com>
 <cdd9d624-00c6-1be3-5aad-e6f923d1e8d8@codeaurora.org>
In-Reply-To: <cdd9d624-00c6-1be3-5aad-e6f923d1e8d8@codeaurora.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
authentication-results: codeaurora.org; dkim=none (message not signed)
 header.d=none;codeaurora.org; dmarc=none action=none
 header.from=synopsys.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 85f3ade1-0a0e-4bce-ce87-08d9637d1c60
x-ms-traffictypediagnostic: BYAPR12MB3447:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR12MB3447B6664CACD12324F2CEE6AAC19@BYAPR12MB3447.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: CXsnMu8Osr1v9cRgM0erCsf/FOwaBl5Cs0L15HVdTk407COAlLqOUiSX63t//YLnkgjd7/MVTh2LZfb+IgCx0eF2xx2GaBvEPvUEexC8oCL1tYgpQ8ISbkdkQfjxdBmi0vbrwIv31Cv6VeK1rslvR1lTEr46c8Qh+zeTC8XfepeLClMEEFR3Zjf0I49I0mU4HGOxG6Jn1qSmoOsJcinuxmvDapeNw/9x8LFDbtdBfltouubzBCWInnHvMY1LT9XYd4RIBTKtDokVZHa/92dBNKnWgFj24lSAbkQxORZCDcAZrQuMFOcnCzUV7qBTdcLJDdxf/doKjs6oeMlc6T7iU20TY+zY6RWRc/KwT64posUeWIT3tGLJOWA2dn0cT7nOeGdbkIYQqaCqk5gYdDQKXIhXQNC1Tmroh9htMjSy+/1V9HQGlfrPhnk54px9GpXPpqu9GuvvMJs4dNgLeN9ZrtWeJkCaU6e8zsLuxBAGztGdcAr1VOSbpL7iMz5neTgwEXKaS5NXzDyUAjoqESHLjueFCDh/7uRGDBWDNo+J8qJmrvKm1UWoiHs0lrPQoVUHP8KIVCIzcvJ3FzTtDWUjeSeT6Xa7Yzv8nWrdP/FATkiwjRWxLy1u1TuH6WN9fctXeoBWzwzfN3bC4OVcBTGha937sP/d6rfeHZ4Tf1OZGIJgRmcrz8wf9gS4z1rfCW9AUlf0l7TvGrTvP4Oww6OMKfp5UHPkmhfcWALd5uus4h+ajbHZUREklPFoM3J39PrcWUY71/eZdBLNPjB5jas7rw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB4791.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(346002)(136003)(396003)(376002)(366004)(39860400002)(66946007)(83380400001)(76116006)(478600001)(8676002)(6506007)(36756003)(122000001)(64756008)(5660300002)(6486002)(53546011)(4326008)(38100700002)(54906003)(66476007)(30864003)(66446008)(66556008)(26005)(38070700005)(6512007)(110136005)(31696002)(2616005)(86362001)(8936002)(71200400001)(186003)(316002)(31686004)(2906002)(45980500001)(43740500002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TzhMMlZmVkpRVzRwL1FsSEFoY0VOWSsxTitYaEZobXk5SE1mTitnYS9UZ282?=
 =?utf-8?B?ZU1FN1Q3eVVZbGlaNGNnbEtCMEJZV0dldnZabHJZcDFmR3F2S0UvWEJneC8y?=
 =?utf-8?B?WGFKN2dKSGxGOWdJSi8zZjZuMHVoYm5heFExTUNOUEV4R1ZSaVFPWkpyL3lk?=
 =?utf-8?B?UkVkbkFlcnRGSXJwZ3pBeXZsYUhUc2JqNUpMN0VxK1hDMUhoU2QvL2xMQmpi?=
 =?utf-8?B?VGFzczg0TExKclFsV3Zlb1NMaXlXemgyRjNuRjhqSnA4U1MxaXpXaEI4d2k1?=
 =?utf-8?B?Y1pNcWZ1OFdadkFLQmJPamo3c3lWREdCaTlZcndsM1FKUnhWSGZRTE1uQldB?=
 =?utf-8?B?RXhQRE1Mc0FzQTVSZDRWWVZPRlNFZG9OSFllT3ZwUDlDSVliSmpJL2lPVkNI?=
 =?utf-8?B?djRCcE1HVEo3akRjaXRzdFgzS2FFVzdQaUNaSFljQVRQOUlrTnppMnpZS1ow?=
 =?utf-8?B?TkVQcUVWRXRvZk5rTmJTRHlDRmRBSEU4YVdBOXZ2Tm44VmQyV21zbnBFc2lE?=
 =?utf-8?B?bDZleFZHS2hPbWgyQ1dqVG1WeDY1QUUybHF3K2xKK0ZJK0VqYVJrMlNyNCtP?=
 =?utf-8?B?UFNZb0s1Z043cVg2b2M0aTFXMEZWeVJhYW9BZnU0L3ptRU1QaEs0NExRQlVR?=
 =?utf-8?B?TGV4VnludHNzVnNSdm8ybUVTc3RVTFZJUkJIMCtJbG1rTlY1aGZIMTZ3V2hv?=
 =?utf-8?B?NFpUWjBocHVvTlFUSGlvMDgrcENSVmtYN0l3VjFqNzRSWFVFY1YyNFk1aDJH?=
 =?utf-8?B?NndhczZ3R2Iza0kwem9OWFFNRSs0cUpia2Jycmx5SXJGNmQwS2Q0cm81RFd3?=
 =?utf-8?B?WHp5Yjh0U0laUTc4Y0FSK2lTeTlYYnZrenlLb3FUYUdBdXRxK0tmZTI1NWJs?=
 =?utf-8?B?dURBZVFsNFpwbmpNbjNEUjNYME4xWTVGWVk0SFJXMDE4UFdNV1lXSEdjTnNw?=
 =?utf-8?B?ckRweUx5UnhsaWpQcnEzTDZwVndacDBGaGx2UGxkQXlyVlBxSVFsbXlteHpt?=
 =?utf-8?B?Q1dHeWlxZG1hTW83WjFNVU5tTVRBb0Y1RURvS2pXZUh6WmxkSFVWbW92cUpI?=
 =?utf-8?B?Tk5hZUN1TnRpQ2orczNqS24rZERJcS9JTmFZZ1RoQTE5QVFxRXJ5d1dvYy9S?=
 =?utf-8?B?SzAxS2tLbGMyMGJ1N2IveFp5YzdMZVRSK1RBbEt0MmdER2Z5VDk5RW05d1N6?=
 =?utf-8?B?SVF1enNONE80alJaQzFiWUNGUE9mZDFvem9oS2d0bEFlTDBmSTY0OEtPcXRG?=
 =?utf-8?B?aWNoa3l5Q0U0b29FdnBxWXordVRVWko0eEg4TDF0UktTdW14KzdaK08zcWJz?=
 =?utf-8?B?SEM1NE9MZkp0YzFCUkdLMEpGOHdwbWpVRjVFeVAwcktaSWx0aWMzOFBLSXo2?=
 =?utf-8?B?WXFST2grbGVHNHZJY2V1dXh3dnU4RzRFeWY0ODU2RkxOTTN2cDRwZ0RCQVda?=
 =?utf-8?B?akVpTjBGN2JSbklDQzhaWS9qT2FMTXBtalYweDYzUVAxSVBEVzJrMEJLWHpP?=
 =?utf-8?B?NlpaZEt3WGNUdUtpVzk3RGo2QnVvdlI0V2dudjQyd0lxZ01XZmVpQnZ2TFNW?=
 =?utf-8?B?QjNHVHhPR3BHNHRmanZYbS9KNlR2TGFMKzBVRnNteks4MkFTL3ZkbUdHZG1Z?=
 =?utf-8?B?bStkdC84SEFMM2JZWkxYQTRxekhienBuL0N0MGdjbU03T2p3NUlaY2kxV3Jr?=
 =?utf-8?B?WUZITFc5K1l4emViNWtHQXRHb21BUkNKWm5FUVlsdHpUUUdyaGVCZWpmNVpV?=
 =?utf-8?Q?oRkF8tmLB8iH4P8Rs0=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <143AB8AEA428C5488ADD889DE99960F4@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB4791.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 85f3ade1-0a0e-4bce-ce87-08d9637d1c60
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Aug 2021 01:52:04.6214
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WD3sjIlRruzXDbLR/lYswQzVkb67ThbBsYixzC59uxHA3Q7Maistk/L+5dJ2euaBNv2U8ryZrMjueEYdXYrP3Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3447
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

V2VzbGV5IENoZW5nIHdyb3RlOg0KPiBIaSBUaGluaCwNCj4gDQo+IE9uIDgvMTgvMjAyMSA1OjQw
IFBNLCBUaGluaCBOZ3V5ZW4gd3JvdGU6DQo+PiBXZXNsZXkgQ2hlbmcgd3JvdGU6DQo+Pj4gSGkg
VGhpbmgvRmVsaXBlLA0KPj4+DQo+Pj4gT24gOC8xNi8yMDIxIDEyOjEzIFBNLCBXZXNsZXkgQ2hl
bmcgd3JvdGU6DQo+Pj4+IEhpIFRoaW5oLA0KPj4+Pg0KPj4+PiBPbiA4LzE1LzIwMjEgNTozMyBQ
TSwgVGhpbmggTmd1eWVuIHdyb3RlOg0KPj4+Pj4gRmVsaXBlIEJhbGJpIHdyb3RlOg0KPj4+Pj4+
DQo+Pj4+Pj4gSGksDQo+Pj4+Pj4NCj4+Pj4+PiBUaGluaCBOZ3V5ZW4gPFRoaW5oLk5ndXllbkBz
eW5vcHN5cy5jb20+IHdyaXRlczoNCj4+Pj4+Pj4+Pj4+Pj4+PiBJZiB0aGlzIG9jY3VycywgdGhl
biB0aGUgZW50aXJlIHB1bGx1cCBkaXNhYmxlIHJvdXRpbmUgaXMgc2tpcHBlZCBhbmQNCj4+Pj4+
Pj4+Pj4+Pj4+PiBwcm9wZXIgY2xlYW51cCBhbmQgaGFsdGluZyBvZiB0aGUgY29udHJvbGxlciBk
b2VzIG5vdCBjb21wbGV0ZS4NCj4+Pj4+Pj4+Pj4+Pj4+PiBJbnN0ZWFkIG9mIHJldHVybmluZyBh
biBlcnJvciAod2hpY2ggaXMgaWdub3JlZCBmcm9tIHRoZSBVREMNCj4+Pj4+Pj4+Pj4+Pj4+PiBw
ZXJzcGVjdGl2ZSksIGRvIHdoYXQgaXMgbWVudGlvbmVkIGluIHRoZSBjb21tZW50cyBhbmQgZm9y
Y2UgdGhlDQo+Pj4+Pj4+Pj4+Pj4+Pj4gdHJhbnNhY3Rpb24gdG8gY29tcGxldGUgYW5kIHB1dCB0
aGUgZXAwc3RhdGUgYmFjayB0byB0aGUgU0VUVVAgcGhhc2UuDQo+Pj4+Pj4+Pj4+Pj4+Pj4NCj4+
Pj4+Pj4+Pj4+Pj4+PiBTaWduZWQtb2ZmLWJ5OiBXZXNsZXkgQ2hlbmcgPHdjaGVuZ0Bjb2RlYXVy
b3JhLm9yZz4NCj4+Pj4+Pj4+Pj4+Pj4+PiAtLS0NCj4+Pj4+Pj4+Pj4+Pj4+PiAgZHJpdmVycy91
c2IvZHdjMy9lcDAuYyAgICB8IDQgKystLQ0KPj4+Pj4+Pj4+Pj4+Pj4+ICBkcml2ZXJzL3VzYi9k
d2MzL2dhZGdldC5jIHwgNiArKysrKy0NCj4+Pj4+Pj4+Pj4+Pj4+PiAgZHJpdmVycy91c2IvZHdj
My9nYWRnZXQuaCB8IDMgKysrDQo+Pj4+Pj4+Pj4+Pj4+Pj4gIDMgZmlsZXMgY2hhbmdlZCwgMTAg
aW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkNCj4+Pj4+Pj4+Pj4+Pj4+Pg0KPj4+Pj4+Pj4+
Pj4+Pj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3VzYi9kd2MzL2VwMC5jIGIvZHJpdmVycy91c2Iv
ZHdjMy9lcDAuYw0KPj4+Pj4+Pj4+Pj4+Pj4+IGluZGV4IDY1ODczOTQuLmFiZmM0MmIgMTAwNjQ0
DQo+Pj4+Pj4+Pj4+Pj4+Pj4gLS0tIGEvZHJpdmVycy91c2IvZHdjMy9lcDAuYw0KPj4+Pj4+Pj4+
Pj4+Pj4+ICsrKyBiL2RyaXZlcnMvdXNiL2R3YzMvZXAwLmMNCj4+Pj4+Pj4+Pj4+Pj4+PiBAQCAt
MjE4LDcgKzIxOCw3IEBAIGludCBkd2MzX2dhZGdldF9lcDBfcXVldWUoc3RydWN0IHVzYl9lcCAq
ZXAsIHN0cnVjdCB1c2JfcmVxdWVzdCAqcmVxdWVzdCwNCj4+Pj4+Pj4+Pj4+Pj4+PiAgCXJldHVy
biByZXQ7DQo+Pj4+Pj4+Pj4+Pj4+Pj4gIH0NCj4+Pj4+Pj4+Pj4+Pj4+PiAgDQo+Pj4+Pj4+Pj4+
Pj4+Pj4gLXN0YXRpYyB2b2lkIGR3YzNfZXAwX3N0YWxsX2FuZF9yZXN0YXJ0KHN0cnVjdCBkd2Mz
ICpkd2MpDQo+Pj4+Pj4+Pj4+Pj4+Pj4gK3ZvaWQgZHdjM19lcDBfc3RhbGxfYW5kX3Jlc3RhcnQo
c3RydWN0IGR3YzMgKmR3YykNCj4+Pj4+Pj4+Pj4+Pj4+PiAgew0KPj4+Pj4+Pj4+Pj4+Pj4+ICAJ
c3RydWN0IGR3YzNfZXAJCSpkZXA7DQo+Pj4+Pj4+Pj4+Pj4+Pj4gIA0KPj4+Pj4+Pj4+Pj4+Pj4+
IEBAIC0xMDczLDcgKzEwNzMsNyBAQCB2b2lkIGR3YzNfZXAwX3NlbmRfZGVsYXllZF9zdGF0dXMo
c3RydWN0IGR3YzMgKmR3YykNCj4+Pj4+Pj4+Pj4+Pj4+PiAgCV9fZHdjM19lcDBfZG9fY29udHJv
bF9zdGF0dXMoZHdjLCBkd2MtPmVwc1tkaXJlY3Rpb25dKTsNCj4+Pj4+Pj4+Pj4+Pj4+PiAgfQ0K
Pj4+Pj4+Pj4+Pj4+Pj4+ICANCj4+Pj4+Pj4+Pj4+Pj4+PiAtc3RhdGljIHZvaWQgZHdjM19lcDBf
ZW5kX2NvbnRyb2xfZGF0YShzdHJ1Y3QgZHdjMyAqZHdjLCBzdHJ1Y3QgZHdjM19lcCAqZGVwKQ0K
Pj4+Pj4+Pj4+Pj4+Pj4+ICt2b2lkIGR3YzNfZXAwX2VuZF9jb250cm9sX2RhdGEoc3RydWN0IGR3
YzMgKmR3Yywgc3RydWN0IGR3YzNfZXAgKmRlcCkNCj4+Pj4+Pj4+Pj4+Pj4+PiAgew0KPj4+Pj4+
Pj4+Pj4+Pj4+ICAJc3RydWN0IGR3YzNfZ2FkZ2V0X2VwX2NtZF9wYXJhbXMgcGFyYW1zOw0KPj4+
Pj4+Pj4+Pj4+Pj4+ICAJdTMyCQkJY21kOw0KPj4+Pj4+Pj4+Pj4+Pj4+IGRpZmYgLS1naXQgYS9k
cml2ZXJzL3VzYi9kd2MzL2dhZGdldC5jIGIvZHJpdmVycy91c2IvZHdjMy9nYWRnZXQuYw0KPj4+
Pj4+Pj4+Pj4+Pj4+IGluZGV4IDU0YzVhMDguLmEwZTJlNGQgMTAwNjQ0DQo+Pj4+Pj4+Pj4+Pj4+
Pj4gLS0tIGEvZHJpdmVycy91c2IvZHdjMy9nYWRnZXQuYw0KPj4+Pj4+Pj4+Pj4+Pj4+ICsrKyBi
L2RyaXZlcnMvdXNiL2R3YzMvZ2FkZ2V0LmMNCj4+Pj4+Pj4+Pj4+Pj4+PiBAQCAtMjQzNyw3ICsy
NDM3LDExIEBAIHN0YXRpYyBpbnQgZHdjM19nYWRnZXRfcHVsbHVwKHN0cnVjdCB1c2JfZ2FkZ2V0
ICpnLCBpbnQgaXNfb24pDQo+Pj4+Pj4+Pj4+Pj4+Pj4gIAkJCQltc2Vjc190b19qaWZmaWVzKERX
QzNfUFVMTF9VUF9USU1FT1VUKSk7DQo+Pj4+Pj4+Pj4+Pj4+Pj4gIAkJaWYgKHJldCA9PSAwKSB7
DQo+Pj4+Pj4+Pj4+Pj4+Pj4gIAkJCWRldl9lcnIoZHdjLT5kZXYsICJ0aW1lZCBvdXQgd2FpdGlu
ZyBmb3IgU0VUVVAgcGhhc2VcbiIpOw0KPj4+Pj4+Pj4+Pj4+Pj4+IC0JCQlyZXR1cm4gLUVUSU1F
RE9VVDsNCj4+Pj4+Pj4+Pj4+Pj4+PiArCQkJc3Bpbl9sb2NrX2lycXNhdmUoJmR3Yy0+bG9jaywg
ZmxhZ3MpOw0KPj4+Pj4+Pj4+Pj4+Pj4+ICsJCQlkd2MzX2VwMF9lbmRfY29udHJvbF9kYXRhKGR3
YywgZHdjLT5lcHNbMF0pOw0KPj4+Pj4+Pj4+Pj4+Pj4+ICsJCQlkd2MzX2VwMF9lbmRfY29udHJv
bF9kYXRhKGR3YywgZHdjLT5lcHNbMV0pOw0KPj4+Pj4+Pj4+Pj4+Pj4NCj4+Pj4+Pj4+Pj4+Pj4+
IEVuZCB0cmFuc2ZlciBjb21tYW5kIHRha2VzIHRpbWUsIG5lZWQgdG8gd2FpdCBmb3IgaXQgdG8g
Y29tcGxldGUgYmVmb3JlDQo+Pj4+Pj4+Pj4+Pj4+PiBpc3N1aW5nIFN0YXJ0IHRyYW5zZmVyIGFn
YWluLiBBbHNvLCB3aHkgcmVzdGFydCBhZ2FpbiB3aGVuIGl0J3MgYWJvdXQgdG8NCj4+Pj4+Pj4+
Pj4+Pj4+IGJlIGRpc2Nvbm5lY3RlZC4NCj4+Pj4+Pj4+Pj4+Pj4NCj4+Pj4+Pj4+Pj4+Pj4gSSBj
YW4gdHJ5IHdpdGhvdXQgcmVzdGFydGluZyBpdCBhZ2FpbiwgYW5kIHNlZSBpZiB0aGF0IHdvcmtz
LiAgSW5zdGVhZA0KPj4+Pj4+Pj4+Pj4+PiBvZiB3YWl0aW5nIGZvciB0aGUgY29tbWFuZCBjb21w
bGV0ZSBldmVudCwgY2FuIHdlIHNldCB0aGUgRm9yY2VSTSBiaXQsDQo+Pj4+Pj4+Pj4+Pj4+IHNp
bWlsYXIgdG8gd2hhdCB3ZSBkbyBmb3IgZHdjM19yZW1vdmVfcmVxdWVzdHMoKT8NCj4+Pj4+Pj4+
Pj4+Pj4NCj4+Pj4+Pj4+Pj4+Pg0KPj4+Pj4+Pj4+Pj4+IEZvcmNlUk09MSBtZWFucyB0aGF0IHRo
ZSBjb250cm9sbGVyIHdpbGwgaWdub3JlIHVwZGF0aW5nIHRoZSBUUkJzDQo+Pj4+Pj4+Pj4+Pj4g
KGluY2x1ZGluZyBub3QgY2xlYXJpbmcgdGhlIEhXTyBhbmQgcmVtYWluIHRyYW5zZmVyIHNpemUp
LiBUaGUgZHJpdmVyDQo+Pj4+Pj4+Pj4+Pj4gc3RpbGwgbmVlZHMgdG8gd2FpdCBmb3IgdGhlIGNv
bW1hbmQgdG8gY29tcGxldGUgYmVmb3JlIGlzc3VpbmcgU3RhcnQNCj4+Pj4+Pj4+Pj4+PiBUcmFu
c2ZlciBjb21tYW5kLiBPdGhlcndpc2UgU3RhcnQgVHJhbnNmZXIgd29uJ3QgZ28gdGhyb3VnaC4g
SWYgd2Uga25vdw0KPj4+Pj4+Pj4+Pj4+IHRoYXQgd2UncmUgbm90IGdvaW5nIHRvIGlzc3VlIFN0
YXJ0IFRyYW5zZmVyIGFueSB0aW1lIHNvb24sIHRoZW4gd2UgbWF5DQo+Pj4+Pj4+Pj4+Pj4gYmUg
YWJsZSB0byBnZXQgYXdheSB3aXRoIGlnbm9yaW5nIEVuZCBUcmFuc2ZlciBjb21tYW5kIGNvbXBs
ZXRpb24uDQo+Pj4+Pj4+Pj4+Pj4NCj4+Pj4+Pj4+Pj4+DQo+Pj4+Pj4+Pj4+PiBJIHNlZS4gIEN1
cnJlbnRseSwgaW4gdGhlIHBsYWNlIHRoYXQgd2UgZG8gdXNlDQo+Pj4+Pj4+Pj4+PiBkd2MzX2Vw
MF9lbmRfY29udHJvbF9kYXRhKCksIGl0cyBmb2xsb3dlZCBieQ0KPj4+Pj4+Pj4+Pj4gZHdjM19l
cDBfc3RhbGxfYW5kX3Jlc3RhcnQoKSB3aGljaCB3b3VsZCBleGVjdXRlIHN0YXJ0IHRyYW5zZmVy
LiAgRm9yDQo+Pj4+Pj4+Pj4+DQo+Pj4+Pj4+Pj4+IFRoYXQgZG9lc24ndCBsb29rIHJpZ2h0LiBZ
b3UgY2FuIHRyeSB0byBzZWUgaWYgaXQgY2FuIHJlY292ZXIgZnJvbSBhDQo+Pj4+Pj4+Pj4+IGNv
bnRyb2wgd3JpdGUgcmVxdWVzdC4gT2Z0ZW4gdGltZSB3ZSBkbyBjb250cm9sIHJlYWQgYW5kIG5v
dCB3cml0ZS4NCj4+Pj4+Pj4+Pj4gKGkuZS4gdHJ5IHRvIEVuZCBUcmFuc2ZlciBhbmQgaW1tZWRp
YXRlbHkgU3RhcnQgVHJhbnNmZXIgb24gdGhlIHNhbWUNCj4+Pj4+Pj4+Pj4gZGlyZWN0aW9uIGNv
bnRyb2wgZW5kcG9pbnQpLg0KPj4+Pj4+Pj4+Pg0KPj4+Pj4+Pj4+IE9LLCBJIGNhbiB0cnksIGJ1
dCBqdXN0IHRvIGNsYXJpZnksIEkgd2FzIHJlZmVycmluZyB0byBob3cgaXQgd2FzIGJlaW5nDQo+
Pj4+Pj4+Pj4gZG9uZSBpbjoNCj4+Pj4+Pj4+Pg0KPj4+Pj4+Pj4+IHN0YXRpYyB2b2lkIGR3YzNf
ZXAwX3hmZXJub3RyZWFkeShzdHJ1Y3QgZHdjMyAqZHdjLA0KPj4+Pj4+Pj4+IAkJY29uc3Qgc3Ry
dWN0IGR3YzNfZXZlbnRfZGVwZXZ0ICpldmVudCkNCj4+Pj4+Pj4+PiB7DQo+Pj4+Pj4+Pj4gLi4u
DQo+Pj4+Pj4+Pj4gCQlpZiAoZHdjLT5lcDBfZXhwZWN0X2luICE9IGV2ZW50LT5lbmRwb2ludF9u
dW1iZXIpIHsNCj4+Pj4+Pj4+PiAJCQlzdHJ1Y3QgZHdjM19lcAkqZGVwID0gZHdjLT5lcHNbZHdj
LT5lcDBfZXhwZWN0X2luXTsNCj4+Pj4+Pj4+Pg0KPj4+Pj4+Pj4+IAkJCWRldl9lcnIoZHdjLT5k
ZXYsICJ1bmV4cGVjdGVkIGRpcmVjdGlvbiBmb3IgRGF0YSBQaGFzZVxuIik7DQo+Pj4+Pj4+Pj4g
CQkJZHdjM19lcDBfZW5kX2NvbnRyb2xfZGF0YShkd2MsIGRlcCk7DQo+Pj4+Pj4+Pj4gCQkJZHdj
M19lcDBfc3RhbGxfYW5kX3Jlc3RhcnQoZHdjKTsNCj4+Pj4+Pj4+PiAJCQlyZXR1cm47DQo+Pj4+
Pj4+Pj4gCQl9DQo+Pj4+Pj4+Pj4NCj4+Pj4+Pj4NCj4+Pj4+Pj4gTG9va2luZyBhdCB0aGlzIHNu
aXBwZXQgYWdhaW4sIGl0IGxvb2tzIHdyb25nLiBGb3IgY29udHJvbCB3cml0ZQ0KPj4+Pj4+PiB1
bmV4cGVjdGVkIGRpcmVjdGlvbiwgaWYgdGhlIGRyaXZlciBoYXNuJ3Qgc2V0dXAgYW5kIHN0YXJ0
ZWQgdGhlIERBVEENCj4+Pj4+Pj4gcGhhc2UgeWV0LCB0aGVuIGl0J3MgZmluZSwgYnV0IHRoZXJl
IGlzIGEgcHJvYmxlbSBpZiBpdCBkaWQuDQo+Pj4+Pj4+DQo+Pj4+Pj4+IFNpbmNlIGR3YzNfZXAw
X2VuZF9jb250cm9sX2RhdGEoKSBkb2Vzbid0IGlzc3VlIEVuZCBUcmFuc2ZlciBjb21tYW5kIHRv
DQo+Pj4+Pj4+IGVwMCBkdWUgdG8gdGhlIHJlc291cmNlX2luZGV4IGNoZWNrLCBpdCBkb2Vzbid0
IGZvbGxvdyB0aGUgY29udHJvbA0KPj4+Pj4+DQo+Pj4+Pj4gSUlSQyByZXNvdXJjZV9pbmRleCBp
cyBhbHdheXMgbm9uLXplcm8sIHNvIHRoZSBjb21tYW5kIHNob3VsZCBiZQ0KPj4+Pj4NCj4+Pj4+
IE5vLCByZXNvdXJjZV9pbmRleCBmb3IgZXAwb3V0IGlzIDAsIGVwMGluIGlzIDEuIFlvdSBjYW4g
Y2hlY2sgZnJvbSBhbnkNCj4+Pj4+IG9mIHRoZSBkcml2ZXIgdHJhY2Vwb2ludCBsb2cgZm9yIHRo
ZSByZXR1cm4gdmFsdWUgb2YgU3RhcnQgVHJhbnNmZXINCj4+Pj4+IGNvbW1hbmQgZm9yIHRoZSBy
ZXNvdXJjZSBpbmRleCBvZiBlcDAuIFRoZXJlIGNvdWxkIGJlIGEgbWl4ZWQgdXAgd2l0aA0KPj4+
Pj4gdGhlIHVuZG9jdW1lbnRlZCByZXR1cm4gdmFsdWUgb2YgU2V0IEVuZHBvaW50IFRyYW5zZmVy
IFJlc291cmNlIGNvbW1hbmQNCj4+Pj4+IGJlZm9yZSB3aGVuIHRoaXMgY29kZSB3YXMgd3JpdHRl
biwgZG9uJ3QgbWl4IHVwIHdpdGggdGhhdC4NCj4+Pj4+DQo+Pj4+Pj4gdHJpZ2dlcmVkLiBJZiB5
b3UgaGF2ZSBhY2Nlc3MgdG8gYSBMZWNyb3kgVVNCIFRyYWluZXIsIGNvdWxkIHlvdSBzY3JpcHQN
Cj4+Pj4+PiB0aGlzIHZlcnkgc2NlbmFyaW8gZm9yIHZlcmlmaWNhdGlvbj8NCj4+Pj4+DQo+Pj4+
PiBGb3IgYW55b25lIHdobyB3YW50cyB0byB3b3JrIG9uIHRoaXMsIHdlIGRvbid0IG5lZWQgYSBM
ZUNyb3kgVVNCDQo+Pj4+PiB0cmFpbmVyLiBJZiB5b3UgdXNlIHhoY2kgaG9zdCwganVzdCBtb2Rp
ZnkgdGhlIHhoY2ktcmluZy5jIHRvIHF1ZXVlIGENCj4+Pj4+IHdyb25nIGRpcmVjdGlvbiBEQVRB
IHBoYXNlIFRSQiBvZiBhIHBhcnRpY3VsYXIgY29udHJvbCB3cml0ZSByZXF1ZXN0DQo+Pj4+PiB0
ZXN0LCBhbmQgY29udGludWUgd2l0aCB0aGUgbmV4dCBjb250cm9sIHJlcXVlc3RzLg0KPj4+Pj4N
Cj4+Pj4gTGV0IG1lIGdpdmUgdGhpcyBhIHRyeSBzaW5jZSBJIGFscmVhZHkgaGF2ZSBhIG1vZGlm
aWVkIChicm9rZW4gOikpIFhIQ0kNCj4+Pj4gc3RhY2suDQo+Pj4+DQo+Pj4+IFRoYW5rcw0KPj4+
PiBXZXNsZXkgQ2hlbmcNCj4+Pg0KPj4+IFNvcnJ5IGZvciB0aGUgbGF0ZSByZXNwb25zZS4gIEkg
d2FzIHRyeWluZyB0byBnZXQgYSByZWxpYWJsZSBjaGFuZ2UgdG8NCj4+PiBnZXQgdGhlIGlzc3Vl
IHRvIHJlcHJvZHVjZS4gIEkgdGhpbmsgSSB3YXMgYWJsZSB0byBmaW5kIGEgc2V0IHVwIHdoaWNo
DQo+Pj4gd2lsbCBnZW5lcmF0ZSB0aGUgdW5leHBlY3RlZCBkaXJlY3Rpb24gaXNzdWUuICBJJ2xs
IHRyeSBteSBiZXN0IHRvDQo+Pj4gc3VtbWFyaXplIHRoZSB0cmFjZXMgaGVyZToNCj4+Pg0KPj4+
IFNldCB1cDoNCj4+PiAtIE1vZGlmaWVkIFhIQ0kgc3RhY2sgdG8gcXVldWUgYW4gSU4gVFJCIGZv
ciBhIHRocmVlIHN0YWdlIENPTlRST0wgT1VUDQo+Pj4gdHJhbnNhY3Rpb24gKE9VVCBkYXRhIHN0
YWdlKQ0KPj4+IC0gRGV2aWNlIGlzIHVzaW5nIFJORElTLCBhcyB0aGF0IGhhcyBpbnRlcmZhY2Ug
c3BlY2lmaWMgY29tbWFuZHMgKGllDQo+Pj4gU0VORF9FTkNBUFNVQUxURUQgbWVzc2FnZXMpDQo+
Pj4NCj4+PiBLZXJuZWwgTG9nOg0KPj4+IFsgMTI1NS4zMTI4NzBdIG1zbS11c2ItaHNwaHkgODhl
MzAwMC5oc3BoeTogQXZhaWwgY3VyciBmcm9tIFVTQiA9IDkwMA0KPj4+IFsgMTI1NS4zMTUzMDBd
IGR3YzNfZXAwX3hmZXJub3RyZWFkeSBldmVudCBzdGF0dXMgPSAxDQo+Pj4gWyAxMjU1LjMxNTQy
OV0gZHdjM19lcDBfeGZlcm5vdHJlYWR5IGV2ZW50IHN0YXR1cyA9IDINCj4+PiBbIDEyNTUuMzE2
MzkwXSBhbmRyb2lkX3dvcms6IHNlbnQgdWV2ZW50IFVTQl9TVEFURT1DT05GSUdVUkVEDQo+Pj4g
WyAxMjU1LjMxNzQ2N10gZHdjM19lcDBfeGZlcm5vdHJlYWR5IGV2ZW50IHN0YXR1cyA9IDENCj4+
PiBbIDEyNTUuMzE3NTg4XSBkd2MzX2VwMF94ZmVybm90cmVhZHkgZXZlbnQgc3RhdHVzID0gMg0K
Pj4+IFsgMTI1NS4zMzQxOTZdIGR3YzNfZXAwX3hmZXJub3RyZWFkeSBldmVudCBzdGF0dXMgPSAx
DQo+Pj4gWyAxMjU1LjMzNDIxN10gZHdjMyBhNjAwMDAwLmR3YzM6IHVuZXhwZWN0ZWQgZGlyZWN0
aW9uIGZvciBEYXRhIFBoYXNlDQo+Pj4gWyAxMjU1LjMzNDMxMV0gcm5kaXNfbXNnX3BhcnNlcjog
dW5rbm93biBSTkRJUyBtZXNzYWdlIDB4MDA1MjAzM0EgbGVuDQo+Pj4gNDQ1NjUyNg0KPj4+IFsg
MTI1NS4zMzQzMjhdIFJORElTIGNvbW1hbmQgZXJyb3IgLTUyNCwgMC8yNA0KPj4+IFsgMTI1NS4z
MzQzNjldIC0tLS0tLS0tLS0tLVsgY3V0IGhlcmUgXS0tLS0tLS0tLS0tLQ0KPj4+IFsgMTI1NS4z
MzQzNzddIGR3YzMgYTYwMDAwMC5kd2MzOiBObyByZXNvdXJjZSBmb3IgZXAwb3V0DQo+Pj4gWyAx
MjU1LjMzNDQ0MF0gV0FSTklORzogQ1BVOiAwIFBJRDogODM2NCBhdA0KPj4+IGRyaXZlcnMvdXNi
L2R3YzMvZ2FkZ2V0LmM6MzYwIGR3YzNfc2VuZF9nYWRnZXRfZXBfY21kKzB4M2M0LzB4OTZjDQo+
Pj4gLi4uDQo+Pj4gIDEyNTUuMzM2MTYzXSBXQVJOSU5HOiBDUFU6IDAgUElEOiA4MzY0IGF0IGRy
aXZlcnMvdXNiL2R3YzMvZXAwLmM6MjgxDQo+Pj4gZHdjM19lcDBfb3V0X3N0YXJ0KzB4MTA4LzB4
MTQ0DQo+Pj4NCj4+PiBTbyB0aGUga2VybmVsIGxvZyBkb2VzIGluZGVlZCBzaG93IHRoZSBjb25j
ZXJuIG1lbnRpb25lZCBieSBUaGluaCwgd2hlcmUNCj4+PiBhZnRlciBlbmRpbmcgdGhlIHRyYW5z
ZmVyLCB3ZSBkbyBzZWUgdGhlIGR3YzNfZXAwX291dF9zdGFydCgpIGZhaWwgZHVlDQo+Pj4gdG8g
bm8geGZlciByZXNvdXJjZS4NCj4+Pg0KPj4NCj4+IE5vLCB0aGVyZSdzIG5vIGVuZCB0cmFuc2Zl
ciBjb21tYW5kIHNlZW4sIGFuZCBpdCdzIGV4cGVjdGVkIGZyb20gY29kZQ0KPj4gcmV2aWV3Lg0K
Pj4NCj4gU29ycnksIHllcyB0aGF0J3MgY29ycmVjdC4NCj4+PiBmdHJhY2U6DQo+Pj4gPC4uLj4t
ODM2NCAgICBbMDAwXSBkLi4xICAxMjU1LjMzMzk4ODogZHdjM19jdHJsX3JlcTogR2V0IEludGVy
ZmFjZQ0KPj4+IFN0YXR1cyhJbnRmID0gMCwgTGVuZ3RoID0gMjQpDQo+Pj4gPC4uLj4tODM2NCAg
ICBbMDAwXSBkLi4xICAxMjU1LjMzNDExNTogZHdjM19wcmVwYXJlX3RyYjogZXAwb3V0OiB0cmIN
Cj4+PiBmZmZmZmZjMDFiZmZkMDAwIChFMTpEMCkgYnVmIDAwMDAwMDAwZWZiNzYwMDAgc2l6ZSAy
NCBjdHJsIDAwMDAwNDU1DQo+Pj4gKEhsQ3M6U2M6ZGF0YSkNCj4+PiA8Li4uPi04MzY0ICAgIFsw
MDBdIGQuLjEgIDEyNTUuMzM0MTI4OiBkd2MzX3ByZXBhcmVfdHJiOiBlcDBvdXQ6IHRyYg0KPj4+
IGZmZmZmZmMwMWJmZmQwMTAgKEUxOkQwKSBidWYgMDAwMDAwMDBlZmZmOTAwMCBzaXplIDQ4OCBj
dHJsIDAwMDAwYzUzDQo+Pj4gKEhMY3M6U0M6ZGF0YSkNCj4+PiA8Li4uPi04MzY0ICAgIFswMDBd
IGQuLjEgIDEyNTUuMzM0MTY2OiBkd2MzX2dhZGdldF9lcF9jbWQ6IGVwMG91dDogY21kDQo+Pj4g
J1N0YXJ0IFRyYW5zZmVyJyBbNDA2XSBwYXJhbXMgMDAwMDAwMDAgZWZmZmEwMDAgMDAwMDAwMDAg
LS0+IHN0YXR1czoNCj4+PiBTdWNjZXNzZnVsDQo+Pj4gPC4uLj4tODM2NCAgICBbMDAwXSBkLi4x
ICAxMjU1LjMzNDIzOTogZHdjM19nYWRnZXRfZXBfY21kOiBlcDBvdXQ6IGNtZA0KPj4+ICdTZXQg
U3RhbGwnIFs0MDRdIHBhcmFtcyAwMDAwMDAwMCAwMDAwMDAwMCAwMDAwMDAwMCAtLT4gc3RhdHVz
OiBTdWNjZXNzZnVsDQo+Pj4gPC4uLj4tODM2NCAgICBbMDAwXSBkLi4xICAxMjU1LjMzNDI5MTog
ZHdjM19nYWRnZXRfZ2l2ZWJhY2s6IGVwMG91dDogcmVxDQo+Pj4gZmZmZmZmODg5MTcyNGUwMCBs
ZW5ndGggMC8yNCB6c0kgPT0+IC0xMDQNCj4+DQo+PiBJdCBkZXRlY3RlZCB3cm9uZyBkaXJlY3Rp
b24gYW5kIHNldHMgU1RBTEwgaGVyZSwgYnV0IG5vIEVuZCBUcmFuc2Zlcg0KPj4gY29tbWFuZC4N
Cj4+DQo+Pj4gPC4uLj4tODM2NCAgICBbMDAwXSBkLi4xICAxMjU1LjMzNDMzOTogZHdjM19wcmVw
YXJlX3RyYjogZXAwb3V0OiB0cmINCj4+PiBmZmZmZmZjMDFiZmZkMDEwIChFMTpEMCkgYnVmIDAw
MDAwMDAwZWZmZmEwMDAgc2l6ZSA4IGN0cmwgMDAwMDBjMjMNCj4+PiAoSExjczpTQzpzZXR1cCkN
Cj4+DQo+PiBUaGUgZHJpdmVyIG92ZXJ3cm90ZSB0aGUgYWN0aXZlIFRSQiB3aXRoIGEgbmV3IFNF
VFVQIFRSQi4NCj4+DQo+Pj4gPC4uLj4tODM2NCAgICBbMDAwXSBkLi4xICAxMjU1LjMzNjA5OTog
ZHdjM19nYWRnZXRfZXBfY21kOiBlcDBvdXQ6IGNtZA0KPj4+ICdTdGFydCBUcmFuc2ZlcicgWzQw
Nl0gcGFyYW1zIDAwMDAwMDAwIGVmZmZhMDAwIDAwMDAwMDAwIC0tPiBzdGF0dXM6IE5vDQo+Pj4g
UmVzb3VyY2UNCj4+DQo+PiBUaGUgZGVwLT5mbGFncyBEV0MzX0VQX1RSQU5TRkVSX1NUQVJURUQg
Z290IGNsZWFyZWQuIFdoZW4gaXQgdHJpZXMgdG8NCj4+IGlzc3VlIGEgU3RhcnQgVHJhbnNmZXIg
YSBTRVRVUCB0cmFuc2ZlciwgdGhlIGNvbW1hbmQgd2lsbCBmYWlsIHdpdGggbm8NCj4+IHJlc291
cmNlIGJlY2F1c2UgdGhlIGVuZHBvaW50IG5ldmVyIGVuZGVkIHByb3Blcmx5Lg0KPj4NCj4+PiA8
Li4uPi04MzY0ICAgIFswMDBdIGQuLjEgIDEyNTUuMzU3NTk0OiBkd2MzX2N0cmxfcmVxOiAwMCA2
MCBiNyBlZiAwMCAwMA0KPj4+IDAwIDAwDQo+Pg0KPj4gSGVyZSBpcyBpZmZ5IGJlY2F1c2UgdGhl
IGJlaGF2aW9yIGlzIHVuZGVmaW5lZC4gVGhlIGRyaXZlciBvdmVyd3JvdGUgdGhlDQo+PiBwcmV2
aW91cyBUUkIuIFRoZSBTdGFydCBUcmFuc2ZlciBjb21tYW5kIGRpZG4ndCBnbyB0aHJvdWdoLCBz
byB0aGUNCj4+IGNvbnRyb2xsZXIgc3RpbGwgaGFzIHRoZSBvbGQgVFJCIHNldHVwIGluIGl0cyBj
YWNoZS4gSXQgZ2V0cyB0aGUgbmV4dA0KPj4gU0VUVVAgcmVxdWVzdCBjb21wbGV0aW9uIGFueXdh
eSBiZWNhdXNlIHRoZSBTRVRVUCBzdGFnZSBpcyBhIHNob3J0DQo+PiBwYWNrZXQuIFRoZSBkcml2
ZXIgdXBkYXRlZCBpdHMgc3RhdGUgdGhhdCBpdCdzIGV4cGVjdGluZyB0aGUgU0VUVVANCj4+IHN0
YWdlLCBhbmQgaXQgZG9lc24ndCBjaGVjayB0aGUgVFJCIHdyaXRlIGJhY2sgYnVmZmVyIHNpemUg
Zm9yIG1vcmUgb3INCj4+IGxlc3MgdGhhbiA4IGJ5dGVzIG9yIHdoZXRoZXIgdGhpcyBpcyB2YWxp
ZCBkYXRhLg0KPj4NCj4+IFdlc2xleSwgaXMgdGhpcyBTRVRVUCBwYWNrZXQgdGhlIGNvcnJlY3Qg
Uk5ESVMgY29udHJvbCByZXF1ZXN0Pw0KPj4NCj4gVGhhdCBkb2Vzbid0IGxvb2sgdG8gYmUgYSBS
TkRJUyBjb250cm9sIHBhY2tldC4gIEkgY29sbGVjdGVkIGEgYnVzDQo+IGFuYWx5emVyIGxvZyBh
cyB3ZWxsIHcvIHRoaXMgc25pcHBldCwgYW5kIG5vdGhpbmcgd2FzIHRyYW5zbWl0dGVkIGZyb20N
Cj4gdGhlIGhvc3Qgc2lkZSBkdXJpbmcgdGhlIGRhdGEgc3RhZ2UuICBTdWJzZXF1ZW50IFNFVFVQ
IHRyYW5zYWN0aW9ucyB3ZXJlDQo+IHN0YW5kYXJkIFVTQiBkZXNjcmlwdG9ycyAoR0VUIHN0cmlu
ZyBkZXNjcmlwdG9ycykuDQoNCk9rLg0KDQo+Pj4gPC4uLj4tODM2NCAgICBbMDAwXSBkLi4xICAx
MjU1LjM1NzY4MDogZHdjM19nYWRnZXRfZXBfY21kOiBlcDBvdXQ6IGNtZA0KPj4+ICdTZXQgU3Rh
bGwnIFs0MDRdIHBhcmFtcyAwMDAwMDAwMCAwMDAwMDAwMCAwMDAwMDAwMCAtLT4gc3RhdHVzOiBT
dWNjZXNzZnVsDQo+Pg0KPj4gVGhlIGRldmljZSBTZXQgU3RhbGwgb24gYW4gdW5yZWNvZ25pemVk
IHJlcXVlc3QsIHByb2JhYmx5IGZyb20gdGhlDQo+PiBhcHBsaWNhdGlvbiwgd2hpY2ggY2FuIGJl
IG5vcm1hbC4NCj4+DQo+Pj4gPC4uLj4tODM2NCAgICBbMDAwXSBkLi4xICAxMjU1LjM1NzY5Njog
ZHdjM19wcmVwYXJlX3RyYjogZXAwb3V0OiB0cmINCj4+PiBmZmZmZmZjMDFiZmZkMDEwIChFMTpE
MCkgYnVmIDAwMDAwMDAwZWZmZmEwMDAgc2l6ZSA4IGN0cmwgMDAwMDBjMjMNCj4+PiAoSExjczpT
QzpzZXR1cCkNCj4+PiA8Li4uPi04MzY0ICAgIFswMDBdIGQuLjEgIDEyNTUuMzU3NzIyOiBkd2Mz
X2dhZGdldF9lcF9jbWQ6IGVwMG91dDogY21kDQo+Pj4gJ1N0YXJ0IFRyYW5zZmVyJyBbNDA2XSBw
YXJhbXMgMDAwMDAwMDAgZWZmZmEwMDAgMDAwMDAwMDAgLS0+IHN0YXR1czoNCj4+PiBTdWNjZXNz
ZnVsDQo+Pj4gPC4uLj4tMjI0ICAgICBbMDA1XSBkLi4xICAxMjY2LjMxMzAxNDogZHdjM19nYWRn
ZXRfZXBfY21kOiBlcDJvdXQ6IGNtZA0KPj4+ICdFbmQgVHJhbnNmZXInIFs0MGMwOF0gcGFyYW1z
IDAwMDAwMDAwIDAwMDAwMDAwIDAwMDAwMDAwIC0tPiBzdGF0dXM6DQo+Pj4gVGltZWQgT3V0DQo+
Pj4NCj4+PiBUaGFua3MNCj4+PiBXZXNsZXkgQ2hlbmcNCj4+Pg0KPj4NCj4+IFRoYW5rcyBmb3Ig
dGhlIHRlc3QgV2VzbGV5DQo+Pg0KPj4gQlIsDQo+PiBUaGluaA0KPj4NCj4gDQo+IFNvIGJhY2sg
dG8gdGhlIG9yaWdpbmFsIGlzc3VlLCB3aGljaCB3YXMgdGhlIFNFVFVQIHRpbWVvdXQgZHVyaW5n
IHB1bGx1cA0KPiBkaXNhYmxlLCBJIHdlbnQgYWhlYWQgYW5kIGNvbGxlY3RlZCB0aGUgZnRyYWNl
IHcvIGEgY2hhbmdlIHRvIGp1c3QNCj4gcmVtb3ZlIHRoZSByZXR1cm4gc3RhdGVtZW50Og0KPiAN
Cj4gcmV0ID0gd2FpdF9mb3JfY29tcGxldGlvbl90aW1lb3V0KCZkd2MtPmVwMF9pbl9zZXR1cCwN
Cj4gCQkJCW1zZWNzX3RvX2ppZmZpZXMoRFdDM19QVUxMX1VQX1RJTUVPVVQpKTsNCj4gaWYgKHJl
dCA9PSAwKSB7DQo+IAlkZXZfZXJyKGR3Yy0+ZGV2LCAidGltZWQgb3V0IHdhaXRpbmcgZm9yIFNF
VFVQIHBoYXNlXG4iKTsNCj4gCXJldHVybiAtRVRJTUVET1VUOw0KPiB9DQo+IA0KPiBUaGlzIHdv
dWxkIGFsbG93IHRoZSBfX2R3YzNfZ2FkZ2V0X3N0b3AoKSB0byBkaXNhYmxlIEVQMC8xLCB3aGlj
aCB3b3VsZA0KPiBjYWxsIGR3YzNfZ2FkZ2V0X3N0b3BfYWN0aXZlX3RyYW5zZmVyKCkgdG8gc2Vu
ZCB0aGUgZW5kIHhmZXIgY29tbWFuZDoNCj4gDQo+IC8vUGFja2V0IHdoaWNoIHdpbGwgbm90IHF1
ZXVlIGEgZGF0YSBzdGFnZSAoaW5qZWN0ZWQgZmFpbHVyZSkNCj4gPC4uLj4tNzA5OCAgICBbMDAz
XSBkLi4xICAgMzQ2LjU2MDcxMTogZHdjM19jdHJsX3JlcTogR2V0IFN0cmluZw0KPiBEZXNjcmlw
dG9yKEluZGV4ID0gMywgTGVuZ3RoID0gMikNCj4gDQo+IC8vUHJlcGFyZSBJTiBkYXRhIHN0YWdl
IFRSQg0KPiA8Li4uPi03MDk4ICAgIFswMDNdIGQuLjEgICAzNDYuNTYwODY1OiBkd2MzX3ByZXBh
cmVfdHJiOiBlcDBpbjogdHJiDQo+IGZmZmZmZmMwMTFlZGQwMDAgKEUwOkQwKSBidWYgMDAwMDAw
MDBlZmZjYzAwMCBzaXplIDIgY3RybCAwMDAwMGM1Mw0KPiAoSExjczpTQzpkYXRhKQ0KPiA8Li4u
Pi03MDk4ICAgIFswMDNdIGQuLjEgICAzNDYuNTYwOTE1OiBkd2MzX2dhZGdldF9lcF9jbWQ6IGVw
MGluOiBjbWQNCj4gJ1N0YXJ0IFRyYW5zZmVyJyBbNDA2XSBwYXJhbXMgMDAwMDAwMDAgZWZmZmEw
MDAgMDAwMDAwMDAgLS0+IHN0YXR1czoNCj4gU3VjY2Vzc2Z1bA0KPiANCj4gLy9QdWxsdXAgZGlz
YWJsZSBoZXJlIGtpY2tzIGluIC0gX19kd2MzX2dhZGdldF9zdG9wKCkNCj4gPC4uLj4tMjI0ICAg
ICBbMDA2XSBkLi4xICAgMzQ4LjYwNzM2NzogZHdjM19nYWRnZXRfZXBfZGlzYWJsZTogZXAwb3V0
Og0KPiBtcHMgNjQvNTEyIHN0cmVhbXMgMCBidXJzdCAxIHJpbmcgMC8wIGZsYWdzIEU6c3dicDo+
DQo+IDwuLi4+LTIyNCAgICAgWzAwNl0gZC4uMSAgIDM0OC42MDc0MzA6IGR3YzNfZ2FkZ2V0X2dp
dmViYWNrOiBlcDBvdXQ6IHJlcQ0KPiBmZmZmZmY4ODRlNWY1NTAwIGxlbmd0aCAwLzIgenNJID09
PiAtMTA4DQo+IDwuLi4+LTIyNCAgICAgWzAwNl0gZC4uMSAgIDM0OC42MDc0NDQ6IGR3YzNfZ2Fk
Z2V0X2VwX2Rpc2FibGU6IGVwMGluOg0KPiBtcHMgNjQvNTEyIHN0cmVhbXMgMCBidXJzdCAxIHJp
bmcgMC8wIGZsYWdzIEU6c3dCcDo8DQo+IA0KPiAvL0VuZCB0cmFuc2ZlciBvbiB0aGUgcGVuZGlu
ZyBFUDAgaW4gVFJCIHF1ZXVlZCBwcmV2aW91c2x5DQo+IDwuLi4+LTIyNCAgICAgWzAwNl0gZC4u
MSAgIDM0OC42MDc0ODQ6IGR3YzNfZ2FkZ2V0X2VwX2NtZDogZXAwaW46IGNtZA0KPiAnRW5kIFRy
YW5zZmVyJyBbMTBjMDhdIHBhcmFtcyAwMDAwMDAwMCAwMDAwMDAwMCAwMDAwMDAwMCAtLT4gc3Rh
dHVzOg0KPiBTdWNjZXNzZnVsDQo+IDwuLi4+LTIyNCAgICAgWzAwNl0gZE4uMSAgIDM0OC42MDc3
ODg6IHVzYl9nYWRnZXRfdmJ1c19kcmF3OiBzcGVlZCAzLzYNCj4gc3RhdGUgNiAwbUEgW3NnOnNl
bGYtcG93ZXJlZDphY3RpdmF0ZWQ6ZGlzY29ubmVjdGVkXSAtLT4gMA0KPiA8Li4uPi0yMjQgICAg
IFswMDZdIC4uLi4gICAzNDguNjE2ODg4OiB1c2JfZ2FkZ2V0X2Rpc2Nvbm5lY3Q6IHNwZWVkIDMv
Ng0KPiBzdGF0ZSA2IDBtQSBbc2c6c2VsZi1wb3dlcmVkOmFjdGl2YXRlZDpkaXNjb25uZWN0ZWRd
IC0tPiAwDQo+IA0KPiBEb2VzIHRoaXMgbG9vayBvaywgVGhpbmg/DQo+IA0KDQpJdCBzaG91bGQg
YmUgZmluZS4NCg0KVGhlIHdheSB3ZSdyZSBoYW5kbGluZyBzb2Z0LWNvbm5lY3QgYW5kIHNvZnQt
ZGlzY29ubmVjdCBpbiBkd2MzIGlzDQpkaWZmZXJlbnQgdGhhbiB3aGF0IHRoZSBwcm9ncmFtbWlu
ZyBndWlkZSBzdWdnZXN0ZWQuIFdlJ3JlIG5vdCBkb2luZw0Kc29mdC1yZXNldCBvbiBzb2Z0LWNv
bm5lY3QuIE91ciBIVyB0ZXN0aW5nIGRpZG4ndCBzaG93IGEgcHJvYmxlbSBpbg0KcXVpY2sgc29m
dC1jb25uZWN0L2Rpc2Nvbm5lY3Qgc3VjY2Vzc2lvbiBiZWZvcmUsIGJ1dCBjYW4geW91IHRlc3Qg
ZG9pbmcNCnNvZnQtY29ubmVjdCBpbW1lZGlhdGVseSBhZnRlciB0aGlzIHNjZW5hcmlvPw0KDQpB
bHNvLCBtYXliZSB3ZSBjYW4gY2hhbmdlIGRldl9lcnIoKSBwcmludCB0byBkZXZfd2FybigpIG9u
IHRpbWVvdXQgaW5zdGVhZD8NCg0KVGhhbmtzLA0KVGhpbmgNCg==
