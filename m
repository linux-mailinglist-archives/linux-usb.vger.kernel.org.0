Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1F7BA3411F
	for <lists+linux-usb@lfdr.de>; Tue,  4 Jun 2019 10:06:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726924AbfFDIGa (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 4 Jun 2019 04:06:30 -0400
Received: from mail-lf1-f67.google.com ([209.85.167.67]:36382 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726828AbfFDIGa (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 4 Jun 2019 04:06:30 -0400
Received: by mail-lf1-f67.google.com with SMTP id q26so15720856lfc.3
        for <linux-usb@vger.kernel.org>; Tue, 04 Jun 2019 01:06:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=diUImPVKSDroDl/EYnZb2TDAFgd3lKZwBg50Nf+cDD0=;
        b=TyoZd3k8g6vTsWe11bh+pcJ1AzA4iBJM2T6GclYLbrxU1n8Zfc15vyCwNAJ2avbN8Y
         pEOoMvkG55fr6ByU64QaW4NwvESf4joiL6m0sblXTilXuOjGb7YSmAZYn7YZJ7X2nB3W
         h+sNhhBLTCyzC6M1869UF7/XnJhlS7e2CMk+bG1BceNF3OBPyt3jdjsQeRDaN7X/38if
         6m4f0WvQ0bRHeC4dP3EZbkSrVfjuzHvalVjJlxHeFDaKPtnuh0u5o+woAKzKw5bQ4OTV
         DYwI10/00zSGYKm9mrCU+syv6aqSnM+o1Y6phV+lM0vL59MpbM8b0KCAfVnwC8y/uQoa
         gjtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=diUImPVKSDroDl/EYnZb2TDAFgd3lKZwBg50Nf+cDD0=;
        b=nGB1JLKH0u3ANmylGuzi1ipLlkh/mPWkNZD6w9Ol0Hjxqm3cll+X6Irvjb+reuwnvY
         aKudO/5Onz7j7kD0IU+N9dDBtvKV5OiFwB1Jd/crOyRfJfemrQXEhOolkhtt16wqoaTS
         Amr4DHevCDDUGxJLMRMEHPnGh25dbSp6MqivKT56fZGGN62RdWM87QxuIIKrN0nOdico
         0vHMh/4vBNj4T1Psd7NVBaLh1i9ESgtlFnSBjYheU/w1ONe8KPQJMWGkaFEjmXRUuaW6
         taShkCj17TTcrJJExxqDtoW5IYJVVbgQbo6HG55SbzJa2C3ji0N3YhgL4B/6CT+dTeJK
         YLOg==
X-Gm-Message-State: APjAAAUViGGt1qAkxt9NHzDzyzu0RQwuh7JZgbvNyc/nzPYszBfWDCxY
        JH+2HsIfVdPI7ndR/L2p2B9Wpw==
X-Google-Smtp-Source: APXvYqxYwUl6s/NaY9LzVTMxo/TgqrmzbRR1nMiVp8zBdpHlDptDLmDc610fsCwP6MLHTkFK6gUH0w==
X-Received: by 2002:a19:4a49:: with SMTP id x70mr3469049lfa.151.1559635588630;
        Tue, 04 Jun 2019 01:06:28 -0700 (PDT)
Received: from [192.168.0.199] ([31.173.84.112])
        by smtp.gmail.com with ESMTPSA id 25sm2265611ljg.69.2019.06.04.01.06.27
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 04 Jun 2019 01:06:27 -0700 (PDT)
Subject: Re: [PATCH 1/2] usb: renesas_usbhs: remove sudmac support
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        gregkh@linuxfoundation.org
Cc:     linux-usb@vger.kernel.org, linux-renesas-soc@vger.kernel.org
References: <1559621375-5436-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1559621375-5436-2-git-send-email-yoshihiro.shimoda.uh@renesas.com>
From:   Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <c5ef1e44-10a9-a736-8578-05f45f34a598@cogentembedded.com>
Date:   Tue, 4 Jun 2019 11:06:22 +0300
User-Agent: Mozilla/5.0 (Windows NT 6.3; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <1559621375-5436-2-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello!

On 04.06.2019 7:09, Yoshihiro Shimoda wrote:

> SUDMAC featurer was supported in v3.10, but was never used by

    Feature?

> any platform. So, this patch removes it.
> 
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
[...]

MBR, Sergei
