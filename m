Return-Path: <linux-usb+bounces-34568-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CAEPH1F5sWk2vgIAu9opvQ
	(envelope-from <linux-usb+bounces-34568-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 11 Mar 2026 15:16:49 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C8E72265370
	for <lists+linux-usb@lfdr.de>; Wed, 11 Mar 2026 15:16:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 2F1693004D05
	for <lists+linux-usb@lfdr.de>; Wed, 11 Mar 2026 14:13:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C300336CDE4;
	Wed, 11 Mar 2026 14:13:28 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55604372EFD
	for <linux-usb@vger.kernel.org>; Wed, 11 Mar 2026 14:13:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773238407; cv=none; b=p1dFcMS7XHZ8yCZdG9Gei0h/W+mmEIshgI1Vj9ul6hHDptw2MK5/U9GSpqQ6D0+1rhzrVP8K2+UEpL8YcfCpk9cJkeaAQzQ93n+rxSg6BykMOJjcCYQ4Ah3F5JXsCTx7VggdQuoPnoXXGjZq2iQJixDZz9zrzKJaMbbPfqfe0r0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773238407; c=relaxed/simple;
	bh=POUJjzeRhBIXfPGojdZfC417KH92loTKx1KmDpRcfoc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BiKGSPeEHkwsfTJGUAYdbDE7YqSfJGajsdC/TBVlUgJQeUxfLJGFm7lunp0tI1V0GUPYvoRBtwO/KxRrYkIb9MJl9+2kY+whFICvN53rYouiDdV9zbUZfLDlCcuX81HYctrkNrVde0tLTo71PiDKQibezd2Nv00BoYASkkjS4Zs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-66174cf4549so2115471a12.0
        for <linux-usb@vger.kernel.org>; Wed, 11 Mar 2026 07:13:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773238403; x=1773843203;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wIz9Fr5w5J45ZN4rxwvT/0kjXMGfLP1VpB2aKPOax7k=;
        b=dz0j7GPNOTeC5b/eVPjLTqWfh9RmHVyasgbHK8eF4ctCW71tAYwEN0EPvhxlpjK4xe
         VH9kBLNDCUNVXTUfmDiYHSNj4FuCpDFhL/omqrDsK3A7CB5nI5aXDmH2smIhvXunwe96
         v28IP6vdf9ow/oFLmkvXKlKZzLUWDD4jEA6ymNT88wRWEXB0wudQygv9kxmm6wwk1Vrh
         jTVWEzbPdBjwz7dRIv9w2ixZ1m41f7xCcxpbBEv9IHgJB24ym1JMbV3nA/eLcQCzaY5N
         tAVTXBzFIUyNf/uG600FnAwa4+I0q9Uo87p25YVNHvb3i3bumDJwAPKXGqAGZwhTYjkv
         tHpA==
X-Forwarded-Encrypted: i=1; AJvYcCXjg9bLhAzcMi6e6xDILdb87pfnSbz+lcFJ479MclPv9zGnrzGxqET6Oz2jBwABXykF2y5TU5isEek=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzez3mr0HTBcOJsZ6CrQxUDnkwBnBe67CwbMMquEGXjvprr4M0J
	1Zsqw4ZNJ/GW3Pr8b1813+Q+50Md1NQkcUOM3QmzwHdruQsZGQ4uLEcx3ycgGj9lMn3f+Q==
X-Gm-Gg: ATEYQzwUcYU8b9R4AXqGTrdD/Ee8RSBVEU54jELG/FYpQQrWB1F+nDX3l7bkNUB/44t
	zi0vyGACNNfKFIPTlgaLAAgFw5P8XvOq7gtfldSafctmls8J/iT9HxLl3GQi9Pkf+vlgBTJI/St
	ySScKLVgK7lhTmaBmTTxJTB/21ClE9cGhVYrq3aHYKxfqL3TZIXFVIIFOrm74OhIEazPJ9a0a2U
	ITltw/282ydR0y9vbE5C7FfhMvsqG2cioy2HL9YnCbEW9R1/z1XyQ42Mu/6gHowxCh8sJRH9Txf
	v/wtnUaUd+lSiP8fQsOHy4QaLEcnB76Hv8kCUG2qlpdy6Wwpxuv4+hw9JK1tAzdvmPVkwEqczHd
	SJVWf5w3iakQ1zbFeaWvB25JMjFdBJ75g0wWYuW6NrSnvN3b3Gk705827RzxsrJQ1VSkQ5WLCIr
	BVMHM0b+IM1MH5wpP4WnkblaCQ8Q/FCRoJCMrwN7cZrQNIr5UdqFDJhaLKTOIM
X-Received: by 2002:a17:907:a46:b0:b93:514c:b420 with SMTP id a640c23a62f3a-b972d56ec52mr155607466b.13.1773238403128;
        Wed, 11 Mar 2026 07:13:23 -0700 (PDT)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com. [209.85.208.51])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b972de08cacsm57451566b.6.2026.03.11.07.13.22
        for <linux-usb@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Mar 2026 07:13:22 -0700 (PDT)
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-66174cf4549so2115393a12.0
        for <linux-usb@vger.kernel.org>; Wed, 11 Mar 2026 07:13:22 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWr2OYsU8aHJURSEyQ/Y0jeXcYirSaJCtcEXHyS4FtpxSPNFRM8K3wGjHo3Qpt/QIMbfxlrcAYBNLU=@vger.kernel.org
