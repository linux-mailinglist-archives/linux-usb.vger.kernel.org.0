Return-Path: <linux-usb+bounces-8470-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AB37988DC9F
	for <lists+linux-usb@lfdr.de>; Wed, 27 Mar 2024 12:34:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B08F11F2B81F
	for <lists+linux-usb@lfdr.de>; Wed, 27 Mar 2024 11:34:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 88FE784D15;
	Wed, 27 Mar 2024 11:33:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=brixit-nl.20230601.gappssmtp.com header.i=@brixit-nl.20230601.gappssmtp.com header.b="Kc7gveCy"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BDDE82D8D
	for <linux-usb@vger.kernel.org>; Wed, 27 Mar 2024 11:33:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711539237; cv=none; b=eHBvNRxd/oCMRjWHaCDYMCPbvZBbdOjMf3s/OsVlHOz2xEpnWE41INAWABIIpmwXYx7ztZwact+xGpBpI3ie36UzoWNFFdJA3wnPQU7iurE0TanBEZc5D3Wv/XgY3WdUCqoe/q11ekkOIMj7PxxufDWy2pRluhQ5rgb3+XmPkl8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711539237; c=relaxed/simple;
	bh=aDg9VQsZHb2bvkz2wfSvA+6KPQPzORiP4CB60k8cjxo=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Content-Type; b=n4qEgJVjSpbwA8LMOV23MXXZFwTJBKFJoK349CGbrM+qAVUM/DUhizUb6A9dL7y7r9KnfnfNPfwVYMZ3FTQkOeHz8FBAeLFfQAWyeH/cl5IZsfU/gcQPhfx9xrjhePFYM2sSTLwPQsQ5T6zSD5K2mMu6K8/84WPbt6EuCZXbSAI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=brixit.nl; spf=none smtp.mailfrom=brixit.nl; dkim=pass (2048-bit key) header.d=brixit-nl.20230601.gappssmtp.com header.i=@brixit-nl.20230601.gappssmtp.com header.b=Kc7gveCy; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=brixit.nl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=brixit.nl
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-55a179f5fa1so8443439a12.0
        for <linux-usb@vger.kernel.org>; Wed, 27 Mar 2024 04:33:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brixit-nl.20230601.gappssmtp.com; s=20230601; t=1711539233; x=1712144033; darn=vger.kernel.org;
        h=content-transfer-encoding:subject:from:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PZdVzn1VOccM6TAbuNnLSK4C6eC9jetDFNYscga+k5s=;
        b=Kc7gveCyH5XKkJKWs4SbXYuAlxaO0UTR7SXA8xTxyhcUvswmsWMCP3swPOuHKSFvP+
         fAqTk2cdxAdFgwMBkpcqR5lc37w2l54a+gGgSxGZ6IlMHAn7YZHRR3Xwp2OP0hxgV1D1
         9RXnak3GwUC5+uUTiPd05upl615QIBYOqmRagzoSgLO5l9YtfVwhQ49pJvSccpEiJiK7
         GT1MO+Ydp9gtuUpiOCqC5HzjT8txK14WZY8VXhIEKP3ckdr2N8yVldA/6TPL8OBTznC4
         rgPpFENG90/4I5fE2h4dds+38RH5yfq7sQ7IL24tIZGoM17UlOVBZBTc094wuc5k/izL
         YTBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711539233; x=1712144033;
        h=content-transfer-encoding:subject:from:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=PZdVzn1VOccM6TAbuNnLSK4C6eC9jetDFNYscga+k5s=;
        b=DRq28wsPESJ1IJmNt0OmFu55v0UVfJmyTyy9expFb7F7rEWH0efppxItED3kczR26G
         G4FVN2PFtUu1LLkZ/u7P8UpxrvYcnrC/F2Nphljk3nHlAkJTRiWsGHlGHiPb4Nfm0Nhp
         Okq8+Ux4S9PgBXqvjskyoQqHLMHjp0WSS+hdikhxfHUwQM/Va5+TTaQZpZhHqYx2bflT
         hFfq7+Tl3PHbLeaRKNJxv9Fb57piiaXz9U91SRMtzW0JGoo+Yl2Lbwn1rTMD6xECLUyA
         ZMS8305wN+QQMdCuJ4L0YprntZwJV9kWbqv5ZelaC0Eh3D9Lvvz4/BYuRpRVmFYms2RF
         eM9g==
