Return-Path: <linux-usb+bounces-32838-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cBMSC9UGeWlrugEAu9opvQ
	(envelope-from <linux-usb+bounces-32838-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 27 Jan 2026 19:41:25 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AA0239943E
	for <lists+linux-usb@lfdr.de>; Tue, 27 Jan 2026 19:41:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 543533066BE0
	for <lists+linux-usb@lfdr.de>; Tue, 27 Jan 2026 18:39:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D45E4328253;
	Tue, 27 Jan 2026 18:39:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="VXM3rjv8"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 327D63271F0
	for <linux-usb@vger.kernel.org>; Tue, 27 Jan 2026 18:39:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769539170; cv=none; b=FHXNZ4d0s8jXa8MIeAWRGkL1hy3zhNHPV7UkeT7PG/0aVO7wbcBr4mJC726YBNZ/LmPSiZEjy9dYcT9WjIDGox2hsC2KhN+V0pSRpJ5x7e7OZ2xNvPaXBk5gCAigAe/+BSlIOO3yJg0FKg8XtuPqDsyTXK5tFUYjPoXzu/4CDV4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769539170; c=relaxed/simple;
	bh=Puce/Y2uoOhkmXAnyMr90G2Ehk1ZPgymehgrzrUE1uw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fxh4VvrDew+ycaPMZNm1ZYvdOour7MFk3nqbxG4n70opfXW6tsVe1cCAc3cMxN6/V9N1n+BmN0ObDqDSfNCaAQGa4/q9IP5g2iHWaUo6NcGN5uJiJZ5oZ7YFnc3lclKiDDCjFuOOpPSTns9lCyJ49ezAzTj7FBDtkULRlLEsZtg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=VXM3rjv8; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-b8869cd7bb1so754879566b.1
        for <linux-usb@vger.kernel.org>; Tue, 27 Jan 2026 10:39:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1769539163; x=1770143963; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=IB3BhFyIjodZhUGQQ41xIA4/U0Zmh362p3tEBCm/trs=;
        b=VXM3rjv8IiKlqWUNDIt8VeIuwZvD98QH8DVIfMhNEfmT7BkE22MMZNnsxzJy2Z/rNk
         R1ZqFFPFAjJQBeyApf1p6hEMTIhlyYt95WIWGbDIRc3qwhxHLI5XtoSPudev1RvPxkc2
         x6svpQp9chqCd/XLOQzc1qMSEceuELFQ9JqjY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769539163; x=1770143963;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IB3BhFyIjodZhUGQQ41xIA4/U0Zmh362p3tEBCm/trs=;
        b=cfxn7KwFIEWk6rYFwvS9l+PCqWQXoMIGUH/3XsN0g1Fp29bBHqvdIiBLEtRLRAORyD
         W2K5vbKgO/WbunbUdT0yEb2KsS5IXI2uFDwE5hgkNmH9S/Nrix4IEaq6toApWIndeGFc
         Gy+c7l1t98sff4MMsVLjL5hahDrAPyhOo4Fn7uAWcyL9aZmnlR0t/4I2wJwv53/q1oMT
         iDfMp8uJ2UNOvl/goYn4gyNf4cXhuiZ3bWLg8cXd6IXIcjlzX+Y5GdrXWDI5rsGOQzcy
         wHrNQvia4lxuU1P5wrXe/TyMN6mnRynhfAdQH1KxU0wU+pgjcGzm1tayUM1NRURYiJbO
         GeKg==
X-Forwarded-Encrypted: i=1; AJvYcCWijx6KU+HBGnqSEV4GIBH5v006noJchsXrsW31Hvc0hDKeFurvnl083Q+TMEChhePEqAAGDIecT98=@vger.kernel.org
X-Gm-Message-State: AOJu0YwUvb4mNvofRIpLt6Js4zghtnW4lmapTgzzDrqU2g+5KlyVg9Uu
	OmcZUF2uUBFy4zC6kudMafTTDJce0xlrrhQ7SEoxDHGG+rR3XnRYR7KaNl/5GjgbiOAtkmJJp+D
	oe3Srmd0=
X-Gm-Gg: AZuq6aJqbKqLttFlWoqN/E9WQpnTgpVQ8gvhWwLF7I4nzQfc2zYGgr4RMy5qfCHCUHR
	z6X8PqiAQfJZh393oHx3J0MgJXWffQqzl1T7ibwLfsMuT/mIqDmZ0yj24fK5ZDbseBTL9V9w7T8
	2JR7DFR17x6UvOXe/TIWMhsmPogoRS5/bHcAdcEG7K+YwZXdZ+yUv1A+Twljp1tLPopddkkehKO
	YO8i6KeMCFC6P6VttrpiLoUbOXV6i/0j+ldES6rwZVm7O47/1gHDl4hiPtCdRv8HZRKx8iCESgc
	7UGugKLV/A2UK/tln0YN0mH5ARMQd3O/9LAO36HFy2fSZC255vknRKTVlZUaiCRnqpCaOmczQIf
	nS85KbI3qEz1sedAW+uIKgYncAwkXFYiiv5i+7ax2bhsDsuMwMpOj+lxaVEWdLuenkzYuBwQtFh
	moEt1HZrusID9KbmE0teZvK7WdIS+ZKY10sZmNYs3KimiJqJAG6zlDtJJUfCts
X-Received: by 2002:a17:907:5c1:b0:b88:463e:b55f with SMTP id a640c23a62f3a-b8dab15bea1mr200618666b.6.1769539163441;
        Tue, 27 Jan 2026 10:39:23 -0800 (PST)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com. [209.85.208.49])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8dbf185214sm17301766b.45.2026.01.27.10.39.21
        for <linux-usb@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Jan 2026 10:39:22 -0800 (PST)
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-658381b28e8so8058146a12.0
        for <linux-usb@vger.kernel.org>; Tue, 27 Jan 2026 10:39:21 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUMDcwSs7gwL3WR1PQD+YbL2F+fIvVmHz0xnaylAIFVg8tVz/qPTqHciq89cBlSi5dzv4fzkhI/o7o=@vger.kernel.org
