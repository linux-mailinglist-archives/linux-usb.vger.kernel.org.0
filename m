Return-Path: <linux-usb+bounces-12199-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5315B930A4F
	for <lists+linux-usb@lfdr.de>; Sun, 14 Jul 2024 16:03:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C0E88281968
	for <lists+linux-usb@lfdr.de>; Sun, 14 Jul 2024 14:03:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33031130E4B;
	Sun, 14 Jul 2024 14:03:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="klCKPYsg"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37EF71BDD3
	for <linux-usb@vger.kernel.org>; Sun, 14 Jul 2024 14:03:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720965792; cv=none; b=UKVmDNwSaOFstbxqep5yGDBCw2zydL3R3/sfm9gPwGu7iO77uy5a9N5o2O2i5a60h9msnWzeZC/SnUsKJ5r+WM5SxfwOhPQi3TOoY+qCGrKHdeg+OjzMZ3eJSwm92+r4kVEkQ71UsqWg1MN7cWYso1ByUUnnRtWMKaDulj7FBck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720965792; c=relaxed/simple;
	bh=nwyh9BboyCh0nMlapqQrUoi7LbOx35nCgYVw8bH/Zl4=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:MIME-Version:
	 Content-Type; b=eZH09VycE7NRx02ENsxeZyyoDlTlu5n5zsg3XnJNS/48njNDpXxizxrOTebBVp48f/dO1F99gTn9e+V52SznCG9fnrTpBynYsW/RypiMeWf3iwdbZQrqlvLvH0Gwb/pcC4PeHzTqsSsBARsGx370X7S9x14iIUdAnKRGw6YvFp0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=klCKPYsg; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-58b0dddab63so5300421a12.3
        for <linux-usb@vger.kernel.org>; Sun, 14 Jul 2024 07:03:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720965789; x=1721570589; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:in-reply-to:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gGS6XmOP9kNRiW6u786yXwFXKK4JlMdbnmwZgISBSyU=;
        b=klCKPYsgV6JdZjxH2Y62f6VbhHBMyrXUfi+6zo4FJOHXEi8LBIUJVlejWEB+HBkDVG
         L44MFsA/KBiDHbEtE3VVt8TgCJA/v+fyV7A7eMn/utlSN9jzER9s82z04JzwKYPE7qvU
         dSrLkvz2hRS/oeXizSEtqwmE2c2J4rEvNCTheqkZU//m2zyJfNKsQO0ebJCgojkB6Unk
         k/CThL0yWLgc00+wLbOgL7xSKiHAa5gDWALrEhzlRpsOceKHRUZYoEbq5MinfN5qwHoM
         ToEjEfPr4peDfTEBW8Y+vIrF+7AppWrY+7FRG0KwN0FTlqHFkm49aQWN+EFZK1n4VY/G
         Tb2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720965789; x=1721570589;
        h=content-transfer-encoding:mime-version:in-reply-to:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gGS6XmOP9kNRiW6u786yXwFXKK4JlMdbnmwZgISBSyU=;
        b=q8KfiCVpxaLmivxWvSOcVeU5BfAtNim1PVZmY+n+Ze9yj4fVABP02cYPsdKGFBAjZK
         bEEQGOqAhA8Eh9EY722zy0JMxaeF6cDYrMgZqZtJ+oWyumQUglG8c5zbGCkvApPDnYtn
         eLcE0M3JDcu59Gff+4MNbVIfWy5KsGueCjKEw+JBIzo+BMufjSOOt/i41k4OvL0qAGSq
         k2iNuowkSVvIIWc1/dgJT6lQQ5SL/lA0JRa6avV73riU3rkgs6MM+cwTViUQropG7Fd1
         fCiIEqGP9+dk0zqbk9FGpFI8SkCKj50+7l88vU4qQfprmZQkwwnljCR2WCGrdt6bGK75
         TboA==
X-Gm-Message-State: AOJu0YwBHrCpJad0ZsdIEN/QFIUGLDKqo9xMPVMECJGYjj3iTpPmkCPr
	Hw6alQ/JXFCzO7fTa/wCFjw01mfgvom0u9hndYcsiuGRZipADF8q
X-Google-Smtp-Source: AGHT+IG0fQJkA/NsWg4zTgcPaoMecxOzR3OJ8UK49e2gc6yy60DAcwA0sn0yPYhmPhk5tiuRB22xWg==
X-Received: by 2002:a05:6402:40d2:b0:58a:d4f4:e866 with SMTP id 4fb4d7f45d1cf-594b9b06ceemr13669342a12.6.1720965789163;
        Sun, 14 Jul 2024 07:03:09 -0700 (PDT)
Received: from foxbook (bip217.neoplus.adsl.tpnet.pl. [83.28.131.217])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-59b26996c3fsm2102430a12.70.2024.07.14.07.03.08
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Sun, 14 Jul 2024 07:03:08 -0700 (PDT)
Date: Sun, 14 Jul 2024 16:03:04 +0200
From: =?UTF-8?B?TWljaGHFgg==?= Pecio <michal.pecio@gmail.com>
To: bugzilla-daemon@kernel.org
Cc: linux-usb@vger.kernel.org, Niklas Neronin
 <niklas.neronin@linux.intel.com>, Mathias Nyman
 <mathias.nyman@linux.intel.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>
Subject: Re: [Bug 219039] New: kernel 6.6.39 freezes with QNAP DL-D800C usb
 case
Message-ID: <20240714160304.5a6390ec@foxbook>
In-Reply-To: <bug-219039-208809@https.bugzilla.kernel.org/>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Hi,

Good job finding the bad commit. I'm almost sure that I know what the
problem is - it appears that this commit effectively disables
incremeting event ring pointer under certain conditions, which causes
the IRQ handler to process the same event again and again and never
progress to the next one.

I would try changing the

    return 0;

added by the bad commit into

    inc_deq(xhci, ir->event_ring);
    return 0;

and see if this helps.


Other than that, the commit appears to be valid fix to a real problem
that may happen on isochronous endpoints when MISSED_SERVICE_ERROR is
immediately followed by STOPPED_LENGTH_INVALID, which I think could
occur. The over/underrun conditions are perhaps possible too.

Regards,
Michal

