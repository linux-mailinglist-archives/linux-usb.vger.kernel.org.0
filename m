Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8806E36E2D0
	for <lists+linux-usb@lfdr.de>; Thu, 29 Apr 2021 03:00:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231966AbhD2BB3 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 28 Apr 2021 21:01:29 -0400
Received: from smtprelay-out1.synopsys.com ([149.117.73.133]:49728 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229888AbhD2BB2 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 28 Apr 2021 21:01:28 -0400
Received: from mailhost.synopsys.com (badc-mailhost4.synopsys.com [10.192.0.82])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 30E914023B;
        Thu, 29 Apr 2021 01:00:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1619658042; bh=I7KzV5JgiD3TyVty5K9h9gReO9OQOon85B+gKFhdGfk=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=JdPuxdlv9YU62qJHTppeZVYodzhSGqFBCxNxWnRx4V5RdfYm1JWlDaqa0gP8FIiIC
         dPUolUiShCIrFy6VDYxULcwulNiRNLF3OOoNcZHmL+uBL8EaEnwe8YoQJnsy2PO+rO
         r4TEiCft7gbM3bIw8hwPUxoQg894/0yGLLxFgA2xJLam6h0+AaMTaXLAjnQJgNUf2T
         sAF4Nwm/BIFjeIIj4VT9h07hMxYwHbPwQ3kZg8hQk6VBXz2lPYqMAFkdeTdWKA8KK8
         r4MlJIuC+dg2KDJCwd1D2/5b5jGZICIAXYnYqGoeCT6IXANBUpHHBG/FEHPxbg/on2
         uOGCCRouD8F9w==
Received: from o365relay-in.synopsys.com (sv2-o365relay3.synopsys.com [10.202.1.139])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPS id 5AE29A006E;
        Thu, 29 Apr 2021 01:00:41 +0000 (UTC)
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11lp2168.outbound.protection.outlook.com [104.47.56.168])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
        by o365relay-in.synopsys.com (Postfix) with ESMTPS id 8518240143;
        Thu, 29 Apr 2021 01:00:39 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=thinhn@synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
        dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="fLrumBiN";
        dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a4fFdYtRcQJ5EM0xV+HygQS9CBl7/ZUN1U1jWFETtUArFx4hLlprgXJguJuTSXxNdALZ+RkVJMox1rqfAvnGNQwAbTsgwVG96N/+q0/TLp5jHd7wVcavO+ALR/f754me1ahffHAbIrR77/2gooLgDwA9XKMZRlw1H3U2T1lGvGKovi9Jxi5sib9c4cJyniyQxJnMSU4LjURge+3r9P89hb6TsFnBhkg1xwhmQ0cut1vjT5kpDSnr+9AEq4a/smmEaBRWMA5iCvmWAnIM9yUUr41aFLWFtyUHSK59viUuEi4WDBRrqKus7kSI87JxdpJHx9xl31/sCk0fJPiHWOafhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I7KzV5JgiD3TyVty5K9h9gReO9OQOon85B+gKFhdGfk=;
 b=cTVaj2lD6BrC374DJlBB7tOy4MYWHEvOT+mbGAMED6zAzQKeWY85wq58G+JTP0cAdCyxyvwX5X8O5Fsyd4Zu9uATuWuantADsVoNWcm/s+dUNzhRrh160ESXUU8Qi/8C9dxuNOBwRx1P6A5U20438gbGyUKwiUgbBfW6YRchc3x6LpnNlcpU2lQGAUpO1UWEVEpJoJJu+nr4LuuN1YSE4j3kql10jIZsDjL0v71GU+1o65+lC6kRjCp/NE+3j4SZaCOAE2mxD6scka0QOIAEk+xPySa/qu6qqgf81oKG+QJV/Lh1tPeLgf3qbqtLwVbEDVfkGAMiuNg8E3PxF7SR6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I7KzV5JgiD3TyVty5K9h9gReO9OQOon85B+gKFhdGfk=;
 b=fLrumBiNjQBYhpB/1NBrt2CV2UCPIlmEdhEqDjJq9S64OGF7LENWMiLgWy2D9U8QrsnItkm4ndxjBss+OMiXCnnPCSUsAFN2Z1RWcasVssSq9Sjy/9HCabMtIZneglSMNtLmhth5NBzLOeiIENKjCSe3n5zNKW0FIEvAGZJ2GOU=
