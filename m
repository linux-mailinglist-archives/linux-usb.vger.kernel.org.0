Return-Path: <linux-usb+bounces-31752-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DC2FCDC12E
	for <lists+linux-usb@lfdr.de>; Wed, 24 Dec 2025 12:07:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8ED9C3041CF6
	for <lists+linux-usb@lfdr.de>; Wed, 24 Dec 2025 11:07:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ECA5231A57A;
	Wed, 24 Dec 2025 11:06:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BFIHaniS"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com [209.85.214.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 341E517C211
	for <linux-usb@vger.kernel.org>; Wed, 24 Dec 2025 11:06:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766574418; cv=none; b=glCN/fyekAP0bT2DXuR5Mfj5vRFPA3pUAbvPuPwMY7UW8K5dLzmhHBuMFKM2nFecqhKOYKm6dBOLfW2L2AFL6HfeTUtbtuOOG6M4dy7AY4tyIy89mxw0lK/kAZvPc4TLXMFNVuxKiy1g7SwDVKdPfFekDesaigMSnyo6Ym1U8fA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766574418; c=relaxed/simple;
	bh=rNFO7MD+BgEvWfEzhHmD2NN0+Ksk7IDHuVrqB5FIZPA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=TKL5K6J8hsNELlTIYj+xeydT8+xOQNUVmDtuC6+cjFTWkDMZRLhSDOM+TxGNdogevuHrJjcLufNoonEE4axulPJH69y6Fn2Jz+9bnh80KxSmMI2T2C7EVLsn0PVxrd0RWEnUenmaQpMycCFsA/Z5QDcgT2ymETShS0U0uj82Yig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BFIHaniS; arc=none smtp.client-ip=209.85.214.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f195.google.com with SMTP id d9443c01a7336-2a0c20ee83dso74002895ad.2
        for <linux-usb@vger.kernel.org>; Wed, 24 Dec 2025 03:06:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766574416; x=1767179216; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rNFO7MD+BgEvWfEzhHmD2NN0+Ksk7IDHuVrqB5FIZPA=;
        b=BFIHaniSjyXlRM6JLOIInnU25nf4pJRiJApJIK6oyLAUWbyziTRWBPZlT+TQ5G/6/d
         tIfY+k30HooeGBgArhZkK/OeRMu4it8cTrvlFwesq/1SUkgBjInQ9zyruntjVc69ZhWA
         INBfeSv+EQ1DM+cBKg9hux9bhIpw4D9JiDLW2cKqnFWuNlsvYEv2Od6MO40OByVm5jeB
         jbISEdaBOnjIlIhJ1j/wFJpz4c/jZBaeQzI5vvrUVMIrotalymhhj/8NVTovndzrvg7d
         fFXaYlsJLwjn8nvOn1/ojBoMnqJwIocwuC5A9KJUsZ/UG4ak8gSDTYEeGu18FbB4Qv1y
         b2rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766574416; x=1767179216;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rNFO7MD+BgEvWfEzhHmD2NN0+Ksk7IDHuVrqB5FIZPA=;
        b=Z+VWsts5ZKvYW1UYP5sgxL6O17yhukmTTvRfsN+f4I45SqVHo9XhlaxgL+LVdxdWKC
         V8sI7EziyD4xFl0fs6TFOLYNms8tmt4iVDZ/Y9tMGGTi7qRLJBD/GvIYrWT7VcQ8VkbW
         b9JlzMwUUrLD/E1gzvwoLKAPlbrlnSiSt42s//wTHV9P1zmBSUYj6fIFlyJMgAil6MR2
         FXCpjg/RrAQxIRFYFSe0OP5W+uUC/GtVmsId5PuWunYCM/QuB92/uv+r3PIfzuAw0zJP
         6J/A8/qexd6csaq8tkAZ47DlyvJUmsr59jnLL51E21xIqi7DWVbqQiQZOxOQCoYmlPxT
         Bn6Q==
X-Gm-Message-State: AOJu0YyRsPwXBFxVE0lmg61uWEMRKLU+NaHAfXDIoGeCIyNrPcBXvCjr
	t/nA9mYP+MbwpT+XRvI0I9Nypm+duQ/ojDpOIRgzY8cowYdMFT6mhDmc
X-Gm-Gg: AY/fxX5Pn0qPIw4pWb2yBOjyXiApF3cu03PtWWcKg1eLlAqT5a/N//TWDmS3qO41zdH
	yK9IP/lXUPs+1sK9oxupQzeUJXejlR5tRm5VvDQQzWEKX13v3LzOrC91lfKMmwwiH2Yd2dxqsS7
	oGzjs8Oyj/P687eBUBNmQG6q8K4anoYtyh8cOLQoM+oiIxOscB5iXrJvd4HKP9XMgCbh9ZicMOo
	QCdgq9m4WyiNMieIhNqZQ6wR4fLvd8Uu0Hnz0P6bcmW2/4g+Ou9LWdNwqzlkH9qXffu60nT4XLL
	uXMW4OkgsHovSwNSHxga/aYSDkWVmmWM6SG5px8lCZnudJWChBDNqsE+s39HqjM6yPCDXNXx63O
	GJwduTcrCn/3JfMQ2LyGmSW7o4c0t0Ua6oZljtodRYYlGT8/LWgVO2obKjfMcklPBzyZVxN9MVA
	s4pWXN6nIYGppOMXkOfvxg84/Qng==
X-Google-Smtp-Source: AGHT+IHalcFAL7eYVSFewhJXIKyoAgwZscQPTM18/h4IZaYPkpXM4y2F5kLJpcBt69ANa86EkH8HDg==
X-Received: by 2002:a17:902:c403:b0:29f:29ae:8733 with SMTP id d9443c01a7336-2a2f2c4dafemr163139825ad.53.1766574416375;
        Wed, 24 Dec 2025 03:06:56 -0800 (PST)
Received: from localhost.localdomain ([113.98.62.227])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3c82a9asm155409205ad.30.2025.12.24.03.06.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Dec 2025 03:06:55 -0800 (PST)
From: Jason Sun <jason.sun689@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	sunqian@senarytech.com,
	jason.sun689@gmail.com
Subject: Re: [PATCH v2] dwc2: Delay resume until device connection is stable
Date: Wed, 24 Dec 2025 19:06:06 +0800
Message-Id: <20251224110606.87610-1-jason.sun689@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <2025122444-handcraft-hammock-c020@gregkh>
References: <2025122444-handcraft-hammock-c020@gregkh>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Greg,

Thanks for the feedback.

At the moment I only have access to this board on a 5.15-based BSP, so I can only run-time test on v5.15.140. I don't currently have a working mainline (v6.x) boot chain for this hardware.

The patch applies cleanly and builds on the current usb.git tree (v6.15-based, build-tested only). The change is based on reviewing the resume path around VBUS enable, which still proceeds after a fixed usleep_range(3000, 5000) delay and can observe an unstable CONNSTS window on our setup.

Please let me know if build-tested on usb.git is acceptable for now, or if you'd prefer the change to be conditional (e.g. via DT or a module parameter).

Thanks,
Jason Sun

