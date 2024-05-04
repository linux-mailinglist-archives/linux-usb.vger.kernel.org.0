Return-Path: <linux-usb+bounces-10025-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B8C28BBC67
	for <lists+linux-usb@lfdr.de>; Sat,  4 May 2024 16:23:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3B0191F21F95
	for <lists+linux-usb@lfdr.de>; Sat,  4 May 2024 14:23:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C7093BBD6;
	Sat,  4 May 2024 14:23:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qQWX46Fx"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8199637143
	for <linux-usb@vger.kernel.org>; Sat,  4 May 2024 14:23:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714832616; cv=none; b=t4klWRNqgjc4Xhyn5XoRTBrHtWokG8GHrir/yFstreS/qVq4Gvg6VsFK0cSVkRd5itew5C8vJ4S/sYVTry9u4RkoDVNzO7D0EfVJkburP+KM2lnFdOZkaGj3x01hTXOsq2naEz0ZTW+UzsSHSczD1Z0XsvVAhz2OCjgPHJgnkJY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714832616; c=relaxed/simple;
	bh=y75AN2Eb9Z43K8Zlq8B9sIRhxsU+B1oi120DXCdH5J0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GHKVqa5sTSpCWyPgum6fmAzb2l6oCfgW+AsWiN6ixnYHzaA//GkHtQ9p408F7Bi7g8B1hEa126V1rH/3LR/z6v4cc1EhF/PaNUEL9Yz0FEhV4ZmkBdAPZhL2E2lThfoO5nngU6NO9TxQ9eLex0YEDOz3Y0IV3v6mkD26LLMwWkg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qQWX46Fx; arc=none smtp.client-ip=209.85.128.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-61bed738438so5478747b3.2
        for <linux-usb@vger.kernel.org>; Sat, 04 May 2024 07:23:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714832612; x=1715437412; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=oYpgysV6C7z+41TaXZjrYbHNTUm3GaxC0myM0ir6p7A=;
        b=qQWX46Fxd12pqnMx9TAUZ0lqtfHGWQr91+q+Q92e5PNjgXI+Y2zgIXkJ0IVWCMq5mA
         XqZsj7KbMmrDCWLLh9MWgWIxC55VMFJeQW78BSV1+T429PcNPjN3kJwZ4Y+RTsFoG/cG
         FRIYvrUAAnvMgoprG9Nor6/uheC3zw3pFmStOOjRaqnobyN7j4+Ul5wdj38dMr5dtNcM
         v6DM20C1w7PzJZjs9VShEu8nPo87guzsh2953z2+f6HHOk7CcWy7kGVKdZv6PBku0AdU
         TPHtLcdWOm7sUmDwHSTBOi2JOZ7SjJGDM7tD/zFZXeqiOwtk0RKGq3Ls+iezLrYT3pNp
         h4LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714832612; x=1715437412;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oYpgysV6C7z+41TaXZjrYbHNTUm3GaxC0myM0ir6p7A=;
        b=uWn9XqiDzmJQ7cVETylpgQ5WUR8XHWI2wxO+4SgydBA5fg5H5hcb1tp6GJJAzMVltB
         JZ2h0TDnoy1Cpt/awIX8vrWOuaYV1QN+G+/KMwVZl53JtPkpTQGqyxDF7rc/+XpfCmCm
         jtqKyfYyGNIHcJgtkj1PhQIt/2E0ii+fvcTtSiQSko79SZo2LF2IDkaFbHHGwRC6oS5o
         zeUxmPRsaikfbg6q5egWvFXn8d4oGObpu9p3QOrXE8L6ece3umx0/RrhGkifb4FtITk0
         yBua6v5+yVd906DXWv16UMvOMBdqCMTPcfBIp97wOk9vSL3B4I8DPDKq2Me1mTbzQlIh
         SrVg==
