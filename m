Return-Path: <linux-usb+bounces-23847-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E4455AB28E5
	for <lists+linux-usb@lfdr.de>; Sun, 11 May 2025 16:05:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 69365173AA4
	for <lists+linux-usb@lfdr.de>; Sun, 11 May 2025 14:05:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4334122D4FE;
	Sun, 11 May 2025 14:05:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TJqRt9dB"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 178BF1BF37
	for <linux-usb@vger.kernel.org>; Sun, 11 May 2025 14:05:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746972306; cv=none; b=Z0TNFSZezgUb2Yuy+MPi67Z3hxKVTbf619Xo98KUj8+6NY6E9nJd+rmQakCSHMKJKSfpEfIX83/fPIKBcqyyz3rZNKLi76A9Z/E4MbNVT4cDALDQhYM++SrcbL9nM4PkF7Qau+bNtyGBkgFHCgKBSzfO3I440OyiDPhv7XrwIlk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746972306; c=relaxed/simple;
	bh=2GaNu/r5+eVXNVhlD+CiIkYbxpGu5/LQ4bHl7YzHZlY=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=k0Tu8uZ2f0xx+IaOv/Tkv8PhDhEgNRUV4zFDF+sW0CwXvZ28cS11o4QGZ2V3tIFYWhH/o8l0uffXrmNLbJAv0GvfzuUEXgGdhEhFW+GViiBarO0GoZVfJza3AK1ZVRa5TfGCgHW/EZFXEn5YLwMiqOBXATtJyG7JNJsNJJY+aN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TJqRt9dB; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-54d6f93316dso4587458e87.2
        for <linux-usb@vger.kernel.org>; Sun, 11 May 2025 07:05:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746972303; x=1747577103; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+zgr4+uaNnu5z0h3OK78axvsvccUaLeVkZo97WxaJbw=;
        b=TJqRt9dB2unj+f6ysXsHT/IvQsx+ICYfn/395u797GltZmPnI+B/7elcS0fNYcOOlw
         qe/LpXLVFCdZ/gnqfjCc6+X0IBd8w+4AKWvFP/G8kUbGnm2gIuKfBBr0l0xKCSZ6TfYg
         PCBy6CLuzZLoGGLpCbwFI3mE6C+0UgTI8QoxNet5uYaHpvnrulOY8oitd9BdJepWzUDI
         jd/G+eRhgkHYIdpklIxbaUDQiP8z/plkaIyl9gd9QXJzLMrEBL+Lu2I/e3MPmglnMeH8
         y2uNQVWaVtwJuCsSldBkntjqmKJYIP5wDxNlWYBTFX092zqUWqevr+EUztQRJUaSCref
         kiFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746972303; x=1747577103;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+zgr4+uaNnu5z0h3OK78axvsvccUaLeVkZo97WxaJbw=;
        b=JYKBJe8FQ2UdSTohhmBGHqljC9Jnxi5X1LYSzSNPCfXE0Te09Wtgd/iFfK8f3QRj9f
         jRQU69Xf/Yh81Ly5aZfK7B3DC99SPRNQ+fJtfFzoJ3f3Gb7PsmCG18McMXphaDNKLz/K
         IWutV8tnXNjPGEyl4N1ofivVUZkCd1gPISgC1JxNkiNMhp1scsXim+PnS/KadSfFH/bd
         aHkbJ2as7/h9y+dsCsTWF3AwC/6qcWWj9CXIwLDaxid81vY0bXiVedjdVW8IF3yF7JfX
         gjU4Gm5978EvlxzENBRaExgPj5gDXooOZv8J5jm01mEqyOWP5MYvsnnRBbd8kViVgOpG
         p/Zw==
X-Forwarded-Encrypted: i=1; AJvYcCWMOjWSejXsz4iMauhPq5Wo3n5L7D9eWkG0Ysfn7b8MptdPv8xwakJvga3zcQwOutrHnRb17m4a78c=@vger.kernel.org
X-Gm-Message-State: AOJu0YzOuED1lwCUrDcJAHVXpjwI8QT1gxNIPgpxi6fc14G59o6xU0HO
	lOenVEBjPqok1RAtI2ploY33tNexWSOJQRN5AEr05p3WRDBl4DAn
