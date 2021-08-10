Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3B0783E58A0
	for <lists+linux-usb@lfdr.de>; Tue, 10 Aug 2021 12:52:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239941AbhHJKxR (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 10 Aug 2021 06:53:17 -0400
Received: from smtprelay-out1.synopsys.com ([149.117.73.133]:47942 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S239938AbhHJKxO (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 10 Aug 2021 06:53:14 -0400
Received: from mailhost.synopsys.com (us03-mailhost1.synopsys.com [10.4.17.17])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 81361410EF;
        Tue, 10 Aug 2021 10:52:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1628592770; bh=CHhvh7Au8CVef87KkOsrxicMff5cZ5r6xmVNTlVCUSE=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=THIzyeqLVi61K3Aq09H/77hnsF5L0T8haDCM03sWqCXFPOnKgWbVHP+Q9buk7ES4e
         OCGnzh9qeuCNLj70eNYp5YVt2cZEIiZOwTeXcwdcnIKrBpdFVJFei9oEkzumguCeDQ
         /+PTzEN0Ux2d/aw0cygQ/Q6m2lWhZUNArCuZ72QaTnGIZRebDsslqSyad4TxPBNT+e
         TLpEKxDw5bEO7+O/Y730JMx05avS+aQsJdpl8wfmtaIrWe4K6CvUTRsENhM+mZDiUn
         tw1sD6pS5SPZiuTm8uz6Mhzq57jaImCDFuAXvYeFJXQLKJKAStsbs/qAUH468DDRWq
         50lic3LqupUcQ==
Received: from o365relay-in.synopsys.com (sv2-o365relay1.synopsys.com [10.202.1.137])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (verified OK))
        by mailhost.synopsys.com (Postfix) with ESMTPS id 0363EA0080;
        Tue, 10 Aug 2021 10:52:49 +0000 (UTC)
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2175.outbound.protection.outlook.com [104.47.58.175])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
        by o365relay-in.synopsys.com (Postfix) with ESMTPS id 5E606400F0;
        Tue, 10 Aug 2021 10:52:49 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=hminas@synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
        dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="mgnszLye";
        dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PlGHx6LC+pczUxNG9kqScsnwGkbmxtGOKMmTI2QJtpvw3DU+nhP1tEeJ6Sh7NSGYpgASEcDYl9+8S0QofS2li0SpV7GAAMekVdCvWaHLP1WEhMiB9aYvPheReYzvikkuZf5z6SLHKzCKiiyJJZAB69hPR5HxYrc0hvzQ9HwnWgF+LAKMF69rRE/YJ8MHKy7bFw5C/YkieQMrjTPAYiEzIgXaG4Anwuw4WTLLM8BChJA4N6j6aeiw+wJFal/2l2Jv7ESqzu2iwIgPojJyKo/fQc3TKAZILrLk09ku+YjDwphEbyjd3HedphNWVAbQNjHqkGjWyfk2Wdo5rTRo9qA8dA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CHhvh7Au8CVef87KkOsrxicMff5cZ5r6xmVNTlVCUSE=;
 b=VcKhEmkqV2xJG1Eqgt+wQ1dwJ7Y47VvXWiIh7DbuZv6u9HPelxzG7b6CngACW5Y5/Ny+ZNKYNN5Aj/Og89Jw/HkyFKHHg6WrqybKoNPcpnAwhfsU2RPzuTyYvcTVO9Lle2uppL373oZpJJOfd9kq7l5LnLD5UwWRgCKCBKdb8Y2wuZZPKe7EjKozjQd/rtbyXW8JJQQy7D+7zXNZ5VUztvbGNduTz/Wgay6CxS6Ga4fGcvXw7zQbw2l9ylnh9nmu5iBiufh9JZMyJWxHpbJALgKboQOrAQkRJuHbwRh2zamMKqcG0vQXxTYZZnt65FAxEweFr4C62EfPpBjomfjU+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CHhvh7Au8CVef87KkOsrxicMff5cZ5r6xmVNTlVCUSE=;
 b=mgnszLyeHwNwnt0MaYG3n/eaM5YuIj+2zLZtMWGOTf7G8Wx5Cck8BR4h5F7FMpvape4q7+c5O5CBFM9GiowSPAHbcQitBod+pCbKTKQHNGQroEhdVSi6Bgeg5W4iKeNJdMbPnOQsvLZvcHTltvMBbZ6v331MavNicooZRUsXFxY=
Received: from DM4PR12MB5390.namprd12.prod.outlook.com (2603:10b6:5:39a::12)
 by DM4PR12MB5120.namprd12.prod.outlook.com (2603:10b6:5:393::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.17; Tue, 10 Aug
 2021 10:52:47 +0000
Received: from DM4PR12MB5390.namprd12.prod.outlook.com
 ([fe80::99a3:6c83:467c:8d8]) by DM4PR12MB5390.namprd12.prod.outlook.com
 ([fe80::99a3:6c83:467c:8d8%5]) with mapi id 15.20.4394.023; Tue, 10 Aug 2021
 10:52:46 +0000
X-SNPS-Relay: synopsys.com
From:   Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>
To:     Argishti Aleksanyan <Argishti.Aleksanyan@synopsys.com>,
        Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
CC:     John Youn <John.Youn@synopsys.com>
Subject: Re: [PATCH] usb: dwc2: gadget: implement udc_set_speed()
Thread-Topic: [PATCH] usb: dwc2: gadget: implement udc_set_speed()
Thread-Index: AQHXjdR/fV5WlcX/mU+n74273ZPPwKtskAqA
Date:   Tue, 10 Aug 2021 10:52:46 +0000
Message-ID: <b4768065-0bf8-4cd3-a6d7-d4a707b67b3e@synopsys.com>
References: <c453469d618100321c876a8c2b0ebee15a456eac.1628583235.git.aleksan@synopsys.com>
In-Reply-To: <c453469d618100321c876a8c2b0ebee15a456eac.1628583235.git.aleksan@synopsys.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
authentication-results: synopsys.com; dkim=none (message not signed)
 header.d=none;synopsys.com; dmarc=none action=none header.from=synopsys.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 65d24b77-24cb-42be-5fe9-08d95becfd28
x-ms-traffictypediagnostic: DM4PR12MB5120:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM4PR12MB5120E7A2DEBB79802887EDFAA7F79@DM4PR12MB5120.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:147;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: mbY/yzLp6oBL3TvpBmgI+nL1+WzusBaXeTk58bGZT8pvAbhReh7cAAxxU+TllEJ+tBLNaBITAXdvr3nbhz/I1EZV9kNXGYN70fLTlrxLorOhZ/MqHW6QloiGnCdqtx4i5zl8UHKJ6Oa7yYCynSoE+DMKI9eC0Ipw1mZDcd4qNv2e4IuwP/2i5AqaEAO4QBWFj542y8oCgxsdaR0FmxMz6lYHvDctKF4NI9X8mzwJIgSrpAC/0U+/9Zw20aMIPVXXT+gfT3Xj8F1dK5Vzp3Z6CkNUzIVoAnhALCxW+I63Jhnt/ma9p5p6EGsjhCp/4EehtA4FzwT2NAWpkBvL6Awjyxvi0QHbplIPowN605hejZPU7dVcTQDHbqdGqePoI4+0FuWmPavAH1HNjniTthJOCMeXrLvmEXpSD7EQUT8qxMQvepwfGXEvwGscbhW7Hg/3P2ETyV4zdE33nZKYJILiimIxrWay6GxC0knFHev93AfCRSb0/QRDPqvOgmglXP+Kk/8tAuNZb+dG3tbIbSr2mMZMH5vc3K9eOty2oyKtE1Bo4FQqvtzr0TEYASXQrWNp3p0r67uSp8JQmmZeq6mlrtA2drMclNJqmo8YqyjJJy7YYRTOgAXb40EiTWp2bFNk/SzPHQNa3YGtxn7CLgGisQlSGnEqXdbut3DAA7bnX4z9WWhT+1S3VY/chIe5VjizEVoqBV0NjZxHIaPHcYr7Yq+ilL2zmvVInwdq979QLmGDS56MBeLbrmY5wxYS2AeUeXddqicRnNZlBu6wN6Zg2w==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB5390.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(396003)(136003)(39850400004)(376002)(346002)(366004)(186003)(316002)(83380400001)(38100700002)(478600001)(38070700005)(71200400001)(122000001)(2616005)(4326008)(64756008)(36756003)(107886003)(2906002)(31686004)(86362001)(31696002)(6512007)(66476007)(53546011)(66446008)(6506007)(110136005)(26005)(66556008)(5660300002)(66946007)(8676002)(91956017)(8936002)(6486002)(76116006)(45980500001)(43740500002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dGVRRWNZUmNuN3pXNUtCRERVTSt6dk1mZC9iUzZqcHI2UUhHck40K2h4QzY2?=
 =?utf-8?B?d0dzV2tTRUFDKzF4Q1Z4NEt4VmVCZERrNmkzY0xWcno4SDBheDl4d1lkSUxq?=
 =?utf-8?B?MTZabDdRTmlERnI2NkRKcGF4YXlxdU9VZlU2UER5TXViZTZGdWdPWkNrRks1?=
 =?utf-8?B?Yjl1V2VJYkRFM0ZhTDZYMWRSeGp1bGhxMndDQ0lyc21qMUtrSkx2b0FyeE1k?=
 =?utf-8?B?cHc1T05TRTJ1ODVZM29Vak5pVmxXOXNmSFl3bWhZUldTNFFYczU2S2VqVGRK?=
 =?utf-8?B?Rk5xQjJ2ckRPT1JlWUNKLy9yNGFKWHloSVVJS3JLa3pTZTZpa28wU3Y3Z1lN?=
 =?utf-8?B?T2dzdmVoanBXMVJvLzZmd3Z3R0d1OE11Q3RsWmMzNVhzd21NeDlGV2ZLd2NQ?=
 =?utf-8?B?NWlaaTVTcFlScWYyZHFPZlFlL2FjalNMRlVKTTNjck15dEhUMFpFTU1Ca09L?=
 =?utf-8?B?eVhiOHA0dnZkRlRhdm81R25WZi8yVmp2UitDRGRmdVk1VDhVbWFVdkF4NEhB?=
 =?utf-8?B?RXVreXpsdXhrQVdEcklYeEtIcnlxUTBjem05blAwUXh5SXJqd0lEZDR6YTBh?=
 =?utf-8?B?R2VyczdyZUhRSmtVMzlaVzBKOHRQUXZZL2hiS05WcldkZUl2bGJ0NEZyOE9i?=
 =?utf-8?B?dGk3RzRVRUNMejBTcFpaK1dKUUhsbXZKN3l2aHBJZVVUWmp6NExabzNZZnFU?=
 =?utf-8?B?SkNicXZxdUxTbEE1TEl2bHJBMS9pZ0VybmFPY1VFanhwZ1MxUDJjTEhuSm1U?=
 =?utf-8?B?ZFhoY3hVaVdqTWppVEJpcUVuTlNmOXozNWp1Z2MrUTV0UlkwQVJrY0lxZFRH?=
 =?utf-8?B?TVJjQy9GSW9GRnZJS0oybGNoNXpQcHQxKzY5ajlZMmR1QzQ0ZHlzZkRPVmY0?=
 =?utf-8?B?eTJaK3MyQVJEUjMxZDNsRzltMjlxUWV0V1BWeGdXa1dZNWx2SStvaEFFalhW?=
 =?utf-8?B?ZUg0YmYyYi9tSVNNTllRMndnN2tpNlVRMmgvdU5PUkxvbnRxTDdsS0NYM01T?=
 =?utf-8?B?SzVDSVhWcDZZWFdFK2ZnWVRFTGt2cDl6dWlGZG5EYng4aEVWQTNRb1lpUnVr?=
 =?utf-8?B?MU0yV3hLUjJiOXh3YncwQkE1NFREejUzcVZJZFhpc1BLalpUQ0hySHZEMVVz?=
 =?utf-8?B?TXFhd3grd2k3UTdYcG9xbGE3aUlpdXdyR1RRK00rWlhRT04vYUhFRWhwcGRn?=
 =?utf-8?B?YTNETkhNMklaTlpDT1RMYVRuRGlVcUJVbWN5ZXFYTS9ydWxQaURudCt3SEJS?=
 =?utf-8?B?Y3ZhNURwWnBySzkyWjJPTFc5dExYNDBQU0Y2VnpYYVlkdm54WXNFQkVDMEQr?=
 =?utf-8?B?UVBaWS9paGhlS0RGYk9pekZjMm85cHRlcjdjcFBza1hlcHl1a1N6aXdGWjlG?=
 =?utf-8?B?aDZqeWEzU3VkYklCN0daNUJ0SFUxN1g1YkdWK1J1Y091N2N1T0dTSUxlMlhI?=
 =?utf-8?B?WHBKRXZFQjdTdytaL0ltNkRObk15bzQrWHpxbVB6ODdjdWxDQzA1M0NRUk9V?=
 =?utf-8?B?bFI2ZVo1ZnJXUHJhNFJ5MmR3dHZ2ZWtBLzkrendnRkhmS1JWK0plQmJVTEZC?=
 =?utf-8?B?VHY2SlVYVmF1OUdCM0xQSkxjck9iL0w0eHVNNmR5NmFLVVF6VlVWOW8rZmd5?=
 =?utf-8?B?Uzk5TU04S0lsTGxjQ0sxYklKMFF4ZGdGUnY5VFMwWTNzalRmQ0RSbFdObEdq?=
 =?utf-8?B?VWF1YUo0NEFXZ1lKeFpqYU5xcE9yN2dMQUJ6dkNiSzNsaEtsN2U1MGt1SXZI?=
 =?utf-8?Q?q7HqanMBuzef8pscnk=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <263955BECCB00D458D367B92F7DD336F@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5390.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 65d24b77-24cb-42be-5fe9-08d95becfd28
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Aug 2021 10:52:46.6112
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DBumZeuIr+raWSiRWWKJuC5TttEuJTdZDjF29wsofC1kYjLEYv2go9e1jU0n4OWtlgXBk3Zjee1TtTpdSM05og==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5120
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

T24gOC8xMC8yMDIxIDI6NDIgUE0sIEFyZ2lzaHRpIEFsZWtzYW55YW4gd3JvdGU6DQo+IEltcGxl
bWVudGVkIHVkY19zZXRfc3BlZWQoKSBnYWRnZXQgb3BzIHRvIGFsbG93IHRoZSB1ZGMgdG8gc2Vs
ZWN0DQo+IHRoZSBnYWRnZXQgc3BlZWQgb24gaW5pdGlhbGl6YXRpb24uDQo+IA0KPiBTaWduZWQt
b2ZmLWJ5OiBBcmdpc2h0aSBBbGVrc2FueWFuIDxhbGVrc2FuQHN5bm9wc3lzLmNvbT4NCg0KQWNr
ZWQtYnk6IE1pbmFzIEhhcnV0eXVueWFuIDxNaW5hcy5IYXJ1dHl1bnlhbkBzeW5vcHN5cy5jb20+
DQoNCg0KPiAtLS0NCj4gICBkcml2ZXJzL3VzYi9kd2MyL2dhZGdldC5jIHwgMjMgKysrKysrKysr
KysrKysrKysrKysrKysNCj4gICAxIGZpbGUgY2hhbmdlZCwgMjMgaW5zZXJ0aW9ucygrKQ0KPiAN
Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvdXNiL2R3YzIvZ2FkZ2V0LmMgYi9kcml2ZXJzL3VzYi9k
d2MyL2dhZGdldC5jDQo+IGluZGV4IDk4NWIyNzJmNTNkNS4uODM3MjM3ZTRiYzk2IDEwMDY0NA0K
PiAtLS0gYS9kcml2ZXJzL3VzYi9kd2MyL2dhZGdldC5jDQo+ICsrKyBiL2RyaXZlcnMvdXNiL2R3
YzIvZ2FkZ2V0LmMNCj4gQEAgLTQ3MDksMTIgKzQ3MDksMzUgQEAgc3RhdGljIGludCBkd2MyX2hz
b3RnX3ZidXNfZHJhdyhzdHJ1Y3QgdXNiX2dhZGdldCAqZ2FkZ2V0LCB1bnNpZ25lZCBpbnQgbUEp
DQo+ICAgCXJldHVybiB1c2JfcGh5X3NldF9wb3dlcihoc290Zy0+dXBoeSwgbUEpOw0KPiAgIH0N
Cj4gICANCj4gK3N0YXRpYyB2b2lkIGR3YzJfZ2FkZ2V0X3NldF9zcGVlZChzdHJ1Y3QgdXNiX2dh
ZGdldCAqZywgZW51bSB1c2JfZGV2aWNlX3NwZWVkIHNwZWVkKQ0KPiArew0KPiArCXN0cnVjdCBk
d2MyX2hzb3RnICpoc290ZyA9IHRvX2hzb3RnKGcpOw0KPiArCXVuc2lnbmVkIGxvbmcJCWZsYWdz
Ow0KPiArDQo+ICsJc3Bpbl9sb2NrX2lycXNhdmUoJmhzb3RnLT5sb2NrLCBmbGFncyk7DQo+ICsJ
c3dpdGNoIChzcGVlZCkgew0KPiArCWNhc2UgVVNCX1NQRUVEX0hJR0g6DQo+ICsJCWhzb3RnLT5w
YXJhbXMuc3BlZWQgPSBEV0MyX1NQRUVEX1BBUkFNX0hJR0g7DQo+ICsJCWJyZWFrOw0KPiArCWNh
c2UgVVNCX1NQRUVEX0ZVTEw6DQo+ICsJCWhzb3RnLT5wYXJhbXMuc3BlZWQgPSBEV0MyX1NQRUVE
X1BBUkFNX0ZVTEw7DQo+ICsJCWJyZWFrOw0KPiArCWNhc2UgVVNCX1NQRUVEX0xPVzoNCj4gKwkJ
aHNvdGctPnBhcmFtcy5zcGVlZCA9IERXQzJfU1BFRURfUEFSQU1fTE9XOw0KPiArCQlicmVhazsN
Cj4gKwlkZWZhdWx0Og0KPiArCQlkZXZfZXJyKGhzb3RnLT5kZXYsICJpbnZhbGlkIHNwZWVkICgl
ZClcbiIsIHNwZWVkKTsNCj4gKwl9DQo+ICsJc3Bpbl91bmxvY2tfaXJxcmVzdG9yZSgmaHNvdGct
PmxvY2ssIGZsYWdzKTsNCj4gK30NCj4gKw0KPiAgIHN0YXRpYyBjb25zdCBzdHJ1Y3QgdXNiX2dh
ZGdldF9vcHMgZHdjMl9oc290Z19nYWRnZXRfb3BzID0gew0KPiAgIAkuZ2V0X2ZyYW1lCT0gZHdj
Ml9oc290Z19nYWRnZXRfZ2V0ZnJhbWUsDQo+ICAgCS5zZXRfc2VsZnBvd2VyZWQJPSBkd2MyX2hz
b3RnX3NldF9zZWxmcG93ZXJlZCwNCj4gICAJLnVkY19zdGFydAkJPSBkd2MyX2hzb3RnX3VkY19z
dGFydCwNCj4gICAJLnVkY19zdG9wCQk9IGR3YzJfaHNvdGdfdWRjX3N0b3AsDQo+ICAgCS5wdWxs
dXAgICAgICAgICAgICAgICAgID0gZHdjMl9oc290Z19wdWxsdXAsDQo+ICsJLnVkY19zZXRfc3Bl
ZWQJCT0gZHdjMl9nYWRnZXRfc2V0X3NwZWVkLA0KPiAgIAkudmJ1c19zZXNzaW9uCQk9IGR3YzJf
aHNvdGdfdmJ1c19zZXNzaW9uLA0KPiAgIAkudmJ1c19kcmF3CQk9IGR3YzJfaHNvdGdfdmJ1c19k
cmF3LA0KPiAgIH07DQo+IA0KPiBiYXNlLWNvbW1pdDogNzNlMTlkZTdiNzlhMmYyNmYwYjM3MGNj
MDcxNzI4Y2VkZTFhYjNhMA0KPiANCg0K
