Return-Path: <linux-usb+bounces-32771-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0PcNDJdBeGlspAEAu9opvQ
	(envelope-from <linux-usb+bounces-32771-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 27 Jan 2026 05:39:51 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 81C838FDFA
	for <lists+linux-usb@lfdr.de>; Tue, 27 Jan 2026 05:39:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 29FF03021E8C
	for <lists+linux-usb@lfdr.de>; Tue, 27 Jan 2026 04:39:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 458052D8796;
	Tue, 27 Jan 2026 04:39:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j+8j3+MB"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qv1-f68.google.com (mail-qv1-f68.google.com [209.85.219.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82B98298CBE
	for <linux-usb@vger.kernel.org>; Tue, 27 Jan 2026 04:39:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.219.68
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769488747; cv=pass; b=YW1dCn+EwmllwOHgc+Yd24AKjD2kgtASiaWmo76HBhoFKneT4uVE17B29xIfFlmJ1l8+nCnZ/vBpuhmjb243T4Dar7E/QeDm3QZMl0LGnmDTBqxiFUqrJ+/sQ8BpmcuAVJHmouApXK9B4De92y3T2mMxTCX9uKphamIwVv7vypE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769488747; c=relaxed/simple;
	bh=n2dNm+rTBUOavMXKUt7vh2BXF/n2U58ixefD3sb72yY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tkgBKoKCPWkDHLb3RJXhRecioEwVyyIjWiiY8IL93d5FwxtODtKwFf9yvdmiXXGxR0iKnIAxvSnRY16ngY4EdXQYfV1lHbbLL9W4U0zENDN4dOm5JkPY4ZPgy8PcYn7wimEcum8uu/A+t/SpmWwcctYgYobDiTYL4jKavE1MZ6E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j+8j3+MB; arc=pass smtp.client-ip=209.85.219.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f68.google.com with SMTP id 6a1803df08f44-8946f12b1cfso64479176d6.0
        for <linux-usb@vger.kernel.org>; Mon, 26 Jan 2026 20:39:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769488745; cv=none;
        d=google.com; s=arc-20240605;
        b=BSP9TjqpCVgdPKAIeTzMqdC8rLTrIbNw45pOiiO/P6MsnDExHmTE8+rj4h55JAIOfG
         wfkhJvbafwXCrrpthXLVO20nAYl6jCPbf6n0qWMb4TWgp+JGLavlx9E78f6yQgS8BH7U
         ueC+MvlJbK01Oj4rD5lXoh1UPIRcFOWj8vqRWZ9CF6b1C6smrQ0KBUN1JUCOsigBW4d9
         NFUGtTj8FMF2l+g+GoN4RRrVaTntWTAZmG1DJqwzzdG4lNsh1qwRr5JLLtrhmXbxYbg+
         WXQ3Zy6tZVpNut7Mf1g3+3q3hkiaKuHETSk4pjFMzgrV/NyRkE9PhAiz0y7UnOebzeqA
         GnrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ScNgrykGclGtxSSJ1UPVtEbCcvttZim8C+F+P1UH7W0=;
        fh=+/lhbFLHy1x0X1N1sUhirSkygkruNNChd23EUpTP/cs=;
        b=WhIewuahkacmJhci+BNYHNGaSbPix3kweTfzk9tZVsncdZ3tLxLQ0GPtgwO/61M3OT
         Fy8b75i9jPNVkd7HqPXG1iv3U44q8pncy8gWXkkJooSXoH1ZVPSPExWUVZu/YQ1U3I0P
         xMNS6WPM1EgDn82tH2AuQA7yiPTjeoZc8Pfh5NBM31UFX//VwBERmr5m+NZ8x56K8qL+
         v8pqy1ViWNF5V5d+oRaU0TdD/4DPe8ABwqZVp/s5tw7VrDfGrQpm32XUiQ994nl9SFRi
         ss6TR0Gk1RPWJDaRr6rkPpUwIBDOwb3BEUCFwR8ylrZSrAVSgyHY+7TWivX5r3jcvBpr
         xPxg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769488745; x=1770093545; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ScNgrykGclGtxSSJ1UPVtEbCcvttZim8C+F+P1UH7W0=;
        b=j+8j3+MB2iA68HSdBK3bUlfZLjncXscyG/CUwF++4Fq4kT76jCv/tuCCTNb4uE8Er+
         bJ+yCYznS4osF3TUhqAflef/dyzrBr+0hl1xvrHXwLOlbem2dxILqyquGlBQHumxNCGI
         6wtO2WMjLF0QfvPNDLAq+s9YChJ4D0avcm+1+4LnywwehIYSOCjleiNgXSqc6Tlc2yBn
         6K4VVgylxHHXmwC00k9L5wqmvSAsj0LNqCw+fRUhWw3z63xnAwEjZdRRwKHb1nvq8Ow3
         gtiurl2pvc0RN4q/nyx3THMa9hY7QMZ5YosSGhuOu63mL1x1mCRmS0uADysreRwwptml
         PYSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769488745; x=1770093545;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ScNgrykGclGtxSSJ1UPVtEbCcvttZim8C+F+P1UH7W0=;
        b=hCrVEC3F1ptHfBQRO8/9cXYLv0ewKA5J0or3fMgSkj+3GaMfECBdfeVYrzGtu/EyFP
         cvMsdIbA3aeaEyHqCNK7waE02d8ngBSRivTVBqWoRelx++cj9D804JBQ6tQs0ifr1SeL
         ya6jgqwSi7n2vNQei7qjURgM5brx9RWYz+QDPsdv+5UipmiJvoGsz0OqwHCTreIR1S6q
         JuByb246xs4pYTBNUJRksKklxnVEAeAkEyDedLJbPYRRGlacQId4gfl8p8oWvALSum1j
         DiIC0Gic0CiE7kC/rPuqIL7llkX9dryOqOVCL5imOgfsSjxbOhXKjE4NV+9RQajmuiHH
         p2TQ==
X-Forwarded-Encrypted: i=1; AJvYcCU3SIkxVX6WWHyxGPOnW1ZFHs4yWOprOkSoqUpXs5TZAzGk9YKVOUvMx1VJU3e7lgk15YCWvg0kRpE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxOwLP/SWrzXD6JSgsBIH6B14pr76+OcBKsbyfcFEsa81NGOIri
	FvmPFr1qigu5kjU+7ULUZqA23Q3zsL6xC4xg6cy0dQS932vvkENkm6lKiqQhSiCB/gd2ymY2t+1
	49neIbVPJY7Hs9UXHVU8ssLLHlnawOTE=
X-Gm-Gg: AZuq6aKIpv8BRYy0EdcVightq3MoJ19C2Z8XL0OrdtrnFUc1KB3Ij4qFHqHbUawnPa8
	WmKyYidz86Y/lf5VNbfh/grYXG+ZjKAYCSG5bdxieHgVO3UUc2VGETnx7aAqMe1mBBKV/hwh33B
	nXpGO74ERiQNh1CuxDeETs4NLgeUzVnApbVCjg5DWsvard2ZTZAm9snwjic53QwK24ne41wLMlU
	PXaTwQWtJX2r+xu2UqrGsWI7u+cIIYCzoX2U+3oyLk9Ktol+WqT1QLeBjHti8KzKPZYOUoUelih
	Z5GwIQii8sj9P2qQuZqHf/GzeRKh7YjfOVRRZq3zlh7TltnsrcLFeWxYyUoI
X-Received: by 2002:ad4:5d66:0:b0:880:5001:17d1 with SMTP id
 6a1803df08f44-894cc8fd9fbmr6341416d6.37.1769488745351; Mon, 26 Jan 2026
 20:39:05 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260125083501.34513-1-enelsonmoore@gmail.com>
 <20260125083501.34513-4-enelsonmoore@gmail.com> <9239ddef-c197-4fbd-8e88-691766bda3e2@suse.com>
In-Reply-To: <9239ddef-c197-4fbd-8e88-691766bda3e2@suse.com>
From: Ethan Nelson-Moore <enelsonmoore@gmail.com>
Date: Mon, 26 Jan 2026 20:38:54 -0800
X-Gm-Features: AZwV_QiDsJdyHTfe986xy1eQRIgod4TQJMrGFH5ddJp_345K3upd571um_kA9nI
Message-ID: <CADkSEUjgRrC9eAQYOkaErd7wyXKkUs7+dG+Q1jz7VbqF+zxwuw@mail.gmail.com>
Subject: Re: [PATCH net-next 3/3] net: usb: kaweth: remove eth_addr_t typedef
 and bcast_addr definition
To: Oliver Neukum <oneukum@suse.com>
Cc: netdev@vger.kernel.org, linux-usb@vger.kernel.org, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-32771-lists,linux-usb=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	MISSING_XM_UA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[enelsonmoore@gmail.com,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb,netdev];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux-hardware.org:url,mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 81C838FDFA
X-Rspamd-Action: no action

On Mon, Jan 26, 2026 at 3:49=E2=80=AFAM Oliver Neukum <oneukum@suse.com> wr=
ote:
>   * Please note: addr must be aligned to u16.
>   */
>
> That requirement is not met. This code will bomb on ARM for example.

Hi, Oliver,

Thanks for noticing this.

It seems like no one is using this driver; there is only one hardware
probe submission on linux-hardware.org containing any device ID
supported by kaweth (of 0557:2002, from Debian 12 on Pentium III
hardware). Therefore, it doesn't make sense to clean it up.

Admittedly, that is only one source, and the number of submissions to
it has dropped recently because it has been having server issues, but
it's still a useful data point.

In comparison, here are the numbers of submissions for a few other devices:
r8152: 0bda:8152 - 1372 (did not check other device IDs)
rtl8150: 0bda:8150 - 18 (did not check other device IDs)
mcs7830: 20 (19 9710:7830, 1 9710:7832)
sr9700: 221 (161 0fe6:9700, 60 0fe6:9702 which I recently added)
sr9800: 0 (I will send a follow-up email regarding next steps to take
regarding this driver)

Hope that helps you get a sense of how much these drivers are being used.

Ethan

