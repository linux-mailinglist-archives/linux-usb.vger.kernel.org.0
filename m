Return-Path: <linux-usb+bounces-26937-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 35826B2936F
	for <lists+linux-usb@lfdr.de>; Sun, 17 Aug 2025 16:27:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A47903B5B8B
	for <lists+linux-usb@lfdr.de>; Sun, 17 Aug 2025 14:27:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 107822DC326;
	Sun, 17 Aug 2025 14:27:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="WOddVjmw"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 256972D8778
	for <linux-usb@vger.kernel.org>; Sun, 17 Aug 2025 14:27:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755440837; cv=none; b=ZcUwLS25rg9KV3xT+9hbh1vSTJLzoNsBZxcwRIyOm+NjfNyWaVJ7ImJfcvs4+SyKK8wWdo58W7lLNAIY+r7eC8k1ExtQXG0IwdCl0VIwc3j84RasXxK52eUfTl0EoMN2U04UJ3VIPchxKZSveHskOk0qnpdfBFiJTwQ1yDvSYqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755440837; c=relaxed/simple;
	bh=lDpq8I98j7ygHtJNnQA9whbnrtcvMAxLIsDOkN+5U5c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fA8RpnK+eaaqbnMF3BG31DvsJH2aQ+cs75OKPdjLJnlnrRTEWh8hkzljZ6gCb+WGkNabmIY5EeSPcAgFwoZ4I6GO7Oe+CX65JeRSOh22HVUUjT2kLoZGzuvYv4U5OM55ezacpIQA2289opTNtfVa4/cxgRrOdxJs9IeQtIJ4+Qc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=WOddVjmw; arc=none smtp.client-ip=209.85.160.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-4b109914034so37943511cf.0
        for <linux-usb@vger.kernel.org>; Sun, 17 Aug 2025 07:27:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1755440835; x=1756045635; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=maDtJ/OnwRzl2mzIghqGwSPF8ovKhpPVT9edc4eCiH8=;
        b=WOddVjmwX1cayKg/mSl88CsPX8QnfbVX4kuBoisupimerSVu6XvtpA8bg90gE4R/QW
         M+1d89Gkhhwi75mL6bOhMtvOGIVy9ttl4pdtr3p7NL6+Km1Vz7NnEtksa124k/kPCZQg
         szKZywRJcN64r8BJnxHVK1v6WDq7U7mkj8l8WU5jKKszOzjZFaGnvRJxLe8S0l+Q0v+H
         Te0VRODB+dINAY0TNRRDYW0HLIam68oPG1VMfqwLBc7eHM2W62wXRQ5zn847phdSxkaU
         gvTdGnaN5DzuKsVgqk2qNwjEOfRwM+IJI931iVUWQLZfR6uiDm06irgg0wfuw+isyuQH
         vCeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755440835; x=1756045635;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=maDtJ/OnwRzl2mzIghqGwSPF8ovKhpPVT9edc4eCiH8=;
        b=MROnvaxLFLNDiR0Iuinr2BXVCPb+6GiiwdRKKB6Vyu+oeEP8DKanq6sMadrkaY1ftX
         jaWriw9c7Jl18ni+7dKDMBrbUoaTlMZcnuFtG3AE2kdwJqXVIfxDhiRVQt++0n6A3ZXh
         YV5B9g5Yq2oiKmnTusx7DkP0281er7QievaUyz7JZaXnrs+eANARa4VLYmFhY6GgQoQ/
         DrZt9/CUIsszIM0gDDkJ835LAWaZHBeO+Zswubf+3wizLLpr/Dz5UpyGe3dB7m1O/Dua
         uCkHqPwl7RIF9wnkKMI1ueRV77Sxy911wQ9B0DaoDqAKRXu4LlQA8SerZQ2KJovvQNsG
         fuvQ==
X-Gm-Message-State: AOJu0YwO5zlBmflnVFE4LqYoYjhZNEOd/plSQLnuyd6bWy2iZ5MJYNUo
	f8gA+Eldw3U/m0yUmuIjB6NBng5OtMWWpRPZ7vrkT+lJ9OaX5Bwu+JfTdkIc9NwT/Q==
X-Gm-Gg: ASbGncurD1ew+hXf6OEYKKyVOiCDEsNQMKGDs9UDZqPb7pYQDfIVqQ32G1zpABzfWb9
	qaQ8zeGc3qIBiagIzKWt75yIuMcFsEypmoQWnP2CKa8uLlnI3Lpc4/wr1Rqr40Ix3no8/UjTUiv
	FN0kU/cIRjM+Vb8khGcXf/UvsRPODDcL5LKMn2GNN+wrmpyNVnSUyp6neB85VY7in7uBzBZJUEZ
	XQCijSnkah/Ec06VsRGEuc/Ep3OkBTmwzbaf4KfdZbxuGLY89yh4tc/HHTH9sPy9srIZyKx0HB5
	6ZAUTXg4kDlxMUEoEFLhCMoKphuMeazXo1MITD3wrWEHd2Hq+El2XORwxbrLsHHAwgD1sqMpN3T
	N+rjKlgYg3CJdW0nl6TrxK1/M4k/1a32vVhzPFA==
X-Google-Smtp-Source: AGHT+IE7mcvpDwN6PKRambQsOmtvuGU5trnDeiipWqjRmMVW9O5h9Q9S2jd9sA9uj5EzwPmhQmqFRQ==
X-Received: by 2002:a05:622a:4c17:b0:4b0:710d:3cbd with SMTP id d75a77b69052e-4b11e060063mr103987241cf.7.1755440835014;
        Sun, 17 Aug 2025 07:27:15 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:681:fd10::f777])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4b11ddd8727sm37627401cf.39.2025.08.17.07.27.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Aug 2025 07:27:14 -0700 (PDT)
Date: Sun, 17 Aug 2025 10:27:11 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Yunseong Kim <ysk@kzalloc.com>
Cc: linux-usb@vger.kernel.org, gregkh@linuxfoundation.org,
	Andrey Konovalov <andreyknvl@google.com>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Clark Williams <clrkwllms@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	linux-rt-users@vger.kernel.org, linux-kernel@vger.kernel.org,
	syzkaller@googlegroups.com
Subject: Re: [BUG] usbip: vhci: Sleeping function called from invalid context
 in vhci_urb_enqueue on PREEMPT_RT
Message-ID: <2bf33071-e05e-4b89-b149-30b90888606f@rowland.harvard.edu>
References: <c6c17f0d-b71d-4a44-bcef-2b65e4d634f7@kzalloc.com>
 <f6cdf21a-642f-458c-85c1-0c2e1526f539@rowland.harvard.edu>
 <28544110-3021-43da-b32e-9785c81a42c1@kzalloc.com>
 <1088432b-b433-4bab-a927-69e55d9eb433@rowland.harvard.edu>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1088432b-b433-4bab-a927-69e55d9eb433@rowland.harvard.edu>

On Sat, Aug 16, 2025 at 10:16:34AM -0400, Alan Stern wrote:
> So it looks like we should be using a different function instead of 
> local_irq_disable().  We need something which in a non-RT build will 
> disable interrupts on the local CPU, but in an RT build will merely 
> disable preemption.  (In fact, every occurrence of local_irq_disable() 
> in the USB subsystem probably should be changed in this way.)

Or maybe what we need is something that in a non-RT build will disable 
local interrupts and in an RT build will do nothing.  (I suspect that RT 
kernels won't like it if we call spin_lock() while preemption is 
disabled.)

> Is there such a function?

Alan Stern

