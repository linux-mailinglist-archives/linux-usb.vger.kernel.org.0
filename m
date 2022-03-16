Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 46B634DB5B7
	for <lists+linux-usb@lfdr.de>; Wed, 16 Mar 2022 17:13:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242693AbiCPQO6 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 16 Mar 2022 12:14:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46570 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239089AbiCPQO4 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 16 Mar 2022 12:14:56 -0400
Received: from esa2.mentor.iphmx.com (esa2.mentor.iphmx.com [68.232.141.98])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 423D1AE78
        for <linux-usb@vger.kernel.org>; Wed, 16 Mar 2022 09:13:41 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.90,187,1643702400"; 
   d="scan'208";a="73259510"
Received: from orw-gwy-02-in.mentorg.com ([192.94.38.167])
  by esa2.mentor.iphmx.com with ESMTP; 16 Mar 2022 08:13:41 -0800
IronPort-SDR: VAlIbWyFDgDzyb56nyTqRng/u33FDYgEGLN6Q4n4REJDvPYbeHxxtVJxFc6j4/SXy7Hpwq9xOZ
 Ey8nmzhfgc+U806egQCgqxFg8n35k2kwOQsSsk7z6UnmYFUI6m35eDepngx6T14Dw5TOqplnZH
 qQlKBJqhxOjqGn4v7sRXFwrMN3YIbwzEHd8X0/V/Ok/1fsnrVpmKDymKabuA80jNn5OIZ2EWnb
 zwPQxwqvUIT27v6Azb4Tj+uJCD7JZUAKK/1t18AV1LtoZblZgpP/pvdeT0KPqP5yfwlGtovSd6
 XqA=
From:   "Schmid, Carsten" <Carsten_Schmid@mentor.com>
To:     Alan Stern <stern@rowland.harvard.edu>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
CC:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: RE: Trouble with Intenso FlashLine 32GB USB stick on Kernel 4.14
Thread-Topic: Trouble with Intenso FlashLine 32GB USB stick on Kernel 4.14
Thread-Index: AQHYOTtOe51NnlFSaUuY2Jn7sXnpnKzCCQ0AgAAMQ4CAABlWkA==
Date:   Wed, 16 Mar 2022 16:13:36 +0000
Message-ID: <cc8cc0297792445f90ad0dba121a2c40@SVR-IES-MBX-03.mgc.mentorg.com>
References: <1647437997247.23069@mentor.com> <YjHswpjToSM5Pr7n@kroah.com>
 <YjH3C/qhvs37EtUf@rowland.harvard.edu>
In-Reply-To: <YjH3C/qhvs37EtUf@rowland.harvard.edu>
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

Pj4+IFsxNTk5MDkuNzgwNjEwXSB1c2IgMS0xOiB1c2JmczogVVNCREVWRlNfQ09OVFJPTCBmYWls
ZWQgY21kIE5tZURlZmF1bHRQcmlvIHJxdCAxOTIgcnEgNTEgbGVuIDIgcmV0IC0xMTANCj4+DQo+
PiBXaHkgaXMgdXNiZnMgYmVpbmcgdXNlZCBmb3IgYSBzdG9yYWdlIGRldmljZT8gIFdoYXQgdXNl
cnNwYWNlIHByb2dyYW0gZG8NCj4+IHlvdSBoYXZlIHRoYXQgaXMgcG9raW5nIGF0IHRoZSBkZXZp
Y2U/DQo+DQo+IFRoZSBuYW1lIG9mIHRoZSBwcm9ncmFtIGlzIG1lbnRpb25lZCByaWdodCBpbiB0
aGUgZXJyb3IgbWVzc2FnZSAodGhlDQo+ICJjbWQiIGl0ZW0pOiBObWVEZWZhdWx0UHJpby4gIERv
bid0IGtub3cgd2hhdCBwYWNrYWdlIHRoYXQgcHJvZ3JhbQ0KPiBiZWxvbmdzIHRvLg0KPg0KPiBB
bGFuIFN0ZXJuDQpBYWFoLCB0aGFua3MgZm9yIHRoZSBoaW50LiBXaWxsIGNoZWNrIHdoZXJlIHRo
YXQgYmVsb25ncyB0byBhbmQgY29udGFjdCB0aGUgcGVvcGxlIHdobyBkaWQgaXQuDQoNClRoYW5r
cw0KQ2Fyc3Rlbg0KLS0tLS0tLS0tLS0tLS0tLS0NClNpZW1lbnMgRWxlY3Ryb25pYyBEZXNpZ24g
QXV0b21hdGlvbiBHbWJIOyBBbnNjaHJpZnQ6IEFybnVsZnN0cmHDn2UgMjAxLCA4MDYzNCBNw7xu
Y2hlbjsgR2VzZWxsc2NoYWZ0IG1pdCBiZXNjaHLDpG5rdGVyIEhhZnR1bmc7IEdlc2Now6RmdHNm
w7xocmVyOiBUaG9tYXMgSGV1cnVuZywgRnJhbmsgVGjDvHJhdWY7IFNpdHogZGVyIEdlc2VsbHNj
aGFmdDogTcO8bmNoZW47IFJlZ2lzdGVyZ2VyaWNodCBNw7xuY2hlbiwgSFJCIDEwNjk1NQ0K
