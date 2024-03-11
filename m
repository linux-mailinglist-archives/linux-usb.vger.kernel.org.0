Return-Path: <linux-usb+bounces-7842-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E6B1878BA3
	for <lists+linux-usb@lfdr.de>; Tue, 12 Mar 2024 00:48:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 26939281730
	for <lists+linux-usb@lfdr.de>; Mon, 11 Mar 2024 23:48:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA82D59161;
	Mon, 11 Mar 2024 23:47:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="mAfP9QXT"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CACEB58AAC
	for <linux-usb@vger.kernel.org>; Mon, 11 Mar 2024 23:47:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710200878; cv=none; b=IU8/rq3fXHD2owX9MFn7dzW9vl0F8SmjxDsw05w1bFeUldtHfH5rC1Nw87RtujTUHTP41uqJXrR0RAdJ7n1aQtP6lluRU/vVTDOnkrZgi4arfVu+Nu+ejbA8UFApSf4KYY5PtlalRA9rg7J3Xvk28gdKUGuMxJ9oML573jtiyCk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710200878; c=relaxed/simple;
	bh=47I9y9d6m+sWHb20BjXAdG4iVoGGvHvr9MoKNbZqVB4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qgOTvR6F3gUqeTA/fOap1/yt5Bk+IuSLtDDIA/E19oD59jgzUKKMSvLntxCmylnGSsm66YRl6F7Rcm51CQZB9NfkLjjHSKtfVVy0O4UyPLfK+bKP8pemyWvk8cj1aGTdQaO1wChMRA9X6hUkArTnlS9hbgMgbzHYJwNSll1c9ys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=mAfP9QXT; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-568251882d7so7584a12.0
        for <linux-usb@vger.kernel.org>; Mon, 11 Mar 2024 16:47:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1710200875; x=1710805675; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=47I9y9d6m+sWHb20BjXAdG4iVoGGvHvr9MoKNbZqVB4=;
        b=mAfP9QXTQvwB7FdLdUoeWQtnmDkg4GqIskq0q6UZc35z0GfUz3gpTlDY1AwRh0ERD8
         MSEu7JY939Jpg4wGpvqPdjnIYssaq+QYdfppwmBOR2Ak4utQ+lVffWVcgw16KzFFzjQ/
         kI5WoJCmvQzIwtoxoddPuY2Qba9pismti/Iu+2tHF/ouPPm4iSvp2vn+AoBLZtLjR67K
         G4peMNF6VN9WUMU9/xhANc6QAxBM9aFKmmR0G63IGzmgqanvc3ySkwPiOBSvcG1Lqc2C
         zMB65sdXg9qRhe135RZ0WlTfqXeW8Tk10GYJILUuKyqJ8CHGvlc8fkzR4wH4I26punve
         B+Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710200875; x=1710805675;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=47I9y9d6m+sWHb20BjXAdG4iVoGGvHvr9MoKNbZqVB4=;
        b=ob+Fg4pQ2G7xwdFEsl40WEhOw/oeVGLuDSQ5vuuCU85JNT6RDPonlkjzYC6owtdc+i
         zzKQSnJGjOr6ZTMry4cxanszMVMyojikv82lMwyWN+raUuxGxBHZqtz/EcWOkfah7J8m
         BuXqSnHOw5JUoQsT5m14qA44zsihWC1sCKaTEnx9q4FRi5ZGVQhruTh6C0fNoYse+glh
         K7pqHgam5/+uMem7pvnBHEoDjS1js+q9FM4iKkFyBxZKAJr8fIaXyIJkKsI1a8zPKIYU
         5PXusG/JYYXcnO/odeJ/gjoGm6Tldra/7T49QTd0JwkEuATEvy86ZS6c4BpcENLCivui
         h8kQ==
X-Forwarded-Encrypted: i=1; AJvYcCWNrtqGeEO5/iHP86jSfbCHPtn+cgHZ6h8ZyLNlfjtm3mFhtGNTf1kqUZpNGh1gYNkF8YQrRGM/EvH0cHc8QpBtOucFnibhWcbp
X-Gm-Message-State: AOJu0YwPCucu1+fo8cdVIaHYdseRgAesCZcCzZRw4935EDG/Ij49ssRY
	uRCBzbCySyjEaKyxgEzGery+DZ4unweT7SiS+L+gS8tnhlNPDgJgrM+ndTTku5nzkg3kt9RSXR0
	0QRNXP1zouUCrSpme0bgTttfe705e6FjK2itJ
X-Google-Smtp-Source: AGHT+IETgRPqiRPbjXlytKWnI8hu5RRmZmhuCnz7VkKXbd9crkp5Z06XYH+DNdrtU45ZfgOq+m/uFl50UP0/GeFNtkg=
X-Received: by 2002:aa7:da44:0:b0:568:55db:8c69 with SMTP id
 w4-20020aa7da44000000b0056855db8c69mr72961eds.4.1710200875068; Mon, 11 Mar
 2024 16:47:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240305025804.1290919-1-jthies@google.com> <20240305025804.1290919-3-jthies@google.com>
 <44e8142f-d9b3-487b-83fe-39deadddb492@linaro.org>
In-Reply-To: <44e8142f-d9b3-487b-83fe-39deadddb492@linaro.org>
From: Jameson Thies <jthies@google.com>
Date: Mon, 11 Mar 2024 16:47:42 -0700
Message-ID: <CAMFSARdZLnfUOZcKVFNCwq40bEZgk0Bo_Oe-o8o7iKk7gQ9G2g@mail.gmail.com>
Subject: Re: [PATCH v4 2/4] usb: typec: ucsi: Register cables based on GET_CABLE_PROPERTY
To: neil.armstrong@linaro.org
Cc: heikki.krogerus@linux.intel.com, linux-usb@vger.kernel.org, 
	pmalani@chromium.org, bleung@google.com, abhishekpandit@chromium.org, 
	andersson@kernel.org, dmitry.baryshkov@linaro.org, 
	fabrice.gasnier@foss.st.com, gregkh@linuxfoundation.org, hdegoede@redhat.com, 
	rajaram.regupathy@intel.com, saranya.gopal@intel.com, 
	linux-kernel@vger.kernel.org, Benson Leung <bleung@chromium.org>, 
	Linux regressions mailing list <regressions@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"

Hi Neil,
thanks for catching this. You're right, the UCSI driver doesn't need
to be sending these commands when they are not supported. I'll post a
followup patch properly gating ucsi_get_partner_identity and
ucsi_check_cable.

Thanks,
Jameson

