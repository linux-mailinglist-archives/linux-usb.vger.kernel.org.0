Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4BEEA1E0E67
	for <lists+linux-usb@lfdr.de>; Mon, 25 May 2020 14:28:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390584AbgEYM2N (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 25 May 2020 08:28:13 -0400
Received: from mx2.suse.de ([195.135.220.15]:42334 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2390583AbgEYM2M (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 25 May 2020 08:28:12 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx2.suse.de (Postfix) with ESMTP id E58BFAC6C;
        Mon, 25 May 2020 12:28:13 +0000 (UTC)
Message-ID: <1590409690.2838.7.camel@suse.com>
Subject: Re: Kernel Oops in cdc_acm
From:   Oliver Neukum <oneukum@suse.com>
To:     Jean Rene Dawin <jdawin@math.uni-bielefeld.de>,
        linux-usb@vger.kernel.org
Date:   Mon, 25 May 2020 14:28:10 +0200
In-Reply-To: <20200525120026.GA11378@math.uni-bielefeld.de>
References: <20200525120026.GA11378@math.uni-bielefeld.de>
Content-Type: multipart/mixed; boundary="=-rDkTfpqbYzFHRDvygipD"
X-Mailer: Evolution 3.26.6 
Mime-Version: 1.0
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


--=-rDkTfpqbYzFHRDvygipD
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Am Montag, den 25.05.2020, 14:00 +0200 schrieb Jean Rene Dawin:
> Hi,
> 
> I use a Nokia 515 connected via USB as a UMTS modem for my PC:
> CPU0: Intel(R) Core(TM)2 Duo CPU     E8400  @ 3.00GHz (family: 0x6, model: 0x17, stepping: 0xa)
> 
> Output of lsusb -v -d for the device is attached.
> 
> The battery of the phone is old, and sometimes the phone just turns off.
> Up intil recently (before 5.6.10) turning on the phone again would restore the connection.
> 
> But roughly since commits 0afccd7601514c4b83d8cc58c740089cc447051d and/or  4e7279cd1d19f48f0af2a10ed020febaa9ac092 the kernel gets an Oops and eventually the system hangs.
> The behaviour is reproducible by taking out the battery from the phone during a connection.
> 
> Tested wtih 5.6.10, 5.6.14 and 5.7-rc6. The following dmesg output is from 5.7-rc6:

Hi,

it looks to me like I made a mistake in fixing the error handling for
some devices. Could you test the attached patch?

	Regards
		Oliver

--=-rDkTfpqbYzFHRDvygipD
Content-Disposition: attachment; filename="CDC-ACM-heed-quirk-also-in-error-handling.patch"
Content-Transfer-Encoding: base64
Content-Type: text/x-patch; name="CDC-ACM-heed-quirk-also-in-error-handling.patch";
	charset="UTF-8"

RnJvbSAzMzhmZTczODYwM2QyNjEyYTMxN2M5YmVjOTgyMzZlYjA5NGFlMTA5IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBPbGl2ZXIgTmV1a3VtIDxvbmV1a3VtQHN1c2UuY29tPgpEYXRl
OiBNb24sIDI1IE1heSAyMDIwIDE0OjIxOjQ0ICswMjAwClN1YmplY3Q6IFtQQVRDSF0gQ0RDLUFD
TTogaGVlZCBxdWlyayBhbHNvIGluIGVycm9yIGhhbmRsaW5nCgpJZiBidWZmZXJzIGFyZSBpdGVy
YXRlZCBvdmVyIGluIHRoZSBlcnJvciBjYXNlLCB0aGUgbG93ZXIgbGltaXRzCmZvciBxdWlya3kg
ZGV2aWNlcyBtdXN0IGJlIGhlZWRlZC4KClNpZ25lZC1vZmYtYnk6IE9saXZlciBOZXVrdW0gPG9u
ZXVrdW1Ac3VzZS5jb20+Ci0tLQogZHJpdmVycy91c2IvY2xhc3MvY2RjLWFjbS5jIHwgMiArLQog
MSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0
IGEvZHJpdmVycy91c2IvY2xhc3MvY2RjLWFjbS5jIGIvZHJpdmVycy91c2IvY2xhc3MvY2RjLWFj
bS5jCmluZGV4IDc2NzhhZTRhZmQ1My4uYmU0NTQzNTY5ODIyIDEwMDY0NAotLS0gYS9kcml2ZXJz
L3VzYi9jbGFzcy9jZGMtYWNtLmMKKysrIGIvZHJpdmVycy91c2IvY2xhc3MvY2RjLWFjbS5jCkBA
IC01ODUsNyArNTg1LDcgQEAgc3RhdGljIHZvaWQgYWNtX3NvZnRpbnQoc3RydWN0IHdvcmtfc3Ry
dWN0ICp3b3JrKQogCX0KIAogCWlmICh0ZXN0X2FuZF9jbGVhcl9iaXQoQUNNX0VSUk9SX0RFTEFZ
LCAmYWNtLT5mbGFncykpIHsKLQkJZm9yIChpID0gMDsgaSA8IEFDTV9OUjsgaSsrKSAKKwkJZm9y
IChpID0gMDsgaSA8IGFjbS0+cnhfYnVmbGltaXQ7IGkrKykgCiAJCQlpZiAodGVzdF9hbmRfY2xl
YXJfYml0KGksICZhY20tPnVyYnNfaW5fZXJyb3JfZGVsYXkpKQogCQkJCQlhY21fc3VibWl0X3Jl
YWRfdXJiKGFjbSwgaSwgR0ZQX05PSU8pOwogCX0KLS0gCjIuMTYuNAoK


--=-rDkTfpqbYzFHRDvygipD--

