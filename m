Return-Path: <linux-usb+bounces-9398-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FF078A6F01
	for <lists+linux-usb@lfdr.de>; Tue, 16 Apr 2024 16:52:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B97671F21335
	for <lists+linux-usb@lfdr.de>; Tue, 16 Apr 2024 14:52:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B122132C38;
	Tue, 16 Apr 2024 14:50:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vC5cP3gH"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com [209.85.219.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A54F212FF9B
	for <linux-usb@vger.kernel.org>; Tue, 16 Apr 2024 14:49:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713279000; cv=none; b=dwnN3TwHy/bU6Qn7Q3qQo/+0mZesChuKynesA24fTL0SZwl6I+sBHdMvNo2Qs+RrP8PyUwZrVt4EdildPw8x43I56KN9xbq0wzE/MdslARhrtB2d1WkGAXAH5SCI6MVAjI82yChA1Vyn+mTmoNF2Yr7l4REBc+o6E/2bluMA6GQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713279000; c=relaxed/simple;
	bh=3u9Sa7giDgPt1Wvl9jEHgyYRd2FVkBY5rzmWZa3BbG4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uHoFYmU+SGJJsLjaFNz8J14cIZkzakms405jqDjfFZ2CiYHjoGK7drWoFXcyEKn2EqSyryEH7CzeaRKdmhdQDzcQQksMmlv7dUzF0LemYO2oT1YYv4yDR/z88ZfdUtTW+7FDM5syJs7sR0kFHSUQFpfIU1uu8CviHSHlZmvX5WQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vC5cP3gH; arc=none smtp.client-ip=209.85.219.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f181.google.com with SMTP id 3f1490d57ef6-dc236729a2bso4331732276.0
        for <linux-usb@vger.kernel.org>; Tue, 16 Apr 2024 07:49:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713278997; x=1713883797; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=qJzGnOg1SHKsRCJmdbwuM9RJK+vob+tb6vu88judbOk=;
        b=vC5cP3gHToBZy30b/F1+l33Y23Zj4TQil2fSr7OpOEEKXZpfAa1IjRZsMc6OiQh9pJ
         xyd8+5NdqyKJ8wniYTrIeIRi8voZmTWw2huFADFFkMVPr2gac8chBeP8RprQy+OY8G5I
         B+rHQF3aKAkH/S3brxY3/j/q5jrisNjr6c2gcG5n7g5h0HTCEEhLYl3PFe6EXasT5ZHu
         ghaBR6bMf+j3K5VcoVHjHwHJGzwbLN43EghB5kT/rxEUCBHbTspiDDMHJcpNLIhwsMbq
         9WSpFvi0mgNEi8pLqrtpisJG/mixYzoB5G7BXbS+O6irqtrdwZK9G6IXxzvNqnKw/dmc
         D5Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713278997; x=1713883797;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qJzGnOg1SHKsRCJmdbwuM9RJK+vob+tb6vu88judbOk=;
        b=PjgtsA7XvPFIczJ/8VO/ACHB0D8kXwQVnPYSm7mQ/WdV2RDRMRoeYbl5jWvMTLd1+n
         XVKoTtMe9ju849O6WevoyXS2vQEf7vNN4SsWOYKH3SNbnbA2bW+kPkXKPV1tBSx8S3Tv
         hhKIk+2W59CC1l8aJb3AxRToOf0qOmO9ikG5sLfZMbaC781OqEIxlmYpDpYxasgcFolt
         UE+liOIZ9aE9eQJDxFebinPeCWAxjI58CSDmG4p6nSyW7H5DkDMT/dkgXFsUvbwjsV08
         fP4dLbEUS0n6uzSLBOB7lGru/whAOVZIXsXw1Y84X2RAlt3PKO/l8AfF65zUsiLEjQLK
         nb8w==
X-Forwarded-Encrypted: i=1; AJvYcCUXvr9VGDgq9TiDEqBV/zgHZfyNjHtDKsSyHTBGifs6SjhIsw1SLflMdP+xwh99etD0aoxtUSSeLdETiLsORKWcHpbEb9gpBTdE
X-Gm-Message-State: AOJu0YzIVTpMrLAi3fIazrsT82FcFs/ILAVLsFa1jS283EDsQVmwmroO
	E7WDXKM8Z69AY/39iWyjBNBeBmRdWDo3GEz8arXZ1MO86zrzSlWtq8hWisN+XouhR+PzWLfNYXU
	JT5VqwgYwh7d+ma8hV7vymwOA+RtyKz0+E3+k8It1EYWbjQvn
X-Google-Smtp-Source: AGHT+IENg3f4q4qDx4Uo22QWVhG5m/PHgSy1nPplO90P/inGp0NQFhD+3BgUC9UMslfVeoHnbLKK/wtJ+SfdgTeRyHU=
X-Received: by 2002:a25:74c5:0:b0:dc7:464c:e979 with SMTP id
 p188-20020a2574c5000000b00dc7464ce979mr12879999ybc.28.1713278997544; Tue, 16
 Apr 2024 07:49:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240416-ucsi-glink-altmode-v1-0-890db00877ac@linaro.org>
 <20240416-ucsi-glink-altmode-v1-3-890db00877ac@linaro.org> <1545d3fb-88f3-44e7-b981-610df6bdf6f7@linaro.org>
In-Reply-To: <1545d3fb-88f3-44e7-b981-610df6bdf6f7@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 16 Apr 2024 17:49:46 +0300
Message-ID: <CAA8EJpom1vnbjqOU6gD89TdZxDBzY_3upgrdvmXyJLA1tsDBvw@mail.gmail.com>
Subject: Re: [PATCH 3/8] usb: typec: ucsi: glink: check message data sizes
To: Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Bjorn Andersson <andersson@kernel.org>, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 16 Apr 2024 at 17:33, Konrad Dybcio <konrad.dybcio@linaro.org> wrote:
>
>
>
> On 4/16/24 04:20, Dmitry Baryshkov wrote:
> > The driver gets data from the DSP firmware. Sanitize data size before
> > reading corresponding message structures.
> >
> > Fixes: 62b5412b1f4a ("usb: typec: ucsi: add PMIC Glink UCSI driver")
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
>
> I think more backstory would be beneficial here.. Does this happen often?
> What are the consequences? What are the causes? Can there be one-off invalid
> messages, or does that mean the firwmare has entered some unstable state?
>
> And I suppose, if answer to the last question is "unstable state", are we
> doing something incorrectly in Linux that causes it to happen?

No. I haven't seen such cases. However as we are getting the data from
external entity which don't control, we should check that the messages
conform to what we are expecting.



-- 
With best wishes
Dmitry

