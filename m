Return-Path: <linux-usb+bounces-36805-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aCSHFEPY82nJ7wEAu9opvQ
	(envelope-from <linux-usb+bounces-36805-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Fri, 01 May 2026 00:31:31 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E37234A891A
	for <lists+linux-usb@lfdr.de>; Fri, 01 May 2026 00:31:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6D6193028ECE
	for <lists+linux-usb@lfdr.de>; Thu, 30 Apr 2026 22:31:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB23B364038;
	Thu, 30 Apr 2026 22:31:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="Ysshwl+f"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E83502DF68
	for <linux-usb@vger.kernel.org>; Thu, 30 Apr 2026 22:31:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777588281; cv=none; b=bkjc2oDINC1tkpEFP5HLqLo15lPAPUzsS+oNdZkRh1d9xx1EbjmGbTLtqk+6GmeeP5s3j16O3NW5fUgYMZ069rKbtHvx6Zo69RrsC5c4aKE5X0yaD1TYOMWrALxOVciO37l+tXJVc7TRXfEgK89epGfjGHKNi73Arp18ECXlPkw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777588281; c=relaxed/simple;
	bh=UpudR8jzrY6H57LNOMzyrNV2Q4prrwpqdHOpQlDtUwA=;
	h=Content-Type:Message-ID:Date:MIME-Version:To:Cc:From:Subject; b=ppu7ktTQYCOb5JoJznmqVw0hEXevTZwlOUIt6e+wqPfhs3WEE3vkQXjshlSOeHCVVHEomjLqHcflwIU5JKb2Fsi8j+bso9tXs/hIlFar6usclXJSRLBQN6T+kvPJpFZX3VKY8YhbPlwS8wf2tIyjhffNTnb6w0IA4EEoLBQO584=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=Ysshwl+f; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-43d734223e4so899637f8f.0
        for <linux-usb@vger.kernel.org>; Thu, 30 Apr 2026 15:31:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1777588278; x=1778193078; darn=vger.kernel.org;
        h=subject:from:cc:content-language:to:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=roaP/VSjQxjyZFJtq08el+GGZ/wB3yWLrp0XrbeyZuQ=;
        b=Ysshwl+fgNZw4XZ0wiuaqjIqkeYhDJoGqssqPMbplOq8d3TEK2hPmCbttdSqiYI6ub
         VLlUqX2mqRO/vY/GguWrh1s72ji4MRNtnjue/vfNezYiT6fTmYWkJZrmFlFvh8NQll1q
         A5Bl+UYU3mGmMhuozfHaJRQiUDsj0f+VgtT7d2mPBNTpd6M/TaYnS1erGb3SXaifYnvC
         ttB5+W0Xi97sAvByEf0Nqp2vMVMW5ZlsCqExh/HaAF28B2R/98gp64ZE8tE4HPC24FUH
         tnZC/v4LlCEcdNgNHaJVHX0ELrtAGlstwYdcBHK351mI20MLVS/G6PeEJqw/ZA5UfYTm
         LMNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777588278; x=1778193078;
        h=subject:from:cc:content-language:to:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=roaP/VSjQxjyZFJtq08el+GGZ/wB3yWLrp0XrbeyZuQ=;
        b=F+lvNyB1uMqgyeIftCBUMmeye3KIE0keNs5wQ3/CaMwUAMK6zSryXhDv7f3AnPen+j
         DGeC4LCqrukMmqKj43y98pCT7jyY3jOB59Eb6gapDUp9j5ZRN0peWbHT/aNXNfkMRN06
         rR+qpUCyni7DURz5BdUO2wFxxKHeP2C62HIQVAFQNJiomtGxm5JZG82hZ9EbshfmmVr5
         5rLnXf3aOPDV7HgsyPTsgDPP3lR5yg2qzdqEOkvbnWclG4zHJF9WjAa5NQT2m3/J1uwC
         FyXO7tJEqLm5VPNmKmERktTuVnyx75ispFJoiUkJzGTGmFiYeb/sRPSLkApUSTDViPtl
         myig==
X-Gm-Message-State: AOJu0YzvCC1rU95AiGsvoyzRAmWjAsqTutBdvJBOktYAQoUEwSF+G9DI
	sToxWmav8eHtBRyeLQ1KzDtcfYy1QxGbJz/fvR6OB5AK1NjaVCxkuXoY4j+yWw1kuynoe2liw5d
	g6js0
X-Gm-Gg: AeBDiesexl4E8SEoEvJF9hHWRrasVoFija9/u20LLMhdB7/TknT+OkrCA2RSTWQlEVa
	Lrk/UR0FE3ZDkr3iq9EXkRW27y7AqG/fBrDU5t/NFRXJVk5ZnNcg+agG/gwkWkiNCkPc/6M+Abz
	zu8OStZ2+23kM51+LZOMBFyMAuAk5/KQIIbHLUclzz8443htubGv1ePNL6E49yVQMAc8x9CwtZz
	s6negruK9elNkznEA/qL5hNlyYdY44IdSnHhDBQqF8PrXzmvlALAL7Z0tyqZ5JrgAG+3TCjkLRw
	oXqFeRHVR3daBz85c4lVmlSKpfIpN1OaM8y8ZbxsL8UBblLPavXieDB7WJMMH8wsKqWWqcpsgg3
	04/aBolf5Qxh3Sh5qRwsLHp7teUzpA7AfCoCGqR7kom/dr0zv3EGhCIF0ZrHQG5BxIJh0mthZk1
	gmIrLktbm3NLUHXRHnlCkbQz2xe1QH8ay3sZHvP0QmhsFjxkZyQXw0UzfHzs5rTG+PQzsRYloJO
	g4NDQ==
X-Received: by 2002:a5d:453b:0:b0:44a:83db:423f with SMTP id ffacd0b85a97d-44a83db4280mr499146f8f.19.1777588278350;
        Thu, 30 Apr 2026 15:31:18 -0700 (PDT)
Received: from ?IPV6:2001:a61:13b3:7c01:f1f9:97ca:8fa3:c597? ([2001:a61:13b3:7c01:f1f9:97ca:8fa3:c597])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-44a98b76eddsm695506f8f.34.2026.04.30.15.31.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Apr 2026 15:31:17 -0700 (PDT)
Content-Type: multipart/mixed; boundary="------------HQqlRmDyN0xptnG676eq70BY"
Message-ID: <9bb3ac22-b0e4-4ae3-854b-8fac8fda1003@suse.com>
Date: Fri, 1 May 2026 00:31:17 +0200
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
Subject: Clear change log now?
X-Rspamd-Queue-Id: E37234A891A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.06 / 15.00];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	SUBJECT_ENDS_QUESTION(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[multipart/mixed,text/plain,text/x-patch];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-36805-lists,linux-usb=lfdr.de];
	TO_DN_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
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
--------------HQqlRmDyN0xptnG676eq70BY
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

