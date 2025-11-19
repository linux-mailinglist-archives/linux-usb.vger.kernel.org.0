Return-Path: <linux-usb+bounces-30673-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 26453C6CAD4
	for <lists+linux-usb@lfdr.de>; Wed, 19 Nov 2025 05:09:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 9E35735B627
	for <lists+linux-usb@lfdr.de>; Wed, 19 Nov 2025 04:09:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C8143271A9A;
	Wed, 19 Nov 2025 04:09:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="tfHycg37"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D870F9D9
	for <linux-usb@vger.kernel.org>; Wed, 19 Nov 2025 04:09:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763525377; cv=none; b=ttJoHlB3I4xpdTirIE0xwVZH+XDyVdvNmdPdhGtqS4WL0Oq/iikKYrgAWuWZpIDBPXRzfTlaR8MlsmaK2GT9EUKA5DW0fVuVysZ/9pJWNE9xU9QpGwPQip3/J/xVARjmu9av8N/rilA0ZnBHHl07/XFWpg8YCdyJidw732YwqRA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763525377; c=relaxed/simple;
	bh=HgC/efy+sZRCqXS6s9L8AlS/v6ijUSAiHNJR1aHlUqc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n4h76xyxSmgLRD6iIVk7pqnROnauIWgzYXuRp1TyGw5h0D2wNqT8OpEDM6A3VkSAp2nJ3tX9R6zKLWxtDpMvwUljWK5OQ7nsAHnCO6b07maYxXaGaR/sIjugqoFQQZzcz6Hb6Oxahzo3ZljtohKtRGcdOYyJJ0dWtC0813Ytzlo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=tfHycg37; arc=none smtp.client-ip=209.85.219.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-88056cab4eeso47940386d6.2
        for <linux-usb@vger.kernel.org>; Tue, 18 Nov 2025 20:09:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1763525374; x=1764130174; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=pyos3QdG31i05Qnv8lN51cvzL0YrYJwG7uMU7FrbGgA=;
        b=tfHycg37d29EeqoCi30XnlW/wvmmzOWfRvobTHeV9drcuAhlAUB815L7pKkm+4OZq1
         vj21VTwA3jAlHH5ifVJZ28kZBqYMFNCk4ZPHe/keHTKIsQ3zSxz4yu082qsbq3ZvVHOi
         x239I0aGiHuCTls4SL49hbzSKR6CVaBtZ+9l11bcWk7s6lYEjMcTlm7OdSGbZL1L0we2
         RFi9KNQCPtNBOrSssDkEwq/fihHr4EzMovj0m1Qf7p+gc9/5zyYfje/99jyJh7oy5Bd5
         UTKj6jHI+x9O7jMmlF90hfIejuVcswvq3K+HPOSzkHLG+IcwCq6UA1qjQkcT2yNGgx6k
         tkNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763525374; x=1764130174;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pyos3QdG31i05Qnv8lN51cvzL0YrYJwG7uMU7FrbGgA=;
        b=dmd2VYdqZ+5Xnmo6GyfD5GXOH2lm5kLjvcCYFyZwhUJZnCdfqDfA4APjVXYu8Q5hqS
         y7hPNxbAAjksljyjkRW0Pys6yZGG7KWn/Bbqp0BytrTMcOX0dudT6nPf4uldqAzC6IF0
         xMqdAEKBfvdKhaS4gKFOQMfEGwyYLzWgfEK3LPPCaFUCFUCWvffIZeasaiPb4AXAM9wD
         R+Ut0tSgdFmh230fhA69Hf3l7NI5GOH8BQqL+OBFCflp3tUHh2Uptlqv1ayhrpQoeHmM
         2XYSzcT8HgZgsZArf+x73WuyXgx6L7g54jldNg1xoPV327Z/UWYpEKVb5N0qeTEYXYgE
         O8bg==
X-Forwarded-Encrypted: i=1; AJvYcCXrjOtUdJkR0tfc+MsKxKJ7hgkPNN/rQ4u2X0OlZSfoZRtgMga1WNOna0+Tr+obsM0nRq/6T5Sm/uI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5/PajSlB81djdgXqSSgkXE2knk/cx2pdSiWCR53qk1sGdSGLr
	CEtYEfwvyqPNqqu1+Oc1Tk1VI48opHm85rMbMmANllb2CxcDiiQNDP6XLmJa+Tjzyw==
X-Gm-Gg: ASbGncskiZA8ynAOitrveDWWfFbQpp6Em+/82h9wgN0befslCqHm29+craSxAbkn8C7
	yakGHfSMpvHd3SY+ueXPUVowplo8BndeTk26v1Fz58UqWCXwNSmmKUbVmVYkkY4RoDxh8VjRAkF
	j2JQqLrvh4dRXP2j1+zpQunWAZ6VBp1zUOTujwc6FkP5P2eX8OdsC1BQTHb44YL+4Xc4O2f4GUw
	E40a6W722QDbL8GfEdgfiW3M7SMYlcoNEWkNeGoIinPbCLLPqX9Jrluj2UBHT+Zp3mTJt1xPOud
	uA3+zHAmK3Aizb+x/mQaXPILKXkwwWgx3JsXAz9UuT9YWSdToRp59Wwc/JuqlqiHlmFf23ZKDAD
	Mm1FMhQ6AqvjtTydoTnbTob8qB+8hfeuR3ZhZmeKltpzbQDqG6sqe+WX13Z350/2ANl9n7pPKZ/
	uHQ2+ej6Q9TxhdELu7wvm8WQU=
