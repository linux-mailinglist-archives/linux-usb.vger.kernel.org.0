Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0F80C2944F4
	for <lists+linux-usb@lfdr.de>; Wed, 21 Oct 2020 00:10:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2410392AbgJTWKP (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 20 Oct 2020 18:10:15 -0400
Received: from smtprelay-out1.synopsys.com ([149.117.73.133]:35578 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2410356AbgJTWKP (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 20 Oct 2020 18:10:15 -0400
Received: from mailhost.synopsys.com (sv2-mailhost1.synopsys.com [10.205.2.133])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 05DD3402F6;
        Tue, 20 Oct 2020 22:10:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1603231815; bh=svIwGdk6mLTp4Mjv0XfZ6tdTHqKNkIB2eHUlY8hZ9rg=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=KOJj7UxxJOri1Q+6SSujhIdr+zZIfqrwomE8SDgfXPg0EeABLbZ5aMGCFZb0pr60E
         TqJ9GMAvVl4wHSSsTMxsJYahr8GJZX/WCTvlUa/R950UTnDuPVrR7HaIEnOB3LmzyA
         pVnaQ2ueGc7m2jTLQJE02Jcreqti/fh0MyvDd4bR/h5CXl0LuDQOsZklV4WbQkT6eX
         oGzo2kOQ+u1qa0vs8jRZUNIGad8nAKuqK72jGouKKh37voYzWrWYsqXuA94LlsFBfM
         KH5ZCnop/g7Ry4B0oIR2QZci1ljbhPy/DIxbk5HYTmijdYYHcEE+MlNhpZVgPfkMzY
         3gg5XdmgCANwA==
Received: from o365relay-in.synopsys.com (sv2-o365relay3.synopsys.com [10.202.1.139])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPS id AF51DA007C;
        Tue, 20 Oct 2020 22:10:14 +0000 (UTC)
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2043.outbound.protection.outlook.com [104.47.66.43])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client CN "mail.protection.outlook.com", Issuer "GlobalSign Organization Validation CA - SHA256 - G3" (verified OK))
        by o365relay-in.synopsys.com (Postfix) with ESMTPS id 2B11440049;
        Tue, 20 Oct 2020 22:10:14 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=thinhn@synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
        dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="CJdjGoiL";
        dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OEf/UPPkkhlGUxVQcAm6BZNxu7+zakVFOJdf0S+V3KTl7vZXGOkUBAVLm9xsy+TFdg6p99vlBW0pTUPlIhN6YENTRjLah05hNlnhtl1t9RkA5GLOimTLwAZTRM6Diz7nIhcQTmAiHRSKc69QhqGuO3X2rkovsbBfTVng6KofiIFKEjqUcyz6zjPs8Vr8WyfJjjtROPvNRo2BbAC18AjeCXi1DPkAQ6KfUO67DnzDRbw+vOqKnVH6As+b5Og9e9iLq7NbdOGQJORYAUhClYaCHnKLpEvR7RzaKeiFsiQd2XowtCZQUmzxUgW1UsAaN+5O9BhqsN+BbYbT+SsXXYsxdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=svIwGdk6mLTp4Mjv0XfZ6tdTHqKNkIB2eHUlY8hZ9rg=;
 b=S/8WDOTNvs/tzfx7pOzQBdlyZkU0L+LMschXanJCLdXL+MZjh/t0HIe4DBkx4QpPyCnUP+O0Fn4Z40gP0VkNOw23H+f++Z3QMRh7M25OYyUjd1rdExYzNlb3+z8u9Gzav0rW5Q5NHF7vL7/GDZGRCTI6/vzeeHCxonC6AduIT5dcVb7e3zoYtEd7vlZoR0oiG8C7o7Sqy4yxxtziLGSmTH2hzzRbfw6bjD8qKW/SWZVfPZ3flNCcg/5cgN1QVQcO/yKlXfSWySKRIH0GxR51ntCQTLr+qElpTlKzrVfNUFH/xHfJzHGwou+MsA5BWkKArNwURHKQVrbeyG3sMJogFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=svIwGdk6mLTp4Mjv0XfZ6tdTHqKNkIB2eHUlY8hZ9rg=;
 b=CJdjGoiLcHweHmx02fbmqnLyKli6b89vL+8i1aOqkpJwwMaDKjIoNFGl/TPOCEzIXf7gEA6zkRDJd8AEjH8Mvcay02q9DUBeWZdzinVHiQn6ZcywC1E455g7S66fn15iuiDMTRPR3KFEYf7Pa0TrZu/DsrVobHl/2TrzXMe0g/o=
Received: from BYAPR12MB2917.namprd12.prod.outlook.com (20.179.91.142) by
 BY5PR12MB3874.namprd12.prod.outlook.com (10.255.138.143) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3477.25; Tue, 20 Oct 2020 22:10:13 +0000
Received: from BYAPR12MB2917.namprd12.prod.outlook.com
 ([fe80::c17e:c3dd:7cda:e2dc]) by BYAPR12MB2917.namprd12.prod.outlook.com
 ([fe80::c17e:c3dd:7cda:e2dc%4]) with mapi id 15.20.3477.028; Tue, 20 Oct 2020
 22:10:13 +0000
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To:     Ferry Toth <fntoth@gmail.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
CC:     "felipe.balbi-VuQAYsv1563Yd54FQh9/CA@public.gmane.org" 
        <felipe.balbi-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Subject: Re: BUG with linux 5.9.0 with dwc3 in gadget mode
Thread-Topic: BUG with linux 5.9.0 with dwc3 in gadget mode
Thread-Index: AQHWo/slg1BGy5aFnEWs2vXEMG8U96mebg0AgAAaCYCAAeoFAIAAh4qAgAAZ9AA=
Date:   Tue, 20 Oct 2020 22:10:12 +0000
Message-ID: <976cea12-e54e-fbca-6c53-e6ef5c554094@synopsys.com>
References: <913dccca-500d-1938-b199-6eb67cfb60cc@gmail.com>
 <87a6wig461.fsf@kernel.org> <a565dc52-27ab-f5be-4fee-5a8f96d66456@gmail.com>
 <874kmpf583.fsf@kernel.org> <d0aca346-353c-d74e-6f00-ccd2a4ed26ef@gmail.com>
In-Reply-To: <d0aca346-353c-d74e-6f00-ccd2a4ed26ef@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.1
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=synopsys.com;
x-originating-ip: [98.248.94.126]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9159e5a2-d26d-4d5f-b7fe-08d87544ead9
x-ms-traffictypediagnostic: BY5PR12MB3874:
x-microsoft-antispam-prvs: <BY5PR12MB3874DA47F12BBF40812855E9AA1F0@BY5PR12MB3874.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6108;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: jAsTvujyia/y9AgSaXyrPDAMrK7SrUaOD7XKByGY9grEPhMu5Td3w6SCyE89sJYVc5JlpcNcFn6/3Y7m5QVF/k4Zd0oNsCdEOgBUWNXprwtfmONIk3A/f1VMODyqVxv8nslsVcyufuJy2X7u2FWnkw3hNR/JMYwBkyeLO8lY72DCGk/bo9WcWrKrX8SukDriWW/Btg3fz4fHp0LAU49ggF7vc7EtP+xMdOl0qVA0k25Ji2XPfrwO4rr3OJzg5PfZAp7xXedxRUflT8yNY9Fii8VESkmxlWLisdAHWp/tvnP11bX8BuRr/t/8RYxq3tkU87xEHJqZ3KIJaBRrv8wQJC5TZADStwl10Qv+osGELFLs1wtqmRpXz9sD7rQ7/5mz
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB2917.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39850400004)(376002)(136003)(346002)(366004)(396003)(5660300002)(31686004)(76116006)(36756003)(6486002)(6512007)(66446008)(64756008)(4326008)(186003)(66476007)(66556008)(31696002)(316002)(66946007)(26005)(478600001)(8936002)(91956017)(2906002)(86362001)(8676002)(2616005)(6506007)(71200400001)(110136005)(83380400001)(43740500002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: w8Sse0Zjm0AMSJFFMtZ+LhrTD5e60o0yP4zT8Z0Llqn05upXHa1VV0WLdJqRHuSySYIXbxsYm48pKAWmgIlj0jo3YVjoQwWW+E4z4/bLBVj11MvWJ5LUsc58G24mS1Ih4JUvQw5bfG+mbbfzY5wxjpmdYCJSpjmK1erEZ/YZetrb/60EtiBPtL2GbJCt1XXcXtZrxeBFIHYYaWGUhhKq01wQtigeBF+mJ4yrDZnKArrz01SlFGWhk2lijudqBtl0NSQWPJgiyS8esY3WxghUg0l0YrnOQsSPiQtiulBbCb+LFt2/tSCWtU2XfxlPCgYpG6xK8yCMCRvv8TvmwvXyhFNF9s7HsPhAeGSE5viKCA5tzpat5Rz5Oo5mguaVus1n0wHuJKssW9f6nvhPsRu+VPtlvfmDLIyelZCqqqO6MAfw5fTivUIyRQGXFBTLT5OlO4RVVqpS4mEOwLqAaTjGqRjXTDBnvxxs1RTwnZHvAcwIwcUNNDc7xbnLVzZBNfVsqg4eWdlPnSeHmetcRAcWqavKwEAcRw5Eqg1RFwL6KRn5WEbCsX51yGEbNPnnunRLeYvSHqDMwVvwuVirgGTyaPGIJ35mudGd/EPy8q12XIMGjF1ppRBmVKmfycrQX7xpVHsPCNd+i0NZr4aAumPcSw==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <AB20E7F08FB9864BB1C860F37AAA2F79@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB2917.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9159e5a2-d26d-4d5f-b7fe-08d87544ead9
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Oct 2020 22:10:12.9728
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SH+xDzCTLV3/Vi6uhrJU77TK6MqpB2EJjpKzsFDoYoJhagrgqaPM5ZFIxgEipU7Nsgb4GqyFvtc/aYRpL/C1xA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB3874
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

SGksDQoNCkZlcnJ5IFRvdGggd3JvdGU6DQo+IE9wIDIwLTEwLTIwMjAgb20gMTQ6MzIgc2NocmVl
ZiBGZWxpcGUgQmFsYmk6DQo+Pg0KPj4gSGksDQo+Pg0KPj4gRmVycnkgVG90aCA8Zm50b3RoQGdt
YWlsLmNvbT4gd3JpdGVzOg0KPj4NCj4+IDg8IHNuaXANCj4+DQo+Pj4+PiBbwqDCoCAxMi42NTc0
MTZdIENSMjogMDAwMDAwMDEwMDAwMDAwMA0KPj4+Pj4gW8KgwqAgMTIuNjYwNzI5XSAtLS1bIGVu
ZCB0cmFjZSA5YjkyZGVhNmRhMzNjNzFlIF0tLS0NCj4+Pj4NCj4+Pj4gSXQgdGhpcyBzb21ldGhp
bmcgeW91IGNhbiByZXByb2R1Y2Ugb24geW91ciBlbmQ/IEZlcnJ5LCBjYW4geW91IGdldA0KPj4+
PiBkd2MzDQo+Pj4+IHRyYWNlIGxvZ3Mgd2hlbiB0aGlzIGhhcHBlbnM/IGZ0cmFjZV9kdW1wX29u
X29vcHMgbWF5IGhlbHAgaGVyZS4NCj4+PiBJIHdpbGwgZG8gdGhhdCB0b25pZ2h0LiBJcyBmbGlw
cGluZyBvbiBmdHJhY2VfZHVtcF9vbl9vb3BzDQo+Pj4gc3VmZmljaWVudCBvcg0KPj4+IGRvIEkg
bmVlZCB0byBkbyBtb3JlPw0KPj4NCj4+IHlvdSdkIGhhdmUgdG8gZW5hYmxlIGR3YzMgdHJhY2Ug
ZXZlbnRzIGZpcnN0IDstKQ0KPj4NCj4+PiBCVFcgYWZ0ZXIgcG9zdGluZyB0aGlzIEkgZm91bmQg
aW4gaG9zdCBtb2RlIGR3YzMgaXMgbm90IHdvcmtpbmcNCj4+PiBwcm9wZXJseQ0KPj4+IGVpdGhl
ci4gTm8gb29wcywgYnV0IG5vIGRyaXZlciBnZXQgbG9hZGVkIG9uIGRldmljZSBwbHVnIGluLg0K
Pj4NCj4+IG9rYXkNCj4+DQo+IEVoZW0sIHlvdSBtYXliZSBvbmx5IG1lIHRvIGVuYWJsZSAvZHdj
My9kd2MzX2VwX2RlcXVldWUvZW5hYmxlOg0KPg0KPiByb290QGVkaXNvbjovYm9vdCMgdW5hbWUg
LWENCj4gTGludXggZWRpc29uIDUuOS4wLWVkaXNvbi1hY3BpLXN0YW5kYXJkICMxIFNNUCBNb24g
T2N0IDE5IDIwOjE3OjA0IFVUQw0KPiAyMDIwIHg4Nl82NCB4ODZfNjQgeDg2XzY0IEdOVS9MaW51
eA0KPiByb290QGVkaXNvbjovYm9vdCMgZWNobyAxID4NCj4gL3N5cy9rZXJuZWwvZGVidWcvdHJh
Y2luZy9ldmVudHMvZHdjMy9kd2MzX2VwX2RlcXVldWUvZW5hYmxlDQo+IHJvb3RAZWRpc29uOi9i
b290IyBlY2hvIDEgPiAvcHJvYy9zeXMva2VybmVsL2Z0cmFjZV9kdW1wX29uX29vcHMNCj4gcm9v
dEBlZGlzb246L2Jvb3QjDQo+IHJvb3RAZWRpc29uOi9ib290IyBbIDI2MDguNTg1MzIzXSBCVUc6
IGtlcm5lbCBOVUxMIHBvaW50ZXINCj4gZGVyZWZlcmVuY2UsIGFkZHJlc3M6IDAwMDAwMDAwMDAw
MDAwMDANCj4gWyAyNjA4LjU5MjI4OF0gI1BGOiBzdXBlcnZpc29yIHJlYWQgYWNjZXNzIGluIGtl
cm5lbCBtb2RlDQo+IFsgMjYwOC41OTc0MTldICNQRjogZXJyb3JfY29kZSgweDAwMDApIC0gbm90
LXByZXNlbnQgcGFnZQ0KPiBbIDI2MDguNjAyNTQ5XSBQR0QgMCBQNEQgMA0KPiBbIDI2MDguNjA1
MDkwXSBPb3BzOiAwMDAwIFsjMV0gU01QIFBUSQ0KPiBbIDI2MDguNjA4NTgwXSBDUFU6IDEgUElE
OiA3MzMgQ29tbTogaXJxLzE1LWR3YzMgTm90IHRhaW50ZWQNCj4gNS45LjAtZWRpc29uLWFjcGkt
c3RhbmRhcmQgIzENCj4gWyAyNjA4LjYxNjU3MV0gSGFyZHdhcmUgbmFtZTogSW50ZWwgQ29ycG9y
YXRpb24gTWVycmlmaWVsZC9CT0RFR0EgQkFZLA0KPiBCSU9TIDU0MiAyMDE1LjAxLjIxOjE4LjE5
LjQ4DQo+IFsgMjYwOC42MjUzNTZdIFJJUDogMDAxMDpkd2MzX2dhZGdldF9lcF9kZXF1ZXVlKzB4
NDEvMHgxYzANCj4gWyAyNjA4LjYzMDU4MF0gQ29kZTogZTkgNTEgMDEgMDAgMDAgNGMgOGQgYTMg
MzAgMDEgMDAgMDAgNGMgODkgZTcgZTgNCj4gMTUgZTYgNDIgMDAgNDkgOGIgNGUgNDggNDkgODkg
YzUgNDkgOGQgNDYgNDggNDggOGQgNTEgYTAgNDggMzkgYzggNzUNCj4gMGYgZWIgMmUgPDQ4PiA4
YiA0YSA2MCA0OCA4ZCA1MSBhMCA0OCAzOSBjOCA3NCAyMSA0OCAzOSBkNSA3NSBlZSA0NSAzMQ0K
PiBmNiA0Yw0KPiBbIDI2MDguNjQ5MzIwXSBSU1A6IDAwMTg6ZmZmZmE4MzgwMDJhN2M0MCBFRkxB
R1M6IDAwMDEwMDg3DQo+IFsgMjYwOC42NTQ1NDNdIFJBWDogZmZmZjlhNWY0NjA5YzA0OCBSQlg6
IGZmZmY5YTVmNDZmNDgwMjggUkNYOg0KPiAwMDAwMDAwMDAwMDAwMDAwDQo+IFsgMjYwOC42NjE2
NjZdIFJEWDogZmZmZmZmZmZmZmZmZmZhMCBSU0k6IDAwMDAwMDAwMDAwMDAwMDggUkRJOg0KPiBm
ZmZmOWE1ZjQ2ZjQ4MTU4DQo+IFsgMjYwOC42Njg3OTBdIFJCUDogZmZmZjlhNWY3YmQwOWI0MCBS
MDg6IDAwMDAwMDAwMDAwMDAyZDggUjA5Og0KPiBmZmZmOWE1ZjdkZDZhMDAwDQo+IFsgMjYwOC42
NzU5MTNdIFIxMDogZmZmZmE4MzgwMDJhN2Q5MCBSMTE6IGZmZmY5YTVmNDZmNDgzMDAgUjEyOg0K
PiBmZmZmOWE1ZjQ2ZjQ4MTU4DQo+IFsgMjYwOC42ODMwMzldIFIxMzogMDAwMDAwMDAwMDAwMDA0
NiBSMTQ6IGZmZmY5YTVmNDYwOWMwMDAgUjE1Og0KPiBmZmZmOWE1ZjdhZDc3ZTAwDQo+IFsgMjYw
OC42OTAxNjVdIEZTOsKgIDAwMDAwMDAwMDAwMDAwMDAoMDAwMCkgR1M6ZmZmZjlhNWY3ZTMwMDAw
MCgwMDAwKQ0KPiBrbmxHUzowMDAwMDAwMDAwMDAwMDAwDQo+IFsgMjYwOC42OTgyNDRdIENTOsKg
IDAwMTAgRFM6IDAwMDAgRVM6IDAwMDAgQ1IwOiAwMDAwMDAwMDgwMDUwMDMzDQo+IFsgMjYwOC43
MDM5ODBdIENSMjogMDAwMDAwMDAwMDAwMDAwMCBDUjM6IDAwMDAwMDAwMzc4MGEwMDAgQ1I0Og0K
PiAwMDAwMDAwMDAwMTAwNmUwDQo+IFsgMjYwOC43MTExMDJdIENhbGwgVHJhY2U6DQo+IFsgMjYw
OC43MTM1NjFdwqAgdXNiX2VwX2RlcXVldWUrMHgxOS8weDgwDQo+IFsgMjYwOC43MTcyMzRdwqAg
dV9hdWRpb19zdG9wX2NhcHR1cmUrMHg1NC8weDlhIFt1X2F1ZGlvXQ0KPiBbIDI2MDguNzIyMjg5
XcKgIGFmdW5jX3NldF9hbHQrMHg3My8weDgwIFt1c2JfZl91YWMyXQ0KDQpJIHRvb2sgYSBsb29r
IGF0IGhvdyB0aGUgYXVkaW8gZnVuY3Rpb24gaXMgaGFuZGxpbmcgc3dpdGNoaW5nIGFsdGVybmF0
ZQ0Kc2V0dGluZyBhbmQgZGVxdWV1aW5nIGVuZHBvaW50cywgYW5kIEkgdGhpbmsgSSBmb3VuZCB0
aGUgaXNzdWUuDQoNCkhlcmUncyBhIHNuaXBwZXQgb2YgdGhlIGZyZWVfZXAoKSBjb2RlIGluIHVf
YXVkaW8uYzoNCg0Kc3RhdGljIGlubGluZSB2b2lkIGZyZWVfZXAoc3RydWN0IHVhY19ydGRfcGFy
YW1zICpwcm0sIHN0cnVjdCB1c2JfZXAgKmVwKQ0Kew0KwqDCoMKgIC4uLi4uDQrCoMKgwqDCoMKg
wqDCoCBmb3IgKGkgPSAwOyBpIDwgcGFyYW1zLT5yZXFfbnVtYmVyOyBpKyspIHsNCsKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBpZiAocHJtLT51cmVxW2ldLnJlcSkgew0KwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB1c2JfZXBfZGVxdWV1ZShlcCwg
cHJtLT51cmVxW2ldLnJlcSk7DQrCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIHVzYl9lcF9mcmVlX3JlcXVlc3QoZXAsIHBybS0+dXJlcVtpXS5yZXEpOw0KwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBwcm0tPnVyZXFbaV0u
cmVxID0gTlVMTDsNCsKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB9DQrCoMKgwqDCoMKg
wqDCoCB9DQrCoCAuLi4uDQoNCg0KdXNiX2VwX2RlcXVldWUoKSBjYW4gYmUgYXN5bmNocm9ub3Vz
LiBUaGUgZHdjMyBzdGlsbCBoYXMgb3duZXJzaGlwIG9mDQp0aGUgcmVxdWVzdCB1bnRpbCBpdCBn
aXZlcyBiYWNrIHRoZSByZXF1ZXN0LiBGcmVlaW5nIHRoZSByZXF1ZXN0DQppbW1lZGlhdGVseSBo
ZXJlIHdpbGwgY2F1c2UgYSBwcm9ibGVtLg0KDQpCUiwNClRoaW5oDQo=
