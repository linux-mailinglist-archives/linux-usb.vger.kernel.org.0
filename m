Return-Path: <linux-usb+bounces-31472-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DE736CC19D5
	for <lists+linux-usb@lfdr.de>; Tue, 16 Dec 2025 09:43:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C6E223033685
	for <lists+linux-usb@lfdr.de>; Tue, 16 Dec 2025 08:39:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F8C13148D2;
	Tue, 16 Dec 2025 08:39:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="M+CsR9nY"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E292312837
	for <linux-usb@vger.kernel.org>; Tue, 16 Dec 2025 08:39:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765874392; cv=none; b=Al2bsb2KEaD7n0age7WVgNoG8r+zBtBz8O2fuz0+fVLhjo5r/xwjcHsfYyGi9Xx5XcEXaAkeKhAFMjJNLG0moWSoWzUO+Tr3jv7bxAWjf6MlT4I60W32BE27ZuIUQTsOrISNYUh1w8hUEbWiGMpr28w5dGDJKgtTjU+yU5rLK40=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765874392; c=relaxed/simple;
	bh=OE5fUgnbvjTeQdaQPicHiJDHoA0Pdynn/WLvHqPYvdw=;
	h=Content-Type:Message-ID:Date:MIME-Version:Subject:To:References:
	 From:In-Reply-To; b=r/Je8df0YRrtClOFySKAihZ8R+J1aZODi4i+OH3cC7euz/aAInRvK1zFDQaEdmZw48ERN2eLvdfUPQjFNt3nhcMGyRRbxObLKTCYsyOxJQmIenKu3XkTAK0n0MZTbJwv4drKsWNSjfpFI5QdjXnA/l6UzO9VCjl5YR1TPLWLXYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=M+CsR9nY; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-47796a837c7so31242495e9.0
        for <linux-usb@vger.kernel.org>; Tue, 16 Dec 2025 00:39:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1765874387; x=1766479187; darn=vger.kernel.org;
        h=in-reply-to:from:content-language:references:to:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=D7Qv9SslRhpmsahtPfS+bjwRGa7x7sZp13OuHI7Wm7w=;
        b=M+CsR9nYSwvAhqD1qq3kv+WkmF4maUqH6SGNl1px7r26IPcyAbBvRjYqjQsWotfc4g
         R8wDenNrGl36Lchlyy0wqRxezak6/TFhjh55OekP+/ERsS+xjGgUjQxCCYCHmcCJfRX0
         F+Ihx/4JRaXB5+gPQNwQYzAZwKf3QRN4Uxy8/X9FHQw311aYdjzYondy7OzW+9l+vaSz
         GfYC+4qkTi9uDpDoTQha957EVJ0QGX2rEiLMSzB+PksNwzI205waj+XPG1TPdybntloM
         8SFjYdIBdlUjQ7wQv9ubbnBZy+73R/6hLi6uTnKaY+iiYPPfO7irSrCHkIIXK0Ylbz08
         SeTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765874387; x=1766479187;
        h=in-reply-to:from:content-language:references:to:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=D7Qv9SslRhpmsahtPfS+bjwRGa7x7sZp13OuHI7Wm7w=;
        b=cu6RYWwHuPPioUyIaii4+Xi3Sz5JfuPCfIY3l0jYCqbYhcSaGpCN//6Rmb2O8vZXJ9
         jxp7ItU59LzEDOdvHA3hiPyjs0uxhkI2iXan0uVp8tX71Dybge8sNOnYlCwKlLDUXhDH
         SV/3SNBi9VFGC4i+bE1uBPDZJm2KmdFDOsa/qOJstOVnil0xh9HJ1b3GTkqdGbEp6kZa
         wSY9aGtwhbrELCtjbDbyHa+IpcI1ToIWUBKDF7pnAbNEQPUBDc0vHQ4coie8wob12eNu
         GjxRT5tQFDbBgvxxJzfeQQ141dK10DKkiZceO752GDsFM4+yaW9Ogl5CCtAjknkcis3t
         FoiA==
X-Forwarded-Encrypted: i=1; AJvYcCVbet2Ky2IofasdZcL9c0VoHDJ5Hmodn1Jg9B1mOdtxIWfuMc/ADAxB3LmFWjnYSwHSSSniDi8Pe6Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YyD+Fusso8Y0ILpbvLYioYNXFSJYi/WMoSVsqRgB7+p+s39Ae9w
	/cND//gXunFKvbFGFzEYk4nMIhLlsM2+OMKnHDfotQvw/LkzxVZRprgGytpUYwccTCE=
