Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CE75B5128DC
	for <lists+linux-usb@lfdr.de>; Thu, 28 Apr 2022 03:31:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239250AbiD1Beg (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 27 Apr 2022 21:34:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36340 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232520AbiD1Bef (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 27 Apr 2022 21:34:35 -0400
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.87.133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D00F8205E7
        for <linux-usb@vger.kernel.org>; Wed, 27 Apr 2022 18:31:21 -0700 (PDT)
Received: from mailhost.synopsys.com (us03-mailhost2.synopsys.com [10.4.17.18])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 108D7C0507;
        Thu, 28 Apr 2022 01:31:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1651109481; bh=LSPMwve6oghnP23NE9dLI674RZk96zgzSA/0iFtpyvI=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=B1lUUv3+bwdyJMoX61L3EYAhPkR8awmrPT+AVZTu7mYdZ12+fsMhdG6lWxuELLVc0
         qFpIsWOqhk83MYJVNdVomKmLpIBMQmG7qMRoRATUT1E/5awaeA/EplI8rcL8KSz7sr
         HdmSnxWD+Z//cvYbheNfmtDdGKV65wVjU2Wyz2pDsxmBlP5Scn39bwK0EtE/tvtNSf
         +D9Sm4IDGH6+PutkfPHmQCzi5zXAXYs5ftwc285z1LbDSm3MiMhceFqCkSSUcuTiiu
         m8cjQxDYXIAYFj0uCJd9dN47ePrsyiGTg+pk7u80Ukn2SfOBh6z9LGFH2gjv35n4/V
         psSIvkJegu8ig==
Received: from o365relay-in.synopsys.com (sv2-o365relay1.synopsys.com [10.202.1.137])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (verified OK))
        by mailhost.synopsys.com (Postfix) with ESMTPS id D5C6EA008A;
        Thu, 28 Apr 2022 01:31:19 +0000 (UTC)
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2101.outbound.protection.outlook.com [104.47.58.101])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
        by o365relay-in.synopsys.com (Postfix) with ESMTPS id 566A0400DA;
        Thu, 28 Apr 2022 01:31:18 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=thinhn@synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
        dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="XFN7OdIF";
        dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MpOICAWCDLGjyjHZG7QFfsfzuu3HUtlz65th2/C0Ue/GVaUaO1Sbf7yZUtxL5LDp+uPiQ8N9B32GPFBiwDRVr+WRZYsJ5FWhgACd++CFVuhnuHdO98WoTnsD98hVCnOP4aQgAckKWvezC5XPel92a6EqEt+pI504YUGZ73SfC7jr12DPfpTtLE5VD/ro3OGF4X52Ta9bLfIOJGBtIroCVYAb0aKa1sZHjLGLon/cYvKeV/EWe7iO+yVWcEa/7lONq3t+vdlxkwOmM6YhXeWoAUkGvtUpbVQBGWeEmkgcRCoacb8/tbG0DHet0LtNpY3+pCLkMz0i4SfQNjYAWljmsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LSPMwve6oghnP23NE9dLI674RZk96zgzSA/0iFtpyvI=;
 b=U/XWwXcyldY48ZIH3LRwkAVQg8PIJAWr+Xl//hNMJIsUdye2tLndvE/GxpFTOty4qf62cLK0xMaDJ/TbTP/BImYo3MhhIYCiPnGfBwQAiNFwvr3qS/DiMv7Ma40SNJVzyob7Q2Wx1zpbdUIPQHI0Q3mnsal/MJUIK4zQBAifP1zgOxyad5kZuah4bc2rprja7cs0oQ5CgJupqKCw5jQbL3EpDgitRZzQP1p6nqDLnX6aow8Ag63fKNOEG290ow/Hboqye3eQcDtdK/cKturla921RG1417KW7iOq4BEO7a1dLksnjjfWfy7+SI+K6WkVp1JDeRaKWAaI4hQFj/gvNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LSPMwve6oghnP23NE9dLI674RZk96zgzSA/0iFtpyvI=;
 b=XFN7OdIFFavO1Qq/KCvZEdHYEfOig9vXRFNq686NkvHIoWrA/u/3EH2/5cLDw286CAyIjZiIz+qQCXDjQVLLPkyWB7YBgAG4F+CpcXTI5u5vu8JY0pHoW/Wq9FtcCU6Rv2BHsHHc7XQYtqrGDpg20wG6OTMMoimJFPUNlcg+MDU=
