Return-Path: <linux-usb+bounces-19546-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 37CD6A17398
	for <lists+linux-usb@lfdr.de>; Mon, 20 Jan 2025 21:30:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 748311651C9
	for <lists+linux-usb@lfdr.de>; Mon, 20 Jan 2025 20:30:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F1FDB1EF0B8;
	Mon, 20 Jan 2025 20:30:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="gBqQ0lL7"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F23D1494D9
	for <linux-usb@vger.kernel.org>; Mon, 20 Jan 2025 20:30:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737405035; cv=none; b=kl3Zd5zsW+CXqxXhpEzrl6VWfSd1YVpgyCzebLwYQ7hNYliliDvnrDAS+tiUvVv09b5lp1QbJ0s/aEH386FpbqjluFtD+lQyZx8HQq61zssUChi0LrpSI5Y7yBfyA2DBpAaxiwtD8GU6P9GkwrtNJYQt3Sj9RwMbkli7iAIzDNw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737405035; c=relaxed/simple;
	bh=TWD3JGLyhz/e9thz/ZOcsZ7iaRrCaBko5F+YDyBI/W0=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=O28C88pEYNXFUog+w/Y20ylDa1JWbTHr5xHhzxYvg9tEJTssUnsDlLFa4JJveLQK2aUta4lHSS7xxZ3os0yjq62X0SnXcwevz6h8OKE875pzjOO4rwzS2wDngk7F8PyNv4ffz/jkzXpFvlzqv9i/R7W69wUaWBR3KopwkMNl9mw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=gBqQ0lL7; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4361f796586so53822415e9.3
        for <linux-usb@vger.kernel.org>; Mon, 20 Jan 2025 12:30:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1737405030; x=1738009830; darn=vger.kernel.org;
        h=content-transfer-encoding:content-disposition:mime-version
         :message-id:subject:to:from:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TWD3JGLyhz/e9thz/ZOcsZ7iaRrCaBko5F+YDyBI/W0=;
        b=gBqQ0lL7WaJ8ikpGiPFpTu7Gol2ogEAqqroy4WZ9TsgVR6UXJ7yYxagFxM7RcC+cAO
         9Nl1y/fDszgBQ6qw9uvQkQ1J6Kr2qtZ6doY7gqOhO07JbL70RjOBXbXBWLX++bFM7aFA
         wdAcz02KYU88y+mSiIO8nQ2TbRMlq7lBVL9Pif+rvy6y0/hrBhXnlPE7ewhI3wYPzXt5
         gP/akHDILdXc4zpSnoxLaqvI36YNPbkt/XRyfTORJdL7TdMWlYpnsXm/XTJsmBwzD9ud
         uaqw3AnZWROom0CDGDReoJJdS9eERcqyDSHNsH7XVrXGKBwcvRhg+J54woY5yT3RryK2
         WzKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737405030; x=1738009830;
        h=content-transfer-encoding:content-disposition:mime-version
         :message-id:subject:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TWD3JGLyhz/e9thz/ZOcsZ7iaRrCaBko5F+YDyBI/W0=;
        b=OHriV767ufC1i8Xo8R6K1sAjvHbktPuH7Bd4YNhtGkVUOZCMbXYChcRzigmbmNX9zX
         QxQYgHTqNnBPHooP7gGnxqu8T41WlDqIPH9Zqsr0E0tMk0EaIPdQZmnzv4WeCQYVqqtq
         aI+Nd4XB/Cbu5XJRsqNAKjzTK2XpHISbS/kUsZg2cSTXkLUejF2sdu1bp4R5Vefn2TwW
         wBT5GbBE1gBeFdV8SSiK5//8V0NDCsL7cLdIsBKwoAeTPu2btQ/UTfVye9qK2hSSNKeT
         l7D5TNUh2FnHpAtheCGA4rO3IN0EotGXtK2lf1ul2Mp/ks+3dpwslwHg57BhMPk9ebHg
         lI2Q==
