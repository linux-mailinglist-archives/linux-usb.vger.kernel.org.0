Return-Path: <linux-usb+bounces-21945-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 38407A6A40D
	for <lists+linux-usb@lfdr.de>; Thu, 20 Mar 2025 11:48:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BE6093BE265
	for <lists+linux-usb@lfdr.de>; Thu, 20 Mar 2025 10:47:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8779B2248B3;
	Thu, 20 Mar 2025 10:47:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="ZUs0vL1Y"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 092492144BB
	for <linux-usb@vger.kernel.org>; Thu, 20 Mar 2025 10:47:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742467674; cv=none; b=YC0bjslrK2zVuYwVO2MzP6E8AOQAW5C8+0LqRAtTaLx3BNKW0zc5a6/+zaAEb1hBBrTyzW/75mkdVN/uL7A/4OOrgWGE8Hh5/PWrpNJ4YiuwQaMkN5VMGPw34XhMgoeS0pFtNU8MobPGL7mQDC+WTrpGtz1ldXCFsLTNeNNal+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742467674; c=relaxed/simple;
	bh=b/4sQwud0OrkziRdWZLgXgI9I/atRHIuDBOY19FW2ys=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Y6sMcknrhg4tOH1NxMJlHd4Z1EOGB3cZY8i2b460d1Glrf/3ol56VfXY6OrM5ZIvlG/+GVfe3lV5hg/YSGXEqbHGezy6rQ0ZxVv+QRkZoZstscxJ/VPy1HaLf3U7SYlToaKlC1DVu0/c2c4Cw5ij4WLCBDQQGVBpF1cV13woJCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=ZUs0vL1Y; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-43d0359b1fcso3856995e9.0
        for <linux-usb@vger.kernel.org>; Thu, 20 Mar 2025 03:47:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1742467670; x=1743072470; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GvKwVlZTxe8IGUc6X4Pju/hWNXugAe5j8w6m1ssCyeA=;
        b=ZUs0vL1YaQeCj/gdNEPS0+/klBiip0ARoTtooUEhSE9Tq/SxqPgk2krkdrO6RPu762
         boROB0Wd6YnxLZ5NXhz7oq4koJA25laL85YHPUyfhC6hYFV8hqUyVY3faPye77OMwvly
         XJ0q5FCz9gAXAmkH0U1W0+pwZ307Q42Ym4qptxBP+loObSCV+dE98fNDZKqqAajhWdxX
         ljgiYyE/kWeZUEAC34i8B43Jec/rhzq+0SLAuY1pQvCnil3OIl/9si9yHRDbhtZrjF++
         pGPrcumGJbWjfa8caaLSj8flHNsXuyj1aVwsnuKoD2lUxMa7atb3fTeWKR080WttFlWp
         0i7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742467670; x=1743072470;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GvKwVlZTxe8IGUc6X4Pju/hWNXugAe5j8w6m1ssCyeA=;
        b=DE0LadzGl8q1KXCvbJOlgEPbJrMx5iWwhcmsNwCHjN+tREjHu9CgXbCL/TTUbaVAWE
         VDi2iNz+PLXmDJDzcIes1RS45jt+WIFMqlAc5zP+VoU3JhqhAfZWoC9RnoCVA1iaY5EJ
         eWc2VZTMjdaF73zPg0ca/PUzKvbvdWRKWNlNtTXPpKJsi/ooARkOa5rvtIYHjcG1g+BD
         hdjTyYu8hv36OXIP2uBefliz6/e+K7Y4mNuhGskx2LELGJjfU6dXf4ef4TLlG8XU92tm
         TyKWeBnks6rfL+x7hM9HsFu1g8CTYuCkBEqTbb884lRi+YLvx9LnLeQvBJ6/e5VD/1Je
         D7Sg==