Received: from BYAPR12MB4791.namprd12.prod.outlook.com (2603:10b6:a03:10a::12)
 by CH2PR12MB4232.namprd12.prod.outlook.com (2603:10b6:610:a4::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.14; Thu, 28 Apr
 2022 01:31:15 +0000
Received: from BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::d7:f2c8:c731:bdba]) by BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::d7:f2c8:c731:bdba%5]) with mapi id 15.20.5186.021; Thu, 28 Apr 2022
 01:31:15 +0000
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To:     Wesley Cheng <quic_wcheng@quicinc.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
CC:     John Youn <John.Youn@synopsys.com>
Subject: Re: [PATCH 6/6] usb: dwc3: gadget: Delay issuing End Transfer
Thread-Topic: [PATCH 6/6] usb: dwc3: gadget: Delay issuing End Transfer
Thread-Index: AQHYVe/n8VwiImGRQkCcSNY32gMIGq0EiqQAgAAIyYA=
Date:   Thu, 28 Apr 2022 01:31:15 +0000
Message-ID: <c223ee49-1fe4-fec1-15de-c9b4c1183d8b@synopsys.com>
References: <cover.1650593829.git.Thinh.Nguyen@synopsys.com>
 <2fcf3b5d90068d549589a57a27a79f76c6769b04.1650593829.git.Thinh.Nguyen@synopsys.com>
 <5fa9ab81-6b5c-6c3c-2ae7-eb620973a54b@quicinc.com>
