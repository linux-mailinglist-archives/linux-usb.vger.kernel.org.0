Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C66CA45E7EA
	for <lists+linux-usb@lfdr.de>; Fri, 26 Nov 2021 07:37:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1358827AbhKZGkz (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 26 Nov 2021 01:40:55 -0500
Received: from smtprelay-out1.synopsys.com ([149.117.73.133]:40000 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1358933AbhKZGiz (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 26 Nov 2021 01:38:55 -0500
Received: from mailhost.synopsys.com (us03-mailhost1.synopsys.com [10.4.17.17])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id D5B534052B;
        Fri, 26 Nov 2021 06:35:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1637908542; bh=3q1Y8FDAcf1ZJkoj1TeRf7wwLwYr/+NtrebEpFseI7Y=;
        h=From:To:Subject:Date:References:In-Reply-To:From;
        b=Mu8he8+BZnRCvGdgpiLBTp28MwxLdFUwyJRmo8IxrEbMRncpEeY+srueXmZrHi3O1
         iAA7TkBdXuzAe6xAeG7Oie35/tjnvcKusbWMA4uuSLHoEVHoC6YkX1ILyXk5SKTnDC
         EfwWT2oYNwt7VcLKByBBiVD39kPU5XhR8dVcea9ZFMJo22grZcs1DRgLSNI7Vxgw/e
         o2GJ4jsC/rJPwmFscMJIjOAiGZaW8jMAidpA5FBTFEJ3ZNVmUjLyLOnu8EyKpM2C+9
         bRq1uMwOjpGwszSWeDMQ6y9E7dTqeXevpD+LlJuA/9zvF5eZgju/VlpFwWi9yMK2A5
         h7rYfIs0eRZJw==
Received: from o365relay-in.synopsys.com (sv2-o365relay1.synopsys.com [10.202.1.137])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (verified OK))
        by mailhost.synopsys.com (Postfix) with ESMTPS id 01A85A0083;
        Fri, 26 Nov 2021 06:35:41 +0000 (UTC)
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (mail-dm3nam07lp2044.outbound.protection.outlook.com [104.47.56.44])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
        by o365relay-in.synopsys.com (Postfix) with ESMTPS id 53E9A400D5;
        Fri, 26 Nov 2021 06:35:41 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=hminas@synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
        dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="rVlg6ExJ";
        dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RikjyM3a5KqcC0SHBqnt0Qp98sy7WjzTw/SbwUMBSo9jTafjrzjEFUPjvrG6hK8HfVfUub+DtBXv53wzWVOeHo3UP5HDevAVyf43SaCdJ5i5eUxYh853Y8R8fSbQ5DVTerE19sNTzahm+tU1NADV3HcGNS61UmOcL+/FcdvM1EDONFk56sGKqMMHjW7z82uIDmU734b4oFJHpoeIhUIKhJd9HRGTc/ryKXMVce8kdhrST5qcSK2ha9GATrJrZf2q+OwQQTR5Fsslv5iS7TfzfN4qI7LJLD+WgsYtUn24hHhLdpUHHdYD8z568v6p0YDHsklq7qFazKa1ol1HsigfJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3q1Y8FDAcf1ZJkoj1TeRf7wwLwYr/+NtrebEpFseI7Y=;
 b=XeOienVcH+1jvzTXClinX5EW81MhznREfopE4t72h5tzHrotj7oR6OsclIn4QiVxwTz8/GH8GCuq8UijDcYEA2ECTYwPDmCT7e/0ekng390hDkfFdNlE5aVYnA8UVb3Mdnqw4Z78vEQcLhHMyTtIjWZfJiQAtkUYSBRkAFUJpYUvndSCF/J1Lepn3IYrR+Fjzf4SgZXFWjmhZ2l4OdqKBaRmZzNFrkrxufr0VFzv8CIvb+2aPVLoDZSURIN9e5m4qurIXeNUwYtkRiZGwDWq5w8e9ektHkFPJ+gA0xsrwGU+D2XinpRSdA42uYP4mDDrWUJ4LoCgwFfoHYTi4XgrPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3q1Y8FDAcf1ZJkoj1TeRf7wwLwYr/+NtrebEpFseI7Y=;
 b=rVlg6ExJFD/m7/RbVHrL8s2Jid2EdlvVP3iBouxx8lHgXBItVgmxr75psNbkAqoPQzWs8X/acbmIQoD1EnewxbFipJ4OHLkH1oJwRgVcd1jcMAPYETUOpWKZLREieOwEhaQhF7R1krokRDrP+Cwyeo8BYbzONAR6jh1Tdy0Dlp4=
Received: from DM4PR12MB5390.namprd12.prod.outlook.com (2603:10b6:5:39a::12)
 by DM8PR12MB5431.namprd12.prod.outlook.com (2603:10b6:8:34::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4690.26; Fri, 26 Nov 2021 06:35:39 +0000
Received: from DM4PR12MB5390.namprd12.prod.outlook.com
 ([fe80::a0da:c3e5:4562:cea9]) by DM4PR12MB5390.namprd12.prod.outlook.com
 ([fe80::a0da:c3e5:4562:cea9%7]) with mapi id 15.20.4713.024; Fri, 26 Nov 2021
 06:35:39 +0000
X-SNPS-Relay: synopsys.com
From:   Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>
To:     Pavel Hofman <pavel.hofman@ivitera.com>,
        Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: usb: dwc2: gadget: high-bandwidth (mc > 1) status?
Thread-Topic: usb: dwc2: gadget: high-bandwidth (mc > 1) status?
Thread-Index: AQHX4QaFzYXwmWGutEmQPz5HEETK8awStmcAgAE5nQCAAW2VAA==
Date:   Fri, 26 Nov 2021 06:35:39 +0000
Message-ID: <61f1aa1e-89c0-2f11-1619-becac6f41997@synopsys.com>
References: <ea4697fd-8911-3f79-540b-a03214678ccd@ivitera.com>
 <d129d6de-3447-f51f-356a-0589971f9cae@synopsys.com>
 <125ee133-be26-7591-7111-5e945fe4a411@ivitera.com>
In-Reply-To: <125ee133-be26-7591-7111-5e945fe4a411@ivitera.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=synopsys.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6e1bd10b-8541-4485-bfd8-08d9b0a6f683
x-ms-traffictypediagnostic: DM8PR12MB5431:
x-microsoft-antispam-prvs: <DM8PR12MB5431A65EAF6BC61581F5B4A5A7639@DM8PR12MB5431.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: gXlyPg8GKN8ew/Y8JC0OPC4bQiqvuTV/3tNnZn3C/z4R1hD0GgaxYAUUmVinMLdCsMe3LILnDW9sJSUeLO4X1zXOPOuLhIGOnOI8ZR3vueSlnWxwoPR9dSuNEw/Yv8ug7ywU9D+71NSr9p/PgUwi58a+karNBflcls6AiGc+qed2SiVvQvnirldEfjUiUR51fypmfqruzM+6WTTa/HYtC2KCGYNsv9q4+16ljzV47ziQ4S96HWImvk7y7+isFmhS2fV1hAQsuuZraPQ3+5Y5++he82SYJo6/eK5W7oTGbOP+cS8oWiQLpWHnsRs7I+IyxHUdUNFKG6ohAo0Y5O5YNEOjTlH+rI3TNyQE9hyITTVUNeajRCD+7KvFYrmGCDLck7/0x7B1hE3rKLRjlMuApoNyNsmmUCNI9Mtgx1Mwtqz7eQ6MtERfNW00xJJr+JxXWASjyulZ7H9OlFShLW/Vyhs3SiCSiudZcmMF6y6sv6UYuxG6qWHgZ71kycsZCO2be6oktD2QQXnKwvf+EXLQ7a/XJcD4ZYCve68uxvh4G0IWlwObK/7s8sp9Ek7E2OMmDAxPiZC07SqaYY+73wxHwx52fLFVV09S3TUlCGu7THRvT4LDSEPVdHJzj1Hh3tdQfKb1aIsmcpGf57Q7w86+RFUedScTp7UKhTqISTr902dVQg1Dr+zuT5ZD42Th/8VzX42QRpGLc89xrRoxiY53svCiRcFi9pogUC2L8UAI0IF1OGCdTTWxhBmvorkkpnFCM26d7uxdX/UofAsFC4+1yISscetj8VjQf2eE/XY0iyjG650OyYveqHzqhj55V//Iuti3ojVvVTKbMCF5RpKwVpDez7RxoNDZhXPmmkzHhRU=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB5390.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(66476007)(110136005)(2906002)(66446008)(86362001)(38070700005)(38100700002)(91956017)(83380400001)(66946007)(64756008)(31696002)(8936002)(31686004)(2616005)(122000001)(66574015)(316002)(8676002)(966005)(5660300002)(71200400001)(6506007)(76116006)(186003)(508600001)(53546011)(66556008)(6486002)(6512007)(26005)(36756003)(45980500001)(43740500002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NXV1VmY2Vkwza0Vyb2dmU3NTY3AxYW0vRjI1bXA5ZFk3N0taOEFvY2dvdzl1?=
 =?utf-8?B?dmNSb3FyRFh4QUFHeUpLdGdQNWN5K3JXYnJ6V2lKbUZheG45bVAyTFd3RVV0?=
 =?utf-8?B?Y2luRWFCMzRJeWtVd0d5Y25VbnVaQzhYZTVnV2RCa3pVaGswT2NXUUVSOU0w?=
 =?utf-8?B?Y01ONUtJQXJWdHZqVzVCOTZxbm5BYVNoOTFMdEJ5Nm94dmIzc2ZHbmJ5azlt?=
 =?utf-8?B?bC9ESjBPaUZPbkNUSG16RkxwaVF2bUtieWJrRlpPbkZ4MXQ4Tk45a3ZNclFx?=
 =?utf-8?B?QWRsSm1lU0szY2hxNlR2SEs5T1FpOWdJRk5hU0tCdGcyVUxvam9lM2x6ZTRG?=
 =?utf-8?B?R0xpem9RRHo0YnFENmltLzUyYW91VVEvdll6aWdNMEwvclpxdDRPWVFwWDVy?=
 =?utf-8?B?bFp3dEVHdS95cVBhcXBMOTZaaFd2L2tJeTVJM2wvclNCbzJZbkpaMVFGNVBY?=
 =?utf-8?B?R2lwaURnMithMmtTalR4dWE5Qmh6QlZCK2NMWXBhdGdKQjVyY0lzUVBzeWtQ?=
 =?utf-8?B?UXZFeVEzVmRLMzdUMTdLRU1KbnJDRWFqQ0RyN3EvSlp1QUVQN0VvQU0yelVt?=
 =?utf-8?B?YXB2WjZ3Mm95K2V2MHl1Qm5yVk9DUGhlZDZpdEFpS0xzaTd1aXhNUnkyaW80?=
 =?utf-8?B?VnVNb1lBTFN0cDJTQlg2ZENCVTlmT2ZSUFYyVnNYOW8rZklVVzBRZjRrL0NU?=
 =?utf-8?B?YkRZb0JPdVlIWVFMWFNQM0hJZGMxNmprYytSb2piYWtMY2hhMEhyM3p1MjVQ?=
 =?utf-8?B?L2JIMjNXeFpOVFdNeTZpOVhiMUZGeXhQV2FNWUFPNnFPdjRtTHRQcHFPemtn?=
 =?utf-8?B?M1Y0MERweW15RVVsYUFCTG1SS05yRXRwb2hLODZ3VDJjdWw2RlJHQlM0eWRW?=
 =?utf-8?B?V3dkUkRmeTJNRFRNaTZSRVRKOGNSMTBDakhsVmg4cTI3ZjBSeHlLZmJpYzE5?=
 =?utf-8?B?amNOd2NtaXRFWENBUUVlMUszd2M5SnoyQjNVYmM0WURzMHFVVE8xVlE3Smxk?=
 =?utf-8?B?ZU5HbmoycXZmZkhITmZXaVVjM1FlbzZpemlEQ2prR2JEeVdGZU96V3lES2pL?=
 =?utf-8?B?dVhsTm9QR2RjVFc5S09Hck5WVzd2ZUxPRUYyYWpTckVxTHVnTVZpcGJOb2Jl?=
 =?utf-8?B?YytYL3lla2duVm9qZGV6YXhEa2JDd3pabldvMXU5S3N4bjFlcUZHTVFIVUxI?=
 =?utf-8?B?TXFoUDFGL0lOMUd2b0Q1cFNXQ2hkZ2lURTdhcjN5THZ6Vk9CeWcrMkRva2VO?=
 =?utf-8?B?VjBKbVkxazkzM3BpN2RySjQvSFE5aXFlWWZnTXQramQzV2kwMysyWjJ0SEJV?=
 =?utf-8?B?UkdrOThpQlVDMHo5L29tcHVxTVYwWW5QeW5DS1UxczZSclR6MVFrU2V4MHNZ?=
 =?utf-8?B?dlZzMGk0YkN2SS9kWitCTkVrcGpYcnp3S2RQZU0wNWg4aXo1MVR1M1UvMVB2?=
 =?utf-8?B?V0I0WTdrd1Q0QUV2RGRNRzBXdi9QaGJVbFFjVUFaTUdGeVR2ZDg0eDdybmtK?=
 =?utf-8?B?RlZSeUVxOEQ2YVpUU0wyaUlWUlhDMWNkK2p4SjgwRGdHcm1FYUZZRzdzdGRW?=
 =?utf-8?B?RHE2ajg2UzNrb2VMNC9MVW9nODNOdHROZ0NNWVRDQld4c3R5OVdwL0drTmUy?=
 =?utf-8?B?N0NZemxyS0g3RWkrZUJJMVMreldrU3FWay8xRWhxaHVTN2I5aE1vWmUxTm1k?=
 =?utf-8?B?OEsvaWdMQXBhRWVaeFVzS0lMelpCZzlYYnplYTFFa2hqU3pueDRNZzNwb0Rn?=
 =?utf-8?B?T1AxNmdYVlR2UkhrbnJsZ1EraWhPT2o1Sm9ycDN3aUE1WXhuNDV1RFkzN1Y5?=
 =?utf-8?B?REMrenA4b01lc2NoU1F3MmhSU0RLSGNiUXRJeHVNNDcrWEp3NW1qOElrM1NT?=
 =?utf-8?B?ZU9JbnBMQ0ZOd1VSTUZtWnloNmI0aUdBL0NtYStqdHo1dVM0VE9iaXMweER4?=
 =?utf-8?B?VUdTbmRMR0M5enVPNlZlR2kxS2ZBSGRGY0tvMjdhaVlVeUF6a0p4WTAyV0hV?=
 =?utf-8?B?cG5wYmQ5WExXVTRzdGQwb3BjbzE0eVY0d0VhVVE1TXE4bGJONmR1K1E1b2hv?=
 =?utf-8?B?RTdUL2gxVnh3YjVDaTV5VkxERkI1RjR3NktjVXRVUHdzSE9VU240MTdtbndK?=
 =?utf-8?B?QnRaa3VSQ1VWL05ZNGM2N1d6ZCsvRi9BQWpodkt1OGtYYlliVERQQjVaeUtX?=
 =?utf-8?B?c2c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <FF133ACFD583034381CB067C92FFDF76@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5390.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e1bd10b-8541-4485-bfd8-08d9b0a6f683
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Nov 2021 06:35:39.5678
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FPxnPJt797si/UPuKqnmn+40zpSUK11JJBpkS00z+6VrTnrFj+CGVqRWWTLCsZxlJAIe8FfJ6NQ77YfxW9CkdA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR12MB5431
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

SGkgUGF2ZWwsDQoNCk9uIDExLzI1LzIwMjEgMTI6NDcgUE0sIFBhdmVsIEhvZm1hbiB3cm90ZToN
Cj4gDQo+IA0KPiBEbmUgMjQuIDExLiAyMSB2IDE1OjA0IE1pbmFzIEhhcnV0eXVueWFuIG5hcHNh
bChhKToNCj4+IEhpIFBhdmVsLA0KPj4NCj4+IE9uIDExLzI0LzIwMjEgMTE6MzkgQU0sIFBhdmVs
IEhvZm1hbiB3cm90ZToNCj4+PiBIaSBNaW5hcyBhdCBhbGwsDQo+Pj4NCj4+PiBQbGVhc2UgZG9l
cyBkd2MyIChzcGVjaWZpY2FsbHkgaW4gQkNNMjgzNS9SUGkpIHN1cHBvcnQgSFMgSVNPQyBtdWx0
aXBsZQ0KPj4+IHRyYW5zYWN0aW9ucyBtYyA+IDEgcmVsaWFibHk/IEkgZm91bmQgdGhpcyBjb25k
aXRpb24NCj4+PiBodHRwczovL3VybGRlZmVuc2UuY29tL3YzL19faHR0cHM6Ly9lbGl4aXIuYm9v
dGxpbi5jb20vbGludXgvdjUuMTYtcmMyL3NvdXJjZS9kcml2ZXJzL3VzYi9kd2MyL2dhZGdldC5j
Kkw0MDQxX187SXchIUE0RjJSOUdfcGchTU1ORTZDWXZXRUZlV3Q4VzlwSW13TkEtTjRfMDRVOFVz
QldRbXU5TzlCd3ExSGFsQ0F1cHliOWt6R0JBT09NbEttdDZ4ZWZ6JCANCj4+Pg0KPj4+DQo+Pj4g
wqAgwqDCoMKgwqAvKiBIaWdoIGJhbmR3aWR0aCBJU09DIE9VVCBpbiBERE1BIG5vdCBzdXBwb3J0
ZWQgKi8NCj4+PiDCoCDCoMKgwqDCoGlmICh1c2luZ19kZXNjX2RtYShoc290ZykgJiYgZXBfdHlw
ZSA9PSBVU0JfRU5EUE9JTlRfWEZFUl9JU09DICYmDQo+Pj4gwqAgwqDCoMKgwqDCoMKgwqAgIWRp
cl9pbiAmJiBtYyA+IDEpIHsNCj4+PiDCoCDCoMKgwqDCoMKgwqDCoCBkZXZfZXJyKGhzb3RnLT5k
ZXYsDQo+Pj4gwqAgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAiJXM6IElTT0MgT1VULCBERE1BOiBI
QiBub3Qgc3VwcG9ydGVkIVxuIiwgX19mdW5jX18pOw0KPj4+IMKgIMKgwqDCoMKgwqDCoMKgIHJl
dHVybiAtRUlOVkFMOw0KPj4+IMKgIMKgwqDCoMKgfQ0KPj4+DQo+Pj4gQnV0IEkgZG8gbm90IGtu
b3cgaG93IHRoZSBEZXNjcmlwdG9yIERNQSBpcyBjcml0aWNhbCBhbmQgd2hldGhlcg0KPj4+IGRp
c2FibGluZyBpdCB3aWxsIGFmZmVjdCBnYWRnZXQgcGVyZm9ybWFuY2Ugc2VyaW91c2x5Lg0KPj4+
DQo+Pj4gSSBrbm93IGFib3V0IHRoZSBSWCBGSUZPIHNpemluZyByZXF1aXJlbWVudCAoYW5kIFRY
IEZJRk8gdG9vIEkgZ3Vlc3MpLA0KPj4+IHRoZSBjdXJyZW50IGRlZmF1bHQgdmFsdWVzIGNhbiBi
ZSBpbmNyZWFzZWQgZm9yIHRoYXQgcGFydGljdWxhciB1c2UgY2FzZQ0KPj4+IGlmIG5lZWRlZC4N
Cj4+Pg0KPj4+IEkgYW0gdHJ5aW5nIHRvIGxlYXJuIGlmIGl0IG1hZGUgc2Vuc2UgdG8gc3BlbmQg
dGltZSBvbiBhZGRpbmcgc3VwcG9ydA0KPj4+IGZvciBoaWdoLWJhbmR3aWR0aCB0byB0aGUgVUFD
MiBhdWRpbyBnYWRnZXTCoCB0byBhbGxvdyB1c2luZyBsYXJnZXINCj4+PiBiSW50ZXJ2YWwgYW5k
IG1jPTIsMyBhdCBoaWdoIHNhbXBsZXJhdGVzL2NoYW5uZWwgY291bnRzIChzb3J0IG9mICJidXJz
dA0KPj4+IG1vZGUiIHNpbWlsYXIgdG8gVUFDMykuIFdoZW4gZG9pbmcgc29tZSBDUFUtZGVtYW5k
aW5nIERTUCBpdCB3b3VsZCBoZWxwDQo+Pj4gdG8gYXZvaWQgdGhlIHRpbWUtY3JpdGljYWwgaGFu
ZGxpbmcgZXZlcnkgMTI1dXMgbWljcm9mcmFtZS4gQm90aCBPVVQgYW5kDQo+Pj4gSU4gYXJlIGlt
cG9ydGFudC4NCj4+Pg0KPj4NCj4+IEFjY29yZGluZyBwcm9ncmFtbWluZyBndWlkZToNCj4+DQo+
PiAiSXNvY2hyb25vdXMgT1VUIFRyYW5zZmVycw0KPj4gVGhlIGFwcGxpY2F0aW9uIHByb2dyYW1t
aW5nIGZvciBpc29jaHJvbm91cyBvdXQgdHJhbnNmZXJzIGlzIGluIHRoZSBzYW1lDQo+PiBtYW5u
ZXIgYXMgQnVsayBPVVQgdHJhbnNmZXIgc2VxdWVuY2UsIGV4Y2VwdCB0aGF0IHRoZSBhcHBsaWNh
dGlvbg0KPj4gY3JlYXRlcyBvbmx5IDEgcGFja2V0IHBlciBkZXNjcmlwdG9yIGZvciBhbiBpc29j
aHJvbm91cyBPVVQgZW5kcG9pbnQuDQo+PiBUaGUgY29udHJvbGxlciBoYW5kbGVzIGlzb2Nocm9u
b3VzIE9VVCB0cmFuc2ZlcnMgaW50ZXJuYWxseSBpbiB0aGUgc2FtZQ0KPj4gd2F5IGl0IGhhbmRs
ZXMgQnVsayBPVVQgdHJhbnNmZXJzLCBhbmQgYXMgZGVwaWN0ZWQgaW4gRmlndXJlIDEwLTI4Lg0K
Pj4gSWYgdGhlIHRyYW5zZmVycyBhcmUgZm9yIGEgaGlnaC1iYW5kd2lkdGggZW5kcG9pbnQgKG1v
cmUgdGhhbiBvbmUgTVBTDQo+PiBwZXIgzrxmcmFtZSApLCBjcmVhdGUgYXMgbWFueSBkZXNjcmlw
dG9ycyBhcyB0aGUgbnVtYmVyIG9mIHBhY2tldHMgaW4gYQ0KPj4gzrxmcmFtZSAobnVtYmVyIG9m
IGRlc2NyaXB0b3JzID0gbnVtYmVyIG9mIHBhY2tldHMgcGVyIM68ZnJhbWUpLg0KPj4gTWF4aW11
bSBudW1iZXIgb2YgZGVzY3JpcHRvcnMgcGVyIM68ZnJhbWUgcGVyIGVuZHBvaW50IGlzIHRocmVl
LiINCj4+DQo+PiBUbyBwcm9ncmFtIGRlc2NyaXB0b3JzIHRvIHN0YXJ0IEhCIElTT0MgT1VUIHRo
ZXJlIGFyZSBubyBhbnkgcHJvYmxlbS4NCj4+IFByb2JsZW0gb2NjdXJzIG9uIGNvbXBsZXRpb25z
LiBJZiwgZm9yIGV4YW1wbGUgbWMgPiAxLCBkcml2ZXIgd2lsbA0KPj4gYWxsb2NhdGUgYW5kIHBy
b2dyYW0gbWMgKiAocmVxdWVzdCBjb3VudCkgZGVzY3JpcHRvcnMuIElmIGhvc3Qgc2VuZCBtYw0K
Pj4gcGFja2V0cyBwZXIgZnJhbWUgdGhlbiBldmVyeSBtYyBkZXNjcmlwdG9yIHBlcmZvcm0gcmVx
dWVzdCBjb21wbGV0aW9uIGlzDQo+PiBub3QgYmlnIHByb2JsZW0uIEJ1dCBpZiBob3N0IHdpbGwg
c2VuZCBsZXNzIHRoYW4gbWMgcGFja2V0cyBpbiBmcmFtZQ0KPj4gdGhlbiBub3QgY2xlYXIgaG93
IHRvIGV4Y2x1ZGUgdW51c2VkIGRlc2NyaXB0b3JzIGZyb20gZGVzYyBjaGFpbiB3aGljaA0KPj4g
YWxyZWFkeSBmZXRjaGVkIGJ5IGNvcmUgLSBieSBzdG9wIHRyYW5zZmVycyAoZGlzYWJsZSBFUCkg
YW5kIHJlLXN0YXJ0DQo+PiB0cmFuc2ZlcnMgKGZpbGwgYWdhaW4gZGVzYyBjaGFpbikgZnJvbSBu
ZXh0IGZyYW1lPyBPciBwdXJnZSB1bnVzZWQgZGVzY3MNCj4+IGFuZCBzaGlmdGluZyBkZXNjcmlw
dG9ycyAidXAiIGluIGEgY2hhaW4/IFlvdSBjYW4gdHJ5IHRvIGltcGxlbWVudC4NCj4gDQo+IEhp
IE1pbmFzLCB0aGFua3MgZm9yIHlvdXIgaGludHMuIFVuZm9ydHVuYXRlbHkgSSBhbSBwcmV0dHkg
bmV3IHRvIGR3YzIsIA0KPiBwbGVhc2UgY2FuIHlvdSBwb2ludCBtZSB0byBwYXJ0aWN1bGFyIHBh
cnRzIG9mIHRoZSBkd2MyIGNvZGU/DQo+IA0KPiBJIGZvdW5kIHNvbWUgZHdjMiBkZXNjcmlwdGlv
biB3aGljaCByZWFkcyB5b3VyIHF1b3RlIGluIA0KPiBodHRwczovL3VybGRlZmVuc2UuY29tL3Yz
L19faHR0cHM6Ly93d3cubW91c2VyLmNuL2RhdGFzaGVldC8yLzE5Ni9JbmZpbmVvbi14bWM0NTAw
X3JtX3YxLjZfMjAxNi1VTS12MDFfMDYtRU4tNTk4MTU3LnBkZl9fOyEhQTRGMlI5R19wZyFKZzJ3
ZmtSVWZ5TzJqcm5MWG1PN3pPNVcwRXN3LVRUZ0VUQ1RlNW1xdHB1YjFtQW1EWTdRbml4VDhIbVl5
VHAwcmJfYWM3T3QkIA0KPiAobm90IGZvciBCQ00yODM1IGJ1dCBob3BlZnVsbHkgdGhlIHByaW5j
aXBsZSBpcyBzaW1pbGFyKS4gSUlVQyBieSANCj4gZGVzY3JpcHRvciB0aGUgc3RydWN0IGR3YzJf
ZG1hX2RlY3MgaXMgbWVhbnQuDQo+IA0KWWVzLCBkZXNjcmlwdG9ycyBkZWNsYXJlZCBpbiBkd2My
IGFzIGR3YzJfZG1hX2Rlc2MuDQoNCj4gSSBmb3VuZCBhIGZ1bmN0aW9uIGdhZGdldC5jOmR3YzJf
Z2FkZ2V0X2ZpbGxfaXNvY19kZXNjIHdoaWNoIGlzIGNhbGxlZCANCj4gaW4gZHdjMl9nYWRnZXRf
c3RhcnRfaXNvY19kZG1hIGFuZCBkd2MyX2hzb3RnX2VwX3F1ZXVlLiBJcyB0aGUgY29kZSANCj4g
YWZ0ZXIgdGhlIC8qIEhpZ2ggYmFuZHdpZHRoIElTT0MgT1VUIGluIERETUEgbm90IHN1cHBvcnRl
ZCAqLyBjb21tZW50IGluIA0KPiBnYWRnZXQuYzpkd2MyX2hzb3RnX2VwX2VuYWJsZSgpIGJlY2F1
c2UgdGhlIGR3YzIgY29yZSAodGhlIGhhcmR3YXJlKSANCj4gZG9lcyBub3Qgc3VwcG9ydCBIQiBp
biBERE1BLCBvciBiZWNhdXNlIHRoZSBsaW51eCBkd2MyIGRyaXZlciBkb2VzIG5vdCANCj4gaW1w
bGVtZW50IHRoZSBIQiBzdXBwb3J0IGluIERETUEgeWV0ICh3aGljaCBpcyB3aGF0IHdlIGFyZSB0
YWxraW5nIGFib3V0KT8NCkhXIHN1cHBvcnRzIEhCIElTT0MgT1VUIGluIERETUEsIGRyaXZlciBk
b2Vzbid0IHN1cHBvcnQuIEluIG1lbnRpb25lZCBieSANCnlvdSBkYXRhYm9vaywgc2VlIGNoYXB0
ZXIgIjE2LjExLjMuMiBJc29jaHJvbm91cyBPVVQiLg0KPiANCj4gSSBhbSBhc2tpbmcgYmVjYXVz
ZSBpZiB0aGUgSFcgZGlkIG5vdCBzdXBwb3J0IERETUEsIHRoZSBtZXRob2QgDQo+IGR3YzJfZ2Fk
Z2V0X3N0YXJ0X2lzb2NfZGRtYSB3b3VsZCBiZSBvdXQgb2YgZ2FtZSBmb3IgbXkgYW5hbHlzaXMs
IHJpZ2h0PyANCj4gSWYgdGhlIGxhdHRlciBpcyB0aGUgY2FzZSwgc2hvdWxkIHRoZSBIQiBzdXBw
b3J0IGltcGxlbWVudGF0aW9uIGNoYW5nZSANCj4gZHdjMl9nYWRnZXRfc3RhcnRfaXNvY19kZG1h
Pw0KPiANClRvIHN1cHBvcnQgSEIgSVNPQyBPVVQgc2hvdWxkIGJlIHVwZGF0ZWQgZHdjMl9nYWRn
ZXRfZmlsbF9pc29jX2Rlc2MoKSANCmFuZCBkd2MyX2dhZGdldF9jb21wbGV0ZV9pc29jX3JlcXVl
c3RfZGRtYSgpIGZ1bmN0aW9ucy4NCg0KPiBQbGVhc2UgY2FuIHlvdSBleHBsYWluIGEgYml0IG1v
cmUgdGhlIGlzc3VlIGFib3V0IHRoZSB1bnVzZWQgDQo+IGRlc2NyaXB0b3JzPyBUaGlzIGlzIGhv
dyBJIHVuZGVyc3RhbmQgaXQgKHBvb3JseSkuIFRoZSBkcml2ZXIgcHJlcGFyZXMgDQo+IGRlc2Ny
aXB0b3JzIGZvciBhbGwgbWMgcmVxdWlyZWQgYnkgdGhlIHRyYW5zZmVyIChhbmQgcmVwb3J0ZWQg
YnkgDQo+IHdNYXhQYWNrZXRTaXplIHRvIHRoZSBob3N0KSBzbyB0aGF0IHRoZSBjb3JlIChIVykg
Y2FuIGZpbGwgaXQgdmlhIERNQS4gDQo+IEhvd2V2ZXIsIGlmIHRoZSBob3N0IGRvZXMgbm90IG5l
ZWQgdGhlIHdob2xlIHBhY2tldCBzaXplLCBpdCB3aWxsIHNlbmQgDQo+IGZld2VyIHBhY2tldHMg
cGVyIGZyYW1lLCBhbmQgc29tZSBvZiB0aGUgZHdjMl9kbWFfZGVjcyBkZXNjcmlwdG9ycyB3b3Vs
ZCANCj4gbm90IGJlIGZpbGxlZCB3aXRoIGRhdGEgPSB1bnVzZWQuIFRoZSBjb3JlIChIVykgc29t
ZWhvdyBtYXJrcyB0aGUgDQo+IGRlc2NyaXB0b3JzIHdoZXRoZXIgdGhleSB3ZXJlIHVzZWQgb3Ig
bm90LCBhbmQgdGhlIHVudXNlZCBkZXNjcmlwdG9ycyANCj4gKGkuZS4gY29udGFpbmluZyBvbGQv
Ym9ndXMgZGF0YSkgc2hvdWxkIG5vdCB1bmRlcmdvIGNvbXBsZXRpb24gc29tZWhvdy4NCkNvcmUg
ZG9lc24ndCBtYXJrIHVudXNlZCBkZXNjcmlwdG9ycy4NCkRyaXZlciBjYW4gZGV0ZWN0IHRoYXQg
aXQgaXMgbGFzdCBwYWNrZXQgaW4gZnJhbWUgYnkgY2hlY2tpbmcgRFBJRC4gSWYgDQpEUElEIGlz
IERBVEEwIHRoZW4gaXQncyBsYXN0IHBhY2tldCBpbiBmcmFtZSBhbmQgbmVlZCB0byBjb21wbGV0
ZSANCmFwcHJvcHJpYXRlIHVzYiByZXF1ZXN0Lg0KQWZ0ZXIgY29tcGxldGlvbiBvZiBkZXNjcmlw
dG9yLCBjb3JlIHdpbGwgcHJvY2VzcyBuZXh0IGRlc2NyaXB0b3Igd2hpY2ggDQppcyBwcmVwYXJl
ZCBmb3IganVzdCBjb21wbGV0ZWQgdXNiIHJlcXVlc3QgYnV0IG5vdCBmb3IgbmV4dCByZXF1ZXN0
IChhdCANCmxlYXN0IGZyb20gImJ1ZmZlciBhZGRyZXNzZXMiIHBvaW50IG9mIHZpZXcpLg0KSW4g
Y2FzZSBpZiBwYWNrZXQgY291bnQgc2VudCBieSBob3N0IGluIGZyYW1lIGxlc3MgdGhhbiBtYywg
ZHJpdmVyIA0Kc2hvdWxkIGV4Y2x1ZGUgcmVtYWluaW5nIGRlc2NzIGZvciBjb21wbGV0ZWQgdXNi
IHJlcXVlc3QgZnJvbSBkZXNjcmlwdG9yIA0KbGlzdCBieSAic2hpZnRpbmcgdXAiIGRlc2NzIGlu
IGRlc2NyaXB0b3IgbGlzdC4gQnV0IEknbSBub3Qgc3VyZSB0aGF0IA0KZHJpdmVyIGhhdmUgZW5v
dWdoIHRpbWUgdG8gZG8gdGhhdCBiZWZvcmUgY29yZSBmZXRjaCBuZXh0IGRlc2NyaXB0b3IsIA0K
d2hpY2ggc2hvdWxkIGJlIGFscmVhZHkgdXBkYXRlZCAoYXQgbGVhc3QgImJ1ZmZlciBhZGRyZXNz
IiBzaG91bGQgYmUgDQpwb2ludCB0byBhZGRyZXNzIGZvciBuZXh0IHVzYiByZXF1ZXN0KS4NCg0K
PiBCdXQgdGhpcyBzb3VuZHMgdG9vIHNpbXBsZSwgbm90IHdoYXQgeW91IGRlc2NyaWJlZCBpbiB5
b3VyIHBvc3QgOi0pDQo+IA0KPiBBbHNvLCBwbGVhc2Ugd2hlbiBhcmUgY29tcGxldGlvbiBpbnRl
cnJ1cHQgcmVxdWVzdHMgdGhyb3duIGF0IElTT0MgT1VUPyANCj4gQWZ0ZXIgZXZlcnkgcGFja2V0
PWRlc2MsIG9yIGFmdGVyIHRoZSB3aG9sZSBVU0IgZnJhbWUgKGkuZS4gYWZ0ZXIgYWxsIDMgDQo+
IHBhY2tldHMgaW4gY2FzZSBvZiBtYz0zKT8gSWYgYWZ0ZXIgZXZlcnkgcGFja2V0LCB0aGUgSEIg
bW9kZSB3aXRoIGxhcmdlciANCj4gYkludGVydmFsIChsZXNzIGZyZXF1ZW50IGZyYW1lcyB3aXRo
IG11bHRpcGxlIHBhY2tldHMpIHdvdWxkIG5vdCBzcGFyZSANCj4gYW55IGludGVycnVwdHMvQ1BV
IGxvYWQgY29tcGFyZWQgdG8gbW9yZSBmcmVxdWVudCBmcmFtZXMgd2l0aCBzaW5nbGUgDQo+IHBh
Y2tldHMgKG5vIEhCIG1vZGUpIGFuZCBhZGRpbmcgdGhlIEhCIElTT0Mgc3VwcG9ydCB3b3VsZCAi
b25seSIgYWxsb3cgDQo+IGhpZ2hlciBJU09DIGJhbmR3aWR0aCwgbm90IENQVSBsb2FkIHJlZHVj
dGlvbi4gV2hhdCBpcyB0aGUgY2FzZSwgcGxlYXNlPw0KQ29tcGxldGlvbiBpbnRlcnJ1cHQgYXNz
ZXJ0ZWQgb24gdGhlIGVuZCBvZiBkZXNjcmlwdG9yIHByb2Nlc3NpbmcsIGlmIA0KSU9DIChJbnRl
cnJ1cHQgb24gY29tcGxldGlvbikgYml0IGlzIHNldC4gRm9yIEhCIElTT0MgT1VUIHRoaXMgYml0
IA0Kc2hvdWxkIGJlIHNldCBvbiBhbGwgZGVzY3JpcHRvcnMuDQo+IA0KPiBUaGFua3MgYSBsb3Qs
DQo+IA0KPiBQYXZlbC4NCg0K
