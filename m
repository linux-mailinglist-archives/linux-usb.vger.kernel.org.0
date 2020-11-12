Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9CE132AFEBA
	for <lists+linux-usb@lfdr.de>; Thu, 12 Nov 2020 06:40:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728967AbgKLFij (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 12 Nov 2020 00:38:39 -0500
Received: from smtprelay-out1.synopsys.com ([149.117.87.133]:42868 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726776AbgKLCbf (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 11 Nov 2020 21:31:35 -0500
Received: from mailhost.synopsys.com (sv1-mailhost2.synopsys.com [10.205.2.132])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 8A3AFC00E2;
        Thu, 12 Nov 2020 02:31:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1605148294; bh=tPUiydeXgePdWs7qsRigMZl3G2v8tzao31PwQoQpYaM=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=H1X36TftjDJvPaAwqnmGEHnegYZqJQdHbKyQdZxCxfUIuRPTGgFk79sfGOjf4eZYA
         +i9wea0/2T7In9W/g6vDT8/eqq+/N38X0Cne/t6/diMY6bWC7DXyC5QF7CDLTrUD//
         HIXYXG8uqfhHbOD19ZUi1Hyw4HBiAATQKe4S6sG38y/X7K4EW7UcsECsSvZmNmlV0L
         pWkc7y5bHYeCzs9zrVPL0CuuDEHxwJSIio2SKwqLiy/gcVTmm7OCAcEa1NZ5pmQIYi
         AuSt8L0Q+AufMrWKzhFqrjs3v7q0kvGls10kXGfL2gHe21Y8XhIJs2CZAzwk3qXF8r
         VffW73tuOC3Iw==
Received: from o365relay-in.synopsys.com (us03-o365relay3.synopsys.com [10.4.161.139])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPS id F0A5BA0070;
        Thu, 12 Nov 2020 02:31:32 +0000 (UTC)
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2174.outbound.protection.outlook.com [104.47.58.174])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client CN "mail.protection.outlook.com", Issuer "GlobalSign Organization Validation CA - SHA256 - G3" (verified OK))
        by o365relay-in.synopsys.com (Postfix) with ESMTPS id 3879180268;
        Thu, 12 Nov 2020 02:31:32 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=joglekar@synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
        dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="b6kLpBcM";
        dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GbPcJR+Uq/VDGHC3eIoD4LL3icf8gKjnhBZZfLxlMC5frQP2DzvmeBePmER4lHo0aoF40a1rgreu1Ofi5vSQwDViybk3szdlFY8x3k8EBf/84EGoEW6oiHgPfxHJXvGCs73QRKNv7ywVsgppdy4ciaMcerhR+awUTymN6fiT75fNBV2jtLJxzDt/FScQH3FF8snyROzMvEYrWblRNYJZW+9YpbMNRc2zNzCWiwZ/TVzABwzWLz75kz+P2KWa/JDOaBS7iGUGE3yqdK1YrNMUnkghVb3hrXtPUQ/WKaazhYJtTomDhmTSAtDojsW0aL5V8w1KhSf/veGjd1cVWINYBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tPUiydeXgePdWs7qsRigMZl3G2v8tzao31PwQoQpYaM=;
 b=Dye2AUEk/y+O7vGdzYYdTsssNkeEpNVo5FjDo0EIBQXNE+PU7YVMbk0181gFAhfw4Y1Vk0c1kYGDz9CcsEnHKSLqjx7RcnWJyoEsV4VJZUHQUi5+0oIqfyr74lQguzz+tGfFvO1INoknyWK5uouiMiNbgP1H6XKHSMlCBrfdTXZN58jJJrIVOoINCKpq6mV3xI7VVbiIhxH36pKjw/gBRvc+cP9msXqe7zmj78Ezk0tPGGh5UgzYW/VYeVXQ6kyBIzUQSygl4r97wfSWLFjJLFXbGpZeDo0CFETmu87i4ODGtXBuotNhwnUq5dWsCG/xtMIOw6EQBWyMlC3x0nyecA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tPUiydeXgePdWs7qsRigMZl3G2v8tzao31PwQoQpYaM=;
 b=b6kLpBcMJ9rXRy5JA3ne5FNYuwi2ntrrYQ80fY0raa0F4MyGNUwkDKu7B41EvBpPJ46E0Xa8MpxSBeVzSJnlvM4DChTBA7RWToTXK+TISO8OPc30uos7b/CW/WfTXRL2vbdVkpNuIRxaFwmtt47xw5sSRMtd3eMI/guTQgUeYKg=
Received: from DM5PR12MB1371.namprd12.prod.outlook.com (2603:10b6:3:78::22) by
 DM6PR12MB2668.namprd12.prod.outlook.com (2603:10b6:5:4a::29) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3541.21; Thu, 12 Nov 2020 02:31:29 +0000
Received: from DM5PR12MB1371.namprd12.prod.outlook.com
 ([fe80::41c4:c3c2:b26a:d329]) by DM5PR12MB1371.namprd12.prod.outlook.com
 ([fe80::41c4:c3c2:b26a:d329%4]) with mapi id 15.20.3541.024; Thu, 12 Nov 2020
 02:31:29 +0000
X-SNPS-Relay: synopsys.com
From:   Tejas Joglekar <Tejas.Joglekar@synopsys.com>
To:     Felipe Balbi <balbi@kernel.org>
CC:     John Youn <John.Youn@synopsys.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mathias Nyman <mathias.nyman@intel.com>
Subject: Re: [PATCH v5 0/3] Add logic to consolidate TRBs for Synopsys xHC
Thread-Topic: [PATCH v5 0/3] Add logic to consolidate TRBs for Synopsys xHC
Thread-Index: AQHWo7zmdDYgLgZVXkaCKqwDDPH0oqmr1n8AgAFTDQCAAAqzAIAOMfkAgAiKJwA=
Date:   Thu, 12 Nov 2020 02:31:29 +0000
Message-ID: <ee43cef6-7899-fbf8-6f9b-c12269b320a6@synopsys.com>
References: <cover.1602853270.git.joglekar@synopsys.com>
 <aa3865cf-1cbd-5d3d-8808-f89d6e0c044e@synopsys.com>
 <09737ac8-66a0-564c-2f1c-60a92ec716b5@linux.intel.com>
 <d84e4b5c-0d7a-50e2-25a1-5be1da9ca72a@synopsys.com>
 <9e03c829-4ead-b35f-da28-6cd4906ac2cb@synopsys.com>
In-Reply-To: <9e03c829-4ead-b35f-da28-6cd4906ac2cb@synopsys.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=synopsys.com;
x-originating-ip: [49.207.220.239]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2007ff79-536f-4c0f-5543-08d886b30ffd
x-ms-traffictypediagnostic: DM6PR12MB2668:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR12MB2668FC8568A1980C2267304CA4E70@DM6PR12MB2668.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 5c641J7L7NxAxI+zJMGzsXYdtwMau525xPNFxvoDVgQim8iR+VLT2tvVcMZnyK13QS4jgOjaTlC4PeCXpEpfdWO1bt/8tOT641iE6+WhaDqHzBlA0A+yKd6zkxE5spdE4Ovz0gReYF5WB72J/o+yiFOHQ/guN8t8+T0cdcdvW+geVlYJizDd2lJ9Ce2aStMuKX0ZmjIbWe/Mqmtg83HaxTW/Y7TjGlzrlYJ6BQqCFultwxroSQIIo5PwQAjFHDHd6gCvcX1SI8nV7eaHprP7MEnTkC60OSGOIWQ/jVEUVj8QeD8mzjT9Bt3WPUuvZ/SF
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM5PR12MB1371.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(136003)(346002)(366004)(376002)(39860400002)(31686004)(316002)(2616005)(36756003)(6486002)(478600001)(6512007)(83380400001)(4326008)(186003)(2906002)(76116006)(91956017)(6916009)(66476007)(66946007)(64756008)(66446008)(66556008)(31696002)(54906003)(71200400001)(53546011)(5660300002)(55236004)(6506007)(26005)(86362001)(8676002)(8936002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: si+N/U//ofFD85JsLhO09ICNUPpcRnSfu9uvuN/kj19LZEb8Rt51o69AFKl7b/TuMz4zWZRBHhA0Bpoz7WnKrsrieppAspbQJ+c14/Cp3sBSRXcQidjLMIFLza24kpseHSRVikKHgzlRA4PJMJ3jFENngw7BneH8yqmgsOCwr0sh8aZpupTxS5W5AymtDmL12hPIRNm+mLMh3y2p41D9U+Fgu8Qboz13C4W9U2fSNWcDUX3elyL9CFyQ04XqtOFDonYm5fzDfv3hyt4zpdlNfoTS/lwbOltsa/10nkffXHon7SUc0g+PFUmCT9Eq1dazqlBEnGdLXQwdttRiy5vnGlU1OayLSa5hgGum9vHftMfD50O32f3lyF6zc78jM78tX21Ms7Xryua+ygX3Vglu0PRVylct2IDqSC9Zp8K6z2GCrefIk7mhD7sO2JDbxhEUhcM5ECksNKVGa+x8RkhC8lU2ElBom9CmADime43wjIWzJnXeUQlNdNfjEaN+D3/40IkfPnOvtRrAbUOLwsQ7vGcBZxKtGwaxF4z6lKCUeFkNUiEor+DM5dZqGBJ7gTui9KGrbNdNoOLG3brHBY5Y0d9Hbsm5bMnE9Lr8uG75NB50hjmgu1PDcEk8Ph19HFWwSnftdKqaMi3UgOGxFVhSTDLt+VWVrme3TUV/RcPE8qXMKfEjbmfvqioDs2bGH3kuRxp8hM65BT9IvEqARBVldR51NrGOfa8XoWV5x3d/KL0ywE1nlcZ/kkJZKfEL9cJs6Z7m4BxAGkcmzlcwvBSqvNfEd8oxxC5+nVdW2bMq7lUb1av0xaAVcUn5RZ41meHBHkGo+1fgbHH7pkh8rWTq3NVrvFX37cD51XJfQEy7O7DrO7Pmc9opSuNxHMENfDfEnJf3IFe9MJIQqFa/7ffLFA==
Content-Type: text/plain; charset="utf-8"
Content-ID: <20E83A580C3AA441BA7056646712B7BE@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM5PR12MB1371.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2007ff79-536f-4c0f-5543-08d886b30ffd
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Nov 2020 02:31:29.7734
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 05fRTOow3Xkgy2oKOLEkPsd2O2GfHCtXqx0e2xhXYJ+lj2yIAMPHN/QIapibMLPuqu5gpv/yt1ZoYjo0K/zXqA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB2668
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

SGksDQpPbiAxMS82LzIwMjAgOTozNiBQTSwgVGVqYXMgSm9nbGVrYXIgd3JvdGU6DQo+IEhpIEZl
bGlwZSwNCj4gT24gMTAvMjgvMjAyMCA4OjUwIFBNLCBUZWphcyBKb2dsZWthciB3cm90ZToNCj4+
IEhpLA0KPj4gT24gMTAvMjgvMjAyMCA4OjEyIFBNLCBNYXRoaWFzIE55bWFuIHdyb3RlOg0KPj4+
IE9uIDI3LjEwLjIwMjAgMjAuMjgsIFRlamFzIEpvZ2xla2FyIHdyb3RlOg0KPj4+PiBIaSBNYXRo
aWFzLA0KPj4+PiBPbiAxMC8xNi8yMDIwIDY6MzQgUE0sIFRlamFzIEpvZ2xla2FyIHdyb3RlOg0K
Pj4+Pj4gVGhlIFN5bm9wc3lzIHhIQyBoYXMgYW4gaW50ZXJuYWwgVFJCIGNhY2hlIG9mIHNpemUg
VFJCX0NBQ0hFX1NJWkUgZm9yDQo+Pj4+PiBlYWNoIGVuZHBvaW50LiBUaGUgZGVmYXVsdCB2YWx1
ZSBmb3IgVFJCX0NBQ0hFX1NJWkUgaXMgMTYgZm9yIFNTIGFuZCA4DQo+Pj4+PiBmb3IgSFMuIFRo
ZSBjb250cm9sbGVyIGxvYWRzIGFuZCB1cGRhdGVzIHRoZSBUUkIgY2FjaGUgZnJvbSB0aGUNCj4+
Pj4+IHRyYW5zZmVyIHJpbmcgaW4gc3lzdGVtIG1lbW9yeSB3aGVuZXZlciB0aGUgZHJpdmVyIGlz
c3VlcyBhIHN0YXJ0DQo+Pj4+PiB0cmFuc2ZlciBvciB1cGRhdGUgdHJhbnNmZXIgY29tbWFuZC4N
Cj4+Pj4+DQo+Pj4+PiBGb3IgY2hhaW5lZCBUUkJzLCB0aGUgU3lub3BzeXMgeEhDIHJlcXVpcmVz
IHRoYXQgdGhlIHRvdGFsIGFtb3VudCBvZg0KPj4+Pj4gYnl0ZXMgZm9yIGFsbCBUUkJzIGxvYWRl
ZCBpbiB0aGUgVFJCIGNhY2hlIGJlIGdyZWF0ZXIgdGhhbiBvciBlcXVhbCB0bw0KPj4+Pj4gMSBN
UFMuIE9yIHRoZSBjaGFpbiBlbmRzIHdpdGhpbiB0aGUgVFJCIGNhY2hlICh3aXRoIGEgbGFzdCBU
UkIpLg0KPj4+Pj4NCj4+Pj4+IElmIHRoaXMgcmVxdWlyZW1lbnQgaXMgbm90IG1ldCwgdGhlIGNv
bnRyb2xsZXIgd2lsbCBub3QgYmUgYWJsZSB0bw0KPj4+Pj4gc2VuZCBvciByZWNlaXZlIGEgcGFj
a2V0IGFuZCBpdCB3aWxsIGhhbmcgY2F1c2luZyBhIGRyaXZlciB0aW1lb3V0IGFuZA0KPj4+Pj4g
ZXJyb3IuDQo+Pj4+Pg0KPj4+Pj4gVGhpcyBwYXRjaCBzZXQgYWRkcyBsb2dpYyB0byB0aGUgWEhD
SSBkcml2ZXIgdG8gZGV0ZWN0IGFuZCBwcmV2ZW50IHRoaXMNCj4+Pj4+IGZyb20gaGFwcGVuaW5n
IGFsb25nIHdpdGggdGhlIHF1aXJrIHRvIGVuYWJsZSB0aGlzIGxvZ2ljIGZvciBTeW5vcHN5cw0K
Pj4+Pj4gSEFQUyBwbGF0Zm9ybS4NCj4+Pj4+DQo+Pj4+PiBCYXNlZCBvbiBNYXRoaWFzJ3MgZmVl
ZGJhY2sgb24gcHJldmlvdXMgaW1wbGVtZW50YXRpb24gd2hlcmUgY29uc29saWRhdGlvbg0KPj4+
Pj4gd2FzIGRvbmUgaW4gVFJCIGNhY2hlLCB3aXRoIHRoaXMgcGF0Y2ggc2VyaWVzIHRoZSBpbXBs
ZW1lbnRhdGlvbiBpcyBkb25lDQo+Pj4+PiBkdXJpbmcgbWFwcGluZyBvZiB0aGUgVVJCIGJ5IGNv
bnNvbGlkYXRpbmcgdGhlIFNHIGxpc3QgaW50byBhIHRlbXBvcmFyeQ0KPj4+Pj4gYnVmZmVyIGlm
IHRoZSBTRyBsaXN0IGJ1ZmZlciBzaXplcyB3aXRoaW4gVFJCX0NBQ0hFX1NJWkUgaXMgbGVzcyB0
aGFuIE1QUy4NCj4+Pj4+DQo+Pj4+PiBDaGFuZ2VzIHNpbmNlIHY0Og0KPj4+Pj4gIC0gVXBkYXRl
ZCBbUGF0Y2ggMy8zXSBwbGF0Zm9ybSBkYXRhIHN0cnVjdHVyZSBpbml0aWFsaXphdGlvbg0KPj4+
Pj4gIC0gVHJpdmlhbCBjaGFuZ2VzIGluIGNvbW1pdCB3b3JkaW5ncw0KPj4+Pj4NCj4+Pj4+IENo
YW5nZXMgc2luY2UgdjM6DQo+Pj4+PiAgLSBSZW1vdmVkIHRoZSBkdC1iaW5kaW5nIHBhdGNoDQo+
Pj4+PiAgLSBBZGRlZCBuZXcgcGF0Y2ggdG8gcGFzcyB0aGUgcXVpcmsgYXMgcGxhdGZvcm0gZGF0
YQ0KPj4+Pj4gIC0gTW9kaWZpZWQgdGhlIHBhdGNoIHRvIHNldCB0aGUgcXVpcmsNCj4+Pj4+DQo+
Pj4+PiBDaGFuZ2VzIHNpbmNlIHYyOg0KPj4+Pj4gIC0gTW9kaWZpZWQgdGhlIHhoY2lfdW5tYXBf
dGVtcF9idWZmZXIgZnVuY3Rpb24gdG8gdW5tYXAgZG1hIGFuZCBjDQo+Pj4+PiAgICB0aGUgZG1h
IGZsYWcNCj4+Pj4+ICAtIFJlbW92ZWQgUkZDIHRhZw0KPj4+Pj4NCj4+Pj4+IENoYW5nZXMgc2lu
Y2UgdjE6DQo+Pj4+PiAgLSBDb21tZW50cyBmcm9tIEdyZWcgYXJlIGFkZHJlc3NlZCBvbiBbUEFU
Q0ggNC80XSBhbmQgW1BBVENIIDEvNF0NCj4+Pj4+ICAtIFJlbmFtZWQgdGhlIHByb3BlcnR5IGFu
ZCBxdWlyayBhcyBpbiBvdGhlciBwYXRjaGVzIGJhc2VkIG9uIFtQQVRDSCAxLzRdDQo+Pj4+Pg0K
Pj4+Pj4NCj4+Pj4+DQo+Pj4+PiBUZWphcyBKb2dsZWthciAoMyk6DQo+Pj4+PiAgIHVzYjogeGhj
aTogU2V0IHF1aXJrIGZvciBYSENJX1NHX1RSQl9DQUNIRV9TSVpFX1FVSVJLDQo+Pj4+PiAgIHVz
YjogeGhjaTogVXNlIHRlbXBvcmFyeSBidWZmZXIgdG8gY29uc29saWRhdGUgU0cNCj4+Pj4+ICAg
dXNiOiBkd2MzOiBQYXNzIHF1aXJrIGFzIHBsYXRmb3JtIGRhdGENCj4+Pj4+DQo+Pj4+PiAgZHJp
dmVycy91c2IvZHdjMy9ob3N0LmMgICAgICB8ICAxMCArKysNCj4+Pj4+ICBkcml2ZXJzL3VzYi9o
b3N0L3hoY2ktcGxhdC5jIHwgICAzICsNCj4+Pj4+ICBkcml2ZXJzL3VzYi9ob3N0L3hoY2ktcmlu
Zy5jIHwgICAyICstDQo+Pj4+PiAgZHJpdmVycy91c2IvaG9zdC94aGNpLmMgICAgICB8IDEzNyAr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrLQ0KPj4+Pj4gIGRyaXZlcnMvdXNiL2hv
c3QveGhjaS5oICAgICAgfCAgIDUgKysNCj4+Pj4+ICA1IGZpbGVzIGNoYW5nZWQsIDE1NSBpbnNl
cnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQ0KPj4+Pj4NCj4+Pj4gSSBoYXZlIHJlbW92ZWQgdGhl
IGRlcGVuZGVuY3kgb24gc2V0dGluZyBxdWlyayB0aHJvdWdoIGRldmljZSB0cmVlIGJpbmRpbmcN
Cj4+Pj4gYW5kIGFkZGVkIHRoZSBxdWlyayB1c2luZyBwbGF0Zm9ybSBkYXRhLiBDYW4geW91IHBs
ZWFzZSByZXZpZXcgYW5kIGlmIA0KPj4+PiBldmVyeXRoaW5nIGxvb2tzIE9LLCBjYW4geW91IHBs
ZWFzZSBhZGQgdGhpcyBwYXRjaCBzZXJpZXMgdG8geW91ciB0cmVlPw0KPj4+IFN1cmUsIHRoZXJl
IGFyZW4ndCBhbnkgZnVuY3Rpb25hbCBjaGFuZ2VzIHRvIHhoY2kgc2luY2UgdjMgb2YgdGhpcyBz
ZXJpZXMgcmlnaHQ/DQo+Pj4gQW5kIGlmIEkgcmVtZW1iZXIgY29ycmVjdGx5IEZlbGlwZSBkaWRu
J3QgaGF2ZSBhbnkgb2JqZWN0aW9ucyB0byB0aGUgZHdjMyBwYXJ0IGVpdGhlci4NCj4+Pg0KPj4g
WW91IGFyZSByaWdodCwgdGhlcmUgYXJlIG5vIGZ1bmN0aW9uYWwgY2hhbmdlcyB0byB4aGNpIHNp
bmNlIHYzLg0KPj4NCj4+PiBGZWxpcGUsIGRvIHlvdSB3YW50IHRvIHRha2UgdGhlIDMvMyBkd2Mz
IHBhdGNoIHNlcGFyYXRlbHkgYWZ0ZXIgMS8zIGFuZCAyLzMgYXJlIGluLCBvciBzaG91bGQNCj4+
PiBJIHRha2UgdGhlbSBhbGwsIG9yIGFzayBpZiBHcmVnIHdvdWxkIGxpa2UgdG8gcGljayB1cCB0
aGlzIHNlcmllcz8NCj4+Pg0KPiBIb3cgd291bGQgeW91IGxpa2UgTWF0aGlhcyB0byBnbyBhYm91
dCBtZXJnaW5nIHRoZSBwYXRjaCBzZXJpZXM/DQpARmVsaXBlOiBBbnkgaW5wdXQgb24gdGhpcyA/
DQoNCg0KVGhhbmtzICYgUmVnYXJkcywNCg0KVGVqYXMgSm9nbGVrYXINCg0KDQo=
