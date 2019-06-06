Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A6D7F37752
	for <lists+linux-usb@lfdr.de>; Thu,  6 Jun 2019 17:01:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729054AbfFFPBp (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 6 Jun 2019 11:01:45 -0400
Received: from mail1.bemta23.messagelabs.com ([67.219.246.210]:58777 "EHLO
        mail1.bemta23.messagelabs.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727309AbfFFPBp (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 6 Jun 2019 11:01:45 -0400
Received: from [67.219.247.53] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
        by server-3.bemta.az-d.us-east-1.aws.symcld.net id E1/3E-23491-7DA29FC5; Thu, 06 Jun 2019 15:01:43 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrPKsWRWlGSWpSXmKPExsXi5LtOQPe61s8
  Yg8Y3MhaLlrUyW0z9e5PRYsLvC2wOzB47Z91l95h99wejx+dNcgHMUayZeUn5FQmsGTdfGRXs
  ZK/Y/XsxYwPjGvYuRi4OIYE9jBKNay8wdjFycrAJGEqc2/KWHcQWEdCS2Nz0khnEZhbwk/h0p
  JsVxBYWkJNYNmc/UA0HUI28xItHURDlVhJPtx4Da2URUJHYceodE4jNK2AtcXT1JLC4kICPRP
  PyxWBjOAV8JQ7fnApWwyggJvH91BomiFXiEreezAezJQQEJJbsOc8MYYtKvHz8jxXCVpBoXrA
  Q7ARmAU2J9bv0IVrNJc6+vsAGYStKTOl+yA5xgqDEyZlPWCYwisxCsmEWQvcsJN2zkHTPQtK9
  gJF1FaN5UlFmekZJbmJmjq6hgYGuoaEREOsamZjpJVbppuiVFuumJhaX6BrqJZYX6xVX5ibnp
  OjlpZZsYgTGWkoB97cdjCcOvNY7xCjJwaQkyntvyY8YIb6k/JTKjMTijPii0pzU4kOMMhwcSh
  K8vzV+xggJFqWmp1akZeYA4x4mLcHBoyTCexEkzVtckJhbnJkOkTrFaMwx4eXcRcwcR+YuXcQ
  sxJKXn5cqJc6rrglUKgBSmlGaBzcIlo4uMcpKCfMyMjAwCPEUpBblZpagyr9iFOdgVBLm/QAy
  hSczrwRu3yugU5iATuG/8A3klJJEhJRUA9PMvs8euuWLvcVP+YQy2cWtYsk9PPu6y4SaTyliV
  241HZW0i91+Y3/bWvbU8gYddv2sqGfnWL4vdzW48WGaq5XzjleaCx8KHPghfjxitWOC6gtlpR
  0G8fcsOGfsa/kuaBa15uKkRN1UjzSx/hfiEZtztF9s/tm9a/GhxpJFHrfjApurl15avmiW5qa
  LqlP2nMjYIHVm5cTNm5bHRW7++ebazWUKk94wMeoGZJ6xzU5SmOMW05Ar+7Gk97uhleK/vy1R
  85v4f55kume+VrAnvWPVT4kH89M85qo9C8iy8v/54vjzD3LH10hOnhVyi3vHnc972xykwgw4N
  RyexCXmvpy7yuDpQrmVRg+PZLSabjipxFKckWioxVxUnAgAZUSgUMIDAAA=
X-Env-Sender: Seth.Bollinger@digi.com
X-Msg-Ref: server-31.tower-425.messagelabs.com!1559833295!409732!14
X-Originating-IP: [66.77.174.16]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.43.9; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 23543 invoked from network); 6 Jun 2019 15:01:43 -0000
Received: from owa.digi.com (HELO MCL-VMS-XCH01.digi.com) (66.77.174.16)
  by server-31.tower-425.messagelabs.com with SMTP; 6 Jun 2019 15:01:43 -0000
Received: from MTK-SMS-XCH01.digi.com ([fe80::cca7:5299:c88e:1c40]) by
 MCL-VMS-XCH01.digi.com ([fe80::5587:821d:f8e4:6578%13]) with mapi id
 14.03.0439.000; Thu, 6 Jun 2019 10:01:42 -0500
From:   "Bollinger, Seth" <Seth.Bollinger@digi.com>
To:     Alan Stern <stern@rowland.harvard.edu>
CC:     USB list <linux-usb@vger.kernel.org>,
        Seth Bollinger <seth.boll@gmail.com>
Subject: Re: USB reset problem
Thread-Topic: USB reset problem
Thread-Index: AQHVHG+E/DdiSC3Fxkmu3GrMhR5lsKaPBZmAgAAGywA=
Date:   Thu, 6 Jun 2019 15:01:41 +0000
Message-ID: <B888875C-3032-43AC-8091-E0437DD0F634@digi.com>
References: <Pine.LNX.4.44L0.1906061030580.1641-100000@iolanthe.rowland.org>
In-Reply-To: <Pine.LNX.4.44L0.1906061030580.1641-100000@iolanthe.rowland.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.27.1.153]
Content-Type: text/plain; charset="utf-8"
Content-ID: <5D67F6C22F516F469319FC34143FE22F@digi.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

PiBPbiBKdW4gNiwgMjAxOSwgYXQgOTozNyBBTSwgQWxhbiBTdGVybiA8c3Rlcm5Acm93bGFuZC5o
YXJ2YXJkLmVkdTxtYWlsdG86c3Rlcm5Acm93bGFuZC5oYXJ2YXJkLmVkdT4+IHdyb3RlOg0KPg0K
PiBJZiB0aGlzIGlzIHJlYWxseSBhIHByb2JsZW0gd2UgY2FuIGNoYW5nZSB0aGUgY29kZSBzbyB0
aGF0IHRoZQ0KPiBpTWFudWZhY3R1cmVyLCBpUHJvZHVjdCwgaVNlcmlhbE51bWJlciwgaUNvbmZp
Z3VyYXRpb24sIGFuZCBpSW50ZXJmYWNlDQo+IGRlc2NyaXB0b3IgdmFsdWVzIGFyZSBleGVtcHQg
ZnJvbSB0aGUgY2hhbmdlIGNoZWNrLiAgSXQgd291bGQgYmUgYQ0KPiBsaXR0bGUgZGlmZmljdWx0
LCB0aG91Z2gsIGJlY2F1c2Ugd2Ugd291bGQgaGF2ZSB0byBwYXJzZSB0aGUNCj4gZGVzY3JpcHRv
cnMgdG8gZmluZCBvdXQgd2hlcmUgdGhlIGlJbnRlcmZhY2UgdmFsdWVzIGFyZS4NCg0KSXQgc2Vl
bXMgbGlrZSB0aGlzIGlzIGEgbGVnaXRpbWF0ZSBwcm90ZWN0aW9uLiAgSXQgd291bGRu4oCZdCBm
ZWVsIHJpZ2h0IHRvIG1lIHB1c2hpbmcgZm9yIGEgY2hhbmdlIHRoYXQgd291bGQgb25seSBmaXgg
bXkgcGFydGljdWxhciBkZXZpY2UuDQoNCklmIEkgZmluZCB3ZSBfcmVhbGx5XyBuZWVkIGl0LCBJ
IGNhbiBwYXRjaCBvdXIgc3BlY2lmaWMga2VybmVsLg0KDQpUaGFua3MgZm9yIHRoZSBxdWljayBy
ZXNwb25zZXMhDQoNClNldGgNCg0K
