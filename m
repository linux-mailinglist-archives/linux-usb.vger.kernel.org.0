Return-Path: <linux-usb+bounces-31331-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FD8FCB0125
	for <lists+linux-usb@lfdr.de>; Tue, 09 Dec 2025 14:37:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2A2D1308F20A
	for <lists+linux-usb@lfdr.de>; Tue,  9 Dec 2025 13:36:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF3D2322B8E;
	Tue,  9 Dec 2025 13:36:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arturia.com header.i=@arturia.com header.b="dxCCDJrw"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD6BA321428
	for <linux-usb@vger.kernel.org>; Tue,  9 Dec 2025 13:36:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765287409; cv=none; b=HNuFbSc9H8hqXSJ3yU+yd5ZcYAXZSJeVxKBONopAnAxaZ2CEvYBm9AAUsO0yPeQqcYsHqJgdznw8GVoucOFQryOqJkqs9UJlOfQWrzf3nnNJqcdOTysId2kVhRlkh8vPDGCQdbyIHnViVL3z8hpB0vxKQTW4DBbacnIlFw8u/QU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765287409; c=relaxed/simple;
	bh=iH+mKip9BThSt4Z1Yt6XIxE/CO4awif4L8UsfkUJYKA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=W89Af0hi1lEucjz90Hk8aw7HW8laL0PvaTx8/k7USOcnvaRLcgOnpyygFuf2nZuiIzRp0pll283DqWq9p7O5fJ+yPpN1ptqPMYQZif20HeIRy9yd2BtHOPxPSIC0ioYzbXhO8nXnv2BDYkHEqQo8OboDImhCnPP9OQhUCcVWslU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arturia.com; spf=pass smtp.mailfrom=arturia.com; dkim=pass (2048-bit key) header.d=arturia.com header.i=@arturia.com header.b=dxCCDJrw; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arturia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arturia.com
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4779ce2a624so72155305e9.2
        for <linux-usb@vger.kernel.org>; Tue, 09 Dec 2025 05:36:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=arturia.com; s=arturia; t=1765287405; x=1765892205; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L47NwAZXapx1ZFaEBDIq979VM6cx+Hx9xyj4bcjltKo=;
        b=dxCCDJrwL9zenC8OBC8MCmiKyWw/z6FxnNvVh36LV273xK2pSTqA4F01rVSMNpQnnP
         KMUhzamIfEweQROXrsmh58Z0O4IXg8Dc96sBCxCHlxacZzqG9YUyZfZOPKibXfaHSiF4
         o2g5x0rersFUNHR3N1UBm1PvrWBYwTmzFZYNZaHsLDhyX3NCik8brg9pX8MyEHMmIPOy
         BpmvQOprli9XxaQQ8DA2lrREPn4VrrcEumIY0Q4ZqevhSTPtqaM6O1pQhYeExYmZoXaT
         hApd3Y3AfcEZSZ1wjkyCtzEnbrLiAVam7AXH8TlA9x3f4jlgcP5nsw8bz2hcvOuv/Pxo
         vK0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765287405; x=1765892205;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=L47NwAZXapx1ZFaEBDIq979VM6cx+Hx9xyj4bcjltKo=;
        b=VarvYtb6njGE7iZQn1MPSFZNvG04ZALDCHnPG11alord3Wjlc94f2mzEXiP0sSdeTq
         AYmFXbuAV8m3Y51rGWsJnQraxlrp++8I7Lau40YCYEL0CDEBCSTf3PvAPoYW5NqVE/RC
         UVv+/reoF9CuLFwweM1OuPvsKj+WvUCj+o6ocE9nw8ztIxU/KmTSFmeqwCOjn0aEmdvp
         dWNXrxVAP8ognLm84l43oBzGtQc2Wngb8cS+ykJgcdfn+QSlLIRPOVEj/0Aw7FH/rQ0y
         zudo+WD/8D7BY1wXXrApbMRuDYVR6xPlz60dyvhwCNzGZxVZ6nYm3zzyaCz0QaZdr3Z6
         nVvg==
X-Forwarded-Encrypted: i=1; AJvYcCUIA4wQ1XixRA7TBtLoFIjJp3sVLzUGHVERyYlfWUI8mrspENIA9CgqAMwyDqEuFWKhfV/cPtUvpRA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwSaZoanFkAe8JTru0TNSEiXQiG5A1zEPunq5eu4aqGO/8k5k6b
	Pgk8BkOt0ti72wzPILPHCet/kba2GJQQDhqTG/ScFUmwGaoxPCQARuecnojHtqu4mbQ=
X-Gm-Gg: AY/fxX5NvAxhEe49YwKtNsAWfzcsBWd+kGcRgSkA59zMvH+AukVmc/EzsNNSfTFm7pm
	O4cyJiuDGTyto9acvnISTHqcPNsk/EKKrM1vj4hkepG/gD0XVM55uUTB9SPrqnwHKU7EdN1HTg3
	Fv0dHdHAPygrEfQY/+JFvR/atev4Erxs+8XLia56rm22kGTXuua9LJnmGG3nsA/WnkkxYTnrXqb
	6solzzOPM++Q1ijHanvg7Wta6XorwAUKMyxLQa1C5iTkre+BJ26k0BOLACAktVBHoaIovm/K+iO
	jbY+iVaWynvTr9vvc8U7bqskO69v+5cHnt02Z2aFCf6Ysk/YU+olWMfy4GMuCP1boMPJuH9I9DG
	f72Ob6r8mjFzdwD5+9OFwou1y/s8MU0kqFGxQdTm0EkQXA8EWsX8JDkZXFel9D1cCqNK8Ff5M2X
	TpI8EN2jClZIFOrSyc/wyjgoOWu/LAEU+nT5KgQA==
X-Google-Smtp-Source: AGHT+IGAYkGZwdzbJRIlZugFkToaxLmToprgNx7g9MCnu51+1onFFMptY/5Qd8N5T9/q+oWVJu227Q==
X-Received: by 2002:a5d:584d:0:b0:42f:7616:6c6b with SMTP id ffacd0b85a97d-42f89f094c8mr10395465f8f.8.1765287404957;
        Tue, 09 Dec 2025 05:36:44 -0800 (PST)
Received: from localhost.localdomain ([2a01:cb15:854c:e000:e58b:a5ca:200b:e2e2])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42f7d331e62sm31617885f8f.35.2025.12.09.05.36.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Dec 2025 05:36:44 -0800 (PST)
From: Victor Krawiec <victor.krawiec@arturia.com>
To: tiwai@suse.de
Cc: abdul.rahim@myyahoo.com,
	gregkh@linuxfoundation.org,
	jilliandonahue58@gmail.com,
	jkeeping@inmusicbrands.com,
	kees@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org,
	victor.krawiec@arturia.com
Subject: Re: [PATCH] usb: gadget: f_midi: allow customizing the USB MIDI interface string through configfs
Date: Tue,  9 Dec 2025 14:36:43 +0100
Message-ID: <20251209133643.52560-1-victor.krawiec@arturia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <87a52gb9cr.wl-tiwai@suse.de>
References: <87a52gb9cr.wl-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

> SNDRV_DEFAULT_STR1 is NULL, and this fact can simplify things a lot.
> 
> So, it's better to initialize explicitly with NULL instead of
> SNDRV_DEFAULT_STR1, then you can just do NULL-check of the pointer
> without the use of *_allocated field (that can be dropped).

Thank you for the review. I apologize for the delayed reply.

In my next iteration I will drop the *_allocated field and do simple NULL-checks.
I will also update Documentation as I realized this is missing from the patch.

Best regards
Victor

