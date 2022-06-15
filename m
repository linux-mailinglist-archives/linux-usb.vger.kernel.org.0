Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4C48354BF37
	for <lists+linux-usb@lfdr.de>; Wed, 15 Jun 2022 03:21:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239760AbiFOBVw (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 14 Jun 2022 21:21:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55178 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233337AbiFOBVv (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 14 Jun 2022 21:21:51 -0400
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.73.133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CEDD911A0B
        for <linux-usb@vger.kernel.org>; Tue, 14 Jun 2022 18:21:50 -0700 (PDT)
Received: from mailhost.synopsys.com (sv2-mailhost2.synopsys.com [10.205.2.134])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 3435540A13;
        Wed, 15 Jun 2022 01:21:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1655256110; bh=efaZrVugL4kvGg7sPqVHeEg4TYM6VtaJwvc1ST6QvWA=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=IvaepmC/metFTw/rwN9pwQfHBmYiEWtUtvGJL9XUAsX1Sj06ZFg9Sv9sNvQE5fV+S
         aNZgesWPWJyzijF1fJdauyGU7MWZdZ8qfNxAmXmGXD1AfxIb8flR2u32mQSejJ2jAj
         z1BxpsB30MGn1z8CtS4JJZQ6/W8jW0gKFZwRKblFg83VndbJxHZycJNdKwlTHJBLI9
         c0YSInowiK8CHKFyu/9PYYqGj57YZP++BsZqpvZhP9nxkKT5OisHTRa0zn/M/iMnmD
         oFM/p9gZVWIiIgD+x183KqAcL2SG0WXGjgP6CEvnXuHDf/XojDZHWRs40ZvfHx23cH
         BTrnWw1yEFK5A==
Received: from o365relay-in.synopsys.com (sv2-o365relay3.synopsys.com [10.202.1.139])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (verified OK))
        by mailhost.synopsys.com (Postfix) with ESMTPS id C0894A00A3;
        Wed, 15 Jun 2022 01:21:49 +0000 (UTC)
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2172.outbound.protection.outlook.com [104.47.58.172])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
        by o365relay-in.synopsys.com (Postfix) with ESMTPS id 3AF3740053;
        Wed, 15 Jun 2022 01:21:48 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=thinhn@synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
        dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="jefs6ZRd";
        dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HF6kNF+2gKV3g7Ei5kMO8tJ+Rl6dp2fhqP6RYyjQqGc1/ZDjsl5mpGTzBHH4pP++GjNoXWXUDHyZjJg3w+SsOseDlhaqrmhODdKvSibEv8ZOofvtsQ8z1+zw+D/w582/c/fN2SVQTopDD/hpKoG0GeGxV5qcr8JyjE7dAkbTD0QHVZGjf5fRooa6JwR/pvTNwmKyM0pgnRssz4Q/puwgncnuovjsQWadojXWycLTU6UwMnHh8Wc5fL6fngPZRLguZt4BqqIjcPn8MBlQD7jWRKU4URDzllIf0Wc1SzSyDi88aLrBO3iL5QGBIBOu6R00LKXAZORgvJyJ8y9s0bea3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=efaZrVugL4kvGg7sPqVHeEg4TYM6VtaJwvc1ST6QvWA=;
 b=NL8wLj6tZjCwB5NneS+ki6qwDWBXsTljHeglqr2X9OImTR96XMxJVv5oALY2AqXu7GAqcya6S/bSUGvx6bYRvrcqB1UGssHcEfvNPnY6tAm1I+zngKTncCppC5l6j8Q96+DTgyhoQ7VciYU/aKaxLKidztgnJ0MkttQPOfxGArirwxJak4eSGfKakQJXjiCdT2TRD53OS8J0wxTCv+KVz4YRGLf8tHmXS+kcBV5sQSNMxscenKIKF2kSAgiiO+irpzU3qFVKNVr3mKGB0SXlYcik9NBcEwkcK9wujs9VEFU8xXOqpYkGgWkUnpAxBN1G79zemr3+xEArszZbE0h9wQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=efaZrVugL4kvGg7sPqVHeEg4TYM6VtaJwvc1ST6QvWA=;
 b=jefs6ZRdbmTObOTjOf+RgTwdtwC0lEDNCw0oTLNoFCAy49Z3oVrUC8O5N9KtFNl57Q1WIR7WvwOiEVDPtITmlmKPorK66QVv7SCqmObgtdEQb503fcTuHQc6M6p8KwzbvplR5pNVp3qHYTmTT00XzTpVzOwt8mXcFObsTTAdBlw=
