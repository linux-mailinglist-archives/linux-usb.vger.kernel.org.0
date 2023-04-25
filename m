Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B370C6EE292
	for <lists+linux-usb@lfdr.de>; Tue, 25 Apr 2023 15:15:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234001AbjDYNPU (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 25 Apr 2023 09:15:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42948 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234131AbjDYNPR (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 25 Apr 2023 09:15:17 -0400
X-Greylist: delayed 975 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Tue, 25 Apr 2023 06:15:10 PDT
Received: from www484.your-server.de (www484.your-server.de [78.47.237.138])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BC53D13F88
        for <linux-usb@vger.kernel.org>; Tue, 25 Apr 2023 06:15:10 -0700 (PDT)
Received: from sslproxy05.your-server.de ([78.46.172.2])
        by www484.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <k.graefe@gateware.de>)
        id 1prIVg-00049W-Ug; Tue, 25 Apr 2023 15:15:08 +0200
Received: from [2003:ca:6730:e8f8:2015:edd6:c621:94ed]
        by sslproxy05.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <k.graefe@gateware.de>)
        id 1prIVg-000Mtw-ME; Tue, 25 Apr 2023 15:15:08 +0200
Content-Type: multipart/mixed; boundary="------------nNuzrWHsb1Ak5sIN7pMsgMUG"
Message-ID: <94afd6e0-7300-e8f4-d52e-c21acec04f5b@gateware.de>
Date:   Tue, 25 Apr 2023 15:15:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
From:   =?UTF-8?Q?Konrad_Gr=c3=a4fe?= <k.graefe@gateware.de>
Subject: [PATCH] usb: gadget: u_ether: Fix host MAC address case
To:     gregkh@linuxfoundation.org
Cc:     linux-usb@vger.kernel.org
Content-Language: en-US
X-Authenticated-Sender: k.graefe@gateware.de
X-Virus-Scanned: Clear (ClamAV 0.103.8/26887/Tue Apr 25 09:23:39 2023)
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This is a multi-part message in MIME format.
--------------nNuzrWHsb1Ak5sIN7pMsgMUG
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


As the CDC-ECM specification states the host MAC address must be sent to
the host as an uppercase hexadecimal string:
     The Unicode character is chosen from the set of values 30h through
     39h and 41h through 46h (0-9 and A-F).

However, snprintf(.., "%pm", ..) generates a lowercase MAC address
string. While most host drivers are tolerant to this, UsbNcm.sys on
Windows 10 is not. Instead it uses a different MAC address with all
bytes set to zero including and after the first byte containing a
lowercase letter. On Windows 11 Microsoft fixed it, but apparently they
did not backport the fix.

This change fixes the issue by upper-casing the MAC to comply with the
specification.

Signed-off-by: Konrad Gräfe <k.graefe@gateware.de>
---
  drivers/usb/gadget/function/u_ether.c | 9 ++++++++-
  1 file changed, 8 insertions(+), 1 deletion(-)


--------------nNuzrWHsb1Ak5sIN7pMsgMUG
Content-Type: text/x-patch; charset=UTF-8;
 name="0001-usb-gadget-u_ether-Fix-host-MAC-address-case.patch"
Content-Disposition: attachment;
 filename="0001-usb-gadget-u_ether-Fix-host-MAC-address-case.patch"
Content-Transfer-Encoding: base64

ZGlmZiAtLWdpdCBhL2RyaXZlcnMvdXNiL2dhZGdldC9mdW5jdGlvbi91X2V0aGVyLmMgYi9k
cml2ZXJzL3VzYi9nYWRnZXQvZnVuY3Rpb24vdV9ldGhlci5jCmluZGV4IDY5NTZhZDhiYThk
ZC4uMjUwNzM0ZTA5MGZjIDEwMDY0NAotLS0gYS9kcml2ZXJzL3VzYi9nYWRnZXQvZnVuY3Rp
b24vdV9ldGhlci5jCisrKyBiL2RyaXZlcnMvdXNiL2dhZGdldC9mdW5jdGlvbi91X2V0aGVy
LmMKQEAgLTk1OCw2ICs5NTgsNyBAQCBFWFBPUlRfU1lNQk9MX0dQTChnZXRoZXJfZ2V0X2hv
c3RfYWRkcik7CiBpbnQgZ2V0aGVyX2dldF9ob3N0X2FkZHJfY2RjKHN0cnVjdCBuZXRfZGV2
aWNlICpuZXQsIGNoYXIgKmhvc3RfYWRkciwgaW50IGxlbikKIHsKIAlzdHJ1Y3QgZXRoX2Rl
diAqZGV2OworCWludCBpLCBzbGVuOwogCiAJaWYgKGxlbiA8IDEzKQogCQlyZXR1cm4gLUVJ
TlZBTDsKQEAgLTk2NSw3ICs5NjYsMTMgQEAgaW50IGdldGhlcl9nZXRfaG9zdF9hZGRyX2Nk
YyhzdHJ1Y3QgbmV0X2RldmljZSAqbmV0LCBjaGFyICpob3N0X2FkZHIsIGludCBsZW4pCiAJ
ZGV2ID0gbmV0ZGV2X3ByaXYobmV0KTsKIAlzbnByaW50Zihob3N0X2FkZHIsIGxlbiwgIiVw
bSIsIGRldi0+aG9zdF9tYWMpOwogCi0JcmV0dXJuIHN0cmxlbihob3N0X2FkZHIpOworCisJ
c2xlbiA9IHN0cmxlbihob3N0X2FkZHIpOworCisJZm9yIChpID0gMDsgaSA8IHNsZW47IGkr
KykKKwkJaG9zdF9hZGRyW2ldID0gdG91cHBlcihob3N0X2FkZHJbaV0pOworCisJcmV0dXJu
IHNsZW47CiB9CiBFWFBPUlRfU1lNQk9MX0dQTChnZXRoZXJfZ2V0X2hvc3RfYWRkcl9jZGMp
OwogCgo=

--------------nNuzrWHsb1Ak5sIN7pMsgMUG--
