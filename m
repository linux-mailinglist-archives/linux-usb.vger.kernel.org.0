Return-Path: <linux-usb+bounces-21280-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F172A4C32F
	for <lists+linux-usb@lfdr.de>; Mon,  3 Mar 2025 15:18:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5D7C117162E
	for <lists+linux-usb@lfdr.de>; Mon,  3 Mar 2025 14:18:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 92D0F21423A;
	Mon,  3 Mar 2025 14:17:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=panix.com header.i=@panix.com header.b="ZNLveYei"
X-Original-To: linux-usb@vger.kernel.org
Received: from mailbackend.panix.com (mailbackend.panix.com [166.84.1.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 685F721423C
	for <linux-usb@vger.kernel.org>; Mon,  3 Mar 2025 14:17:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=166.84.1.89
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741011431; cv=none; b=r7ZbxKNF2LPRCHcLVmTdkcXGkYX+q+y2QdlaZmbV0X+FrSGuBRDUs/GiaJZq95tqfsKimXyddll75FwyZAp7InN1ivqTUH786a+r8uVKxjKz6KQ2IDFHdykYCsKrppISN2fQJ+AGIGVS6jkjMTP2nlX1waUt/WgkzHvYmIJFpgE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741011431; c=relaxed/simple;
	bh=QeGGfrk74QEvMsc/FL/OUZpqjVQlEV05ZCsiyxs3AUE=;
	h=Content-Type:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To; b=plam9nQidp2xq8E2MxwDs/m1lkfa71Ndui7rJDsebVuE9F1211VVW2FuXAb7VzneIUhMUf6c6qg2aAO2/RKp6QaHHA8oIGp8RHypKWuPoYYmrJdq1B34KqNhHakiuf5/VNa5+2hOywVj4MTtyht23NpaYy8qaLQGvjyMDgVzDIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=panix.com; spf=pass smtp.mailfrom=panix.com; dkim=pass (1024-bit key) header.d=panix.com header.i=@panix.com header.b=ZNLveYei; arc=none smtp.client-ip=166.84.1.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=panix.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=panix.com
Received: from [192.168.126.122] (ip72-219-82-239.oc.oc.cox.net [72.219.82.239])
	by mailbackend.panix.com (Postfix) with ESMTPSA id 4Z61900Kr6z15dS;
	Mon,  3 Mar 2025 09:17:07 -0500 (EST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=panix.com; s=panix;
	t=1741011428; bh=QeGGfrk74QEvMsc/FL/OUZpqjVQlEV05ZCsiyxs3AUE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=ZNLveYei1N5WlFunyQoFLml5EC6M/nICGFYJCcyTDXeajn5EOY577N+mxDg6gCNrn
	 tfTudlQ1ZR1UVKceP1eswAIRJ44n5tlZnMFmVVkaEBzrUmO8VN5V/0A0TI3ighiCVh
	 irEST3HbahNWrA1wzFBWdQ6LshQNNSTNo+/USN4U=
Content-Type: multipart/mixed; boundary="------------Iv0MqMyOw3Mg9lSuzZhb1O70"
Message-ID: <7c42c094-83c5-453b-a229-c435d89d5ecc@panix.com>
Date: Mon, 3 Mar 2025 06:17:06 -0800
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: So, I had to revert d6d458d42e1 ("Handle DisplayPort tunnel
 activation asynchronously") too, to stop my resume crashes
To: Mika Westerberg <mika.westerberg@linux.intel.com>, Me <kenny@panix.com>
Cc: linux-usb@vger.kernel.org
References: <f31309e4-6ce5-48cf-910e-cd74f818aac8@panix.com>
 <20250303112149.GS3713119@black.fi.intel.com>
 <d56fcd99-433e-4670-8388-7035812a78d9@panix.com>
 <20250303115329.GT3713119@black.fi.intel.com>
 <68cec31a-0132-43bd-8a61-29e0ac23b326@panix.com>
 <20250303131359.GV3713119@black.fi.intel.com>
 <744090aa-074e-443f-8a94-567dadff4c7d@panix.com>
 <20250303132327.GW3713119@black.fi.intel.com>
 <20250303134618.GX3713119@black.fi.intel.com>
 <24ef839c-8fa5-4a19-b9c6-0a267aab84f5@panix.com>
 <20250303140156.GY3713119@black.fi.intel.com>
Content-Language: en-US
From: Kenneth Crudup <kenny@panix.com>
In-Reply-To: <20250303140156.GY3713119@black.fi.intel.com>

This is a multi-part message in MIME format.
--------------Iv0MqMyOw3Mg9lSuzZhb1O70
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


Oh, and to be complete I should point out I have the following attached 
commit against Linus' master, else I don't get full power savings during 
s0ix sleep.

(I've been trying to get the PM people to get a version of this in for 
nearly a year now.)

I don't think it's relevant here, but just-in-case ....

-Kenny

-- 
Kenneth R. Crudup / Sr. SW Engineer, Scott County Consulting, Orange 
County CA

--------------Iv0MqMyOw3Mg9lSuzZhb1O70
Content-Type: text/x-patch; charset=UTF-8;
 name="0001-PCI-ASPM-Fixup-ASPM-for-VMD-bridges.patch"
Content-Disposition: attachment;
 filename="0001-PCI-ASPM-Fixup-ASPM-for-VMD-bridges.patch"
Content-Transfer-Encoding: base64

RnJvbSA4NDllMjcwNTJkNWExZTI3OWNjZTdiNmFiMTRlNDBhMzljM2IyYjI0IE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQpGcm9tOiAiS2VubmV0aCBSLiBDcnVkdXAiIDxrZW5ueUBwYW5p
eC5jb20+CkRhdGU6IEZyaSwgMTMgRGVjIDIwMjQgMTU6Mjg6NDIgLTA4MDAKU3ViamVjdDog
W1BBVENIXSBQQ0kvQVNQTTogRml4dXAgQVNQTSBmb3IgVk1EIGJyaWRnZXMKCkVmZmVjdGl2
ZWx5IGEgc3F1YXNoZWQgY29tbWl0IG9mOgpVQlVOVFU6IFNBVUNFOiBQQ0kvQVNQTTogRW5h
YmxlIEFTUE0gZm9yIGxpbmtzIHVuZGVyIFZNRCBkb21haW4KVUJVTlRVOiBTQVVDRTogUENJ
L0FTUE06IEVuYWJsZSBMVFIgZm9yIGVuZHBvaW50cyBiZWhpbmQgVk1EClVCVU5UVTogU0FV
Q0U6IHZtZDogZml4dXAgYnJpZGdlIEFTUE0gYnkgZHJpdmVyIG5hbWUgaW5zdGVhZAotLS0K
IGRyaXZlcnMvcGNpL3BjaWUvYXNwbS5jIHwgMjggKysrKysrKysrKysrKysrKysrKysrKysr
KysrLQogMSBmaWxlIGNoYW5nZWQsIDI3IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkK
CmRpZmYgLS1naXQgYS9kcml2ZXJzL3BjaS9wY2llL2FzcG0uYyBiL2RyaXZlcnMvcGNpL3Bj
aWUvYXNwbS5jCmluZGV4IDI4NTY3ZDQ1NzYxMy4uYTVkZjYyMzBjZjNjIDEwMDY0NAotLS0g
YS9kcml2ZXJzL3BjaS9wY2llL2FzcG0uYworKysgYi9kcml2ZXJzL3BjaS9wY2llL2FzcG0u
YwpAQCAtNzY4LDYgKzc2OCwzMSBAQCBzdGF0aWMgdm9pZCBhc3BtX2wxc3NfaW5pdChzdHJ1
Y3QgcGNpZV9saW5rX3N0YXRlICpsaW5rKQogCQlhc3BtX2NhbGNfbDEyX2luZm8obGluaywg
cGFyZW50X2wxc3NfY2FwLCBjaGlsZF9sMXNzX2NhcCk7CiB9CiAKKy8qCisgKiBCSU9TIG1h
eSBub3QgYmUgYWJsZSB0byBhY2Nlc3MgY29uZmlnIHNwYWNlIG9mIGRldmljZXMgdW5kZXIg
Vk1EIGRvbWFpbiwgc28KKyAqIGl0IHJlbGllcyBvbiBzb2Z0d2FyZSB0byBlbmFibGUgQVNQ
TSBmb3IgbGlua3MgdW5kZXIgVk1ELgorICovCitzdGF0aWMgYm9vbCBwY2lfZml4dXBfdm1k
X2JyaWRnZV9lbmFibGVfYXNwbShzdHJ1Y3QgcGNpX2RldiAqcGRldikKK3sKKyAgICAgICBz
dHJ1Y3QgcGNpX2J1cyAqYnVzID0gcGRldi0+YnVzOworICAgICAgIHN0cnVjdCBkZXZpY2Ug
KmRldjsKKyAgICAgICBzdHJ1Y3QgcGNpX2RyaXZlciAqcGRydjsKKworICAgICAgIGlmICgh
cGNpX2lzX3Jvb3RfYnVzKGJ1cykpCisgICAgICAgICAgICAgICByZXR1cm4gZmFsc2U7CisK
KyAgICAgICBkZXYgPSBidXMtPmJyaWRnZS0+cGFyZW50OworICAgICAgIGlmIChkZXYgPT0g
TlVMTCkKKyAgICAgICAgICAgICAgIHJldHVybiBmYWxzZTsKKworICAgICAgIHBkcnYgPSBw
Y2lfZGV2X2RyaXZlcih0b19wY2lfZGV2KGRldikpOworICAgICAgIGlmIChwZHJ2ID09IE5V
TEwgfHwgc3RyY21wKCJ2bWQiLCBwZHJ2LT5uYW1lKSkKKyAgICAgICAgICAgICAgIHJldHVy
biBmYWxzZTsKKworICAgICAgIHBjaV9pbmZvKHBkZXYsICJlbmFibGUgQVNQTSBmb3IgcGNp
IGJyaWRnZSBiZWhpbmQgdm1kIik7CisgICAgICAgcmV0dXJuIHRydWU7Cit9CisKIHN0YXRp
YyB2b2lkIHBjaWVfYXNwbV9jYXBfaW5pdChzdHJ1Y3QgcGNpZV9saW5rX3N0YXRlICpsaW5r
LCBpbnQgYmxhY2tsaXN0KQogewogCXN0cnVjdCBwY2lfZGV2ICpjaGlsZCA9IGxpbmstPmRv
d25zdHJlYW0sICpwYXJlbnQgPSBsaW5rLT5wZGV2OwpAQCAtODQ2LDcgKzg3MSw4IEBAIHN0
YXRpYyB2b2lkIHBjaWVfYXNwbV9jYXBfaW5pdChzdHJ1Y3QgcGNpZV9saW5rX3N0YXRlICps
aW5rLCBpbnQgYmxhY2tsaXN0KQogCX0KIAogCS8qIFNhdmUgZGVmYXVsdCBzdGF0ZSAqLwot
CWxpbmstPmFzcG1fZGVmYXVsdCA9IGxpbmstPmFzcG1fZW5hYmxlZDsKKwlsaW5rLT5hc3Bt
X2RlZmF1bHQgPSBwY2lfZml4dXBfdm1kX2JyaWRnZV9lbmFibGVfYXNwbShwYXJlbnQpID8K
KwkJUENJRV9MSU5LX1NUQVRFX0FTUE1fQUxMIDogbGluay0+YXNwbV9lbmFibGVkOwogCiAJ
LyogU2V0dXAgaW5pdGlhbCBjYXBhYmxlIHN0YXRlLiBXaWxsIGJlIHVwZGF0ZWQgbGF0ZXIg
Ki8KIAlsaW5rLT5hc3BtX2NhcGFibGUgPSBsaW5rLT5hc3BtX3N1cHBvcnQ7Ci0tIAoyLjQ1
LjIKCg==

--------------Iv0MqMyOw3Mg9lSuzZhb1O70--

