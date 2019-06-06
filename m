Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 951A2377AD
	for <lists+linux-usb@lfdr.de>; Thu,  6 Jun 2019 17:19:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729258AbfFFPTX (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 6 Jun 2019 11:19:23 -0400
Received: from mail1.bemta23.messagelabs.com ([67.219.246.1]:45390 "EHLO
        mail1.bemta23.messagelabs.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728812AbfFFPTX (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 6 Jun 2019 11:19:23 -0400
Received: from [67.219.246.101] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
        by server-1.bemta.az-b.us-east-1.aws.symcld.net id C5/FF-19658-4FE29FC5; Thu, 06 Jun 2019 15:19:16 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrEKsWRWlGSWpSXmKPExsXi5LtOQPeL3s8
  Yg+nNkhbNi9ezWSxa1spsMfXvTUaLCb8vsDmweOycdZfdY//cNewes+/+YPT4vEkugCWKNTMv
  Kb8igTXj9ZQjjAVNbBVTd2Y2MP5g7WLk4hASWMUo8Xf+bTYIZw+jxK+Nn4EynBxsAoYS57a8Z
  QexRQS0JDY3vWTuYuTgYBYolWiezA0SFhaQk1g2Zz87SFhEQF7ixaMoiGo3iX03vjGC2CwCKh
  LvD1xgBrF5Bawl7s5fBzZdSMBH4u2ZDWCtnAK+Ek/3WYKEGQXEJL6fWsMEYjMLiEvcejIfzJY
  QEJBYsuc8M4QtKvHy8T9WCFtBonnBQnaIwzQl1u/ShzDNJU531kJMUZSY0v2QHeIAQYmTM5+w
  gJQIAR02Z4PWBEaxWUh2zUKYMwthziwkc2YhmbOAkXUVo1lSUWZ6RkluYmaOrqGBga6hoZGuo
  a6hqbFeYpVukl5psW5qYnGJrqFeYnmxXnFlbnJOil5easkmRmCUphQwztzB+OnIa71DjJIcTE
  qivPeW/IgR4kvKT6nMSCzOiC8qzUktPsQow8GhJMGrCYx7IcGi1PTUirTMHGDCgElLcPAoifB
  KgKR5iwsSc4sz0yFSpxgtOSa8nLuImWPB1iVA8sjcpYuYhVjy8vNSpcR540AaBEAaMkrz4MbB
  ktolRlkpYV5GBgYGIZ6C1KLczBJU+VeM4hyMSkAVIFN4MvNK4La+AjqICegg/gvfQA4qSURIS
  TUwdT5+tTuivCCj2DnXmO2Nm4vUY781L/R1Z10/vYX7yI8Dui8tmUXjzr72UfD8EKppmeu6VM
  VB0WF9yeFNTXHvJVImbozVC9qlt5f5oHryCl6dxsL6umCzZWGn5S98n8T401ImOlLqppdrjXr
  QUt8XawLPaq2UiTYp4Y04u6l2Teruj22/1n06/yHn3aPpmXGf7f68aCo5o7qP+9v2R3/eNXTc
  Dok+c1nanF3Zbg/36nnOHs+O/zQK4p99drrX0Zhcu1/7Lt1lnt/decrty0tdxQWGwrc1vrPET
  5g173j6vFuMUmJXK89YL6lizWCcXHQzNq0ntejpKQ5h9iOsF4Ke7ksV8YlYeGhdoVmR8814JZ
  bijERDLeai4kQA9rVrROUDAAA=
X-Env-Sender: Seth.Bollinger@digi.com
X-Msg-Ref: server-15.tower-385.messagelabs.com!1559834355!339258!3
X-Originating-IP: [66.77.174.16]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.43.9; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 32346 invoked from network); 6 Jun 2019 15:19:16 -0000
Received: from owa.digi.com (HELO MCL-VMS-XCH01.digi.com) (66.77.174.16)
  by server-15.tower-385.messagelabs.com with SMTP; 6 Jun 2019 15:19:16 -0000
Received: from MTK-SMS-XCH02.digi.com (10.10.8.196) by MCL-VMS-XCH01.digi.com
 (10.5.8.49) with Microsoft SMTP Server (TLS) id 14.3.439.0; Thu, 6 Jun 2019
 10:19:15 -0500
Received: from MTK-SMS-XCH01.digi.com ([fe80::cca7:5299:c88e:1c40]) by
 MTK-SMS-XCH02.digi.com ([fe80::4960:cfbf:ad5e:3cdb%20]) with mapi id
 14.03.0439.000; Thu, 6 Jun 2019 10:19:15 -0500
From:   "Bollinger, Seth" <Seth.Bollinger@digi.com>
To:     Alan Stern <stern@rowland.harvard.edu>
CC:     Greg KH <gregkh@linuxfoundation.org>,
        USB list <linux-usb@vger.kernel.org>,
        Seth Bollinger <seth.boll@gmail.com>
Subject: Re: USB reset problem
Thread-Topic: USB reset problem
Thread-Index: AQHVHG+E/DdiSC3Fxkmu3GrMhR5lsKaPBVcAgAAEMwCAAAOEgIAABDiA
Date:   Thu, 6 Jun 2019 15:19:14 +0000
Message-ID: <3D970B56-C8AE-4635-BE92-4FC6F7F8AF9D@digi.com>
References: <Pine.LNX.4.44L0.1906061101180.1641-100000@iolanthe.rowland.org>
In-Reply-To: <Pine.LNX.4.44L0.1906061101180.1641-100000@iolanthe.rowland.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.27.1.153]
Content-Type: text/plain; charset="utf-8"
Content-ID: <AFC860EEE79D9149BDF36C58EDAD0209@digi.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

PiBPbiBKdW4gNiwgMjAxOSwgYXQgMTA6MDMgQU0sIEFsYW4gU3Rlcm4gPHN0ZXJuQHJvd2xhbmQu
aGFydmFyZC5lZHU+IHdyb3RlOg0KPiANCj4gRVBFUk0gbWVhbnMgdGhhdCB0aGUgZmlsZSBkZXNj
cmlwdG9yIHdhcyBub3Qgb3BlbmVkIHdpdGggd3JpdGUgYWNjZXNzLiAgDQo+IEl0IGhhcyBub3Ro
aW5nIHRvIGRvIHdpdGggcmVzZXQgZmFpbHVyZXMuDQoNClllcywgSSB3YXMgY29uZnVzZWQgYnkg
dGhhdCBhcyB3ZWxsIHNvIHNwZW50IHNvbWUgdGltZSBpbnN0cnVtZW50aW5nIHRoZSBrZXJuZWwu
ICBJdCBkZWZpbml0ZWx5IGlzIG9wZW4gZm9yIHdyaXRpbmcsIGFuZCBnZXTigJlzIGJ5IHRoZSBp
bml0aWFsIGZfbW9kZSBjaGVjayBpbiBkZXZpby5jOnVzYmRldl9kb19pb2N0bC4NCg0KSXMgaXQg
cG9zc2libHkgYSBkZWZhdWx0IGVycm9yIHRoYXTigJlzIHJldHVybmVkIHdoZW4gc29tZSBkZWVw
ZXIgZXJyb3IgaXMgZW5jb3VudGVyZWQ/ICBVbmZvcnR1bmF0ZWx5IEkgd2FzIHVuYWJsZSB0byBk
ZXRlcm1pbmUgZXhhY3RseSB3aGVyZSBpdCB3YXMgY29taW5nIGZyb20uLi4NCg0KU2V0aA0KDQo=
