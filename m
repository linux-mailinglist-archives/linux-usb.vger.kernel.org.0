Return-Path: <linux-usb+bounces-15786-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A2233991F9F
	for <lists+linux-usb@lfdr.de>; Sun,  6 Oct 2024 18:35:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CA20C1C20CBB
	for <lists+linux-usb@lfdr.de>; Sun,  6 Oct 2024 16:35:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ADA1F174ED0;
	Sun,  6 Oct 2024 16:35:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="eJPRHsDu"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 434E928EC
	for <linux-usb@vger.kernel.org>; Sun,  6 Oct 2024 16:35:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728232544; cv=none; b=YnUwyHZxwIO3s/Heb3Oe4qUqQmcqiitDtgrzlDNQL3/b4k20nwYBq/HXlPLGM55mwC0DUlu2EYaoNJoSwOc51elC6nDWOJ3+1CL2l/tusAHNUQmVJV1ee2svtyxrp4N6ur/9ZGtYMC+r8nlOKplRgsB8ejL2UQgjZZjsduC5bME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728232544; c=relaxed/simple;
	bh=0IjgXFYIR9bCPqStbE4uESR5hjA2YORY87LIjw22u78=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ESBPvLZ0qSl1gGiXox4cPhsNNcFzRCWFFC4s4ePkeyU9cWLzFQ9aGArIDQPitc6TryhqBm7tvXWBjYxzV38cIlDdncutUIzZNDKedde9gmke4Mmj4l/okYJ5BRLnbTZDg+D2NlxNUvprBEKcmvc1P/rPJndppFGscbT1TPWs2Es=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=eJPRHsDu; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-2facf40737eso39273631fa.0
        for <linux-usb@vger.kernel.org>; Sun, 06 Oct 2024 09:35:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728232540; x=1728837340; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=YagWtDRbalF35/VzNBh5+QZJkJ5axk0g2fZ4D32aH4s=;
        b=eJPRHsDuDuWZ93AbTQr8wXP2Y/r5r3bbe2AxJd26w6TPUtc0J9aiKu3Rqgf736QSH1
         ZUE4SWjG4+/Gem8OkrkUZtEAc6dAVoL5fh11P3BT22NgBZhEiFFUa+bYr+R81+bKFZcL
         o8ITwxp9KPF1bCaU77vMUNex/Ma3ice9+nF5eBMntlLhyOw0KJCqwoxsbuDvAt/rokNH
         iI4FwtIsEPt4frQvIVglAiO7rAHAlndmwTspbQ/gHLzOrGBwRcrK5fP8ItOjsvwn5V+q
         6G8CoTb0FdN1vVK++c8baELDXh6s6Czj4QXMOR0j9v5BZ6VejNJ6GXwmnNJY6QdTkr3G
         dY2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728232540; x=1728837340;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YagWtDRbalF35/VzNBh5+QZJkJ5axk0g2fZ4D32aH4s=;
        b=n7PMF+eKnaOmyYXdnt/pOaBYvMcIhSddUZTqczioRxmTIlEFyKZZc7dsbzuwnaWGzi
         0VHNqniVynZLP1guUMWIzPCSKYpkZ+w046ghpOMQyLRjMmK+lWNO6lviPtc/FfDXBStt
         pAiEd8ETuVR1YDmq3T+uLdoeXkmS3puqunPiKD72l98drTtNbDRpdXIw2o+mX9Et2pNp
         KN8Z1JNHDGYLlMkTDgDjtf0zhBEIu3V0ebuzW2j+Qf+KngLTgj1MXiqkTFjviK+P/jfJ
         CNuNR/ANvflhBiV9+6CTHjEAqCl+QrgqGg0nh89nG8YDe8aONjHBz9bMXRHI6chXp9jy
         7vqQ==
X-Forwarded-Encrypted: i=1; AJvYcCXh0wkU5nWLGtjiRHtWOTFiFbZsvrbYYuivzfzbu3EUcEQLyMoy+VOvbHtAsNdl/Vi881SI2+VQm98=@vger.kernel.org
X-Gm-Message-State: AOJu0YwTzaUSwupK5r6qxMskJSuh7T3tr7teREE4n7dO2hJVn0U/R7Py
	kHtFJxtAIy40MYjusakwpv4wfW4Zyz5kynsHX8wF6bafm2vfTptU82L9N3Fo/50DXEbWtFOFNyd
	IdSkWPHLm
X-Google-Smtp-Source: AGHT+IGTS6agMzjcbG/PvGv7/0yusg6EqCbBWQUzqopzTLJuntA3hiVZk2R8IxL8hZF76LFhxbdeAA==
X-Received: by 2002:a05:6512:3d04:b0:539:9867:eed7 with SMTP id 2adb3069b0e04-539ab88c3d2mr4663095e87.24.1728232540250;
        Sun, 06 Oct 2024 09:35:40 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00-89ea-67f6-92cd-b49.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:89ea:67f6:92cd:b49])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-539afec0ffasm558790e87.39.2024.10.06.09.35.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Oct 2024 09:35:39 -0700 (PDT)
Date: Sun, 6 Oct 2024 19:35:38 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>, 
	=?utf-8?Q?=C5=81ukasz?= Bartosik <ukaszb@chromium.org>, Benson Leung <bleung@chromium.org>, 
	Jameson Thies <jthies@google.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	linux-usb@vger.kernel.org
Subject: Re: [PATCH v1 1/4] usb: typec: Add attribute file showing the
 supported USB modes of the port
Message-ID: <hnc4z2r26eijvarwhmu7hmioyuflacpa24g3runiek4p7eku6g@23saxidkhreg>
References: <20241004140440.1882311-1-heikki.krogerus@linux.intel.com>
 <20241004140440.1882311-2-heikki.krogerus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241004140440.1882311-2-heikki.krogerus@linux.intel.com>

On Fri, Oct 04, 2024 at 05:04:36PM GMT, Heikki Krogerus wrote:
> This attribute file, named "usb_capability", will show the
> supported USB modes, which are USB 2.0, USB 3.2 and USB4.
> These modes are defined in the USB Type-C (R2.0) and USB
> Power Delivery (R3.0 V2.0) Specifications.
> 
> Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> ---
>  Documentation/ABI/testing/sysfs-class-typec | 13 ++++
>  drivers/usb/typec/class.c                   | 81 +++++++++++++++++++++
>  drivers/usb/typec/class.h                   |  1 +
>  include/linux/usb/typec.h                   | 17 +++++
>  4 files changed, 112 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Tested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org> # SM8450-HDK

-- 
With best wishes
Dmitry

