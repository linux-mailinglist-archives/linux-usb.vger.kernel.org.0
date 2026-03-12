Return-Path: <linux-usb+bounces-34692-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UJgKA6XjsmnyQgAAu9opvQ
	(envelope-from <linux-usb+bounces-34692-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 12 Mar 2026 17:02:45 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 37AE72751E0
	for <lists+linux-usb@lfdr.de>; Thu, 12 Mar 2026 17:02:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 3C8C73046222
	for <lists+linux-usb@lfdr.de>; Thu, 12 Mar 2026 15:59:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E719F3F165E;
	Thu, 12 Mar 2026 15:57:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="TsL2Ol35"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9D013F20FD
	for <linux-usb@vger.kernel.org>; Thu, 12 Mar 2026 15:57:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773331048; cv=none; b=qhV00Al45gYM72VUUI/eMrdbWWQHs7zQj879u2IFQp+saMaJeEkfjZtXQ0CmPnfc149CnDnEcqkU43/3QS074OWiqfWkamW+sQ5H4J2s5mdcMKqHpNsNrz7tg7mnNLWX2nuLyISUKzQ430frUXdzFrTlshdMsbeIRY9CWxLqzkE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773331048; c=relaxed/simple;
	bh=XBD0OuxwzIMl7iLrmWV1aLrAwjvbu+uBC6CY5dkGSfc=;
	h=Content-Type:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To; b=aNeMmjdL826RTj5/R1n9UX4Gw7ecS1SjMOp8Acl5/hJnoy52W5cnWPH6N7TzXNP2XQIXqDUOsby+9Q0rXAHhSBalJ/jl30P6dTl2AwVOLEjDfmgIeBPaUP+LC+2qhq9DfrzuqBiuiUShFMxL125eSdtf4MQFs1M4zIi7GbDYchw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=TsL2Ol35; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-48534e9076fso10264605e9.0
        for <linux-usb@vger.kernel.org>; Thu, 12 Mar 2026 08:57:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1773331045; x=1773935845; darn=vger.kernel.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ni605gMwQZI0HMUoYpv6rP4PZlw7NyzUBTWnmqTauDI=;
        b=TsL2Ol353lwuNzawxhz07pvtL1zlsdx8VK8hvZzCVFsd+jC+g4CgoyuRU6OCjSxKFt
         dVOCkidvP4hlXnJQTRj//68U67RIQokK08McYOIaP8jcoaMWmL76396/QCZZAb8AOeXW
         fM4iuL0BIY/+3C7HFoG2kJi+pHV5wNWBWaJ8xYXcHQkfZiqGAqjWqCXSVPZNYNrZ8N8Q
         Np3j+gDDe+/jgZ21z1cQE1wMNMJtvG/weVczGKSCrlMcUQsKfroceKI3nrv7ACM315JT
         X9RnbUWN6U99F/OIkRndaMqrTWGsGpxJErWMzIm6snLJBDWGnhzJD6eVgA2GZIpplagg
         Y4Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773331045; x=1773935845;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ni605gMwQZI0HMUoYpv6rP4PZlw7NyzUBTWnmqTauDI=;
        b=LsbByxzoBnFYxqLOcQJzEZu2Q+oZJU9Gixoy1HnT8r4LPMwEUxUuiA7rtqerN5wxJ6
         rP/vjb+uOopNimvONGm4ziW1AljIWTbnvQ++GawTii8dU+1/sxMnctEwaHCcZHTkHkh/
         KDTpv5I6CpHGLYimzsqdrFkxiH4j9jZhuYcf1Zz2k7vknA9P7F/xt5mPU5jZxtcaOI3F
         ohfWs0of9VxBGWK5NfVJkdUI4+ER1qDyn5dKi+/I+MVJuQhBky6fmbF+yKw31tHo4PR1
         wxfY8P7jBEQQDMGyi1nsDwqftaHeVGEfq62Jvr2tdIo+h//41RwuOPrvzkKUFUxRsmfl
         IJ3g==
X-Forwarded-Encrypted: i=1; AJvYcCXOVP9Zq99rYlev4VEi883ewRBqZujWIFQjOb5mgBCpJUGVtjgrSFi15mze75RUFgRuATwvOG0W4z4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8z9KqbCEB5Q6yOaaeXXxG4zp+RKp0GUzBu876GlIbyuuAid/J
	pWUvxtRWS/Rvsk83Z567uW8WnDrI6fTzbKoWEVlA4Ogh8VLpm5GnawvWsnn95mF7U4A=
X-Gm-Gg: ATEYQzzRQuP9C8z6mQt2T4hoFgpcEFPKJrx1Ysu+3qrKRLDqcVmQnDX9gMAjUMwiVQ1
	oZ50PD3Hwpdp8BhKAoVY9ASftJYgfTFUJ3l1KcfkE+0nJZlVtuou2wvOAlvJtkmRNIfVKYv63aK
	0HwYS8TuNrKLhFrbb8WqCeHlgbQXReJQsap55RWHLAaAvR+Rqv7pCrYqUeOpNGLUMEu5Sm5NtiW
	c0JX/R+dzjH8K+60JP1ntx3oTQ7LvJ4yniJraHs9xU1ZvlKw3Xmy7jxpW2q6nBmWUNaG2BmCRwF
	VsVPqJhuaXt+ZSNhm4e8yVNlAW4wchJlTi79Rwm6vDsjHNkVMoN3/K05B98ED/7X3WPHz/XnsVK
	wUiBD9W8NkpDwOtuXnYUu8nS8I5+uMfPFSto2ggVvPBuTTi3yIZmP870FTH4AHdQxGqHQ3XmWTR
	5bOsAoYy/otRkeisNvpL1vVyTQ48kfjcFfpirfQoJQeNpz+jn9DXuw9iPsL91e15MfiEo=
X-Received: by 2002:a05:600c:444e:b0:485:3bb5:92c5 with SMTP id 5b1f17b1804b1-4854b0c779dmr109717975e9.14.1773331044988;
        Thu, 12 Mar 2026 08:57:24 -0700 (PDT)
Received: from ?IPV6:2001:a61:13b5:4001:781c:5386:18e2:cda0? ([2001:a61:13b5:4001:781c:5386:18e2:cda0])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4854b65fd3dsm143522355e9.10.2026.03.12.08.57.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Mar 2026 08:57:24 -0700 (PDT)
Content-Type: multipart/mixed; boundary="------------1Us7OPef2Ot1hlSdK39IFswX"
Message-ID: <64dc9c5d-d662-41e3-898f-71587b940a2c@suse.com>
Date: Thu, 12 Mar 2026 16:57:18 +0100
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: correctly handling EPROTO
To: Alan Stern <stern@rowland.harvard.edu>, Oliver Neukum <oneukum@suse.com>
Cc: =?UTF-8?Q?Bj=C3=B8rn_Mork?= <bjorn@mork.no>,
 USB list <linux-usb@vger.kernel.org>
References: <261996a8-7ad4-4df2-a469-f6602da71255@suse.com>
 <4f85311c-bdfe-46a4-a310-4a74a3c56b3e@rowland.harvard.edu>
Content-Language: en-US
From: Oliver Neukum <oneukum@suse.com>
In-Reply-To: <4f85311c-bdfe-46a4-a310-4a74a3c56b3e@rowland.harvard.edu>
X-Spamd-Result: default: False [-1.06 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[multipart/mixed,text/plain,text/x-patch];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34692-lists,linux-usb=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_ALL(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCPT_COUNT_THREE(0.00)[4];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[oneukum@suse.com,linux-usb@vger.kernel.org];
	HAS_ATTACHMENT(0.00)[];
	NEURAL_HAM(-0.00)[-0.886];
	TAGGED_RCPT(0.00)[linux-usb];
	MID_RHS_MATCH_FROM(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,suse.com:dkim,suse.com:email,suse.com:mid]
X-Rspamd-Queue-Id: 37AE72751E0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This is a multi-part message in MIME format.
--------------1Us7OPef2Ot1hlSdK39IFswX
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12.03.26 15:21, Alan Stern wrote:
  
> There's a discussion about the same issue here:
> 
> 	https://bugzilla.kernel.org/show_bug.cgi?id=221184
> 
> See especially the later parts, starting with comment #28.

Well, that is fascinating, but not necessarily in a comfortable
way. It seems to me that for all drivers to care about the
exact details of getting which toggle back into sync is not
a viable strategy. This I'd say, when in doubt, clear a halt.

	Regards
		Oliver

--------------1Us7OPef2Ot1hlSdK39IFswX
Content-Type: text/x-patch; charset=UTF-8;
 name="0001-usb-class-cdc-wdm-handle-EPROTO-on-interrupt-endpoin.patch"
Content-Disposition: attachment;
 filename*0="0001-usb-class-cdc-wdm-handle-EPROTO-on-interrupt-endpoin.pa";
 filename*1="tch"
Content-Transfer-Encoding: base64

RnJvbSBmYzdhNjczYzc4MGU4ZWFmMDhhNTI5OTM4ZTcwYWQwMGE5ZWRkN2IzIE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQpGcm9tOiBPbGl2ZXIgTmV1a3VtIDxvbmV1a3VtQHN1c2UuY29t
PgpEYXRlOiBUaHUsIDEyIE1hciAyMDI2IDEyOjI5OjIzICswMTAwClN1YmplY3Q6IFtQQVRD
SF0gdXNiOiBjbGFzczogY2RjLXdkbSBoYW5kbGUgRVBST1RPIG9uIGludGVycnVwdCBlbmRw
b2ludAoKVW5kZXIgc29tZSBjb25kaXRpb25zIC1FUFJPVE8gcmVxdWlyZXMgYSBoYWx0IHRv
IGJlIGNsZWFyZWQuClRoaXMgaXMgdG9vIGNvbXBsaWNhdGVkIHRvIGdldCBvcHRpbWFsLiBX
ZSBzaG91bGQgbm90IGV2ZW4KdHJ5LiBIZW5jZSB0aGUgc2FuZSBzdHJhdGVneSBpcyB0byBj
bGVhciBhIGhhbHQgb24KLUVQUk9UTyBhbmQgZGlyZWN0bHkgcmV0cnkgZm9yIGV2ZXJ5dGhp
bmcgYnV0IGEga25vd24KZGlzY29ubmVjdC4KClNpZ25lZC1vZmYtYnk6IE9saXZlciBOZXVr
dW0gPG9uZXVrdW1Ac3VzZS5jb20+CgplcHJvdG8KLS0tCiBkcml2ZXJzL3VzYi9jbGFzcy9j
ZGMtd2RtLmMgfCAzICsrLQogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMSBk
ZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvdXNiL2NsYXNzL2NkYy13ZG0uYyBi
L2RyaXZlcnMvdXNiL2NsYXNzL2NkYy13ZG0uYwppbmRleCA5MTg1Mjk1ZjUzNzYuLmNmYjMx
YTgxNDVmZiAxMDA2NDQKLS0tIGEvZHJpdmVycy91c2IvY2xhc3MvY2RjLXdkbS5jCisrKyBi
L2RyaXZlcnMvdXNiL2NsYXNzL2NkYy13ZG0uYwpAQCAtMjY1LDEzICsyNjUsMTQgQEAgc3Rh
dGljIHZvaWQgd2RtX2ludF9jYWxsYmFjayhzdHJ1Y3QgdXJiICp1cmIpCiAJCWNhc2UgLUVD
T05OUkVTRVQ6CiAJCQlyZXR1cm47IC8qIHVucGx1ZyAqLwogCQljYXNlIC1FUElQRToKKwkJ
Y2FzZSAtRVBST1RPOgogCQkJc2V0X2JpdChXRE1fSU5UX1NUQUxMLCAmZGVzYy0+ZmxhZ3Mp
OwogCQkJZGV2X2VycigmZGVzYy0+aW50Zi0+ZGV2LCAiU3RhbGwgb24gaW50IGVuZHBvaW50
XG4iKTsKIAkJCWdvdG8gc3c7IC8qIGhhbHQgaXMgY2xlYXJlZCBpbiB3b3JrICovCiAJCWRl
ZmF1bHQ6CiAJCQlkZXZfZXJyX3JhdGVsaW1pdGVkKCZkZXNjLT5pbnRmLT5kZXYsCiAJCQkJ
Im5vbnplcm8gdXJiIHN0YXR1cyByZWNlaXZlZDogJWRcbiIsIHN0YXR1cyk7Ci0JCQlicmVh
azsKKwkJCWdvdG8gZXhpdDsKIAkJfQogCX0KIAotLSAKMi41My4wCgo=

--------------1Us7OPef2Ot1hlSdK39IFswX--

