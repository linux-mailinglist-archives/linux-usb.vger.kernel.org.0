Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 130AAA552B
	for <lists+linux-usb@lfdr.de>; Mon,  2 Sep 2019 13:42:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731051AbfIBLmS (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 2 Sep 2019 07:42:18 -0400
Received: from mx2.suse.de ([195.135.220.15]:50072 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1730106AbfIBLmS (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 2 Sep 2019 07:42:18 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id 21303AF8D;
        Mon,  2 Sep 2019 11:42:17 +0000 (UTC)
Message-ID: <1567424535.2469.11.camel@suse.com>
Subject: Re: Lacie Rugged USB3-FW does not work with UAS
From:   Oliver Neukum <oneukum@suse.com>
To:     Julian Sikorski <belegdol@gmail.com>, linux-usb@vger.kernel.org
Date:   Mon, 02 Sep 2019 13:42:15 +0200
In-Reply-To: <a090c289-6b1a-8907-271a-069aea96ba2f@gmail.com>
References: <ffe7a644-bd56-3f3e-4673-f69f21f4132b@gmail.com>
         <1566567572.8347.54.camel@suse.com>
         <bedb5e9f-5332-4905-2237-347d7ea77447@gmail.com>
         <0eaecb64-4c67-110d-8493-31dd7fd58759@gmail.com>
         <1566595393.8347.56.camel@suse.com>
         <5f8f8e05-a29b-d868-b354-75ac48d40133@gmail.com>
         <a090c289-6b1a-8907-271a-069aea96ba2f@gmail.com>
Content-Type: multipart/mixed; boundary="=-LBj7SrdPX+QDFvsW0yiE"
X-Mailer: Evolution 3.26.6 
Mime-Version: 1.0
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


--=-LBj7SrdPX+QDFvsW0yiE
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Am Donnerstag, den 29.08.2019, 20:33 +0200 schrieb Julian Sikorski:

Hi,

this is a relief. If necessary we can blacklist the new device.
Howevera, as that costs performance, I would appriciate if
you take first try out an alternative approach.

> [  362.230833] usb 2-4: New USB device found, idVendor=059f, 
> idProduct=1061, bcdDevice= 0.01
> [  362.230837] usb 2-4: New USB device strings: Mfr=2, Product=3, 
> SerialNumber=1
> [  362.230839] usb 2-4: Product: Rugged USB3-FW
> [  362.230841] usb 2-4: Manufacturer: LaCie
> [  362.230842] usb 2-4: SerialNumber: 00000000157f928920fa
> [  362.270100] scsi host12: uas
> [  362.270720] scsi 12:0:0:0: Direct-Access     LaCie    Rugged FW USB3 
>   051E PQ: 0 ANSI: 6
> [  362.271472] sd 12:0:0:0: Attached scsi generic sg1 type 0
> [  362.280344] sd 12:0:0:0: [sdb] 1953525168 512-byte logical blocks: 
> (1.00 TB/932 GiB)
> [  362.280422] sd 12:0:0:0: [sdb] Write Protect is off
> [  362.280423] sd 12:0:0:0: [sdb] Mode Sense: 43 00 00 00
> [  362.280544] sd 12:0:0:0: [sdb] Write cache: enabled, read cache: 
> enabled, doesn't support DPO or FUA

This means that at least the earliest commandos did get through.

> [  392.672691] sd 12:0:0:0: tag#29 uas_eh_abort_handler 0 uas-tag 1 
> inflight: IN
> [  392.672697] sd 12:0:0:0: tag#29 CDB: Report supported operation codes 
> a3 0c 01 12 00 00 00 00 02 00 00 00
> [  392.678304] scsi host12: uas_eh_device_reset_handler start
> [  392.800099] usb 2-4: reset SuperSpeed Gen 1 USB device number 3 using 
> xhci_hcd
> [  392.848154] scsi host12: uas_eh_device_reset_handler success
> [  422.875443] scsi host12: uas_eh_device_reset_handler start
> [  422.875650] sd 12:0:0:0: tag#16 uas_zap_pending 0 uas-tag 1 inflight:
> [  422.875654] sd 12:0:0:0: tag#16 CDB: Report supported operation codes 
> a3 0c 01 12 00 00 00 00 02 00 00 00
> [  422.997556] usb 2-4: reset SuperSpeed Gen 1 USB device number 3 using 
> xhci_hcd
> [  423.046525] scsi host12: uas_eh_device_reset_handler success
> [  431.853505] usb 2-4: USB disconnect, device number 3
> [  431.903459] sd 12:0:0:0: [sdb] Optimal transfer size 33553920 bytes
> [  432.064456] sd 12:0:0:0: [sdb] Read Capacity(16) failed: Result: 
> hostbyte=DID_ERROR driverbyte=DRIVER_OK

Read Capacity(16) failed

> [  432.064459] sd 12:0:0:0: [sdb] Sense not available.
> [  432.184595] sd 12:0:0:0: [sdb] Read Capacity(10) failed: Result: 
> hostbyte=DID_ERROR driverbyte=DRIVER_OK

Read Capacity(10) failed

There is a chance that this device can deal only with Read Capacity(10)
and crashes on Read Capacity(16). One difference between Usb-storage
and UAS is the order in which the 10 and 16 versions are tried.
The attached patches introduce a quirk to reverse the order
for this particular device under UAS. Could you try them?

	Regards
		Oliver

--=-LBj7SrdPX+QDFvsW0yiE
Content-Disposition: attachment; filename="0001-uas-honor-flag-to-avoid-CAPACITY16.patch"
Content-Type: text/x-patch; name="0001-uas-honor-flag-to-avoid-CAPACITY16.patch";
	charset="UTF-8"
Content-Transfer-Encoding: base64

RnJvbSA4ODMzNTU5NTFhMjNkM2M0YjNjMTRjYTA1NDA5NzI3MzlhZTZmZmIyIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBPbGl2ZXIgTmV1a3VtIDxvbmV1a3VtQHN1c2UuY29tPgpEYXRl
OiBNb24sIDIgU2VwIDIwMTkgMTM6Mjg6MzkgKzAyMDAKU3ViamVjdDogW1BBVENIIDEvMl0gdWFz
OiBob25vciBmbGFnIHRvIGF2b2lkIENBUEFDSVRZMTYKCkNvcHkgdGhlIHN1cHBvcnQgb3ZlciBm
cm9tIHVzYi1zdG9yYWdlCgpTaWduZWQtb2ZmLWJ5OiBPbGl2ZXIgTmV1a3VtIDxvbmV1a3VtQHN1
c2UuY29tPgotLS0KIGRyaXZlcnMvdXNiL3N0b3JhZ2UvdWFzLmMgfCA0ICsrKysKIDEgZmlsZSBj
aGFuZ2VkLCA0IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL3VzYi9zdG9yYWdl
L3Vhcy5jIGIvZHJpdmVycy91c2Ivc3RvcmFnZS91YXMuYwppbmRleCA2OGIxY2IwZjg0ZTUuLmE4
YmQ1ZmY1YTRiOSAxMDA2NDQKLS0tIGEvZHJpdmVycy91c2Ivc3RvcmFnZS91YXMuYworKysgYi9k
cml2ZXJzL3VzYi9zdG9yYWdlL3Vhcy5jCkBAIC04NTQsNiArODU0LDEwIEBAIHN0YXRpYyBpbnQg
dWFzX3NsYXZlX2NvbmZpZ3VyZShzdHJ1Y3Qgc2NzaV9kZXZpY2UgKnNkZXYpCiAJCXNkZXYtPndj
ZV9kZWZhdWx0X29uID0gMTsKIAl9CiAKKwkvKiBTb21lIGRldmljZXMgY2Fubm90IGhhbmRsZSBS
RUFEX0NBUEFDSVRZXzE2ICovCisJaWYgKGRldmluZm8tPmZsYWdzICYgVVNfRkxfTk9fUkVBRF9D
QVBBQ0lUWV8xNikKKwkJc2Rldi0+bm9fcmVhZF9jYXBhY2l0eV8xNiA9IDE7CisKIAkvKgogCSAq
IFNvbWUgZGlza3MgcmV0dXJuIHRoZSB0b3RhbCBudW1iZXIgb2YgYmxvY2tzIGluIHJlc3BvbnNl
CiAJICogdG8gUkVBRCBDQVBBQ0lUWSByYXRoZXIgdGhhbiB0aGUgaGlnaGVzdCBibG9jayBudW1i
ZXIuCi0tIAoyLjE2LjQKCg==


--=-LBj7SrdPX+QDFvsW0yiE
Content-Disposition: attachment; filename="0002-uas-quirk-for-LaCie-Rugged-USB-3.patch"
Content-Type: text/x-patch; name="0002-uas-quirk-for-LaCie-Rugged-USB-3.patch";
	charset="UTF-8"
Content-Transfer-Encoding: base64

RnJvbSAxMTUzODlmZjY3OGNhZTdjYjYzNmFjN2U1MjBmMDZlNTE4MmNkMzUzIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBPbGl2ZXIgTmV1a3VtIDxvbmV1a3VtQHN1c2UuY29tPgpEYXRl
OiBNb24sIDIgU2VwIDIwMTkgMTM6MzA6MDAgKzAyMDAKU3ViamVjdDogW1BBVENIIDIvMl0gdWFz
OiBxdWlyayBmb3IgTGFDaWUgUnVnZ2VkIFVTQiAzCgpOby4gQ0FQQUNJVFkxNiBmb3IgdGhlc2Ug
ZGV2aWNlcy4KClNpZ25lZC1vZmYtYnk6IE9saXZlciBOZXVrdW0gPG9uZXVrdW1Ac3VzZS5jb20+
Ci0tLQogZHJpdmVycy91c2Ivc3RvcmFnZS91bnVzdWFsX2RldnMuaCB8IDYgKysrKysrCiAxIGZp
bGUgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy91c2Ivc3Rv
cmFnZS91bnVzdWFsX2RldnMuaCBiL2RyaXZlcnMvdXNiL3N0b3JhZ2UvdW51c3VhbF9kZXZzLmgK
aW5kZXggZWEwZDI3YTk0YWZlLi42NDNiYmE0MTI5MWUgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvdXNi
L3N0b3JhZ2UvdW51c3VhbF9kZXZzLmgKKysrIGIvZHJpdmVycy91c2Ivc3RvcmFnZS91bnVzdWFs
X2RldnMuaApAQCAtODA2LDYgKzgwNiwxMiBAQCBVTlVTVUFMX0RFViggIDB4MDU5ZiwgMHgwNjUx
LCAweDAwMDAsIDB4MDAwMCwKIAkJVVNCX1NDX0RFVklDRSwgVVNCX1BSX0RFVklDRSwgTlVMTCwK
IAkJVVNfRkxfTk9fV1BfREVURUNUICksCiAKK1VOVVNVQUxfREVWKCAgMHgwNTlmLCAweDEwM2Us
IDB4MDAwMiwgMHgwMDAyLAorCQkiTGFDaWUiLAorCQkiUnVnZ2VkIFVTQiAzIiwKKwkJVVNCX1ND
X0RFVklDRSwgVVNCX1BSX0RFVklDRSwgTlVMTCwKKwkJVVNfRkxfTk9fUkVBRF9DQVBBQ0lUWV8x
NiApLAorCiAvKgogICogU3VibWl0dGVkIGJ5IEpvZWwgQm91cnF1YXJkIDxudW1sb2NrQGZyZWVz
dXJmLmNoPgogICogU29tZSB2ZXJzaW9ucyBvZiB0aGlzIGRldmljZSBuZWVkIHRoZSBTdWJDbGFz
cyBhbmQgUHJvdG9jb2wgb3ZlcnJpZGVzCi0tIAoyLjE2LjQKCg==


--=-LBj7SrdPX+QDFvsW0yiE--

