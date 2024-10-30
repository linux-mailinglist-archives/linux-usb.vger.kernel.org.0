Return-Path: <linux-usb+bounces-16859-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F02C9B631A
	for <lists+linux-usb@lfdr.de>; Wed, 30 Oct 2024 13:31:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C359028297D
	for <lists+linux-usb@lfdr.de>; Wed, 30 Oct 2024 12:31:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D63A81E9060;
	Wed, 30 Oct 2024 12:31:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wJOAeuW+"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 680B11E9062
	for <linux-usb@vger.kernel.org>; Wed, 30 Oct 2024 12:31:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730291494; cv=none; b=dkUm6vt/dfCjIr5f2BSn7Gs60bqMwmaUOA8BC4ppxo4IJLglmb1Ubu317IZIbUp8sX8s4cHVFVIy9/FGMHyRt8VU/fhXV7+g6b5cWbqSO2Lh1zuW/ugdUCfb8vMlR/Yljz9fCvJEjIYleCS2uHsX0w+BZdNneLTFNhbn8o8DEMM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730291494; c=relaxed/simple;
	bh=c5UhKQdavJdtLfcrTrc0Pq+QbHSzwUAht7VSpXUFBO4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=j452lEj1Uo82IqY83uca8jpGhU4hHjZShNBXsc9h2FMjvJwH8YtUrZefd9KxyFBapDQcBw13KvJVYZPPzEc5tAvkqm2BMQc63N5ohi7vvybe1D1Cb1OCFqt5o1ueNGXlLSOzjbu8jxo8TxmlwCIW4/a5YPxsML/KgFcyE8p1bkE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wJOAeuW+; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-539e8607c2aso6753292e87.3
        for <linux-usb@vger.kernel.org>; Wed, 30 Oct 2024 05:31:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730291489; x=1730896289; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=g2HB1B4iN3oWUrHv8ly8KNSVGjXRFIReK/a7cFEEc1o=;
        b=wJOAeuW+dtoZXFHLxSEn9k/sKyJL505R0VNBz7W1P7TIjiAfgu5JeL4Fyh6Czefzfy
         JgbsT9pqt4B9lJ42kLQzR8gu7+3nDh9kUt44+lDXS5LZ3B9Pu3X/w2xuQP+IsPtPydfq
         j9jbir8eoCWLpWlbX3YcTJbICMdq2ZognTZrWILEOz7fxUx09q49fy/CdYqdE6pX00cs
         CwTfjIl8dFDYU6e7IdMOKm04CDOzhYqvrlnXifmDKshWF/CfH9kOKKrbzBqjL2RU89T7
         4I5untgoEb0fMRYcXExhHKuEpIVnT3QE1gh3LqDEaQuWlhV3+0FvIUddYUGQUyQllSVw
         iPJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730291489; x=1730896289;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=g2HB1B4iN3oWUrHv8ly8KNSVGjXRFIReK/a7cFEEc1o=;
        b=GtO64TQiqJLfQzJfKJD0mOvpO8tht9DRObBHG6dKzHwANwWQeLDp8FRTNzzBoJtgQq
         nBXZi3P3bTECJgo1MOL+FSX4wbRUBFXJu5zm2lymYOsnBNFv0k88zwRg4U2wnYObiMj9
         sNr4wV765JAlW7kj4ufbjv2rZz73tMkrD9tASJGv6MDbTz7u6dn/U1J5lJCPA/Irwpmi
         KTNFjEPx4QL8VCGW9a8to2FSqX+DcJ3KiAkQz37YK0sCUb+B27l3ZVOp9X8WqwYY3zUs
         t+ylxn5KA6znzJuxPZ6+nMj0DCZ4SbkB42iQbPF903ABOZEq36EIvtZOZ3HqMc0EUpgB
         f/BA==
X-Forwarded-Encrypted: i=1; AJvYcCXaCyf1sNtL5yTOtbbZilhBa0rdX/aTYKHp5kTxdkGqWMFvTRHo3pIK8sftLed3IiyFxvkKPmCRsbU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzMUC7JUOHOIPAxX26k9axwIx/fjJRluMAnsju7A8hEelmRwJUy
	246hDPzv+pOYydEBcwYGGBx0oRXGYR5mevLBM5x18ev8f6ogWnz6t7elE7gC480=
