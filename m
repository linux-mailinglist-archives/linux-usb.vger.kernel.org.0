Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8950A375C4
	for <lists+linux-usb@lfdr.de>; Thu,  6 Jun 2019 15:55:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727438AbfFFNzl (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 6 Jun 2019 09:55:41 -0400
Received: from mail1.bemta24.messagelabs.com ([67.219.250.3]:60611 "EHLO
        mail1.bemta24.messagelabs.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726693AbfFFNzl (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 6 Jun 2019 09:55:41 -0400
Received: from [67.219.250.101] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
        by server-3.bemta.az-a.us-west-2.aws.symcld.net id 81/29-29278-A5B19FC5; Thu, 06 Jun 2019 13:55:38 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprNKsWRWlGSWpSXmKPExsXi5LtOQDdK+me
  MwYoGA4tFy1qZLab+vcnowOSxc9Zddo/Pm+QCmKJYM/OS8isSWDMWnpvPXvCTs2Lb1QbWBsYX
  nF2MXBxCAnsYJZ6cX8zSxcjJwSZgKHFuy1t2EFtEQEPiwIG3TCA2M5D9Zv0DRhBbWEBKonXNb
  aAaDqAaeYkXj6IgyvUkmpf/ACtnEVCRuHixG8zmFbCWuPvjBth4RgExie+n1kCNFJe49WQ+mC
  0hICCxZM95ZghbVOLl43+sELaCRPOChWCrmAU0Jdbv0odoNZc4+XMjK4StKDGl+yE7xCpBiZM
  zn7BMYBSahWTDLITuWUi6ZyHpnoWkewEj6ypGi6SizPSMktzEzBxdQwMDXUNDI11DYxBtoZdY
  pZuoV1qsW55aXKJrpJdYXqxXXJmbnJOil5dasokRGCspBU1lOxjfHHmtd4hRkoNJSZT33pIfM
  UJ8SfkplRmJxRnxRaU5qcWHGGU4OJQkeGdJ/owREixKTU+tSMvMAcYtTFqCg0dJhLcFJM1bXJ
  CYW5yZDpE6xWjPMeHl3EXMHAu2LgGSm+cuBZJHQKQQS15+XqqUOO9JkDYBkLaM0jy4obA0c4l
  RVkqYl5GBgUGIpyC1KDezBFX+FaM4B6OSMK8eyBSezLwSuN2vgM5iAjqL/8I3kLNKEhFSUg1M
  6RtV4zfWVSs1fL1wakJb7pVvzzZ+5flrZCLx52WpZrvO7F8zMgJTmExWXlBjEHi6tUs7MOhDp
  VtctkeCx/nszSzCt423/d+z+nzs0cMRbzZWnvNZ4tjosZPtUcac8yVde58pOT6WrlrsumxNhp
  fJ32sB904cTDnIsPq+33e5i58MvVOWSmqEBU7MS7XZWnXuW+Ippae/Lv6NvO664onEXY13Cj8
  j92+9pSZ7Z0aayGzTlwefvcuers7Q1f4pcfG9sqOvrtvbX2iz/rn2t+UO66+iQZ0mNuxx39nT
  uOf+P1+7dNvGpNCAVWfZ3l1Mmf1FP/KGcGaw0luLO00F898EOa9gaw6ZmnBLT80j5tKv80osx
  RmJhlrMRcWJAMtmpfGuAwAA
X-Env-Sender: Seth.Bollinger@digi.com
X-Msg-Ref: server-19.tower-325.messagelabs.com!1559829337!162880!2
X-Originating-IP: [66.77.174.16]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.43.9; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 15687 invoked from network); 6 Jun 2019 13:55:38 -0000
Received: from owa.digi.com (HELO MCL-VMS-XCH01.digi.com) (66.77.174.16)
  by server-19.tower-325.messagelabs.com with SMTP; 6 Jun 2019 13:55:38 -0000
Received: from MTK-SMS-XCH01.digi.com ([fe80::cca7:5299:c88e:1c40]) by
 MCL-VMS-XCH01.digi.com ([fe80::5587:821d:f8e4:6578%13]) with mapi id
 14.03.0439.000; Thu, 6 Jun 2019 08:55:37 -0500
From:   "Bollinger, Seth" <Seth.Bollinger@digi.com>
To:     USB list <linux-usb@vger.kernel.org>
CC:     Seth Bollinger <seth.boll@gmail.com>
Subject: USB reset problem
Thread-Topic: USB reset problem
Thread-Index: AQHVHG+ETWfSPd+0wUORZEMqfAwZ6w==
Date:   Thu, 6 Jun 2019 13:55:37 +0000
Message-ID: <A2655C7A-C29C-4462-A668-8F7B9C81A648@digi.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.27.1.153]
Content-Type: text/plain; charset="utf-8"
Content-ID: <9C8D9A357D51A8478AF6992F718F9CEC@digi.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

SGVsbG8gQWxsLA0KDQpSZWNlbnRseSB3ZSBzYXcgYSBwcm9ibGVtIHdoZXJlIHRoZSBkZXZpY2Ug
cmVzZXQgd2lsbCBmYWlsIGR1ZSB0byBhIGNvbmZpZ3VyYXRpb24gZGVzY3JpcHRvciBjaGVjayBp
biBodWIuYzo1NjAwLg0KDQogICAgICAgIGlmIChtZW1jbXAoYnVmLCB1ZGV2LT5yYXdkZXNjcmlw
dG9yc1tpbmRleF0sIG9sZF9sZW5ndGgpDQogICAgICAgICAgICAgICAgIT0gMCkgew0KICAgICAg
ICAgICAgZGV2X2RiZygmdWRldi0+ZGV2LCAiY29uZmlnIGluZGV4ICVkIGNoYW5nZWQgKCMlZClc
biIsDQogICAgICAgICAgICAgICAgaW5kZXgsDQogICAgICAgICAgICAgICAgKChzdHJ1Y3QgdXNi
X2NvbmZpZ19kZXNjcmlwdG9yICopIGJ1ZiktPg0KICAgICAgICAgICAgICAgICAgICBiQ29uZmln
dXJhdGlvblZhbHVlKTsNCiAgICAgICAgICAgIGNoYW5nZWQgPSAxOw0KICAgICAgICAgICAgYnJl
YWs7DQogICAgICAgIH0NCg0KVGhlIGRlc2NyaXB0b3JzIHJldHVybmVkIGZyb20gdGhlIGRldmlj
ZSBoYXZlIGEgZGlmZmVyZW50IGlJbnRlcmZhY2UuICBJIGNoZWNrZWQgdGhlIHVzYiBzcGVjIGFu
ZCBjb3VsZG7igJl0IGZpbmQgYW55dGhpbmcgdGhhdCBzYXlzIGlJbnRlcmZhY2UgY2Fu4oCZdCBj
aGFuZ2UuICBJIGRvbuKAmXQgaGF2ZSB0aGUgc291cmNlIGZvciB0aGUgZGV2aWNlLCBidXQgSSB0
aGluayBpdOKAmXMgcHJvYmFibHkgZ2VuZXJhdGluZyB0aGUgaW50ZXJmYWNlIHN0cmluZyBlYWNo
IHJlc2V0IGFuZCByZXR1cm5pbmcgYSBkaWZmZXJlbnQgaW5kZXggZm9yIGl0ICjigJxBREIgaW50
ZXJmYWNl4oCdKS4NCg0KSGFzIGFueW9uZSBlbHNlIHNlZW4gdGhpcz8gIERvZXMgdGhlIHNwZWMg
Z3VhcmFudGVlIHRoYXQgaUludGVyZmFjZSBzaG91bGQgbmV2ZXIgY2hhbmdlIGJldHdlZW4gZGV2
aWNlIHJlc2V0cz8NCg0KVGhhbmtzLA0KDQpTZXRo
