Return-Path: <linux-usb+bounces-36079-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YAC6JsQS12kSKwgAu9opvQ
	(envelope-from <linux-usb+bounces-36079-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 09 Apr 2026 04:45:24 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 132493C5A5F
	for <lists+linux-usb@lfdr.de>; Thu, 09 Apr 2026 04:45:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 81AAE301829A
	for <lists+linux-usb@lfdr.de>; Thu,  9 Apr 2026 02:42:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E3C0C36C580;
	Thu,  9 Apr 2026 02:42:18 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from zg8tmja2lje4os4yms4ymjma.icoremail.net (zg8tmja2lje4os4yms4ymjma.icoremail.net [206.189.21.223])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED5B0258EE1;
	Thu,  9 Apr 2026 02:42:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=206.189.21.223
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775702538; cv=none; b=ZWsThRU98XsozaC533gVDKN+g//4oBy208YhS9ZXIvz7P0J2QGaKJQ91paRdVF5//3S98iHh9kwAwvndclrEKMFh/h6Yx+tIWXOyZjrlEDu3KBVs6UEynOif1qK8KslMePOZOIO70tJlirpWwbqwgRYt9HVJqf/NX8yV1c/QUm8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775702538; c=relaxed/simple;
	bh=s3h3DLkuhP2BvYUmzEJuyvzbvSzDIRD1yIR7IJj26Bs=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 MIME-Version:Message-ID; b=PXGmydJ1BqqBcKH7nyegHLUbFFq/JjtCk2o5xRTQW/S1fJC6i0ivgV7tVEwQb1fBN0MXjgGjmUTVvgiURlUWSCcv6GDvbaUuVGFcClPuLu6/YDL4hENgqq4I46WWMYEneIBODAyrhnveb+QCpOECPdMCj6a5F4KRsKQCUl6p/SA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=eswincomputing.com; spf=pass smtp.mailfrom=eswincomputing.com; arc=none smtp.client-ip=206.189.21.223
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=eswincomputing.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=eswincomputing.com
Received: from caohang$eswincomputing.com ( [10.127.112.153] ) by
 ajax-webmail-app1 (Coremail) ; Thu, 9 Apr 2026 10:41:52 +0800 (GMT+08:00)
Date: Thu, 9 Apr 2026 10:41:52 +0800 (GMT+08:00)
X-CM-HeaderCharset: UTF-8
From: "Hang Cao" <caohang@eswincomputing.com>
To: "Krzysztof Kozlowski" <krzk@kernel.org>,
	"Conor Dooley" <conor@kernel.org>
Cc: gregkh@linuxfoundation.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, Thinh.Nguyen@synopsys.com,
	p.zabel@pengutronix.de, linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
	ningyu@eswincomputing.com, linmin@eswincomputing.com,
	pinkesh.vaghela@einfochips.com
Subject: Re: Re: [PATCH v1] dt-bindings: usb: Fix EIC7700 USB reset's issue
X-Priority: 3
X-Mailer: Coremail Webmail Server Version 2024.2-cmXT6 build
 20241203(6b039d88) Copyright (c) 2002-2026 www.mailtech.cn
 mispb-72143050-eaf5-4703-89e0-86624513b4ce-eswincomputing.com
In-Reply-To: <20260408-designed-broadband-332044a2d1fb@spud>
References: <20260407061703.1564-1-caohang@eswincomputing.com>
 <20260408-ginger-grouse-of-virtuosity-b3ee92@quoll>
 <20260408-designed-broadband-332044a2d1fb@spud>
Content-Type: multipart/mixed; 
	boundary="----=_Part_112819_548728446.1775702512154"
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <4f0e8a5a.68b8.19d701e121f.Coremail.caohang@eswincomputing.com>
X-Coremail-Locale: en_US
X-CM-TRANSID:TAJkCgBn_HDxEddpG0QQAA--.4208W
X-CM-SenderInfo: xfdrxt1qj6v25zlqu0xpsx3x1qjou0bp/1tbiAQEMEGnWgxgMpQAA
	sR
X-Coremail-Antispam: 1Ur529EdanIXcx71UUUUU7IcSsGvfJ3iIAIbVAYjsxI4VWxJw
	CS07vEb4IE77IF4wCS07vE1I0E4x80FVAKz4kxMIAIbVAFxVCaYxvI4VCIwcAKzIAtYxBI
	daVFxhVjvjDU=
X-Spamd-Result: default: False [-0.86 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[multipart/mixed,text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-36079-lists,linux-usb=lfdr.de];
	DMARC_NA(0.00)[eswincomputing.com];
	RCPT_COUNT_TWELVE(0.00)[14];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	HAS_ATTACHMENT(0.00)[];
	NEURAL_HAM(-0.00)[-0.738];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[caohang@eswincomputing.com,linux-usb@vger.kernel.org];
	HAS_X_PRIO_THREE(0.00)[3];
	R_DKIM_NA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[einfochips.com:email,linuxfoundation.org:email,synopsys.com:email,eswincomputing.com:email,eswincomputing.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 132493C5A5F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

------=_Part_112819_548728446.1775702512154
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: base64

SGksIEtyenlzenRvZiAmIENvbm9yCgpObywgVS1Cb290IHdpbGwgTk9UIGJlIGFmZmVjdGVkLiBT
b3JyeSBmb3IgdGhlIG1pc3VuZGVyc3RhbmRpbmcgZHVlIHRvIHRoZQppbmFjY3VyYXRlIGNvbW1p
dCBtZXNzYWdlLgrCoApJIHdpbGwgc2VuZCB0aGUgbmV4dCB2ZXJzaW9uIHdpdGggdGhlIGltcHJv
dmVkIGNvbW1pdCBtZXNzYWdlIGJlbG93OgoKVGhlIEVJQzc3MDAgVVNCIHJlcXVpcmVzIGEgVVNC
IFBIWSByZXNldCBvcGVyYXRpb247IG90aGVyd2lzZSwgdGhlIFVTQiB3aWxsCm5vdCB3b3JrLiBU
aGUgcmVhc29uIHdoeSB0aGUgVVNCIGRyaXZlciB0aGF0IHdhcyBhcHBsaWVkIGNhbiB3b3JrIHBy
b3Blcmx5IGlzCnRoYXQgdGhlIFVTQiBQSFkgaGFzIGFscmVhZHkgYmVlbiByZXNldCBpbiBFU1dJ
TidzIFUtQm9vdC4KCkhvd2V2ZXIsIHRoZSBwcm9wZXIgZnVuY3Rpb25pbmcgb2YgdGhlIFVTQiBk
cml2ZXIgc2hvdWxkIG5vdCBiZSBkZXBlbmRlbnQgb24KdGhlIGJvb3Rsb2FkZXIuIFRoZXJlZm9y
ZSwgaXQgaXMgbmVjZXNzYXJ5IHRvIGluY29ycG9yYXRlIHRoZSBVU0IgUEhZIHJlc2V0CnNpZ25h
bCBpbnRvIHRoZSBEVCBiaW5kaW5ncy4KClRoaXMgcGF0Y2ggZG9lcyBub3QgaW50cm9kdWNlIGFu
eSBiYWNrd2FyZCBpbmNvbXBhdGliaWxpdHkgc2luY2UgdGhlIGR0cyBpcwpub3QgdXBzdHJlYW0g
eWV0LsKgIEFzIGFycmF5IG9mIHJlc2V0IG9wZXJhdGlvbnMgYXJlIHVzZWQgaW4gdGhlIGRyaXZl
ciwKbm8gbW9kaWZpY2F0aW9ucyB0byB0aGUgVVNCIGNvbnRyb2xsZXIgZHJpdmVyIGFyZSBuZWVk
ZWQuCgoKQmVzdCByZWdhcmRzLApIYW5nCgo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZXMtLS0tLQo+
IEZyb206ICJDb25vciBEb29sZXkiIDxjb25vckBrZXJuZWwub3JnPgo+IFNlbmQgdGltZTpUaHVy
c2RheSwgMDkvMDQvMjAyNiAwMToyNDozNAo+IFRvOiAiS3J6eXN6dG9mIEtvemxvd3NraSIgPGty
emtAa2VybmVsLm9yZz4KPiBDYzogY2FvaGFuZ0Blc3dpbmNvbXB1dGluZy5jb20sIGdyZWdraEBs
aW51eGZvdW5kYXRpb24ub3JnLCByb2JoQGtlcm5lbC5vcmcsIGtyemsrZHRAa2VybmVsLm9yZywg
Y29ub3IrZHRAa2VybmVsLm9yZywgVGhpbmguTmd1eWVuQHN5bm9wc3lzLmNvbSwgcC56YWJlbEBw
ZW5ndXRyb25peC5kZSwgbGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZywgbGludXgtdXNiQHZn
ZXIua2VybmVsLm9yZywgZGV2aWNldHJlZUB2Z2VyLmtlcm5lbC5vcmcsIG5pbmd5dUBlc3dpbmNv
bXB1dGluZy5jb20sIGxpbm1pbkBlc3dpbmNvbXB1dGluZy5jb20sIHBpbmtlc2gudmFnaGVsYUBl
aW5mb2NoaXBzLmNvbQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjFdIGR0LWJpbmRpbmdzOiB1c2I6
IEZpeCBFSUM3NzAwIFVTQiByZXNldCdzIGlzc3VlCj4gCj4gT24gV2VkLCBBcHIgMDgsIDIwMjYg
YXQgMDk6NDg6NDNBTSArMDIwMCwgS3J6eXN6dG9mIEtvemxvd3NraSB3cm90ZToKPiA+IE9uIFR1
ZSwgQXByIDA3LCAyMDI2IGF0IDAyOjE3OjAyUE0gKzA4MDAsIGNhb2hhbmdAZXN3aW5jb21wdXRp
bmcuY29tIHdyb3RlOgo+ID4gPiBGcm9tOiBIYW5nIENhbyA8Y2FvaGFuZ0Blc3dpbmNvbXB1dGlu
Zy5jb20+Cj4gPiA+IAo+ID4gPiBUaGUgRUlDNzcwMCBVU0IgY29udHJvbGxlciByZXF1aXJlcyBh
IFVTQiBQSFkgUkVTRVQgb3BlcmF0aW9uLlBIWSBSRVNFVAo+ID4gCj4gPiBNaXNzaW5nIHNwYWNl
IGFmdGVyIGZ1bGwgc3RvcC4KPiA+IAo+ID4gPiBvcGVyYXRpb24gd2FzIG1pc3NlZCBpbiB0aGUg
dmVyaWZpY2F0aW9uIHZlcnNpb24sIGFzIGl0IHdhcyBwZXJmb3JtZWQgaW4KPiA+ID4gRVNXSU4n
cyBVLUJvb3QuCj4gPiA+IAo+ID4gPiBJZiBhIG5vbi1FU1dJTiBwcm92aWRlZCBsb2FkZXIgaXMg
dXNlZCwgdGhpcyBpc3N1ZSB3aWxsIG9jY3VyLCByZXN1bHRpbmcKPiA+ID4gaW4gVVNCIG5vdCB3
b3JrLlRoaXMgcGF0Y2ggZG9lcyBub3QgaW50cm9kdWNlIGFueSBiYWNrd2FyZCBpbmNvbXBhdGli
aWxpdHkKPiA+ID4gc2luY2UgdGhlIGR0cyBpcyBub3QgdXBzdHJlYW0geWV0Lgo+ID4gCj4gPiBT
byBVLUJvb3Qgd2lsbCBiZSBhZmZlY3RlZCwgbm8/Cj4gCj4gSXMgaXQgZXZlbiByZWFsbHkgYWZm
ZWN0ZWQ/IEkgZG9uJ3QgdGhpbmsgdGhlcmUncyBhbnkgYm9vdGxvYWRlciBmb3IgdGhpcwo+IG90
aGVyIHRoYW4gd2hhdCBFU1dJTiBpcyBzaGlwcGluZyBkb3duc3RyZWFtLCBvdXRzaWRlIG9mIHBl
b3BsZSdzIGRldmVsb3BtZW50Cj4gdHJlZXMuIEFuZCBhbnkgc29mdHdhcmUgdGhhdCBleHBlY3Rl
ZCB0d28gcmVzZXRzIHdpbGwgd29yayBqdXN0IGFzIGJhZGx5IGFzCj4gaXQgYWx3YXlzIGRpZCB3
aGVuIGEgdGhpcmQgb25lIGlzIGFkZGVkLgo+IAo+ID4gQW5kIGV2ZW4gaWYgRFRTIGlzIG5vdCB1
cHN0cmVhbWVkLCB3aGF0IGFib3V0IGFsbCBvdXQgb2YgdHJlZSBEVFM/Cj4gPiBUaGlzIGlzIGFu
IGFscmVhZHkgcmVsZWFzZWQgQUJJLCBzbyBhdCBsZWFzdCBleHBsYWluIHRoYXQgZHJpdmVyIGRv
ZXMKPiA+IG5vdCBjYXJlIGFib3V0IHJlc2V0cyBoZXJlIGFuZCBncmFicyB0aGVtIGFsbC4KPiA+
IAo+ID4gPiAKPiA+ID4gRml4ZXM6IGM2NDBhNDIzOWRiNSAoImR0LWJpbmRpbmdzOiB1c2I6IEFk
ZCBFU1dJTiBFSUM3NzAwIFVTQiBjb250cm9sbGVyIikKPiA+IAo+ID4gCj4gPiBCZXN0IHJlZ2Fy
ZHMsCj4gPiBLcnp5c3p0b2YKPiA+IAo=
------=_Part_112819_548728446.1775702512154
Content-Type: application/pgp-signature; name=signature.asc
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="signature.asc"

LS0tLS1CRUdJTiBQR1AgU0lHTkFUVVJFLS0tLS0NCg0KaUhVRUFCWUtBQjBXSVFSaDI0NkVHcS84
UkxoRGpPMTR0REdIb0lKaTBnVUNhZGFQVWdBS0NSQjR0REdIb0lKaQ0KMG1JakFRQ1IrcWNZSitH
bDQreSs5WEVmaVFDQ2orUURaaDQ4ZlVHZVVpZWFvU3NJY0FEL1VKY3BxQkpPQVNmcw0KWTZXRUNu
UXBiYnhobUpzaEZFazZuOXhabnhtQ25RZz0NCj04UGxpDQotLS0tLUVORCBQR1AgU0lHTkFUVVJF
LS0tLS0NCg==
------=_Part_112819_548728446.1775702512154--


