Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2DB4E2D63C3
	for <lists+linux-usb@lfdr.de>; Thu, 10 Dec 2020 18:40:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392840AbgLJRgK (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 10 Dec 2020 12:36:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33306 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2392832AbgLJRgD (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 10 Dec 2020 12:36:03 -0500
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5997DC061793
        for <linux-usb@vger.kernel.org>; Thu, 10 Dec 2020 09:35:23 -0800 (PST)
Received: by mail-wm1-x341.google.com with SMTP id e25so6165453wme.0
        for <linux-usb@vger.kernel.org>; Thu, 10 Dec 2020 09:35:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=3OOtstF0oi5Pj3WzkLhAlF1kOotO4HUwZrv4mEkOcmo=;
        b=xXdMrXB67v5iPn3t4QpIjOgfd0dw29zJu80kxy5UApfv54VaGek06iQq6xi97NjVI6
         k0/UVkzqokkl27JFCGZ0n2FWPtOf+ZNuVm3iw/w+zsbxi4GaB6qQbF8O3i79Hb6a0bNC
         mlLDtf4o0iLI7B4FuyVmYKeu5WrQm3gNRF1a0IB8KkJts+MLZbi4PYzrliQYm3yBOeUS
         k1+9098CJumH6wwGAr49YhRKpEa04RyvH8xiKeZnwuo1P9Q82hZrF/0yqV/jvX0wOjSf
         Hj83mbr2ydtlTm4gXkHZmp7irrssK6GtcROU0JDvmEHvbPl97sx1RWhl65dReJkhOk2Y
         d/Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=3OOtstF0oi5Pj3WzkLhAlF1kOotO4HUwZrv4mEkOcmo=;
        b=qZJ/Fp9MACKTPjpvoleAfOvwHwhCsVtL6tbRkGsOsOsEmSMp2q9VKw8rfHcOutWCV5
         STgU9J/h1WsT/fbUFQac5aCQdx72rpL+E6LyTNvRKxLx6l0u2d//2KbjnzE1vSVxxC5m
         GAiKFfztwvOH+aGpWSPjFrI6mHsG1eij8iZSno7fMwUkddksvhsUQSEdVPu2EFYAYxkn
         jNpviFrpWzRZSlrr3QDxZQJE+Ub6Dm/tjfk0iSFy5pWSMlPyDYGHctqGg3d7MOh9DW2T
         j81rCVpl7DBzYFplc4jddIKpDOYX2b2im6MVDQuAIQpxo+VFb/kFSeLotHbxnOVU1gRg
         TdXQ==
X-Gm-Message-State: AOAM532P72E5kQM17+psHbyDPJ+/ZyrrTy3ZPNYFnxlN7qyxRH2Td6eV
        JZIdpFXnbsJThp8cHQVO7FydDQ==
X-Google-Smtp-Source: ABdhPJxg2Z1jDKGv7Agg09j/xGG65aYo0VOQopc5QtI3X7SwMN+hdglx/8BTCGE8Sjgpz2I/OiqxFA==
X-Received: by 2002:a1c:a785:: with SMTP id q127mr5215807wme.25.1607621722139;
        Thu, 10 Dec 2020 09:35:22 -0800 (PST)
Received: from ?IPv6:2001:861:3a84:7260:5514:1343:4704:99a? ([2001:861:3a84:7260:5514:1343:4704:99a])
        by smtp.gmail.com with ESMTPSA id o83sm10647057wme.21.2020.12.10.09.35.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Dec 2020 09:35:21 -0800 (PST)
Subject: Re: [PATCH v2 2/3] usb: dwc3: meson-g12a: fix shared reset control
 use
To:     Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc:     Felipe Balbi <balbi@kernel.org>,
        Kevin Hilman <khilman@baylibre.com>, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Philipp Zabel <p.zabel@pengutronix.de>,
        linux-amlogic@lists.infradead.org,
        Jerome Brunet <jbrunet@baylibre.com>
References: <20201201190100.17831-1-aouledameur@baylibre.com>
 <20201201190100.17831-3-aouledameur@baylibre.com>
 <CAFBinCCovB9e1_AwXv0Jcn3p69LN5KAdzttfZcY+=_TEZTCn6Q@mail.gmail.com>
From:   Amjad Ouled-Ameur <aouledameur@baylibre.com>
Message-ID: <d4a6d417-1cc2-e1eb-e7b5-6707f8602db3@baylibre.com>
Date:   Thu, 10 Dec 2020 18:35:19 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAFBinCCovB9e1_AwXv0Jcn3p69LN5KAdzttfZcY+=_TEZTCn6Q@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Martin


On 05/12/2020 22:42, Martin Blumenstingl wrote:

>    
> Hello Amjad,
>
> On Tue, Dec 1, 2020 at 8:01 PM Amjad Ouled-Ameur
> <aouledameur@baylibre.com> wrote:
>    
>> reset_control_(de)assert() calls are called on a shared reset line when
>> reset_control_reset has been used. This is not allowed by the reset
>> framework.
>>
>> Use reset_control_rearm() call in suspend() and remove() as a way to state
>> that the resource is no longer used, hence the shared reset line
>> may be triggered again by other devices. Use reset_control_rearm() also in
>> case probe fails after reset() has been called.
>>
>> reset_control_rearm() keeps use of triggered_count sane in the reset
>> framework, use of reset_control_reset() on shared reset line should be
>> balanced with reset_control_rearm().
>    
> I think this should be updated after [0] is applied
> The goto from that patch needs to use err_rearm from this patch.
>
>
> Best regards,
> Martin
>
>
> [0] https://patchwork.kernel.org/project/linux-usb/patch/20201111095256.10477-1-zhengzengkai@huawei.com/

Thank you Martin for reviewing this patchset.

I have reviewed the patch you mentioned, and I think as well that
we should use 'err_rearm' instead of 'err_disable_clks' to
cleanup things properly in case setup_regmaps fails.


Best,

Amjad

