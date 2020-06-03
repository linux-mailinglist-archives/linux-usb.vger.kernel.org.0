Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C7DFC1ECFA5
	for <lists+linux-usb@lfdr.de>; Wed,  3 Jun 2020 14:19:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725936AbgFCMT0 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 3 Jun 2020 08:19:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36164 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725881AbgFCMTZ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 3 Jun 2020 08:19:25 -0400
Received: from smtp.domeneshop.no (smtp.domeneshop.no [IPv6:2a01:5b40:0:3005::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6C85BC08C5C0
        for <linux-usb@vger.kernel.org>; Wed,  3 Jun 2020 05:19:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tronnes.org
        ; s=ds201912; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
        MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=4khiMqQn+FxsRP2db57R3G3VwI/nY+0fbVRJvI9zgsQ=; b=Q4jo4uCO68pzoHigMQQS7t16pd
        H/ZEPBCsKMcBRtbG+KE6mhAJiTQuPYQTnSeLhIPyfThAaOIYprxMYkNfvVK3GNnaOawROiSmMZg+c
        YJ5gMvSrSPUvyyO0hFVQZIyHUmTkl3Y3qXZt1lZIixauj1ysPKP/sEnEIEdFY3QtyG3bG6B5rMPih
        rl9M89ARQhbBVWz8Ik9hVs3/4291adVQtHDxRxETlAMdgVYwdR7JVIiqdXcotWqesFH4JYP4Se9Oe
        btlGtd0Mf6WAF2Ghy3SyyZPFUyejMIUyOaPVHRUJHoz2tQkzuaSgYd1sV3rdiAnaoRwWaa9vC6Tp0
        6dL684+A==;
Received: from 211.81-166-168.customer.lyse.net ([81.166.168.211]:12043 helo=[192.168.10.61])
        by smtp.domeneshop.no with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.92)
        (envelope-from <noralf@tronnes.org>)
        id 1jgSMc-0004DT-Pq; Wed, 03 Jun 2020 14:19:22 +0200
Subject: Re: [PATCH v2 03/10] drm/client: Add drm_client_framebuffer_flush()
To:     Emil Velikov <emil.l.velikov@gmail.com>
Cc:     ML dri-devel <dri-devel@lists.freedesktop.org>,
        linux-usb@vger.kernel.org, Lee Jones <lee.jones@linaro.org>,
        Jingoo Han <jingoohan1@gmail.com>,
        Daniel Thompson <daniel.thompson@linaro.org>,
        Sam Ravnborg <sam@ravnborg.org>
References: <20200509141619.32970-1-noralf@tronnes.org>
 <20200509141619.32970-4-noralf@tronnes.org>
 <CACvgo51Cq1ipV_K-NLk9QZ7d1Pweebz2ST6anqrT1q09r0+QEw@mail.gmail.com>
From:   =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
Message-ID: <61eba989-4a3d-9208-5e5c-1fb587a36cb6@tronnes.org>
Date:   Wed, 3 Jun 2020 14:19:21 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.1
MIME-Version: 1.0
In-Reply-To: <CACvgo51Cq1ipV_K-NLk9QZ7d1Pweebz2ST6anqrT1q09r0+QEw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org



Den 28.05.2020 15.48, skrev Emil Velikov:
> Hi all,
> 
> I realise this has landed, so a small FYI comment.
> 
> On Sat, 9 May 2020 at 15:16, Noralf Trønnes <noralf@tronnes.org> wrote:
> 
>> +int drm_client_framebuffer_flush(struct drm_client_buffer *buffer, struct drm_rect *rect)
>> +{
>> +       if (!buffer || !buffer->fb || !buffer->fb->funcs->dirty)
> 
> Hmm cannot think of a good reason why anyone would call this with
> !buffer || !buffer->fb?
> Might be a good idea to WARN in those cases - otherwise the user is
> given false sense to security.
> 

I agree, I'll send a fixup when I get through my backlog.

Noralf.

> Looking at the upcoming user (drm/gud) it already has both - so it's
> perfectly safe.
> 
> -Emil
> 
