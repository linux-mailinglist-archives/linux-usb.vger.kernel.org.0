Return-Path: <linux-usb+bounces-9349-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E3F968A4A9E
	for <lists+linux-usb@lfdr.de>; Mon, 15 Apr 2024 10:43:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 848521F24B5D
	for <lists+linux-usb@lfdr.de>; Mon, 15 Apr 2024 08:43:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 58D9E383BE;
	Mon, 15 Apr 2024 08:42:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="dCoAEPLg"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB1903BBF4
	for <linux-usb@vger.kernel.org>; Mon, 15 Apr 2024 08:42:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713170566; cv=none; b=OpUG8W4PHFkPAEx0fxQoqlmH1aVVFcJhF3XGCOPK1CzL1BStXV9En8wP3zgR4owxgrseWBDjmXEs3yqe7mf1OnvWbAR27SkeL6M8UrAaE76WAHwZlzGSX93r4PtmmdS5GM/+Eu4jhG9b3xBBgG3jjKfpCP5Pf0OYYE6Tikp9dPo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713170566; c=relaxed/simple;
	bh=lsNA25Hve1uKuZ0Fo31C4L3iCmQ0dq1xxEBRYOkQj3Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Qsqi99j6AmT86uPdyxLlYqESXKOg0TroaM6t9ZZZl/0MeQT/FKZaSePrhkEgjU368YwBCTfXHI1D+qRlyReouCLGljqOrtQxQV6M1sl3fcIJ9lG58ErHVIqJIVUgb1Ws+yT2C7zjharrIPZg0lbUC8NEE9hRmQXOkUe0vCPLNdM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=dCoAEPLg; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-a5252e5aa01so196487466b.1
        for <linux-usb@vger.kernel.org>; Mon, 15 Apr 2024 01:42:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1713170563; x=1713775363; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=k1cz5najN+xwuJfZkkj9Amv0HLnPLbSM95zuUMKQZGI=;
        b=dCoAEPLg0JhE8Azdmt9LMtQjIVhxTrTPz3JVVRT/khIuy7UUuHaqnUXfBBPBFwhyVx
         srsjGixNEXYnSWrAkXCgpJnlhxDc5ohO6MuMvdyuPljD/+VVQ/j/+BDVra0v7YZOYrRK
         NDhJrxMbpRI/0tm8hMxLxCxwy2VomqykCEAEkIBINqsTSj/R036vubI/AEGK+uIZPNBV
         aIfBbWPsXWdphm93aS1xkT3TgkGAc8h4TWQ6COreyDdt4mdL/T09KQO1TOwPFLJPKDSI
         +QtcUORC9Y9gk+S8H6QSg/kDZjF0Q35eiBhQUNXVxzIwSY5y7doiabVGLtQz9c6BV0YB
         orXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713170563; x=1713775363;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=k1cz5najN+xwuJfZkkj9Amv0HLnPLbSM95zuUMKQZGI=;
        b=OOIgzix55K04hd+iJu2U4u5mJCRIUI+OJviWy/5dy1+/ZH/FbkVmRejPQRQ173tnVI
         Cln3YifLLGpkbiEZuCm8wE8y4IBtjj8ENoB34wcKwH5vHDMWL1ta70xY2mtUDagvZemN
         D24I9LuEIVLr069gOTiH6NySEHuo947aCiFD6cK58eDgcCsd3A6hlnrJQVVH4R2pJkWQ
         ECiZEYcTZXzeshq2+OGwVstWVk/liHfLtEV5bvsCIBI3oelEFP532Rclwsxr2Q8Q8ZNE
         aDtXTOqiOnpgiAOj/2dKMgSUonxjbfNFWiK8klbpD7+5CPmVrEK05pYHExE4k33xqeqa
         8PgQ==
X-Gm-Message-State: AOJu0YxMeNmw2LD2Q83CTrnq7yh5t42LpU4fICSYKS0C9YbgW8rLpT1I
	5zIgazJSnOdI4x1xogbzwnIeUDGWf3948UrOXaxrUERB05xCQS2QgBqpEP2sMypk5dyjTHSQ5H5
	h
X-Google-Smtp-Source: AGHT+IGxmdMCD68BdG5qehJC80yGzVw2DjtHoP/u2mDoWGEYMTcotqFXQdRUe34dZrNc2lZtBY5u4Q==
X-Received: by 2002:a17:906:3756:b0:a55:3240:ba3b with SMTP id e22-20020a170906375600b00a553240ba3bmr264616ejc.8.1713170563090;
        Mon, 15 Apr 2024 01:42:43 -0700 (PDT)
Received: from ?IPV6:2001:a61:1366:6801:d8:8490:cf1a:3274? ([2001:a61:1366:6801:d8:8490:cf1a:3274])
        by smtp.gmail.com with ESMTPSA id b24-20020a17090630d800b00a4e781bd30dsm5167412ejb.24.2024.04.15.01.42.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Apr 2024 01:42:42 -0700 (PDT)
Message-ID: <6133bcab-ae0f-48f2-b223-2b74082a0552@suse.com>
Date: Mon, 15 Apr 2024 10:42:41 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] usb: cdc-wdm: close race between read and workqueue
To: Aleksander Morgado <aleksandermj@chromium.org>, oneukum@suse.com,
 bjorn@mork.no
Cc: linux-usb@vger.kernel.org, gregkh@linuxfoundation.org,
 linux@roeck-us.net, linux-kernel@vger.kernel.org, ejcaruso@chromium.org
References: <20240314115132.3907-1-oneukum () suse ! com>
 <385a3519-b45d-48c5-a6fd-a3fdb6bec92f@chromium.org>
Content-Language: en-US
From: Oliver Neukum <oneukum@suse.com>
In-Reply-To: <385a3519-b45d-48c5-a6fd-a3fdb6bec92f@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 15.04.24 07:42, Aleksander Morgado wrote:

Hi,

> We are not aware of all the details involved in this patch,

I had gotten bug reports about resubmitting an active URB.

> but we had to revert it in all the different ChromeOS kernel versions where we had it cherry-picked, because it broke the MBIM communication with the Intel XMM based Fibocomm L850 modem. > Other modems shipped in Chromebooks like the QC based Fibocomm FM101 don't seem to be affected.

That is odd.

> Attached is an example output of mbimcli talking directly to the cdc-wdm port (i.e. without ModemManager or the mbim-proxy).

Could you provide a working example, that is with another chipset? And, most important, dmesg for both cases with
the log level set to maximum?

> In the example, we are receiving a bunch of different messages from previous mbimcli runs. Looking at the timestamps, it looks as if we only receive a message right after we have sent one, e.g. after each "open request" we end up receiving responses for requests sent in earlier runs; or something along those lines.

It looks like you are hitting the race later than my bug reporters, which means
that the submission works and we do not overwrite the buffer.
  
> Is this bad behavior of this specific modem chipset, and if so, how can we workaround it? If you need any additional information or help to test new patches, let us know.

Generally losing data is bad, so I cannot readily tell.
Please provide data for the working case.

	Regards
		Oliver


