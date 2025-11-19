Return-Path: <linux-usb+bounces-30672-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C0B9C6C6E0
	for <lists+linux-usb@lfdr.de>; Wed, 19 Nov 2025 03:47:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 15B964ED1E4
	for <lists+linux-usb@lfdr.de>; Wed, 19 Nov 2025 02:47:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1169C2BD030;
	Wed, 19 Nov 2025 02:46:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G+E7FDSh"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF21A28CF6F
	for <linux-usb@vger.kernel.org>; Wed, 19 Nov 2025 02:46:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763520401; cv=none; b=q0JqNgz0lUK24FvYXjVwrlCryLzl7s8n8h0JAO8pqVnAedpyPM1lCNhe79si7YTo+p0S5kGd9A94aC+Lv673QA5lco3kiwpRHx7KSPVXLsbQE07i/n9RNDo+S0RJlgoWpz8/OQ2+KdRZwFmLhwVNIQi/MTdRjGjCJwarT/8ddCY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763520401; c=relaxed/simple;
	bh=sAAWL8JnczIFLlslqdXqjIL5vrjFaa1956uuNQavB2E=;
	h=Content-Type:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To; b=CCApEnvN6Z86tiHBs+HcCv0CraaCQswAXizmijihtxTnIlhNIHzqOuZKJAiaKglnvVWKULabj4dFyhXRPFMlKCW95HHFAPKN113WIQbxGUOUCqk3WdLkeikZ1nFgaNd7ypq6nFlOHLsTM+fShB/1W475BAHRQQRzUEmWcIREL6w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G+E7FDSh; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-7baf61be569so4687263b3a.3
        for <linux-usb@vger.kernel.org>; Tue, 18 Nov 2025 18:46:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763520399; x=1764125199; darn=vger.kernel.org;
        h=in-reply-to:from:content-language:subject:references:cc:to
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yGKh45PX2YuPhhLkZxUqZlEKFdV7EEliBN8nMwa6g8I=;
        b=G+E7FDShWnAwU2O92GWEei3yuefpKxMULlnYNufT1ILOxsRgyU86bEdVapep3dryf0
         o9S5liAytdQFTBERyc04wojj9SnekxltMhcZwBujLTsFtXhselDjdw7hooZlOWaKDdF1
         wjszTHNbqRbMHZT57u0YCtmzWonPgA0fVj1n9SSdUUQRzkQP/kAQHoUvFdDngTRAn/Km
         TBUrsXT1tVxg2QhlHeB/Us8Wizy6UH/8R4u9SHyp+1mgvgTd/h+7rfzGWELXlNRRBwlf
         CtUU/GdlINQxDzxWpWdn2lQWDFRAOi38YAs+Kyenkh6HLtmd30bNc4Ig0YRmdHtItZOD
         vq2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763520399; x=1764125199;
        h=in-reply-to:from:content-language:subject:references:cc:to
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yGKh45PX2YuPhhLkZxUqZlEKFdV7EEliBN8nMwa6g8I=;
        b=dvTvo95JddklzvjgkL8Hp69oHAXs4i8obgqYKwRv0ufD1C0Q0EOpvq3+O+ArTO5aiI
         9pNAFI0N4r9gfMvOd+yTS1EyIh35iLvEUZ9ZjvFAPLI1HN1mPiqqBA7sr5TjBEioCB0N
         /YhfTwh3VzS/bHJpszCTTTlZuW4tKUwd1zxB/Rv91w+eA6cMsMIOdBnhXVjl01yOn2rp
         5dJGW+unmthU2X/4tgWe3DA+TGGJVjCEAuX8bG6sxLRI46zzXJsRz8OurKW2TOO5SbDm
         2c6fkEyqNxoAPkdn3mYaXyjLuP+sS4/0rSXGGkImH29PYf6P4UviOy9dc84x20ji3e2C
         KP2g==
X-Forwarded-Encrypted: i=1; AJvYcCXuX5WjhF+R+GpEVEMbqw+RJIOHsJkgpe6sX5805klYLhd5wlTo097fNryUhTljdHbeF34JWzGc6B8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwUbP8Kb+4vmbXUVHEYpYU4oD38Cj0dpWNQdDDV2Ya04CmxUpIM
	o7HehaQ7wHIMx3Nl/CFaeY/fVYWaI6Brd+V7BWmFE20L9qM29im08TRI