X-Google-Smtp-Source: AGHT+IF7DEPCAC+BGqbJKSk4IPt6GQ7vQExhSx5RGt5NZqaXxsTrtRBDCBmfMPe8p1ctavjJf/1hmA==
X-Received: by 2002:a05:6214:2623:b0:880:4bde:e0cb with SMTP id 6a1803df08f44-882925ff072mr246281336d6.29.1763525374380;
        Tue, 18 Nov 2025 20:09:34 -0800 (PST)
Received: from rowland.harvard.edu ([2601:19b:d03:1700::7632])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-88286314656sm126013906d6.21.2025.11.18.20.09.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Nov 2025 20:09:33 -0800 (PST)
Date: Tue, 18 Nov 2025 23:09:30 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: Selvarasu Ganesan <selvarasu.g@samsung.com>,
	"gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"jh0801.jung@samsung.com" <jh0801.jung@samsung.com>,
	"dh10.jung@samsung.com" <dh10.jung@samsung.com>,
	"naushad@samsung.com" <naushad@samsung.com>,
	"akash.m5@samsung.com" <akash.m5@samsung.com>,
	"h10.kim@samsung.com" <h10.kim@samsung.com>,
	"eomji.oh@samsung.com" <eomji.oh@samsung.com>,
	"alim.akhtar@samsung.com" <alim.akhtar@samsung.com>,
	"thiagu.r@samsung.com" <thiagu.r@samsung.com>,
	"stable@vger.kernel.org" <stable@vger.kernel.org>
Subject: Re: [PATCH v2] usb: dwc3: gadget: Prevent EPs resource conflict
 during StartTransfer
Message-ID: <d53a1765-f316-46ff-974e-f42b22b31b25@rowland.harvard.edu>
References: <CGME20251117160057epcas5p324eddf1866146216495186a50bcd3c01@epcas5p3.samsung.com>
 <20251117155920.643-1-selvarasu.g@samsung.com>
 <20251118022116.spdwqjdc7fyls2ht@synopsys.com>
 <f4d27a4c-df75-42b8-9a1c-3fe2a14666ed@rowland.harvard.edu>
 <20251119014858.5phpkofkveb2q2at@synopsys.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251119014858.5phpkofkveb2q2at@synopsys.com>

On Wed, Nov 19, 2025 at 01:49:12AM +0000, Thinh Nguyen wrote:
> On Mon, Nov 17, 2025, Alan Stern wrote:
> > > Hi Alan,
> > > 
> > > Can you help give your opinion on this?
> > 
> > Well, I think the change to the API was made because drivers _were_ 
> > calling these routines in interrupt context.  That's what the commit's 
> > description says, anyway.
> > 
> > One way out of the problem would be to change the kerneldoc for 
> > usb_ep_disable().  Instead of saying that pending requests will complete 
> > before the all returns, say that the the requests will be marked for 
> > cancellation (with -ESHUTDOWN) before the call returns, but the actual 
> > completions might happen asynchronously later on.
> 
> The burden of synchronization would be shifted to the gadget drivers.
> The problem with this is that gadget drivers may modify the requests
> after usb_ep_disable() when it should not (e.g. the controller may still
> be processing the buffer). Also, gadget drivers shouldn't call
> usb_ep_enabled() until the requests are returned.

No, they probably shouldn't, although I don't know if that would 
actually cause any trouble.  It's not a good idea, in any case -- 
particularly if the drivers want to re-use the same requests as before.

The problem is that function drivers' ->set_alt() callbacks are expected 
to do two things: disable all the endpoints from the old altsetting and 
enable all the endpoints in the new altsetting.  There's no way for any 
part of the gadget core to intervene between those things (for instance, 
to wait for requests to complete).

> > The difficulty comes when a gadget driver has to handle a Set-Interface 
> > request, or Set-Config for the same configuration.  The endpoints for 
> > the old altsetting/config have to be disabled and then the endpoints for 
> > the new altsetting/config have to be enabled, all while managing any 
> 
> Right.
> 
> > pending requests.  I don't know how various function drivers handle 
> > this, just that f_mass_storage is very careful about taking care of 
> > everything in a separate kernel thread that explicitly dequeues the 
> > pending requests and flushes the endpoints.  In fact, this scenario was 
> > the whole reason for inventing the DELAYED_STATUS mechanism, because it 
> > was impossible to do all the necessary work within the callback routine 
> > for a control-request interrupt handler.
> > 
> 
> If we want to keep usb_ep_disable in interrupt context, should we revise
> the wording such that gadget drivers must ensure pending requests are
> dequeued before calling usb_ep_disable()? That requests are expected to
> be given back before usb_ep_disable().
> 
> Or perhaps revert the commit above (commit b0d5d2a71641), fix the dwc3
> driver for that, and gadget drivers need to follow the original
> requirement.

Function drivers would have to go to great lengths to guarantee that 
requests had completed before the endpoint is re-enabled.  Right now 
their ->set_alt() callback routines are designed to run in interrupt 
context; they can't afford to wait for requests to complete.

The easiest way out is for usb_ep_disable() to do what the kerneldoc 
says: ensure that pending requests do complete before it returns.  Can 
dwc3 do this?  (And what if at some time in the future we want to start 
using an asynchronous bottom half for request completions, like usbcore 
does for URBs?)

Let's face it; the situation is a mess.

Alan Stern