X-Gm-Message-State: AOJu0YwWcKhdwaXU65zGFWx3n5wippaZpFg7DHRFj/SermfvgX6PND4O
	woK0E2lI2OcSl50tYDu5DXlpP1zenSLH8R7EW8rhmXi4bcoxJ+s77lYCQCTI5zWCLXuz/RIzGfu
	l/0Q=
X-Gm-Gg: ASbGncv+VVBgbJyyqdkjOp+y3nUN3HXaWApnpEqS3kKhYh6g72oNM+/BVp2K/s621F+
	AHdEG3FQ7uKMPzDWuGs+CAFtACvjw7S3lhZR0G2sFlvIWlWxatzehMFXIyrs5PUKXrMjtLM8l9c
	JDG+8jcQ+toWnjfU8n1cJXSLXgeuYAq6H2dNtRfwjVErJE8zLfkpfgO7xm7OOdGC7HHL8Zr+oCO
	Q/ExU2IKHqckE6KmVnLfX/gBR70ua5Wo1tz3gc/02sMxEn6Iawn4ReC3m3zog==
X-Google-Smtp-Source: AGHT+IHnr/uK/n+3dNVa0Iiqzv61MXFmENJe0An5eqc2kvhIuwOywSf80HE31iImwy2MPDlGaRSzGw==
X-Received: by 2002:a05:600c:3548:b0:434:a1d3:a321 with SMTP id 5b1f17b1804b1-438913c6150mr134912855e9.3.1737405030187;
        Mon, 20 Jan 2025 12:30:30 -0800 (PST)
Received: from Red ([2a01:cb1d:894:1200:4a02:2aff:fe07:1efc])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-43890413795sm149683015e9.14.2025.01.20.12.30.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jan 2025 12:30:28 -0800 (PST)
Date: Mon, 20 Jan 2025 21:30:27 +0100
From: Corentin LABBE <clabbe@baylibre.com>
To: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-fsdevel@vger.kernel.org
Subject: ch348 serial failling on linux-next
Message-ID: <Z46yYyL1Aju_UNyo@Red>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Hello

I am working on mainlining ch348 driver and I have some CI test to verify it works.
The ch348 is an octo port chip, and for testing it I did the following setup:
port0 to a FTDI, port1 to a pl2303, port2 to another FTDI, port 6 and 7 linked together.
For each couple, I send/recv data for a list of baudrate and compare results.

My test suite was okay on stable, 6.13-rc6, but when testing linux-next it fail since 20250110.
And only on port0<->FTDI.
I bisected the issue to: libfs: Use d_children list to iterate simple_offset directories
This is totally unrelated, but the fail is not random and persistant.
I tried also next-20250113, next-20250114, same fail
In the mean time, 6.13-rc7 came out and works.

What tool I use to detect it ?
I use https://github.com/montjoie/lava-tests/blob/master/test2a2.py
./test2a2 --port0 /dev/ttyUSB1 --port1 /dev/ttyUSB0
serial test v0 for /dev/ttyUSB1 /dev/ttyUSB0
DEBUG: serial test /dev/ttyUSB1 /dev/ttyUSB0
TRY /dev/ttyUSB1 to /dev/ttyUSB0 baud=9600
DEBUG: send_recv 32
DEBUG: sent 4/32 sent=4 remains=28
DEBUG: RECV 0
DEBUG: sent 8/32 sent=12 remains=20
DEBUG: RECV 0
DEBUG: sent 14/32 sent=26 remains=6
DEBUG: RECV 0
DEBUG: sent 6/32 sent=32 remains=0
DEBUG: RECV 0
DEBUG: RECV 0
DEBUG: RECV 0
DEBUG: RECV 0
DEBUG: RECV 0
DEBUG: RECV 0
DEBUG: RECV 0
DEBUG: RECV 0
DEBUG: string are different

So /dev/ttyUSB1 is sending data to /dev/ttyUSB0 and the latter never received it.
Same problem for the opposite, /dev/ttyUSB0 to /dev/ttyUSB1

