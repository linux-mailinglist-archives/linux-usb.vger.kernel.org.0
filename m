Return-Path: <linux-usb+bounces-19385-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DE3BA12D72
	for <lists+linux-usb@lfdr.de>; Wed, 15 Jan 2025 22:14:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 793B1165CB8
	for <lists+linux-usb@lfdr.de>; Wed, 15 Jan 2025 21:14:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E3E3B1DB92C;
	Wed, 15 Jan 2025 21:14:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="YL+P+d4k"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-io1-f52.google.com (mail-io1-f52.google.com [209.85.166.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BABBD1DA63D
	for <linux-usb@vger.kernel.org>; Wed, 15 Jan 2025 21:14:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736975673; cv=none; b=F+ThNG6OcNNNPbGeomPuylJJ7gvBYhdY6aed3dHOPQyBC2JSFELf6XReXxwZbT9luNjYw0t3NM048XPMR5Bl9ajSh7j9I46M0mn4e0t1TxI5qJXJIuf0C5z9s9eBOOeIMdStCwGeSHO8oVqseOHEVeaHYdVzeuJ86/dbdBotb/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736975673; c=relaxed/simple;
	bh=0paO2nZ1iCH6XzWPAp8ZH7sUuh5bf7DaRZLnd4BotsY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EmAgde5QCCANs0s8/d2JUl/jl8y1qVCQF+3gfu6HsqtUtURguc32oRyYyL/eGG3ZbkTX+gmBEYku/nRXzmLWQXyZxb7s6mkpp3EPout0nP5MbgtxAvCRZTnriSfOV5ziaj93aQdwp59HOn8imoN2M9BT4uVZMnAonj+pMpFjjks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=YL+P+d4k; arc=none smtp.client-ip=209.85.166.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-io1-f52.google.com with SMTP id ca18e2360f4ac-844e39439abso8120539f.1
        for <linux-usb@vger.kernel.org>; Wed, 15 Jan 2025 13:14:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1736975671; x=1737580471; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3A3raIt1UWEdt1/pqvaYFbdvCVaN7B342Q1i3Jljvws=;
        b=YL+P+d4kdBKqt103yOy+r04kWT9c+QxbB2o8R7s3vK5vJJAX3fkpOo+7LzvWn0Ro6v
         zPJ+6uODCytFxtW7JMBvQz+5Bt2d3RLLdm3t6wv8g7SFsUT/DNAJmZ1wXa/1GLnN4RHP
         mzXjrpJjq9brTNfcDjo5QG+ViXHDXVSy3rABQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736975671; x=1737580471;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3A3raIt1UWEdt1/pqvaYFbdvCVaN7B342Q1i3Jljvws=;
        b=iLO2OsT1tI8R6Blm49GtG2gk296J1EKQWCkh+c4qU/7OOK9uwUb0qflcpm0QBtJuoA
         hOAoUH/JN42u5MVqTOdfo56QqWi6mZRuoTPXBRBrQDgqgARjOSBv4fwgz8A3a4EWOnBb
         c0SAUJkOaP4Nc7TEsCgX4Lq5BC4MCiBCSA27J2NFVinu+EXdCESmefx+sjbPHCE77U5q
         HanpnwRh3lAJbGEo9c5/94LBDJeY3J6dHrgWKBKS0eVdCFMxuGgFIAamfHVi197VenqR
         Pn5WO35ilDjgmZG8aHtKFNFR5ZAKXqhSvib3KgLW64eEh/wOB/nZDFbHiCqNTr6zZ8ZG
         LESw==
X-Gm-Message-State: AOJu0YxtU4M6gZYrmcv3bm/uD0lIdpbhPGxSOoErmGU0YKCKtO6TiqJJ
	ogXXrZRCW7vmg3qmpCN/MtO6v/di4Gap0F/8bA7vZpv+p8mpZNvl7Q/86kpoGqk=
X-Gm-Gg: ASbGncsQ1/msvzB4suCM6yposYuPvbOpOiuBNRVJ3C6cWKlcpoOxvn9caEJ48o+HKF2
	gVjDywyGZO/7/oY7nQfRDE3cxKWtG8G5q5AIeRfjVX5pmkjLhv/XPylsLvmE7VB+BI5bvw+1QZ/
	T+hBVq4QIAIuvzN0d2jOoBsBWP/PUdBSYajyCLE8+1AOMDcgGXWmzzBq862dmkIbVsE6GVya8lz
	rOG285cBcNsKvQkty9JIJMg58nAj5JVLh8RdEiXVxsWBcmxzsYS3j5/3UbhZqYRIlk=
X-Google-Smtp-Source: AGHT+IEGeJ4i5nfTshZfsu6LzENMQMc/Yy0qUYjo30mMQfSevs0GH0vZkm0Ulh+9lvq+wObiu+nB4Q==
X-Received: by 2002:a05:6602:378a:b0:843:ec8d:be00 with SMTP id ca18e2360f4ac-84ce018a26bmr2764393739f.13.1736975670870;
        Wed, 15 Jan 2025 13:14:30 -0800 (PST)
Received: from [192.168.1.14] ([38.175.170.29])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4ea1b7459e9sm4344948173.118.2025.01.15.13.14.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Jan 2025 13:14:30 -0800 (PST)
Message-ID: <2d6d8b25-2028-4e6f-a820-38abcd337e09@linuxfoundation.org>
Date: Wed, 15 Jan 2025 14:14:30 -0700
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] usbip: Correct format specifier for seqnum from %d to
 %u
To: Xiong Nandi <xndchn@gmail.com>,
 Valentina Manea <valentina.manea.m@gmail.com>, Shuah Khan
 <shuah@kernel.org>, Hongren Zheng <i@zenithal.me>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: "open list:USB OVER IP DRIVER" <linux-usb@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20241231161539.20192-1-xndchn@gmail.com>
 <20241231161539.20192-3-xndchn@gmail.com>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20241231161539.20192-3-xndchn@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/31/24 09:15, Xiong Nandi wrote:
> The seqnum field in USBIP protocol is an unsigned value.
> So we fix the format specifier from %d to %u to correctly
> display the value.
> 
> Signed-off-by: Xiong Nandi <xndchn@gmail.com>
> ---
>   drivers/usb/usbip/stub_rx.c | 2 +-
>   drivers/usb/usbip/stub_tx.c | 2 +-
>   drivers/usb/usbip/vhci_rx.c | 6 +++---
>   drivers/usb/usbip/vudc_tx.c | 2 +-
>   4 files changed, 6 insertions(+), 6 deletions(-)
> 

Acked-by: Shuah Khan <skhan@linuxfoundation.org>

thanks,
-- Shuah

