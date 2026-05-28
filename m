Return-Path: <linux-usb+bounces-38124-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WCGvNu77F2oTYQgAu9opvQ
	(envelope-from <linux-usb+bounces-38124-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 28 May 2026 10:25:18 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5765E5EE847
	for <lists+linux-usb@lfdr.de>; Thu, 28 May 2026 10:25:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B28A7313C50B
	for <lists+linux-usb@lfdr.de>; Thu, 28 May 2026 08:20:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3163A37882B;
	Thu, 28 May 2026 08:20:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eLD0Mzqx"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67819378822
	for <linux-usb@vger.kernel.org>; Thu, 28 May 2026 08:20:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779956415; cv=none; b=FhF4rX6hp/oeYJCuAEtMezCElBWXogg4nBS2usvwa+CEwFdTFzJygIhHQTiR9ZSuWnAvb3jsFCTwrKB4GfvCo/Km5cGRDbRyokSxuH7jO7gCRJQ0CB0S+sqg/VJdqVStqapIKd4Tk+6Av5Vw6vLMiUJnV6OW7gD90tPQKH9AkNo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779956415; c=relaxed/simple;
	bh=yt0h3XGBchWeFUvzEbnc7l1NYOyq6+P6CPepSGZUbLA=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hjYS2Zj5gvRCWmL0hl5kK32vxupZ+tLYz7GdBYPm/B40y9FTbe1U9/9WOLmAeywlx04tGM+hrokOn+t2fxEfKPa+V4LuPgzWd6jYvGPAGnPZHqSVd8CXWF3/BitF1ieAHs24oeFj6dQbsrJMqJSnc9+aqJCA832yq6FS3qKiKEQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eLD0Mzqx; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4893940bb5eso67306465e9.3
        for <linux-usb@vger.kernel.org>; Thu, 28 May 2026 01:20:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779956413; x=1780561213; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yt0h3XGBchWeFUvzEbnc7l1NYOyq6+P6CPepSGZUbLA=;
        b=eLD0Mzqx0dF4Ui0wegt2e89/t9NC7yvbAQ7qqSfJk+Dx82HNqOzzZt+0NUB0MaMJUt
         lRMQoqq2djwL9Zd+51B6ShplyYuJSwnomjiqhf6L8AtG0o6lJYse1O9D5+W98aZNcBJm
         1KoE0GcEsLfoRPVwN811+21VLRYH2/eHu5UoAApRwfTKhtyaP5S29JvtFjb8J8N+7csO
         sNFzUAllZmsa4MkPaVVzMi2+6Uh1LnJB1PAWUyhH6UXdxuFZmB8onMEoIOYKkYuKnX8q
         cay3jX4lWiEXOsyPITpQdihJvpJ+qFo+lFfOVe/Wn84I79WNhk/ucaEog707odeSQOf5
         XPUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779956413; x=1780561213;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yt0h3XGBchWeFUvzEbnc7l1NYOyq6+P6CPepSGZUbLA=;
        b=PCJD457bIlwNMzDAME4GmbS4VHvAHhYfg9tDqqQTfLkKrki64+8I9gnv9QkcbYqNMT
         +SsHy2j7z5HMGFyv8Y8fBp0ZKi4J/+aS9nXreJXTd9wiKJ4w+FrhrgYFpyW+TSyXpgB0
         QnSoC3oZS3gRU1GdBXpZI7M5NtM7DaWnD2NamcFxn4f4xlnE5rKnnvvlYd+Ot8m8+vfD
         KfVwdGIGDH94WegjgaZuXWoZwkqIpKStP5PmRwq6iGmIG1mtnBznaQoC/qD5kusFajBU
         LgbHffX13h6DF+/L0u5u6vtJu34HzjktlOZg8SmiajbTqGDo8ypdNpx6niMCqM2+V/0h
         VW0Q==
X-Forwarded-Encrypted: i=1; AFNElJ9HbUdDclLseK53qYKfT832Hz28gSVsgw3T61FLw7UDh1xmjsoOZcMS+IIRcR/VhYoPfMPERekHhgE=@vger.kernel.org
X-Gm-Message-State: AOJu0YyEtQCXVo0NzGzk7Oyf3NpkUQn3oPJnfiPYO6l9heanx+FAOjgd
	8HMB3XMyoAmIHmTf1taeJRmqGmEYno+5O5wm6Y5HS0XWy2Fa0h5e7Ifb
X-Gm-Gg: Acq92OGanENThzH6C+LdmT95b6YkktpeG5bMgfCtfXjIyCshjdRTpBWAQ9vjvuNXX4M
	sWiHnwI8GqQ3k8XKPRxXcZ5y16RsxF6tnzIcY1Vfm/Tt+cH0mnI45hl6awyrv1sRQbpvV2AmWRp
	n1ql7e1Cu2iE7Sm8UnDkjDiAE5GcjG0gmaggIIK1NYbje03SIfK44tSAzeF0Fzxw0PJZL/xS7uA
	6ORmYvOZBpFoSM02ki/5JPTXk8URg5erhC5DJ8DPRh08qjl2UvFM155yO0tfGBNW+k1VPJWHfEy
	FY1NLmEUSCJYQL4NYtxwfmd3yAEOvMGhFPYvmXjadXiG2Lk8nItcUGrHEqTJFXIS5htQT1MuRP0
	Yzj8dgZMPvJ7D0inhD47Se6l2GTrwfbEOtPoaWmsqDneApcw+sojmGIu2zygpsygh2hn5Jkh7qd
	KEKGsNUMNvcl437gdscc6R+P8X2uJY0GXSUpDJW6HSExk1AnvJcwnu4mTY
X-Received: by 2002:a05:600c:350e:b0:490:95b4:1cd0 with SMTP id 5b1f17b1804b1-49095b41d49mr2123425e9.15.1779956412504;
        Thu, 28 May 2026 01:20:12 -0700 (PDT)
Received: from foxbook (bfe246.neoplus.adsl.tpnet.pl. [83.28.42.246])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45ee5a84e92sm3422698f8f.35.2026.05.28.01.20.11
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Thu, 28 May 2026 01:20:12 -0700 (PDT)
Date: Thu, 28 May 2026 10:20:08 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: Joseph Bursey <jbursey@uci.edu>
Cc: Alan Stern <stern@rowland.harvard.edu>, syzbot
 <syzbot+ad2aac2febc3bedf0962@syzkaller.appspotmail.com>,
 gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 linux-usb@vger.kernel.org, syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot] [usb?] KASAN: slab-use-after-free Write in
 iowarrior_write_callback (2)
