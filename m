Return-Path: <linux-usb+bounces-34686-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OPFWL73GsmmvPAAAu9opvQ
	(envelope-from <linux-usb+bounces-34686-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 12 Mar 2026 14:59:25 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E8DE7273039
	for <lists+linux-usb@lfdr.de>; Thu, 12 Mar 2026 14:59:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 1E5843042687
	for <lists+linux-usb@lfdr.de>; Thu, 12 Mar 2026 13:56:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3795334A771;
	Thu, 12 Mar 2026 13:55:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="TECEkn3/"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A15C356A0D
	for <linux-usb@vger.kernel.org>; Thu, 12 Mar 2026 13:55:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773323757; cv=none; b=dqPJe+DWhbZr+o9KIl2coRaWjz8Co1G+iBbd7suPhc3AdSbe57Hoio+bo6Rc373MJ6Ha1Zn9iOqJxdS7++0TuIIDQg5wWhc6WWhc8xmLioBpY7u3BT68X09fNqSkjd9x0nfd8W/WSe24Q2egw3nfzepOBLKAOJ8h4fqpAd8HIHw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773323757; c=relaxed/simple;
	bh=jiJ5K1GrkbKrm0dg4OwhK+jrfwhUt7/zK3u5sGP5gkg=;
	h=Content-Type:Message-ID:Date:MIME-Version:To:Cc:From:Subject; b=GLjU52++GNgfs4pxgaFq6JhPZODjiYOyKIE8b6RYOeeKwVJeoSqfxLDh3x2PUBKrYbFeKdocfKm9fkRIcBCDy/fv+19UVckAW7rkAHxWWMP5YHo0UvsMiPqrSiyNF9M0+PT8RoaMzCmtpEa4Sk9GyJkmbLpQWJCzHT8qsfv3UU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=TECEkn3/; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4852f73d0a3so9783425e9.3
        for <linux-usb@vger.kernel.org>; Thu, 12 Mar 2026 06:55:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1773323754; x=1773928554; darn=vger.kernel.org;
        h=subject:from:cc:to:content-language:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=FYIgue5vOTpk/VhE+0OdhsRUaHFWy6O7UNT6rpalMsM=;
        b=TECEkn3/ayC3deFph0WpkcPdxFSl5R4gucQzk4VwaoRPCB10nbxydM8ZNYRefy3mkq
         ReecLP8yaJDmDSAeIcE70crF4+3TfXmueMDYGf58WwNEsDzVpa7/lN7nLXULVIaVdB2s
         n6fU2JdTHyduERRpean5m6dsFvkvy4Yu/9MvrAaN27IzdqqGJ/ZVYEHU6tRtfxgM8BZ6
         h49WTIstL0r9v6hdbDu6FWKVS2v+XIfZqYCcX8ETfIiaCmcB0tbdqGN0ejlCgkyWjJ02
         tVpuN4SLwxKJCeFAOh1OogB0RQSCpoUOJ4NDOHZFQvufpot55m+9h6UwFi3veR7N5W3I
         /OGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773323754; x=1773928554;
        h=subject:from:cc:to:content-language:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FYIgue5vOTpk/VhE+0OdhsRUaHFWy6O7UNT6rpalMsM=;
        b=mXGynSioqvtI7plmAwoSA7UpUKjZwb44Rzmk+p/ksbmKmK6Z1ryfchnBktTVSBQExh
         sh69pOGDdvdbn0k39aMeAASyNnwmv0vGDR8DnN8kheN3wQGs9O6oDyvmp58yFl7Rst/P
         H5svE6Sz41PvYwIuMkeikQTZdJxToIAFpx8f1lXzyLWK0B5nXMHxGtxjxz8hkl0vyPgE
         5cFonEx+9UXd2zmnqy07P8ztXAsEkT0gvIvWOOn5vgdEQTkIBd/U2EuJdo0/DLNJw3TE
         VOCRd0xeR8392GFhhHoBt4OjgoDq8RlTb05jKyb/IGoc58ZCm+L/+Sxcf92GgRvZaJWD
         85fA==
X-Forwarded-Encrypted: i=1; AJvYcCUPo9FgQ8htP2LvBM8mUwAxaBw3i+Z5ZIFDrbHsNUeKZgi+GsWf2JXYEZLVKGPYNiyrBidhdMlX0ts=@vger.kernel.org
X-Gm-Message-State: AOJu0YwS/PQ15FPpsQjf0bYajVk82QTI5DBBFq+kNyz3qkCQLZ31p//8
	kxIHZad/mVkXXz0CkuZe6/4jjRYnGLQmu0GT6nu4ZXim88jtuDBJ3rEsWMfDqflElST2/QChpuW
	5wGGC
X-Gm-Gg: ATEYQzweSH8Dz7lCFsPqcUpQ28JFqsKGhF8Xmp+0/MOoMyIvECywVTjgj7Kecmlqcfx
	AGGa2r3kBG8XQlLxK3AHUiQUSCxcEMREJbN5yHiyoP/NHCyoVyJ1uZaP4M2o3HxvauACiLBm2vS
	ACiTgwNtyka3UyVu2zcqywvwYVmHDVgW89EY7qjk6OKFs0b1U/AQLQcYLMEKRuGgBVZQcbPqMAw
	LzG+78fdTyofXPwSH55muAxUXGiMNDxIkftO4OotuHtnlr96Bfpq0qy8PgWZ77ucjIs7Ea2p/yP
	+yx1MTElMl1vZT8+no/SS9iCZdYv/uMHPPJc+mAXtHLbHk0t+47pM1pXleYuwAIqXzw3Q4STjpt
	VRjqIBqJVjeF8T3WQu4n7ber+HYMWDvxATHOSysY9ag7UxzHCysRb2ZeigYhg0nyvksZzwqhiRH
	q5X1OKY/fFNOHY1e75n8iyyPRRxw95P3hveEuTCqCgbJpUshQj9FMVcfvsH0z4LYLgMIB6w8Gul
	EAPMA==
X-Received: by 2002:a05:600c:1d06:b0:485:3eba:ab96 with SMTP id 5b1f17b1804b1-4854b0acca6mr96365905e9.3.1773323754437;
        Thu, 12 Mar 2026 06:55:54 -0700 (PDT)
Received: from ?IPV6:2001:a61:13b5:4001:781c:5386:18e2:cda0? ([2001:a61:13b5:4001:781c:5386:18e2:cda0])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48541aba60esm264053855e9.5.2026.03.12.06.55.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Mar 2026 06:55:54 -0700 (PDT)
Content-Type: multipart/mixed; boundary="------------S8umGV2860PBvl0ev8K1KStv"
Message-ID: <261996a8-7ad4-4df2-a469-f6602da71255@suse.com>
Date: Thu, 12 Mar 2026 14:55:48 +0100
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: =?UTF-8?Q?Bj=C3=B8rn_Mork?= <bjorn@mork.no>
Cc: Alan Stern <stern@rowland.harvard.edu>,
 USB list <linux-usb@vger.kernel.org>
From: Oliver Neukum <oneukum@suse.com>
Subject: correctly handling EPROTO
X-Spamd-Result: default: False [-1.06 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[multipart/mixed,text/plain,text/x-patch];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34686-lists,linux-usb=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_ALL(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCPT_COUNT_THREE(0.00)[3];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[oneukum@suse.com,linux-usb@vger.kernel.org];
	HAS_ATTACHMENT(0.00)[];
	NEURAL_HAM(-0.00)[-0.988];
	TAGGED_RCPT(0.00)[linux-usb];
	MID_RHS_MATCH_FROM(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,suse.com:dkim,suse.com:email,suse.com:mid]
X-Rspamd-Queue-Id: E8DE7273039
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This is a multi-part message in MIME format.
--------------S8umGV2860PBvl0ev8K1KStv
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

as we just discussed an HID device which tends to report
-EPROTO from time to time, the question what a driver is
to do when it gets -EPROTO.
Do we just retry? I am not really happy with that, as we
may very well get into a livelock. Nevertheless I think
we cannot just assume that -EPROTO is not recoverable.

Do we need to do something drastic like generalizing
the backoff logic from usbhid?

What do you think?

	Regards
		Oliver

--------------S8umGV2860PBvl0ev8K1KStv
Content-Type: text/x-patch; charset=UTF-8;
 name="0001-usb-class-cdc-wdm-handle-EPROTO-on-interrupt-endpoin.patch"
Content-Disposition: attachment;
 filename*0="0001-usb-class-cdc-wdm-handle-EPROTO-on-interrupt-endpoin.pa";
 filename*1="tch"
Content-Transfer-Encoding: base64

RnJvbSBjNTY1NmQ0OTIyNDkwOGQwM2E0ZjdkYzgyMzUzZTkxOWRmNTE5OGU0IE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQpGcm9tOiBPbGl2ZXIgTmV1a3VtIDxvbmV1a3VtQHN1c2UuY29t
PgpEYXRlOiBUaHUsIDEyIE1hciAyMDI2IDEyOjI5OjIzICswMTAwClN1YmplY3Q6IFtQQVRD
SF0gdXNiOiBjbGFzczogY2RjLXdkbSBoYW5kbGUgRVBST1RPIG9uIGludGVycnVwdCBlbmRw
b2ludAoKSWYgd2UgZ2V0IGFuIHVuZXhwZWN0ZWQgZXJyb3IsIG1vc3QgbGlrZWx5IEVQUk9U
TwpkdXJpbmcgZGlzY29ubmVjdCwgdGhlcmUgaXMgbm8gcG9pbnQgaW4gY2hlY2tpbmcKZm9y
IHRyYW5zbWl0dGVkIGRhdGEuIFdlIGRvIG5vdCB3YW50IHRvIHByb2Nlc3MKc3VjaCBtZXNz
YWdlcywgZXZlbiBpZiB0aGV5IGFyZSBsb25nIGVub3VnaC4KQXMgd2UgY29uc2lkZXIgc3Vj
aCBldmVudHMgcmVjb3ZlcmFibGUsIGp1bXAKZGlyZWN0bHkgdG8gcmVzdWJtaXNzaW9uLgoK
U2lnbmVkLW9mZi1ieTogT2xpdmVyIE5ldWt1bSA8b25ldWt1bUBzdXNlLmNvbT4KLS0tCiBk
cml2ZXJzL3VzYi9jbGFzcy9jZGMtd2RtLmMgfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBp
bnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL3VzYi9j
bGFzcy9jZGMtd2RtLmMgYi9kcml2ZXJzL3VzYi9jbGFzcy9jZGMtd2RtLmMKaW5kZXggOTE4
NTI5NWY1Mzc2Li44MDY3NTA2ZDA2YTQgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvdXNiL2NsYXNz
L2NkYy13ZG0uYworKysgYi9kcml2ZXJzL3VzYi9jbGFzcy9jZGMtd2RtLmMKQEAgLTI3MSw3
ICsyNzEsNyBAQCBzdGF0aWMgdm9pZCB3ZG1faW50X2NhbGxiYWNrKHN0cnVjdCB1cmIgKnVy
YikKIAkJZGVmYXVsdDoKIAkJCWRldl9lcnJfcmF0ZWxpbWl0ZWQoJmRlc2MtPmludGYtPmRl
diwKIAkJCQkibm9uemVybyB1cmIgc3RhdHVzIHJlY2VpdmVkOiAlZFxuIiwgc3RhdHVzKTsK
LQkJCWJyZWFrOworCQkJZ290byBleGl0OwogCQl9CiAJfQogCi0tIAoyLjUzLjAKCg==

--------------S8umGV2860PBvl0ev8K1KStv--

