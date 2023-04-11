Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 81A4E6DD000
	for <lists+linux-usb@lfdr.de>; Tue, 11 Apr 2023 05:11:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229722AbjDKDLk (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 10 Apr 2023 23:11:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54954 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230034AbjDKDL1 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 10 Apr 2023 23:11:27 -0400
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 25B6A2D75
        for <linux-usb@vger.kernel.org>; Mon, 10 Apr 2023 20:11:25 -0700 (PDT)
Authenticated-By: 
X-SpamFilter-By: ArmorX SpamTrap 5.77 with qID 33B3AwIrA007665, This message is accepted by code: ctloc85258
Received: from mail.realtek.com (rtexh36506.realtek.com.tw[172.21.6.27])
        by rtits2.realtek.com.tw (8.15.2/2.81/5.90) with ESMTPS id 33B3AwIrA007665
        (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=OK);
        Tue, 11 Apr 2023 11:10:58 +0800
Received: from RTEXDAG02.realtek.com.tw (172.21.6.101) by
 RTEXH36506.realtek.com.tw (172.21.6.27) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.17; Tue, 11 Apr 2023 11:11:19 +0800
Received: from RTEXMBS04.realtek.com.tw (172.21.6.97) by
 RTEXDAG02.realtek.com.tw (172.21.6.101) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.7; Tue, 11 Apr 2023 11:11:19 +0800
Received: from RTEXMBS04.realtek.com.tw ([fe80::b4a2:2bcc:48d1:8b02]) by
 RTEXMBS04.realtek.com.tw ([fe80::b4a2:2bcc:48d1:8b02%5]) with mapi id
 15.01.2375.007; Tue, 11 Apr 2023 11:11:19 +0800
From:   =?utf-8?B?U3RhbmxleSBDaGFuZ1vmmIzogrLlvrdd?= 
        <stanley_chang@realtek.com>
To:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>
CC:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: RE: [PATCH v1 1/2] usb: dwc3: core: add support for remapping global register start address
Thread-Topic: [PATCH v1 1/2] usb: dwc3: core: add support for remapping global
 register start address
Thread-Index: AQHZaRcy64Ak1IW6YkuqLSHQPwUUKK8gq+QAgANDlaCAAWfegIAAGcxA
Date:   Tue, 11 Apr 2023 03:11:19 +0000
Message-ID: <e82cf3f4d6bc4862bdb68b3c38775719@realtek.com>
References: <20230407060703.19469-1-stanley_chang@realtek.com>
 <20230408020840.344xuicuqb4abtow@synopsys.com>
 <2e26b5005a4e4efa946cb04898779f08@realtek.com>
 <20230411012721.b63dx3oodojby6lf@synopsys.com>
In-Reply-To: <20230411012721.b63dx3oodojby6lf@synopsys.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.21.190.159]
x-kse-serverinfo: RTEXDAG02.realtek.com.tw, 9
x-kse-antispam-interceptor-info: fallback
x-kse-antivirus-interceptor-info: fallback
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-KSE-AntiSpam-Interceptor-Info: fallback
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

PiA+ID4gPiArICAgICBpZiAoZGV2KSB7DQo+ID4gPg0KPiA+ID4gV2h5IGRvIHdlIG5lZWQgdGhp
cyBpZiAoZGV2KSBjaGVjaz8gV2hlbiB3b3VsZCB0aGlzIG5vdCBiZSB0aGUgY2FzZT8NCj4gPg0K
PiA+IEkgd2FudCB0aGUgdmFyaWFibGUgImZpeGVkX2R3YzNfZ2xvYmFsc19yZWdzX3N0YXJ0IiB0
byBiZSBhIGxvY2FsIHZhcmlhYmxlLg0KPiA+IFNvIEkgYWRkZWQgYW4gaWYgc3RhdGVtZW50Lg0K
PiA+IEkgY2FuIG1vZGlmeSBpdCB0byAiaWYgKGRldi0+b2Zfbm9kZSkiIHdoaWNoIGxvb2tzIG1v
cmUgbWFrZSBzZW5zZS4NCj4gDQo+IFdoeT8gSWYgaXQncyB3aXRoaW4gdGhpcyBmdW5jdGlvbiwg
aXQncyBhIGxvY2FsIHZhcmlhYmxlLiBEb24ndCBjcmVhdGUgYXJiaXRyYXJ5DQo+IGNvbmRpdGlv
biBqdXN0IHRvIGxpbWl0IHRoZSBzY29wZSBvZiB0aGUgdmFyaWFibGUuDQo+IA0KPiBUaGFua3Ms
DQo+IFRoaW5oDQo+IA0KDQpJIGFncmVlIHRoYXQgZG9uJ3QgY3JlYXRlIGFyYml0cmFyeSBjb25k
aXRpb25zIGp1c3QgdG8gbGltaXQgdGhlIHNjb3BlIG9mIHZhcmlhYmxlcy4NClRoZSBwcm9wZXJ0
eSAic25wcyxnbG9iYWwtcmVncy1zdGFydGluZy1vZmZzZXQiIGlzIGluIHRoZSBkZXZpY2UgdHJl
ZSwNCnNvIGNoZWNraW5nIGRldi0+b2Zfbm9kZSBleGlzdHMgaXMgYSBtdXN0Lg0KDQpUaGFua3Ms
DQpTdGFubGV5DQo=
