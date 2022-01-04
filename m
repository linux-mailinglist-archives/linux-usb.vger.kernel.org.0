Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A06E0483CCC
	for <lists+linux-usb@lfdr.de>; Tue,  4 Jan 2022 08:31:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233592AbiADHbo (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 4 Jan 2022 02:31:44 -0500
Received: from smtprelay-out1.synopsys.com ([149.117.87.133]:34868 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233493AbiADHb0 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 4 Jan 2022 02:31:26 -0500
Received: from mailhost.synopsys.com (badc-mailhost1.synopsys.com [10.192.0.17])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 5484FC569E;
        Tue,  4 Jan 2022 07:31:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1641281485; bh=3E0SrKCrAbpNkPMuA1C1Db//9L3UzoTXAKOgjIAI/ME=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=bOjadZIbsEFwW7ds6VDNN9gTsQVNJweddTRe1F3nsYekwkU01iLYtRZ5vEZ8i0Ir5
         0FRJbt0O+EcokKEtyXLA9AomLCxrXq9dK1RQrqcwSVlM58tjn2mdc7YOxMvQ0bo1d7
         63u7LWN8IVyyx40599hZp1woq67hrnJLoSNzEU9C0ojhct0UODegYIbjp75mNLx0Ke
         OpeWbK2UYcc1OJ6HSpblM+STl9rno3zdloe6zrC7NDe4G+wcA0hPXynYMxa6K5atl4
         uJmgygY8Hrx34finbq3Yw7p/gG9diLugdIwhaeLUsQfge2W40OsqXOjwueL9i76uwS
         3XdKuHfPi4HFw==
Received: from o365relay-in.synopsys.com (sv2-o365relay1.synopsys.com [10.202.1.137])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (verified OK))
        by mailhost.synopsys.com (Postfix) with ESMTPS id ACE6EA0071;
        Tue,  4 Jan 2022 07:31:24 +0000 (UTC)
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2104.outbound.protection.outlook.com [104.47.55.104])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
        by o365relay-in.synopsys.com (Postfix) with ESMTPS id ADE9D40096;
        Tue,  4 Jan 2022 07:31:23 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=hminas@synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
        dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="ddxs1YER";
        dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fcpDfOfm6wremIdlE/8SnBf8sVFHYIniu4l3W6/jHxaT2aSkb+ik+eyINDJL3qwpajJAvmMSudqeT6gaSayHYTMGA2qyHR0rZRlWN3cOrfJULyQ0bSE/QMVt4VyMfwPjzIvgpfIXvGOM7iU8nNjmxaCdbCGw9fKQYEtDJxZQUqIe265x2J7G1QgBjs4X9/0G2Edd4Qr4HfFCBNFj+0/2i7Y6DnTTI1QIE3rUPm7e+YlsQbOb6VwTdu4gUgVFEjvdFUJT9Ya1hF4bZm7w3soWrp+2V1RKKCCZip5vBTfppnBuhZY4+IyDPIamiuvVD+jJOwkYE8HBCBj1FnILJGf9kA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3E0SrKCrAbpNkPMuA1C1Db//9L3UzoTXAKOgjIAI/ME=;
 b=C8ArTL5El+3zFOfE9v5WBnq25yvvVKqs8al4vUElze3dxvel93aX01aJOgnuiJRyN5JkZco/rCN4BXkNrV60KvTxtyK7LfI4BzGmAjbXrb8fgts7/0Q0XFUMkEjdwd3MFmT3GRqQVe8Okr0MkfaZxD54nyWIlQD/FWNoFA7dTzd34V2wsJW/gfMD4ExRjyiW3Fs5dVRR+nOW7bcmzjXduhZWkTCJMjjfIUzjCD2nRBf4ECyT5SZNzwAcJcNIxGvBIQFtbITC2jVfLkLv4BPnUMYt8vMFLqPb+th/xufnPsvQ+TC7duB0QgGBNBZlhpvsY0gKKlLB8o4qrxDW8GWaJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3E0SrKCrAbpNkPMuA1C1Db//9L3UzoTXAKOgjIAI/ME=;
 b=ddxs1YER/J8l4AbmeV/uUiqWgFjiKmtVYLUjJOmKzwMinuH/dMEwE+Peoxnx02tUqvRMAEZAK13ZNSbLp11Udl0Hfbxy46j/g6NLgJyn1eVqtFQZwxa9vvqpDOE4k5Oi7mCMcXBQbz5tav5kV2k0zUxoqFN+ZXx2idEVZr7KCvU=
