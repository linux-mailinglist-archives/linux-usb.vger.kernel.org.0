Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6F3B35A9993
	for <lists+linux-usb@lfdr.de>; Thu,  1 Sep 2022 15:58:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234107AbiIAN6q (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 1 Sep 2022 09:58:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56260 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233048AbiIAN6e (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 1 Sep 2022 09:58:34 -0400
Received: from m15111.mail.126.com (m15111.mail.126.com [220.181.15.111])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 448A8B0F
        for <linux-usb@vger.kernel.org>; Thu,  1 Sep 2022 06:58:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
        s=s110527; h=Date:From:Subject:Mime-Version:Message-ID; bh=hBIOo
        MV+cXU9axnqwGlbAvTWbqki8xi1NwRvakGOe/4=; b=XiO/XwYaeRFsgQY99XNWp
        5SNiMKimM7q8CKd7kYJS7M/3hBGCoME0sio7DszEqZlKaYDzCBAKK/mo1uVfoNQH
        TZ6MIcKm10OfhiBikZhMpBPYfNTiWSEPw6M7Un10aFIStNdehpnCDJNLTN0OgiHE
        VQLr7OUfxGyi2pY71V23Pk=
Received: from 0V5ZS2WE6VIK6H0 (unknown [120.204.148.63])
        by smtp1 (Coremail) with SMTP id C8mowAD3_3NouhBjYA+JAg--.65149S2;
        Thu, 01 Sep 2022 21:58:01 +0800 (CST)
Date:   Thu, 1 Sep 2022 21:58:03 +0800
From:   "zhongling0719@126.com" <zhongling0719@126.com>
To:     gregkh <gregkh@linuxfoundation.org>
Cc:     zenghongling <zenghongling@kylinos.cn>,
        stern <stern@rowland.harvard.edu>,
        linux-usb <linux-usb@vger.kernel.org>,
        usb-storage <usb-storage@lists.one-eyed-alien.net>
Subject: Re: Re: [PATCH v4] uas: add no-uas quirk for Thinkplus and Hiksemi usb-storage
References: <1662015653-12976-1-git-send-email-zenghongling@kylinos.cn>, 
        <YxBvNEn0jEEd0lXV@kroah.com>, 
        <2022090120371974113815@126.com>, 
        <YxCtyOUkRlIqcC4d@kroah.com>
X-Priority: 3
X-GUID: 26133602-71BF-4214-A545-22782F44F048
X-Has-Attach: no
X-Mailer: Foxmail 7.2.16.188[cn]
Mime-Version: 1.0
Message-ID: <2022090121570194160929@126.com>
Content-Type: text/plain;
        charset="utf-8"
Content-Transfer-Encoding: base64
X-CM-TRANSID: C8mowAD3_3NouhBjYA+JAg--.65149S2
X-Coremail-Antispam: 1Uf129KBjvdXoW7Jw4rKr13GFW5Gw4rKry5CFg_yoWkurX_uw
        nrWrW8K3ykCa17Gw1xKrsrtrW3Xayv9r1xGr4fWr13AasxAF4DuFWvkrZ7Zw1IvF4UGrZ7
        GF15A3y0vr1a9jkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
        9fnUUvcSsGvfC2KfnxnUUI43ZEXa7xRKWrWDUUUUU==
X-Originating-IP: [120.204.148.63]
X-CM-SenderInfo: x2kr0wpolqwiqxrzqiyswou0bp/1tbiuQpv0FpD+bec0wAAsU
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

U29tZSBVQVNQIGNhcGFibGUgVVNCLXRvLVNBVEEgYnJpZGdlIGNvbnRyb2xsZXJzIGFyZSBub3Qg
Y29tcGF0aWJsZSx0aGlzIHByb2JsZW0gaGFzIGFsd2F5cyBleGlzdGVkLiB5b3UgY2FuIHJlZmVy
IHRvCm90aGVyIGF1dGhlciBzdWJtaXQgdGhlIHNpbWlsYXIgcGF0Y2guwqB0aGlzIHBhdGNoIGlz
IGZpeGVkIG5vIHNwZWVkLG5vdCBzbG93IHNwZWVkLgoKVGhhbmtzISDCoAoKemhvbmdsaW5nMDcx
OUAxMjYuY29tCsKgCkZyb206wqBncmVna2gKRGF0ZTrCoDIwMjItMDktMDHCoDIxOjA0ClRvOsKg
emhvbmdsaW5nMDcxOUAxMjYuY29tCkNDOsKgemVuZ2hvbmdsaW5nOyBzdGVybjsgbGludXgtdXNi
OyB1c2Itc3RvcmFnZQpTdWJqZWN0OsKgUmU6IFJlOiBbUEFUQ0ggdjRdIHVhczogYWRkIG5vLXVh
cyBxdWlyayBmb3IgVGhpbmtwbHVzIGFuZCBIaWtzZW1pIHVzYi1zdG9yYWdlCk9uIFRodSwgU2Vw
IDAxLCAyMDIyIGF0IDA4OjM4OjIxUE0gKzA4MDAsIHpob25nbGluZzA3MTlAMTI2LmNvbSB3cm90
ZToKPiBIaToKPiDCoCDCoFNvcnJ5IGFnYWluLCBUaGUgbGFzdCBlbWFpbCB3YXMgd3JvbmcsIGZp
eGVkIG15IGVtYWlsIHRvIG5vdCBzZW5kIGh0bWwgZW1haWwgYW5kIHJlc3BvbmQgYWdhaW4uwqAK
PiDCoCDCoFRoZSBkcml2ZXJzIG1hbnVmYWN0dXJlcnMgYWR2ZXJ0aXNlZCBoaWdoIHNwZWVkIHN1
cHBvcnQgcGxhdGZvcm0gaXMgV2luZG93cyxNYWNPU1gsIG5vdCBpbmNsdWRlIGxpbnV4IDQuOSAs
IHRoaXMgYnVnIHdpbGwgYWZmZWN0IHRoZSB1c2Vyc8KgCj4gbm9ybWFsIHVzZSwgcnVuIGlvem9u
ZSBpcyBqdXN0IG9uZSBvZiB0aGUgYmVoYXZpb3JzIHRoYXQgdHJpZ2dlciBVQVMgY3Jhc2ggLFdl
IHdpbGwgaGFuZGxlIHRoYXQgc2xvdyBpc3N1ZS4KwqAKSSBkbyBub3QgdW5kZXJzdGFuZCwgc29y
cnkuCsKgCldoYXQgaXMgc3BlY2lhbCBhYm91dCBMaW51eCB0aGF0IGNhdXNlcyB0aGVzZSBkcml2
ZXMgdG8gYnJlYWsgd2l0aCB0aGUKVUFTIHByb3RvY29sP8KgIFdoYXQgaXMgaXQgZG9pbmcgZGlm
ZmVyZW50IHRoYXQgT1NYIGFuZCBXaW5kb3dzIGRvZXMgbm90CmRvPwrCoApXZSBzaG91bGQgZml4
IHRoYXQgYnVnLCBub3QgZGVncmFkZSB0aGUgcGVyZm9ybWFuY2Ugb2YgdGhlc2UgZGV2aWNlcyB0
bwpleHRyZW1lbHkgc2xvdyBsZXZlbHMgZm9yIG5vIGdvb2QgcmVhc29uLgrCoAp0aGFua3MsCsKg
CmdyZWcgay1o

