Return-Path: <linux-usb+bounces-23034-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DDF7BA887CE
	for <lists+linux-usb@lfdr.de>; Mon, 14 Apr 2025 17:53:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8A41C3AC588
	for <lists+linux-usb@lfdr.de>; Mon, 14 Apr 2025 15:53:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6DB5127E1B4;
	Mon, 14 Apr 2025 15:53:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="DYe4pA58"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2080C27B510
	for <linux-usb@vger.kernel.org>; Mon, 14 Apr 2025 15:53:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744645995; cv=none; b=bLNRgjSL79+ViF1uDsdeYQeGw73q5DHV/Lkp8JpWutp1TkhaF/JarIwokrkkYronVuXdt4hCJzV/INsAhL+IlOK9RGNcQB70a13/q2zshv4N/SQq77wb/E8WVkUmB4sBuAcefs6XT0P+PrvPBuUK01jDeNzE/O01ZooRLKYorAQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744645995; c=relaxed/simple;
	bh=7AFPn5AjLDiJ84lFwjuPny+NVv7hSklqBr+hGfuqtAc=;
	h=Content-Type:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To; b=FXQdS7R+yVVjzD4AZAMh2mus1+1H0CetRrWOnd4KFXmvA4EcuTNQ9TuEA31q5f9SFjME/rPNumUhSuSYEGoj6y+jNpzmiN5sU2jD3muPL+MAmc4wwRhR/Qr9MTkLnM0GonXae1rFdMkQIvlBYnef5wiXF5JUy/Rm6pNqNWJGhXU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=DYe4pA58; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-399737f4fa4so2607025f8f.0
        for <linux-usb@vger.kernel.org>; Mon, 14 Apr 2025 08:53:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1744645990; x=1745250790; darn=vger.kernel.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tI5NmhSNvRqQWUoYRdRSPPgpDjFPr+pUsQa5suoJQ1k=;
        b=DYe4pA58V/1hlNjnWSsKch5HG2RrITLbQtDoasryv+jYfxdsa3AYod7F0m/8htb7rF
         JllYyT8xq9EZT1BVybk8mxMArnwdQBjSqQ9IKJFMIazTq494FunRsNGWVMud/cfrROyk
         u0wpBSUGn4dAHh1f4EWxIldBmyswIjxpKblkOS6cFm8H2m/Z/vh437ZvFBR0nk5G9NWn
         Z6sl64l2EiXu0mBpqfzNAwUw3uqvdAB9NN9VIIwUMMUyIpAcVWNS/hklkltrss2rqs6R
         ceDoZ4IWac6daf9D6lpqhmgFl61anBAXs12lZ/7Rpswff0IfTYXFWGfzVz8lDsPsUhTH
         mLbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744645990; x=1745250790;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=tI5NmhSNvRqQWUoYRdRSPPgpDjFPr+pUsQa5suoJQ1k=;
        b=b5zMHjY6iJlif/mlTiUUvF6PkC+OVD1u1fmj+o4jnkZbU0FNBIOuQEEMtMI9Zr/Wwu
         gkSXritIioUcjaGcDp8BAC0GS5x+fNpw8gbcjZh/p93BmgbQoiwMh6zk8Rr4yI37/2GN
         SSdAm7tz3d/h9ONR+khqkmyUnrw7tgaDoRlCGcGv8gDmEjz8WDSUlY8D6vNxUWKd67PO
         ZNT/t4ufKmXpfTL9l9y7R/UNm7vXq+LUG84zmcqGlwt5S+Gpu6JN2SOOZ11qFGnhvu7D
         kTvGYkWmCd7srzqEZ9N7QTAvWmyxGyqr0g/BspJIbcFc/BM/HYaekOSzUnny4LCh6SbI
         R+ag==
X-Gm-Message-State: AOJu0Yy8TgDcRSoyhdC2iLk92iYgrCjgMjqOEfgdLYVLCDBUu8MKXEVp
	O3Od5Yg8vkoyWfRuKz3AVlHSCsSjrTW7FBw7BYEQVTVEmKB0vRgcAeiCOYjYfII=
