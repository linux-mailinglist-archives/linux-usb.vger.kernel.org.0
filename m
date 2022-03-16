Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 727F74DB23E
	for <lists+linux-usb@lfdr.de>; Wed, 16 Mar 2022 15:13:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348896AbiCPOOO (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 16 Mar 2022 10:14:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57340 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238912AbiCPOOM (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 16 Mar 2022 10:14:12 -0400
X-Greylist: delayed 63 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Wed, 16 Mar 2022 07:12:57 PDT
Received: from esa4.mentor.iphmx.com (esa4.mentor.iphmx.com [68.232.137.252])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5E2E2559C
        for <linux-usb@vger.kernel.org>; Wed, 16 Mar 2022 07:12:56 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.90,186,1643702400"; 
   d="scan'208";a="73196304"
Received: from orw-gwy-02-in.mentorg.com ([192.94.38.167])
  by esa4.mentor.iphmx.com with ESMTP; 16 Mar 2022 06:11:53 -0800
IronPort-SDR: yinlGcG1rWKxYvNKX7I0/mJ38rv/keO0jJpNdFvGvS8IUqLtnz3Zve7yLE9M2aQexr62iWAfqX
 Pcj/SCo2CIsAd9wDlfuaFgsaUQP8WxZcCdCV0gOalcShL8FSAR8wKP1Q8KNfNSYsU2Z0O9tk6Q
 xOMSblYVU7rGFVZXohvKonMtU+HlxE8sPmpqWCNuXMyIY4WDv1gOxuCPZW+YJgChBy4an/WHoB
 L/LoJGyUWw1Zx+vyyCIpbGA7bAxUljTYsJB4tF17YETxFTVQNqAUJfDOGxuMZx0mv3RcBJlrXG
 dXI=
From:   "Schmid, Carsten" <Carsten_Schmid@mentor.com>
To:     "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
CC:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: RE: Trouble with Intenso FlashLine 32GB USB stick on Kernel 4.14
Thread-Topic: Trouble with Intenso FlashLine 32GB USB stick on Kernel 4.14
Thread-Index: AQHYOTtOe51NnlFSaUuY2Jn7sXnpnKzCCQ0AgAACFjA=
Date:   Wed, 16 Mar 2022 14:11:47 +0000
Message-ID: <1148788f4bd848c78e28b116537979e6@SVR-IES-MBX-03.mgc.mentorg.com>
References: <1647437997247.23069@mentor.com> <YjHswpjToSM5Pr7n@kroah.com>
In-Reply-To: <YjHswpjToSM5Pr7n@kroah.com>
Accept-Language: de-DE, en-IE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [137.202.0.90]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Pj4gWzE1OTkwOS42MTQ1MzVdIHVzYiAxLTE6IHVzYmZzOiBVU0JERVZGU19DT05UUk9MIGZhaWxl
ZCBjbWQgTm1lRGVmYXVsdFByaW8gcnF0IDE5MiBycSA1MSBsZW4gMiByZXQgLTExMA0KPj4gWzE1
OTkwOS42NjU1MTNdIHVzYiAxLTE6IHVzYmZzOiBVU0JERVZGU19DT05UUk9MIGZhaWxlZCBjbWQg
Tm1lRGVmYXVsdFByaW8gcnF0IDE5MiBycSA1MSBsZW4gMiByZXQgLTExMA0KPj4gWzE1OTkwOS43
Mjk1MTBdIHVzYiAxLTE6IHVzYmZzOiBVU0JERVZGU19DT05UUk9MIGZhaWxlZCBjbWQgTm1lRGVm
YXVsdFByaW8gcnF0IDE5MiBycSA1MSBsZW4gMiByZXQgLTExMA0KPj4gWzE1OTkwOS43ODA2MTBd
IHVzYiAxLTE6IHVzYmZzOiBVU0JERVZGU19DT05UUk9MIGZhaWxlZCBjbWQgTm1lRGVmYXVsdFBy
aW8gcnF0IDE5MiBycSA1MSBsZW4gMiByZXQgLTExMA0KPg0KPiBXaHkgaXMgdXNiZnMgYmVpbmcg
dXNlZCBmb3IgYSBzdG9yYWdlIGRldmljZT8gIFdoYXQgdXNlcnNwYWNlIHByb2dyYW0gZG8NCj4g
eW91IGhhdmUgdGhhdCBpcyBwb2tpbmcgYXQgdGhlIGRldmljZT8NCg0KTmVlZCB0byBhc2sgdGhl
IHVzZXJzcGFjZSBtYWludGFpbmVycyBpbiB0aGF0IHByb2plY3QsIHRoYW5rcyBmb3IgdGhlIGhp
bnQuDQoNCj4+IFsxNTk5MjguOTA4NjMzXSBJTkZPOiB0YXNrIHVzYi1zdG9yYWdlOjMxODY4IGJs
b2NrZWQgZm9yIG1vcmUgdGhhbiAxMCBzZWNvbmRzLg0KPj4gWzE1OTkyOC45MDg3MzVdICByZXRf
ZnJvbV9mb3JrKzB4MzUvMHg0MA0KPj4gWzE1OTkzMS41OTQ0ODNdIHVzYiAxLTE6IHJlc2V0IGhp
Z2gtc3BlZWQgVVNCIGRldmljZSBudW1iZXIgMTMgdXNpbmcgeGhjaV9oY2QNCj4+DQo+PiBBbnlv
bmUgZnJvbSBVU0Igd2hvIGNhbiBoZWxwIHdpdGggdGhhdD8NCj4NCj4gNC4xNCBpcyByZWFsbHkg
b2xkLiAgRG9lcyA1LjE2IHJlc29sdmUgdGhpcz8NCj4NClJlY2VudCBEZXNrdG9wIFVidW50dSAy
MTA0IGRvZXNuJ3Qgc2hvdyB0aGlzIChrZXJuZWwgNS40KS4NCkluIHRoaXMgcHJvamVjdCwgd2Ug
Y2FuJ3QgbW92ZSBmcm9tIDQuMTQsIHVuZm9ydHVuYXRlbHkgKGknbSBhdCA0LjE0LjI0NCBoZXJl
KS4NCg0KVGhhbmtzDQoNCkNhcnN0ZW4NCg0KDQotLS0tLS0tLS0tLS0tLS0tLQ0KU2llbWVucyBF
bGVjdHJvbmljIERlc2lnbiBBdXRvbWF0aW9uIEdtYkg7IEFuc2NocmlmdDogQXJudWxmc3RyYcOf
ZSAyMDEsIDgwNjM0IE3DvG5jaGVuOyBHZXNlbGxzY2hhZnQgbWl0IGJlc2NocsOkbmt0ZXIgSGFm
dHVuZzsgR2VzY2jDpGZ0c2bDvGhyZXI6IFRob21hcyBIZXVydW5nLCBGcmFuayBUaMO8cmF1Zjsg
U2l0eiBkZXIgR2VzZWxsc2NoYWZ0OiBNw7xuY2hlbjsgUmVnaXN0ZXJnZXJpY2h0IE3DvG5jaGVu
LCBIUkIgMTA2OTU1DQo=
