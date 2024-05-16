Return-Path: <linux-usb+bounces-10297-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E743C8C77EB
	for <lists+linux-usb@lfdr.de>; Thu, 16 May 2024 15:48:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 165301C21FE7
	for <lists+linux-usb@lfdr.de>; Thu, 16 May 2024 13:48:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F05041474DA;
	Thu, 16 May 2024 13:48:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="ZyOG1/Ek"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 365B8145A13
	for <linux-usb@vger.kernel.org>; Thu, 16 May 2024 13:48:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715867326; cv=none; b=gd0Zl0wue4oyGkDfaqvvDIXbG0MpOYPrfDPfLOVjP1aosx7N6XBIccXjy91KZDjanIDxK/m+tqVh0HrhcVNEja8ajTpYGdfE4RRuvOl97WlFViq0fsxtvmPF2r/j6EYqrSKWe4YIj0Ir3FWb9YCFizs0GK068e0o2TxPIaX4CPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715867326; c=relaxed/simple;
	bh=cGTq1Mr6XRQGj5El1AOC+8g6NCgV61bAQkisrXYxtGk=;
	h=Content-Type:Message-ID:Date:MIME-Version:To:Cc:From:Subject; b=a5jASPG8zsvX+FIB35ii369VRKekGIWdkkkjU+JF7y/254kKkKpm2szUjCV4/fhUuJMpzLkAeJX1Xj3LxkzMO4hNO2dl/axYOo++KHoLObeSuPMVFgDUmnuGecghj0q1Nfn165Ceez4wpJS0ldC6c82WndD4IZCMhtb0MDkw/kI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=ZyOG1/Ek; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4202ca70289so3696675e9.1
        for <linux-usb@vger.kernel.org>; Thu, 16 May 2024 06:48:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1715867322; x=1716472122; darn=vger.kernel.org;
        h=subject:from:cc:to:content-language:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=mrsAdzSdXZLsL6TsGkmdFoVJ6cxoYYdRK3ojiWAvfNU=;
        b=ZyOG1/EkdC+qm1jbdxC+GUkOAPJ02FCGwGPwfGBVP2Y1z/YnY25AglMhYFeXBgTCU4
         MyhcO7khuaM7AbgV/No4Kc+yu94HHvup4D1HvuGeRQWqbRU+KVwZO8A6Zp79QKr4YXPU
         VWO/2JTy4GqmNvErOEb2dRR6h0PwDqgUw3ipkkheFraa8woFDfoX+O1odxocEtAdXYTy
         d+doMZ40srVn6fqvYxRsP16Gcml33ooFeUDLLKKB3jY+59KKZJN++B467PsZu17fWHCP
         m8mG1ADVMgzI6jBYYwiq5Lu5W6cxrwvjC/sgfLqKXbw0P3ucAkkMFzihJfvUn0gTuE95
         S8+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715867322; x=1716472122;
        h=subject:from:cc:to:content-language:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mrsAdzSdXZLsL6TsGkmdFoVJ6cxoYYdRK3ojiWAvfNU=;
        b=TsWyNPINSDOoAPLzp0MxYOBgbQ/lWz4uWYRj0uFb+j3WCFd+K2De9gb1vCOu0sG6kJ
         B9vBYKVxS9Ne6/8TWAmkv/Xy4gb6rRZmgTR6ngNqLPll773/td8X9RIZC56JbovnJz3c
         qVHJxk+tq3W45TEOTUvAX4l7OxZHu2ixbIdgpiOtaScUBtHRZVuEIg1rsqwKI8AElWHd
         eUKEu5A6FxxvdusdRT2AcHBo4rQbwnU3D7kU74InB38UiP6SXvMC/NgiznGuzBOcBMne
         c/IZlDJ8ippZs7QzzVzC+saKV2WWfKw0dq3TvWWqgNs/stHcT1uf6z91FPe0SrBUwmW8
         GBDg==
X-Gm-Message-State: AOJu0YxIWSwvuE/2S0JtdnbL+M3wbK8/I0c7JJJYawpdMh1VYPL72i6R
	f6m7hWxXnKP681nGaSRSZgc9vHjJBA9xKst0I0UJ9Vb+wExco8BOhKdfrtFg4Pg=
X-Google-Smtp-Source: AGHT+IGkKNVwBn4bcFWMePzExft+92wPTyapF9jfx+mOTf5TZt0b1MkIfiGkrq01r82yJEcvzx++6g==
X-Received: by 2002:adf:ec4d:0:b0:343:7b6b:dcc6 with SMTP id ffacd0b85a97d-3504a73bc6amr13538707f8f.30.1715867322437;
        Thu, 16 May 2024 06:48:42 -0700 (PDT)
Received: from ?IPV6:2001:a61:139b:bf01:e8eb:4d8f:8770:df82? ([2001:a61:139b:bf01:e8eb:4d8f:8770:df82])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-351d95d47e7sm1655364f8f.117.2024.05.16.06.48.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 May 2024 06:48:41 -0700 (PDT)
Content-Type: multipart/mixed; boundary="------------C4TYjJpxonbAMjlOHBcNejhU"
Message-ID: <b94e5037-19da-4cc9-9a8a-28df8ada4795@suse.com>
Date: Thu, 16 May 2024 15:48:41 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Alan Stern <stern@rowland.harvard.edu>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: USB list <linux-usb@vger.kernel.org>
From: Oliver Neukum <oneukum@suse.com>
Subject: revisiting the issue of hardening the USB enumeration parser

This is a multi-part message in MIME format.
--------------C4TYjJpxonbAMjlOHBcNejhU
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

you convinced me that my last attempt to look at the parser
was fundamentally flawed. Instead I went top down from parsing
the configuration down to endpoints. I found one major issue.