X-Forwarded-Encrypted: i=1; AJvYcCWXHQAez6gaXlSp+b76gcwjgVaqIReWabs0AIPkme7CIbEVmuz3HpjOwEnQi7tYkee5NBzVAbfmj7A=@vger.kernel.org
X-Gm-Message-State: AOJu0YxqEbNEXzRsfIFjq09AA+an76y+Zya8/tmw/DU6QWphnszArfoG
	P6jPoP4tLjdvWmjXvNIkLkFPeWoML1wJYnhcOW67P+oje2RJFxuPUAav68ozEmxzp1vcVl/YuOy
	9
X-Gm-Gg: ASbGncubKicnEABw4sIbzZNrUKqP5X7g5vlWtk7mga3oxqJv4dDQ11763jKcMhG86JW
	nvuefp61Rbq0uCIzn3SsdeHN2Fqm2osKchh1su3huCYhZ10BFVeJRJIcW+V/CQabX7StVMYfIi3
	UqIWE9+sx/SCNOXAQyM8qZlyNzxZsKUNdDIlbt1KRyjCj+AOsvzy+nQTBJVixTVkM0LXl9BD+3r
	v1saMAHSAHYEOJBmi+brNBMq0YUf5o+6Hz3sRyzYDeyyzxx6m/JRlanSV8EMIqgt7owM3+JepL/
	MLTWFfqlaabNbSOAx2ItVyyncjQDKZte6MWgpWeucX1m+NGmCMcTNlVTy2lNZrwznC/zzheis6O
	+Oyh8ELxlbfU=
X-Google-Smtp-Source: AGHT+IFAgOi0iQwJmjyYHeaDM3BwcL4nsSqokT3gF+YbfSSaR2H2zS1j9LaQsMUw2SXodksXCseK5Q==
X-Received: by 2002:a05:600c:4fd1:b0:439:9434:4f3b with SMTP id 5b1f17b1804b1-43d49179f3bmr26245975e9.8.1742467670238;
        Thu, 20 Mar 2025 03:47:50 -0700 (PDT)
Received: from ?IPV6:2001:a61:1348:8f01:d3d3:1b29:8986:519c? ([2001:a61:1348:8f01:d3d3:1b29:8986:519c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d43fdeb6esm44590645e9.31.2025.03.20.03.47.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Mar 2025 03:47:50 -0700 (PDT)
Message-ID: <60516f6b-fb96-4fe7-8767-ebb63758d099@suse.com>
Date: Thu, 20 Mar 2025 11:47:49 +0100
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: use-after-free in drivers/net/usb/hso.c hso_serial_open()
To: Alan Stern <stern@rowland.harvard.edu>,
 Greg KH <gregkh@linuxfoundation.org>
Cc: rtm@csail.mit.edu, linux-usb@vger.kernel.org
References: <33193.1742406937@30-11-165.wireless.csail.mit.edu>
 <2025031933-clavicle-sulfide-878e@gregkh>
 <e7f0dc08-a5bd-4838-a229-a9fc1afd4f09@rowland.harvard.edu>
Content-Language: en-US
From: Oliver Neukum <oneukum@suse.com>
In-Reply-To: <e7f0dc08-a5bd-4838-a229-a9fc1afd4f09@rowland.harvard.edu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 20.03.25 02:41, Alan Stern wrote:

> The USB 2.0 spec doesn't say that wMaxPacketSize must be nonzero for
> interrupt endpoints.  It specifies a maximum allowed value for this
> field but not a minimum.  In theory, transfers limited to length 0 can
> still be used to convey Boolean information (did the transfer succeed or
> fail?), although I don't think any existing devices do this.

Yes. Though it does not really matter. The submission of the interrupt
URB can fail for other reasons, too.

> In any case, this isn't directly related to the bug reported here, which
> appears to be a simple logic error in the hso driver: not cleaning up
> completely in one of the error paths.

I am afraid, we are facing the opposite issue here. A failure to open
a device should report an error to user space, but have no other
consequences.

Instead the HSO driver looks to be overzealous in cleaning up after
a failure to open a device.
It seems to me that the commit 29bd3bc1194c
("hso: fix crash when device disappears while serial port is open")
is ultimately the culprit by doing an unbalance kref_put() in the cleanup method.

Dear bug reporter, could you try reverting that patch for confirmation?

	Regards
		Oliver



