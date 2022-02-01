Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CE8734A561A
	for <lists+linux-usb@lfdr.de>; Tue,  1 Feb 2022 06:15:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233583AbiBAFP6 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 1 Feb 2022 00:15:58 -0500
Received: from smtprelay-out1.synopsys.com ([149.117.73.133]:45200 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231557AbiBAFP5 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 1 Feb 2022 00:15:57 -0500
Received: from mailhost.synopsys.com (badc-mailhost4.synopsys.com [10.192.0.82])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id A2370407BC;
        Tue,  1 Feb 2022 05:15:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1643692557; bh=dS2l17hVaXu+erixp6SE0hQY/yZQ9rY2veVdjKZ42bo=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=eZhKNDxdgJ913CYAViXErWYBHrYFu0odJE+svbF5+LxkXMN9BZVX43ZsxxcFLwJqT
         BkS+DwvtT/5P8qV8hRtEFvlUFRr6Du8/hnXGe/uB31OpFJVv8TqVu8vt7lSH4TcXYL
         cKUQwU9eB0rPrKU2kyXT59eVOBH9ZTkqOUdxu0KkoPmDnqNa5TlKppcD6lqKBmmqlN
         xGAzaSx7IfsOEJDdQ7DAO3QWBBTLaR/1oM+gnuFA0qGw4cboAtqHVWbS2TXJJZcQMU
         wQ0agEdi44koOdhK8PfsLlNlbW6CRm2TRhttvSTssgAyx0Et7ROKKnk+72J6WA3ywY
         piWmTcUkMJx/Q==
Received: from o365relay-in.synopsys.com (us03-o365relay1.synopsys.com [10.4.161.137])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (verified OK))
        by mailhost.synopsys.com (Postfix) with ESMTPS id E7455A005C;
        Tue,  1 Feb 2022 05:15:56 +0000 (UTC)
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2104.outbound.protection.outlook.com [104.47.55.104])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
        by o365relay-in.synopsys.com (Postfix) with ESMTPS id B1DA481011;
        Tue,  1 Feb 2022 05:15:55 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=hminas@synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
        dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="wLDY2nxV";
        dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lxCCvrbQou1yxaTmjw5KZfmg5eY8Zr0CBCJUaGC4bTwhyh9ubRW7B2XpDUQapmerravYtIN1lvfe4MMUrj/pqfTZR6ry5VsAhDoxQNz2nVA1g5gQuG1TP9fh3e50dX+9RV7RIS6qtoz5Tn1Ihrnksr6eOdnZLuFfmvQMfx5vx8IYpa01762N3EestsKOnJWbDLnNrgUivX3QS0fD+0whM3eikG6YU6mRxo/Jhbvb8PLBgr5Rlh5IhvKbPh8k1CsBn0zDWvmQj7iS3Z1AtTeEtLxYryHxEf4jDF8jGQn2FspFslvSdEgEW9ykuyJm8VoZM8sItyRqjOnwd4/6VkV7zQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dS2l17hVaXu+erixp6SE0hQY/yZQ9rY2veVdjKZ42bo=;
 b=jF2PjrH8zZVY+U58bJKj33JXOd11IytIZWYdJHA4RYpQ9doTLqVwFISYHYwBHPIgl/QH5JLUPzLpD5DaoJ+8Hn6w4f9OazMBJlv68PQx6lpLGI/gEiwLa//dt4TnoIcaA94raBc+MGwLFU9hxSuwF1k9rPeznoEsiOwWSqAJnGfMXS7sV8jPHP73wrd7cdqqgAnewI0RtoKHgGan9djGJcw9vxtsAeVZtEozRK2W9uMp/a5tVuEmfWoQCS61fp8i32ftZO/PpRKCTuzH2yEVBrP/RZCYszqJLOdTA0lOae4gosazVIz0SV6WSuIkjA4rmzLEsEJKR8HEzxp5w0X/Zg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dS2l17hVaXu+erixp6SE0hQY/yZQ9rY2veVdjKZ42bo=;
 b=wLDY2nxVbKrF5NBksTpqeGkDcAIk6o5VQ5bzxqz+DhD6YqTRa8BHdy4NTXJKApdpjT9zqJHWCBdeIHj5TxhMPnD1q/OIbrI9Axf8baFIXCvm/tU/otoAiisXjVKc+Xo6AXl0PAIkK3hrBwmVLuY+zAAV1I4KKl41G3Yiye8lbYg=
