Return-Path: <linux-usb+bounces-14034-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 40BFB95DD04
	for <lists+linux-usb@lfdr.de>; Sat, 24 Aug 2024 10:44:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 67EF41C20E07
	for <lists+linux-usb@lfdr.de>; Sat, 24 Aug 2024 08:44:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D1391155730;
	Sat, 24 Aug 2024 08:44:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m6vj2ZwD"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE39925762
	for <linux-usb@vger.kernel.org>; Sat, 24 Aug 2024 08:44:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724489077; cv=none; b=hp+m2zjI7zzI1SOhYthVYrqoMl0LK+q44zJuNll0LhD+65Qa/x2BPAAneFMdoG6O65RLhvR38Hoj5aJlQWMoiiD2Lcd80wlohMQLFJzfdaw2FXE7IAZocxuDNYYYK0BScvGWtZCwg1i6Hu/4OyU1XUfJaNPVQ98eggW8z8aSSvM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724489077; c=relaxed/simple;
	bh=ygnb9ZnLyBtaGmQAkcKjC5VQd0lX2W1dMi7todpN+zk=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:MIME-Version:
	 Content-Type; b=qyi++268LfwI/TS5FlrdCMDALMJ9LXEoAUQQBOPQgDGIo7/juDPlkpKzGz0GTYU8nEs/g+Bu5iziZo7Q+KJ7fEBzCu9pdmQjtNWlsPdYA2xQZ0KLqjcGiEby5lV9msM+BhELViL+i0zQev+gWxDOJvb6Fq/9wQ6QRR7HZpfFw+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m6vj2ZwD; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-533496017f8so3662624e87.0
        for <linux-usb@vger.kernel.org>; Sat, 24 Aug 2024 01:44:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724489074; x=1725093874; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:in-reply-to:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ygnb9ZnLyBtaGmQAkcKjC5VQd0lX2W1dMi7todpN+zk=;
        b=m6vj2ZwD8ONIER3pVa9t8RqIJ0g4y/Cm4m6ZCN2wXnd1e/hEutd+RvoqsT6/xVdLig
         nq5e2oHDOaNuKXpkc4wl84NlGKqr4ccx9cApbkGIXpCGIk00k/gJZ+5VXNt13T5FHKYl
         vBjh1eVoMd53Px8JnlRphulbLu3uG3ybMF1X2Wa1JslEJa8QcKtFJLhg75KpsLwrCrE1
         RVhR5qzxaG0vYD69MCvhW2zdBhb3fBOXx/RW5vhft1O/+TzXVMNBQE0Hgzgrcp8p9Pf2
         GGwGsjeu3KeCLsv3A+9YwHU5Jo/XyHhN1iX7kgIQq45NygY0i8YrxGfdgIeX86AiWp+I
         9cMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724489074; x=1725093874;
        h=content-transfer-encoding:mime-version:in-reply-to:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ygnb9ZnLyBtaGmQAkcKjC5VQd0lX2W1dMi7todpN+zk=;
        b=cWN9yw60NxRsQmxqjb+w6KcDlq4xEO+tpEklW3SY8/FRaiVNhVVg4SLIsTUJ9YEYKr
         ptiC5mF+bCfKRty7W3NhUBkRVpJMlUyZp7y9lzmOI4zHBfiZAhjHd6bw7mqZoTUIzPx4
         yHYZCKczPltJqpU7sFpl3WjSmUDXPfLKDnLQVFrAa7hg/dUmYNrrfEGSazii6e+WZ3ob
         ySkjhhBhUDwdQ8Xswelu89GxPVJjIEnfj+Dc/mdlcgbOR7r5cli0ZenG0LKLRMkY/3U8
         SmZZRToVx0knKUxQ7xqgsLGkWjXXHgIiUNoamq0oDS3FnFkC0dOPDQN2l4SR5J4rvkg3
         lG4Q==
X-Gm-Message-State: AOJu0YxH0GMymCMgxpLSd/jyCesvOM1nVF+7Gqgbind+DTFVritmTfzH
	wTB/uZP925j51FZ5GFdSyR5r9BqQkbZ4Y37ZoFSqWQMJb8pNMAMb
X-Google-Smtp-Source: AGHT+IFmKS7Z47Vu3efOF7ydNtzoFfP/y+GZfH9d5fIKnsZXROTOA89wcrBktq3IEIyoEGmez1vhtA==
X-Received: by 2002:a05:6512:1597:b0:52e:9cc7:4461 with SMTP id 2adb3069b0e04-5343882dbc5mr2903302e87.5.1724489073400;
        Sat, 24 Aug 2024 01:44:33 -0700 (PDT)
Received: from foxbook (bfi133.neoplus.adsl.tpnet.pl. [83.28.46.133])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5334ea2969asm795536e87.47.2024.08.24.01.44.32
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Sat, 24 Aug 2024 01:44:33 -0700 (PDT)
Date: Sat, 24 Aug 2024 10:44:28 +0200
From: =?UTF-8?B?TWljaGHFgg==?= Pecio <michal.pecio@gmail.com>
To: schaefer@alphanet.ch
Cc: linux-usb@vger.kernel.org
Subject: Re: Strange issues with USB device
Message-ID: <20240824104428.593895c9@foxbook>
In-Reply-To: <ZsmC1+ko50RcvE9a@alphanet.ch>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

This driver received lots of fixes and improvements in the last few
years.

The newer release you can get, the better. Fixes aren't backported
immediately, and some aren't backported at all because of too many
changes in surrounding code.

If it still doesn't work in v6.6, check v6.10 or v6.11-rc5 tomorrow
even if you aren't going to use these branches long term.

Regards,
Michal