X-Forwarded-Encrypted: i=1; AJvYcCXywLNH7WutwL7rjjH1gNVKtfiqlDQTjCabnInIWEyOIGnMiSVpayuhVncOAXqZLpyU/cRm9RGvKKuuhuC5Xd9j6W6Vs/0lFvWW
X-Gm-Message-State: AOJu0YxmgPQvJPa1fdSR5ye+Vn4fH5pCA0s1BmLLZb8bzPD+IqU/sWgw
	SB1bNzXoMt7ZLQEmvQgx0vhCQFz84Rr8kFHQzUarCdl+7eIxIh8PPW71Wt/ie0uTYxEOx2Lq927
	Dqh1//rPKBjWF6LwAVLhYkCudgKcqAnjLn2XVrA==
X-Google-Smtp-Source: AGHT+IFrVYg+j2KdRyjEFtu0OvJtTSoRRR8Jts+xFmvtlHeA50pHCZzmyrZuJce9b/rD/5DcCVrZMU3t1SQM6tGaKMs=
X-Received: by 2002:a81:ac60:0:b0:615:3332:f352 with SMTP id
 z32-20020a81ac60000000b006153332f352mr4719637ywj.52.1714832612476; Sat, 04
 May 2024 07:23:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240424-qc-pmic-typec-hpd-split-v4-1-f7e10d147443@linaro.org>
In-Reply-To: <20240424-qc-pmic-typec-hpd-split-v4-1-f7e10d147443@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 4 May 2024 17:23:20 +0300
Message-ID: <CAA8EJppCxfrBcctaR2jOrwPuO8ZFQw9vmi-0CH_sSWBm3ts7JQ@mail.gmail.com>
Subject: Re: [PATCH v4] usb: typec: qcom-pmic-typec: split HPD bridge alloc
 and registration
To: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Johan Hovold <johan+linaro@kernel.org>, linux-arm-msm@vger.kernel.org, 
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Caleb Connolly <caleb.connolly@linaro.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, 24 Apr 2024 at 05:16, Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> If a probe function returns -EPROBE_DEFER after creating another device
> there is a change of ending up in a probe deferral loop, (see commit
> fbc35b45f9f6 ("Add documentation on meaning of -EPROBE_DEFER"). In case
> of the qcom-pmic-typec driver the tcpm_register_port() function looks up
> external resources (USB role switch and inherently via called
> typec_register_port() USB-C muxes, switches and retimers).
>
> In order to prevent such probe-defer loops caused by qcom-pmic-typec
> driver, use the API added by Johan Hovold and move HPD bridge
> registration to the end of the probe function.
>
> The devm_drm_dp_hpd_bridge_add() is called at the end of the probe
> function after all TCPM start functions. This is done as a way to
> overcome a different problem, the DRM subsystem can not properly cope
> with the DRM bridges being destroyed once the bridge is attached. Having
> this function call at the end of the probe function prevents possible
> DRM bridge device creation followed by destruction in case one of the
> TCPM start functions returns an error.
>
> Reported-by: Caleb Connolly <caleb.connolly@linaro.org>
> Acked-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
> Dependency: https://lore.kernel.org/lkml/20240418145730.4605-2-johan+linaro@kernel.org/
> ---
> Changes in v4:
> - Rebased on top of Johan's patches
> - Link to v3: https://lore.kernel.org/r/20240416-qc-pmic-typec-hpd-split-v3-1-fd071e3191a1@linaro.org
>
> Changes in v3:
> - Updated commit message to explain my decisions (Johan).
> - Link to v2: https://lore.kernel.org/r/20240408-qc-pmic-typec-hpd-split-v2-1-1704f5321b73@linaro.org
>
> Changes in v2:
> - Fix commit message (Bryan)
> - Link to v1: https://lore.kernel.org/r/20240405-qc-pmic-typec-hpd-split-v1-1-363daafb3c36@linaro.org
> ---
>  drivers/usb/typec/tcpm/qcom/qcom_pmic_typec.c | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)

A stupid gracious ping. It would be nice to fix the issue in 6.10

-- 
With best wishes
Dmitry

