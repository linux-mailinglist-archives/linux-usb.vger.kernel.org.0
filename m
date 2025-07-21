Return-Path: <linux-usb+bounces-26043-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D658B0C589
	for <lists+linux-usb@lfdr.de>; Mon, 21 Jul 2025 15:51:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3F63E541572
	for <lists+linux-usb@lfdr.de>; Mon, 21 Jul 2025 13:51:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7372C2D9ED9;
	Mon, 21 Jul 2025 13:51:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="IN3XoMJw"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79A482D9EC8
	for <linux-usb@vger.kernel.org>; Mon, 21 Jul 2025 13:51:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753105900; cv=none; b=d2dR/AMftlzYoBl3Tgulhs9ZTLfkSKzhHts7vj6gXLuAPCIgwLaYvfjKIze5s1PQZpGpZUgiqYuoG9nRu4WZ0rkmGNQPh91EQvb3QPKi39V9Od2CAT7K3poIEcDUjnwb8NtVLQWs0cKQATNuUidvqkFhMuuQXzqDUU2UvHbUcEE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753105900; c=relaxed/simple;
	bh=oq9WSvjlNctAjhJsmZyYP9dGzIiEdvMi+41B8vjBpNI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YODUFCP0VC0RzQ03GLBkxvYo7DnYzxCsUyuznhw6ejEQeyPkUDtZsigMOWxPvfbV2DPSUDkIaqH5Acb5cSrYa0vFaYlsNNf8JVwGjjYUKGANmad/03BkZr63S9sNnDVnaaU9HJeXEcZkFQHiLjjUaiADo0u6Fjb1BLbpOE9xWAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=IN3XoMJw; arc=none smtp.client-ip=209.85.160.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-4ab5e2ae630so51644701cf.3
        for <linux-usb@vger.kernel.org>; Mon, 21 Jul 2025 06:51:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1753105897; x=1753710697; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=6jHD16eTa4CvB7iarYQoWOJQjHRnWLktNHVHGBkrL7M=;
        b=IN3XoMJwwZdH1cfpNlQeUx0+b+eeQeUNrBc70tF8SLTAj7/CHksBAlyPLK1v0HP4A5
         ahKLk7zmJeDZ+rM4bE/HQXqQMWEpQOIZovP31LaqbqGrxbqd7aXF51cLHY1z3YuNFK/S
         JjUsERMeDsZtje6bn6567iPGFLj9SWs84QMiABVoF6QtD55i4gAT7mq9FkErlS/+yAXx
         72ynbq1k2oJtwn0EGzXpiOv1CLayDbGxf6oT2Z2hUZMiqPaVtUk0lbBZ9ykjfN9DAM7Q
         Y2LVhJDrP3AgFnsy7BXsjPpgzn3x3SqzXqrpale77/ntY8H3DoPLn8HrP7qeGDVtDq5W
         kP3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753105897; x=1753710697;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6jHD16eTa4CvB7iarYQoWOJQjHRnWLktNHVHGBkrL7M=;
        b=RtakIHS5tI1wTF/QiAAkv61k0xlYM1JZIH7j3j/WTwdgI0bEPjp1qQEvChb6U4sgTq
         PWDEIl82077Lm5CA08tnfcd4uHPoetTqwFTslLi0Lwf+IPRZzblhhtSORUbvAGID2hRn
         +7iQCoiByCo4rL0jEfpmE3EpwNazqg8cmMuMg7NRPl8Ye/TWaLlJAMlpHsqk6LXPEELK
         vMYx0J2AZb1QNusK7YNiZ5MB1a3fad94H2jEelJ4/pjRvBfiYFh2M50itqvr3f7f7i9R
         C31aBgzSd8Cg9v5ZOylagFCIykQ1xt5XM2gegtWaWhC+7WQWnGubLXuyaBcD9IUkKOmT
         4SHQ==