Received: from BYAPR12MB4791.namprd12.prod.outlook.com (2603:10b6:a03:10a::12)
 by BN9PR12MB5228.namprd12.prod.outlook.com (2603:10b6:408:101::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.12; Wed, 15 Jun
 2022 01:21:46 +0000
Received: from BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::91c7:7e6b:d663:a349]) by BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::91c7:7e6b:d663:a349%7]) with mapi id 15.20.5332.022; Wed, 15 Jun 2022
 01:21:46 +0000
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC:     John Youn <John.Youn@synopsys.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Felipe Balbi <balbi@kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: [PATCH] usb: dwc3: core: Deprecate GCTL.CORESOFTRESET
Thread-Topic: [PATCH] usb: dwc3: core: Deprecate GCTL.CORESOFTRESET
Thread-Index: AQHYcTOCh/EeFSDAS0WpRqwsrQHioa1PyiaA
Date:   Wed, 15 Jun 2022 01:21:46 +0000
Message-ID: <8c4f423c-613d-2347-0769-3af4674d8582@synopsys.com>
References: <54b6e2974bccacbd644f9ba75d8929d09848ecc4.1653586398.git.Thinh.Nguyen@synopsys.com>
In-Reply-To: <54b6e2974bccacbd644f9ba75d8929d09848ecc4.1653586398.git.Thinh.Nguyen@synopsys.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=synopsys.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3061f5de-5649-424c-8633-08da4e6d69ec
x-ms-traffictypediagnostic: BN9PR12MB5228:EE_
x-microsoft-antispam-prvs: <BN9PR12MB5228518E981CA2DF7333CFA9AAAD9@BN9PR12MB5228.namprd12.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: fD9fN0UkLdG81dQYkQoL5mCa2BS2FJOA0VL5k7zzJ23atSP27PVwjtyR99LaRLOWNRF49BaKhXH0Nm078HgLdwbVqoZWEix0546sPGWqYhDjNPk6AWylSgOmOUAttZcmX0pquV52xYLzkOMhwD6qoMc3rRP+1BRTdhJjsajZox4PCaMU66GXsfOSHxQf7xWnN2PirLsMLrrtOXEtgb5He72hgKN577k5CsV+7aRr/FooYtoE90CfjXGwoMOmqpT+eFdspMgjLAdclAJGqOiJn1rPx+5HDk0wKS6w0nJU5PyuQ7MT2rNyuMTAlADtyOEb6QpKpMsBfv6TJtcA0lpY2TopkmRZXVU1OKxHEJ1gMDQwt7m0t2VrkYHpX2njvOk8SBTiuCunVt/iW0terz0tURhEuNEU4zmUDoX4tzvF0hFa7/6gXxgauPgJHri5pka1gf17g1aOyJgNJZUnonXSCkDSV5EwhZgxXZ57A1lMTtG+wFbrM9vNxfTNF3wx184e8bwofAgSEnYR+ebbF+PBb2H/Ji/ol4AX7jnqEZ9cBzmM5//Iit/EfB1/4ELnBd6fYVpvLBrb8oA0OVGIXKRvOq5yydRvF0ut2qXM0AwqFqQq6WjPWI2MMvBolhMxi7rQdKuCEzhDDD9S4+OcKtiOL29vshjYKH1g77z8He1JXACGUoYlZ4P1sas4tvhZpLXj/rPTjX+EL3fNa0nrbgtDmgJ8xPbC5aWuvlSWfGCKqDnKpW9QUtpv/9lZeW/CUCzAm9c7kj+KJ7tL7RSuYsqk7w==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB4791.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(366004)(66946007)(64756008)(91956017)(66556008)(4326008)(6512007)(76116006)(31686004)(8676002)(5660300002)(83380400001)(36756003)(186003)(66446008)(66476007)(26005)(6916009)(2616005)(6506007)(86362001)(31696002)(38100700002)(38070700005)(71200400001)(54906003)(508600001)(316002)(6486002)(122000001)(8936002)(2906002)(43740500002)(45980500001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?YXVmYlVvVFhQNXI5UjVCUFgzcC95cS9RRlBQL2FtMWF2Vm5wZFlLakMzZjVk?=
 =?utf-8?B?LzNaUWs4UUdCZzB6UVVmWmF5RFNyS2R5a25yUXY5RXc4ekVCYW1CTVVwYVBz?=
 =?utf-8?B?T0JMMUlFcDN6bXkrdExhNi94N3RMWDY3ajlLa21ucjlnSDVLTCtkRVVyQS9X?=
 =?utf-8?B?OEVBdE9jMkFWbHFMdmlLb0Jqc2tBY3FhNEI1TnJrRUhjYlJBUWpQTDBUczIr?=
 =?utf-8?B?SloxNkpkTGRhVDVXOFNyUzVsSXRPeHpJMnUrYXgveHQxOHh4SEVkUDFyLy8z?=
 =?utf-8?B?OGRLczRUaXRmeDIraS90NVAvOTRsK3lQZlhBaHJvVUN3aHY1SGFxZkJtT203?=
 =?utf-8?B?cnYrbGduMG5Ob2l5UXZhSzNHK1hKa3hTTzJnNUtQbklRSTlNNEhnbm9aY1hl?=
 =?utf-8?B?eVdtNmc4bGtYeWVUQm83M2xXd0JYOUNEQ0RvRHNNOGcrbG11dTlxeWcyWVZr?=
 =?utf-8?B?dHhMRytRY0ZTdGlib2UyZCtNRnIyY25UNjdSK2k5QS9mYXBBcVp1Vk1YSHJu?=
 =?utf-8?B?L21sbkpDWFFWSjRjY3JpZ3VKcWY4YWhNTFc1c0JnSHRhOEVCZm13MktLOEhN?=
 =?utf-8?B?c1BoU0M3S1ppNkRodFVRV2xQRHYwRktoUTlRZlIwYzRCZVFrcVFUYldHZEsx?=
 =?utf-8?B?WXpXLzNhR1JJYjVmeno0d0RVNm1WRm9nTmZMeUQ0NytQajhKRk1jdUJQS01K?=
 =?utf-8?B?NlRwM1BGaExpSnN5S0JlbXNMcmVHSEt3T1JSVTNxa0RkYXk2QjRlVU95Mm1V?=
 =?utf-8?B?Z0FTdmMyK3dza0FYWnlzdWp2T0xHZFFQeGdwcTBpZFB5YlpscU5CczBtRVJy?=
 =?utf-8?B?S3lNcXpEMlRZbU9WSk9yU3V0YVdsSFRZVys5bTN1NFlwbFhmbk41Qnh3UHFH?=
 =?utf-8?B?MlNlSHNURm9sUy9kYVBkOHVleXR5Q0E1Mm1EREcyVFRseDJLTnV3TXhhUjZ0?=
 =?utf-8?B?SXlsTzhQbTJuNXhGNmFOL05Ia2habHpaenBOK1dLVWcrVjNkK29SSjh3VVho?=
 =?utf-8?B?TVhNUEphajlhQXpVMlZSVWxsRkY4TjlNVHFzNldyR1hFWXo5NHdjbU1IZzdO?=
 =?utf-8?B?bWozL1VvbGROdk80bzlMVHc2RUl5bnhlZmY5YzRGKzhBeWRkZ1N2aGFxeGRJ?=
 =?utf-8?B?aVoxNy9Ob3BDN1ZXdFdSbGgwRHM0K3B2YkkxYS8rc2tQcUx2c012cmlTUHRB?=
 =?utf-8?B?YUZmRWMxMzlHQ0xJTzczSTNVQVRtYVZsSzBpUjQra0t1RHBrUkUyRVRYcFVD?=
 =?utf-8?B?NHNqQTQwaG1XV3NydVNjMkNQemVuSlFiRDRvOUFXWUJ0QWY4UEFxZDIrTFN2?=
 =?utf-8?B?aGs4Y2Z6c0FGalBNa1QvU2JQUyt2REpLR0JoMzM4SjJiNVZxNG5ySHcrNzZ6?=
 =?utf-8?B?WFNrSUhDOHdWS2dGR2wwU2p1cWw1MmZrYU44ME80Y2l6MlZ5WXQwdlNsRFNH?=
 =?utf-8?B?dWhIWTJDRC8yK1RQZ01pcGVHYWkwSUNFUUpmeVZRbVBCa2FNWjk3QUR6UWhv?=
 =?utf-8?B?RkQvbk8rSVhSQWVnVFpkYjJwdEx6UmN1RU8ybHdUZGJXMW5xQVkxS0JiU1I5?=
 =?utf-8?B?U25yaDdhTWc2WmhEczZKOEQvb2pQd2xXYUEvd0FtUEkxak0xWjZLRHRnUDdv?=
 =?utf-8?B?TUliNUlCT2pQME85RmEvc01STnU1SjVvNFBoRkV5LzVPbFlBd0UzUGxQTXdE?=
 =?utf-8?B?UzZBR29Kdk51UkpDMElIUjlYMzRtVTBEWWt5RmRGdCs2UG9SSjlmRVZzOHkv?=
 =?utf-8?B?bm54b1lkQ3NLQy9RSVFIK3RaeS84SFRMb1lFWkljUWxTZTdJcy9BNnd3UGJT?=
 =?utf-8?B?UUIrZkp3TXU5V1NTUjNFZ1lhc1hpNEQ3L0JsUUcxOU5QNTNpcFhSTURwNXZ0?=
 =?utf-8?B?SGdzNEVqZHhtdTR5Wkl6REhMWStsQ3JBODF2dUpzcFJDSE5rNm9FcVRrQzlR?=
 =?utf-8?B?Uyt5d0tJamZBc1hmT3hwcXFOQTcyTDIyM3E0eUJPK2FieDFFR0dBY2tBRmVh?=
 =?utf-8?B?Q1hFYTgxMDJmTFArQlowSWZQQzlBdm1LTTNSYmlWMm52OEdMek9sWkQrR2d6?=
 =?utf-8?B?bVNtTTVaNGtqRCtqRU8zanhyekwxZEQrVUh5aWhjSUk4VlJuOGYvN0tTU2Rn?=
 =?utf-8?B?dUhDd2tKblNucGc5MFdHcURJRXJlYWdnOUtVcUNSbWFRZy9zdXRYdUFManFz?=
 =?utf-8?B?SjQ5VVNJVWlxV1hZYWJPUnVqY1dta2c4ZEFhenhNbTlkSkM1Uk5oK2k2M2lQ?=
 =?utf-8?B?aHYwcUdyQ2M4SUVURDhpZ1VFZEFsMTYyTHl4d1hiU2VzalZVb2FkdXhHYmFz?=
 =?utf-8?B?d2FBVVdGaUpQV1VQaVRMcDdZeEZHTmlpblU3Wk0yc2VMelpaUnhXdz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <67F02530DE1F684C8046D9C07140B8EB@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB4791.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3061f5de-5649-424c-8633-08da4e6d69ec
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jun 2022 01:21:46.1544
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: r1BNg/VOAlvcVGM6u7jMWhqUS7gLJ6gbmQjf3vLNpPsfWylsC5X6sxH8Gy6EcfVKgKVSYxXQI5iKipkfBiPYRA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR12MB5228
X-Spam-Status: No, score=-3.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

