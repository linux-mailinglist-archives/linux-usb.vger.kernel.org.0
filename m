Return-Path: <linux-usb+bounces-11174-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AD014904D0E
	for <lists+linux-usb@lfdr.de>; Wed, 12 Jun 2024 09:46:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 50E61281C75
	for <lists+linux-usb@lfdr.de>; Wed, 12 Jun 2024 07:46:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B502816C69E;
	Wed, 12 Jun 2024 07:44:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="YcCAgEI4"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BE9D16C448
	for <linux-usb@vger.kernel.org>; Wed, 12 Jun 2024 07:43:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718178241; cv=none; b=TvhBIsUGAh9g+uVAnl/r1h2tgi2AtPkTDRtU2zTe78rmyLGVqhx8Y5dIl1cvFEUt4uDAkjJ5vGybjp8eWSIW/WEuGfKXdjRu+2wE7lpihJyueTnqbRRAU4qcEUJ8S6MtWPObtA48Rim3HvzV7za6TlOdSRnz4TGKl09Y3/v+nNM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718178241; c=relaxed/simple;
	bh=Zp4Fclwy9Ip9T6QzhOSObLdDOwV/2k/pJYqHvtg6csE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ek/1zO1X3MSk9c2WUaMPi2i1G2k7RMJrqQdR0bk+/gutHY+wPJxjHmnIh/S07XPyhiFs5iPwjfbobyVMcTCWdd5rjL0hsvwC4DOgGvbfEvCKfoVzJDRpl+tWxx5vTMZSibmB5Q+d7nM6bPIW7BYUUbvxkp6cqer9imVRo8ENISA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=YcCAgEI4; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-a6265d3ba8fso662570266b.0
        for <linux-usb@vger.kernel.org>; Wed, 12 Jun 2024 00:43:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1718178236; x=1718783036; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MQGnus83dj6CCaRJokgRnGxqGwR1EkDq+zwBP9OjyZk=;
        b=YcCAgEI4G5bl4LGhkqnrbFnTEpPcbG1frHjOnqDQPvgUoJ1W2yRllvWZIF8xghAzqI
         tJi6Qb3p5PG7bAl2duS3t1lqKxkUYkE5DxS6wvYREgYo3fxGVYT0yVWm0BBe3d+R4qDN
         0UsXWJhNuM89OFXBWfQDVaCOL0WLh5o6D8dvEFHaLGlOQDOadUFGJDQHenNfSZ3WYTDm
         hQx+cjDI5qs92x/dpiVaDen7481nsLE5qHIur36RdXYw9hB2sBmRph5OfMAAUUWhCKQo
         Wo0Iy6+NsMYy3VTODLBLmVzEIg408LUTe4uQ5dCUAZ7xae33GlYqIs37GUyhQg1EotmO
         xNog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718178236; x=1718783036;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MQGnus83dj6CCaRJokgRnGxqGwR1EkDq+zwBP9OjyZk=;
        b=GVqfB2cbifT5quc1EtoOR4WSF5y2wI37tjSYzIJfhlumzlqxs752UwT6ymsnOflVvf
         b/IQ2fL272pmlXRteFOXjj7kutitXpSEIW9oV++kqUygfdUvM5qmgnMRHaMK5EZm7TYj
         QgEYqhWvsAtc6WdJff6P5WsLi4UMHEVTxLE2DSfFaeMex3rjVMLUf43UBWvc9Ihgvwru
         +0KpKNfKz/gDrXnXwF+Il00QidA9EqbstZypnay5vQD7vTcnfj7/d/pGC2CSvOvjw8VB
         +IEI+S4mihg+jT7kWaz83FqwewiSDdBbWrsfhaO8kSkDQUh86xpOm6pjFc6WHk1QASmk
         lLig==
X-Gm-Message-State: AOJu0YzmmWqjBQ6CC0bTbdM/OXmvLqn4QPhFTjMUMMn//1c1gS32IhEG
	p1aNhpNC/eC5QWU+Pv4VaIYjBluqw7nAYHaSMkm7p+/74PHIFniGna27/51fzvA=
X-Google-Smtp-Source: AGHT+IHdDe951tApCgeN9PY7H4UIV+YbR3Sr2UYWTmgobwqV6t82cAG3IhrelTq/lxpnZJtoCh7/ew==
X-Received: by 2002:a17:906:240c:b0:a6f:f7c:5c7a with SMTP id a640c23a62f3a-a6f48009fcamr52957366b.67.1718178236238;
        Wed, 12 Jun 2024 00:43:56 -0700 (PDT)
Received: from ?IPV6:2001:a61:138e:201:27e2:fe9:90b9:6b9a? ([2001:a61:138e:201:27e2:fe9:90b9:6b9a])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a6f1b2f674dsm399315366b.204.2024.06.12.00.43.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Jun 2024 00:43:56 -0700 (PDT)
Message-ID: <b3bcf3a1-c0ee-4550-867d-b92c66f564b6@suse.com>
Date: Wed, 12 Jun 2024 09:43:55 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: USB Denial Of Service
To: Alan Stern <stern@rowland.harvard.edu>, Oliver Neukum <oneukum@suse.com>,
 Greg KH <gregkh@linuxfoundation.org>
Cc: USB mailing list <linux-usb@vger.kernel.org>
References: <40dfa45b-5f21-4eef-a8c1-51a2f320e267@rowland.harvard.edu>
 <a09c0dfc-1cdc-445b-a524-305c3f5f3d79@rowland.harvard.edu>
Content-Language: en-US
From: Oliver Neukum <oneukum@suse.com>
In-Reply-To: <a09c0dfc-1cdc-445b-a524-305c3f5f3d79@rowland.harvard.edu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11.06.24 21:09, Alan Stern wrote:

> Alternatively, the driver could avoid resubmitting the URB when one of
> those errors occurs.  This is perhaps less appropriate, because these
> kinds of errors can be transient (although that is normally rare).

Optimally we'd wait a small delay and resubmit after that for a limited
number of attempts. In fact optimally we'd add helpers to do so for
all drivers to use.

However, to make this wor with suspend, reset and disconnect would
take work. Is a corner case worth that?

> Index: usb-devel/drivers/usb/class/cdc-wdm.c
> ===================================================================
> --- usb-devel.orig/drivers/usb/class/cdc-wdm.c
> +++ usb-devel/drivers/usb/class/cdc-wdm.c
> @@ -266,14 +266,14 @@ static void wdm_int_callback(struct urb
>   			dev_err(&desc->intf->dev, "Stall on int endpoint\n");
>   			goto sw; /* halt is cleared in work */
>   		default:
> -			dev_err(&desc->intf->dev,
> +			dev_dbg(&desc->intf->dev,

Good idea.

>   				"nonzero urb status received: %d\n", status);
>   			break;
>   		}
>   	}
>   
>   	if (urb->actual_length < sizeof(struct usb_cdc_notification)) {
> -		dev_err(&desc->intf->dev, "wdm_int_callback - %d bytes\n",
> +		dev_dbg(&desc->intf->dev, "wdm_int_callback - %d bytes\n",

Not so good idea. If that happens it points to either a bug in the firmware
or a malicious device. Such things need to be logged.

	Regards
		Oliver


