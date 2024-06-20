Return-Path: <linux-usb+bounces-11482-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 83AD5910586
	for <lists+linux-usb@lfdr.de>; Thu, 20 Jun 2024 15:12:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3AC5E1F21D8A
	for <lists+linux-usb@lfdr.de>; Thu, 20 Jun 2024 13:12:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 50B561ACE7D;
	Thu, 20 Jun 2024 13:11:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="GIf9PEmC"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF1901AAE20
	for <linux-usb@vger.kernel.org>; Thu, 20 Jun 2024 13:11:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718889092; cv=none; b=bxg7pzj7t3zn4DM6hKKe7vy8IynDCYBQ3l7fxvie1NJOqpZvdgWORXuh1G6jn0neCXqP+xbxrNWm1HPczPuobfwNkGc0YmBaaLj5MwsWkAT3mMPcgKb8CtJxklMgKLt5cEvZ4GUMZ7C8ztaGdyPuon4xT5UXQyo/fja3eMAdzbE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718889092; c=relaxed/simple;
	bh=hd3Q8yJrBU83/vq4Tdq0vSLuK1/a+/gzqmHuqsPSEvA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LU6HuMtGuRCiEPkOcwz/Ybivb3ZnpFf4HJnITd/ay2Sq+PisqhFD8tVrepolRhY7zV5OGp50LfDoHz0Ht/Z7+xzaEi0RoiOSAvVZ3/uNLL5oki9Smst+L6QFl9Q/QHOxazoA10tZdo74tQoVkHVJ6xA/nQX0aDBmw/Mxj9cWz2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=GIf9PEmC; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-35f2c9e23d3so1306744f8f.0
        for <linux-usb@vger.kernel.org>; Thu, 20 Jun 2024 06:11:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1718889089; x=1719493889; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oGPcdTkNws/Ir1JG6ZVqWzEQBhKRGmn8Rvpu4p2bq7E=;
        b=GIf9PEmCuTthPdvjUFYQFjAHCwvBv5ZDG618RCpdLqTTea6nB1+5SJVzIDaPnH0sJn
         6Ffx2DcMSbcznvR/tWVmXsRUllRaf03/yPtvze0iyy3LmIAhlK1Bf5JLQ5szMoffZsRd
         QWzcdugKUm1uwpJR7QFjxnL7PGX636xxAxRgtG40NcX8DNEL5WrKu/ePAgQYDc+1qbvL
         gKS67IQLmhiduFNtnaYnugBD3VLGLOGLVvKuEH23n34kXqG5Wkh8JbDnypG8r8sIQM1t
         uyl/72wnDM1vH18X58q7x+VWYTDIsjwwuduym+L+8pcxhUup6tDBOO8XiT+lBdaxg4LX
         QiGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718889089; x=1719493889;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oGPcdTkNws/Ir1JG6ZVqWzEQBhKRGmn8Rvpu4p2bq7E=;
        b=TMtOP8oOt2qCtGOo3JEzhnpIG5NzSDpKkilLVaJwHyq+9ZVbPllXIyGfVTfbHQt9QA
         3FK0IOJlkaAsP/sQEKF48Tt9DQlRGAdCi6jQ4/tiLkB1SXk7J05C5FjkN7++FfgAFy0s
         PFxIvz2GEhRrteGL1BAYgTAxWIGnP59hkXmTu6Pfnq40xJZfRAHXTk5/CGiG5/y7Kt5T
         v2pDUYZtl9topGTkEXkkzmdhcKn4E9JFOnjyoknuCBqAu0EzQZ5e1CYeZIq6qXLiJes/
         j2QIA0ryN81lhLa/2RlAxIpJ6Vc8odhzoreAgEzEpzm/XQ/grBXOZ8DI86kqPshDKbF9
         39yg==
X-Forwarded-Encrypted: i=1; AJvYcCVwnu1YVWIS3de4ffLkq54FF9XCplNs7l8Q+AKxbYoprfcKSopsbyDh61uX4flfkxSx1ytUOJMzTF9cqBcqJP5q7FFJbDEILhy0
X-Gm-Message-State: AOJu0YwA3QOMDqhjAbvh/OO7MkoMjhA6HCvEaY9gXonBMp7UL10GkWum
	sA0r9kdlAW7ntxiLc45DDzVNB6DkyWdayueCpOigGdfXHhZZUxObrF5i7//+qs3ksxRH+TyUcnJ
	P
X-Google-Smtp-Source: AGHT+IE+SaHGz6P8E0eXuWhe11tMhAz/CEI8QJK+AP6jyh8H+aYeB/NqZ82bP9jvyuqJQ7FTmFLt9Q==
X-Received: by 2002:a5d:64c7:0:b0:364:4321:271a with SMTP id ffacd0b85a97d-36443212c16mr3981802f8f.25.1718889088845;
        Thu, 20 Jun 2024 06:11:28 -0700 (PDT)
Received: from ?IPV6:2001:a61:138e:201:27e2:fe9:90b9:6b9a? ([2001:a61:138e:201:27e2:fe9:90b9:6b9a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-362fbbff809sm5526546f8f.73.2024.06.20.06.11.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Jun 2024 06:11:28 -0700 (PDT)
Message-ID: <a772eccd-f5e3-4281-9162-b81b5f8124fa@suse.com>
Date: Thu, 20 Jun 2024 15:11:27 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] usb: gadget: printer: fix races against disable
To: Greg KH <gregkh@linuxfoundation.org>, Oliver Neukum <oneukum@suse.com>
Cc: qiang.zhang@windriver.com, ivan.orlov0322@gmail.com,
 christophe.jaillet@wanadoo.fr, linux-usb@vger.kernel.org
References: <20240620114039.5767-1-oneukum@suse.com>
 <2024062039-twerp-magnify-2469@gregkh>
Content-Language: en-US
From: Oliver Neukum <oneukum@suse.com>
In-Reply-To: <2024062039-twerp-magnify-2469@gregkh>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 20.06.24 14:28, Greg KH wrote:

> What?  Why is MITRE assigning CVEs for the kernel now?  Who asked for
> this and who assigned this?  Do I need to go poke someone with a big
> stick?

I don't know about that. I just get the bug reports and this one
said that the issue is a CVE.

	Regards
		Oliver


