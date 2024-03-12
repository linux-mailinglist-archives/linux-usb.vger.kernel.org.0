Return-Path: <linux-usb+bounces-7890-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FE28879785
	for <lists+linux-usb@lfdr.de>; Tue, 12 Mar 2024 16:28:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A2CD71F260A5
	for <lists+linux-usb@lfdr.de>; Tue, 12 Mar 2024 15:28:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 048BD7CF14;
	Tue, 12 Mar 2024 15:28:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gimpelevich-san-francisco-ca-us.20230601.gappssmtp.com header.i=@gimpelevich-san-francisco-ca-us.20230601.gappssmtp.com header.b="hf/lWwYS"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B02EB7C6CF
	for <linux-usb@vger.kernel.org>; Tue, 12 Mar 2024 15:27:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710257280; cv=none; b=WWm8AuU7MWXSZ2Awxw9oupNbjRzTVx7kYrXp4+ZZdqXzwwkM40IdTRPRoDnzWMxksd6VqOJEa5BMuiXqtpfkeVcdpwVX5RH0vdU3cLTziKw420OxNbuRwfWS6kF8aHuWalOGUIjWSyTK8xcl7EgfgyFfbJ4ZCztyoFoEHU+cfxY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710257280; c=relaxed/simple;
	bh=9x7gmW0PW/0DLiMSLRFxDFrRlMxTAw/II0C60zatcDI=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:Mime-Version; b=rZWQPNt/ehRJofvWedgiO53ygRyJvC9j9154jlHuFs7m3KbJRg9N2cfrenQgyynwyqPK5YAWID2iWBGkNGrXwZrN3wuzm+sYSw41+7HxajPcZYrKKGLAAhyX0uzFpq+jVJH39BBLHu59tTyJFjFaE/j3fzcS89lSNFRxTBz6mNY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gimpelevich.san-francisco.ca.us; spf=pass smtp.mailfrom=gimpelevich.san-francisco.ca.us; dkim=pass (2048-bit key) header.d=gimpelevich-san-francisco-ca-us.20230601.gappssmtp.com header.i=@gimpelevich-san-francisco-ca-us.20230601.gappssmtp.com header.b=hf/lWwYS; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gimpelevich.san-francisco.ca.us
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gimpelevich.san-francisco.ca.us
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-6e6ac741ff7so435538b3a.0
        for <linux-usb@vger.kernel.org>; Tue, 12 Mar 2024 08:27:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gimpelevich-san-francisco-ca-us.20230601.gappssmtp.com; s=20230601; t=1710257278; x=1710862078; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:disposition-notification-to
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=09ry3ChPcWzKTV1zoBZKh68WCPbJo/4mKo881K4BdtE=;
        b=hf/lWwYSzagdmjxmAVDuQkgMuDEPtePHCnCdnpgI6BdPVt+jDrvP1NM6WDbqYw0kfh
         CdgbkygJnfGm21zWpOoBIuy39NPRocsPm6WiTTK09suuGg+U4E+GFn96XVet/xzLRJ1q
         BJTmRV8cNJnD7C4vtmTb2qeblji4KTNryfv9vm7pwyis01b77NNBNNpFaxYLJkCBPD9m
         yktt5Y5mNK9+BPdSiEBVyNXZXvmjgX9tDH1MR54Qfnt1V6NGABTsuoCakaQk02kizcfb
         DKVv6ocl8RqYzPdljVbZhXpSHt38woavHjqnV6iKIAWyvtMTpb3F631cEM/D4opN9+ff
         fmZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710257278; x=1710862078;
        h=content-transfer-encoding:mime-version:disposition-notification-to
         :references:in-reply-to:date:cc:to:from:subject:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=09ry3ChPcWzKTV1zoBZKh68WCPbJo/4mKo881K4BdtE=;
        b=DZlauRHIdiy8OD0pY2SEcYKo0+E7G5jAkTHVL7Be7iu5Ow90cqmGyk5X8U387K3UiS
         2ZaBtOzz3IT0b+fpG5r0NLnOCyZwKAaJwlan2hDlwvkLsc/YWC+/rbhnwD07kU0oIIGr
         TjTPB/KJOQriuFxhDwV53kt4Mpqt47SOqc/gXTzGHrocLGCP1F52ZYeEXVmY4asdTUVr
         VhUh8on+Eh4+2eEjGW+InAcqgniL4ScamhxCWenOn+GO6wcUZaG8IuBPrENsMjSKCAyl
         zglcv7G0NIjIldX2zNU3Lq2Jld/bT74RAK8MI14cOMf9IQsANDZCe/jBFIg8CwZ/xrxC
         l46A==