Received: from CY4PR12MB1176.namprd12.prod.outlook.com (2603:10b6:903:38::16)
 by CY4PR12MB1544.namprd12.prod.outlook.com (2603:10b6:910:9::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4844.15; Tue, 4 Jan
 2022 07:31:21 +0000
Received: from CY4PR12MB1176.namprd12.prod.outlook.com
 ([fe80::e969:768a:bcd2:dcc2]) by CY4PR12MB1176.namprd12.prod.outlook.com
 ([fe80::e969:768a:bcd2:dcc2%9]) with mapi id 15.20.4844.016; Tue, 4 Jan 2022
 07:31:20 +0000
X-SNPS-Relay: synopsys.com
From:   Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>
To:     Dinh Nguyen <dinguyen@kernel.org>,
        Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>
CC:     Artur Petrosyan <Arthur.Petrosyan@synopsys.com>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: [PATCH] usb: dwc2: do not gate off the hardware if it does not
 support clock gating
Thread-Topic: [PATCH] usb: dwc2: do not gate off the hardware if it does not
 support clock gating
Thread-Index: AQHYARICEIcQGSNhjkKC8+XCWGkQmKxSd/sA
Date:   Tue, 4 Jan 2022 07:31:19 +0000
Message-ID: <7aaa0e93-9c6f-d4e5-1ceb-68a08081a8cf@synopsys.com>
References: <20220104022238.725195-1-dinguyen@kernel.org>
In-Reply-To: <20220104022238.725195-1-dinguyen@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=synopsys.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d1ee1573-02d7-46b8-4e48-08d9cf5433f0
x-ms-traffictypediagnostic: CY4PR12MB1544:EE_
x-microsoft-antispam-prvs: <CY4PR12MB1544CF4049A33392D83FD061A74A9@CY4PR12MB1544.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:619;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: rgIDRnQCJCatb1PpFfi607E35ZpRsHFpMx7p3H9OqeERkD0Bavxim7Y9iNDja6F0wHW0wf7wHtGgyZu3I7RJMxSJpneo6tEMwsJT9TFTUHJgMkA7aBHaoDRI5RndabQSLb2FQ9BfsGOMkOAqCRv69ri8EoG15XL95pALJQXx6moQAvvCqt3d7+pvBpiwzuiJOUulo2BWvHqwZfHyTvaUIcAQIjcQss6G4z/NVe9l1AEADiPKx5CPXwvcOCg/wb1g6Ml5kBYEmf3WQfqYZLn+fVCMNB4/xeqrYt4pnm70ofNu0wDDCTZE3U5NfDM7PUUd2tWUlxieVv3XGoOn/0t4I8Pem5OGo/e+0DYEqK9X9PjKVxNhFrZ+zKRYBA3oxH+FR59ybTI2818PbKW4bNibXd0lDOwTesXXwd643ze6vNjjBGY8aKMzSJzkarKqm3iWVSWSknoAvx5iB0T45k+Uy25PDVAQ6+HqTNkfbo/+Pp2P1Oc+qY/AX/dULK3f1EaKpAfAuzP8vJfUdt+mve4iG06fbfvQgnoT0yeLcr9jb5Hvvu1MjGsQd4qktxXChT98iePWkeoknCafGJjF3hJwvZHx2OfMSn0Vhhy5hRlU4zTNe/IXJE84n41XHvn3rQHF7l9eyAdO8WcPGtxbw0PEzEkufU8H1FNpXIMryXu9GbIs1qLpvfaBVrSdwxZ5Wzo0drR73DoSxzDILxvXrt0JI4h1xZBhj8BeDbmF7g2J6CgaUFQcfYWgs6jKrwkNtbBREMj91OzoOa0vm8GDm1Jftw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY4PR12MB1176.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(91956017)(71200400001)(66556008)(6506007)(8936002)(38070700005)(54906003)(508600001)(8676002)(4326008)(316002)(76116006)(2906002)(6486002)(110136005)(66476007)(38100700002)(53546011)(66946007)(122000001)(64756008)(66446008)(83380400001)(31686004)(26005)(6512007)(31696002)(5660300002)(36756003)(86362001)(2616005)(186003)(43740500002)(45980500001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RDFCRkF3TTdTZmM4ZlhudFpmWlYwRVVoT2hTVzJ5bXFJRDZKc1g3dUx3ZE5X?=
 =?utf-8?B?dnMvR1RWM05iQkRmRGFvOWF0TVJCQUZQMjNvZERxSVl5YkM2QTFoS29nU1NI?=
 =?utf-8?B?WFQ3em4zYmhBYmN0ZXVZZlpOWHFvVUdFOUlXUHBTY0tqNVlJS2xGVTV4Z0Fa?=
 =?utf-8?B?b0cvTGtEblJmYTZHeUh3UlQzcUZXUzJIeFIwSkJ2dDREa0MrRTdLNmloTW9T?=
 =?utf-8?B?SFZhM1gvb0Vob2Y5V0hMT3hzVnFVREwzSi9waWcrc013Zk16OFh5K0I1NHl3?=
 =?utf-8?B?aWFjY1VtcWJ4STFDWDVUTjZEOVAxd09pZkZaQWh5SjNoRGlwS2swWkw0c3dL?=
 =?utf-8?B?QVZBQkQyTjA3UnpIUXZ1T0RrSExJdFc0U0ZtSjg4MHlBeFpjZWxQaXNGUml5?=
 =?utf-8?B?ZVpDUksvTTV3aUhUK3RkRG5YSkh4WXYreEtBeXhiUTNiZHRrSU0vNlEweVpX?=
 =?utf-8?B?bW0zRTFvOXFCVG53cVBERlJ4dnZDdXdPOW5aL0Y3VUdrUWhaaXVhbGtDTHZz?=
 =?utf-8?B?TEN6NWpiZy9iUXY1aXpNbmNEOGZaSDlKMW9NZCtJZDRuV29Vbk0rWlhLMVpE?=
 =?utf-8?B?S2wvWFk4dlh2ZSs3ZGpNSWt0akZBVjIxbEdJVzlzQUNqN0FvSnROTndoUnBE?=
 =?utf-8?B?ZEpBbHdaMXdzZ0hZbGZHTG9xMHcwYy8wQWd4KzN0N2NPTHdkZ0RHZ0pXZXpM?=
 =?utf-8?B?eWlMbElsZ3p1aHZMRDJpSEN5SzZ2MTN3UmlDQ2hHZUhoNzlheVNFMnBwT2ww?=
 =?utf-8?B?YUN4VUFXK1FCMVJzSEFxMEtuRGJoRDQ2QlZzVWxzcy91K0ZhL0FBVEt6RndR?=
 =?utf-8?B?QVZiL1hoWHlEc2wyZklaVXFnQXpSQ2tlL0x5cVI2bDB5NWxoWkhId2lmNUVk?=
 =?utf-8?B?b3Y0NERYVUp1aFVkNCtsakdqemVZTjJQUEtVTkE3dFhTUUtmTXJmQjB1RGhq?=
 =?utf-8?B?RHEwckFweEExNlhxaGp6T2VKK1N6cGFDSUo1dlZIOVJHaVhTYUYrVDlKS2s5?=
 =?utf-8?B?NG5PZDNvNVNPYTlqUTdLVkMrTHY0d3EyZ1pSeXFuOUlUb1h0bFRkeFQyTit4?=
 =?utf-8?B?dENqNGQrZlFFcm9yWFlTdlRrazFLbFIrc0drQ3BST2h4QWpOQkk4ZFhqV1Qr?=
 =?utf-8?B?NC9FSFR1MjRjekUveVAzaWRCK0diODF6NWZTVTUzWTV3UGxrTVhNNDBEVjd4?=
 =?utf-8?B?VnJ6YnhSaS8reFlPWWJ0RVpDQ3JmZlZEeTBDaC9EbzllYks5c01zWjFFVG5n?=
 =?utf-8?B?MFhSV2orODg1ZXMxK1ZuK05JM2VxMnA1dFNKVkZYbE5mWk1Ga2pmZFlPV0Rz?=
 =?utf-8?B?RjRTMmxOQ0hkTkI5MzQvNXg5SmpQdGFFbTBJVHRjOWtGUzBzUlJpcHE2aWVy?=
 =?utf-8?B?czBYSUwza3lPVWZ2NUxyQzNSV3BZYS90bnk3bm5EcUNzMjlZRWQ5Rkc1VEcy?=
 =?utf-8?B?SU1sSU9uT1pyczdqMkYzazB0Q2IrVDcvdXk5Yk5FN0FrSnR3VmlId244WHpK?=
 =?utf-8?B?bzJHNjUvZ2hYNWtPWmR6cktHekk1TTFqN2tRRlVzbFMza1NJZGRSNmMvZDI4?=
 =?utf-8?B?S0d3M3JTOHBLUTE4Sm1uUUE0MUFaM01tS2pMRU1Senh6OUlvOFdjSVgwdWdQ?=
 =?utf-8?B?bEpyd1VmR3NYdmMra3N5aEZBRHpQbi9WaVFiamhrWFc1MmF6c3VyRUl2eHQ4?=
 =?utf-8?B?NFprTmhMZ2VUTUVkYnl6a3lIdWlKTC90MDlxaGQwbXZ5K0JNWlBUZjMzUE1L?=
 =?utf-8?B?cUpIdUt2N2dtTjBFeHM0WXc3VmI5UVVZb2U5djdHTk1qUG1CSWxULzNWaHY3?=
 =?utf-8?B?NUVXcEtmeVFhOFRKNDl4QnJ1RlpmZHE1dXE3NUxzQTg0KzVaazFITjV0c2ZE?=
 =?utf-8?B?VWVxQnBZbmZBcCtvWldHb3h3blJaMTV5cjI5Q1JwQXdzeWxNRGMvUU5heEg2?=
 =?utf-8?B?Q2hNRVFIMjdSdFRoYTYvcjZyaFVNWWR2TTMxM1NqNUx3eXo5elpWejNsRnh4?=
 =?utf-8?B?WitKZ2JTSzNpTHp0R1RwSyt0K3RiR2RIeTRJQnQ4NzJ5RENIWm50am5JcDJx?=
 =?utf-8?B?bGdTZjliVVhHWEpNQ3FKQTYvL0JkcnlkSjQ3eEk0Y2swMldNUldKekJMT2Nm?=
 =?utf-8?B?U2NCcmdUakFCb0hBTEVFRU9nVHdpRE1CanFVdWpLRUxTalFYSW1sd3Iwdlor?=
 =?utf-8?B?Z2c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <4AE95E691ED1004CAB2BA33960D2EEB2@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY4PR12MB1176.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d1ee1573-02d7-46b8-4e48-08d9cf5433f0
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Jan 2022 07:31:19.4679
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OBpViQWsJksuk2OJenLAzKMYvMvPZrWeOSzvE20BK7+IKTAtyRnBVybSgwCixrEy+5I2uNMl+ajsIHlmbeZ6cQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR12MB1544
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

T24gMS80LzIwMjIgNjoyMiBBTSwgRGluaCBOZ3V5ZW4gd3JvdGU6DQo+IFdlIHNob3VsZCBub3Qg
YmUgY2xlYXJpbmcgdGhlIEhDRF9GTEFHX0hXX0FDQ0VTU0lCTEUgYml0IGlmIHRoZSBoYXJkd2Fy
ZQ0KPiBkb2VzIG5vdCBzdXBwb3J0IGNsb2NrIGdhdGluZy4NCj4gDQo+IEZpeGVzOiA1MGZiMGMx
MjhiNmUgKCJ1c2I6IGR3YzI6IEFkZCBjbG9jayBnYXRpbmcgZW50ZXJpbmcgZmxvdyBieQ0KPiBz
eXN0ZW0gc3VzcGVuZCIpDQo+IFNpZ25lZC1vZmYtYnk6IERpbmggTmd1eWVuIDxkaW5ndXllbkBr
ZXJuZWwub3JnPg0KDQoNCkFja2VkLWJ5OiBNaW5hcyBIYXJ1dHl1bnlhbiA8TWluYXMuSGFydXR5
dW55YW5Ac3lub3BzeXMuY29tPg0KDQo+IC0tLQ0KPiAgIGRyaXZlcnMvdXNiL2R3YzIvaGNkLmMg
fCA3ICsrKystLS0NCj4gICAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCAzIGRlbGV0
aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvdXNiL2R3YzIvaGNkLmMgYi9kcml2
ZXJzL3VzYi9kd2MyL2hjZC5jDQo+IGluZGV4IDEzYzc3OWEyOGU5NC4uZjYzYTI3ZDExZmFjIDEw
MDY0NA0KPiAtLS0gYS9kcml2ZXJzL3VzYi9kd2MyL2hjZC5jDQo+ICsrKyBiL2RyaXZlcnMvdXNi
L2R3YzIvaGNkLmMNCj4gQEAgLTQzOTksMTEgKzQzOTksMTIgQEAgc3RhdGljIGludCBfZHdjMl9o
Y2Rfc3VzcGVuZChzdHJ1Y3QgdXNiX2hjZCAqaGNkKQ0KPiAgIAkJICogSWYgbm90IGhpYmVybmF0
aW9uIG5vciBwYXJ0aWFsIHBvd2VyIGRvd24gYXJlIHN1cHBvcnRlZCwNCj4gICAJCSAqIGNsb2Nr
IGdhdGluZyBpcyB1c2VkIHRvIHNhdmUgcG93ZXIuDQo+ICAgCQkgKi8NCj4gLQkJaWYgKCFoc290
Zy0+cGFyYW1zLm5vX2Nsb2NrX2dhdGluZykNCj4gKwkJaWYgKCFoc290Zy0+cGFyYW1zLm5vX2Ns
b2NrX2dhdGluZykgew0KPiAgIAkJCWR3YzJfaG9zdF9lbnRlcl9jbG9ja19nYXRpbmcoaHNvdGcp
Ow0KPiAgIA0KPiAtCQkvKiBBZnRlciBlbnRlcmluZyBzdXNwZW5kLCBoYXJkd2FyZSBpcyBub3Qg
YWNjZXNzaWJsZSAqLw0KPiAtCQljbGVhcl9iaXQoSENEX0ZMQUdfSFdfQUNDRVNTSUJMRSwgJmhj
ZC0+ZmxhZ3MpOw0KPiArCQkJLyogQWZ0ZXIgZW50ZXJpbmcgc3VzcGVuZCwgaGFyZHdhcmUgaXMg
bm90IGFjY2Vzc2libGUgKi8NCj4gKwkJCWNsZWFyX2JpdChIQ0RfRkxBR19IV19BQ0NFU1NJQkxF
LCAmaGNkLT5mbGFncyk7DQo+ICsJCX0NCj4gICAJCWJyZWFrOw0KPiAgIAlkZWZhdWx0Og0KPiAg
IAkJZ290byBza2lwX3Bvd2VyX3NhdmluZzsNCg0K
