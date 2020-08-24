Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9EA6A250936
	for <lists+linux-usb@lfdr.de>; Mon, 24 Aug 2020 21:26:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726303AbgHXT0I (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 24 Aug 2020 15:26:08 -0400
Received: from wout2-smtp.messagingengine.com ([64.147.123.25]:43877 "EHLO
        wout2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725976AbgHXT0H (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 24 Aug 2020 15:26:07 -0400
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
        by mailout.west.internal (Postfix) with ESMTP id 3F0AEC18;
        Mon, 24 Aug 2020 15:26:06 -0400 (EDT)
Received: from imap21 ([10.202.2.71])
  by compute7.internal (MEProxy); Mon, 24 Aug 2020 15:26:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aeam.us; h=
        mime-version:message-id:in-reply-to:references:date:from:to
        :subject:content-type; s=fm2; bh=NSoVj/FZBFVo6u4kmXgVHCuJA83lXdg
        hkQMVgtIx3TI=; b=E/0bEDwL5cwWAMdRuEOz2dEMnwHmHa+ZcqpVOmzKUHrZOul
        U20ivkvwzDLmk3LKHvf1n4L7CxNgb6AHm8DcPkRDUrIJe6HoiNGRAoqD3mxhIJMt
        MFJ3U1VjSCUl96ACCwFwkBhl1Aw/PCiX89d5dQNMQ0bjLz4kbotoojzRAcWbnPWp
        eRDB643HADSKdyFM6DVEB0fvI0dYUX73ir9oKpmq8SLpWqKsfbpL4aJN+MK/40GF
        cFC4ucQ97RcjQL/Kwe86oPWRdrfiUFHHguWNUnb264WrdctoasFwTwUV7KSxYMME
        pJH8RS8kuSkUe5+NyTvmY4JjpqX6ZdpuNVU5ppg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=NSoVj/
        FZBFVo6u4kmXgVHCuJA83lXdghkQMVgtIx3TI=; b=GlUJfeabdSsQC5Tx5bRJbz
        VdEYN1KPEmrHy2RugGlxanYIeiS2gz+kYdgSP/Vh3OSTyygDkdx404MaPvMEQBam
        p8LjhqH+hWSQ3eNumjSlBNVlSSvZFIvi11PjFhYtr4JroC1RkiwoIRBmli2gOTnu
        6x8VZ6y8G6+IP6sLm/3XwLEAUjtQgcGlUD7DIpcdFg0mwHIvV7X0ahAaoELABWgg
        bBF6Vdh+4gjWyIZv3PDaPoCI1giycjQekUIthNuV3NFb0wqKp+BJA093qC6yEOMr
        ucREuWCBRSoez1VsDzjbcE6mk6jnsYe4o45G7gYiN3cdf12Q9YAwppgEOLAnJC8w
        ==
X-ME-Sender: <xms:TRREX9plrwjQT_yP6JdqQEbizueDrRsZ5ku_BsTQcKftyZtNGh92UQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedruddukedgkedvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvffutgesthdtredtreerjeenucfhrhhomhepfdfuihgu
    ucfuphhrhidfuceoshhiugesrggvrghmrdhusheqnecuggftrfgrthhtvghrnhepgeeftd
    dtgfduffdvgedugeelkeeljeefueehhfejgefhfedvkeevueffgfeivdevnecuvehluhhs
    thgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepshhiugesrggvrghmrd
    hush
X-ME-Proxy: <xmx:TRREX_pVHoGEVrDM6EHF-PAO07zuv0-PEe01XXkMPxGvlfPKZHATYg>
    <xmx:TRREX6OPAUGuER4cRLKIXgFCzjDRNmJXngP7MAPPqPbFxdZAhHI7JQ>
    <xmx:TRREX44G3h0mh4PZw0-E1k8vGWSemfDXJRd9gpyTVXzRD9IF0irB-w>
    <xmx:TRREX-HxsLn9I8hH6TWZzCfXjPA43PcmJICXeOG65M1-3IhasnNGiQ>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
        id BB6CC660069; Mon, 24 Aug 2020 15:26:01 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.3.0-214-g5a29d88-fm-20200818.002-g5a29d882
Mime-Version: 1.0
Message-Id: <d22c16f3-9fb2-4dd2-b511-5f2b5a975d6b@www.fastmail.com>
In-Reply-To: <87ft8ck1qx.fsf@kernel.org>
References: <508e531e-076d-4b02-8aac-783842346bc2@www.fastmail.com>
 <87ft8ck1qx.fsf@kernel.org>
Date:   Mon, 24 Aug 2020 14:25:45 -0500
From:   "Sid Spry" <sid@aeam.us>
To:     "Felipe Balbi" <balbi@kernel.org>, linux-usb@vger.kernel.org
Subject: =?UTF-8?Q?Re:_mkdir_acm.${name}_in_configfs_always_fails_with_"Device_or?=
 =?UTF-8?Q?_resource_busy"?=
Content-Type: text/plain
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Aug 24, 2020, at 1:16 AM, Felipe Balbi wrote:
> 
> Hi,
> 
> "Sid Spry" <sid@aeam.us> writes:
> > See title. I'm getting this even when using shell commands, so I don't
> > think it is my program.  Creating anything else, like ncm.usb0, will
> > work.
> 
> which kernel version? which usb controller? which platform?
> 

Kernel 5.4.45 compiled for a Raspberry Pi 4, the UDC is a DWC2.
Apologies.

On another device (Allwinner based) I could add one serial gadget
but not two, and I though this may have been endpoint exhaustion. Now
I am not so sure.
