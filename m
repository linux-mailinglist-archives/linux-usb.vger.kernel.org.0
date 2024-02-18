Return-Path: <linux-usb+bounces-6683-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 01759859397
	for <lists+linux-usb@lfdr.de>; Sun, 18 Feb 2024 00:19:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0FBE91C2131B
	for <lists+linux-usb@lfdr.de>; Sat, 17 Feb 2024 23:19:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6CCB38003D;
	Sat, 17 Feb 2024 23:19:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qyCPmg0m"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10A12134A4
	for <linux-usb@vger.kernel.org>; Sat, 17 Feb 2024 23:19:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708211971; cv=none; b=q/WzgEkn1mov1z/Xsq8uHqVoTsCLtWVh9qr8kKc6RgWNL8s09hISZP0WCJ0LpOuRU5eFCC9rWj1AihrRqDDtLZZWcvKZz+XeH3LjqJC4ZP+nS9TgRKEs2K9wdFB9eMxm0wji/I2Q3mIETzPXPvRNRjNBgQgmhg1VxhDUU9gecec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708211971; c=relaxed/simple;
	bh=ejFiyX5Y48GnsTRzZkDDmJYg7BZGDQ2NC6dM2wKl7xA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZRl4jKJcA62IbnQ4WJKkF2DYGInrRNmOVaM/6TrDLpVEruEGJUV/hrhS0dyOYw65fB7fsn25dn1+q2ea+m8sRG3Y+AQatERZlJ+j8m9h5Bo0IdMtQ7zG9vBqL1wo5NxbTJ926vTOnIwx1VUDSB7olKxGHJ9NlfPt7wEE1uMM194=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qyCPmg0m; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-41242d2f73cso12393405e9.0
        for <linux-usb@vger.kernel.org>; Sat, 17 Feb 2024 15:19:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708211966; x=1708816766; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=y+8yVef0IxB64BgBgbXrUUDMOo31nuSoxBJ3jXfRWXc=;
        b=qyCPmg0mEod9eXWUZspM0W5jpYQR0oWfSgr1T9sTu2LIdiMqxzirkkA9SuDuvcPB60
         cIdwKANZDvNQK6yUTQ8y5SGcYdbQJEI5KwF35h7K4arhzxePViW7LS8yQGm4Gm/KWHLv
         SQtZLIFSJvNZHH4qfdRy7qc32zm6Ms14rlf3OeZLCQ+bgklBlN296KZ9XNohzduCFE65
         +gfi2vo23GN1tWxYOc5iqJ/fotRPzWQbjaXsDrZD/b88FhtBzg80+X4fX5eENzOv0U5S
         z4FQ0uNodKmhsYu1XtA4/mV6CIirNg5p+ZgQaM3ThwaceaWaTbP2gp8PkpeaPFloGf+L
         P6/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708211966; x=1708816766;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=y+8yVef0IxB64BgBgbXrUUDMOo31nuSoxBJ3jXfRWXc=;
        b=FzZ0ovvzwnLe5GwMNw+Tm2/vxdg5qoSPpwTi1qAXlalnvt4icHvWbwG7r7RGgWJDPM
         vknRbUfx8FuNeT3w8hY8kwBHxA5vK9ys2OaKgld1dBI3f+sH5j9drPVvheHFfBmVIeKk
         0FnTfmURP8fxRZcUIAvfaSRtndu/dnqLEhbqXhHCKC4MOe8Th5MQvgjztDR2Tr3OTdTn
         rvIk9z6DvDkx3FLVWwVl3QBF4UDMrcZB7ijQoqoVOY8okNVSjJIl9McDNk38RxB8Lmo2
         bz5uYK3iMVOh3EmXqJwTPd4ysj2PkzipixyJcXABHLWNxXaKfPO491s4AvEHSLFw8Vc5
         r0Xg==
X-Forwarded-Encrypted: i=1; AJvYcCVXWf/uh+H5R0BhgiXDksdc6KdJGxrG967qzEr48qGGrNtHB8AIihHtliRaY0lq61kSALlT4tYFpxElPP/fg/GweuN/JKHTuqQC
X-Gm-Message-State: AOJu0Yx/0DwYI5i1Bu4+SdaMnIRmUue0x1PgXf/NaT9NkvaBf0Js5mwX
	dkATq+BBfpQvjw8gnwT9w35NcKFkiyjw7RlN9EwVIVSXE4haB+wT7Lko6MWskzA=
X-Google-Smtp-Source: AGHT+IFIgryvjSckfWJopkzQi2nT6qNNleKaF5g/1YrgsTnAmR6iQLoojiH8dVcMtnSFefOzTONvrw==
X-Received: by 2002:a05:600c:4706:b0:410:27e7:4c5 with SMTP id v6-20020a05600c470600b0041027e704c5mr6983198wmo.29.1708211966397;
        Sat, 17 Feb 2024 15:19:26 -0800 (PST)
Received: from [192.168.232.204] (31-187-2-26.dynamic.upc.ie. [31.187.2.26])
        by smtp.gmail.com with ESMTPSA id fs14-20020a05600c3f8e00b00411a595d56bsm6402650wmb.14.2024.02.17.15.19.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 17 Feb 2024 15:19:25 -0800 (PST)