X-Gm-Message-State: AOJu0Yz0R5V5WkguA01bDXR5imb/RdCREkFEp7hoQ2ZZVhh8Hsj/9EHR
	nAe6vUdJQjSjUaz8LfxJErcghkZdO4cD+w74ra9E8evdk6MZAJh8E9G9X5gfN9jFKf7wdWefkdM
	Z5qU=
X-Google-Smtp-Source: AGHT+IHD0cq5C34cn/BBubnt5ebOOH5aH0iskwKyOgX/OGINY84REUT4/Twhj58XP+1ft7pcNHUvAw==
X-Received: by 2002:a17:906:b4e:b0:a47:61cb:35db with SMTP id v14-20020a1709060b4e00b00a4761cb35dbmr777249ejg.10.1711539233116;
        Wed, 27 Mar 2024 04:33:53 -0700 (PDT)
Received: from ?IPV6:2a00:bba0:120c:9f00:7afa:53ac:c867:e339? (2a00-bba0-120c-9f00-7afa-53ac-c867-e339.static6.cust.trined.nl. [2a00:bba0:120c:9f00:7afa:53ac:c867:e339])
        by smtp.gmail.com with ESMTPSA id ap3-20020a17090735c300b00a48f583bee3sm3635580ejc.30.2024.03.27.04.33.52
        for <linux-usb@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Mar 2024 04:33:52 -0700 (PDT)
Message-ID: <00c4fd45-dc9f-4197-952e-c7c322b6370c@brixit.nl>
Date: Wed, 27 Mar 2024 12:33:51 +0100
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: linux-usb@vger.kernel.org
From: Martijn Braam <martijn@brixit.nl>
Subject: Using a composite device with kernel drivers and libusb at the same
 time
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

I hope this is an acceptable place to ask this question. I've spend a 
bit of time reverse-engineering the USB protocol for a subset of 
Blackmagic Design video mixers and I have made a userspace 
implementation to make these devices usable in Linux with libusb. This 
is working great but the roadblock I have that I can't find a reasonable 
solution for is that these devices also expose an UVC webcam.

While my control software is active it's not possible to use the UVC 
webcam functionality of the device because with libusb I have to detach 
the kernel from the interfaces to make my userspace access work. As far 
as I can find documented online there's no way to have half a composite 
device handled by kernel drivers and half with userspace drivers in 
Linux. It seems to me the only solution is to make a kernel driver to 
bind to the control interface and have that kernel driver pass-through 
to userspace somehow with a custom protocol? If that is the case would 
such a driver even be supported in Linux?

For reference the device I'm working has these looks like this:

USB 1-4  [1edb:be55] Blackmagic design Blackmagic Design [serial]
    Class EF SubClass 02 Protocol 01
       Interface 0 FF/03/00 Unknown <- Blackmagic USB configuration protocol
       Interface 1 FF/02/00 Unknown <- Blackmagic USB control protocol 
(I'm using this with libusb)
       Interface 2 FF/04/00 Unknown <- Unknown
       Interface 3 FE/01/01 Unknown <- DFU
       Interface 4 0E/01/01 Blackmagic Design <- UVC camera
       Interface 5 0E/02/01 Unknown <- UVC camera
       Interface 6 01/01/00 Blackmagic Design <- ALSA
       Interface 7 01/02/00 Unknown <- ALSA

If this is not the right place for this question, then where would the 
right place be?

Greetings,
Martijn Braam