X-Forwarded-Encrypted: i=1; AJvYcCXz3lxwkM2KVH6BqTVczP2yG5L1ntNpQa8oSgOkTBNO4OXKopCDEYsHppMZZOTS4JgK4NxyqvUU8dc=@vger.kernel.org
X-Gm-Message-State: AOJu0YyE81LMwuRWgfqhorDnwUk7eiPs1Kvnoc1pRAb9AgOw2NhW5ldC
	5acigDoXc94rsS8I68cUr7IEAdX5X6M3M8uIu9nfayJcQGYYxEt/LNJietq5ayMn9g==
X-Gm-Gg: ASbGncsKmw5XIdQRWe9kbQr6u2QFYM7BjjrUqzhYvYrs9Gi09x4BPJcr91vPpdobhMa
	h9yQA7fnzeeaYpD62Cvl79Ikwl0MnoxOSwJDPP7binhezfEKQ5yrMYOBmhmniPZPBc+NCGVtPSO
	WV9YfrkIgl+2GR4g61Fe01cKyUygyR1QB8xoFuaaiPRjh4VzvGQOL5AJbyYYx/yTc5UvukU1Yx7
	jK4LrFBRQdmlSBAhxWqhb3Sj4l02OQSuJWnn4h14YvbnhX2FJOP1EaWa6p+CcQqLaobnT982OhN
	xzVVAmBViCjUC3Qg/EpHdeFl0IpeyeOpblRPoszqwJbycbeRKVoGei+2DD0d+TNrmDeDEfuQ2MW
	K1YbfBCg6YQQDwg32wrQ7gOeEXig+iDtaS9IDKA6A
X-Google-Smtp-Source: AGHT+IFSGK8XaIApqm9eeGcRZ0wxc+1dTGf3tk1r5ZOtue7S6cIH3bFI6m87yeMDx9NaR1Ch2jGK4w==
X-Received: by 2002:a05:622a:7b12:b0:4a9:91b7:6b88 with SMTP id d75a77b69052e-4ab93c6f807mr225423791cf.11.1753105897141;
        Mon, 21 Jul 2025 06:51:37 -0700 (PDT)
Received: from rowland.harvard.edu ([140.247.181.15])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-7051b8bc2dasm39329676d6.12.2025.07.21.06.51.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Jul 2025 06:51:36 -0700 (PDT)
Date: Mon, 21 Jul 2025 09:51:34 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: "Lecomte, Arnaud" <contact@arnaud-lcm.com>
Cc: gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org, viro@zeniv.linux.org.uk,
	snovitoll@gmail.com,
	syzbot+86b6d7c8bcc66747c505@syzkaller.appspotmail.com,
	syzkaller-bugs@googlegroups.com
Subject: Re: [PATCH] usb: mon: Fix slab-out-of-bounds in mon_bin_event due to
 unsafe URB transfer_buffer access
Message-ID: <cfc6d242-df9d-42cf-b275-08de2da669e8@rowland.harvard.edu>
References: <20250720200057.19720-1-contact@arnaud-lcm.com>
 <8bbc84ee-44c9-4a85-b5bf-3980b3c81e5c@rowland.harvard.edu>
 <6cd8b6bd-d07b-404c-af23-42fcae9ed9df@arnaud-lcm.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6cd8b6bd-d07b-404c-af23-42fcae9ed9df@arnaud-lcm.com>

On Mon, Jul 21, 2025 at 09:22:40AM +0100, Lecomte, Arnaud wrote:
> Hi Alan, thanks for your reply.
> 
> Your point raises an important question for me: Is there a specific reason
> why we don’t have
>  a synchronization mechanism in place to protect the URB's transfer buffer ?

Protect it from what?  Access by some driver at an inappropriate time?  
Drivers are supposed to know (and this is alluded to in the kerneldoc 
for usb_submit_urb()) that they aren't allowed to touch the transfer 
buffer while an URB is queued.

Alan Stern

