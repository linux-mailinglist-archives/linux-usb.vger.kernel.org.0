Return-Path: <linux-usb+bounces-11170-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 249F5904B82
	for <lists+linux-usb@lfdr.de>; Wed, 12 Jun 2024 08:23:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BE89C283449
	for <lists+linux-usb@lfdr.de>; Wed, 12 Jun 2024 06:23:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B505167DA1;
	Wed, 12 Jun 2024 06:23:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b="AINfyrMu"
X-Original-To: linux-usb@vger.kernel.org
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AF4D167294
	for <linux-usb@vger.kernel.org>; Wed, 12 Jun 2024 06:23:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.29.241.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718173418; cv=none; b=sHZrokv8pEq58mLT8EQi63SuKbfwjQtyeMBPNGeMT0m3OTnNO45ANBQ0bDRtucuySGCBmt2zneCzmpvvDRa2+HGQGqDZHiPiWll0bM1CCGu4K5VLSrT73T0jOfOW2D+y3Q7B5pAWEDDqZr5ODUh8KA1Y7SlWAriPYzo+o4Sgeso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718173418; c=relaxed/simple;
	bh=W4EFvFX49U6Y9KvXa0x4I9f4lLrFWmmzIAAiLK5828s=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=OUTLeC1ltYJVoytYHTaEIEAdXlW4RP3EPJsn42/qR1fry1w2Yto8eaRkHTMnw5kT9GuWB7Hf3CcPKFp5TsxrK2m0Fm1lgAzTxyxIaM97Q0OzXJVsGl2Dyu9U+R4PkeGeHyZSPeCyd7rHv3FMgQTt1ssqdToBCKdj0YeXN4VJDD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; spf=pass smtp.mailfrom=codeconstruct.com.au; dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b=AINfyrMu; arc=none smtp.client-ip=203.29.241.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=codeconstruct.com.au
Received: from pecola.lan (unknown [159.196.93.152])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 4CE9920178;
	Wed, 12 Jun 2024 14:23:32 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1718173413;
	bh=W4EFvFX49U6Y9KvXa0x4I9f4lLrFWmmzIAAiLK5828s=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=AINfyrMuIl5OTW62u3yqw2Swna7rpCCxUURx6T2WBPikImU7GUsGSFxFjBK7MwvUt
	 GBw6AG+MCjqLLMoMSTnHp9+ETcO1ks1ov5bZSQgAHcXQHs4siSSB3ZhUJWei8a+G4x
	 Vf/Jet8yGOj+fVipIgIU59olNC5aOZEIojl4/fGfBHbFPTxU05C5mOdhySDiNp5YV+
	 1WcCCmnScQNwSvBQP6rnsVTyjNSC6PCbez3QuicgvKM0SfBIyWj8pTtIXeTsBreVOh
	 L4K/1c7p5rzuXA87zzL7O+oaAp04eXmMI9W36BuD7AERKHdoDy3NfOZkIvFUVAxlpE
	 0mL8PGSD1dcxQ==
Message-ID: <9f2f14979faa5a6d0b17601cfec4988a374ce0c8.camel@codeconstruct.com.au>
Subject: Re: [PATCH] usb: gadget: aspeed_udc: fix device address
 configuration
From: Jeremy Kerr <jk@codeconstruct.com.au>
To: Ryan Chen <ryan_chen@aspeedtech.com>, Neal Liu
 <neal_liu@aspeedtech.com>,  Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Joel Stanley <joel@jms.id.au>, Andrew Jeffery
 <andrew@codeconstruct.com.au>
Cc: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, 
	"linux-aspeed@lists.ozlabs.org"
	 <linux-aspeed@lists.ozlabs.org>
Date: Wed, 12 Jun 2024 14:23:32 +0800
In-Reply-To: <OS8PR06MB7541C6D06FEC637644BEC5D2F2C02@OS8PR06MB7541.apcprd06.prod.outlook.com>
References: <20240612-aspeed-udc-v1-1-d277b553aecf@codeconstruct.com.au>
	 <OS8PR06MB7541C6D06FEC637644BEC5D2F2C02@OS8PR06MB7541.apcprd06.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
User-Agent: Evolution 3.46.4-2 
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

SGkgUnlhbiwKCj4gPiAvKiBNYWluIGNvbmZpZyByZWcgKi8KPiA+IC0jZGVmaW5lIFVEQ19DRkdf
U0VUX0FERFIoeCnCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAoKHgpICYgMHgzZikKPiA+IC0jZGVm
aW5lIFVEQ19DRkdfQUREUl9NQVNLwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCgweDNmKQo+
ID4gKyNkZWZpbmUgVURDX0NGR19TRVRfQUREUih4KcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCgo
eCkgJiBVRENfQ0ZHX0FERFJfTUFTSykKPiA+ICsjZGVmaW5lIFVEQ19DRkdfQUREUl9NQVNLwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoEdFTk1BU0soNiwgMCkKPiA+IAo+IAo+IEl0IHNob3Vs
ZCBiZSBHRU5NQVNLKDUsMCksIG5vdCBHRU5NQVNLKDYsIDApLCBhbSBJwqAgcmlnaHQ/CgpObywg
dGhhdCB3YXMgdGhlIGJ1Zzogd2UgbmVlZCBiaXRzIDA6NiAoPT0gMHg3ZikgaGVyZS4KCldpdGgg
dGhlIG1hc2sgb2YgMDo1ICg9PSAweDNmKSwgd2UgZG9uJ3QgZ2V0IHRoZSBmdWxsIFVTQiBhZGRy
ZXNzIHNldC4KCkNoZWVycywKCgpKZXJlbXkK


