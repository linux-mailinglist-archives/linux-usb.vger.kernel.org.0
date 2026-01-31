Return-Path: <linux-usb+bounces-32947-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id z8HoMGtLfWmIRQIAu9opvQ
	(envelope-from <linux-usb+bounces-32947-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Sat, 31 Jan 2026 01:23:07 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1517ABF9EF
	for <lists+linux-usb@lfdr.de>; Sat, 31 Jan 2026 01:23:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 779DE3021704
	for <lists+linux-usb@lfdr.de>; Sat, 31 Jan 2026 00:23:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BCE4B2F5A3D;
	Sat, 31 Jan 2026 00:23:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EsuuKUeR"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qk1-f196.google.com (mail-qk1-f196.google.com [209.85.222.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13895224249
	for <linux-usb@vger.kernel.org>; Sat, 31 Jan 2026 00:23:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.196
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769818983; cv=pass; b=hiP2GOz7leTr0NwSZ/zNYtrHs/y4YucsWHirDGL3Lbcmw6qF9gL0rmnztFsYyeOUJffxsTPqHZGbtoQFbIc3UThWn8kdvZ5mqka115v0OMUKJ2g8N0pPv8BUhWXguAj6aG7aWtCW3TpsTfMxoXZcL8GEybd4XqzJvh3DtouS6U4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769818983; c=relaxed/simple;
	bh=qg9wzUzEliAcrBFyALCEGGjeFouufIleYpX3miGz3QI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eHu6pDhBQlUtQIj54NTdKzwwPcpbHCDvZeRMPxEHy+ZKIKOZp0TUaqquYnIXxlg6KUAp5Hgjn6wjgqewk+J8xk3+uQbBnoHYPRRaH6a+KFAmH+nr2v0Vq+zjIEAsWwvy5UB1ZfSZvQFQiUtCDZNzLH8/5oTxJ3ZsrouVS5tbzSU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EsuuKUeR; arc=pass smtp.client-ip=209.85.222.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f196.google.com with SMTP id af79cd13be357-8c07bc2ad13so207609885a.2
        for <linux-usb@vger.kernel.org>; Fri, 30 Jan 2026 16:23:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769818981; cv=none;
        d=google.com; s=arc-20240605;
        b=FCxaxEBjq85FLnadrKWS/Y+/jwH6HvIpO/lOS4kRETq0RYLg7GHDrLUVZ51WPESYxo
         VWdP+/0gG/0HyfuBDRCgCym/LfoPdr99tWJ+A7ESfeZ7bSM9RtKuvsCsTe/CaeXk6Yi3
         DxT97+b0mLMF8JaKB+Dv/3FkWoT7Iqt3LkjKGBnxNYh10sHDGKmzMMwZaoP/KyMUilMo
         5KsEKDp6UTYsV3kF4hR/pXDvLVGCtpJgjfYlpkvGCJSOtfjejGXDUjMChnOJtlXhoyED
         7RYQzoJDvwimikQiNSa6ICA2U7vgYs3fvvQ+UQb5iP3twOBPT4miyo5Ka/9mmn2FYfLT
         OihQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=EPX6DDVPuONfXLvi9uHrNIpqHte6FD+90Vdl5Pnp/cE=;
        fh=WIPVVV04You4BmRcpklsLxQMbomsR+/AxaMxxz9spYw=;
        b=NQiPwfXvypQXgJfGnfnYjoFOzEY6yPjjpP5tEq2yNR0PKQMQBxbfzuUl9JRYTaMN0H
         2jK1KtW+v0MYnZonownncJWaON2I8717X5RDRDQTh2PCfkQoxDWjL5V8SXHd3d0tGAey
         uopitKxcOinBHrBjlJEAXBO0IWalveCoNyRIuf4UIaU0Gb7BSl1xj7C3J+sJMOE8SYQz
         hRTEBzjkA6eW2XgYMs9BTnlHG82I7QGe8GuhcV4OHzBMnMhdGupK9ezOjq3S/ktYnyxk
         pHhpw1wxAOIB4Re/LC9smZHzqJ73whi/p+TlgslB00Dfo14CJ/S4msbREKxnVt3vnk0u
         G/dA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769818981; x=1770423781; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EPX6DDVPuONfXLvi9uHrNIpqHte6FD+90Vdl5Pnp/cE=;
        b=EsuuKUeRlt/JFZuSLZt9/87wAfLVByJWMqfbMzo/q6pMb4TQJaOtNcpEHnX2wp/oJo
         nLItCFC7IBbpQ30RyTmeffscZjoW7caovm5H43mGycIOIcElNl0IMapaDM7ZNPE8srUo
         3d6mM3Xo43Ur5oQv0qUTROtnIwxAH/CkBUUmMfberWCFtNWrzJq5rKfcTd/srQ2JXvdk
         E7xEpqb8sWe+WJGWTwOj+aoDxxUpCPj600muE3h09Xwq6iU+UthMo1G0ELWMfZ6Y5Z2b
         y0MIllI80qj2uo3rusdETquv6eYzBit3bW9K+oO/mhrRKvuCshSIFp6Y8+uS5pVEHYcG
         vLuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769818981; x=1770423781;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=EPX6DDVPuONfXLvi9uHrNIpqHte6FD+90Vdl5Pnp/cE=;
        b=qXZtFGZgGgB6XmtQ1wwlAUfm+ASnjI54cfv6MdPBpRP9teFVPTK3p+OOmLaGU/ypEc
         HjwMR2S3PzPccQ8cT9AXttzs7Q/Gi7dPoF3lQb4lh4bjKULdNeWu5ATfBMjMlFO9S6Rx
         P4ZvtLi75o3uUedBomDXTKHPOYLp4y0GL+WonXYsgrIrezkboJIZvaR3UsVSNg+4XJiq
         YsMyF9OOSbz7Fq3n/5Hub4CttLiUtRP86cSQQJcxuQCgbnvs+GiXPxf1Zj7dzyyBwDo+
         JQQF3PR7us5IYaaW/sX0JCm/D1ub+pP86DEXO21z3JC/jL9j3wr7Ka128T1zB9cPTTZ6
         33kQ==
X-Gm-Message-State: AOJu0YxNMLMf9wvpBBrc5V1gSNctm/PGbhhqrEInacDx/Oecx6sRSp2C
	frDX3rQE6h3MhYcJSULcPI1PsJNVd2VJDAl/8kSUFeJFAiKYq8j/Bk4kZu1b9ZP+1rzjURlM3dc
	d8nilwxvMrjARGZukCzJKmJAQ9ndkIHA=
X-Gm-Gg: AZuq6aJVJzM4Bi0NtYB6PiBmT2VPGP5lxy8VDsWwsj5pNobrtjnLFvgxNIiDWHTYSKu
	v7Oc00L8j81tcgb9QQJUH2DryvCzyHQjnSDywoAHAIOSZlxpbzmeloQpJZwdFacOp1olyeyYDmG
	XBjYmUtXHEMdq47gzI34iJrJZd8J0TFCFl/8lbA7EUXBvfwTueTII1+K3R8rJOFq20+QJ/NTbQY
	le12D2jvPnVAcTGrX2XiKcQ3CLlEWJKQfzWVKMwSW+w21PDhsFtOMLIdEouwKs3s+szxLikcv1k
	9lKaoe/D+JhxHfMbPmSqbj9SV+d1Z63eLiekTfHvjIXxCpLvs8E8YN0z2vf/ZQwj/dA=
X-Received: by 2002:a05:620a:4801:b0:890:2e24:a543 with SMTP id
 af79cd13be357-8c9eb276babmr672922485a.34.1769818980801; Fri, 30 Jan 2026
 16:23:00 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251211062144.138796-1-enelsonmoore@gmail.com>
 <576ae551-0ed4-4363-b19a-8c4d1692e1ad@rowland.harvard.edu>
 <CADkSEUiHa=MiG8m9uNx-k2BcQibVep+YGdYsdhABdxo5YvDjNg@mail.gmail.com> <6025d11a-8370-49f9-a3a0-1493d5c2ba9d@rowland.harvard.edu>
In-Reply-To: <6025d11a-8370-49f9-a3a0-1493d5c2ba9d@rowland.harvard.edu>
From: Ethan Nelson-Moore <enelsonmoore@gmail.com>
Date: Fri, 30 Jan 2026 16:22:50 -0800
X-Gm-Features: AZwV_QgQl-3XEXKjiOKBed8gZP0Du4biBlrwTQQ3ZiGEGe8E-jDfZHqZXOX3Xkk
Message-ID: <CADkSEUj9DU2mBqt_2HewOe-NOySYoSxnhOTVE9unPTWkWAH1dw@mail.gmail.com>
Subject: Re: [PATCH] USB: storage: Ignore driver CD interface of SR9700 USB
 Ethernet adapters
To: Alan Stern <stern@rowland.harvard.edu>
Cc: linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWO(0.00)[2];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32947-lists,linux-usb=lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[enelsonmoore@gmail.com,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-usb];
	FREEMAIL_FROM(0.00)[gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,harvard.edu:email]
X-Rspamd-Queue-Id: 1517ABF9EF
X-Rspamd-Action: no action

On Fri, Jan 30, 2026 at 7:45=E2=80=AFAM Alan Stern <stern@rowland.harvard.e=
du> wrote:
> IMO, no.  I don't think kernel modifications and blacklist entries
> should be added merely because of somebody's personal preferences.
Okay. That makes sense to me.

> However, you can always create a local module parameter for usb-storage
> in a config file under /etc/modprobe.d, telling it to ignore the device:
>
>         options usb-storage VID:PID:i
>
> where VID and PID and the Vendor and Product IDs of the device and the
> "i" stands for "ignore".
Thanks. I'll do that.

Ethan

