Return-Path: <linux-usb+bounces-10237-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FB6B8C315D
	for <lists+linux-usb@lfdr.de>; Sat, 11 May 2024 14:50:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9098C1C20BC1
	for <lists+linux-usb@lfdr.de>; Sat, 11 May 2024 12:50:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C3D1E4F613;
	Sat, 11 May 2024 12:50:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=163.com header.i=@163.com header.b="AD8pqYY6"
X-Original-To: linux-usb@vger.kernel.org
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.4])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3DF078C15
	for <linux-usb@vger.kernel.org>; Sat, 11 May 2024 12:50:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715431807; cv=none; b=spjWN6W0dG5qZ6MnVMyYg0uJu9nZxgMqFfKBqLzLYxmjBYNXqRfM7fOJG0zT7Rlvouh5IR4YoSiPnL5fPAf+niB+Q1qivWZUOQg0YUOrW2f5BKxfNzvmwGpyDYdXFdg9ct5FdNHl3HsetETUkHo5IgCLdeyLXDhmcgN74X6Wsyo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715431807; c=relaxed/simple;
	bh=9fAAH4AM4CBSP4Gzv30cAgyKylcEcQpneYjjf6qpeKU=;
	h=Date:From:To:Cc:Subject:Content-Type:MIME-Version:Message-ID; b=mseTf+yjgF1XKR4e2xbVos6PWJ3czMjHDxdfAFLz3L/dsL99XZLTMrZ9QD5OxxSZ+uA0eRQdtgD+F86kTzQ1hQWahKXMo3F/VZn+JfjJ0fmkPSl60WXVgJ4Fe5OjnhbacQ/DjgXnI2Ka3a/TZ1y36Jkn4RZX+EEpdfOL94xXsjY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=fail (1024-bit key) header.d=163.com header.i=@163.com header.b=AD8pqYY6 reason="signature verification failed"; arc=none smtp.client-ip=117.135.210.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Date:From:Subject:Content-Type:MIME-Version:
	Message-ID; bh=0afhrKMHxssZl8z+OadCBSjyKOEl8gzV3wrUKbJ0ffI=; b=A
	D8pqYY6LUqtYilEmf7aRvdUfS/oz7akj7FbcwsotQ+OYZWrQNJuYy4GBG7w8Axxj
	dPYa5Eki24xhx+uX3PhW9GwBiZsfwkG1eCtQhBVqRI/d0TYZddZ73bsFisCUjo2X
	jWiUNSvq2QmADGgE8niACsHCgZAHzNY/nIEsMu6fUU=
Received: from congei42$163.com ( [159.226.94.118] ) by
 ajax-webmail-wmsvr-40-139 (Coremail) ; Sat, 11 May 2024 20:49:04 +0800
 (CST)
Date: Sat, 11 May 2024 20:49:04 +0800 (CST)
From: sicong <congei42@163.com>
To: peter.chen@kernel.org, pawell@cadence.com, rogerq@kernel.org, 
	gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org
Subject: Bug report: usb: cdns3: cdns3-gadget.c: use-after-free bug in
 cdns3_gadget_exit due to race condition
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.14 build 20230109(dcb5de15)
 Copyright (c) 2002-2024 www.mailtech.cn 163com
X-NTES-SC: AL_Qu2aB/iYvk8v4ieZYukfm0YUj+44Wsa4uvgk2YJeOpt4jBHo2yEbXHxAJUH3z96DCxCKmxuUSSZ39+txcKNgZYAKTrUeWE5+om6l5/g4/t8E0A==
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=GBK
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <7f5719b.8700.18f67b324d3.Coremail.congei42@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID:_____wD3nwhAaT9mif4oAA--.43326W
X-CM-SenderInfo: 5frqwvrlusqiywtou0bp/1tbizQvZ8mV4HHR2AwACsv
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==

