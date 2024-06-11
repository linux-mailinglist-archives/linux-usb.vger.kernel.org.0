Return-Path: <linux-usb+bounces-11126-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BB8659035C5
	for <lists+linux-usb@lfdr.de>; Tue, 11 Jun 2024 10:21:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7207E1F27F3B
	for <lists+linux-usb@lfdr.de>; Tue, 11 Jun 2024 08:21:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1047E17332C;
	Tue, 11 Jun 2024 08:21:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="Q5l9QGiO"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FD9D2C190
	for <linux-usb@vger.kernel.org>; Tue, 11 Jun 2024 08:21:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718094069; cv=none; b=tq/5+czjro/iKdZkUy/uN14qf0GHYz6xMJehnvFNEveDQqHrq7e9TDlerYZBSe96K00Z8fKui5BsTvBw3CUeXMGpodu054JCQhZlLl/WE/ODFUj+mnFdvTQLj4zyc7X2kAT2puK596hnsSpRziPTCf0Wwu0oShiiF7dInW6LXq4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718094069; c=relaxed/simple;
	bh=Ek/nTsLdx2m02d1JX+zcAi5B+ioBAD9crEjPhwAsZBs=;
	h=Content-Type:Message-ID:Date:MIME-Version:Subject:To:References:
	 From:In-Reply-To; b=GBVWvVPrfJaoFWr+NTUOuDhWcYKSgNmGxkOlfSoEc1qcMPCt05vDBjZ3F+KPDpwFEBuVVyHq8H3v58SvcSHkW1YtSDPiTtl95Z2eZJxkEkHcavSdG6CHY77MoFghXSVuGtp1CNv9enOdUpaMPhyp86kORs6DhNl1ZOPUHHMBoZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=Q5l9QGiO; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-a6f1c4800easo229986466b.3
        for <linux-usb@vger.kernel.org>; Tue, 11 Jun 2024 01:21:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1718094066; x=1718698866; darn=vger.kernel.org;
        h=in-reply-to:from:content-language:references:to:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hbPrZ/xXsv/o2TEl4GYgsspzSsCiveO+s+6T4Bx+O6Q=;
        b=Q5l9QGiOiV7cKKdrQIatofc95sDw9DFJjUR7RaY0CLQfYCLwUDRUvEM4bjVF4SPOOb
         6q9htpOo1HqS10mnmL78uPmi8JU1mbzg8lTt8IG8khsWjc9K3wcc+e0fwQm7thFRFBYC
         KlqlGyAQx53SALed39TtWWTsOPFiH8InTMtr/eVpxxMKi/A/sRZfKbLbba8j9D4W5AhD
         niTtRi57Tug08+/TP5cjNNIIKusNnsUVJqUGSwZ/TJVVGbnNJ7RMA25hfUbd1+1a84wq
         xiJ/pdIoz0QxQ99oB+s/h1mdlHfj1luoodTMV6dPzHIQXpzUFsq6d9KS/O8Y/OXstxh8
         5V1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718094066; x=1718698866;
        h=in-reply-to:from:content-language:references:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=hbPrZ/xXsv/o2TEl4GYgsspzSsCiveO+s+6T4Bx+O6Q=;
        b=EQyAyHhheRtaka3w5NWy1KIxWM2v6jAdd0w8/833niM9pxE2wYNqZtVcz2xtvSOWj8
         ma7/++vz7838WngeGrEGQ8urglW14TorGPzIBqDwZNQaknl5oqoQ+l2vd/KRAbxwqvH4
         pjWib95X71A5wzRZSOtjDp++ufLI5FzRaBCSn4W+UWJjBybUwvM8iG0KlEeemtJzB1Bc
         q07SvhDCXznQpqQUvVk5Xar0bxci8U3xzGFqkX0NEInER39NbXPiQ9DUOVvhljuuzX2O
         O/busasplpM5NBLnQBy4cDWG7AddsLzW05M3h00eQaO6aTWHNmnyIx/SNQFg3ndMBY0P
         lRgA==
X-Forwarded-Encrypted: i=1; AJvYcCXIRjtk2lLrrbsLrlggIecOIzDBINfyrJvi0vQUA6Adg4rtHRZhLLjcEd4hN2Cb2fqqtjiBlO3UtVzXTVbRnbGdhhnuTebmpfFf
X-Gm-Message-State: AOJu0Yzt5GGjiNMFavl9UNbh5ulmIWm1rgDQwA0sbAmfTRcS5wI8Zf6E
	MVxVVnY2jd1vAx6rLTizfa9aKJU3Qd+w24oN9scWWVkK2D8R3M291voG6i5n3MY=
X-Google-Smtp-Source: AGHT+IGffunAA75ArAPiqFYnAT4saIvWOxD8atW9/+McNI4fhVW/FM49BarOFMu8VCiv/L3Zh7YzFQ==
X-Received: by 2002:a17:906:8418:b0:a6f:1fd6:61b6 with SMTP id a640c23a62f3a-a6f1fd661femr260059266b.35.1718094065559;
        Tue, 11 Jun 2024 01:21:05 -0700 (PDT)
Received: from ?IPV6:2001:a61:138e:201:27e2:fe9:90b9:6b9a? ([2001:a61:138e:201:27e2:fe9:90b9:6b9a])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-57c9c219da1sm396709a12.75.2024.06.11.01.21.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Jun 2024 01:21:05 -0700 (PDT)
Content-Type: multipart/mixed; boundary="------------pNu3dt6rAn0Rhon0mvv1v3ER"
Message-ID: <48c94250-64b3-4a19-9c87-0f48a2ceb425@suse.com>
Date: Tue, 11 Jun 2024 10:21:04 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: add NO_REPORT_LUNS quirk for at least a few Seagate external
 drives to fix smartctl with uas
