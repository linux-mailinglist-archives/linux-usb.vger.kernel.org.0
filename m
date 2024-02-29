Return-Path: <linux-usb+bounces-7323-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 90FEC86C884
	for <lists+linux-usb@lfdr.de>; Thu, 29 Feb 2024 12:52:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C39A81C20E96
	for <lists+linux-usb@lfdr.de>; Thu, 29 Feb 2024 11:52:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B0D197CF30;
	Thu, 29 Feb 2024 11:52:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="HGQMKhTm"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D87847C6EE
	for <linux-usb@vger.kernel.org>; Thu, 29 Feb 2024 11:52:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709207547; cv=none; b=Pi+99C4iiiAQNWFInp1VVzUxBgj15HICX4rH4eJhN2jHXnW/FaYZHFsBV1zSNf0hfbWeVZ+90/ICD2Z87CCdFyqgYrarB8S2DP891PqcAsTATHlwRGQTzcel5qZucJuUTV+TIE6pMUt93w1sX/SqAYBC2F9MSdyMAWsgDNc9l9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709207547; c=relaxed/simple;
	bh=7d6CvrWmzaz6TNCwdkf499bxCEdW1K7nR/01VhW1RJA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mguTDo0J32Y6PEs6OXupHZS4aDueLwz+kEUleKGykj0eWd7YAZEcCU8IV7EMOxBbFzXLoAHCghAEsjc6CFr+Btj8J/wLx3rvUZt/tcHIM903fOgpK8Q6b6SzP1Dctpns6PR3oQebDS0Bw4BdqcliHWtgzFBdA6AtGPwtNqLYM3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=HGQMKhTm; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2d311081954so3306671fa.2
        for <linux-usb@vger.kernel.org>; Thu, 29 Feb 2024 03:52:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1709207542; x=1709812342; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=79gNBOsuDeIYR+Lh3gRA6KG8pNTkHwRoYAWTsnujzmg=;
        b=HGQMKhTmMZ63lzVoTzex9HePv1nw+L0kznKo07FxUoEhDn3SN21QGPemUEeRKCjkIk
         xq894Z/ER8zch3mA6RgqfFqqIUO73VhbknagdGEgOlQgzvBpiNBEuVTGtiGKVvOs1Iik
         mjHtAAISejZNbTTv7TBDPyeZv8Bji+gbG9+bmbSxRzOxDKBlbj9AtyetNR8jpToZgchq
         KTuOWQSjXxNRD4LyuLLjp7rq/rht4MmtvdLvw9t4ldZrkhwGy0GOjP9tUTlTahDmWARR
         hgPPZ7JF3xlveDxrewDZjAy1AhNYZfh44V6Y9CvTupghnqSVQa0fdKQWqBOPmru7/w6R
         69jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709207542; x=1709812342;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=79gNBOsuDeIYR+Lh3gRA6KG8pNTkHwRoYAWTsnujzmg=;
        b=U3F3oDcMkYrEg8SnarIdZaJtBTiuEk1cWXssqjDgCz1A+b21Jj9JmZCUYywrNFIh2K
         EaqZlvNz81ZdQBNppMysrNCHfzVNi4MhPEi8R405Sp9JtNju7Lx/3U+CH6nwyZpVpG0V
         3c3zRW27ar3ox3RTnX9VDsKeO7jb4O1s4G4WaGI2OLIyDRxa0s4u/dVfBln8nzZAHW9Y
         j5byi9/8AgRHsupW8t/h+6m6CqVqmKE2D8yPmHOMlYeCsSU+Dc1iqvBrxIgiGKMs3HnX
         0LLW+cyaH7gULXWv8TuqXdRCI9PwtG2EaP1AJfSKKQkucP5tApzc8yoDdWSfQ6UJCCCa
         tBSA==
X-Forwarded-Encrypted: i=1; AJvYcCVfoThsUP5kByU9nUT97zsN+god43JcRr8fj2aOZe3Dfq+Ys3gv+6l42PawbsZDHJvIwUwtH0SnkfjhNTOzlbZW7wklT4UwaFMA
X-Gm-Message-State: AOJu0YznvoU/x1kZzZC43GNnCcrw1bPiyNKWvP9jCw1wKPMii9FgR3mj
	K6Tl8T2exZEjlsj8udIVTYE2ECO5eU8KxgS2Z3HCDieGDaGyDIwTUdnyGxjd+Yg=
X-Google-Smtp-Source: AGHT+IGhwPu+Q2oxJ6EL93Dq/uuQN0NQLhyZbY884uXBca6OJ0LijbNlZgjt3A3mOMZBdiCsTv8nRA==
X-Received: by 2002:a2e:9f46:0:b0:2d2:64ca:7a2d with SMTP id v6-20020a2e9f46000000b002d264ca7a2dmr1304324ljk.31.1709207542106;
        Thu, 29 Feb 2024 03:52:22 -0800 (PST)
Received: from ?IPV6:2001:a61:1366:6801:d8:8490:cf1a:3274? ([2001:a61:1366:6801:d8:8490:cf1a:3274])
        by smtp.gmail.com with ESMTPSA id bj12-20020a0560001e0c00b0033db0bbc2ccsm1690355wrb.3.2024.02.29.03.52.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Feb 2024 03:52:21 -0800 (PST)
Message-ID: <7a48c332-acbe-4677-b189-9dda01151d18@suse.com>
Date: Thu, 29 Feb 2024 12:52:18 +0100
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] USB:UAS:return ENODEV when submit urbs fail with
 device not attached
Content-Language: en-US
To: Weitao Wang <WeitaoWang-oc@zhaoxin.com>, oneukum@suse.com,
 stern@rowland.harvard.edu, gregkh@linuxfoundation.org,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-scsi@vger.kernel.org, usb-storage@lists.one-eyed-alien.net
Cc: WeitaoWang@zhaoxin.com, stable@vger.kernel.org
References: <20240229193349.5407-1-WeitaoWang-oc@zhaoxin.com>
From: Oliver Neukum <oneukum@suse.com>
In-Reply-To: <20240229193349.5407-1-WeitaoWang-oc@zhaoxin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 29.02.24 20:33, Weitao Wang wrote:
> In the scenario of entering hibernation with udisk in the system, if the
> udisk was gone or resume fail in the thaw phase of hibernation. Its state
> will be set to NOTATTACHED. At this point, usb_hub_wq was already freezed
> and can't not handle disconnect event. Next, in the poweroff phase of
> hibernation, SYNCHRONIZE_CACHE SCSI command will be sent to this udisk
> when poweroff this scsi device, which will cause uas_submit_urbs to be
> called to submit URB for sense/data/cmd pipe. However, these URBs will
> submit fail as device was set to NOTATTACHED state. Then, uas_submit_urbs
> will return a value SCSI_MLQUEUE_DEVICE_BUSY to the caller. That will lead
> the SCSI layer go into an ugly loop and system fail to go into hibernation.
> 
> On the other hand, when we specially check for -ENODEV in function
> uas_queuecommand_lck, returning DID_ERROR to SCSI layer will cause device
> poweroff fail and system shutdown instead of entering hibernation.
> 
> To fix this issue, let uas_submit_urbs to return original generic error
> when submitting URB failed. At the same time, we need to translate -ENODEV
> to DID_NOT_CONNECT for the SCSI layer.
> 
> Suggested-by: Oliver Neukum<oneukum@suse.com>
> Cc:stable@vger.kernel.org
> Signed-off-by: Weitao Wang<WeitaoWang-oc@zhaoxin.com>
Acked-by: Oliver Neukum <oneukum@suse.com>

