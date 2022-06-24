Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C284C55933F
	for <lists+linux-usb@lfdr.de>; Fri, 24 Jun 2022 08:17:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230390AbiFXGRw (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 24 Jun 2022 02:17:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59752 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230301AbiFXGRv (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 24 Jun 2022 02:17:51 -0400
Received: from smtp-fw-80006.amazon.com (smtp-fw-80006.amazon.com [99.78.197.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ECA824EA0B;
        Thu, 23 Jun 2022 23:17:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1656051471; x=1687587471;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=f4Bkp/D0f55yGpotgEdN+5wvSliUUczJ1ffqVAybCo8=;
  b=l0x/1gGNb3d9X/F8fwmgXXvItNqP8oqQTO/b68qQeY1vinyLXQAw7JI7
   8KE1QdV2b8we8l7+tg6bJb/u3aLWOClr7DIU5Vwxw1eIhra7+zDuLrfwg
   DXQOqtf6a+rrpd3/pd+X7alrSQ3/Z1vAJ8cfAFEZ0S/elaT7aJfha+Onm
   k=;
X-IronPort-AV: E=Sophos;i="5.92,218,1650931200"; 
   d="scan'208";a="101416490"
Received: from pdx4-co-svc-p1-lb2-vlan3.amazon.com (HELO email-inbound-relay-iad-1e-b69ea591.us-east-1.amazon.com) ([10.25.36.214])
  by smtp-border-fw-80006.pdx80.corp.amazon.com with ESMTP; 24 Jun 2022 06:17:34 +0000
Received: from EX13MTAUWB001.ant.amazon.com (iad12-ws-svc-p26-lb9-vlan2.iad.amazon.com [10.40.163.34])
        by email-inbound-relay-iad-1e-b69ea591.us-east-1.amazon.com (Postfix) with ESMTPS id F06E9C1084;
        Fri, 24 Jun 2022 06:17:31 +0000 (UTC)
Received: from EX13D21UWB003.ant.amazon.com (10.43.161.212) by
 EX13MTAUWB001.ant.amazon.com (10.43.161.207) with Microsoft SMTP Server (TLS)
 id 15.0.1497.36; Fri, 24 Jun 2022 06:17:31 +0000
Received: from EX13D21UWB003.ant.amazon.com (10.43.161.212) by
 EX13D21UWB003.ant.amazon.com (10.43.161.212) with Microsoft SMTP Server (TLS)
 id 15.0.1497.36; Fri, 24 Jun 2022 06:17:31 +0000
Received: from EX13D21UWB003.ant.amazon.com ([10.43.161.212]) by
 EX13D21UWB003.ant.amazon.com ([10.43.161.212]) with mapi id 15.00.1497.036;
 Fri, 24 Jun 2022 06:17:31 +0000
From:   "Herrenschmidt, Benjamin" <benh@amazon.com>
To:     "dan.carpenter@oracle.com" <dan.carpenter@oracle.com>,
        "neal_liu@aspeedtech.com" <neal_liu@aspeedtech.com>
CC:     "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>,
        "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
        "balbi@kernel.org" <balbi@kernel.org>
Subject: Re: [PATCH] usb: gadget: aspeed_udc: fix handling of tx_len == 0
Thread-Topic: [PATCH] usb: gadget: aspeed_udc: fix handling of tx_len == 0
Thread-Index: AQHYh5IVwI7hc7z5RUWudTZXnLvZ7g==
Date:   Fri, 24 Jun 2022 06:17:31 +0000
Message-ID: <e0b1c201bec2ccb68d1779ea8e9cfdf27563dd73.camel@amazon.com>
References: <YrMsU9HvdBm5YrRH@kili>
         <HK0PR06MB32023259EBD6B4C649C62E8280B59@HK0PR06MB3202.apcprd06.prod.outlook.com>
         <20220623064320.GN16517@kadam>
In-Reply-To: <20220623064320.GN16517@kadam>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.161.24]
Content-Type: text/plain; charset="utf-8"
Content-ID: <8B17452B6C85AC498D5A839075DB9DF0@amazon.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Spam-Status: No, score=-12.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        USER_IN_DEF_SPF_WL autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

T24gVGh1LCAyMDIyLTA2LTIzIGF0IDA5OjQzICswMzAwLCBEYW4gQ2FycGVudGVyIHdyb3RlOg0K
PiBPbiBUaHUsIEp1biAyMywgMjAyMiBhdCAwMTo0MTo0OUFNICswMDAwLCBOZWFsIExpdSB3cm90
ZToNCj4gPiA+IFRoZSBidWcgaXMgdGhhdCB3ZSBzaG91bGQgc3RpbGwgZW50ZXIgdGhpcyBsb29w
IGlmICJ0eF9sZW4iIGlzDQo+ID4gPiB6ZXJvLg0KPiA+ID4gDQo+ID4gPiBBZnRlciBhZGRpbmcg
dGhlICJsYXN0IiB2YXJpYWJsZSwgdGhlbiB0aGUgImNodW5rID49IDAiIGNvbmRpdGlvbg0KPiA+
ID4gaXMgbm8gbG9uZ2VyDQo+ID4gPiByZXF1aXJlZCBidXQgSSBsZWZ0IGl0IGZvciByZWFkYWJp
bGl0eS4NCj4gPiA+IA0KPiA+IA0KPiA+IFVzZSBlaXRoZXIgImNodW5rID49MCIgb3IgImxhc3Qi
Lg0KPiA+IEkgdGhpbmsgdGhlIGZvcm1lciBpcyBtb3JlIHNpbXBsZXIuDQo+IA0KPiBjaHVuayA+
PSAwIGRvZXNuJ3Qgd29yay4gIGxhc3Qgd29ya3MgYnV0IEkgdGhpbmsgdGhpcyB3YXkgaXMgbW9y
ZQ0KPiByZWFkYWJsZS4NCg0KSHJtLi4uIHdoYXQgaXMgdGhhdCBkcml2ZXIgPyBJJ3ZlIG1pc3Nl
ZCBpdCAuLi4gaXMgdGhlIGNvZGUgbGlmdGVkIGZyb20NCmFzcGVlZC12aHViID8gSWYgeWVzLCBz
aG91bGQgd2UgaW5zdGVhZCBtYWtlIGl0IGEgY29tbW9uIGNvZGUgYmFzZSA/DQpBbmQgaWYgdGhl
cmUgYXJlIGJ1ZyBmaXhlcyBvbiBvbmUgdGhleSBtaWdodCBhcHBseSB0byB0aGUgb3RoZXIgYXMN
CndlbGwuLi4NCg0KTmVhbCwgaXMgdGhhdCAiVURDIiBJUCBibG9jayB0aGUgc2FtZSB0aGF0IHJl
c2lkZXMgdW5kZXIgdGhlIHZodWIgPyBJZg0KeWVzIHRoZW4gdGhpcyByZWFsbHkgbmVlZHMgdG8g
YmUgYSBjb21tb24gZHJpdmVyIGluc3RlYWQsIHVzaW5nIHRoZQ0KY29kZSBleGlzdGluZyBpbiBh
c3BlZWQtdmh1Yiwgc2ltcGx5IG1ha2luZyBpdCBhYmxlIHRvIHdvcmsgd2l0aG91dCBhDQpwYXJl
bnQgdmh1YiBwb2ludGVyLg0KDQpDaGVlcnMsDQpCZW4uDQo=
