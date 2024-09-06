Return-Path: <linux-usb+bounces-14806-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AA02696FBA8
	for <lists+linux-usb@lfdr.de>; Fri,  6 Sep 2024 20:59:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 68D94282F60
	for <lists+linux-usb@lfdr.de>; Fri,  6 Sep 2024 18:59:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B12931CDFB9;
	Fri,  6 Sep 2024 18:57:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HZXImEqu"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 974871CCB4A
	for <linux-usb@vger.kernel.org>; Fri,  6 Sep 2024 18:57:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725649050; cv=none; b=E3HYy6EaSP7d/VUR9zSxdqy+PjZC7lTtWqJRK3fPZQKAmYyHBs69NqgD/STsCp72bTYtyIGWb7pehRP4F5tGML3Krpd9mr7+2w/MAgqROZoI2ssRrQSB6y1kdlyaismO8/Q2xBDjuEQjQ2rid1WxGntKlIzC4ShN/tw9TmhI7y4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725649050; c=relaxed/simple;
	bh=KF6diy8py2Uyz/sP29PnprQ8sup5LVTHAsgV+nb0U44=;
	h=Message-ID:Subject:From:To:Date:Content-Type:MIME-Version; b=QhIBNzbdZ/HdMNItCrYU2OGO84rrB3gaBzge27P4BPZT6AQa0Y/MJ13aQZrZquAO6sN9Pp5jj8M5OSjNvJArCy2lH4SHMn00LPtZ31DiCPtR6aEvmvrBTiAoH5w19dF3wuuq8YcxDvhhHI0W0EoUeKQF6y9tNR7uT06eh27Yq+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HZXImEqu; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5353cd2fa28so2833229e87.3
        for <linux-usb@vger.kernel.org>; Fri, 06 Sep 2024 11:57:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725649047; x=1726253847; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:date:to:from
         :subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=KF6diy8py2Uyz/sP29PnprQ8sup5LVTHAsgV+nb0U44=;
        b=HZXImEqujXDiuY73806SpweLBMZWTGTzmCZOezrcGJmZI4QBYhQ/74+VKB0g6Cg2Em
         K7HrZJkJZxNjcW8ozLptIGGAk62LFuysKlKO5X47FEROdwf0uf4p4z/qwoPQBcepmIKN
         61Tfj6Sda4j1JiMa7PIuDXW9A59o+fj7sjuNRxWG6w8+Sw0p/tKtfhAOQjMP5+viEa6z
         HaLvRnJIRAe9vR7QJqAjIIqtZ3Y9YchoDYuMyKxO5Jy9E3ugD/2sqzWvs3BWNdvZ5McU
         unXrddj2AWiyhwTLALZKEm6lABTSAPWNIqnrYKCv8V0XYzvW/YtEdjV0v/U5brPwP0YE
         fcWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725649047; x=1726253847;
        h=mime-version:user-agent:content-transfer-encoding:date:to:from
         :subject:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KF6diy8py2Uyz/sP29PnprQ8sup5LVTHAsgV+nb0U44=;
        b=NuYtXFc0ZaQCovuCZuD6gGFLq7YRUYxDyNnGmdJR2ql5ZwlTJ7f6zsBB1r2xMCK1ab
         SsU1KgtBKKmJcmh5mFm3iknbSzfyiNLQjffCK9arlPgpu3yi5htL4O+P/yQKqNPQx+6U
         RXcSciBwkiVgRQfabelbkPL+3g98cJq6WKCUN7dsIEQZ+wjrzWfPYvQDLITFj9rjgChO
         DycSpxIcxvyADPQNNuN4pAXMgZobKYD3hdAhxTxUaA2WWjCLpgpDIXfGN9Nr13AngQRG
         duvjkWY8sINw08G5U78mEw+0wNIzGu1ZORAtQ9IZE7mrnMFyydZUo0KLyHO//ESU36eP
         fZ6Q==
X-Gm-Message-State: AOJu0YxBq7enHrRcioI03E12VN5aFE/9xcNiZyDieM19QmjEvTU1sp3e
	aKYCgkyQQ0aoCpbMqXhtx+z8EUZaLLERcvKDyLicma30W2D5YOWsYqvLRA==
