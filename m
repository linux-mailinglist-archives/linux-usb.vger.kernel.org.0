Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 608A3358F03
	for <lists+linux-usb@lfdr.de>; Thu,  8 Apr 2021 23:14:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232332AbhDHVNC (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 8 Apr 2021 17:13:02 -0400
Received: from smtprelay-out1.synopsys.com ([149.117.87.133]:38416 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231862AbhDHVNC (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 8 Apr 2021 17:13:02 -0400
Received: from mailhost.synopsys.com (badc-mailhost2.synopsys.com [10.192.0.18])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 16C6AC009A;
        Thu,  8 Apr 2021 21:12:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1617916370; bh=MRd1yXke9wAWISQS9rhsh+QfK3agCeNj54qSDJ38tr4=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=NM+vnpdM8RLk+dQDbW0dUzZa4Eqajv5rkYik0KVezd1iQoZ67LmNO5HzDMFfOfy0S
         0pk9esOq7o7uqCWMI2AKMJdRi8i6jRq54JHHwvcsoYwSaRx/0/PwaCgZW0xGoYYe4Y
         qALjE6BQVEkHkB4CALkc+AnkC7OTgvP3pBkcum3tBH/N0N9IYYpzxoriDKm3XpDFut
         8PgmJzUsVhP1CVtr/S+JiBIEn+lP9B1GaYMUB/OXX7h+vQLZl9zD5bOlMW+0Xa/Mt6
         fZnv775LuobBbILBOP76D/6snSIPXJWXCZ7rc9Ftw2Clpg7MdjXLMtIUnyM/Mf4u99
         dZ2zJD1s0Y3gA==
Received: from o365relay-in.synopsys.com (sv2-o365relay1.synopsys.com [10.202.1.137])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPS id 81574A0067;
        Thu,  8 Apr 2021 21:12:49 +0000 (UTC)
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2175.outbound.protection.outlook.com [104.47.55.175])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
        by o365relay-in.synopsys.com (Postfix) with ESMTPS id 040B8400C0;
        Thu,  8 Apr 2021 21:12:49 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=thinhn@synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
        dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="qtwH6MtD";
        dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=You+TY7VMppVKYYICM5GQtiP4KBd4r5/u0nVoH8gQ/AlMqaeCRai1rGVsUUjYHdxEa/dJdV/RypeKw67kzfU2v7QGPqoMl7JEs/T2XJz7m5Uh7biioYNRsAsxaKiYxziuDNhQ9TOF19g4q2HuNmHzM4qww8p0/8j2SSQ1tT00BLLxPYlKA8sTzv8QZz3YJR/XH/d7iccJsPUCm3z5PySVbSCVtY8j5/cuC/vH1RjkAn+zaMdFXZ8ODXdr5rVRU8UwUBe5CMXaopnmp8Q+acTzmcwYfkDn9AAtHzyccX0c+8ZCCtvcfZfvZHBg21raj3HWhqbUV2d9EYCAmRqE/y8gQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MRd1yXke9wAWISQS9rhsh+QfK3agCeNj54qSDJ38tr4=;
 b=KoBcr9bGQDuRAOK0IWLgIvUar5xwOg2ro+6LH6QbDMnTQNfwTp15ibpEHzaLQLZqJjYwdRNvqsQ5bWAWSDMq98U2wcVLIMP4VLSNKaAGmIzdMPNykyrX8aT/Wn5rplrozf8OKAO5a8DVtUHrTRUG3NJ2SjVqNCADXQDORa7ru7xaCVW1HMAaCk8twnl6MLrll8BOip3qeNPLCqH6D6vxYTaFT8t+0a/1IY5k4h4M7fZ+FovEqptpL2LFDm7U/FTCxAwTsvNDpWvc6Rqo3Jg8zfcmPP7EaYn9A5SLhlQIRIHZlQKG80HAyygs3PzUpyM5yQLoDGP0W5pes0a+XhwdlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MRd1yXke9wAWISQS9rhsh+QfK3agCeNj54qSDJ38tr4=;
 b=qtwH6MtDfBeEracK2zpTvYk39KUJZftCWvwTg9Re6SwnkvwFz+Xhi84hg1vHp5U1QN1voO6X8U5OdrUqB+QfyzeeCWY1yMvytjm4bgWaL1FAi+CJ/fP0GC6R/5RK2P3N+ZCSE/VaiWozla1Ge1CLadlGaXGQqRaJYrqJHPgc74I=
Received: from BYAPR12MB4791.namprd12.prod.outlook.com (2603:10b6:a03:10a::12)
 by BY5PR12MB3682.namprd12.prod.outlook.com (2603:10b6:a03:195::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.20; Thu, 8 Apr
 2021 21:12:46 +0000
Received: from BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::7c97:6a33:14c4:dd8c]) by BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::7c97:6a33:14c4:dd8c%6]) with mapi id 15.20.4020.018; Thu, 8 Apr 2021
 21:12:46 +0000
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To:     Ferry Toth <fntoth@gmail.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>
CC:     Felipe Balbi <balbi@kernel.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        USB <linux-usb@vger.kernel.org>
Subject: Re: USB network gadget / DWC3 issue
Thread-Topic: USB network gadget / DWC3 issue
Thread-Index: AQHXJWGMSb8EBf7kO0mkR3W2S+2f0qqctZMAgABFgICAABlrAIAEiRiAgAAR4oCAAChFgIAAOFIAgACdRYCAAKT+gIADH/IAgAHHyACAAAP0gIAA3M4AgAIC7oCAAA9XgA==
Date:   Thu, 8 Apr 2021 21:12:45 +0000
Message-ID: <32951a5f-062b-abc9-43a4-0245175423c9@synopsys.com>
References: <CAHp75VeERhaPGAZc0HVs4fcDKXs+THc=_LFq_iEhWAR8vvURjw@mail.gmail.com>
 <87pmzgk44r.fsf@kernel.org> <b4763ebe-c0ff-2d24-5385-1a1587603280@gmail.com>
 <1f8ed83c-b2e5-327c-30da-56865e2b956b@gmail.com>
 <fd8d9a8a-8f57-6559-2053-4607b9da13ab@gmail.com>
 <797f97b8-6558-35c4-2dc5-9deacdf0ba4d@synopsys.com>
 <ff57b956-a777-3dd6-80ca-4e9afd33ab96@gmail.com>
 <6b3a28eb-7809-d319-d58d-520c1c7fa5d2@synopsys.com>
 <4a0869c9-6b71-5acd-e670-e4c06b44d62d@gmail.com>
 <5d8459ae-4a4c-7371-6b0a-ed817e898168@gmail.com>
 <7963d464-44c1-f580-398c-775c694664cb@gmail.com>
 <f24b6e66-1fdc-06f0-97b4-f2a9be3eef6b@synopsys.com>
 <e50114a1-f7d3-ad62-fe6d-6b8bb2b1203f@synopsys.com>
 <CAHp75Vf+3aeq8kb2oOO-qjC5jOE7ZWUgs2=MOa4mseOG08c+vA@mail.gmail.com>
 <bdc5093b-0673-ff3b-fef9-4577aa3549a9@gmail.com>