X-Gm-Gg: AY/fxX7REyVO/jVoJcDJD1/k9z1zgGstfHkjZc/EJDgD6UGFQOKXQ4FV9l9HfNabR7G
	p5uIu6n5T0fu4C1CQiFdNZ9uXfB6S5s0uEFo/JuQVXG9/OOIwyoaKBXqQO09cAHWret/uF/fuqK
	lYjll1A761n6kNWUDT1CYFsFvkUUXdwfnN7RhAq2JaM1BYWOZPV3UmzNpRT4M6NRD+7yGZYrelm
	dQS0pB8yg/YSOSamLtK33kYhyhlEHOfRTKs00AgxltRoxmZUoTFQt4V6kwBo/IdpnRDSDdMW2P7
	8UYxNHKyDyN7A70LqJTBwgwAO8a3ZlmwA9HUXsp+rW3S33a20Psj7oCx/otPczGAp1qrC8+ez1C
	WAUh31KLdnvzp3ZLVjse+hWFscXJOqnyK5hBl//5Snyp5k+ER4eyMtGEzYlrLUpCSwQKnynaGAP
	Y2vmUaHQCUa+XFvp8GKrKM+NHv1LYBLPWC+4hAeYdCi8mLVfcuEAGxZxE=
X-Google-Smtp-Source: AGHT+IH0HP/s4qO9Cgo2HUtlMoysysqu3ANanEUUPBpNA8ADJN4UH5SGnWOo+835oNH1l76BTpwUlw==
X-Received: by 2002:a05:600c:46cb:b0:47a:810f:1d06 with SMTP id 5b1f17b1804b1-47a8f89cb47mr147837255e9.4.1765874387498;
        Tue, 16 Dec 2025 00:39:47 -0800 (PST)
Received: from ?IPV6:2001:a61:1386:f701:7efb:ef00:b697:5d05? ([2001:a61:1386:f701:7efb:ef00:b697:5d05])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42fa8b85d1esm34513800f8f.26.2025.12.16.00.39.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Dec 2025 00:39:47 -0800 (PST)
Content-Type: multipart/mixed; boundary="------------CfkTvbG7f8400si7CR5Vk5p7"
Message-ID: <b0899011-78bb-4fdd-9e49-3dad6b11a9e6@suse.com>
Date: Tue, 16 Dec 2025 09:39:46 +0100
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Trouble with drivers for Epson Moverio BT-40
To: natalie roentgen connolly <natalie@natalieee.net>,
 Oliver Neukum <oneukum@suse.com>, linux-usb@vger.kernel.org
References: <9c4491aa-88d3-4c9a-843c-2f0d471263e0@natalieee.net>
 <ade89a9d-6034-43e6-ba74-778db2f8837c@suse.com>
 <ce3a8714-bce5-4cac-ba80-f3c64e6ff5e9@natalieee.net>
Content-Language: en-US
From: Oliver Neukum <oneukum@suse.com>
In-Reply-To: <ce3a8714-bce5-4cac-ba80-f3c64e6ff5e9@natalieee.net>

This is a multi-part message in MIME format.
--------------CfkTvbG7f8400si7CR5Vk5p7
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 15.12.25 15:17, natalie roentgen connolly wrote:
> Hello,
> 
> Without adding {USB_DEVICE(0x04b8, 0x0d12)} to acm_ids, the stock driver
> emits no logs:

Hi,

OK, I see the issue. There is no nice solution to this
issue, so here is the ugly solution. Could you test the attached patch?

	Regards
		Oliver

--------------CfkTvbG7f8400si7CR5Vk5p7
Content-Type: text/x-patch; charset=UTF-8;
 name="0001-cdc-acm-new-quirk-for-EPSON-HMD.patch"
Content-Disposition: attachment;
 filename="0001-cdc-acm-new-quirk-for-EPSON-HMD.patch"
Content-Transfer-Encoding: base64

