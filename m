Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BF21C2EEDB1
	for <lists+linux-usb@lfdr.de>; Fri,  8 Jan 2021 08:07:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726650AbhAHHHe (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 8 Jan 2021 02:07:34 -0500
Received: from smtprelay-out1.synopsys.com ([149.117.87.133]:55782 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726312AbhAHHHe (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 8 Jan 2021 02:07:34 -0500
Received: from mailhost.synopsys.com (us03-mailhost1.synopsys.com [10.4.17.17])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 01A28C00E8;
        Fri,  8 Jan 2021 07:06:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1610089593; bh=JLQ8Dbrp3aruobnTlN7lwR1G2rNLc7KvI8TVYS50OIs=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=UsXad/bdJ4hGWDal1K6UPgl4lVJdY3Wgdy0ga1n5haeFDVQj/r1fpztd+OwqNhU9U
         iVA+r4xTili5Gut51x/6LeX+j3KnECC+bj6QNUixSFfoSS5F5/xukakiVRhVavi3Wo
         XdYM/pr0Pnmro7JdYIrb0pdt3FeJLSkiV6IP0KJyRYaowJOsplO49WLrEwTZ4KndH8
         3AdWClxgtXWpnqSmh3HFiv7dlrEkNABdkwHpyHljsp4ycRFCZtp3Dh2r6qnqakDYpJ
         jBuDMwkRc4qVWgaOopg7TONPEjlpv661dNLVrhKEqYYrHdV9J2SiP3TJ09+kWb6euW
         Pn6C5xLgq3H9A==
Received: from o365relay-in.synopsys.com (us03-o365relay1.synopsys.com [10.4.161.137])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPS id 3660CA0077;
        Fri,  8 Jan 2021 07:06:32 +0000 (UTC)
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (mail-sn1nam02lp2055.outbound.protection.outlook.com [104.47.36.55])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client CN "mail.protection.outlook.com", Issuer "GlobalSign Organization Validation CA - SHA256 - G3" (verified OK))
        by o365relay-in.synopsys.com (Postfix) with ESMTPS id 1477980218;
        Fri,  8 Jan 2021 07:06:30 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=joglekar@synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
        dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="w34vizwG";
        dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cyNQ/hVbbcYEKWL7U40mzh4EjxlIVoJnBnIM1kLojYd++yZmhgq147Pn5d5qVUJxpS4tiiknXUMbKdk6AjY40R4MdfrmuIbWw+vwOC7L8qHFHeblU67yJsih97wfEt2ZLqLw0760SqtmUttG/DKCpqaq1fmGJN24nNCY5rpAvwcLdRYm5/b2dhACCmUE809e9SENJl+SJ+PKgQLOWdhl5b4mWF3QOxm2Q+N+49CpO9CzoCYfzN924uYg5D3OD8EjEpnf39zK0pa8CUF1FDwpvVzS8t0r537tMYSq1IgawFE51Ve1Jsasvh4iUDwKLF1JZxYAW+ReRQMDsVCbhTCemA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JLQ8Dbrp3aruobnTlN7lwR1G2rNLc7KvI8TVYS50OIs=;
 b=jqvVKgAIgunDFHYBP20m4PVDBzBArt0+scij7xErR+2KlyJcYq8nKSgu4NK8DS504VB4u4Ndk0w2+svTMy3fMhVnAUo7SuDtW/Fb1vTRW0yv2sy8EStWnGhJ9zu6BuTDvLOYFb5iMlTz9T2eOwwcHptjkULl0K1/du9pSAe+caeeXlLePKOdsg2ADdnIY41V6Y2lWjU0byQtNrzERbpjjCroZsP8JoKDGyhadcVrcFD1Llu2Bp6xQwqLlU8XXrau5imkFFdLmM/19C40YY8q+ua8ualM9gZfnDUm2/Xqqm5YsLGNhqNmbql5qtYFyMf6phgR2gVtkaZnsmPznAqVSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JLQ8Dbrp3aruobnTlN7lwR1G2rNLc7KvI8TVYS50OIs=;
 b=w34vizwGOu0HZ+UAP+3gJn4/+gyEoY/PGHOXWdR3OuW5puKzMHeQ14mhRbG9kIZne17P9Nm+/vcDeaYyHcxZhSGi0wAR16uAWB0VLGRu/BKLJgg0PVIBbr/pIIWGxI47hbHnEp00X8teeKTDAN7s4mP8xPThRhy5GVAXikWo13U=
Received: from BY5PR12MB4887.namprd12.prod.outlook.com (2603:10b6:a03:1c6::15)
 by BYAPR12MB2984.namprd12.prod.outlook.com (2603:10b6:a03:da::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3721.21; Fri, 8 Jan
 2021 07:06:29 +0000
Received: from BY5PR12MB4887.namprd12.prod.outlook.com
 ([fe80::874:a242:5ddd:693d]) by BY5PR12MB4887.namprd12.prod.outlook.com
 ([fe80::874:a242:5ddd:693d%8]) with mapi id 15.20.3721.024; Fri, 8 Jan 2021
 07:06:29 +0000
X-SNPS-Relay: synopsys.com
From:   Tejas Joglekar <Tejas.Joglekar@synopsys.com>
To:     Mathias Nyman <mathias.nyman@linux.intel.com>,
        Tejas Joglekar <Tejas.Joglekar@synopsys.com>,
        Mathias Nyman <mathias.nyman@intel.com>
CC:     Felipe Balbi <balbi@kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        John Youn <John.Youn@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [RESEND PATCH v6 3/3] usb: dwc3: Pass quirk as platform data
Thread-Topic: [RESEND PATCH v6 3/3] usb: dwc3: Pass quirk as platform data
Thread-Index: AQHW4nMihtq4xUkYtkKMo4ANJ0ntZqoXNA8AgABnuoCAASoAAIAA21YAgAOzi4A=
Date:   Fri, 8 Jan 2021 07:06:28 +0000
Message-ID: <0429a33e-1490-c9b3-87dc-5237a78d269a@synopsys.com>
References: <cover.1606149078.git.joglekar@synopsys.com>
 <0b96cb765bb154cf0e83a436e7fed8882f566cf9.1606149078.git.joglekar@synopsys.com>
 <X/LQ5ZWLUCGzC8vz@kroah.com>
 <090742a1-a9a1-b89a-e078-a960b5ca3064@synopsys.com>
 <X/M3nxyjiIN/R4MC@kroah.com>
 <2b63edec-f32c-ba80-0be4-53e894272395@synopsys.com>
 <a9217abb-7923-6a9a-0fed-a81480336730@linux.intel.com>
In-Reply-To: <a9217abb-7923-6a9a-0fed-a81480336730@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linux.intel.com; dkim=none (message not signed)
 header.d=none;linux.intel.com; dmarc=none action=none
 header.from=synopsys.com;
x-originating-ip: [49.207.218.69]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 42e1e569-33a8-4c3a-51c9-08d8b3a3ebd7
x-ms-traffictypediagnostic: BYAPR12MB2984:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR12MB2984B71020B2A3253403DBC0A4AE0@BYAPR12MB2984.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: bDhbKjaX3ytC8JFlMBFlo8zAWCrlJHt8vBh5k3s4/RvWbmQuWOtQl4GMqsk1ms1X1jSAb+f6Tns07Arz3EXKbXXgjwBtDcky1AFEVUEsqcS1egrgIPlaxKi/ZDiNFPq7UBhfJaZMiD3H9ooz4OzNgn38HyWnojnR6vZUzEVUdegURZkx88jAWPBsXSt3WEONO+4zbeZkUEk8JZWi5pe6wo/IWAL86NfgV/YTLg/u9c3r7vDyxZLS7mOrRu5UJepG11KWDCOT7C+pZowZloyoOxrAo12LDJ3Pklcws7q5ffbW2vXwfVq39PFW41awnsVUfS0NfnYr2AwXu85dGtTAs8bJT07hBEb7C1H1xtY3yp9eDMgxfBDLtPfoJiBV7VyMJU91b49A3/1JVIvbEmEFViHYOH46i6SLFuqHDgPloIhQuC4sgJbq/dHB6o3SUyIAIJ3O7PMIhpZROfroj5MjvO/JvwITJ00Gm4isvPe+olvktAtHQrH1qfk1YF74sV9b4tAUspcmWAxQkX03rDIKLA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR12MB4887.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(39860400002)(366004)(376002)(136003)(396003)(346002)(31686004)(5660300002)(478600001)(6506007)(55236004)(4326008)(53546011)(8936002)(71200400001)(6512007)(2906002)(8676002)(316002)(2616005)(6486002)(186003)(31696002)(110136005)(86362001)(54906003)(66946007)(66476007)(66446008)(64756008)(76116006)(66556008)(91956017)(36756003)(26005)(45980500001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: =?utf-8?B?K0oyOWFiRnRxWWlpd1RobUhJVFl3eXJqSGhwa1hvRE1qRGlONWZSbFdFcUY5?=
 =?utf-8?B?NHQ5M3F2KzNqd2RWTVJodWt2REpzUjRKdzY2Qkk0QVBtMS8yYUJzSVVMQmNT?=
 =?utf-8?B?U1F1d1JVaTlGTDdST1prS0Zmcll0Q2dZaEdlVEJ2amVjekdPcjJKdzFMKzlO?=
 =?utf-8?B?ajk0dm5mZ2pQR21EeENDOXBHcWtDUGxvelBCbEl4ODkyMHJHazdpNFpJNHB6?=
 =?utf-8?B?SmZwNzRpbWdlWGFydUZyRTJMZnp2TDdqdnlQcnl2dktoL0hLcFcvclg0ZXRK?=
 =?utf-8?B?R1JXRTZaQWxHYjNMTlI2ZUlRd0FGOHM1V2dIa2h3MzJSUU03WkNiTEZxK1RX?=
 =?utf-8?B?ZjFLQUxxR3ZKaURPSVMra3RDbzR2bHZKZnY0czlmdWd2cEV3ZGJCMk42YWQ1?=
 =?utf-8?B?M2JmRUlVS0pDVUs0OTZUS2VoWVIzbmtsRTlyL0hTU0lueTZmVHN4eEZxYUFF?=
 =?utf-8?B?bEkwc1hLY3lTK29HZXBOOVROVTUwZ1p0Q1JHMVExZmd1aDlhazFmYm4zZGEz?=
 =?utf-8?B?VFFnRWxvZU9vMVpLblFDN3p1aDB4WWtUK2NxZ2M4UFM3RzkrU1RqcmJGcTds?=
 =?utf-8?B?YndRVkZnVnBhTktMWllDOWdXTFF2dXhzM0dBc2Jsdkc2NmUwdHczYTNPR2g1?=
 =?utf-8?B?bks4SVhYNnpKdXRSZ0ZhemVaUmIyMHpueC95MGdlRThtN3NubC91MG5yemFl?=
 =?utf-8?B?SVFPVUdKSitIOThEd2VnTmVPSEhKYlBJWkhMQ3o4dXRyOVNhcUtwc1dxbjJS?=
 =?utf-8?B?azlycWJ1aWg1Um9iMkN4TXUrQXEzSkEyVUFLVWpMVXBBeml3TWtNdjl6TDFZ?=
 =?utf-8?B?aFVJa2xaNTFiandjQlRyN1Q5MFpxa1JDVUtkZ09hUlF3UkpOR1RQWlZRVjJ4?=
 =?utf-8?B?dXA0WnF6ZzYxRXdTWlcvcU9Sdy9JYndtS0Npa0trclFpZ1dJVjY0NWRLUHZY?=
 =?utf-8?B?U3ZzazhQdzQ1QmVMaG83VzFvbUg5Sld3dEtDMWFPaXhqNWx3dEFUV3AwM3p0?=
 =?utf-8?B?cGxGcVRSUTlkRnJHcGFxTGMxZzhVRnBhb2poY2lyRjBEVU5kbnNpK0ZUSHp1?=
 =?utf-8?B?TlBvV29XcFFKcTJnVWpMN2VtcW0xTU1hK0FHV1FwOFZWa3E5SkNFMGJ0ZG9G?=
 =?utf-8?B?L0grcjlqbWNtT3k1SzVoaFBjTUFEMFV0L3hRWEFOWXpCTGxnb3UraXEvRUd2?=
 =?utf-8?B?c3RqQllNSmdidis1dlVXZEpqMjlKNU1GMGRCcjlYNjlOSXF0MTFTL0ljWHVN?=
 =?utf-8?B?RHdJTEVSTkJudXZjY2FNUzFHb05BbFNwLzVrNDhmOHorNnpQNWVES1loeFVO?=
 =?utf-8?Q?gHtutbd3CKEnQ=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <44509FCE7982A849B90432944748FFEC@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR12MB4887.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 42e1e569-33a8-4c3a-51c9-08d8b3a3ebd7
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jan 2021 07:06:28.9030
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NjXHPsJJ1ZHo97W9S3aeGuh03UrxGXD+t/z7GWa878U6wzTe2YlWXxKCnSNAaR3wZv4Y31SQ85GmGPGl+bwA7g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB2984
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

SGVsbG8gTWF0aGlhcywNCk9uIDEvNi8yMDIxIDQ6MDUgQU0sIE1hdGhpYXMgTnltYW4gd3JvdGU6
DQo+IE9uIDUuMS4yMDIxIDExLjMwLCBUZWphcyBKb2dsZWthciB3cm90ZToNCj4+IEhpIE1hdGhp
YXMsDQo+PiBPbiAxLzQvMjAyMSA5OjEzIFBNLCBHcmVnIEtyb2FoLUhhcnRtYW4gd3JvdGU6DQo+
Pj4gT24gTW9uLCBKYW4gMDQsIDIwMjEgYXQgMDk6MzI6MTNBTSArMDAwMCwgVGVqYXMgSm9nbGVr
YXIgd3JvdGU6DQo+Pj4+IEhpIEdyZWcsDQo+Pj4+IE9uIDEvNC8yMDIxIDE6NTUgUE0sIEdyZWcg
S3JvYWgtSGFydG1hbiB3cm90ZToNCj4+Pj4+IE9uIE1vbiwgSmFuIDA0LCAyMDIxIGF0IDAxOjM4
OjQzUE0gKzA1MzAsIFRlamFzIEpvZ2xla2FyIHdyb3RlOg0KPj4+Pj4+IFRoaXMgY29tbWl0IGFk
ZHMgdGhlIHBsYXRmb3JtIGRldmljZSBkYXRhIHRvIHNldHVwDQo+Pj4+Pj4gdGhlIFhIQ0lfU0df
VFJCX0NBQ0hFX1NJWkVfUVVJUksgcXVpcmsuIERXQzMgaG9zdHMNCj4+Pj4+PiB3aGljaCBhcmUg
UENJIGRldmljZXMgZG9lcyBub3QgdXNlIE9GIHRvIGNyZWF0ZSBwbGF0Zm9ybSBkZXZpY2UNCj4+
Pj4+PiBidXQgY3JlYXRlIHhoY2ktcGxhdCBwbGF0Zm9ybSBkZXZpY2UgYXQgcnVudGltZS4gU28N
Cj4+Pj4+PiB0aGlzIHBhdGNoIGFsbG93cyBwYXJlbnQgZGV2aWNlIHRvIHN1cHBseSB0aGUgcXVp
cmsNCj4+Pj4+PiB0aHJvdWdoIHBsYXRmb3JtIGRhdGEuDQo+Pj4+Pj4NCj4+Pj4+PiBTaWduZWQt
b2ZmLWJ5OiBUZWphcyBKb2dsZWthciA8am9nbGVrYXJAc3lub3BzeXMuY29tPg0KPj4+Pj4+IC0t
LQ0KPj4+Pj4+ICBkcml2ZXJzL3VzYi9kd2MzL2hvc3QuYyB8IDEwICsrKysrKysrKysNCj4+Pj4+
PiAgMSBmaWxlIGNoYW5nZWQsIDEwIGluc2VydGlvbnMoKykNCj4+Pj4+IFdoYXQgY2hhbmdlZCBm
cm9tIHByZXZpb3VzIHZlcnNpb25zPw0KPj4+PiBSZXNlbnQgdGhlIHBhdGNoIGFzIGl0IHdhcyBt
aXNzZWQgZm9yIHJldmlldyBieSBGZWxpcGUgYW5kIEkgc2F3IHlvdXIgbWFpbA0KPj4+Pg0KPj4+
PiB0byByZXNlbmQgdGhlIHBhdGNoIGlmIG5vdCByZXZpZXdlZC4gT3RoZXIgdHdvIHBhdGNoZXMg
ZnJvbSBzZXJpZXMgYXJlDQo+Pj4+DQo+Pj4+IHBpY2tlZCB1cCBieSBNYXRoaWFzLCB0aGlzIG9u
ZSBpcyByZW1haW5pbmcgZm9yIHJldmlldy4NCj4+PiBBaCwgaG93IHdhcyBJIHN1cHBvc2VkIHRv
IGd1ZXNzIHRoYXQ/ICA6KQ0KPj4+DQo+Pj4+Pj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvdXNiL2R3
YzMvaG9zdC5jIGIvZHJpdmVycy91c2IvZHdjMy9ob3N0LmMNCj4+Pj4+PiBpbmRleCBlMTk1MTc2
NTgwZGUuLjA0MzRiYzhjZWMxMiAxMDA2NDQNCj4+Pj4+PiAtLS0gYS9kcml2ZXJzL3VzYi9kd2Mz
L2hvc3QuYw0KPj4+Pj4+ICsrKyBiL2RyaXZlcnMvdXNiL2R3YzMvaG9zdC5jDQo+Pj4+Pj4gQEAg
LTExLDYgKzExLDExIEBADQo+Pj4+Pj4gICNpbmNsdWRlIDxsaW51eC9wbGF0Zm9ybV9kZXZpY2Uu
aD4NCj4+Pj4+PiAgDQo+Pj4+Pj4gICNpbmNsdWRlICJjb3JlLmgiDQo+Pj4+Pj4gKyNpbmNsdWRl
ICIuLi9ob3N0L3hoY2ktcGxhdC5oIg0KPj4+Pj4gVGhhdCBmZWVscyByZWFsbHkgd3JvbmcuICBB
cmUgeW91IHN1cmUgYWJvdXQgdGhhdD8NCj4+Pj4gVG8gdXNlIHRoZSBzdHJ1Y3QgeGhjaV9wbGF0
X3ByaXYgdGhpcyB3YXMgaW5jbHVkZWQsIGNhbiB5b3Ugc3VnZ2VzdCBhbHRlcm5hdGl2ZT8NCj4+
PiBJZiB0aGF0IGlzIHRoZSAibm9ybWFsIiB3YXkgdG8gZG8gdGhpcyB3aXRoIHRoZSB4aGNpIGRy
aXZlciwgb2ssIGJ1dCBJDQo+Pj4gd291bGQgbGlrZSB0byBnZXQgYW4gYWNrIGZyb20gTWF0aGlh
cyBmb3IgdGhpcyBiZWZvcmUgdGFraW5nIGl0Lg0KPj4+DQo+PiBDYW4geW91IHBsZWFzZSByZXZp
ZXcgdGhpcyBwYXRjaCB3aGljaCBpcyBpbmNsdWRpbmcgdGhlIHhoY2ktcGxhdCBoZWFkZXI/wqAg
TGV0IG1lDQo+Pg0KPj4ga25vdyBpZiBhbnl0aGluZyBzaG91bGQgYmUgbW9kaWZpZWQuIEFjayBp
ZiB0aGlzIHBhdGNoIGxvb2tzIG9rIHNvIEdyZWcgY2FuDQo+Pg0KPj4gdGFrZSBpdC4NCj4+DQo+
IFRoaXMgZG9lc24ndCBsb29rIHJpZ2h0LiANCj4NCj4gZHdjMyBzaG91bGRuJ3QgbmVlZCB0byBr
bm93IGFib3V0IHhoY2kgcGxhdGZvcm0gcHJpdmF0ZSBzdHJ1Y3R1cmVzLA0KPiBiZXNpZGVzLCB0
aGlzIHBhdGNoIG5vdyBhZGRzIHRoZSBxdWlyayB0byBhbGwgeGhjaSBwbGF0Zm9ybSBkZXZpY2Vz
IGNyZWF0ZWQgYnkgZHdjMy4NCg0KQXMgcGVyIHVuZGVyc3RhbmRpbmcgdGhlIFRSQiBjYWNoZSBp
cyBwcmVzZW50IGFuZCB1c2VkIGluIGFsbCBkd2MzIGNvbnRyb2xsZXJzLCBzbyB3ZSB3b3VsZA0K
DQpuZWVkIHRoZSBxdWlyayBmb3IgYWxsLg0KDQo+IEkgaGF2ZW4ndCB0b3VjaGVkIGR3YzMgYXQg
YWxsLCBidXQgSSdkIGd1ZXNzIHlvdSBwcm9iYWJseSBuZWVkIHRvIGFkZCBhIG5ldyBlbnRyeSB0
bw0KPiB0aGUgZHdjM19wY2lfaWRfdGFibGVbXSBpbiBkd2MzLXBjaS5jLCBhZGQgYSBkZXZpY2Ug
cHJvcGVydHksIGFuZCB0aGVuIGxvb2sgZm9yIHRoYXQNCj4gcHJvcGVydHkgaW4geGhjaS1wbGF0
LmMsIGFuZCBzZXQgdGhlIHF1aXJrLiANCg0KVGhlIGZpcnN0IGFwcHJvYWNoIHdhcyB0aGUgc2Ft
ZSBhcyB5b3UgbWVudGlvbmVkIHdoZXJlIEkgYWRkZWQgZGV2aWNlIHByb3BlcnR5IHdpdGgNCg0K
ZHQtYmluZGluZyBmb3IgZW5hYmxpbmcgdGhlIHF1aXJrLCBidXQgUm9iIHdhcyBub3QgT0sgdG8g
YWRkIG5ldyBiaW5kaW5ncyBmb3IgZWFjaCBuZXcNCg0KcXVpcmsuDQoNCldpdGggUENJIGRldmlj
ZXMgY29tcGF0aWJsZSBzdHJpbmcgd291bGQgbm90IHdvcmsgYW5kIGR0IGJpbmRpbmdzIHNvbHV0
aW9uIHdhcyBub3QNCg0KZ2l2ZW4gY2xlYXJhbmNlLCBJIHJlZmVycmVkIG90aGVyIGFwcHJvYWNo
IHRha2VuIGJ5IFBldGVyIGluIGNvbW1pdCBlZDIyNzY0ODQ3ZTgxMDBmMGFmOWFmOTFjY2ZhNThl
NWM1NTliZDQ3LA0KDQooaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5l
bC9naXQvdG9ydmFsZHMvbGludXguZ2l0L2NvbW1pdC8/aWQ9ZWQyMjc2NDg0N2U4MTAwZjBhZjlh
ZjkxY2NmYTU4ZTVjNTU5YmQ0NykNCg0Kd2hlcmUgaGUgdXNlZCB4aGNpIHBsYXRmb3JtIGRhdGEg
dG8gcGFzcyB0aGUgcXVpcmsuIEkgZm9sbG93ZWQgdGhlIHNhbWUgYXBwcm9hY2ggYW5kIGFkZGVk
IHRoZSBxdWlyay4NCg0KSSB0aGluayBhbm90aGVyIHdheSBtaWdodCBiZSB0byBtYWtlIHRoZSB4
aGNpIHBsYXRmb3JtIGRhdGEgc3RydWN0dXJlLCBwdWJsaWMgc28gZHdjMyBjYW4gdXNlIGl0ID8N
Cg0KDQo+IC1NYXRoaWFzDQoNClRoYW5rcyAmIFJlZ2FyZHMsDQoNCsKgIFRlamFzIEpvZ2xla2Fy
DQoNCg==
