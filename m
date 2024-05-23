Return-Path: <linux-usb+bounces-10456-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E0238CDCDE
	for <lists+linux-usb@lfdr.de>; Fri, 24 May 2024 00:27:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 49039280FD0
	for <lists+linux-usb@lfdr.de>; Thu, 23 May 2024 22:27:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 989B212838F;
	Thu, 23 May 2024 22:27:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Fk5GCNxh"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F404127E3C
	for <linux-usb@vger.kernel.org>; Thu, 23 May 2024 22:27:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716503248; cv=none; b=hqnSHWcCQPIUxHN/+xw/sTdc6O1AWNUpvtFgdftUTjNSkDMmxUrGiakZoSgvHDjVTmmW9naVh1ojBikzX48YTnrlwuk3EaoqBS8O23aW8OLVejuD+izjcPtFfZLopEI0+/pJUrmXU3UyKOP3dQboac90peyphHGOSUpi0I/MXHI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716503248; c=relaxed/simple;
	bh=c0mUxdCgsi2KrVeRpxcSZB8MmwArsNnruIBgy6wP7iI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dnrQTp79Uc0zvIDwHSTMkYbGb31Nz1fO1Yy14woWZAgnASNOmUO+AH0pHFkrOhMqYr9xSWXVWM0UeogvVGaAUP/qLA/ZVAs+xnF/KN7nUNsRf7dvH0azufQn+CzXnsMQ/uwPZwWjzyfrsLIx57cf44zzN4fWJHZPjjK/7Nw7tMQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Fk5GCNxh; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-41ff3a5af40so12605e9.1
        for <linux-usb@vger.kernel.org>; Thu, 23 May 2024 15:27:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1716503245; x=1717108045; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=c0mUxdCgsi2KrVeRpxcSZB8MmwArsNnruIBgy6wP7iI=;
        b=Fk5GCNxhPiar+UgjNqjnKxi3IrfdHjW+vWX1rl0MwDv2tlTs+VPfAHSQd1NVMLJ/oj
         WdBIQh9qnx7y55/v7xKhuDVIVtlQB8E7EoJtsOFq8HuCOAZ6n7NK4wOHkFH0FOxN109P
         sMmfcWa5GWHiOvEv/ub+4QWHvduAa2wQDvMzvrNyXgnNu0GUYRXqiZ+nQqp5I3//awaa
         Kr6byBq2exfk0RwXSaZEYeMouLmyq1HR8Bq5qMpzRkf7Hkfap1fxczP6PYxOpS89vMB9
         Fov9woabWfVVxo7QZrjljmf01fb6NERXovNLbGUXP7cLU+A6ImjpOekKQ0qaH5IJLmWe
         JpHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716503245; x=1717108045;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=c0mUxdCgsi2KrVeRpxcSZB8MmwArsNnruIBgy6wP7iI=;
        b=XAWXYBjXe1XdzKe9CoQ3ENFkL1lGYSuPSxILDOOhyc3LjoNXQ1Kdlf5HKCqnRpqgDY
         UB+lGEqC+lbgHovUip3NQKVRFP4OXd59w72LHAZcbmnuw7rsPnC0N+Hkz+g8UXKhOhBP
         0GR+AGysOVTBF20BoMEnZ7plnSMa2ca9ASJzMFbh+1ZqZ5EjHgNsN/ufPD127jgA5sTM
         JkbF5bt3qz9nBKthm57Qqg/nEEbKSXpv2Y2ISVMv7oK9P9f49R+B+pjxbH9kgfHWDTcB
         KU0dTl4cjbhXrtohZRW9013nFQErSB9Q121iD2gUq+rfYpF8sGe5yC8ujoDvdJdaCP0R
         qxuA==
X-Forwarded-Encrypted: i=1; AJvYcCUBGvvnHQ3x6bM/BF1KgXPY8Bq+mfrpqEJJvuCYLfNwr8u45aSUM0VOTr21r0bcoWEINZddzXVU3uVu1pm1FZQr/mebFd9mq7h+
X-Gm-Message-State: AOJu0YxBJ1PTONv8vg1GFG63RCrD+Cqp4eahVP6tx6h3w8c9pKPlftby
	bKo6gqGXv2rViyk6c037Zg+4HKh/nKRXmb86bP958478SNdfTnecUkjIIKfXD8ViL+x+vup7mAt
	MzbOd4xoGddmX9qCbsdHGzDPpXqJCzghWac7U
X-Google-Smtp-Source: AGHT+IFynCndXxQSRyQxEh3uszYlhUwS4moW4riJN/2gUPi0KmtIvL9iA7r73v9YHUvtIeizmNWwYHzCkJkFOKSr2sg=
X-Received: by 2002:a05:600c:3d8f:b0:41f:a15d:220a with SMTP id
 5b1f17b1804b1-42108625e09mr650055e9.4.1716503244634; Thu, 23 May 2024
 15:27:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAAzPG9M+KNowPwkoYo+QftrN3u6zdN1cWq0XMvgS8UBEmWt+0g@mail.gmail.com>
 <20240510060826.44673-1-jtornosm@redhat.com>
In-Reply-To: <20240510060826.44673-1-jtornosm@redhat.com>
From: Jeffery Miller <jefferymiller@google.com>
Date: Thu, 23 May 2024 17:27:12 -0500
Message-ID: <CAAzPG9MMHoHjR=EAAM9Rgkaih9QjU08tF6d8JrjQ43td=-oAVA@mail.gmail.com>
Subject: Re: [PATCH v2] net: usb: ax88179_178a: avoid writing the mac address
 before first reading
To: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
Cc: davem@davemloft.net, edumazet@google.com, inventor500@vivaldi.net, 
	jarkko.palviainen@gmail.com, kuba@kernel.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, netdev@vger.kernel.org, pabeni@redhat.com, 
	stable@vger.kernel.org, vadim.fedorenko@linux.dev
Content-Type: text/plain; charset="UTF-8"

Hello Jose,
I can confirm that
https://lore.kernel.org/netdev/20240510090846.328201-1-jtornosm@redhat.com/
resolves the up/down link issue for me when applied to my 6.6 kernel.

Thank you for resolving the issue.

Regards,
Jeff

