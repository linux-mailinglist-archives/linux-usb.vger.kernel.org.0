Return-Path: <linux-usb+bounces-25640-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 42508AFEDED
	for <lists+linux-usb@lfdr.de>; Wed,  9 Jul 2025 17:41:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 090507AADF3
	for <lists+linux-usb@lfdr.de>; Wed,  9 Jul 2025 15:40:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 97AC12E8E19;
	Wed,  9 Jul 2025 15:41:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="hOgMkyJ8"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC04A2D3EF4
	for <linux-usb@vger.kernel.org>; Wed,  9 Jul 2025 15:41:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752075693; cv=none; b=smT8Yd8iJQ9j7LzNSeskYi6vT+4L+9/sOEgLl5bZLfWXhwsXXo98lmFl/wrkR3s6a4vmMFJV+yAUmelpZPjA8JURQFAYoFOlpMExDmWqDJWAOzStHD+yAjx8Wybuf35q5/31BYe85QgtGMYfP8+FtjdftBwiB2KLv+y3Qt5P4Mk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752075693; c=relaxed/simple;
	bh=l1IMqQamnOSUMauOz72BUd8fZaqfC+kM2xLZw+/ZgnI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sPbTAJVXW4FmmIoYbQFw+yPRIprP6MWXSZyKxww39NhrWDxVmPW2CFiKhsM7cvJRj1fwd5iY3r6zGErZxnzdyJ/x6nfiEuT3/Hhjg93K95w41rh/fMY1+qX2IX3958tlQoAyIUqbNab/299v2jtBdqmpc3sqGqQpk6zYOKgre3w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=hOgMkyJ8; arc=none smtp.client-ip=209.85.219.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-6f8aa9e6ffdso384746d6.3
        for <linux-usb@vger.kernel.org>; Wed, 09 Jul 2025 08:41:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1752075689; x=1752680489; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7+8lINShdvup+8jB4CEo5zDF19kEcona9FuXtnWhTyA=;
        b=hOgMkyJ8ZDRxXFyR1Al8/ogDzxRuxjEYlso9jmZIX7W7SLF+5gY+8Oef25Ah1cnYuG
         ja6MumEPbmN5MRGfhz4GKAlRKn8zpCrG7EYxEvxzOQ/AUwycRdAN2N3XzEokCBDap+7e
         w+LiX7zOb2+j0gqxNjMDLDf/FuKcrT8BQOoOdypjcPbwp6GSgfTZFQkqz7icgg0h09iF
         fUkT/idtzpx5e4HS2sRyAvRxa8peJ+yAO7dY/u6n2RQP4bHqI5CyBfkw8fP5ZAo0/Lgi
         tn9U+nHcuWOoh0vb7dkrcyqqf7qsObOd7HRshbGXaWLjj1bvf/h1rcW5SWul8RnFUDjf
         TxKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752075689; x=1752680489;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7+8lINShdvup+8jB4CEo5zDF19kEcona9FuXtnWhTyA=;
        b=ASlscwPDPVKiYE2MCRa6+nYDRt8HFWvj/p0amSHSvfoiji3E9vPbopUyN/YVzOKhQz
         H7HsqW+e3AYidqzg38BhmJol240G1ItXiXd9yk/BDJoZYTK5tPzt56mXLJ+46irwkJzO
         d01j6UkSCnipAUG8vMPtxz0ncOrB261nRFh8/a0YuD3f2wy1yAWCI/EgzV01K1xi+AmU
         TqM4DDQOAHKwWs4FeHZh99w82cqv3kMNdkPNlapUAwfv3lJF8jpIe89r1IPvAK2erc+p
         FmHwAqVCoYN+6NIxyRPKpM4RVUAA481KVXqMbycMxsKmRd2ZmkFtGxSfYZqZAFZ+7JSq
         bYiw==
X-Forwarded-Encrypted: i=1; AJvYcCWvsIz0pFZAuHYeDG+1iym+ioJT6znM3TBpjxs1svI/2CZF1A1Ro5ONq25Ftm73g+1/wMKkmkKl2tI=@vger.kernel.org
X-Gm-Message-State: AOJu0YyENy2jDX+Z0mtZNQx8YR1qQoxL2ta/B203RPd9isp9HD677YLc
	bAZhRsf1+Wc5xey+l8Kwcwas+kCjeWcDW3x4F7N1zqbUWCFYTcWacJY6CptuUsCXiQ==
