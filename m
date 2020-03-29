Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 15B3519710D
	for <lists+linux-usb@lfdr.de>; Mon, 30 Mar 2020 01:14:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727226AbgC2XOX (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 29 Mar 2020 19:14:23 -0400
Received: from smtprelay-out1.synopsys.com ([149.117.73.133]:53136 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726382AbgC2XOX (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 29 Mar 2020 19:14:23 -0400
Received: from mailhost.synopsys.com (badc-mailhost2.synopsys.com [10.192.0.18])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id B844E43B0F;
        Sun, 29 Mar 2020 23:14:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1585523662; bh=HyLcU5/yWnysP1XeQjJKmNdCNK9++35KT/ihjOPpG8g=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=j/KYb119H39bCnCefohgqNDhPFna8QUTUyxtQVWtsbesNsh4zN+FSDpFG08C/mM7K
         hdCmQ1VOOEj76jGdjGwuyfrMjJeQA54TX2db0WRYwO6qBk+j9VuqR2fULHvNxaJZET
         VM6wwsnTMHtCrsrx8YEfqQX26/RVAezAHf5U7jmHpyNLwA8vgkhe6rNuLQiBK0e0xG
         UQ2WWHRPk//c5la6OCE1PGhtnVqjeCNpXPBpGZkUyPOftJrPY9Hue8XlNYD/pmOXnc
         meTLRKsYMrG79O0Yb6PeRKniaRz05wzpGO9386nnjs1F5gFlnW+s/Ktz1edErhOEUA
         LavPig1LWxy2A==
Received: from US01WEHTC3.internal.synopsys.com (us01wehtc3.internal.synopsys.com [10.15.84.232])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPS id 66154A006C;
        Sun, 29 Mar 2020 23:14:22 +0000 (UTC)
Received: from us01hybrid1.internal.synopsys.com (10.200.27.51) by
 US01WEHTC3.internal.synopsys.com (10.15.84.232) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Sun, 29 Mar 2020 16:14:22 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (10.202.3.67) by
 mrs.synopsys.com (10.200.27.51) with Microsoft SMTP Server (TLS) id
 14.3.408.0; Sun, 29 Mar 2020 16:14:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FszWInuiuhB48CJeGjBnZSnoHAp6YWb4lrfbJ6jlMKDfO0SbUgrkn3oTpG1wO4wDmVc4O0wlPXh10dfwYav7lJiZR9WRagaLdeaiPM/wnH/pkzjdCuA+r/RS5HyqPu3ESz9OsfFjbhMdC/Ks/LYKIZFe+RzF2O94BahCBWe4CzDX6mCjCF8zzU903o5jxRpwVaX5udIxSs9dszfQvBzgwk5elt9ChdsuCEduauluRlOaGfkZIC3eBwdoHcB07/tCZBT89QB8GTlLSFoZQCQ4BvaKbv6J44+x4vCbycLHttdJebF4Y7/gjPYQKuPpiLi+A8I/lPfS5fmVEo1oBca+aA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HyLcU5/yWnysP1XeQjJKmNdCNK9++35KT/ihjOPpG8g=;
 b=E25glK2A4gTkf5E8e0ZBCmwdEdHedJxDRFvxW4Et7hZ88cAiTbKqlR26lXHKZFTLY4uY+gmkMRzbS2vUNT/pRJTPv6vTBaN+ozJ9PhG1uCzHExHUWIKAPBuS9+GfOgTJVJl2HjLMygG4Oo4DpSKEpwPgXyBxMbEebAwK6R+UViVm+xbuOcHRnfaQ/3k8S1rCfrUrOcFBUdjcwoYPdlzrzhbmgS5OLwMHZK7jV3sCvi1raj2BqoxlOxfwZDemCKD272VzrpBiMgaVQCPXZWo83ADmIxHxkowBjmXplsduhcOB/Xvm3TBhHSgoQdS8F3GS3n6ghru9d+iJKIFKQQ8iqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HyLcU5/yWnysP1XeQjJKmNdCNK9++35KT/ihjOPpG8g=;
 b=LFjrbJaI6iM/52ynotsXNi9AiU+I8v74ndJAZ2Yk3mQ0NRciDP9OXZGp3ASbCIPxmDeK/26UkBcG7N9eeamzOMgFBu3uWP4djltI3yiXeis6RfsNUL6OgJW85+Mzye5lPgsevbMJd2UCYClVb7pwZK/h3eYYHz+03Bd5xUHRHRU=
Received: from BYAPR12MB2710.namprd12.prod.outlook.com (2603:10b6:a03:68::11)
 by BYAPR12MB3013.namprd12.prod.outlook.com (2603:10b6:a03:a9::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2856.18; Sun, 29 Mar
 2020 23:14:19 +0000
Received: from BYAPR12MB2710.namprd12.prod.outlook.com
 ([fe80::e5d1:8cdd:a09d:7a08]) by BYAPR12MB2710.namprd12.prod.outlook.com
 ([fe80::e5d1:8cdd:a09d:7a08%7]) with mapi id 15.20.2856.019; Sun, 29 Mar 2020
 23:14:19 +0000
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To:     Felipe Balbi <balbi@kernel.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
CC:     John Youn <John.Youn@synopsys.com>
Subject: Re: [PATCH 1/3] usb: dwc3: gadget: Properly handle failed
 kick_transfer
Thread-Topic: [PATCH 1/3] usb: dwc3: gadget: Properly handle failed
 kick_transfer
Thread-Index: AQHV+N3BzBLybznwZ0OCZe4JISGATKhGk1EAgABcM4CAAmujgIABCAEAgABtNICAAMoBgIATsdoAgAEBm4A=
Date:   Sun, 29 Mar 2020 23:14:19 +0000
Message-ID: <6c86c014-5907-624a-fe11-e347d48d9557@synopsys.com>
References: <cover.1584065705.git.thinhn@synopsys.com>
 <015470a7d9b950df757b1abfecd6ef398ef04710.1584065705.git.thinhn@synopsys.com>
 <874kusgwuz.fsf@kernel.org>
 <c17da637-abf1-75b0-e8bf-737958773e8e@synopsys.com>
 <87o8syf1h6.fsf@kernel.org>
 <08f67bc3-2941-28a2-f1fb-0a3ebdab8559@synopsys.com>
 <878sk0233c.fsf@kernel.org>
 <60d30640-7d0f-d8fb-35d5-44bce15503b1@synopsys.com>
 <87y2rj38ej.fsf@kernel.org>
In-Reply-To: <87y2rj38ej.fsf@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=thinhn@synopsys.com; 
x-originating-ip: [149.117.75.13]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: bd3b49c8-4737-4954-1bd8-08d7d436e8d9
x-ms-traffictypediagnostic: BYAPR12MB3013:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR12MB3013670BD293E1CB8CEADE8AAACA0@BYAPR12MB3013.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 035748864E
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB2710.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(10019020)(39840400004)(376002)(136003)(396003)(346002)(366004)(81166006)(26005)(8936002)(4744005)(186003)(110136005)(31686004)(8676002)(316002)(5660300002)(4326008)(76116006)(2616005)(66946007)(66476007)(66446008)(86362001)(36756003)(64756008)(31696002)(66556008)(71200400001)(107886003)(81156014)(6486002)(478600001)(6506007)(6512007)(2906002);DIR:OUT;SFP:1102;
received-spf: None (protection.outlook.com: synopsys.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 7JudgPqQzCvfUp0g8sXggeUUGt1Pz3n0SEQOa/84ibz8l7DkHG2/oFuYtIs1Ix5Drb0OC1IAOUKq8ligU51q3oM/7qPVTEmMiVtn9HEq5F6NKHUoyw9uNh+fZwzAIPvdx0f1rstqV1kEpYVj6D1VcNexVVuMV9s6MfanVMGk3iOjjiEUQtEQ1Cvoq33tZ02rYf0lqumk6F1206lwsbvvJHsZZ6nG9CYhfxHAli0fNPI/fFAC6bFWKdzGwdEJzy2xu3KA8QaoG/Wn3IL2p1d0qcHkVHOseo9F5GiB7EgeYEwqffjjJrRzj7eu2YqMDeQGBppkuY/pr2V+cffI1Jd46N9//WofIPGOqrrcH2oEVqbhlmVGVJ1Mg9vPf/o2cLyNq9gVyZSojQuPJz0NY5LhtBslrUt5nlVHCr0wxL1BHtzeLMaT++8fPt+VrMOzncd6
x-ms-exchange-antispam-messagedata: ZlzkL1+NTt2SvyX89IHhSaH9DPs9nZ6aA5wlTDugizucr6Xuklw2hjB0yO8IPIlhvuUrCSMWMtPpZX0XeZ3C6q7SC6RxzyMFYY/RmkQc9SMVohwgbIiiDOp9i+TbjcR13G7AcPvkcbVM1DjfF/HSvA==
Content-Type: text/plain; charset="utf-8"
Content-ID: <158E42FA106BEC4A8EB5A10039723944@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: bd3b49c8-4737-4954-1bd8-08d7d436e8d9
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Mar 2020 23:14:19.4820
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: A5RoVIQeJHcbQzA5vZmDdFU95eGzlSPf+9FESkwlb/fw1xzypypEzrvrR8rLq9hVUQrHt23QwhZW8WD4Vx55Tw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3013
X-OriginatorOrg: synopsys.com
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

SGksDQoNCkZlbGlwZSBCYWxiaSB3cm90ZToNCj4gSGksDQo+DQo+IFRoaW5oIE5ndXllbiA8VGhp
bmguTmd1eWVuQHN5bm9wc3lzLmNvbT4gd3JpdGVzOg0KPj4+PiBJZiB3ZSB3YW50IHRvIGFkZCBh
IFdBUk4oKSwgSSB0aGluayB3ZSBzaG91bGQgYWRkIHRoYXQgaW5zaWRlIG9mDQo+Pj4+IGR3YzNf
c2VuZF9nYWRnZXRfZXBfY21kKCkgZnVuY3Rpb24sIGFzIGEgc2VwYXJhdGUgcGF0Y2guIFdlIGNh
biBhbHNvDQo+Pj4+IGp1c3QgbG9vayBhdCB0aGUgdHJhY2Vwb2ludCBmb3IgIm5vIHJlc291cmNl
IiBzdGF0dXMuDQo+Pj4gVGhlICJubyByZXNvdXJjZSIgc3RhdHVzIGlzIGltcG9ydGFudCwgc3Vy
ZS4gQnV0IHVzZXJzIGRvbid0IHVzdWFsbHkgcnVuDQo+Pj4gd2l0aCB0cmFjZXBvaW50cyBlbmFi
bGVkLiBUaGV5J2xsIGhhdmUgYSBub24td29ya2luZyBVU0IgcG9ydCBhbmQgZm9yZ2V0DQo+Pj4g
YWJvdXQgaXQuIElmIHRoZXJlJ3MgYSBXQVJOKCkgdHJpZ2dlcmVkLCB3ZSBhcmUgbW9yZSBsaWtl
bHkgdG8gZ2V0IGJ1Zw0KPj4+IHJlcG9ydHMuDQo+Pj4NCj4+IFVuZGVyc3Rvb2QuIFdlIGNhbiBh
ZGQgYSBXQVJOKCkgdG8gZHdjM19zZW5kX2dhZGdldF9lcF9jbWQoKSBpbiBhDQo+PiBzZXBhcmF0
ZSBwYXRjaC4NCj4gSSB3b3VsZCBwcmVmZXIgdG8gc2VlIHRoZSBXQVJOKCkgcGF0Y2ggaW4gdGhl
IHNhbWUgc2VyaWVzLCBhdA0KPiBsZWFzdC4gQ2FyZSB0byByZXNlbmQgd2l0aCB0aGF0Pw0KPg0K
DQpTdXJlLiBJJ2xsIGRvIHRoYXQuDQoNCkJSLA0KVGhpbmgNCg==
