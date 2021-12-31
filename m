Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8A71E4821E8
	for <lists+linux-usb@lfdr.de>; Fri, 31 Dec 2021 04:46:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242611AbhLaDqS (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 30 Dec 2021 22:46:18 -0500
Received: from smtprelay-out1.synopsys.com ([149.117.73.133]:36496 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231222AbhLaDqS (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 30 Dec 2021 22:46:18 -0500
Received: from mailhost.synopsys.com (badc-mailhost4.synopsys.com [10.192.0.82])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 8C57347D1F;
        Fri, 31 Dec 2021 03:46:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1640922377; bh=pvHciajWuz2Rwc+Twowah0s5r5xFkdfwd9Pio+rRVT4=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=dvy1g6/p5IZAGE5TyXXCDlZC/CTNja/WLpNu1Yxau879y/TTL5uTv3E3zzJLSgSUO
         heZj5UDT2aCCvBjSimxkMxq+V1DzdiJr3H/fD0zKAH1VIe7tZwyRSvAqg6WEP0Mdq4
         UrIxItJY4sSQVMlAi2AQWpLeeL9+qU16w071EJ907ZOncQeMmvaqhIplP91i38YxXD
         5LLR5E8Mv5OjITeUPJ0pIG57OmFpuaS8/r3obSU1RnVBOzZkZKL4oRyc9AtK8FZm0I
         FIi4BarILkHHazBTARYEhiQkOeznrt/Bx/Pk26XaenFGhWpp0VH/2n12CJ5MiafIXb
         HRSLFQC62GToA==
Received: from o365relay-in.synopsys.com (us03-o365relay1.synopsys.com [10.4.161.137])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (verified OK))
        by mailhost.synopsys.com (Postfix) with ESMTPS id C050CA005C;
        Fri, 31 Dec 2021 03:46:16 +0000 (UTC)
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (mail-dm6nam08lp2047.outbound.protection.outlook.com [104.47.73.47])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
        by o365relay-in.synopsys.com (Postfix) with ESMTPS id A3AB38007A;
        Fri, 31 Dec 2021 03:46:15 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=thinhn@synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
        dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="YJ+vrIll";
        dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Vvs8mZvbCLCxUQfX4/vCyOQTo8qBhu+TrwCht6Jd/WAGv3O6ocEVAU9YhYmWdk8KobfMaAx4IZSE7M72UVTBQzB2578BXiSlGSDsd4qcnDzlg3urKY0wfS/SkHrZ4+m5LZ8i7UzL5x9cFLlfXgBfLG97Vhmbf0DCIzYc7E2wRNehgxcWPYqxr71d+mJU5PagRZQgd1tEMQNDkbSbQc7GOSzzNjdQMAqVgptXLqyeWtn+E695QH/czCngQ+cNCXJ9q38C7nqMMV1nYGwEE9s1Mi17WNuSq/t4kaPjKn2M6KyZtNibmNJn6T2bNjt1BJrSXtwTMzJKdxaKHaiWDB9c6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pvHciajWuz2Rwc+Twowah0s5r5xFkdfwd9Pio+rRVT4=;
 b=iTDK/FjZBc0k0ihtsuUWEM2thNHbN+lt6xatba8diW4VP508b0u4b/TThDUmvk2W31B8QVGB+jWiuABPnpjfqoZb54qg/7grS8C0DS6tQl8Axb1FGc+EAK9zlk+bFSvHoTPWzfBk1cDOJ13efvjrwgbWj5jWrkjIg9V7NycWUXuQXcnzn07ZIeXXmkVgSfqKwOLvW3GsMNu/GcchbaX5F6VfV6yxEelNACBbI/4J+/vLokmaojiAJHgY1ob2mvi6myoNf+Do93YIwlXio/QCsigtK6ZPO1kWCMW+N5Ws7sxLE5VF01MgbkbnCQdoD6kJSSGHr5EC6eEbgY9iAhefrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pvHciajWuz2Rwc+Twowah0s5r5xFkdfwd9Pio+rRVT4=;
 b=YJ+vrIlljDGDQ68mtifj7gYOOl40eOAh3Wl3htssFedc8ASMkBrwjqHOoerka7j1Kh56bVL4WlN4gKf4PeiUOQWVk37ZnzsoWhvC427OT8kQ63UaYFBKQuN1fPhXi5wfMd2mtY39MSyp3AouWPsR5LJJnuQw6ApqX5DUXmooSAE=
Received: from BYAPR12MB4791.namprd12.prod.outlook.com (2603:10b6:a03:10a::12)
 by BYAPR12MB3397.namprd12.prod.outlook.com (2603:10b6:a03:db::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4844.14; Fri, 31 Dec
 2021 03:46:12 +0000
Received: from BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::b4:d43c:d55f:a754]) by BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::b4:d43c:d55f:a754%6]) with mapi id 15.20.4844.013; Fri, 31 Dec 2021
 03:46:11 +0000
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To:     youling 257 <youling257@gmail.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>
CC:     Greg KH <gregkh@linuxfoundation.org>,
        "mathias.nyman@intel.com" <mathias.nyman@intel.com>,
        "william.allentx@gmail.com" <william.allentx@gmail.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: USB 3.2 Gen 2x2 "Superspeed+20GBps" support for ASM3242