X-Google-Smtp-Source: AGHT+IHLsrclSbDZwTl8mE7Mv4WoPP51WcILZWPPR/8gPywvqqqPPStO6/6vIkVUcLPPU1u+wGiErQ==
X-Received: by 2002:a05:6512:4022:b0:539:e333:1822 with SMTP id 2adb3069b0e04-53b348b7dc7mr7783566e87.4.1730291489365;
        Wed, 30 Oct 2024 05:31:29 -0700 (PDT)
Received: from [192.168.0.40] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-431bd947d3csm20053725e9.11.2024.10.30.05.31.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Oct 2024 05:31:28 -0700 (PDT)
Message-ID: <7446e285-f311-42bd-bf0c-a6fe54a862e0@linaro.org>
Date: Wed, 30 Oct 2024 12:31:28 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] usb: typec: qcom-pmic: init value of hdr_len/txbuf_len
 earlier
To: Rex Nie <rex.nie@jaguarmicro.com>, heikki.krogerus@linux.intel.com
Cc: gregkh@linuxfoundation.org, linux@roeck-us.net,
 caleb.connolly@linaro.org, linux-arm-msm@vger.kernel.org,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 angus.chen@jaguarmicro.com, stable@vger.kernel.org
References: <20241030022753.2045-1-rex.nie@jaguarmicro.com>
 <20241030103256.2087-1-rex.nie@jaguarmicro.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20241030103256.2087-1-rex.nie@jaguarmicro.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 30/10/2024 10:32, Rex Nie wrote:
> If the read of USB_PDPHY_RX_ACKNOWLEDGE_REG failed, then hdr_len and
> txbuf_len are uninitialized. This commit stops to print uninitialized
> value and misleading/false data.
> 
> ---
> V2 -> V3:
> - add changelog, add Fixes tag, add Cc stable ml. Thanks heikki
> - Link to v2: https://lore.kernel.org/all/20241030022753.2045-1-rex.nie@jaguarmicro.com/
> V1 -> V2:
> - keep printout when data didn't transmit, thanks Bjorn, bod, greg k-h
> - Links: https://lore.kernel.org/all/b177e736-e640-47ed-9f1e-ee65971dfc9c@linaro.org/
> 
> Cc: stable@vger.kernel.org
> Fixes: a4422ff22142 (" usb: typec: qcom: Add Qualcomm PMIC Type-C driver")
> Signed-off-by: Rex Nie <rex.nie@jaguarmicro.com>
> ---
>   drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_pdphy.c | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_pdphy.c b/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_pdphy.c
> index 5b7f52b74a40..726423684bae 100644
> --- a/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_pdphy.c
> +++ b/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_pdphy.c
> @@ -227,6 +227,10 @@ qcom_pmic_typec_pdphy_pd_transmit_payload(struct pmic_typec_pdphy *pmic_typec_pd
>   
>   	spin_lock_irqsave(&pmic_typec_pdphy->lock, flags);
>   
> +	hdr_len = sizeof(msg->header);
> +	txbuf_len = pd_header_cnt_le(msg->header) * 4;
> +	txsize_len = hdr_len + txbuf_len - 1;
> +
>   	ret = regmap_read(pmic_typec_pdphy->regmap,
>   			  pmic_typec_pdphy->base + USB_PDPHY_RX_ACKNOWLEDGE_REG,
>   			  &val);
> @@ -244,10 +248,6 @@ qcom_pmic_typec_pdphy_pd_transmit_payload(struct pmic_typec_pdphy *pmic_typec_pd
>   	if (ret)
>   		goto done;
>   
> -	hdr_len = sizeof(msg->header);
> -	txbuf_len = pd_header_cnt_le(msg->header) * 4;
> -	txsize_len = hdr_len + txbuf_len - 1;
> -
>   	/* Write message header sizeof(u16) to USB_PDPHY_TX_BUFFER_HDR_REG */
>   	ret = regmap_bulk_write(pmic_typec_pdphy->regmap,
>   				pmic_typec_pdphy->base + USB_PDPHY_TX_BUFFER_HDR_REG,
Acked-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>


