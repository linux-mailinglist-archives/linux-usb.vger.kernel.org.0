Return-Path: <linux-usb+bounces-21978-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 805CFA6AA1D
	for <lists+linux-usb@lfdr.de>; Thu, 20 Mar 2025 16:42:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F1006188CB3D
	for <lists+linux-usb@lfdr.de>; Thu, 20 Mar 2025 15:42:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7502B1EB19F;
	Thu, 20 Mar 2025 15:42:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="fOC0lpNT"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCA2C1E98F9
	for <linux-usb@vger.kernel.org>; Thu, 20 Mar 2025 15:42:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742485359; cv=none; b=RbREZIA7tvnoclo57bvuk7pjUoPU7LX6BjEzO8SkEdb+l/LEdoasxRuBA8yZOS+k0Rid+4Ekctc3zxbrstt/Rrvp2wQ+n7E+SW+UZmCzMqMHSmx4Q5nGZOwyRvdtw44QmHJe+lFDWvNfb/E648DxK+bftAIYoUUibN5J3gA0UMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742485359; c=relaxed/simple;
	bh=J32prBUm6oBZ88b3RAURwzKHHWR9F+LoXAHqBCRBzBw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jS7VzNJ1F5ItJCQSieBldFjjd67KEqm0rfWQjILIKsAQVXYwMzJrD6j9vyMOCyJ6vlv1qYG0WKqcZqjkc2uH9vQP01kyoQfxJrXFlHvHHZoTG5pMd2Cg6CTmOIveIvLdMkkhUzcgRdBEIn82ZkRmrt5zEpPyaLVB+iVUJcd4i7I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=fOC0lpNT; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-43d0359b1fcso6726045e9.0
        for <linux-usb@vger.kernel.org>; Thu, 20 Mar 2025 08:42:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1742485355; x=1743090155; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AzdNEu6y+XONtMGIUQtcG5XKDkgKB41TTl7oxU5xJJg=;
        b=fOC0lpNTZrUXHleugTQhIkfVp5+yJzbR7CcCZBPVLAZAgt4QRGqRKBLKt3zuHpKBeF
         NkAjWYKde5Q47uZ90Qf0srZ3T1wr/jdIPr7PY4mYJ+F0IQv4Wf9Mu2oDj+h38Ytni8aw
         1bmbhSZDkLT5ZHrYXM8EE+jsMpHH9slrHpo/Pd1KsGJc916okrCF8QvGkRKALkuGex4L
         M7T7C3SGVNINQzRDfFM4Yvkqu0EX0s4TAB6Ui0724vUA4Qhj0Hm70az+vFbHE4Hbs1TR
         148wd/MKf5ygXUD+9zfbgDNQpcGssEhlpsVPwT91N/AJGK65nqI0RB4yUSptXQgrpyEy
         8cjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742485355; x=1743090155;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AzdNEu6y+XONtMGIUQtcG5XKDkgKB41TTl7oxU5xJJg=;
        b=HwRQJbNhScT1FzylAtj0Bz/go7iyobJPYhsZKiJcSupXbnse9nyCGI4E7KKcC2oYXR
         34pl3lMn5MHH/WtpeJmo+8+iT3h7EIa2MH5oyOt4Tw2/c6tF9ZgemqHDI8akMdt9ZorV
         +rceR42YIe8zo/L9EcuvPRl27nupoun5E6u/RL7WZ1wtDHb41cwqo+DWi4FaPWicg77R
         3JcAi1AGZ5TAcBOhP94rtbG6Iav8r79IxWB5bwK83BGjJwFJvqmQoMZaE+L77/UNyRhi
         hJbeoWXYAUnM+FQJUrYh/ktNrtNXF70J3BQWmxyWqG5PjWn47vIK7vMrbJqtBV0tEs9x
         dbww==
X-Forwarded-Encrypted: i=1; AJvYcCVrx+aovmIeMxJIPR9wsc8FSjNxQxG5CFLVRhgS4IRXqA2ypzWDbBc3mZQy1kMI3CWKKrh9ST5NfMY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1pz8Otx2NyMDLA6WL8jAgK+ux5T8oypuETUUF9yBAP7QqUI4W
	cduvklRAJnudEVu28IMVTSvOGhfyqeV95R7D9SRmCv9L0xD4Zuz5jUsfc1WZCPQ=
