Return-Path: <linux-usb+bounces-36539-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GH54GR9L72lO/wAAu9opvQ
	(envelope-from <linux-usb+bounces-36539-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 27 Apr 2026 13:40:15 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 006B1471DE9
	for <lists+linux-usb@lfdr.de>; Mon, 27 Apr 2026 13:40:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9EE813017BEF
	for <lists+linux-usb@lfdr.de>; Mon, 27 Apr 2026 11:40:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 442F130F94D;
	Mon, 27 Apr 2026 11:40:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="Pp2+lHwU"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 674CB2F3C22
	for <linux-usb@vger.kernel.org>; Mon, 27 Apr 2026 11:40:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777290006; cv=none; b=j29Noy4lyqcZyvX7K1TaQSSJ/yY86qT8eijLnF/8UuGsBxlARuUSTwlygyYsF2auydb/KtvLFgiddACc7XVK8XKLaj83vNO0T378jOj+weUMjQx5xlmbXF2cA1d+nEX2ia+v00PjkFALHJvNfF9xv7gHGvgBeLg8CwrcxhAymH8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777290006; c=relaxed/simple;
	bh=FX/oWqkb2qrxXDZCTWeBB9DCkoBAg4n+BxIBT+FCjKM=;
	h=Content-Type:Message-ID:Date:MIME-Version:Subject:To:References:
	 From:In-Reply-To; b=lm4cNUvvWz3rmLxMuXFlWiGeI3foCmVnXGPhB2GH92YnHgG6/K/FuWaKHnVGgHT1Lk5HI6eI0L3dk1ssSwtM7Hcaw9EudeOpx3yZ8yCHgU9Dowk89omQYRb21QiD5aEfoPr8KRKrtMCg6SehIWbI6KCxfeqWPpKV6jt4KjoKiIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=Pp2+lHwU; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-488a88aeec9so126205995e9.2
        for <linux-usb@vger.kernel.org>; Mon, 27 Apr 2026 04:40:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1777290004; x=1777894804; darn=vger.kernel.org;
        h=in-reply-to:from:content-language:references:to:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FX/oWqkb2qrxXDZCTWeBB9DCkoBAg4n+BxIBT+FCjKM=;
        b=Pp2+lHwUnGQF0TocilYeL5FAxoi6jUzMiUwbS8r6+YUf6XLsD2th//EdBXb72fJVCj
         gkwJn3ko5hWn+zIkG9ES9UXljdu5hkm9OSWxjAwJj2W06KJiLVtTjFJ9kKRhKaXX+0tk
         3IvsPzETiuXmpbi7kbFA/tU5MGUKDfmBcyFnunGaMUQpsVu9umWSgOxgp1AHHavHDRaF
         XOJeRjLlBVgU8Pq9vlbXLOt0t2kUm5YvSnVhHwMNkaXYVKgWLHJ2BXHM9pVXnKPO3yfv
         gVOSiLX817WzBOv9ANpzPRTTgaIs3RKkd9qbZSLpOvlSacHt3hf8OvdYe3XhW4HOtFE3
         q90A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777290004; x=1777894804;
        h=in-reply-to:from:content-language:references:to:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FX/oWqkb2qrxXDZCTWeBB9DCkoBAg4n+BxIBT+FCjKM=;
        b=bg87Saw4iPjGl/xCT7MHavehm5v8uTW2qD4WXME99hhr9/PApNVzjccKwgZcAIuxQJ
         FdxOODQWADLttx/BaZ6pzhKC+UwClhp+oB+p1ZqZ70YQ8+hOPLXKPQhGszoMgioicPp3
         X6zZ6gprhVSqRzKK6yHZtDmH+bIKji0nJJcsnlFW/wvMzyN0iKRVa2E7VOfsj/Hd5w2y
         0NsBk3IZwBPGKXR+am/v7mD8m9z8cNoUQgkaiGHOHlYx9dIUV5DdeDxWnc1oECs7Rn1c
         307I6Ymj3SM9zxeeUmemD4dbYbwshad/WNN8OGI5BEDeGNBEMYY01UohZN18DiKlDPlo
         ujMw==
X-Forwarded-Encrypted: i=1; AFNElJ/la2DMS0Pynwm1bUR1aB8hDB91GAyhs5ji/mosyaZ324D0MF3qUkVPJpImYggL6EtK84kA6VAVXVI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9BcnguPAwt29Mx+/c2p3nVz3T3DXyobWSIPjMO8/R2D3Cym3B
	tjWImiCBO38SjM823PUJo+pmFbxAuigYPTDvXN6t5Bo890PzCipxLTmfcNx0rgrzWddUHVp0ZsX
	5bKzB
X-Gm-Gg: AeBDieulMVQJwwc0XGuGykqUySMYBSOEFUaCMs4Ilhc6NBNEd2u5QtoG32GtLOK7SE4
	wclz4Dn/UJlpe7750tTfstkQZou76EPb7AUVUnQLpSAMgh7oBwVfYGfUqJ2XSm621g/pDH65fF3
	PqBNZclxIfEvJaxFpAdnLt38K1FMqOs4BuTFTPG2eTg0mTcV8zuP2jt674XRVV2+5DaRkp06svh
	0UpW4J3fRzF3pK511T7dnmZghqEpna8X/d1a6wLrOLae5Pxv2FhPB0klCnjeT99Q9xuHtq7b/h2
	aGp09VYi2wahnnMtH0I311OIz+B2tGuEeeMM/KOLlZ+Fpv+uFIvwAHgNCpqj+PJbrddsTbckrOq
	TiG+g3KMg4To0gAtz3HZFtAhYrEaE0B7DC/FTn/dGaQ4jF4pWugBS9ycYhlvk1bFS2uyVCSGa0Y
	YV/pxjSvhxu78BQSTuA9og8ckj/DN+xAoA/5sVfNivYLT8VJ1uh5OQBJe7p5aDdPHX3Az7jGh2l
	1Mn
X-Received: by 2002:a05:600c:c0c8:b0:487:21c7:2885 with SMTP id 5b1f17b1804b1-488fb73d9ffmr451476265e9.5.1777290003759;
        Mon, 27 Apr 2026 04:40:03 -0700 (PDT)
Received: from ?IPV6:2001:a61:1391:ac01:103d:ec76:dff7:ee6c? ([2001:a61:1391:ac01:103d:ec76:dff7:ee6c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a55dc9f58sm943141275e9.6.2026.04.27.04.40.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Apr 2026 04:40:03 -0700 (PDT)
Content-Type: multipart/mixed; boundary="------------Voy8FT0eoPPXKkUZxhQ6wujh"
Message-ID: <9fea44a5-83de-41ed-9531-11e5d471dca4@suse.com>
Date: Mon, 27 Apr 2026 13:40:02 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [syzbot] [usb?] memory leak in hub_event (4)
To: syzbot <syzbot+2afd7e71155c7e241560@syzkaller.appspotmail.com>,
 gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 linux-usb@vger.kernel.org, syzkaller-bugs@googlegroups.com
References: <69ec231a.a00a0220.7773.000c.GAE@google.com>
Content-Language: en-US
From: Oliver Neukum <oneukum@suse.com>
In-Reply-To: <69ec231a.a00a0220.7773.000c.GAE@google.com>
X-Rspamd-Queue-Id: 006B1471DE9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.44 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[multipart/mixed,text/plain,text/x-patch];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-36539-lists,linux-usb=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,suse.com:dkim,suse.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,appspotmail.com:email];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:+];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[oneukum@suse.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	HAS_ATTACHMENT(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb,2afd7e71155c7e241560];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	SUBJECT_HAS_QUESTION(0.00)[]

This is a multi-part message in MIME format.
--------------Voy8FT0eoPPXKkUZxhQ6wujh
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 25.04.26 04:12, syzbot wrote:

#syz test: git://repo/address.git dd6c438c3e64

--------------Voy8FT0eoPPXKkUZxhQ6wujh
Content-Type: text/x-patch; charset=UTF-8;
 name="0001-usb-core-fix-memory-of-error-case-in-usb_get_configu.patch"
Content-Disposition: attachment;
 filename*0="0001-usb-core-fix-memory-of-error-case-in-usb_get_configu.pa";
 filename*1="tch"
Content-Transfer-Encoding: base64

RnJvbSAwMDExNzVmNGQyZTFjMmNlYWM5OGI0YWYyNTIxZmM0ZDAyNTNkMGM4IE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQpGcm9tOiBPbGl2ZXIgTmV1a3VtIDxvbmV1a3VtQHN1c2UuY29t
PgpEYXRlOiBNb24sIDI3IEFwciAyMDI2IDEzOjM1OjM4ICswMjAwClN1YmplY3Q6IFtQQVRD
SF0gdXNiOiBjb3JlOiBmaXggbWVtb3J5IG9mIGVycm9yIGNhc2UgaW4gdXNiX2dldF9jb25m
aWd1cmF0aW9uCgpQcmlvciBhbGxvY2F0aW9ucyBuZWVkIHRvIGJlIHJldmVyc2VkIGlmIHN1
YnNlcXVlbnQKYWxsb2NhdGlvbnMgZmFpbC4KCkZpeGVzOiBkZDIwNTdlNTQ0ZGM5ICgiVVNC
OiBjb3JlOiBkcm9wIE9PTSBtZXNzYWdlIikKU2lnbmVkLW9mZi1ieTogT2xpdmVyIE5ldWt1
bSA8b25ldWt1bUBzdXNlLmNvbT4KUmVwb3J0ZWQtYnk6IHN5emJvdCsyYWZkN2U3MTE1NWM3
ZTI0MTU2MEBzeXprYWxsZXIuYXBwc3BvdG1haWwuY29tCi0tLQogZHJpdmVycy91c2IvY29y
ZS9jb25maWcuYyB8IDEzICsrKysrKysrKysrLS0KIDEgZmlsZSBjaGFuZ2VkLCAxMSBpbnNl
cnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvdXNiL2Nv
cmUvY29uZmlnLmMgYi9kcml2ZXJzL3VzYi9jb3JlL2NvbmZpZy5jCmluZGV4IDQxNzE0MGIw
MTJiYi4uNjc0NzVmZjgxNjQxIDEwMDY0NAotLS0gYS9kcml2ZXJzL3VzYi9jb3JlL2NvbmZp
Zy5jCisrKyBiL2RyaXZlcnMvdXNiL2NvcmUvY29uZmlnLmMKQEAgLTk0NCwxMSArOTQ0LDEx
IEBAIGludCB1c2JfZ2V0X2NvbmZpZ3VyYXRpb24oc3RydWN0IHVzYl9kZXZpY2UgKmRldikK
IAlsZW5ndGggPSBuY2ZnICogc2l6ZW9mKGNoYXIgKik7CiAJZGV2LT5yYXdkZXNjcmlwdG9y
cyA9IGt6YWxsb2MobGVuZ3RoLCBHRlBfS0VSTkVMKTsKIAlpZiAoIWRldi0+cmF3ZGVzY3Jp
cHRvcnMpCi0JCXJldHVybiAtRU5PTUVNOworCQlnb3RvIGJhaWxvdXQyOwogCiAJZGVzYyA9
IGttYWxsb2MoVVNCX0RUX0NPTkZJR19TSVpFLCBHRlBfS0VSTkVMKTsKIAlpZiAoIWRlc2Mp
Ci0JCXJldHVybiAtRU5PTUVNOworCQlnb3RvIGJhaWxvdXQ7CiAKIAlmb3IgKGNmZ25vID0g
MDsgY2Znbm8gPCBuY2ZnOyBjZmdubysrKSB7CiAJCS8qIFdlIGdyYWIganVzdCB0aGUgZmly
c3QgZGVzY3JpcHRvciBzbyB3ZSBrbm93IGhvdyBsb25nCkBAIC0xMDEyLDYgKzEwMTIsMTUg
QEAgaW50IHVzYl9nZXRfY29uZmlndXJhdGlvbihzdHJ1Y3QgdXNiX2RldmljZSAqZGV2KQog
CWRldi0+ZGVzY3JpcHRvci5iTnVtQ29uZmlndXJhdGlvbnMgPSBjZmdubzsKIAogCXJldHVy
biByZXN1bHQ7CisKK2JhaWxvdXQ6CisJa2ZyZWUoZGV2LT5yYXdkZXNjcmlwdG9ycyk7CisJ
ZGV2LT5yYXdkZXNjcmlwdG9ycyA9IE5VTEw7CitiYWlsb3V0MjoKKwlrZnJlZShkZXYtPmNv
bmZpZyk7CisJZGV2LT5jb25maWcgPSBOVUxMOworCisJcmV0dXJuIC1FTk9NRU07CiB9CiAK
IHZvaWQgdXNiX3JlbGVhc2VfYm9zX2Rlc2NyaXB0b3Ioc3RydWN0IHVzYl9kZXZpY2UgKmRl
dikKLS0gCjIuNTQuMAoK

--------------Voy8FT0eoPPXKkUZxhQ6wujh--

