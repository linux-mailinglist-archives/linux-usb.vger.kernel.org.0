Return-Path: <linux-usb+bounces-14410-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1682C966F4E
	for <lists+linux-usb@lfdr.de>; Sat, 31 Aug 2024 06:29:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C4576284DC5
	for <lists+linux-usb@lfdr.de>; Sat, 31 Aug 2024 04:29:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 77C51139D09;
	Sat, 31 Aug 2024 04:29:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="nq5fc83m"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D7BC225DA
	for <linux-usb@vger.kernel.org>; Sat, 31 Aug 2024 04:29:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725078549; cv=none; b=DMDOR+uglWtquiqmWfmosjW4i+Zonzy9HrlA77Qux4wNo1I8UUUAVpdyDcnBfsqHapuMQrSHTgqClz1KzvI2D4Li2eKnxQ5Ptw/3+XTulSBi6ziT7wNutzcv+2GD6m/nzV1ckAwWqGuoXwhOIKk8dxd9qReF0EWDQbZBXxAhJ/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725078549; c=relaxed/simple;
	bh=hL+Y0xHQYWRctMNqhI6gAgPQLv6uq3WksAgblshRk1s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MTuxUu/fGhnEmPN5DYCILEsWfyKwI1t3IJU1ZFM2pmkCP0ffs0LdniNEPoRQEMkmiF8yvHrfk/gR4Ddhbni3Cv5QF8d/8AGzTOQRjYbg8ezdRTRRr1G9wSqzo3hVOoPzi+H9z1fzm8OHPbqWlwCCDuHi+28uhlyNlCJ6WQOvw00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=pass smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=nq5fc83m; arc=none smtp.client-ip=209.85.160.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=g.harvard.edu
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-456930b9202so5960871cf.2
        for <linux-usb@vger.kernel.org>; Fri, 30 Aug 2024 21:29:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1725078546; x=1725683346; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=HuIMxTOfhib1qCI/oTf6iuk71HBZnVDLppv+diQexqQ=;
        b=nq5fc83msl0FHy0OcwjeOXxEFTVlF/nTnvfwGVqh6RBfqCJdrAbLewJ21TJL56tYID
         CCbpztH1kEatmOsamZr1QNCIDskLT+d93XNRfr7cxjEfHH4HzafWwnp5e+eBV6EdlzX0
         8HAO3biDqOuKECrfwRyAtgwhyDC55D+2fc+hoXzk6VYBy6ld4fz5jOYZZ1XcHy9ea5vw
         D/eT1lr/XRsk+9b4KhPo7CJ9n9IYFzlvHo+ktiGodh2jLHHu4E28RqTye+F5sNUgNKFv
         TwN/5HM6l3lXTDcGeVY5tp/jSI3ZsdiHyiQELxgJzMFS3HT6cpDSnMz2JrxddbR31jyP
         aeNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725078546; x=1725683346;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HuIMxTOfhib1qCI/oTf6iuk71HBZnVDLppv+diQexqQ=;
        b=rtrccthpj+/7GFyXJuxzK4ok4HAjBvh94IhkzLkX36IECqwZGfOBy450MEHiDjoigq
         /9gxeovgQp/tXsOM0E3fXZq9BTHrLXD2cLsdGh5+2PsbeB7A+MdHhpEBn78QefWTvFUp
         gg+DGXsDkSPk0ISbaDO5m5kLe1NuFVhXlbnH1XZevYXVoAQ+Uo26nP5S+4XgsK5HOkpO
         69y8izGo7qxrxVJ07Iu8h/J3iFoxkollyAaIFxUOuCJznz7Ytd1yJcb6MMuR4q0YxEbS
         yF4vbCV6LrjRso1Qee5P4+H1gVbVnUZNdlVK7hqg5x4tChE9jYPcuNVydC+T9AE47RSn
         5lcQ==
