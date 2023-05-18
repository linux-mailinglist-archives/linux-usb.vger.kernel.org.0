Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 10FD77079F8
	for <lists+linux-usb@lfdr.de>; Thu, 18 May 2023 07:57:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230022AbjERF5u (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 18 May 2023 01:57:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60894 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230027AbjERF5s (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 18 May 2023 01:57:48 -0400
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 50BF019B2
        for <linux-usb@vger.kernel.org>; Wed, 17 May 2023 22:57:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1684389467; x=1715925467;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=BdovduaHw1oA2gjk2+rGs9D6FF7osMYnylGjqYd+tIA=;
  b=0LEXLwiMpiUMXy+SNEWuPbQN2UWYrtqn5SmIZZP6VJPHPJfDE44yIVMz
   hQZMGeL0vcAGtwjtiDxn8yvPOucd1DUfdEaBDVJ/K0ZswojiPRawhm6LX
   c8k6bP3Wsw7aq7uuP8y4TMFR3vrj+6A7Lb4XOvLeCXqa0G3g1z0BVHvov
   X+zoR1F9OaMyYr4nAyJzvqrLX3GwEJflZXEPug/tHSP4PEC6KJzJLgdbU
   X6BmpBEBr6S8EYCXGPCnmledT38FJEHHw/uxN6N9NVg+DiRJOAjBQ2W2V
   8gursjzmTYLREDcaNeDaKk4WDhfLQz02Qi0Pu0w1arUXZ3TNOT4c8FNxB
   Q==;
X-IronPort-AV: E=Sophos;i="5.99,284,1677567600"; 
   d="scan'208";a="152686416"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 17 May 2023 22:57:46 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Wed, 17 May 2023 22:57:46 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Wed, 17 May 2023 22:57:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=msbtXuTnp5G2kBV6y6/xBs5VNxmIceFR7fVIq/hujQisvrFJM5TUfR+ADffrJFyMu5uY2KFEayMnC77O/NAISpbzqkpIvCn+JJxteza9PxCcLm700ORd6JW5Fs90FsBpJiefCnzgQiuXzolMOCf+WPU10t17YHrCcZ5U3VXeZPEJLFtd7/V6CSBCbftF0DLepPMaP2zeTFEQuVTUjxBtrah8oRfzg2uX3aRhFM4KNsDbqtyIx8Vd1SeQhvq+T6mnA5rb0HCqaSWECDrZe5PTz2oEBFsDy1leDo51IxKoNy5bIX6uUL/gfjZZD3cpI6lY7WWy0XQ8yQDp2WJXtxWZfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BdovduaHw1oA2gjk2+rGs9D6FF7osMYnylGjqYd+tIA=;
 b=Bas6gp6glT3mce5mBC93MpTZCbS1MYSTMTOshSRDG1oRk46PtpA2TGfUqOxuIeQozYtjxtVyUlj4p8RROWl3URq5s6GV+J3oTcZ8dvwSPszbFe3+pCQpmz9/WHac2MPCoF3acrWzYK1HpBC44rNC8p7oUwRycJhYbL1xL/YqfChcqnnY8zmUHWTr5Yg1xUPHpA6KZOOBGo5JaUcOSPd9sqzPwGGKZupgyEm4n3h1y2lQLFtgxPQZHklbJ17OA+O3ezErP40s0cMSXfQ5IWbT1suUOes9CPC4o32zqbMy9kIJRsY7ISINsFP+hxbty2dlz5tdDR54r/aUqY08PzBiWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BdovduaHw1oA2gjk2+rGs9D6FF7osMYnylGjqYd+tIA=;
 b=gowgGkRMQ+feOxHnKIsJz8+8CVxteJL0+WHKJFe5vM+4y+AERDKF9cEaEJ89REi1E57TH/qCH0hF42AVi8/KyQr+ILyQOAzSkb0UyFj5L7A4th5uf70FPL+8X3D8PxDvbYSR5fZIW+Jez547qSZ9morG2ld0DmjYA72K50rmPtg=
Received: from SJ2PR11MB7648.namprd11.prod.outlook.com (2603:10b6:a03:4c3::17)
 by MW4PR11MB7029.namprd11.prod.outlook.com (2603:10b6:303:22e::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.33; Thu, 18 May
 2023 05:57:44 +0000
Received: from SJ2PR11MB7648.namprd11.prod.outlook.com
 ([fe80::27bf:a69f:806f:67be]) by SJ2PR11MB7648.namprd11.prod.outlook.com
 ([fe80::27bf:a69f:806f:67be%5]) with mapi id 15.20.6411.019; Thu, 18 May 2023
 05:57:44 +0000
From:   <Claudiu.Beznea@microchip.com>
To:     <u.kleine-koenig@pengutronix.de>, <stern@rowland.harvard.edu>,
        <gregkh@linuxfoundation.org>, <Nicolas.Ferre@microchip.com>,
        <alexandre.belloni@bootlin.com>
CC:     <linux-usb@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <kernel@pengutronix.de>
Subject: Re: [PATCH 64/97] usb: ohci-at91: Convert to platform remove callback
 returning void
Thread-Topic: [PATCH 64/97] usb: ohci-at91: Convert to platform remove
 callback returning void
Thread-Index: AQHZiU2ph4uqTnSflUKtWDX77ILRZQ==
Date:   Thu, 18 May 2023 05:57:44 +0000
Message-ID: <5a2fada8-1cdd-a14d-7313-bf074aa55a00@microchip.com>
References: <20230517230239.187727-1-u.kleine-koenig@pengutronix.de>
 <20230517230239.187727-65-u.kleine-koenig@pengutronix.de>
In-Reply-To: <20230517230239.187727-65-u.kleine-koenig@pengutronix.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ2PR11MB7648:EE_|MW4PR11MB7029:EE_
x-ms-office365-filtering-correlation-id: ab84a7e1-9784-4580-f5a0-08db5764cc74
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: XvY4jtVgsb8NAkakjNPZSJyFu3gPwB8mR9hJ5O0ZCp2rcqn8Cpp3Mbv3unxwJgpXuvnroyLoMnphx5OPaNm4HUY8j0GbO4d3kLNKOFmd9mcMhtPifdZ0mMs2vTBVWTXfPecUDkPauq+/ENdy78RlpNQaWyJ+Jb/FB+s36xbgS6SrwVc41p/GtUjccpfcwdYPK5lkTrYH3gLPSzklTByh3xJuTXy0gFOQ39raaSrvsvKc+V+9lNo+/QxN+NCRYDsOzvcVjtLH+L6z4frz2OHnmCw5lf53g4n4oIbr0LvRZ/0D2xQODYSQAaMksOnNvKaBzZepSNwzEXijAPeHE+9wNzQpTm7hYoVex5fEhl3l0j/qcNm9T12ECzSde8gDcB5i0yfKP5RV3iOv8pjNaNzX1t67lFNuKdocGHxbDCDdGr1fSQaPxJvuvf8iVGuWuBZr/xWWgKzOjZLOPDfa7RRdis7UDNohRYgmkOJUO6vqszbgKsCDH+jeHGfyUB1uEf96dexDl2I9biWQVt00SOo1L5HyZiJ8wJNinWZbCokVwvd7U5nP6tdj9U4B36IiTG6NMH1B3mImGIHLURbhKods+oXUN9B7AIIvv/06ygX65Y98kz53aEp6VbfOl62iC7L3u4x1Mv+FSssSDHKzCNv2dZRwJFp8haM05wjkwSPQEQ2wapSi1sQwOLgmrx08lepl
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB7648.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(366004)(396003)(136003)(39860400002)(346002)(376002)(451199021)(2906002)(91956017)(41300700001)(54906003)(31696002)(86362001)(110136005)(71200400001)(478600001)(76116006)(4326008)(8676002)(64756008)(66946007)(66476007)(66446008)(31686004)(316002)(8936002)(5660300002)(66556008)(186003)(38070700005)(6486002)(6512007)(38100700002)(26005)(6506007)(122000001)(53546011)(83380400001)(66574015)(2616005)(36756003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?M3pOM2pYeUE1bUpNVVFHSDlQd2tnb2FSS3djY0hXdE1TODEyczQ0aDFBWGY4?=
 =?utf-8?B?VjlDK1dKenFOMDhyNWJ2MnlaU09mM2Q0bWVPd3FkQ05XTTdXZTJPVkEwcldJ?=
 =?utf-8?B?bFQ5WG4vQUFvU0pvVzV5RmdFMkRNWmwyTStpMk1sMDEvdUJsL3dtRnFNeTg0?=
 =?utf-8?B?anFtZ01uUlNJS0I3VDNzMDc5bXkzOGJ3dUZ5UW1CekI3OXppcURoVVE5UzFD?=
 =?utf-8?B?ZSsrbG5PaGlWQXIxVVpYNSt5SFU0R0JDYnEreXA5TkVoV1llL3p2disrWmJE?=
 =?utf-8?B?Mk14b256UGE5KzdNT3ZlcHVrQXVBTHY1bDN1K2JWN1ZhVDFuWGp3OEtvaWtp?=
 =?utf-8?B?MGVKQXpXQjJOV1NOWHA5cXBiNDJaUUNNd2dXV1lTcGJXc3RkdFVJLzQrVnpT?=
 =?utf-8?B?eUpNbEkzMWpCdkthQmtySE5MOTlDR1hVWlpkclZxRjFRVWZ0Q0NGd1VZUDJB?=
 =?utf-8?B?TXNyYkhlSHFuZ2JLMWxRVk16MGZTSk9seFdZUTFhZFRZb0ttVUxPMXdrSm04?=
 =?utf-8?B?RTlOV013LzkzNmNDcjFlZXJGbEZrSkc0Q1pMQ1RtYSttQVVIclIzb1dsK08y?=
 =?utf-8?B?L1JFVDRJaEdCVjNaVUtvdUxpTjdlbFVxWjBjZy9ZWVlIZndYRmc3YXpJcWZQ?=
 =?utf-8?B?NDJWUFNzUXZtNExLS1oxTlJtU3ZUL1pyalQ5VFNBcFlSdDNOWEVuVTl1czE0?=
 =?utf-8?B?UUJLeVJXNVNWOGFYQlpjbTI2ZndTcGRtcmMxdTh3dmZuMFRYN3lmUnR4ZXIx?=
 =?utf-8?B?WCthQXVGbm1LeDlsb1JYeko2TGhidUZTQ2J5YTNEVEpxd0VDT0RtaVpkemJt?=
 =?utf-8?B?RTd2QlZacjJFeTFxb3pTdVZ1N3RSRCsxOWhlOFd5cVRuOFg0YzFtTzJrV3E4?=
 =?utf-8?B?UjAvdVBlMXpSYkdFQ0ZlQis5NCtkai9Da1cwbTZBd1R0L2JpU3M0UFhRenBB?=
 =?utf-8?B?QXQrUzEzaHBpUmFhaG9pNEtVMlZRVWtlcVBZSkhJRGttZXhyMGxjdDZWdEdj?=
 =?utf-8?B?UmQzOVI2TC82VjM3QWRrOWVyKy9LT1FDT2YzOUE3b3E3cEpJdENZcXVlTnJT?=
 =?utf-8?B?dGhkKzNxdk9JMFBuK2d0S1ZmSDJVbTFoWmJJYSt4c1VkV2lKMjM4bnd1c252?=
 =?utf-8?B?a1ZwNlg2OGxQa2hhTXE3N0d3K1htTEdNMjBFang5MkVpaEtCUUxaamFieklX?=
 =?utf-8?B?MERYZE5mLzVJR0ZIVERyWVFkdytidlk0TGNUU0Q3SllXZ0h0WmNQTVpBS2Jm?=
 =?utf-8?B?dDMwWHZNdzA5eGsxcmpmQXhKU3NjaDVmNEJ0eHFCdG5jNzhPK0R0Smp2Qkp2?=
 =?utf-8?B?bjBRSFpzSXlnUjEvUHh4ZERKUnF0QVBvV1BvcGVYcTRaSERLdTk1RVZGb0VY?=
 =?utf-8?B?VFhDMmo5NUF5dkVSSzBLaTUyM2s5RmRRcTBsUTIzMUpySG8zQW9ZYlZWMDNN?=
 =?utf-8?B?ZlFMaGt6MmhockZWakZpYUVWZEtvSGh6aUh1MXhaTm10dkk5QWlabDA0eERX?=
 =?utf-8?B?MVZ4REV0bFhDUVZITmJaVE5uMStIWSt0RHRyc0N4N3dYVDdvL2VBQlZzK1J2?=
 =?utf-8?B?NUhsL1VaYzk4NFZSTHhBcFpTdUdtN1h0c0wzajIxS1d4blZGUW56YXdjUUtr?=
 =?utf-8?B?aVFFcTFqL0VCRzdsYmcreVE1UFNUSU5qMW4zb0VRUkhBTEtCV1Q4TVZzUkx0?=
 =?utf-8?B?ZjVMR0FRTUlnZ09GSEpUd1VQU0FPTE5hdFdvbmV3VUtsVUQyVlBvSVl6dGdi?=
 =?utf-8?B?MEJMc05KRG1SU3ZVaFoyMHEvaDllamRaZHg0OG8vQkpmMFJuM0YvOW5GcVRF?=
 =?utf-8?B?VUoxSDFjZE14dnMwMDRUeHc3ZTRVbzhXZmN5Mk14SEkzUDV4S0x5TS96ZkhX?=
 =?utf-8?B?MzdINGV2ZmgvR2xLS2lFYUM4aEo2NUdzTFp3YmVvZUpETE40djAwZ21DSERE?=
 =?utf-8?B?clJnc3hHT0g4M0pSRS9VU253MVZUNkxrUXMza21uckFSNVBDSlkvVHVpL2ty?=
 =?utf-8?B?c3M5TmJaN010dytNMnd5bnozQVBLZnhqaGVyQnY2a3E5eldtWEZTQmIxTSti?=
 =?utf-8?B?a0hMYWxKSXFiVVBITTFGQjVYUU9mRUIwVHQrNXhpelI3U0M1V0wweGhUelZu?=
 =?utf-8?B?czUrQmpHNlpMVUNReGdSVGhmd21yR05EMlVRU05DWE42Rk53RUwzd1d2Njd1?=
 =?utf-8?B?bmc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <605D1F1A504E524EB2EB4AFA690BAA85@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB7648.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ab84a7e1-9784-4580-f5a0-08db5764cc74
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 May 2023 05:57:44.1029
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hl25SV26C/JfIl4Ogje/dh3k+D8tfftBlMVEyKYpx6+KUtmtl0ayFTxLKdtXffRya1rMjXUeNSRNnAZ3o1ux6P82ULlToM+8ScBgk41koHk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB7029
X-Spam-Status: No, score=-5.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

T24gMTguMDUuMjAyMyAwMjowMiwgVXdlIEtsZWluZS1Lw7ZuaWcgd3JvdGU6DQo+IA0KPiBUaGUg
LnJlbW92ZSgpIGNhbGxiYWNrIGZvciBhIHBsYXRmb3JtIGRyaXZlciByZXR1cm5zIGFuIGludCB3
aGljaCBtYWtlcw0KPiBtYW55IGRyaXZlciBhdXRob3JzIHdyb25nbHkgYXNzdW1lIGl0J3MgcG9z
c2libGUgdG8gZG8gZXJyb3IgaGFuZGxpbmcgYnkNCj4gcmV0dXJuaW5nIGFuIGVycm9yIGNvZGUu
IEhvd2V2ZXIgdGhlIHZhbHVlIHJldHVybmVkIGlzIGlnbm9yZWQgKGFwYXJ0IGZyb20NCj4gZW1p
dHRpbmcgYSB3YXJuaW5nKSBhbmQgdGhpcyB0eXBpY2FsbHkgcmVzdWx0cyBpbiByZXNvdXJjZSBs
ZWFrcy4gVG8gaW1wcm92ZQ0KPiBoZXJlIHRoZXJlIGlzIGEgcXVlc3QgdG8gbWFrZSB0aGUgcmVt
b3ZlIGNhbGxiYWNrIHJldHVybiB2b2lkLiBJbiB0aGUgZmlyc3QNCj4gc3RlcCBvZiB0aGlzIHF1
ZXN0IGFsbCBkcml2ZXJzIGFyZSBjb252ZXJ0ZWQgdG8gLnJlbW92ZV9uZXcoKSB3aGljaCBhbHJl
YWR5DQo+IHJldHVybnMgdm9pZC4gRXZlbnR1YWxseSBhZnRlciBhbGwgZHJpdmVycyBhcmUgY29u
dmVydGVkLCAucmVtb3ZlX25ldygpIGlzDQo+IHJlbmFtZWQgdG8gLnJlbW92ZSgpLg0KPiANCj4g
VHJpdmlhbGx5IGNvbnZlcnQgdGhpcyBkcml2ZXIgZnJvbSBhbHdheXMgcmV0dXJuaW5nIHplcm8g
aW4gdGhlIHJlbW92ZQ0KPiBjYWxsYmFjayB0byB0aGUgdm9pZCByZXR1cm5pbmcgdmFyaWFudC4N
Cj4gDQo+IFNpZ25lZC1vZmYtYnk6IFV3ZSBLbGVpbmUtS8O2bmlnIDx1LmtsZWluZS1rb2VuaWdA
cGVuZ3V0cm9uaXguZGU+DQoNClJldmlld2VkLWJ5OiBDbGF1ZGl1IEJlem5lYSA8Y2xhdWRpdS5i
ZXpuZWFAbWljcm9jaGlwLmNvbT4NCg0KDQo+IC0tLQ0KPiAgZHJpdmVycy91c2IvaG9zdC9vaGNp
LWF0OTEuYyB8IDUgKystLS0NCj4gIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDMg
ZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy91c2IvaG9zdC9vaGNpLWF0
OTEuYyBiL2RyaXZlcnMvdXNiL2hvc3Qvb2hjaS1hdDkxLmMNCj4gaW5kZXggNTMzNTM3ZWYzYzIx
Li5iOWNlOGQ4MGYyMGIgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvdXNiL2hvc3Qvb2hjaS1hdDkx
LmMNCj4gKysrIGIvZHJpdmVycy91c2IvaG9zdC9vaGNpLWF0OTEuYw0KPiBAQCAtNTk5LDcgKzU5
OSw3IEBAIHN0YXRpYyBpbnQgb2hjaV9oY2RfYXQ5MV9kcnZfcHJvYmUoc3RydWN0IHBsYXRmb3Jt
X2RldmljZSAqcGRldikNCj4gICAgICAgICByZXR1cm4gdXNiX2hjZF9hdDkxX3Byb2JlKCZvaGNp
X2F0OTFfaGNfZHJpdmVyLCBwZGV2KTsNCj4gIH0NCj4gDQo+IC1zdGF0aWMgaW50IG9oY2lfaGNk
X2F0OTFfZHJ2X3JlbW92ZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQ0KPiArc3RhdGlj
IHZvaWQgb2hjaV9oY2RfYXQ5MV9kcnZfcmVtb3ZlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBk
ZXYpDQo+ICB7DQo+ICAgICAgICAgc3RydWN0IGF0OTFfdXNiaF9kYXRhICAgKnBkYXRhID0gZGV2
X2dldF9wbGF0ZGF0YSgmcGRldi0+ZGV2KTsNCj4gICAgICAgICBpbnQgICAgICAgICAgICAgICAg
ICAgICBpOw0KPiBAQCAtNjExLDcgKzYxMSw2IEBAIHN0YXRpYyBpbnQgb2hjaV9oY2RfYXQ5MV9k
cnZfcmVtb3ZlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpDQo+IA0KPiAgICAgICAgIGRl
dmljZV9pbml0X3dha2V1cCgmcGRldi0+ZGV2LCAwKTsNCj4gICAgICAgICB1c2JfaGNkX2F0OTFf
cmVtb3ZlKHBsYXRmb3JtX2dldF9kcnZkYXRhKHBkZXYpLCBwZGV2KTsNCj4gLSAgICAgICByZXR1
cm4gMDsNCj4gIH0NCj4gDQo+ICBzdGF0aWMgaW50IF9fbWF5YmVfdW51c2VkDQo+IEBAIC02ODMs
NyArNjgyLDcgQEAgc3RhdGljIFNJTVBMRV9ERVZfUE1fT1BTKG9oY2lfaGNkX2F0OTFfcG1fb3Bz
LCBvaGNpX2hjZF9hdDkxX2Rydl9zdXNwZW5kLA0KPiANCj4gIHN0YXRpYyBzdHJ1Y3QgcGxhdGZv
cm1fZHJpdmVyIG9oY2lfaGNkX2F0OTFfZHJpdmVyID0gew0KPiAgICAgICAgIC5wcm9iZSAgICAg
ICAgICA9IG9oY2lfaGNkX2F0OTFfZHJ2X3Byb2JlLA0KPiAtICAgICAgIC5yZW1vdmUgICAgICAg
ICA9IG9oY2lfaGNkX2F0OTFfZHJ2X3JlbW92ZSwNCj4gKyAgICAgICAucmVtb3ZlX25ldyAgICAg
PSBvaGNpX2hjZF9hdDkxX2Rydl9yZW1vdmUsDQo+ICAgICAgICAgLnNodXRkb3duICAgICAgID0g
dXNiX2hjZF9wbGF0Zm9ybV9zaHV0ZG93biwNCj4gICAgICAgICAuZHJpdmVyICAgICAgICAgPSB7
DQo+ICAgICAgICAgICAgICAgICAubmFtZSAgID0gImF0OTFfb2hjaSIsDQo+IC0tDQo+IDIuMzku
Mg0KPiANCg0K
