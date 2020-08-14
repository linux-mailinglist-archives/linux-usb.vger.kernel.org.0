Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CC29B244497
	for <lists+linux-usb@lfdr.de>; Fri, 14 Aug 2020 07:36:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726139AbgHNFg7 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 14 Aug 2020 01:36:59 -0400
Received: from smtprelay-out1.synopsys.com ([149.117.73.133]:46614 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726064AbgHNFg6 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 14 Aug 2020 01:36:58 -0400
Received: from mailhost.synopsys.com (us03-mailhost1.synopsys.com [10.4.17.17])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 5EB12408E1;
        Fri, 14 Aug 2020 05:36:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1597383418; bh=qMIJ4YBh3xjeJjOx4M9hXf9N1/tckwdAQpCWvbXdPck=;
        h=From:To:Subject:Date:References:In-Reply-To:From;
        b=Gig163GD0nApyxX0McwGbgYhFJ8aMIN3StabB0z8BMIPZFcJn+peptn4LdylO68JI
         r4c/87nZSwtEgCt9oryOJhNKr/hz0CEaqxa4QDw42hGUuLrUZ6Q3jqSrGiXbG4P9sp
         xEJjch66bvfegFFG6TKV3AdrbvwRCaD+heP0XgYUf9bUxYsw0hEU+LlgVS0c6fQEMN
         IjTKCfQMN7DnMM47MCMStbGEO42+T/MIz7bOaltxmrfWDy0Wt1hoKdI56T6RoaoSip
         pQUqF2KuvDj0UMxFz5/UGjrt35nKKGyuCrIq6PamTV1acsc3kpkPiYg5pD/SKkxpKQ
         D//YH8XinAUgw==
Received: from o365relay-in.synopsys.com (sv2-o365relay3.synopsys.com [10.202.1.139])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPS id 23C9DA005A;
        Fri, 14 Aug 2020 05:36:57 +0000 (UTC)
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2047.outbound.protection.outlook.com [104.47.66.47])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client CN "mail.protection.outlook.com", Issuer "GlobalSign Organization Validation CA - SHA256 - G3" (verified OK))
        by o365relay-in.synopsys.com (Postfix) with ESMTPS id 790284013B;
        Fri, 14 Aug 2020 05:36:57 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=thinhn@synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
        dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="j/AluJNi";
        dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hfz4ETlMGn70M43Z1zKOLraB5aZHthNQOwCKuPjAlJ/pweu3p3JLKAI7iTcoW7njAK7UI+Msy8/IIUfiaZ7V1OVGgN47ywy2vs2EWP9OvUpHegi5POz8J2je2cw/7RC4nAc17Z9XfnagG5Agaorb224MzCQwaxPHVVv3cSxOymeRnU29e4ur6EoXuwnsl0rnRyiDhaPa7uYRN+fqvHUt2RIi1VV+6OnEO5ysmKhdEJ+DC9oqfYQbyiQna6txCYuWfxEUEJXBSDfvm0vwEMsIzNk6GYIlSfFEDTCBG6xjCuejhOogjkk2+SR2CBco+q3fjFJ2djSSjJ2CNEAprSykoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qMIJ4YBh3xjeJjOx4M9hXf9N1/tckwdAQpCWvbXdPck=;
 b=Qy3pCzcgcJODb9cYxpSlz6aiU8ysVpLzmhOdVbM4++Ax8wk/Kni4N2U4DUOhGXNrZAjlWcH9+KDNvM05QVFWD0q3w7sIJSZ4BjcSipjj2HFkfM/AcUzdQ7UxpqEJSJ70gBnoB2VhdmeNAb3y7nmB7/YzHqsxN/7fj44qS8UdnvLPKI7QB1O1GtrGAWDi8gHyFD9N6uajsdZrgxbJp6KaSIZQKyxm7WJwHGK+T7BlmAfbnrYzaI0Wv/rF9iERJmDljjCfRQI8H2FMLfGpNrXXShIkDUEZTKonU9YXYuZbVN+PbikPWE48VKKyBSeb5xGvRU6RLSASXPC7cPUjJKIk7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qMIJ4YBh3xjeJjOx4M9hXf9N1/tckwdAQpCWvbXdPck=;
 b=j/AluJNilOHt2Fx9aeRdC/o4KR1mvfZPWhJjb5W/DZfYyBi+cc/gKyEoEKSdg1AP11KZ6BxJtmB4AcV5aHefmnS1hnCFRiwR355dWnhFoO4NQZkQfXcNz+y/VxnkacrUO/vLls9gPh62l8A3Tg6ifzxVegdjFlRn8XRbCsETnd8=