X-Received: by 2002:a05:6402:27c6:b0:64b:9d9b:f0f7 with SMTP id
 4fb4d7f45d1cf-658a60c5513mr1939607a12.33.1769539160812; Tue, 27 Jan 2026
 10:39:20 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251118051604.3868588-1-viro@zeniv.linux.org.uk>
 <CAG2KctrjSP+XyBiOB7hGA2DWtdpg3diRHpQLKGsVYxExuTZazA@mail.gmail.com> <2026012715-mantra-pope-9431@gregkh>
In-Reply-To: <2026012715-mantra-pope-9431@gregkh>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 27 Jan 2026 10:39:04 -0800
X-Gmail-Original-Message-ID: <CAHk-=whME4fu2Gn+W7MPiFHqwn51VByhpttf-wHdhAqQAQXpqw@mail.gmail.com>
X-Gm-Features: AZwV_QjTvEFSmpHcnOP1NJLVZBe5xlcj-dD5ZtjcNC__rjqudIVF0E_rBxSpQA4
Message-ID: <CAHk-=whME4fu2Gn+W7MPiFHqwn51VByhpttf-wHdhAqQAQXpqw@mail.gmail.com>
Subject: Re: [PATCH v4 00/54] tree-in-dcache stuff
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Samuel Wu <wusamuel@google.com>, Al Viro <viro@zeniv.linux.org.uk>, 
	linux-fsdevel@vger.kernel.org, brauner@kernel.org, jack@suse.cz, 
	raven@themaw.net, miklos@szeredi.hu, neil@brown.name, a.hindborg@kernel.org, 
	linux-mm@kvack.org, linux-efi@vger.kernel.org, ocfs2-devel@lists.linux.dev, 
	kees@kernel.org, rostedt@goodmis.org, linux-usb@vger.kernel.org, 
	paul@paul-moore.com, casey@schaufler-ca.com, linuxppc-dev@lists.ozlabs.org, 
	john.johansen@canonical.com, selinux@vger.kernel.org, 
	borntraeger@linux.ibm.com, bpf@vger.kernel.org, clm@meta.com, 
	android-kernel-team <android-kernel-team@google.com>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_DKIM_ALLOW(-0.20)[linux-foundation.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-32838-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	DMARC_NA(0.00)[linux-foundation.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[linux-foundation.org:+];
	RCPT_COUNT_TWELVE(0.00)[25];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[torvalds@linux-foundation.org,linux-usb@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-usb];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linuxfoundation.org:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid]
X-Rspamd-Queue-Id: AA0239943E
X-Rspamd-Action: no action

On Mon, 26 Jan 2026 at 23:42, Greg KH <gregkh@linuxfoundation.org> wrote:
>
> Note that I had to revert commit e5bf5ee26663 ("functionfs: fix the
> open/removal races") from the stable backports, as it was causing issues
> on the pixel devices it got backported to.  So perhaps look there?

Hmm. That commit is obviously still upstream, do we understand why it
caused problems in the backports?

                 Linus

