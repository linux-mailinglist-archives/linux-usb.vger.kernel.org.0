Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 178002B6B89
	for <lists+linux-usb@lfdr.de>; Tue, 17 Nov 2020 18:17:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727652AbgKQRQb (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 17 Nov 2020 12:16:31 -0500
Received: from smtprelay-out1.synopsys.com ([149.117.73.133]:39590 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727145AbgKQRQa (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 17 Nov 2020 12:16:30 -0500
Received: from mailhost.synopsys.com (badc-mailhost3.synopsys.com [10.192.0.81])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id A71374014A;
        Tue, 17 Nov 2020 17:16:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1605633389; bh=ZoOSsAaEtO3B+R5x1Lz6Q3wi/Hf7k/n33nHKTOURTUg=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=RzQ9dxQgYD9PCEuT45FRcrMd6aFnUjC5W9syW62eDFBBAJBRNR+d3qrn+sioa8Sos
         BfZrtPOBF9dDJexUpLuPyadMpp9DQsWBDvXx1n0CUNB0h6i/7wtnGLoCqeZOLchjA/
         Z/1RKG5PumoEQWmNuwR2ec0/A9O6xO1ULiUbjdOmqD4CRhhDx1DjfhhX6eb2ldOFvs
         sIzDTMePrE4IAB0jvBFe/91yRvDktZntfzmlYOssTMo/HrbsSGtRgZG/HZNVccK1ds
         jDznHi5cYmryvmqeyp2wLJ+7alGZbl8Ws5C/U0okbh6Ryo07ofNizsXcYzayMJz8vq
         FDelst3X/DG9w==
Received: from o365relay-in.synopsys.com (sv2-o365relay1.synopsys.com [10.202.1.137])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPS id 1EB6EA0068;
        Tue, 17 Nov 2020 17:16:29 +0000 (UTC)
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2177.outbound.protection.outlook.com [104.47.59.177])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client CN "mail.protection.outlook.com", Issuer "GlobalSign Organization Validation CA - SHA256 - G3" (verified OK))
        by o365relay-in.synopsys.com (Postfix) with ESMTPS id DA5A3400FC;
        Tue, 17 Nov 2020 17:16:28 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=joglekar@synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
        dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="UBXUgRot";
        dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BvFjFccZ2I9+abpCyh8F+2wPM3UYTDzzfzbmM24F64TkVAY+TRm2nMr66UUFRz5+jVUpgq+HJOR9K7omBEud8S93ckTwrsOrtBwLfnoLJiJ+HC+6qxsZGWDuNUsWaaZGBmA0Sf9ngZkd4wlu3xJ7PnDyfPA1x1VRtNrP2Kl31gRGoq8dOBlvQm3TdBb+xYN2dUEkhcbGwsk4zPWdu+8S4gwH7CiZyJR/cal3DSbQX3yVYwsvqDpcf1hX8XmbGFxq5C0XEpYukycTHA0SIQP9VhuxPofLM/6sKZc8HHr5ftQW4V1+NNcuW1pmiBcaj1qU2loGKXHvpcFHVGQH4UlYwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZoOSsAaEtO3B+R5x1Lz6Q3wi/Hf7k/n33nHKTOURTUg=;
 b=NPnjbsjOO+MPlS7lwrGz4DpBJOIk9BIgcqGDNVZpEUZBhJRIn4qQXqzK4sAayoJFr+H4F+BJ8ZQDcDRhyy9uR2zhlFEK8ZBDPUUeAWk26RKeF/JtNog5IWH/EnPYmM4c02eca0vFcmI3G6pwNYzGlgrxH9F5ks91r+XKL++wOv19mtRjFcGSEZ73qbdYXuvXR+DyC+/Py2wnbnfbKMFJlyYIR38w7VisL2FBNH8m7nNPKi9ln+z+h2zYshCq47WmoScVggwuDBehVwHExPoPFS426xanmd34Qnk3CXAn+irYaP+OTB8i6XyvUxsUH+FV4re9csHazS4YHh3NgiCUHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZoOSsAaEtO3B+R5x1Lz6Q3wi/Hf7k/n33nHKTOURTUg=;
 b=UBXUgRottfgUSPgu8i4+aJBVwUk7zRI4aWgnGlyhDb5BuW2IbhNt35xa1glZPnGys04LvczRt6sZoKr4kd3Jzh2dfL/51UPAU/tO46aI+XC4yUmBrUbrAVUbj52mGcRfPn2KAJCMNWnSzF947KJusgBY+GTPHRPEWJqYiUo+P4Y=
Received: from DM6PR12MB4895.namprd12.prod.outlook.com (2603:10b6:5:1bc::22)
 by DM6PR12MB2874.namprd12.prod.outlook.com (2603:10b6:5:15e::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3564.28; Tue, 17 Nov
 2020 17:16:27 +0000
Received: from DM6PR12MB4895.namprd12.prod.outlook.com
 ([fe80::18f1:8769:1bdb:1781]) by DM6PR12MB4895.namprd12.prod.outlook.com
 ([fe80::18f1:8769:1bdb:1781%8]) with mapi id 15.20.3541.025; Tue, 17 Nov 2020
 17:16:27 +0000
X-SNPS-Relay: synopsys.com
From:   Tejas Joglekar <Tejas.Joglekar@synopsys.com>
To:     Felipe Balbi <balbi@kernel.org>,
        Mathias Nyman <mathias.nyman@intel.com>
CC:     John Youn <John.Youn@synopsys.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v5 0/3] Add logic to consolidate TRBs for Synopsys xHC
Thread-Topic: [PATCH v5 0/3] Add logic to consolidate TRBs for Synopsys xHC
Thread-Index: AQHWo7zmdDYgLgZVXkaCKqwDDPH0oqmr1n8AgAFTDQCAAAqzAIAOMfkAgAiKJwCACNLogA==
Date:   Tue, 17 Nov 2020 17:16:27 +0000
Message-ID: <bee80593-4e7a-d754-7e44-57c690add934@synopsys.com>
References: <cover.1602853270.git.joglekar@synopsys.com>
 <aa3865cf-1cbd-5d3d-8808-f89d6e0c044e@synopsys.com>
 <09737ac8-66a0-564c-2f1c-60a92ec716b5@linux.intel.com>
 <d84e4b5c-0d7a-50e2-25a1-5be1da9ca72a@synopsys.com>
 <9e03c829-4ead-b35f-da28-6cd4906ac2cb@synopsys.com>
 <ee43cef6-7899-fbf8-6f9b-c12269b320a6@synopsys.com>
In-Reply-To: <ee43cef6-7899-fbf8-6f9b-c12269b320a6@synopsys.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=synopsys.com;
x-originating-ip: [49.207.204.196]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 09598ff7-d277-406c-604f-08d88b1c847e
x-ms-traffictypediagnostic: DM6PR12MB2874:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR12MB287406E89B3B11E7136E6567A4E20@DM6PR12MB2874.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: tfTTQzKDm4Mk4J50rGQ1HkfzAbtYiM7Ck6Ua7zKJdHQUzjP2lWSjd5f/xqhyh+8UTdXQ9mut5etFe0ENA9yvgO6GKPs+BUQtOZKbiWarxoznJ42nWk9hE4BPWFEUBAjXwMAB1Qe7rQ5INMd3opcM+h6MCKpItZLoZBqWv3BjbrLp7cV8eYB0CtQjjxrfQfkUIh+uEEvgRg4YXVMGF8sKJrNdLHcxy+oi3bskPyzbk2NRT5WFpN1HhrlBRtteLK57Cwd3E1JR/WmOc1DF+xaghjgr3kPsAfqC+yKSGnTGzqytBP3ZGSMn7kj/7tPy9Iov
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR12MB4895.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(396003)(39860400002)(346002)(366004)(136003)(6512007)(478600001)(54906003)(5660300002)(64756008)(71200400001)(36756003)(83380400001)(2616005)(6486002)(66476007)(8936002)(76116006)(91956017)(66556008)(66446008)(8676002)(86362001)(26005)(186003)(53546011)(55236004)(31696002)(110136005)(316002)(6506007)(4326008)(2906002)(31686004)(66946007);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: HfIbAwOAP8tusyJghZkFlzgwSsDLlwjB9ymwjglK+RXoR5la2gdePyBNxeMPUOs/hnFAdJ4nnbnknDl3JFuDSWKntclv9YavvEj29dlAk5/7rJmycznZ7S+AL7IE/knBo1XlUYRGHjRBbwBJB5g3kMxEwyq+ndwrEUIsaBbo9GfcL59FfT7ZVwiIujvqvWVofWPgZ6nZX2Y3SO4lLhX+W7kHkOJrFTiyJDzd4+e6fBIwdUnlcPD+7Tte9wQYHAdaoa2VS9LTPdODc9AWMG43gPfe2zU0h/6XabkJmjYVq0s6vSyw7+C8npoY4jpS0ZwkI2aDmagZ5LMadKBMxrI6kYEx0fSkX9R3ZOoNxg3R/qCEMZMf0+7STX7+K2Khd5FggEsb2rFy1bk2pM7nBz5dpacBADqk1DKXNoJfLEXM3iqpNeV54/ZNzN5ZeShQmeEqtP5CAB4VXK/j29WeCv/1WyNRqbUP940o91inF22NuciZiETs7u+zRPISEBvexpfIZ2OaWPt/0/Rro6qhV3AOiwFMNvv+jfJRvq+DUwacEgWWEo9j3QRYBn41uECbFUiUcAjC1bmoUqqZjRttCV8BpyVXBhvHKPs8hrpYLW58aZ2un0HV8L/FT5cnhNK27LYgG2VkdSZmpYAd230UuIjRpA==
Content-Type: text/plain; charset="utf-8"
Content-ID: <C9E845346BD0244AB70EDEECACB9BD3C@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB4895.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 09598ff7-d277-406c-604f-08d88b1c847e
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Nov 2020 17:16:27.0149
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: J8lCbcrcZYroL8jP+PkdKqbsr+dcv6+qE6xulkulJycxgIAxuzo+LHXa67bcwV2hFziNFcjsDxZN1PUKtoSc2g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB2874
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

SGVsbG8gTWF0aGlhcywNCk9uIDExLzEyLzIwMjAgODowMSBBTSwgVGVqYXMgSm9nbGVrYXIgd3Jv
dGU6DQo+IEhpLA0KPiBPbiAxMS82LzIwMjAgOTozNiBQTSwgVGVqYXMgSm9nbGVrYXIgd3JvdGU6
DQo+PiBIaSBGZWxpcGUsDQo+PiBPbiAxMC8yOC8yMDIwIDg6NTAgUE0sIFRlamFzIEpvZ2xla2Fy
IHdyb3RlOg0KPj4+IEhpLA0KPj4+IE9uIDEwLzI4LzIwMjAgODoxMiBQTSwgTWF0aGlhcyBOeW1h
biB3cm90ZToNCj4+Pj4gT24gMjcuMTAuMjAyMCAyMC4yOCwgVGVqYXMgSm9nbGVrYXIgd3JvdGU6
DQo+Pj4+PiBIaSBNYXRoaWFzLA0KPj4+Pj4gT24gMTAvMTYvMjAyMCA2OjM0IFBNLCBUZWphcyBK
b2dsZWthciB3cm90ZToNCj4+Pj4+PiBUaGUgU3lub3BzeXMgeEhDIGhhcyBhbiBpbnRlcm5hbCBU
UkIgY2FjaGUgb2Ygc2l6ZSBUUkJfQ0FDSEVfU0laRSBmb3INCj4+Pj4+PiBlYWNoIGVuZHBvaW50
LiBUaGUgZGVmYXVsdCB2YWx1ZSBmb3IgVFJCX0NBQ0hFX1NJWkUgaXMgMTYgZm9yIFNTIGFuZCA4
DQo+Pj4+Pj4gZm9yIEhTLiBUaGUgY29udHJvbGxlciBsb2FkcyBhbmQgdXBkYXRlcyB0aGUgVFJC
IGNhY2hlIGZyb20gdGhlDQo+Pj4+Pj4gdHJhbnNmZXIgcmluZyBpbiBzeXN0ZW0gbWVtb3J5IHdo
ZW5ldmVyIHRoZSBkcml2ZXIgaXNzdWVzIGEgc3RhcnQNCj4+Pj4+PiB0cmFuc2ZlciBvciB1cGRh
dGUgdHJhbnNmZXIgY29tbWFuZC4NCj4+Pj4+Pg0KPj4+Pj4+IEZvciBjaGFpbmVkIFRSQnMsIHRo
ZSBTeW5vcHN5cyB4SEMgcmVxdWlyZXMgdGhhdCB0aGUgdG90YWwgYW1vdW50IG9mDQo+Pj4+Pj4g
Ynl0ZXMgZm9yIGFsbCBUUkJzIGxvYWRlZCBpbiB0aGUgVFJCIGNhY2hlIGJlIGdyZWF0ZXIgdGhh
biBvciBlcXVhbCB0bw0KPj4+Pj4+IDEgTVBTLiBPciB0aGUgY2hhaW4gZW5kcyB3aXRoaW4gdGhl
IFRSQiBjYWNoZSAod2l0aCBhIGxhc3QgVFJCKS4NCj4+Pj4+Pg0KPj4+Pj4+IElmIHRoaXMgcmVx
dWlyZW1lbnQgaXMgbm90IG1ldCwgdGhlIGNvbnRyb2xsZXIgd2lsbCBub3QgYmUgYWJsZSB0bw0K
Pj4+Pj4+IHNlbmQgb3IgcmVjZWl2ZSBhIHBhY2tldCBhbmQgaXQgd2lsbCBoYW5nIGNhdXNpbmcg
YSBkcml2ZXIgdGltZW91dCBhbmQNCj4+Pj4+PiBlcnJvci4NCj4+Pj4+Pg0KPj4+Pj4+IFRoaXMg
cGF0Y2ggc2V0IGFkZHMgbG9naWMgdG8gdGhlIFhIQ0kgZHJpdmVyIHRvIGRldGVjdCBhbmQgcHJl
dmVudCB0aGlzDQo+Pj4+Pj4gZnJvbSBoYXBwZW5pbmcgYWxvbmcgd2l0aCB0aGUgcXVpcmsgdG8g
ZW5hYmxlIHRoaXMgbG9naWMgZm9yIFN5bm9wc3lzDQo+Pj4+Pj4gSEFQUyBwbGF0Zm9ybS4NCj4+
Pj4+Pg0KPj4+Pj4+IEJhc2VkIG9uIE1hdGhpYXMncyBmZWVkYmFjayBvbiBwcmV2aW91cyBpbXBs
ZW1lbnRhdGlvbiB3aGVyZSBjb25zb2xpZGF0aW9uDQo+Pj4+Pj4gd2FzIGRvbmUgaW4gVFJCIGNh
Y2hlLCB3aXRoIHRoaXMgcGF0Y2ggc2VyaWVzIHRoZSBpbXBsZW1lbnRhdGlvbiBpcyBkb25lDQo+
Pj4+Pj4gZHVyaW5nIG1hcHBpbmcgb2YgdGhlIFVSQiBieSBjb25zb2xpZGF0aW5nIHRoZSBTRyBs
aXN0IGludG8gYSB0ZW1wb3JhcnkNCj4+Pj4+PiBidWZmZXIgaWYgdGhlIFNHIGxpc3QgYnVmZmVy
IHNpemVzIHdpdGhpbiBUUkJfQ0FDSEVfU0laRSBpcyBsZXNzIHRoYW4gTVBTLg0KPj4+Pj4+DQo+
Pj4+Pj4gQ2hhbmdlcyBzaW5jZSB2NDoNCj4+Pj4+PiAgLSBVcGRhdGVkIFtQYXRjaCAzLzNdIHBs
YXRmb3JtIGRhdGEgc3RydWN0dXJlIGluaXRpYWxpemF0aW9uDQo+Pj4+Pj4gIC0gVHJpdmlhbCBj
aGFuZ2VzIGluIGNvbW1pdCB3b3JkaW5ncw0KPj4+Pj4+DQo+Pj4+Pj4gQ2hhbmdlcyBzaW5jZSB2
MzoNCj4+Pj4+PiAgLSBSZW1vdmVkIHRoZSBkdC1iaW5kaW5nIHBhdGNoDQo+Pj4+Pj4gIC0gQWRk
ZWQgbmV3IHBhdGNoIHRvIHBhc3MgdGhlIHF1aXJrIGFzIHBsYXRmb3JtIGRhdGENCj4+Pj4+PiAg
LSBNb2RpZmllZCB0aGUgcGF0Y2ggdG8gc2V0IHRoZSBxdWlyaw0KPj4+Pj4+DQo+Pj4+Pj4gQ2hh
bmdlcyBzaW5jZSB2MjoNCj4+Pj4+PiAgLSBNb2RpZmllZCB0aGUgeGhjaV91bm1hcF90ZW1wX2J1
ZmZlciBmdW5jdGlvbiB0byB1bm1hcCBkbWEgYW5kIGMNCj4+Pj4+PiAgICB0aGUgZG1hIGZsYWcN
Cj4+Pj4+PiAgLSBSZW1vdmVkIFJGQyB0YWcNCj4+Pj4+Pg0KPj4+Pj4+IENoYW5nZXMgc2luY2Ug
djE6DQo+Pj4+Pj4gIC0gQ29tbWVudHMgZnJvbSBHcmVnIGFyZSBhZGRyZXNzZWQgb24gW1BBVENI
IDQvNF0gYW5kIFtQQVRDSCAxLzRdDQo+Pj4+Pj4gIC0gUmVuYW1lZCB0aGUgcHJvcGVydHkgYW5k
IHF1aXJrIGFzIGluIG90aGVyIHBhdGNoZXMgYmFzZWQgb24gW1BBVENIIDEvNF0NCj4+Pj4+Pg0K
Pj4+Pj4+DQo+Pj4+Pj4NCj4+Pj4+PiBUZWphcyBKb2dsZWthciAoMyk6DQo+Pj4+Pj4gICB1c2I6
IHhoY2k6IFNldCBxdWlyayBmb3IgWEhDSV9TR19UUkJfQ0FDSEVfU0laRV9RVUlSSw0KPj4+Pj4+
ICAgdXNiOiB4aGNpOiBVc2UgdGVtcG9yYXJ5IGJ1ZmZlciB0byBjb25zb2xpZGF0ZSBTRw0KPj4+
Pj4+ICAgdXNiOiBkd2MzOiBQYXNzIHF1aXJrIGFzIHBsYXRmb3JtIGRhdGENCj4+Pj4+Pg0KPj4+
Pj4+ICBkcml2ZXJzL3VzYi9kd2MzL2hvc3QuYyAgICAgIHwgIDEwICsrKw0KPj4+Pj4+ICBkcml2
ZXJzL3VzYi9ob3N0L3hoY2ktcGxhdC5jIHwgICAzICsNCj4+Pj4+PiAgZHJpdmVycy91c2IvaG9z
dC94aGNpLXJpbmcuYyB8ICAgMiArLQ0KPj4+Pj4+ICBkcml2ZXJzL3VzYi9ob3N0L3hoY2kuYyAg
ICAgIHwgMTM3ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKystDQo+Pj4+Pj4gIGRy
aXZlcnMvdXNiL2hvc3QveGhjaS5oICAgICAgfCAgIDUgKysNCj4+Pj4+PiAgNSBmaWxlcyBjaGFu
Z2VkLCAxNTUgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkNCj4+Pj4+Pg0KPj4+Pj4gSSBo
YXZlIHJlbW92ZWQgdGhlIGRlcGVuZGVuY3kgb24gc2V0dGluZyBxdWlyayB0aHJvdWdoIGRldmlj
ZSB0cmVlIGJpbmRpbmcNCj4+Pj4+IGFuZCBhZGRlZCB0aGUgcXVpcmsgdXNpbmcgcGxhdGZvcm0g
ZGF0YS4gQ2FuIHlvdSBwbGVhc2UgcmV2aWV3IGFuZCBpZiANCj4+Pj4+IGV2ZXJ5dGhpbmcgbG9v
a3MgT0ssIGNhbiB5b3UgcGxlYXNlIGFkZCB0aGlzIHBhdGNoIHNlcmllcyB0byB5b3VyIHRyZWU/
DQo+Pj4+IFN1cmUsIHRoZXJlIGFyZW4ndCBhbnkgZnVuY3Rpb25hbCBjaGFuZ2VzIHRvIHhoY2kg
c2luY2UgdjMgb2YgdGhpcyBzZXJpZXMgcmlnaHQ/DQo+Pj4+IEFuZCBpZiBJIHJlbWVtYmVyIGNv
cnJlY3RseSBGZWxpcGUgZGlkbid0IGhhdmUgYW55IG9iamVjdGlvbnMgdG8gdGhlIGR3YzMgcGFy
dCBlaXRoZXIuDQo+Pj4+DQo+Pj4gWW91IGFyZSByaWdodCwgdGhlcmUgYXJlIG5vIGZ1bmN0aW9u
YWwgY2hhbmdlcyB0byB4aGNpIHNpbmNlIHYzLg0KPj4+DQo+Pj4+IEZlbGlwZSwgZG8geW91IHdh
bnQgdG8gdGFrZSB0aGUgMy8zIGR3YzMgcGF0Y2ggc2VwYXJhdGVseSBhZnRlciAxLzMgYW5kIDIv
MyBhcmUgaW4sIG9yIHNob3VsZA0KPj4+PiBJIHRha2UgdGhlbSBhbGwsIG9yIGFzayBpZiBHcmVn
IHdvdWxkIGxpa2UgdG8gcGljayB1cCB0aGlzIHNlcmllcz8NCj4+Pj4NCkBNYXRoaWFzOiBDYW4g
eW91IHBsZWFzZSB0YWtlIHVwIDIgcGF0Y2hlcyBhbmQgbWF5IGJlIEZlbGlwZSBjYW4gdGFrZSB1
cCB0aGUgZHdjMyA/DQoNCkl0IHdvdWxkIGhlbHAgaWYgdGhpcyBwYXRjaCBzZXJpZXMgZ29lcyBp
biB1cGNvbWluZyByYy4NCg0KPj4gSG93IHdvdWxkIHlvdSBsaWtlIE1hdGhpYXMgdG8gZ28gYWJv
dXQgbWVyZ2luZyB0aGUgcGF0Y2ggc2VyaWVzPw0KPiBARmVsaXBlOiBBbnkgaW5wdXQgb24gdGhp
cyA/DQo+DQo+DQpUaGFua3MgJiBSZWdhcmRzLA0KDQpUZWphcyBKb2dsZWthcg0KDQo=