Cgp1c2I6IGNkbnMzOiBjZG5zMy1nYWRnZXQuYzogdXNlLWFmdGVyLWZyZWUgYnVnIGluIGNkbnMz
X2dhZGdldF9leGl0IGR1ZSB0byAgICAgIApyYWNlIGNvbmRpdGlvbiAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIApUaGlzIGJ1ZyBleGlzdHMgaW4gZHJpdmVycy91c2IvY2RuczMvY2Ru
czMtZ2FkZ2V0LmMuIEZ1bmN0aW9uICAgICAgICAgICAgICAgICAgIApfX2NkbnMzX2dhZGdldF9p
bml0IHdpbGwgY2FsbCBjZG5zM19nYWRnZXRfc3RhcnQgdG8gZG8gdGhlIGZ1dGhlciBqb2JzICAg
ICAgICAgIApkdXJpbmcgdGhlIGluaXRpYWxpemF0aW9uIHByb2NjZXNzIG9mIGNkbnMzIGdhZGdl
dC4gSW4gY2RuczNfZ2FkZ2V0X3N0YXJ0LCAgICAgIAomcHJpdl9kZXYtPnBlbmRpbmdfc3RhdHVz
X3dxIGlzIGJvdW5kIHdpdGggY2RuczNfcGVuZGluZ19zZXR1cF9zdGF0dXNfaGFuZGxlci4gIApU
aGVuIHRoaXMgd29yayB3aWxsIGJlIGFkZGVkIHRvIHN5c3RlbV9mcmVlemFibGVfd3EgaW4gY2Ru
czNfZ2FkZ2V0X2VwMF9xdWV1ZS4gIApIZXJlIGlzIHRoZSBjb2RlLiAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIApxdWV1ZV93b3Jr
KHN5c3RlbV9mcmVlemFibGVfd3EsICZwcml2X2Rldi0+cGVuZGluZ19zdGF0dXNfd3EpOyAgICAg
ICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIApJZiB3ZSBjYWxsIGNkbnMzX2dh
ZGdldF9leGl0IHRvIHJlbW92ZSB0aGUgZGV2aWNlIGFuZCBtYWtlIGNsZWFudXAsICAgICAgICAg
ICAgIAp0aGVyZSBhcmUgc29tZSB1bmZpbmlzaGVkIHdvcmtzLiBUaGlzIGZ1bmN0aW9uIHdpbGwg
Y2FsbCBjZG5zM19mcmVlX2FsbF9lcHMgdG8gIApmcmVlIGFsbCB0aGUgZW5kcG9pbnRzLiBIb3dl
dmVyLCBpZiBjZG5zM19wZW5kaW5nX3NldHVwX3N0YXR1c19oYW5kbGVyIGlzICAgICAgIApzY2hl
ZHVsZWQgdG8gcnVuIGFmdGVyIHRoZSBmcmVlIGpvYiwgaXQgd2lsbCBjYXVzZSB1c2UtYWZ0ZXIt
ZnJlZSBlcnJvciBhcyAgICAgIApjZG5zM19wZW5kaW5nX3NldHVwX3N0YXR1c19oYW5kbGVyIHdp
bGwgdXNlIHRoZSBlbmRwb2ludCBpbiB0aGUgZm9sbG93aW5nIGNvZGUuIApyZXF1ZXN0LT5jb21w
bGV0ZSgmcHJpdl9kZXYtPmVwc1swXS0+ZW5kcG9pbnQsIHJlcXVlc3QpOyAgICAgICAgICAgICAg
ICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIApUaGUgcG9zc2libGUgZXhlY3V0aW9u
IGZsb3cgdGhhdCBtYXkgbGVhZCB0byB0aGlzIGlzc3VlIGlzIGFzIGZvbGxvd3M6ICAgICAgICAg
IApDUFUwICAgICAgICAgICAgICAgICAgICBDUFUxICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgfCBfX2NkbnMz
X2dhZGdldF9pbml0ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAg
ICAgICAgICAgICAgICAgfCBjZG5zM19nYWRnZXRfc3RhcnQgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIApjZG5zM19nYWRnZXRfZXhpdCAgICAgfCAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKY2RuczNfZnJlZV9h
bGxfZXBzICAgIHwgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgCmRldm1fa2ZyZWUgKGZyZWUpICAgICB8ICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAg
ICAgICAgICAgfCBjZG5zM19wZW5kaW5nX3NldHVwX3N0YXR1c19oYW5kbGVyICAgICAgICAgICAg
ICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgIHwgJnByaXZfZGV2LT5lcHNbMF0tPmVu
ZHBvaW50ICh1c2UpICAgIAoKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKVGhpcyBidWcgbWF5IGJl
IGZpeGVkIGJ5IGFkZGluZyB0aGUgZm9sbG93aW5nIGNvZGUgaW4gY2RuczNfZ2FkZ2V0X2V4aXQu
ICAgICAgICAKY2FuY2VsX3dvcmtfc3luYygmcHJpdl9kZXYtPnBlbmRpbmdfc3RhdHVzX3dxKTsg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKY2FuY2VsX3dvcmtfc3luYygmcHJpdl9k
ZXYtPmFsaWduZWRfYnVmX3dxKTsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAK
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAKQmVzdCByZWdhcmRzLCAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKU2ljb25nIEh1
YW5nICAgICA=