X-Gm-Gg: ASbGncspsVRR5I3FtWK7rODgrWdZVrEqzplMPh7xYasWaK9YrYtnoYqVxW7KYIvjvd4
	rhbp5HJOJGsVMLYJJQK/B+vp7b4WwGBEO0N4Fm/96wPxzNiWcU85Lvpi9kAJJp5BOYz7ozIKPWh
	wOB41snJrZgRvX6RZhznF+uYmms6Ek4IeQnjEvzC8qFhVjKnn1oLfbISo3fL8JLZ3IhPgmtFJG0
	GatsqMhT62TVsdK562f2ZRXZapECC1HE5zFBxXEnINXjUaQ6juEq8AdqB21sxMEVsHuX0BwSfmz
	0FKb374ZcQr1WY23Z5xir6UHdrV6Ps5mNFySNOOxYfM6vbi/U/LKFU+88y4LrjiVDOBbNjghrw3
	4kOrQQyM9N9ZRyLEWVnZoWzvvE6hqHB+11MQn97cFrIyZGI77G4zROINqqXmSi7AIIKDKMBozLz
	yxyC6hK+8XMVqoOwh6F3ytPkt966w=
X-Google-Smtp-Source: AGHT+IHyHc9h5I9T1VPJZh1zTHku9FC8IXvkQm1itcNWDgvJXca6bSSR3htJpCW+yVPHQXC0rvaKgQ==
X-Received: by 2002:a05:6a20:2449:b0:35f:e2c8:247 with SMTP id adf61e73a8af0-35fe2c80442mr10371141637.32.1763520399117;
        Tue, 18 Nov 2025 18:46:39 -0800 (PST)
Received: from [10.118.151.26] ([49.36.115.194])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7b924aedb73sm17689426b3a.12.2025.11.18.18.46.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Nov 2025 18:46:38 -0800 (PST)
Content-Type: multipart/mixed; boundary="------------2xwNknjuEzUmVcT0dKGsv6ua"
Message-ID: <38e4d1b9-016f-419b-b545-83c9f2f84b9d@gmail.com>
Date: Wed, 19 Nov 2025 08:16:32 +0530
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: syzbot+f098d64cc684b8dbaf65@syzkaller.appspotmail.com
Cc: linux-bluetooth@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-usb@vger.kernel.org, syzkaller-bugs@googlegroups.com
References: <691b301e.a70a0220.f6df1.0011.GAE@google.com>
Subject: Re: [syzbot] [bluetooth?] [usb?] memory leak in __hci_cmd_sync_sk
Content-Language: en-US
From: shaurya <ssranevjti@gmail.com>
In-Reply-To: <691b301e.a70a0220.f6df1.0011.GAE@google.com>

This is a multi-part message in MIME format.
--------------2xwNknjuEzUmVcT0dKGsv6ua
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<!DOCTYPE html>
<html>
  <head>

    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
  </head>
  <body>
    #syz test:<br>
    git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
    master
  </body>
</html>
--------------2xwNknjuEzUmVcT0dKGsv6ua
Content-Type: text/x-patch; charset=UTF-8;
 name="0001-Bluetooth-hci_sync-fix-memory-leak-in-__hci_cmd_sync.patch"
Content-Disposition: attachment;
 filename*0="0001-Bluetooth-hci_sync-fix-memory-leak-in-__hci_cmd_sync.pa";
 filename*1="tch"
Content-Transfer-Encoding: base64

