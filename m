Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 37AE53AB975
	for <lists+linux-usb@lfdr.de>; Thu, 17 Jun 2021 18:20:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231841AbhFQQW5 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 17 Jun 2021 12:22:57 -0400
Received: from smtprelay-out1.synopsys.com ([149.117.87.133]:48002 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229671AbhFQQWz (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 17 Jun 2021 12:22:55 -0400
Received: from mailhost.synopsys.com (sv1-mailhost1.synopsys.com [10.205.2.131])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id AEACFC052D;
        Thu, 17 Jun 2021 16:20:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1623946847; bh=7BTYOEUK2OZId6mkTe5KUwifLOwuPYywBJskBKfSIbs=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=VKXGkB2OgJAPpcMBX665UPcZAUBvnxWDFRmAhddFWcq/VbXK4dRoLEpvDeCLLRWZm
         RG9QuRM0kSivCdpkJCF4y0BjkekQrQesYe0xLjM5/43ZFszfCeO85wroICWrg5GVt1
         zyD4uZkXHWt1SvW7S92IfSiAMC/M0VDz8CVKMTuHMXl9IURnHqmx3ZW/1flOV7sw+L
         ajvGfhMuBh6Tjd06dKLxWGBVaQUx3lUvc0xS7BJlJB3FyIoDvJY/8a4vYhXl3zDX+k
         LeDODVBSiS9IIyQ1cVAfEQAKCoey9NWc5VcsTg4XdhOsPK7WwV/2tsdJA+WdE4ogiv
         eqpi9JjGF9yWg==
Received: from o365relay-in.synopsys.com (us03-o365relay1.synopsys.com [10.4.161.137])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (verified OK))
        by mailhost.synopsys.com (Postfix) with ESMTPS id 2C691A0068;
        Thu, 17 Jun 2021 16:20:47 +0000 (UTC)
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2168.outbound.protection.outlook.com [104.47.58.168])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
        by o365relay-in.synopsys.com (Postfix) with ESMTPS id 91BB2800DE;
        Thu, 17 Jun 2021 16:20:46 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=hminas@synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
        dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="S4CM3xg0";
        dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eg784x6ljMhSobDZ1ukUi3/R1ZSSv77WX5gGCRlUXQI83i30hknkOW2++6WggtdFuBZhQuk7S7M+sPh6EUWQF4TyeFMaVIOpXsbCqnNhyAeMiwZVQ7w59zWp1EihFp/ZkXubuG5tK9FKsYLTNsnOyL0ZqYowZcE3r+3arDmHPsosGpL3UERHI6tez1GtDnqdTMeyS2cQ9lBzD5g7NSolNMIMKtt9ejHgQFKfANb8NumgtW1WMPcX2MtSGAk717EbSXuaGlUe5rXmvu4romV8wrwkWBxavQoSF5WvLqlbJZzwhUv1fH2v0h9GSAsKHbMF3Jia/xuG7z8S95lxq5mA3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7BTYOEUK2OZId6mkTe5KUwifLOwuPYywBJskBKfSIbs=;
 b=mgEwEJXnWKFqXnZ65o6uEAUi3S8fy211QLJlFdSllHSjFjBde9SFkzUWLgFtaXBmIVL3SokKPRxBuuxr3YzhjoOzU9/v0WCwoDcYm1WkTgQdZwhT+GomYcO7fOo+cINfR2Qd80iZchKsgtWl4JxzDyr1ny2HderSDm4CXldL8uem3CS7nzFnb5e4JEG/288UtlPMbhrD+EoOkU7EIXraEbZ71GbiEOkpWv8mZ0cMMbuCFU7CDTC36gvr4t50oCQUt/5V89AhTYnbXc2+meJelreOCuxunPTGRUl/C0EsITWQ8pyf6IkPB7EMAzOhexkcqbF7PQlBkOenMThYCKYteg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7BTYOEUK2OZId6mkTe5KUwifLOwuPYywBJskBKfSIbs=;
 b=S4CM3xg0IRKdPqccPqBjWGcomGyK3DUzTCLDgkp3PMSgHlPLqaCDMA0QZg7NjMlz63cykJkagHmi2PVC/B7J2ewEAoVgm4jMn15kJ1m1cPY84+TZt4kfrQhCOsyTHDpSyeF/Ga/qRXYUynGVm4QFy9GaOhRlsL4HxnqchYsPTqA=
