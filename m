Return-Path: <linux-usb+bounces-31081-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 8247DC99896
	for <lists+linux-usb@lfdr.de>; Tue, 02 Dec 2025 00:11:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 845B54E1C61
	for <lists+linux-usb@lfdr.de>; Mon,  1 Dec 2025 23:11:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 133BA288514;
	Mon,  1 Dec 2025 23:10:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=motu.com header.i=@motu.com header.b="VWZIYX/D"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADA5F2877DC
	for <linux-usb@vger.kernel.org>; Mon,  1 Dec 2025 23:10:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764630636; cv=none; b=D0jgFc3nUBuLc0xn3YxuuATxl5fPHOy3l/dknQBE6jJGvNRMGeUIkHFZknEz3YfZs5LQY5LaFqSrWSL7bvZJsnMqcbqTpmK4fGT1scm/eltKzbdfIRsljQKlJ8y5a4Dt+7u3HSPHkSbOAvOvMYJeG5lcDoBMtXu1uillrtjguaU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764630636; c=relaxed/simple;
	bh=Zag+UVR3msVpA+qVZV9ZjI2E7Uz3+fO7iOpmwtQbehk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=d63NIh1FKW0qAls9IE0TwtA+7xt333Ix2kF/crNP2Y5JQcWH7jVn5I8sArQ1cshIOPczZIidnpvHELKiqzDFBqyLAqhJSbwPIh4+LB305JcYEEyiFNs5utixmpqdawZ2FtkoCMVpvWpEyRgOzFiNNgbJ5R8gaLFqbhkjAedyTV8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=motu.com; spf=pass smtp.mailfrom=motu.com; dkim=pass (1024-bit key) header.d=motu.com header.i=@motu.com header.b=VWZIYX/D; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=motu.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=motu.com
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-594270ec7f9so4789143e87.3
        for <linux-usb@vger.kernel.org>; Mon, 01 Dec 2025 15:10:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=motu.com; s=google; t=1764630633; x=1765235433; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=B03Gy5QMkXEv2ipiITJXQQdqWgCpAx0o53CCJ6DSin0=;
        b=VWZIYX/DcZlqSxKP1X9mgRfvo5sjrp5Uk1oqrdSprOkKZ6qxsWQwauyEI/1kKXv748
         pKIYVAsdJc2lWQDYkHnK48UfTYRnJuYYSD6OnuAJ5r+X6IwjX+Hc+xPRaWBCxp4ODrF3
         /3rNpmDXNpfk4VDiX8oPJf5BXQyns6USSw3RQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764630633; x=1765235433;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B03Gy5QMkXEv2ipiITJXQQdqWgCpAx0o53CCJ6DSin0=;
        b=W240x5T8lRIuCPI5vwdiqoXggs35/iJskaf43qxDQXJadhPNl8vDMWcXQWRREUIwf+
         RvUiZhlncR44j5V6w8xcGVfQa9FIG3gYG0jJjPVswlrsr0U+UPVpIYwHpAqm0FHJ0f6j
         /7OOXxOjEo4O1DTcGCuvDk8DuqJmVPpg/ZyqTgSvQ5bC8M+R/vH32TFUUSRgcAJOqghl
         MPmEZAzyk14eN/DV0CVXnkgOn/MuZ4vyjtvQD9JPwrQAc5nhAyRJ7Ow663cECgEnc+kF
         kZ5aSDOHgiQMTimU5bw9dAJJ2ciVStycdjSVQDQnWwkqlQmrGnB6DsIseenn22TlC1YZ
         /sKg==
X-Forwarded-Encrypted: i=1; AJvYcCWL5Mefgec8Zq/ZGY7NAa8+IGGeg9esyZwy1Rvxlh7iNYLv+O2L66f5xTJ/HNAwOVq7fpXlf4tf8Zg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8DEFtDSu85P/aK8TA+dKbmVZe5kcnUPSh6ZzC/0cQD5gWX3Lh
	wSyEbXrylW7tpxVqDwQ2k3RLEZrw3I9A8dJkoo4XP1nO6tEYqitX1eogfF/lEPrEgijZVNV3KUF
	hXyvaeB+id/OVl4umHZxPO3UMqrKZdg/+RFUCCcgSTA==
X-Gm-Gg: ASbGncvbX+ZMkzFxjtDK2Xg90euVwVm0zF0edwIbIHfpw46Si0Ue+2V6LB5QT9mscVs
	idM+MnxKjJx9ueUQbPJLIDx+GCQj/BygWAIn7N5SipsCtw7jwYQsVpq2mSBaf4aYIeYzSWfwVzu
	IAsqesa1gjYz5hEejVM7vEensdnrMm2mMcyKFRXA1GDDiz53peWmXEjq4fO5APACYxaKl/PzpCo
	v1HQbZ0hsT2cFzTzBxbgoJNzj1MjjJ54JOvFZ+mtVb1u/ECMqyOrPTfpE9o6Q5XP5cU8JSrJp8h
	m1AObd4=
X-Google-Smtp-Source: AGHT+IEH/rLJ/DK0860HOAqpGcmwBeUxOiWUaQn/OzVge4Ic5Y9g39O8QOIjewYjOAIoVHPnQzw0IWjdTzLWrJ2mHkA=
X-Received: by 2002:a05:6512:308f:b0:595:7ed0:9c77 with SMTP id
 2adb3069b0e04-596a3e9f91fmr13260503e87.12.1764630632640; Mon, 01 Dec 2025
 15:10:32 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251124210518.90054-1-dylan_robinson@motu.com>
 <20251129205639.48fdbdf9.michal.pecio@gmail.com> <87jyz7dc6k.wl-tiwai@suse.de>
 <20251130130035.6f44713e.michal.pecio@gmail.com> <87h5ubd8o7.wl-tiwai@suse.de>
 <20251201114705.470325f5.michal.pecio@gmail.com>
In-Reply-To: <20251201114705.470325f5.michal.pecio@gmail.com>
From: Dylan Robinson <dylan_robinson@motu.com>
Date: Mon, 1 Dec 2025 18:10:21 -0500
X-Gm-Features: AWmQ_bmeil3E0q3V9h9QAaMc468zW4PCaRqdn1ABNuE7NNnKqWJjjaPD0Cv_g-g
Message-ID: <CA+Df+jeCQXAuxLp5woF1fb4wgPNcKn7uMNaXnNG6j8EvuKX-eQ@mail.gmail.com>
Subject: Re: [PATCH] ALSA: usb-audio: Fix max bytes-per-interval calculation
To: Michal Pecio <michal.pecio@gmail.com>
Cc: Takashi Iwai <tiwai@suse.de>, linux-sound@vger.kernel.org, tiwai@suse.com, 
	perex@perex.cz, linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> Dylan, could you check whether the cleanup is OK?
> I'll apply it once after the confirmation.

Tested and seems to be working. The cleanup looks good to me.

This is what our endpoint looks like:

      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x82  EP 2 IN
        bmAttributes           37
          Transfer Type            Isochronous
          Synch Type               Asynchronous
          Usage Type               Implicit feedback Data
        wMaxPacketSize     0x0400  1x 1024 bytes
        bInterval               1
        bMaxBurst               3
        wBytesPerInterval    3205

-Dylan

