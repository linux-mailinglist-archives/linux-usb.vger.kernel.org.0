Return-Path: <linux-usb+bounces-19030-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D5BFDA0277E
	for <lists+linux-usb@lfdr.de>; Mon,  6 Jan 2025 15:08:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B6754163EDB
	for <lists+linux-usb@lfdr.de>; Mon,  6 Jan 2025 14:08:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 833E839FCE;
	Mon,  6 Jan 2025 14:08:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="V1vo8Xgt"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94B261DE3D8
	for <linux-usb@vger.kernel.org>; Mon,  6 Jan 2025 14:08:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736172498; cv=none; b=nPyKAdunI511YEH55qEdh885AMWF3i7ihOAE1nSdiiv/0rJCkRO75buzrtJ/ZCGBL4Of0c4Gww5mghwx/i2hOCAgU51qJu7CKBo0K6JxUuZnwKdeYzaC9xFneAZjoEH89BlhVpUYfJxkgNIWx6uUaO6LG5LrXXqCSzFtKmx2MU8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736172498; c=relaxed/simple;
	bh=ZG0NaFwz9G5fqvsq2izCmtS6FuKW/0V4z/9R9WaFugQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hO+AHc188T/R11KV+Upw0QI3Ycnufwtb0j/5nuvG+CpCHu7gxzkPqoASAnjjNj2oEe6adf43oGLM2RAqq/eAj4omsZp04zsG5A3+x8E9f9Z3gigVGO2Gk6yIl97DsRENl0Yv5jBEHqjxJjUh+tp2cX4IbFLQsBhvd6oeniXNEZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=V1vo8Xgt; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-38637614567so6541820f8f.3
        for <linux-usb@vger.kernel.org>; Mon, 06 Jan 2025 06:08:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736172494; x=1736777294; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=MkhddtM53/lRxIS1w0AkeDYUd6FyPmLCY7Qss8Z0uRM=;
        b=V1vo8XgtMdsHbB4eDNw9FK4waHbjCUTmY9zfd8dJKeIIe/25DrqttvS5pAqL3L/C+e
         E/fuHZgPT76G5D5aAqRiXjcF0WokNJuOpPzMrUjIzTSGUt5WGlXhb7KqoW/d475BaYBI
         y6NbURnykSXzWW3uDixZKIr5OtHWa/mB8TW63B57RvctgVedxoyHtgalevzRIGaUC0bN
         1KyYMgmA1GlGoIISf1JVSdGd2ZRon3WF6S4AQ/fUqOHKxaHVWFrsdnYjXlPrOL+axCwv
         iPvO/vxx3iuBRJnnmgh6XnSRmk9cChLaWpnbqQTE3qfLU+U5OXFv+isZQKCkDqwLNwEp
         iLjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736172494; x=1736777294;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MkhddtM53/lRxIS1w0AkeDYUd6FyPmLCY7Qss8Z0uRM=;
        b=YO6fRFd0NavTfNxlelKgIDiDgu22iMoKPrCmyGPsKb8rKRRWVRNIRCSR9mFqkHQNT9
         ccEopBLPtPifKfS4hdjjULYrFJZR0pA1+xWBozCs4h9lbwjOoIbhfknnIX/9Qb2kRitj
         5WlyoioF1KMFKexCNqA47UepIa99A+s8VlktDGw9gcX9wQiUP4uJoBzy/aQFoGba/WKT
         GJg+lzqGkWvkV5/O/kcq6+HF4r005IrRbRGKR31yLWK+nNEYt+DajcvjJk1SS+FwGreh
         6u/Bzgir9FB2uLfTkC9mARtNo7uX64AW25NxFKvnanftbr5MH94D1cMqdXNISIHMNgRM
         RHLA==
X-Forwarded-Encrypted: i=1; AJvYcCWqxDiqZnGNYq3n6Xc/QIhUXN90MlPF5hCKud44ojcvZBnQsdL/ZKho95cNeaG0vgX7NBF/zFxi3bU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxKc8qdOwiyinQErPvMuY3Ho0qA4GNnyD3YMYUtmkwSoAOgkwgW
	tAXV3IPqdZb8BBmXXN1piq9xjF3zo66F9blzu5UheqqIVYKaP1pmZGrXDML/gn0=
X-Gm-Gg: ASbGncsmnp63LZ+/BzV2JaV7j0shFwTm1rle+5lHGZ12xwjmAZqvykS/uSsaagsYhT5
	CHXt3ogdFSY7Za3drHc96/UEosFdEtryfGQJjPbdorW8bGzzUelkICL/+kyB+kIShkLtEfU0LBC
	2bIVARTE1vCEsjsc/9qPbH+RgWJ1TxrLzOH+RczaOIWXHZfpVCPccxIViUgIYtNoWW0a2WJnkba
	M1qCAV7TadKbpm2Cc//a7GINEiwxGtNI4YL4qeThgbT/bvAdVLuZVyEqbCBnw==
X-Google-Smtp-Source: AGHT+IHxJd6/jCnqerT/Da4ZTP09Lg0pyp/gO/+rCzrTU4IwDFInLhJW5eG6FxrapNj3GYrEXtPEow==
X-Received: by 2002:adf:b302:0:b0:38a:3732:444e with SMTP id ffacd0b85a97d-38a37324592mr33895959f8f.55.1736172493966;
        Mon, 06 Jan 2025 06:08:13 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a1c89e2d2sm48700493f8f.71.2025.01.06.06.08.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jan 2025 06:08:13 -0800 (PST)
Date: Mon, 6 Jan 2025 17:08:09 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: GONG Ruiqi <gongruiqi1@huawei.com>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: typec: fix pm usage counter imbalance in
 ucsi_ccg_sync_control()
Message-ID: <6d1f15a1-1905-42e4-989c-f6aab7acad9f@stanley.mountain>
References: <20241230093523.1237231-1-gongruiqi1@huawei.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241230093523.1237231-1-gongruiqi1@huawei.com>

On Mon, Dec 30, 2024 at 05:35:23PM +0800, GONG Ruiqi wrote:
> The error handling for the case `con_index == 0` should involve dropping
> the pm usage counter, as ucsi_ccg_sync_control() gets it at the
> beginning. Fix it.
> 
> Fixes: e56aac6e5a25 ("usb: typec: fix potential array underflow in ucsi_ccg_sync_control()")
> Signed-off-by: GONG Ruiqi <gongruiqi1@huawei.com>

Ugh.  My bad.  Sorry.

Reviewed-by: Dan Carpenter <dan.carpenter@linaro.org>

regards,
dan carpenter


