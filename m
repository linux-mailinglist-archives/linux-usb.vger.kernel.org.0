Return-Path: <linux-usb+bounces-7278-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BBD186BBF2
	for <lists+linux-usb@lfdr.de>; Thu, 29 Feb 2024 00:10:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DD7DBB21CF7
	for <lists+linux-usb@lfdr.de>; Wed, 28 Feb 2024 23:10:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F25513D304;
	Wed, 28 Feb 2024 23:09:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="jqf1b/Fs"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 739AC13D2FA
	for <linux-usb@vger.kernel.org>; Wed, 28 Feb 2024 23:09:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709161794; cv=none; b=Dz6f5oxqyZIJSqhzs8dOqUxwrwbFkbLwYqLVyGuDJE6MHW7/Qg+WEhJhC1BCTnYfXHjkRnBF6Y7f/nIUA5pbYSOKzLeVtIF8uzMwwOd2faKIM10BPiArESYgV/1D+PyHTIX7wgmiz4kBsC4SJN3a0EIfwDjmZKdRTIhWKtS/vLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709161794; c=relaxed/simple;
	bh=tQPwMcJnWlsfjLGPuN9MxoeAz6jfRjvKCSyaROjNjXE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ePJRwyXrgCCBOfZKMXcX5rE9lRIxl6Bq59z6o4egNP3sgaK1Gj3Q5qypG1njWUMLGENlGxlKUiJ3XkCA8fc5Qje+GUpyl2TFBAmPYNHnF0l1zjVRECcpIYbMa06Qzzp8OxQniDB/GosYuSA5fMRJJiCzq0lp+0VoZuNXv4t8N8Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=jqf1b/Fs; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-412a9f272f4so30195e9.0
        for <linux-usb@vger.kernel.org>; Wed, 28 Feb 2024 15:09:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1709161792; x=1709766592; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=tQPwMcJnWlsfjLGPuN9MxoeAz6jfRjvKCSyaROjNjXE=;
        b=jqf1b/FsASpjqE0hcZWN7Ml8HM15eVWOQU6MZVKPsoQm2jk9zlkEN/U7kfJdEoCq12
         4/ymkPqjC0V8+SYlXwMd7Z9uRQEK7gZ0J933QzAqGDZJ01P6CrhFtnH2jHJhj/8RhX1u
         cj0t1UNZNy5znKsjR0reUHzC5Vv9LHr1TBfHxgIe6/DSF06QLjosb1TbkeN2t7TaDdr+
         hsrtwqxWPvy57IMJyVM8aruvglvAAYs7lG/5lfgq06UV6/mXc/NLskrpb2rWF2TkMK6Z
         MRNMzh/O0ZdzOarYXpKo3MI3gz5umOOmNy7kGn6EGKa+a60XzvbrKRLWkSH+tsD4HGvk
         sDiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709161792; x=1709766592;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tQPwMcJnWlsfjLGPuN9MxoeAz6jfRjvKCSyaROjNjXE=;
        b=Tc1O3esmdW5PuFjnqZ6Eqi4W4C762lITHr780P6eutzZRQwriLIurH07Wscp9XT2/o
         V5XhnOwaNvx6GmaxP2U1eH16wwY5a+j2uhoGhzRRaW9EP2J92k+fYgkJrzNTwd/P7FlT
         y4NDbDAz+h77+NLvt0ZHefMfwJmEDhz0CbX+3M/T/ZWqDeQ3BzyX6m78F87xECB95EpT
         Z6RQOyQFS99tsJXNMJAuulXEQaFPBJL6w1lOE+bxEx46fawtaVT1zIqMV96AMgx+byTA
         Yaiz+wfe+2lPG6wKsJGmfZlqQnxTfVr2y6Kc3D1W90bfFdXz/jW2oVqHirfSHU9jGCla
         1YBw==
X-Forwarded-Encrypted: i=1; AJvYcCWIAymlwJ3KHyafKACN6bsyCEK207zNmHmPqPCYF0qogsvVuZM3jgCOwm2B2XqtUaLx9ubLV8eFBTmtmH6QpT7WWD1qYzrFezTO
X-Gm-Message-State: AOJu0YwQZlZ0KOjHGd/KaQRV8rG6dIfiy0LtdoJXc0DVKnLdp7koGXwe
	4YxzRL4oWp8+p5V93RHOug4nPkSlqRk8+QZvzLOnLlipnW9SSaGTfZ5V6C3a1uFoFTJcvhWjfL4
	7TxuvTVKFpVE0mwCjrTKqKTOi0q9bbpx38Yvr
X-Google-Smtp-Source: AGHT+IFaBr4ou5rad4Vy2KOF1zJQLth3lKTUU5sXoI0D9Y0AP76f/bm/fMAN2JjwGX5iHC5QewNHPi3Hcv1eyjkFA3c=
X-Received: by 2002:a05:600c:1f09:b0:412:a9ce:5f68 with SMTP id
 bd9-20020a05600c1f0900b00412a9ce5f68mr29447wmb.2.1709161791779; Wed, 28 Feb
 2024 15:09:51 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240228220251.3613424-1-jthies@google.com>
In-Reply-To: <20240228220251.3613424-1-jthies@google.com>
From: Jameson Thies <jthies@google.com>
Date: Wed, 28 Feb 2024 15:09:38 -0800
Message-ID: <CAMFSARd33yHhxNRkioX6T90+SrFfEVHW9StXToTj_NEXnowftw@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] usb: typec: ucsi: Clean up UCSI_CABLE_PROP macros
To: heikki.krogerus@linux.intel.com, linux-usb@vger.kernel.org
Cc: pmalani@chromium.org, bleung@google.com, abhishekpandit@chromium.org, 
	andersson@kernel.org, dmitry.baryshkov@linaro.org, 
	fabrice.gasnier@foss.st.com, gregkh@linuxfoundation.org, hdegoede@redhat.com, 
	neil.armstrong@linaro.org, rajaram.regupathy@intel.com, 
	saranya.gopal@intel.com, linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
	Benson Leung <bleung@chromium.org>
Content-Type: text/plain; charset="UTF-8"

Sorry everyone, I CC'd stable incorrectly. I'll follow up with a v3
series shortly to resolve this.

Thanks,
Jameson

