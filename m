Return-Path: <linux-usb+bounces-33902-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QNEKKji3pmk7TAAAu9opvQ
	(envelope-from <linux-usb+bounces-33902-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 03 Mar 2026 11:26:00 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 254A01ECA1D
	for <lists+linux-usb@lfdr.de>; Tue, 03 Mar 2026 11:25:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D5E2530525E8
	for <lists+linux-usb@lfdr.de>; Tue,  3 Mar 2026 10:25:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 018D6391822;
	Tue,  3 Mar 2026 10:25:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="JLI9UZ68"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22DB1382396
	for <linux-usb@vger.kernel.org>; Tue,  3 Mar 2026 10:25:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772533530; cv=pass; b=t245AILTR5VkM1n+aQUqnZgihsn/fk9dzykyNl+VfKBO3HvZNVP0f3Ta0I9bdc6tNkLJhZBv0hF/qAt15cNeUGkQZZFgfPqw7MG47DtXZlvfIfuPL0AIg+6wnVxxbdbSy7zykynN6/sg+rMlTzudBFcFIuGnT8yn07q1/3bFTuA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772533530; c=relaxed/simple;
	bh=e/wT3DrYCBU8heinV14eNUDYdRDaDOS3L8RHCmQeDb8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=vFByoZ0pD2OJax/9FA9Iv0y/3aJholaqMsskGysT31O5uirtytlyZCXtr3f+XbOK3wVfReZJsKdkjPAipJAQNy8srrs0Rh8bV++wjK7ndSBTjuRQyc3SlUZykYqGdkkuMF1j9QtPCHR1bgKlt4Cnj68+/QznT+BrCbUIcdqDVII=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=JLI9UZ68; arc=pass smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-660a4aa2aa9so7913a12.0
        for <linux-usb@vger.kernel.org>; Tue, 03 Mar 2026 02:25:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772533527; cv=none;
        d=google.com; s=arc-20240605;
        b=LxacXWDEK+EJpXgckZsB0tH9n5s7HfaAVdpMLktkgirY7ciT3zBj4XLZZm0DsNRKZy
         8oLhTfBOwBMflgHIpqyK4C0HjXrgv503nBgshtoBdJY+IePAmpE/UWQcKoOmxcqQsj74
         LBwiQa40HXaBu1xHSTFU+WOo92E/NVVk+MSuesuN3ptyQKqo3QyTDLFlrqvD2Dlzu5yI
         t6sNAO1itRNhwt6tdXGMt1wgHaWtPKgHz/ShWC5kKDmPU6M0wXfA4x2hCjPfEW1za8T2
         03aCbF+d/a4Cm1/uxG+WLoLimB5jtJ7IdnWrcEMAgn1X/1CKN91p4Kgox9bYdSdEI0S1
         YZ8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=e/wT3DrYCBU8heinV14eNUDYdRDaDOS3L8RHCmQeDb8=;
        fh=1WQmLKXddyUNPCHsy3UOPjfJMGxhEx4XBI1xIBRjMhU=;
        b=fLl2oWFEz1+uFMk/l6EHIFbJDdDXcax17c46k9ZuTyZwt0H9sjBtDGOav/ih1i5+WY
         +qKzSGRIRrkVnHKVIyiP58RiyIQzzEZhYpXmv9Y9sDvLpydM9yye8RT3du2YaQHv9CoS
         f8eN9U6NTdlOZo17ztf6R+kMu/GlMx7bqcxLJ0ozVyix+YGFEKvMAr+OefVL+7HF8UEp
         OQtITCpF4o/K9iyQtMNCZgpnNhklKQfF8kTXNt7iXadFLArMi2lLz4aZH/zYzs5A9ktL
         dO07fojK9EZQvJWQynTFVMkf6B53MZpXADrPHdu/Z30nyixukBVOgv6FergY44QkANzI
         1sDQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1772533527; x=1773138327; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e/wT3DrYCBU8heinV14eNUDYdRDaDOS3L8RHCmQeDb8=;
        b=JLI9UZ68kIRjnWrbZV/olVa6cVAcJ0q8OByC8rjV4b+W1Czg6wJLJVkjaOuI2HNxOo
         SZnj4egp6ByEmc1uryuo0L5ZwZ2HvLahoLqKqRzo1iOD0pscbgaKF6fmRyFmMHOQdc73
         XFmrtnuJhzQvlXxssvobZai8D8k3J5XZNW95PKAeIGQktjZYmSkZmjB0bYodXdhXUfha
         nsYHp+Ffj4ir6xobzfGZ3K+jXY4vmMqZUOJRE3muX1KrX7xkfWSfLuJWiXWKsEKdDw+9
         m+vvMYFs//GEhyPORrGzjGSnBn795UKzgA2iANCEFnh4kjrS+a7muAMeUwrie4h6GQud
         cPZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772533527; x=1773138327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=e/wT3DrYCBU8heinV14eNUDYdRDaDOS3L8RHCmQeDb8=;
        b=Y4n55e/K2XQ+D1vdd/HQG+zdQyI30w6iWjctmTQZpQRf44bVOsWPQHdHOf69sQ6nl9
         Y0sMLwEwPJK0O68v6CYoOfCsXTwHTPlGoaqmrwftzU5f6wuVFvhll9/Idk/KU0zogUac
         sfiiAaYH097IfKKPe9Kv7v3hwR+u6ntNlsq1ZyzU9m/Bd2YbzjsyKc07kVwoZ85d9Ygt
         BBkBhFCCjYD3ScgTEcVBVezDg/OFd3kvL5nzqM8UtgVb2GXMOiyO8KQCyztVg97l4TNj
         CV9b7EJpMRzT0CX3T12T+NxYmnRbdUOL36EXGnVLA0NXrXn90iMzPyOoUsB9cbdyv52p
         KUWQ==
X-Forwarded-Encrypted: i=1; AJvYcCVaQlkRMq2EekEw30rj0SH70Gnr3rqQMc8xUbI+601CNszJoeG9wN2ugM+2tH43pQB+OgqrlkvtqAc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwDmVWaNJABIMVBQJgDZJHRknWh4wDO/5TxzIAq/BRZZ/THAq/f
	XldeOdZdgpOmiN32WQSCbAA5ODJk3TFmE5xk0Ne+JWNrWfq+0+Z/gs1QqGonsbj3jr2/rVDyisb
	4qDpRjwyrkAcOD53HY8FtTM1NKD0MYmW/edNCw3zX
X-Gm-Gg: ATEYQzyVhRu6O7JwLXw2PJ2REqUsWhTUMpgJircZxneVmVNMwYnrqFBTPR1CV0Mi2BM
	mk/6RPt1ucCnWt0MG+ocDn4ArwmfET9kmx1nGJHTpfUOpfpha3XLIUhn+Qwb0J2H0Z1ehsFqtil
	1AvU1vrRoXlN4oPb/Z1KWbs80/JQBrZQyc+8Z8v3y39/7IPiVEIwJziwa0YyLzOWU8E28K1A4GH
	WoQp4191u/a0oLa+ZzLdnYz4dF8H8ZFcuRD5WNNv7kbHqdL0/jYEYhHMhEvoVNZRs4Eg0d3k1Au
	gXc37awGC6AT/CtLRtztsaHE4yOr4B7X+WI=
X-Received: by 2002:aa7:d956:0:b0:65a:3856:309a with SMTP id
 4fb4d7f45d1cf-66010ebea0amr358601a12.11.1772533526807; Tue, 03 Mar 2026
 02:25:26 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260221-legacy-ncm-v2-0-dfb891d76507@google.com>
 <70b558ea-a12e-4170-9b8e-c951131249af@ixit.cz> <CAKzKK0p0d1MCuOm1O3JCz3mF8jr+vV3NnDN9Wuc_A2OCgiRz_A@mail.gmail.com>
 <915cc4ae-8bc6-409e-9811-b0e6d2b2d1b9@ixit.cz> <6cb5bd5e-2c83-44de-b3f2-09c110f83ab7@ixit.cz>
In-Reply-To: <6cb5bd5e-2c83-44de-b3f2-09c110f83ab7@ixit.cz>
From: Kuen-Han Tsai <khtsai@google.com>
Date: Tue, 3 Mar 2026 18:24:59 +0800
X-Gm-Features: AaiRm52ycNR3sxD2fWqaftS_CgW-5yEPf5cZ8SO9FdK1myg8enI6aegZh-SirCc
Message-ID: <CAKzKK0o3Ts_e89jT0n_m7EmZwPYSaFo4vKW-ong5BY=1iAEUUQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] usb: gadget: Fix g_ncm regression and atomic sleep
 in f_ncm
