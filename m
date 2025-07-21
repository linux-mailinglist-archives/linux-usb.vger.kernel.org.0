Return-Path: <linux-usb+bounces-25993-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C4FA0B0B9C4
	for <lists+linux-usb@lfdr.de>; Mon, 21 Jul 2025 03:29:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2E3ED3B9C72
	for <lists+linux-usb@lfdr.de>; Mon, 21 Jul 2025 01:29:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9873317A31E;
	Mon, 21 Jul 2025 01:29:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="svI5CWy7"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 957011369B4
	for <linux-usb@vger.kernel.org>; Mon, 21 Jul 2025 01:29:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753061364; cv=none; b=rZ0jk4EbNRMzd0ywDl5i/2TbRGdI+FH6aE1KIxLjrpjL8IBYY3PKCfxRV6hN1+89J67DxEUonEr8Qo6wNqZvkmApNOx2NN58ExMPrfuT6kEKMNruCFNOVoR7GVaPoLh1RjLCQHMETLwySx0/dCwUBGNknRLKQ04qm5XnFJRf+Es=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753061364; c=relaxed/simple;
	bh=qUZPqaVQzdx+KR3dhpj0J+Z89UTpW4E+eqFQDjtcZbw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nyQ3xWMsQrkQRSmzUO1aiI84PBP5p8YFpUqwFsomqCcSWHVxp1WoGzIs4tG5PHcNNFctQ1FazFNRShJfl5w0UqmYKkEtAfb3ty/Sxh38f7diI138YNalrSP+Ao2spwtDvn2H+8zcHoIkydv4cUYqD9dJdhy4BQi2Aq5Gn2POoos=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=svI5CWy7; arc=none smtp.client-ip=209.85.160.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-4ab60e97cf8so52224491cf.0
        for <linux-usb@vger.kernel.org>; Sun, 20 Jul 2025 18:29:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1753061361; x=1753666161; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=rhntmyEypSEejVoCJCB83K3S3THmRRLjvAqFcWpLdTg=;
        b=svI5CWy75M3nxeqoRbw8tNSf5j4TxDfSdxIQKTh+PElgFupxwN+SJ/SkJvBMMBq3wX
         tagCWFOjZ9EbRUFexXD+05Y8jYDF8HcUZLfDayPpkkYfGO63gehIKv+TM/RJL/9phOO1
         hyp0/TSOCza0UkUMM33BoM9XufvW4O9UK2DtVn2QBW3FgpU93+kl4n4VJlCwhyyxooi7
         jXCAdyAZkTTla2aQ6IpqwMKepMAsapscvSy8rZtIAJowfIR/mdLofuHMPNbuKAt+0hcX
         q3xd5wOXGygyZk14Su2yHhNLbYV7QguvsvICXhIhO1OS7MK/52l3Hkbjqfmz+U7nW45Q
         yUXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753061361; x=1753666161;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rhntmyEypSEejVoCJCB83K3S3THmRRLjvAqFcWpLdTg=;
        b=GnDhXOV1w5AqEMMlYEBHtSEPKalTtfHmkZuBg1qq7L0fC6QHhKiKwh6WQPuR/1Kmux
         /Rs8VsYaQFwmMQ6YSxMrLmlWjw5qPu1y4yRHruD5f4wIKwjeSkRkKfUgiWaULqE4DPlP
         CJ8Y5TI4oQB6p/1Rqx+iYoxGXDHCafjJe/uR0MhOy1VvDZuikNS2earwZFLD6HO2lJRo
         plV6TngzSNoZ32WlNXWvUWq2DIf7m54DeBOvHJenbVwY30mtp9MRsl4pCOHFb6mjjXIQ
         JtEApLB4euoqHLC55Bsu4vSmIbaPdfQJnixZ/yBwSmsiewqUnGXpqzerpgZ94g1r47Da
         cjaw==
X-Forwarded-Encrypted: i=1; AJvYcCX7dY3X4/OCIS2rGrvKRNYhOmZ8tKPTYBDLkiirMsOqFuwMv9AHApotlTRlUjukvJc/mOiZlcsOtio=@vger.kernel.org
X-Gm-Message-State: AOJu0YxuNjXaO24yZAwNyjwND4GtQQyhtUuCQxOmIqIIPo9B58Z/0yYq
	oERw3p6fPHZj15rzA4qEHt4OhZpvsdBd+COEx0wT6CZ3aBtFIaC6BE6jCPTLXQdqCw==
