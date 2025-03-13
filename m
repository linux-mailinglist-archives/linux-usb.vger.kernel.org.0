Return-Path: <linux-usb+bounces-21708-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 974CBA5EC8C
	for <lists+linux-usb@lfdr.de>; Thu, 13 Mar 2025 08:11:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CBFF7166F6F
	for <lists+linux-usb@lfdr.de>; Thu, 13 Mar 2025 07:11:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 030801FC0EE;
	Thu, 13 Mar 2025 07:11:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZqJ2TxVQ"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDD671FBE9F
	for <linux-usb@vger.kernel.org>; Thu, 13 Mar 2025 07:11:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741849906; cv=none; b=lry77+NSnSjsuiNuBa5ln+Mu05ECkTC6xA8vQfUzfufPGfVfpqYa+7lxhSVz+JEIck60YlTIHpSt7iAoJjfwjLY7bI3HboyW2iM3N0gKZxo60TpSqNqSIRtrcPGT6s58h5gGY3byOYP9gmhwSrxjg/dFDu8jfhLMgSsi+nVTQck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741849906; c=relaxed/simple;
	bh=gOCEcaOm4eg+X9g2FjfIO3JavsstQR67oggC/rHb/Jg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=krBDKTqPl+g/0X+ulQdspN3ZY3t3/f/5irqnbqzEZOuGJ+knRVYSHrpU8dVT+YE8OC4IHdldbwoyAqGu09Muq+qkx0lmftiKOfasBsEU6OWntQD3TX4kHF1AvXK3uePXAhFTEaBricklrJM3dp8l1034KDlNvuwDHTezOJEews4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZqJ2TxVQ; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-5e5b736b3fcso105560a12.1
        for <linux-usb@vger.kernel.org>; Thu, 13 Mar 2025 00:11:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741849903; x=1742454703; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=gOCEcaOm4eg+X9g2FjfIO3JavsstQR67oggC/rHb/Jg=;
        b=ZqJ2TxVQgnCmbdYI//mYGHSKQKw6cNFRg/Y6FeKgyM4q4pcubYRiXwzMN/i6tNC2os
         0++tUgO+kPUi/zw0589dQuja5Zl+jRA+iZ91B3Ja4KZbw2ZOFt5aIakrcY4l2o2vHhdA
         8xiDhL63YOYoGC3GYZrQmTrOR1mr8EhvHU0C26vx6GUo/sR+hiWxg7tP67+0lcTfRRwE
         fKnRdpDfHtDcHVW8ioml9M6MVWkmtv5HzqUUfcblO3n2VUFvJ/2/BgScS1gZ7FYJycDA
         2pfXv2tiauxuvyYbY8nxuuGaM9Mne/pm68p86qYzg9ftJrg0nFGPHly3UkN7O3yxfkgk
         to4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741849903; x=1742454703;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gOCEcaOm4eg+X9g2FjfIO3JavsstQR67oggC/rHb/Jg=;
        b=tPt04dvMOyI/m6b4agj3cKQU3Xuk9YYelkbFQKfdfR6g52LtdmQIez/9w1bje+HDuJ
         8+cd9jv3FKpVZVbFfRCKsWxl29+joJis2PsMjurgBRadPZZ0VUn0bzUiXWoFD8uG3SMt
         YQmgVGvZOCkV7kOiNRucAqruBybmbyyqDglSfekIMDh2mopXjzEtwuM2UE/wu+G93at8
         B7yxurK7LnwlYHGp5ez4fpVd9x9qP2t4zCcc94W6Skff/4iXOn+WIBOyAu1GPfeXT4iH
         U7VO+r+2yBVXP3kc4EEsAB7qaumeVSUsWtTapIbGicLxFnTD4Jn/QkWSC0AXs1PX+blP
         2ZdQ==
X-Forwarded-Encrypted: i=1; AJvYcCUtDySuywNWDyAXLyAghvDbohR/11woQ9AwLuGQcznp4rWde53naD/FYpye9Uza52KQGodO61kNLNY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxu54qRZOI5mP3C9Af9fw2Gr7umnWr0aIrV7dVtPFw5ME6x6d6T
	Cyx5zqXmmlVnIOns/ZI7orSyCAhq62MlyrcBMWLfz8/E5OLPiU8br+dtBnZmLZ8=
X-Gm-Gg: ASbGncv/4ia6yilNTJGIuz7U+bnYO/s2doJn0YjoGLTXfv83KnYDkr/wLn/0O8sF+kP
	nfB8ryA7oLxYZEj7s90oRJuzm9h3myspGHNM41uQdQv//k7Jkjea2glJ/nnM9a9oejr54qEaQU4
	q09igXUo1SB4LSatte5Cxh3jgt400kKg6dEhgE6Vw4JO41QK+8wHfbHgnivScs08DoY6w1D7qJi
	9NW2//r+9Rv6Bo1yUdnTmQvZDh9KxFNMN9jN+Kmy8V7wKTI8XHO2F55S6pzkxUntlz9dA+6Dw3W
	R9s/4oaLOttqb/BrHeuZXrn9j0GR0UWHVrreL3N+HJlr+huVu0ttmwVJ5FxKGWWIM8bP34zIkg=
	=
X-Google-Smtp-Source: AGHT+IHf+zTLxwilMFVAfGkK4qptdBvl1euTGV3k7WvO0Y7yIjyV+YJp/OXPip+JVtdHHXI0I4Dvxw==
X-Received: by 2002:a17:907:3e8f:b0:abf:7a26:c489 with SMTP id a640c23a62f3a-ac2b9ea164cmr398284566b.9.1741849903224;
        Thu, 13 Mar 2025 00:11:43 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.198.86])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac314a9dafcsm45512366b.170.2025.03.13.00.11.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Mar 2025 00:11:42 -0700 (PDT)
Message-ID: <52e592c5-7f97-4b7b-bcf1-1bca34c716e1@linaro.org>
Date: Thu, 13 Mar 2025 08:11:40 +0100
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 3/3] mfd: cros_ec: Don't add cros_ec_ucsi if it is
 defined in OF or ACPI
To: Jameson Thies <jthies@google.com>, tzungbi@kernel.org,
 ukaszb@chromium.org, bleung@chromium.org, heikki.krogerus@linux.intel.com,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, groeck@chromium.org,
 swboyd@chromium.org, akuchynski@chromium.org
Cc: devicetree@vger.kernel.org, chrome-platform@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
References: <20250312195951.1579682-1-jthies@google.com>
 <20250312195951.1579682-4-jthies@google.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20250312195951.1579682-4-jthies@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12/03/2025 20:59, Jameson Thies wrote:
> Check for cros_ec_ucsi to be defined in the OF device tree or an ACPI
> node. If it is defined by either OF or ACPI, it does not need to be
> added as a subdevice of cros_ec_dev.

No, it does not have to. You just populate the children and appropriate
devices will be created automatically. None of parent devices should
ever check if the child exist to create a child - it makes no sense.

Best regards,
Krzysztof

