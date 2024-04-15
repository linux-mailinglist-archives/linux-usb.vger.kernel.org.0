Return-Path: <linux-usb+bounces-9356-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FEBB8A4C55
	for <lists+linux-usb@lfdr.de>; Mon, 15 Apr 2024 12:15:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F40151F2243C
	for <lists+linux-usb@lfdr.de>; Mon, 15 Apr 2024 10:15:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D70694C618;
	Mon, 15 Apr 2024 10:14:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="FZssINlV"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E16A433D8
	for <linux-usb@vger.kernel.org>; Mon, 15 Apr 2024 10:14:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713176093; cv=none; b=sGgGOR3B0VumeVdklB6hxPUcQhJri6b6COgdrIZYcdqHcNz7ta5yZDgO8nwcCeZGDfKgSaR0gZZqFq91TYKGY0qNrXekhrQwzi9QaMkxqSipjlWTrZNP+wRoSfAuPmLfatmiVqH6jOS/zBNjV1AbnJzcTGt4gHZDEo8TR+BFQkI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713176093; c=relaxed/simple;
	bh=C9sQZgU41qox3cdQNRYM+VmJ0KsaHwAs5oL/6SV1szk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jh14YtR7u+d1OYQuqk8BwCQyd1e7+mlkiQDaslZp/VeGjiKzxQ6HWLMksVUUULWfngtErPosSnSgUy1eohwxp6JuBKodBqHu66Q6pVCA+UDQG/1WmsyVxrSzTlAVsIMjZmbwHeYNZ+LCv+R3DCNvvdpbGTWToOzVngAecW5T0Bg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=FZssINlV; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4187c47405aso848965e9.3
        for <linux-usb@vger.kernel.org>; Mon, 15 Apr 2024 03:14:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1713176090; x=1713780890; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ch7nAOdYuE5TTx7zosaZVjyYvnMuu77K7uAtyFJG1J4=;
        b=FZssINlVL/D9xt6U/cHtfuZAcLUnsydZx03U7MJ/jpQjkAMn3wZlR/gfU8hny7ZrtR
         5Hvv4a7IEwqlSqg3Zb0n05GsXTYmGoiP1DH+qZVVfgUtN5fg7b+4V1imxsYXp/ugRBM4
         Hh5hhVWt6I/0nKLnvKNzxHVR6GtLp8IayRseaF244SgsnT3wAG59u8fswU0sq+WE0ide
         zIqpF1AfPwU6CSLDiEy6KHpCd1cYRkHGCQwHJem7EHv2B1XmhjrEJZv7Fi8IX5HTtiNZ
         Kylj184cjGVC2OSEFzf7mCA1Q/sxJGLVLJhZXuDx/rv9RaYMtWgvDoo1hlWI0pPwbZdz
         svRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713176090; x=1713780890;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ch7nAOdYuE5TTx7zosaZVjyYvnMuu77K7uAtyFJG1J4=;
        b=Qxv007lvSFwqlkfSwLl9z/EYR+2ssEQqTXZP4dlgx6LlKJOO+WAT202+tppMEw68Oo
         Hp7bTTPUOGhD0CvmA+jdcIVwIKYfl4p06wfankG34HaLnccGxxFVTYD2lo5GzDnWrn11
         ZBcPBpOumXdaqqLNNduJqWURPW0HRk7D4299A1CH9/9JLh6djTbwJIztYunr9+gF3/K/
         qVQFibJE0pM4z4T0YTCXG8BeVwfX9TmpzvXFcK8qn5Gc8lakH8beU8YmepRS0gF8oz8d
         NAk2r4MVzu7xnjVdXtgt0HBSxDhvsut4YscqTxUL1Xnk3NX1tnMhs+00MeE7sK9X+Xif
         yWMA==
X-Forwarded-Encrypted: i=1; AJvYcCWZQsosQCZzBNhuYjK6BquCHy9Pch3VZKpSOrre/9Ng9dSfKmhP0jrmY3kxbfYSHTjWw5BdCjST87R3j+gtfBzRtFzR7FpPvE68
X-Gm-Message-State: AOJu0YzITW/LEqDH361zA7ajC0TRQLnrP4use594VHtwaj43oTJgCqHE
	cnY+RDkXgJYLzxHIZUd5Q1z2yhgk1wmyHyjWNJRPi4zjaf6VetpQIhV0j51WTp4=
X-Google-Smtp-Source: AGHT+IHjhZnZ/UpFBsH2kTHC9OVKKMcAQN8weN22/XUZrv3wNhDL0ai2lMmulhKpKNELcofiW9Zl6w==
X-Received: by 2002:a05:600c:1c19:b0:418:6138:6777 with SMTP id j25-20020a05600c1c1900b0041861386777mr1473992wms.31.1713176089744;
        Mon, 15 Apr 2024 03:14:49 -0700 (PDT)
Received: from ?IPV6:2001:a61:1366:6801:d8:8490:cf1a:3274? ([2001:a61:1366:6801:d8:8490:cf1a:3274])
        by smtp.gmail.com with ESMTPSA id h15-20020a05600c314f00b00417ee886977sm13425859wmo.4.2024.04.15.03.14.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Apr 2024 03:14:49 -0700 (PDT)
Message-ID: <c35f98be-23a3-41c3-bee5-f394ce504545@suse.com>
Date: Mon, 15 Apr 2024 12:14:48 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] usb: cdc-wdm: close race between read and workqueue
To: =?UTF-8?Q?Bj=C3=B8rn_Mork?= <bjorn@mork.no>,
 Oliver Neukum <oneukum@suse.com>
Cc: Aleksander Morgado <aleksandermj@chromium.org>,
 linux-usb@vger.kernel.org, gregkh@linuxfoundation.org, linux@roeck-us.net,
 linux-kernel@vger.kernel.org, ejcaruso@chromium.org
References: <385a3519-b45d-48c5-a6fd-a3fdb6bec92f@chromium.org>
 <87mspvi0lk.fsf@miraculix.mork.no>
 <a6ad34d3-9cce-4178-8271-0e09ced2b6f4@suse.com>
 <878r1fht93.fsf@miraculix.mork.no>
Content-Language: en-US
From: Oliver Neukum <oneukum@suse.com>
In-Reply-To: <878r1fht93.fsf@miraculix.mork.no>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 15.04.24 11:26, Bjørn Mork wrote:
> Oliver Neukum <oneukum@suse.com> writes:
>> On 15.04.24 08:47, Bjørn Mork wrote:
>>
>>> urb from service_outstanding_interrupt(). That's why it was added. See
>>> the explanation Robert wrote when introducing it:
>>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/drivers/usb/class/cdc-wdm.c?id=c1da59dad0ebd3f9bd238f3fff82b1f7ffda7829
>>
>> Well, the explanation is correct in that we must read
>> data available. However, if the RESPONDING flag is set
>> and the URB submitted, we are already doing so.
> 
> Sounds reasonable.  Except that the bug proves we didn't.

Why? I am afraid I do not get that part.
  
> If you are right that service_outstanding_interrupt can race againts
> itself (and I don't doubt that), then I guess this could also happen
> between failure to submit the URB and clearing the flag?

Yes, it can. In fact in this case the behavior should not change.
I am afraid we have a misunderstanding. It seems to me that in the
unchanged driver the result of service_outstanding_interrupt()
is undefined.
Please explain.

	Regards
		Oliver



