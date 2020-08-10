Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 51F74240AEB
	for <lists+linux-usb@lfdr.de>; Mon, 10 Aug 2020 18:01:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727896AbgHJQBm (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 10 Aug 2020 12:01:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41380 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726720AbgHJQBm (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 10 Aug 2020 12:01:42 -0400
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1AF83C061756
        for <linux-usb@vger.kernel.org>; Mon, 10 Aug 2020 09:01:42 -0700 (PDT)
Received: by mail-wr1-x435.google.com with SMTP id a15so8661684wrh.10
        for <linux-usb@vger.kernel.org>; Mon, 10 Aug 2020 09:01:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=message-id:date:from:user-agent:mime-version:to:cc:subject
         :references:in-reply-to:content-transfer-encoding;
        bh=TDpOMHly03XIpe97gA3VRcmOBP2T7XSh9D1jyRNFDlw=;
        b=aoqLuUZhRksq6iCvJoQHd+nj0xxwDXJ8Uk/04EYOgvdrl2PgUhv59pyyXXC/Ex1V/c
         CzQbtFb0EsevI0HJirIr7S6iiBkPjJchRFaCNAzevjuy7AvtCA+hFZ2HrSjdA1fpS+Sc
         QuG3UVEDONDINltutduqDlOWd73T9+hNnAELfYWttsWAAhnoJ5GA2hmNqIOui2MqNBV8
         VyEASmuV9wI54d1m9ZkFdM2rzzRvLLzONJIlzbo1WzgvNm945UOa39yGpGCITVu3G0NG
         Pzk1HmcWkL4x4WmBWLPwAAPBK4Wj+5/zdEwI1uvnBG4Odylptcr5oUKv1DSvi8EWMH6V
         zhpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:from:user-agent:mime-version:to
         :cc:subject:references:in-reply-to:content-transfer-encoding;
        bh=TDpOMHly03XIpe97gA3VRcmOBP2T7XSh9D1jyRNFDlw=;
        b=gzRVKbK5dQ5QNG2Pro6F5NN2hPCET6wa9h6gHXQnwwo88MaXYvdqAnv4v1GUFVQ4tx
         LSJ8/wNZRB1Bs3VIfDfz8vWrn39fIi4aWBomUgAOKG+xpeZ9//MrXGijUMD8ph1bj5B5
         rbvg2XKzRaWGgLr0awjDGzClrMH+rP9bjlFbv1AZjSzfbUsM014cZ8zyRk9E3YZuCV3R
         Jm3Low1G7xw84Zs1xPA9qp23cqglzF0/MlRU5lL8GKD9V0jKGodbyB9I/jRtLHkEGiI4
         g3v0MjBeFy6yoHxdQP8FBHozJDtr0YjBJufnaBVoEfK5u2x/4UNirivuHpdYlxtX7tld
         ORKw==
X-Gm-Message-State: AOAM533rjFLx8wVOVFLg8+5BWCKQX8+wWF6r3pIfyw/l57kRHqP3ZmzX
        vIgmD1E1+dfIMk0GYqSDt3T3UjMJ
X-Google-Smtp-Source: ABdhPJx3C412XbUbN+e0mZQudWiQ+YH1fnSuoGkRH4IuBfsqw6b++2CpU6A9tZdVddqNZzkudvEhPA==
X-Received: by 2002:adf:a106:: with SMTP id o6mr25370613wro.1.1597075299596;
        Mon, 10 Aug 2020 09:01:39 -0700 (PDT)
Received: from [46.117.37.149] (46-117-37-149.bb.netvision.net.il. [46.117.37.149])
        by smtp.gmail.com with ESMTPSA id 128sm22130690wmz.43.2020.08.10.09.01.38
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 10 Aug 2020 09:01:38 -0700 (PDT)
Message-ID: <5F316F60.5090506@gmail.com>
Date:   Mon, 10 Aug 2020 19:01:36 +0300
From:   Eli Billauer <eli.billauer@gmail.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US; rv:1.9.1.12) Gecko/20100907 Fedora/3.0.7-1.fc12 Thunderbird/3.0.7
MIME-Version: 1.0
To:     Oliver Neukum <oneukum@suse.com>
CC:     Alan Stern <stern@rowland.harvard.edu>, linux-usb@vger.kernel.org
Subject: Re: [RFC]mooring API
References: <1596722827.2488.8.camel@suse.com> <5F2C2C74.8000104@gmail.com> <1597070349.2515.6.camel@suse.com>
In-Reply-To: <1597070349.2515.6.camel@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 10/08/20 17:39, Oliver Neukum wrote:
>> To me the anchor API is great. If there is unclearances about its API, I
>> >  suppose docs would help. The fact that the URB is unanchored prior to
>> >  calling the completer is intuitive, so there's a clear benefit in that.
>>      
> But is it necessary? DO you ever move URBs between anchors?
>    
I don't think it's relevant what I would or wouldn't do. The question is 
if someone out there would do that. Without any guidelines saying it's 
explicitly disallowed, some will do it. Actually, even if there are such 
guidelines.
>    
>> >  This requires some ungraceful code where almost nobody's looking, but if
>> >  that makes the common programmer's life easier, I think it's a good deal.
>>      
> It would be, if the deal is necessary. In hindsight it still looks
> to me like completion should unanchor an URB.
>    
Once again, I'm not sure that matters so much anymore. The anchor API 
has been around for a while, and there are drivers using it. Adding 
another API will undoubtedly create some confusion. That's why I think 
that the question should be what is functionally flawed with the current 
API, and if that can be fixed.

Regards,
    Eli