To: David Heidelberg <david@ixit.cz>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@kernel.org, 
	kernel test robot <oliver.sang@intel.com>, LI Qingwu <qing-wu.li@leica-geosystems.com.cn>, 
	Ernest Van Hoecke <ernestvanhoecke@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 254A01ECA1D
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	R_DKIM_ALLOW(-0.20)[google.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[linuxfoundation.org,vger.kernel.org,kernel.org,intel.com,leica-geosystems.com.cn,gmail.com];
	TAGGED_FROM(0.00)[bounces-33902-lists,linux-usb=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[google.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[khtsai@google.com,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.992];
	TAGGED_RCPT(0.00)[linux-usb];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ixit.cz:email,codeberg.org:url,gitlab.com:url,mail.gmail.com:mid,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,sr.ht:url]
X-Rspamd-Action: no action

On Tue, Mar 3, 2026 at 1:22=E2=80=AFAM David Heidelberg <david@ixit.cz> wro=
te:
>
> On 02/03/2026 16:41, David Heidelberg wrote:
> > On 02/03/2026 11:15, Kuen-Han Tsai wrote:
> > [...]>
> >> David, could you share exactly what OS you are using (e.g.,
> >> postmarketOS with an sdm845/6.18-dev tree)? Also, could you provide
> >> some instructions on how to build the code and reproduce this problem
> >> on a Pixel 3? If you have the time, it would be incredibly helpful if
> >> you could dive into this a bit deeper on your device to see exactly
> >> how the DHCP daemon is failing.
> >
> > Hello Kuen-Han,
> >
> > it's pmOS initrd, but generally I got reported same behaviour on Mobian=
 (Mobile
> > Debian) too.
> >
> > The Pixel 3 support was merged, so it can be reproduced with:
> > 1. 7.0-rc1 tag
> > 2. -next tree (latest tested is next-20260227)
> > 3. our sdm845-next tree [1] (some WIP patches, working touchscreen on P=
ixel 3,
> > etc.), the tree currently contains the reverts
>
> I forgot to mention, the build is just (considering option 3., which incl=
udes
> sdm845.config fragment):
>
> make defconfig sdm845.config
> make
> mkbootimg (with params seen below)
>
> deviceinfo_flash_offset_base=3D"0x00000000"
> deviceinfo_flash_offset_kernel=3D"0x00008000"
> deviceinfo_flash_offset_ramdisk=3D"0x01000000"
> deviceinfo_flash_offset_second=3D"0x00000000"
> deviceinfo_flash_offset_tags=3D"0x00000100"
>
> You can use Luca's [1] scripts for the processing kernel to be suitable f=
or
> fastboot (appends initrd to boot.img) and uploading kernel modules to pmO=
S rootfs.
>
> Options 1. and 2. won't work directly with fastboot, as chainloaded u-boo=
t is
> needed due to fastboot requiring some ancient kernel offset to be in plac=
e (we
> keep patch to workaround it in sdm845-next).
>
> David
>
> [1] https://github.com/z3ntu/linux-mainline-scripts/
>
> >
> > I can provide log with the patch [2], without the patch [3] (well, it's=
 more
> > like nothing is in the log)
> >
> > I'm very lightly familiar with usb subsystem, so if you give me hints w=
hat to
> > look for (or what to debug), I'll try find a moment to check to move th=
is forward.
> >
> > Thank you for working on improving usb gadgets!
> > David
> >
> > [1] https://codeberg.org/sdm845/linux/
> > [2] https://paste.sr.ht/~okias/35982d7e284ee0f767e57923ced591beb4d3b238=
#L589
> > [3] https://paste.sr.ht/~okias/4e9172a34e4093445536b51e935dbd229edad7b2=
#L613
>
> [...]

Hi David,

Thanks for providing the detailed reproduction steps and logs; they
were incredibly helpful. I was able to reproduce the issue locally.

Looking at the failure logs, the regression's cause is the kernel
returning the name pattern "usb%d" via configfs instead of the
interface name "usb0". The pmOS DHCP daemon [1] relies on this string
to bind to the interface. I confirmed that providing the actual
interface name resolves the DHCP server startup failure.

However, investigating a fix revealed a deeper architectural flaw in
my patch. By deferring the net_device allocation to the bind() phase,
a single function instance will spawn multiple network devices if it
is symlinked to multiple USB configurations. Since configfs only
exposes a single ifname attribute per instance, it is fundamentally
impossible to accurately report the interface name when multiple
underlying network devices exist for that single instance.

All configurations tied to the same function instance are meant to
share a single network device, which is why the original design
correctly allocated it at the instance level. Because my approach
breaks this 1:1 mapping, I will send out a revert series in the next
few days.

Thanks again for catching this and helping track it down!

Regards,
Kuen-Han

[1] https://gitlab.com/postmarketOS/pmaports/-/blob/master/main/postmarketo=
s-initramfs/init_functions.sh?ref_type=3Dheads#L771

