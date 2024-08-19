Return-Path: <linux-usb+bounces-13662-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 427CC9571D2
	for <lists+linux-usb@lfdr.de>; Mon, 19 Aug 2024 19:15:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id ECB141F22EEA
	for <lists+linux-usb@lfdr.de>; Mon, 19 Aug 2024 17:15:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD1FB189908;
	Mon, 19 Aug 2024 17:14:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="qKeMhBDu"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81F63185E6A
	for <linux-usb@vger.kernel.org>; Mon, 19 Aug 2024 17:14:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724087664; cv=none; b=PoDKHnqOjS0bVQYdBztgYowqJMJtJu+Lznelu10odNH8EcEldJy4Cn4cu/C4KtNaqnCJwFC4/jyk4WENaXT7wJCNoUsQUpGmcrM0aN3VC8/6W8nhCCcL5u6mZ5tB5fkohsUyVY3n4WNVTscSH4/jpz6UHHUizRdVu/P/AV1aPCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724087664; c=relaxed/simple;
	bh=nh+gRWNzdRMKKXsE3Ts0ZFKhTFCE4L9POYyfgoiVfWg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=m0/NQlB5fmsMZLd5b+8XnzEG2CFMdf7aTe1Hkd/aRPrOB+/5Snj+dpQd6qcgFGgvQ1jgrUTiUKFUHacB29mUzqDjpDQ3eBNrhzvQPUU30IY1bmFLBKHkdFN/16CGiKmwKybhI+zGUKYLJCYxuYk3ymFQazhuF9Qy16+1Fob04zc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=pass smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=qKeMhBDu; arc=none smtp.client-ip=209.85.222.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=g.harvard.edu
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-7a1e2ac1ee5so334134085a.2
        for <linux-usb@vger.kernel.org>; Mon, 19 Aug 2024 10:14:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1724087661; x=1724692461; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/GihWfFT2JQRJVGd5Qh+JX9cl0KKWunLmdEFO1JdpRQ=;
        b=qKeMhBDuysAIwF2sN9ffLeGHwiqf8lNNgHMhELuvqkOKp0DF6Oi41IRMV0eXSAHHF6
         8VUkpzVeds/elAlgvtpuvxXy0ByIXhVFihD7IDV7B0MV15JWS36s2V15WHOCQRuwQcT2
         Nf4XlWg8LAi9absaRJ19BZvE/dLq+bwCahiexlbQzzHNcBMtQnCTFRiW6CnW3XLkYIjm
         P4qIdFyuDn1JYgOuLqsIytX1FNMUValzA9Vv5i5QNC25UIa48nPvisEUr5QOjWeE0bEv
         o0ZdYQ28QPQRvooHiH7MpCX4WM5BCk0Uz3J0KMifJddd5BvirNXOsttW5MCirMTnFqz3
         J0bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724087661; x=1724692461;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/GihWfFT2JQRJVGd5Qh+JX9cl0KKWunLmdEFO1JdpRQ=;
        b=e2Vohfri/XPTxAOicmppGz9eminIr/OnXYkm8RR9ylXmrWkIAiNPF1xa8bWpTBKI1b
         Qn+VHlGYuiL3VVqKOZg3CZuNfOJ0wonLXQmqQwjrk6uJVw3GRMO+bnh0K5GaN077UmNV
         pIlepP/rcvsuXtZgz4KC2PaZIg9vfwxcC0rQIiZzI9B5roEZbk040PulM4WUW4IiLNxB
         YnBlP90wKR6mlinTcuLAUJwR6hNfkf/lXdMlIg890A4tCDUXWt8CW0/7c+3dSt5IVP3/
         zpkQjPIhhB/O8s9NKIvW0dsrFm4Qhd0td8hhiicLkl74xTYQccC/a2k2pcSA99R4FR/e
         OVTg==
