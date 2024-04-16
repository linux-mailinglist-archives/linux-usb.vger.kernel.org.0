Return-Path: <linux-usb+bounces-9401-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 080B18A6FAB
	for <lists+linux-usb@lfdr.de>; Tue, 16 Apr 2024 17:22:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B89FA28532C
	for <lists+linux-usb@lfdr.de>; Tue, 16 Apr 2024 15:22:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E77AD130E2B;
	Tue, 16 Apr 2024 15:20:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dCxYMOWZ"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com [209.85.219.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 037FD130AC3
	for <linux-usb@vger.kernel.org>; Tue, 16 Apr 2024 15:20:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713280824; cv=none; b=ZqQmFDest8Dc1E3Pp9dBS1MRWwwvzWxDAP58GFEkoO4HzDqizzLhpiR1+XO/2MkKhWuHJgA2vUDSUm3dzf43OmmzLvAqIlROrHocIsQ+DxhsefQMkxF6XR7TZSjcjRdc86FR+ynknzmQ/M+CYEgYl2J4DlG+hmcUok2FPw6WZ+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713280824; c=relaxed/simple;
	bh=ogk92evleqkPuUaIzhiJjs+SO3WbwlZaxhfQYNosFdo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bNt0Q9KV7VFtnKtZAkJnK0c7rNQA1RgIWSo4Ulth7z75jc9w5tPKFdAYkwgDfOUMLcRkbveaBzr7O1qowHa4fRG3L2YGpYKbHxGJQ/OMscOtRqDrNZnLb3uPZy6eZIk4eA0SepViG7a9iEzLKSYwH60+BejWT+oRQGlY61oNZUs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dCxYMOWZ; arc=none smtp.client-ip=209.85.219.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f181.google.com with SMTP id 3f1490d57ef6-dcbcea9c261so4553008276.3
        for <linux-usb@vger.kernel.org>; Tue, 16 Apr 2024 08:20:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713280822; x=1713885622; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=mMO3J/koq2VtvnAEkr+zbw/DfMlDxsEOqsgIHHsF7Fg=;
        b=dCxYMOWZLpi9SzxL82oYeoszXPlVu2T7t8nrGA8nYJLxiZHGfcZeqUGW2N2Nc0bm3a
         bk2ap5DaEJrk81YgtZYVM9Ac+yo0XyNNW5Q86MnbkgwgklZYx32jhLM2rCKZ9n5isACl
         TAjmyPrGUqhxvR5T1EhysxYFqE4nMnUpQkbL1dDgicmAq/BS2UuVSCjtUePDkT+vEkhy
         zun6F2bxPh6b08BHa/HixWddN7DXmNt6A+4HxKn5B5OwY2pFsr6c2b63JpirD1A209YS
         gz5RmufOo6AOOalk3LE0+AQVGLcgU+0SR7eeGb+j5cwGwpLWbKbx/jI8bOXaLefjRJIF
         NMLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713280822; x=1713885622;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mMO3J/koq2VtvnAEkr+zbw/DfMlDxsEOqsgIHHsF7Fg=;
        b=L8y4sS0ge74O2WdCOyBIp5vjbH2MugJ1VXtDDpdLDKNo5R2Qn0keiAxI9xRU1lp2KZ
         d/WTvhTNrB3ZJ7atiOrdSjd7JuMwNkbCV/66sDl2/gUwqJoYsXdProouUafw7eaE7Tt2
         jKkxYCBE4OaMntDJBWjox3VZ1UqLzHoY/drj0bjKGX5+UYcP3fagcumry172wJZWGS3+
         wDTD5iOnm4VNoXMepqoAf08eA77uc4ZFo69uFknD9/W+mIKPbs1oN2/TtXnKHyAZoy3A
         SuBe5kwTyq5lzI4SLbhYkCIkZzyZwVHOrB7s/n/C4xy6tz6NrPtB0jBa4y1b0QeH2rjE
         dMow==