static int find_next_descriptor(unsigned char *buffer, int size,
     int dt1, int dt2, int *num_skipped)
{
         struct usb_descriptor_header *h;
         int n = 0;
         unsigned char *buffer0 = buffer;
         
         /* Find the next descriptor of type dt1 or dt2 */
         while (size > 0) {
                 h = (struct usb_descriptor_header *) buffer;

                 if (h->bDescriptorType == dt1 || h->bDescriptorType == dt2)
                         break;
                 buffer += h->bLength;
                 size -= h->bLength;
                 ++n;
         }
         
         /* Store the number of descriptors skipped and return the
          * number of bytes skipped */
         if (num_skipped)
                 *num_skipped = n;
         return buffer - buffer0;
}

This is called from multiple sites on chains of descriptors.
We do have a check for overflowing the buffer in the while statement.
However, there is no guarantee for make progress. If at some point
in the chain we arrive at a descriptor of neither type we are looking
for and a bLength of 0, size will remain constant and the loop
will go on forever.

AFAICT this is guarded nowhere outside the function against.
So how about the attached patch?

	Regards
		Oliver
--------------C4TYjJpxonbAMjlOHBcNejhU
Content-Type: text/x-patch; charset=UTF-8;
 name="0001-USB-find_next_descriptor-prevent-eternal-loop-by-mis.patch"
Content-Disposition: attachment;
 filename*0="0001-USB-find_next_descriptor-prevent-eternal-loop-by-mis.pa";
 filename*1="tch"
Content-Transfer-Encoding: base64

RnJvbSA3YzE4ZjU2NzNhZTQxNjAyN2I4MTNhNTFlY2U0ZTY4OWI0MzgzYTZjIE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQpGcm9tOiBPbGl2ZXIgTmV1a3VtIDxvbmV1a3VtQHN1c2UuY29t
PgpEYXRlOiBUaHUsIDE2IE1heSAyMDI0IDE1OjA2OjM0ICswMjAwClN1YmplY3Q6IFtQQVRD
SF0gVVNCOiBmaW5kX25leHRfZGVzY3JpcHRvcjogcHJldmVudCBldGVybmFsIGxvb3AgYnkg
bWlzZm9ybWVkCiBkZXNjcmlwdG9ycwoKSW4gZmluZF9uZXh0X2Rlc2NyaXB0b3IoKSBpcyBj
YWxsZWQgdG8gb3BlcmF0ZSBvbiBjaGFpbnMgb2YgZGVzY3JpcHRvcnMuClRoZSBjYWxsZXJz
IG1ha2Ugc3VyZSB0aGF0IHRoZSBjaGFpbiBhcyBhIHdob2xlIGlzIG9mIHN1ZmZpY2llbnQg
bGVuZ3RoCmFuZCBpdCBpcyBlbnN1cmVkIHRoYXQgdGhlIGJ1ZmZlciBpcyBub3Qgb3ZlcmZs
b3duLgpIb3dldmVyLCB0aGUgY2VudHJhbCBkb2VzIG5vdCBndWFyZCBhZ2FpbnN0IGFuIGlu
bmVyIGxpbmsgaW4gdGhlIGNoYWluCmNsYWltaW5nIHplcm8gbGVuZ3RoLiBJbiB0aGF0IGNh
c2UgdGhlIGxvb3Agd2lsbCBtYWtlIG5vIHByb2dyZXNzIGFuZApnbyBvbiBmb3JldmVyLiBU
aGlzIGNhc2UgaGFzIHRvIGJlIHRlc3RlZCBmb3IuCgpTaWduZWQtb2ZmLWJ5OiBPbGl2ZXIg
TmV1a3VtIDxvbmV1a3VtQHN1c2UuY29tPgotLS0KIGRyaXZlcnMvdXNiL2NvcmUvY29uZmln
LmMgfCAyICsrCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0
IGEvZHJpdmVycy91c2IvY29yZS9jb25maWcuYyBiL2RyaXZlcnMvdXNiL2NvcmUvY29uZmln
LmMKaW5kZXggMzM2MmFmMTY1ZWY1Li42NWQyM2ZhMTliM2MgMTAwNjQ0Ci0tLSBhL2RyaXZl
cnMvdXNiL2NvcmUvY29uZmlnLmMKKysrIGIvZHJpdmVycy91c2IvY29yZS9jb25maWcuYwpA
QCAtMzQsNiArMzQsOCBAQCBzdGF0aWMgaW50IGZpbmRfbmV4dF9kZXNjcmlwdG9yKHVuc2ln
bmVkIGNoYXIgKmJ1ZmZlciwgaW50IHNpemUsCiAJLyogRmluZCB0aGUgbmV4dCBkZXNjcmlw
dG9yIG9mIHR5cGUgZHQxIG9yIGR0MiAqLwogCXdoaWxlIChzaXplID4gMCkgewogCQloID0g
KHN0cnVjdCB1c2JfZGVzY3JpcHRvcl9oZWFkZXIgKikgYnVmZmVyOworCQlpZiAoIWgtPmJM
ZW5ndGgpIC8qIHdlIHdvdWxkIGxvb3AgZm9yZXZlciAqLworCQkJcmV0dXJuIDA7CiAJCWlm
IChoLT5iRGVzY3JpcHRvclR5cGUgPT0gZHQxIHx8IGgtPmJEZXNjcmlwdG9yVHlwZSA9PSBk
dDIpCiAJCQlicmVhazsKIAkJYnVmZmVyICs9IGgtPmJMZW5ndGg7Ci0tIAoyLjQ1LjAKCg==


--------------C4TYjJpxonbAMjlOHBcNejhU--