X-Forwarded-Encrypted: i=1; AJvYcCXurHNqAeRNHWr2OrVkbjXsjcN6P9nPYxn0Xks5oNKOId2u5jb9H6PtH6BFzcY0fTTuyFMVt+ybhvGf2VDAyTv2ltbNdGI7Vsk9
X-Gm-Message-State: AOJu0Yz0jcuXITSk5QuqG+xQrQw7rcRSfWQ/YKl/6rhRyD4dDto21j+e
	n7RObW+RQsSSexxyWdv2xIcExwMlPU0UDQibbw/fEjBfuQR8mS3u2ekWWT81JQ==
X-Google-Smtp-Source: AGHT+IHtKPct46Oav4ajaejzP7l9gqQqKVZ6mt6+KDMAL8fv8/hAoCA68GH5Tjwq5z0jcyMuVbCZ3w==
X-Received: by 2002:a05:6a20:4304:b0:1a1:20be:6024 with SMTP id h4-20020a056a20430400b001a120be6024mr767588pzk.17.1710257277873;
        Tue, 12 Mar 2024 08:27:57 -0700 (PDT)
Received: from ?IPv6:2001:5a8:4289:6500:7076:c575:494e:a634? ([2001:5a8:4289:6500:7076:c575:494e:a634])
        by smtp.gmail.com with ESMTPSA id z8-20020aa79e48000000b006e6686effd7sm6239243pfq.76.2024.03.12.08.27.56
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 12 Mar 2024 08:27:57 -0700 (PDT)
Message-ID: <1710257276.14565.8.camel@chimera>
Subject: Re: [PATCH 2/7] usb: serial: mos7720: don't advertise
 PARPORT_MODE_PCSPP
From: Daniel Gimpelevich <daniel@gimpelevich.san-francisco.ca.us>
To: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Cc: Johan Hovold <johan@kernel.org>, Alex Henrie <alexhenrie24@gmail.com>, 
	linux-parport@lists.infradead.org, linux-usb@vger.kernel.org, 
	hkzlabnet@gmail.com, reboots@g-cipher.net, mike@trausch.us
Date: Tue, 12 Mar 2024 08:27:56 -0700
In-Reply-To: <CADVatmPE7++_XN9m5jviLd0kKCA3L3GacAFAB8DVgY3j5hxjCA@mail.gmail.com>
References: <20240312055350.205878-1-alexhenrie24@gmail.com>
	 <20240312055350.205878-2-alexhenrie24@gmail.com>
	 <ZfAGpkMT-jaZGXmF@hovoldconsulting.com>
	 <CADVatmPE7++_XN9m5jviLd0kKCA3L3GacAFAB8DVgY3j5hxjCA@mail.gmail.com>
Disposition-Notification-To: daniel@gimpelevich.san-francisco.ca.us
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.10.4-0ubuntu2 
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit

On Tue, 2024-03-12 at 09:53 +0000, Sudip Mukherjee wrote:
> On Tue, 12 Mar 2024 at 07:39, Johan Hovold <johan@kernel.org> wrote:
> >
> > On Mon, Mar 11, 2024 at 11:50:27PM -0600, Alex Henrie wrote:
> >
> > This one and at least one of the later ones are also missing commit
> > messages. Please fix in a v2.
> 
> It will be a NACK from me.
> 
> This patch and other patches removing PARPORT_MODE_PCSPP will break
> userspace code.
> On my system, I have:
> $ cat /proc/sys/dev/parport/parport0/modes
> PCSPP,TRISTATE
> 
> If the flag is removed then I will only get "TRISTATE", and if there
> is any userspace code which checks for the mode then those
> applications will stop working with an error.

This patch seems like some sort of backscatter from
https://en.wikipedia.org/wiki/XY_problem issues.


