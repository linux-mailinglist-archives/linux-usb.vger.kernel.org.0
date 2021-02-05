Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3BCBF3102EA
	for <lists+linux-usb@lfdr.de>; Fri,  5 Feb 2021 03:41:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229777AbhBECky (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 4 Feb 2021 21:40:54 -0500
Received: from smtprelay-out1.synopsys.com ([149.117.87.133]:36910 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229756AbhBECkw (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 4 Feb 2021 21:40:52 -0500
Received: from mailhost.synopsys.com (badc-mailhost4.synopsys.com [10.192.0.82])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 3A112C00A7;
        Fri,  5 Feb 2021 02:39:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1612492786; bh=sJ9mHCnRKR5w3xE4TOXBFboGr9e4SqRxm6kvcOVnNb0=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=HruBetpGai/uxq5a1H+6oQuhrCJIMbG1WtRubwCjuasIg3kBp9PtDPuSHDsiaRIT2
         x7lzBaWiQNvw+68KimV1NuxBH4IgKwJ9sB0qOCd2InacAcLpS+R72TLXA7G/Oavs2P
         Ng6wrD6DaN15j11me7IbDhd2TMR/IJQ4yq7i8U9zd1YkVR4zt+mG8VvhIF0sO6fGAu
         0xn5ekn2Y9YU7FXfytBUHVkYlDlrUi3eU894lZVEmkBw565cf9kv5ybPmbZ5vF1qo/
         LIuBGClTNgSFcfmnxVMvQEdexoAGQmJo+DdhpvcSj3BOAFdFFbgkyVSpImdUPwv0qM
         VA/4WMi1K+RKw==
Received: from o365relay-in.synopsys.com (us03-o365relay1.synopsys.com [10.4.161.137])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPS id BA855A005E;
        Fri,  5 Feb 2021 02:39:45 +0000 (UTC)
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2174.outbound.protection.outlook.com [104.47.59.174])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client CN "mail.protection.outlook.com", Issuer "GlobalSign Organization Validation CA - SHA256 - G3" (verified OK))
        by o365relay-in.synopsys.com (Postfix) with ESMTPS id C881D8021A;
        Fri,  5 Feb 2021 02:39:43 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=thinhn@synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
        dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="QSfEYRsf";
        dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WyfhmLE/011AVjkWSruo0bzIsHoF5cq7xdgnWJXNTE1smbMSieTCj/gLgO7xKqw/+YDTbHU28yHpQOih3FRjGp002CnvLp99Dotv/U4DSN6cNKkWOPsHei5Hg7oY/VoPM9+liD5DvXEqzkyN/TF6WU/6Rerq7FrSvR9oBwxWZMgJjs03Ang4Xs4nb2O42OGkAadMJ3LTfLAhSgn0qPl+OXghkLO0kvApD2jxsrr7QId39HyCmGFdvICYYIbn8Ob2xPrsAwgnxKunMu7k+rkETHwnJ7n/tH91Ok4CATL2psCEyYjsq4SBGRr5Zl/KnLg54WXR/gMH6uosrUvMhDeZRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sJ9mHCnRKR5w3xE4TOXBFboGr9e4SqRxm6kvcOVnNb0=;
 b=kHrc0Af3TiyR2q3M8CQ1/ElgiGkKxJrPvUvulOlI+oy/7HAp/yLEKObplEZ1f9W7xsyTVKA0AUmT3qWx9nDz4UATMLgT5wLbTKsY/KnwHN+8ur/AxZfn0Pwz0w/0q74WJ4xROXdwlXyb0uq/YU+X3j0l7UbUBhYbWdk1AiGEMqn94OLKnzgTzP1BSfMjf4DDMLp5GOxfE3ah1WPYV7YJYKWyDuiurVPZ3JFalen0C/qbmKCI+DhlrB6bHzbmDuMbxioBUes7s81BVoPNmflY76j7MJJdF7d3Nc4wegjtBHtTypWjhxinUG+ReVyMPcecFwvY3ugLBOw7khdsbSyObQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sJ9mHCnRKR5w3xE4TOXBFboGr9e4SqRxm6kvcOVnNb0=;
 b=QSfEYRsfhRqoLgoRSzHieV9y04VzUp/dBoNxIXlY2j6w1Nhczkl7zx+csrI3fCDZSVdowcY24/yb+hTDNgn2ma/6tE7FFCAOrHgbh74Li9hfX/YU/7/K8WRcDHaU1YE8U9hFQnM2kk14b0DsuiExyyeqEQU/3v9qdqo0jRmRx0c=
Received: from BYAPR12MB4791.namprd12.prod.outlook.com (2603:10b6:a03:10a::12)
 by BY5PR12MB4259.namprd12.prod.outlook.com (2603:10b6:a03:202::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.17; Fri, 5 Feb
 2021 02:39:42 +0000
Received: from BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::895b:620d:8f20:c4d6]) by BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::895b:620d:8f20:c4d6%6]) with mapi id 15.20.3805.026; Fri, 5 Feb 2021
 02:39:42 +0000
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>
CC:     John Youn <John.Youn@synopsys.com>
Subject: Re: [PATCH v7 0/6] usb: Support USB 3.2 multi-lanes
Thread-Topic: [PATCH v7 0/6] usb: Support USB 3.2 multi-lanes
Thread-Index: AQHW7syeKQ9WYtJ2/kC3+CKqeCpdGqpI8rWA
Date:   Fri, 5 Feb 2021 02:39:41 +0000
Message-ID: <04cc67bd-29b0-91d7-6144-a3f4dc6661f9@synopsys.com>
References: <cover.1611106162.git.Thinh.Nguyen@synopsys.com>
In-Reply-To: <cover.1611106162.git.Thinh.Nguyen@synopsys.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
authentication-results: synopsys.com; dkim=none (message not signed)
 header.d=none;synopsys.com; dmarc=none action=none header.from=synopsys.com;
