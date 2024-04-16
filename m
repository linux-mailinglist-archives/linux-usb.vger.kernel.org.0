Return-Path: <linux-usb+bounces-9393-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 78D3D8A6E4D
	for <lists+linux-usb@lfdr.de>; Tue, 16 Apr 2024 16:32:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AA3B11C22848
	for <lists+linux-usb@lfdr.de>; Tue, 16 Apr 2024 14:32:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 15FDF12D75D;
	Tue, 16 Apr 2024 14:32:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bKDDK3Gr"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 135B21CFBC
	for <linux-usb@vger.kernel.org>; Tue, 16 Apr 2024 14:32:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713277943; cv=none; b=I9iZF/74byDwZDhYxQkj7ltrZp7psmyohFxDqE5CqdqFppRTlRd7GnNfRgW55jGL5h4UQnCGYoXXXlmsbLBLVpvnXWlgrztKRMmc1bs3PNehipmwjjgw0RFHXS8qcMf+lwE8/hWF9TB91c+CbV86yyXekBIkyFBTQKMs0aCMdnc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713277943; c=relaxed/simple;
	bh=TrhX1jGQhTu2KIAciBeO1h+2JzMMjX7NZgRCla9EyWQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CJSmNgqosshLDXkfvoS41wvuLBMou4ThCGEoTGp5KpYavVqczryzKUnzDJQbBPLC6+aPChXRIom6QaknML7Q3pGf7A6qP2RJnuZRkD9AyT+vLKSQQAoGv5Q+GmJpbriuKbSxs+KurK7Xi+icn96t5at5igxRluRloqol2BFkRPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bKDDK3Gr; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-518c9ff3e29so3004102e87.0
        for <linux-usb@vger.kernel.org>; Tue, 16 Apr 2024 07:32:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713277940; x=1713882740; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Q5Zyzq1jaXk2PTeBnsS/HFR/E4JVz+BBU5ff7XaF+Dw=;
        b=bKDDK3GrYf4UfsxAMK8VpGZ2ZKJeaYNnJkBzL+ZmgIyU5hfp3QZzb1ZmkWE2xz1r21
         f1L4WiVR0vlml863tNPD0zHCKbylnSKnUdMZdlr479PWBmFs5mDVt47FZatTyHH8ex+A
         6yhlNlvutupCwqauiHVRYzWWrGw5/faAzTRSeCsNx/KWn109+aIMbqFsxqiRd/qB+PtC
         FwNvl75qDSwcgdXwsTSEVO4FheHP4yvGeDzuvkydO+BOqqNYhFUS4G0mH4M9KCsbJVVh
         b+8NVj5P+7bRi/lE8jzoK8uoiQ5BLz/z+LhBAEflD18fy0yJ+RMJHpCeXdeK+HMqS53T
         Xekw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713277940; x=1713882740;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Q5Zyzq1jaXk2PTeBnsS/HFR/E4JVz+BBU5ff7XaF+Dw=;
        b=HRq9KAW8DZfqFDhrQgkIMBUDLnR6u/7QpgNuoVCHs8S8MBIYJEiOD85pTl6bKbN0z8
         7g0Dn4jeW7e6tkvyv6KJn2x6A12EXqrQZZzMhL6CDtyI6kePZlAZhorh4wxGu5eXRa4H
         pwXHgZlo61s04Lnf9duzAqU0FoNLUQ+N4yyh1Oq/fW/zFCQ2GY6QmkTcUk8yDkSX+m6e
         IeYyiUWDPwik1iHvIOkdyypA8jbr9n4tETFzVLBwdTPs6LFVBuS8RVz68ihuLUVoG7fz
         QkwaDhf2sh5tP/nxI5zvwt06twLwcGK6QDRKw6DwU7NtLrQk3BWvioCnjt08D3S25mKG
         dPbw==
X-Gm-Message-State: AOJu0YzY8+jzDn8gQH/vzSckftRTyI9MDX1zvhYd8ihIBl81WbQa2BN8
	LMqiO388gVvuue3R7yFUwzpIbsFwAFgRUg/Ztw6h9/+HdtMnzUSpOz1O701ecYo=
X-Google-Smtp-Source: AGHT+IHgRG8rLgID4Qny4NHJoC2rlBQsPSp4jOqaP3Q5e3/gt0VA66TrCMy+WlpbvQARubScC1KY0Q==
X-Received: by 2002:a05:6512:3e0a:b0:519:2a88:add6 with SMTP id i10-20020a0565123e0a00b005192a88add6mr1250650lfv.55.1713277940250;
        Tue, 16 Apr 2024 07:32:20 -0700 (PDT)
Received: from [172.30.205.49] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id u9-20020ac248a9000000b00516cbd3e982sm1603141lfg.178.2024.04.16.07.32.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Apr 2024 07:32:19 -0700 (PDT)
Message-ID: <c129b349-dfaa-4b10-9b8c-6098d04b9373@linaro.org>
Date: Tue, 16 Apr 2024 16:32:18 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/8] usb: typec: altmode: add low level altmode
 configuration helper
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org
References: <20240416-ucsi-glink-altmode-v1-0-890db00877ac@linaro.org>
 <20240416-ucsi-glink-altmode-v1-2-890db00877ac@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20240416-ucsi-glink-altmode-v1-2-890db00877ac@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 4/16/24 04:20, Dmitry Baryshkov wrote:
> In some obscure cases (Qualcomm PMIC Glink) altmode is completely
> handled by the firmware. Linux does not get proper partner altmode info.
> Instead we get the notification once the altmode is negotiated and
> entered (or left). However even in such a case the driver has to switch
> board components (muxes, switches and retimers) according to the altmode
> selected by the hardware.
> 
> We can not use existing typec_altmode_enter() / typec_altmode_exit() /
> typec_altmode_notify() functions in such a case, since there is no
> corresponding partner's altmode instance.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Should this now be called from e.g. typec_almode_notify to limit
duplication?

Konrad