does this explanation why the patch is necessary clarify the issue?

	Regards
		Oliver

--------------HQqlRmDyN0xptnG676eq70BY
Content-Type: text/x-patch; charset=UTF-8;
 name="0001-usb-core-hcd-fix-possible-deadlock-in-rh-control-tra.patch"
Content-Disposition: attachment;
 filename*0="0001-usb-core-hcd-fix-possible-deadlock-in-rh-control-tra.pa";
 filename*1="tch"
Content-Transfer-Encoding: base64

RnJvbSA0Mjc5OTBhNDM1ODNmM2EwYjQ0M2YxNGVhOTJjNGZmY2RhZmJhNTc4IE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQpGcm9tOiBPbGl2ZXIgTmV1a3VtIDxvbmV1a3VtQHN1c2UuY29t
PgpEYXRlOiBUdWUsIDI4IEFwciAyMDI2IDE1OjM4OjE3ICswMjAwClN1YmplY3Q6IFtQQVRD
SF0gdXNiOiBjb3JlOiBoY2Q6IGZpeCBwb3NzaWJsZSBkZWFkbG9jayBpbiByaCBjb250cm9s
IHRyYW5zZmVycwoKRnJvbSB3aXRoaW4gdGhlIFNDU0kgZXJyb3IgaGFuZGxlciBtZW1vcnkg
YWxsb2NhdGlvbnMgbXVzdCBub3QKdHJpZ2dlciBJTy4gSGFuZGxpbmcgZXJyb3JzIGluIFVB
UyBhbmQgdGhlIHN0b3JhZ2UgZHJpdmVyIG1heQppbnZvbHZlIHJlc2V0dGluZyBhIGRldmlj
ZS4gVGhlIHRocmVhZCBkb2luZyB0aGUgcmVzZXQgaXRzZWxmCnJlbGllcyBvbiBWTSBtYWdp
YyB0byBtYWtlIHN1cmUgaXRzIG93biBhbGxvY2F0aW9ucyBkbyBub3QKdHJpZ2dlciBJTy4K
CkluIGFkZGl0aW9uIHRvIGl0cyBvd24gYWxsb2NhdGlvbnMsIGhvd2V2ZXIsIGEgdGFzayB0
aGF0CmlzIG5vdCBhbGxvd2VkIHRvIHRyaWdnZXIgSU8gbXVzdCBhbHNvIG5vdCB3YWl0IGZv
ciBvdGhlciB0YXNrcwp0aGF0IGNhbiB0cmlnZ2VyIElPLiBSZXNldHRpbmcgYSBkZXZpY2Ug
aW52b2x2ZXMgcmVzdW1pbmcKdGhlIGRldmljZS4gUmVzdW1pbmcgYSBkZXZpY2UgY2FuIHJh
Y2Ugd2l0aCBvdGhlciB0YXNrcwpkb2luZyBQTSBvcGVyYXRpb25zLiBJbiBzdWNoIGNhc2Vz
IHRoZSB0YXNrIG11c3Qgd2FpdApmb3IgdGhlIG90aGVyIHRhc2sgdG8gZmluaXNoIGl0cyBQ
TSBvcGVyYXRpb25zLiBUaGF0IHRhc2sKaXMgbm90IGJlbmVmaXR0aW5nIGZyb20gVk0gbWFn
aWMuIEhlbmNlIGl0IG5lZWRzIHRvIHVzZQpHRlBfTk9JTyB3aGlsZSBkb2luZyBQTSBvcGVy
YXRpb25zLgpUaGF0IG1lYW5zIHRoYXQgR0ZQX05PSU8gbXVzdCBiZSBoZWVkZWQgZG9pbmcg
Y29udHJvbCB0cmFuc2ZlcnMKdG8gcm9vdCBodWJzLCBiZWNhdXNlIFBNIG9wZXJhdGlvbnMg
aW52b2x2ZSBjb21tYW5kcwp0byByb290IGh1YnMsIGlmIGEgZGV2aWNlIGlzIGRpcmVjdGx5
IGF0dGFjaGVkIHRvIGEgcm9vdCBodWIuCgpTaWduZWQtb2ZmLWJ5OiBPbGl2ZXIgTmV1a3Vt
IDxvbmV1a3VtQHN1c2UuY29tPgotLS0KIGRyaXZlcnMvdXNiL2NvcmUvaGNkLmMgfCAxNCAr
KysrKysrKy0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDggaW5zZXJ0aW9ucygrKSwgNiBkZWxl
dGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL3VzYi9jb3JlL2hjZC5jIGIvZHJpdmVy
cy91c2IvY29yZS9oY2QuYwppbmRleCA4OTIyMWYxY2U3NjkuLjI5Yzc0ZWQ0MDUyNiAxMDA2
NDQKLS0tIGEvZHJpdmVycy91c2IvY29yZS9oY2QuYworKysgYi9kcml2ZXJzL3VzYi9jb3Jl
L2hjZC5jCkBAIC00NDgsNyArNDQ4LDggQEAgcmhfc3RyaW5nKGludCBpZCwgc3RydWN0IHVz
Yl9oY2QgY29uc3QgKmhjZCwgdTggKmRhdGEsIHVuc2lnbmVkIGxlbikKIAogCiAvKiBSb290
IGh1YiBjb250cm9sIHRyYW5zZmVycyBleGVjdXRlIHN5bmNocm9ub3VzbHkgKi8KLXN0YXRp
YyBpbnQgcmhfY2FsbF9jb250cm9sIChzdHJ1Y3QgdXNiX2hjZCAqaGNkLCBzdHJ1Y3QgdXJi
ICp1cmIpCitzdGF0aWMgaW50IHJoX2NhbGxfY29udHJvbChzdHJ1Y3QgdXNiX2hjZCAqaGNk
LAorCQlzdHJ1Y3QgdXJiICp1cmIsIGdmcF90IG1lbV9mbGFncykKIHsKIAlzdHJ1Y3QgdXNi
X2N0cmxyZXF1ZXN0ICpjbWQ7CiAJdTE2CQl0eXBlUmVxLCB3VmFsdWUsIHdJbmRleCwgd0xl
bmd0aDsKQEAgLTQ4Myw4ICs0ODQsOCBAQCBzdGF0aWMgaW50IHJoX2NhbGxfY29udHJvbCAo
c3RydWN0IHVzYl9oY2QgKmhjZCwgc3RydWN0IHVyYiAqdXJiKQogCSAqIHRidWYgc2hvdWxk
IGJlIGF0IGxlYXN0IGFzIGJpZyBhcyB0aGUKIAkgKiBVU0IgaHViIGRlc2NyaXB0b3IuCiAJ
ICovCi0JdGJ1Zl9zaXplID0gIG1heF90KHUxNiwgc2l6ZW9mKHN0cnVjdCB1c2JfaHViX2Rl
c2NyaXB0b3IpLCB3TGVuZ3RoKTsKLQl0YnVmID0ga3phbGxvYyh0YnVmX3NpemUsIEdGUF9L
RVJORUwpOworCXRidWZfc2l6ZSA9IG1heF90KHUxNiwgc2l6ZW9mKHN0cnVjdCB1c2JfaHVi
X2Rlc2NyaXB0b3IpLCB3TGVuZ3RoKTsKKwl0YnVmID0ga3phbGxvYyh0YnVmX3NpemUsIG1l
bV9mbGFncyk7CiAJaWYgKCF0YnVmKSB7CiAJCXN0YXR1cyA9IC1FTk9NRU07CiAJCWdvdG8g
ZXJyX2FsbG9jOwpAQCAtODA5LDEyICs4MTAsMTMgQEAgc3RhdGljIGludCByaF9xdWV1ZV9z
dGF0dXMgKHN0cnVjdCB1c2JfaGNkICpoY2QsIHN0cnVjdCB1cmIgKnVyYikKIAlyZXR1cm4g
cmV0dmFsOwogfQogCi1zdGF0aWMgaW50IHJoX3VyYl9lbnF1ZXVlIChzdHJ1Y3QgdXNiX2hj
ZCAqaGNkLCBzdHJ1Y3QgdXJiICp1cmIpCitzdGF0aWMgaW50IHJoX3VyYl9lbnF1ZXVlKHN0
cnVjdCB1c2JfaGNkICpoY2QsCisJCXN0cnVjdCB1cmIgKnVyYiwgZ2ZwX3QgbWVtX2ZsYWdz
KQogewogCWlmICh1c2JfZW5kcG9pbnRfeGZlcl9pbnQoJnVyYi0+ZXAtPmRlc2MpKQogCQly
ZXR1cm4gcmhfcXVldWVfc3RhdHVzIChoY2QsIHVyYik7CiAJaWYgKHVzYl9lbmRwb2ludF94
ZmVyX2NvbnRyb2woJnVyYi0+ZXAtPmRlc2MpKQotCQlyZXR1cm4gcmhfY2FsbF9jb250cm9s
IChoY2QsIHVyYik7CisJCXJldHVybiByaF9jYWxsX2NvbnRyb2woaGNkLCB1cmIsIG1lbV9m
bGFncyk7CiAJcmV0dXJuIC1FSU5WQUw7CiB9CiAKQEAgLTE1MzUsNyArMTUzNyw3IEBAIGlu
dCB1c2JfaGNkX3N1Ym1pdF91cmIgKHN0cnVjdCB1cmIgKnVyYiwgZ2ZwX3QgbWVtX2ZsYWdz
KQogCSAqLwogCiAJaWYgKGlzX3Jvb3RfaHViKHVyYi0+ZGV2KSkgewotCQlzdGF0dXMgPSBy
aF91cmJfZW5xdWV1ZShoY2QsIHVyYik7CisJCXN0YXR1cyA9IHJoX3VyYl9lbnF1ZXVlKGhj
ZCwgdXJiLCBtZW1fZmxhZ3MpOwogCX0gZWxzZSB7CiAJCXN0YXR1cyA9IG1hcF91cmJfZm9y
X2RtYShoY2QsIHVyYiwgbWVtX2ZsYWdzKTsKIAkJaWYgKGxpa2VseShzdGF0dXMgPT0gMCkp
IHsKLS0gCjIuNTQuMAoK

--------------HQqlRmDyN0xptnG676eq70BY--

