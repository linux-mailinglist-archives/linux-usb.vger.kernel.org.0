Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 589A338F9F9
	for <lists+linux-usb@lfdr.de>; Tue, 25 May 2021 07:36:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230494AbhEYFh1 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 25 May 2021 01:37:27 -0400
Received: from lb2-smtp-cloud7.xs4all.net ([194.109.24.28]:60813 "EHLO
        lb2-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230218AbhEYFh1 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 25 May 2021 01:37:27 -0400
Received: from cust-57f2be97 ([IPv6:fc0c:c196:c6c4:fdf1:aa47:ab6:e251:d2a8])
        by smtp-cloud7.xs4all.net with ESMTPSA
        id lPjMlomNbMajplPjOlRj72; Tue, 25 May 2021 07:35:57 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1621920957; bh=UFJ+h/zoNp6NTMwOK6Bm97RcwDXj9NHL9cxFuKzpOXI=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=KgH5UuBlPKL7pImIqK3imT+5fsRfMUqr7dNtPwh4W/XOmI7l82RWfGluwlFRNrEDU
         2YDMx7RTYs1EbqJ7T9+7S1Rub4pzJT2ZOWnMaETJF61HMzfDY8kM2vUjdc2Q9hgsNM
         0k6/VfvtA7eZHyYUzpYrvUmoSMYIfGK4HZTW6hHCYXhnsu/cJ4NeXhJ9FNNBLIQQaB
         vYtFH/7BatQH1tTg3Zgt8aSpqulG73YT2NuFYvbW04zoEmJBXyfKzmmwzxKqEaGVrv
         ggzDbpNRlbQxIaoK+WFso1F7SUCYDdCqc6tMEdD2TSfydmSGrIey1saNBwK+hD9OVz
         Ob8vxe5hL8sHg==
Subject: Re: 5.11.17: xhci_hcd 0000:0a:00.3: WARN Event TRB for slot 3 ep 12
 with no TDs queued?
To:     Mathias Nyman <mathias.nyman@linux.intel.com>,
        USB list <linux-usb@vger.kernel.org>
References: <18f75805-2538-476f-38bb-d3c6e1c2bf5e@xs4all.nl>
 <6a4c37df-8403-4026-6ff2-189ce1e87264@linux.intel.com>
From:   Udo van den Heuvel <udovdh@xs4all.nl>
Organization: hierzo
Message-ID: <758067a5-66e2-c979-ebf0-95c738283355@xs4all.nl>
Date:   Tue, 25 May 2021 07:35:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <6a4c37df-8403-4026-6ff2-189ce1e87264@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfPHLYzlHIePjbamEOQawCP3Kuv4YMW/RHcb+FOHu407KrvGi5M2Hx9/91JJGcsz+EtzfdIap2SWbrrFgo10A6nayfj+qsYryWkHH994scRdNsXf0+L46
 AqmYjzDKi6yGzj7V5dyWMsnj4y9lE9E9kjojKHqSyh0w0wcdtzwWALlxFx/ljqKWSrDOcQQLwMHcwXkGcmxyZRwfVsJYqLaBw2C9cavqxYBpdeXx7ZO7t82m
 d6vhKZejXxVFPWF+6zHeow==
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 03-05-2021 10:57, Mathias Nyman wrote:
>> When 5.11.17 gives me a load of:
>>
>> xhci_hcd 0000:0a:00.3: WARN Event TRB for slot 3 ep 12 with no TDs queued
>>
>> What happened?
> 
> Either your host is sending spurious events, or more likely this TD (transfer descriptor)
> was already handled and given back by driver due some event mid TD.
> Host still has this TD cached and generates events for last entry of TD after xhci driver gave it back.

It happened again without me really using USB. (i.e.: no plugging in/out 
of USB items)
Does that tell you anything?
The PC has USB keyboard/mouse, but also a connection to the USB hub in 
the monitor.

>> What can I do (to help) fix it?
> 
> First try 5.12 (just came out) It has some xhci driver changes in this area.

5.12.6 here...

I'll look into generating a trace.

Udo