Nothing could be found in dmesg, no clue.

Okay now, I dont know how to go further, the bisect result is too unrelated to the problem.

I have retried a second bisect from a different start/end
git bisect start
# status : en attente d'un commit bon et d'un commit mauvais
# bad: [0907e7fb35756464aa34c35d6abb02998418164b] Add linux-next specific files for 20250117
git bisect bad 0907e7fb35756464aa34c35d6abb02998418164b
# status : en attente de bon(s) commit(s), un mauvais commit connu
# good: [5bc55a333a2f7316b58edc7573e8e893f7acb532] Linux 6.13-rc7
git bisect good 5bc55a333a2f7316b58edc7573e8e893f7acb532
# bad: [195cedf4deacf84167c32b866ceac1cf4a16df15] Merge branch 'main' of git://git.kernel.org/pub/scm/linux/kernel/git/netdev/net-next.git
git bisect bad 195cedf4deacf84167c32b866ceac1cf4a16df15
# good: [e8c0711b153b0db806410d8b31ed23b590f4eab4] Merge branch 'xtensa-for-next' of git://github.com/jcmvbkbc/linux-xtensa.git
git bisect good e8c0711b153b0db806410d8b31ed23b590f4eab4
# bad: [be4d7a3e7815249ca857f618dee81549f745cdbc] Merge branch 'docs-next' of git://git.lwn.net/linux.git
git bisect bad be4d7a3e7815249ca857f618dee81549f745cdbc
# good: [19096ecb142b72cebf03d8316c1d96192620e23a] Merge branch 'master' of https://github.com/Paragon-Software-Group/linux-ntfs3.git
git bisect good 19096ecb142b72cebf03d8316c1d96192620e23a
# bad: [51af4bb6edb606a7d1160323d65e6715969124e1] Merge branch 'for-next' of git://git.kernel.org/pub/scm/linux/kernel/git/printk/linux.git
git bisect bad 51af4bb6edb606a7d1160323d65e6715969124e1
# bad: [9ce2f898c13763037516269044d4658a2eabde61] Merge branch 'vfs-6.14.libfs' into vfs.all
git bisect bad 9ce2f898c13763037516269044d4658a2eabde61
# good: [3be5a57e3e36d3c2b6532a2262472199da972407] Merge branch 'vfs-6.14.misc' into vfs.all
git bisect good 3be5a57e3e36d3c2b6532a2262472199da972407
# good: [fda429aeb9f70b1f4f3b63d80f40e442a24f985a] Merge branch 'kernel-6.14.cred' into vfs.all
git bisect good fda429aeb9f70b1f4f3b63d80f40e442a24f985a
# good: [3ab8a0b2a0ff1038412cd644b51714e35970f415] selftests: add listmount() iteration tests
git bisect good 3ab8a0b2a0ff1038412cd644b51714e35970f415
# good: [5f677209c2642cf289867ca86f65a04c47265109] Merge branch 'vfs-6.14.mount' into vfs.all
git bisect good 5f677209c2642cf289867ca86f65a04c47265109
# good: [b662d858131da9a8a14e68661656989b14dbf113] Revert "libfs: fix infinite directory reads for offset dir"
git bisect good b662d858131da9a8a14e68661656989b14dbf113
# bad: [b9b588f22a0c049a14885399e27625635ae6ef91] libfs: Use d_children list to iterate simple_offset directories
git bisect bad b9b588f22a0c049a14885399e27625635ae6ef91
# good: [68a3a65003145644efcbb651e91db249ccd96281] libfs: Replace simple_offset end-of-directory detection
git bisect good 68a3a65003145644efcbb651e91db249ccd96281
# first bad commit: [b9b588f22a0c049a14885399e27625635ae6ef91] libfs: Use d_children list to iterate simple_offset directories

Since 2 different bisect point the same commit, and that the issue is not random, I am confident the bad commit is the real one, but why ?

I am trying to create a second setup to exclude hardware problem, but hardware will fail always and not only with some commit present.

I am a bit lost

Regards

