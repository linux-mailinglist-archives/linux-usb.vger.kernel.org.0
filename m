Return-Path: <linux-usb+bounces-26132-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 773D8B103C2
	for <lists+linux-usb@lfdr.de>; Thu, 24 Jul 2025 10:39:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AE1A117244D
	for <lists+linux-usb@lfdr.de>; Thu, 24 Jul 2025 08:39:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 116F12750EA;
	Thu, 24 Jul 2025 08:39:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="PQIdcdgC"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F458274B4D
	for <linux-usb@vger.kernel.org>; Thu, 24 Jul 2025 08:39:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753346354; cv=none; b=Oo4OrT91NrAbnCCvlMEw4AKFZwlR0jkdXNx1nnGSRwWWVG8Xta5JNN7hnTdjisPpAbLHJNQeBTqrcfMHUHSmUM0TqiLOIKg9izAEY3Cj7WJPY6qYblepDdu9GkzUCaLXx7+5b0joPVr8uH9rqSdON+v4dKNeMaz+ytCLvPWLM0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753346354; c=relaxed/simple;
	bh=DPnU95ZJtHDimTEnJ4WU3skY6t7lEUuN/QC7PlHSgdg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KR9Ionrs9UBTbVr+MCiZWUYYBEF510CHApE8GA9IPStIa/6+TvDiYBPK18JwsgKVJJFSPROVemd7V3xThInoCZTij2rFcsrzFpSNwPJglc3+oUkMX1LMQ+/qPYXuOT+04+TdQfME9D+v6UHRRA+qd/pdMnNR4YOTAB08UbZAPYA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=PQIdcdgC; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-b321bd36a41so705968a12.2
        for <linux-usb@vger.kernel.org>; Thu, 24 Jul 2025 01:39:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1753346352; x=1753951152; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=X0HMsTBmbQ4+9APSf+6vM24W99brsJT2SqN+LugoyEE=;
        b=PQIdcdgCHk4ie4jfyyVGcVF0PGD2IHxurDTf+t82dxpMJv7voPv76msuOhK0zu2P8K
         REoCSJU92BMI6KgMs9UBAE/OEAMwC7SJGBi2n/axMgfDYtZQq8mYp/snWU4ajjQRTPX2
         T9zBXfWeIWWEKgqlE+py0zwPPsJDRWccV/Hac=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753346352; x=1753951152;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=X0HMsTBmbQ4+9APSf+6vM24W99brsJT2SqN+LugoyEE=;
        b=rX6n5IV1uBFvhLAq8O3d/3Iy3+L88sgQKKCtwsOOZx/R1ml2/wv49An23W2lJA0AYY
         w/K8edqZe8Y45ZxDGzHLzZs+pNq7Y6J0b9owXYXhKSCFR+dPgTlqBItwyHmhrIiJVBdD
         X61Hi5t/2nrWOtbFwB0oNlH+/Iorl37ytOBZvulpSH6mdmYd1p3tKQ0JFJB38tFZJfQD
         4JBdEtUNGPnjXCaGV3COxNKwENXAU1lAevwwPFm3Cge97WCvoQAUJESVPPOyK14lkkPL
         6odn2OkgSr7+lWg+n9sJsj8m176TOEx3MSAtOx76q/CBsQ7HQJhJga2od4HuEnCaqDPt
         7c0A==
X-Forwarded-Encrypted: i=1; AJvYcCU5c37ONBvqe5q5ZXGnM3RYSsR+aFdZXxMfbCl7XBiKb28ZtvNgCrM80L5KHPoL6auQh5lMwXV/uG8=@vger.kernel.org
X-Gm-Message-State: AOJu0YyNSDA/7KeXDPhefU/qw3ejfaQ/2d0arVX4s4ojcxdHAdyf60jZ
	6/kaAKePkJbEwf4PB5PfNDmLyXmFrZmEeFnidhxhuqkDOJdqAzSj7cs2FHkMNC8KqdJno2mNki6
	1VRt8YSoYEZFPaHtj2X3WDSgVFLMl/PGU2nFuaqrs
