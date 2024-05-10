Return-Path: <linux-usb+bounces-10209-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EC6BE8C298B
	for <lists+linux-usb@lfdr.de>; Fri, 10 May 2024 19:48:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A6698283064
	for <lists+linux-usb@lfdr.de>; Fri, 10 May 2024 17:48:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D64563D556;
	Fri, 10 May 2024 17:47:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="s9o3owcH"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05A3020309
	for <linux-usb@vger.kernel.org>; Fri, 10 May 2024 17:47:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715363267; cv=none; b=uvf3DML/yUz6AlM3C+KZECWwVwlwA7KSNOgETHhvWr4qZ+2lQKv/V6ct4RPwDTcyl59CoEyjrMYM5gzLz4PFVPWQI6yYzTRF5btMObGJED88iG6ZnYOqk67sIypqfLnzfL97CG8xL3h2NwHQ4OBjq82zpJfNV+sKx5V3h31iOS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715363267; c=relaxed/simple;
	bh=wtIQIip5nVPfkbjixVWdphytuwonMdaHcOLroeIqLNo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=d8sju3OKvbdBe+gb3sGpaQC6rdVdDOceo/pxRB+V77ZMh6RS2WjrahhG0KVdVt+eOlkJjUgIzgiGFZGUzy50giR/lIjQAveqg7mlY9CYTaugb4EPsBjlJv1UZkN+Qd4UIiCgiWDK54sjH1yzVck1TluJlZesrrGMRMOwwxGOX0A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=s9o3owcH; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-572f6c56cdaso1606a12.0
        for <linux-usb@vger.kernel.org>; Fri, 10 May 2024 10:47:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1715363264; x=1715968064; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=wtIQIip5nVPfkbjixVWdphytuwonMdaHcOLroeIqLNo=;
        b=s9o3owcHBlN0toIX6BKL0MzUXBeLlkQL6SZ4zEQE32E0GloumirZ417QDlmBZ0NrhC
         sH+xN1mnTienVbnHSErnxstvVIxfJZKzL/Wu9aywNdItoMJtgALS9esesmit1Tska0+z
         nZ5ChHFtiCio4iprFxbhFhTexHx4XzDWQE3ENOgJPmgRQRIZKdra6Zy3/vZDOR5sxTPP
         35MVlV9XdficZ4H1nCIOn0PVd3RX+Gmj4ryhgB83Zr/ci2HBWXOekQaclnTl1xMK5kbQ
         CjCpVh+2Wsl9REFxg0slxrmC74vhhnrpPboC7nU2flYzmhodqr7RY8L6/FT3W7WLYH1w
         sTXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715363264; x=1715968064;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wtIQIip5nVPfkbjixVWdphytuwonMdaHcOLroeIqLNo=;
        b=pMCOHzj1/U5ohit0KqdDEOBwChyD5S7J6gRz+R4jGrcbM0dIS0b+4/IYrv9vmWL7XP
         bUXEFRL1XOrGc+7HZk1L56s+r7jCtaNdDpJFThYYk4ZIIEImTSPYRYs9Rs1fzZUFNFLi
         FJsUtNh2KdEbTmeGyjeHNq3PHaC7LNormHuByr2wOhjRIpreJOieOsmue0kjmUFIOq3f
         q4zQAKSeR/sdZtLfHjtQGrjixjv97EN8W3CfJp82Yc7mC+VWGxIgwJqWUBgFvMmXOaXj
         gnckhMiB5PUMhrNIkeFpQTdJyOOSm8nDdsGTobeTuonKA4yHHyDzuCCRtqfNxdfVve4I
         wm/w==
X-Forwarded-Encrypted: i=1; AJvYcCWaO551CaqQX9RhQBxVWqYdwoTF+n8KkEWD8AOxgy6rO38m6gLa6vpZM6qI130SjQDKC0ddUgY9LshI8Rv7QG4tFyJ2Cc771XtQ
X-Gm-Message-State: AOJu0YygoSjy320+ndEpbkrwIE+Vyj9P/0kWSlLQSY1OdL3/7MkClTtO
	N1u9Fkhm904UgfJdjIQTtc1iwhKRZmK0MaqFUcI2EuI074TuIJX1Fnmmfeizf8FIbwwNdUCWYhC
	NiKplGkG4izjTImxZz4QlZC0I8Glw6KXFcVydHlqZ2pfXFYbVBA==
X-Google-Smtp-Source: AGHT+IHa5FsJxGeGgllWY9Q4tH+ll2VsmZa3DhLaRjKNVSrW18OHO9wNIjfKJEwokkqsTG8piczzmGTMpNstjiLBz5M=
X-Received: by 2002:a05:6402:1e87:b0:572:554b:ec4f with SMTP id
 4fb4d7f45d1cf-574499eff4cmr162a12.3.1715363264154; Fri, 10 May 2024 10:47:44
 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240503003920.1482447-1-jthies@google.com> <20240503003920.1482447-2-jthies@google.com>
 <Zjiq4PrL2ju8FOUz@kuha.fi.intel.com> <2024051010-hungrily-scholar-7d23@gregkh>
In-Reply-To: <2024051010-hungrily-scholar-7d23@gregkh>
From: Jameson Thies <jthies@google.com>
Date: Fri, 10 May 2024 10:47:32 -0700
Message-ID: <CAMFSARfBu1vBbuA-jMgD0fWJL1_zfQ2X1P0XB-ysQNrJL7+B5g@mail.gmail.com>
Subject: Re: [PATCH v3 1/4] usb: typec: ucsi: Fix null pointer dereference in trace
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>, linux-usb@vger.kernel.org, 
	pmalani@chromium.org, bleung@google.com, abhishekpandit@chromium.org, 
	andersson@kernel.org, dmitry.baryshkov@linaro.org, 
	fabrice.gasnier@foss.st.com, hdegoede@redhat.com, neil.armstrong@linaro.org, 
	rajaram.regupathy@intel.com, saranya.gopal@intel.com, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Thank you for the feedback, I'll post a v4 series fixing these issues.

Thanks,
Jameson

