Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2AB262B4A5F
	for <lists+linux-usb@lfdr.de>; Mon, 16 Nov 2020 17:13:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730857AbgKPQM3 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 16 Nov 2020 11:12:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60692 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729729AbgKPQM3 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 16 Nov 2020 11:12:29 -0500
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com [IPv6:2a00:1450:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9F7F7C0613CF
        for <linux-usb@vger.kernel.org>; Mon, 16 Nov 2020 08:12:28 -0800 (PST)
Received: by mail-lj1-x242.google.com with SMTP id l10so20759566lji.4
        for <linux-usb@vger.kernel.org>; Mon, 16 Nov 2020 08:12:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=FPtPyzczxPJO9SgcEB+LVvnIsf0w5OPTvv5m71feBIs=;
        b=OnybyLLXcLZ8luM2hL35kacwzo1adIhAg0N9jNA1hKUsnIIL7luaugKhSn5e/YWP3y
         mYUu8Y5owQglcKVMnQrjBaCYDfxRU73hplBjcxQZyIvSoLqx8Uv3mOaJrOk7jOuZ2BIj
         znG5z4CVfszMbghnmEnTJErcBAo1vP2tNAe4Hxmga8Q4/WSPnXQ4IlSNa+zw5p/EayZr
         F3zksXn+BKPQ9nKEhaMNh6d0uQLZVS4x7sv4KgEwGfSh18ppM8hbf9UOpKJfcy6Uulcv
         obcN4zF79i5j54NxgVPYyEgUjj+1ynXSmo275vyTWy6iXViZTxcpekXzmHxq21XU4FR1
         T+vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=FPtPyzczxPJO9SgcEB+LVvnIsf0w5OPTvv5m71feBIs=;
        b=ZuyxKQnM8zCbTKGi8m391/JaKEk68nx+XRSiD9r99EvS7uYem7vVjIdivvVolQRFzS
         NElvMcpU0rlNkUaQPAyYpC3r+TQecnXoFayXB7BJf03vWAe09xQTH9SK5P4xOfhdx8Jd
         q0dsE1brZPYMUjMuZvEVC6U1iTFndmFo7EX012FKtYVyEPQ4SBuEUc6A/1LTLRCF2q+1
         uRFDn3o2RnFjqgkiE7rB4p8xQt4lkNHsAkFJhCoyxlR/ms2Mib92yu0xMPYaCw5Y8kWS
         +3AXa5ZdXXldIh6YzWHBQJoEtUgvFtM5VI36iYi5fOCraEvmIqjzi0EHh0riFZ5XmZCD
         VdTg==
X-Gm-Message-State: AOAM5333jGLWaq2+YvLkEUzdyAsLNmcTsZq/r0xxFRhst+JayJLsBp0/
        maxq7/IjY0EDjMbZAvxsy+46uWKpAkY=
X-Google-Smtp-Source: ABdhPJwyIPe+VgU6h3huBf/cXTcyURfTx9p+P+UW4BjBGIBUoLLXdMu1Ber1PzwQJihLaokK8cSQ7w==
X-Received: by 2002:a2e:88d7:: with SMTP id a23mr51194ljk.96.1605543147048;
        Mon, 16 Nov 2020 08:12:27 -0800 (PST)
Received: from ?IPv6:2a00:1fa0:482:c4fa:5fdc:9765:88c2:779? ([2a00:1fa0:482:c4fa:5fdc:9765:88c2:779])
        by smtp.gmail.com with ESMTPSA id g84sm2795976lfd.188.2020.11.16.08.12.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Nov 2020 08:12:26 -0800 (PST)
Subject: Re: [PATCH 1/2] usb: gadget: f_midi: Fix memleak in f_midi_alloc
To:     Zhang Qilong <zhangqilong3@huawei.com>, balbi@kernel.org,
        gregkh@linuxfoundation.org
Cc:     linux-usb@vger.kernel.org
References: <20201116121710.1546690-1-zhangqilong3@huawei.com>
 <20201116121710.1546690-2-zhangqilong3@huawei.com>
From:   Sergei Shtylyov <sergei.shtylyov@gmail.com>
Message-ID: <7f1144b7-3816-0779-f19f-d2ac6b012f1f@gmail.com>
Date:   Mon, 16 Nov 2020 19:12:25 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201116121710.1546690-2-zhangqilong3@huawei.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 11/16/20 3:17 PM, Zhang Qilong wrote:

> In the error path, if midi is not null, we should to

   That "to" not needed here.

> free the midi->id if necessary to prevent memleak.
> 
> Fixes: b85e9de9e818d ("usb: gadget: f_midi: convert to new function interface with backward compatibility")
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Zhang Qilong <zhangqilong3@huawei.com>
[...]

MBR, Sergei