Received: from DM4PR12MB5390.namprd12.prod.outlook.com (2603:10b6:5:39a::12)
 by DM8PR12MB5429.namprd12.prod.outlook.com (2603:10b6:8:29::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.16; Thu, 17 Jun
 2021 16:20:44 +0000
Received: from DM4PR12MB5390.namprd12.prod.outlook.com
 ([fe80::b119:cac8:fb05:e0e4]) by DM4PR12MB5390.namprd12.prod.outlook.com
 ([fe80::b119:cac8:fb05:e0e4%8]) with mapi id 15.20.4219.025; Thu, 17 Jun 2021
 16:20:44 +0000
X-SNPS-Relay: synopsys.com
From:   Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>
CC:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Felipe Balbi <balbi@kernel.org>,
        Jack Pham <jackp@codeaurora.org>,
        Peter Chen <peter.chen@kernel.org>
Subject: Re: [PATCH] usb: dwc3: Fix debugfs creation flow
Thread-Topic: [PATCH] usb: dwc3: Fix debugfs creation flow
Thread-Index: AQHXYz17L6V8B4/QQE2zZ/GAn5jucqsXuI6AgAAQ9wCAAAY5gIAAHCkAgAAd+oCAAFkUgA==
Date:   Thu, 17 Jun 2021 16:20:44 +0000
Message-ID: <2ccf8308-bc79-9c67-3b7d-eb7307159227@synopsys.com>
References: <7f5167c67cd95102b2acab967d19af7962415a66.1623906350.git.Minas.Harutyunyan@synopsys.com>
 <YMrnaS0EcVQpNpXH@kroah.com>
 <e68070dd-84b0-efdc-78dd-9035b7e911c8@synopsys.com>
 <YMr63WwtOJkc5YhH@kroah.com>
 <0ba79afb-2b34-6e01-9ec3-622a3591ba5b@synopsys.com>
 <YMsrofH0AVUUMH7y@kroah.com>
In-Reply-To: <YMsrofH0AVUUMH7y@kroah.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
authentication-results: linuxfoundation.org; dkim=none (message not signed)
 header.d=none;linuxfoundation.org; dmarc=none action=none
 header.from=synopsys.com;
x-originating-ip: [37.252.93.215]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c1f7faa4-20bf-43fb-adb6-08d931abdb7e
x-ms-traffictypediagnostic: DM8PR12MB5429:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM8PR12MB54295293E0DE248B2356B719A70E9@DM8PR12MB5429.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: yxvIEKfUTxSdbjl8IgjGQBvwdaZpVvML3E78/HuBN9KI25B3XZZ6Slx+BqdwpPV+DmG16PTBcBT1tVpy+k08hAIErxTFpoSW3dWUXRGH9lB+RLJ45ABX9nlvQzyMfUj1pkwOzydMYFVvGeym8wBzloHBq3e4sY2lxjFBkN+JRyhgxWgCCsn9gacn4xQb2m3NY++6ZBX1ibF7mMjgYD4rn6Q9PEtWf/SrVQBytjWnevXLyYu9rpZbsoeUsIl6+Wc0p+kXIb6Ic6e7j6UYnvgLjmLUSQgrzkzb0duPeBwTCksfB9cuENw6fLYeVFioEw2UjU7/0dzzvfnEsblmx76L9fs9e4PrXCd5aGr8H+j2DzlW5x49FmYd97b0ysuYEG6Mg6uofMN0+gAjUu8JbTNYl1INFH2KdUhetRM6IuihfpN+EoFwZ5rzxj/qZnJUh+ekQ42lywRj5s/qXl5/A4PPhJ5WHslAry4Yx/l6LTxJTSUWaFpi4Khij9LCy6uo9t4AWA2xUuyOrb6DrLEJrrX+6+0CSJV/fz3BH3CogXOeAQlJ/ajLI1lsWz1SBgEbLWNoybhum+0pCRjEiJ5Y1GS4msUpEnOaV4wR7rb0QMxf8HUs3P1Lmhr6AeBK5xzEUOw9MONEYObVwzDTsqDqKWCzbce0NTN4Cd+wgDhNVt6p/Lu+c3rvGbcudhTfxv2LpX90ayaQvYtQAwpK10WocA/oXDq8S0qzR8dxsQWcgwqwQGpEfA4/eYKwIHd+tyVqMn9BnXACFtYTlwM41pUI5z2M7h0pBg6fetuHfiLGe98u/OSBC9gA6aUkETixBd1KGRYf
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB5390.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(136003)(376002)(366004)(39860400002)(396003)(346002)(54906003)(8676002)(2616005)(5660300002)(86362001)(8936002)(53546011)(31696002)(186003)(83380400001)(26005)(6512007)(122000001)(31686004)(478600001)(966005)(6486002)(38100700002)(36756003)(110136005)(316002)(2906002)(64756008)(4326008)(76116006)(71200400001)(91956017)(66476007)(66446008)(66946007)(66556008)(6506007)(43740500002)(45980500001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?R0RsVDNXMEk4dEh5TWVRVWtZS3BwamNDckNqN3RWdXlVUVpjMlBLR2ZQU3FU?=
 =?utf-8?B?a2xvK0Z4c3AzOFVxTXdnSWhIRExYMWtvVDByVkNFMUF4bTMzdTJZcnEvb1Jw?=
 =?utf-8?B?RlRUaDBWRHArSnlqMW04VmI3b2ZDeFlJQ09ZWThTbzk4ejRRYnFmUm9memNv?=
 =?utf-8?B?bndUckpTT25CWDBROUpFbFp3K0xSQUludWVQcWd2UTlkNU1KYUMvSitJK012?=
 =?utf-8?B?clc1RzNZS0tWRXlnejlBK1V1MFc0eW9XWkF4NnRCWmlOVm52YUxnRExOM3lw?=
 =?utf-8?B?WWsxbXd2UUpUVUNYcHpEMnVnclBKTnIxTUVVNFh6VVQvNS9ZRUhOVGI4b2ho?=
 =?utf-8?B?ZmtvN0JvclExMlFtNUtvY2VUQVF0NHltbW93bDJXNUgyTUdtWXBDbHF3VlAr?=
 =?utf-8?B?ZnhLL2J3K3RKSDkvWVBKM3VGekRXY2I4RkNzUW9TdUMyR2NFMm5TN0NXSjRI?=
 =?utf-8?B?bkJRUU1oNTNlVEdYdWtRU1pYZWpRbkJJMFozODZqVllXL1c3OWJwaWZoV2Vh?=
 =?utf-8?B?Q29sV1AyRElic2pTQlVqTXhVRlBxcnRrN0ZTdjlnVXNpRFpmNEsrVC9QWVZO?=
 =?utf-8?B?Sm44N2hUVXc2MGp1VThINkJEend5RzJpRzQxMThRb2xKOXR5NHhaV3RweFlR?=
 =?utf-8?B?Zk1ncVF0V2loTlBPZi9hR0FkL0QycXoxY1VDMkZ4UkpTbzJ6YlNrSlp0OTE2?=
 =?utf-8?B?djBRNlRBM2pwdmtJdHExQ081dWxYZHRIbFhLVFdGQS9RRUZrb0w5Q1Y3YTN2?=
 =?utf-8?B?NVQ4czNRSW1adXc2WE9oajhXY05iUXVIaHA4b3ZlZ3kwSmh6VVp6aHdKdVJW?=
 =?utf-8?B?YWIrNHp1RVB2ekhpQWgwV0xPNEV6WGxhb0ZNVGc0SVU0UDRlTXBlRzdpUmFK?=
 =?utf-8?B?QUNxcmxtbXpzd2IzTUloYlZHaTdwWkY3NU5DUlB4eG8xeStwWVBPQm9DU3FT?=
 =?utf-8?B?bW9VaitPbTFTclhpWVBKdjAwS3RIYk1ENHpJaWg4M09IUEFXVWt5d3QyaVBs?=
 =?utf-8?B?UHBBN1AwRXdPWHJMb3pScVAyUWl2blA5bDd2K0w0bkhkMjhIMG9kMXRrT0RL?=
 =?utf-8?B?eEFxUWpaQWtrdUZlbEhzM2tLOUgwby9MNVBIUCswUnZTMXNZUngvTkFsdnJn?=
 =?utf-8?B?Qy84bE5keXQ2RUIyZHBERGZacHlJVzdnbFJZbTNUVVEyNjhnZFBvOW0wM0FX?=
 =?utf-8?B?ZngySWlNZ3NGWlpHUXNpMXlFUVFlSmg3L0lNYzYvVUdjWUhGbks3OVVvc0c3?=
 =?utf-8?B?MVlpTTcwV1dQTm1heGYwWlhLbWxYV2k4SytUa2dkRWxWZXdyMnlUTndPTEFt?=
 =?utf-8?B?RE5MeEdUQldrMzZZbG1EVjczSWVYV2xIMEM0SE14UEZpOE9lZ3c5M243QTZT?=
 =?utf-8?B?bm5zcUdUWTEwQ1ZZUXp5bjBIdXZXMk96V3RUNENaajgya0ZkOEZ1ZkwzQXc0?=
 =?utf-8?B?cCtXN3NoQW9PSEpsSU1aSUxjZFV6WGdkVkQvVlB0UmlDTDBPWXY0VWlEWkVY?=
 =?utf-8?B?QzJWWjRDUDNuZVcyK09LR0Jta3B5SjFVTms2UXlpb0FTNFJPdTF2enV5dStT?=
 =?utf-8?B?R3lydE5MZGt3dXdBcFkrQTJxaXNXRERDZ1U0aVZ5OFE0VFJOdXFzQ09hYWRo?=
 =?utf-8?B?Nk1mSXBzdnVUZkNORXdmaEcrbkx6Y01XTWthZ0VtR21zSWlrWnVSMEdrZlhs?=
 =?utf-8?B?WDhLcUo4RkFMd0lUSG1aWG1lRll3OVM2RFRONHF1QjFVL0NneHc3MzdHcmd5?=
 =?utf-8?Q?bgdSUplyBkSwclMH0k=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <6E2D3DF48D27AF488463C225FE858171@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5390.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c1f7faa4-20bf-43fb-adb6-08d931abdb7e
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jun 2021 16:20:44.0430
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DBkToN4+HdJ6Dw/l+QMQpyjaHb1RMqvxBsZlTxgX32t4d46Q1lMlP7DoyUI9PEtFxL5qMkNRnQ/Mo8RgP53icA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR12MB5429
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

SGkgR3JlZywNCg0KT24gNi8xNy8yMDIxIDM6MDEgUE0sIEdyZWcgS3JvYWgtSGFydG1hbiB3cm90
ZToNCj4gT24gVGh1LCBKdW4gMTcsIDIwMjEgYXQgMDk6MTQ6MzdBTSArMDAwMCwgTWluYXMgSGFy
dXR5dW55YW4gd3JvdGU6DQo+PiBIaSBHcmVnLA0KPj4NCj4+IE9uIDYvMTcvMjAyMSAxMTozMyBB
TSwgR3JlZyBLcm9haC1IYXJ0bWFuIHdyb3RlOg0KPj4+IE9uIFRodSwgSnVuIDE3LCAyMDIxIGF0
IDA3OjExOjMzQU0gKzAwMDAsIE1pbmFzIEhhcnV0eXVueWFuIHdyb3RlOg0KPj4+PiBIaSBHcmVn
LA0KPj4+Pg0KPj4+PiBPbiA2LzE3LzIwMjEgMTA6MTAgQU0sIEdyZWcgS3JvYWgtSGFydG1hbiB3
cm90ZToNCj4+Pj4+IE9uIFdlZCwgSnVuIDE2LCAyMDIxIGF0IDEwOjU2OjAyUE0gLTA3MDAsIE1p
bmFzIEhhcnV0eXVueWFuIHdyb3RlOg0KPj4+Pj4+IENyZWF0aW9uIEVQJ3MgZGVidWdmcyBjYWxs
ZWQgZWFybGllciB0aGFuIGRlYnVnZnMgZm9sZGVyIGZvciBkd2MzDQo+Pj4+Pj4gZGV2aWNlIGNy
ZWF0ZWQuIEFzIHJlc3VsdCBFUCdzIGRlYnVnZnMgYXJlIGNyZWF0ZWQgaW4gJy9zeXMva2VybmVs
L2RlYnVnJw0KPj4+Pj4+IGluc3RlYWQgb2YgJy9zeXMva2VybmVsL2RlYnVnL3VzYi9kd2MzLjEu
YXV0bycuDQo+Pj4+Pj4NCj4+Pj4+PiBNb3ZlZCBkd2MzX2RlYnVnZnNfaW5pdCgpIGZ1bmN0aW9u
IGNhbGwgYmVmb3JlIGNhbGxpbmcNCj4+Pj4+PiBkd2MzX2NvcmVfaW5pdF9tb2RlKCkgdG8gYWxs
b3cgY3JlYXRlIGR3YzMgZGVidWdmcyBwYXJlbnQgYmVmb3JlDQo+Pj4+Pj4gY3JlYXRpbmcgRVAn
cyBkZWJ1Z2ZzJ3MuDQo+Pj4+Pj4NCj4+Pj4+PiBGaXhlczogODU2MmQ1YmZjMGZjICgiVVNCOiBk
d2MzOiByZW1vdmUgZGVidWdmcyByb290IGRlbnRyeSBzdG9yYWdlIikNCj4+Pj4+PiBTaWduZWQt
b2ZmLWJ5OiBNaW5hcyBIYXJ1dHl1bnlhbiA8aG1pbmFzQHN5bm9wc3lzLmNvbT4NCj4+Pj4+PiAt
LS0NCj4+Pj4+PiAgICAgZHJpdmVycy91c2IvZHdjMy9jb3JlLmMgfCAzICsrLQ0KPj4+Pj4+ICAg
ICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pDQo+Pj4+Pj4N
Cj4+Pj4+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy91c2IvZHdjMy9jb3JlLmMgYi9kcml2ZXJzL3Vz
Yi9kd2MzL2NvcmUuYw0KPj4+Pj4+IGluZGV4IGUwYThlNzk2YzE1OC4uYmE3NGFkN2Y2OTk1IDEw
MDY0NA0KPj4+Pj4+IC0tLSBhL2RyaXZlcnMvdXNiL2R3YzMvY29yZS5jDQo+Pj4+Pj4gKysrIGIv
ZHJpdmVycy91c2IvZHdjMy9jb3JlLmMNCj4+Pj4+PiBAQCAtMTYyMCwxNyArMTYyMCwxOCBAQCBz
dGF0aWMgaW50IGR3YzNfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikNCj4+Pj4+
PiAgICAgCX0NCj4+Pj4+PiAgICAgDQo+Pj4+Pj4gICAgIAlkd2MzX2NoZWNrX3BhcmFtcyhkd2Mp
Ow0KPj4+Pj4+ICsJZHdjM19kZWJ1Z2ZzX2luaXQoZHdjKTsNCj4+Pj4+PiAgICAgDQo+Pj4+Pj4g
ICAgIAlyZXQgPSBkd2MzX2NvcmVfaW5pdF9tb2RlKGR3Yyk7DQo+Pj4+Pj4gICAgIAlpZiAocmV0
KQ0KPj4+Pj4+ICAgICAJCWdvdG8gZXJyNTsNCj4+Pj4+PiAgICAgDQo+Pj4+Pj4gLQlkd2MzX2Rl
YnVnZnNfaW5pdChkd2MpOw0KPj4+Pj4+ICAgICAJcG1fcnVudGltZV9wdXQoZGV2KTsNCj4+Pj4+
PiAgICAgDQo+Pj4+Pj4gICAgIAlyZXR1cm4gMDsNCj4+Pj4+PiAgICAgDQo+Pj4+Pj4gICAgIGVy
cjU6DQo+Pj4+Pj4gKwlkd2MzX2RlYnVnZnNfZXhpdChkd2MpOw0KPj4+Pj4+ICAgICAJZHdjM19l
dmVudF9idWZmZXJzX2NsZWFudXAoZHdjKTsNCj4+Pj4+PiAgICAgDQo+Pj4+Pj4gICAgIAl1c2Jf
cGh5X3NodXRkb3duKGR3Yy0+dXNiMl9waHkpOw0KPj4+Pj4+DQo+Pj4+Pj4gYmFzZS1jb21taXQ6
IDFkYTgxMTZlYjBjNWRmYzA1Y2ZiODk4OTYyMzliYWRiMThjNGRhZjMNCj4+Pj4+DQo+Pj4+PiBJ
IHRob3VnaHQgd2UgZml4ZWQgdGhpcyBhbHJlYWR5IGluIHVzYi1uZXh0IGFuZCB1c2ItbGludXMs
IHJpZ2h0PyAgV2hlcmUNCj4+Pj4+IGFyZSB5b3Ugc2VlaW5nIHRoaXMgcHJvYmxlbSBoYXBwZW5p
bmc/DQo+Pj4+DQo+Pj4+IEkgZmFjZWQgdGhpcyBpc3N1ZSBvbiA1LjEzLjAtcmM2LiBQYXRjaCAi
VVNCOiBkd2MzOiByZW1vdmUgZGVidWdmcyByb290DQo+Pj4+IGRlbnRyeSBzdG9yYWdlIiBpbnRy
b2R1Y2VkIHRoaXMgaXNzdWUsIGJlY2F1c2Ugb2YgZGVidWdmc19sb29rdXAoKQ0KPj4+PiBmdW5j
dGlvbi4gSSBkb24ndCBzZWUgYW55IGZpeCBpbiB1c2ItbmV4dC4NCj4+Pg0KPj4+IDRiZjU4NGEw
M2VlYyAoInVzYjogZHdjMzogY29yZTogZml4IGtlcm5lbCBwYW5pYyB3aGVuIGRvIHJlYm9vdCIp
IGluDQo+Pj4gbGludXgtbmV4dCAic2hvdWxkIiBzb2x2ZSB0aGlzIGlzc3VlLiAgT3IgaXQgd2Fz
IHN1cHBvc2VkIHRvLiAgSQ0KPj4+IHRob3VnaHQuICBJJ20gZ2V0dGluZyBjb25mdXNlZCBhYm91
dCB0aGlzIHByb2JsZW0gdGhlc2UgZGF5cy4uLg0KPj4NCj4+IE5vLCA0YmY1ODRhMDNlZWMgKCJ1
c2I6IGR3YzM6IGNvcmU6IGZpeCBrZXJuZWwgcGFuaWMgd2hlbiBkbyByZWJvb3QiKQ0KPj4gZml4
IGFub3RoZXIgdGhpbmcuDQo+Pj4NCj4+PiBUaGUgY29tbWl0IHlvdSByZWZlcmVuY2UgYWJvdmUg
aW4gdGhlIGZpeGVzIGxpbmUgaXMgTk9UIGluIDUuMTMtcmM2LCBzbw0KPj4+IGhvdyBjYW4gdGhp
cyBjb21taXQgZml4IGEgcHJvYmxlbSBpbiA1LjEzLXJjNj8NCj4+DQo+PiBJIHNlZSB0aGF0IGNv
bW1pdCBpbiB5b3VyICJ1c2ItbmV4dCIgYmVsb3cgIk1lcmdlIHRhZyAndjUuMTMtcmM2JyI6DQo+
Pg0KPj4gaHR0cHM6Ly91cmxkZWZlbnNlLmNvbS92My9fX2h0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcv
cHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L2dyZWdraC91c2IuZ2l0L2xvZy8/cXQ9Z3JlcCZxPSZo
PXVzYi1uZXh0X187ISFBNEYyUjlHX3BnIVBURGdKUXVRLTJGbS1XMVVTYXVGV1Bha3dPQmVxNjI5
UGh2VUdjbE42YlByNzV0dl9pczFrbUJJNmFpaWJqdkJjdzh5eklPbSQNCj4gDQo+IFllcywgYnV0
IHRoYXQgaXMgTk9UIGluIDUuMTMtcmM2LCBzbyB5b3VyIGFib3ZlIGNvbW1lbnQgZG9lcyBub3Qg
bWFrZQ0KPiBzZW5zZSB0byBtZS4NCj4gDQo+IFNvLCB0byBiZSBzcGVjaWZpYywgd2hhdCBjb21t
aXQgY2F1c2VzIHRoaXMgcHJvYmxlbSwgdGhhdCB0aGlzIHBhdGNoDQo+IGZpeGVzPw0KDQpZZXMs
IHlvdSBhcmUgcmlnaHQuIE15IGZpeGVzIHRhZyBpcyBpbmNvcnJlY3QuIFNvcnJ5LCBmb3Igbm9p
c2UuDQoNClJlY2VudGx5IG9uIGRlYnVnZnMgb2YgZHdjMyBzdWJtaXR0ZWQgNCBjb21taXRzOg0K
OGQzOTZiYjBhNWI2IEphY2sgUGhhbSB1c2I6IGR3YzM6IGRlYnVnZnM6IEFkZCBhbmQgcmVtb3Zl
IGVuZHBvaW50IGRpcnMgDQpkeW5hbWljYWxseQ0KMmEwNDI3Njc4MTRiIFBldGVyIENoZW4gdXNi
OiBkd2MzOiBjb3JlOiBmaXgga2VybmVsIHBhbmljIHdoZW4gZG8gcmVib290DQo4NTYyZDViZmMw
ZmMgR3JlZyBLcm9haC1IYXJ0bWFuIFVTQjogZHdjMzogcmVtb3ZlIGRlYnVnZnMgcm9vdCBkZW50
cnkgDQpzdG9yYWdlDQo3ZjUxNjdjNjdjZDkgTWluYXMgSGFydXR5dW55YW4gdXNiOiBkd2MzOiBG
aXggZGVidWdmcyBjcmVhdGlvbiBmbG93DQoNCklzc3VlIGludHJvZHVjZWQgYnkgSmFjayBjb21t
aXQgOGQzOTZiYjBhNWI2Lg0KUGV0ZXJzIGNvbW1pdCAyYTA0Mjc2NzgxNGIgZml4IGlzc3VlIG9m
IEphY2sgY29tbWl0IG9uIGRlbGV0aW5nIGRlYnVnZnMgDQpmbG93Lg0KTXkgY29tbWl0IDdmNTE2
N2M2N2NkOSBmaXggaXNzdWUgb2YgSmFjayBjb21taXQgb24gY3JlYXRpbmcgZGVidWdmcyBmbG93
Lg0KDQpTb29uIEknbGwgc3VibWl0IFYyIGNvbW1pdCB3aXRoIGNvcnJlY3QgZml4ZXMgdGFnLg0K
DQpUaGFua3MsDQpNaW5hcw0KDQoNCj4gDQo+IHRoYW5rcywNCj4gDQo+IGdyZWcgay1oDQo+IA0K
DQo=