Thread-Topic: USB 3.2 Gen 2x2 "Superspeed+20GBps" support for ASM3242
Thread-Index: AQHXFK9aaZXyhujf3U2dpApLGjyr3Kp7QfkAgABMwgCB0UUQAIAABYYAgAAYe4CAALNAgIAAGW4AgAAKDQA=
Date:   Fri, 31 Dec 2021 03:46:10 +0000
Message-ID: <1d63d954-13fb-f9c6-b2e7-d350ace2aa5a@synopsys.com>
References: <f5bca159-e8de-3c76-c2b4-6f4efa001fd9@linux.intel.com>
 <20211230131014.21886-1-youling257@gmail.com> <Yc20WPbIad44/3rd@kroah.com>
 <CAOzgRdbeQ69pWbagFwTvV4ZcYGBE5GkwdqcuxxGFLXBJSy-GMA@mail.gmail.com>
 <6908aa69-469b-8f92-8e19-60685f524f9c@synopsys.com>
 <CAOzgRdb+Ru8AL=wUquysbqd8uGkNSDzSNfOSW3Fs2Pd6BGxo1w@mail.gmail.com>
In-Reply-To: <CAOzgRdb+Ru8AL=wUquysbqd8uGkNSDzSNfOSW3Fs2Pd6BGxo1w@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=synopsys.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 82052ca6-389f-439a-4151-08d9cc101685
x-ms-traffictypediagnostic: BYAPR12MB3397:EE_
x-microsoft-antispam-prvs: <BYAPR12MB33977E91FDDDDD2C340F3305AA469@BYAPR12MB3397.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:411;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: iHIYlgzYyLater0NCCSThhu0eFmduW02cae1v2oeVatAxVKW+IWKy5dQZcPqKfaFXk0AFwGgjAdv/TzNxTnLziI/CgkxcOHwaD//H+af9sDkFBZ8djtGD7Dq5OgP6p3Yc0mwsUkajt7Qli+ILzLJYuVQHvBAOJ/gOLYoR/R4wQXQe68nGXuOT2sVaC8TJfPDh4I8XINlSKmfp5OAXaRaG8kIFJttuaSScsAJwBKXVxbCBmfhhAvD0BQ9jOnaBpeg31w0uJ9fN4+gpC1yzmQ47OFQcGeXOdNtU6r52QMEmvpTwttrNi9ZjQgQiEittFlAxITYZMSmCKEpVikbjyHVpns0DE0hzlGCn1k5N7zFJPbgrU6vj2XcNqkUkGwU07gS96v1cdBbmWT/inbv3gnYWs6usFhcOzeaJl2NCqXNeSBgazMItlhdYJYdEai2ppbT0ltlmzwbD3wMTkyT2pkagml4MSmN6xtUEYyB/phuBNsuiLy65syOWVrejCh32nvC3MK8O4c+r+jwYm3vjIHSA5Mb4SjyMU7XArpWrG6Yvnk+FZGIhWMwgTusLQrvcDNXCopC7scvcgDrE5anErLNgIoCcSFLSuM270NI/sDgoumFfQ+a/4Xg7s1SDuDZBUKVI0aKW9quxu9HKLczfJotFtk38xcD6ZHLWvwyRYzi5iIScFvTTfVWm49+/tw034ulLCPCvBk8s/eqZVijCEC5dSxrhYSES+he94XskYfQ+mFNbNT/6k2PASEI8zw+A+2J+a+Jwh9gQdXDNYUCMtNJeYfEC5L2T6hxU7myxCS7UvK8beFs0tX8rtZyovPLccZnLD/zKxnHWsLdAAL5AWb2wStc8p3ujW2cxBwfiGiHeB4=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB4791.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(316002)(26005)(71200400001)(66556008)(66946007)(38070700005)(83380400001)(122000001)(66446008)(66476007)(31696002)(186003)(38100700002)(966005)(6506007)(8936002)(2906002)(64756008)(76116006)(5660300002)(36756003)(86362001)(31686004)(6486002)(2616005)(6512007)(4001150100001)(54906003)(8676002)(508600001)(110136005)(4326008)(45980500001)(43740500002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?eDNqa2t1NnRac0J6b25UVFhjVVBQYjhmSFhmcnZLVWIyNGpoL2dJaHBYc2VI?=
 =?utf-8?B?bmlWNVY2MTFETjRaMmRBbU1Nbkpjd3Z1S2MzQVpjVVhlWm82RTJleTlTNnor?=
 =?utf-8?B?OUxsREUrdG9iamhrTFZiaUpjVHdCSXBZbmRnNHRJR1BvQjQwOFhOZTVUVzln?=
 =?utf-8?B?TjZVbEE5VzNtaU1YYmtrcVBHVUxBTW5YSzY1aXNoems4Rm1mWUZXYWtwWmFx?=
 =?utf-8?B?bW5DcEtKczEwaG9ENHJtd3NKa0tWQlBMWHNBc3hqZ3NzZk9CSkFub2JIMnFR?=
 =?utf-8?B?VGMrOXNiQWFSOWE4YzBjMGdtRjZIVzNqd0wzVm9VdkRRblRVWGhkVEoxTFZh?=
 =?utf-8?B?eFZsc3owRmluaDhtRE01Nys3VEFrVXJ1QjBZblB5WnRmaTI0NjVLczgzNXdx?=
 =?utf-8?B?T0JCS1dLNmpSaVdjb0JSaXRzUUVzTnRray9NRklGU1pNamdTSGtqeUdZaEhD?=
 =?utf-8?B?eWs4TzdhYnZZR2dhUWRwMHVNVGpUMktxQm4vcWVndWRzLzdPcDNlVDVMb3hF?=
 =?utf-8?B?QklEZGErVDZlZGZYcDlaY2F5dDVCeUNuWGQ1RG9RZnNNSmwxYlZxOUc4Tk9n?=
 =?utf-8?B?bkVBYlA1SXdNL0IyZnIwT3JnUkF1eGdvMjhFVVpyN1h4c2V5NEhIZWw3MU1T?=
 =?utf-8?B?dTMzTytVeVZTbTFnNFpjNm1naTVFcStOc2FiNTJ3ZzlEUlVwN1lGNUZpZW5O?=
 =?utf-8?B?dDdlczhsWFFRalRHK25hRThibUNOSGQxNXBwM00rbXVsNVFnVzBtOS9qU3dZ?=
 =?utf-8?B?aWVYMzVpY0Q5Mm5pQjVtSWVHcjNaMy82U29ENEhoRUxlQis0Z2RISUNxdDlt?=
 =?utf-8?B?T1pkS1FjZDBGY0x3dEVxV2VDK1BKaFNzZEtZcTBFd0R1VGd1TWNKaEMybS9n?=
 =?utf-8?B?aHRFbFZjL3ZqOVJERnd2dHFpNlcrZFNhdWtrQzBDQlpsOS96Z3A2UjJuUGdL?=
 =?utf-8?B?Rm0xVG56NGZROUJFN2RiSmJlVjN6Zy9OaFJTaUhYb0Zzd0dodGR2czhUaERu?=
 =?utf-8?B?ZWlhd1JSTURwREhMRmtPTkIrb3R2SjJOOC9UWWpKeDErT0t3K2ltN2NFS1lD?=
 =?utf-8?B?OXdSOHdjTkxVaENiaHMxSFluMERodnIvRHZUYkJKN2RDVGN0QTJNV3FMcTNX?=
 =?utf-8?B?MldSellHRGxmQWhtWm4vOEk5UVFSWDdXTnM1TU51RHBWZ2trUG5HSzUrLzBP?=
 =?utf-8?B?NHl3NjhFMktmRHZ5ZkFDTWJJckxmaThEcENaeTdHR0JsQXZoV3NhMDB6SWxV?=
 =?utf-8?B?Zk50L28wK3FOSUVIeURPeTdnK0M5MXNTOGh6dTBWbTY1SWZ6bHV5WTk3R2RQ?=
 =?utf-8?B?WjZ4SXk3WWpDbjBRVjU5YUV2Y3l1b01kNmxzL3N3eVR5N2t2T3JXZjZQdnM5?=
 =?utf-8?B?S2xwSEFvejk3RHNTRUJqN0pNczduTE1XZm11Y09qams1ZGh1QVNTQ1pxRE11?=
 =?utf-8?B?eDBkZytreWp2a0l0Kzh2SmRMMmYyWjlFbjNqTmdZM2hlRzh3V09iRS9vUUpq?=
 =?utf-8?B?RTIzT3dHWTkvcXdaOXNieHVYWU0zc3lRVThKbFJkcllrL2phM3U4V2p0YU1E?=
 =?utf-8?B?dURobGFtb3I2VkdIVFp0REZPOVcwcDc3b2RSbGNuMG01cXBvRldyQ09kWnNY?=
 =?utf-8?B?NXQrN0hVMDRwRFR2RitEdjFqbUZrR1VxR1NCV2k4Y3BYSHVib1lsck40cTBF?=
 =?utf-8?B?TldwaUFFKzErdFJkbDhValRaN1RiZnNhdkFueGxtZ0tJeHpXL2hnb0JHNDc1?=
 =?utf-8?B?cE9FWmt5a3JwQkhvK09tMmRKcWxjaG5rc3NFZEtMMFAvUGE2VTJhMm9KNUFv?=
 =?utf-8?B?QVJDRWYrTTQyKzh6b2xFb25MbEVSYU1TOVEvdUpIUXdIcXY4UDVQTUZEa1ha?=
 =?utf-8?B?L1JETDBaZDBjM1Y5VTRZT0lVa3ArV0c2M003eXgySGVoMGovcWg0eW84MXU3?=
 =?utf-8?B?STBiaXcybUJxNy84cXk1Wk9SdUNYTGNCbUNEMVJYNXVtM0x2OFlTUGlqMFFz?=
 =?utf-8?B?R1UwZklBT0RiS2Y0K1c4QXJ0dEFXM3lmMUpNdkFoRHlveTI0N1c2cWZEdGpC?=
 =?utf-8?B?SUw0WHZhSVN5VlFwTFptNVpKR01wQTRFWk9aNy9GMExkOHhveGxGOE9IUlFx?=
 =?utf-8?B?bld0ajJDcDJGckdjbElBZFpDd3k3czNwcnQ4RTFZUFplMnhUZWxnTCtRUlFU?=
 =?utf-8?B?Nmc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <F124399D6F72B24F8433EB9DE1080B23@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB4791.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 82052ca6-389f-439a-4151-08d9cc101685
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Dec 2021 03:46:11.0573
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rJrt+bRG/qEP9XD8ynYWmAIet3riHa9ACWCCf2HAefwFCaCGjczjgGjhL1Q0xreAAOkkLb5XGp/laouoD0gWXw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3397
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

