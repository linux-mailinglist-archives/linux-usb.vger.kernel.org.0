Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 840303D4ED3
	for <lists+linux-usb@lfdr.de>; Sun, 25 Jul 2021 18:53:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230272AbhGYQMi (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 25 Jul 2021 12:12:38 -0400
Received: from smtprelay-out1.synopsys.com ([149.117.87.133]:56896 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229709AbhGYQMh (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 25 Jul 2021 12:12:37 -0400
Received: from mailhost.synopsys.com (badc-mailhost1.synopsys.com [10.192.0.17])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 66F5CC0DEE;
        Sun, 25 Jul 2021 16:53:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1627231987; bh=qPD04WVJ3RZPh9kKVLpR3EHhLF82dmZBfMo343OYQqw=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=iBUpBuR1V4YBSxUBD2uom1S89gHKIzLKvTXtNzLk7dV0+vtqSEvcmaekofCbx7PrV
         rwDrDRy7pGb/YaefHaMDvH+RNU/3VXmL8Pc2RiQYWkEGlv9ceVm3kuVmKeIMOwkPia
         To4tURiiiyCUh7qAEqZnNepe/pnv6YqJx76C7bnQAFAqSpiDoYpTF9AITZ9ck6v1sA
         bVS6zc3doPsFRtviPFSX8PGaZBwX6McJfQ3TBAY3H59W583Fkzax7fZQF9VEA5Dn/8
         HN38/0/KB1QqUOqN6p/izM2zGr9Xpfzf/9+TdsgvQuERW59VqqsnFkuYB+t2gBUogX
         ESQEQgoVjqkyg==
Received: from o365relay-in.synopsys.com (us03-o365relay1.synopsys.com [10.4.161.137])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (verified OK))
        by mailhost.synopsys.com (Postfix) with ESMTPS id 7C7E6A0071;
        Sun, 25 Jul 2021 16:53:06 +0000 (UTC)
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2174.outbound.protection.outlook.com [104.47.57.174])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
        by o365relay-in.synopsys.com (Postfix) with ESMTPS id F20C580026;
        Sun, 25 Jul 2021 16:53:05 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=hminas@synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
        dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="GH6XVh+g";
        dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k1Y2hyZc2LNaAu8EztVD4YwShLZ66qHkLbn/0Qn76okARWGMdM1sKplA0Gt1gIxPvu8CGF75OvA66/UADQPNpf5hi59ZdY0bzuKoz/R2R7Ir1Zc+jL8u8afbH15CNa40Wb9BGmC/vvWeNFyUcvTWEFoLPJLogMoh95oiuFIi5Uvx9e278dfApxmT/9q8KWNwU3SUu+JewWWRZ51cso6fyKZrJ36udK61ST2aj1TeXqFRiddvkuy1hgWiDMsRicrVrS1pZf8ayaGWPIFFP2fjFiAnCpxn6Fdx/Ly+yk4XCtAd3ekfWMduYL1sZzR/c+queLvqu6sfbjkYNmKJaXZGSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qPD04WVJ3RZPh9kKVLpR3EHhLF82dmZBfMo343OYQqw=;
 b=c+VqdMEw07j6Ifb4jXayVdvHaR3u3Ppeld2D2K8QiBCvl4NNx4laVA60Hbbsc0MStQfzrq3YACBWhTsSgSccBw2anA62nfy95z5jnO+0USXMWZhMCCd81DMbzt/HK583wEhvYupgNJCI/fAXENKuLMNb7U+4k38l6WHYzk7B3xd62mhcoHR6IjEeWUbVUyvzl1rsBllpecw2z+sXgV2+HYp1FSLy5tijIswouJQ+Eg34kazJgvB5AlZzUSO0tiq9VnDLk9n48Frcpm3cXmbyXagIxN+i4yW0lSefLj4Il20yFcdIE4xO0Vw7WQkIfBNIf1f+K4+Z2Rvmy252QRs41A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qPD04WVJ3RZPh9kKVLpR3EHhLF82dmZBfMo343OYQqw=;
 b=GH6XVh+g/0kwRP42dMHnlKhxP8ggRh5RU+e32hMTqmeAVrIIjZg3DjZmuO0Ib9J/ivmG0bFjFwgAto08lChX5OneRE5SOTxbilDLSrsNPiHL+7m4djU7iwGBJ5hUgbm6xAOdryKrwIHNbkx/n5tIFs/hxDkxdGZBkLi5D20iEOY=
Received: from DM4PR12MB5390.namprd12.prod.outlook.com (2603:10b6:5:39a::12)
 by DM4PR12MB5245.namprd12.prod.outlook.com (2603:10b6:5:398::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.26; Sun, 25 Jul
 2021 16:53:03 +0000
Received: from DM4PR12MB5390.namprd12.prod.outlook.com
 ([fe80::d97c:7079:8a93:cd4]) by DM4PR12MB5390.namprd12.prod.outlook.com
 ([fe80::d97c:7079:8a93:cd4%3]) with mapi id 15.20.4352.031; Sun, 25 Jul 2021
 16:53:03 +0000
X-SNPS-Relay: synopsys.com
From:   Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>
To:     Greg KH <gregkh@linuxfoundation.org>,
        Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>
CC:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: [GIT PULL] USB fixes for 5.14-rc3
Thread-Topic: [GIT PULL] USB fixes for 5.14-rc3
Thread-Index: AQHXf9KPagB9MEZbYkWVzShpGEQ9AatT3goAgAAC9YCAAAprAA==
Date:   Sun, 25 Jul 2021 16:53:03 +0000
Message-ID: <004e42ef-910e-f426-c777-f246e5bbb61a@synopsys.com>
References: <YPrX98Lqa1xH8uH7@kroah.com>
 <970d93d8-38ec-0ff8-6178-825a0698b2ea@synopsys.com>
 <YP2OMa89rnd8hhft@kroah.com>
In-Reply-To: <YP2OMa89rnd8hhft@kroah.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
authentication-results: linuxfoundation.org; dkim=none (message not signed)
 header.d=none;linuxfoundation.org; dmarc=none action=none
 header.from=synopsys.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 218593c9-90fd-404b-7905-08d94f8cab51
x-ms-traffictypediagnostic: DM4PR12MB5245:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM4PR12MB52451D5C6DC80C7C4DB6BE73A7E79@DM4PR12MB5245.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 0B2eb4zqzd2URXw0/57sf8OC4fFxr8XJOCfgPyR+FWLfL5zRFGR8IPXxDTZ0Slm/ej947TLvqf82f4vc1SHpxpR3TQDnWxdw5sxgSwXsZFJ+WJ32oPRdYcCHSetCKCAElLcpLtF4odTiFqyl2QpitqASiZ9ZhCd7PBTtnLkkdbTWZUgQnEFStQ7ZDyRVEAw8BigFGOQ1xA/GbAVxIvQRg0YC9AdwLOQWEUBFp3omaiOun9dJLhl6DjJMDIFXapK/8NmCpDS/+IY/3xiu1Rdm+SPfUQ5whA3M5aexIY33bn6B07t8GCM4CAj+U8Z7bfcYnYBSPFR0Ibifx5sXgKNr4sZKuExZu+PvlufZ0rjGQAjL3lMZ1qQWqnxaxXBSzFuuNSWSDGZdcgjtql3YRdlrEO/305GRnuobg81ugEfiWg2VNt/OjgD/tmqGXanA0cxta6tLyCN2YJI6mjMClajrnV4HRJLOYJ1oYoSyU+XfWhzBpBTsnFyizpF1zp7ZKfINpiYP2FnNxpy5xvTPGS0vaMmwNxePEB8aHzW/1QVy8qPK2O2ghshKUZPx/2jpL1tZpNSHhqly2RCMH/hEJanj7TU5LLF8PikqeNE27C/9/KXqpR6Qeyw6PqWxireBw8g+KcMJbqb5KXknsR5a3Y9OBfFA677hxK7nKbak/gh6XIltcZJEYt5GZh3+tS0KHRkWDtn841duikuOqeiXujsqd6Ccsh+ASS74ihKYwCx0Hb7dmJp3gzyyb4Pcq8DQLJbi2ufNTotuZQeD/c8BqxHbQZLS9ttOtwq3wGdD6ek/1m5hKAmQiqNnSXc7HDCWuv9yIUssHd0toRlsSRt1jegRlbJU7IclwnlO9nlhz6THjYY=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB5390.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(39850400004)(136003)(366004)(376002)(396003)(346002)(5660300002)(316002)(91956017)(66446008)(53546011)(6512007)(6506007)(76116006)(66556008)(66946007)(110136005)(8676002)(122000001)(83380400001)(31696002)(38100700002)(36756003)(64756008)(66476007)(71200400001)(26005)(8936002)(31686004)(86362001)(966005)(478600001)(2906002)(2616005)(186003)(4326008)(6486002)(38070700004)(45980500001)(43740500002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?b3ZmZXZ1T1puOElZeFZnOE80d1BVazBkU2tYVmVkczFTN2xYazlabnA5bEVG?=
 =?utf-8?B?RVoxT2hXVEwwVFFXTkxLMW1DL0NzQzNrTlRKSU0wZ1hxT054c1k4MHpQLy9a?=
 =?utf-8?B?TisxWmxEdHVDcUVreHc2RjQ1WkwvMk1kQTJqbEgvbGRkNDNzeHhHWHBNcDNj?=
 =?utf-8?B?QkhWdTRmeTNiWFRNQisrbmRkMmxJSnNvNGlSSjlvWmgxWG1Ob3VteHY0UmZm?=
 =?utf-8?B?d1lRb3B4TzMvSjY2Nk56VWJxUlVMa3czbmRpd2tWUjJONWlObmE1SXIwc1pN?=
 =?utf-8?B?anN4cXdmd3BGQ0NqL0Y0YTloL3k4cENyRFlOUVE3TkZTalowekhnVXE1S2lh?=
 =?utf-8?B?TzVvalhMMzdpSXVUcUYvNHoxVTRINzBCZUpQZTFwU0JTVFc2OTlTRDhTTFRr?=
 =?utf-8?B?NnY5ck05NU9KeEg4bEx3NUxxNkVNV0FBNGpHaW9UWG4yUDc2ZXBITGhDRGsw?=
 =?utf-8?B?TkdjN0VUTnJiT1dGQUhQZlBDM2lkQjVybGs1MlkxbEZFRkR0WXNZNkJFemp5?=
 =?utf-8?B?M2FUM0Yra0lwZ3FscFJKMlBkUEpORi80VHA3NWs2S3ROMUdGZjhMSjBmcUg4?=
 =?utf-8?B?OXh5ZXhaVEk4N3lybjRDcTNqelJzNUZ6SGplMm5DTXg3OUxSdXJqY3dMMW5v?=
 =?utf-8?B?Zm0zRjZMMHZ3aGZQRGFrSlVQY0EvaHRYajJqeTF4RGNkWGc0MWJDMnhDekJX?=
 =?utf-8?B?U2hMdU1hdGprYVdSVkMyZlZXV3RuUUNDS1hqSzdiOThGSXhYYW11akROdEpE?=
 =?utf-8?B?MDkxUzBpK0p6VHN5T08zdk5uY3JTb3lwV1ByTGZoZjVvTk00Skh0TEwxTGxF?=
 =?utf-8?B?dVI1bkp0UWVtWWszN3M5SlpQMHJLcHdEWTV2dVdzdkZ2UU10TVhXREllNDR0?=
 =?utf-8?B?UTFnazFoTFFHandnS3Mrd0l5RWFqU3RjZWZJWUpXcGs5ZHJvaGJneEJUSU9p?=
 =?utf-8?B?dWdFRkRTL3dHNjJZZi9FMk5jWXdYK3N2Vm9qSEV6NURnb09pRENTY0hxUWJ6?=
 =?utf-8?B?SzFZV1ExYnJFMlBocTJocngwYnlOQjJLbjJFQWxaZlBGeGp2Rm1qTFA4eFlt?=
 =?utf-8?B?VmFRVXV5NEQxM2t3QThPSnVrQjd0dExMVGdZRDJDZWhBbmdDbXBxQ3NwR3N4?=
 =?utf-8?B?RUJ2ZzZPWnpnWWRGQ3ZLNVYxYmFUcjJSdzA2bWdkSXNKUGhDeDBpM08xQ2pZ?=
 =?utf-8?B?enJCbzRFamdQMUFmOU55UlN5VklKeHZuc0J2bjNwSGQwZXFSNk96bjFLRHZC?=
 =?utf-8?B?VGl1emFvbTBsZ1EyUHF6eE9hU0JrdTJHWHV1NHdKVDlWK0o1QUt1MzdHSDFl?=
 =?utf-8?B?TUJ6TzM1VXlSMVVSdVJRVlpXODUwaUo1QTRnd2RWT1FZWHIrZGVWTDRnNTJW?=
 =?utf-8?B?Mndlb3djVXF6aDZSZC94R1h5dDNLOGRMVFlFTG4zZXI1Y21pYndNWExmeWdW?=
 =?utf-8?B?NVdSRTlpQmRubS9NN2YwZmxHbnc1R0dmdWVJNDFEbmxkNkEwZTZmRXI1WUJR?=
 =?utf-8?B?dlFPM1o0Q1VOOGxSMFk1TnlvaEgxQ2ZpYkQ4YmN5RmJZTmZBQUdSQ0k1eTU2?=
 =?utf-8?B?VmozSW1sSjFXeGp1bHZlR1grc0lUUlNGRWc5aU5CVWs0eUpzYmsycHIxSHA5?=
 =?utf-8?B?YURvVFlIdU0vL1JYQXh0ZjYxSHhZYWh3MlJZSC9yaXB2YVI3czVjV0dUVlhB?=
 =?utf-8?B?Y3pjTHZrN25NTEFxSEsyUmM2SmdTNGVXSUpBREJGQnlnRFM4a2lGUWVQRnRQ?=
 =?utf-8?Q?lDR2UV3eBJXk1lGCDw=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <880F7C5AA17C2343943D8CB0E43CB33C@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5390.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 218593c9-90fd-404b-7905-08d94f8cab51
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jul 2021 16:53:03.6600
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Z18TSreFx4H++rx80uIVVpVMHDQDUcbaCJ7U9oL3ueu9nIU4jUW3PYpMtl0oUhtn+jKKGlDCNsS3Ahi7gL42RQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5245
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

SGkgR3JlZywNCg0KT24gNy8yNS8yMDIxIDg6MTUgUE0sIEdyZWcgS0ggd3JvdGU6DQo+IE9uIFN1
biwgSnVsIDI1LCAyMDIxIGF0IDA0OjA1OjExUE0gKzAwMDAsIE1pbmFzIEhhcnV0eXVueWFuIHdy
b3RlOg0KPj4gSGkgIEdyZWcsDQo+PiBPbiA3LzIzLzIwMjEgNjo1MyBQTSwgR3JlZyBLSCB3cm90
ZToNCj4+PiBUaGUgZm9sbG93aW5nIGNoYW5nZXMgc2luY2UgY29tbWl0IGU3M2YwZjBlZTc1NDEx
NzFkODlmMmUyNDkxMTMwYzc3NzFiYTU4ZDM6DQo+Pj4NCj4+PiAgICAgTGludXggNS4xNC1yYzEg
KDIwMjEtMDctMTEgMTU6MDc6NDAgLTA3MDApDQo+Pj4NCj4+PiBhcmUgYXZhaWxhYmxlIGluIHRo
ZSBHaXQgcmVwb3NpdG9yeSBhdDoNCj4+Pg0KPj4+ICAgICBnaXQ6Ly9naXQua2VybmVsLm9yZy9w
dWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvZ3JlZ2toL3VzYi5naXQgdGFncy91c2ItNS4xNC1yYzMN
Cj4+Pg0KPj4+IGZvciB5b3UgdG8gZmV0Y2ggY2hhbmdlcyB1cCB0byAxZDFiOTdkNWU3NjM2ZDcy
ODkwYTViZGQwYjQwZTk4MGU1NGIyZDM0Og0KPj4+DQo+Pj4gICAgIE1lcmdlIHRhZyAndXNiLXNl
cmlhbC01LjE0LXJjMycgb2YgaHR0cHM6Ly91cmxkZWZlbnNlLmNvbS92My9fX2h0dHBzOi8vZ2l0
Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L2pvaGFuL3VzYi1zZXJpYWxfXzsh
IUE0RjJSOUdfcGchTUo4cVlRWkVTZkE2U0FEZmtiS1RPdkxwUFVJV2o5ckMwbFNFRGpxckxQRUpq
Zml1V1BDV2d6VTBZaV9WYjd3QzdKM1BKd2RYJCAgaW50byB1c2ItbGludXMgKDIwMjEtMDctMjIg
MjA6NTE6MTQgKzAyMDApDQo+Pj4NCj4+PiAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tDQo+Pj4gVVNCIGZpeGVzIGZvciA1LjE0
LXJjMw0KPj4+DQo+Pj4gSGVyZSBhcmUgc29tZSBVU0IgZml4ZXMgZm9yIDUuMTQtcmMzIHRvIHJl
c29sdmUgYSBidW5jaCBvZiB0aW55IHByb2JsZW1zDQo+Pj4gcmVwb3J0ZWQuICBJbmNsdWRlZCBp
biBoZXJlIGFyZToNCj4+PiAJLSBkdHNpIHJldmVydCB0byByZXNvbHZlIGEgcHJvYmxlbSB3aGlj
aCBicm9rZSBhbmRyb2lkIHN5c3RlbXMNCj4+PiAJICB0aGF0IHJlbGllZCBvbiB0aGUgZHRzIG5h
bWUgdG8gZmluZCB0aGUgVVNCIGNvbnRyb2xsZXIgZGV2aWNlLg0KPj4+IAkgIFBlb3BsZSBhcmUg
c3RpbGwgd29ya2luZyBvdXQgdGhlICJyZWFsIiBzb2x1dGlvbiBmb3IgdGhpcywgYnV0DQo+Pj4g
CSAgZm9yIG5vdyB0aGUgcmV2ZXJ0IGlzIG5lZWRlZC4NCj4+PiAJLSBjb3JlIFVTQiBmaXggZm9y
IHBpcGUgY2FsY3VsYXRpb24gZm91bmQgYnkgc3l6Ym90DQo+Pj4gCS0gdHlwZWMgZml4ZXMNCj4+
PiAJLSBnYWRnZXQgZHJpdmVyIGZpeGVzDQo+Pj4gCS0gbmV3IHVzYi1zZXJpYWwgZGV2aWNlIGlk
cw0KPj4+IAktIG5ldyBVU0IgcXVpcmtzDQo+Pj4gCS0geGhjaSBmaXhlcw0KPj4+IAktIHVzYiBo
dWIgZml4ZXMgZm9yIHBvd2VyIG1hbmFnZW1lbnQgaXNzdWVzIHJlcG9ydGVkDQo+Pj4gCS0gb3Ro
ZXIgdGlueSBmaXhlcw0KPj4+DQo+Pj4gQWxsIGhhdmUgYmVlbiBpbiBsaW51eC1uZXh0IHdpdGgg
bm8gcmVwb3J0ZWQgcHJvYmxlbXMuDQo+Pj4NCj4+PiBTaWduZWQtb2ZmLWJ5OiBHcmVnIEtyb2Fo
LUhhcnRtYW4gPGdyZWdraEBsaW51eGZvdW5kYXRpb24ub3JnPg0KPj4+DQo+Pg0KPj4NCj4+Pg0K
Pj4+IE1hcmVrIFN6eXByb3dza2kgKDEpOg0KPj4+ICAgICAgICAgdXNiOiBkd2MyOiBTa2lwIGNs
b2NrIGdhdGluZyBvbiBTYW1zdW5nIFNvQ3MNCj4+Pg0KPj4NCj4+IEkgZGlkbid0IEFDSyB0aGlz
IHBhdGNoLiBNZSBhbmQgTWFyZWsgU3p5cHJvd3NraSBhZ3JlZWQgdG8gZGlzY3Vzcw0KPj4gZGV0
YWlscyBvZiB0aGlzIHBhdGNoIGFmdGVyIGhlIHdpbGwgYmFjayBmcm9tIHZhY2F0aW9uIGFmdGVy
IEF1Z3VzdCAyLg0KPiANCj4gT2ssIHNvIHNob3VsZCBJIHJldmVydCBpdCBub3cgdGhhdCBpdCBp
cyBpbiBMaW51cydzIHRyZWU/ICBEaWQgSSBtaXNzDQo+IHRoZSBkaXNjdXNzaW9uIHRoYXQgc2Fp
ZCB0aGVyZSB3ZXJlIHByb2JsZW1zIHdpdGggaXQ/ICBJIHNlZSBhbiBhY2sgZm9yDQo+IHRoZSBw
YXRjaCwgd2hhdCB3YXMgd3Jvbmcgd2l0aCB0aGF0Pw0KPiANClllcywgcGxlYXNlIHJldmVydCBp
dCB1bnRpbCB3ZSBkaXNjdXNzIHdpdGggYXV0aG9yIGRldGFpbHMgb2YgcGF0Y2guDQpBY3R1YWxs
eSBJIGhhdmUgcmVwbGllZCB0byB0aGlzIHBhdGNoIHdpdGggc29tZSBxdWVzdGlvbnMgYW5kIGFk
ZGl0aW9uYWwgDQp0ZXN0aW5nIHJlcXVlc3QuDQpQYXRjaCB3YXMgQUNLZWQtYnkgS3J6eXN6dG9m
IEtvemxvd3NraSANCjxrcnp5c3p0b2Yua296bG93c2tpQGNhbm9uaWNhbC5jb20+LCBidXQgbm90
IGJ5IG1lLg0KDQo+IHRoYW5rcywNCj4gDQo+IGdyZWcgay1oDQo+IA0KDQo=
