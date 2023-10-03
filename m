Return-Path: <linux-usb+bounces-979-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EB8D57B5F0C
	for <lists+linux-usb@lfdr.de>; Tue,  3 Oct 2023 04:26:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sy.mirrors.kernel.org (Postfix) with ESMTP id 4D3B9B209A5
	for <lists+linux-usb@lfdr.de>; Tue,  3 Oct 2023 02:26:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E26B0809;
	Tue,  3 Oct 2023 02:26:10 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1168F655;
	Tue,  3 Oct 2023 02:26:08 +0000 (UTC)
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AEE52AD;
	Mon,  2 Oct 2023 19:26:06 -0700 (PDT)
X-SpamFilter-By: ArmorX SpamTrap 5.78 with qID 3932Pry361367183, This message is accepted by code: ctloc85258
Received: from mail.realtek.com (rtexh36505.realtek.com.tw[172.21.6.25])
	by rtits2.realtek.com.tw (8.15.2/2.92/5.92) with ESMTPS id 3932Pry361367183
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 3 Oct 2023 10:25:53 +0800
Received: from RTEXMBS04.realtek.com.tw (172.21.6.97) by
 RTEXH36505.realtek.com.tw (172.21.6.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.32; Tue, 3 Oct 2023 10:25:53 +0800
Received: from RTEXMBS04.realtek.com.tw (172.21.6.97) by
 RTEXMBS04.realtek.com.tw (172.21.6.97) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.7; Tue, 3 Oct 2023 10:25:53 +0800
Received: from RTEXMBS04.realtek.com.tw ([fe80::40c2:6c24:2df4:e6c7]) by
 RTEXMBS04.realtek.com.tw ([fe80::40c2:6c24:2df4:e6c7%5]) with mapi id
 15.01.2375.007; Tue, 3 Oct 2023 10:25:53 +0800
From: =?utf-8?B?U3RhbmxleSBDaGFuZ1vmmIzogrLlvrdd?= <stanley_chang@realtek.com>
To: Chanwoo Choi <chanwoo@kernel.org>
CC: MyungJoo Ham <myungjoo.ham@samsung.com>,
        Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        "Krzysztof
 Kozlowski" <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v3 1/2] extcon: add Realtek DHC RTD SoC Type-C driver
Thread-Topic: [PATCH v3 1/2] extcon: add Realtek DHC RTD SoC Type-C driver
Thread-Index: AQHZ3u58OLY8hY7bwUySjxPCOIjYqLAgN6uggBZR8QCAAPlCYA==
Date: Tue, 3 Oct 2023 02:25:53 +0000
Message-ID: <294cca4cfd77430ba4aae76567277439@realtek.com>
References: <20230904051253.23208-1-stanley_chang@realtek.com>
 <43138ac278224fb78055c5c78e93cfb0@realtek.com>
 <CAGTfZH0QTYCXF_hpPw_gHMBX4Mf-ZQ_5auU4p-20CtYtcOWYoA@mail.gmail.com>
In-Reply-To: <CAGTfZH0QTYCXF_hpPw_gHMBX4Mf-ZQ_5auU4p-20CtYtcOWYoA@mail.gmail.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
x-originating-ip: [172.21.190.159]
x-kse-serverinfo: RTEXMBS04.realtek.com.tw, 9
x-kse-antispam-interceptor-info: fallback
x-kse-antivirus-interceptor-info: fallback
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-KSE-AntiSpam-Interceptor-Info: fallback
X-KSE-ServerInfo: RTEXH36505.realtek.com.tw, 9
X-KSE-AntiSpam-Interceptor-Info: fallback
X-KSE-Antivirus-Interceptor-Info: fallback
X-KSE-AntiSpam-Interceptor-Info: fallback
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

SGkgQ2hhbndvbywNCg0KVGhhbmsgeW91IHNvIG11Y2guDQoNClN0YW5sZXkNCj4gDQo+IA0KPiBI
aSBTdGFubGV5LA0KPiANCj4gQXBwbGllZCB0aGVtIHdpdGggcGF0Y2gxLzIuDQo+IA0KPiBJJ20g
c29ycnkgZm9yIGxhdGUgcmVwbHkuDQo+IA0KPiBSZWdhcmRzLA0KPiBDaGFud29vIENob2kNCj4g
DQoNCg==