In-Reply-To: <5fa9ab81-6b5c-6c3c-2ae7-eb620973a54b@quicinc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=synopsys.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: fcfba544-1c3d-488b-3843-08da28b6c99e
x-ms-traffictypediagnostic: CH2PR12MB4232:EE_
x-microsoft-antispam-prvs: <CH2PR12MB423246D68A276BF1A41122A0AAFD9@CH2PR12MB4232.namprd12.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: QvHaGVqU2JbpZLCyvz5QRx8BLhY6f3UgI77MvVF/2d8BAifrr2557maGGmc8odMH8QeLLdMSy4rAyOQrpl3a10MxNAFDhrPmanKsx6tc+5vmPbAm8GahaZpH9GyGnvjXMKMcxN+bp6GBkagBS34AfgxpHuaejNTvszi1jW+drfpW3doYasz5LNHSXA1sbqHE0Np1xWjFqYloBbKuWQ3tk1i5XPM9lY6KbQ/hbej+mnAy3r56AfZXq2GObQr/ICY36yTBsK5eoZ6fcZ1EkGaFfljTMFuxLdOBwP1lyxoii6MEFrwT6QqiwJMuTk7SkH1Zu62OXyeJeW1qgZ2oUgDtUjd1R1XubQz2iNwWt73haJLcq2yImaEBhCJjWWYLFRe99ptdf3yoo7avkgGRJmXK36nf7uJ5/VxuVTuyQgfsXSDrY9orlNuyweL1QDFWKpjYa14E6SMo3Fk/Y0X7RmaObanLcOdW6w3prYoy1BQ6zbY+OJsGZNqaKLwHN73jZ9KtH+VP6dAWG5jPcQBzAhCVUG6CN3u+O7V7S1hxeDgaSLXSDM8qcQuKgT1VmMgIvy5WWHs5dLOqthn6liDZydWs6GRTuGDoEgMkQSPCmyZf13T6VTanEw5XgPhS63K9tge2g6wKbIdm/KUJ0C/wIanHg4ogW0uCsqwq1fuYRgUdvcaiwUIWgSuNCg6cyg/hDupWvU1H/dPjNVl83LpBq6rAM5f0RAD9Yhe/toRWp/JJ+suHOH8tfKfAoisC0R1FoeAL+7g4nDYJubcRrRsfZLeBKg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB4791.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(38100700002)(38070700005)(4326008)(66446008)(71200400001)(2616005)(5660300002)(6512007)(86362001)(26005)(6506007)(2906002)(122000001)(6486002)(83380400001)(66476007)(8936002)(31696002)(64756008)(8676002)(508600001)(66946007)(36756003)(316002)(66556008)(186003)(31686004)(76116006)(107886003)(110136005)(53546011)(43740500002)(45980500001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?eDkycHJlYzVSanEwMjQwcXB6Z2JSYXlGSitsTW5rVGtoMEJnbE9tMGhxaWJ1?=
 =?utf-8?B?dkpNckdwYXFMVkZCQ21hQlh5bFAyajhhSzZHYitXQ1dGdWFMNGdubGVjcGJ5?=
 =?utf-8?B?WWtSV3NacVRQd3A1UkhJTFZnNVJhRVk5UFR0VVlueEpNTzYxMlhOdWVLZFE4?=
 =?utf-8?B?RHJJSVdIQjg5cW82YVgxZXc3YUhBYXAxNGRadWIrSmdrMEhpNENMRk9icUZK?=
 =?utf-8?B?NUxXY3MrajVraEo1d1hjbDFCM1p4SmN0ODhUNXB1MWJMSCtkOGJnLzdCOUlG?=
 =?utf-8?B?WDhCbnRuTm90ZFhlcGQ3dnZ4NGhJcTFjOUlXdGNLNjJzVENYcmI2TUp5SkJL?=
 =?utf-8?B?QmttV204QVJFVzZUaUhPdXZDQzZ5RlpJTXNqKzBIakVSUzI2cTJabHpjeTFs?=
 =?utf-8?B?eS9uOTM1UERBQVIvMjh3OXZSai9ZTFl1SEhWS2xKUVM3ZXEzazgvV2FMQnF5?=
 =?utf-8?B?RTdGbVMyVklkVEVkNTRhUDRsNVVqekx1RzVSN3dzRlh4am1zMVNUMTlnVlh4?=
 =?utf-8?B?MEh6MmRsMUpZWHptcGl0UlBBT2xVRzhvbERoSmZ5SDJSMFRyeHBYelljS0ht?=
 =?utf-8?B?aXRHaDVoZXY1MUkxdElmcHVkNStaYVhWZzVLZHdNWjVtWWx4amszbzRJQlBM?=
 =?utf-8?B?RUtVMEs5VDZRWW8rZm1nSElMWmNwajBMeHk0Mk56YXVLYnhueE1NUzZEWlhK?=
 =?utf-8?B?R3hSZkVWTnp5cExtUTdOVHlxaWZYTVNGa09UNXZiUjE2ZWo0L0pJY0NpQ2hD?=
 =?utf-8?B?WDVmYkNiUVlMTFNJTE4rcVBPQjQ3OUY4aUpIUXdYMWlxL0x2OXoxT1lPemN3?=
 =?utf-8?B?TVc1bG4rdTFES3dPdktFeGVkUFdBSkg3SS9DQTNWZEdPaHYzKzg2OXZ2Nksz?=
 =?utf-8?B?SHoxcWNLRUxEbDE5N0FLUm12MlJoMW5lOE5BRERKeWh1bEdmYWRoci9raGlz?=
 =?utf-8?B?SUVTT0pCbytqSnRQTlAvUlpBajlOWkdEYWkzczlybG1nRUNYazBsVzJ4Mzha?=
 =?utf-8?B?c2wxWkIrZFcvRkdabEZPdXZiZnZFRTBlR0R4bzRRZFMvYjMvLzhuTkJZbExl?=
 =?utf-8?B?L242T05seS9WbmZ3MXBTbEF5SFlUR0V0VnhYckJpVHFZWk1TZnhrRnVFSjdL?=
 =?utf-8?B?ZEhNc2FNYW4wdDlVRzlwVDVCVkdEUHplSExScHpDaEpVRWtjcUx6QnBac29k?=
 =?utf-8?B?MSsvZzEzTDNrbVFuNTRIbFVGVnRzeXFaNlRJYnJoQ09KZmRjV3l2MFZaWTNH?=
 =?utf-8?B?N1ZKb0lPOFA2N1RxNnZMQUFnaVY0WjVPMFgwUXEvY2lDU0RhdWJNRlhNbWQ0?=
 =?utf-8?B?ZjRuZURFLzIyVStVaHRVdG5KSktqek1jWEZxUUUvY3NESVV3WWsyRzh4ZUNT?=
 =?utf-8?B?eldYWmZ1b1NQQk5tV0tpQ3RyMUhpMk1BVkplWXZza3h0VmluMEJhUjZCeXF0?=
 =?utf-8?B?WFFtc3Z4RlFVeGpTZGpaRTRFOFpPb1J2VGhTWnhkVmxKNjN1ZzlDWVlmZHZK?=
 =?utf-8?B?UnlBMHJHN2ZRMmZNeVQ5TDRCL1FHUlNqVVZ6Z0NESFZJR0g2UDk2cTduUG54?=
 =?utf-8?B?S2hjREtMTFh3dWRvV2RQNU9zQ1cyVWk5eE5Yc2VHbWlNVERFeDFSZGxKTEsz?=
 =?utf-8?B?WVNSN2lyL3FFbHE2cEN0N3lLaXRlT0k5VlAzRHA5WUpmYkg1TnZHcnRRMEZM?=
 =?utf-8?B?VGlyZ1VGeldHTHB1RVEzczdpaExIVTgxZ3FvTGUzQy85SU9IeUNvUnpsdlZI?=
 =?utf-8?B?U1Jid3NMMDlrbEhqMjlnQzcyNlNoSExwUnV2NndTelpOTzVwMUJhcUxmdTAz?=
 =?utf-8?B?eDJTSm1YUitDYk1vNVlZRkZuQ0hkQVlsSjFjWXFFT2JpdE9VYXArdkxSeTd4?=
 =?utf-8?B?SHlHMURsSEc5TWc3U0MzVk1BTm83ZmRMc3JXMG1UVnBDcGM4T3dWbHNFR1Fs?=
 =?utf-8?B?YmZtUEFDeEpSMTV3RXdvZnRYakpxaU8wanI1K1RLOC9xQ3VybSs3ZXVZcGxh?=
 =?utf-8?B?UEJIZ1hvaGxLZS9ONlp4UnhXb0tXWjdaV2tkUVNWdEdQcFZzMEQ2dlFLcHda?=
 =?utf-8?B?K3IrOTQvajlxb3o3Tjg0ZUtSZXk5cERTN1E0QzFtUzUxMGJ4RWRaVVZUclIz?=
 =?utf-8?B?RW9DV3JqSk1XbUtlWnFnZkRyb295cm5XcEhSbWx3Qk94WVZJM1p0TUo0blRo?=
 =?utf-8?B?QmNla3F2TTF1b3JnRDZOa2JqYXVzQ0pWSWVNeFA2SHU0dmNDTUJTRkUzNkx0?=
 =?utf-8?B?eDltY1N2Zy82ZFh2WEFuVGVlUkY0bXZGNXF3VXFMR242czFERjVNaDB1UFdT?=
 =?utf-8?B?Y3JZaHlsZXp0OGdEY3JqaWFwcHozS29uZk1CZ3lpTU1FeS9rZ1FKdz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <CBF24CFBAB1A7E4996B4319A08AC58CB@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB4791.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fcfba544-1c3d-488b-3843-08da28b6c99e
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Apr 2022 01:31:15.7626
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: R+H6rfuV8vzI24lMkZG4Va8YKl3npAb2KWSsRYwQjY9m2ONTI7bWBpqO/kVx4mBadDVTtzNSiuhX4LWbic3CZQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4232
X-Spam-Status: No, score=-4.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

SGkgV2VzbGV5LA0KDQpXZXNsZXkgQ2hlbmcgd3JvdGU6DQo+IEhpIFRoaW5oLA0KPiANCj4gT24g
NC8yMS8yMDIyIDc6MjMgUE0sIFRoaW5oIE5ndXllbiB3cm90ZToNCj4+IElmIHRoZSBjb250cm9s
bGVyIGhhc24ndCBETUEnZWQgdGhlIFNldHVwIGRhdGEgZnJvbSBpdHMgZmlmbywgaXQgd29uJ3QN
Cj4+IHByb2Nlc3MgdGhlIEVuZCBUcmFuc2ZlciBjb21tYW5kLiBQb2xsaW5nIGZvciB0aGUgY29t
bWFuZCBjb21wbGV0aW9uIG1heQ0KPj4gYmxvY2sgdGhlIGRyaXZlciBmcm9tIHNlcnZpY2luZyB0
aGUgU2V0dXAgcGhhc2UgYW5kIGNhdXNlIGEgdGltZW91dC4NCj4+IFByZXZpb3VzbHkgd2Ugb25s
eSBjaGVjayBhbmQgZGVsYXkgaXNzdWluZyBFbmQgVHJhbnNmZXIgaW4gdGhlIGNhc2Ugb2YNCj4+
IGVuZHBvaW50IGRlcXVldWUuIExldCdzIGRvIHRoYXQgZm9yIGFsbCBFbmQgVHJhbnNmZXIgc2Nl
bmFyaW9zLg0KPj4NCj4+IFNpZ25lZC1vZmYtYnk6IFRoaW5oIE5ndXllbiA8VGhpbmguTmd1eWVu
QHN5bm9wc3lzLmNvbT4NCj4+IC0tLQ0KPj4gwqAgZHJpdmVycy91c2IvZHdjMy9nYWRnZXQuYyB8
IDIyICsrKysrKysrKysrKy0tLS0tLS0tLS0NCj4+IMKgIDEgZmlsZSBjaGFuZ2VkLCAxMiBpbnNl
cnRpb25zKCspLCAxMCBkZWxldGlvbnMoLSkNCj4+DQo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy91
c2IvZHdjMy9nYWRnZXQuYyBiL2RyaXZlcnMvdXNiL2R3YzMvZ2FkZ2V0LmMNCj4+IGluZGV4IDdj
NGQ1ZjY3MTY4Ny4uZjBmZDdjMzI4MjhiIDEwMDY0NA0KPj4gLS0tIGEvZHJpdmVycy91c2IvZHdj
My9nYWRnZXQuYw0KPj4gKysrIGIvZHJpdmVycy91c2IvZHdjMy9nYWRnZXQuYw0KPj4gQEAgLTIw
NTYsMTYgKzIwNTYsNiBAQCBzdGF0aWMgaW50IGR3YzNfZ2FkZ2V0X2VwX2RlcXVldWUoc3RydWN0
IHVzYl9lcA0KPj4gKmVwLA0KPj4gwqDCoMKgwqDCoMKgwqDCoMKgIGlmIChyID09IHJlcSkgew0K
Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgc3RydWN0IGR3YzNfcmVxdWVzdCAqdDsNCj4+
IMKgIC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgIC8qDQo+PiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgICogSWYgYSBTZXR1cCBwYWNrZXQgaXMgcmVjZWl2ZWQgYnV0IHlldCB0byBETUEgb3V0LCB0
aGUNCj4+IGNvbnRyb2xsZXIgd2lsbA0KPj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAqIG5v
dCBwcm9jZXNzIHRoZSBFbmQgVHJhbnNmZXIgY29tbWFuZCBvZiBhbnkgZW5kcG9pbnQuDQo+PiBQ
b2xsaW5nIG9mIGl0cw0KPj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAqIERFUENNRC5DbWRB
Y3QgbWF5IGJsb2NrIHNldHRpbmcgdXAgVFJCIGZvciBTZXR1cA0KPj4gcGFja2V0LCBjYXVzaW5n
IGENCj4+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgKiB0aW1lb3V0LiBEZWxheSBpc3N1aW5n
IHRoZSBFbmQgVHJhbnNmZXIgY29tbWFuZCB1bnRpbA0KPj4gdGhlIFNldHVwIFRSQiBpcw0KPj4g
LcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAqIHByZXBhcmVkLg0KPj4gLcKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCAqLw0KPj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgaWYgKGR3Yy0+ZXAwc3Rh
dGUgIT0gRVAwX1NFVFVQX1BIQVNFICYmDQo+PiAhZHdjLT5kZWxheWVkX3N0YXR1cykNCj4+IC3C
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZGVwLT5mbGFncyB8PSBEV0MzX0VQX0RFTEFZ
X1NUT1A7DQo+PiAtDQo+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAvKiB3YWl0IHVudGls
IGl0IGlzIHByb2Nlc3NlZCAqLw0KPj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZHdjM19z
dG9wX2FjdGl2ZV90cmFuc2ZlcihkZXAsIHRydWUsIHRydWUpOw0KPj4gwqAgQEAgLTM2NTcsNiAr
MzY0NywxOCBAQCB2b2lkIGR3YzNfc3RvcF9hY3RpdmVfdHJhbnNmZXIoc3RydWN0IGR3YzNfZXAN
Cj4+ICpkZXAsIGJvb2wgZm9yY2UsDQo+PiDCoMKgwqDCoMKgwqDCoMKgwqAgKGRlcC0+ZmxhZ3Mg
JiBEV0MzX0VQX0VORF9UUkFOU0ZFUl9QRU5ESU5HKSkNCj4+IMKgwqDCoMKgwqDCoMKgwqDCoCBy
ZXR1cm47DQo+PiDCoCArwqDCoMKgIC8qDQo+PiArwqDCoMKgwqAgKiBJZiBhIFNldHVwIHBhY2tl
dCBpcyByZWNlaXZlZCBidXQgeWV0IHRvIERNQSBvdXQsIHRoZQ0KPj4gY29udHJvbGxlciB3aWxs
DQo+PiArwqDCoMKgwqAgKiBub3QgcHJvY2VzcyB0aGUgRW5kIFRyYW5zZmVyIGNvbW1hbmQgb2Yg
YW55IGVuZHBvaW50LiBQb2xsaW5nDQo+PiBvZiBpdHMNCj4+ICvCoMKgwqDCoCAqIERFUENNRC5D
bWRBY3QgbWF5IGJsb2NrIHNldHRpbmcgdXAgVFJCIGZvciBTZXR1cCBwYWNrZXQsDQo+PiBjYXVz
aW5nIGENCj4+ICvCoMKgwqDCoCAqIHRpbWVvdXQuIERlbGF5IGlzc3VpbmcgdGhlIEVuZCBUcmFu
c2ZlciBjb21tYW5kIHVudGlsIHRoZQ0KPj4gU2V0dXAgVFJCIGlzDQo+PiArwqDCoMKgwqAgKiBw
cmVwYXJlZC4NCj4+ICvCoMKgwqDCoCAqLw0KPj4gK8KgwqDCoCBpZiAoZHdjLT5lcDBzdGF0ZSAh
PSBFUDBfU0VUVVBfUEhBU0UgJiYgIWR3Yy0+ZGVsYXllZF9zdGF0dXMpIHsNCj4+ICvCoMKgwqDC
oMKgwqDCoCBkZXAtPmZsYWdzIHw9IERXQzNfRVBfREVMQVlfU1RPUDsNCj4+ICvCoMKgwqDCoMKg
wqDCoCByZXR1cm47DQo+PiArwqDCoMKgIH0NCj4+ICsNCj4gDQo+IFNpbmNlIHdlIGNvdWxkIGJl
IGNhbGxpbmcgZHdjM19zdG9wX2FjdGl2ZV90cmFuc2ZlcigpIGFzIHBhcnQgb2YgdGhlDQo+IGR3
YzNfZ2FkZ2V0X3B1bGx1cCgwKSBjYXNlIChkdWUgdG8gZHdjM19zdG9wX2FjdGl2ZV90cmFuc2Zl
cnMoKSksIGhvdyBkbw0KPiB3ZSBlbnN1cmUgdGhhdCBhbGwgYWN0aXZlIEVQcyBhcmUgc3RvcHBl
ZCBiZWZvcmUgY2FsbGluZyBydW4vc3RvcCBjbGVhcj8NCg0KSXQgc2hvdWxkIGJlIGZpbmUgZXZl
biB0aGUgRW5kIFRyYW5zZmVyIGNvbXBsZXRlcyBhZnRlciB0aGUgcnVuX3N0b3AgYml0DQppcyBj
bGVhci4gQ2xlYXJpbmcgdGhlIHJ1bl9zdG9wIHdvdWxkIHN0b3AgYWN0aXZpdHkgYmVjYXVzZSB0
aGUgaG9zdCBpcw0KZGlzY29ubmVjdGVkLiBCdXQgdGhlIGNvbnRyb2xsZXIgY2FuIHN0aWxsIGFz
c2VydCBpbnRlcnJ1cHQgaWYgdGhlcmUgYXJlDQpwZW5kaW5nIGV2ZW50cyBldmVuIGFmdGVyIHRo
ZSBydW5fc3RvcCBiaXQgaXMgY2xlYXJlZC4NCg0KPiANCj4gc3RhdGljIGludCBkd2MzX2dhZGdl
dF9zb2Z0X2Rpc2Nvbm5lY3Qoc3RydWN0IGR3YzMgKmR3Yykgew0KPiAuLi4NCj4gwqDCoMKgwqDC
oMKgIGlmIChkd2MtPmVwMHN0YXRlICE9IEVQMF9TRVRVUF9QSEFTRSkgew0KPiDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIGludCByZXQ7DQo+IA0KPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIHJlaW5pdF9jb21wbGV0aW9uKCZkd2MtPmVwMF9pbl9zZXR1cCk7DQo+IA0KPiDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHNwaW5fdW5sb2NrX2lycXJlc3RvcmUoJmR3Yy0+bG9j
aywgZmxhZ3MpOw0KPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJldCA9IHdhaXRfZm9y
X2NvbXBsZXRpb25fdGltZW91dCgmZHdjLT5lcDBfaW5fc2V0dXAsDQo+IMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBtc2Vjc190b19q
aWZmaWVzKERXQzNfUFVMTF9VUF9USU1FT1VUKSk7DQo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgc3Bpbl9sb2NrX2lycXNhdmUoJmR3Yy0+bG9jaywgZmxhZ3MpOw0KPiDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIGlmIChyZXQgPT0gMCkNCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZGV2X3dhcm4oZHdjLT5kZXYsICJ0aW1lZCBvdXQgd2Fp
dGluZyBmb3IgU0VUVVANCj4gcGhhc2VcbiIpOw0KPiDCoMKgwqDCoMKgwqAgfQ0KPiANCj4gLS0t
PiBXZSBrbm93IHRoYXQgZXAwc3RhdGUgd2lsbCBiZSBpbiBTRVRVUCBwaGFzZSBub3csIGJ1dCBo
b3N0IGNhbiBzZW5kDQo+IHRoZSBTRVRVUCBkYXRhIHNob3J0bHkgYWZ0ZXIgaGVyZS7CoCBUaGlz
IG1heSBjYXVzZSBzb21lIGVuZHBvaW50cyBpbiB0aGUNCj4gYmVsb3cgZHdjM19zdG9wX2FjdGl2
ZV90cmFuc2ZlcnMoKSBjYWxsIHRvIG1hcmsgRFdDM19FUF9ERUxBWV9TVE9QLg0KPiAoZXAwc3Rh
dGUgY291bGQgYWR2YW5jZSBhcyB3ZSBjYWxsIGdhZGdldCBnaXZlYmFjayBpbiBiZXR3ZWVuIHNl
cnZpY2luZw0KPiBlYWNoIGRlcCwgYW5kIGxvY2sgaXMgcmVsZWFzZWQgYnJpZWZseSkNCg0KTm8s
IGl0IHNob3VsZG4ndCBhZHZhbmNlLiBUaGUgcGF0Y2ggIltQQVRDSCA0LzZdIHVzYjogZHdjMzog
ZXAwOiBEb24ndA0KcHJlcGFyZSBiZXlvbmQgU2V0dXAgc3RhZ2UiIHdpbGwgY2F1c2UgdGhlIGNv
bnRyb2xsZXIgdG8gcmVzcG9uZCBhIFNUQUxMDQp0byBhbnkgbmV3IGNvbnRyb2wgdHJhbnNmZXIg
YW5kIHB1dCBpdCBiYWNrIGFuZCBwcmVwYXJlIGEgbmV3IFRSQiBmb3IgYQ0KbmV3IFNFVFVQIHBh
Y2tldC4NCg0KPiDCoMKgwqDCoA0KPiDCoMKgwqDCoMKgwqAgLyoNCj4gwqDCoMKgwqDCoMKgwqAg
KiBJbiB0aGUgU3lub3BzeXMgRGVzaWduV2FyZSBDb3JlcyBVU0IzIERhdGFib29rIFJldi4gMy4z
MGENCj4gwqDCoMKgwqDCoMKgwqAgKiBTZWN0aW9uIDQuMS44IFRhYmxlIDQtNywgaXQgc3RhdGVz
IHRoYXQgZm9yIGEgZGV2aWNlLWluaXRpYXRlZA0KPiDCoMKgwqDCoMKgwqDCoCAqIGRpc2Nvbm5l
Y3QsIHRoZSBTVyBuZWVkcyB0byBlbnN1cmUgdGhhdCBpdCBzZW5kcyAiYSBERVBFTkRYRkVSDQo+
IMKgwqDCoMKgwqDCoMKgICogY29tbWFuZCBmb3IgYW55IGFjdGl2ZSB0cmFuc2ZlcnMiIGJlZm9y
ZSBjbGVhcmluZyB0aGUgUnVuU3RvcA0KPiDCoMKgwqDCoMKgwqDCoCAqIGJpdC4NCj4gwqDCoMKg
wqDCoMKgwqAgKi8NCj4gwqDCoMKgwqBkd2MzX3N0b3BfYWN0aXZlX3RyYW5zZmVycyhkd2MpOw0K
PiANCj4gLS0tPiBEbyB3ZSBuZWVkIHRvIGFkZCBzb21lIHN5bmNocm9uaXphdGlvbiBoZXJlIHRv
IG1ha2Ugc3VyZSB0aGF0IGFsbA0KPiBFUHMgdGhhdCBoYWQgdGhlIERXQzNfRVBfREVMQVlfU1RP
UCBoYWQgYmVlbiBzZXJ2aWNlZCBieSB0aGUgc3RhdHVzDQo+IHBoYXNlIGNvbXBsZXRlIGhhbmRs
ZXI/wqAgT3RoZXJ3aXNlLCB3ZSB3aWxsIGNvbnRpbnVlIHRvIHRyeSB0byBoYWx0IHRoZQ0KPiBj
b250cm9sbGVyLCB3aGljaCB3aWxsIGZhaWwgc2luY2UgdGhlcmUgY291bGQgc3RpbGwgYmUgRVBz
IHdoaWNoIGFyZQ0KPiBhY3RpdmUuDQoNCkJlY2F1c2Ugd2UgbWFrZSBzdXJlIGVwMHN0YXRlIHdv
bid0IGFkdmFuY2UgYmV5b25kIEVQMF9TRVRVUF9QSEFTRSwgd2UNCmRvbid0IGhhdmUgdG8gd29y
cnkgYWJvdXQgRFdDM19FUF9ERUxBWV9TVE9QLg0KDQo+IA0KPiDCoMKgwqDCoF9fZHdjM19nYWRn
ZXRfc3RvcChkd2MpOw0KPiDCoMKgwqDCoHNwaW5fdW5sb2NrX2lycXJlc3RvcmUoJmR3Yy0+bG9j
aywgZmxhZ3MpOw0KPiANCj4gwqDCoMKgwqByZXR1cm4gZHdjM19nYWRnZXRfcnVuX3N0b3AoZHdj
LCBmYWxzZSwgZmFsc2UpOw0KPiB9DQo+IA0KPiBJIGhhdmVuJ3QgcnVuIGludG8gdGhpcyBwYXJ0
aWN1bGFyIHNjZW5hcmlvIHlldCwgYnV0IHRob3VnaHQgSSdkIGFzayB0bw0KPiBzZWUgaWYgdGhl
cmUgd2FzIHNvbWUgZmxvdyB0aGF0IEkgbWlzc2VkLg0KPiANCg0KVGhhbmtzIGZvciB0ZXN0aW5n
IQ0KDQpCUiwNClRoaW5oDQoNCg==