Received: from BYAPR12MB4791.namprd12.prod.outlook.com (2603:10b6:a03:10a::12)
 by BYAPR12MB3157.namprd12.prod.outlook.com (2603:10b6:a03:130::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.24; Thu, 29 Apr
 2021 01:00:37 +0000
Received: from BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::7c97:6a33:14c4:dd8c]) by BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::7c97:6a33:14c4:dd8c%6]) with mapi id 15.20.4087.025; Thu, 29 Apr 2021
 01:00:37 +0000
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To:     Mathias Nyman <mathias.nyman@linux.intel.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Mathias Nyman <mathias.nyman@intel.com>
CC:     John Youn <John.Youn@synopsys.com>
Subject: Re: [PATCH v2 6/7] usb: xhci: Workaround lost disconnect port status
Thread-Topic: [PATCH v2 6/7] usb: xhci: Workaround lost disconnect port status
Thread-Index: AQHXLaMSN2LIOsGcCE6PiqGFK0YrGqrKDwmAgAC70oA=
Date:   Thu, 29 Apr 2021 01:00:37 +0000
Message-ID: <8bcce1fc-70ba-91d6-5671-eaa9dec255e6@synopsys.com>
References: <cover.1618014279.git.Thinh.Nguyen@synopsys.com>
 <a90cfd8e3008c3664a916a12dc3c0a79a520c0ab.1618014279.git.Thinh.Nguyen@synopsys.com>
 <37b09a1a-d2f7-c152-0850-20215822ff1d@linux.intel.com>
In-Reply-To: <37b09a1a-d2f7-c152-0850-20215822ff1d@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
authentication-results: linux.intel.com; dkim=none (message not signed)
 header.d=none;linux.intel.com; dmarc=none action=none
 header.from=synopsys.com;
