Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BB3426FCCCE
	for <lists+linux-usb@lfdr.de>; Tue,  9 May 2023 19:33:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230128AbjEIRdT (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 9 May 2023 13:33:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44492 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229539AbjEIRdT (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 9 May 2023 13:33:19 -0400
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E3A8D40D2
        for <linux-usb@vger.kernel.org>; Tue,  9 May 2023 10:33:17 -0700 (PDT)
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-3f42b984405so8049925e9.3
        for <linux-usb@vger.kernel.org>; Tue, 09 May 2023 10:33:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683653596; x=1686245596;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=sQihjeyUd8yXDv3l7fVMNz3UDM0+OQkMAsLJz31kPYg=;
        b=lCeLhIxFOCnemxqZ0AL2h2GgwYSLP+PbM6/5bceEvep4MnQqq/AFR64HUB0yOZEpeZ
         1oGC/N0F7sE4A0YK7erMjhjXHg5xIg3sHxZufFs1wb3IfJXycBHOWjTHncK9ec9erPQ5
         qVvw0s3rX3SXimrPy2SfwyzS0T3WVpfUdtNgSDqUBZ4pEmuENaP51aDSJt4LEaMDOheO
         1yaNSsaHohW1zwIIEYfdHgB2ZN6yczPPdotW2hH39sFqC0K6Kl2cZUr9+S9AvZ6ebr/d
         6zOhAyeeEmIQBRJjmeAArhg3QdWG9QmUwe9O8BrUPo4B1bw0ntLY3K8cLIH5aAfLK6F3
         XYHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683653596; x=1686245596;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sQihjeyUd8yXDv3l7fVMNz3UDM0+OQkMAsLJz31kPYg=;
        b=GPcHDHC0P0LqgrTrFZ+fDK7DXu+xZcpDTvPjUwoSzHxSm4CX4j0jzU5MzpMsTj1tWV
         YgXHPFGF20X3bdawNzSDim6QbehpwIHA+SJi0kPhWKFGLAxw5IeWyqupHAY8sCFppUyv
         UeUkVn8WfXJNcpNUUT7CyaNzL+9gyRj9M2duD5muYXbFKgIY5uj5ZOys0RMLxWk5DbHx
         kSpqTvkc2V/+6Db2xNJ3wLG5il1f9db5VbXp7fb3SHE4FcPVnxClWB85ED1zqML0l883
         Bw79Td8glIY+UOcvuffsZ9cC9TAM7VYyU2KwIQK82WGpTCbuNUgxmyfF05qfz5mCCkDj
         u0eQ==
X-Gm-Message-State: AC+VfDyj71dGSYkc42aWj7VkemAW0/dT/bVeBsE+squIe0IJFlfLz0+L
        8Q6yj+NaDiFcbYkP9ehFG2A=
X-Google-Smtp-Source: ACHHUZ4bIiyCq+83YFt/M9k5WBCtBnIsAAeD7foSWtRJvvW53g1rlG5NFfVsfq825JA46vzukk5cQg==
X-Received: by 2002:a05:600c:3798:b0:3f4:1a97:ab07 with SMTP id o24-20020a05600c379800b003f41a97ab07mr7805835wmr.8.1683653596057;
        Tue, 09 May 2023 10:33:16 -0700 (PDT)
Received: from ?IPv6:2a02:168:6806:0:4fa3:b24e:a45d:ab9e? ([2a02:168:6806:0:4fa3:b24e:a45d:ab9e])
        by smtp.gmail.com with ESMTPSA id q20-20020a1ce914000000b003edc4788fa0sm20348519wmc.2.2023.05.09.10.33.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 May 2023 10:33:15 -0700 (PDT)
Message-ID: <519bc128c0ded61b64d26c6e9260bc1fd7c6dea3.camel@gmail.com>
Subject: Re: [PATCH v1] usb: xhci: plat: Add USB 3.0 phy support
From:   Klaus Kudielka <klaus.kudielka@gmail.com>
To:     Stanley Chang <stanley_chang@realtek.com>,
        Mathias Nyman <mathias.nyman@intel.com>
Cc:     linux-usb@vger.kernel.org
Date:   Tue, 09 May 2023 19:33:15 +0200
In-Reply-To: <20230407060731.20537-1-stanley_chang@realtek.com>
References: <20230407060731.20537-1-stanley_chang@realtek.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

T24gRnJpLCAyMDIzLTA0LTA3IGF0IDE0OjA3ICswODAwLCBTdGFubGV5IENoYW5nIHdyb3RlOgo+
IEZvciBSZWFsdGVrIFNvQywgdGhlIHVzYiB4aGNpIHVzZXMgZGlmZmVyZW50IGRyaXZlciBmb3Ig
dTJwaHkgYW5kIHUzcGh5Lgo+IFRoZXJlZm9yZSwgYWRkIGEgaG9vayB0byByZXRyaWV2ZSB0aGUg
VVNCIDMuMCBQSFkgdG8gWEhDSSBwbGF0Lgo+IAo+IFNpZ25lZC1vZmYtYnk6IFN0YW5sZXkgQ2hh
bmcgPHN0YW5sZXlfY2hhbmdAcmVhbHRlay5jb20+Cj4gLS0tCj4gwqBkcml2ZXJzL3VzYi9ob3N0
L3hoY2ktcGxhdC5jIHwgMTUgKysrKysrKysrKysrKysrCj4gwqAxIGZpbGUgY2hhbmdlZCwgMTUg
aW5zZXJ0aW9ucygrKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3VzYi9ob3N0L3hoY2ktcGxh
dC5jIGIvZHJpdmVycy91c2IvaG9zdC94aGNpLXBsYXQuYwo+IGluZGV4IGI5Zjk2MjU0NjdkNi4u
NjFjOTUzNDliOTk4IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvdXNiL2hvc3QveGhjaS1wbGF0LmMK
PiArKysgYi9kcml2ZXJzL3VzYi9ob3N0L3hoY2ktcGxhdC5jCj4gQEAgLTI5MSw2ICsyOTEsMjEg
QEAgaW50IHhoY2lfcGxhdF9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2LCBzdHJ1
Y3QgZGV2aWNlICpzeXNkZXYsIGNvbnN0IHMKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqBnb3RvIGRlYWxsb2NfdXNiMl9oY2Q7Cj4gwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqB9Cj4gwqAKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgeGhjaS0+c2hhcmVkX2hjZC0+dXNiX3BoeSA9IGRldm1fdXNiX2dldF9waHlfYnlfcGhhbmRs
ZShzeXNkZXYsCj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgInVzYi1waHkiLCAxKTsKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
aWYgKElTX0VSUih4aGNpLT5zaGFyZWRfaGNkLT51c2JfcGh5KSkgewo+ICvCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgaWYgKFBUUl9FUlIoeGhjaS0+c2hhcmVk
X2hjZC0+dXNiX3BoeSkgIT0gLUVOT0RFVikKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBkZXZfZXJyKHN5c2RldiwgIiVzIGdl
dCB1c2IzcGh5IGZhaWwgKHJldD0lZClcbiIsCgpIZWxsbywKCkknbSBib290aW5nIDYuNC1yYzEg
b24gYSBUdXJyaXMgT21uaWEgKGFybS9ib290L2R0cy9hcm1hZGEtMzg1LXR1cnJpcy1vbW5pYS5k
dHMpCmFuZCBnZXQgdGhvc2UgZXJyb3IgbWVzc2FnZXM6ClsgICAgMC4yMzE2MDldIHhoY2ktaGNk
IGYxMGYwMDAwLnVzYjM6IHhoY2lfcGxhdF9wcm9iZSBnZXQgdXNiM3BoeSBmYWlsIChyZXQ9LTYp
ClsgICAgMC4yMzk3MTZdIHhoY2ktaGNkIGYxMGY4MDAwLnVzYjM6IHhoY2lfcGxhdF9wcm9iZSBn
ZXQgdXNiM3BoeSBmYWlsIChyZXQ9LTYpCgpJdCBsb29rcyBsaWtlIGEgY29zbWV0aWMgaXNzdWUg
d2l0aCBlcnJvciBjb2RlcywgYnV0IG1heWJlIGl0IGNhbiBiZSBmaXhlZD8KCgo+ICvCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBfX2Z1bmNfXywKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIChpbnQpUFRSX0VSUih4aGNpLT5zaGFyZWRfaGNkLT51c2JfcGh5KSk7Cj4gK8KgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqB4aGNpLT5zaGFyZWRfaGNk
LT51c2JfcGh5ID0gTlVMTDsKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgfSBlbHNl
IHsKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHJldCA9
IHVzYl9waHlfaW5pdCh4aGNpLT5zaGFyZWRfaGNkLT51c2JfcGh5KTsKPiArwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGlmIChyZXQpCj4gK8KgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgZGV2X2Vy
cihzeXNkZXYsICIlcyBpbml0IHVzYjNwaHkgZmFpbCAocmV0PSVkKVxuIiwKPiArwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIF9fZnVuY19fLCByZXQpOwo+ICvCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqB9Cj4gKwo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgeGhjaS0+
c2hhcmVkX2hjZC0+dHBsX3N1cHBvcnQgPSBoY2QtPnRwbF9zdXBwb3J0Owo+IMKgwqDCoMKgwqDC
oMKgwqB9Cj4gwqAKCg==

