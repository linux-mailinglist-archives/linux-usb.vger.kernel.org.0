Return-Path: <linux-usb+bounces-7108-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A4ED88684FE
	for <lists+linux-usb@lfdr.de>; Tue, 27 Feb 2024 01:29:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D5C2D1C213D3
	for <lists+linux-usb@lfdr.de>; Tue, 27 Feb 2024 00:29:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7CE8FA2A;
	Tue, 27 Feb 2024 00:29:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="g8EUuULo"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D44436E
	for <linux-usb@vger.kernel.org>; Tue, 27 Feb 2024 00:29:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708993750; cv=none; b=udGt+U+jkAgH+zqNLJICoDdob2v6Pni/P+HPrQuJmgj2TK9zZFzs+LezZo617u3whGZ1ZS1MAd9Br0f1/eSLo21gnZlr6HnDgzdecAJN0h2w6zUw1zCfVOrBitu7wItVRf310z4cXi2q5EIoTF1wuODIehSwtsWEl1FYRKuVz5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708993750; c=relaxed/simple;
	bh=ShKKi6TlgSxWUVIb93iZNgwwSea0qBzgXYFrAL077W8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UaUZna5wiQG94fDf5c+VtJU/O4xHP6rJz3mLacDTgJqSwEuXyf/A1waWImG3V8x0ALSdQXYO+/LCl/NmU0OHhfip7mI/17ILbSrCokd6lm1G6qjehMOHXMfeKItLzXkZxdt7ZSTgfWFOohFt6W+UhpZdnhh62Rl2gmSW1ZdTjiw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=g8EUuULo; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4129a5f7b54so10895e9.1
        for <linux-usb@vger.kernel.org>; Mon, 26 Feb 2024 16:29:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1708993747; x=1709598547; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ShKKi6TlgSxWUVIb93iZNgwwSea0qBzgXYFrAL077W8=;
        b=g8EUuULom+3XOmcrPap6hK5iYmBa2nsLr0VBh8jOVLzJWYkEcx3lE06JI1M15Vxqh7
         i/vXsdqzS9aK0EQVztcw9LA9o/9O1J5OQ2y3lsrowNrGXy1TbTatRet9dHp/ZaZGBmC9
         oOClmakX7SCLamV0T+bSyVbnqRkjvAuNVkbp08SA1jLtrwfaYdw8QiHcMT2/vsvOpP5m
         s+LB4zSrmohDmH6GGWxFpmdO2gZg+/fJQMOvJCdzKxDg1vH49b3jhVfaN9Ko9bzCGpgi
         d+n9Lc+5mfvoRRzMayWL9MaTAknSm9jVgOuoJlbpQZmTJ3t+V3M0QKdcZj1doKS4hBYh
         pxzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708993747; x=1709598547;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ShKKi6TlgSxWUVIb93iZNgwwSea0qBzgXYFrAL077W8=;
        b=dOEUQnkrGEp6g2S9TW+F+I5GJDyjgU7TXVC/w7iK7wnzbV2G0vHjFFWw5XDwhYFjCU
         xpOzCj6/UgtxCUmH6/b3X3OriL3K80XhafsKVIflzNuHoOdtoogi+ifbPNC5lYn1XFh3
         Rir7uuC4kJZfe1mi8eSEUa3idlKibPErtmxwGrTOTPue6COGUgqDsYgKOTqIw5UAOrGM
         5Ay9VXU5r+nJASQQaLT8vfOGbdntJkWsc7f2yC0q3TZHooYQ7T364mR30ifuczWpwFwX
         Ve9MBXbhx+C/xNs5kJryfL0oNysNRnaosCFdsE3+A0w6PmWbHDA0CeBCZnhvPIti6GCy
         Nqeg==
X-Forwarded-Encrypted: i=1; AJvYcCUYJ7xRsJPbIYbD9hdnzivC+s1TkEasVhSnNnyS5njWd7zy1GOFkTlRs8PI70WPYvpJ83+Ebxp9Mxt/cd5sydZu15RkGVzpTjyc
X-Gm-Message-State: AOJu0Yy080H7ZNbswQ52cFyGs/D1PgbeHxO7k6LGiJ+stdRjFMHYGhn5
	6oEJmh9Gf0APq2W7Ldo4PlLID1uQFXl1/iolRgarS8TChF8OljSVMbzwzptgrMjKdBlxorwgzoi
	pNZcq/ayW5iDMVAeRWQTNoIKPuJm/AGrczhrY
X-Google-Smtp-Source: AGHT+IEHBIxVsYsqqx1KNVOvqC0cQcgpUH2DaF+E/L7XUVB3GgMGSN5f+p6Y+/0OBfhDM1iBRyndhoFvC+Yz2LrOIZg=
X-Received: by 2002:a05:600c:a3a3:b0:412:9829:2dd5 with SMTP id
 hn35-20020a05600ca3a300b0041298292dd5mr46040wmb.7.1708993746739; Mon, 26 Feb
 2024 16:29:06 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240223010328.2826774-1-jthies@google.com> <CAA8EJpqwAg-qenTq3MZCb74rn8rRaMxrsnmZGMwff+ABGENEGg@mail.gmail.com>
In-Reply-To: <CAA8EJpqwAg-qenTq3MZCb74rn8rRaMxrsnmZGMwff+ABGENEGg@mail.gmail.com>
From: Jameson Thies <jthies@google.com>
Date: Mon, 26 Feb 2024 16:28:54 -0800
Message-ID: <CAMFSARfs4x2+rkdk_Ns4dSbKUZ_YbAvjsxUa+395b+wLwrNzPA@mail.gmail.com>
Subject: Re: [PATCH 0/4] usb: typec: ucsi: Expand SOP/SOP' Discovery
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: heikki.krogerus@linux.intel.com, linux-usb@vger.kernel.org, 
	pmalani@chromium.org, bleung@google.com, abhishekpandit@chromium.org, 
	andersson@kernel.org, fabrice.gasnier@foss.st.com, gregkh@linuxfoundation.org, 
	hdegoede@redhat.com, neil.armstrong@linaro.org, rajaram.regupathy@intel.com, 
	saranya.gopal@intel.com, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> First and the most obvious comment: 6.6 is four months old. I see that
> your base commit is the usb-testing tip, however you declare that you
> tested only on 6.6. Now I'm confused. Did you test your patches on top
> of usb-testing before sending them?

Hi Dmitry, sorry for the confusion. I tested this on a v6.6 kernel build
with a few dependent commits cherry-picked to it. I'll re-validate the
series on top of usb-testing.