X-Received: by 2002:a17:907:6d16:b0:b88:4f25:81da with SMTP id
 a640c23a62f3a-b97113ff0b9mr462021166b.0.1773237981235; Wed, 11 Mar 2026
 07:06:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260310-b4-is_err_or_null-v1-0-bd63b656022d@avm.de>
 <20260310-b4-is_err_or_null-v1-15-bd63b656022d@avm.de> <20260310100750.303af303@gandalf.local.home>
 <20260311141332.b611237d36b61b2409e66cb3@kernel.org> <20260311100332.6a2ce4b1@gandalf.local.home>
In-Reply-To: <20260311100332.6a2ce4b1@gandalf.local.home>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 11 Mar 2026 15:06:07 +0100
X-Gmail-Original-Message-ID: <CAMuHMdX4kRGLaKMzPuhS1Pmxh609eiqQW-cAS_jWBBbt-vE6SA@mail.gmail.com>
X-Gm-Features: AaiRm53WEGMMLW4z34e7P-lM1qFvsCJGZ_o4JNL5NPWbhJPKmcqz6k9bJcyL--8
Message-ID: <CAMuHMdX4kRGLaKMzPuhS1Pmxh609eiqQW-cAS_jWBBbt-vE6SA@mail.gmail.com>
Subject: Re: [PATCH 15/61] trace: Prefer IS_ERR_OR_NULL over manual NULL check
To: Steven Rostedt <rostedt@goodmis.org>
Cc: "Masami Hiramatsu (Google)" <mhiramat@kernel.org>, Philipp Hahn <phahn-oss@avm.de>, amd-gfx@lists.freedesktop.org, 
	apparmor@lists.ubuntu.com, bpf@vger.kernel.org, ceph-devel@vger.kernel.org, 
	cocci@inria.fr, dm-devel@lists.linux.dev, dri-devel@lists.freedesktop.org, 
	gfs2@lists.linux.dev, intel-gfx@lists.freedesktop.org, 
	intel-wired-lan@lists.osuosl.org, iommu@lists.linux.dev, kvm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-block@vger.kernel.org, 
	linux-bluetooth@vger.kernel.org, linux-btrfs@vger.kernel.org, 
	linux-cifs@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-erofs@lists.ozlabs.org, linux-ext4@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-hyperv@vger.kernel.org, linux-input@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, 
	linux-media@vger.kernel.org, linux-mips@vger.kernel.org, linux-mm@kvack.org, 
	linux-modules@vger.kernel.org, linux-mtd@lists.infradead.org, 
	linux-nfs@vger.kernel.org, linux-omap@vger.kernel.org, 
	linux-phy@lists.infradead.org, linux-pm@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, linux-s390@vger.kernel.org, 
	linux-scsi@vger.kernel.org, linux-sctp@vger.kernel.org, 
	linux-security-module@vger.kernel.org, linux-sh@vger.kernel.org, 
	linux-sound@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-trace-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
	linux-wireless@vger.kernel.org, netdev@vger.kernel.org, ntfs3@lists.linux.dev, 
	samba-technical@lists.samba.org, sched-ext@lists.linux.dev, 
	target-devel@vger.kernel.org, tipc-discussion@lists.sourceforge.net, 
	v9fs@lists.linux.dev, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Queue-Id: C8E72265370
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34568-lists,linux-usb=lfdr.de];
	FROM_HAS_DN(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-usb@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_GT_50(0.00)[57];
	R_DKIM_NA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux-m68k.org:email,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,mail.gmail.com:mid,goodmis.org:email]
X-Rspamd-Action: no action

Hi Steven,

On Wed, 11 Mar 2026 at 15:03, Steven Rostedt <rostedt@goodmis.org> wrote:
> On Wed, 11 Mar 2026 14:13:32 +0900
> Masami Hiramatsu (Google) <mhiramat@kernel.org> wrote:
>
> > Hmm, now IS_ERR_OR_NULL() is an inline function, so it is safe.
> > But if you want to use IS_ERR_OR_NULL() here, it will be better something like
> >
> > node = rhashtable_walk_next(&iter);
> > while (!IS_ERR_OR_NULL(node)) {
> >       fprobe_remove_node_in_module(mod, node, &alist);
> >       node = rhashtable_walk_next(&iter);
> > }
>
> But now you need to have a duplicate code in order to acquire "node"
>
> I think the patch just makes the code worse.

Obviously we need a new for_each_*() helper hiding all the gory internals?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

