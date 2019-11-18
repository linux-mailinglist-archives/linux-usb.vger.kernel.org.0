Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C80D1100214
	for <lists+linux-usb@lfdr.de>; Mon, 18 Nov 2019 11:08:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726664AbfKRKII (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 18 Nov 2019 05:08:08 -0500
Received: from mail-ot1-f49.google.com ([209.85.210.49]:33029 "EHLO
        mail-ot1-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726490AbfKRKII (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 18 Nov 2019 05:08:08 -0500
Received: by mail-ot1-f49.google.com with SMTP id u13so14005686ote.0
        for <linux-usb@vger.kernel.org>; Mon, 18 Nov 2019 02:08:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=R4VlYB/CflQPVop27wL1pXFTGTTjJyizWlTzfZhqWd0=;
        b=ooGGf+avlDPX/vSN4XQn4M0+SapZOwMgc0/ZBy8nD5KPNiYAwiMYs4xTbrgQL7rvEG
         f6EMUZ+eemyXE6Y7EWq1/xaBNzS7gvYjl3PL7bWxX5anvFM9YELTqes+ZG3x6qk00wyg
         zCgRJjbiY2gf3cW8fR48dCeVFI6CwLlRCHOCTNJOZDzRjdI6Wgh4EIHdTicfyiV4TTkZ
         9QUeXuuTNK8L8GqJsJa9jgDTVIMbFtCT8TrvHrnKawOudrTgkR5b15Y4Nx8gSWrEh3LA
         dDs4Xj5QlmnYIDbBiMIm6KB0awLLDVyXffaLbX6edm0bRdL/5BVxMofJj/WEdvS+ZoNR
         6zmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=R4VlYB/CflQPVop27wL1pXFTGTTjJyizWlTzfZhqWd0=;
        b=a2sz6sV2E4qPqHdS0u5+wSytiW5+kLnWIrwphP8u+4knBNarrTYY11uElF7iwBbxS0
         4KG5cvFDj7W4DsM1zrYQw0jbdi9MNAc+e1j9ZWr463dfJzNNA35KLGkhcVXcFeqpawbJ
         XRfKOUhF5R/xRa+MnM3PPYTMDcv603cBCMEMsQDMZqJrIxu+Z6vCL6Y4Oef/VMWNTT28
         4oa98SmKLWvi8dXNVec+bFr32wezVsfn/NAA34X3E0OcPTanHtzn4qowd/+kPINhvuxa
         h33+FDGcaMZFxntJIc4iuvEQDibqaCMa/hd/axjf9Ae3NffKsam/PXFTjPmnZCGZDph5
         +nbg==
X-Gm-Message-State: APjAAAU2uea29nkzvDKQPkNPH+JfOiLjyKmsBq5l+uWk5qC3e4J4iqas
        CUr4AjliIQ/BD/T4grhvid4VSfXMhObY3jgyAtTqDBO3kC8Y
X-Google-Smtp-Source: APXvYqyWVc5KH+KJgJeGRGsESevzB8k3SjryBza88MdaL0BwqaujwbDvDAlSlweQ0TdM79ijEjM8IofvLPxWwk7Qrsg=
X-Received: by 2002:a05:6830:2017:: with SMTP id e23mr10688245otp.327.1574071687189;
 Mon, 18 Nov 2019 02:08:07 -0800 (PST)
MIME-Version: 1.0
From:   Pacho Ramos <pachoramos@gmail.com>
Date:   Mon, 18 Nov 2019 11:07:55 +0100
Message-ID: <CAHG43MtDYqiV6pye91D8_bA-4bMvVHWFHjsDgEMsmhh2n-Z2ww@mail.gmail.com>
Subject: JMicron USB to ATA/ATAPI Bridge requires usb-storage quirks to
 disable uas
To:     linux-usb@vger.kernel.org
Content-Type: multipart/mixed; boundary="000000000000c4889f05979c1f25"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

--000000000000c4889f05979c1f25
Content-Type: text/plain; charset="UTF-8"

Hello,

I would like to forward the patch that is being used for years in
Fedora and Gentoo to fix connectivity issues of JMicron devices with
UAS when they got into idle state:
https://bugzilla.redhat.com/show_bug.cgi?id=1260207
https://bugs.gentoo.org/640082

The problem is still valid with current kernels, then, I guess the
patch wasn't forwarded here or got forgotten for some reason. This
patch works fine for current kernel 4.13.11 too

Thanks a lot

--000000000000c4889f05979c1f25
Content-Type: text/x-patch; charset="US-ASCII"; 
	name="2500_usb-storage-Disable-UAS-on-JMicron-SATA-enclosure.patch"
Content-Disposition: attachment; 
	filename="2500_usb-storage-Disable-UAS-on-JMicron-SATA-enclosure.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_k349moza0>
X-Attachment-Id: f_k349moza0

RnJvbSBkMDJhNTUxODIzMDdjMDExMzZiNTk5ZmQwNDhiNDY3OWYyNTlhODRlIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBMYXVyYSBBYmJvdHQgPGxhYmJvdHRAZmVkb3JhcHJvamVjdC5v
cmc+CkRhdGU6IFR1ZSwgOCBTZXAgMjAxNSAwOTo1MzozOCAtMDcwMApTdWJqZWN0OiBbUEFUQ0hd
IHVzYi1zdG9yYWdlOiBEaXNhYmxlIFVBUyBvbiBKTWljcm9uIFNBVEEgZW5jbG9zdXJlCgpTdGV2
ZSBFbGxpcyByZXBvcnRlZCBpbmNvcnJlY3QgYmxvY2sgc2l6ZXMgYW5kIGFsaWduZW1lbnQKb2Zm
c2V0cyB3aXRoIGEgU0FUQSBlbmNsb3N1cmUuIEFkZGluZyBhIHF1aXJrIHRvIGRpc2FibGUKVUFT
IGZpeGVzIHRoZSBwcm9ibGVtcy4KClJlcG9ydGVkLWJ5OiBTdGV2ZW4gRWxsaXMgPHNlbGxpc0By
ZWRoYXQuY29tPgpTaWduZWQtb2ZmLWJ5OiBMYXVyYSBBYmJvdHQgPGxhYmJvdHRAZmVkb3JhcHJv
amVjdC5vcmc+Ci0tLQogZHJpdmVycy91c2Ivc3RvcmFnZS91bnVzdWFsX3Vhcy5oIHwgNyArKysr
Ky0tCiAxIGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvdXNiL3N0b3JhZ2UvdW51c3VhbF91YXMuaCBiL2RyaXZlcnMvdXNi
L3N0b3JhZ2UvdW51c3VhbF91YXMuaAppbmRleCBjODVlYTUzLi4yMTZkOTNkIDEwMDY0NAotLS0g
YS9kcml2ZXJzL3VzYi9zdG9yYWdlL3VudXN1YWxfdWFzLmgKKysrIGIvZHJpdmVycy91c2Ivc3Rv
cmFnZS91bnVzdWFsX3Vhcy5oCkBAIC0xNDEsMTIgKzE0MSwxNSBAQCBVTlVTVUFMX0RFVigweDIx
MDksIDB4MDcxMSwgMHgwMDAwLCAweDk5OTksCiAJCVVTQl9TQ19ERVZJQ0UsIFVTQl9QUl9ERVZJ
Q0UsIE5VTEwsCiAJCVVTX0ZMX05PX0FUQV8xWCksCiAKLS8qIFJlcG9ydGVkLWJ5OiBUYWtlbyBO
YWtheWFtYSA8amF2aGVyYUBnbXguY29tPiAqLworLyoKKyAqIEluaXRpYWxseSBSZXBvcnRlZC1i
eTogVGFrZW8gTmFrYXlhbWEgPGphdmhlcmFAZ214LmNvbT4KKyAqIFVBUyBJZ25vcmUgUmVwb3J0
ZWQgYnkgU3RldmVuIEVsbGlzIDxzZWxsaXNAcmVkaGF0LmNvbT4KKyAqLwogVU5VU1VBTF9ERVYo
MHgzNTdkLCAweDc3ODgsIDB4MDAwMCwgMHg5OTk5LAogCQkiSk1pY3JvbiIsCiAJCSJKTVM1NjYi
LAogCQlVU0JfU0NfREVWSUNFLCBVU0JfUFJfREVWSUNFLCBOVUxMLAotCQlVU19GTF9OT19SRVBP
UlRfT1BDT0RFUyksCisJCVVTX0ZMX05PX1JFUE9SVF9PUENPREVTIHwgVVNfRkxfSUdOT1JFX1VB
UyksCiAKIC8qIFJlcG9ydGVkLWJ5OiBIYW5zIGRlIEdvZWRlIDxoZGVnb2VkZUByZWRoYXQuY29t
PiAqLwogVU5VU1VBTF9ERVYoMHg0OTcxLCAweDEwMTIsIDB4MDAwMCwgMHg5OTk5LAotLSAKMi40
LjMKCg==
--000000000000c4889f05979c1f25--
