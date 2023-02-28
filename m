Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 366F66A592B
	for <lists+linux-usb@lfdr.de>; Tue, 28 Feb 2023 13:36:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229694AbjB1MgP (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 28 Feb 2023 07:36:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52808 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229627AbjB1MgO (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 28 Feb 2023 07:36:14 -0500
Received: from AUS01-SY4-obe.outbound.protection.outlook.com (mail-sy4aus01olkn2180.outbound.protection.outlook.com [40.92.62.180])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 253D22E823
        for <linux-usb@vger.kernel.org>; Tue, 28 Feb 2023 04:36:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F5EzOcsX7EV03Ikg1Wf2M1rx8Bv9mJ/ifCn8dGtGqdX87AazKjthFJEz3rWixp4rbR2DTfWKNVyZvTvoNwx435mfqx5eB+cEBKOafuSdeWOjIqfk5SFrmZPYfe3E+ibSTZTX2H+gLj1OCJ1IRaroq2bXaqQrQ631oomQYBa8Y20iI0u+Nq6WpaQc06I3tzcaeGIQkCZaFxiaUb//Kaaew5Bo2EYFSl79QiudJ8wy1oaDtS66awNlu2b7dECZjUiQZTj8B4CWibqoE4RUE5AhXZFQsnJVGp1Em/JSuQy1OrIihAmG5/yTPGT5M77Wo4FpBpprxdFWxGNBDsFGjVRHcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u1gRlO+C+YducK7vOJLkVg3ezU6kIqnk1SYeGFwWhbM=;
 b=CIyORBePrXata1lVZburqji3Sg3V3L+5ieJTJRhTdJ3QDs23q1TXNLINffagcfWMzaeBtyK0MnmLf4gVCE9zi4ufgF5Y2qUzC1TfSkThy6GAhqBKXzgZIxmws8n4YRx1dAXOIQLI+ponsLMqchufbGIkKREJ8rAUO16JFLRuX47syzlAjotJTebNKdhMA3YUx+me9ePnRkD0uaD16i0pKU1fPnHL2Xu9ZXuSlkXFQ8DQKkYG6YFbRfr9C2mHywbSaYiKRtlKnKoXAgv04YmP3/bRFzFvm82I/gNkdE9NSgRqjDs6xpLwXpy7tYP79xHbR0HiGxJ5bkcpIxmhoO6k2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u1gRlO+C+YducK7vOJLkVg3ezU6kIqnk1SYeGFwWhbM=;
 b=K17qwqSWiAJPv8wJjCoNx5+UzBUM5Wzc6vPz6iLrI1zxwfYsW5JE8eIQknhcsWaD+GqYkzrMjwAtSWHMYSygvo5XYL4aSVjO7xjAoKI0RKrQ8C3M6yj+G8AVNNL2esGmNkbHpcEL6HwSeOqqRxxm0HOIGHjddUppAW4Hlh7QfVJYpAFiBmYETbSDBLjClTrDDnn2G1eBRmuAAdPK9KFA9P1qQgG67Rb6a5OBp8mkIqq6otfldN15nvK7qSaN1p9L7o56FlV0cqH2y9uAmw5QRucu+aKHfvg/yOXtrvx8ZAMaW+SkwNBVI1IG1Y12SWQcu+qiP6L/UqwdhtN0dYRW8w==
Received: from ME3P282MB2827.AUSP282.PROD.OUTLOOK.COM (2603:10c6:220:13c::13)
 by ME3P282MB1027.AUSP282.PROD.OUTLOOK.COM (2603:10c6:220:81::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.30; Tue, 28 Feb
 2023 12:36:09 +0000
Received: from ME3P282MB2827.AUSP282.PROD.OUTLOOK.COM
 ([fe80::50ae:cb9:fc65:57f4]) by ME3P282MB2827.AUSP282.PROD.OUTLOOK.COM
 ([fe80::50ae:cb9:fc65:57f4%6]) with mapi id 15.20.6134.030; Tue, 28 Feb 2023
 12:36:09 +0000
From:   Yen Chun-Chao <nothingstopsme@hotmail.com>
To:     Greg KH <gregkh@linuxfoundation.org>
CC:     "davem@davemloft.net" <davem@davemloft.net>,
        "pabeni@redhat.com" <pabeni@redhat.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: Re: [PATCH 1/3 RFC] net: usb: ax88179_178a: Enable
 FLAG_MULTI_PACKET to improve tx stability
Thread-Topic: Re: [PATCH 1/3 RFC] net: usb: ax88179_178a: Enable
 FLAG_MULTI_PACKET to improve tx stability
Thread-Index: AQHZS1YYZO9r/AsJ1kCdaKk5CvPGF67kFoTFgAAhoQCAAAG//g==
Date:   Tue, 28 Feb 2023 12:36:09 +0000
Message-ID: <SY4P282MB2823BA36EDABF6EE71E74BB6D1AC9@SY4P282MB2823.AUSP282.PROD.OUTLOOK.COM>
References: <ME3P282MB2827A82474F353487FF91CE4D15F9@ME3P282MB2827.AUSP282.PROD.OUTLOOK.COM>
 <ME3P282MB2827E9AD698A7F925EB1E9BAD1AC9@ME3P282MB2827.AUSP282.PROD.OUTLOOK.COM>
 <ME3P282MB2827F38828DB53102F370FA0D1AC9@ME3P282MB2827.AUSP282.PROD.OUTLOOK.COM>
 <Y/3kvjoTv7UDDqTj@kroah.com>
In-Reply-To: <Y/3kvjoTv7UDDqTj@kroah.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-exchange-messagesentrepresentingtype: 1
x-tmn:  [CpcPaGwFS1edZ1LgFY20+OtthkvFcKy2]
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: ME3P282MB2827:EE_|ME3P282MB1027:EE_
x-ms-office365-filtering-correlation-id: c4ff5794-11f3-43e6-37db-08db19885e72
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 1mUAv3pSnz9PAajMsgWNk1JMZA2KYDa1Qi21eBqGlaseuB4E3UeCvjn1bMoPJVeg3cu7Rt0vAQ4QlLtkMzQyGId2N16/ztFLJUQLdjiBRO8F/cN+NbAIJbBXc1vmLcxcJj8G58C52RrfkakP2Uh+N3EOFqpQjF2bEB/ZqCzMempoIsfm9fzVbbDqynhSCYkDtfF8UejJyHrmYHxf/f2/IJVvNchRzVbmFVpDLPFBKYRxRim4xJGGyT0D1qM2UNyjWRCIE6vr05sNnZkG/L9VTWxk1NGvq0TPtihQgnVh/y4HvGARTZlE3+Ks0tEX/6EhatA4zMTygmHvFBjI/fFxkz2sh7jYh7gLKYpOP2BbAdVv0wYM9katTBW8YjAiosd2sKjFt06ghN3CvxCk1d2WcuQpHWYoWpx9eezVlo1MhNDtlfDl57WvduqF+DLxAssITPYxUz9EnWsAxn8Qo3jBlaSxgdFTCmwy0yxqVmeVhAwQNfQHWW3CnE7yCT3Jl4KRA1ZjRZ3D6O+i5bYBchckW8yZZ1m2XCMnGsTMcW/GX2MM/ECYFRs4Dqozw7UNUfylMKptlaYIcYS3CErqV2YbViEKsnl3lSJ3Yxx+pwjivZC3joTQtihl9HLeoKFExFdo4XxJ5lyXtkL3CrZMOqNk1wq8IlO2+3xWW9MsgOo2Uv0=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?big5?B?NUFFT3UwODRZaDh2U3NIOFdSejNTZldCM25nYUlVazVDNTN0YUxVcVVFekt4ZEQ0?=
 =?big5?B?ZlhON3VWT2xraVlnUFJML3kzRHNOOGJWY20wYzJFSXp3R2k2dWxSY0MwYmEyY3p0?=
 =?big5?B?Sk9xZm9EVTd1YU1TV2VmQVRQNFNwVml1UHJyUXNYVkpTMTE1WC8wNk51cDBrVUVO?=
 =?big5?B?djFrOURFdnJXSHRxTyt6cU1lU293ZC9zQzE0OGVjR0U3eW03c2pVdm16c3F5dmdu?=
 =?big5?B?ZXZZRzA2OFVCR3p3RmF4Q2g3U1dVdUJYUTk3Y1MrL1NIWXkrWHdrUjhjZ0lvWXA1?=
 =?big5?B?NmtLK3lYb0cvSzd4ZEYxRVNmRnpQZ0Z5UkNONU1KL08wM1ljWWxWb1Rqc2I2Q3Fn?=
 =?big5?B?ZGV5b29LYm1IQjdYUmdrK0tZL1czRkRpUFFvYXZ4dTBOa1VRUVhQVGlKTHc2Smg1?=
 =?big5?B?aWRGb0hScUFvL29ZVkFveGF1MmRiWllaUHpOTjJHUE9zS0hHeGJISVlVdGNvV2RG?=
 =?big5?B?TUZKV3RWaHFWekZsd0V5aTRwdzg2WTRqU0xldDZlbEswYVFaWTJsUXNLSTZJSkJX?=
 =?big5?B?cHlyOWFNZjYydjd5Rk5CVkw4Um1vV1dmcGFOTDRWZkpJUktYTm1VVEkvcXdxS2xv?=
 =?big5?B?NEdaaU5Da1hSVXZkOHVBdEJ3S3BORHlva2t5UGZNOStyM2NocElMQW9nWFBpWHZL?=
 =?big5?B?YkVKZWE2cWJlbTEvV0ljR1ZyTWd3cDdaRy9XaUJlTURjS3Y4bHVRTndJOTZ5R3dH?=
 =?big5?B?VG0wcnkwalJlWUsrWDFwZkVrZ2YxckhXaUtoanZYb1lHT0JUUm1nMGQ0cVFvSmNa?=
 =?big5?B?UWZDRmZ2eENiRi9pMjU1WWNiekZRQVFQK0pBSVBlR1pVd0xJRWxVUTNuY2RyT09q?=
 =?big5?B?d2JPRkF3RzluM0dnREVtMnpBUWxseDN2RUh0SmJ6K0F6ZlpFUVpid0VCQzg4WkhL?=
 =?big5?B?N0RmODZkZ29vUDVadkxScHlvK1NsZjdRdmlnUTh4R1d6R0VtL2llai9vbWY5UUpp?=
 =?big5?B?bUJUWFByTG9ZS0t6cUJjRmQxYjAzNTgzWHBxMUZoYTRCY2FkRGlRMkh5QnhjcE52?=
 =?big5?B?MVR3amlQR0tFcE1TQ0ZHQ2JVSjF2TnlCTVkyWUxObWJyYzFDQitvUU5DdmtmM2lF?=
 =?big5?B?bnQ1bXBESEw3K3huZDF3SzZjMytDU2pEd3JsNktROHN5b3Y0Q0M1SW9OLzVGSVpE?=
 =?big5?B?OUVINHhxSGVWMVFMUUJ3Tmc3Yk1MZFBYM1pKOFJ2MjJlN3FNNFpMQlZnRjE4VUNy?=
 =?big5?B?MTVUd0djV3E1Z3dueDgzSnF4UExQdjdDOTZETmc5em1HTTBiRmJ5anp1MXl4UTdn?=
 =?big5?B?RFZRODNNN3FjcWppL1JXZVpsTXRONUJVbTZLUXpzSHRqWXFHWllWQVEwVFJpdm1D?=
 =?big5?B?cUN3Ym9yVjVvRVh4Vm5oOFdyYk1Kbk5BckpBVzJyMElMc2xiOVVLZnltZGJPVXNn?=
 =?big5?B?UmFKeXMrOFByV0RnZGJ6d2lzRktyQjlac21uZWdjd3FiVzBFSmtlZjhTVjBSOTNu?=
 =?big5?B?V2tZVnJrZXZqQjVxclRWeHA5ZEVab2VlKzZtVm5ZSGJlblErUjF3ZVZqa1ZMczZN?=
 =?big5?B?N1lkOFIzUXJtWUhCT1lkV3NqUGpXVStHcDl0SFFzOWpDMFRKdTUwRDNOdnFhL3BU?=
 =?big5?B?OXdZNml4UW9SczBRekxsN1Vqa29KVWdEVStxTnZ4b3dYU2hRek5EZTMwWmVIcTFs?=
 =?big5?B?UHZpeXZ3PT0=?=
Content-Type: text/plain; charset="big5"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: sct-15-20-4755-11-msonline-outlook-746f3.templateTenant
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: ME3P282MB2827.AUSP282.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: c4ff5794-11f3-43e6-37db-08db19885e72
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Feb 2023 12:36:09.3222
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ME3P282MB1027
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Pk9uIFR1ZSwgRmViIDI4LCAyMDIzIGF0IDA5OjQ0OjQzQU0gKzAwMDAsIFllbiBDaHVuQ2hhbyB3
cm90ZToKPj4gUHJvYmxlbSBEZXNjcmlwdGlvbjoKPj4gVGhlIGN1cnJlbnQgd2F5IG9mIGhhbmRs
aW5nIHRoZSBib3VuZGFyeSBjYXNlIGluIHR4LCBpLmUuIGFkZGluZyBvbmUtYnl0ZQo+PiBwYWRk
aW5nIHdoZW4gdGhlIHNpemUgb2YgYW4gb3V0Ym91bmQgcGFja2V0IGlzIGEgbXVsdGlwbGUgb2Yg
dGhlIG1heGltdW0KPj4gZnJhbWUgc2l6ZSB1c2VkIGZvciBVU0IgYnVsayB0cmFuc2ZlciwgZG9l
cyBub3Qgd29yayB3aXRoIHRoZSBoYXJkd2FyZS4KPj4gVGhpcyBjYW4gYmUgc2hvd24gYnkgcnVu
bmluZyBhIGxvYWRpbmcgdGVzdCB2aWEgaXBlcmYgd2l0aCB0aGlzIGhhcmR3YXJlIGFzCj4+IHRo
ZSBzZW5kZXI7IG9uZSBjYW4gdGhlbiB0dW5lIHRoZSBpcGVyZiBwYXJhbWV0ZXJzIG9uIHRoZSBz
ZW5kZXIgc2lkZSAoZS5nLgo+PiAiLU0gNTEwIiBpbiBteSB0ZXN0aW5nIGVudmlyb25tZW50KSBz
byB0aGF0IHNlbnQgcGFja2V0cyBmcmVxdWVudGx5IGhpdCB0aGUKPj4gYm91bmRhcnkgY29uZGl0
aW9uLCBhbmQgb2JzZXJ2ZSBhIHNpZ25pZmljYW50IGRyb3AgaW4gdGhlIHRyYW5zbWlzc2lvbgo+
PiByYXRlLiBJbiB0aGUgd29yc3QgY2FzZSAob2Z0ZW4gYWZ0ZXIgYSBsb25nIHJ1biksIHRoZSBo
YXJkd2FyZSBjYW4gc3RvcAo+PiBmdW5jdGlvbmluZyAoY2FuIG5vdCBzZW5kIG9yIHJlY2VpdmUg
cGFja2V0cyBhbnltb3JlLCBhbGJlaXQgdGhlCj4+IGNvcnJlc3BvbmRpbmcgbmV0d29yayBpbnRl
cmZhY2UgaXMgc3RpbGwgcmVwb3J0ZWQgcHJlc2VudCBieSBpZmNvbmZpZykuCj4+IAo+PiBJdCBp
cyBhbHNvIGJlbGlldmVkIHRoYXQgdGhpcyBwcm9ibGVtIGlzIGhpZ2hseSByZWxldmFudCB0byB0
aGlzIGJ1ZyBbMV0uCj4+IAo+PiBTb2x1dGlvbjoKPj4gRW5hYmxlIEZMQUdfTVVMVElfUEFDS0VU
IGFuZCBtb2RpZnkgYm90aCBheDg4MTc5X3J4X2ZpeHVwKCkgYW5kCj4+IGF4ODgxNzlfdHhfZml4
dXAoKSBhY2NvcmRpbmdseS4KPj4gCj4+IFJhdGlvbmFsZToKPj4gV2hlbiBGTEFHX01VTFRJX1BB
Q0tFVCBpcyBlbmFibGVkIChhbmQgRkxBR19TRU5EX1pMUCBpcyBvZmYsIHdoaWNoIGlzIHRoZQo+
PiBjYXNlIGZvciB0aGlzIGRyaXZlciksIHVzYm5ldCB3aWxsIHNraXAgcGFkZGluZywgYW5kIHRy
dXN0IHRoYXQgZWFjaAo+PiBza19idWZmIHJldHVybmVkIGZyb20gdGhlIG1pbmktZHJpdmVyJ3Mg
dHhfZml4dXAgZnVuY3Rpb24gaGFzIGJlZW4gdGFrZW4KPj4gY2FyZSBvZiB0byBjYXRlciBmb3Ig
dGhlIHJlcXVpcmVtZW50IG9mIGl0cyB0YXJnZXQgaGFyZHdhcmUuIFRoYXQKPj4gbWVjaGFuaXNt
IGFsbG93cyB0aGlzIG1pbmktZHJpdmVyIHRvIHNlbmQsIGV2ZW4gd2hlbiB0aGUgYm91bmRhcnkg
Y29uZGl0aW9uCj4+IGlzIGRldGVjdGVkLCAidW50YW1wZXJlZCIgcGFja2V0cyAobm8gcGFkZGlu
Zywgbm8gZXh0cmEgZmxhZ3MsIGFzIGlmIGluIHRoZQo+PiBub3JtYWwgY2FzZSkgdGhhdCB0aGUg
aGFyZHdhcmUgYWNjZXB0cywgYW5kIHRoZXJlZm9yZSByZXNvbHZlcyB0aGlzCj4+IHByb2JsZW0u
Cj4+IAo+PiBOb3RlIHRoYXQgcmF0aGVyIHRoYW4gYmVpbmcgdmlld2VkIGFzIGEgd29ya2Fyb3Vu
ZCwgZW5hYmxpbmcKPj4gRkxBR19NVUxUSV9QQUNLRVQgaXMgaW50ZW5kZWQgdG8gYmV0dGVyIG1h
dGNoIHRoZSBvdmVyYWxsIGJlaGF2aW91ciBvZiB0aGUKPj4gaGFyZHdhcmUsIGFzIGl0IGFsc28g
ZWNob3Mgd2VsbCB0aGUgcnggcHJvY2VkdXJlIGNvbmR1Y3RpbmcgbXVsdGlwbGUtcGFja2V0Cj4+
IGV4dHJhY3Rpb24gZnJvbSBhIHNpbmdsZSBza19idWZmIGluIGF4ODgxNzlfcnhfZml4dXAoKS4K
Pj4gCj4+IFZlcmlmaWNhdGlvbjoKPj4gT25seSB0ZXN0ZWQgd2l0aCB0aGlzIGRldmljZToKPj4g
MGI5NToxNzkwIEFTSVggRWxlY3Ryb25pY3MgQ29ycC4gQVg4ODE3OSBHaWdhYml0IEV0aGVybmV0
Cj4+IAo+PiBSZWZlcmVuY2VzOgo+PiBbMV0gaHR0cHM6Ly9idWd6aWxsYS5rZXJuZWwub3JnL3No
b3dfYnVnLmNnaT9pZD0yMTI3MzEKPj4gCj4+IFNpZ25lZC1vZmYtYnk6IENodW4tQ2hhbyBZZW4g
PG5vdGhpbmdzdG9wc21lQGhvdG1haWwuY29tPgo+PiAtLS0KPj4gVGhpcyBpcyB0aGUgc2FtZSBw
YXRjaCBhcyBodHRwczovL3JiLmd5LzE5OXM1bSBzZW50IGluIE9jdC4gMjAyMi4KPj4gSSBqdXN0
IHdvdWxkIGxpa2UgdG8ga25vdyB0aGUgY3VycmVudCBzdGF0ZSBvZiB0aGlzIHBhdGNoLgo+PiBI
YXMgaXQgYmVlbiByZWplY3RlZCBvciBzdGlsbCB1bmRlciByZXZpZXc/Cj4KPlBhdGNoZXMgbWFy
a2VkIHdpdGggIlJGQyIgYXJlIG5ldmVyIHRvIGJlIGFwcGxpZWQsIHdoYXQgbmVlZHMgdG8gYmUg
ZG9uZQo+b24gdGhpcyBpbiBvcmRlciBmb3IgeW91IHRvIGZlZWwgY29tZm9ydGFibGUgZW5vdWdo
IHRvIHN1Ym1pdCBpdCBmb3IKPmFjdHVhbHkgaW5jbHVzaW9uPwoKU29ycnkgZm9yIHRoZSBtaXN1
c2Ugb2YgIlJGQyIuIEkgdGhvdWdodCB0aGF0IHRhZyBjb3VsZCBiZSB1c2VkIHRvIGFzayAKcXVl
c3Rpb25zIGFib3V0IHRoZSBwYXRjaGVzIHNlbnQgcHJldmlvdXNseSB3aGVuIG5vIGNoYW5nZSBp
cyBhZGRlZC4KCkFzIHlvdSBtaWdodCBoYXZlIG5vdGljZWQgaW4gdGhlIG1lc3NhZ2UgYWZ0ZXIg
Ii0tLSIsIG15IGludGVudGlvbiBpcyB0byAKY2hlY2sgd2hldGhlciBteSBwYXRjaGVzIGFyZSBz
dGlsbCB1bmRlciByZXZpZXcgb3Igbm90LCBiZWNhdXNlIEkgaGF2ZSAKbm90IHJlY2VpdmVkIGFu
eSBmZWVkYmFjay9jb21tZW50cyBzaW5jZSB0aGV5IHdlcmUgc2VudCBvdXQgaW4gT2N0LiAyMDIy
LgoKPgo+UGxlYXNlIGRvIHRoYXQgYW5kIHRoZW4gc2VuZCBpdCBvdXQgcHJvcGVybHkuCj4KPkFs
c28sIEkgdGhpbmsgdmdlciBzdGlsbCBiYW5zIGhvdG1haWwuY29tIGVtYWlscywgc29ycnksIHBs
ZWFzZSB1c2UgYQo+YmV0dGVyIGVtYWlsIHByb3ZpZGVyIGlmIHlvdSB3aXNoIHRvIGNvbnRyaWJ1
dGUgdG8gdGhlIGtlcm5lbC4KClRoYW5rIHlvdSB2ZXJ5IG11Y2ggZm9yIHRoaXMgaW5mb3JtYXRp
b24uIAoKU2luY2UgbXkgcGF0Y2ggbWFpbHMgaGF2ZSBhcHBlYXJlZCBhdCBodHRwczovL2xvcmUu
a2VybmVsLm9yZy9saW51eC11c2IsICAKc2hvdWxkIEkgdHJlYXQgYWxsIG9mIHRoZW0gKHNlbnQg
ZnJvbSBob3RtYWlsLmNvbSkgYXMgaW52YWxpZCwgYW5kCnNlbmQgdGhlIHNhbWUgcGF0Y2ggc2Vy
aWVzIGFnYWluIHVzaW5nIGFub3RoZXIgZW1haWwgcHJvdmlkZXIsIAppbiB0aGUgd2F5IGxpa2Ug
SSBhbSBzZW5kaW5nIHRoZW0gZm9yIHRoZSBmaXJzdCB0aW1lPwoKPgo+dGhhbmtzLAo+Cj5ncmVn
IGstaAoKQmVzdCwKCkNoYW8=