X-Gm-Gg: ASbGnctQaMRYtgDBGuHavB2jqri/z6RuLBxbw7Qo4NMPvSnoWAOjxG92bFexKf6WKfX
	4Cu/b72YDWk7bgD++UGvW1LvRcINvPE5QVp74S4PELDj8a2VUOJHcAvl1dt8oFC3Nj+KOArxpn/
	GCy9sXLv/FLOUU2D6PmNu5aVUh3S6rxP+fWpFUsu4yHUJ1vjEPSBe8AySEKWiAJiorlzG3gzVQF
	9x65zIfVOI9+jExYtbfJbMfGQsgoQNnOP+zWq1e8d8iLYNmaXcBgGkpGCStMTW2WqJID7V7k3fk
	Yy0jWcXGIXGZSLaFlWpQUEzue5SSDH51vaOXazdZbWsCOEl1jwURcru6QYguh2WTI9/UaR389PG
	E9rgK
X-Google-Smtp-Source: AGHT+IGnaWwzR1/6adOw6wnqKFgr06F85tg6VImqSdBvnosNfVAmVJAVjrisT059/g3sx1SMqs0WrQ==
X-Received: by 2002:a5d:584d:0:b0:39c:1efd:ed8f with SMTP id ffacd0b85a97d-39eaaedc509mr9909324f8f.50.1744645990074;
        Mon, 14 Apr 2025 08:53:10 -0700 (PDT)
