Return-Path: <linux-usb+bounces-14286-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E92D964C99
	for <lists+linux-usb@lfdr.de>; Thu, 29 Aug 2024 19:05:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 95E58284EC9
	for <lists+linux-usb@lfdr.de>; Thu, 29 Aug 2024 17:05:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46DA21B6547;
	Thu, 29 Aug 2024 17:05:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ROhFhDPO"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C02C1B5EC2
	for <linux-usb@vger.kernel.org>; Thu, 29 Aug 2024 17:05:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724951122; cv=none; b=Hlg9Ya2wWcdJdqQGlxZrbEjho+1JrL/lL+TZak9dCx+nrnibCBtqwC3OPv652I+FSv0m4rqZ4HuuMXw2qx/GddqEhO73MnuAG7dMf47KZ7m/lgzQePM64DIFNlXqDzIRLs+ITeuKU4x3P5yW4qCq6Dme2eTcnWnIVqKF1D8WfSA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724951122; c=relaxed/simple;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=n3NiquS4MsSyhCCLb41w6gCrs9DGnxd/OI4iaYFVyjpDDVBMQr0eaYVqhMcQ7HBSYU8+CMmnTGCvZ/g7JwfWsjoEMRXiSPG251L+KAnrqOeY6jds/degQjYYFnGBAgzbMXlq7GH2yxStOiL1aB6TPqR4FrK/kav2z3cx0CXN9a8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ROhFhDPO; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-42817d3ecfeso115e9.1
        for <linux-usb@vger.kernel.org>; Thu, 29 Aug 2024 10:05:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1724951119; x=1725555919; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
        b=ROhFhDPO9Ll9pWySk8+1RNzrFAIkqvOHeAt76Sekt/2Nq2RgyGnHOrg06nVAwJTbbx
         zAi0uJwwJP0jqEYMfTHLkWaLJ2gekVim0k8G/dT0p2KPEwnnDBxr8vGAEIAbWGgwydbJ
         27gRXfuhbdNIvrexgxiNmeLdRC7iD8eL/W8DICUJu+ZkoPpVwFJIzZtULYynfRQ7WJSf
         hf3JckSyM3mS9++wZHTI426vRojfg3E4bT5gEo9V8aflq0OYneGz+LtgkdyczysS1TMQ
         xYqLj5Joab5nUxH9a9uJl41/gt6GcyBRtoMAcugUPwyUekYoCs3c/38EOqb5F/7yf3PF
         4aQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724951119; x=1725555919;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
        b=BrCdw3u0SC7tJGiNHP8tIufbE3e1k2Up0z0u9pptugxQiYtXzXOZnv7So74ByAYYmU
         fDoH5az6CzoMXLLY1NJ+YhppuoUAOGuleScm7wKlQNAYe0GuuRNB2vgaw1Bm8dR1Chfx
         D4iFvguSKWIVC/cbXG48g3DGrdBc7/u0MgIu+4XjXr1Y2ikQxIki4WwR4h2q5lED5a5I
         vtkBvnwsJfYubU5RTv20Mn3Jpj50HnVtX8Er8euG1/W2CO7JYkbqjpGR85NikcDsOlx3
         CK6/bRsyV3h4vgyqh4/OuKWOLdOPTITJG84aw7K7AQA+JM5loalDzZovWESk6bw4gvFg
         Wzxw==
X-Forwarded-Encrypted: i=1; AJvYcCVwNxCYQxBZUyKT/gEij7o/+3J9j8bGzZWhchY3rwkgiFENNw1PkhO5qtwqZnRPG0sWVygku8UPKHY=@vger.kernel.org
X-Gm-Message-State: AOJu0YyGYBgtC1feIeUbLbli8UvJ3IuAMh4DNNeJDBxtpRJMfFXQvJfn
	E7wJ7z9FY0b2TegPZLu2wA9BbQDv+K5ptelLdtXQ2EVOKRAOqrkLKeSPA5cN0CvSTDpnG/nHT2k
	mtaK41rj2/aT2YOtOlDjh6m62HiRn2Cx08dY=
X-Gm-Gg: AV9I1ZQLq4LSbLzUubatkD27dzAa2clZWJZJTSlnboLOFLPcp3J8qbB7RZ4k68RCb/3
	AVi273nBotCQYTDZEOckddrh9TT1FhcmGD8+NySWeyxE4Db6a4nQkSw14GU8=
X-Google-Smtp-Source: AGHT+IF8ncbv3hPX6txBwjD+mljfVJFZjCz8WD9pS5r0ChWeEb3HcbLEeUEQAMuL4Kr+bb+8RiZA/+ov4ZUA9UxFSLs=
X-Received: by 2002:a05:600c:6d12:b0:424:a2ae:8d1d with SMTP id
 5b1f17b1804b1-42bba2d4b89mr12755e9.2.1724951118768; Thu, 29 Aug 2024 10:05:18
 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAFs7P=jk=wfo0nbHzqd1NrGX3NKpOezD4-u=nAMqzq7mq4Lidg@mail.gmail.com>
In-Reply-To: <CAFs7P=jk=wfo0nbHzqd1NrGX3NKpOezD4-u=nAMqzq7mq4Lidg@mail.gmail.com>
From: Joshua Pius <joshuapius@google.com>
Date: Thu, 29 Aug 2024 13:04:40 -0400
Message-ID: <CAFs7P=jPqv2Zr6Fnw584TKhj5joBRt7X7gMidE4MiK1ABAMiRQ@mail.gmail.com>
Subject: Re: [PATCH] ALSA: Add logitech Audio profile quirk
To: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Cc: devicetree@vger.kernel.org, linux-sound@vger.kernel.org, 
	linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-doc@vger.kernel.org, alsa-devel@alsa-project.org
Content-Type: text/plain; charset="UTF-8"



