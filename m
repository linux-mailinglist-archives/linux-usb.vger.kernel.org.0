Return-Path: <linux-usb+bounces-11180-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7095A904D56
	for <lists+linux-usb@lfdr.de>; Wed, 12 Jun 2024 10:00:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 11BA91F25A6F
	for <lists+linux-usb@lfdr.de>; Wed, 12 Jun 2024 08:00:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 933FA16C6BD;
	Wed, 12 Jun 2024 08:00:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="WCd1yQzN"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13FA94696
	for <linux-usb@vger.kernel.org>; Wed, 12 Jun 2024 08:00:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718179249; cv=none; b=tW3a6uRBOjVw3/tF3FWZO2v7CRAGsYohC6EMN4y8DE5j4jHHGp1tWFaVE3dsYrfkrZXxjL9pj91YnzgJc9ZuUc8ofbOBRWNUjs2mVWS+OSKpX+Ho10YmLIFIFOpRtYB47s+WOhp059pP1l4+jqf0BPvNgg7NwMpIkMDONa8jGsc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718179249; c=relaxed/simple;
	bh=Iye8NbZSQ6kLwre3fp7X6/PawuNxoVKqvT377JMBMRI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=L7Lyr9uilP/UPLlyjNMBu8mAmJHx2264sf0Sl0QjVZnF3kkwiGX0+LNsXahQoIbfAWDRvaK2kR2K21/uNXK/Ejbua+D+vWWEm36mKai5sOh8QaKH5A19HRz0UgFAYGlXq2CuVep89iFa4msOWJmJcWGPkyTdzFI4tIGaTD7aqA4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=WCd1yQzN; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-a63359aaaa6so924111566b.2
        for <linux-usb@vger.kernel.org>; Wed, 12 Jun 2024 01:00:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1718179245; x=1718784045; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7wcRVW/nhW18asiOmcxYMI52nKc1Lau2tgBza0fWM8k=;
        b=WCd1yQzNAYSGRY5yoZmDG0Ys/l/UB7zu3NtU7wYnfwloPUHO2DDCkcrQxGt9ibExKz
         vQa4YWDbibA9ox4t9v/vOuHs4AsPWcvb3UxxADMMbY2eaF1gDbvMvSiQndF5PwzLItbQ
         MkiJmguaTYizyWPfmRbgA7hl1tY7zZozK+aNI+LnbS0WAhiqQPpos8oLbYuEOrf8Zqne
         NCdl1pUqEQoJKWUXrTVsSojV5114pEQ1I02PP3KJ7JwenhivrgvcOyx6X3vHBXYGpv5r
         NrMIIBZu8LZNUAmQy6WMhiPdTIfJZZSSeE0aPQdQd1tNQZWMuSt3kHcfzgCATMg9jbkg
         dHgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718179245; x=1718784045;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7wcRVW/nhW18asiOmcxYMI52nKc1Lau2tgBza0fWM8k=;
        b=P7o/YdcklGBLi2X426beh0S5v+z/Wn8A+6koFVbPbYDQp/jg0i3vljTkjPTsWeUBmj
         NUpOPfRDD4i1CRALnmIFbIvMcuY+CkoulCnK8zAgmziDO7EokkFicnlfl8JJWmb9c/Lp
         mfF1XHuAghGq2+jvv/+469TfbMQ8nK4vuqMQ8CyrhUAQ5WDpWse19bC5xS06BdF3tNX8
         Euw0u7XaPTmuvZCXFsos7ajs1wxuW6ohu73utieouTFuZemYYP7goCo8KedbC3oFD+Hi
         glc/BI0B496iaiaZMFzH+oHY60N/eAjOtgClUYtebWIH+K2n0UJTeYHOl+6NlVF2J4tc
         E22w==
X-Gm-Message-State: AOJu0YyeECU0iQSWGm5JU+FV8SPHxIPDjWOfBoacGXvX8YrvEJJ2AK03
	Ih9WEUkCjPByQIDCxTLxP0Xkce5Scvcym7IccNnOnbgPJQySqde+fmmVU5TubUDeR/M8qvdCj31
	1
X-Google-Smtp-Source: AGHT+IGRFholVNe/4JMsUiq5frRKGJ1K2M3+HujTTgz1BQSdVdgGDoBmuhS1E15RnAK9dM3I9sdihA==
X-Received: by 2002:a17:906:55cf:b0:a6f:e55:ba1d with SMTP id a640c23a62f3a-a6f47d1e186mr58094966b.11.1718179245217;
        Wed, 12 Jun 2024 01:00:45 -0700 (PDT)
Received: from ?IPV6:2001:a61:138e:201:27e2:fe9:90b9:6b9a? ([2001:a61:138e:201:27e2:fe9:90b9:6b9a])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a6ef7913eb8sm626424566b.178.2024.06.12.01.00.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Jun 2024 01:00:45 -0700 (PDT)
Message-ID: <378bad75-dfc7-4462-8fbc-a462e129a0ea@suse.com>
Date: Wed, 12 Jun 2024 10:00:44 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: USB Denial Of Service
To: Alan Stern <stern@rowland.harvard.edu>,
 Greg KH <gregkh@linuxfoundation.org>, Oliver Neukum <oneukum@suse.com>
Cc: USB mailing list <linux-usb@vger.kernel.org>,
 Kernel development list <linux-kernel@vger.kernel.org>
References: <40dfa45b-5f21-4eef-a8c1-51a2f320e267@rowland.harvard.edu>
Content-Language: en-US
From: Oliver Neukum <oneukum@suse.com>
In-Reply-To: <40dfa45b-5f21-4eef-a8c1-51a2f320e267@rowland.harvard.edu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11.06.24 16:35, Alan Stern wrote:
> Greg, Oliver, or anyone else:
> 
> Questions:
> 
> If a broken or malicious device causes a USB class driver to add a
> thousand (or more) error messages per second to the kernel log,
> indefinitely, would that be considered a form of DOS?

Yes.

> Should the driver be fixed?

If a broken device can do that, definitely.

> What is an acceptable rate for an unending stream of error messages?
> Once a second?  Once a minute?

Definitely not once a second. I'd be tempted to call a neverending stream
an issue by itself. The approach the SCSI layer takes by giving up on
a device if all else fails seems wise to me.
  
> At what point should the driver give up and stop trying to communicate
> with the device?

I would propose after five cycles of all error handling.

The exact number, as long as it is greater than 1 and a small integer
does not really matter, as long as it exists.

	Regards
		Oliver