Received: from ?IPV6:2001:a61:133f:6401:e752:8c5:d87a:c5a2? ([2001:a61:133f:6401:e752:8c5:d87a:c5a2])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39eae97751fsm11294761f8f.41.2025.04.14.08.53.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Apr 2025 08:53:09 -0700 (PDT)
Content-Type: multipart/mixed; boundary="------------6rue5hrX3t9vsqJHkuqYOt0u"
Message-ID: <8c63bb6f-e923-41ac-85a1-c761e303e020@suse.com>
Date: Mon, 14 Apr 2025 17:53:09 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [raspberrypi/linux] cdc_wdm driver: infinite loop on -EPROTO
 error leads to system freeze with SIM7600 module (Issue #6746)
To: Alan Stern <stern@rowland.harvard.edu>,
 raspberrypi/linux
 <reply+AG4XYTBMABQ4XN53CBXUUO6GBC3PXEVBNHHLALZAUU@reply.github.com>,
 Oliver Neukum <oliver@neukum.org>
Cc: USB mailing list <linux-usb@vger.kernel.org>
References: <raspberrypi/linux/issues/6746@github.com>
 <raspberrypi/linux/issues/6746/2800873755@github.com>
 <9af24499-e2db-45e6-9890-f87c332bd171@rowland.harvard.edu>
Content-Language: en-US
From: Oliver Neukum <oneukum@suse.com>
In-Reply-To: <9af24499-e2db-45e6-9890-f87c332bd171@rowland.harvard.edu>

This is a multi-part message in MIME format.
--------------6rue5hrX3t9vsqJHkuqYOt0u
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 14.04.25 16:05, Alan Stern wrote:
> [+Oliver, linux-usb]
> 
> On Mon, Apr 14, 2025 at 01:31:39AM -0700, sfczsolti wrote:
>> sfczsolti left a comment (raspberrypi/linux#6746)
>>
>> Hi there,
>>
>> I opened this issue a few weeks ago regarding cdc_wdm driver and haven’t received any feedback yet. I wanted to follow up to see if anyone has had a chance to review it or if there is any update on addressing the problem.
>>
>> If there’s any further information you need from me, or if there’s anything I can do to help, please let me know.
>>
>> Thank you for your time and effort!
> 
> Many USB drivers getting a -EPROTO error immediately give up and treat
> it as fatal (an indication of a disconnection).

Hi,

that is indeed the simplest option.
In the medium term this driver's error handling needs
some love. Dear sfczsolti, could you test the attached patch?
--------------6rue5hrX3t9vsqJHkuqYOt0u
Content-Type: text/x-patch; charset=UTF-8;
 name="0001-usb-wdm-give-up-upon-EPROTO.patch"
Content-Disposition: attachment;
 filename="0001-usb-wdm-give-up-upon-EPROTO.patch"
Content-Transfer-Encoding: base64

RnJvbSA1NTg2YTA5YmI1MzNkODg3MjIxYjc3YjViNDA3ODcwOTNjYWY2YzQ1IE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQpGcm9tOiBPbGl2ZXIgTmV1a3VtIDxvbmV1a3VtQHN1c2UuY29t
PgpEYXRlOiBNb24sIDE0IEFwciAyMDI1IDE3OjQ0OjIxICswMjAwClN1YmplY3Q6IFtQQVRD
SF0gdXNiOiB3ZG06IGdpdmUgdXAgdXBvbiBFUFJPVE8KCklmIHdlIGFyZSBnZXR0aW5nIC1F
UFJPVE8gaW4gYSBjb21wbGV0aW9uIGhhbmRsZXIKdGhlIGxpa2VseSBjYXVzZSBpcyBkaXNj
b25uZWN0aW9uLiBIZW5jZSB3ZSBzaG91bGQKZ2l2ZSB1cC4gVGhlIGFsdGVyYXRpdmUgaXMg
bGl2ZWxvY2suCgpGaXhlczogYWZiYTkzN2U1NDBjOSAoIlVTQjogQ0RDIFdETSBkcml2ZXIi
KQpTaWduZWQtb2ZmLWJ5OiBPbGl2ZXIgTmV1a3VtIDxvbmV1a3VtQHN1c2UuY29tPgotLS0K
IGRyaXZlcnMvdXNiL2NsYXNzL2NkYy13ZG0uYyB8IDMgKysrCiAxIGZpbGUgY2hhbmdlZCwg
MyBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy91c2IvY2xhc3MvY2RjLXdk
bS5jIGIvZHJpdmVycy91c2IvY2xhc3MvY2RjLXdkbS5jCmluZGV4IDI4YzVlZDg0MGE0MC4u
ZjhlYWQ3M2RhNTA5IDEwMDY0NAotLS0gYS9kcml2ZXJzL3VzYi9jbGFzcy9jZGMtd2RtLmMK
KysrIGIvZHJpdmVycy91c2IvY2xhc3MvY2RjLXdkbS5jCkBAIC0yNjksNiArMjY5LDkgQEAg
c3RhdGljIHZvaWQgd2RtX2ludF9jYWxsYmFjayhzdHJ1Y3QgdXJiICp1cmIpCiAJCQlzZXRf
Yml0KFdETV9JTlRfU1RBTEwsICZkZXNjLT5mbGFncyk7CiAJCQlkZXZfZXJyKCZkZXNjLT5p
bnRmLT5kZXYsICJTdGFsbCBvbiBpbnQgZW5kcG9pbnRcbiIpOwogCQkJZ290byBzdzsgLyog
aGFsdCBpcyBjbGVhcmVkIGluIHdvcmsgKi8KKwkJY2FzZSAtRVBST1RPOgorCQkJLyogd2Ug
YXJlIGJlaW5nIGRpc2Nvbm5lY3RlZCAqLworCQkJcmV0dXJuOwogCQlkZWZhdWx0OgogCQkJ
ZGV2X2Vycl9yYXRlbGltaXRlZCgmZGVzYy0+aW50Zi0+ZGV2LAogCQkJCSJub256ZXJvIHVy
YiBzdGF0dXMgcmVjZWl2ZWQ6ICVkXG4iLCBzdGF0dXMpOwotLSAKMi40OS4wCgo=

--------------6rue5hrX3t9vsqJHkuqYOt0u--

