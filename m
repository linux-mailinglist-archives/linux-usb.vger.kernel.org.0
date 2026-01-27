Return-Path: <linux-usb+bounces-32769-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uGlNNo08eGnsowEAu9opvQ
	(envelope-from <linux-usb+bounces-32769-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 27 Jan 2026 05:18:21 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 458908FD5D
	for <lists+linux-usb@lfdr.de>; Tue, 27 Jan 2026 05:18:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 24C55301DAE4
	for <lists+linux-usb@lfdr.de>; Tue, 27 Jan 2026 04:18:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E605320A0D;
	Tue, 27 Jan 2026 04:18:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cXqLkQ2g"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qv1-f67.google.com (mail-qv1-f67.google.com [209.85.219.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75763244692
	for <linux-usb@vger.kernel.org>; Tue, 27 Jan 2026 04:18:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.219.67
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769487492; cv=pass; b=EzanEpDz871KAKX5v0CJZWTBeoIi6/bi1YvdVE7qn+SDg3nktL5//ruID9k1yigIQzSf6oocH25HLqMzilxC1Jh78iyHgWrOoi6GE+mf708jDMAAxZu9stGdO/0IKwwuK1FwoLNsJMYg0FEHnClkC9oeompZuB0jhhIrdPhUul8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769487492; c=relaxed/simple;
	bh=SI2GWNuzEg0dpiHIi7ElpwGfstqPn5JPS5rWG5xE9J0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VMOIy3x8e0DwdQshGgj/ZcJBO47eu+HvN4+Y+s2b0gw9yWcKENlQBg10LfDfl+8AEaRM/xQwnpG1kGqSJmRwFxQxOVgqb71Q7eteJHsksneL0vhrrgetF21zSfWYxPV6trBKgEhsiNY3isOffi3zyiwYyWZTlH9si8/ikxq1pgw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cXqLkQ2g; arc=pass smtp.client-ip=209.85.219.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f67.google.com with SMTP id 6a1803df08f44-8947e6ffd20so65360446d6.1
        for <linux-usb@vger.kernel.org>; Mon, 26 Jan 2026 20:18:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769487490; cv=none;
        d=google.com; s=arc-20240605;
        b=SrLd8kMdrsUGNNVLs2Je+vwEkM9//pTaCkkEoQylJ7OayB2yIecLqHO+tf1U89BDpw
         cNYCWqeEtcdNHYuC77M7kcQj5jm8d/saOEqADDzs5ZL/R+sgjHPCShROE8LgEFBvfeyS
         75u7O4thbRs19C22CCdx8J18hmFr9WuHRrKnBHNHmNAOLwk1ancvrNEWAl6aQ5PZnD2n
         HgisRfkHsdD1Q2NjTAVrN85vRY1YmuwDgK+tzwa1prcHhWQETWYgMwCLblPRJLd/CzLB
         IEj0U+SHgTbXMC9NVsVtEN7RKqnBgZjFL5Q6MSCC7ZU4kw4tyEdQphovOiNKZp/3OtVg
         SKPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=mSAunwMNxl7rufFlUr7CZTRvllLllvBwnmcbPiu7/UQ=;
        fh=irAsTQO/r3ghpDQItSvnwRjnkl9CUVgDLZmO1Rr52wM=;
        b=aereSqz7n+Fe9lGHzlSbxZA1uaweFQByK4cHfETlCkvGk/pcJlyDNZr3Pvik5K7Mlc
         BqlygRtc+eIR+YkWqSYrG2JdO11i+4LSs5ypKlCcBDL1OE/99iibSCpqPFizQT3GmSn4
         xwxSqkfoz6W9dei9/r9CsWi7KsUCb8sPo1y0mcqXjFSvEtLlxE5Y0F7uYNVVCgfMl75j
         iXQHyrFpHSIISv6vPbxdeisSXPgyRrpG7f/KSWYkI8VR84rFUthBPEdk4zK3r2b3a0Ek
         bpRNYAoqJvRFLtrQxCO/CDWNFcII1n2r8Yx14YrRwFwxwSnMK/JckiXUoDkUtjj6WhXU
         uXfQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769487490; x=1770092290; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mSAunwMNxl7rufFlUr7CZTRvllLllvBwnmcbPiu7/UQ=;
        b=cXqLkQ2gHy0JbCI8CWzBoDyxTN8UOUfFGPLCraRTlIre6xpZfm/21S6bvuxPsZ0Bd6
         SrSirSCjkmCkV9IYLUNVHTj4UHNx0gGXmXsCd/RaOg0v789g7NYJQ1KIFUBOp5vC0wyr
         kv1Rwu31sBNyuD6gKjLVmZX8pZ8BMvYcgH1jzx8tPd0+0B9rl3F8scORQWMK5pC471ap
         M/Mu2AFRhpi43yDgyx8jG9z7c6Eu6M7bETtX5cwJYEedZdGc/4+fVnkb1vmTn1bYYD5F
         uRBBmlsX9WmGB2iZ0Je563nl9LDTfIQMLZ8R8oTjeveMGlJrT6FesTmsZKzDrFCMImmS
         ocNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769487490; x=1770092290;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mSAunwMNxl7rufFlUr7CZTRvllLllvBwnmcbPiu7/UQ=;
        b=Nkr1tsjumM3H+zSCCurO70IvTAUIiUayBh0AluPCBjcUfxS/7ofRHBPFc4DU/Hb2Qg
         Yx7SQtDyPPfpBGcDxbmPHi7RzoyXGrZPF/Y+83lUB2qXYXS2LNKVP5m9SiYu1t7jwDEO
         cdyPfg/eTPANhI2bW/4YHbAidlI0i4Akjx34GTJSySAoNlVMNWM3Ed9DD6acl+CqnFHY
         8YSwJD7huBuzno7zaTw/6onZcCIhfAyGdJac9w86RzsMakgrs8MKe+oaM3jORI/6EqJA
         XqbnvRowUlz8sV97MmtbQa9NeVauWULKxGnM+7L+T3tJqjdxC23JMEm/IGcELt/+gW0X
         XPBw==
X-Forwarded-Encrypted: i=1; AJvYcCV2b+X5oLAqUwMjnld4W8oYLfdaifR7hnPKT7fe2LbOvDUdken4EL122CE6NLUdYjCTa1DKJhC2+gM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5anccNLoECF+affKuaYaNkpEsVBVGfJIXMMETRHjsYV4GfIkp
	l7TmA7j/5tLCt8B0toYbxBnL96N1JMr+hZzTch+LdFTbMbMucv6RHyoeyZXKCW7Ks/G0eE1z30f
	4joY1loBPJtbGth9vyp1zIOYGvLqCOCY=
X-Gm-Gg: AZuq6aK7PCDYrd8dWGAhXdYT9StIhHa9m5Sb7GCSRRjXHbQ630+M+VDCpPXgrPsJGrL
	HK+nJSuqwhDAVFNfwN+gxbbyQOLgRrJZYy+M+N26xAkxM/POqYRPWEIcIEVkYNJ3THtDasfjp0x
	+rkJnnS/pQtG3DIeuaIFc+DrE90YWUs9alEZrTZzlwDoDvpfn+whV3frXEoc+pNA+q5HHy3OT2i
	S+Hk0SyLrnR1bC9FY/9R3Z5uvqt2oFeyPnNDi0pyhD9jdJrPZrE9eIz6JHPzCc5ynQG8/maakIR
	8wXxAPIIiXgM/J+MsAUdihfH4faJFOv5qgrFsFg8pbWGfwO5q78UcVN4ZxKX
X-Received: by 2002:a05:6214:765:b0:894:71b0:6afd with SMTP id
 6a1803df08f44-894cc93f7f8mr6450546d6.59.1769487490251; Mon, 26 Jan 2026
 20:18:10 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260123065842.53669-1-enelsonmoore@gmail.com> <20260126192611.5ca0e9f1@kernel.org>
In-Reply-To: <20260126192611.5ca0e9f1@kernel.org>
From: Ethan Nelson-Moore <enelsonmoore@gmail.com>
Date: Mon, 26 Jan 2026 20:17:59 -0800
X-Gm-Features: AZwV_QgqZ03BL1S6IF7jgSeOXyxXOEqhDwXZsuGOX7uL0gqhUZzyrbHV4LyNUHc
Message-ID: <CADkSEUhUtR8SuQALcBNVf5qoRTrBx8HkL+PmNiM3QQDwRM5D+w@mail.gmail.com>
Subject: Re: [PATCH net-next] net: usb: sr9700: remove code to drive
 nonexistent multicast filter
To: Jakub Kicinski <kuba@kernel.org>
Cc: netdev@vger.kernel.org, linux-usb@vger.kernel.org, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Peter Korsgaard <peter@korsgaard.com>
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
	TAGGED_FROM(0.00)[bounces-32769-lists,linux-usb=lfdr.de];
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
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 458908FD5D
X-Rspamd-Action: no action

On Mon, Jan 26, 2026 at 7:26=E2=80=AFPM Jakub Kicinski <kuba@kernel.org> wr=
ote:
> > +     else if (netdev->flags & IFF_ALLMULTI || netdev_mc_count(netdev) =
> 0)
>
> nit: netdev_mc_empty()

Hi, Jakub,

Thanks for noticing - I don't know how I missed that, given that the
original code was using it.

I have adjusted this patch to use netdev_mc_empty. It is now part of a
series of sr9700 patches I'm still working on, and the multicast
filter removal is separate from the other changes.

Ethan

