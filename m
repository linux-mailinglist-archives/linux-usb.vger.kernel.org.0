Return-Path: <linux-usb+bounces-9397-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B25DD8A6EF5
	for <lists+linux-usb@lfdr.de>; Tue, 16 Apr 2024 16:50:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E3E831C21EE3
	for <lists+linux-usb@lfdr.de>; Tue, 16 Apr 2024 14:50:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C826130A6F;
	Tue, 16 Apr 2024 14:48:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KcH/DCXH"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com [209.85.219.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3B1912E1E4
	for <linux-usb@vger.kernel.org>; Tue, 16 Apr 2024 14:48:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713278937; cv=none; b=C/Qjz9GwExFqpAgtfAstX7WA495RP9ibykLpyc1avRToGCS82LqR2VRnxg/rY6rVS+jTpYqg2jpFW5GKZ4BGyYlYSXj5pP/0GCCy58weQMHZpLIf+rVdV/lZaC5kGGFskYypO7wx6puDwzvemXHGZ8RbfBp93tYlIISkvfegDu8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713278937; c=relaxed/simple;
	bh=qv8o5hhH38UTAvt4yDxgWYargetk899Ucn2PZF21ckg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rWg/zS8hfGmkPUWV7gLl0+3RKGLU4iYTu232Al2yaJsRpL+Ux43F0z34BMOmcGGlpAXeOwYYB+SXWS8k72P3X64czyOptz2j1UoTQNR2b+Wgicq73xc4zskXD+vFItzh+spVs1Pd8UyM0IjvX3f4Oogsg1MZRzKAqK9/Pu2UL1w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KcH/DCXH; arc=none smtp.client-ip=209.85.219.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f173.google.com with SMTP id 3f1490d57ef6-dcbd1d4904dso4436946276.3
        for <linux-usb@vger.kernel.org>; Tue, 16 Apr 2024 07:48:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713278934; x=1713883734; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=dkC9HeIhznIftL0Ye+AK9W/2NXZL9l/CimUWQciD92s=;
        b=KcH/DCXH0v1SM+yruW0KCDSmky8T1P11lbQNNXceh7BrncWTGR6CiYapAy270aZyQw
         bxLHGjhNs0COXGmB5Pyu431vAOFmU3Zyc8uDmL0w7L4KmuJG95fjsHoAkOkVpGMIWpX1
         DBwGgVbntwdL//92x/R0J3YoH6z3Q/rq1MmRl5sgU2jDgTdt9X0T0WMXoMApOkH9NS7d
         SqYhXQbSwyolIjpGDpD9WJlq5gVVGsryyobmf3SVxhHCKGOb8/f/QkcoDiwNCx34jg2D
         7R8tOOtci0Xaq2dyZTultf2X2V5wCKhtaDQUlij0Ubz4WvzFshHZ0XeXfe83ngOOCVHT
         ZbuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713278934; x=1713883734;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dkC9HeIhznIftL0Ye+AK9W/2NXZL9l/CimUWQciD92s=;
        b=KQtASIrP10i7zOEYXuBPb12vJ8PopdwMPRuACW7FJGsN8ytnNWwSF8Pga6D7RA011+
         91Mjtb6Vp/EarjYaoORzkLXrK23d/nnywdVDr7jHHE2cxU8nd7n6Us3GpJ2pds/0UYR3
         UY41i/tFPE/ok8oCKZUh6WF/FUaW47QCnsucUSflFwQlvG5qIR6R1HsHdxeWiPON5Lko
         L4rmBbKAA0sSciGQ59ABVYzKoRxvdJlbeXtnklD9XF1ZghoVwZH12IiMRZcmaaXu6q+B
         mNrtNbMf8xRQRZ5YC/n9N9spxjfZ6VRr7v8KCB7NSYBeNI36reAtjFCzms7979q89V9a
         uQJQ==
X-Forwarded-Encrypted: i=1; AJvYcCXms06To7BwLtux0CoK/QpUr22dQBr9yh6v7HTO4t1ZHzHEoRw1Ajiyp2CqKD+o/fNdsC9iT5JSz84NEoLL3OlGxKqjqrVffvra
X-Gm-Message-State: AOJu0YzvXK9GdhPz1Y77zERX1C4hn7RU62gGQgsreWjOOfeSUi5HaKD3
	nmEhPVSELJ4VHN87Nsk/S4DWaye4kDu2cPwbEDvchUc1btUjIjSuLNkERpGH/lCAr4kULg8pTR6
	MIp4TjYIcKgSl25ZMwKEF4wGmJtZ+yPUtPZdUrHkU1X+UFphl
X-Google-Smtp-Source: AGHT+IGCYC5gD6+YiSV9qWfXxjR6Cc2xLYT1BNzarPUPBA5r2G201kk38iJ8HXhUjD3GioRz607Dd5DjZJEtcn7/0SY=
X-Received: by 2002:a25:2742:0:b0:dc7:5a17:6c3 with SMTP id
 n63-20020a252742000000b00dc75a1706c3mr11773509ybn.53.1713278933771; Tue, 16
 Apr 2024 07:48:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240416-ucsi-glink-altmode-v1-0-890db00877ac@linaro.org>
 <20240416-ucsi-glink-altmode-v1-2-890db00877ac@linaro.org> <c129b349-dfaa-4b10-9b8c-6098d04b9373@linaro.org>
In-Reply-To: <c129b349-dfaa-4b10-9b8c-6098d04b9373@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 16 Apr 2024 17:48:42 +0300
Message-ID: <CAA8EJpqH2_ENE6am=m9dtwk_+_Vbc4pZG9=Y_4-b-p0fKQ4sBg@mail.gmail.com>
Subject: Re: [PATCH 2/8] usb: typec: altmode: add low level altmode
 configuration helper
To: Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Bjorn Andersson <andersson@kernel.org>, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 16 Apr 2024 at 17:32, Konrad Dybcio <konrad.dybcio@linaro.org> wrote:
>
>
>
> On 4/16/24 04:20, Dmitry Baryshkov wrote:
> > In some obscure cases (Qualcomm PMIC Glink) altmode is completely
> > handled by the firmware. Linux does not get proper partner altmode info.
> > Instead we get the notification once the altmode is negotiated and
> > entered (or left). However even in such a case the driver has to switch
> > board components (muxes, switches and retimers) according to the altmode
> > selected by the hardware.
> >
> > We can not use existing typec_altmode_enter() / typec_altmode_exit() /
> > typec_altmode_notify() functions in such a case, since there is no
> > corresponding partner's altmode instance.
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
>
> Should this now be called from e.g. typec_almode_notify to limit
> duplication?

typec_altmode_notify works only if there is an altmode->partner (which
we don't have with pmic-glink).


-- 
With best wishes
Dmitry

