Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 975C15B959E
	for <lists+linux-usb@lfdr.de>; Thu, 15 Sep 2022 09:43:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230035AbiIOHnq (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 15 Sep 2022 03:43:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54494 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230034AbiIOHnn (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 15 Sep 2022 03:43:43 -0400
X-Greylist: delayed 1848 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Thu, 15 Sep 2022 00:43:41 PDT
Received: from m1564.mail.126.com (m1564.mail.126.com [220.181.15.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 801BA923EC
        for <linux-usb@vger.kernel.org>; Thu, 15 Sep 2022 00:43:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
        s=s110527; h=Date:From:Subject:MIME-Version:Message-ID; bh=NLF5i
        Gs2IinGZPv+qpYcfgB4x1ei9AK7Fwlzdtg8oYU=; b=QfYg+4VOjwziGAItyN7oX
        7Dg1/KA/bz76WVe87d+4mBjhLBq+Q/jMRJJsHKbbsGXznG1k21S7xOYLB1uCBAql
        BXKMSiV5pZvZju6azGHzIBBxbzBtrM+HBg/pTlfk64MtWQK1t1eebkNn2DTEE8/R
        cykHgAaBLu/1cxxqDAEgz4=
Received: from windhl$126.com ( [8.219.73.50] ) by ajax-webmail-wmsvr64
 (Coremail) ; Thu, 15 Sep 2022 15:12:41 +0800 (CST)
X-Originating-IP: [8.219.73.50]
Date:   Thu, 15 Sep 2022 15:12:41 +0800 (CST)
From:   "Liang He" <windhl@126.com>
To:     "Heikki Krogerus" <heikki.krogerus@linux.intel.com>
Cc:     gregkh@linuxfoundation.org, linux-usb@vger.kernel.org
Subject: Re:Re: [PATCH] usb: typec: anx7411: Call of_node_get() before
 of_find_xxx API
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.13 build 20220113(9671e152)
 Copyright (c) 2002-2022 www.mailtech.cn 126com
In-Reply-To: <YyLL/zGW+Zr1+t0H@kuha.fi.intel.com>
References: <20220915025400.4003321-1-windhl@126.com>
 <YyLL/zGW+Zr1+t0H@kuha.fi.intel.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=GBK
MIME-Version: 1.0
Message-ID: <af70a05.47f5.1833ffe1d42.Coremail.windhl@126.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: QMqowAAXJnJq0CJjVb9wAA--.59824W
X-CM-SenderInfo: hzlqvxbo6rjloofrz/xtbBGgd9F1-HZ1gq7gABsV
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,DKIM_INVALID,
        DKIM_SIGNED,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

CgoKQXQgMjAyMi0wOS0xNSAxNDo1Mzo1MSwgIkhlaWtraSBLcm9nZXJ1cyIgPGhlaWtraS5rcm9n
ZXJ1c0BsaW51eC5pbnRlbC5jb20+IHdyb3RlOgo+T24gVGh1LCBTZXAgMTUsIDIwMjIgYXQgMTA6
NTQ6MDBBTSArMDgwMCwgTGlhbmcgSGUgd3JvdGU6Cj4+IEluIGFueDc0MTFfdHlwZWNfc3dpdGNo
X3Byb2JlKCksIHdlIHNob3VsZCBjYWxsIG9mX25vZGVfZ2V0KCkgYmVmb3JlCj4+IG9mX2ZpbmRf
bm9kZV9ieV9uYW1lKCkgd2hpY2ggd2lsbCBhdXRvbWF0aWNhbGx5IGRlY3JlYXNlIHRoZSAnZnJv
bScKPj4gYXJndW1lbnQuCj4KPkp1c3QgdXNlIG9mX2dldF9jaGlsZF9ieV9uYW1lKCkgaW5zdGVh
ZCBvZiBvZl9maW5kX25vZGVfYnlfbmFtZSgpLiBJZgo+eW91IGRvbid0IG5lZWQgcmVjdXJzaW9u
LCB0aGVuIHRoZXJlIGlzIG5vIHBvaW50IGluIHVzaW5nCj5vZl9maW5kX25vZGVfYnlfbmFtZSgp
Lgo+Cj50aGFua3MsCgpUaGFua3MsIEhlaWtraSBLcm9nZXJ1cywKCkkgd2lsbCBzZW5kIHYyIHBh
dGNoIGJhc2VkIG9uIHlvdXIgYWR2aWNlcy4KCkxpYW5nCgo+Cj4+IEZpeGVzOiBmZTZkOGE5Yzhl
NjQgKCJ1c2I6IHR5cGVjOiBhbng3NDExOiBBZGQgQW5hbG9naXggUEQgQU5YNzQxMSBzdXBwb3J0
IikKPj4gU2lnbmVkLW9mZi1ieTogTGlhbmcgSGUgPHdpbmRobEAxMjYuY29tPgo+PiAtLS0KPj4g
IGRyaXZlcnMvdXNiL3R5cGVjL2FueDc0MTEuYyB8IDIgKysKPj4gIDEgZmlsZSBjaGFuZ2VkLCAy
IGluc2VydGlvbnMoKykKPj4gCj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3VzYi90eXBlYy9hbng3
NDExLmMgYi9kcml2ZXJzL3VzYi90eXBlYy9hbng3NDExLmMKPj4gaW5kZXggYzBmMDg0MmQ0NDNj
Li5mZTAwMGJiZjcxODMgMTAwNjQ0Cj4+IC0tLSBhL2RyaXZlcnMvdXNiL3R5cGVjL2FueDc0MTEu
Ywo+PiArKysgYi9kcml2ZXJzL3VzYi90eXBlYy9hbng3NDExLmMKPj4gQEAgLTExMDUsNiArMTEw
NSw3IEBAIHN0YXRpYyBpbnQgYW54NzQxMV90eXBlY19zd2l0Y2hfcHJvYmUoc3RydWN0IGFueDc0
MTFfZGF0YSAqY3R4LAo+PiAgCWludCByZXQ7Cj4+ICAJc3RydWN0IGRldmljZV9ub2RlICpub2Rl
Owo+PiAgCj4+ICsJb2Zfbm9kZV9nZXQoZGV2LT5vZl9ub2RlKTsKPj4gIAlub2RlID0gb2ZfZmlu
ZF9ub2RlX2J5X25hbWUoZGV2LT5vZl9ub2RlLCAib3JpZW50YXRpb25fc3dpdGNoIik7Cj4+ICAJ
aWYgKCFub2RlKQo+PiAgCQlyZXR1cm4gMDsKPj4gQEAgLTExMTUsNiArMTExNiw3IEBAIHN0YXRp
YyBpbnQgYW54NzQxMV90eXBlY19zd2l0Y2hfcHJvYmUoc3RydWN0IGFueDc0MTFfZGF0YSAqY3R4
LAo+PiAgCQlyZXR1cm4gcmV0Owo+PiAgCX0KPj4gIAo+PiArCW9mX25vZGVfZ2V0KGRldi0+b2Zf
bm9kZSk7Cj4+ICAJbm9kZSA9IG9mX2ZpbmRfbm9kZV9ieV9uYW1lKGRldi0+b2Zfbm9kZSwgIm1v
ZGVfc3dpdGNoIik7Cj4+ICAJaWYgKCFub2RlKSB7Cj4+ICAJCWRldl9lcnIoZGV2LCAibm8gdHlw
ZWMgbXV4IGV4aXN0Iik7Cj4+IC0tIAo+PiAyLjI1LjEKPgo+LS0gCj5oZWlra2kK
