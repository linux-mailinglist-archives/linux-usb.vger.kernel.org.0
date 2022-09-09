Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 729315B38D9
	for <lists+linux-usb@lfdr.de>; Fri,  9 Sep 2022 15:24:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230504AbiIINXi (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 9 Sep 2022 09:23:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53370 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229585AbiIINXi (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 9 Sep 2022 09:23:38 -0400
Received: from m15111.mail.126.com (m15111.mail.126.com [220.181.15.111])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 93B4E10B7C2
        for <linux-usb@vger.kernel.org>; Fri,  9 Sep 2022 06:23:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
        s=s110527; h=Date:From:Subject:Mime-Version:Message-ID; bh=MDIrP
        iPBDHsw3XzfJ4ODObTkhyGjxa5PB/x5giGDUeI=; b=n/xUH6Dc9swfTJNcax9SO
        oOqzYEOxFsAJEeBYcDCMj7SGTkUFsZcRrS98SQj22OiBFglxaoK6acNMBKNxZnF1
        sUmartA82ZwarJWjsmyWXqFgeR5IrAO2pUNrPUfLDkLz/pkjAmfoTGi74yafP5tu
        Py7HFtzAFbgUaj8Q+BQW9E=
Received: from 0V5ZS2WE6VIK6H0 (unknown [117.143.49.84])
        by smtp1 (Coremail) with SMTP id C8mowAAXAXUPPhtjlmMuBQ--.17167S2;
        Fri, 09 Sep 2022 21:22:25 +0800 (CST)
Date:   Fri, 9 Sep 2022 21:22:25 +0800
From:   "zhongling0719@126.com" <zhongling0719@126.com>
To:     "stern@rowland.harvard.edu" <stern@rowland.harvard.edu>,
        "zenghongling@kylinos.cn" <zenghongling@kylinos.cn>
Cc:     "Greg KH" <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "usb-storage@lists.one-eyed-alien.net" 
        <usb-storage@lists.one-eyed-alien.net>
Subject: Re: Re: [PATCH v4 3/3] uas: ignore UAS for Thinkplus chips
References: <1662720530-32313-1-git-send-email-zenghongling@kylinos.cn>, 
        <YxsucjOnUkb8NxKo@rowland.harvard.edu>
X-Priority: 3
X-GUID: C1798030-29D6-43AA-AC3A-125C58E3E45D
X-Has-Attach: no
X-Mailer: Foxmail 7.2.16.188[cn]
Mime-Version: 1.0
Message-ID: <202209092121245768249@126.com>
Content-Type: text/plain;
        charset="utf-8"
Content-Transfer-Encoding: base64
X-CM-TRANSID: C8mowAAXAXUPPhtjlmMuBQ--.17167S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7KF18Kw15Xw13Jr4DJry5Arb_yoW8uw47p3
        4DKF95CrWkGF1IvF17Jw47AryrXanayFWrK3s29w17Za1Sva4jqFnrKr48Wr9Fvr47Wa1Y
        vF4vvFW7KrWDGaDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0ziSdgAUUUUU=
X-Originating-IP: [117.143.49.84]
X-CM-SenderInfo: x2kr0wpolqwiqxrzqiyswou0bp/1tbiuRJ30FpD+ghOXAAAs1
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

U29ycnkgLCBJIHRlc3RlZCBpdCB3b3JrIHdlbGwgb24gV2luNywgbm90IGdvb2Qgb24gV2luMTAu
wqAKSSBkb24ndCBoYXZlIE1hYyBPU1ggc3lzdGVtLiBXZSBhbHdheXMgd29yayBvbiBsaW51eMKg
ZW52aXJvbm1lbnQuCk5lZWQgSSByZXNlbmQgdGhlIHZlcnNpb24gVjUgZm9yIHBhdGNoIDMgwqBj
YW5jZWwgImFja2VkIGJ5IiA/CgpUaGFua3MhCgp6aG9uZ2xpbmcwNzE5QDEyNi5jb20KwqAKRnJv
bTrCoEFsYW4gU3Rlcm4KRGF0ZTrCoDIwMjItMDktMDnCoDIwOjE1ClRvOsKgSG9uZ2xpbmcgWmVu
ZwpDQzrCoGdyZWdraDsgbGludXgtdXNiOyB1c2Itc3RvcmFnZTsgemhvbmdsaW5nMDcxOQpTdWJq
ZWN0OsKgUmU6IFtQQVRDSCB2NCAzLzNdIHVhczogaWdub3JlIFVBUyBmb3IgVGhpbmtwbHVzIGNo
aXBzCk9uIEZyaSwgU2VwIDA5LCAyMDIyIGF0IDA2OjQ4OjUwUE0gKzA4MDAsIEhvbmdsaW5nIFpl
bmcgd3JvdGU6Cj4gVGhlIFVBUyBtb2RlIG9mIFRoaW5rcGx1cyBpcyByZXBvcnRlZCB0byBmYWls
IHRvIHdvcmsgb24KPiBzZXZlcmFsIHBsYXRmb3JtcyB3aXRoIHRoZSBmb2xsb3dpbmcgZXJyb3Ig
bWVzc2FnZToKPgo+IFvCoMKgIDM5LjcwMjQzOV0geGhjaV9oY2QgMDAwMDowYzowMC4zOiBFUlJP
UiBUcmFuc2ZlciBldmVudCBmb3IgZGlzYWJsZWQKPsKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCBlbmRwb2ludCBvciBpbmNvcnJlY3Qgc3RyZWFtIHJpbmcKPiBbwqDCoCAzOS43MDI0NDJd
IHhoY2lfaGNkIDAwMDA6MGM6MDAuMzogQDAwMDAwMDAyNmM2MWY4MTAgMDAwMDAwMDAgMDAwMDAw
MDAKPsKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAxYjAwMDAwMCAwNTAzODAwMAo+Cj4g
RmFsbGluZyBiYWNrIHRvIFVTQiBtYXNzIHN0b3JhZ2UgY2FuIHNvbHZlIHRoaXMgcHJvYmxlbSwg
c28gaWdub3JlIFVBUwo+IGZ1bmN0aW9uIG9mIHRoaXMgY2hpcC4KPgo+IEFja2VkLWJ5OiBBbGFu
IFN0ZXJuIDxzdGVybkByb3dsYW5kLmhhcnZhcmQuZWR1PgrCoApJIG5ldmVyIHNlbnQgeW91IGFu
IEFja2VkLWJ5OiBmb3IgdGhpcyBwYXRjaC7CoCBJbiBmYWN0LCBJIGFza2VkIHlvdQpxdWVzdGlv
bnMgYWJvdXQgaXQgd2hpY2ggeW91IGhhdmVuJ3QgeWV0IGFuc3dlcmVkLgrCoApTcGVjaWZpY2Fs
bHk6IEhvdyBkbyBXaW5kb3dzIGFuZCBNYWMgT1NYIHdvcmsgd2l0aCB0aGlzIGRyaXZlPwrCoApB
bGFuIFN0ZXJuCsKgCj4gU2lnbmVkLW9mZi1ieTogSG9uZ2xpbmcgWmVuZyA8emVuZ2hvbmdsaW5n
QGt5bGlub3MuY24+Cj4gLS0tCj4gQ2hhbmdlIGZvciB2MQo+wqAgLSBDaGFuZ2UgdGhlIGVtYWls
IHJlYWwgbmFtZSBhbmQgdGhlIGNvZGUgd29ybmcgcGxhY2UuCj4KPiBDaGFuZ2UgZm9yIHYyCj7C
oCAtQ2hhbmdlIHNwZWxsaW5nIGVycm9yLgo+Cj4gQ2hhbmdlIGZvciB2Mwo+wqAgLUFkZCBhY2tl
ZC1ieQo+Cj4gQ2hhbmdlIGZvciB2NAo+wqAgLUZpeCB2ZXJzaW9uIGVycm9yCj4gLS0tCj7CoCBk
cml2ZXJzL3VzYi9zdG9yYWdlL3VudXN1YWxfdWFzLmggfCA3ICsrKysrKysKPsKgIDEgZmlsZSBj
aGFuZ2VkLCA3IGluc2VydGlvbnMoKykKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3VzYi9zdG9y
YWdlL3VudXN1YWxfdWFzLmggYi9kcml2ZXJzL3VzYi9zdG9yYWdlL3VudXN1YWxfdWFzLmgKPiBp
bmRleCA4YTE4ZDU4Li4xNTZlODljIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvdXNiL3N0b3JhZ2Uv
dW51c3VhbF91YXMuaAo+ICsrKyBiL2RyaXZlcnMvdXNiL3N0b3JhZ2UvdW51c3VhbF91YXMuaAo+
IEBAIC0xOTgsNiArMTk4LDEzIEBAIFVOVVNVQUxfREVWKDB4MTU0YiwgMHhmMDBkLCAweDAwMDAs
IDB4OTk5OSwKPsKgIFVTQl9TQ19ERVZJQ0UsIFVTQl9QUl9ERVZJQ0UsIE5VTEwsCj7CoCBVU19G
TF9OT19BVEFfMVgpLAo+wqAKPiArLyogUmVwb3J0ZWQtYnk6IEhvbmdsaW5nIFplbmcgPHplbmdo
b25nbGluZ0BreWxpbm9zLmNuPiAqLwo+ICtVTlVTVUFMX0RFVigweDE3ZWYsIDB4Mzg5OSwgMHgw
MDAwLCAweDk5OTksCj4gKwkiVGhpbmtwbHVzIiwKPiArCSJFeHRlcm5hbCBIREQiLAo+ICsJVVNC
X1NDX0RFVklDRSwgVVNCX1BSX0RFVklDRSwgTlVMTCwKPiArCVVTX0ZMX0lHTk9SRV9VQVMpLAo+
ICsKPsKgIC8qIFJlcG9ydGVkLWJ5OiBIYW5zIGRlIEdvZWRlIDxoZGVnb2VkZUByZWRoYXQuY29t
PiAqLwo+wqAgVU5VU1VBTF9ERVYoMHgyMTA5LCAweDA3MTEsIDB4MDAwMCwgMHg5OTk5LAo+wqAg
IlZJQSIsCj4gLS0KPiAyLjEuMAo+