To: Alban Browaeys <alban.browaeys@gmail.com>, linux-usb@vger.kernel.org
References: <9791b3eee4fc52b45f1ea9b9724bf977bf5c38d4.camel@gmail.com>
Content-Language: en-US
From: Oliver Neukum <oneukum@suse.com>
In-Reply-To: <9791b3eee4fc52b45f1ea9b9724bf977bf5c38d4.camel@gmail.com>

This is a multi-part message in MIME format.
--------------pNu3dt6rAn0Rhon0mvv1v3ER
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 10.06.24 21:25, Alban Browaeys wrote:
> I found that for "smartctl" to work on my two Seagate Expansion
> external USB3  I had to add the "j" usb-storage quirks ie
> "US_FL_NO_REPORT_LUNS".
> (They are years apart).

Hi,

does the attached patch do the job?

	Regards
		Oliver

--------------pNu3dt6rAn0Rhon0mvv1v3ER
Content-Type: text/x-patch; charset=UTF-8;
 name="0001-usb-uas-set-two-more-quirks-for-Seagate-drives.patch"
Content-Disposition: attachment;
 filename*0="0001-usb-uas-set-two-more-quirks-for-Seagate-drives.patch"
Content-Transfer-Encoding: base64

RnJvbSBmN2YyZmE1NzlkMjNhNDVkNDAxMWI3OTE1NWJkY2YxZDE3OWYxMDQ0IE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQpGcm9tOiBPbGl2ZXIgTmV1a3VtIDxvbmV1a3VtQHN1c2UuY29t
PgpEYXRlOiBUdWUsIDExIEp1biAyMDI0IDEwOjE0OjQ3ICswMjAwClN1YmplY3Q6IFtQQVRD
SF0gdXNiOiB1YXM6IHNldCB0d28gbW9yZSBxdWlya3MgZm9yIFNlYWdhdGUgZHJpdmVzCgpU
aGVzZSBkcml2ZXMgbmVlZCBVU19GTF9OT19SRVBPUlRfTFVOUwoKU2lnbmVkLW9mZi1ieTog
T2xpdmVyIE5ldWt1bSA8b25ldWt1bUBzdXNlLmNvbT4KLS0tCiBkcml2ZXJzL3VzYi9zdG9y
YWdlL3VudXN1YWxfdWFzLmggfCAxNCArKysrKysrKysrKysrKwogMSBmaWxlIGNoYW5nZWQs
IDE0IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL3VzYi9zdG9yYWdlL3Vu
dXN1YWxfdWFzLmggYi9kcml2ZXJzL3VzYi9zdG9yYWdlL3VudXN1YWxfdWFzLmgKaW5kZXgg
MWY4YzliMTZhMGZiLi4xMmMyZmRhNjkwNWIgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvdXNiL3N0
b3JhZ2UvdW51c3VhbF91YXMuaAorKysgYi9kcml2ZXJzL3VzYi9zdG9yYWdlL3VudXN1YWxf
dWFzLmgKQEAgLTc2LDYgKzc2LDIwIEBAIFVOVVNVQUxfREVWKDB4MGIwNSwgMHgxOTMyLCAw
eDAwMDAsIDB4OTk5OSwKIAkJVVNCX1NDX0RFVklDRSwgVVNCX1BSX0RFVklDRSwgTlVMTCwK
IAkJVVNfRkxfSUdOT1JFX1VBUyksCiAKKy8qIFJlcG9ydGVkLWJ5OiBBbGJhbiBCcm93YWV5
cyA8YWxiYW4uYnJvd2FleXNAZ21haWwuY29tPiAqLworVU5VU1VBTF9ERVYoMHgwYmMyLCAw
eDIwMzcsIDB4MDAwMCwgMHg5OTk5LAorCQkiU2VhZ2F0ZSIsCisJCSJSU1MgTExDIEV4cGFu
c2lvbiBIREQiLAorCQlVU0JfU0NfREVWSUNFLCBVU0JfUFJfREVWSUNFLCBOVUxMLAorCQlV
U19GTF9OT19SRVBPUlRfTFVOUyksCisKKy8qIFJlcG9ydGVkLWJ5OiBBbGJhbiBCcm93YWV5
cyA8YWxiYW4uYnJvd2FleXNAZ21haWwuY29tPiAqLworVU5VU1VBTF9ERVYoMHgwYmMyLCAw
eDIzMWEsIDB4MDAwMCwgMHg5OTk5LAorCQkiU2VhZ2F0ZSIsCisJCSJSU1MgTExDIEV4cGFu
c2lvbiBQb3J0YWJsZSIsCisJCVVTQl9TQ19ERVZJQ0UsIFVTQl9QUl9ERVZJQ0UsIE5VTEws
CisJCVVTX0ZMX05PX1JFUE9SVF9MVU5TKSwKKwogLyogUmVwb3J0ZWQtYnk6IERhdmlkIFdl
YmIgPGRqd0Bub2MuYWMudWs+ICovCiBVTlVTVUFMX0RFVigweDBiYzIsIDB4MzMxYSwgMHgw
MDAwLCAweDk5OTksCiAJCSJTZWFnYXRlIiwKLS0gCjIuNDUuMQoK

--------------pNu3dt6rAn0Rhon0mvv1v3ER--