In-Reply-To: <bdc5093b-0673-ff3b-fef9-4577aa3549a9@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=synopsys.com;
x-originating-ip: [98.248.94.126]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1acaddf2-87ea-40a6-a4d1-08d8fad30e79
x-ms-traffictypediagnostic: BY5PR12MB3682:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BY5PR12MB36827DE0BEF387D994619D7BAA749@BY5PR12MB3682.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5236;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: /xZi4CyCn9X0n/X4hno6vQMKxTNhhmpFMJ5ajGtyO+UJhuQhg1+m+V5ymbIMVdOw7MGwX/mIPVrQI/YvdT+aTDvjEMUELTFtWtyg8NYXr8tS7jUuWFKr6EabFkI5nRSnSgzNDd+z3uHHCSaimbEfySLDsyU/rNYqq/p/nJvUWaz4i866PtVT6vuzgQ/Slh+9XKkKyGoYya8JSo9+dvoRpkTuj2ddcuBAbq6Ec+i2G2IfmvzbWleqjyqOILwO55JCnKmJtVJmuPflTJJD/f+JJuEiSPC46djcc3UBpUaO2LmpqT9P60y9CJnU2kCm42ovIfg1BL1V8k+qpppTYeyKgxEOhPoD8RPISM61OkP57rQ44n+/5FOlxPiYx1QKXY1IS4b/jqmvH1dfGN25pD8clVpbSRH57d1/xlwfnl1oiL4ukwwCEckiioVyYeKAA8ZLULJMdHaB7aAJDJ7in5sdI6NFI/QA2pUGXE72zel7Xs4jANO4EQbcLPmcl7p1Z22s8ASRX7HXT+BJ1d2GoMaQh6lispVCFFGICNYHzZgY/85RNJobb5hqErq073bG1camKBTympCdB1y9Cjq/9Nf6VoRKBK+Z6RfMYAhK9+yp4c5oDiF62Ky8uw6fkojrkuAWFDgWx9j0cA/6fW1/fN16eU4EP3KcOIhgihE+S0YF/zV5FNOh4c0dI/nTeZ5n2DiwkehHCKZU2rGxiGdqnMKl2QUorneuxRAcKCcZMhNKEpItCWs+5H34jDUvUT6Afmc12/MgoAmob9YZHMC4fT9lPWDjPYMkX22QlH6I16pUABQ=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB4791.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(346002)(396003)(376002)(136003)(39860400002)(366004)(71200400001)(2616005)(31686004)(6506007)(53546011)(2906002)(26005)(36756003)(186003)(4326008)(6486002)(8936002)(76116006)(6512007)(66446008)(66556008)(316002)(5660300002)(966005)(66476007)(64756008)(8676002)(54906003)(66946007)(86362001)(31696002)(38100700001)(478600001)(83380400001)(110136005)(45980500001)(43740500002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: =?utf-8?B?NndzUTJnSWM1dktJcXVBVXJLZTJPeWtUcnlsNXcxU0VRRkdjZFpLdU1BK1c0?=
 =?utf-8?B?ZkF3SVg1TEtGWG9neXZvRm9BOCt5a3BPdy9yK2VSejgvVFFsbUtvWFFTc3JG?=
 =?utf-8?B?T01TcUtSUTBxYUN6eFJSTmczZmJJSjBkRnR1L1NWQktXWTBHNDRVTC9aQUV2?=
 =?utf-8?B?cTZNM1NPUHBnelp1U3FiejRCbnFYWFFBMC9KQTRzWHZBdzVDZ3M1dXhJTFBB?=
 =?utf-8?B?OVdsYnl1aUJUOXJVV1FRMjRMbmVuZ3ZMNDYzY3ozS3hDd1lNRENLRFpFM0hx?=
 =?utf-8?B?a1A5M2pSaGlhWDdTSVZ1MUptV3UvQUdBbzB3TEtaQ3pjdGhoOVY4OCt3M1Nm?=
 =?utf-8?B?cFRKOERJOWh4ZnZsTnBYMzhla2xMQW5rbkJOOXZVaXlkRGZ5eDFwbVJMeCs1?=
 =?utf-8?B?RTRwSEkvam9NaXUvVVYzb3pyTjhuN1Z4eTJwaGFNeHd4NEJIMEpkSjdYcXBC?=
 =?utf-8?B?SjVEbjZiMEZ4SzE4WXIrZTZCelB0bUY2emI3TG0xbk9aWGxwWXhrL1pYNk9T?=
 =?utf-8?B?TzBkUXBiOEl4ZytsZmp4U0gveEYyT1RHeTREVmZNcm5xNkZ5YU9kdmNmOWFj?=
 =?utf-8?B?NUJ3MVVnaWFmMXprRTg1T0p1cFI3NnQ4UWtyc0lhQ3RHVUcvbFdWNG5XaHZH?=
 =?utf-8?B?TkFVcEJCUzFsOFo3ZFN5enRtTFlaK2tMS25nTGtpa3FQM1NnanpLMHRxTzY2?=
 =?utf-8?B?cTBITFRiN2F1YWR3NS92bHkwTVdKUDVQR0hJNWM5eDdGSXI0eVNpclhGb04x?=
 =?utf-8?B?SmZZcmhOMGIvOFdtVDBxalB4WSs3UDdWVldnbDBPSFd1R1IrR1Y3dDUwWEVO?=
 =?utf-8?B?MVBWb3lVenMwR1M0eVlaQXNRMWI2Zm8wd1B5STVrSE9CbVgrV3JjdnZudXRr?=
 =?utf-8?B?RjlOMVAwcmJkSmtYdXRDUDFveElnSGZiUmR0Wld1QU1rRW04YlFEbDZ6WlAv?=
 =?utf-8?B?T1B2U3EwalAxaFFUMWZzbG8zc1ZnY3N2TEwvZTdFaGpVek1MdmNmS2FyajZZ?=
 =?utf-8?B?azVHSVJ1dER6WTBVdnpRbnlTeVl1bERjUHg5b0hBM0Z4Smt0RzRTQ0V0czg5?=
 =?utf-8?B?RlhaN3FtcTUwKzk4cFNlc1lJTWQzazNGVFVmYi9aKzNla1VpUlhLd1JyS1Z0?=
 =?utf-8?B?ajYwOVY1dVVUZ1R1b2ZKUmZtWVcyWUhOUGZFUzRZUXVjOUJiSnFTbHdyT0tJ?=
 =?utf-8?B?eWY4R0JYN3ZQdmlFRCt3cUFPZnVGSk4rUWhiV2lNaW94b0d2Y2VhVkM1OFE2?=
 =?utf-8?B?NUhrV3oySU1MaFFLYmlrZkRTcDJWZ2hmQUR6ODlLWThrMTFPaFF4Q1JKeEUr?=
 =?utf-8?B?T0RNZ3U5YlI0Yi9DZmV3ZS9VMzkvWFR6VFlnbStnbkRGQzZWOXdtQW0reFlv?=
 =?utf-8?B?SCtFUDBWWk95WHQyN2xFb3htQzN0SmtBcFR0K1lIVHdXdzlObjlmMi9wMjl3?=
 =?utf-8?B?S3g4M2VQeGk4TmxFQ3lSN3Q5TFVZVWdmeVdxNlZ4MTNQYUgvcDB6c29mR0t2?=
 =?utf-8?B?VFVqaHNrTHVXdjBOR1FsUmdkR1NvY3h2ZW1zVFYwV213aWZRRmNaem1OemI2?=
 =?utf-8?B?UzIwcUx2c1RvM3RNTTYwUGk0cXJkNkZoUnM5elh2M3I4T3pxUnVjQ1BDSmN4?=
 =?utf-8?B?RW0xall4THpxNER5dmorclBNSzc4MUVKWnhQcGZjMVJaZTRjTzNOYjZDNUVh?=
 =?utf-8?B?MTFITlIzZjFaU09tQmhnT3hINVd6V1QyQ2JTNkRTWkN2ZXpyQS95YnJ5ei95?=
 =?utf-8?Q?V73tXkeTdfkyoQFUTQBltnjBXlp196q6ybFbFmh?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <E90E251557C8D041853D0C6E4FDB5E34@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB4791.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1acaddf2-87ea-40a6-a4d1-08d8fad30e79
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Apr 2021 21:12:45.9152
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1cMTwp1c+hbUXYysaPaMKk2gDNM0xPNloNE6z9KqdfzRR+Q3I37fXH0X/yszaXXR21iX1Tsc2D0oX/Rj1eg6kQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB3682
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

RmVycnkgVG90aCB3cm90ZToNCj4gT3AgMDctMDQtMjAyMSBvbSAxNTozNCBzY2hyZWVmIEFuZHkg
U2hldmNoZW5rbzoNCj4+IE9uIFdlZCwgQXByIDcsIDIwMjEgYXQgMzoyNCBBTSBUaGluaCBOZ3V5
ZW4NCj4+IDxUaGluaC5OZ3V5ZW5Ac3lub3BzeXMuY29tPiB3cm90ZToNCj4+PiBUaGluaCBOZ3V5
ZW4gd3JvdGU6DQo+PiAuLi4NCj4+DQo+Pj4+IEkgdG9vayBhIGxvb2sgYXQgdGhlICJiYWQiIGFu
ZCAibm9ybWFsIiB0cmFjZXBvaW50cy4gVGhlcmUgYXJlIGEgZmV3DQo+Pj4+IDEtc2Vjb25kIGRl
bGF5cyB3aGVyZSB0aGUgaG9zdCB0cmllZCB0byBicmluZyB0aGUgZGV2aWNlIGJhY2sgYW5kDQo+
Pj4+IHJlc3VtZSBmcm9tIGxvdyBwb3dlcjoNCj4+Pj4NCj4+Pj4gwqDCoMKgwqDCoCBrc29mdGly
cWQvMC0xMMKgwqDCoMKgwqAgWzAwMF0gZC5zLsKgwqAgMjMxLjUwMTgwODoNCj4+Pj4gZHdjM19n
YWRnZXRfZXBfY21kOiBlcDNpbjogY21kICdVcGRhdGUgVHJhbnNmZXInIFs2MDAwN10gcGFyYW1z
DQo+Pj4+IDAwMDAwMDAwIDAwMDAwMDAwIDAwMDAwMDAwIC0tPiBzdGF0dXM6IFN1Y2Nlc3NmdWwN
Cj4+Pj4gwqDCoMKgwqDCoCBrc29mdGlycWQvMC0xMMKgwqDCoMKgwqAgWzAwMF0gZC5zLsKgwqAg
MjMxLjUwMTgwOTogZHdjM19yZWFkbDogYWRkcg0KPj4+PiAwMDAwMDAwMGQ2OGVjZDM2IHZhbHVl
IDAwMDBhNjEwDQo+Pj4+IMKgwqDCoMKgwqAga3NvZnRpcnFkLzAtMTDCoMKgwqDCoMKgIFswMDBd
IGQucy7CoMKgIDIzMS41MDE4MTA6IGR3YzNfd3JpdGVsOiBhZGRyDQo+Pj4+IDAwMDAwMDAwZDY4
ZWNkMzYgdmFsdWUgMDAwMGE3MTANCj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqAgPGlkbGU+LTDC
oMKgwqDCoMKgwqAgWzAwMF0gZC5oLsKgwqAgMjMyLjQ5OTQxODogZHdjM19yZWFkbDogYWRkcg0K
Pj4+PiAwMDAwMDAwMGExNWUwZTM1IHZhbHVlIDAwMDAwMDM0DQo+Pj4+IMKgwqDCoMKgwqDCoMKg
wqDCoMKgIDxpZGxlPi0wwqDCoMKgwqDCoMKgIFswMDBdIGQuaC7CoMKgIDIzMi40OTk0MjM6IGR3
YzNfcmVhZGw6IGFkZHINCj4+Pj4gMDAwMDAwMDBiYjY3YjU4NSB2YWx1ZSAwMDAwMTAwMA0KPj4+
PiDCoMKgwqDCoMKgwqDCoMKgwqDCoCA8aWRsZT4tMMKgwqDCoMKgwqDCoCBbMDAwXSBkLmguwqDC
oCAyMzIuNDk5NDI1OiBkd2MzX3dyaXRlbDogYWRkcg0KPj4+PiAwMDAwMDAwMGJiNjdiNTg1IHZh
bHVlIDgwMDAxMDAwDQo+Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgIDxpZGxlPi0wwqDCoMKgwqDC
oMKgIFswMDBdIGQuaC7CoMKgIDIzMi40OTk0Mjc6IGR3YzNfd3JpdGVsOiBhZGRyDQo+Pj4+IDAw
MDAwMDAwYTE1ZTBlMzUgdmFsdWUgMDAwMDAwMzQNCj4+Pj4gwqDCoMKgwqDCoCBpcnEvMTUtZHdj
My00NzbCoMKgwqDCoCBbMDAwXSBkLi4uwqDCoCAyMzIuNDk5NDgwOiBkd2MzX2V2ZW50OiBldmVu
dA0KPj4+PiAoMDAwMDA0MDEpOiBXYWtlVXAgW1UwXQ0KPj4+PiDCoMKgwqDCoMKgIGlycS8xNS1k
d2MzLTQ3NsKgwqDCoMKgIFswMDBdIGQuLi7CoMKgIDIzMi40OTk0OTI6IGR3YzNfZXZlbnQ6IGV2
ZW50DQo+Pj4+ICgwMDAwMDQwMSk6IFdha2VVcCBbVTBdDQo+Pj4+IMKgwqDCoMKgwqAgaXJxLzE1
LWR3YzMtNDc2wqDCoMKgwqAgWzAwMF0gZC4uLsKgwqAgMjMyLjQ5OTQ5NjogZHdjM19ldmVudDog
ZXZlbnQNCj4+Pj4gKDAwMDA2MDg4KTogZXAyb3V0OiBUcmFuc2ZlciBJbiBQcm9ncmVzcyBbMF0g
KFNJbSkNCj4+Pj4gwqDCoMKgwqDCoCBpcnEvMTUtZHdjMy00NzbCoMKgwqDCoCBbMDAwXSBkLi4u
wqDCoCAyMzIuNDk5NTAxOg0KPj4+PiBkd2MzX2NvbXBsZXRlX3RyYjogZXAyb3V0OiB0cmIgMDAw
MDAwMDBjN2NlNTI0ZSAoRTE3OTpEMTcwKSBidWYNCj4+Pj4gMDAwMDAwMDAwODI3MzU0MCBzaXpl
IDE0NjMgY3RybCAwMDAwMDgxOCAoaGxjUzpzQzpub3JtYWwpDQo+Pj4+IMKgwqDCoMKgwqAgaXJx
LzE1LWR3YzMtNDc2wqDCoMKgwqAgWzAwMF0gZC4uLsKgwqAgMjMyLjQ5OTUxODoNCj4+Pj4gZHdj
M19nYWRnZXRfZ2l2ZWJhY2s6IGVwMm91dDogcmVxIDAwMDAwMDAwMTJlMjk2Y2YgbGVuZ3RoIDcz
LzE1MzYNCj4+Pj4genNJID09PiAwDQo+Pj4+IMKgwqDCoMKgwqAgaXJxLzE1LWR3YzMtNDc2wqDC
oMKgwqAgWzAwMF0gZC4uLsKgwqAgMjMyLjQ5OTU2MjogZHdjM19lcF9xdWV1ZToNCj4+Pj4gZXAy
b3V0OiByZXEgMDAwMDAwMDAxMmUyOTZjZiBsZW5ndGggMC8xNTM2IHpzSSA9PT4gLTExNQ0KPj4+
PiDCoMKgwqDCoMKgIGlycS8xNS1kd2MzLTQ3NsKgwqDCoMKgIFswMDBdIGQuLi7CoMKgIDIzMi40
OTk2MDE6IGR3YzNfcHJlcGFyZV90cmI6DQo+Pj4+IGVwMm91dDogdHJiIDAwMDAwMDAwOGMwODM3
NzcgKEUxODA6RDE3MCkgYnVmIDAwMDAwMDAwMDJhN2U5YzAgc2l6ZQ0KPj4+PiAxNTM2IGN0cmwg
MDAwMDA4MTkgKEhsY1M6c0M6bm9ybWFsKQ0KPj4+Pg0KPj4+Pg0KPj4+PiBZb3VyIGRldmljZSBp
cyBvcGVyYXRpbmcgaW4gaGlnaHNwZWVkIHJpZ2h0PyBUcnkgdG8gdHVybiBvZmYgTFBNIGZyb20N
Cj4+Pj4gaG9zdCBhbmQgc2VlIGlmIHRoYXQgaGVscHMgd2l0aCB0aGUgc3BlZWQgdGhyb3R0bGlu
ZyBpc3N1ZS4gKElmIHlvdSdyZQ0KPj4+PiB1c2luZyB4SENJIGhvc3QsIHRoZW4gc2V0IFhIQ0lf
SFdfTFBNX0RJU0FCTEUpLiBJdCBtYXkgYWxzbyBoZWxwIHdpdGgNCj4+Pj4gdGhlIGNvbm5lY3Rp
b24gaXNzdWUgeW91IHNhdy4NCj4+Pj4NCj4+Pj4gSXQgc2VlbXMgdG8gYmUgYW4gaXNzdWUgZnJv
bSBob3N0LCBidXQgSSBjYW4ndCB0ZWxsIGZvciBzdXJlIHVubGVzcyB3ZQ0KPj4+PiBoYXZlIHNv
bWUgVVNCIHRyYWZmaWMgYW5hbHl6ZXIgdGhhdCBzaG93cyB3aGF0J3MgZ29pbmcgb24uIEhhdmUg
eW91DQo+Pj4+IHRyaWVkIGRpZmZlcmVudCBob3N0cz8NCj4+Pj4NCj4+PiBZb3UgY2FuIGFsc28g
ZGlzYWJsZSBMUE0gZnJvbSB0aGUgZ2FkZ2V0IHNpZGUgYnkgc2V0dGluZw0KPj4+IGR3Yy0+ZGlz
X2VuYmxzbHBtX3F1aXJrLg0KPj4gRmVycnksIGl0IGNhbiBiZSBkb25lIGJ5IGFkZGluZyBhIGNv
cnJlc3BvbmRpbmcgcHJvcGVydHkgdG8gdGhlDQo+PiBkd2MzLXBjaS5jIGZvciBJbnRlbCBNZXJy
aWZpZWxkIHBsYXRmb3JtLiBJJ2xsIGNoZWNrIGFsc28gZm9yIG15IGNhc2UNCj4+IGFuZCBwZXJo
YXBzIEkgY2FuIGNvbGxlY3Qgc29tZSB0cmFjZXMgaW4gbXkgY2FzZSBsYXRlciBvbiB3aGVuIEkg
aGF2ZQ0KPj4gbW9yZSB0aW1lIGZvciB0aGF0Lg0KPj4NCj4gT2sgdGhhbmtzIGFsbC4gSGVyZSBp
cyB3aGF0IEkgdHJpZWQ6DQo+IA0KPiBBbm90aGVyIGNvbXB1dGVyIChBY2VyIDcyMFAgYnJhaW53
YXNoZWQgY2hyb21lYm9vayksIEkgdHJpZWQgYm90aCBmdWxsDQo+IHNwZWVkIGFuZCBoaWdoIHNw
ZWVkLiBTdGlsbCB0aHJvdHRsaW5nIGJ1dCBsZXNzIGJhZC4NCj4gDQo+IFRoZW4gb24gZGVza3Rv
cCwgd2l0aCBFZGlzb24ga2VybmVsIDUuMTItcmM1IGFzIGFib3ZlICsgdGhpcyBwYXRjaDoNCj4g
DQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3VzYi9kd2MzL2R3YzMtcGNpLmMgYi9kcml2ZXJzL3Vz
Yi9kd2MzL2R3YzMtcGNpLmMNCj4gDQo+IGluZGV4IDRjNWM2OTcyMTI0YS4uYTkyNjhjMDg1ODQw
IDEwMDY0NA0KPiANCj4gLS0tIGEvZHJpdmVycy91c2IvZHdjMy9kd2MzLXBjaS5jDQo+IA0KPiAr
KysgYi9kcml2ZXJzL3VzYi9kd2MzL2R3YzMtcGNpLmMNCj4gDQo+IEBAIC0xMjIsNiArMTIyLDcg
QEAgc3RhdGljIGNvbnN0IHN0cnVjdCBwcm9wZXJ0eV9lbnRyeQ0KPiBkd2MzX3BjaV9tcmZsZF9w
cm9wZXJ0aWVzW10gPSB7DQo+IA0KPiBQUk9QRVJUWV9FTlRSWV9TVFJJTkcoImxpbnV4LGV4dGNv
bi1uYW1lIiwgIm1yZmxkX2Jjb3ZlX3B3cnNyYyIpLA0KPiANCj4gUFJPUEVSVFlfRU5UUllfQk9P
TCgic25wcyxkaXNfdTNfc3VzcGh5X3F1aXJrIiksDQo+IA0KPiBQUk9QRVJUWV9FTlRSWV9CT09M
KCJzbnBzLGRpc191Ml9zdXNwaHlfcXVpcmsiKSwNCj4gDQo+ICsgUFJPUEVSVFlfRU5UUllfQk9P
TCgic25wcyxkaXNfZW5ibHNscG1fcXVpcmsiKSwNCj4gDQo+IFBST1BFUlRZX0VOVFJZX0JPT0wo
ImxpbnV4LHN5c2Rldl9pc19wYXJlbnQiKSwNCj4gDQo+IHt9DQo+IA0KPiB9Ow0KPiANCj4gVGhp
cyBmaXhlcyB0aGUgdGhyb3R0bGluZyBidXQgcmV2ZWFscyBJIGhhZCBhY3R1YWxseSBhdCBsZWFz
dCAyIGJ1Z3M6DQo+IA0KPiAxKSB0aHJvdHRsaW5nIGR1ZSB0byBMUE0sIHRoaXMgc2VlbXMgc29s
dmVkIG5vdywgdGhhbmtzIHRvIG11Y2ghDQoNCk5vdyB0aGF0IHdlIGNhbiBjb25maXJtIHRoZSBz
cGVlZCB0aHJvdHRsaW5nIGlzIHJlbGF0ZWQgdG8gTFBNLiBXZSBjYW4NCnRyeSB0byBleHBlcmlt
ZW50IGZ1cnRoZXIuIChJTU8sIExQTSBpcyBhbiBpbXBvcnRhbnQgZmVhdHVyZSBhbmQNCnRvdGFs
bHkgZGlzYWJsaW5nIExQTSBzZWVtcyBsaWtlIHVzaW5nIGEgc2xlZGdlaGFtbWVyIHRvIGNyYWNr
IGEgbnV0KQ0KDQpJIHN1c3BlY3QgdGhhdCB5b3VyIHBoeS9IVyBoYXMgYSBoaWdoZXIgbG93IHBv
d2VyIGV4aXQgbGF0ZW5jeS4gSSBkb24ndA0KdGhpbmsgeW91IHByb3ZpZGVkIGFueSBISVJEIHRo
cmVzaG9sZCBwcm9wZXJ0eSBpbiB5b3VyIHNldHVwIHJpZ2h0PyBTbw0KYnkgZGVmYXVsdCwgZHdj
MyBzZXRzIHRoZSBiYXNlIGxpbmUgQkVTTCB2YWx1ZSB0byAxIChvciAxNTB1cykuIFVubGVzcw0K
eW91IGtub3cgd2hhdCB5b3VyIHBoeS9IVyBpcyBjYXBhYmxlIG9mLCB0cnkgdG8gdGVzdCBhbmQg
aW5jcmVhc2UgdGhlDQpyZWNvbW1lbmRlZCBCRVNMIHZhbHVlLiBUaGUgcmFuZ2UgY2FuIGJlIGZy
b20gMCB0byAxNSB3aGVyZSAwIGlzIDE1MHVzDQphbmQgMTUgaXMgMTBtcy4gTWF5YmUgdHJ5IDYg
KGkuZS4gMW1zKS4NCg0KZGlmZiAtLWdpdCBhL2RyaXZlcnMvdXNiL2R3YzMvZ2FkZ2V0LmMgYi9k
cml2ZXJzL3VzYi9kd2MzL2dhZGdldC5jDQppbmRleCA2MGU4NTBhMzk1YTIuLjQyMzUzM2RmODky
NyAxMDA2NDQNCi0tLSBhL2RyaXZlcnMvdXNiL2R3YzMvZ2FkZ2V0LmMNCisrKyBiL2RyaXZlcnMv
dXNiL2R3YzMvZ2FkZ2V0LmMNCkBAIC0yODk1LDcgKzI4OTUsNyBAQCBzdGF0aWMgdm9pZCBkd2Mz
X2dhZGdldF9jb25maWdfcGFyYW1zKHN0cnVjdCB1c2JfZ2FkZ2V0ICpnLA0KICAgICAgICAgICAg
ICAgICAqIHJlY29tbWVuZGVkIEJFU0wgYmFzZWxpbmUgdG8gMSBhbmQgY2xhbXAgdGhlIEJFU0wg
ZGVlcCB0byBiZQ0KICAgICAgICAgICAgICAgICAqIHdpdGhpbiAyIHRvIDE1Lg0KICAgICAgICAg
ICAgICAgICAqLw0KLSAgICAgICAgICAgICAgIHBhcmFtcy0+YmVzbF9iYXNlbGluZSA9IDE7DQor
ICAgICAgICAgICAgICAgcGFyYW1zLT5iZXNsX2Jhc2VsaW5lID0gNjsNCiAgICAgICAgICAgICAg
ICBpZiAoZHdjLT5pc191dG1pX2wxX3N1c3BlbmQpDQogICAgICAgICAgICAgICAgICAgICAgICBw
YXJhbXMtPmJlc2xfZGVlcCA9DQogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGNsYW1w
X3QodTgsIGR3Yy0+aGlyZF90aHJlc2hvbGQsIDIsIDE1KTsNCg0KDQoNCj4gDQo+IDIpIGEgcHJv
YmxlbSB3aXRoIHVzYiBwbHVnIGRldGVjdGlvbg0KPiANCj4gV2hlbiBJIHVucGx1Zy9yZXBsdWcg
dGhlIGdhZGdldCBjYWJsZSBJIG5lZWQgdG8gZG8gdGhhdCBhdCBsZWFzdCBhbm90aGVyDQo+IHRp
bWUgYmVmb3JlIGdhZGdldCBpcyBkZXRlY3RlZC4gU28gdW5wbHVnL3JlcGx1Zy91bnBsdWcvcmVw
bHVnIHNlZW1zIHRvDQo+IHdvcmsuDQo+IA0KPiBBbHNvIHRoaXMgcGxhdGZvcm0gaGFzIGEgSFcg
c3dpdGNoIHRvIHNlbGVjdCBob3N0L2RldmljZSBtb2RlLCB3aXRoDQo+IHNlcGFyYXRlIGNvbm5l
Y3RvcnMgZm9yIGhvc3QgYW5kIGRldmljZS4NCj4gDQo+IFdoZW4gSSBmbGlwIHRoZSBzd2l0Y2gg
dG8gaG9zdCBpdCBpbW1lZGlhdGVseSBjaGFuZ2VzIHRvIGhvc3QuDQo+IA0KPiBGbGlwcGluZyB0
byBkZXZpY2UgbGVhdmVzIHRoZSBMRURzIG9uIG15IGNvbm5lY3RlZCB1c2IgaHViIG9uLCBzbyBp
dCdzDQo+IHN0aWxsIHBvd2VyZWQgKGJ1dCBub3Qgb3BlcmF0aW9uYWwpLg0KPiANCj4gRmxpcHBp
bmcgZmFzdCBob3N0L2RldmljZSAod2l0aGluIDEvMiBzZWMpIGh1YiBMRURzIHR1cm5zIG9mZi4g
QnV0IEkNCj4gc3RpbGwgbmVlZCB0byBhZGRpdGlvbmFsbHkgdW5wbHVnL3JlcGx1ZyB0aGUgZ2Fk
Z2V0IGNhYmxlIHRvIGdldCB0aGF0IHRvDQo+IHdvcmsuDQo+IA0KDQpUaGUgY29ubmVjdGlvbiBp
c3N1ZSBjYW4gY29tZSBmcm9tIGRpZmZlcmVudCB0aGluZ3MuIFBsZWFzZSBuYXJyb3cgaXQgZG93
bg0KYW5kIG1ha2Ugc3VyZSB0aGF0IHlvdSBkb24ndCB1c2UgYW55IGRlZmVjdGl2ZSBjYWJsZSBv
ciBiYWQgaHViLiBFdmVuIHRoZW4sDQppdCdzIGRpZmZpY3VsdCB0byBkZXRlcm1pbmUgd2hvc2Ug
ZmF1bHQgaXQgaXMgZnJvbSBqdXN0IHRoZSBkbWVzZyBhbmQgZHJpdmVyDQpsb2dzIGFsb25lIHdp
dGhvdXQgbG9va2luZyBhdCB0aGUgVVNCIHRyYWZmaWMgYXQgdGhlIHBhY2tldCBsZXZlbC4NCg0K
QnR3LCBpcyB5b3VyIHNldHVwIERSRD8gSWYgeW91J3JlIHN3aXRjaGluZyBtb2RlLCB0aGVuIEkg
a25vdyB0aGF0IGR3YzMgcmlnaHQNCm5vdyBkb2Vzbid0IGltcGxlbWVudCBtb2RlIHN3aXRjaGlu
ZyBjb3JyZWN0bHkuDQoNCllvdSBjYW4gc2VlIHRoZSBkaXNjdXNzaW9uIHdlIGhhdmUgaGVyZToN
Cmh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LXVzYi8yMDIxMDEwODAxNTExNS4yNzkyMC0x
LWpvaG4uc3R1bHR6QGxpbmFyby5vcmcvVC8jdA0KDQpCUiwNClRoaW5oDQo=
