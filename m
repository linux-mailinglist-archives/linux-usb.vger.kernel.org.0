Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6DC2B4F6FA7
	for <lists+linux-usb@lfdr.de>; Thu,  7 Apr 2022 03:12:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235614AbiDGBOA (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 6 Apr 2022 21:14:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33212 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235238AbiDGBNR (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 6 Apr 2022 21:13:17 -0400
Received: from zju.edu.cn (spam.zju.edu.cn [61.164.42.155])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 9C530183816
        for <linux-usb@vger.kernel.org>; Wed,  6 Apr 2022 18:11:09 -0700 (PDT)
Received: by ajax-webmail-mail-app4 (Coremail) ; Thu, 7 Apr 2022 09:11:02
 +0800 (GMT+08:00)
X-Originating-IP: [222.205.11.114]
Date:   Thu, 7 Apr 2022 09:11:02 +0800 (GMT+08:00)
X-CM-HeaderCharset: UTF-8
From:   "Lin Ma" <linma@zju.edu.cn>
To:     "Alan Stern" <stern@rowland.harvard.edu>
Cc:     gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
        usb-storage@lists.one-eyed-alien.net, mdharm-usb@one-eyed-alien.net
Subject: Re: [PATCH v0] USB: storage: karma: fix rio_karma_init return
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.8 build 20200806(7a9be5e8)
 Copyright (c) 2002-2022 www.mailtech.cn zju.edu.cn
In-Reply-To: <Yk2tR4iEr5/T6o+h@rowland.harvard.edu>
References: <20220406100259.6483-1-linma@zju.edu.cn>
 <Yk2tR4iEr5/T6o+h@rowland.harvard.edu>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
MIME-Version: 1.0
Message-ID: <18ed9d8e.3c7eb.1800193253f.Coremail.linma@zju.edu.cn>
X-Coremail-Locale: en_US
X-CM-TRANSID: cS_KCgCHj6cmOk5iYjrgAA--.31805W
X-CM-SenderInfo: qtrwiiyqvtljo62m3hxhgxhubq/1tbiAwQNElNG3GOLGAAAsh
X-Coremail-Antispam: 1Ur529EdanIXcx71UUUUU7IcSsGvfJ3iIAIbVAYjsxI4VWxJw
        CS07vEb4IE77IF4wCS07vE1I0E4x80FVAKz4kxMIAIbVAFxVCaYxvI4VCIwcAKzIAtYxBI
        daVFxhVjvjDU=
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_PASS,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

SGkgQWxhbiwKCj4gTm90IGV4YWN0bHkuICByaW9fa2FybWFfaW5pdCgpIGlzIGEgdXNiLXN0b3Jh
Z2UgaW5pdEZ1bmN0aW9uIChzZWUgCj4gdGhlIHVzYl9zdG9yX2FjcXVpcmVfcmVzb3VyY2VzKCkg
cm91dGluZSBpbiB1c2IuYyksIGFuZCB0aGVzZSBmdW5jdGlvbnMgCj4gYXJlIHN1cHBvc2VkIHRv
IHJldHVybiBlaXRoZXIgMCBvciBhIG5lZ2F0aXZlIGVycm9yIGNvZGUuCj4gCj4gU28geW91IHNo
b3VsZCBtYWtlIHRoZSByb3V0aW5lIHJldHVybiAtRU5PTUVNLCBub3QgCj4gVVNCX1NUT1JfVFJB
TlNQT1JUX0VSUk9SLiAgWW91IGNhbiBzaW1wbGlmeSB0aGUgcGF0Y2ggYnkgY2hhbmdpbmcgdGhl
IAo+IGxpbmUgd2hlcmUgcmV0IGlzIGRlZmluZWQ7IGluaXRpYWxpemUgaXQgdG8gLUVOT01FTSBy
YXRoZXIgdGhhbiB0byAwCgpUaGFua3MgZm9yIHBvaW50aW5nIG91dCB0aGF0LCBhbmQgYXMgSSBk
aWcgZGVlcGVyLCBJIGZvdW5kIHRoYXQgdGhlIHVzZSBvZiBlcnJvciBjb2RlCmlzICJ0b3RhbGx5
IGEgbWVzcyIgaW4gdGhlIHVzYiBzdG9yYWdlLgoKVGFraW5nIHRoZSBpbml0ZnVuY3Rpb24gZm9y
IGV4YW1wbGUsIHRoZXJlIGFyZSBiZWxvdyA2IGNhc2VzCjEga2FyYW06IHJpb19rYXJtYV9pbml0
KCkKMiByZWFsdGVrX2NyOiBpbml0X3JlYWx0ZWtfY3IoKQozIGFsdWRhOiBpbml0X2FsYXVkYSgp
CjQgaXNkMjAwOiBpc2QyMDBfaW5pdF9pbmZvKCkKNSBzaHV0dGxlX3VzYmF0OiBpbml0X3VzYmF0
KCkKNiBvbmV0b3VjaDogb25ldG91Y2hfY29ubmVjdF9pbnB1dCgpCgpUaGUgKDEpIGlzIGVycm9u
ZW91c2x5IHJldHVybiAwIGV2ZW4gd2hlbiB0aGUga3phbGxvYyBpZiBmYWlsZWQsIG11c3QgYmUg
Zml4ZWQuClRoZSAoMikgYW5kICg2KSB1c2VzIC1FTk9NRU0gd2hlbiBhbGxvY2F0aW9uIGZhaWxz
LiAoMikgd2lsbCBhbHNvIHJldHVybiAtRUlPIHdoZW4KYW5vdGhlciBremFsbG9jIGZhaWxzIG9y
IHJ0czUxeF9jaGVja19zdGF0dXMoKSBmYWlscy4KVGhlICgzKSB1c2VzIFVTQl9TVE9SX1RSQU5T
UE9SVF9FUlJPUiB3aGVuIGFsbG9jYXRpb24gZmFpbHMgKHNlZW1zIHRoYXQgSSBsZWFybmVkIGEK
bWlzdGFrZSBmcm9tIGhlcmUpLgpUaGUgKDQpIHVzZXMgY3VzdG9tIElTRDIwMF9FUlJPUiB3aGVu
IGFsbG9jYXRpb24gZmFpbHMuClRoZSAoNSkgdXNlcyBjb25zdGFudCAxIHdoZW4gYWxsb2NhdGlv
biBmYWlscy4KCkl0J3Mgd29ydGggcG9pbnRlZCBvdXQgdGhhdCAoZXhjZXB0ICgxKSksIHRoZSBv
dGhlcnMgdGhvdWdoIG5vdCBmb2xsb3dpbmcgdGhlIHN0YW5kYXJkLAppdCB3b24ndCBjYXVzZSBi
YWQgdGhpbmcgYmVjYXVzZSB0aGUgY2FsbHNpdGUgb2YgdGhlc2UgaW5pdEZ1bmN0aW9uIGp1c3Qg
Y2hlY2sgd2hldGhlciB0aGUKcmV0dXJuIGlzIHplcm8uCgovKgogKiBKdXN0IGJlZm9yZSB3ZSBz
dGFydCBvdXIgY29udHJvbCB0aHJlYWQsIGluaXRpYWxpemUKICogdGhlIGRldmljZSBpZiBpdCBu
ZWVkcyBpbml0aWFsaXphdGlvbgogKi8KIGlmICh1cy0+dW51c3VhbF9kZXYtPmluaXRGdW5jdGlv
bikgewogICAgIHAgPSB1cy0+dW51c3VhbF9kZXYtPmluaXRGdW5jdGlvbih1cyk7CiAgICAgaWYg
KHApCiAgICAgICAgIHJldHVybiBwOwogfQoKSSB3aWxsIHRoZW4gc2VuZCBwYXRjaGVzIHRvIG1h
a2Ugc3VyZSBhbGwgaW5pdEZ1bmN0aW9uIGZvbGxvdyB0aGUgc3RhbmRhcmQuCgo+IAo+IEFuZCBk
b24ndCBmb3JnZXQgdGhlIGVycm9yIGNvZGUgZm9yIHdoZW4gdGhlIHJpb19rYXJtYV9zZW5kX2Nv
bW1hbmQoKSAKPiBjYWxsIGZhaWxzLiAgSW4gdGhhdCBjYXNlIHRoZSByZXR1cm4gdmFsdWUgc2hv
dWxkIGJlIC1FSU8uCj4gCgpPa2F5LCB3aWxsIGFkZCB0aGlzIGluIG5leHQgdmVyc2lvbiBvZiB0
aGlzIHBhdGNoLgoKPiAKPiBTaG91bGRuJ3QgdGhpcyBhbHNvIGJlIG1hcmtlZCBmb3IgdGhlIHN0
YWJsZSBrZXJuZWxzPwo+IAoKU29ycnksIEkgZGlkbid0IGdldCBpdCwgZG8geW91IG1lYW4gYWRk
IGFub3RoZXIgdGFnIGxpa2UgIkNjOiBzdGFibGVAdmdlci5rZXJuZWwub3JnIj8KT3IgSSBqdXN0
IG5lZWQgdG8gQ0MgdGhlIG1haWwgdG8gc3RhYmxlIG1haWwgbGlzdD8KClJlZ2FyZHMKTGlu
