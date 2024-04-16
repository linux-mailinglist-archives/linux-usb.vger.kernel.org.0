Return-Path: <linux-usb+bounces-9391-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 381888A6E47
	for <lists+linux-usb@lfdr.de>; Tue, 16 Apr 2024 16:31:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E39621F2172E
	for <lists+linux-usb@lfdr.de>; Tue, 16 Apr 2024 14:31:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A2D0312C7E8;
	Tue, 16 Apr 2024 14:30:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Ca2BeV89"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF21182D9D
	for <linux-usb@vger.kernel.org>; Tue, 16 Apr 2024 14:30:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713277841; cv=none; b=Y3T5FlMxHwy/RSKc9kFZcLuX4+XsISlyMYxJOFtJJt7XOYf6vyU0hNgH9T1buWekYA9EVQQOjuCluZwrVgeJPqleKja47Thcfu7b2aGeUKCrjgDwAaJh9JHOf8jfiYVbus+DpabhLe4vL7mrji1EB6yDQpSt37y5tDhhnC3gTeY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713277841; c=relaxed/simple;
	bh=CAARwFVs3yKtCFYh6SSnNVSgkeqkGD+D2UB4mgMiryI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=G2zZWScykXymYeGyH8p7k/7wYhpSZruR4p8JDmEV1c0jmjuzAot8E+BZ005QIhPXF0PR+VAM75AJUayzYrnF6+jdDMyOXkyW4C+KGrr2ek92Sl8Ej+ccdaCLPBjGepOkB7SLGY5Y2twaBB0s0KmACfuMSz0EQLD9Boy8o29Wd4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Ca2BeV89; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-516d4d80d00so5492662e87.0
        for <linux-usb@vger.kernel.org>; Tue, 16 Apr 2024 07:30:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713277838; x=1713882638; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qtlZKHIIRTPrmMPlNl8Y4g3IVRv6I4I2Gd41GRQ6SNE=;
        b=Ca2BeV89Guy6F32bAlZwvBBu+IIfV9BGYU2y4i2dQl3lcI+5qbmD84jaxX5KpcSc5k
         tw6ZHUXgC8zpmojotXgwUYTQT8LZ3gMoQDTEASVUrYA4nKmxepySJvtt/4dbjomCkt9t
         tfgtGdjDaNpiUI/U4XaihQ7rYx8C5pZL0hQGQIweCzekCP8nTRNG0RIqr6wfVepq0D5L
         kzjxS97DpHp3RpV+bQer2ymb5G5EJygtAbBaLheE0W6qnAVUg7cv6bdEP+DmInLWUiSg
         QUqCBjwcJqw5B+YpiiVG8Xpr68C+HhhVmem4O6tA0T3yBnxgZG5qbAocng2SjDDGdlv8
         O03g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713277838; x=1713882638;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qtlZKHIIRTPrmMPlNl8Y4g3IVRv6I4I2Gd41GRQ6SNE=;
        b=Ldj/T9bAO9KhqpkuLXL3RtWFsxx32raeRyuo97d3j0PFT5whUv+kJIgAEsXMPeUEKD
         C7TOwbWoSf7Kk0rRiJ3xKb4/Xit2dCLPKaVv/8c2jB0/ifnDmKGvqG/fBe2EUxrUSxRA
         nZFhZqAiNQ4VbThyStNmLDZFW4psqbApuZXr/p+1zKlOILo/PI7vx6vgKHoq/h0vCJ0x
         9w8qtkhD46xNfZL8/PAOg4sEHqwcE2gmTpKjzO+Smt6N3jGxH5Z2Y3uK0iTynFK3JT0y
         asyTDHOKtBz369DOnwP9v/suH4i6GBv6OB/q0HL27kRSzIDu/Wv0VtM9tZwlhtYGE/Td
         aDgw==
X-Gm-Message-State: AOJu0YwVvxyJWjktmyakQpUnvEtjBDQbJLLRW/++jYVRtzd8DQrjLAI9
	M8BrJ0qT+7U8xYGkwO/p3UQFfKteKC36jW5yqM8wCfNJnLvtxH0NzMPfYaYOj/vEq3rcZAJtEXO
	E/7o=
X-Google-Smtp-Source: AGHT+IEMK3ToPpFre8TBGqqiH04egFU2RIZe5ZOa5Ve6c3up7Osw5BJsl/VXC/ZDiEBh5lIfs2bIVQ==
X-Received: by 2002:a05:6512:280a:b0:518:e249:c10d with SMTP id cf10-20020a056512280a00b00518e249c10dmr5163603lfb.37.1713277838030;
        Tue, 16 Apr 2024 07:30:38 -0700 (PDT)
Received: from [172.30.205.49] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id g8-20020a19e048000000b00516d2c05b3dsm1633547lfj.299.2024.04.16.07.30.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Apr 2024 07:30:37 -0700 (PDT)
Message-ID: <548f4b0e-b765-4184-8b90-eec7fe0e7f69@linaro.org>
Date: Tue, 16 Apr 2024 16:30:36 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/8] usb: typec: Handle retimers in typec_set_mode()
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org
References: <20240416-ucsi-glink-altmode-v1-0-890db00877ac@linaro.org>
 <20240416-ucsi-glink-altmode-v1-1-890db00877ac@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20240416-ucsi-glink-altmode-v1-1-890db00877ac@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 4/16/24 04:20, Dmitry Baryshkov wrote:
> Make typec_set_mode() also handle retimers in addition to muxes. Setting
> the USB mode requires retimers to be configured in addition to just
> switching the mux configuration.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad

