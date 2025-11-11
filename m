Return-Path: <linux-usb+bounces-30403-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 31536C4D188
	for <lists+linux-usb@lfdr.de>; Tue, 11 Nov 2025 11:38:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 027F44A087F
	for <lists+linux-usb@lfdr.de>; Tue, 11 Nov 2025 10:28:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC80434C806;
	Tue, 11 Nov 2025 10:28:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b="S677OMUs"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E66B534B664
	for <linux-usb@vger.kernel.org>; Tue, 11 Nov 2025 10:28:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762856912; cv=none; b=u+/GrdMTwpiNtwJX+uOHJXNEvExqq7povNm5oyG7wJUOoYGhfjqShsXaIf7Qr+4nsD/OFNJQbcr4Ddl4vtXAj8PKTsiEvtYNCKHanUY9RhBlNQyphuuUMvT3lu1zBEcdd/dXdUHODeu/7Gx6qEZasL3ltpPVdYf/MH/KixhZ1g4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762856912; c=relaxed/simple;
	bh=AFJjiFOvGyHo0S6e8akF06HQkuXboJRcqUguRvorBaA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pINr16RXsBaBCfv5/XIra/H2I585eFs25+AbnYtPzAtgUSiaPpk0jLH9jigk0Z6vrF/PFAU23IpYOLoQzKafPugK6Q/vW13fdudD2EJ0C9oyPOjSrHpTzbQRTsCdi2z5KKWqFw11wX6ZvCGELzlKtiWu9AtTJJXXtIPbPJbUJvI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu; spf=pass smtp.mailfrom=szeredi.hu; dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b=S677OMUs; arc=none smtp.client-ip=209.85.160.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=szeredi.hu
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-4ed9c19248bso32854151cf.1
        for <linux-usb@vger.kernel.org>; Tue, 11 Nov 2025 02:28:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=szeredi.hu; s=google; t=1762856909; x=1763461709; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=h/p7mEepN8jUuWyprYCkVkbNxCuAN/nU2Y/T4HHlQA0=;
        b=S677OMUsTqJF1qJWtI73xM3czE842pFDa4Z3u6wgcHg/XV9/ynva0/WZAQSUJTVye3
         RAw/yyuEH0ysJcdYdNkFWVhuAC6gwvAe/aOJifEx4sjXEwAkhG5vctExTDyw9eYdZTpx
         KoJTGHwJutDyzWwASbXuKTO+L6tY34jBFFhG0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762856909; x=1763461709;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h/p7mEepN8jUuWyprYCkVkbNxCuAN/nU2Y/T4HHlQA0=;
        b=wOQuOyy6AvuNVkz8BDJbJTke9GGcoYeTBLQ3TuzTxn4nbvAADwPjDt/C+ZZIfs0z8+
         OMT8HRcaA90i8zSAfq4I76rWmpbiwdcRO7AWalfy/vfqXmKSWMnkq5wdOlPCAtkBWra0
         Cc9K+U0OtbIIxtg8fOIOJCuMIQALqL9Os74bKKRONZy5msG+B/FELVrRQMB6xEI7tilZ
         92nAcZ+claNPQuWObhbYEENxQE212bv3cRUKZ04AfCbj9+3zH3isgO/3Ga4fZscxvmRr
         4CELu44JI5aMWtSSaAZ3UhU0OofLgVosFHc+YS15+8eUEDLiGRwitA4c4UXANB2egkbY
         84LQ==
X-Forwarded-Encrypted: i=1; AJvYcCVDoW6LhRRFxYKi3vb1Ed+hZnBdURGjctSCJuWVH2tbiUE9EbdPYAqLLpzQFkE0ylIECR+FOSBMJ54=@vger.kernel.org
X-Gm-Message-State: AOJu0YwoBUIODp/uyv7rFl5ZXpmlW3KrG7hvSaA3NGWE93ew1z/8VVfM
	/5kmwQesGbhs8v7A4bSSNw6fZmXxdlMIb/FvifEOubseVLvf/E4LVwhk+1pj/j0VS/8jiQazDwd
	DLyXeXA4G0A5kP8ZfIxonmoMQO+lIbBbaXPcCnm8k1A==
X-Gm-Gg: ASbGncv8cJCJatcXF4KBFGNQsOLg3LZTwXPI3zCIrG1cahfWLsjmMMhKB612s4Wo2I1
	KRrNBP9qywMbrMoxyhynhI2qj/rRmgzjvRlQteCFZmhb5yBWIOncAH1hHvQpYOKRXQ5mBsaDi9K
	rLEoBxN7x2yrlpisHnKOLXsivo44+aCK7FKQdkj1Ej0/shrvoIhZy9klTqoITQC43CGkdZc6o11
	diru7FWwk46S2n/nm4dPjIZcro26GC8imWPnWyz9pnLdotm4KMpoSO8G4o=
X-Google-Smtp-Source: AGHT+IF2jsXtOYznzAlKiswAAYjfBT86jbKpGaMbobTgICmObIV//j5aCRxdPYkP+19MfGrAnajQvcSXxRuiu1TbWoM=
X-Received: by 2002:a05:622a:1898:b0:4ed:602d:dfb8 with SMTP id
 d75a77b69052e-4eda5043040mr135933731cf.82.1762856908949; Tue, 11 Nov 2025
 02:28:28 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251111065520.2847791-1-viro@zeniv.linux.org.uk> <20251111065520.2847791-18-viro@zeniv.linux.org.uk>
In-Reply-To: <20251111065520.2847791-18-viro@zeniv.linux.org.uk>
From: Miklos Szeredi <miklos@szeredi.hu>
Date: Tue, 11 Nov 2025 11:28:17 +0100
X-Gm-Features: AWmQ_bl7He3VQsld2UXN2E831Naa9ot3hmwpZMaWScQnQVWsufspzsog6zo2yMQ
Message-ID: <CAJfpegv0jMq96xD8gSbMBydj=1wRixVGy+qd3feC2vSSn7v_rg@mail.gmail.com>
Subject: Re: [PATCH v3 17/50] convert fuse_ctl
To: Al Viro <viro@zeniv.linux.org.uk>
Cc: linux-fsdevel@vger.kernel.org, torvalds@linux-foundation.org, 
	brauner@kernel.org, jack@suse.cz, raven@themaw.net, neil@brown.name, 
	a.hindborg@kernel.org, linux-mm@kvack.org, linux-efi@vger.kernel.org, 
	ocfs2-devel@lists.linux.dev, kees@kernel.org, rostedt@goodmis.org, 
	gregkh@linuxfoundation.org, linux-usb@vger.kernel.org, paul@paul-moore.com, 
	casey@schaufler-ca.com, linuxppc-dev@lists.ozlabs.org, 
	john.johansen@canonical.com, selinux@vger.kernel.org, 
	borntraeger@linux.ibm.com, bpf@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 11 Nov 2025 at 07:55, Al Viro <viro@zeniv.linux.org.uk> wrote:
>
> objects are created in fuse_ctl_add_dentry() by d_alloc_name()+d_add(),
> removed by simple_remove_by_name().
>
> What we return is a borrowed reference - it is valid until the call of
> fuse_ctl_remove_conn() and we depend upon the exclusion (on fuse_mutex)
> for safety.  Return value is used only within the caller
> (fuse_ctl_add_conn()).
>
> Replace d_add() with d_make_persistent() + dput().  dput() is paired
> with d_alloc_name() and return value is the result of d_make_persistent().
>
> Signed-off-by: Al Viro <viro@zeniv.linux.org.uk>

Acked-by: Miklos Szeredi <mszeredi@redhat.com>

