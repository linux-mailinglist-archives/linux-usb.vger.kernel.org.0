Return-Path: <linux-usb+bounces-25631-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 641B1AFEBDD
	for <lists+linux-usb@lfdr.de>; Wed,  9 Jul 2025 16:26:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B7EF856620E
	for <lists+linux-usb@lfdr.de>; Wed,  9 Jul 2025 14:20:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1440519F40B;
	Wed,  9 Jul 2025 14:20:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="v1YkWv1y"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E0241B412A
	for <linux-usb@vger.kernel.org>; Wed,  9 Jul 2025 14:20:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752070823; cv=none; b=Z/iR0AecFhE5TX2MEGkLnYpgDKDC1H79uA6VYYa5ChmBybaUSBLP75e67Q4a7Fvlz2san7ZqEF+L2lOSsqsaMZ6F9yQV2ldeII8JkCZ9SwiQJXCQvoGUPh0IqBuQ0jCFuOGRdpinkya8QBEcjKAUl5FZ2eYiysn5e+zYKPpt34A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752070823; c=relaxed/simple;
	bh=izxYMRmyjfLaPNfclpcKRt2rdXsw9LASTfTgnLOH6/0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=h6osmZgg4iFve2+Em4rv4gbbe8SHCu3DkmuDBDWVI3rqGAf8KPyfG0rFSE/rQWRnZ5QS9aATY53jG8DKWID5Pud8L7k1d7QEAIh3pNvgw4xye6AExIhTi0vw6pCNTksTs8dadmELDraunD1mNiD5g2MIlFz0YHgh3lMw120JsyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=v1YkWv1y; arc=none smtp.client-ip=209.85.222.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-7d20f79a00dso816117985a.0
        for <linux-usb@vger.kernel.org>; Wed, 09 Jul 2025 07:20:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1752070818; x=1752675618; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=oX966d2OnnOsVdLSRaxq3GIDCek+Q0oewFnZOwTFSCA=;
        b=v1YkWv1ypHWlzX088QHdk05jmU60OSahGqNq+dTw9byhfKmU5kztGxG+zB/gfMsbl2
         r22Cd9XfmJ0errB5DUh6SPxIIfyVbW1QuEC/zOWta+2DDSqqICeOsfxpM6I4HusKZx6Z
         iH07gUNbael2nKNc0Dvp9xmts1qrmH5XhND3XitiYyjumPAJOxCMNm863Y/F5EQVqUnI
         I4CrEZnaYlXhwzdEQUL0UH88uardBTn0JNxj43qhTQ1dQuDq6h9wUOjmSEqFLQxga07D
         V1Tr7Qk7DEmoc9aYu1aWrUWAgF2Rs5bL4z5p6m2TwBT0itgBQlVEgZvktIQ1gHQ1mcNs
         HDwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752070818; x=1752675618;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oX966d2OnnOsVdLSRaxq3GIDCek+Q0oewFnZOwTFSCA=;
        b=o9VNEkMeWkN9ubwmU2GmzMDbkATTWVpKDw1ERr1d/EGwM8VcmsTqu8AYu84qiw+aJi
         WIa4dXU1h9MyTbUz6L/a1Yh/sDWjqTnm0cNBz87rqHzcXX/JzwyMjcniiwLmN8S8bjOZ
         R29P8fpb+jnzawOlUSMvN299xyjBiHqgXhFhgGfLNDGAkHpxjUeMVS8IqsuC+6jwJtI/
         DvDnP3zyPjhwZJPR+6cATNQMde42D8+DF50+nFwSP7nO8pIxBGCn0xKiThic+MMc1EfM
         LPfTyR0CzU1cppzcth8DPFIcIEgNbNV9w7XnmeCRDWUXL4wbBqyI9vjq/IRDHpoRwZF7
         Jalw==
X-Forwarded-Encrypted: i=1; AJvYcCWNz7C8+2yBR/Ed3uvZBqbQUeS3AtkVOaBNMVBkCu5Y9/3ILibKnYTbyolEBvsZljSqzh/QAqnhy3s=@vger.kernel.org
X-Gm-Message-State: AOJu0YyY5IxLER6TYzQOFwC4CC3jctbLw4g8RJ6VyTdDji9jeZR7gvyK
	K+PhZaWrKo82nNwEZbBIdQRpeSwmYH4o/eRXWoDmZjcwMao6UEHFm31dn1RayST/tw==
