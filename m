Return-Path: <linux-usb+bounces-26813-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 17273B25080
	for <lists+linux-usb@lfdr.de>; Wed, 13 Aug 2025 19:01:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CCB6D188525D
	for <lists+linux-usb@lfdr.de>; Wed, 13 Aug 2025 16:59:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6FFDE28C873;
	Wed, 13 Aug 2025 16:59:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="ApKwlqYT"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31F79289E23
	for <linux-usb@vger.kernel.org>; Wed, 13 Aug 2025 16:58:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755104339; cv=none; b=AoSeQ68piMopIe0InvGJP2xP7Zsmi02gPxUC1rJnX+lXHHLNwsNp56pe/pxWrB1mtcg0a6mz3+lKRElWGJBvwOpcg4p9KQ4JClM2dPKRJx/6J1LiB7kUAURxjSGWBQWp6LEf2lUIwVpN5wVavEEDqZlABM3RCJMIp5P+pFOUMZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755104339; c=relaxed/simple;
	bh=WltyD/Gu17z0VQIoy5UrL9din5O3T3+b4q0ZfweaWlk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A0cz90ZxscVaH+kaEajuRtqIKWz0bTxYSOKh06+C39s6wKbh31WLJKKZs0NkvdZrnFvV00HdB3mdYy6gzvTwqmZW7acxGvaH1IhS0TRSOQUNIoc7TQi0KnDgXJzoRNemID53gcCug2PNF18sq6ZoJZEI1apgAoJ6V9G5QwXUl38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=ApKwlqYT; arc=none smtp.client-ip=209.85.160.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-4b109a95dddso1183551cf.1
        for <linux-usb@vger.kernel.org>; Wed, 13 Aug 2025 09:58:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1755104337; x=1755709137; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ixsrcuhdRVNDNuQRG1GynUI+Z0v3MMN1ZtGtSSllJ7g=;
        b=ApKwlqYTo62Nzv+8dil01LP7/QaXvneAjppO0ThGu17eQBVAWuz/mI0v8MrWzjvO2M
         YFlD81FQCgzVADvCHkI9Gp175K25HOi61Lr60zS3tFUnraEfLBle03B0vQCGImT8nN9H
         UT+zpVWWhbbtbh/BaFFaEVMTPfggmfyx+CQ4KElvcjZSM0TfcZ2G0JpqHKCzRpBr+2A+
         VSOGBaWsJQUp71h47zOCNnynJvfEO778mkNKUMw4+qNDJdzZGfNZhZVddd17u824vPtV
         w/Y5rUesDFsSRlIYicMoSU2BfoonJL1zn3ndEG0L4nOfvpWTVkKhMNETyqhfqnH6BYGg
         j09Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755104337; x=1755709137;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ixsrcuhdRVNDNuQRG1GynUI+Z0v3MMN1ZtGtSSllJ7g=;
        b=oiwm4P2MfZ6s27pjmreC7hbse5x7q6CAew0qQFclmzQGDi4O71oh4wTogoo2REOM0E
         R3/kcGTOhlysxh3KWZnjeiZvheDnISKmbZsCflYnjWGpRRmKTCZ25Bjwq8Iv86bEAGOX
         DzoMhTuOXObPSLqZwKsh27NIvsQAThAJp/LIduG/uAvYn6Rst5gpZ6s7pbfQ4Vi4K+LY
         54DNzFv21DmF2HWyibWPANP2mWPXO1JLlirlXo7h/aqJk1ARXbBoik+Z2GzsV6Wr5QcM
         li8YKmH7WOYIxkz8xMo/m7mlYevlye+J/c2YdjEkrcUT642hU+v+zEHgbaI65RNGeKxB
         okNg==
X-Forwarded-Encrypted: i=1; AJvYcCX+4gxGJF0ozusvx2pspEAftkCm/y3BjAGiMUpJDrR0lwhw0JAJQnAV7u9+fztsDepaqcn7sYBw3WE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwNvNf0kypunZz/zpvAkBSL9yFUSgq1z0j6JPADW5YAKVPtCgIl
	VUc63qLsU6ZPCVnphzoD/oAGJLH56hnnv+xrd8ealmlPQ5u203Bn0TvOxW1xOaXNLA==
X-Gm-Gg: ASbGncucN2mLK4E6xcPf3BMKq1mKR5eripDCud9Y6AtRJWCIFfIg5ka/VJ5+tRs4Tvu
	Wr4SjEgF2mm/OqWlSkftnXZI6TI1cwPUrsoVtRJn0iqj9jd/9qquyNY8Ci0E87i7qaIIJ7GUU/4
	ru90cvASuhEYUfYOFQb+rEIrt/ZkzxXhMf5uNJCxQ0pj0p8mwxOsHXHsCAw3yi8cRLrdVaEPFbv
	WRunEOWpahL9eUprq/CyM9MVGx4mAUZVMB+J9f29gfBfvLjGlN9qL6wIvGW/+199/qOVwxKy1GR
	LP55riCYKf51OlGwg+CIUhLDE/HiNBVrBra8jFawEIkTJhx4ImndSRhsnbMiUBpRp23VQ2/4jdT
	f0jFb1fj17lRE5uFkRf9sQSdyp05eFEjNSBuUj/q2X7KWBMQNjZlOQDrr0+d7V29FcQ==
X-Google-Smtp-Source: AGHT+IEX6taY4LlSwkNa+zM7dfmEU6izv8eUHX/5Yu4/4FOwk0gfPE982AWmeEaP1BJ/slfTY0ES4w==
X-Received: by 2002:ac8:590e:0:b0:4b0:89c2:68d9 with SMTP id d75a77b69052e-4b105f7a7b0mr16894621cf.36.1755104337064;
        Wed, 13 Aug 2025 09:58:57 -0700 (PDT)
Received: from rowland.harvard.edu ([2607:fb60:1011:2006:349c:f507:d5eb:5d9e])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4b069ca56d6sm142258981cf.36.2025.08.13.09.58.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Aug 2025 09:58:56 -0700 (PDT)
Date: Wed, 13 Aug 2025 12:58:54 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Zenm Chen <zenmchen@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
	usb-storage@lists.one-eyed-alien.net, linux-kernel@vger.kernel.org,
	pkshih@realtek.com, rtl8821cerfe2@gmail.com, usbwifi2024@gmail.com,
	stable@vger.kernel.org
Subject: Re: [PATCH] USB: storage: Ignore driver CD mode for Realtek
 multi-mode Wi-Fi dongles
Message-ID: <ff043574-e479-4a56-86a4-feaa35877d1a@rowland.harvard.edu>
References: <20250813162415.2630-1-zenmchen@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250813162415.2630-1-zenmchen@gmail.com>

On Thu, Aug 14, 2025 at 12:24:15AM +0800, Zenm Chen wrote:
> Many Realtek USB Wi-Fi dongles released in recent years have two modes: 
> one is driver CD mode which has Windows driver onboard, another one is
> Wi-Fi mode. Add the US_FL_IGNORE_DEVICE quirk for these multi-mode devices.
> Otherwise, usb_modeswitch may fail to switch them to Wi-Fi mode.

There are several other entries like this already in the unusual_devs.h 
file.  But I wonder if we really still need them.  Shouldn't the 
usb_modeswitch program be smart enough by now to know how to handle 
these things?

In theory, someone might want to access the Windows driver on the 
emulated CD.  With this quirk, they wouldn't be able to.

Alan Stern

