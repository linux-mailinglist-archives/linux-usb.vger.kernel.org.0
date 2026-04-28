Return-Path: <linux-usb+bounces-36651-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oAI0EHME8WnhbwEAu9opvQ
	(envelope-from <linux-usb+bounces-36651-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 28 Apr 2026 21:03:15 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A366D48AF42
	for <lists+linux-usb@lfdr.de>; Tue, 28 Apr 2026 21:03:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C52DE303581C
	for <lists+linux-usb@lfdr.de>; Tue, 28 Apr 2026 19:02:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC9FF3115AF;
	Tue, 28 Apr 2026 19:02:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="eYqGHFyh"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B05C8194AE6
	for <linux-usb@vger.kernel.org>; Tue, 28 Apr 2026 19:02:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777402948; cv=none; b=IIiLvSzWNKDvTuJWkxob2tNYT1Y8AI2MDiwwR4A8/o05yfBS9qKhe+U1Wwga+dDaaZl/NlCuCA7X3aFcCcvsehQyERG6DP5Ya1ER0jbHlaHrmVqzCc4b1dwNpY+r4fpZeyTTGz/9d06YYHlGIxWHtIVuVisJvMDI54lZAgUWPA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777402948; c=relaxed/simple;
	bh=vPm3Wp9gsNhsjC7MDecsPRwk5V+mGEvvNrm6yrZrdNI=;
	h=Content-Type:Message-ID:Date:MIME-Version:To:Cc:From:Subject; b=HdvLUfiSv8969AmOmPaIiNOwuESk4zM+GgbAUs2lghhnR4Rp0M8smMFBybzqPL3wGxoYJq23oor5Fx0qudgpFHxO+yU4XpwcBPgku15OmrmCYX/j2Qt8ODQG//IMtmJFcmEO/dZ1ZTilW5V0QQ2W/fyRiNTM+iWQxd5p5ldFGI4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=eYqGHFyh; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-483487335c2so114299695e9.2
        for <linux-usb@vger.kernel.org>; Tue, 28 Apr 2026 12:02:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1777402945; x=1778007745; darn=vger.kernel.org;
        h=subject:from:cc:content-language:to:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=3Urxirh499q1cIAmnXduuRQTaJcYvmIBWSq0c03jYKM=;
        b=eYqGHFyhuHYFOLIntSfMHEDVu3Ml3U60Eag+AwQvVqV1jbCuhbySl/i5sQ996ZOOg7
         2bodeIllyzzsyVK8E1FVK4RkOBGkl1qv83UcmljZCRr7LZ8owjqVX8mBjuCL0V2CjQzb
         1CPvhQJcrZ4ltCr/lEoSUiRj22WTIquNAX6rQemGaWjvVgB9YGyXa2TO+gd6kJ+z+Kfk
         z4QcMCE2CW9dfOHx5uhbe1Ud5q7WXHjlls6gzpiKyCgvVhqOcRweb7hhKfSp+PXAggvq
         A3bDJjWi/bqEnSYG/9pjE1zpUqIHAU4YeIHVrNp3u/kZdrC+nt0HHK/r+iO0jywWyRjr
         CXfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777402945; x=1778007745;
        h=subject:from:cc:content-language:to:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3Urxirh499q1cIAmnXduuRQTaJcYvmIBWSq0c03jYKM=;
        b=Bx9fcE/0qaL/miIdbrwqrJtHytLWlZmVLsWdxMpW8uFqKUOSYUltq4aPlGEm3AHCXZ
         91gotIIR+nx96h8rQfH/EMx2j2o5gizQoezkyH4Bag0m1HBfoBeZ+hGNhOwoCCEXEU6k
         U/Urx+eRyWonolbBWgeFl6ZZTgvkAj0/gpHaISwT7OAAf+3N22Z6bxsvYmZrEYEfR0pb
         bidEleLu+mh0Q/Od+HgcjJUQrwR7d0UObRicOj+Hd8veZIO1rlAG/d1Mczr3NYoNHLtX
         HWtI8LC7Y08WSTncqss5ojFIIyZ1UnjqXBlTJmOBWVVwKQvESqAdX97ysxuT2eb3yLnZ
         maxg==
X-Gm-Message-State: AOJu0YwS+k5hc/dM/VFxopsWNln+HubQ4OIUvh+5MiJlHwVJdRveZf6w
	eKaM3UTsFX2RLHHUFEuDtGZgBVbPex1NvkCGejsbYNexv8LuvYoZ4WGTo5xfbHDgxkIhvKdY6HJ
	czzc+cDA=
X-Gm-Gg: AeBDies/b1gg9t+0xTI9qUTrFpPJGaSDtVCghwg8UieagPaJx1aEyzUCclyzOHq8AQi
	JErCRulWc7xeNj9DHBXlN5uu3XkUmWWKXmjtClA2x8cR2H7CJZiqEjrql6Y+7TTzNirfh5Twjo2
	TfBWTDkQUN0hlrsjabYPR+0m8kQ1jWJDPLzVhSP6d8s/GuVDWwGbfI9kaPfp6FYVQO1l4xHf/me
	03cOfl8L73EjIhBuUfOMs45Dp5714CrI8GUx04mekV3Ao8SeDdXhsn/gqh/CL4R+ZT4RfLzSGX5
	/HTm1NfoH3WrCOVBsQIHN2K65UD9lKcua3txYW8pxg/hZxeIjZhAyTBDmmWf1soCGKB3WmhQoYH
	iRUHtbuxkZNfavpGh+PEk73Z1KFQq1R8ind1sp2+58Z9bNfb7NvYLm+hy9ksnODPPwSsqoOP/Sy
	gBQ1On/BMd0zoE0kEG/DMFqtysWS5QJjlnKYQvY9ZVhHqeBKjgOjSS9N3ufILfJvmfrjfWtStwQ
	Yc=
X-Received: by 2002:a05:600c:1d1a:b0:489:fec9:a17e with SMTP id 5b1f17b1804b1-48a77af1953mr65328465e9.12.1777402944979;
        Tue, 28 Apr 2026 12:02:24 -0700 (PDT)
Received: from ?IPV6:2001:a61:1399:ff01:bd7:b9d5:f4ba:1161? ([2001:a61:1399:ff01:bd7:b9d5:f4ba:1161])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a7b9dee18sm6281615e9.0.2026.04.28.12.02.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Apr 2026 12:02:24 -0700 (PDT)
Content-Type: multipart/mixed; boundary="------------bYq0kwR29F3iipoRftHjoOuN"
Message-ID: <cb004ecd-ee8c-4d3d-a687-4a0f087519eb@suse.com>
Date: Tue, 28 Apr 2026 21:02:22 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Alan Stern <stern@rowland.harvard.edu>
Content-Language: en-US
Cc: USB list <linux-usb@vger.kernel.org>
From: Oliver Neukum <oneukum@suse.com>
Subject: block error issue with root hubs
X-Rspamd-Queue-Id: A366D48AF42
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.06 / 15.00];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[multipart/mixed,text/plain,text/x-patch];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-36651-lists,linux-usb=lfdr.de];
	TO_DN_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MAILSPIKE_FAIL(0.00)[172.234.253.10:query timed out];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[oneukum@suse.com,linux-usb@vger.kernel.org];
	HAS_ATTACHMENT(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	MID_RHS_MATCH_FROM(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,suse.com:dkim,suse.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

This is a multi-part message in MIME format.
--------------bYq0kwR29F3iipoRftHjoOuN
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

looking at UAS error handling it seems to me that there is
a small likelihood of deadlocking when we wait on other tasks
processing PM requests on the same device. Do you think
the attached patch is enough or do we need to pass the flag down
into the HCDs?

	Regards
		Oliver

--------------bYq0kwR29F3iipoRftHjoOuN
Content-Type: text/x-patch; charset=UTF-8;
 name="0001-usb-core-hcd-fix-possible-deadlock-in-rh-control-tra.patch"
Content-Disposition: attachment;
 filename*0="0001-usb-core-hcd-fix-possible-deadlock-in-rh-control-tra.pa";
 filename*1="tch"
Content-Transfer-Encoding: base64

RnJvbSA3NjdlOWFmMzcxYmY2MzQxM2YxZjdjMGIyZWNhMTViZDUyY2RjMWJiIE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQpGcm9tOiBPbGl2ZXIgTmV1a3VtIDxvbmV1a3VtQHN1c2UuY29t
PgpEYXRlOiBUdWUsIDI4IEFwciAyMDI2IDE1OjM4OjE3ICswMjAwClN1YmplY3Q6IFtQQVRD
SF0gdXNiOiBjb3JlOiBoY2Q6IGZpeCBwb3NzaWJsZSBkZWFkbG9jayBpbiByaCBjb250cm9s
IHRyYW5zZmVycwoKRnJvbSB3aXRoaW4gdGhlIFNDU0kgZXJyb3IgaGFuZGxlciBtZW1vcnkg
YWxsb2NhdGlvbnMgbXVzdCBub3QKdHJpZ2dlciBJTy4gSGFuZGxpbmcgZXJyb3JzIGluIFVB
UyBhbmQgdGhlIHN0b3JhZ2UgZHJpdmVyIG1heQppbnZvbHZlIHJlc2V0dGluZyBhIGRldmlj
ZS4gVGhlIHRocmVhZCBkb2luZyB0aGUgcmVzZXQgaXRzZWxmCnJlbGllcyBvbiBWTSBtYWdp
Yy4gSG93ZXZlciwgdGhhdCBpcyBpbnN1ZmZpY2llbnQsIGFzIHJlc2V0dGluZwphIGRldmlj
ZSBpbnZvbHZlcyByZXN1bWluZyBpdC4gUmVzdW1wdGlvbiBhcyB3ZWxsIGFzIHJlc2V0dGlu
ZwppbnZvbHZlcyBjb25yb2wgdHJhbnNmZXJzIHRvIHRoZSBwYXJlbnQgb2YgdGhlIGRldmlj
ZSB0byBiZSByZXNldC4KVGhhdCBtYXkgYmUgYSByb290IGh1Yi4gSGVuY2UgdXNiY29yZSBt
dXN0IGhlZWQgdGhlIGZsYWdzIHBhc3NlZAp0byB1c2Jfc3VibWl0X3VyYigpIHByb2Nlc3Np
bmcgY29udHJvbCB0cmFuc2ZlcnMgdG8gcm9vdCBodWJzLgoKVGhlIHByb2JsZW0gZXhpc3Qg
c2luY2UgdGhlIHN0b3JhZ2UgZHJpdmVyIGhhcyBiZWVuIG1lcmdlZC4KClNpZ25lZC1vZmYt
Ynk6IE9saXZlciBOZXVrdW0gPG9uZXVrdW1Ac3VzZS5jb20+Ci0tLQogZHJpdmVycy91c2Iv
Y29yZS9oY2QuYyB8IDEyICsrKysrKy0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDYgaW5zZXJ0
aW9ucygrKSwgNiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL3VzYi9jb3Jl
L2hjZC5jIGIvZHJpdmVycy91c2IvY29yZS9oY2QuYwppbmRleCA4OTIyMWYxY2U3NjkuLmQ5
NTAwMGM3YjMyOCAxMDA2NDQKLS0tIGEvZHJpdmVycy91c2IvY29yZS9oY2QuYworKysgYi9k
cml2ZXJzL3VzYi9jb3JlL2hjZC5jCkBAIC00NDgsNyArNDQ4LDcgQEAgcmhfc3RyaW5nKGlu
dCBpZCwgc3RydWN0IHVzYl9oY2QgY29uc3QgKmhjZCwgdTggKmRhdGEsIHVuc2lnbmVkIGxl
bikKIAogCiAvKiBSb290IGh1YiBjb250cm9sIHRyYW5zZmVycyBleGVjdXRlIHN5bmNocm9u
b3VzbHkgKi8KLXN0YXRpYyBpbnQgcmhfY2FsbF9jb250cm9sIChzdHJ1Y3QgdXNiX2hjZCAq
aGNkLCBzdHJ1Y3QgdXJiICp1cmIpCitzdGF0aWMgaW50IHJoX2NhbGxfY29udHJvbChzdHJ1
Y3QgdXNiX2hjZCAqaGNkLCBzdHJ1Y3QgdXJiICp1cmIsIGdmcF90IG1mKQogewogCXN0cnVj
dCB1c2JfY3RybHJlcXVlc3QgKmNtZDsKIAl1MTYJCXR5cGVSZXEsIHdWYWx1ZSwgd0luZGV4
LCB3TGVuZ3RoOwpAQCAtNDgzLDggKzQ4Myw4IEBAIHN0YXRpYyBpbnQgcmhfY2FsbF9jb250
cm9sIChzdHJ1Y3QgdXNiX2hjZCAqaGNkLCBzdHJ1Y3QgdXJiICp1cmIpCiAJICogdGJ1ZiBz
aG91bGQgYmUgYXQgbGVhc3QgYXMgYmlnIGFzIHRoZQogCSAqIFVTQiBodWIgZGVzY3JpcHRv
ci4KIAkgKi8KLQl0YnVmX3NpemUgPSAgbWF4X3QodTE2LCBzaXplb2Yoc3RydWN0IHVzYl9o
dWJfZGVzY3JpcHRvciksIHdMZW5ndGgpOwotCXRidWYgPSBremFsbG9jKHRidWZfc2l6ZSwg
R0ZQX0tFUk5FTCk7CisJdGJ1Zl9zaXplID0gbWF4X3QodTE2LCBzaXplb2Yoc3RydWN0IHVz
Yl9odWJfZGVzY3JpcHRvciksIHdMZW5ndGgpOworCXRidWYgPSBremFsbG9jKHRidWZfc2l6
ZSwgbWYpOwogCWlmICghdGJ1ZikgewogCQlzdGF0dXMgPSAtRU5PTUVNOwogCQlnb3RvIGVy
cl9hbGxvYzsKQEAgLTgwOSwxMiArODA5LDEyIEBAIHN0YXRpYyBpbnQgcmhfcXVldWVfc3Rh
dHVzIChzdHJ1Y3QgdXNiX2hjZCAqaGNkLCBzdHJ1Y3QgdXJiICp1cmIpCiAJcmV0dXJuIHJl
dHZhbDsKIH0KIAotc3RhdGljIGludCByaF91cmJfZW5xdWV1ZSAoc3RydWN0IHVzYl9oY2Qg
KmhjZCwgc3RydWN0IHVyYiAqdXJiKQorc3RhdGljIGludCByaF91cmJfZW5xdWV1ZShzdHJ1
Y3QgdXNiX2hjZCAqaGNkLCBzdHJ1Y3QgdXJiICp1cmIsIGdmcF90IG1mKQogewogCWlmICh1
c2JfZW5kcG9pbnRfeGZlcl9pbnQoJnVyYi0+ZXAtPmRlc2MpKQogCQlyZXR1cm4gcmhfcXVl
dWVfc3RhdHVzIChoY2QsIHVyYik7CiAJaWYgKHVzYl9lbmRwb2ludF94ZmVyX2NvbnRyb2wo
JnVyYi0+ZXAtPmRlc2MpKQotCQlyZXR1cm4gcmhfY2FsbF9jb250cm9sIChoY2QsIHVyYik7
CisJCXJldHVybiByaF9jYWxsX2NvbnRyb2woaGNkLCB1cmIsIG1mKTsKIAlyZXR1cm4gLUVJ
TlZBTDsKIH0KIApAQCAtMTUzNSw3ICsxNTM1LDcgQEAgaW50IHVzYl9oY2Rfc3VibWl0X3Vy
YiAoc3RydWN0IHVyYiAqdXJiLCBnZnBfdCBtZW1fZmxhZ3MpCiAJICovCiAKIAlpZiAoaXNf
cm9vdF9odWIodXJiLT5kZXYpKSB7Ci0JCXN0YXR1cyA9IHJoX3VyYl9lbnF1ZXVlKGhjZCwg
dXJiKTsKKwkJc3RhdHVzID0gcmhfdXJiX2VucXVldWUoaGNkLCB1cmIsIG1lbV9mbGFncyk7
CiAJfSBlbHNlIHsKIAkJc3RhdHVzID0gbWFwX3VyYl9mb3JfZG1hKGhjZCwgdXJiLCBtZW1f
ZmxhZ3MpOwogCQlpZiAobGlrZWx5KHN0YXR1cyA9PSAwKSkgewotLSAKMi41NC4wCgo=

--------------bYq0kwR29F3iipoRftHjoOuN--

