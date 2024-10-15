Return-Path: <linux-usb+bounces-16237-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id AE7F699ED79
	for <lists+linux-usb@lfdr.de>; Tue, 15 Oct 2024 15:28:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4AAD9B22245
	for <lists+linux-usb@lfdr.de>; Tue, 15 Oct 2024 13:28:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 085481FC7D2;
	Tue, 15 Oct 2024 13:27:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q/O+o5EC"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E979C1FC7CB
	for <linux-usb@vger.kernel.org>; Tue, 15 Oct 2024 13:27:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728998877; cv=none; b=XoJHBjXXdTRBQXljgGHJojQb4gJUM7NdfFAfgvikKCZYzDKQYi5SQHmXTvf1MuGgOdsNBwbSBESMR5zvcn114VxUB6mngnpmhUDQYycGTeezaYsbgIxK1YUmoW3WlD1RnGj/29/yjb1tc4N0ESEdWlEpXGPg+D15q17NqwJjnl0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728998877; c=relaxed/simple;
	bh=vauM4zjJone8uwTMY1Kmew0FvHO3TZzK6IQ2usMsibw=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bifEZ+o7far6xRKVceDFbmK2VM/mK8xEtcuYsBwUVAXpgNqAZ+lw3MibE8bE135m8NdkzCvJKixZ5qZKVRbCDqEZni1KCvElaaC5bBwbHJ2o+VrGTNIrlCQgs93Dm2Sbttu6gF4UFVOHbHX+7MeXYGss1iqcDWa/rkKEb0U/nbQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q/O+o5EC; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-539e59dadebso3898527e87.0
        for <linux-usb@vger.kernel.org>; Tue, 15 Oct 2024 06:27:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728998874; x=1729603674; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ReVTDH/zso/y6fy9TN41NtzGqkgMEXDn7lHVl3mQ6HQ=;
        b=Q/O+o5ECp/wg1bdFs21LS+cHNQQ5DnkzM0mQ7Pqp3bAp0+54KadIUVrEn6VFDjRHGv
         SScbJuqN7MyMNb86L87bvlm8qWKdR1jvNJWS4lK+14Az5ShvSvVPQIBXMZ2OTs84wxDs
         xnrBQcCROEmFt1EEbBX1KHb08FBMj7jx0pfJbtKlwc4y7IoWilfOFwLhij49X8P0BHVF
         1OGuNTluKgS/di527+Ux+yEtsdTe0f/PCvFcesIJurBouDDsjs0gDiFn62z+w/J5prgc
         912meRyVtvOpWdkuz18YCNH17L8D6aKOKHQ1nQGZTcobj+F6DTQ0t7oUDkIW9ujqj3L2
         2l7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728998874; x=1729603674;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ReVTDH/zso/y6fy9TN41NtzGqkgMEXDn7lHVl3mQ6HQ=;
        b=p1yzWCfVK+6OOEf7JdGrBt2L5etSDwJCzKFDeCFA9TVi/DwHt4ZzXpb6x+XT3AsmFq
         ZPv3FdmC3bXp7TsiCKxXJURgd76PA6x5tsqWP41WMX6eXQp2GSYRLtnmtMWeHSUOVOyv
         O/HwTZe5HSyeiNOmfv57B8YOB6qoQOdmWHmu2NrgiFBQslPXve5VurHMs/h36I4maa1R
         KHnCCMgH/Hs/UgidDQr7Pq/euUbEZ26EjyeFJbiYtRlCsyWz8vROKmJDv2rZDI5g8sBe
         VVrBxIXa/lnQDOf6L7aBWFHQzrrTTLRZAwkRoE3z1gnkjyDqQRWK1tng0iS2xQM98t6m
         J4kw==
X-Forwarded-Encrypted: i=1; AJvYcCWLMcvG95Bg9lA5ZAKcoScJa3nwpJQwlU3/hGs90HU4MCagGjzQchh/Jvxi/w/f5AXAnVffN4vWvD4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxwRo+Qi/suWIk2BVmgNOYmVoyFuTvcd/pw8/OS1MqS/5I5/SHb
	Xii4quCPbyKXvQOwWNn38ZH5ET5d+w62eYKwWDIEToRTL3UZNAmA
X-Google-Smtp-Source: AGHT+IF8hddtPYHlqfbJs+f+wSagtO6fHmviKrm0p9IDyQFay7q6w585ktU/hcePwU5gdDIbdcZ5yw==
X-Received: by 2002:a05:6512:1256:b0:536:7a88:6185 with SMTP id 2adb3069b0e04-53a03f185c1mr259152e87.15.1728998873565;
        Tue, 15 Oct 2024 06:27:53 -0700 (PDT)
Received: from foxbook (bfe48.neoplus.adsl.tpnet.pl. [83.28.42.48])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-539ffff3a05sm168310e87.166.2024.10.15.06.27.52
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Tue, 15 Oct 2024 06:27:53 -0700 (PDT)
Date: Tue, 15 Oct 2024 15:27:48 +0200
From: =?UTF-8?B?TWljaGHFgg==?= Pecio <michal.pecio@gmail.com>
To: Mathias Nyman <mathias.nyman@linux.intel.com>
Cc: Mathias Nyman <mathias.nyman@intel.com>, linux-usb@vger.kernel.org
Subject: Re: [PATCH 1/2] usb: xhci: Fix the NEC stop bug workaround
Message-ID: <20241015152748.3d339c66@foxbook>
In-Reply-To: <033e1f4e-c64c-4e8e-b249-02303e75baa8@linux.intel.com>
References: <20241014210840.5941d336@foxbook>
	<20241014211005.07562933@foxbook>
	<033e1f4e-c64c-4e8e-b249-02303e75baa8@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

> Can we skip the new flag and just check for the correct flags here
> directly?
> 
> if (ep->ep_state & (SET_DEQ_PENDING | EP_HALTED | EP_CLEARING_TT)
> 	break;

Unfortunately not, because those pending operations may (and usually
will) complete before our handler runs. They will not restart the EP
because we set EP_STOP_CMD_PENDING, but they will clear their flags.
So we know that Stop Endpoint is guaranteed to fail, but its handler
will not see those flags and will have no clue why it failed, hence
we store this one bit of knowledge specially for its use.

But you raise a valid point. If Stop EP fails on a Halted endpoint and
somebody else resets it before Stop EP handler runs, the handler will
see EP_HALTED, because Reset EP handler must run later if the commands
were queued and executed in this order.

So if Stop EP handler tests for EP_HALTED, nobody needs to worry about
updating EP_STOP_CMD_REDUNDANT for us. The helper function can go out,
the patch is shorter, and the solution more robust against any changes
to halt recovery code that anyone might do. All that "redundant" logic
becomes concentrated in queue/handle _stop_endpoint() functions.

I think I will do a v2.


By the way, is this list of conditions complete? There are other flags
like GETTING_STREAMS or CLEAR_TOGGLE, but I'm under impression that they
are valid only with no queued URBs, so nothing can be cancelled then.

Regards,
Michal