Received: from BYAPR12MB3399.namprd12.prod.outlook.com (2603:10b6:a03:ad::22)
 by MN2PR12MB3199.namprd12.prod.outlook.com (2603:10b6:208:ae::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.15; Tue, 1 Feb
 2022 05:15:52 +0000
Received: from BYAPR12MB3399.namprd12.prod.outlook.com
 ([fe80::7cb4:759c:b286:34db]) by BYAPR12MB3399.namprd12.prod.outlook.com
 ([fe80::7cb4:759c:b286:34db%5]) with mapi id 15.20.4930.022; Tue, 1 Feb 2022
 05:15:52 +0000
X-SNPS-Relay: synopsys.com
From:   Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>
To:     Dinh Nguyen <dinguyen@kernel.org>
CC:     "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Subject: Re: [PATCH 2/3] usb: dwc2: Add platform specific data for Intel's
 Agilex
Thread-Topic: [PATCH 2/3] usb: dwc2: Add platform specific data for Intel's
 Agilex
Thread-Index: AQHYEgc1Jeaj5XZW3Ey2ycBL13UGQKx+MX8A
Date:   Tue, 1 Feb 2022 05:15:52 +0000
Message-ID: <e132152f-f8f1-b458-cca9-fb1fa0d60bbb@synopsys.com>
References: <20220125161821.1951906-1-dinguyen@kernel.org>
 <20220125161821.1951906-2-dinguyen@kernel.org>
In-Reply-To: <20220125161821.1951906-2-dinguyen@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=synopsys.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 01267f3d-f695-475b-a32b-08d9e541eaaa
x-ms-traffictypediagnostic: MN2PR12MB3199:EE_
x-microsoft-antispam-prvs: <MN2PR12MB31998BD153003540A90FEA63A7269@MN2PR12MB3199.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:517;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: jm+c3ujUuTpeRKEkwV7jbrUueh4kH+02PYxvnLOC9oInu2RSbLV2cLgmC4kuhnxd79LUOHnps+oClaUkgQEy0ADcJ50ZaM3iLLaJez9jDdOuOuL4laGhn+HVnyaqoXzaxsmmBOdplYzu6TOVOZBz+BVmZzZ37TohHmeu/DgNv9cfHkLw4icv8HCYRCX6M+20ZBc8N9KKqJlIjUvqIaLoS3a3on3zA2L+VTaoTwktDJsC14SUYeAZRuG91HokL/Fl4NzeW4BSez/0EZxaF9tuHF1PI4w6cWlbeUwIzE6P03mSfT8kVanVIslJlgKo3iLgt1kBfwCFbb58PMebkcIywDW3zh2RaG94UjqoTWQJpfTAbiE/oSS/obISm4C/Dg3b5/vgpD4UwTAoGqazcgHb4a4zlzBtXQV1JhIAgBfFFYR2+le1MjMnetWzHggYfLMmu0tHB6SdkQBVfbYfxlPA8J/djDOJcbeZl9Du4D3b2stc9BKiMrFStvzsqoeONX25hZdJoWBhI4+38oR1GytafaL+czK3qLkvPLRu4XRY3sYTdN03VMShGqbJRdUdEpWcdxGFO8jtMea1lzeEnLLvNmBys2TI4xKK5uS2Q+5Yo+rB08Ef+Pr3abYWG4ViH5MrwRTDoW1HG/gzxgsDuuVwaqC6Es2xdt3xRQb6ATCOwuW+LcaiycID9ibeEiG6aL5irO0hijSr/fRa6f9APgzWCZ+sWjRSweNoXRgi420VY0b1IdHd5FwG0H+ecunqkLG29mtMFT6Fw8jPgVzi2QK9Pg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB3399.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(86362001)(66556008)(8676002)(8936002)(2906002)(4326008)(31696002)(66946007)(38100700002)(66476007)(64756008)(122000001)(38070700005)(66446008)(83380400001)(91956017)(76116006)(6916009)(6512007)(54906003)(6506007)(53546011)(6486002)(508600001)(36756003)(186003)(5660300002)(26005)(71200400001)(31686004)(316002)(2616005)(43740500002)(45980500001)(20210929001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TS8xVDkzVFRXRDdKTEJVTm9TL0RRa2JKd2t6RUs5SllVemlqTFptYjM2RXha?=
 =?utf-8?B?RHB2UWhFZlFPYndPRTJDMmpiSkpVcitQV1czNTNKMHQ4SVk4ckJZamRJL2Yy?=
 =?utf-8?B?VG9zRXExWUFhcVNHcTdJV0FkdEs5RWluVmp4UGdoK1JSd3kyS3VSNHFUbzFl?=
 =?utf-8?B?dzRXai9sQ0gwV0JXTDIvdW1HT1JlYUlpRUovczZ4Qkx3RXRDMHQ4MjZxdWZM?=
 =?utf-8?B?dFpWbCtwMWZJd0NyZUlIM2Ird2Vkbk83Qm5oZU5WeEtoYThpUGRBVFJ0RDVX?=
 =?utf-8?B?WGExV2N6bk92V2dnaktBMGdhOVA0MGZMT0d3L2dxUndPVG1KT2NNTWJjNE05?=
 =?utf-8?B?c0ZOYWlrbGxTZGhKS3dsNER1NEQ0NG1uYWRoZlBrNVZEV0FlS2Evbm9JcEYr?=
 =?utf-8?B?K1dzVDNEZWtTRDROQXlLRUgwdzMyMDk2bE93Ym5Cci9CTlhZdG5rcnJKajBU?=
 =?utf-8?B?NFVjWjFZN3h6V1lFdFJNWHNjVmNMNnZrUjkyWlorU2Y4SXNhZ3dTZGczWGJI?=
 =?utf-8?B?ZTJrTUxTTG83dW5GOUF4VDNIdnB4SWF0RXdwcnFwOFgyWmVjV0JNODdXa1J6?=
 =?utf-8?B?U3RnRTVzTE5uY3JzZTJqVWx2VUI3M1hYRy83ZzNneWJ6RkJRNzZUTDBORlo5?=
 =?utf-8?B?bVlzeGd3Q3lSV2NSWVluanBzZjI4L211eDMyRGIrNkx6K2R0YlI3WDJnZXRk?=
 =?utf-8?B?Y0FpSzh6NXVkMU13MnBDTjZxOFAzRWpla0JkVG5GbkNJblJ0ZnYzNkJFYXpq?=
 =?utf-8?B?d0JKa3VFUko2c0ZTWklzRm5QWWpibHp6eVhtaVkza1ozQ29Gd3FYNHRoMm5Q?=
 =?utf-8?B?M0NtSTlVT3lYU2J6TVZTSGlJaWEzYTE5U3ZuQWFpTUUwYTVDcENpYk92cE5P?=
 =?utf-8?B?WDBNMG5LVmQvc0ZRN3EzZ0s1OW96QU5ETFNhYVJzc2U1U00vdG1IaUo5eGFT?=
 =?utf-8?B?T25ZQ1IyRk9tWjhMSDdUZmhYRTFwRURVNVdWSXhXU256SDdJTzRNbHhZRVVS?=
 =?utf-8?B?Q0p6Y0todVlZbm1ZOThPQVRGUTAvZ2EvUjN1a3BpdHQ0TjJYYy9xdTJ3WG9h?=
 =?utf-8?B?emFHM055QnlPdXhhS0s5ZWRrcW9XL2JMU3lwbkdLYTM0a0NJY2tCbDRhYW5D?=
 =?utf-8?B?Z2Nkc0RLYTRmeFhZcEJsNzdFS3pKRVZKaEtzckhuZEVlT1huSkxsSy9CLzY5?=
 =?utf-8?B?ZVBRRHBCNm1tMDkxZDBQMm8rWnNhMnRpZWpmRDNQZVVZM2N3U3ZRcm9uZGFM?=
 =?utf-8?B?dW4vN1FoVXdTaGt0RTE2ME5aSG1CRjlWQ1VQS2N2T2hVaktVc2NOUU5HdFJk?=
 =?utf-8?B?V3cwblRrYnZGeGRsbmhPeGwrVjJOb2V6Qk5FejV1MGhWbkgrV0pSRExURUpN?=
 =?utf-8?B?TWhLNjRjdUpoOENlZmt6cVVwQThTZWhQWWM2OTcyMEV6ZnFaZ05LbzRkS1JL?=
 =?utf-8?B?am1peDNtdXRjRFFzd011Nkd3NDRlVVZzOGpEZTRsOWNLc3NXOGZYa3g4MHNB?=
 =?utf-8?B?K3VZMWp3dUQyTGpTNTFHZ2ZBNExTc2dkQWlmTlM0N05NdXdzeUVxa0ZDSE9I?=
 =?utf-8?B?TkFXdHl5ZTl5K2JMTm5FdHZlRmhJR1NJV0U0NWxvbExlbUZMQUZJNUZWbjAr?=
 =?utf-8?B?QkNGRFVmVjd4VE4yRXVoSVhoZmJBbFdndUp4SnpkVDhNbEZxYWs4dEI3OWo3?=
 =?utf-8?B?UkQ0ck1NMDJ5ZEF1MUh5SVdOL1BVdzRGbWJ1Y2k4bE1NbXJESG9xUVFXZlVx?=
 =?utf-8?B?NUtQTEFsVjIvNXBpU3dValZtdlhabkVpYlpWMWh3cVl2Nm9xbEVZbVIxcjBD?=
 =?utf-8?B?dFBRaXVuL1RzZFFsanBZbUZNQWp4dkJMUUdQSmw0eTYzcEpZVVg4VCtWcHFT?=
 =?utf-8?B?SzhHQkVqZ3JHcFhEUGFDMEFHMXR0S1htVHVvaElaMExwRnVPckgzKzhYYWFp?=
 =?utf-8?B?dEdBdXFvNENabitFMVQzU0sxd1ozQi9qakIxdEtEek5WUEtlaFE1dGV1eitk?=
 =?utf-8?B?d29RekhUenliRDZXbWNSWEtCK0pXbHBvWHVPRlZ5Y2wzdjczMlBSZVQ0S2Jh?=
 =?utf-8?B?azVsQWtmOUw0OXgrQkNkaFpiWnR2T24zV281WFhZMzRXQWxqeloxUWVoTTJQ?=
 =?utf-8?B?MzNWM3ZNN2NJSFZrVjVra0ptWEFhR2xNcldRUWdkUWYrRlhZVldYeU5WbSt1?=
 =?utf-8?B?cGc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <44A259A2DC80394A8A4587A5EE4177DD@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB3399.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 01267f3d-f695-475b-a32b-08d9e541eaaa
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Feb 2022 05:15:52.0603
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hPPR7SGzv8dxzJ34JzplSK0HXRZVhhmue3uS5QZ9WfdhYyNzv46cj5DxcP9Bb+1QY0jl6aGjIViO+TqCw3UN4g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3199
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

T24gMS8yNS8yMDIyIDg6MTggUE0sIERpbmggTmd1eWVuIHdyb3RlOg0KPiBUaGUgRFdDMiBJUCBv
biB0aGUgQWdpbGV4IHBsYXRmb3JtIGRvZXMgbm90IHN1cHBvcnQgY2xvY2stZ2F0aW5nLg0KPiAN
Cj4gU2lnbmVkLW9mZi1ieTogRGluaCBOZ3V5ZW4gPGRpbmd1eWVuQGtlcm5lbC5vcmc+DQoNCkFj
a2VkLWJ5OiBNaW5hcyBIYXJ1dHl1bnlhbiA8TWluYXMuSGFydXR5dW55YW5Ac3lub3BzeXMuY29t
Pg0KDQo+IC0tLQ0KPiAgIGRyaXZlcnMvdXNiL2R3YzIvcGFyYW1zLmMgfCAxMCArKysrKysrKysr
DQo+ICAgMSBmaWxlIGNoYW5nZWQsIDEwIGluc2VydGlvbnMoKykNCj4gDQo+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL3VzYi9kd2MyL3BhcmFtcy5jIGIvZHJpdmVycy91c2IvZHdjMi9wYXJhbXMuYw0K
PiBpbmRleCBkMzAwYWUzZDkyNzQuLjEzMDZmNGVjNzg4ZCAxMDA2NDQNCj4gLS0tIGEvZHJpdmVy
cy91c2IvZHdjMi9wYXJhbXMuYw0KPiArKysgYi9kcml2ZXJzL3VzYi9kd2MyL3BhcmFtcy5jDQo+
IEBAIC04Miw2ICs4MiwxNCBAQCBzdGF0aWMgdm9pZCBkd2MyX3NldF9zM2M2NDAwX3BhcmFtcyhz
dHJ1Y3QgZHdjMl9oc290ZyAqaHNvdGcpDQo+ICAgCXAtPnBoeV91dG1pX3dpZHRoID0gODsNCj4g
ICB9DQo+ICAgDQo+ICtzdGF0aWMgdm9pZCBkd2MyX3NldF9zb2NmcGdhX2FnaWxleF9wYXJhbXMo
c3RydWN0IGR3YzJfaHNvdGcgKmhzb3RnKQ0KPiArew0KPiArCXN0cnVjdCBkd2MyX2NvcmVfcGFy
YW1zICpwID0gJmhzb3RnLT5wYXJhbXM7DQo+ICsNCj4gKwlwLT5wb3dlcl9kb3duID0gRFdDMl9Q
T1dFUl9ET1dOX1BBUkFNX05PTkU7DQo+ICsJcC0+bm9fY2xvY2tfZ2F0aW5nID0gdHJ1ZTsNCj4g
K30NCj4gKw0KPiAgIHN0YXRpYyB2b2lkIGR3YzJfc2V0X3JrX3BhcmFtcyhzdHJ1Y3QgZHdjMl9o
c290ZyAqaHNvdGcpDQo+ICAgew0KPiAgIAlzdHJ1Y3QgZHdjMl9jb3JlX3BhcmFtcyAqcCA9ICZo
c290Zy0+cGFyYW1zOw0KPiBAQCAtMjM5LDYgKzI0Nyw4IEBAIGNvbnN0IHN0cnVjdCBvZl9kZXZp
Y2VfaWQgZHdjMl9vZl9tYXRjaF90YWJsZVtdID0gew0KPiAgIAkgIC5kYXRhID0gZHdjMl9zZXRf
c3RtMzJtcDE1X2Zzb3RnX3BhcmFtcyB9LA0KPiAgIAl7IC5jb21wYXRpYmxlID0gInN0LHN0bTMy
bXAxNS1oc290ZyIsDQo+ICAgCSAgLmRhdGEgPSBkd2MyX3NldF9zdG0zMm1wMTVfaHNvdGdfcGFy
YW1zIH0sDQo+ICsJeyAuY29tcGF0aWJsZSA9ICJpbnRlbCxzb2NmcGdhLWFnaWxleC1oc290ZyIs
DQo+ICsJICAuZGF0YSA9IGR3YzJfc2V0X3NvY2ZwZ2FfYWdpbGV4X3BhcmFtcyB9LA0KPiAgIAl7
fSwNCj4gICB9Ow0KPiAgIE1PRFVMRV9ERVZJQ0VfVEFCTEUob2YsIGR3YzJfb2ZfbWF0Y2hfdGFi
bGUpOw0KDQo=
