Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 99E5F1CE7A1
	for <lists+linux-usb@lfdr.de>; Mon, 11 May 2020 23:43:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726066AbgEKVnE (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 11 May 2020 17:43:04 -0400
Received: from mx1.riseup.net ([198.252.153.129]:59150 "EHLO mx1.riseup.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725860AbgEKVnD (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 11 May 2020 17:43:03 -0400
Received: from bell.riseup.net (bell-pn.riseup.net [10.0.1.178])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (Client CN "*.riseup.net", Issuer "Sectigo RSA Domain Validation Secure Server CA" (not verified))
        by mx1.riseup.net (Postfix) with ESMTPS id 49LZDR4PlXzFfSd
        for <linux-usb@vger.kernel.org>; Mon, 11 May 2020 14:43:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
        t=1589233383; bh=r7B52bmo5ZlyqMqJdRECuIHZoOcrjuTQ0OL8B3AsC1Q=;
        h=From:Date:Subject:To:Cc:From;
        b=nNUojih14EwOmDSAXh6Mf/g8rqrAXCOnw1egVQiAvFH7uoicrXjcHl7bhX1pmL2PZ
         u1hnOhHr5M27/MAIxXUfanY+RILEZp+btpqKmN3eVxX9PH4X7cxhTa0Bmu97WlP7or
         MmZQ463cYaAdy06hXyHfsc1S/Q4TU+mxBYbFti78=
X-Riseup-User-ID: F79A9119A6E5EE31A8D352A51ECA9D95866DA2C2FDC665D19B2AD39D5F97FAA5
Received: from [127.0.0.1] (localhost [127.0.0.1])
         by bell.riseup.net (Postfix) with ESMTPSA id 49LZDR3FFWzJqVS
        for <linux-usb@vger.kernel.org>; Mon, 11 May 2020 14:43:03 -0700 (PDT)
Received: by mail-io1-f46.google.com with SMTP id f3so11613917ioj.1
        for <linux-usb@vger.kernel.org>; Mon, 11 May 2020 14:43:03 -0700 (PDT)
X-Gm-Message-State: AGi0PuZOLQanav27fm/vds+m6oHzHRDUw3JtbgDagFnsakSuetYG//r2
        Z7twEHpQAa0N9n7uSZlC3zL/k5gzfxoQQ+pmOpmCkA==
X-Google-Smtp-Source: APiQypJTUWQVM9vwLw392SarDhDNSeeY62GHUFMwrwDCjQQz0GlyoFsShPqR1QOdVm82+rzhhQdxZvhPcnHPgYR6ZFk=
X-Received: by 2002:a5d:8b57:: with SMTP id c23mr16962484iot.88.1589233382540;
 Mon, 11 May 2020 14:43:02 -0700 (PDT)
MIME-Version: 1.0
From:   David Manouchehri <david.manouchehri@riseup.net>
Date:   Mon, 11 May 2020 17:42:51 -0400
X-Gmail-Original-Message-ID: <CAJEJqRzVe1oWZAWMq=JLkAtDpH4pxvLVoh4uO=qqF+a6sL77uA@mail.gmail.com>
Message-ID: <CAJEJqRzVe1oWZAWMq=JLkAtDpH4pxvLVoh4uO=qqF+a6sL77uA@mail.gmail.com>
Subject: [PATCH] thunderbolt: Update Kconfig to allow building on other architectures.
To:     mika.westerberg@linux.intel.com
Cc:     david.manouchehri@riseup.net, YehezkelShB@gmail.com,
        linux-usb@vger.kernel.org, andreas.noever@gmail.com,
        michael.jamet@intel.com
Content-Type: multipart/mixed; boundary="0000000000003bb0f705a5663b90"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

--0000000000003bb0f705a5663b90
Content-Type: text/plain; charset="UTF-8"

Thunderbolt 3 and USB4 shouldn't be x86 only.

Tested on a SolidRun HoneyComb (ARM Cortex-A72) with a
Gigabyte Titan Ridge Thunderbolt 3 PCIe card (JHL7540).

Signed-off-by: David Manouchehri <david.manouchehri@riseup.net>
---
 drivers/thunderbolt/Kconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/thunderbolt/Kconfig b/drivers/thunderbolt/Kconfig
index 1eb757e8df3b..f02010738bb6 100644
--- a/drivers/thunderbolt/Kconfig
+++ b/drivers/thunderbolt/Kconfig
@@ -2,7 +2,6 @@
 menuconfig USB4
        tristate "Unified support for USB4 and Thunderbolt"
        depends on PCI
-       depends on X86 || COMPILE_TEST
        select APPLE_PROPERTIES if EFI_STUB && X86
        select CRC32
        select CRYPTO
-- 
2.25.1

--0000000000003bb0f705a5663b90
Content-Type: text/x-patch; charset="US-ASCII"; 
	name="0001-thunderbolt-Update-Kconfig-to-allow-building-on-othe.patch"
Content-Disposition: attachment; 
	filename="0001-thunderbolt-Update-Kconfig-to-allow-building-on-othe.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_ka2zazmc0>
X-Attachment-Id: f_ka2zazmc0

RnJvbSBlYmY5NmUyMzQ3OGM0YTM2MDI5OWEwMmVjOTZmZmRhN2IzYzNhZDk4IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBEYXZpZCBNYW5vdWNoZWhyaSA8ZGF2aWQubWFub3VjaGVocmlA
cmlzZXVwLm5ldD4KRGF0ZTogTW9uLCAxMSBNYXkgMjAyMCAxNjozNjoyMyAtMDQwMApTdWJqZWN0
OiBbUEFUQ0hdIHRodW5kZXJib2x0OiBVcGRhdGUgS2NvbmZpZyB0byBhbGxvdyBidWlsZGluZyBv
biBvdGhlcgogYXJjaGl0ZWN0dXJlcy4KClRodW5kZXJib2x0IDMgYW5kIFVTQjQgc2hvdWxkbid0
IGJlIHg4NiBvbmx5LgoKVGVzdGVkIG9uIGEgU29saWRSdW4gSG9uZXlDb21iIChBUk0gQ29ydGV4
LUE3Mikgd2l0aCBhCkdpZ2FieXRlIFRpdGFuIFJpZGdlIFRodW5kZXJib2x0IDMgUENJZSBjYXJk
IChKSEw3NTQwKS4KClNpZ25lZC1vZmYtYnk6IERhdmlkIE1hbm91Y2hlaHJpIDxkYXZpZC5tYW5v
dWNoZWhyaUByaXNldXAubmV0PgotLS0KIGRyaXZlcnMvdGh1bmRlcmJvbHQvS2NvbmZpZyB8IDEg
LQogMSBmaWxlIGNoYW5nZWQsIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL3Ro
dW5kZXJib2x0L0tjb25maWcgYi9kcml2ZXJzL3RodW5kZXJib2x0L0tjb25maWcKaW5kZXggMWVi
NzU3ZThkZjNiLi5mMDIwMTA3MzhiYjYgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvdGh1bmRlcmJvbHQv
S2NvbmZpZworKysgYi9kcml2ZXJzL3RodW5kZXJib2x0L0tjb25maWcKQEAgLTIsNyArMiw2IEBA
CiBtZW51Y29uZmlnIFVTQjQKIAl0cmlzdGF0ZSAiVW5pZmllZCBzdXBwb3J0IGZvciBVU0I0IGFu
ZCBUaHVuZGVyYm9sdCIKIAlkZXBlbmRzIG9uIFBDSQotCWRlcGVuZHMgb24gWDg2IHx8IENPTVBJ
TEVfVEVTVAogCXNlbGVjdCBBUFBMRV9QUk9QRVJUSUVTIGlmIEVGSV9TVFVCICYmIFg4NgogCXNl
bGVjdCBDUkMzMgogCXNlbGVjdCBDUllQVE8KLS0gCjIuMjUuMQoK
--0000000000003bb0f705a5663b90--
