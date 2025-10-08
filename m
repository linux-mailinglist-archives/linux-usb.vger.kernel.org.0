Return-Path: <linux-usb+bounces-29049-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BD989BC6941
	for <lists+linux-usb@lfdr.de>; Wed, 08 Oct 2025 22:25:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CA6AE19E4BC7
	for <lists+linux-usb@lfdr.de>; Wed,  8 Oct 2025 20:26:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B8C9A29BDAE;
	Wed,  8 Oct 2025 20:25:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="sxeNVMkR"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 871AE2857E9
	for <linux-usb@vger.kernel.org>; Wed,  8 Oct 2025 20:25:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759955132; cv=none; b=ozgoSWaOJtbeGFJGDUjvgyZGLYP5ApgsXfXBC0miVdIbGbR74tRr8r2sYDocGXD3UTrku1mGM4c7e7RxL5GPIJHusETsjIbNbl5hc59eDKJ33iaSnAk1GwAZMszeSFb6xQP85SrG5FaZzO4uBXaIDzgAfGKwBcAGDRenrXJduYE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759955132; c=relaxed/simple;
	bh=pkF8t1F/yS30PeNW+BPwG2wyZzv9rA3CJHnyM+CBV8o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uHXbnIaPXw3TyMNe0ZMZAv6p0BzgqIT/4wpl9JL0XOL/S/atZpOzpCsin6BGL5mlslcWqXJvFr6lMipD8QTGTSonhhkjrH9V8VZqk5UUuO7Xu8AElB5lM47ze0Uw84B6/Az8uzPgSZv0865yA5K+hei8o57BfyPIRfsxYZYrjUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=sxeNVMkR; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-3fc36b99e92so1076239f8f.0
        for <linux-usb@vger.kernel.org>; Wed, 08 Oct 2025 13:25:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1759955129; x=1760559929; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=pkF8t1F/yS30PeNW+BPwG2wyZzv9rA3CJHnyM+CBV8o=;
        b=sxeNVMkRmvVcIW6G1joRFUabekdHRsrGDJF8sFzTJgn2g+47ANZrKMUjNMjyBlA31y
         8zCPbJcYNoxEYfc4tRYmModsMlOakxwYYvzHcMMPljd2/gsD4I8DdPIAU17Yay6Mq3aZ
         GIxijUzHxSvCgiCpMo06gIe33O6O3pW3eG+hgqwmKcCPSJm88stGNILXlf0i9LaY30U6
         eWeaI5xwWOqgF/AuQWGk01vMyMc8lzwqqNiZgp8iFU519CeRM/Ag69R6d3DgK9wMuDuY
         ipK7s2kXVY8FOf5sEknF57bSytsPwkkJCpnc2VPITsCBQ53j36BwzPIStFvJOX6Yiw+O
         +WHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759955129; x=1760559929;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pkF8t1F/yS30PeNW+BPwG2wyZzv9rA3CJHnyM+CBV8o=;
        b=KTd9sGbidOLvPTfna7S+M+QuRzAHVxLTc2vzgJJL9UsmyqJOqzWOpLnnwXq2MxAF8w
         zEb8MzVIUZmLnz+SQYvN86TKT1/+z63Rcozf3eluBbrKvEsjXDc3QJUL1wDLTUOwPtp9
         1+voHjV3keHrZ2WECGik5T3rMfBsloPPfTZXPXLkq/P9BGH9kAMBEMqpzAAsteo4GHOH
         Xtibc7N0LkHi1/1YoFQx25v2m6dBoTic+T4kfpxKG2clomtqN+51j/WC68sMVY/lgT7f
         NGbztiC0mG6svLg8CpuITa9S1ZBk2HDUJKFozpmkEARrjTnxutxKgo+faJ34PACr/guE
         Rkvg==
X-Forwarded-Encrypted: i=1; AJvYcCXw05JYu0aBd6r+/4wLHwmWIMYJvj/yEx0uBoq62wxADDZ2PPJ11xj6tkTcpb96DsB+pLiDBJxQNg4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/3NJ6C3IG3XSIYrPC2LjnhbDKM27Hn7i+tGvc1E68A5f/5Fqg
	95b4UH5uYKae6TWGgLOYnDmixyCGY41tYj+1e4Awm99fwXCU+A8xBLyRBm5SJh4RQcXHgQvqTTo
	8yWGrD+QRntTAklvY2St3DWuESersx1Y79vdY0bG1
X-Gm-Gg: ASbGncsCRz5CJ6N9fkmnhTBYRiEYHQHFOqUtEufY8XoSIzXK7wcje28sxW7YTJB4hUt
	4rsTksI/OmtizHyOkbiJhmcDSVMkXshOI8XRYu9B+9EjNWmPv4fs4yvUgDQGxSYYbbaPbQwG9fu
	EC4TdUo4qKoVFgDJ3ohBTP206pDAwkKZEt6gQPwz3GdEXHZxpmYU4QChR1Ob41KBV5n00S2E1GY
	SddIRfo/LsoJOz3jz7nv0g+UnacQv6Eywu2Y4xbUXEyi1vsaiRtsiTlRmziqfCVaRZpwLbuG+Sy
	LY8=
X-Google-Smtp-Source: AGHT+IE7vszNjL34ga6ZlF87FGJyCFvkLaT4QME4cTsoSkHUnw1osUy/bHfoR1cCedCCUNKAN+lPRA/JTrLq5/lblcU=
X-Received: by 2002:a05:6000:24c9:b0:3ec:42f9:953e with SMTP id
 ffacd0b85a97d-425829b0556mr6352133f8f.7.1759955128611; Wed, 08 Oct 2025
 13:25:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251001193346.1724998-1-jthies@google.com> <20251001193346.1724998-2-jthies@google.com>
 <20251008160354.GA3764744-robh@kernel.org>
In-Reply-To: <20251008160354.GA3764744-robh@kernel.org>
From: Jameson Thies <jthies@google.com>
Date: Wed, 8 Oct 2025 13:25:16 -0700
X-Gm-Features: AS18NWAXqAZMg1YTF3Xq_FAQ2QhulCuEZTvP8EM0hBHj6dvno26tVBuRXa5noQ4
Message-ID: <CAMFSARfvBQrwdeeCaBbqF++HGNyAza40usFLtAoij4Y52r64aA@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] dt-bindings: chrome: Add Cros EC UCSI driver
To: Rob Herring <robh@kernel.org>
Cc: akuchynski@chromium.org, abhishekpandit@chromium.org, krzk+dt@kernel.org, 
	bleung@chromium.org, heikki.krogerus@linux.intel.com, ukaszb@chromium.org, 
	tzungbi@kernel.org, devicetree@vger.kernel.org, 
	chrome-platform@lists.linux.dev, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> What's PDC? What's UCSI?

PDCs are "Power Delivery Controllers". It refers to an IC which
manages PD communication for a USB-C port. UCSI stands for "USB Type-C
Connector System Software Interface". It is a specification maintained
by the USB-IF which defines a standardized interface for communicating
with PDCs. I'll update the description in the v3 series to provide the
full name for both of these terms.

> This is the exact same binding as google,cros-ec-typec.yaml. Why are you
> duplicating the whole thing rather than just adding a new compatible
> string?

I separated these bindings because they are associated with separate
mutually exclusive drivers. But, I'm fine with adding this as a
compatibility string in google,cros-ec-typec.yaml and will make that
change in the v3 series.