Message-ID: <6bf11ccd-ff08-369b-913f-277c189afb76@linaro.org>
Date: Sat, 17 Feb 2024 23:19:21 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 3/3] arm64: dts: qcom: pm6150: define USB-C related blocks
To: Danila Tikhonov <danila@jiaxyga.com>, andersson@kernel.org,
 konrad.dybcio@linaro.org, lgirdwood@gmail.com, broonie@kernel.org,
 robh@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 gregkh@linuxfoundation.org, quic_wcheng@quicinc.com
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-usb@vger.kernel.org
References: <20240217163201.32989-1-danila@jiaxyga.com>
 <20240217163201.32989-4-danila@jiaxyga.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20240217163201.32989-4-danila@jiaxyga.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 17/02/2024 16:32, Danila Tikhonov wrote:
> Define VBUS regulator and the Type-C handling block as present on the
> Quacomm PM6150 PMIC.
> 
> Signed-off-by: Danila Tikhonov <danila@jiaxyga.com>

> +		pm6150_typec: typec@1500 {
> +			compatible = "qcom,pm6150-typec,
> +				      qcom,pm8150b-typec";
> +			reg = <0x1500>, <0x1700>;
> +			interrupts = <0x0 0x15 0x00 IRQ_TYPE_EDGE_RISING>,
> +				     <0x0 0x15 0x01 IRQ_TYPE_EDGE_RISING>,
> +				     <0x0 0x15 0x02 IRQ_TYPE_EDGE_RISING>,
> +				     <0x0 0x15 0x03 IRQ_TYPE_EDGE_RISING>,
> +				     <0x0 0x15 0x04 IRQ_TYPE_EDGE_RISING>,
> +				     <0x0 0x15 0x05 IRQ_TYPE_EDGE_RISING>,
> +				     <0x0 0x15 0x06 IRQ_TYPE_EDGE_RISING>,
> +				     <0x0 0x15 0x07 IRQ_TYPE_EDGE_RISING>,
> +				     <0x0 0x17 0x00 IRQ_TYPE_EDGE_RISING>,
> +				     <0x0 0x17 0x01 IRQ_TYPE_EDGE_RISING>,
> +				     <0x0 0x17 0x02 IRQ_TYPE_EDGE_RISING>,
> +				     <0x0 0x17 0x03 IRQ_TYPE_EDGE_RISING>,
> +				     <0x0 0x17 0x04 IRQ_TYPE_EDGE_RISING>,
> +				     <0x0 0x17 0x05 IRQ_TYPE_EDGE_RISING>,
> +				     <0x0 0x17 0x06 IRQ_TYPE_EDGE_RISING>,
> +				     <0x0 0x17 0x07 IRQ_TYPE_EDGE_RISING>;
> +			interrupt-names = "or-rid-detect-change",
> +					  "vpd-detect",
> +					  "cc-state-change",
> +					  "vconn-oc",
> +					  "vbus-change",
> +					  "attach-detach",
> +					  "legacy-cable-detect",
> +					  "try-snk-src-detect",
> +					  "sig-tx",
> +					  "sig-rx",
> +					  "msg-tx",
> +					  "msg-rx",
> +					  "msg-tx-failed",
> +					  "msg-tx-discarded",
> +					  "msg-rx-discarded",
> +					  "fr-swap";
> +			status = "disabled";
> +		};

Should all of these be rising ? Looks incorrect to me.

Please review: arch/arm64/boot/dts/qcom/pm8150b.dtsi

pm8150b_typec: typec@1500 {
         compatible = "qcom,pm8150b-typec";
         status = "disabled";
         reg = <0x1500>,
               <0x1700>;

	interrupts = <0x2 0x15 0x00 IRQ_TYPE_EDGE_RISING>,
		     <0x2 0x15 0x01 IRQ_TYPE_EDGE_BOTH>,
		     <0x2 0x15 0x02 IRQ_TYPE_EDGE_RISING>,
		     <0x2 0x15 0x03 IRQ_TYPE_EDGE_BOTH>,
		     <0x2 0x15 0x04 IRQ_TYPE_EDGE_RISING>,
		     <0x2 0x15 0x05 IRQ_TYPE_EDGE_RISING>,
		     <0x2 0x15 0x06 IRQ_TYPE_EDGE_BOTH>,
		     <0x2 0x15 0x07 IRQ_TYPE_EDGE_RISING>,
		     <0x2 0x17 0x00 IRQ_TYPE_EDGE_RISING>,
		     <0x2 0x17 0x01 IRQ_TYPE_EDGE_RISING>,
		     <0x2 0x17 0x02 IRQ_TYPE_EDGE_RISING>,
		     <0x2 0x17 0x03 IRQ_TYPE_EDGE_RISING>,
		     <0x2 0x17 0x04 IRQ_TYPE_EDGE_RISING>,
		     <0x2 0x17 0x05 IRQ_TYPE_EDGE_RISING>,
		     <0x2 0x17 0x06 IRQ_TYPE_EDGE_RISING>,
		     <0x2 0x17 0x07 IRQ_TYPE_EDGE_RISING>;

		interrupt-names = "or-rid-detect-change",
				  "vpd-detect",
				  "cc-state-change",
				  "vconn-oc",
				  "vbus-change",
				  "attach-detach",
				  "legacy-cable-detect",
				  "try-snk-src-detect",
				  "sig-tx",
				  "sig-rx",
				  "msg-tx",
				  "msg-rx",
				  "msg-tx-failed",
				  "msg-tx-discarded",
				  "msg-rx-discarded",
				  "fr-swap";
}

---
bod

