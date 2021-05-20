Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4390D38B8EF
	for <lists+linux-usb@lfdr.de>; Thu, 20 May 2021 23:24:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230157AbhETVZX (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 20 May 2021 17:25:23 -0400
Received: from smtprelay-out1.synopsys.com ([149.117.73.133]:47624 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230152AbhETVZX (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 20 May 2021 17:25:23 -0400
Received: from mailhost.synopsys.com (badc-mailhost3.synopsys.com [10.192.0.81])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 368C6401D3;
        Thu, 20 May 2021 21:24:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1621545841; bh=dEOgbRS8otbvJb/dzeM/7oyEyXo1fiV3fyWNV+oimKA=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=l/tR53MjZyFZaS7drOyJPw2inQsRwVB0jIJcqjL80r2wVOsETRCxGxBimUi7X7y3f
         +kQcXLJvxpJK/pWT59i6aGk83vxBJxiqN1Bi+g5juRVcVgZbXHBkTUPmA0UFZK1FH8
         tDcLMYYbOmTnxM1ngTwdDmTUg7endBJr5x9b/AKP2+Kvno5NHpimygUipLf4WrrhVr
         vBxVBGEV+ElRWOOigPRwJacaAJSMQ6lnRB8wjl8oWIQgx3vIb9JL3iba5L6mtz2mXg
         qlf+ClyvVno9BLqLbN0qZEjTJ8myOYadVRUEyrF0DplEahzK9wgfKjVpAwGfmdsB7U
         JNwY9RGF/WI6g==
Received: from o365relay-in.synopsys.com (us03-o365relay3.synopsys.com [10.4.161.139])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPS id 84AFFA0063;
        Thu, 20 May 2021 21:24:00 +0000 (UTC)
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2174.outbound.protection.outlook.com [104.47.57.174])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
        by o365relay-in.synopsys.com (Postfix) with ESMTPS id 5EFE4800C2;
        Thu, 20 May 2021 21:23:59 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=thinhn@synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
        dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="RFqiQgMg";
        dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GZhcU0/U5YoKg7cHWUnHiEW68zT6l9YORfRaxtdHEOoFibrCm7eplLOL2X3DhkWclBep33De9JCdEcxfzYgBcvFLkWYxrR2iEdjFdkzCWaNu+IXd/6WnHQCFd9Vypu15W0P5dYsMsouu/HNtYpGAkyqKFTL90Q2xVShBh/hq7auAkhs11WWOQb18K1DNfLtk0fTORNh9PYeGNj7b8LAB5rqAV1vkAiJDNA1ly/mtOnXXDcoQcVBjaCb74ek+ahk7M2FvMJ5ffhnATR6NPkNjhXy70MTtwgBO3wj68O+VLSJtoFbA3Qsazj6bezAwi3o+KYteeEGC2hUyF8+8iHX44A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dEOgbRS8otbvJb/dzeM/7oyEyXo1fiV3fyWNV+oimKA=;
 b=fv+viSvqQtD3/4po/oozFyJDZI+bdPxBGn1zNiszUPK3m5kGuy3GvT6eRW8hOWQpSSJl93hux1CAQZDaVkmpvx7wrWI8ZhW4GzzKGF+JkPnP7X16IWnXvOV8rLygr9KNAKhoKHyr+aEu47KcKjcgFtCfdHKEBpLLuAAfyox4Fv3jTOBae1S9AJTm6+32hrYAoQAr+V0CH6GbODSrKoF2GfWarR9Yuc+v7bSs0nHqjHX/WuiDJhPrZBc2DS7gmsb4kEp92FRU/L86z8dl60qa8KGJ+3u7TAdg2ZMWhJlBE5JTkwpRhJFpVN53DZ2GQsZ3UdPI8y4Ed5YOy6AxWX8Tgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dEOgbRS8otbvJb/dzeM/7oyEyXo1fiV3fyWNV+oimKA=;
 b=RFqiQgMgDvw7sBdaJUzL4A3zUiTgifk/b78yb2DyzuxKWQCNkvKq69NSYe2p4xc0k5rlRF5AO3jvo7TfhJ0aaSDK6msDkRqMFgTtpORYl3hcPE5fYQkpM0BscILPioFWBN2Ld5mOwdpx+kVYkIba1R7MctstPVKakcWTpDrC2Do=
Received: from BYAPR12MB4791.namprd12.prod.outlook.com (2603:10b6:a03:10a::12)
 by BY5PR12MB4258.namprd12.prod.outlook.com (2603:10b6:a03:20d::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4150.25; Thu, 20 May
 2021 21:23:57 +0000
Received: from BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::88be:f751:f493:25f9]) by BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::88be:f751:f493:25f9%6]) with mapi id 15.20.4129.034; Thu, 20 May 2021
 21:23:57 +0000
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To:     Alan Stern <stern@rowland.harvard.edu>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>
CC:     Mathias Nyman <mathias.nyman@intel.com>,
        Guido Kiener <Guido.Kiener@rohde-schwarz.com>,
        dave penkler <dpenkler@gmail.com>,
        USB list <linux-usb@vger.kernel.org>
