Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 77E746DC30D
	for <lists+linux-usb@lfdr.de>; Mon, 10 Apr 2023 05:59:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229512AbjDJD7i (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 9 Apr 2023 23:59:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43656 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229475AbjDJD7g (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 9 Apr 2023 23:59:36 -0400
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8EC4F26A0
        for <linux-usb@vger.kernel.org>; Sun,  9 Apr 2023 20:59:35 -0700 (PDT)
Authenticated-By: 
X-SpamFilter-By: ArmorX SpamTrap 5.77 with qID 33A3wpJsB000356, This message is accepted by code: ctloc85258
Received: from mail.realtek.com (rtexh36505.realtek.com.tw[172.21.6.25])
        by rtits2.realtek.com.tw (8.15.2/2.81/5.90) with ESMTPS id 33A3wpJsB000356
        (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=OK);
        Mon, 10 Apr 2023 11:58:51 +0800
Received: from RTEXMBS05.realtek.com.tw (172.21.6.98) by
 RTEXH36505.realtek.com.tw (172.21.6.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.32; Mon, 10 Apr 2023 11:59:12 +0800
Received: from RTEXMBS04.realtek.com.tw (172.21.6.97) by
 RTEXMBS05.realtek.com.tw (172.21.6.98) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.34; Mon, 10 Apr 2023 11:59:12 +0800
Received: from RTEXMBS04.realtek.com.tw ([fe80::b4a2:2bcc:48d1:8b02]) by
 RTEXMBS04.realtek.com.tw ([fe80::b4a2:2bcc:48d1:8b02%5]) with mapi id
 15.01.2375.007; Mon, 10 Apr 2023 11:59:12 +0800
From:   =?utf-8?B?U3RhbmxleSBDaGFuZ1vmmIzogrLlvrdd?= 
        <stanley_chang@realtek.com>
To:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>
CC:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        =?utf-8?B?U3RhbmxleSBDaGFuZ1vmmIzogrLlvrdd?= 
        <stanley_chang@realtek.com>
Subject: RE: [PATCH v1 2/2] dt-bindings: usb: snps,dwc3: Add 'snps,fixed_dwc3_globals_regs_start' quirk
Thread-Topic: [PATCH v1 2/2] dt-bindings: usb: snps,dwc3: Add
 'snps,fixed_dwc3_globals_regs_start' quirk
Thread-Index: AQHZaRcw+gfkRyRuuUGnVgp9YLQVcq8gt86AgAM3DkA=
Date:   Mon, 10 Apr 2023 03:59:12 +0000
Message-ID: <a10b65d1b2e244e4986b44e08faad1c6@realtek.com>
References: <20230407060703.19469-1-stanley_chang@realtek.com>
 <20230407060703.19469-2-stanley_chang@realtek.com>
 <20230408025119.jmiosqxbh2lzjefy@synopsys.com>
In-Reply-To: <20230408025119.jmiosqxbh2lzjefy@synopsys.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.21.190.159]
x-kse-serverinfo: RTEXMBS05.realtek.com.tw, 9
x-kse-antispam-interceptor-info: fallback
x-kse-antivirus-interceptor-info: fallback
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-KSE-AntiSpam-Interceptor-Info: fallback
X-KSE-ServerInfo: RTEXH36505.realtek.com.tw, 9
X-KSE-AntiSpam-Interceptor-Info: fallback
X-KSE-Antivirus-Interceptor-Info: fallback
X-KSE-AntiSpam-Interceptor-Info: fallback
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

DQo+ID4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy91c2Iv
c25wcyxkd2MzLnlhbWwNCj4gPiBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy91
c2Ivc25wcyxkd2MzLnlhbWwNCj4gPiBpbmRleCBiZTM2OTU2YWY1M2IuLmE1NTk5ZDk3N2RiNiAx
MDA2NDQNCj4gPiAtLS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvdXNiL3Nu
cHMsZHdjMy55YW1sDQo+ID4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdz
L3VzYi9zbnBzLGR3YzMueWFtbA0KPiA+IEBAIC0zNTksNiArMzU5LDEzIEBAIHByb3BlcnRpZXM6
DQo+ID4gICAgICBpdGVtczoNCj4gPiAgICAgICAgZW51bTogWzEsIDQsIDgsIDE2LCAzMiwgNjQs
IDEyOCwgMjU2XQ0KPiA+DQo+ID4gKyAgc25wcyxmaXhlZF9kd2MzX2dsb2JhbHNfcmVnc19zdGFy
dDoNCj4gPiArICAgIGRlc2NyaXB0aW9uOg0KPiA+ICsgICAgICB2YWx1ZSBmb3IgcmVtYXBwaW5n
IGdsb2JhbCByZWdpc3RlciBzdGFydCBhZGRyZXNzLiBGb3Igc29tZSBkd2MzDQo+ID4gKyAgICAg
IGNvbnRyb2xsZXIsIHRoZSBkd2MzIGdsb2JhbCByZWdpc3RlciBzdGFydCBhZGRyZXNzIGlzIG5v
dCBhdA0KPiA+ICsgICAgICBkZWZhdWx0IERXQzNfR0xPQkFMU19SRUdTX1NUQVJUICgweGMxMDAp
LiBUaGlzIHByb3BlcnR5IGlzDQo+IGFkZGVkIHRvDQo+ID4gKyAgICAgIGFkanVzdCB0aGUgYWRk
cmVzcy4NCj4gPiArDQo+ID4gICAgcG9ydDoNCj4gPiAgICAgICRyZWY6IC9zY2hlbWFzL2dyYXBo
LnlhbWwjL3Byb3BlcnRpZXMvcG9ydA0KPiA+ICAgICAgZGVzY3JpcHRpb246DQo+ID4gLS0NCj4g
PiAyLjM0LjENCj4gPg0KPiANCj4gVGhpcyBpc24ndCBjb21tb24uIENhbiB3ZSBjaGVjayB0aHJv
dWdoIGNvbXBhdGlibGUgc3RyaW5nIGluc3RlYWQ/DQo+IA0KPiBUaGFua3MsDQo+IFRoaW5oDQoN
CkkgcmV2aXNlIHRoaXMgc3RyaW5nIGluIG5leHQgdmVyc2lvbi4NClRoYW5rcywNClN0YW5sZXkN
Cg==