Message-ID: <20260528102008.558a0d9e.michal.pecio@gmail.com>
In-Reply-To: <CACR97nvAMAnfEL+j5GCi9zcmNc9VLtbAtO0ywEtbBdrw=YSHhQ@mail.gmail.com>
References: <6a0ce39b.170a0220.39a13.0007.GAE@google.com>
	<32c79569-8001-48d2-9675-b38b1670f285@uci.edu>
	<20260524103053.308501de.michal.pecio@gmail.com>
	<69c60a2a-68d2-48b0-8236-b80cd6b602cf@rowland.harvard.edu>
	<20260524184633.405c4b3c.michal.pecio@gmail.com>
	<CACR97nvAMAnfEL+j5GCi9zcmNc9VLtbAtO0ywEtbBdrw=YSHhQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-38124-lists,linux-usb=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michalpecio@gmail.com,linux-usb@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb,ad2aac2febc3bedf0962];
	SUBJECT_HAS_QUESTION(0.00)[]
X-Rspamd-Queue-Id: 5765E5EE847
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, 27 May 2026 16:36:54 -0700, Joseph Bursey wrote:
> On Sun, May 24, 2026 at 9:46=E2=80=AFAM Michal Pecio <michal.pecio@gmail.=
com> wrote:
> > On Sun, 24 May 2026 10:45:39 -0400, Alan Stern wrote: =20
> > > On Sun, May 24, 2026 at 10:30:53AM +0200, Michal Pecio wrote: =20
> > > > On Fri, 22 May 2026 13:38:40 -0700, Joseph Bursey wrote: =20
> > > > > Hello, I believe I have a reproducer for this bug using a
> > > > > combination of syz-execprog and eBPF programs. =20
> > > >
> > > > Hi, could you check if this patch (compile tested only) fixes it?
> > > > =20
> > =20
>=20
> I tested the patch but I am still seeing the same UAF.

Hmm, OK, thanks for checking.

So I'm not sure what happens there. Maybe this interrupt endpoint isn't
part of the interface the driver is bound to? I'm not sure how to read
those blobs from your syzbot script.

> However, there does appear to be a patch here which does seem to work:
> https://lore.kernel.org/all/20260523170523.1074563-1-johan@kernel.org/

Yes, it fixes the UAF, but it doesn't fix the WTF (to me), which is
that USB core somehow allows URBs to exits on an endpoint that looks
like it should be disabled. These are separate issues, though fixing
the WTF would also fix the UAF, if the fix worked.

Regards,
Michal