SGksDQoNCnlvdWxpbmcgMjU3IHdyb3RlOg0KPiB0ZXN0IHRoaXMgcGF0Y2gsIGNhdCAvc3lzL2J1
cy91c2IvZGV2aWNlcy80LTEvc3BlZWQsIDEwMDAwDQo+IFsgICA3NC42OTQyODRdIHVzYiA0LTE6
IG5ldyBTdXBlclNwZWVkIFBsdXMgR2VuIDJ4MSBVU0IgZGV2aWNlIG51bWJlcg0KPiAyIHVzaW5n
IHhoY2lfaGNkDQo+IFsgICA3NC43NTAzMjldIHVzYi1zdG9yYWdlIDQtMToxLjA6IFVTQiBNYXNz
IFN0b3JhZ2UgZGV2aWNlIGRldGVjdGVkDQo+IA0KPiBidXQgc3BlZWQsIHBjaWUgdG8gdXNiMy4y
IGdlbjJ4MiwgV1JJVEU6IGJ3PTY0Mk1pQi9zICg2NzNNQi9zKSwNCj4gNjQyTWlCL3MtNjQyTWlC
L3MgKDY3M01CL3MtNjczTUIvcyksIGlvPTEwMDBNaUIgKDEwNDlNQiksDQo+IHJ1bj0xNTU3LTE1
NTdtc2VjDQo+IFJFQUQ6IGJ3PTQ2N01pQi9zICg0OTBNQi9zKSwgNDY3TWlCL3MtNDY3TWlCL3Mg
KDQ5ME1CL3MtNDkwTUIvcyksDQo+IGlvPTEwMDBNaUIgKDEwNDlNQiksIHJ1bj0yMTQwLTIxNDBt
c2VjDQo+IA0KPiB0aGUgbWFpbmJvYXJkIHVzYjMuMiBnZW4yeDEsIFdSSVRFOiBidz04MzhNaUIv
cyAoODc4TUIvcyksDQo+IDgzOE1pQi9zLTgzOE1pQi9zICg4NzhNQi9zLTg3OE1CL3MpLCBpbz0x
MDAwTWlCICgxMDQ5TUIpLA0KPiBydW49MTE5NC0xMTk0bXNlYw0KPiBSRUFEOiBidz03NTNNaUIv
cyAoNzkwTUIvcyksIDc1M01pQi9zLTc1M01pQi9zICg3OTBNQi9zLTc5ME1CL3MpLA0KPiBpbz0x
MDAwTWlCICgxMDQ5TUIpLCBydW49MTMyOC0xMzI4bXNlYw0KPiANCg0KTGV0J3MgYXZvaWQgdG9w
LXBvc3QuDQoNClNvbWUgY29tbWVudHM6DQoxKSBKdXN0IGJlY2F1c2UgdGhlIGhvc3QgaXMgY2Fw
YWJsZSBvZiBnZW4yeDIsIGl0IGRvZXNuJ3QgbWVhbiBpdCB3aWxsDQpydW4gYXQgZ2VuMngyIHNw
ZWVkLiBZb3VyIGRldmljZSBjYW4gb25seSBvcGVyYXRlIHVwIHRvIGdlbjJ4MSBzcGVlZCwgc28N
CnRoYXQncyB0aGUgbGltaXQuIFRoZSB0ZXN0IHNwZWVkIGZvciBnZW4yeDEgYWJvdmUgaXMgbm90
IHVucmVhc29uYWJsZS4NCg0KMikgWW91J3JlIGNvbXBhcmluZyAyIGRpZmZlcmVudCBjb250cm9s
bGVycyBwZXJmb3JtYW5jZS4gVGhlICJtYWluYm9hcmQiDQpwZXJmb3JtcyBiZXR0ZXIgZm9yIHRo
ZSBzcGVjaWZpYyBzZXR1cCBhbmQgc3BlY2lmaWMgdGVzdCB0aGF0IHlvdSB1c2UuDQooSSdtIGFz
c3VtaW5nIHRoYXQgdGhlIG9ubHkgZGlmZmVyZW5jZSBpbiB5b3VyIHRlc3Qgc2V0dXAgaXMgdGhl
IGhvc3QNCmNvbnRyb2xsZXIgYW5kIHJlc3QgaXMgdGhlIHNhbWUpLg0KDQozKSBGaW5kIGEgZ2Vu
MngyIGNhcGFibGUgZGV2aWNlIHRvIHRlc3QgQVNtZWRpYSBnZW4yeDIgc3BlZWQgaWYgdGhhdCdz
DQp3aGF0IHlvdSdyZSBjaGVja2luZyBmb3IuDQoNCkJSLA0KVGhpbmgNCg0KPiAyMDIxLTEyLTMx
IDk6MzkgR01UKzA4OjAwLCBUaGluaCBOZ3V5ZW4gPFRoaW5oLk5ndXllbkBzeW5vcHN5cy5jb20+
Og0KPj4gSGksDQo+Pg0KPj4geW91bGluZyAyNTcgd3JvdGU6DQo+Pj4gMjAyMS0xMi0zMCAyMToz
MCBHTVQrMDg6MDAsIEdyZWcgS0ggPGdyZWdraEBsaW51eGZvdW5kYXRpb24ub3JnPjoNCj4+Pj4g
T24gVGh1LCBEZWMgMzAsIDIwMjEgYXQgMDk6MTA6MTRQTSArMDgwMCwgeW91bGluZzI1NyB3cm90
ZToNCj4+Pj4+IHdoZXJlIGkgY2FuIGZpbmQgdGhlIHNlcmllcyBwYXRjaD8NCj4+Pj4+IGh0dHBz
Oi8vdXJsZGVmZW5zZS5jb20vdjMvX19odHRwczovL3BhdGNod29yay5rZXJuZWwub3JnL3Byb2pl
Y3QvbGludXgtdXNiL2xpc3QvP3Nlcmllcz00Mjc1NjFfXzshIUE0RjJSOUdfcGchTV96WEtqTzFK
dElrejU3cVo3QkVFTDd6angyUVhRVGZhdTI2aEJOTFg3YktFTF92T1AtbThYbjFlWjE0VlJwWS0w
R2EkDQo+Pj4+Pg0KPj4+Pg0KPj4+PiBUaGVyZSBpcyBub3RoaW5nIGF0IHRoYXQgbGluay4NCj4+
Pj4NCj4+Pj4gV2hhdCBpcyB0aGUgbG9yZS5rZXJuZWwub3JnIGxpbmsgZm9yIHRoZSBwYXRjaCB5
b3UgYXJlIGN1cmlvdXMgYWJvdXQ/DQo+Pj4+DQo+Pj4+PiB3aGVuIGkgdXNlZCBtYWl3byBrMTY5
MCgxMGdicHMpIGNvbm5lY3QgdG8gQVNNMzI0MiBDb250cm9sbGVyLCBvbmx5DQo+Pj4+PiA1MDBN
Qi9zLg0KPj4+Pj4gY2F0IC9zeXMvZGV2aWNlcy9wY2kwMDAwOjAwLzAwMDA6MDA6MDEuMy8wMDAw
OjA5OjAwLjAvdXNiMy9zcGVlZCwgNDgwDQo+Pj4+PiBjYXQgL3N5cy9kZXZpY2VzL3BjaTAwMDA6
MDAvMDAwMDowMDowMS4zLzAwMDA6MDk6MDAuMC91c2I0L3NwZWVkLCAyMDAwMA0KPj4+Pj4gbWFp
d28gazE2OTAgaXMgb24NCj4+Pj4+IC9zeXMvZGV2aWNlcy9wY2kwMDAwOjAwLzAwMDA6MDA6MDEu
My8wMDAwOjA5OjAwLjAvdXNiNC80LTEuDQo+Pj4+PiBjYXQgL3N5cy9kZXZpY2VzL3BjaTAwMDA6
MDAvMDAwMDowMDowMS4zLzAwMDA6MDk6MDAuMC91c2I0LzQtMS9zcGVlZCwNCj4+Pj4+IDUwMDAN
Cj4+Pj4+DQo+Pj4+Pg0KPj4+Pj4gMDE6MDAuMCBVU0IgY29udHJvbGxlcjogQVNNZWRpYSBUZWNo
bm9sb2d5IEluYy4gQVNNMzI0MiBVU0IgMy4yIEhvc3QNCj4+Pj4+IENvbnRyb2xsZXIgKHByb2ct
aWYgMzAgW1hIQ0ldKQ0KPj4+Pj4gICAgICAgICBTdWJzeXN0ZW06IEFTTWVkaWEgVGVjaG5vbG9n
eSBJbmMuIEFTTTMyNDIgVVNCIDMuMiBIb3N0DQo+Pj4+PiBDb250cm9sbGVyDQo+Pj4+Pg0KPj4+
Pj4gWyAgICAwLjM1OTI4MV0geGhjaV9oY2QgMDAwMDowMTowMC4wOiB4SENJIEhvc3QgQ29udHJv
bGxlcg0KPj4+Pj4gWyAgICAwLjM1OTI4M10geGhjaV9oY2QgMDAwMDowMTowMC4wOiBuZXcgVVNC
IGJ1cyByZWdpc3RlcmVkLCBhc3NpZ25lZA0KPj4+Pj4gYnVzDQo+Pj4+PiBudW1iZXIgMg0KPj4+
Pj4gWyAgICAwLjM1OTI4NV0geGhjaV9oY2QgMDAwMDowMTowMC4wOiBIb3N0IHN1cHBvcnRzIFVT
QiAzLjIgRW5oYW5jZWQNCj4+Pj4+IFN1cGVyU3BlZWQNCj4+Pj4+DQo+Pj4+PiBbIDExOTEuNzM0
MTIzXSB1c2IgNC0xOiBuZXcgU3VwZXJTcGVlZCBVU0IgZGV2aWNlIG51bWJlciAyIHVzaW5nDQo+
Pj4+PiB4aGNpX2hjZA0KPj4+Pj4gWyAxMTkxLjc5NDc2N10gdXNiLXN0b3JhZ2UgNC0xOjEuMDog
VVNCIE1hc3MgU3RvcmFnZSBkZXZpY2UgZGV0ZWN0ZWQNCj4+Pj4+IFsgMTE5MS43OTUwNDldIHNj
c2kgaG9zdDk6IHVzYi1zdG9yYWdlIDQtMToxLjANCj4+Pj4+IFsgMTA1MS4wNTEyNzRdIHNjc2kg
OTowOjA6MDogRGlyZWN0LUFjY2VzcyAgICAgUmVhbHRlayAgVVNCIDMuMiBEZXZpY2UNCj4+Pj4+
IDEuMDAgUFE6IDAgQU5TSTogNg0KPj4+Pj4gWyAxMDUxLjA1MTQ0Ml0gc2QgOTowOjA6MDogQXR0
YWNoZWQgc2NzaSBnZW5lcmljIHNnMCB0eXBlIDANCj4+Pj4+IFsgMTA1MS4wNTQ0NjFdIHNkIDk6
MDowOjA6IFtzZGFdIDUwMDExODE5MiA1MTItYnl0ZSBsb2dpY2FsIGJsb2NrczoNCj4+Pj4+ICgy
NTYNCj4+Pj4+IEdCLzIzOCBHaUIpDQo+Pj4+PiBbIDEwNTEuMDU1MDY4XSBzZCA5OjA6MDowOiBb
c2RhXSBXcml0ZSBQcm90ZWN0IGlzIG9mZg0KPj4+Pj4gWyAxMDUxLjA1NTA3M10gc2QgOTowOjA6
MDogW3NkYV0gTW9kZSBTZW5zZTogMzcgMDAgMDAgMDgNCj4+Pj4+IFsgMTA1MS4wNTU3MTZdIHNk
IDk6MDowOjA6IFtzZGFdIFdyaXRlIGNhY2hlOiBkaXNhYmxlZCwgcmVhZCBjYWNoZToNCj4+Pj4+
IGVuYWJsZWQsIGRvZXNuJ3Qgc3VwcG9ydCBEUE8gb3IgRlVBDQo+Pj4+PiBbIDEwNTEuMDcyMTMx
XSAgc2RhOiBzZGExIHNkYTINCj4+Pj4+DQo+Pj4+PiBpIGRvbid0IGhhdmUgTlZNZSB0byBVU0Ig
MngyIEVuY2xvc3VyZSAoQVNNMjM2NCBjaGlwc2V0KSwgaSBoYXZlIE5WTWUNCj4+Pj4+IHRvDQo+
Pj4+PiBVU0IgMngxIEVuY2xvc3VyZSAoUlRMOTEyMEIgY2hpcHNldCksIG1haXdvIGsxNjkwLCB1
c2luZyBpdCBvbg0KPj4+Pj4gUGNpRXhwcmVzcw0KPj4+Pj4gWDQgYWRkIGluIGNhcmQgKEFTTTMy
NDIgY2hpcHNldCksIGl0IG9ubHkgNUdicHMgc3BlZWQsIHNob3VsZCBiZQ0KPj4+Pj4gMTBHYnBz
Lg0KPj4+Pj4NCj4+Pj4NCj4+Pj4gQXJlIHlvdSBzdXJlIHRoYXQgeW91ciBoYXJkd2FyZSBjYW4g
cmVhbGx5IHN1cHBvcnQgdGhpcz8gIERvIHlvdSBoYXZlDQo+Pj4+IHRoZSByaWdodCBjYWJsZSBh
bmQgdGhlIGRldmljZSB3aWxsIHN1cHBvcnQgdGhpcyBzcGVlZD8NCj4+PiAwMjowMC4wIFVTQiBj
b250cm9sbGVyOiBBZHZhbmNlZCBNaWNybyBEZXZpY2VzLCBJbmMuIFtBTURdIDQwMCBTZXJpZXMN
Cj4+PiBDaGlwc2V0IFVTQiAzLjEgWEhDSSBDb250cm9sbGVyIChyZXYgMDEpIChwcm9nLWlmIDMw
IFtYSENJXSkNCj4+PiAgICAgICAgIFN1YnN5c3RlbTogQVNNZWRpYSBUZWNobm9sb2d5IEluYy4g
NDAwIFNlcmllcyBDaGlwc2V0IFVTQiAzLjENCj4+PiBYSENJIENvbnRyb2xsZXINCj4+Pg0KPj4+
IG1haXdvIGsxNjkwIGNvbm5lY3QgdG8gbWFpbmJvYXJkIHVzYjMuMiBnZW4yeDEgcG9ydCBjYW4g
MTBnYnBzLg0KPj4+IFsgMTA0OS45NjU1NTZdIHVzYiAyLTI6IG5ldyBTdXBlclNwZWVkIFBsdXMg
R2VuIDJ4MSBVU0IgZGV2aWNlIG51bWJlcg0KPj4+IDIgdXNpbmcgeGhjaV9oY2QNCj4+PiBbIDEw
NTAuMDI4MjgwXSB1c2Itc3RvcmFnZSAyLTI6MS4wOiBVU0IgTWFzcyBTdG9yYWdlIGRldmljZSBk
ZXRlY3RlZA0KPj4+IFsgMTA1MC4wMjg1NjBdIHNjc2kgaG9zdDk6IHVzYi1zdG9yYWdlIDItMjox
LjANCj4+Pg0KPj4+IHBjaWUgdG8gdXNiMy4yIGdlbjJ4MiBhc20zMjQyIHNob3VsZCBiZSBjb21w
YXRpYmxlIHVzYjMuMiBnZW4yeDEuDQo+Pj4gSSBkb24ndCBoYXZlIHdpbmRvd3Mgb3MgdG8gdGVz
dCB0aGVtLCBtYXkgYmUgNWdicHMgb24gd2luZG93cyB5ZXQuDQo+Pj4gSXMgdGhlcmUgYSB3YXkg
dG8gaGFjayB0aGVtIHRvIDEwR2JwcyBvbiBsaW51eD8NCj4+Pg0KPj4+PiBBbmQgbW9zdCBpbXBv
cnRhbnQsIHdoYXQga2VybmVsIHZlcnNpb24gYXJlIHlvdSB1c2luZz8NCj4+PiBrZXJuZWwgNS4x
NiByYzcuDQo+Pj4+IHRoYW5rcywNCj4+Pj4NCj4+Pj4gZ3JlZyBrLWgNCj4+Pj4NCj4+DQo+PiBU
aGUgQVNtZWRpYSBob3N0IGNvbnRyb2xsZXIgaW5jb3JyZWN0bHkgcmVwb3J0cyB0aGUgc3BlZWQg
SUQgaW4gdGhlDQo+PiBwb3J0LXN0YXR1cyBtaXNtYXRjaGluZyB3aXRoIGl0cyBQU0kgY2FwYWJp
bGl0eSBmb3IgU1NQIGRldmljZXMuIEFzDQo+PiBhIHJlc3VsdCwgdGhlIGhvc3QvaHViIGRyaXZl
ciB3aWxsIHJlcG9ydCB0aGUgd3Jvbmcgc3BlZWQuDQo+Pg0KPj4gVG8gcmVzb2x2ZS93b3JrYXJv
dW5kIHRoaXMsIHRoZSB4SENJIGRyaXZlciBjYW4gY2FwdHVyZSB0aGUgZGV2aWNlIHNwZWVkDQo+
PiBmcm9tIHN1Ymxpbmsgc3BlZWQgbm90aWZpY2F0aW9uIG9mIGEgU1NQIGRldmljZS4gQWxsIFNT
UCBkZXZpY2VzIG11c3QNCj4+IHNlbmQgc3VibGluayBzcGVlZCBkZXZpY2Ugbm90aWZpY2F0aW9u
LCBzbyB0aGlzIG1ldGhvZCBzaG91bGQgcmVzb2x2ZQ0KPj4geW91ciBpc3N1ZS4NCj4+DQo=