X-Google-Smtp-Source: AGHT+IGwhvkb/X1Khsl/8hBkltBHw+Zb5+Of70T810syM4oh1UbiDiokrVi27xDYx2Rhi5Ra9ap16w==
X-Received: by 2002:a05:6512:220f:b0:52c:daa4:2f5c with SMTP id 2adb3069b0e04-536587fc818mr2078809e87.42.1725649046553;
        Fri, 06 Sep 2024 11:57:26 -0700 (PDT)
Received: from [192.168.216.101] (public-gprs223165.centertel.pl. [31.60.18.254])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-535660a4b7esm843402e87.307.2024.09.06.11.57.25
        for <linux-usb@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Sep 2024 11:57:26 -0700 (PDT)
Message-ID: <7d86b2ed20418cab986708e327adb4432f7078c2.camel@gmail.com>
Subject: [PATCH] usb: gadget: u_ether: Use __netif_rx() in rx_callback()
From: Hubert =?UTF-8?Q?Wi=C5=9Bniewski?= <hubert.wisniewski.25632@gmail.com>
To: linux-usb@vger.kernel.org
Date: Fri, 06 Sep 2024 20:57:25 +0200
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
User-Agent: Evolution 3.46.4-2 
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

bmV0aWZfcngoKSBub3cgZGlzYWJsZXMgYm90dG9tIGhhbHZlcywgd2hpY2ggY2F1c2VzIHRoZSBV
U0IgZ2FkZ2V0IHRvIGJlCnVuYWJsZSB0byByZWNlaXZlIGZyYW1lcyBpZiB0aGUgaW50ZXJmYWNl
IGlzIG5vdCBicm91Z2h0IHVwIHF1aWNrbHkgZW5vdWdoCmFmdGVyIGJlaW5nIGNyZWF0ZWQgYnkg
dGhlIGRyaXZlciAoYSBidWcgY29uZmlybWVkIG9uIEFNMzM1MiBTb0MpLgoKUmVwbGFjaW5nIG5l
dGlmX3J4KCkgd2l0aCBfX25ldGlmX3J4KCkgcmVzdG9yZXMgdGhlIG9sZCBiZWhhdmlvciBhbmQg
Zml4ZXMKdGhlIGJ1Zy4gVGhpcyBjYW4gYmUgZG9uZSBzaW5jZSByeF9jYWxsYmFjaygpIGlzIGNh
bGxlZCBmcm9tIHRoZSBpbnRlcnJ1cHQKY29udGV4dC4KClNpZ25lZC1vZmYtYnk6IEh1YmVydCBX
acWbbmlld3NraSA8d2lpaEB2aWVzc21hbm4uY29tPgotLS0KwqBkcml2ZXJzL3VzYi9nYWRnZXQv
ZnVuY3Rpb24vdV9ldGhlci5jIHwgMiArLQrCoDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigr
KSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvdXNiL2dhZGdldC9mdW5jdGlv
bi91X2V0aGVyLmMKYi9kcml2ZXJzL3VzYi9nYWRnZXQvZnVuY3Rpb24vdV9ldGhlci5jCmluZGV4
IDRiYjA1NTNkYTY1OC4uZmQ3ZTQ4M2I0YTQ4IDEwMDY0NAotLS0gYS9kcml2ZXJzL3VzYi9nYWRn
ZXQvZnVuY3Rpb24vdV9ldGhlci5jCisrKyBiL2RyaXZlcnMvdXNiL2dhZGdldC9mdW5jdGlvbi91
X2V0aGVyLmMKQEAgLTI2Niw3ICsyNjYsNyBAQCBzdGF0aWMgdm9pZCByeF9jb21wbGV0ZShzdHJ1
Y3QgdXNiX2VwICplcCwgc3RydWN0CnVzYl9yZXF1ZXN0ICpyZXEpCsKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoC8qIG5vIGJ1ZmZlciBjb3BpZXMgbmVlZGVk
LCB1bmxlc3MgaGFyZHdhcmUgY2FuJ3QKwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgICogdXNlIHNrYiBidWZmZXJzLgrCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgKi8KLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqBzdGF0dXMgPSBuZXRpZl9yeChza2IyKTsKK8KgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBzdGF0dXMgPSBfX25ldGlmX3J4KHNr
YjIpOwrCoG5leHRfZnJhbWU6CsKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoHNrYjIgPSBza2JfZGVxdWV1ZSgmZGV2LT5yeF9mcmFtZXMpOwrCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoH0KLS0gCjIuMzAuMgoKCg==


