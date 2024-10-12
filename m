Return-Path: <linux-usb+bounces-16137-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CC1599B5B0
	for <lists+linux-usb@lfdr.de>; Sat, 12 Oct 2024 17:01:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 05AC41F21B77
	for <lists+linux-usb@lfdr.de>; Sat, 12 Oct 2024 15:01:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5312B199932;
	Sat, 12 Oct 2024 15:01:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="jAjJQ033"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D44F15B0EE
	for <linux-usb@vger.kernel.org>; Sat, 12 Oct 2024 15:01:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728745307; cv=none; b=umlzXr5YYb4X59ofv3M97m9e7CKDTsMsGN+LuP8mDJGYJAW8RV16tHo20F1cCSHE9fO3XIzRxDDa/XQbx0IdqMblmGILu0SyHbZ7JBUsXBSCzB9gVrU/Q1CV0YVf9VI9HzTicedsQOP+jqD2UfPocxyJctljHXKCXT96WqNWyoc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728745307; c=relaxed/simple;
	bh=YEUiLePNhVMbKwvX2/m9CkKVvHhoTjLH1YmL3oWgE9E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JFN7g4W2tUrKPGa5J3sx24bjVv7RpES5UAB2xeweE68N1NOkZX/4sL+BU6xCEaN+ammKWAHNNJH5If8kO96youuXTyoNZVPaG2CmuYnWl7lAZsFw3tBj7b8KNzh2hlmP172lyVmV/2peyfJtBv85ZB33g0VKj3bUv4SzB+UNoys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=jAjJQ033; arc=none smtp.client-ip=209.85.222.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-7afc658810fso262674385a.3
        for <linux-usb@vger.kernel.org>; Sat, 12 Oct 2024 08:01:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1728745305; x=1729350105; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=fULnjWwi2MGgq4W+ABLt5PjumaBI5IxDnjqyHYbxMeg=;
        b=jAjJQ033EritCoCn1qTFcwBMk3tg1piqHQxSuptJ/vEiUcX4inLLibvNVPbaMcslKD
         G84JhVZwq/BA7qGRjZOIAEVv5BalAmU43YADdFRsG7G91Cvzt8Dvdr15npvBwNVF5LjK
         ZmL3gaHmdgWxcyl4vz+MYkSg+scwdU7Txr/+Apc5Hxpknb0dICYEXG4sOBdf1WSey92V
         nQ98g2LnCKGsAeIJHOxGXVZEUVVlMaEexf+p9QEuQbWEHpNu2G7OWaWfe6GLFfkn4R32
         me+8WYiqjOAU2J+oGHUK1xh+zUJqh1KaJw799rJriw4hSraJ0WfOrx+cgiUuzWLhISAV
         oGAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728745305; x=1729350105;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fULnjWwi2MGgq4W+ABLt5PjumaBI5IxDnjqyHYbxMeg=;
        b=vk1Gdk7H/A4tzl7B5xc2D1Q1fCjIzH3Fq7xBuchvGVo+0KXf4hgerJ4xblYwv8Of10
         U4I+k0i5XOGToS8xH2MxbYt3nWWwjoqJOIMaT2xYjiPOBtF6awLGhm23oK0YSCYTBX7/
         H99XSjlAOKzFV544GpCoSTPk2MyzX40r7ZJ4awLIbrF7gUhgXH5cJrLlM2tXQUA26QnS
         emY0NbRda7aBLrEIe+QYmJbLTzfp+MaWefmArlnyRLCDIL6tpTjVRNsnzba5r9kLSqlH
         Grgv+7sw1uUH8GUDvLUloyIC1UJw1PL4u2qiuJ+HAJyqAs47+2SFXkMN27dvUsxkZTtu
         EQTg==
X-Forwarded-Encrypted: i=1; AJvYcCXdi20eGwKAAqVxxac4GcytxAYYot4J8/TM1q/iM9TrnnpZX+4lXGi1U78ezCQLCEKElHYbPoENp2o=@vger.kernel.org
X-Gm-Message-State: AOJu0YyA3hI06mT3jYFw8gWaHQcbHjp68Ep7tEvjT4Nwn7INHtkbpMpU
	HCGHazkLqkDPrbLVmL0/rLuL+Ne1h4sTom6VD6yP0ydH1OnW6ggzWCqNkcS/1Q==
X-Google-Smtp-Source: AGHT+IFZ44eikmmCXWv8LRBqrW7MgjO6XTiGmN1ju3tLIO7fZe2VBcJDJ75S1jcffahvgCejBOJiGg==
X-Received: by 2002:a05:620a:4547:b0:7ae:d2cf:aef4 with SMTP id af79cd13be357-7b11a36608amr790084185a.29.1728745305056;
        Sat, 12 Oct 2024 08:01:45 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:681:fd10::31c2])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7b1148de0acsm227769785a.39.2024.10.12.08.01.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Oct 2024 08:01:44 -0700 (PDT)
Date: Sat, 12 Oct 2024 11:01:41 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: duanchenghao <duanchenghao@kylinos.cn>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
	Hongyu Xie <xy521521@gmail.com>, gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
	linux-usb@vger.kernel.org, niko.mauno@vaisala.com, pavel@ucw.cz,
	stanley_chang@realtek.com, tj@kernel.org,
	Hongyu Xie <xiehongyu1@kylinos.cn>
Subject: Re: [PATCH] USB: Fix the issue of task recovery failure caused by
 USB status when S4 wakes up
Message-ID: <74848334-7cd7-4ce1-ad96-5dd29d70d3bb@rowland.harvard.edu>
References: <bddecd4e-d3c8-448e-8a22-84bbc98c4d1b@kylinos.cn>
 <b2ec107d4797f6e1e8e558f97c0ad1be6d46572c.camel@kylinos.cn>
 <84a4f66a-5b0e-46a8-8746-be6cd7d49629@rowland.harvard.edu>
 <fa347849defa66a7d4af23ac6317ae5b37357ea4.camel@kylinos.cn>
 <2c368013-8363-4a4e-bfee-2f0b14d01162@rowland.harvard.edu>
 <5f2f6b979e95e4c2bc33ea0277112939164f6024.camel@kylinos.cn>
 <d70e070f-5224-402c-ac27-0703b4010b18@rowland.harvard.edu>
 <0ad92e8fef2f07672aa8e97bc04f20657469ac6e.camel@kylinos.cn>
 <b8eb28f3-504d-4d26-8b02-ca1ae7309a70@rowland.harvard.edu>
 <f27bcdb6c5ddd4e91a1dc9f86b4f0c55c50671a8.camel@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f27bcdb6c5ddd4e91a1dc9f86b4f0c55c50671a8.camel@kylinos.cn>

On Sat, Oct 12, 2024 at 05:51:41PM +0800, duanchenghao wrote:
> 
> Hi Alan,
> 
> The V3 patch has been sent. Please review it to check if it aligns with
> the solution you described.

Yes, that is what I meant.

Have you and all the other people at kylinos.cn tested the patch to make 
sure that it fixes the problem?

Alan Stern