X-Forwarded-Encrypted: i=1; AJvYcCV5m/Dp9V916LvOwdlxKTF6QG+8rDCsguDVbYqX3C2nt/yuyg6+xDsi/gfJCV/cQ+mCyrZUY3aPSdJJIs8JilVNo+BhZ/D5PeAf
X-Gm-Message-State: AOJu0Yx/ssODIDYkINKrMN36E95uv3wbNdImGbSDa1jnmzl48dUigMx+
	k3DW7kZ6CbwHPNwj4rlwaHnvWVq72rJTVgC4TOZxBxz0+Rv8VhQJBovJjBkG/bA7po20P6I4aux
	7uMSs9igP09pH2qSgywN8lk89JwgmMrcstSKidw==
X-Google-Smtp-Source: AGHT+IEtsDJfZJ76KZn5Td8LpcHSFPRQ3TKmnwcVPVblLvXhJ7AGte9txzMCMRd181hjAL5xfz3A+oms+boqL8Xkn4s=
X-Received: by 2002:a25:8449:0:b0:dcf:b5b7:c72 with SMTP id
 r9-20020a258449000000b00dcfb5b70c72mr11140317ybm.0.1713280822073; Tue, 16 Apr
 2024 08:20:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240416-ucsi-glink-altmode-v1-0-890db00877ac@linaro.org>
 <20240416-ucsi-glink-altmode-v1-2-890db00877ac@linaro.org>
 <c129b349-dfaa-4b10-9b8c-6098d04b9373@linaro.org> <CAA8EJpqH2_ENE6am=m9dtwk_+_Vbc4pZG9=Y_4-b-p0fKQ4sBg@mail.gmail.com>
 <66cd0d96-7576-4f70-b4da-b8d518253763@linaro.org>
In-Reply-To: <66cd0d96-7576-4f70-b4da-b8d518253763@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 16 Apr 2024 18:20:11 +0300
Message-ID: <CAA8EJppf9z+q4_xjQE62Vi-2BiHJpUi7mS0EMSRV_XxbGH==qg@mail.gmail.com>
Subject: Re: [PATCH 2/8] usb: typec: altmode: add low level altmode
 configuration helper
To: Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Bjorn Andersson <andersson@kernel.org>, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 16 Apr 2024 at 17:57, Konrad Dybcio <konrad.dybcio@linaro.org> wrote:
>
>
>
> On 4/16/24 16:48, Dmitry Baryshkov wrote:
> > On Tue, 16 Apr 2024 at 17:32, Konrad Dybcio <konrad.dybcio@linaro.org> wrote:
> >>
> >>
> >>
> >> On 4/16/24 04:20, Dmitry Baryshkov wrote:
> >>> In some obscure cases (Qualcomm PMIC Glink) altmode is completely
> >>> handled by the firmware. Linux does not get proper partner altmode info.
> >>> Instead we get the notification once the altmode is negotiated and
> >>> entered (or left). However even in such a case the driver has to switch
> >>> board components (muxes, switches and retimers) according to the altmode
> >>> selected by the hardware.
> >>>
> >>> We can not use existing typec_altmode_enter() / typec_altmode_exit() /
> >>> typec_altmode_notify() functions in such a case, since there is no
> >>> corresponding partner's altmode instance.
> >>>
> >>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> >>> ---
> >>
> >> Should this now be called from e.g. typec_almode_notify to limit
> >> duplication?
> >
> > typec_altmode_notify works only if there is an altmode->partner (which
> > we don't have with pmic-glink).
>
> Yes and this seems to be an excerpt from these functions, should they
> now drop that code and call this function instead, so as not to have
> it in the tree twice?

I thought about it, but then I abandoned this idea. The
typec_altmode_notify() has its own use case, normal altmode drivers.
It is an error to call it if there is no partner registered, etc. So I
wanted to preserve error checks in that function instead of dropping
them. The significant part of the code is shared anyway thanks to
typec_altmode_set_switches().

-- 
With best wishes
Dmitry