X-Gm-Gg: ASbGncv2qjOYTU1cfSf6XoJxw5TnevR7uVzVO8VzhYdGWXWjXwFFtqyaw6dwiNyuEGZ
	BYL9Da8SSGnFSkTxsKT8seA2FiSA5dZVJ39OISHKKgNu5kWOerOzC/Of4jbmJxlPYiAVVoSwKGq
	Obn62XLpGl0o1psWB2hFFQIqAgr8faEF9E1bS13+yyYjTe2XqhRavNdx6/lm99db+Speioko8Yo
	E4MG4QxsvA18oO8B1BDmXOkgxY7FgZtf1Ee0Retb5Na2ehBUZ+aO9PTDWzj8m2H7D8nhLcMsO2S
	UrnN7pVXJco1BO9eG8ahuDI03JsGnv8FP6XY1ymALfHxfc0px7MI8PJmIgyB3HimCeFHSQtyVBq
	9WpN+teZAjdoKMKw=
X-Google-Smtp-Source: AGHT+IFQ8reysvGiDHB9SlFWV74GS4KL17/ACFp3PeDv69dK0w4A50NNV0ufOCxkqgR1vs+8lKQAmg==
X-Received: by 2002:a05:6214:3d01:b0:702:c150:46c2 with SMTP id 6a1803df08f44-7048b8d8da6mr44190726d6.10.1752075689343;
        Wed, 09 Jul 2025 08:41:29 -0700 (PDT)
Received: from rowland.harvard.edu ([140.247.181.15])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-704831532b6sm23936286d6.101.2025.07.09.08.41.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Jul 2025 08:41:28 -0700 (PDT)
Date: Wed, 9 Jul 2025 11:41:26 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>
Cc: syzbot <syzbot+592e2ab8775dbe0bf09a@syzkaller.appspotmail.com>,
	linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com,
	USB list <linux-usb@vger.kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [syzbot] [kernel?] INFO: task hung in uevent_show (2)
Message-ID: <1d471e25-6671-4cb2-a2c9-af96c2b4e13d@rowland.harvard.edu>
References: <686e7698.050a0220.c28f5.0006.GAE@google.com>
 <79f634db-c149-4220-b8d4-0fff2c6b6a01@I-love.SAKURA.ne.jp>
 <e064a3e4-ae70-4a24-ba5e-1bb8c7971f23@rowland.harvard.edu>
 <39f312fa-d461-4377-b809-50c8a7188f6b@I-love.SAKURA.ne.jp>
 <dd932df4-2a13-4a5c-a531-376065f87391@rowland.harvard.edu>
 <43189e93-2cad-429a-a604-15bf5cc95e43@I-love.SAKURA.ne.jp>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <43189e93-2cad-429a-a604-15bf5cc95e43@I-love.SAKURA.ne.jp>

On Thu, Jul 10, 2025 at 12:33:00AM +0900, Tetsuo Handa wrote:
> On 2025/07/10 0:19, Alan Stern wrote:
> > On Wed, Jul 09, 2025 at 11:44:46PM +0900, Tetsuo Handa wrote:
> >> On 2025/07/09 23:27, Alan Stern wrote:
> >>> Which of these three BUG_ON's did you hit, and where did you hit it?
> >>
> >> kernel BUG at ./include/linux/usb.h:1990!
> >>
> >> matches the BUG_ON(endpoint > 0xF) line. The location is shown below.
> >>
> >> Call Trace:
> >>  <TASK>
> >>  hub_configure drivers/usb/core/hub.c:1717 [inline]
> >>  hub_probe+0x2300/0x3840 drivers/usb/core/hub.c:2005
> > 
> > Those line numbers are completely different from the code I have.  For 
> > example, line 2005 in hub.c is part of the hub_ioctl() function, not 
> > hub_probe().
> > 
> > Exactly what version of the kernel source are you using for your test?
> 
> It is current linux.git tree.
> 
>   https://elixir.bootlin.com/linux/v6.16-rc5/source/drivers/usb/core/hub.c#L1717
>   https://elixir.bootlin.com/linux/v6.16-rc5/source/drivers/usb/core/hub.c#L2005

Okay, I see what your problem is.

The bEndpointAddress field of the endpoint descriptor is not just the 
endpoint's number.  It also includes the endpoint's direction in bit 7 
(0 for OUT, 1 for IN).

__create_pipe() doesn't bother to mask out the direction bit because bit 
22 of the pipe value (where the direction bit ends up after it has been  
shifted left by 15) isn't used for anything.

Alan Stern