x-originating-ip: [98.248.94.126]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 536f1870-5847-4799-03a2-08d90aaa33ae
x-ms-traffictypediagnostic: BYAPR12MB3157:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR12MB315776DB3B7D6CE0EADC184AAA5F9@BYAPR12MB3157.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: RZBERcVPyZbIgVVTTGpgSZM+0u9LWW5NP4Hg8efjw2UluMQZR0j6ckth+uXzzDLZIzcka2IC5P01vgeysPPHvc4phxEyhZ+NDbH7Z7/SlLEEQ9Z4bByePr89hG6mA+r9rbLeUWRE+wm9OdSUTYxoLC3+Owm3bKlxUXz/40LfchEXnvTAC4FQPp4+k5E2YOdyjUBKgG4btV1rLn9SmQPTMq+30Bngcn6VnN9fUDTKgEbs/PLfFWlwRnevb06rWiLZlB5MoOydylEtHoIwJ9DTrWSmFaBF9qnVeGHBAwzZHthkS5IAjv6gNZjRnS7rzY5LJsOiwSlGvKsZquFcwAuq+pLqbU8YrzYSkBmRQEFZPi5Nk8GhfMuLtlBuTgOeuFM6yBGIHtNpmHl9UbUQvcG9vO+Viyvl2YKTLlK3wobpv10dIjjC1so1BUkbOhQ7kb3QcFTgWsW/rLpKK1gQZk0lFYAm9i677c9q6qcHyT5TOBE2hdpqJMQMajYOMvNCVrh6xC/8O/YPnqcvf0SoTJcd2pc6BY5SyuPXpej+ybkfOCLwtiN7F/Qg1zWv8iEarAk0xLwR97vIHoJjfn4UQp+9CHUDKHuj6EMT9yTh48v2kUYRG+1qozqQrswFycdl9dpNTE/2cV5XpoSUs2Io11eEIrBRXFOb5+eHDkP9ZHBYgnRRyy6O1qxEw9d5b8Jq/s8R
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB4791.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(136003)(366004)(396003)(39850400004)(346002)(376002)(66446008)(86362001)(4326008)(122000001)(186003)(83380400001)(64756008)(2906002)(8936002)(107886003)(26005)(66556008)(6506007)(31696002)(76116006)(6486002)(66946007)(2616005)(66476007)(478600001)(8676002)(31686004)(38100700002)(6512007)(36756003)(5660300002)(71200400001)(110136005)(316002)(43740500002)(45980500001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: =?utf-8?B?c3VPNlJhVTJ3d3l5RHpTN1Ftam9xZU5GWlRERktBTk13OXg5WWFUMkZ5Qm44?=
 =?utf-8?B?b2VCU3RTdk9VZlY1TWFqbGZnUzNHdmUreG0vWWNpYzdWakJlY1hmY1RJYWJX?=
 =?utf-8?B?djhhdnZ5QXQxOVhaTU1JMlUwTjYrQnVaZ3orakpzTFF0YkFuR2NyV0E0eWNj?=
 =?utf-8?B?b25SRU4rbXc0emx6dVoyTmNUVVVQZTRydG4zSWY0WE5UZUJCQ3pqNytHSHpV?=
 =?utf-8?B?S0FwVFhWbDJEdm1VVGFnOVV5Myt0ZVA1MTFsbTcxN244dlNrS3BOTkVNMDJN?=
 =?utf-8?B?UmRreFgzM2IrQXROZXJDQ1Mxbzl6c0hQa2lCOTFFVlBuQjByWDVFMVY0bkpk?=
 =?utf-8?B?V25JcVJEc0tsOTlsV0RGR2VacVByNDJtWTJYQzNuWThMbVByaXFUdDFXcFRa?=
 =?utf-8?B?ZW9tMVFEQ1ZheHVJQ1g1T2lkdGJwWnAzQ1pIVWhSa2pQYnBQMUU3RDJDcEdu?=
 =?utf-8?B?TE9QY3B4V3FLSWIzZCtNVFYrdHJEN2xJOVdDeVkxU29TY2I4bEcydmFSMnZG?=
 =?utf-8?B?VFlFQkFhNHY3emhvSzdaVXVOTEhNL01TdW1IbVVXaExCQVQxT1c1S2I1aFFS?=
 =?utf-8?B?SUM5eUp3SG9LYmxWQytNdTFlVjBGcGN0elQ4T2FkQWNXbTRzcmd0V1dUNEg5?=
 =?utf-8?B?L1oyQ0ZVQWRCVDZlaFNWRW9TOUlOSkFpMW9tQUxpYjVUTjQ2cFVyZzQrcHZF?=
 =?utf-8?B?SEVFNnI3cXZUajFmZklZM2FmT3VaNE1lM3ZHTnhFcEVSMGdBMmtuMTFTUVBU?=
 =?utf-8?B?SWYreGFoejhjU2svTG9CSGFzNjBwbW1NYkdLdmFvVzdSSEI2cFNMUlNyd1pX?=
 =?utf-8?B?OWtkN3RVVGtFcmcxUUZsblN3dDRuMHZIVnF3dFg5dTkrRXM4WnRDaXNSYjZG?=
 =?utf-8?B?WWIyNnpseU5MT1hkMkJjZXFKRFdVcWdRTGV3Qnd2VU9CdHREbExFKzBkZ0RD?=
 =?utf-8?B?UEtHRkladi84NkhTQUpXZ2t6MzlmNkF2WXJSK3pDcUxsN05Obm9ONW42ZWpH?=
 =?utf-8?B?NFRVT1g4eHh0VzF4K1B5N1BNSlVJd1gvSUF1VVZBZm92dHYrM211SmVDY2N0?=
 =?utf-8?B?TktpeDNkVWxmeWtPU2NKanhubzJ0a1NzSTlSNU84d1dqTzJLc0pTQ2srQ2Y4?=
 =?utf-8?B?ZmhMOS9jcHpxakw5L1BsQXVFeGlrbGNaZllzWHg3SGMrQjQ5SkhFM0REeWNG?=
 =?utf-8?B?YmlXSGplSzM5QW1OS0ticGREZEJlQS9DRXhNeEMrUEM1SVJkNXF3QXQwSlIz?=
 =?utf-8?B?Zk50enI5VU54Zk0zRmVXV0FUMmx5ZGl2MW1PMjZYT2RVN0lXWFMzaEY0UkRW?=
 =?utf-8?B?Z3V4NHFSV05sNUI4M0V3OEFxb0NkcUdUbXdSSS9JMVVxdERWRkQyQzVuNkwz?=
 =?utf-8?B?cWhWa3prZXR4VjViNjlhS1ZGa2hFWldYRXo5cnVCRVlpekFnZVMwRkRwdm0v?=
 =?utf-8?B?dDVUS0czR0NuaHRLcDVCcHN5SVFmZmV0akJBenJlb1h3Z2xvc1Qza2k3MnVj?=
 =?utf-8?B?YWVzREpmVkNDczg2UGs0WFR4dlJHUElTZzNPZVpZb2RzNGErcVVxTXlnR014?=
 =?utf-8?B?Z2EvMDNnUTJNL2o2aUhMOWsvRUVQSW9Td3MwR0Y1bDB4QmVoRlVTUVdxeldI?=
 =?utf-8?B?cHZBUXRvMURXM1YzOU1HUWQ4SmhaMmxVMnI3bGZGRmpObm5BQ201dFEzZjlE?=
 =?utf-8?B?aWoyVHRKdFNsQklMRnZvN1pOYlMvV3pQMkU1b1JoV3pmTlNZbjREbEE0QzN3?=
 =?utf-8?Q?r5SNElOK/bKaCCCXBe6DGuW4/XE/SrT0IIcwqSv?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <B49718E0F9EFAC449A6385C6AC87B8D2@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB4791.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 536f1870-5847-4799-03a2-08d90aaa33ae
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Apr 2021 01:00:37.5107
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wbDOxTRTKDCtmyuZ7J29FUZ+H0t3EP8WTVx4WtwMClaJNSQcyM3hW5q8pa/nMK4MuxVhVNZDpVhXTZQOzCCTNg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3157
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

TWF0aGlhcyBOeW1hbiB3cm90ZToNCj4gT24gMTAuNC4yMDIxIDMuNDcsIFRoaW5oIE5ndXllbiB3
cm90ZToNCj4+IElmIGFuIGVTUyBkZXZpY2Ugd2l0aCBhY3RpdmUgcGVyaW9kaWMgdHJhbnNmZXJz
IGlzIGRpc2Nvbm5lY3RlZCBmcm9tIHRoZQ0KPj4gRFdDX3VzYjMxICh2MS45MGEgYW5kIHByaW9y
KSBob3N0IGNvbnRyb2xsZXIgYXQgcm9vdCBwb3J0LCB0aGUgaG9zdA0KPj4gY29udHJvbGxlciBt
YXkgbm90IGRldGVjdCBhIGRpc2Nvbm5lY3Rpb24uIEJ5IGFjdGl2ZSB0cmFuc2ZlcnMsIGl0DQo+
PiBtZWFucyB0aGF0IHRoZSBlbmRwb2ludCBpcyBub3QgaW4gZmxvdyBjb250cm9sLCBhbmQgdGhl
cmUgYXJlIGFjdGl2ZQ0KPj4gVHJhbnNmZXIgRGVzY3JpcHRvcnMgYXZhaWxhYmxlIGZvciB0aGUg
aG9zdCB0byBpbml0aWF0ZSB0cmFuc2ZlcnMgdG8gdGhlDQo+PiBlbmRwb2ludC4gVGhpcyBpc3N1
ZSBjYW4gb2NjdXIgaWYgdGhlIGVuZHBvaW50IHBlcmlvZGljIGludGVydmFsIGlzIGluDQo+PiAy
bXMsIDRtcywgb3IgOG1zLg0KPj4NCj4+IEluIGFkZGl0aW9uLCB0aGUgaG9zdCBjb250cm9sbGVy
IHdpbGwgbm90IGJlIGFibGUgdG8gZGV0ZWN0IGEgbmV3IGRldmljZQ0KPj4gY29ubmVjdGlvbiB3
aGlsZSB0aGUgZGlzY29ubmVjdGlvbiBpcyBub3QgcHJvY2Vzc2VkLiBUaGUgY29udHJvbGxlciB3
aWxsDQo+PiBzZXQgdGhlIGxpbmsgc3RhdGUgb2YgdGhlIGFmZmVjdGVkIHBvcnQgdG8gZVNTX0lO
QUNUSVZFLg0KPj4NCj4+IFRvIHdvcmthcm91bmQgdGhpcywgaGF2ZSB0aGUgeEhDSSBkcml2ZXIg
cG9sbHMgZm9yIHRoZSBlU1Mgcm9vdCBwb3J0DQo+PiBzdGF0dXMgZXZlcnkgMiBzZWNvbmRzLiBJ
ZiBlU1NfSU5BQ1RJVkUgc3RhdGUgaXMgZGV0ZWN0ZWQsIGluaXRpYXRlIGENCj4+IGZha2UgY29u
bmVjdGlvbiBjaGFuZ2UgdG8gc3RvcCBhbGwgdGhlIGFjdGl2ZSBlbmRwb2ludHMgYW5kIHN0YXJ0
DQo+PiBwb2xsaW5nIGZvciBuZXcgY29ubmVjdGlvbiBjaGFuZ2UuDQo+IA0KPiANCj4gSWYgdGhp
cyBvbmx5IGhhcHBlbnMgd2l0aCBhY3RpdmUgcGVyaW9kaWMgdHJhbnNmZXJzIGNhbiB3ZSBza2lw
IHRoZSBwb2xsaW5nDQo+IGFuZCBjaGVjayBwb3J0IGxpbmsgc3RhdGUgaW4gdGhlIHRyYW5zZmVy
IGVycm9yIGV2ZW50IGhhbmRsaW5nPw0KPiANCj4gTGlrZSBpbiB0aGUgcHJldmlvdXMgY2FzZSB0
aGVyZSB0aGUgcGVyaW9kaWMgZGV2aWNlIHdhcyBiZWhpbmQgYSBodWIuDQo+IA0KDQpObywgdGhp
cyBvY2N1cnMgd2l0aCBhbiBhcHBsaWNhdGlvbiB3aXRoIGludGVycnVwdCBlbmRwb2ludCAoYnV0
IGFsc28NCmFmZmVjdHMgaXNvYykuIFdlIG1heSBub3QgZ2V0IGEgdHJhbnNmZXIgY29tcGxldGlv
biBldmVudCB0byBub3RpZnkgdG8NCmNoZWNrIGZvciBwb3J0IGxpbmsgc3RhdGUuIEkgaG9wZSB0
aGlzIGNoYW5nZSBpcyBub3QgdG9vIGludHJ1c2l2ZSBzaW5jZQ0Kd2UgY2FuIHJldXNlIGEgdGlt
ZXIgcG9sbGluZyBmb3IgcG9ydCBzdGF0dXMuDQoNClRoYW5rcywNClRoaW5oDQoNCg==
