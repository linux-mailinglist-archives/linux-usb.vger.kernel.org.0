Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2C04B267D31
	for <lists+linux-usb@lfdr.de>; Sun, 13 Sep 2020 03:53:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725909AbgIMBxY (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 12 Sep 2020 21:53:24 -0400
Received: from out5-smtp.messagingengine.com ([66.111.4.29]:48909 "EHLO
        out5-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725907AbgIMBxX (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 12 Sep 2020 21:53:23 -0400
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
        by mailout.nyi.internal (Postfix) with ESMTP id C37B25C0087;
        Sat, 12 Sep 2020 21:53:21 -0400 (EDT)
Received: from imap21 ([10.202.2.71])
  by compute7.internal (MEProxy); Sat, 12 Sep 2020 21:53:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aeam.us; h=
        mime-version:message-id:in-reply-to:references:date:from:to
        :subject:content-type; s=fm2; bh=oPa7XLkI6WiPcJcuZjd0/bS0skdnAIK
        soVQeM65v58c=; b=A0LuhLe3oAIYwxrfU1iCvHNzirISVePRyedfa8zj57ovMyp
        quslROinGe+nk6nT2ok+v+gIPar+6HrCKDtt14gfLg7VydlYvq2N8bhi1Xl4EMcJ
        LGzLwG+6WWIt3VYK2Lkd87Eg3BpaoNsUQAcXdjMKg410R4i5EjRD7hXf/tTw88v7
        VotKjnA7cAg1EIZC4OZD2CefDfhtkMxSmX/wF/+4o/bsJ0FaoRcKu+o2z1ubHNvu
        C4EnbnJnEOuKvEiqbTaN8IPRtSA/bt/vCG66N+n9S0iEyoV4pMFF1NxaryYl8pqZ
        sXPDYkoWFeZVUZ+L2mEFfM5+TLxnABxUb6aiLOg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=oPa7XL
        kI6WiPcJcuZjd0/bS0skdnAIKsoVQeM65v58c=; b=UGpE4Z76+HKpM8XdkKVkLZ
        wL3AxZd9nWIelsMSS2DVrXgxAJtSWqymdSMJ1hfACIlijyKYJLA3nNjyD46aZRK4
        EsWbuwXYzHNJRngku6SPWaJZZQgP3NO2Mv+IHAw2IQ4shXSzSZ5ik+nO+ZBLpkd8
        byisdyJftVe8KcCyOAiXLWqyL+8jc+oh3TpenaOusAyOBSbgrqJ6RXHVAGEJNrEG
        qtpObzwTVAO49JG0PLFxhcZ2+kWFciK/rF+wsoOIsGv3SvH91lVcv4fmSmIUGYgi
        NQV/ztIHS3chGVx0WZRdsYDUJKniLBiqTyCHlKDksKQ/ivgiuX6vLIFreAQcelbg
        ==
X-ME-Sender: <xms:kXtdX20Wb9zfArItrbR895PXXENKn4paGhYEnkHLtWuwrYLlxLBVdg>
    <xme:kXtdX5GW5CMsklimSTtd9y-g9F2fNooaOXj16WUICwTBhvEX7bvjzaM2Mjft7VP6K
    mKYLwDY7wg7mkiMWN8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedrudeivddghedvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvffutgesthdtredtreerjeenucfhrhhomhepfdfuihgu
    ucfuphhrhidfuceoshhiugesrggvrghmrdhusheqnecuggftrfgrthhtvghrnhepgeeftd
    dtgfduffdvgedugeelkeeljeefueehhfejgefhfedvkeevueffgfeivdevnecuvehluhhs
    thgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepshhiugesrggvrghmrd
    hush
X-ME-Proxy: <xmx:kXtdX-65pip6y8bTlSR7yY2wPJBoftOLfuo-GlJkGFjnB5xhJ7QvJw>
    <xmx:kXtdX31qVAT90lpk12h2LOhjFKC6fJNmO8_hamKk9-n7EZzZTSktXQ>
    <xmx:kXtdX5FpHX2uEuK4s4uEtr79iVv2ga_C8I26E5hNizbkwoje6JFyCQ>
    <xmx:kXtdX4yqtNuwpIa2m23jZtJBL3iZihD4bZqujUBMQdyOxsQsfRH0dA>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
        id D66DE660069; Sat, 12 Sep 2020 21:53:14 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.3.0-259-g88fbbfa-fm-20200903.003-g88fbbfa3
Mime-Version: 1.0
Message-Id: <68a12712-8582-42f5-b49f-6031a7dc5f59@www.fastmail.com>
In-Reply-To: <87a6yjjnwy.fsf@kernel.org>
References: <508e531e-076d-4b02-8aac-783842346bc2@www.fastmail.com>
 <87ft8ck1qx.fsf@kernel.org>
 <d22c16f3-9fb2-4dd2-b511-5f2b5a975d6b@www.fastmail.com>
 <87a6yjjnwy.fsf@kernel.org>
Date:   Sat, 12 Sep 2020 20:53:00 -0500
From:   "Sid Spry" <sid@aeam.us>
To:     "Felipe Balbi" <balbi@kernel.org>, linux-usb@vger.kernel.org
Subject: =?UTF-8?Q?Re:_mkdir_acm.${name}_in_configfs_always_fails_with_"Device_or?=
 =?UTF-8?Q?_resource_busy"?=
Content-Type: text/plain
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Aug 25, 2020, at 12:27 AM, Felipe Balbi wrote:
> "Sid Spry" <sid@aeam.us> writes:
> 
> > On Mon, Aug 24, 2020, at 1:16 AM, Felipe Balbi wrote:
> >> 
> >> Hi,
> >> 
> >> "Sid Spry" <sid@aeam.us> writes:
> >> > See title. I'm getting this even when using shell commands, so I don't
> >> > think it is my program.  Creating anything else, like ncm.usb0, will
> >> > work.
> >> 
> >> which kernel version? which usb controller? which platform?
> >> 
> >
> > Kernel 5.4.45 compiled for a Raspberry Pi 4, the UDC is a DWC2.
> 
> great. Latest v5.4 stable is v5.4.60. There have been a few fixes in
> dwc2 and gadget drivers between .45 and .60. Just to rule out a problem
> that was already fixed, could you merge v5.4.60 to your kernel and try
> again?
> 
> > On another device (Allwinner based) I could add one serial gadget
> > but not two, and I though this may have been endpoint exhaustion. Now
> > I am not so sure.
> 
> It could exhaustion of Interrupt-capable endpoints. It depends on how
> the gadget and the UDC were configured.
> 

Should have been obvious, but yes, this fixes it. Thanks.

In meantime have been finding a bunch of other behavior I can *explain*
but definitely feel is weird, so will try talking about that on list.
