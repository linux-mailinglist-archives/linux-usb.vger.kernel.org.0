Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C798C2444E4
	for <lists+linux-usb@lfdr.de>; Fri, 14 Aug 2020 08:16:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726184AbgHNGQo (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 14 Aug 2020 02:16:44 -0400
Received: from smtprelay-out1.synopsys.com ([149.117.73.133]:47900 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726110AbgHNGQn (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 14 Aug 2020 02:16:43 -0400
Received: from mailhost.synopsys.com (sv1-mailhost2.synopsys.com [10.205.2.132])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id B6C7C408DF;
        Fri, 14 Aug 2020 06:16:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1597385802; bh=d5yDCMRC2a5Lk0WWkC1XZekuBQBPOm65rPaQVWj5Q8U=;
        h=From:To:Subject:Date:References:In-Reply-To:From;
        b=ZakbYMAFdSfQu+oIMhkvy7nAxq7lauHTsgnbBUq+1v3nBTeCvf4ZijXhoAE8OwqtF
         Cq7+KqBioikMc2QEEmRZ0mqhJUJPBoUElD3CuCUo1maYa1jG+xHVXQDBm+M+DfWSg9
         tgX2k7n+ByY7vouExMqctBCDbme0uSjhgndhzqQSlaql5Qa5Zl4TRKhq0WDxM/nrn9
         D8lPJvHnMmNdpnZ7PtWVE/vgf+LVwAQs7IqqHA0rXBL8ezMEwRDV6GVacaXv+yG0Xu
         Do1D7GbK2FKFTtkS/FTgz8T8vMsBp1B/b39nZJCGdrYl0QlzSoVJXdgdcMdN7cw3pS
         kl6a/cH1N/iqw==
Received: from o365relay-in.synopsys.com (us03-o365relay3.synopsys.com [10.4.161.139])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPS id 999BCA0077;
        Fri, 14 Aug 2020 06:16:42 +0000 (UTC)
Received: from NAM04-SN1-obe.outbound.protection.outlook.com (mail-sn1nam04lp2055.outbound.protection.outlook.com [104.47.44.55])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client CN "mail.protection.outlook.com", Issuer "GlobalSign Organization Validation CA - SHA256 - G3" (verified OK))
        by o365relay-in.synopsys.com (Postfix) with ESMTPS id 24951810AA;
        Fri, 14 Aug 2020 06:16:41 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=thinhn@synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
        dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="qXgMdTDu";
        dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LzXrkytGWQFlCgQwITuvTNMcYyjJKFH/7cuPk2CJtXH38Dtr0oIZL9dpMg0EUjYRcltUT/WoTdCgkso19hxjyALxkwgv81g8+vDnKNQcuWFrE4OqZzSe4R9/5eMGhC48ya0bJohb7Ml/0fQPUsh7duIxwQZmmUjBse2W8H1J+iujdypXgtehivKgJG+h0u4gEEkTYTVAweLVVYzusXFN/SbiAJaW5vDKrKfLNB+MIY+ozu0T/ZwmwKAZlxvC2THchnFUjCOMwKGii2PS1Fep6VzQhwt5TqCv/mIgVdM3Q5IMxn4oNn/cu/ZcLz3EP9/kOiz8aL3LzDME4lZapX4xNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d5yDCMRC2a5Lk0WWkC1XZekuBQBPOm65rPaQVWj5Q8U=;
 b=g3z7vmOLFdwwbF4JzBdiMaTV19MhpfI/eY5mp+oN/wqXyMXyStjilkuMnjfukWpZkopPaNsv1leA9f5zdHoyTOVyBSaU6x20IzKGQtDbAO81eXNK6T23womvEDfukUU8wz3uKegF71kHiCSEBFAX74NkqrPhPCwY/GTDci1HIRd0onmSbs2TyZ3KYx3/37US0flTl4jSej0lJmW0C/Y2EOBjM8gskrVJ8ZC2w6XiYHoZYGyLtU1QuAtghpsffb5wg2f+RlShwZiJIaAKnrlaYzNEo03Vfqc9suIyP1HphtAyd6J43vkpDGNpSTnRYhmfY3zC/7yACW96KsMao2aiqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d5yDCMRC2a5Lk0WWkC1XZekuBQBPOm65rPaQVWj5Q8U=;
 b=qXgMdTDuogRTkf6aawrSH6bQXuQmgZdkqGbQWtlQarIQ+2FdJRCfQg0vCRJ480O87ErdyuQ1HwfDhmoMgsiCs5DDYvVjfYu2Hc9XsnaxKT51LRb7ZVEl2uUUxBMLbgZafbR2Vz0XZ3nmLcuuH2Ml8Gmj/z56ouTu2XCL3m8k2GA=
Received: from BYAPR12MB2917.namprd12.prod.outlook.com (2603:10b6:a03:130::14)
 by BYAPR12MB2840.namprd12.prod.outlook.com (2603:10b6:a03:62::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3283.15; Fri, 14 Aug
 2020 06:16:39 +0000
Received: from BYAPR12MB2917.namprd12.prod.outlook.com
 ([fe80::c98f:a13f:fd88:c209]) by BYAPR12MB2917.namprd12.prod.outlook.com
 ([fe80::c98f:a13f:fd88:c209%7]) with mapi id 15.20.3283.020; Fri, 14 Aug 2020
 06:16:39 +0000
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To:     Felipe Balbi <balbi@kernel.org>,
        Linux USB <linux-usb@vger.kernel.org>
Subject: Re: [PATCH 11/11] dwc3: debugfs: fix checkpatch warnings
Thread-Topic: [PATCH 11/11] dwc3: debugfs: fix checkpatch warnings
Thread-Index: AQHWcTqb7ekmZwlpLkKb02kc+QyDBqk2aXWAgACnMgCAAAa6gIAACxkA
Date:   Fri, 14 Aug 2020 06:16:39 +0000
Message-ID: <f6b9eeac-577d-c8ca-5701-ee81bb940d5a@synopsys.com>
References: <20200813062532.829720-1-balbi@kernel.org>
 <20200813062532.829720-11-balbi@kernel.org>
 <0f678c7a-f2e1-a8cc-2f7f-75bc92513cc7@synopsys.com>
 <87pn7tolnx.fsf@kernel.org>
 <609defe5-e658-5d93-18af-9613de32f497@synopsys.com>
In-Reply-To: <609defe5-e658-5d93-18af-9613de32f497@synopsys.com>
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
x-ms-office365-filtering-correlation-id: c9ebff3f-a772-42eb-0938-08d840199b38
x-ms-traffictypediagnostic: BYAPR12MB2840:
x-microsoft-antispam-prvs: <BYAPR12MB28408B8A482AF7DADD6C8098AA400@BYAPR12MB2840.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:962;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB2917.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(346002)(136003)(366004)(396003)(376002)(39860400002)(478600001)(6506007)(186003)(64756008)(66946007)(2616005)(31686004)(66476007)(316002)(76116006)(6486002)(36756003)(2906002)(66556008)(8936002)(8676002)(110136005)(6512007)(86362001)(26005)(71200400001)(66446008)(83380400001)(5660300002)(966005)(31696002)(43740500002);DIR:OUT;SFP:1102;
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <3F70F83EA311A9469549AFD0125EC8C2@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB2917.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c9ebff3f-a772-42eb-0938-08d840199b38
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Aug 2020 06:16:39.3507
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: i6CWY+jIiIMnQZbfXUcc/bfkqLO5RApGtC9cg51Ygkm79KirSqQwK/rmju9E2QRC1YwGbvWxuIg+hwUq2Ox1fg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB2840
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

VGhpbmggTmd1eWVuIHdyb3RlOg0KPiBGZWxpcGUgQmFsYmkgd3JvdGU6DQo+PiBUaGluaCBOZ3V5
ZW4gPFRoaW5oLk5ndXllbkBzeW5vcHN5cy5jb20+IHdyaXRlczoNCj4+DQo+Pj4gSGkgRmVsaXBl
LA0KPj4+DQo+Pj4gYmFsYmlAa2VybmVsLm9yZyB3cm90ZToNCj4+Pj4gRnJvbTogRmVsaXBlIEJh
bGJpIDxiYWxiaUBrZXJuZWwub3JnPg0KPj4+Pg0KPj4+PiBubyBmdW5jdGlvbmFsIGNoYW5nZXMN
Cj4+Pj4NCj4+Pj4gU2lnbmVkLW9mZi1ieTogRmVsaXBlIEJhbGJpIDxiYWxiaUBrZXJuZWwub3Jn
Pg0KPj4+PiAtLS0NCj4+Pj4gIGRyaXZlcnMvdXNiL2R3YzMvZGVidWdmcy5jIHwgNTYgKysrKysr
KysrKysrKysrKysrLS0tLS0tLS0tLS0tLS0tLS0tLS0NCj4+Pj4gIDEgZmlsZSBjaGFuZ2VkLCAy
NiBpbnNlcnRpb25zKCspLCAzMCBkZWxldGlvbnMoLSkNCj4+Pj4NCj4+PiBUaGVzZSBjaGVja3Bh
dGNoIGZpeGVzIHdpbGwgY3JlYXRlIG1hbnkgY29uZmxpY3RzIHRvIHRoZSBwYXRjaGVzIEkNCj4+
PiBzdWJtaXR0ZWQuDQo+Pj4NCj4+PiBEaWQgeW91IGdldCBhIGNoYW5jZSB0byB0YWtlIGEgbG9v
ayBhdCB0aGVtIHlldCBiZWZvcmUgSSByZXZpc2UgdGhlbSB0bw0KPj4+IGJlIGFibGUgdG8gcmVi
YXNlIG9uIHlvdXIgdGVzdGluZy9uZXh0IGJyYW5jaD8NCj4+IFdoaWNoIHBhdGNoZXMgc3BlY2lm
aWNhbGx5IGRvIHlvdSBoYXZlIGluIG1pbmQ/IEkgY2FuIHJlYmFzZSBteSBwYXRjaGVzDQo+PiBv
biB0b3Agb2YgeW91cnMsIHNob3VsZG4ndCBiZSBhIGJpZyBpc3N1ZS4NCj4+DQo+IElmIHBvc3Np
YmxlLCBjYW4geW91IHJlYmFzZSBvbiB0b3Agb2YgdGhlc2UgMiBzZXJpZXMgb2YgZml4ZXM6DQo+
DQo+IFNlcmllcyAxOiBbUEFUQ0ggdjIgMC83XSB1c2I6IGR3YzM6IGdhZGdldDogRml4IFRSQiBw
cmVwYXJhdGlvbg0KPiBodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC11c2IvY292ZXIuMTU5
Njc2Nzk5MS5naXQudGhpbmhuQHN5bm9wc3lzLmNvbS9ULyN0DQo+DQo+IFNlcmllcyAyOiBbUEFU
Q0ggMC8zXSB1c2I6IGR3YzM6IGdhZGdldDogRml4IGhhbHQvY2xlYXJfc3RhbGwgaGFuZGxpbmcN
Cg0KQ29ycmVjdCBsaW5rIGZvciBzZXJpZXMgMjoNCmh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xp
bnV4LXVzYi9jb3Zlci4xNTk2MTUxNDM3LmdpdC50aGluaG5Ac3lub3BzeXMuY29tL1QvI3QNCg0K
DQo+IElmIHRoZXkgbG9vayBvayB0byB5b3UsIHlvdSBjYW4gcmViYXNlIG9uIHRvcCBvZiB0aGVt
LiBUaGF0J2QgaGVscCBtZSBhDQo+IGJ1bmNoLg0KPg0KPiBJJ2xsIGxldCB0aGUgc2VyaWVzIHVw
ZGF0aW5nIFVTQiAzLjIgc29hayBmb3IgYSBsaXR0bGUgbG9uZ2VyIHRvIGZvciBhbnkNCj4gY29t
bWVudC4gSSBjYW4gcmViYXNlIGFuZCByZXNlbmQgdGhhdCBzZXJpZXMgbGF0ZXIuDQo+DQoNClRo
YW5rcywNClRoaW5oDQo=