X-Forwarded-Encrypted: i=1; AJvYcCWktp2aXVeYumH100OhVMOSjGw+7/8v/3U+ilTywhF9G9aj3wARUs9KnYKcLUf9Iafru2AHenskSgQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwL75EOO5trojfE93BtQZaQY3f7Hn4pQvmdwB9W1xX5c2Y4N/0U
	ykM0vbkDs49kmQ95qeii477AKrSlDUNrntIgu1I/WY/si/LeE6TSK8G0g/mj7A==
X-Google-Smtp-Source: AGHT+IGXesk6oV2YvgevpDh9cjvWyTUj4sPzgRLw7niUJX6VHSZBf+COUguoRgxXG3s0AmKPRUOzFQ==
X-Received: by 2002:a05:6214:5b88:b0:6c1:6c74:9f7d with SMTP id 6a1803df08f44-6c33e64212cmr98523226d6.32.1725078546031;
        Fri, 30 Aug 2024 21:29:06 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:681:fd10::24a8])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6c340bff467sm21340706d6.30.2024.08.30.21.29.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Aug 2024 21:29:05 -0700 (PDT)
Date: Sat, 31 Aug 2024 00:29:02 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Selvarasu Ganesan <selvarasu.g@samsung.com>
Cc: Greg KH <gregkh@linuxfoundation.org>, royluo@google.com,
	paul@crapouillou.net, elder@kernel.org, yuanlinyu@hihonor.com,
	quic_kriskura@quicinc.com, crwulff@gmail.com,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	jh0801.jung@samsung.com, dh10.jung@samsung.com, naushad@samsung.com,
	akash.m5@samsung.com, rc93.raju@samsung.com,
	taehyun.cho@samsung.com, hongpooh.kim@samsung.com,
	eomji.oh@samsung.com, shijie.cai@samsung.com,
	stable <stable@kernel.org>
Subject: Re: [PATCH] usb: gadget: udc: Add null pointer check for udc in
 gadget_match_driver
Message-ID: <fbf87ddf-6d8e-43b7-b9f5-65025395b170@rowland.harvard.edu>
References: <CGME20240828070538epcas5p2ce9b001afd4588139070d01f0fb2ac37@epcas5p2.samsung.com>
 <20240828070507.2047-1-selvarasu.g@samsung.com>
 <2024082801-dissuade-starlight-e5ad@gregkh>
 <4c64791e-a2f0-4878-8025-4ced94da6bc3@rowland.harvard.edu>
 <3c75924e-ed1d-4b1d-8d4e-fb4dfe4f363b@samsung.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3c75924e-ed1d-4b1d-8d4e-fb4dfe4f363b@samsung.com>

On Fri, Aug 30, 2024 at 06:16:12PM +0530, Selvarasu Ganesan wrote:
> Hi Alan,
> 
> Thanks for your comments. I understand your suggestions. We already have 
> a similar reference check with the udc name before calling 
> usb_gadget_register_driver.
> In the drivers/usb/gadget/configfs.c file, I am wondering if there might 
> be an issue with the check of udc_name before 
> usb_gadget_register_driver. This is the only way to allow 
> gadget_register to be called before releasing or unregistering an 
> existing udc. Do you think we need to add an additional check here, 
> referencing the UDC, to prevent gadget_register from being called before 
> the existing UDC is released?

I don't understand what you're saying.  There is no routine named 
"gadget_register".  (And there is no variable named "udc_name" in the 
code below, although there is gi->composite.gadget_driver.udc_name -- 
but that's not a variable, it is a field in a structure.)

> drivers/usb/gadget/configfs.c : gadget_dev_desc_UDC_store()
> ===========================================================
> if (gi->composite.gadget_driver.udc_name) {
>                          ret = -EBUSY;
>                          goto err;
>                  }
> gi->composite.gadget_driver.udc_name = name;

Are you talking about this check and assignment?  Why do you think there 
might be a problem here?

Are you worried that some UDC might be released while this code is 
running?  If that happens, why would it be a problem?

> ret = usb_gadget_register_driver(&gi->composite.gadget_driver);

Alan Stern