X-Gm-Gg: ASbGncumtn9qeXlVboG/okQvU5ncjOQYoZTNNGfce7ZcKxYv5J/kpn41LCZF4xj2SPa
	J38WJa/rTazkZZttXZPVbF9l8lTnf5erUG4RX1IJ4upZQ33njj8+UhPfqrC43T38I6HuZjn364A
	x2YjYWUPCrJYY1wuqvg/IHrn7khwrdof1BSKEEbmAD8o74JmD5a/YVthhzv5UiWa+AGAJiOi1gf
	SNWdabKwi24q6LrMXxMOebFKOXRHrcghfZNCPDyCZKi8MXL0YGsU/Vqgqw99zUGAJpFbQBEhRpo
	KuY3Vmwat6VWKM9hgDWhvKOxYIWyiNigqJwTIYweUnRQmDU+IaenXDENE22metuDHGUw
X-Google-Smtp-Source: AGHT+IF8o6VrXlrAvAqr9GHaYq47fdvzgZuiSUNu3TUlPydfx6lYmLDVuhTRskVZfoA8SPicQnA14A==
X-Received: by 2002:a05:651c:a11:b0:30b:d44d:e756 with SMTP id 38308e7fff4ca-326c46260fdmr44459671fa.29.1746972302735;
        Sun, 11 May 2025 07:05:02 -0700 (PDT)
Received: from foxbook (adqk186.neoplus.adsl.tpnet.pl. [79.185.144.186])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-326c339a30esm9933681fa.12.2025.05.11.07.05.01
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Sun, 11 May 2025 07:05:02 -0700 (PDT)
Date: Sun, 11 May 2025 16:04:57 +0200
From: =?UTF-8?B?TWljaGHFgg==?= Pecio <michal.pecio@gmail.com>
To: Alan Stern <stern@rowland.harvard.edu>
Cc: Niklas Neronin <niklas.neronin@linux.intel.com>, Mathias Nyman
 <mathias.nyman@intel.com>, linux-usb@vger.kernel.org
Subject: Re: Problematic Set TR Deq error handling series in xhci-next
Message-ID: <20250511160457.7c8586a6@foxbook>
In-Reply-To: <65ac6458-1f64-406a-8ccc-0e516dc0c14e@rowland.harvard.edu>
References: <20250509114138.7052dd3b@foxbook>
	<65ac6458-1f64-406a-8ccc-0e516dc0c14e@rowland.harvard.edu>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Sat, 10 May 2025 11:52:49 -0400, Alan Stern wrote:
> On Fri, May 09, 2025 at 11:41:38AM +0200, Micha=C5=82 Pecio wrote:
> > Hi,
> >=20
> > I noticed that xhci/for-usb-next now includes a series which tries
> > to handle Set TR Deq errors. It strikes me as a solution looking for
> > a problem, and frankly creating new problems where none existed ;)
> >=20
> > I am aware of three cases leading to errors being handled here, and
> > none of them is addressed. One is harmless and easy to fix properly,
> > but this series appears to turn it into a "never give back the URB"
> > disaster. Tests pending, I hope to find some time this weekend.
> >=20
> > There should be no need to handle these errors, they are prevented
> > by not queuing the command in wrong states. When the command fails,
> > it means the driver screwed up tracking endpoint state and other
> > things are on fire too, so the actual bug should be fixed instead.
> >=20
> > The case of disabled endpoints is clear: no URBs are allowed, the
> > core is broken. It would be more productive to sanity-check core:
> > detect and nuke lingering URBs in places like endpoint_disable(),
> > drop_endpoint(), reset_device(), free_dev(). If Set Deq is already
> > pending at the time, give back the URB and let the command fail. =20
>=20
> The core already does this for endpoint_disable.  If the others have=20
> problems, could you provide a tracebacks so we can see the pathways=20
> where the problem occurs?

I'm not aware of problems, this paragraph was hypothetical: if someone
thinks that problems exist or should be monitored for, there are better
places to do it than handle_cmd_set_deq().

Today I patched those HCD methods locally to check for pending URBs.
Nothing caught so far, but I will leave this code running long term.

This was discussed before and you said that device reset should be OK.
Users of hub_free_dev() also appear to be OK (they call things which
call disable_endpoint() on EP0 or all EPs).

Mathias fixed usb_set_interface() a few years ago. Not sure if similar
use of usb_hcd_alloc_bandwidth() in usb_set_configuration() is safe?

Michal

