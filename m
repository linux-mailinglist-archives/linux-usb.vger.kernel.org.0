Return-Path: <linux-usb+bounces-24922-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C7E74AE08B0
	for <lists+linux-usb@lfdr.de>; Thu, 19 Jun 2025 16:26:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 575AA1890EAD
	for <lists+linux-usb@lfdr.de>; Thu, 19 Jun 2025 14:26:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F35F21D3F6;
	Thu, 19 Jun 2025 14:25:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="RfXK4v/A"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA4751F5842
	for <linux-usb@vger.kernel.org>; Thu, 19 Jun 2025 14:25:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750343156; cv=none; b=HdCBgjdj+Hj2JFN+TdsBZ0BYyL9MaiNo+KG6jQGe1bANbSEl/0f8SYepnswhjHaKxjcUPfZIy/P1IkIJNTsTf7AehdkOG6EHx+TlHuKF/HHWifkhBPxXQtVyvT9XZnoqQGZ8pTQPd95zJrNqRhP3T/V3fVxJtXYDTJnD9GiKPdE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750343156; c=relaxed/simple;
	bh=XivIsKtLHxsnTwVlRhl4Dr8yCQ88AWH5wGjsQuso/gU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oFqhqccQ2tTAe5zg7YzbRIna7obqDfIz9/AMvygJ9egjE8uiR1GFPMmvllxpf2qxjJj9zGmLSpcbZtM1sEzZBDpOUwNxDE8Ofm6ocmIVCfrRWvD+9NscpzM3qtnnLrBKyV89uYW01PyAJdaMaUpI5GFp+lDlF+YMrywj0OUZ1U0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=RfXK4v/A; arc=none smtp.client-ip=209.85.160.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-4a585dc5f4aso9035801cf.2
        for <linux-usb@vger.kernel.org>; Thu, 19 Jun 2025 07:25:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1750343154; x=1750947954; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=aDxodWZZFiLGzD+rmeop7HWG34rN9saTSNItB0iBSXQ=;
        b=RfXK4v/AQrQn8u1D6IQkkveHHV7R8mSRQC3iwZ5WF9TNBqVE50bOk/nA56/RlroWF8
         WsO8aDcQWq81dQjIRcnQuYly4BgJvCIPCYMcY6dW4nrobOpcbj5AlWhUIPp7JhIfJ702
         AZY4fqqzVZi6BkDYKMiJl1NtYuTUF9X6VYW/wZYfz2mxUkkDH0hsLqW0YgeqolVmuLdK
         XWs9iJlT+90wxRaccg9ESb5aqRdtZdw+tDxGewasHaNoL2dx2JSg7PycwpF55wzAUEt/
         f4y7K7u4+KVtmb1TKmV2/gPy5uoslLQcB1KZr2pS9YoFylRlFMpfdpSEVMxNWUfHvzb5
         F9uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750343154; x=1750947954;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aDxodWZZFiLGzD+rmeop7HWG34rN9saTSNItB0iBSXQ=;
        b=IDEvj+fY2XLR4beHYdDcvVzXL4rFiLZShuf/AWQW3g/QqrKSMLqckXIqR6svuXLUJC
         UDGYwBGPf1laXBZhMfzv2fAJIYuhTv+4AqCtdjSCyYvPwM+oGx8BlgVcw7F1wgE6wWT5
         2RGfNUl9yOQIG2kdoBj0738te2jqBpt2e4KSx8aeWNgI4yvywiW4pYuZju2n+M9bVyxa
         NbuW0YsGxikwzIdb9xOgxHB2JBzsTTcMbJJHRh+ZUH7bfjq8W7hEu+tLB5PbYJ84pefx
         liwxw/O+tjVLYY91oJf7miiNI2HhqKUE+f4WVfOIlsGocJVKxjJx+BPNeiTdP1b35U0b
         d58w==
X-Forwarded-Encrypted: i=1; AJvYcCUdPzVKY6YsvRJoiFHaoXn3zmJQ56EV8YRUhhMfd47ADwVuQZAzKyeFPzDRv6a8bNvXqY88Oe4WnSw=@vger.kernel.org
X-Gm-Message-State: AOJu0YwkmAAmYIV5YTRkCGXm0nrW3QFrioZSxSq40qLY+LB7DyNLP53y
	gnQa/6RZGdAiDTjZmtOQrmZiQGmTWtX4ILATQDq1e5/eVaVABL6GaF4rWSJbGlHeo/oeJkwEZOd
	kfhs=
X-Gm-Gg: ASbGnctIUgbd+rOmBpbvIftFoqYRP13u25cS3xATwbWPjYCa92kZ7slRmf9hxLvViBe
	Sioc1AbNxGiYBPtxvOwjfZl+4l9bXUyDFCNNEGxQ6x/nwbStAdy4VxWQZm9RfVqymCZis+D0EM0
	AVJosZm8SJbhHkvszLs+66/hVqEnoMlt4p2qm+DLwHjxjY1FhUkkUJfve+Uo8CWgcH8DgJHy6p9
	kOC7X67Rw0TBApU831jjWZuUiVV4K1y6i68smJnwlgrsJgwOu0AHkI5HnbA01l3wtbE3IVJ7lSn
	O0Y3ulagtGsOHN1XBGT9TEE92GUJj5R5A06PZG7etTh8UHq1KD/oMIePdvQz2c8=
X-Google-Smtp-Source: AGHT+IHoxGFmOWyxo0l5cv3zNYUJJmLzJxOJmUnEXBZTUwO3KalFcEgAIn0/tUUNPftUnsVKxRmxVg==
X-Received: by 2002:a05:620a:2a11:b0:7d0:99dc:d026 with SMTP id af79cd13be357-7d3c6c0c737mr2951152985a.12.1750343153662;
        Thu, 19 Jun 2025 07:25:53 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:681:fd10::9ca8])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d3f8dc9378sm3558485a.9.2025.06.19.07.25.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jun 2025 07:25:53 -0700 (PDT)
Date: Thu, 19 Jun 2025 10:25:50 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Hendrik Hamerlinck <hendrik.hamerlinck@hammernet.be>
Cc: gregkh@linuxfoundation.org, skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linux.dev, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: ehci: replace scnprintf() with sysfs_emit()
Message-ID: <20d37e05-c496-499a-97a2-bcde9b7fe958@rowland.harvard.edu>
References: <20250619120711.552662-1-hendrik.hamerlinck@hammernet.be>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250619120711.552662-1-hendrik.hamerlinck@hammernet.be>

On Thu, Jun 19, 2025 at 02:07:11PM +0200, Hendrik Hamerlinck wrote:
> Per Documentation/filesystems/sysfs.rst, show() methods should only
> use sysfs_emit() or sysfs_emit_at() when formatting values to be
> returned to userspace.
> 
> Convert the uses of scnprintf() in sysfs show() methods to
> sysfs_emit() and sysfs_emit_at() for better safety and consistency.
> 
> Signed-off-by: Hendrik Hamerlinck <hendrik.hamerlinck@hammernet.be>
> ---

Reviewed-by: Alan Stern <stern@rowland.harvard.edu>