SGkgR3JlZywNCg0KVGhpbmggTmd1eWVuIHdyb3RlOg0KPiBTeW5vcHN5cyBJUCBEV0NfdXNiMzIg
YW5kIERXQ191c2IzMSB2ZXJzaW9uIDEuOTBhIGFuZCBhYm92ZSBkZXByZWNhdGVkDQo+IEdDVEwu
Q09SRVNPRlRSRVNFVC4gVGhlIERSRCBtb2RlIHN3aXRjaGluZyBmbG93IGlzIHVwZGF0ZWQgdG8g
cmVtb3ZlIHRoZQ0KPiBHQ1RMIHNvZnQgcmVzZXQuIEFkZCB2ZXJzaW9uIGNoZWNrcyB0byBwcmV2
ZW50IHVzaW5nIGRlcHJlY2F0ZWQgc2V0dGluZw0KPiBpbiBtb2RlIHN3aXRjaGluZyBmbG93Lg0K
PiANCj4gU2lnbmVkLW9mZi1ieTogVGhpbmggTmd1eWVuIDxUaGluaC5OZ3V5ZW5Ac3lub3BzeXMu
Y29tPg0KPiAtLS0NCj4gIGRyaXZlcnMvdXNiL2R3YzMvY29yZS5jIHwgMyArKy0NCj4gIDEgZmls
ZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkNCj4gDQo+IGRpZmYgLS1n
aXQgYS9kcml2ZXJzL3VzYi9kd2MzL2NvcmUuYyBiL2RyaXZlcnMvdXNiL2R3YzMvY29yZS5jDQo+
IGluZGV4IGUwMjdjMDQyMGRjMy4uNmI1ZjZkMGViMWRkIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJz
L3VzYi9kd2MzL2NvcmUuYw0KPiArKysgYi9kcml2ZXJzL3VzYi9kd2MzL2NvcmUuYw0KPiBAQCAt
MTU5LDcgKzE1OSw4IEBAIHN0YXRpYyB2b2lkIF9fZHdjM19zZXRfbW9kZShzdHJ1Y3Qgd29ya19z
dHJ1Y3QgKndvcmspDQo+ICAJfQ0KPiAgDQo+ICAJLyogRm9yIERSRCBob3N0IG9yIGRldmljZSBt
b2RlIG9ubHkgKi8NCj4gLQlpZiAoZHdjLT5kZXNpcmVkX2RyX3JvbGUgIT0gRFdDM19HQ1RMX1BS
VENBUF9PVEcpIHsNCj4gKwlpZiAoKERXQzNfSVBfSVMoRFdDMykgfHwgRFdDM19WRVJfSVNfUFJJ
T1IoRFdDMzEsIDE5MEEpKSAmJg0KPiArCSAgICBkd2MtPmRlc2lyZWRfZHJfcm9sZSAhPSBEV0Mz
X0dDVExfUFJUQ0FQX09URykgew0KPiAgCQlyZWcgPSBkd2MzX3JlYWRsKGR3Yy0+cmVncywgRFdD
M19HQ1RMKTsNCj4gIAkJcmVnIHw9IERXQzNfR0NUTF9DT1JFU09GVFJFU0VUOw0KPiAgCQlkd2Mz
X3dyaXRlbChkd2MtPnJlZ3MsIERXQzNfR0NUTCwgcmVnKTsNCj4gDQo+IGJhc2UtY29tbWl0OiA5
N2ZhNTg4N2NmMjgzYmI3NWZmZmY1ZjZiMmMwZTcxNzk0YzAyNDAwDQoNCkp1c3QgY2hlY2tpbmcg
dG8gc2VlIGlmIHdlIG1pc3NlZCB0aGlzIHBhdGNoLiBJZiBpdCBuZWVkcyBtb3JlIHJldmlldywN
CnRoZW4gd2UgY2FuIGxlYXZlIGl0IGJlLg0KDQpUaGFua3MsDQpUaGluaA0K
