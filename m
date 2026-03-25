Return-Path: <linux-usb+bounces-35459-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KFQiNF7sw2kAvAQAu9opvQ
	(envelope-from <linux-usb+bounces-35459-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 25 Mar 2026 15:08:30 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B7C3326741
	for <lists+linux-usb@lfdr.de>; Wed, 25 Mar 2026 15:08:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id EC552300F131
	for <lists+linux-usb@lfdr.de>; Wed, 25 Mar 2026 14:00:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3CDCF24BD03;
	Wed, 25 Mar 2026 14:00:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="dFtThF1d"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F2EB3DD519
	for <linux-usb@vger.kernel.org>; Wed, 25 Mar 2026 14:00:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774447249; cv=none; b=fY9ThAa162YHkqVjpHku+pTkFPgzE1HEZNGe9tD4rQJKadIUJH1LuUqQXJiINrGetyiQki1UD+eJEilwUSW8oRjmWU7Fd7ErRcBWvghbLKbP9Mdwr+bD4gAWU65wr4AkzGcRdXOS/AclfAqvqIMOq7bPK64kT0rmON2bvWrX0nk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774447249; c=relaxed/simple;
	bh=wD5djbrAZKzdxGofv+9B6Ni1wJjXvGlUbq4ztc73xmI=;
	h=Content-Type:Message-ID:Date:MIME-Version:To:Cc:From:Subject; b=i1WfNACdj7XRz9S5+dtO80bizHNpLd/OxktbW3aXtFr3jEM/h1gySfQpVUzYhuS/pbW6BvPqjH8OzT68JgRnY1gwTVK3Sw0ow3pwiq7uPY2sP1xnxCYuXrrRWPRo1z5s5xKNYBsrgJ0VEWatspO49FWGpEh2Pktc7OiYpZJZ7kg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=dFtThF1d; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-43b45bb7548so4589260f8f.1
        for <linux-usb@vger.kernel.org>; Wed, 25 Mar 2026 07:00:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1774447243; x=1775052043; darn=vger.kernel.org;
        h=subject:from:cc:to:content-language:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=FKR0jLA7z/lusCicN782gS+wwmHb2gHV2cxgy5RPnyE=;
        b=dFtThF1dhXjw0Ebvb16PSd1ENr23RK8xYHKelwlT9yixZhS6ZRETMxfom4ldMZAS1U
         Pm2lyQTvVJflvAQfJV/7PP9Vd7Gyv2q6eVxohGjeyxt9MY7bl0cupgJ1+ucWMKOar3he
         aojbS8ghXJe1iFBAG4ULMGO0CnKkMoNAsq4XfzT97vsYd3Kpg/ytFawVqWgc35yrVIHO
         XEeCVxxQK5zZ9+Pq0rNX+yoKztsvZBnTkN2oJJD9NBZMnyaUJYbEjXS9rczrzR5LcGBs
         t8FOyIolqcN9xrNNvfchqUi1n9aoy4CuDLXHAAD4lVjtatZK5yfwMvLMg1zWnpOUBI8f
         vKaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774447243; x=1775052043;
        h=subject:from:cc:to:content-language:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FKR0jLA7z/lusCicN782gS+wwmHb2gHV2cxgy5RPnyE=;
        b=HSbhaQevgp+gGKGeNMX7oFT+BcSd6ECP83Rbo3aw6KwTiYlH4YvCzIdj3Gf6mMVmao
         Ra61JEmO7M4JgPxWDGypyHEEUHqr+OYPszcLnpuMECvrzSgN+2WhYfHfJCSDuAN9bgHi
         dKqTGlvpk8jTUErzNNvNqEzOwXd/UHLp1jS3aywjyincjyA9TERFCve8X5fc46aWXeGT
         Lwv8iuXDA4F5a/hIqm+vLt7Zf/b9BjyNWv0eRn6WUrpt+ZuC+mySf7COGxp/7AtmUa3M
         h5e7rgg9AFYuIBjgWcXwo25hHx7uAC08At73B1QX7L6GmOs6sU3rrGc78dHRldeTQFAL
         yXvA==
X-Forwarded-Encrypted: i=1; AJvYcCUn5ZDEjhx3gKD5W3UtbxNlRkvYzowmeesEIw30VapGhXL0U+oLRkNa+XxWZ9Yes+Qog+bZkJzkz8Y=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7xEPxWhel1KEI9TiIMtIvnPe+qJuncEmgQR9HsVIkuZBK/DY+
	0QoYzylOsMzDtTJ6uAKFBOpTLtc+bfmGt9SZJUFf18j/G+Ufd6nx/Dha1isKqf20sDY=
X-Gm-Gg: ATEYQzzZWal3k7pAY46d9TFqPSmPTF81S7HQBp8EzxgExrMvnDdBOMxvmv+nJlITnNh
	T9DiSenKk/BFPR7DaXGBB+HYZLvPM2Xn7cZQVHNR3E63VSvhJ3SucdWI82jkfJ6++VxV6Fr7NLN
	zb1noiRthHxwEcwqEMSVh/HmSnlSGQVpwPj+vHyJIvPWvKCpczCGenRZ8t6lTxkoHV5vEdeio8I
	3jJ70TI8IYLTryaGcjuvCoX5zf54ull263n/qLEsOsija0SX6cNIyTVUVVUGTAFH3mGGZOB7GXD
	6nDJhqbr+8up8FKU4ldW8VSTdJpQZYqC6cyeHe/25KcymyKAfoHuDQUb+8c7NgdOTLWckAWO1BE
	TVOpFEbkgnETS6rGrNj+ojnEa4XJY+5PJeusyTXc/25lLgUvYx/irxFeXFH5LSvcxuVcbxdeyoB
	JDGih6LJWta0mSVhWHmx86TGRf7wiPVQhvmem6P2tLUp6g6jGVZcrgGrv/uP1ASA0RH8I=
X-Received: by 2002:a5d:64e4:0:b0:43b:62fa:e3f0 with SMTP id ffacd0b85a97d-43b88a412demr5193554f8f.48.1774447240632;
        Wed, 25 Mar 2026 07:00:40 -0700 (PDT)
Received: from ?IPV6:2001:a61:133b:9b01:43bc:b3f1:9314:a074? ([2001:a61:133b:9b01:43bc:b3f1:9314:a074])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b919588e6sm26962f8f.16.2026.03.25.07.00.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Mar 2026 07:00:40 -0700 (PDT)
Content-Type: multipart/mixed; boundary="------------1yEP53Q3CfXksYtD5PrZk6EE"
Message-ID: <59b2c482-06b4-48e6-addc-ba585b580006@suse.com>
Date: Wed, 25 Mar 2026 15:00:32 +0100
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Martin Kepplinger <martink@posteo.de>
Cc: "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
 USB list <linux-usb@vger.kernel.org>
From: Oliver Neukum <oneukum@suse.com>
Subject: regarding runtime PM in pegasus_notetaker
X-Spamd-Result: default: False [-1.06 / 15.00];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[multipart/mixed,text/plain,text/x-patch];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-35459-lists,linux-usb=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	RCPT_COUNT_THREE(0.00)[3];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[oneukum@suse.com,linux-usb@vger.kernel.org];
	HAS_ATTACHMENT(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,suse.com:dkim,suse.com:email,suse.com:mid]
X-Rspamd-Queue-Id: 6B7C3326741
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This is a multi-part message in MIME format.
--------------1yEP53Q3CfXksYtD5PrZk6EE
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

the driver takes a PM reference in open(), yet it marks
the device busy in pegasus_irq(). These approaches contradict
each other. There is no point in marking a device as busy
while its PM count is elevated. It will not be runtime suspended
anyway.

Did you mean for the device to be subjected to runtime PM
while in use? If so, could you test the attached patch?

	Regards
		Oliver

--------------1yEP53Q3CfXksYtD5PrZk6EE
Content-Type: text/x-patch; charset=UTF-8;
 name="0001-hid-pegasus_notetaker-runtime-PM-while-open.patch"
Content-Disposition: attachment;
 filename="0001-hid-pegasus_notetaker-runtime-PM-while-open.patch"
Content-Transfer-Encoding: base64

RnJvbSA2MmU4ZmFmNTA5ZTJhZDQ2NGIzOWI2YmY3YmMzMjRkNmQ5M2M1MGQ1IE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQpGcm9tOiBPbGl2ZXIgTmV1a3VtIDxvbmV1a3VtQHN1c2UuY29t
PgpEYXRlOiBXZWQsIDI1IE1hciAyMDI2IDE0OjU4OjMyICswMTAwClN1YmplY3Q6IFtQQVRD
SF0gaGlkOiBwZWdhc3VzX25vdGV0YWtlcjogcnVudGltZSBQTSB3aGlsZSBvcGVuCgpUaGlz
IGltcGxlbWVudHMgcnVudGltZSBQTSB3aGlsZSB0aGUgZGV2aWNlIGlzIG9wZW4KYnkgZHJv
cHBpbmcgdGhlIHJlZmVyZW5jZSBpbiBvcGVuIGFuZCB1c2luZyByZW1vdGUKd2FrZXVwLgoK
U2lnbmVkLW9mZi1ieTogT2xpdmVyIE5ldWt1bSA8b25ldWt1bUBzdXNlLmNvbT4KLS0tCiBk
cml2ZXJzL2lucHV0L3RhYmxldC9wZWdhc3VzX25vdGV0YWtlci5jIHwgMjUgKysrKysrKysr
KysrKysrLS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMTYgaW5zZXJ0aW9ucygrKSwgOSBk
ZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2lucHV0L3RhYmxldC9wZWdhc3Vz
X25vdGV0YWtlci5jIGIvZHJpdmVycy9pbnB1dC90YWJsZXQvcGVnYXN1c19ub3RldGFrZXIu
YwppbmRleCA0Y2UyMGJlZmM2NTcuLjNhODQ5M2VkNWU0NCAxMDA2NDQKLS0tIGEvZHJpdmVy
cy9pbnB1dC90YWJsZXQvcGVnYXN1c19ub3RldGFrZXIuYworKysgYi9kcml2ZXJzL2lucHV0
L3RhYmxldC9wZWdhc3VzX25vdGV0YWtlci5jCkBAIC0yMTEsMTAgKzIxMSwyMSBAQCBzdGF0
aWMgdm9pZCBwZWdhc3VzX2luaXQoc3RydWN0IHdvcmtfc3RydWN0ICp3b3JrKQogCXN0cnVj
dCBwZWdhc3VzICpwZWdhc3VzID0gY29udGFpbmVyX29mKHdvcmssIHN0cnVjdCBwZWdhc3Vz
LCBpbml0KTsKIAlpbnQgZXJyb3I7CiAKKwllcnJvciA9IHVzYl9hdXRvcG1fZ2V0X2ludGVy
ZmFjZShwZWdhc3VzLT5pbnRmKTsKKwlpZiAoZXJyb3IpCisJCWdvdG8gYmFpbDsKIAllcnJv
ciA9IHBlZ2FzdXNfc2V0X21vZGUocGVnYXN1cywgUEVOX01PREVfWFksIE5PVEVUQUtFUl9M
RURfTU9VU0UpOwogCWlmIChlcnJvcikKLQkJZGV2X2VycigmcGVnYXN1cy0+dXNiZGV2LT5k
ZXYsICJwZWdhc3VzX3NldF9tb2RlIGVycm9yOiAlZFxuIiwKLQkJCWVycm9yKTsKKwkJZ290
byBiYWlsX3BtOworCisJdXNiX2F1dG9wbV9wdXRfaW50ZXJmYWNlKHBlZ2FzdXMtPmludGYp
OworCXJldHVybjsKKworYmFpbF9wbToKKwl1c2JfYXV0b3BtX3B1dF9pbnRlcmZhY2UocGVn
YXN1cy0+aW50Zik7CitiYWlsOgorCWRldl9lcnIoJnBlZ2FzdXMtPnVzYmRldi0+ZGV2LCAi
cGVnYXN1c19zZXRfbW9kZSBlcnJvcjogJWRcbiIsCisJCWVycm9yKTsKIH0KIAogc3RhdGlj
IGludCBfX3BlZ2FzdXNfb3BlbihzdHJ1Y3QgcGVnYXN1cyAqcGVnYXN1cykKQEAgLTI0OSwx
MiArMjYwLDEwIEBAIHN0YXRpYyBpbnQgcGVnYXN1c19vcGVuKHN0cnVjdCBpbnB1dF9kZXYg
KmRldikKIAkJcmV0dXJuIGVycm9yOwogCiAJZXJyb3IgPSBfX3BlZ2FzdXNfb3BlbihwZWdh
c3VzKTsKLQlpZiAoZXJyb3IpIHsKLQkJdXNiX2F1dG9wbV9wdXRfaW50ZXJmYWNlKHBlZ2Fz
dXMtPmludGYpOwotCQlyZXR1cm4gZXJyb3I7Ci0JfQorCXBlZ2FzdXMtPmludGYtPm5lZWRz
X3JlbW90ZV93YWtldXAgPSAxOworCXVzYl9hdXRvcG1fcHV0X2ludGVyZmFjZShwZWdhc3Vz
LT5pbnRmKTsKIAotCXJldHVybiAwOworCXJldHVybiBlcnJvcjsKIH0KIAogc3RhdGljIHZv
aWQgcGVnYXN1c19jbG9zZShzdHJ1Y3QgaW5wdXRfZGV2ICpkZXYpCkBAIC0yNjcsOCArMjc2
LDYgQEAgc3RhdGljIHZvaWQgcGVnYXN1c19jbG9zZShzdHJ1Y3QgaW5wdXRfZGV2ICpkZXYp
CiAKIAkJcGVnYXN1cy0+aXNfb3BlbiA9IGZhbHNlOwogCX0KLQotCXVzYl9hdXRvcG1fcHV0
X2ludGVyZmFjZShwZWdhc3VzLT5pbnRmKTsKIH0KIAogc3RhdGljIGludCBwZWdhc3VzX3By
b2JlKHN0cnVjdCB1c2JfaW50ZXJmYWNlICppbnRmLAotLSAKMi41My4wCgo=

--------------1yEP53Q3CfXksYtD5PrZk6EE--

