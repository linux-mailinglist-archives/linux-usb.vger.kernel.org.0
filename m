Return-Path: <linux-usb+bounces-38214-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UQrQOE8GHWpJVAkAu9opvQ
	(envelope-from <linux-usb+bounces-38214-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 01 Jun 2026 06:10:55 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DF93619616
	for <lists+linux-usb@lfdr.de>; Mon, 01 Jun 2026 06:10:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B463130125EE
	for <lists+linux-usb@lfdr.de>; Mon,  1 Jun 2026 04:10:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B755231716B;
	Mon,  1 Jun 2026 04:10:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h3RyIwmv"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 304CB2737E0
	for <linux-usb@vger.kernel.org>; Mon,  1 Jun 2026 04:10:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780287050; cv=pass; b=bzfFhBhbGxwVbriPLCEJCGUxI/X2kn/vT7sTE+HJusx4OndfkeLpCZfw2ToFpVhlFNI55N8k5+i5Ra6BjxRVLqBsd8vgBkBwH4DU8TfLnu1F2lwkBwQTRefKKzofzpgvbSBYf9d//B+OcUZ7wcpQnB+maUV4yE+D5JJJH8kLaYk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780287050; c=relaxed/simple;
	bh=vIUr/WZDxH4GBHXDYnRDmJ7VtLfMHepQg8TGjDc1cQg=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=GXKR28FY0QJXLW2vB8VpIuQ2ehANz23agpROQwNPBxvT62o/+ms30yX42Wqog9HKjSZkMpkeY2L+GaQAdbvEUW9Y2Cu0RfL3Dx+vx81nz9+iGlxY7Ztp/j7Vez2kzP6HPYKsj/4GpiMJSH+C3eW7kUdvpwPgH3pXLGop516wWNY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h3RyIwmv; arc=pass smtp.client-ip=209.85.128.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-7e2fa3062easo6504457b3.2
        for <linux-usb@vger.kernel.org>; Sun, 31 May 2026 21:10:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780287048; cv=none;
        d=google.com; s=arc-20240605;
        b=h+MJGXJNC/gC4h8CIw14f/c4fX2O/+MIYXPl6OKaHDVw3tCUMFjzsx/gc2Dw3i1H5R
         m4MQHvWB3XtYp7j8caKfTR8q4OjPAYOGBxlm+pxvV+fWFRkMJFgRf4glSYEyP/4KjdRt
         yW1z3BTr2oxRtQkjhLo0NDP8EhpcAe7HJUT5dCrQPZvtad5KdfjgEgF2inVbRNAK2Jwv
         7bG/RVUQ4P2ryp1Pg2Espil7JjK9UhCzz83OCo4suhwmJikTwrIw6P67HuEg9So+CJIT
         CJ2xEAaIg5a2LuKkGBDrSZXkAl5ectscJqr6AOcVrj7LKhByqOnQC3p43FewDX9vQZav
         6N7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=q7hmTzkPKnIg1dBk8MMbQVP6tgH8cK/Ji4LUjQDFTbU=;
        fh=ipt8fg6R3XNHDKnrN0N/NvMmvtCAneoEcwkIyrp/aB0=;
        b=H9wlfK9imzk2DZlTR7Xgewl3xJiCYG/Wt3+5PrFWJsXbO0mDchLHpCwmbk6lSBIBNe
         21qzDMFx+CUxVa5X8y0GB0XH2VuJS0lq11QuoZTese/ssSUkzPLbWg0rEOs+DiblMW6Q
         wmnKsM9nmhJo3oOZv3dL9UUO6pqHKeP5UALHYeDBln2D9aVMhGRh2VqGAITDCUg4CgV+
         nbl+Nxx3AqgiufLMwa+co0S5BtlZQO5f8myPC+9nIuhSNUB+UtyUv+dbIm3OxpC2TtEA
         8ze+3gUMekI6tUb+QkSBdn5PUP8sXk3kglUsD3bRIu8L51xSzeduQfyzqAtT1VodSNeg
         iOog==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780287048; x=1780891848; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=q7hmTzkPKnIg1dBk8MMbQVP6tgH8cK/Ji4LUjQDFTbU=;
        b=h3RyIwmvOHjXLbXZUAmNHemYZDwbSVDTHgPNWg3xTfFzISGcfcR0evImAX2fgOgRfE
         OttQQk/R8HLO0ldlgtvw+N/KS04lI1HiPCqhy9grsGdXZMVPOsHnOwx3t8nOTL+lQ/If
         y55ykmnDYCPJayEi5j9vzFJdh7wKFA27Jb/mBp4RMRQN0yaITs65iOI6DkMgk1uv/yBp
         pkC+Xffhd8G52RunUnVE6ZRzOgcE9uO5vSq0W1Xn8xII/dDB1vhekIM31/SrH+uQHQmx
         nb+CErhYMlp1PlVOfkRKVhGzWdN8ZyG8BFR5gLcRPkdCNLLvR6CJa7CJoOrGluMrD0nW
         9NgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780287048; x=1780891848;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=q7hmTzkPKnIg1dBk8MMbQVP6tgH8cK/Ji4LUjQDFTbU=;
        b=AL1EwjoX4XhVNfmDs4z0AaTlk6OVFXvdRjIrX+NgHk9g8edUORhgQrRPxfbXnKXsKm
         +7ygiFvXifFmD7su6x2syhMADjdm16RIXpXdfGZn2rqsTYtTeOkJgcTEn2NAl3QegAot
         Bz5Cm+pVLj4pIR0wiUBFTQGYAiIxb1pgMRjU2Vya8roHghK0y/lXOe7eHmsVJtqTp/OM
         7sydimsXSE3vJyyBMoY5nqQiQJwV8yHN3lK6iaxi6om5rTptH+GVKkyHodh5ayuZ/xBP
         cnjzMKVfEodCVUInO9x4Knr1rMHrdm4VnsvKaZ5F2WXeP5ao0Nag+1p/DdtjeEfxYoqv
         p5lw==
X-Gm-Message-State: AOJu0Ywj6xQ2OyM018/Gk/7Qcg0DUem6CqxwKdMBxAsgyfQ8t+90dv1x
	t+xJaOSFk4ZbvJcae5dnnW+LcsBVdnIoEy/XhzPbZmQi0LPm1LujaCq3K41dK1ebfCFH3np2wuJ
	iKPejAyT6kriZ6bd4Fs+Cg+BZAw4WIoJmku9j
X-Gm-Gg: Acq92OG7kU5sLBRw7BbgqLVTK1AnEfhRIDN15D/sJ5Z3h+FRC3K/Lh4kFTl9IH27iow
	PLiizhJPhU/p+RRbciVS4z0qamNkbjtAGdT6vtFqsaF/MR56IeMyDX9SUnv2G+z2DcYT3lixJLn
	l5pfM4gbLT27176QxpsWMxtgLyLVS4dPaLDxBAAFP3oHz1L1R/V2gv0JibnS7/3gtZ8646/iD57
	Zr7cVu1T0gBomSPSwDzQdgUPs00ArxQxNFcbxaFRG8frfA3LmXJLmjWM0O0SQ3C+0lnp6uFI2cF
	7yrfDt6zpblf5ac5LD27
X-Received: by 2002:a05:690c:700d:b0:7dc:6863:de6f with SMTP id
 00721157ae682-7e05930459fmr84095187b3.15.1780287048298; Sun, 31 May 2026
 21:10:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Ginger <ginger.jzllee@gmail.com>
Date: Mon, 1 Jun 2026 12:10:37 +0800
X-Gm-Features: AVHnY4KdZZayVvcnDh-qdpgIbKiaH6Pb_v947JLKwzqRAdBJDbK0IegFqT7T5Kg
Message-ID: <CAGp+u1a_9JNnadwUmCTPAWrs=nxL2KJbxr=tzo7BiJBYzFcpsQ@mail.gmail.com>
Subject: [bug report] Potential order bug in 'drivers/usb/misc/ldusb.c',
 mainly in 'ld_usb_disconnect()'
To: Greg KH <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWO(0.00)[2];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-38214-lists,linux-usb=lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gingerjzllee@gmail.com,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-usb];
	FREEMAIL_FROM(0.00)[gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 3DF93619616
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Dear Linux kernel maintainers,

My research-based static analyzer found a potential order bug within
the 'drivers/usb/misc' subsystem, more specifically, in
'drivers/usb/misc/ldusb.c'.

This potential issue is similar to a previously reported one
(https://lore.kernel.org/linux-usb/2026042444-freeing-consumer-468b@gregkh/).
It is present as of git commit eb3f4b7426cfd2b79d65b7d37155480b32259a11.

Potential concurrent triggering executions:
T0:
ld_usb_disconnect
    --> usb_set_intfdata(interface, NULL); [t0]
    --> usb_deregister_dev(interface, &ld_usb_class);
         --> usb_minors[intf->minor] = NULL; [t2]
T1:
usb_open
   --> new_fops = fops_get(usb_minors[iminor(inode)]); [t1]
   --> err = file->f_op->open(inode, file);
       --> ...
       --> ld_usb_open
             --> dev = usb_get_intfdata(interface); [t3]

In T0, the interface is nullified before its get deregistered. Thus,
it is possible for T1 to still get the usb dev and access it via the
interface, which, however, has already been nullified.
The concurrent buggy order is t0 -> t1 -> t2 -> t3.

Thank you for your time and consideration.

Sincerely,
Ginger

