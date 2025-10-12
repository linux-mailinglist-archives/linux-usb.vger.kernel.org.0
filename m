Return-Path: <linux-usb+bounces-29170-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 18CB8BCFF72
	for <lists+linux-usb@lfdr.de>; Sun, 12 Oct 2025 07:01:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BC3753BBAA0
	for <lists+linux-usb@lfdr.de>; Sun, 12 Oct 2025 05:01:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 22D3E1E1DE3;
	Sun, 12 Oct 2025 05:01:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Oyu6BFyC"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F6D61547E7
	for <linux-usb@vger.kernel.org>; Sun, 12 Oct 2025 05:01:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760245297; cv=none; b=PVv7h/D4AzzPM1rybNecYX0uq29bQmu6xlZB9pgM8tFnQWNxGsSg16cUCozGXByoIoljy9pnhUa7B0YiHR8tD97PpBGCTaMSLHKU6gTh6kUZtB3BrORJJE3/iCok04+JA/fK9sfXZWJnGAKsCHqrsk8THDhjTEF/PHFJmYeuu1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760245297; c=relaxed/simple;
	bh=GNNWaZzQF0ewx6demfO5zeCEdBbCs6H/rSe9gnMEA4A=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=jKr7EpTxfw437ZmuWhhdZg8lVeggpmuZcbOuU9mW25LVHPUVfx06Mo3I7knFE3H6N8HYDwIBU2b/QjRwliQYLSv60KC6fkbElWGDVtHAbKJb1QRgQ6YzUa5eJlZv0n/uCCYZzZJu5o10oLu/UkKB9WrrXHNTKjkphRg6uIrYtGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Oyu6BFyC; arc=none smtp.client-ip=209.85.128.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-743ba48eb71so52508517b3.1
        for <linux-usb@vger.kernel.org>; Sat, 11 Oct 2025 22:01:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760245295; x=1760850095; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=GNNWaZzQF0ewx6demfO5zeCEdBbCs6H/rSe9gnMEA4A=;
        b=Oyu6BFyC852yWxygTo5/PW5Z3yNYu+92ItJ2wtLvq5Q+jSGhFjHEAYABy8RplWfagc
         FmDsQzenAJJySs64v4C13WKzb9PBJgBMg0f98/yeRQ7eR8RrGiFUKAHNe8Y0boIxZ9w9
         xdOf0gPTsGYKGxxafjsXG4eOC0A+A2JhAMvfMzIG/X3gTi59t7OAa/o874cYpCHW1nDt
         VKV+muUauOAJhXC3+AKFPGDmpkz2SlykvUosBsFEQXtGuXjylVWb0K0/0AULQ8eorcKW
         7SayD90wdwqIwsk1I5a2j9T5S+rThsRr6ZXam1fymStYynXxMmCgDI/5cNuz3/kTchaD
         r4SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760245295; x=1760850095;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GNNWaZzQF0ewx6demfO5zeCEdBbCs6H/rSe9gnMEA4A=;
        b=bmuyQya9/qJq84mqL1gq0H/aIMDB2CukfPoKSmqc5jdHhLTWH5CjTTgozF+2jhIfzq
         gMdnpQq5eacXNq4Y+4lAhlA+wZJ45AlLxbSs+U+Gm3HIaYgqmL2LNfanmt6VsrGkSaFu
         w5lKGcrTe1lltfHSF2tL1XXBoqCgCpIuQ6f35wLYuT1wHucKJa2vlFtJRom76VLfaker
         Ob5z7V48STONQjYwCzNuYqMhPf7hk1shjjPq95QmqiEf115HhXFAiS9tz5CtgYmdsAJy
         Ac2BoTqBNAqcWsDMfC63MwlyNwZ+ZTlS/2z6S12VBjPYNLvi7gQmIGMq+JF8n4apDDj7
         VZhQ==
X-Gm-Message-State: AOJu0YwFOetB+BSvCfNdHyChmUba6kkcaBgZhTtoO/QTmiB8jUQP4gky
	drOUpsPrH271uEp40SdohWPjvdeBPOyslFiW2tDsmy2o2W2STGNIlqD4vnCOHQL7fhEnAMP0Th9
	MmJMSb2WMy9lj6GxreU8ob+hi4irHpNP8IBuG
X-Gm-Gg: ASbGncsvhkSjFsAyUTHRWcSa77mHjCrLO2nAiRNbBdVCZIHaFtKbZAGtSFHnqS1d0h0
	jDfoihrrsLYdvwv0n672cI+/LawgNyHb4qJlzOS57ApnIDT2rJgGlwjYagAsWx6dEoK2SvjenHl
	tMkpObsFPv7ehct7+HPl/XoFgEm8fFI0wbmu0dPmMEKEW6HUe2Q3XX9IKS4iTrboyZA/v+YwZ8J
	R6K/m9AI497COVKSmJ5YlK3uzRvhaZ4R6DoYgZl6GzcOkLqWoB9wf4pIGydEyT7AJ4=
X-Google-Smtp-Source: AGHT+IEDIMe3ki71+ixXsX7oohPJEsB+Ly/QPCIRc1BA1+a7zTPavkAm/C2qPnifEMwxlpzw8f89D1uXy3ZvW+xvjsk=
X-Received: by 2002:a53:d001:0:b0:63b:a941:90c1 with SMTP id
 956f58d0204a3-63cbe106a57mr18906938d50.12.1760245294875; Sat, 11 Oct 2025
 22:01:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Alex Henrie <alexhenrie24@gmail.com>
Date: Sat, 11 Oct 2025 23:00:00 -0600
X-Gm-Features: AS18NWDZdOc2mL-vrnZiQceVRFNOZcnpvoP6mnBr88fyE3CfdposaEieDuJzL98
Message-ID: <CAMMLpeRU72CMxHdF-rO9y1Nvzj9nPnuQTOZWcCrM4fOJ1byacw@mail.gmail.com>
Subject: ttyACM versus ttyUSB
To: linux-usb@vger.kernel.org, oneukum@suse.com, 
	Johan Hovold <johan@kernel.org>, vojtech@suse.cz
Content-Type: text/plain; charset="UTF-8"

Dear kernel developers,

I am very curious and I haven't been able to find a definitive answer
anywhere: Why is the cdc-acm driver separate from the general
usbserial driver? There are lots of drivers that use usbserial, each
with its own unique protocol. What makes ACM so special that it needs
to be separated out as /dev/ttyACM* instead of going with everything
else in /dev/ttyUSB*?

I can think of several possible reasons, but I'd really like to know
what reasons matter to the kernel architects/maintainers.

-Alex

