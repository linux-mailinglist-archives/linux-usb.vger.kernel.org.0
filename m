Return-Path: <linux-usb+bounces-34561-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2LKgEBJtsWlVvAIAu9opvQ
	(envelope-from <linux-usb+bounces-34561-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 11 Mar 2026 14:24:34 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 41C6F26470E
	for <lists+linux-usb@lfdr.de>; Wed, 11 Mar 2026 14:24:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 650943002527
	for <lists+linux-usb@lfdr.de>; Wed, 11 Mar 2026 13:22:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 480982D8391;
	Wed, 11 Mar 2026 13:22:52 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com [209.85.217.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6D26257825
	for <linux-usb@vger.kernel.org>; Wed, 11 Mar 2026 13:22:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773235372; cv=none; b=IO6dwFrMtBty+Q24UQgmLGINOkWg8OciUCSLYOy3A1D4ivpFKGF1vq75ch3bzJr9fcAxLG3mbjLsWclpo8NnhbqPwiMwdeVQXPRtoUyArJNDaxMN0UVOnMG73o99UPDzFzCp2RW84NFGQAgVPp8IwX2FmgX9YrR804yncjC+rUA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773235372; c=relaxed/simple;
	bh=bQRlE5OR+3/41N9B/xBGXfMeOTv3hgeQ2WrY6jcTpBY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=krUc/lCesS5Vib24LERvT7hRlJoWCFHcXrPwyvL47nlhZme1qsNCZUMs0xCnkYcJLrLsTdRCeXxO0MLXhkU0GVdACt3AhcUYIc+bA0GEmr2DOGdkQEhq+ZxggU6qvJkybpiRX/kIR/60eaz3traRr7UuXeeKuI77YzbYQQp1dGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f41.google.com with SMTP id ada2fe7eead31-5fff18d44fbso3421742137.1
        for <linux-usb@vger.kernel.org>; Wed, 11 Mar 2026 06:22:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773235370; x=1773840170;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=34DR94e/1PAvLLEaib58vFA4GW0m5SGe6jvxchEhMek=;
        b=j5EwgUGYiRS1IykNZzIfJBefaSAUXap/EihjCfZAkPVCuwKrRJc8DRwAJJF4YUlyyi
         XPWQ73YtZjj9mQsDnWFiRXL/iSBx7NLbGaD26l1JXVlT0X7HCuVx6O9TvH971aiEO/61
         HwhsOaXzfXbqGbsFimj2MU0rRCdZ83PNg1AxTLaJ+rLlv+JmV56wbHF4Txid7QO6oEMP
         rT2xE2Qp/SWEpi6NhPNnwpo9Uer6l6FOa3I/cg5Co/Tu9WqFaJeAyo8SJ+wg5PWh8n27
         fci8h6EVNJ2R/TxpdWNuUEhYEz8sI5801QaYPRRxHSaXYQyAxMiBa6vNQ4EdLN6OFTMP
         NJMQ==
X-Forwarded-Encrypted: i=1; AJvYcCVGtU2RePOYkIAhZyw/NJDeeMjfTkUmMeulfbhyrlDi8/vdgGC94qGO8PutIB+Cy8jr8dTnDwo3w4Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YzRBgm8SyaINAzasgcFVB7iFaaZVeXEOu8Qrz05iRozA1C6t+Uw
	UYAwv0BTFyXFG9fSp6ep80wtXbABFDjILw6Ljmruy/r5cdXYB57B3iUdMsvdSloSstQ=
X-Gm-Gg: ATEYQzyJCncmW3AY0PypqVFIwD9dD69rs6TwdiTQ4bFSLyCntGZtP8sl+1xZ35Yq+9K
	qq6t1dZftO0SddQfo/xsiYr2f4Vlk3aP/R2PaDCSMB59Vcb9IFW/qISCWVw9yH+k/Gs17rzalHI
	flO7p9oLBuI8hMBZ1IteWFd0ZayqV2SDI6KSoNXSpNAV8Djfxvpk4N9RRm2F5wrl1JgJa1C5D/9
	Qn7cqiWTwVS1hzdRKrVdc4+PoviMnldXgEnLv9k4x9avJslQKvNMgn+1wnVqA4zjuF0Uv2aHsAH
	KP8OxrKE9l96qS+cvPVmaY300t0zORFFwEINt89UmPs/65FFCSUrNYlLhjcFe0J/W9r/Sz8udYB
	p4dD7OZg7hviRVfVZWBvGaCboXncNfBIriDgXD2CItMcgTG3Sc6ZfpUG0GvuazAa+8IMPwxph+z
	0Vw87K6X0gvYwWGlC51EQXCgviEVSvmlntsqLjL6OJRbb8/XofUgXgdGEdZgvkweEc
X-Received: by 2002:a05:6102:2909:b0:5ff:dabc:db3c with SMTP id ada2fe7eead31-601df009f12mr1165327137.33.1773235369954;
        Wed, 11 Mar 2026 06:22:49 -0700 (PDT)
Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com. [209.85.221.180])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-601deaa379asm700919137.8.2026.03.11.06.22.49
        for <linux-usb@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Mar 2026 06:22:49 -0700 (PDT)
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-56739adfa1aso10529613e0c.0
        for <linux-usb@vger.kernel.org>; Wed, 11 Mar 2026 06:22:49 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXyaXt8G5v5ruNTFzcPXksxgoLK4vrZ6C5cK8OR/2gUweuGgwTOdCYEOn6s2fG1myexN48O5YrbkAE=@vger.kernel.org
X-Received: by 2002:a05:6122:1d05:b0:55b:7494:177b with SMTP id
 71dfb90a1353d-56b4752d806mr922396e0c.10.1773234967338; Wed, 11 Mar 2026
 06:16:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260310-b4-is_err_or_null-v1-0-bd63b656022d@avm.de> <20260310-b4-is_err_or_null-v1-36-bd63b656022d@avm.de>
In-Reply-To: <20260310-b4-is_err_or_null-v1-36-bd63b656022d@avm.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 11 Mar 2026 14:15:56 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXQ8Q4jvkgFRJYhghz2BZRDC-9Mk6DbXxuaOc6C9DFHZQ@mail.gmail.com>
X-Gm-Features: AaiRm52J84H77ROK64ZWWtJfaiCpnFeKyoSRmPbi-NC8CN6Ju1TJEFxJU9gZQQ8
Message-ID: <CAMuHMdXQ8Q4jvkgFRJYhghz2BZRDC-9Mk6DbXxuaOc6C9DFHZQ@mail.gmail.com>
Subject: Re: [PATCH 36/61] arch/sh: Prefer IS_ERR_OR_NULL over manual NULL check
To: Philipp Hahn <phahn-oss@avm.de>
Cc: amd-gfx@lists.freedesktop.org, apparmor@lists.ubuntu.com, 
	bpf@vger.kernel.org, ceph-devel@vger.kernel.org, cocci@inria.fr, 
	dm-devel@lists.linux.dev, dri-devel@lists.freedesktop.org, 
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
	v9fs@lists.linux.dev, Yoshinori Sato <ysato@users.sourceforge.jp>, 
	Rich Felker <dalias@libc.org>, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Queue-Id: 41C6F26470E
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34561-lists,linux-usb=lfdr.de];
	FROM_HAS_DN(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-usb@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_GT_50(0.00)[57];
	R_DKIM_NA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[fu-berlin.de:email,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,glider.be:email,mail.gmail.com:mid,linux-m68k.org:email,avm.de:email,libc.org:email,sourceforge.jp:email]
X-Rspamd-Action: no action

On Tue, 10 Mar 2026 at 12:56, Philipp Hahn <phahn-oss@avm.de> wrote:
> Prefer using IS_ERR_OR_NULL() over using IS_ERR() and a manual NULL
> check.
>
> Change generated with coccinelle.
>
> To: Yoshinori Sato <ysato@users.sourceforge.jp>
> To: Rich Felker <dalias@libc.org>
> To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
> Cc: linux-sh@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Signed-off-by: Philipp Hahn <phahn-oss@avm.de>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

