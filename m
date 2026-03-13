Return-Path: <linux-usb+bounces-34733-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IKo9Fr/fs2ktcQAAu9opvQ
	(envelope-from <linux-usb+bounces-34733-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Fri, 13 Mar 2026 10:58:23 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B251280FFD
	for <lists+linux-usb@lfdr.de>; Fri, 13 Mar 2026 10:58:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 23DF53014F5F
	for <lists+linux-usb@lfdr.de>; Fri, 13 Mar 2026 09:54:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A33F9389453;
	Fri, 13 Mar 2026 09:54:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FphqED+1"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB2E938947C
	for <linux-usb@vger.kernel.org>; Fri, 13 Mar 2026 09:54:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773395680; cv=none; b=Pxvw5Lm92TJAJ5QZ7/3v/zJCirGXOuvlUOzqyuBticsetPfVAmEvzVf+E010DORjqzf0DMGaOmU/vfIBTNyxBHbf1HU6ryloq7rzda52XHmxd9smUBX0Ugg/O1YIZYvZHtBAoNcTa8Ve3MW83j7wB8wlV7ADZQCrjxu7wYErlYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773395680; c=relaxed/simple;
	bh=SJUtCGakwZdt8xbhMcWwXaf3jThOdhRTHRHYhzah1fw=;
	h=Content-Type:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To; b=JSh0i5ix0FCMh9xGyQyVoQVs9MQHrSTeMvMxBtifyPLQ81etu9WEMWYe3KCB9Murg9nN88VgXGiaW59sIxU8IvxskdFCmt2zI+pNmJzYOBQ7w4GfyJTlRPnpvu8MKE1cainDoEd6fy8oNiwMTr9IYHPYxhtB6/on6RJEc079gzU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FphqED+1; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5a159c1e65aso1933164e87.0
        for <linux-usb@vger.kernel.org>; Fri, 13 Mar 2026 02:54:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773395677; x=1774000477; darn=vger.kernel.org;
        h=in-reply-to:from:content-language:subject:references:cc:to
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GMecmsCAvpoO97TR5Y4yX2yw7WN5dcGedLsX7KgX2zo=;
        b=FphqED+11R6HyZylbuqpJkZWxpjYVaE3kaAHwD1ZSutfP/DUFNM2cjnsGMyB+gl6MI
         MvLyamEVsc3Mdf1U6dBGloqLlwUnnN0L7rG0IdmSdCbNcy1R5OxpQPqhHNy+vnHECsiD
         /5MeQgFNqRbm9jyWN7Wcvn78dBr6eFQNRRV9cnOZqE/jv/TvAughlH7LkvZC29VqCc6h
         Imgj/kr2cMDGJ7LjTNEE3iQYifVxn5GYUaCyFCzXIf9j2CbXmq49u/LNbgVUJRg+qtwx
         TgLDCvRkhkADR0pcvbCD3zEkuYFZxC67+/+Pt6yWSvgcCRdEdDiXfd6eqH2dbJxKrsqI
         nXFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773395677; x=1774000477;
        h=in-reply-to:from:content-language:subject:references:cc:to
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GMecmsCAvpoO97TR5Y4yX2yw7WN5dcGedLsX7KgX2zo=;
        b=CDVLeVwUFby1jIk8hhoyKUxOEv+NNgY9+M1/8JAE8oFdRdo0g4kzhQ9fPZQGc8a827
         bhD3RkHftms3xpXVgXzoE26mCaqta+7m3flZClNLUHWPWb6S1x16gd7BxaNODAH1UXKT
         CTVN+B58M/0Lg4LMXIf5pA9sjPr0FnCo/vYoGlORTPOeaYYJVw6jcScpy/HT2qUHRvse
         ZYBhPVDrMvfHjwlffWEGtO19qx+lTL5+PJB0OViv9YrShMyw+aOBF/dYXyg8Wy1iYLKV
         AhqXHJm+fc+DU7BS2FlSzcoAmOjW7z+esCdH7K7sgYN6sagnXRy+UeFUi59x7hst0AJC
         SxTA==
X-Gm-Message-State: AOJu0YyVqCue8zXkr2Zh8Ontb7QMkrXAwIPeU8C0+kHa48uOKoW0wncK
	o+hUDjNT2WXOg7dTcA3AcDQnKUi0VO/xMfu2a8rVc+f3HDBUToAMK3G7K+1npmGx6SYl0HNz
X-Gm-Gg: ATEYQzw7/tnfpcwD4VbU+imF+YhgNvjWJwsu3JakYOpoxaRzJgXmu/XC95WNxywD7yl
	EtqhHVL+BTjLa0JrHbr+nZSHZQoDrL3AnvzTmVJUDnLZSIMBicfrqd0YvT//c7/OzwavlDTjpvO
	huXXwfiTQGHDzC7vCz7h/aekYmIBegr72FAEsuZTVYpBCVbS4gs5qvK9ZkR9ngDdA4lHfeNBNfZ
	cBNUY6dZRSIHIE8BlYy2eKfWDcCeGBCcJcG1EWEnxMLJvHSP1y909kHP0iLNkAmv5pRIh8UB0m9
	w2E0j3RTQ0TMRjNdhQiGoL4y7vH+Qy2igTZHwJRNiljWjEc5OOG2QfWIWMzr4HvrLsC2fKwAptL
	F0nS9soPR1d+OccbNbhBf8qCudUpv+ZEN+oUJsv9VRY7VGO+4Yn4qRjWqA7PGp/u/MeWhGkz+QT
	lRl8GdnK/YkVSYuh+orFSV7L8Emd0V1Ct1zQ==
X-Received: by 2002:a05:6512:a8e:b0:5a1:4287:15e6 with SMTP id 2adb3069b0e04-5a162b31bd9mr983883e87.35.1773395676676;
        Fri, 13 Mar 2026 02:54:36 -0700 (PDT)
Received: from [192.168.56.50] ([212.192.203.108])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a156366a74sm1431983e87.75.2026.03.13.02.54.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Mar 2026 02:54:35 -0700 (PDT)
Content-Type: multipart/mixed; boundary="------------jFfSr000230Jrzl5NUq0VHIE"
Message-ID: <11a5fd78-b897-47ca-8747-6f362d327b30@gmail.com>
Date: Fri, 13 Mar 2026 12:54:35 +0300
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org, vahnenko2003@gmail.com
References: <2026031331-overrun-palpitate-71c4@gregkh>
Subject: Re: ezcap401 needs USB_QUIRK_NO_BOS to function on 10gbs usb speed
Content-Language: en-US
From: CaTaTo <vahnenko2003@gmail.com>
In-Reply-To: <2026031331-overrun-palpitate-71c4@gregkh>
X-Spamd-Result: default: False [-1.06 / 15.00];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[multipart/mixed,text/plain,text/x-patch];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34733-lists,linux-usb=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	HAS_ATTACHMENT(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	MIME_TRACE(0.00)[0:+,1:+,2:+];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vahnenko2003@gmail.com,linux-usb@vger.kernel.org];
	RCPT_COUNT_THREE(0.00)[3];
	TO_DN_NONE(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.967];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	FREEMAIL_FROM(0.00)[gmail.com]
X-Rspamd-Queue-Id: 5B251280FFD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This is a multi-part message in MIME format.
--------------jFfSr000230Jrzl5NUq0VHIE
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Sorry again, last message went probably to Greg's address rather than 
this topic. I managed to make a patch, hopefully I didn't miss anything 
critical.

Regards,

Vyacheslav

--------------jFfSr000230Jrzl5NUq0VHIE
Content-Type: text/x-patch; charset=UTF-8;
 name="0001-Add-USB_QUIRK_NO_BOS-for-ezcap401-usb-capture-card.patch"
Content-Disposition: attachment;
 filename*0="0001-Add-USB_QUIRK_NO_BOS-for-ezcap401-usb-capture-card.patc";
 filename*1="h"
Content-Transfer-Encoding: base64

RnJvbSAxYWQyNDNlYmQwMjExYTU5MTY2NTM4M2QxMzgyNjE1YmI5ZTNkYzNhIE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQpGcm9tOiBWeWFjaGVzbGF2IFZhaG5lbmtvIDx2YWhuZW5rbzIw
MDNAZ21haWwuY29tPgpEYXRlOiBGcmksIDEzIE1hciAyMDI2IDEyOjEyOjI2ICswMzAwClN1
YmplY3Q6IFtQQVRDSF0gQWRkIFVTQl9RVUlSS19OT19CT1MgZm9yIGV6Y2FwNDAxIHVzYiBj
YXB0dXJlIGNhcmQKClNpZ25lZC1vZmYtYnk6IFZ5YWNoZXNsYXYgVmFobmVua28gPHZhaG5l
bmtvMjAwM0BnbWFpbC5jb20+Ci0tLQogZHJpdmVycy91c2IvY29yZS9xdWlya3MuYyB8IDMg
KysrCiAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvZHJp
dmVycy91c2IvY29yZS9xdWlya3MuYyBiL2RyaXZlcnMvdXNiL2NvcmUvcXVpcmtzLmMKaW5k
ZXggOWU3ZTQ5NzEyLi44ZWY4NzYzMTUgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvdXNiL2NvcmUv
cXVpcmtzLmMKKysrIGIvZHJpdmVycy91c2IvY29yZS9xdWlya3MuYwpAQCAtNTgzLDYgKzU4
Myw5IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgdXNiX2RldmljZV9pZCB1c2JfcXVpcmtfbGlz
dFtdID0gewogCS8qIElOVEVMIFZBTFVFIFNTRCAqLwogCXsgVVNCX0RFVklDRSgweDgwODYs
IDB4ZjFhNSksIC5kcml2ZXJfaW5mbyA9IFVTQl9RVUlSS19SRVNFVF9SRVNVTUUgfSwKIAor
CS8qIGV6Y2FwNDAxIC0gQk9TIGRlc2NyaXB0b3IgZmV0Y2ggaGFuZ3MgYXQgU3VwZXJTcGVl
ZCBQbHVzICovCisJeyBVU0JfREVWSUNFKDB4MzJlZCwgMHgwNDAxKSwgLmRyaXZlcl9pbmZv
ID0gVVNCX1FVSVJLX05PX0JPUyB9LAorCiAJeyB9ICAvKiB0ZXJtaW5hdGluZyBlbnRyeSBt
dXN0IGJlIGxhc3QgKi8KIH07CiAKLS0gCjIuNTMuMAoK

--------------jFfSr000230Jrzl5NUq0VHIE--