RnJvbSBkYTczZWM4NTFhYTVlYzE5YjQyOWM0Y2Y4YjllMmNkNmE0MmU2ZTFlIE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQpGcm9tOiBTaGF1cnlhIFJhbmUgPHNzcmFuZV9iMjNAZWUudmp0
aS5hYy5pbj4KRGF0ZTogV2VkLCAxOSBOb3YgMjAyNSAwODowMTozMyArMDUzMApTdWJqZWN0
OiBbUEFUQ0hdIEJsdWV0b290aDogaGNpX3N5bmM6IGZpeCBtZW1vcnkgbGVhayBpbiBfX2hj
aV9jbWRfc3luY19zawoKRml4IGEgbWVtb3J5IGxlYWsgaW4gX19oY2lfY21kX3N5bmNfc2sg
d2hlcmUgYWxsb2NhdGVkIHJlcXVlc3QgY29tbWFuZApTS0JzIGFyZSBub3QgcHJvcGVybHkg
Y2xlYW5lZCB1cCB3aGVuIHRoZSBmdW5jdGlvbiBmYWlscy4KClRoZSBpc3N1ZSBvY2N1cnMg
d2hlbiBoY2lfY21kX3N5bmNfYWxsb2MoKSBzdWNjZXNzZnVsbHkgYWxsb2NhdGVzIGFuIFNL
QgphbmQgaXQgZ2V0cyBxdWV1ZWQgdmlhIGhjaV9jbWRfc3luY19hZGQoKSwgYnV0IHRoZW4g
X19oY2lfY21kX3N5bmNfc2soKQpmYWlscyBkdWUgdG8gdGltZW91dCwgaW50ZXJydXB0aW9u
LCBvciBjYW5jZWxsYXRpb24uIEluIHRoZXNlIGVycm9yCnBhdGhzLCB0aGUgcmVxX3NrYiB0
aGF0IHdhcyBjbG9uZWQgYW5kIHN0b3JlZCBpbiBoZGV2LT5yZXFfc2tiIGlzIG5vdApmcmVl
ZCwgbGVhZGluZyB0byBtZW1vcnkgbGVha3MuCgpUaGUgbWVtb3J5IGxlYWsgY2FuIGJlIHJl
cHJvZHVjZWQgd2hlbiBfX2hjaV9jbWRfc3luY19zaygpIGFsbG9jYXRlcwphbmQgcXVldWVz
IGFuIEhDSSBjb21tYW5kIFNLQiwgYW5kIGhjaV9yZXFfc3luY19ydW4oKSB0cmFuc2ZlcnMg
dGhpcwpTS0IgdG8gaGRldi0+Y21kX3EgYW5kIGNsb25lcyBpdCB0byBoZGV2LT5yZXFfc2ti
LiBJZiB0aGUgc3Vic2VxdWVudAp3YWl0X2V2ZW50X2ludGVycnVwdGlibGVfdGltZW91dCgp
IGNhbGwgZmFpbHMgKGR1ZSB0byB0aW1lb3V0IG9yCmludGVycnVwdGlvbiksIHRoZSBmdW5j
dGlvbiByZXR1cm5zIGFuIGVycm9yIHdpdGhvdXQgaGRldi0+cmVxX3NrYgpldmVyIGJlaW5n
IGNsZWFuZWQgdXAuCgpUaGUgZml4IGVuc3VyZXMgdGhhdCB3aGVuIF9faGNpX2NtZF9zeW5j
X3NrKCkgcmV0dXJucyBhbiBlcnJvciwgYW55CnBlbmRpbmcgcmVxdWVzdCBjb21tYW5kIFNL
QiBpbiBoZGV2LT5yZXFfc2tiIGlzIHByb3Blcmx5IGZyZWVkIGJlZm9yZQpyZXR1cm5pbmcu
IFRoaXMgbWF0Y2hlcyB0aGUgY2xlYW51cCBwYXR0ZXJuIHVzZWQgZWxzZXdoZXJlIGluIHRo
ZSBIQ0kKc3luYyBjb2RlLgoKUmVwb3J0ZWQtYnk6IHN5emJvdCtmMDk4ZDY0Y2M2ODRiOGRi
YWY2NUBzeXprYWxsZXIuYXBwc3BvdG1haWwuY29tCkNsb3NlczogaHR0cHM6Ly9zeXprYWxs
ZXIuYXBwc3BvdC5jb20vYnVnP2V4dGlkPWYwOThkNjRjYzY4NGI4ZGJhZjY1ClNpZ25lZC1v
ZmYtYnk6IFNoYXVyeWEgUmFuZSA8c3NyYW5lX2IyM0BlZS52anRpLmFjLmluPgotLS0KIG5l
dC9ibHVldG9vdGgvaGNpX3N5bmMuYyB8IDUgKysrKysKIDEgZmlsZSBjaGFuZ2VkLCA1IGlu
c2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9uZXQvYmx1ZXRvb3RoL2hjaV9zeW5jLmMgYi9u
ZXQvYmx1ZXRvb3RoL2hjaV9zeW5jLmMKaW5kZXggNmU3Njc5OGVjNzg2Li5mYmFhNTc0OWFk
N2IgMTAwNjQ0Ci0tLSBhL25ldC9ibHVldG9vdGgvaGNpX3N5bmMuYworKysgYi9uZXQvYmx1
ZXRvb3RoL2hjaV9zeW5jLmMKQEAgLTIwMyw2ICsyMDMsMTEgQEAgc3RydWN0IHNrX2J1ZmYg
Kl9faGNpX2NtZF9zeW5jX3NrKHN0cnVjdCBoY2lfZGV2ICpoZGV2LCB1MTYgb3Bjb2RlLCB1
MzIgcGxlbiwKIAogCWlmIChlcnIgPCAwKSB7CiAJCWtmcmVlX3NrYihza2IpOworCQkvKiBD
bGVhbiB1cCBhbnkgcGVuZGluZyByZXF1ZXN0IGNvbW1hbmQgKi8KKwkJaWYgKGhkZXYtPnJl
cV9za2IpIHsKKwkJCWtmcmVlX3NrYihoZGV2LT5yZXFfc2tiKTsKKwkJCWhkZXYtPnJlcV9z
a2IgPSBOVUxMOworCQl9CiAJCXJldHVybiBFUlJfUFRSKGVycik7CiAJfQogCi0tIAoyLjM0
LjEKCg==

--------------2xwNknjuEzUmVcT0dKGsv6ua--

