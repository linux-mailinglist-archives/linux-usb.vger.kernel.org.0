Return-Path: <linux-usb+bounces-32992-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8F0INo94gGne8gIAu9opvQ
	(envelope-from <linux-usb+bounces-32992-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 02 Feb 2026 11:12:31 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 379F8CAA3E
	for <lists+linux-usb@lfdr.de>; Mon, 02 Feb 2026 11:12:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2B1303063B41
	for <lists+linux-usb@lfdr.de>; Mon,  2 Feb 2026 10:04:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1244B2E8B75;
	Mon,  2 Feb 2026 10:04:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="mhzMO4su"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2202A30BB93
	for <linux-usb@vger.kernel.org>; Mon,  2 Feb 2026 10:04:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770026682; cv=pass; b=WWq6FsSREhe0uP/FK3pE+XAwKlOvhASG3S8UqssRbU1Zt/f0UTV2AIYwKLJHtR8C7lKmWzwQQTQ8V1aEI1ICNuJcHvA0W6M/DY9RHNkHHn0VsIq+LVD3m7PVBCOCHKKnbEuRKT3wDetLHurVDV72odnNs/PxOHBPWrt4r19iJ2Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770026682; c=relaxed/simple;
	bh=a/EjgiLJBN61zKW9j8WRcNN7IJvqvqLFYbpkn1obKfo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kr6+mKaX6b3lYWiBH4wTBp97X3dBqkVFz5Rv324TKBJZaXSelDne9MtMm38x50HLEKG4osMhu+q4a2BqELH10K4J3U9j78S4NBNLsnL8BdIlCxmrflTdZxhP/wiZh5/4v3ImLgz2HQ4fBmJsx36rdLRTCQOuDIPa21zQFuaLRr8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=mhzMO4su; arc=pass smtp.client-ip=209.85.160.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-50299648ae9so986711cf.1
        for <linux-usb@vger.kernel.org>; Mon, 02 Feb 2026 02:04:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770026680; cv=none;
        d=google.com; s=arc-20240605;
        b=CJ94vGFNa2Wr4Kzzvu0eJTbhVroN3AYhftCKB3waQv30vHwW196XqZmpL5FPbJXhyf
         oSRmMlHpT71gcQ7shxZ98/U1yhBf8skNiufkqxaBSk5X+Fo27+znuk6Wz0kg9P23gH2V
         NC5hCDo3nNV5F02wugCJ8ZbsXxdlYSqR+Fn2h7tTos/4dYverFMcF138f2BsrMP3fb13
         t7+X3IBZCscY2l89QIOoPSRBcX6sRTI3rBa00oBuqzZqOPCBCakbOXQGaigTeoixUM6/
         hcrX0PN44sf2WqjSpAGDS5mbe/ZgLdxRlQ/mcbDSTQn9DrskKeJvSPJUocpk3c6MxRna
         wVqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=oBCrVhGDpTv4X/aChaxRKx5DWFmEAWePHe7FKvrzIYY=;
        fh=FP4rbM729xJBdyKK1GVa3K0Xoef+BkmzX4ZyFCBwCJM=;
        b=fR4LEHVl5AxFWQu0qtTrdH4XhXryOk+5D1wMXMe5ny10Ie88Wvbu+1nSBaNxwcTqx5
         t5+AcZYvri0mqxuPNUiUY3isRGEa6HBQJcHjaJW0qZ181xOgsD/ElOV4vboRAl8Z4QPl
         fQXZcIhUAEv9DQmiPfGvZOvw19MPYaGFA0+kLF+Ib4Joq/Wp1+PPAKU1LUxjju+oIZJb
         I+8O0QlVnIdZL5cy725mhGfpCiBlJuzg3qnjX4tdIoJWgoetx+wxymP+VjRTb/+Vv8tU
         4q7PqH6VaP6jmJzE3cflSZ21gwMfCoO+5ujuf1qoKCerLU9Qa+LuRnp4DUQlB4y/6GjK
         RpkA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1770026680; x=1770631480; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oBCrVhGDpTv4X/aChaxRKx5DWFmEAWePHe7FKvrzIYY=;
        b=mhzMO4su+b45IePlHxPTlvXXJDCMKCv4ACHXqiva2HB/2zGtwqeypXa/gibLBvYNYr
         n4cEICjLVWY7mdw9qCSuSNUfFL4MTwjHR8O2pai1quwpELCPkVYY/bjD6g2NR+ggzirS
         Y3FJrtszwRcqY6JJMASgQifjAFGXPu/VPM+4J/vKKpfg1u3atZGUsX9NYjY/hOnRC3ws
         CuwY+8z3KDPjgS0TnRb9/VmJOsrK9r/GfBh0WJhaUJoWzPIfHNuBZllsoZbx4RghLZsg
         52kp83kZwMfZBdHslNYpsS9CTck8+VlSQJRSR9PH7yNoILP2+8nGZK7XNfi48vLCaRC2
         y2Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770026680; x=1770631480;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=oBCrVhGDpTv4X/aChaxRKx5DWFmEAWePHe7FKvrzIYY=;
        b=CfKNFbVowot8QznWnralP5UMdBoyw+v3dEb7e/KNo7hkJaoXZ3vvlHqfbJjuhWh6lN
         e1RoxPjk9JXb9mzOGQ7OI05ZjCbH3UkZ1/aAcgBdoRh4VoYrSfCBAqVuDhUXaRt8Zb5W
         Q+jZIzu2VEMdzQUIHjI0wQReh7xJYUx8294xwsZ1ZT56weXVk7VsWHHsVZ5J+g98c0Tl
         kn8QRH9Uy3kIiQu6rvAWPl95ER6Da5fIijDgRDHGdBmawcJiAX14pcMJZv3OymRoD01O
         iycPRbzGjgTMuqrxyhv+byeoET3dSMy6kvY4hwIU6lUOXWi94DFGvq4KN9g0xyYv6+3v
         CHKQ==
X-Forwarded-Encrypted: i=1; AJvYcCWUC5w8eEjrVp/4iIrDLp1BY6kN4yLfuRMO4JVnc6VPXUeQjPB2qF1OUi0pSJqeoD4Uvnwz0PRwws4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0csazN/oCbx7Kzf3FKgkMFAkV6fPP04/V6qC09YxhZSJIItuN
	AeoDA6HnCUsG6WHCUVTkkMPZUC+hAy5CCWk/+N0NXqeNfM5vlxSDb0UiGBrND41eOCn6R60jhMx
	ZsIEgXbFQsOfebDz7omwsKtQhAWYcf8CHQcu087hbxJD/czrb/ffI8jtMpY0=
X-Gm-Gg: AZuq6aJOF27BT9JUOyK9iCNl/QDV126NpQACyOR3Cs4pn6HnjxyADo7pv7Kg6lxHwhv
	CTcTH53swNLbJ2zGCEqwGMnYbc0s1pUE+pumpJjYPucHJv5UXE2IowifCDzLgYK868IinAnK1ue
	kKa/9JqAE9LpSO901SSG/OzOxEuMgLCICEmYdV2Nn1d5ureaGbfTAvG3BuB0h8vmxRgtrIeIsIW
	MnUEeR4zk/jPAiVnrRTJfjw45C1nnch+KpzcODvE76UB5UfIdpp3HfjztjONQAUH0Pl190k+UF4
	bakLDb/Vq4blSpokIiqYfAU=
X-Received: by 2002:a05:622a:180d:b0:503:2e98:7842 with SMTP id
 d75a77b69052e-505dedf4092mr21061921cf.4.1770026679666; Mon, 02 Feb 2026
 02:04:39 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260130074746.287750-1-guanyulin@google.com> <2026013133-tamale-massager-3c76@gregkh>
In-Reply-To: <2026013133-tamale-massager-3c76@gregkh>
From: Guan-Yu Lin <guanyulin@google.com>
Date: Mon, 2 Feb 2026 18:03:00 +0800
X-Gm-Features: AZwV_Qiw9LmBNa2njA4zcXW58SE7Ga7QU8lfb3Xm13kx5RUB38KsTHpij3-s71g
Message-ID: <CAOuDEK0o2jqqOUZVUdi9JDcyXRQHEuL9GCBrU0VQhWAfDtJnUg@mail.gmail.com>
Subject: Re: [RFC PATCH] usb: host: xhci-sideband: fix deadlock in unregister path
To: Greg KH <gregkh@linuxfoundation.org>
Cc: mathias.nyman@intel.com, stern@rowland.harvard.edu, 
	wesley.cheng@oss.qualcomm.com, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[google.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-32992-lists,linux-usb=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[google.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[guanyulin@google.com,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	RCPT_COUNT_SEVEN(0.00)[7];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 379F8CAA3E
X-Rspamd-Action: no action

On Sat, Jan 31, 2026 at 8:15=E2=80=AFPM Greg KH <gregkh@linuxfoundation.org=
> wrote:
>
> On Fri, Jan 30, 2026 at 07:47:46AM +0000, Guan-Yu Lin wrote:
> > When a USB device is disconnected or a driver is unbound, the USB core
> > invokes the driver's disconnect callback while holding the udev device
> > lock. If the driver calls xhci_sideband_unregister(), it eventually
> > reaches usb_offload_put(), which attempts to acquire the same udev
> > lock, resulting in a self-deadlock.
> >
> > Introduce lockless variants __usb_offload_get() and __usb_offload_put()
> > to allow modifying the offload usage count when the device lock is
> > already held. These helpers use device_lock_assert() to ensure callers
> > meet the locking requirements.
>
> Ugh.  Didn't I warn about this when the original functions were added?
>
> Adding functions with __ is a mess, please make these names, if you
> _REALLY_ need them, obvious that this is a no lock function.
>
> And now that you added the lockless functions, are there any in-kernel
> users of the locked versions?  At a quick glance I didn't see them, did
> I miss it somewhere?
>
> thanks,
>
> greg k-h

Hi Greg,

You are right; xhci-sideband.c is the only in-kernel user of the
locked versions. I will rename the __ functions to usb_offload_* and
remove the locked variants in the next version to clean up the API.

Regarding the deadlock fix itself, we have analyzed two potential
solutions. The core issue is that xhci_sideband_unregister() (and
xhci_sideband_remove_interrupter()) needs to decrement the offload
usage count (which requires the USB device lock), but it is called
from the disconnect path where that lock is already held.

Option A: Fix the Callers of xhci_sideband functions
In this approach, we keep the usb_offload calls inside the
xhci_sideband functions but replace the internal usb_lock_device()
with device_lock_assert(). We then update callers in
qc_audio_offload.c to explicitly acquire the lock.
This ensures the offload count remains tightly coupled with the
interrupter's lifecycle, though it effectively changes the API
contract: calling xHCI sideband functions now requires holding the USB
device lock.

Option B: Decouple usb_offload functions from xhci_sideband functions
In this approach, we strip the usb_offload calls out of xhci_sideband
functions entirely. The client driver (qc_audio_offload) becomes
responsible for the full transaction: acquiring the lock, managing
usb_offload_get/put(), and creating/removing the interrupter. This
restores clean encapsulation (xHCI functions only handle hardware),
but it places the burden on the client driver to correctly balance the
usb_offload calls.

I lean towards Option A to ensure the offload count implies an active
interrupter by design, but please let me know if you prefer the
cleaner separation of Option B.

Regards,
Guan-Yu