RnJvbSA1NjU0MGUxOGQzNjc2NDE3ZWM3NWUyNWY0ZmU5ZWI1Njc3MGUwNzVjIE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQpGcm9tOiBPbGl2ZXIgTmV1a3VtIDxvbmV1a3VtQHN1c2UuY29t
PgpEYXRlOiBUdWUsIDE2IERlYyAyMDI1IDA5OjM2OjIzICswMTAwClN1YmplY3Q6IFtQQVRD
SF0gY2RjLWFjbTogbmV3IHF1aXJrIGZvciBFUFNPTiBITUQKClRoaXMgZGV2aWNlIGhhcyBh
IHVuaW9uIGRlc2NyaXB0b3IgdGhhdCBpcyBqdXN0IGdhcmJhZ2UKYW5kIG5lZWRzIGEgY3Vz
dG9tIGRlc2NyaXB0b3IuCgpTaWduZWQtb2ZmLWJ5OiBPbGl2ZXIgTmV1a3VtIDxvbmV1a3Vt
QHN1c2UuY29tPgpDQzogc3RhYmxlQHZnZXIua2VybmVsLm9yZwotLS0KIGRyaXZlcnMvdXNi
L2NsYXNzL2NkYy1hY20uYyB8IDkgKysrKysrKysrCiBkcml2ZXJzL3VzYi9jbGFzcy9jZGMt
YWNtLmggfCAxICsKIDIgZmlsZXMgY2hhbmdlZCwgMTAgaW5zZXJ0aW9ucygrKQoKZGlmZiAt
LWdpdCBhL2RyaXZlcnMvdXNiL2NsYXNzL2NkYy1hY20uYyBiL2RyaXZlcnMvdXNiL2NsYXNz
L2NkYy1hY20uYwppbmRleCA1NGJlNGFhMWRjYjIuLjAwYzcyZGRkNGNlMSAxMDA2NDQKLS0t
IGEvZHJpdmVycy91c2IvY2xhc3MvY2RjLWFjbS5jCisrKyBiL2RyaXZlcnMvdXNiL2NsYXNz
L2NkYy1hY20uYwpAQCAtMTIyNSw2ICsxMjI1LDEyIEBAIHN0YXRpYyBpbnQgYWNtX3Byb2Jl
KHN0cnVjdCB1c2JfaW50ZXJmYWNlICppbnRmLAogCQlpZiAoIWRhdGFfaW50ZXJmYWNlIHx8
ICFjb250cm9sX2ludGVyZmFjZSkKIAkJCXJldHVybiAtRU5PREVWOwogCQlnb3RvIHNraXBf
bm9ybWFsX3Byb2JlOworCX0gZWxzZSBpZiAocXVpcmtzID09IE5PX1VOSU9OXzEyKSB7CisJ
CWRhdGFfaW50ZXJmYWNlID0gdXNiX2lmbnVtX3RvX2lmKHVzYl9kZXYsIDIpOworCQljb250
cm9sX2ludGVyZmFjZSA9IHVzYl9pZm51bV90b19pZih1c2JfZGV2LCAxKTsKKwkJaWYgKCFk
YXRhX2ludGVyZmFjZSB8fCAhY29udHJvbF9pbnRlcmZhY2UpCisJCQkgcmV0dXJuIC1FTk9E
RVY7CisJCWdvdG8gc2tpcF9ub3JtYWxfcHJvYmU7CiAJfQogCiAJLyogbm9ybWFsIHByb2Jp
bmcqLwpAQCAtMTc0Niw2ICsxNzUyLDkgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCB1c2JfZGV2
aWNlX2lkIGFjbV9pZHNbXSA9IHsKIAl7IFVTQl9ERVZJQ0UoMHgwNDViLCAweDAyNEQpLAkv
KiBSZW5lc2FzIFItQ2FyIEUzIFVTQiBEb3dubG9hZCBtb2RlICovCiAJLmRyaXZlcl9pbmZv
ID0gRElTQUJMRV9FQ0hPLAkvKiBEb24ndCBlY2hvIGJhbm5lciAqLwogCX0sCisJeyBVU0Jf
REVWSUNFKDB4MDRiOCwgMHgwZDEyKSwJLyogRVBTT04gSE1EIENvbSZTZW5zICovCisJLmRy
aXZlcl9pbmZvID0gTk9fVU5JT05fMTIsCS8qIHVuaW9uIGRlc2NyaXB0b3IgaXMgZ2FyYmFn
ZSAqLworCX0sCiAJeyBVU0JfREVWSUNFKDB4MGU4ZCwgMHgwMDAzKSwgLyogRklSRUZMWSwg
TWVkaWFUZWsgSW5jOyBhbmRyZXkuYXJhcG92QGdtYWlsLmNvbSAqLwogCS5kcml2ZXJfaW5m
byA9IE5PX1VOSU9OX05PUk1BTCwgLyogaGFzIG5vIHVuaW9uIGRlc2NyaXB0b3IgKi8KIAl9
LApkaWZmIC0tZ2l0IGEvZHJpdmVycy91c2IvY2xhc3MvY2RjLWFjbS5oIGIvZHJpdmVycy91
c2IvY2xhc3MvY2RjLWFjbS5oCmluZGV4IDc1OWFjMTU2MzFkMy4uMGUzMjMzMDM5MWNhIDEw
MDY0NAotLS0gYS9kcml2ZXJzL3VzYi9jbGFzcy9jZGMtYWNtLmgKKysrIGIvZHJpdmVycy91
c2IvY2xhc3MvY2RjLWFjbS5oCkBAIC0xMTMsMyArMTEzLDQgQEAgc3RydWN0IGFjbSB7CiAj
ZGVmaW5lIENMRUFSX0hBTFRfQ09ORElUSU9OUwkJQklUKDUpCiAjZGVmaW5lIFNFTkRfWkVS
T19QQUNLRVQJCUJJVCg2KQogI2RlZmluZSBESVNBQkxFX0VDSE8JCQlCSVQoNykKKyNkZWZp
bmUgTk9fVU5JT05fMTIJCQlCSVQoOCkKLS0gCjIuNTIuMAoK

--------------CfkTvbG7f8400si7CR5Vk5p7--

