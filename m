Return-Path: <linux-usb+bounces-32285-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id AB10ED19F2D
	for <lists+linux-usb@lfdr.de>; Tue, 13 Jan 2026 16:37:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1645C302E330
	for <lists+linux-usb@lfdr.de>; Tue, 13 Jan 2026 15:36:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 73E172BE639;
	Tue, 13 Jan 2026 15:35:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XcUdJZ4Q"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6E5330216D
	for <linux-usb@vger.kernel.org>; Tue, 13 Jan 2026 15:35:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768318557; cv=none; b=qKV7GHFUL3YKjiYStGaptbCcECMIWI7mbAcsJGRo8bJcp6u+d0JVv8aUO1XXwpa4FIE6scnmw6fON0dXKvn4X0NF/QkszyOtzOmJtu3SEwuXbUI/ju4rXk4NpBHlDCn+VsyTuMHYkXmIFs6hOKjpePcFnx5kWbjRilf1dDIny4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768318557; c=relaxed/simple;
	bh=AQ9zAzyFG0dSMT6/wMrYq8j5UPJc0JMrZi4DfFoVDYA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=QL+hto0UAOAxZheKNKxIBw4fq1Dgy5Ndl4DZWmNrrMmP6BCX3Y0TVPlKbd5nt97jkaLdLYNY5bXSfXSF+iiMpKuQG2Uictn5TzYrXIVSyFXPK5rwtakTSxDLeVNEQNMswlYAeUCVcxsqd/5IEX0+SEIf9iEwulVimHm+hd7HqBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XcUdJZ4Q; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2a3e79fe2b8so11386905ad.1
        for <linux-usb@vger.kernel.org>; Tue, 13 Jan 2026 07:35:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768318555; x=1768923355; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AQ9zAzyFG0dSMT6/wMrYq8j5UPJc0JMrZi4DfFoVDYA=;
        b=XcUdJZ4Qz9FsV6UCgvQ1PqaJIdmghzeaUhgJXtUClSqvclet8FJfjfy2O7DTeOXVm6
         QnucZ2XGXGrsVNJ9LIWT2CtUz4fS0Yl/DjFZdvYjvbsqF6Hfe59u+LUh5Mu+5KJzaIal
         tCRAX9oruzo/gDJ7rY2EvPj88IsQmC4qI5jJcCWUSlrgE3nuyYLma6w7d6phARcTZAl4
         xQuftqRhNTgIXA8ZV4kfmBXOpabhEHqcbSzZfpeRTFuFLQpK0BQsjnZ8ATCzLYEipU5r
         nknTcRs4rcPMiEWOCY+qs2ecxaJHFgjW/7R11DnyX8UEWKeRgrnTEMUzLgnu91hsBo1Q
         t6Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768318555; x=1768923355;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=AQ9zAzyFG0dSMT6/wMrYq8j5UPJc0JMrZi4DfFoVDYA=;
        b=TCmZ6uE/Ugq0Xt3vlTeI1u60em9XfTMnAOqzJ2e4RnW1i0qK5r6FMl2VVefMG7UNmr
         c6OlMGOOHdNDRG/zIn556QlkgN+YAJUQf4mMKfOtExDUBQAsmjqiZL0AyH050T6vcRyg
         atePpJ8J9HL3PUwTJL57qru1FXD/Jd4sLY+baAPP7D+BPJvKJobIzPS1ebQXleb808HQ
         JglsLsR9glUspj4dljmkJoF6SCEjfOwZId0AG9W5sNdk4U6Aksqa/Lqsrr0P22xT1oLm
         Kj11PxjrQYOnSRcAVdX5sjUVFbtKsG59zutyzQ63c7EFSt4HoMCEUwTezelpH4WX8Bhy
         E/zg==
X-Forwarded-Encrypted: i=1; AJvYcCVQVN3/fyFYX32nsf3UdXG6kXkA14AcfjOp+34mIbQ63H71aRBs1oTasKkaWA78aBEKMsI8upAkLXg=@vger.kernel.org
X-Gm-Message-State: AOJu0YxDth0Xuec7bO1mk0rt9Czon35iXfXZa05KmOEMNjF/LtdCJ8sX
	l+rPIsCfndxsOEAKTJCM89f1q2ZJxq9Tnw6w2rDouVSgSLOwPd/IL6DB
X-Gm-Gg: AY/fxX7jMxglhcZzdUpAmZpWHyys15AoKxQZTYJPjY7Tg/2mQWn1I0tfGWPTUYVJx2+
	L7Vew61NQ+NUoltJB+dpLQ28IHYQ+zwxbSBmjjboBTAcRXlYX2BSIWrZ2Eqm//7I9+Oc2DrCnur
	w9TitS8dA4DHfCyTBzCy50HVRigtOeoGh+HZH9s9hG4TRWW8Ha7vITE1XP5KXaktACH8xiyOQKE
	ZxaUOVfCbRZkPLFJWYqfXGpewVVxIAkBg4SDsOjMY3otYeiXU/zGxSuv5EcInDhtIm9bsu678Tn
	+cKfZQdn49yt63rVbdADjPxqXzgZQPlWIUFy3CBSKa4yHMbF37rxOdgEz7DYjdBiBPr58EE0Oo9
	oPA1E2MG/QeX0BPhZVGYJy6OL8V3UDILY18XPV4j5Rf8UxTXDi6fgvy156qsFuqlXakSLU7X8Xd
	5hGUVY7KWKKA==
X-Google-Smtp-Source: AGHT+IEdduxaTmvli8Wo9ac1cgN32GepZHM+hrD5khorWDZkmu1Kz44msC24N5qoMtHv8XBYXhFaTg==
X-Received: by 2002:a17:902:db08:b0:29a:56a:8b81 with SMTP id d9443c01a7336-2a3ee4e2e1dmr160337775ad.8.1768318555065;
        Tue, 13 Jan 2026 07:35:55 -0800 (PST)
Received: from MiniPC.. ([47.246.98.222])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a3e3cb2d93sm206840675ad.63.2026.01.13.07.35.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jan 2026 07:35:54 -0800 (PST)
From: weipeng <coderlogicwei@gmail.com>
To: oneukum@suse.com
Cc: anna-maria@linutronix.de,
	coderlogicwei@gmail.com,
	frederic@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org,
	syzbot+30b78308ba7e64647ff8@syzkaller.appspotmail.com,
	syzkaller-bugs@googlegroups.com,
	tglx@linutronix.de
Subject: Re: [syzbot] [usb?] INFO: task hung in i2c_tiny_usb_disconnect
Date: Tue, 13 Jan 2026 23:35:47 +0800
Message-Id: <20260113153547.335916-1-coderlogicwei@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <30e2487e-5738-46bc-95f7-8d0ba3ba9b1a@suse.com>
References: <30e2487e-5738-46bc-95f7-8d0ba3ba9b1a@suse.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Tue, 13 Jan 2026 10:49:16, Oliver Neukum wrote:

> For once what prevents the driver from being unloaded
> with a work item queued after disconnect() has run?
> How do you make sure that the disconnected flag is ever read?

Hi,

Did you say that we can't make sure the usb_read() and usb_write()
is prevented after the dev->disconnected is set to true?
It is indeed a problem. I will send a new patch soon.

Thanks for review!