x-originating-ip: [98.248.94.126]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1b17bfac-0b81-4ea8-c096-08d8c97f4aaa
x-ms-traffictypediagnostic: BY5PR12MB4259:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BY5PR12MB4259023F504039883B70BA89AAB29@BY5PR12MB4259.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4303;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 6IRA/YwRJCDbbVpiLtoMfigSB6xNf4mlXa7/a8fdVISrcRl4TBMJtk2uU9+AuemxuzhQINjh9BuVJVI+DPFnVO+DJX1ROcvhp9DczA3N4Io5gcacALuwK4uk46jT1pYmJ/MdZ9MnFuRZXfbyc3ZTq4zp+AwnbYSubdRILv5HOuvAC3LGepW83WdyjmgnjYS80aVAtGxhn3Hza/4WzTSihTKvV9SRDBZ0oro1gB5+hyeE4PkQ8VVsJDUAXWPFTiOBt4PWCp2bUTjzxuBOtmiaEGV6DQHl3y1dy56BqXVGB11tSXpNOLHekrmns48OsoMjbkEkKRoHfys3XFglaRtbwQe8uEyQPdcNyn/a5QhXeAUJuNUDzzp6OL3T2mQpQObWopmP7l2wwkqh0EwxN/VBG/AD1Tl9lp0SbzwX8kCyys+/ap+D6NqyzpYcA1WVN2ZIsNCHNNcgoytz8EPfzlm2HYZFbesCTo/WwjL2k69T84MqsG23uYwoZ6f3/Vm0Kbzi4rx/rharGzWBMman3IfiHzaJ37xe/9cMvklsrgrF6agENFVjXM9gC44CaV11dScxIG9xPeFbv6s3gwnpyXFfPxTER22ORCBnqhJ2ioKsN0GkEBfiq5M8HDDbHn3Yy/XVdjHo1rLsms4m94RkuLM8aCmjxonthvxI1v9x35j8SUaTxXecxmI9V+9dO5cXL045
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB4791.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(136003)(39860400002)(396003)(346002)(376002)(83380400001)(5660300002)(966005)(478600001)(86362001)(31686004)(36756003)(6486002)(71200400001)(66476007)(2616005)(186003)(107886003)(4326008)(31696002)(8936002)(66556008)(8676002)(64756008)(76116006)(316002)(66446008)(26005)(110136005)(2906002)(66946007)(6506007)(6512007)(43740500002)(45980500001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: =?utf-8?B?eklPZmQ0K213cGVkMXBObUZ1eExNbzc3NmVxeVRINGNVWlQ5T3VMSTdHMDdm?=
 =?utf-8?B?ZzJ1V2pxMys1V3REditEdVFPQisveVVNUDQ0bm1KQzlBOVZoRGVYTGVRdXpS?=
 =?utf-8?B?RlVrdTFBY2draFJhODdpb1dacnZmTGpGWGtubVlody9KWkFQZklLdXVvL3cw?=
 =?utf-8?B?azFSMmdmZi9nY21SYUE0bXZ4YkszRi9SSFVoNm5LQml2WTBtdG5tMFE2VzJO?=
 =?utf-8?B?RHVlcitxbDJVYmVTaCtCVCsvbDdSQVFWeVQ1bGhVSU9kMHg3anl5OVJMaDBN?=
 =?utf-8?B?eUw4T0d5cXl0OVZWdXZZQ0NrWUJWNld4TTI2cDZMWkE1VHZZTEVNTmphL1lI?=
 =?utf-8?B?NklRTFpiVVdOVzBzR2c2Kzc0V3NQR0lGcnR1Q2lVYUN2WmFWelRNeUFydFRy?=
 =?utf-8?B?UGYwcE9UR3hvYVNOZ1pPYWpBNHZEcW5GUkJXMWU5aVBrNVFReHNFMnZvRGtD?=
 =?utf-8?B?cFJIdFA4S1o1Rk5Ub2pwVm1IRWwrbTVmQUR3UVBLTG56blNuR3g4ZnJVc1dw?=
 =?utf-8?B?azRCTVVzNG9aRVl2MUJiR05ydXRWamhmeHZDeTRIZURWMFFuekhxL3g3U21J?=
 =?utf-8?B?dlhneXA0eTRVTzhUZHc0cXRSZFFJZ0tpeXhqeENieS9kbFBuWC9MRHludXhC?=
 =?utf-8?B?Tzc2blVIYWs0NmtYTjJCdGJ4QmxFZmlUZEZ3ZHdGZGx3NnI3aVdzR09Db3Nn?=
 =?utf-8?B?OVQzbnRFTHZ4VWR3NXNvdW9uakUzeEtwWkJBUmpDOStNdEtaL1J1UFlMRkQ3?=
 =?utf-8?B?bTMwT0ZjcTZTMDFOS3lJc0RJSEFHTEdZQjRkdVVvSzVPUy9YN3JEVnNmdTF4?=
 =?utf-8?B?SzBubm4vQmhKdGNaVDNIOUJ2R2NnWGRKVnpYeXBUVlJsWUJCSWcxQ0dQZkFB?=
 =?utf-8?B?aHJzUkRVZk05d3BMR081dDF6dEkydWh1MkpDaTR4RzNGZnpDTmVRVE1tRHFy?=
 =?utf-8?B?bXlhNGVoN1YxUDgwcHNmWm1kcDBObFFpbUNDSG1hVmJtdDcxQWlzTWJaV1Vr?=
 =?utf-8?B?d2hxUzhGSWExczJSSVBGc2lFdGlKYS8xVktVN0JwY0NLelFNNzNhQTRGMmx3?=
 =?utf-8?B?UzhEaXE2ei9Fb1NXR3pGRmdRUXE3VDdBWENoTUlOb3NPcUlYVjZTUmVzRHpn?=
 =?utf-8?B?cnNMbytoOVZXY1hNS1hTdTlZUW1sK0dNU1VXYXJHTE0wSXllQlo2UmV1VDg5?=
 =?utf-8?B?R3VtWUxDbEtWT0lJQ2tNYUM5RW5lbEFmZDdTdFg4UzFNVC9zR0RQQWRWSVVM?=
 =?utf-8?B?VGJFbnpTZzc1RmpSTXdRdldQQVlGUEptNFk0YS9vU2FtRHR3aEUyMTNPYnRM?=
 =?utf-8?B?UTZJMTRFTXhKa2ZtamVjTlZNK3ZLby8vTVZEam5DbWF6VDIrRmg4WU9sWUR3?=
 =?utf-8?B?ekYwUmtTa21PL1pYRzZadUFYM0ltVTQ2QXdKVytDQkNRZFVaMndyQmxwOWVx?=
 =?utf-8?B?Qm0xcjR3WkdVd3VGTkFPTFFHQWNEQUNxbHhJbzF5c0VSellWOHppVURHWExK?=
 =?utf-8?B?ZmhLSHJGYkJuaU9STS9JRXNLQlJmSWt2cUFuN3pWK2QrV25iMDdXek5aRXA5?=
 =?utf-8?B?YVg4ejlVL3lPdlNLZlZSTUNuVFpvbEc0em5mZmgvbDNhbzc2ZXpPRXhFNnFQ?=
 =?utf-8?B?c3R2a28yc05mRnBqNHRDenZhb29ORWwrV2ozcTMwR3VHdXpESjcyNVMxYVJp?=
 =?utf-8?B?a3NBWnRsNmJLekc2ZlhNTEJBdVNueFlINTh0ZHAwTmY1RUI2YTZVZDI4aXZw?=
 =?utf-8?Q?zpSU9SXdtz99tvt9SaeNuDvJaazZLOxX6ZVqXw8?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <81356818D92E9E49B2009A2D98D50845@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB4791.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b17bfac-0b81-4ea8-c096-08d8c97f4aaa
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Feb 2021 02:39:41.8442
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ypslxfH+3h5IwhPom/PUeC/mzOPEdkh5hwEegDGWA/L5iUrsgwAaF8kHVkImKtJQxM1Gsgj9El1ovFXl8TP0tQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4259
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

SGkgRmVsaXBlLCBHcmVnLA0KDQpUaGluaCBOZ3V5ZW4gd3JvdGU6DQo+IEEgVVNCIFN1cGVyU3Bl
ZWQgUGx1cyBkZXZpY2UgbWF5IG9wZXJhdGUgYXQgZGlmZmVyZW50IHNwZWVkIGFuZCBsYW5lIGNv
dW50DQo+IChpLmUuIGdlbjJ4MiwgZ2VuMXgyLCBvciBnZW4yeDEpLiBUaGUgRFdDX3VzYjMyIElQ
IHN1cHBvcnRzIFN1cGVyU3BlZWQgUGx1cw0KPiBnZW4yeDIuIFRvIHN1cHBvcnQgdGhpcywgdGhp
cyBzZXJpZXMgdXBkYXRlIGEgZmV3IHRoaW5ncyB0byB0aGUgVVNCIGdhZGdldA0KPiBzdGFjayBh
bmQgZHdjMyBkcml2ZXI6DQo+DQo+ICogQWNjZXB0IGFuZCBwYXJzZSBuZXcgbWF4aW11bV9zcGVl
ZCBkZXZpY2V0cmVlIHByb3BlcnR5IHN0cmluZ3MNCj4gKiBJbnRyb2R1Y2UgZW51bSB1c2Jfc3Nw
X3JhdGUgdG8gZGVzY3JpYmUgdGhlIHNwZWVkIGluIFN1cGVyU3BlZWQgUGx1cyBnZW5YeFkNCj4g
KiBDYXB0dXJlIHRoZSBjb25uZWN0ZWQgYW5kIG1heCBzdXBwb3J0ZWQgdXNiX3NzcF9yYXRlDQo+
ICogUmVwb3J0IHRoZSBkZXZpY2Ugc3VibGluayBzcGVlZHMgYmFzZSBvbiB0aGUgdXNiX3NzcF9y
YXRlIGluIHRoZSBCT1MNCj4gICBkZXNjcmlwdG9yDQo+ICogSW50cm9kdWNlIGdhZGdldCBvcHMg
dG8gc2VsZWN0IFN1cGVyU3BlZWQgUGx1cyB2YXJpb3VzIHRyYW5zZmVyIHJhdGUgYW5kIGxhbmUN
Cj4gICBjb3VudA0KPiAqIFVwZGF0ZSBkd2MzIGRyaXZlciB0byBzdXBwb3J0IHRoZSBhYm92ZSBj
aGFuZ2VzDQo+DQo+IENoYW5nZXMgaW4gdjc6DQo+ICAtIEdyZWcgcGlja2VkIHVwIHRoZSBmaXJz
dCBmZXcgcGF0Y2hlcyBvZiB0aGUgc2VyaWVzIHRvIGhpcyB1c2ItdGVzdGluZw0KPiAgICBicmFu
Y2guIFJlYmFzZSB0aGUgcmVtYWluaW5nIHBhdGNoZXMgb24gR3JlZydzIHVzYi10ZXN0aW5nIGJy
YW5jaA0KPg0KPiBDaGFuZ2VzIGluIHY2Og0KPiAgLSBSZWJhc2Ugb24gR3JlZydzIHVzYi10ZXN0
aW5nIGJyYW5jaA0KPiAgLSBVcGRhdGUgY292ZXIgbGV0dGVyIGFuZCB0aXRsZSBzaW5jZSB0aGVy
ZSBhcmUgbWFueSB1cGRhdGVzDQo+ICAgICogUHJldmlvdXMgdmVyc2lvbiA1OiBodHRwczovL2xv
cmUua2VybmVsLm9yZy9saW51eC11c2IvY292ZXIuMTYwMTAwMTE5OS5naXQuVGhpbmguTmd1eWVu
QHN5bm9wc3lzLmNvbS8NCj4gIC0gVG8gc2ltcGxpZnkgdGhpbmdzLCB1c2UgdXNiX3NzcF9yYXRl
IGVudW0gdG8gc3BlY2lmeSB0aGUgc2lnbmFsaW5nIHJhdGUNCj4gICAgZ2VuZXJhdGlvbiBhbmQg
bGFuZSBjb3VudCBpbnN0ZWFkIG9mIHNlcGFyYXRlbHkgdHJhY2tpbmcgdGhlbS4NCj4gIC0gQ29u
dmVydCB0aGUgc3VibGluayBzcGVlZCBhdHRyaWJ1dGVzIHRvIG1hY3JvcyBhbmQgbW92ZSBpdCB0
byB1YXBpDQo+ICAtIFJlbW92ZSB1c2Jfc3VibGlua19zcGVlZCBzdHJ1Y3QNCj4gIC0gUmVtb3Zl
ICJ1c2I6IGR3YzM6IGdhZGdldDogUmVwb3J0IHN1Ymxpbmsgc3BlZWQgY2FwYWJpbGl0eSINCj4g
IC0gVXBkYXRlIGR3YzMgdG8gc3VwcG9ydCB0aGUgbmV3IGNoYW5nZXMNCj4NCj4gQ2hhbmdlcyBp
biB2NToNCj4gIC0gUmViYXNlIG9uIEZlbGlwZSdzIHRlc3RpbmcvbmV4dCBicmFuY2gNCj4gIC0g
Q2hhbmdlZCBTaWduZWQtb2ZmLWJ5IGVtYWlsIHRvIG1hdGNoIEZyb206IGVtYWlsIGhlYWRlcg0K
PiAgLSBBZGQgUm9iJ3MgUmV2aWV3ZWQtYnkNCj4NCj4gQ2hhbmdlcyBpbiB2NDoNCj4gIC0gSW5z
dGVhZCBvZiB1c2luZyBhIHNpbmdsZSBmdW5jdGlvbiB0byBwYXJzZSAibWF4aW11bS1zcGVlZCIg
cHJvcGVydHkgZm9yDQo+ICAgIHNwZWVkLCBnZW4gWCwgYW5kIG51bWJlciBvZiBsYW5lcywgc3Bs
aXQgdGhvc2UgdGFza3MgdG8gc2VwYXJhdGUgY29tbW9uDQo+ICAgIGZ1bmN0aW9ucw0KPiAgLSBS
ZXZpc2UgRFdDMyBkcml2ZXIgdG8gdXNlIHRob3NlIG5ldyBjb21tb24gZnVuY3Rpb25zDQo+ICAt
IEZpeCBjaGVja3BhdGNoIHdhcm5pbmdzIGZvciB1c2luZyAidW5zaWduZWQiIHJhdGhlciB0aGFu
ICJ1bnNpZ25lZCBpbnQiIGFuZA0KPiAgICBtaXNzaW5nIGlkZW50aWZpZXIgbmFtZSBpbiB1ZGNf
c2V0X251bV9sYW5lc19hbmRfc3BlZWQgZ2FkZ2V0IG9wcw0KPg0KPiBDaGFuZ2VzIGluIHYzOg0K
PiAgLSBSZW1vdmUgIm51bS1sYW5lcyIgYW5kICJsYW5lLXNwZWVkLW1hbnRpc3NhLWdicHMiIGNv
bW1vbiBwcm9wZXJ0aWVzDQo+ICAtIFJlbW92ZSAibnVtLWxhbmVzIiBhbmQgImxhbmUtc3BlZWQt
bWFudGlzc2EtZ2JwcyIgcHJvcGVydGllcyB2YWxpZGF0aW9uIGluIGR3YzMNCj4gIC0gVXBkYXRl
ICJtYXhpbXVtLXNwZWVkIiB0byBzdXBwb3J0IHZhcmlhdGlvbnMgb2YgU1NQIEdlbiBYIHggWQ0K
PiAgLSBVcGRhdGUgY29tbW9uIGZ1bmN0aW9uIHRvIHBhcnNlIG5ldyBzdHJpbmdzIGZvciAibWF4
aW11bS1zcGVlZCINCj4gIC0gVXBkYXRlIGNvbW1pdCBtZXNzYWdlcyBmb3IgdGhlIG5ldyBjaGFu
Z2VzDQo+DQo+IENoYW5nZXMgaW4gdjI6DQo+ICAtIE1vdmUgdXNiX3N1Ymxpbmtfc3BlZWQgYXR0
cmlidXRlIHN0cnVjdCBhbmQgZW51bSB0byBpbmNsdWRlL2xpbnV4L3VzYi9jaDkuaA0KPiAgLSBV
c2UgIm51bS1sYW5lcyIgYW5kICJsYW5lLXNwZWVkLW1hbnRpc3NhLWdicHMiIGFzIGNvbW1vbiBw
cm9wZXJ0aWVzIGluc3RlYWQNCj4gIC0gQWRkIGNvbW1vbiBmdW5jdGlvbnMgdG8gZ2V0IG51bS1s
YW5lcyBhbmQgbHNtIHByb3BlcnRpZXMNCj4gIC0gRml4IG1pc3NpbmcgZ2VuMXgyIHN1Ymxpbmsg
c3BlZWQgYXR0cmlidXRlIGNoZWNrIHJlcG9ydCBpbiBkd2MzDQo+DQo+DQo+IFRoaW5oIE5ndXll
biAoNik6DQo+ICAgZHQtYmluZGluZzogdXNiOiBJbmNsdWRlIFVTQiBTU1AgcmF0ZXMgaW4gR2Vu
WHhZDQo+ICAgdXNiOiBjb21tb246IFBhcnNlIGZvciBVU0IgU1NQIGdlblh4WQ0KPiAgIHVzYjog
ZHdjMzogY29yZTogQ2hlY2sgbWF4aW11bV9zcGVlZCBTU1AgZ2VuWHhZDQo+ICAgdXNiOiBkd2Mz
OiBnYWRnZXQ6IEltcGxlbWVudCBzZXR0aW5nIG9mIFNTUCByYXRlDQo+ICAgdXNiOiBkd2MzOiBn
YWRnZXQ6IFRyYWNrIGNvbm5lY3RlZCBTU1AgcmF0ZSBhbmQgbGFuZSBjb3VudA0KPiAgIHVzYjog
ZHdjMzogZ2FkZ2V0OiBTZXQgc3BlZWQgb25seSB1cCB0byB0aGUgbWF4IHN1cHBvcnRlZA0KPg0K
PiAgLi4uL2RldmljZXRyZWUvYmluZGluZ3MvdXNiL3VzYi55YW1sICAgICAgICAgIHwgIDMgKw0K
PiAgZHJpdmVycy91c2IvY29tbW9uL2NvbW1vbi5jICAgICAgICAgICAgICAgICAgIHwgMjYgKysr
KystDQo+ICBkcml2ZXJzL3VzYi9kd2MzL2NvcmUuYyAgICAgICAgICAgICAgICAgICAgICAgfCAz
NyArKysrKysrKysNCj4gIGRyaXZlcnMvdXNiL2R3YzMvY29yZS5oICAgICAgICAgICAgICAgICAg
ICAgICB8ICA5ICsrKw0KPiAgZHJpdmVycy91c2IvZHdjMy9nYWRnZXQuYyAgICAgICAgICAgICAg
ICAgICAgIHwgODAgKysrKysrKysrKysrKysrKysrLQ0KPiAgaW5jbHVkZS9saW51eC91c2IvY2g5
LmggICAgICAgICAgICAgICAgICAgICAgIHwgMTEgKysrDQo+ICA2IGZpbGVzIGNoYW5nZWQsIDE2
MiBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQ0KPg0KPg0KPiBiYXNlLWNvbW1pdDogN2E3
OWYxZjdmN2U3NWU1MzJjNWE4MDNhYjNlYmY0MmEzZTc5NDk3Yw0KDQpMZXQgbWUga25vdyBpZiB0
aGVyZSdzIGFueSBpc3N1ZSB3aXRoIHRoZXNlIHJlbWFpbmluZyBwYXRjaGVzLiBJdCdkIGJlDQpn
cmVhdCBpZiB0aGV5IGNhbiBnbyBvbiB0aGUgIm5leHQiIGJyYW5jaCBhdCBzb21lIHBvaW50Lg0K
DQpUaGFua3MsDQpUaGluaA0K
