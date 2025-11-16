Return-Path: <linux-usb+bounces-30534-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 977B9C6106E
	for <lists+linux-usb@lfdr.de>; Sun, 16 Nov 2025 06:23:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 5E97F34AC03
	for <lists+linux-usb@lfdr.de>; Sun, 16 Nov 2025 05:22:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 024D222A1E1;
	Sun, 16 Nov 2025 05:22:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=tencent.com header.i=@tencent.com header.b="E3bvfTCf"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtpbgbr2.qq.com (smtpbgbr2.qq.com [54.207.22.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A12C3B1B3
	for <linux-usb@vger.kernel.org>; Sun, 16 Nov 2025 05:22:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.207.22.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763270538; cv=none; b=aNLa12VJPn6vNg3j6CRi9Lg5o/KzFfO7a0TN3EvHI9Y+s0Sb7+DQwT09pPvGOo0WlXR3Y2UJzPSqNeDQzUbTsSC5CicEcACj7L9q8IjgAy/xBKKQyEBgJXEfeALVDOnC7KnpQHoYYgG5lVjFQSPjqbGBjOZ/rwSwNzS8hdGCQq4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763270538; c=relaxed/simple;
	bh=OnmepDQ/EpNiPWJ3D41+M1RhVQH52WVuGRwXjeNXJTA=;
	h=Date:From:To:Cc:Subject:Mime-Version:Message-ID:Content-Type; b=cqkSttFGJhofgDIj9adxDpOyCZ/5D3jPVJpMJBKm+VUrahnYaK+gNyqMN5c1DfOgYP5sAiopHXtIx1gPER8lZFGqVT0L3X72rVc0ft5bs3bx9cR/auBrdC8eFuF5r6A4K0LMPQEFjR7oDsGIllhCDzo8Mum4k/nMjh6PY2UEqx8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tencent.com; spf=pass smtp.mailfrom=tencent.com; dkim=pass (1024-bit key) header.d=tencent.com header.i=@tencent.com header.b=E3bvfTCf; arc=none smtp.client-ip=54.207.22.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tencent.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tencent.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tencent.com;
	s=s201512; t=1763270523;
	bh=OnmepDQ/EpNiPWJ3D41+M1RhVQH52WVuGRwXjeNXJTA=;
	h=Date:From:To:Subject:Mime-Version:Message-ID;
	b=E3bvfTCf0mzh380l0hDXY6T2PRr8bz2Xp3xow4SRIiJuHAeNBZfxyjVxiD4cZJC4Q
	 o4xin6fWFXWpMN4dYZAEEElMQdl3IbnPnFwbVBKKu1ze8T7I8s5aCwMwOl62oFVn4q
	 CX2IrlouS/HepH3xBuAQmydcL/0Z1ij5oWilyP2c=
X-QQ-mid: esmtpgz15t1763270521t6108f294
X-QQ-Originating-IP: HnaTnzl3Ip9KhKuo+uifoqcjiMzdy5BntstOsV0jMkE=
Received: from FLYNNNCHEN-PC1 ( [11.176.19.11])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Sun, 16 Nov 2025 13:22:00 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 775369688226635650
Date: Sun, 16 Nov 2025 13:22:01 +0800
From: "=?gb18030?B?Zmx5bm5uY2hlbiizwszss/4p?=" <flynnnchen@tencent.com>
To: linux-usb <linux-usb@vger.kernel.org>
Cc: gregkh <gregkh@linuxfoundation.org>
Subject: [PATCH] usb: storage: sddr55: Reject out-of-bound new_pba
X-Priority: 3
X-GUID: A0D10F1D-E958-44AC-9EEC-CCD5BDA5D41F
X-Has-Attach: no
X-Mailer: Foxmail 7.2.25.492[en]
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Message-ID: <B2DC73A3EE1E3A1D+202511161322001664687@tencent.com>
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:tencent.com:qybglogicsvrgz:qybglogicsvrgz5b-1
X-QQ-XMAILINFO: OX/+6nY/vs4TUIhJ0sHhn1IlF0AJtixG1Cn0wXUWbyfUUnSKQvqwBmVK
	ef2MkIRgSyJwUx7egi8y0PjoHinHAp662fx6z7u5Pb98d1TdYYMhQ5jKBIf1/aB5uKqgpxS
	bhc7mI1e/tx/tWtWphK9VW60Fu+qi0SwKkey9gS2oW1yyQdjKpIpYfL3bv4i4LS4umIFRRl
	uaveufyGHFiUrNGVTbCQ5nqAi8KF2X89ubsZnQwzKp2kbjtncLYy2Vy5mSG6zOiz/oT6vfo
	I6CVG+tGzCA6Be58Jnsdahr+8fB2hrTCBkTCYAfqZdJpB0bycFHGdGNcbEt5I1L07wWAlTZ
	gX9MLgfL9VLo5TYehFoYZOPm7b4H3gC9P9TaNJ32NYsdj1hA8f9v6tDSlCW+EUOHBWZ+KVM
	BPGJ9k62/LZdUvlLmjW/7DSLHTRjtvaBAEvTV9g/BjIsSxHghW5AsvPZNVnIMJ6QGloqL7r
	gvFtvBHFknAS5o/fSv2BmWXJKEMQz+fgBw3RXtsrJH9rutiZ7SOZZ3R5Z5eFn8ohL9FkBgZ
	anrH3mG4nlHKipeY2ZrGXGHc01y5Pf781C9cXPDzV9E1cmIcakFMZJVz1NNH2W62T8/ebpe
	TJkfX2cjUhMYiOuIPayWXrRBE0QD0lCDGEgm0f/kHgqCYErPU13cCUuvrSA7JZsHIRg4m52
	i0MtMqGY0jzOcE64C84YprTnSQL5CLHdudK96ZElLPkdwr75RX7YNpwMI4h1yHV7CuYpXhQ
	n/KYkJLumRizeUSAhebxlgunvc0Nx8+pTKqLorxoVPJxzaO1RG6f0O1XqnzqGLhINR3Jqxz
	xlmLLD74mtBnZDEPotf7o/Y5Xt75xGb/VyRr/XZRO8ii5fNiOmTfcfBCx2KUWiEphPhdGku
	+HlrkRsCyBqNcsXE+LRpDUztkdI/+ztppVLPj1TpBqqQeNHnQ8m0X1aptMGvbV1Lu4pjUaU
	IHOSRFNpYXuQbew==
X-QQ-XMRINFO: NyFYKkN4Ny6FSmKK/uo/jdU=
X-QQ-RECHKSPAM: 0

RnJvbSBjNjNkYzgxNGI1ZTUxNzEzMjIyNDYyZTZiZjI3ZDc5NTZhOTMzODM0IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBUaWFuY2h1IENoZW4gPGZseW5ubmNoZW5AdGVuY2VudC5jb20+
CkRhdGU6IFN1biwgMTYgTm92IDIwMjUgMTI6NDY6MTggKzA4MDAKU3ViamVjdDogW1BBVENIXSB1
c2I6IHN0b3JhZ2U6IHNkZHI1NTogUmVqZWN0IG91dC1vZi1ib3VuZCBuZXdfcGJhCgpEaXNjb3Zl
cmVkIGJ5IEF0dWluIC0gQXV0b21hdGVkIFZ1bG5lcmFiaWxpdHkgRGlzY292ZXJ5IEVuZ2luZS4K
Cm5ld19wYmEgY29tZXMgZnJvbSB0aGUgc3RhdHVzIHBhY2tldCByZXR1cm5lZCBhZnRlciBlYWNo
IHdyaXRlLgpBIGJvZ3VzIGRldmljZSBjb3VsZCByZXBvcnQgdmFsdWVzIGJleW9uZCB0aGUgYmxv
Y2sgY291bnQgZGVyaXZlZApmcm9tIGluZm8tPmNhcGFjaXR5LCBsZXR0aW5nIHRoZSBkcml2ZXIg
d2FsayBvZmYgdGhlIGVuZCBvZgpwYmFfdG9fbGJhW10gYW5kIGNvcnJ1cHQgaGVhcCBtZW1vcnku
CgpSZWplY3QgUEJBcyB0aGF0IGV4Y2VlZCB0aGUgY29tcHV0ZWQgYmxvY2sgY291bnQgYW5kIGZh
aWwgdGhlCnRyYW5zZmVyIHNvIHdlIGF2b2lkIHRvdWNoaW5nIG91dC1vZi1yYW5nZSBtYXBwaW5n
IGVudHJpZXMuCgpTaWduZWQtb2ZmLWJ5OiBUaWFuY2h1IENoZW4gPGZseW5ubmNoZW5AdGVuY2Vu
dC5jb20+Ci0tLQogZHJpdmVycy91c2Ivc3RvcmFnZS9zZGRyNTUuYyB8IDYgKysrKysrCiAxIGZp
bGUgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy91c2Ivc3Rv
cmFnZS9zZGRyNTUuYyBiL2RyaXZlcnMvdXNiL3N0b3JhZ2Uvc2RkcjU1LmMKaW5kZXggYjMyM2Yw
YTM2Li45ZDgxMzcyN2UgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvdXNiL3N0b3JhZ2Uvc2RkcjU1LmMK
KysrIGIvZHJpdmVycy91c2Ivc3RvcmFnZS9zZGRyNTUuYwpAQCAtNDY5LDYgKzQ2OSwxMiBAQCBz
dGF0aWMgaW50IHNkZHI1NV93cml0ZV9kYXRhKHN0cnVjdCB1c19kYXRhICp1cywKIAkJbmV3X3Bi
YSA9IChzdGF0dXNbM10gKyAoc3RhdHVzWzRdIDw8IDgpICsgKHN0YXR1c1s1XSA8PCAxNikpCiAJ
CQkJCQkgID4+IGluZm8tPmJsb2Nrc2hpZnQ7CiAKKwkJLyogY2hlY2sgaWYgZGV2aWNlLXJlcG9y
dGVkIG5ld19wYmEgaXMgb3V0IG9mIHJhbmdlICovCisJCWlmIChuZXdfcGJhID49IChpbmZvLT5j
YXBhY2l0eSA+PiAoaW5mby0+YmxvY2tzaGlmdCArIGluZm8tPnBhZ2VzaGlmdCkpKSB7CisJCQly
ZXN1bHQgPSBVU0JfU1RPUl9UUkFOU1BPUlRfRkFJTEVEOworCQkJZ290byBsZWF2ZTsKKwkJfQor
CiAJCS8qIGNoZWNrIHN0YXR1cyBmb3IgZXJyb3IgKi8KIAkJaWYgKHN0YXR1c1swXSA9PSAweGZm
ICYmIHN0YXR1c1sxXSA9PSAweDQpIHsKIAkJCWluZm8tPnBiYV90b19sYmFbbmV3X3BiYV0gPSBC
QURfQkxPQ0s7Ci0tIAoyLjM5LjUKCg==