X-Gm-Gg: ASbGnct/yhPi71gPWPKcLh1pbRQ/l9pZ+Wm3lef9pqyQ4g3cdw+1lAKtxoDh+G5Ex6Y
	SoEOxwnKMuI5yor9o0Dr/GwQzdI5kocGsKXIsc9PDt1NCLEcI09blxO0mjsBOboMcSHe6l1YVxa
	sgGe+oh2eAuYfqkC1XYluvLLfKStIehaFdt5RcNxNiUZfjlqTDqv5IjH4uu0Rr0aEmN+GfDz133
	8QyT0gCZ/zE7lSWPp3aNoKFG8TMByrkzQ==
X-Google-Smtp-Source: AGHT+IF6GlHoPfQBE7VcJ/+n3gkrTpAcXrzNcm2cizHwNSOzKAmihYyhhHBa69uI0PTyutNd71gW6mxdz1twf+0MKAQ=
X-Received: by 2002:a17:90b:6cb:b0:313:1a8c:c2d3 with SMTP id
 98e67ed59e1d1-31e508172ebmr7030678a91.22.1753346352248; Thu, 24 Jul 2025
 01:39:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250630141239.3174390-1-akuchynski@chromium.org>
 <20250630141239.3174390-6-akuchynski@chromium.org> <2025070143-safeness-prewashed-6e9f@gregkh>
 <CAMMMRMeKyi56Pha-X86BaQwcHGCx-xu5F67HCGZg=Yhxuk==OQ@mail.gmail.com>
In-Reply-To: <CAMMMRMeKyi56Pha-X86BaQwcHGCx-xu5F67HCGZg=Yhxuk==OQ@mail.gmail.com>
From: Andrei Kuchynski <akuchynski@chromium.org>
Date: Thu, 24 Jul 2025 10:39:00 +0200
X-Gm-Features: Ac12FXzobt46uNoTI8Mrqq6Cj9erlIAHq47itWaRXovYE0fFMCg2hJa92bbZ6uk
Message-ID: <CAMMMRMf_qc342=azkU-ceg=f-db2Z9NiONOu1_oRk8tmRL4RGg@mail.gmail.com>
Subject: Re: [PATCH v2 05/10] usb: typec: Implement automated mode selection
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Abhishek Pandit-Subedi <abhishekpandit@chromium.org>, Benson Leung <bleung@chromium.org>, 
	Jameson Thies <jthies@google.com>, Tzung-Bi Shih <tzungbi@kernel.org>, linux-usb@vger.kernel.org, 
	chrome-platform@lists.linux.dev, Guenter Roeck <groeck@chromium.org>, 
	Dmitry Baryshkov <lumag@kernel.org>, "Christian A. Ehrhardt" <lk@c--e.de>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Proposed sysfs entries for V3:

- portN/portN.M/priority, RW.
This attribute assigns a unique priority to each mode. If a user
attempts to input a value that is already in use, the existing mode at
that priority will have its priority incremented by one to accommodate
the new input. Users cannot disable a mode via this entry; disabling
is handled by `active` for altmodes and `usb_capability` for USB4 mode

- portN/mode_priorities, RO.
Provides a prioritized list of all available modes for the port,
formatted as a space-separated string (e.g., "USB4 TBT DP").

- portN-partner/mode_selection, RW.
Write: 1/0 to trigger or cancel mode selection.
Read:  Provides a prioritized list of all available modes for the
partner. Modes currently in progress are indicated by parentheses
(e.g., "USB4 (TBT) DP"). Active modes are enclosed in brackets
(e.g., "USB4 [TBT] DP").

- portN-partner.M/entry_result, RO.
Represents a mode state for this altmode, e.g. "none", "active",
"in progress", "cable error", "timeout".

- portN/usb4_priority, RW.
- portN-partner/usb4_entry_result, RO.
USB4 mode, not being part of `typec_altmode_group`, introduces
additional attributes with the same meaning as alternate modes
attributes.

Please let me know if you have any questions, require further
clarification on these proposed sysfs entries, or have objections to
them.

Thanks,
Andrei

