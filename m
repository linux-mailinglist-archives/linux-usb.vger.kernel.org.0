Return-Path: <linux-usb+bounces-10730-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C91338D68C8
	for <lists+linux-usb@lfdr.de>; Fri, 31 May 2024 20:15:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 49A8E28A237
	for <lists+linux-usb@lfdr.de>; Fri, 31 May 2024 18:15:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C7AAE17D355;
	Fri, 31 May 2024 18:15:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="N7+tAhGV"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEF5E17D348
	for <linux-usb@vger.kernel.org>; Fri, 31 May 2024 18:15:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717179311; cv=none; b=iMOmsDJ3onWWVhQcg0ynAX1c5OagoYT23n+H7CSqyOqRuOg0OMc3w/TZ3iAbNXATi8Xa6cS0eUJZlFIpFEDAVyQOaDTcjtGJUXVqjRc554YCpYSoF9BC5cxDQ6J94JhBxqYag1Y7Czr54lRdZ7M2JEwGFxmei2H5mxRe5NeRXt4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717179311; c=relaxed/simple;
	bh=jmPpXCtswc/9/xRBbVH8Aru5jdLpZkfwcoETfq3HwQE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kjGoxRSTK9cwQcn30SE+SPdMTHwj2FqIOWiGJkMipAEXfYlxAWrANBSD+bAYmQdpv/WTrEDs1dmx+0yc+wPBAAlN4CNTrHNrqGwOxaI6Cb/6wCnc4kJiTXyIrB1dIVKje1w6vNvSDbf4LQEGg5kD884Aq2pPIWsjuQleDuztUJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=N7+tAhGV; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-57a1b122718so1251a12.1
        for <linux-usb@vger.kernel.org>; Fri, 31 May 2024 11:15:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1717179308; x=1717784108; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=jmPpXCtswc/9/xRBbVH8Aru5jdLpZkfwcoETfq3HwQE=;
        b=N7+tAhGV/KvjBobhgFg9jQm682Nd3auipMVf2kND3LKmjWTJ36+QNZMQSN4VXkITgE
         MBbDlRMsEVGFuOXaYPqyt5QPFcoD4od30yrvVKP3NpCbqJWBFDP9EyV5kZMcaVR1l+7+
         Kn14RxlgiI5n6qGsdhts7NSSA2/WhNALS605WkXAJQzIzyvOkaS9RMNq65VVcDb9QOIG
         M8YbtSNxRNFYY7oXqaOQQcjbIKIZP09gG8WuTCQe7s5lFueFBq0A8NqS1BZIgI1Lx7GV
         AiC/j8CkYcTJD/py6HWiBX/rVfh/4LxELqc9NIbfiGeSyCJ95r2HuVlLJTg2QnhQ+9b/
         USWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717179308; x=1717784108;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jmPpXCtswc/9/xRBbVH8Aru5jdLpZkfwcoETfq3HwQE=;
        b=AVevRbuHcgtmOS7MLTGPJ4VxjdRQj9EQuLPfS7QteY1jj73d2iLlwcxDF5KvGesGhF
         OSzkYILEnKx6YWJGI+5A0TS5DEXnKllppjNFM0Q9bG1fe32f0eQ4VqX2azwGiwuDayuj
         MnRJ/0CBGUvPF8ZyiMPkhV88PNKFWvWfnGPRoZTEW9Zwe4yP/st4+cbTVslK4JDD4sTw
         hbhKS5Y/zfraEE5ivN3OriS/u4i7bmF5+2gQnTcQZM1nsuyH7oBVB/bDGvBfLKu7x6Ug
         HGXiHQisEAIa4SG8F/qA+8MgCaNS3Vb4rIE0DepGPUe4UkLJ5QoFcfLZh358fnVrBe6b
         YsdA==
X-Forwarded-Encrypted: i=1; AJvYcCXKtdEGFqH877fnCS0s2E+7/e6kayYIWNSUzSKkM8PshI0tBHMuqXnuVd2N6rItyOCu9RutuZW6pNA7ktsw7EIkbf4GwU4S+Rhl
X-Gm-Message-State: AOJu0Yzo6J+9832xIPHr/9JtsVJqBtkmrqy6TfBkSQl/CYc1auDkAd4l
	qJsSJyWQ6hliBXe2wmUPW5MT5z/lJbEkNCy4AL6bKHcS+leglOYg1CvkepkYbt0JBhL7GCkeU+T
	lA/gvGg7dCbuH1TjHWKHmAtSykaGgRqorgKGE
X-Google-Smtp-Source: AGHT+IFEHUagLwv0s2KgpCy8HmB+F/V0QfGaKrTZdGib9nhpas212A7B/z9JoG0M8rU3qjj3PEb8JOxT1Zc1mShg4Bg=
X-Received: by 2002:a50:ed0f:0:b0:578:4e12:8e55 with SMTP id
 4fb4d7f45d1cf-57a464d5cf3mr10901a12.1.1717179308104; Fri, 31 May 2024
 11:15:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240510201244.2968152-1-jthies@google.com>
In-Reply-To: <20240510201244.2968152-1-jthies@google.com>
From: Jameson Thies <jthies@google.com>
Date: Fri, 31 May 2024 11:14:56 -0700
Message-ID: <CAMFSARdT7ZrOH4HVaMCD_97NQEaRp_f_yZ-WkiSJ5hoq_AQM9w@mail.gmail.com>
Subject: Re: [PATCH v5 0/4] usb: typec: ucsi: Update UCSI alternate mode
To: heikki.krogerus@linux.intel.com, linux-usb@vger.kernel.org
Cc: pmalani@chromium.org, bleung@google.com, abhishekpandit@chromium.org, 
	andersson@kernel.org, dmitry.baryshkov@linaro.org, 
	fabrice.gasnier@foss.st.com, gregkh@linuxfoundation.org, hdegoede@redhat.com, 
	neil.armstrong@linaro.org, rajaram.regupathy@intel.com, 
	saranya.gopal@intel.com, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi everyone. Friendly ping on this series. It still applies cleanly to
the top of usb-next. If there is anything you would like me to change,
please let me know.

Thanks,
Jameson