X-Gm-Gg: ASbGncuU6xecjwJbpf9+j6cpReCXPKpSMUQyh1wBKrYS9sx2+bKUVPWyz8+ZXOpb624
	sovm95gaJ7lk36Cu4a29ijMorjc2rnlu9q8r4ctnX5T0iCU/P5Z1QxBhQH6JqrvgVaxvBl0zpXJ
	IhX5vn4rzmi31zhnvvVfUqIwfV25B0f4iolB9EeT5BwLkKkswKonRJDTlIpdFQIzP5pot6u5Zug
	pz4Bap3/LG+0PRdLqfClsHFuD+HnP3guvLOsAqgfXwwZQaW25xkBwDu/f0tdDOzkkx/Pi6yj0nz
	9i3H6rmSo3sLIJyp75iQs49UZzt7JLQqoG8XSTSjyy8tPqtTeALheaNYhNh6fw+G85XHpiIcDf1
	i789r
X-Google-Smtp-Source: AGHT+IG/uoOVNhIZcZGNS2qwUCpBTImqcv5OllmWRSz3tFYzjY/AZyQcMy3sAMZ5fv8ra7bDAqxtjw==
X-Received: by 2002:a05:620a:192a:b0:7d4:57a5:9742 with SMTP id af79cd13be357-7db7d3a5cdemr333724285a.39.1752070817522;
        Wed, 09 Jul 2025 07:20:17 -0700 (PDT)
Received: from rowland.harvard.edu ([140.247.181.15])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d5dbe8f9a5sm936291585a.87.2025.07.09.07.20.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Jul 2025 07:20:16 -0700 (PDT)
Date: Wed, 9 Jul 2025 10:20:15 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Zongmin Zhou <min_halo@163.com>, Shuah Khan <skhan@linuxfoundation.org>,
	shuah@kernel.org, valentina.manea.m@gmail.com, i@zenithal.me,
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
	zhouzongmin@kylinos.cn
Subject: Re: [PATCH v2] usbip: convert to use faux_device
Message-ID: <dd3659dd-7e45-479d-ab65-9f5c1bab26a0@rowland.harvard.edu>
References: <2025062004-navy-emboss-4743@gregkh>
 <2e0bbc5a-e74a-4fb5-884c-686dbaf99caf@linuxfoundation.org>
 <48ab511e-2847-4daa-98de-a234b8584b78@163.com>
 <fac026d8-12c8-4c1f-96a7-264ced8391f1@linuxfoundation.org>
 <a29703bd-08b7-489b-8fb0-15838a1245ab@163.com>
 <1a13cf53-ffed-4521-917e-9c2856a5e348@linuxfoundation.org>
 <4fc877f0-b55b-4fa3-8df4-2de4ba1ac51b@163.com>
 <2a901b8a-9052-41d9-a70d-76508ebd819b@linuxfoundation.org>
 <4759911b-8c35-4ca9-bc34-09dd41b14582@163.com>
 <2025070949-activist-mammal-b806@gregkh>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2025070949-activist-mammal-b806@gregkh>

On Wed, Jul 09, 2025 at 12:06:57PM +0200, Greg KH wrote:
> On Wed, Jul 09, 2025 at 05:07:24PM +0800, Zongmin Zhou wrote:
> > > > In fact, I've experimented with adding PM hooks to the faux bus,
> > > > and found that faux bus devices then behave identically to platform
> > > > bus devices during suspend/resume.
> > > > See the attachment.
> > > > 
> > > 
> > > Thanks for checking this scenario. No surprises here.
> > Another part of my purpose in doing this is that the vhci-hcd driver seems
> > should still retain suspend/resume hooks. Therefore, the faux bus should
> > add corresponding hooks to allow the driver to call its own pm functions.
> > Though currently don't know how to fix this problem yet.
> 
> I have no problem with adding the pm functions to the faux bus, BUT it
> needs to make sense as to why they would be needed at all as this is not
> a "real" device or bus that should need to do anything when
> suspend/resume happens.

The unique problem faced by vhci-hcd is that the devices it controls 
reside on external computer systems that have a lot of their own state, 
much more than ordinay USB devices have.  Consequently vhci-hcd may need 
to do more work for a PM transition than a normal driver would.

As an analogy, suppose you're running a program that has an open TCP 
connection to an external server.  If you suspend your computer, it 
won't be able to send the TCP keepalive packets that the server expects, 
and the server will eventually close the connection.  Then when your 
computer resumes, your program may misbehave when it finds its 
connection has spontaneously been closed for no apparent reason.

Alan Stern