X-Gm-Gg: ASbGnct4KdgRzkNdjTUpYTUYBmRn0ufACrhfCInBG1a6UHn1mCvN5Ydo1PrUxM1b4+7
	k16LdQ8e9tBh6ikUxoHx4jOF0JhUfa1dK5a6UAhkw0yIn9tm/bRxiahehUwaLXJT+wi0oXPARen
	R4roqBd2DRft347miejDn4zJkqMUc6y3OOns5z+K5EtIlICF9MMG43ifK03W/vhk+DkKrIYeDHO
	jPN5rC4N8G+YKlUeDo0Hbgfd24VrV7cFkyXwwF37q8S0EorpnvRgRP7EAe+0IHrfsj+ZrKS/YgN
	6Mm/P9qKrIt1+V6D2wST/pd/DfOAokVCKKm9ENvwCzVSNU9QyjVtbCu4Gt7ZipcFoMm/rm4dOg7
	A1ZSLPZ9Rj9SLUSxw5087ZA==
X-Google-Smtp-Source: AGHT+IFQEufoOY/ocwSQk/juDoom1Vr2/cRMpKfbGJG8KRcBZIE/XUKwxnHaV2M2+UGrtqFY48z25w==
X-Received: by 2002:a05:600c:1f92:b0:43b:c857:e9d7 with SMTP id 5b1f17b1804b1-43d502e338emr69485e9.5.1742485354965;
        Thu, 20 Mar 2025 08:42:34 -0700 (PDT)
Received: from ?IPV6:2001:a61:1348:8f01:d3d3:1b29:8986:519c? ([2001:a61:1348:8f01:d3d3:1b29:8986:519c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d4fdbd348sm1141335e9.39.2025.03.20.08.42.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Mar 2025 08:42:34 -0700 (PDT)
Message-ID: <7be81186-2d18-4d0e-8a93-d2dda20b02b2@suse.com>
Date: Thu, 20 Mar 2025 16:42:33 +0100
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: WARNING in cm109_urb_irq_callback/usb_submit_urb
To: Alan Stern <stern@rowland.harvard.edu>, Oliver Neukum <oneukum@suse.com>
Cc: =?UTF-8?B?55m954OB5YaJ?= <baishuoran@hrbeu.edu.cn>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Kun Hu <huk23@m.fudan.edu.cn>,
 Jiaji Qin <jjtan24@m.fudan.edu.cn>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-input@vger.kernel.org,
 syzkaller@googlegroups.com
References: <559eddf1.5c68.195b1d950ef.Coremail.baishuoran@hrbeu.edu.cn>
 <62d91b68-2137-4a3a-a78a-c765402edd35@suse.com>
 <a3f66f2e-a99e-47f2-a3ef-742b6903cc5d@rowland.harvard.edu>
Content-Language: en-US
From: Oliver Neukum <oneukum@suse.com>
In-Reply-To: <a3f66f2e-a99e-47f2-a3ef-742b6903cc5d@rowland.harvard.edu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 20.03.25 15:25, Alan Stern wrote:

> This test must itself be subject to the same race, right?  There needs
> to be some kind of synchronization between the two tasks (i.e., a mutex,
> spinlock, or something similar).

Hi,

there is:

static void cm109_stop_traffic(struct cm109_dev *dev)
{
         dev->shutdown = 1;
         /*
          * Make sure other CPUs see this
          */
         smp_wmb();
                 
         usb_kill_urb(dev->urb_ctl);
         usb_kill_urb(dev->urb_irq);
                 
         cm109_toggle_buzzer_sync(dev, 0);
                 
         dev->shutdown = 0;
         smp_wmb();
}

This driver has a tough job as the two completion
handlers submitted each other's as well as their own
URBs based on the data they get.
That scheme is rather complex, but as far as I can tell correct,
but you need to test that flag everywhere.

	Regards
		Oliver
           

