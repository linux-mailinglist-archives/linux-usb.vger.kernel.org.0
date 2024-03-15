Return-Path: <linux-usb+bounces-7995-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 225F587D13A
	for <lists+linux-usb@lfdr.de>; Fri, 15 Mar 2024 17:35:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B479A1F23C41
	for <lists+linux-usb@lfdr.de>; Fri, 15 Mar 2024 16:35:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A28871B7EA;
	Fri, 15 Mar 2024 16:35:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="qqoXWUly"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BF5928F1
	for <linux-usb@vger.kernel.org>; Fri, 15 Mar 2024 16:35:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710520529; cv=none; b=RMYsPo2L/EYLqVcAEZ2PGc+nUQQj0FjYFHORvzXy3n3SW5CSpbhjMQ9LZIs6pQfZYN2sQeGHP6rIztOdwPoTte3vkLu8/9kI+cFkChi+gLjyJ7+iW+/Y2toJFyOuNHWte1K5awPiHn29zvW3p/CB+V4szhpgQyO+VC2yKcuF2/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710520529; c=relaxed/simple;
	bh=ghw1k/+pt/ZvrdwVjLVvv3tNq9YHf4zCFABTTJrTcKU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZwnC2zv4Wn+OSBsB9gRjR0avSkU2E1PgGOC0v8O6NZxbNbSLs9813TiT5yWjfexLDrYTq03TGBVy/QBqoDGOnZJoU0PMoEO4bsjqmFq8TNlTCL9bssTJNlL+5YUdheqdoqkTTD2CfIx+sXugr34RortzB662E95gZxvvh19vqbo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=qqoXWUly; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-568898e47e2so154a12.0
        for <linux-usb@vger.kernel.org>; Fri, 15 Mar 2024 09:35:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1710520526; x=1711125326; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ghw1k/+pt/ZvrdwVjLVvv3tNq9YHf4zCFABTTJrTcKU=;
        b=qqoXWUlybVMBx+mnXrUppo7XMBsADPevjOqKcGDpE7JiUU62xmmjGBbsn1wraVixsL
         TkLVpmJPMbquRJIfiNXQamr6PEZVdNjSfF5b9qht8xqwW5/iq0FYBMg87fAMFAkfK4oB
         mAnOyxyrrhVRVPGmwK/b4UEooDhXXPn6WKrsdMx/KE7F6BaCFBPelBSAFEzyk3VyRc2E
         hhmPeJuIy+zrKVnhha8So68hxhOUQwuNOx9wVlhBIoiRgJ8RwMniOn1K06ywemjP3jeZ
         qoCALuSL8WFYQD91U4ach4GKIRffuf6TktoCBThtcGDH6vfLZ8YcWOUTyNGU6+xSGasY
         2kig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710520526; x=1711125326;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ghw1k/+pt/ZvrdwVjLVvv3tNq9YHf4zCFABTTJrTcKU=;
        b=dzNaES/DLFiLgk9Y/0HawwysNkrJeZ8wVR8jt08DE101Qd7vmI3y/8KYWap9aM+0qy
         +qBajAJL4ONxNWPIgYsA4hS4XmTlvHvP2pYadc9HCgD/bzidSnLsANeSo20LY0UyLyEt
         PUQmZ8CK/wsJFp2dwVxlRmsg4RzGLpZVxtqQqcjZ5iA0vppQ2dwM0OuXqYNdRTBXFfW2
         yA1/nQItjTrUT0JoZzmowsAOPt0ohwAwEkbDvCWFvMgYKMLuootpk0qhmvG0BN5xC61q
         8UHPX+45flvKEc8KNjyr9nBSW8Ld6nKIC32y9EnPsXLdZYK14eiaeJ/VayX7B5TBYtC6
         A11g==
X-Forwarded-Encrypted: i=1; AJvYcCXJS7jy0pAXnfanQbiMh1ls9+8s35yQk6eiIpcAdpj6pmcIwRzGovf9zdHh0Nt1c9ngfSl1zY/nbchMeBIn3pnpSyVD830VWSxQ
X-Gm-Message-State: AOJu0YzhNnHimLo4SqfoxqdU37aJGMeDfepNB6XdvEXfNbDkChEH/K5y
	CIAiQ9UTsjFRli4Tl8J8i2cMhzRJBp0MMHP7BlnfXLaHZDj+kZbMiaZRcPn3Ufy8AwxjH6aed/0
	EMg4JxZwsnSsraOGGrIY+p7151x97+U1LODWl
X-Google-Smtp-Source: AGHT+IG6GH5Tn4TKmAdmEgYwzsZTPntpiM77HXjvpskWwt2wQYJ3DnOV8PP8A1NiMEvB9H6lsJugLMrVnkHsAx95H04=
X-Received: by 2002:a05:6402:160f:b0:568:5606:71f9 with SMTP id
 f15-20020a056402160f00b00568560671f9mr168472edv.5.1710520525808; Fri, 15 Mar
 2024 09:35:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240314235554.90079-1-jthies@google.com> <20240314235554.90079-2-jthies@google.com>
 <ZfOTHO6FMlpjeQhZ@google.com>
In-Reply-To: <ZfOTHO6FMlpjeQhZ@google.com>
From: Jameson Thies <jthies@google.com>
Date: Fri, 15 Mar 2024 09:35:13 -0700
Message-ID: <CAMFSARcckrrqy-_n2bK-iZAXBkfkyzEyOWjmEuHQxfuUaCSTkw@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] usb: typec: ucsi: Check capabilities before cable
 and identity discovery
To: Benson Leung <bleung@google.com>
Cc: heikki.krogerus@linux.intel.com, linux-usb@vger.kernel.org, 
	pmalani@chromium.org, abhishekpandit@chromium.org, andersson@kernel.org, 
	dmitry.baryshkov@linaro.org, fabrice.gasnier@foss.st.com, 
	gregkh@linuxfoundation.org, hdegoede@redhat.com, neil.armstrong@linaro.org, 
	rajaram.regupathy@intel.com, saranya.gopal@intel.com, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hey Benson,
thank you for the feedback. I'll follow up with a version 2 of this
patch addressing these comments.

Thanks,
Jameson