X-Gm-Gg: ASbGncsMAqXZQnwDl7w0YMr2ybNFT2O/lZ7d6g3tKmVeNc2H28IJPTf9Z95wc0UJXXT
	Xr+Dpxy7AfmMfNxDeTm2lv/1kleX3Oq59wRKXWDRb2TfCvFT/lirUCCKcVOPcZEaCBfjJYjaNuB
	/eqc8A2ky599TgQxcfVcIJ9YQcC7qudgAc9ZXucAgZNtLzmYTLShduEXZqeOvJ7TNBkhQdUDA2+
	a2LgNIv1q1R/wahw87c+bQTpJEXUCFl27dH6Uuub5Af+5CKg1VvBtnLZ/lZi3v5wZ2VUhO5BqLn
	pdclzsWXCiU5lQnQxWR0xHkVwFZPbCyLbpCsvRoD13haRKK2bOcv+hW0j5EDQNmUgAcQRbPzyVc
	xyM74NakeL3IyizE+4Yiieos=
X-Google-Smtp-Source: AGHT+IGvZXN48xypC7e8hnBaSBqC9wAa/B1Fi8eCElwg2pmL3DV1fODaHlgST8LHhtda82WAIIis8g==
X-Received: by 2002:a05:622a:1bab:b0:4ab:85a5:bf05 with SMTP id d75a77b69052e-4ab93dd693bmr259861401cf.45.1753061361320;
        Sun, 20 Jul 2025 18:29:21 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:681:fd10::401d])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4abb497fe88sm36655191cf.5.2025.07.20.18.29.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Jul 2025 18:29:20 -0700 (PDT)
Date: Sun, 20 Jul 2025 21:29:18 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Arnaud Lecomte <contact@arnaud-lcm.com>
Cc: gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org, viro@zeniv.linux.org.uk,
	snovitoll@gmail.com,
	syzbot+86b6d7c8bcc66747c505@syzkaller.appspotmail.com,
	syzkaller-bugs@googlegroups.com
Subject: Re: [PATCH] usb: mon: Fix slab-out-of-bounds in mon_bin_event due to
 unsafe URB transfer_buffer access
Message-ID: <8bbc84ee-44c9-4a85-b5bf-3980b3c81e5c@rowland.harvard.edu>
References: <20250720200057.19720-1-contact@arnaud-lcm.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250720200057.19720-1-contact@arnaud-lcm.com>

On Sun, Jul 20, 2025 at 09:00:57PM +0100, Arnaud Lecomte wrote:
> The syzkaller fuzzer uncovered a kernel slab-out-of-bounds
>  write in the USB monitoring subsystem (mon_bin) when handling
>  a malformed URB (USB Request Block) with the following properties:
>  - transfer_buffer_length = 0xffff
>  - actual_length = 0x0 (no data transferred)
>  - number_of_packets = 0x0 (non-isochronous transfer)

This kind of problem is fixed not by changing the way mon_bin reacts to 
malformed URBs, but rather by correcting the code that creates the URBs 
in the first place so that they won't be malformed.

> When reaching the mon_copy_to_buff function,
>  we will try to copy into the mon rp bin with the following parameters:
> off=0xcc0, from=0xffff8880246df5e1 "", length=0xf000
> 
> At the first iteration, the step_len is 0x340 and it is during the mem_cpy
> that the slab-out-of-bounds happens.
> As step_len < transfer_buffer_length, we can deduce that it is related
>  to an issue with the transfer_buffer being invalid.
> The patch proposes a safe access to the kernel
>  kernel buffer urb->transfer_buffer with `copy_from_kernel_nofault`.
> 
> Reported-by: syzbot+86b6d7c8bcc66747c505@syzkaller.appspotmail.com
> Fixes: 6f23ee1fefdc1 ("USB: add binary API to usbmon")
> Closes: https://syzkaller.appspot.com/bug?extid=86b6d7c8bcc66747c505
> Tested-by: syzbot+86b6d7c8bcc66747c505@syzkaller.appspotmail.com
> Signed-off-by: Arnaud Lecomte <contact@arnaud-lcm.com>
> ---

This is unnecessary.  The underlying cause of the problem was fixed by 
commit 0d0777ccaa2d ("HID: core: ensure __hid_request reserves the 
report ID as the first byte") in the HID tree.

Alan Stern