Received: from BYAPR12MB2917.namprd12.prod.outlook.com (2603:10b6:a03:130::14)
 by BY5PR12MB3889.namprd12.prod.outlook.com (2603:10b6:a03:1ad::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.22; Fri, 14 Aug
 2020 05:36:56 +0000
Received: from BYAPR12MB2917.namprd12.prod.outlook.com
 ([fe80::c98f:a13f:fd88:c209]) by BYAPR12MB2917.namprd12.prod.outlook.com
 ([fe80::c98f:a13f:fd88:c209%7]) with mapi id 15.20.3283.020; Fri, 14 Aug 2020
 05:36:56 +0000
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To:     Felipe Balbi <balbi@kernel.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Linux USB <linux-usb@vger.kernel.org>
Subject: Re: [PATCH 11/11] dwc3: debugfs: fix checkpatch warnings
Thread-Topic: [PATCH 11/11] dwc3: debugfs: fix checkpatch warnings
Thread-Index: AQHWcTqb7ekmZwlpLkKb02kc+QyDBqk2aXWAgACnMgCAAAa6gA==
Date:   Fri, 14 Aug 2020 05:36:56 +0000
Message-ID: <609defe5-e658-5d93-18af-9613de32f497@synopsys.com>
References: <20200813062532.829720-1-balbi@kernel.org>
 <20200813062532.829720-11-balbi@kernel.org>
 <0f678c7a-f2e1-a8cc-2f7f-75bc92513cc7@synopsys.com>
 <87pn7tolnx.fsf@kernel.org>
In-Reply-To: <87pn7tolnx.fsf@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=synopsys.com;
x-originating-ip: [149.117.7.22]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 44ad0753-30fd-4b76-4340-08d840140ed7
x-ms-traffictypediagnostic: BY5PR12MB3889:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BY5PR12MB388909670FF56C2CB6A1FB4CAA400@BY5PR12MB3889.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:962;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: gsGBn7X29YGmEcUTbHNj0UPhXUTciTrNmMu+7XtPUERjuiH4vAlxv6Ycdge8QCEqyP+Z4q/jZbp5exOKE3qQK6MCgPSgld1bOOHp3B9X4i+/NZDNymkBDgEUvr/1eg4kiZyel3ZfmmykWobu7tG/Ii5uTnHb5ubcjKTdjvGLsrV9QyvBk+zB80lehOdTFeIItUa1cPXwEivBb4T1tJOxW9UT6bUm1WYDKV064d7JvUmok5tFIGaKiR4G4/c6xRY9+LWpF4aieVoMNV28YezCwC6uo0+5vWMQD+1JbmrNJYeYX5+cRR9JGMSQ1cJ+Rt3UPmVXO2WfDbHr/F4yfMrXvmu8xO0CyLbr0l6OYTB90QL6RXqCjSZwi8IZhlPbscJRaKUNqNubMwEvUQMLPJYScBo1f3a5PblreSzPPee3ThZDfhoSWM0Qp+JFhfin+ENtgRnkD3tjuitqoBeloK0CVA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB2917.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(39860400002)(396003)(136003)(366004)(376002)(346002)(966005)(31686004)(478600001)(26005)(71200400001)(186003)(316002)(110136005)(31696002)(36756003)(86362001)(6486002)(2906002)(6506007)(64756008)(66556008)(6512007)(8676002)(5660300002)(2616005)(76116006)(66946007)(83380400001)(66446008)(66476007)(8936002)(43740500002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: ZcdrANR12btCZHt+2dWS//v+cbVheoxgtEWaPUqNoBzlcx/WgeEV8Fsymi96A8cKQ/qeS8+sIKsBFiqWgBjNzGZ8drpXQ0pqSNRE4lHhPdO5ApJ03AwMwOQRoS86CGnqOwH/Tp4y/724yAQsJHcBBPr7DOyECdvJxtbACeaK3FMEuabpfsmg21hGx6DdgGVDbLp8gTvUsTGgMv687T6VaJ91T32qG1RT7BuXvuYe39nn7MQqiIByVyMQV0nC68nB2BVL1X1OkYo/OP7qSwKZcmm0g100Zu1TyMKclAKo0MJjflVbxtRaUQYlWKhor6JUFguIk0vG8tyRG5Khpbyfc9oZ9OUrQBEct7l6tDNkkte3AvdhUVTaPij5hy1kQ+xzsRFq2ODyfCZIDyekfu5++LYAxNO7m3wR30ZyJrwk2LLH2LxWPqnUEhqJfjYdFPz4/3wcvWTmCG7Hf1LEfUrRdjZL3/Wd5bqV+VIGfcXd8BYeFiFAwPA21FGOglNEqeOgu9cvAfsJmVjPz7HfbbXfEZHbr0rqM717qnEh0+LzBOlHUOK0UtVTBWn2ohUqiu7QPcYxsNoycOuMrdC4xEoxOhdCdvhwL3i7EEhX+B/Li7RWQJUbU+iHYrc/yxzuMhIa6xCdVUvPCTttVvEz1XY1hw==
Content-Type: text/plain; charset="utf-8"
Content-ID: <00600B8FC486F04CA24D073FA9B4A939@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB2917.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 44ad0753-30fd-4b76-4340-08d840140ed7
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Aug 2020 05:36:56.4227
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RxgGR4K8oNeoHXIBz5BTVPJLuQe+bBYZJY2dr+zK10FJlca4ZEfxgKYTVioJ96fJg602yymz5zJSLyqi4PEYVg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB3889
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

RmVsaXBlIEJhbGJpIHdyb3RlOg0KPiBUaGluaCBOZ3V5ZW4gPFRoaW5oLk5ndXllbkBzeW5vcHN5
cy5jb20+IHdyaXRlczoNCj4NCj4+IEhpIEZlbGlwZSwNCj4+DQo+PiBiYWxiaUBrZXJuZWwub3Jn
IHdyb3RlOg0KPj4+IEZyb206IEZlbGlwZSBCYWxiaSA8YmFsYmlAa2VybmVsLm9yZz4NCj4+Pg0K
Pj4+IG5vIGZ1bmN0aW9uYWwgY2hhbmdlcw0KPj4+DQo+Pj4gU2lnbmVkLW9mZi1ieTogRmVsaXBl
IEJhbGJpIDxiYWxiaUBrZXJuZWwub3JnPg0KPj4+IC0tLQ0KPj4+ICBkcml2ZXJzL3VzYi9kd2Mz
L2RlYnVnZnMuYyB8IDU2ICsrKysrKysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0tLS0tLS0tDQo+
Pj4gIDEgZmlsZSBjaGFuZ2VkLCAyNiBpbnNlcnRpb25zKCspLCAzMCBkZWxldGlvbnMoLSkNCj4+
Pg0KPj4gVGhlc2UgY2hlY2twYXRjaCBmaXhlcyB3aWxsIGNyZWF0ZSBtYW55IGNvbmZsaWN0cyB0
byB0aGUgcGF0Y2hlcyBJDQo+PiBzdWJtaXR0ZWQuDQo+Pg0KPj4gRGlkIHlvdSBnZXQgYSBjaGFu
Y2UgdG8gdGFrZSBhIGxvb2sgYXQgdGhlbSB5ZXQgYmVmb3JlIEkgcmV2aXNlIHRoZW0gdG8NCj4+
IGJlIGFibGUgdG8gcmViYXNlIG9uIHlvdXIgdGVzdGluZy9uZXh0IGJyYW5jaD8NCj4gV2hpY2gg
cGF0Y2hlcyBzcGVjaWZpY2FsbHkgZG8geW91IGhhdmUgaW4gbWluZD8gSSBjYW4gcmViYXNlIG15
IHBhdGNoZXMNCj4gb24gdG9wIG9mIHlvdXJzLCBzaG91bGRuJ3QgYmUgYSBiaWcgaXNzdWUuDQo+
DQoNCklmIHBvc3NpYmxlLCBjYW4geW91IHJlYmFzZSBvbiB0b3Agb2YgdGhlc2UgMiBzZXJpZXMg
b2YgZml4ZXM6DQoNClNlcmllcyAxOiBbUEFUQ0ggdjIgMC83XSB1c2I6IGR3YzM6IGdhZGdldDog
Rml4IFRSQiBwcmVwYXJhdGlvbg0KaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtdXNiL2Nv
dmVyLjE1OTY3Njc5OTEuZ2l0LnRoaW5obkBzeW5vcHN5cy5jb20vVC8jdA0KDQpTZXJpZXMgMjog
W1BBVENIIDAvM10gdXNiOiBkd2MzOiBnYWRnZXQ6IEZpeCBoYWx0L2NsZWFyX3N0YWxsIGhhbmRs
aW5nDQpodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC11c2IvY292ZXIuMTU5Njc2Nzk5MS5n
aXQudGhpbmhuQHN5bm9wc3lzLmNvbS9ULyN0DQoNCklmIHRoZXkgbG9vayBvayB0byB5b3UsIHlv
dSBjYW4gcmViYXNlIG9uIHRvcCBvZiB0aGVtLiBUaGF0J2QgaGVscCBtZSBhDQpidW5jaC4NCg0K
SSdsbCBsZXQgdGhlIHNlcmllcyB1cGRhdGluZyBVU0IgMy4yIHNvYWsgZm9yIGEgbGl0dGxlIGxv
bmdlciB0byBmb3IgYW55DQpjb21tZW50LiBJIGNhbiByZWJhc2UgYW5kIHJlc2VuZCB0aGF0IHNl
cmllcyBsYXRlci4NCg0KVGhhbmtzIQ0KVGhpbmgNCg0KDQo=