X-Forwarded-Encrypted: i=1; AJvYcCUxXMkrPHa3GQS28AZtWpDR8w1knq7p4BSFD4wBZdlVnbKvqKujQsR3H0ZXAiwSZUdqMT4KAPyDqNrnlNPCgeS3Tnz9PyP8RtaV
X-Gm-Message-State: AOJu0YwgZxdV9/bFUgubIrh4cmpHIDzYe+dAUqsI+Afsip8RyOTL/9Ko
	RFnKXkg4jXtLzUyaRGm5qmCF62pL9Ht4Za4PuqafrBM+AeS6OJHfWDGpwNzh9l4eTSuQ6M6k9mq
	Www==
X-Google-Smtp-Source: AGHT+IGA53pJwhjgqmspkp0hMkFPI/AKW9PRDR3cDUKgxT41z920S4TJaOjJUBdD3Q0JcLLF9QWZ0w==
X-Received: by 2002:a05:620a:198c:b0:79f:14ee:7d08 with SMTP id af79cd13be357-7a5069ef8bcmr1265486385a.62.1724087661379;
        Mon, 19 Aug 2024 10:14:21 -0700 (PDT)
Received: from rowland.harvard.edu (wrls-249-137-8.wrls-client.fas.harvard.edu. [140.247.12.8])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7a4ff055c00sm445075785a.53.2024.08.19.10.14.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Aug 2024 10:14:20 -0700 (PDT)
Date: Mon, 19 Aug 2024 13:14:19 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: Greg KH <gregkh@linuxfoundation.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	syzbot <syzbot+85e3ddbf0ddbfbc85f1e@syzkaller.appspotmail.com>,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	linux-usb@vger.kernel.org, syzkaller-bugs@googlegroups.com
Subject: Re: [PATCH] media/usb/siano: Fix endpoint type checking in smsusb
Message-ID: <044260d2-4aa3-4937-9f5b-91e039a1df41@rowland.harvard.edu>
References: <4442a354-87f1-4f7c-a2b0-96fbb29191d1@rowland.harvard.edu>
 <0000000000009f6f85061e684e92@google.com>
 <51b854da-f031-4a25-a19f-dac442d7bee2@rowland.harvard.edu>
 <1959a4fb-8bf2-456b-83b8-ea28d517debf@rowland.harvard.edu>
 <2024081909-afar-trolling-2a67@gregkh>
 <20240819101358.77aea582@foz.lan>
 <54c7e42c-465b-42fc-9707-d848ae53a00c@rowland.harvard.edu>
 <20240819182456.5e13315a@foz.lan>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240819182456.5e13315a@foz.lan>

On Mon, Aug 19, 2024 at 06:24:56PM +0200, Mauro Carvalho Chehab wrote:
> Basically, the actual SMS device type is given by this enum:
> 
> 	enum sms_device_type_st {
> 		SMS_UNKNOWN_TYPE = -1,
> 
> 		SMS_STELLAR = 0,
> 		SMS_NOVA_A0,
> 		SMS_NOVA_B0,
> 		SMS_VEGA,
> 		SMS_VENICE,
> 		SMS_MING,
> 		SMS_PELE,
> 		SMS_RIO,
> 		SMS_DENVER_1530,
> 		SMS_DENVER_2160,
> 
> 		SMS_NUM_OF_DEVICE_TYPES	/* This is just a count */
> 	};
> 
> But I dunno if there are a 1:1 mapping between type and chipset 
> number. The above type names probably match some vendor internal 
> names, but we never had any tables associating them to a device number,
> as the vendor never provided us such information.
> 
> Btw I vaguely remember I heard about a newer Siano chipsets (sm3xxx), 
> but never saw such devices.
> 
> -
> 
> Now, I'm not sure about what endpoints this specific driver exports, as
> I'm lacking vendor's documentation. What I said is that almost all DVB 
> devices have isoc endpoints, but I dunno if this is the case of Siano.

Currently the driver exports only bulk endpoints, even though it doesn't 
check the endpoint type.  You can tell because the only routine in it 
that calls usb_submit_urb() is smsusb_submit_urb(), and that routine 
calls usb_fill_bulk_urb() before doing the submission.

Given this, I suggest merging the earlier patch submission from Nikita 
Zhandarovich as-is.  If the driver ever evolves to include support for 
isochronous endpoints, the probe function can be modified then.

Alan Stern