Subject: Re: Recovering from transaction errors [was: Re: [syzbot] INFO: rcu
 detected stall in tx]
Thread-Topic: Recovering from transaction errors [was: Re: [syzbot] INFO: rcu
 detected stall in tx]
Thread-Index: AQHXTbvS7ox14Htpek+B5N8MnuAJ7qrs4WkA
Date:   Thu, 20 May 2021 21:23:57 +0000
Message-ID: <4f73f443-7509-e740-c6b9-884614dcfd4b@synopsys.com>
References: <d673611ca53f42a3a629eb051cabc6eb@rohde-schwarz.com>
 <20210519173545.GA1173157@rowland.harvard.edu>
 <12088413-2f7d-a1e5-5e8a-25876d85d18a@synopsys.com>
 <20210520020117.GA1186755@rowland.harvard.edu>
 <74b2133b-2f77-c86f-4c8b-1189332617d3@synopsys.com>
 <20210520210506.GA1218545@rowland.harvard.edu>
In-Reply-To: <20210520210506.GA1218545@rowland.harvard.edu>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
authentication-results: rowland.harvard.edu; dkim=none (message not signed)
 header.d=none;rowland.harvard.edu; dmarc=none action=none
 header.from=synopsys.com;
x-originating-ip: [73.15.163.8]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8d944551-1688-40a2-8763-08d91bd593c9
x-ms-traffictypediagnostic: BY5PR12MB4258:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BY5PR12MB425816F21E5E9C9097E5CA66AA2A9@BY5PR12MB4258.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 8zU1+BZ70e/A9ZM0nR/iuZvXfs8lk9ctirHz7H3sjjAamUiFhJWAEh4neGdmccO14cVBZdPRMJMg6tbHAv85JzL840GfAB6SUbknOIKnfgSFK19Zn6OkcbUEnhJYdNM5F++NNkRwj/38m6QweafBrQOjbOKuKio2M70ctiRImB1nhzbqEjcUyXVb7gQRfPK9WmvRHMHeWcwDlwoFhQAT2OAHdX7n2lPmFeGSiRbWtTgX5oAXp3AMdPK+knRuTS1EXn3XxkfsbtZODRRkOhAc8B9urlPiapEgsm7GEHCVZM81IICzWmQHB4RHybiqKcLa2b/yHlA1WfqK9pxDhWECutKmiX7E9i54xhMmah+fYckeW/YavCh2brTzMisGECLYdrwZbHS1LJ17+NMiaUQZHrp2uNgV3Y9oVVTNUzvBemiJhROtamLUD3tWkUOnm7U9oX5+FTloX7losFRVqGRD6k0M/Q1pQS7at1OinffcQL0Em1Qu2ChsEM0hs1CCg06aFdYBm/GlpB4mHdSAnVXxnMOPMeu0/pUxNT80NmeI8xwpbGqyuT/Wh3sRxacxY2S0+BqwgPv87lee5Wgwqu82x5PGO+6TujlIBiKc/Kul/zERq7tm1+RrihcvZIoGMdbko2lZ6mrQZWH3x39nQsLH3T5rlZMhoT4ZV8HOn6RJ1oA0T2L2Ty64QEWw0wu+M15D
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB4791.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(136003)(376002)(396003)(39850400004)(346002)(5660300002)(8936002)(2906002)(478600001)(54906003)(6486002)(4326008)(186003)(316002)(26005)(66446008)(66556008)(66946007)(76116006)(86362001)(64756008)(66476007)(2616005)(36756003)(38100700002)(6506007)(71200400001)(6512007)(31696002)(31686004)(8676002)(83380400001)(110136005)(122000001)(43740500002)(45980500001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: =?utf-8?B?R05Gd1hCN3ZYU2xIS0tKencvenFwY1Fyd0hlV1U4cUFnNEt6bkVOSjduc1VW?=
 =?utf-8?B?MllVUFZHRm9SaWppTXQxKys0V1M1OFNuWGY2R3JraUVtU2J3THI1a1JLM2NF?=
 =?utf-8?B?NTdlWUx5aDBqQVhCNXUxQ05jNFdjQ2hkMzMwbEcrYldkemY1NG1oV1RjTXJi?=
 =?utf-8?B?cHp5L0VvcGs1Y1hTZ3BveGE2MmdZY2xvL2N2SGtZRUR4ZEJwOEZlZGRWYWlD?=
 =?utf-8?B?OHE2TWtHRWZxVWFMMWdvVXhKTVFKd0c1eStvV0ZjUkh2MWV4bFJLalZtSTBX?=
 =?utf-8?B?R2FFNDdUZUIvNzZUUExMT2c2TUJFZFgxWC8wdmhZYzNDdHVCYzRwMElFcTdo?=
 =?utf-8?B?eXN6ZnV2ODVEcnVvcGhVSTNudmtnK3BPclNxSmNxRnk1Vm0yUXNBUjFzUlZP?=
 =?utf-8?B?bkdJN2VUZkV3R2phNzVFdjYwVm9ncjJRMEZmVTJmbTlObE9FKzlsREErZGtP?=
 =?utf-8?B?Z0dxS2JSeE1ESGZJZUNhZ2RKbW13RmhyR3NlUVR3NEZVcXk2K2VJZUlhYkpk?=
 =?utf-8?B?aElMRWkvb0hrbWxsSFdtcUdiSXQ2MkwzSGg0KzFGL1FPaHRJREMxWEJEdm96?=
 =?utf-8?B?OTcyVllwMDdhVWVoT2wvTzNQZ1p6bHdMdTlhZ3RGbVBQM0pJTzNuWEllTG1S?=
 =?utf-8?B?TWsvTUNGV29pZktwdXlJYldhdVNJMlE1d3l3Z0llSHhpVzJKbmVVaWp5c2F6?=
 =?utf-8?B?TlcwT1R2d1FGRDhjMy9taVJBK0V1VVlaVCszSGE4eENab0dKdXdhWTN6Q1pi?=
 =?utf-8?B?RzQvd0dYcTQvVmZFVGc0THU0NkhYUHdrWm9GazBLUFhqcXMyZ2NhYmFKUmJj?=
 =?utf-8?B?ZjVNVzV4NUwySTFldlNncUV2TThIdHF0clpXRFNzMk9adXlrVU1uUnRMRHJ5?=
 =?utf-8?B?VWt5MjhDVS9nRFo5cjJCRENVRlpUQlREbFZadmNudnQxRHZ5bTJ3d091ekpZ?=
 =?utf-8?B?N3BSbFBDVUNYNXJaTm4wUFRtV0tOb3ROTXNPTzRrR2FMa3BtN21DekJnWllN?=
 =?utf-8?B?bmpPUDd5clFxUGxhUjFjNlhzc1lTOFZBdEVxcGpjTHhRRWNKMEpLV05lYnN6?=
 =?utf-8?B?TXRjamRjVXQ4RVJNZlBOTG1CUkdDanBISmhQWkZ5ZVlLMlRjSEt2T2psamtj?=
 =?utf-8?B?RFpHL3JLMFErSC9BSlRTN1YvTno4cjBCTmNEOW9XeHlvaVBPWWx6SzIvaXpl?=
 =?utf-8?B?REdDU1NTbzBNRXhiNnlMWTVGQ1l0cW8wbS9aUSs1Z21SNDJSTnNFaVd6b0kv?=
 =?utf-8?B?R0NsL1VmWUhaazFsVXBIdVJHK3JiaXZoMmIvek5DU1Y1bFArYW5yRGVtR0tN?=
 =?utf-8?B?V0Z2cW5jUWY3RUkwWXUxQUFHTkZaVUROSTF2UjNpNlBMc2FBZU1zcE9Qbnkx?=
 =?utf-8?B?NTNIT3Z5VzhlcWtRaHhOREJ5WjdEUTF2bXArTmY3ampFSXhHRzBuL0JWMG9E?=
 =?utf-8?B?NGVhcEM3WGpsbjUvbytIYThaakdVWUtEdDZIendpeE9TcktwR04wc3JGU2dE?=
 =?utf-8?B?cnNxMmZGM2l6S0YvTWpTNitDVGdzaXF1TklnandLdkhQMTZtbnR5bVZFRnJ3?=
 =?utf-8?B?dzRHMVFLWUhqSGI0cmNjUnFiWUdGZ05lYjNIWjBadzJCNk5wZ3daSzVtd0g0?=
 =?utf-8?B?cTdkYkdEZWYvZWNqZWdwQXh1ck1GUFdoZkE2K3ZmU2ZEcnhMUGNEV2tvakhH?=
 =?utf-8?B?NGZaODlxZ3NZM0FyamRyeExnZ0taTWRIUUV6azExbkg2K1JMV0huQUZUbWg1?=
 =?utf-8?Q?SmPYaFbXOTTBoJCqmI=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <24C25BABC2505C419734D6F85215CCC4@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB4791.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d944551-1688-40a2-8763-08d91bd593c9
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 May 2021 21:23:57.0098
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: eFmkdevp8gosUruyvJNWLJU9BJrzljqqGhz8KQRoeCCxhfSFZTFKh4jY4Vr+Ub5CeuHrKiqkrdc1ewxwYIdnlw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4258
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

QWxhbiBTdGVybiB3cm90ZToNCj4gT24gVGh1LCBNYXkgMjAsIDIwMjEgYXQgMDg6MzA6MDFQTSAr
MDAwMCwgVGhpbmggTmd1eWVuIHdyb3RlOg0KPj4gSG0uLi4gbG9va3MgbGlrZSB3ZSBoYXZlIGEg
Y291cGxlIG9mIGlzc3VlcyBpbiB0aGUgdWFzIHN0b3JhZ2UgY2xhc3MNCj4+IGRyaXZlciBhbmQg
dGhlIHhoY2kgZHJpdmVyLg0KPj4NCj4+IFdlIG1heSBuZWVkIHRvIGZpeCB0aGF0IGluIHRoZSB1
YXMgc3RvcmFnZSBkcml2ZXIgYmVjYXVzZSBpdCBkb2Vzbid0DQo+PiBzZWVtIHRvIGhhbmRsZSBp
dC4gKGNoZWNrIHVhc19kYXRhX2NtcGx0KCkgaW4gdWFzLmMpLg0KPiANCj4gSG1tbS4gIEkgc2Vl
IHRoYXQgaWYgdGhlcmUgaXMgYW4gZXJyb3IsIHRoZSBkcml2ZXIgYXNzdW1lcyBubyBkYXRhIHdh
cyANCj4gdHJhbnNmZXJyZWQuICBJdCBzaG91bGRuJ3QgbWFrZSB0aGF0IGFzc3VtcHRpb247IGl0
IHNob3VsZCBhbHdheXMgdXNlIA0KPiB1cmItPmFjdHVhbF9sZW5ndGguDQo+IA0KPiBJdCBhbHNv
IGRvZXNuJ3QgaW5kaWNhdGUgdG8gdGhlIFNDU0kgbGF5ZXIgd2hlbiBhIGNvbW1hbmQgZ2V0cyBh
biBlcnJvciANCj4gYW5kIGl0IGRvZXNuJ3QgdHJ5IHRvIGRvIGFueSByZWNvdmVyeS4gIE9mIGNv
dXJzZSwgdGhlIFNDU0kgZXJyb3IgDQo+IGhhbmRsZXIgbWF5IGluaXRpYXRlIHNvbWUgcmVjb3Zl
cnkgYWN0aW9ucy4NCg0KUmlnaHQuDQoNCj4gDQo+PiBBcyBmb3IgdGhlIHhoY2kgZHJpdmVyLCB0
aGVyZSBtYXliZSBhIGNhc2Ugd2hlcmUgdGhlIHN0cmVhbSBVUkIgbmV2ZXINCj4+IGdldHMgdG8g
Y29tcGxldGUgYmVjYXVzZSB0aGUgdHJhbnNhY3Rpb24gZXJyX2NvdW50IGlzIG5vdCBwcm9wZXJs
eQ0KPj4gdXBkYXRlZC4gVGhlIGVycl9jb3VudCBmb3IgdHJhbnNhY3Rpb24gZXJyb3IgaXMgc3Rv
cmVkIGluIGVwX3JpbmcsIGJ1dA0KPj4gdGhlIHhoY2kgZHJpdmVyIG1heSBub3QgYmUgYWJsZSB0
byBsb29rdXAgdGhlIGNvcnJlY3QgZXBfcmluZyBiYXNlZCBvbg0KPj4gVFJCIGFkZHJlc3MgZm9y
IHN0cmVhbXMuIFRoZXJlIGFyZSBjYXNlcyBmb3Igc3RyZWFtcyB3aGVyZSB0aGUgZXZlbnQNCj4+
IFRSQnMgaGF2ZSB0aGVpciBUUkIgcG9pbnRlciBmaWVsZCBjbGVhcmVkIHRvICcwJyAoeGhjaSBz
cGVjIHNlY3Rpb24NCj4+IDQuMTIuMikuIElmIHRoZSB4aGNpIGRyaXZlciBkb2Vzbid0IHNlZSBl
cF9yaW5nIGZvciB0cmFuc2FjdGlvbiBlcnJvciwNCj4+IGl0IGF1dG9tYXRpY2FsbHkgZG9lcyBh
IHNvZnQtcmV0cnkuIFRoaXMgaXMgc2VlbiBmcm9tIG9uZSBvZiBvdXINCj4+IHRlc3RpbmdzIHRo
YXQgdGhlIGRyaXZlciB3YXMgcmVwZWF0ZWRseSBkb2luZyBzb2Z0LXJldHJ5IHVudGlsIHRoZSBj
bGFzcw0KPj4gZHJpdmVyIHRpbWVkIG91dC4NCj4+DQo+PiBIaSBNYXRoaWFzLCBtYXliZSB5b3Ug
aGF2ZSBzb21lIGNvbW1lbnQgb24gdGhpcz8gVGhhbmtzLg0KPj4NCj4+Pg0KPj4+IFRoZSBmYWN0
IGlzIHRoYXQgb25seSBhIHNtYWxsIHBlcmNlbnRhZ2Ugb2YgLUVQUk9UTyBlcnJvcnMgYXJlIA0K
Pj4+IHJlY292ZXJhYmxlLiAgU29tZSBvZiB0aGVtIGNhbiBiZSBoYW5kbGVkIGJ5IGEgcG9ydCBy
ZXNldCwgd2hpY2ggY2FuIGJlIA0KPj4+IHByZXR0eSBhd2t3YXJkIHRvIHBlcmZvcm0gYnV0IGRv
ZXMgb2NjYXNpb25hbGx5IHdvcmsuICBBIGxvdCBvZiB0aGVtIA0KPj4+IG9jY3VyIGJlY2F1c2Ug
dGhlIFVTQiBjYWJsZSBoYXMgYmVlbiB1bnBsdWdnZWQ7IG9idmlvdXNseSB0aGVyZSdzIG5vIHdh
eSANCj4+PiB0byByZWNvdmVyIGZyb20gdGhhdC4gIFdpdGggb25seSBhIGZldyBleGNlcHRpb25z
LCB0aGUgYmVzdCBhbmQgc2ltcGxlc3QgDQo+Pj4gYXBwcm9hY2ggaXMgbm90IHRvIHRyeSB0byBy
ZWNvdmVyIGF0IGFsbC4NCj4+DQo+PiBJZiB0aGUgY2FibGUgaXMgdW5wbHVnZ2VkLCB0aGVuIHdl
IHNob3VsZCBnZXQgYSBjb25uZWN0aW9uIGNoYW5nZSBldmVudA0KPj4gYW5kIHRoZSBkcml2ZXIg
Y2FuIGhhbmRsZSBpdCBwcm9wZXJseS4NCj4gDQo+IFllcyAtLSB1bmxlc3MgdGhlIGRyaXZlciBp
cyBpbiBzdWNoIGEgdGlnaHQgcmV0cnkgbG9vcCB0aGF0IHRoZSByZXN0IG9mIA0KPiB0aGUgc3lz
dGVtIG5ldmVyIGdldHMgYSBjaGFuY2UgdG8gcHJvY2VzcyB0aGUgY29ubmVjdGlvbiBjaGFuZ2Ug
ZXZlbnQuICANCj4gSSd2ZSBzZWVuIGJ1ZyByZXBvcnRzIHdoZXJlIHRoYXQgaGFwcGVuZWQuDQoN
Ckkgc2VlLiBJJ2xsIGtlZXAgdGhhdCBpbiBtaW5kLCBidXQgaXQgc291bmRzIGxpa2UgSFcgaXNz
dWU/IFRoZSBkcml2ZXINCmhhbmRsZXMgcmV0cnkgYmFzZSBvbiBldmVudHMgZ2VuZXJhdGVkIGZy
b20gdGhlIEhXIGFuZCB0aGUgSFcgc2hvdWxkDQpwcm9wZXJseSBnZW5lcmF0ZSBjb25uZWN0aW9u
IGV2ZW50IGFuZCBub3QgZ2V0IHN0dWNrIGluIHNvbWUgbG9vcC4NCg0KPiANCj4+IFllcywgaXQn
cyBwcm9iYWJseSBzaW1wbGVzdCB0byBkbyBhIHBvcnQgcmVzZXQgYW5kIGxldCB0aGUgdHJhbnNm
ZXIgYmUNCj4+IGluY29tcGxldGUvY29ycnVwdGVkLiBIb3dldmVyLCBJIHRoaW5rIHdlIHNob3Vs
ZCBnaXZlDQo+PiBDbGVhckZlYXR1cmUoZXBfaGFsdCkgc29tZSBtb3JlIHRob3VnaHRzIGFzIEkg
dGhpbmsgaXQgY2FuIGJlIGEgcmVjb3ZlcnkNCj4+IG1lY2hhbmlzbSBmb3Igc3RvcmFnZSBjbGFz
cyBkcml2ZXIsIGV2ZW4gdGhvdWdoIHRoYXQgaXQgbWF5IG5vdCBiZQ0KPj4gZm9vbHByb29mLg0K
PiANCj4gV2hlbiB5b3Ugc2F5IHN0b3JhZ2UgY2xhc3MgZHJpdmVyLCB3aGljaCBvbmUgYXJlIHlv
dSB0YWxraW5nIGFib3V0LA0KPiB1c2Itc3RvcmFnZSBvciB1YXM/ICB1c2Itc3RvcmFnZSBhbHJl
YWR5IGhhcyBhIHByZXR0eSByb2J1c3QgcmVjb3ZlcnkgDQo+IG1lY2hhbmlzbS4NCg0KSSBtZWFu
IGZvciBib3RoLg0KDQo+IA0KPj4+IEZvciB0aGUgY2FzZSBpbiBxdWVzdGlvbiAodGhlIHN5emJv
dCBidWcgcmVwb3J0IHRoYXQgc3RhcnRlZCB0aGlzIA0KPj4+IHRocmVhZCksIHRoZSBjbGFzcyBk
cml2ZXIgZG9lc24ndCB0cnkgdG8gcGVyZm9ybSBhbnkgcmVjb3ZlcnkuICBJdCBqdXN0IA0KPj4+
IHJlc3VibWl0cyB0aGUgVVJCLCBnZXR0aW5nIGludG8gYSB0aWdodCByZXRyeSBsb29wIHdoaWNo
IGNvbnN1bWVzIHRvbyANCj4+PiBtdWNoIENQVSB0aW1lLiAgU2ltcGx5IGdpdmluZyB1cCB3b3Vs
ZCBiZSBwcmVmZXJhYmxlLg0KPj4+DQo+Pj4gQWxhbiBTdGVybg0KPj4+DQo+Pg0KPj4gSSBzZWUu
IEJ5IGdpdmluZyB1cCwgeW91IG1lYW4gZG9pbmcgcG9ydCByZXNldCByaWdodD8gT3RoZXJ3aXNl
IGl0IG5lZWRzDQo+PiBzb21lIG90aGVyIG1lY2hhbmlzbSB0byBzeW5jaHJvbml6ZSB3aXRoIHRo
ZSBkZXZpY2Ugc2lkZS4NCj4gDQo+IE5vLCBJIG1lYW4gdGhlIGRyaXZlciBzaG91bGQganVzdCBz
dG9wIGNvbW11bmljYXRpbmcgd2l0aCB0aGUgZGV2aWNlLiAgDQo+IFRoYXQncyBhbiBhcHByb3By
aWF0ZSBhY3Rpb24gZm9yIGxvdHMgb2YgZHJpdmVycy4gIElmIHRoZSB1c2VyIHdhbnRzIHRvIA0K
PiByZS1zeW5jaHJvbml6ZSB3aXRoIHRoZSBkZXZpY2UsIGhlIGNhbiB1bnBsdWcgdGhlIFVTQiBj
YWJsZSBhbmQgcGx1ZyBpdCANCj4gYmFjayBpbiBhZ2Fpbi4NCj4gDQo+IEFsYW4gU3Rlcm4NCj4g
DQoNCk9rLiBXb3VsZCBpdCBiZSBtb3JlIGRpZmZpY3VsdCB0byBhdXRvbWF0ZSB0aGlzIGlmIGl0
IHJlcXVpcmVzIHVzZXINCmludGVydmVudGlvbj8gSSBhc3N1bWUgc3l6Ym90IGRvZXNuJ3Qgd2Fu
dCB0aGUgdXNlciB0byBkbyB0aGF0Lg0KDQpUaGFua3MsDQpUaGluaA0K
