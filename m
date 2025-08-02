Return-Path: <linux-usb+bounces-26330-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C732B18B66
	for <lists+linux-usb@lfdr.de>; Sat,  2 Aug 2025 10:44:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0ABC73B41C0
	for <lists+linux-usb@lfdr.de>; Sat,  2 Aug 2025 08:44:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 26B241FCFE7;
	Sat,  2 Aug 2025 08:43:59 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from verain.settrans.net (verain.settrans.net [93.93.131.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8888418D
	for <linux-usb@vger.kernel.org>; Sat,  2 Aug 2025 08:43:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.93.131.233
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754124238; cv=none; b=MHePOpR/EIHvGfTz4LBXWQolpYMJg5KIm3mX5JgKJ0VrGopL6Z8A6OS+DAjUsJgnuPCPWqXyWj4gTOVuSkk2FvMbTFhJh2Wf3ixCjNBgwrI06dAj4TNYuSqjnNeA4MlQTdmZNK9UnbrOjLVNE5KVdhLKKuS+ol3PibNtQ/CzchQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754124238; c=relaxed/simple;
	bh=/oJ9pOFCvES5ArczOl7TKbuF2KRKAJaEXWDWc9oSuUk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Fms6zb7D/TyjOvgviR6fC/EGNM0vt2AJZajWuoVkM57VVrQIpFQnDE59qSFbvHCgOQFz/BWbSbMi/ni/V/uZQh02lmhpmAP9FsVPewVTH8KmlXjbYRBlCUdFoKgVmInA4xSTNrfa7CrN1/30YhJAK05XLLASrbVGnWGB6Z9G6t4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=settrans.net; spf=pass smtp.mailfrom=settrans.net; arc=none smtp.client-ip=93.93.131.233
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=settrans.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=settrans.net
Received: from [193.187.128.66] (helo=[172.24.1.6])
	by verain.settrans.net with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.94)
	(envelope-from <rah@settrans.net>)
	id 1ui7qE-0004hV-8e; Sat, 02 Aug 2025 09:43:46 +0100
Message-ID: <1bdde0f1-11ad-41a4-b206-1bef7330dac3@settrans.net>
Date: Sat, 2 Aug 2025 09:43:40 +0100
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Audio interface causing "xhci_hcd ... WARN: buffer overrun event"
 messages
To: Mathias Nyman <mathias.nyman@linux.intel.com>,
 =?UTF-8?Q?Micha=C5=82_Pecio?= <michal.pecio@gmail.com>
Cc: linux-usb@vger.kernel.org
References: <ba0ebd17-dade-4a97-b696-5ad19ebfca1d@settrans.net>
 <20250731101720.5d10a8f1@foxbook> <20250731102728.503cd612@foxbook>
 <3bbb710c-351d-46ec-a2e4-9ee4d766a750@settrans.net>
 <f277779a-34af-4db0-bef0-fa41aa538f97@linux.intel.com>
Content-Language: en-GB
From: Robert Ham <rah@settrans.net>
In-Reply-To: <f277779a-34af-4db0-bef0-fa41aa538f97@linux.intel.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------ARrhXW5qTlvI1S0IF2tZ28xu"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------ARrhXW5qTlvI1S0IF2tZ28xu
Content-Type: multipart/mixed; boundary="------------7GRD84i2msUtl5S9o5KqyGMs";
 protected-headers="v1"
From: Robert Ham <rah@settrans.net>
To: Mathias Nyman <mathias.nyman@linux.intel.com>,
 =?UTF-8?Q?Micha=C5=82_Pecio?= <michal.pecio@gmail.com>
Cc: linux-usb@vger.kernel.org
Message-ID: <1bdde0f1-11ad-41a4-b206-1bef7330dac3@settrans.net>
Subject: Re: Audio interface causing "xhci_hcd ... WARN: buffer overrun event"
 messages
References: <ba0ebd17-dade-4a97-b696-5ad19ebfca1d@settrans.net>
 <20250731101720.5d10a8f1@foxbook> <20250731102728.503cd612@foxbook>
 <3bbb710c-351d-46ec-a2e4-9ee4d766a750@settrans.net>
 <f277779a-34af-4db0-bef0-fa41aa538f97@linux.intel.com>
In-Reply-To: <f277779a-34af-4db0-bef0-fa41aa538f97@linux.intel.com>

--------------7GRD84i2msUtl5S9o5KqyGMs
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: base64

T24gMzEvMDcvMjAyNSAxNToyNiwgTWF0aGlhcyBOeW1hbiB3cm90ZToNCj4gT24gMzEuNy4y
MDI1IDEzLjExLCBSb2JlcnQgSGFtIHdyb3RlOg0KPj4gSSBtYW5hZ2VkIHRvIHNvcnQgb3V0
IHRoZSB0cmFjaW5nIGFuZCBkZWJ1ZyBvdXRwdXQuIFVwZGF0ZWQga2VybmVsIGxvZw0KPj4g
YW5kIHRyYWNlOg0KPj4NCj4+IGh0dHBzOi8vc2V0dHJhbnMubmV0L35yYWgvbWlzYy94aGNp
LWtlcm5lbC1sb2ctMi50eHQNCj4+DQo+PiBodHRwczovL3NldHRyYW5zLm5ldC9+cmFoL21p
c2MveGhjaS1rZXJuZWwtdHJhY2UtMi50eHQNCj4+DQo+Pg0KPj4gT24gMzEvMDcvMjAyNSAw
OToyNywgTWljaGHFgiBQZWNpbyB3cm90ZToNCj4+DQo+Pj4gQ2FuIHlvdSBwb3N0ICJsc3Vz
YiAtdiIgZm9yIHRoaXMgZGV2aWNlPw0KPj4NCj4gDQo+IExvb2tzIGxpa2UgVGhlIGxlbmd0
aHMgYW5kIG9mZnNldHMgaW4gdGhlIFVSQiwgcGFzc2VkIGJ5IGF1ZGlvIGRyaXZlciBkb2Vz
DQo+IG5vdCBtYXRjaCB0aGUgdHJhbnNmZXIgc2l6ZXMgdGhlIGRldmljZSByZXBvcnRzIGl0
IHdpbGwgc2VuZC4NCj4gDQo+IFRoZSBhdWRpbyBkZXZpY2UgcmVwb3J0cyBpdHMgaXNvYyBl
bmRwb2ludCB3aWxsIHNlbmQgMTAwMCBieXRlcw0KPiBldmVyeSAxMjUgbWljcm9zZWNvbmRz
Og0KPiAoZnJvbSB5b3VyIGxzdXNiKQ0KPiANCj4+IMKgwqDCoMKgwqDCoCBFbmRwb2ludCBE
ZXNjcmlwdG9yOg0KPj4gwqDCoMKgwqDCoMKgwqDCoCBiTGVuZ3RowqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgNw0KPj4gwqDCoMKgwqDCoMKgwqDCoCBiRGVzY3JpcHRvclR5
cGXCoMKgwqDCoMKgwqDCoMKgIDUNCj4+IMKgwqDCoMKgwqDCoMKgwqAgYkVuZHBvaW50QWRk
cmVzc8KgwqDCoMKgIDB4ODHCoCBFUCAxIElODQo+PiDCoMKgwqDCoMKgwqDCoMKgIGJtQXR0
cmlidXRlc8KgwqDCoMKgwqDCoMKgwqDCoMKgIDM3DQo+PiDCoMKgwqDCoMKgwqDCoMKgwqDC
oCBUcmFuc2ZlciBUeXBlwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBJc29jaHJvbm91cw0KPj4g
wqDCoMKgwqDCoMKgwqDCoMKgwqAgU3luY2ggVHlwZcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgQXN5bmNocm9ub3VzDQo+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoCBVc2FnZSBUeXBl
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBJbXBsaWNpdCBmZWVkYmFjayBEYXRhDQo+
PiDCoMKgwqDCoMKgwqDCoMKgIHdNYXhQYWNrZXRTaXplwqDCoMKgwqAgMHgwM2U4wqAgMXgg
MTAwMCBieXRlcw0KPj4gwqDCoMKgwqDCoMKgwqDCoCBiSW50ZXJ2YWzCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIDENCj4gDQo+IFRyYWNlIHNob3dzIHhoY2kgc2V0cyB1cCB0aGUg
ZW5kcG9pbnQgY29ycmVjdGx5LA0KPiBleHBlY3RpbmcgMTAwMCBieXRlcyBldmVyeSAxMjUg
bWljdG9zZWNvbmRzOg0KPiANCj4gcHVsc2VhdWRpby0xNDM1wqDCoMKgIFswMDBdIC4uLi4u
wqDCoMKgIDU1LjEyNjc0OTogeGhjaV9yaW5nX2FsbG9jOiBJU09DDQo+IDAwMDAwMDAwYzQy
MzIxYjY6IGVucSAweDAwMDAwMDAyNDgzYTIwMDAoMHgwMDAwMDAwMjQ4M2EyMDAwKSBkZXEN
Cj4gMHgwMDAwMDAwMjQ4M2EyMDAwKDB4MDAwMDAwMDI0ODNhMjAwMCkgc2VncyAyIHN0cmVh
bSAwIGJvdW5jZSAxMDAwIGN5Y2xlIDENCj4gcHVsc2VhdWRpby0xNDM1wqDCoMKgIFswMDBd
IC4uLi4uwqDCoMKgIDU1LjEyNjc1MDogeGhjaV9hZGRfZW5kcG9pbnQ6IFN0YXRlDQo+IGRp
c2FibGVkIG11bHQgMSBtYXggUC4gU3RyZWFtcyAwIGludGVydmFsIDEyNSB1cyBtYXggRVNJ
VCBwYXlsb2FkIDEwMDANCj4gQ0VyciAwIFR5cGUgSXNvYyBJTiBidXJzdCAwIG1heHAgMTAw
MCBkZXEgMDAwMDAwMDI0ODNhMjAwMSBhdmcgdHJiIGxlbiAxMDAwDQo+IA0KPiBidXQgdGhl
IFVSQiBxdWV1ZWQgZnJvbSBjbGFzcyBkcml2ZXIgdG8geGhjaSBkb2Vzbid0IG1hdGNoIHRo
aXMuDQo+IExvb2tzIGxpa2Ugb25lIFVSQiBjb250YWlucyA4IGlzb2MgdHJhbnNmZXJzLCAo
b25lIGZpbGxlZCBldmVyeSAxMjV1cykNCj4gYnV0IFVSQiBleHBlY3RzDQo+IG9ubHkgMjg4
MCBieXRlcyBpbiB0b3RhbCwgbGVhZGluZyB0byBvbmx5IDM2MCBieXRlcyBwZXIgaXNvYyB0
cmFuc2Zlci4NCj4gDQo+IEknZCB0YWtlIGEgY2xvc2VyIGxvb2sgYXQgdGhlIHZhbHVlcyBm
aWxsZWQgYnkgdGhlIGF1ZGlvIGRyaXZlciB0byB0aGUNCj4gc3RydWN0IHVzYl9pc29fcGFj
a2V0X2Rlc2NyaXB0b3IgaXNvX2ZyYW1lX2Rlc2NbXSBhcnJheSwgYW5kDQo+IG51bWJlcl9v
Zl9wYWNrZXRzDQo+IGluIHRoZSBVUkINCg0KVGhhbmtzIGZvciB5b3VyIHJlc3BvbnNlLCB0
aGF0J3MgcmVhbGx5IGhlbHBmdWwuDQoNCkNoZWVycywNCg0KQm9iDQoNCg==

--------------7GRD84i2msUtl5S9o5KqyGMs--

--------------ARrhXW5qTlvI1S0IF2tZ28xu
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

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
=i2bb
-----END PGP SIGNATURE-----

--------------ARrhXW5qTlvI1S0IF2tZ28xu--

