Return-Path: <linux-usb+bounces-16723-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 441759B0F37
	for <lists+linux-usb@lfdr.de>; Fri, 25 Oct 2024 21:37:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0C54028661B
	for <lists+linux-usb@lfdr.de>; Fri, 25 Oct 2024 19:37:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1951018F2C3;
	Fri, 25 Oct 2024 19:37:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="o1oPLgNu"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qv1-f65.google.com (mail-qv1-f65.google.com [209.85.219.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 072A120F3C3
	for <linux-usb@vger.kernel.org>; Fri, 25 Oct 2024 19:37:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729885051; cv=none; b=M3IIcVTf42ugMen2LAlOT8Z5/bUsQcqDV1/8GZkSHkpeBrgjHrbtBa4iObxA4E4ouDRtzX0jIDXxjwZ9fB3kmzE7zIbpm9JfBiYT1NBWDc9byRhPoWKNV5kOd9GdfrpjG98FjM/uC5BP1uUdF+Fx0KNv5hFrzn/LhRi776Dp9Mg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729885051; c=relaxed/simple;
	bh=CQu58hzvCp4hTahhRSI7xM5RitSr9lxD2tgXIFOR0m0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OHzBOwLiwi1PfWfGYlxp8VS9KD9qdWJhrXnjW4h6HX4GASN6yMStQivYfH8Pddv81qM2vDvIeVOtX5Wk0SmY6Ct3iDIpNGuEsm7W0OgkNrKvgRGA3d19mfwnvZn5n3dbG+Tfagk6AgjRBC5E1ghB+o0D3JwMmLmSksMQxbmA07E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=o1oPLgNu; arc=none smtp.client-ip=209.85.219.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qv1-f65.google.com with SMTP id 6a1803df08f44-6cbe90c7c95so15439196d6.1
        for <linux-usb@vger.kernel.org>; Fri, 25 Oct 2024 12:37:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1729885047; x=1730489847; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=l1CwuhjRlk0yWrXJ4WpnS9LQVRVK88hgqs4+2FmCb2I=;
        b=o1oPLgNuQm2R+3vQnz/JkGhG18/gQJpHEgdSa4GoVAKOM/yQIwrX2lZwNaB1LR2t1U
         qk8iEH1SmcpWv1oGb8qVKZnPHpZ1Wllos7tAGCeK4AfiqFG2xQHYLoSuXOz8n4dTPQWx
         i32SG/BgxtoIK1YEGgZUufUgz78cTgnEE2DgRkCU5PNViUgBekppKsb7/kmJArAgru5C
         ZcVI4WVOn9pAhITZLPl9eeLGfgL49oS3WoTwi78yKCjkE13E6q6FDTWQAGmHdYK1KpB+
         y6SNHq6nQ3XECLdqZWNvh4dZFtuZbYwOX9UCZnaU49psKNyTAiIC5txm3qQ3J4khjC+O
         8THg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729885047; x=1730489847;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l1CwuhjRlk0yWrXJ4WpnS9LQVRVK88hgqs4+2FmCb2I=;
        b=YV/x1uD5grCM+trDpAML6vg627sSx/hcDq7PEz15ujK/LwZAYr8NoiA06mSCt5sW1q
         j4EJ1+Y6+BM9qOG4ui18lFKpKm7m9bl2zZct+pXbrCAWFKy2R6ZQ4hbk8hYHcx4fwiEi
         baQ8cXQcR3nQifjKIHzJz+U+n5nJwePaIKU4YcGWa6+NvS2p5k22TsMPlwHZ4S6g6kav
         tJ+TIhMqjun9y5Y8Ibvlow8D5S+0QVwaxERBoHKmMs10ngSUIhPsEAIabN8boSHWN7dM
         USZnZh0aX3KX+SSQ+x+0PlpkOdUxPnDcjR00Ejcdc2zQPKDAU15txhJ9kjYG9rFBZFbD
         8XQQ==
X-Gm-Message-State: AOJu0YwVuTuZ8fLEU/0XjxDz4rE7bTylGzCJLJoL3qdf1ZtY+WPnK3AX
	/lTnMV997FjOnQhbDIjCsh1boECfsRbsGeeZbSGr62VSZSNl1F+HSP4FmrpGdxQhAUL3a4QeYnS
	58pnP
X-Google-Smtp-Source: AGHT+IGODvgJN6NOyvsWI0/VbPJpZx0M9wGaQKYIDeT2H5nRbJHp4cjnZpn62D7s5C/1rIfDCfQYMw==
X-Received: by 2002:a05:6214:398c:b0:6ce:1011:60c1 with SMTP id 6a1803df08f44-6d185849638mr5699486d6.35.1729885046832;
        Fri, 25 Oct 2024 12:37:26 -0700 (PDT)
Received: from rowland.harvard.edu ([2607:fb60:2501:2805:c6d5:fe22:7fa3:ec54])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6d17972f538sm8544706d6.27.2024.10.25.12.37.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Oct 2024 12:37:26 -0700 (PDT)
Date: Fri, 25 Oct 2024 15:37:24 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Bart Van Severen <bart.v.severen@gmail.com>
Cc: linux-usb@vger.kernel.org
Subject: Re: usb: gadget: automatic remote wakeup on hid write
Message-ID: <6daafbf9-5999-463b-9198-cd699deb6721@rowland.harvard.edu>
References: <CAOLjEn56gcrBLYqmtAPY49wpZCUzuKAGSt+L2ADBpAEELoQ1TQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAOLjEn56gcrBLYqmtAPY49wpZCUzuKAGSt+L2ADBpAEELoQ1TQ@mail.gmail.com>

On Thu, Oct 24, 2024 at 11:37:50AM +0200, Bart Van Severen wrote:
> Hi,
> 
> We have a use case to remote control a pc through a composite gadget
> consisting of keyboard, mouse and tablet functions.
> The problem we face is that when the pc is sent to sleep, we cannot
> wake it by writing to the hid device, which is what you
> would expect to work.
> 
> We're running on Xilinx Zynqmp soc/DWC3 290A.
> 
> We have set the bmAttributes ch9 USB_CONFIG_ATT_WAKEUP bit and do see
> the set_feature request to enable remote
> wakeup, just before the pc goes to sleep.

Do you see a wakeup request from the gadget to the host?

> We noticed the recent relevant work
> https://lore.kernel.org/linux-usb/1679694482-16430-1-git-send-email-quic_eserrao@quicinc.com/,
> regarding function suspend/resume and remote wakeup improvements.
> 
> However, the main question we have is: what would be the right place
> in the gadget framework to fix the issue where a hid write
> doesn't trigger a remote wake up when the usb device is suspended and
> the host has enabled remote wakeup.

Probably the drivers/usb/gadget/function/f_hid.c file.  I don't know 
anything about how this gadget driver works, but the file doesn't have 
any calls to usb_gadget_wakeup(), which means it won't generate a wakeup 
request no matter what you write to it.

Alan Stern

> Some further context:
> DWC3_DEVICE_EVENT_LINK_STATUS_CHANGE are disabled by default
> (https://github.com/torvalds/linux/commit/799e9dc82968c66d6f8faf96d0bd01e515b0b2f2#diff-5e9721ccc2bd0a326d3b1a8cbcd9d91130774b1a7d06533c39074ad67aee7e96L1540),
> so dwc3 gadget driver isn't interrupted when host goes to sleep, but
> it does get DWC3_DEVICE_EVENT_WAKEUP when it wakes up.
> So the gadget device in turn is not suspended when the pc goes to sleep.
> 
> dwc3_send_gadget_ep_cmd does issue __dwc3_gadget_wakeup when cmd is
> DWC3_DEPCMD_STARTTRANSFER.
> It has no provision for doing the same when cmd is DWC3_DEPCMD_UPDATETRANSFER,
> which is our current patch to make it work in a pragmatic way.
> 
> Sorry if the mail format isn't what you normally expect, this is my
> first time posting...
> 
> Br,
> 
> Bart Van Severen
> 

