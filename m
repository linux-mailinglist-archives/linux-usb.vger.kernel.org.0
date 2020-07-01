Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5226321089D
	for <lists+linux-usb@lfdr.de>; Wed,  1 Jul 2020 11:52:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729578AbgGAJwt (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 1 Jul 2020 05:52:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35854 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729236AbgGAJws (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 1 Jul 2020 05:52:48 -0400
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 784CAC061755
        for <linux-usb@vger.kernel.org>; Wed,  1 Jul 2020 02:52:48 -0700 (PDT)
Received: by mail-lj1-x241.google.com with SMTP id s9so26126882ljm.11
        for <linux-usb@vger.kernel.org>; Wed, 01 Jul 2020 02:52:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=pjWa3i0QsLM3S1pu6lXD+HAkiVfw8yxKk6v9iT+zQxg=;
        b=FtCyvSmscei099IWNxvitnsbdakK1emnBRBPs1LdMFSsqWFtxVoYnjglpUFvugn7DC
         Bp8F9iIBw4Z6a/zHj/aYRJ1JV6rZdIlxlUPryEvpzDRBmOlBC0dJyV0r19d05RMrZh05
         8wTY6yYdUiGVo2djcoactMyHjPtAN/Q0RopcHebn1MQZA9bN2ZJzJoEo18vucvnuXnQT
         U0b1hsVl4MVzVOOW8b03Mo1tTuOejdDyFWr3CP7uMqM35LFguhx+RIzLfLszzITonzrC
         jB4wjhA423z7ProQSlteLkQ1HE3/zqEdjCfcR6+1hyzaa0B7ZsNwJQQtbjwlVXyVo5b5
         CurQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=pjWa3i0QsLM3S1pu6lXD+HAkiVfw8yxKk6v9iT+zQxg=;
        b=B3/Mhlu8dBsBDpFzA25YH8iW4b8jYqYVt6qon3Kxcam/njim1Vp5hnSYqvsLgI/W8R
         t3cEKTNeflImV3uqtQzcIULBFRaVMtJXd/jyrqN6slZbfipnL23yQtXw76fGWnq2aj3T
         Kdo+fMNJLb2zNiTv18QFBN5jfoW5nACMY7eoFr5UwBCZkz01opqNeTdTQ4W1jL9un9Vp
         3mHRKVIsP9L65YR/9JIur0xBFsbkBrKaGFGpWEqGxcCAN4kjKPl6xyWg0zn2nI/gmJLO
         91JLJjH//zz9kphKUgPps4rfBBN15OMOBBfC+gTwi6SYxQMmXRdev8q3WxSUaL+WxGX2
         IQoA==
X-Gm-Message-State: AOAM533L4o0oz+fIga30ZPkX5AFT8PyuYlgZmMFlXPj1HVJA6vKnLcVj
        7t2QE02G/OOtmlEYkl+u7Xo2ow==
X-Google-Smtp-Source: ABdhPJyuoMchEyyiJi33aT9a6HrUOgs1Q2MgHz6qJiBVX0InZzwmEWJxYZzCJa/0QghoUvE48YesDw==
X-Received: by 2002:a05:651c:502:: with SMTP id o2mr12384000ljp.434.1593597167035;
        Wed, 01 Jul 2020 02:52:47 -0700 (PDT)
Received: from ?IPv6:2a00:1fa0:8e8:f00c:217b:dbd8:22bd:2e1d? ([2a00:1fa0:8e8:f00c:217b:dbd8:22bd:2e1d])
        by smtp.gmail.com with ESMTPSA id a20sm1859852lfl.20.2020.07.01.02.52.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Jul 2020 02:52:46 -0700 (PDT)
Subject: Re: [PATCH v4 1/3] usb: dwc3: gadget: add frame number mask
To:     Michael Grzeschik <m.grzeschik@pengutronix.de>,
        linux-usb@vger.kernel.org
Cc:     Thinh.Nguyen@synopsys.com, gregkh@linuxfoundation.org,
        kernel@pengutronix.de, balbi@kernel.org
References: <20200701093137.19485-1-m.grzeschik@pengutronix.de>
 <20200701093137.19485-2-m.grzeschik@pengutronix.de>
From:   Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <5f66a064-d13c-7cfa-dd72-8ab14da28d31@cogentembedded.com>
Date:   Wed, 1 Jul 2020 12:52:36 +0300
User-Agent: Mozilla/5.0 (Windows NT 6.3; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200701093137.19485-2-m.grzeschik@pengutronix.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 01.07.2020 12:31, Michael Grzeschik wrote:

> This patch adds an define DWC3_FRNUMBER_MASK for the common used

   s/an/a/. Commonly.

> 0x3fff mask and uses it.
> 
> Signed-off-by: Michael Grzeschik <m.grzeschik@pengutronix.de>

MBR, Sergei
