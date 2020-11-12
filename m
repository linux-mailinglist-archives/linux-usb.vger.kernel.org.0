Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1EAA82B0619
	for <lists+linux-usb@lfdr.de>; Thu, 12 Nov 2020 14:14:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728042AbgKLNOw (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 12 Nov 2020 08:14:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47550 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727035AbgKLNOv (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 12 Nov 2020 08:14:51 -0500
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4838EC0613D1
        for <linux-usb@vger.kernel.org>; Thu, 12 Nov 2020 05:14:51 -0800 (PST)
Received: by mail-wm1-x342.google.com with SMTP id w24so5513304wmi.0
        for <linux-usb@vger.kernel.org>; Thu, 12 Nov 2020 05:14:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=khPl32PaFPajgxudIFCV/7sE6sgZ8s6VEPeuzuAOnEE=;
        b=1zVzCwCxFFXqYgDMR+7zq6ldvSgivUZwoIVw+3QpkMWattNCrYHkxfqRrbis9t75W+
         +jx3575UFW2mfONslpRiJ0DnVMBMdcCd7OhTlxOsd6hg8CirCgDcLbCcKzRwm1KLifJ8
         t689RF+x1EGSMpBUKV46lZ5CJSyiTPlPKTxhmhUeMtsgNCGJCE8KSWTsQQnKkuNIiJk1
         wbwtO4YPH8Lb2DhLXgIh+yhm6AN6CZRUZbaRLaPGFaszc6WLYhq8FXW/aqwYGQtBwCfi
         dxZCb/HwcMckBcP4yr7nCYBUk7XBHQjg/4RuNQsPMA1O6OxpbFhkvaTKcO2EOWcIpqiX
         g0wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=khPl32PaFPajgxudIFCV/7sE6sgZ8s6VEPeuzuAOnEE=;
        b=OMEurluygmFT/boyQyN4Jw2pJlkSEYvWNkLxb5cz68ziRIbbxBqPA+807hBne+EbH2
         82u3xJlvlURGJdAgmLCzT2DobttYF0BIU73WiMusz9PrhfBzXWuyKUd2qntaPoDarI6z
         WDWWSZkCupkHljB/FrVy9vuN6qWaEPXNM6t7eRIRldI7kXHvPiYaCJdpBwaLaUPba2tX
         6YkihqoxcVKRZ0cyT062PPRjtlpIgpvs5rmSv6Np+JM+CDMP8e+Ldqm50Z9GhbHoK92U
         xj7dra0FzthNvbfKmNJegrNOVJeq5RFOo60WoQ6I17cdFQJlw+gfQBdsYPG9uDfTo+kx
         iNNg==
X-Gm-Message-State: AOAM532nrYJx5p06w7il+RPQygRc77Vmp3h5/C4xclIUkjqiLaa1fQ1/
        rO3vszAT3WOM1jeeUFCKS9gmbw==
X-Google-Smtp-Source: ABdhPJwlyquafBA/bq5q5PHiBAXBvMonzm+44o0cAS17O1FWvKLTP5sVXAIPengBqmJGJ5w3SP6lmg==
X-Received: by 2002:a1c:240a:: with SMTP id k10mr9330800wmk.173.1605186888876;
        Thu, 12 Nov 2020 05:14:48 -0800 (PST)
Received: from ?IPv6:2001:861:3a84:7260:5d3c:83d5:8524:33ca? ([2001:861:3a84:7260:5d3c:83d5:8524:33ca])
        by smtp.gmail.com with ESMTPSA id o10sm6769550wma.47.2020.11.12.05.14.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Nov 2020 05:14:48 -0800 (PST)
Subject: Re: [PATCH] reset: Add reset controller API
To:     Kevin Hilman <khilman@baylibre.com>,
        Philipp Zabel <p.zabel@pengutronix.de>
Cc:     linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
        linux-usb@vger.kernel.org, Jerome Brunet <jbrunet@baylibre.com>
References: <20201001132758.12280-1-aouledameur@baylibre.com>
 <7hh7rckzcr.fsf@baylibre.com>
From:   Amjad Ouled-Ameur <aouledameur@baylibre.com>
Message-ID: <d12962a5-edba-869e-9383-5717dbffae0b@baylibre.com>
Date:   Thu, 12 Nov 2020 14:14:46 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <7hh7rckzcr.fsf@baylibre.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 03/10/2020 01:00, Kevin Hilman wrote:
> Amjad Ouled-Ameur <aouledameur@baylibre.com> writes:
>
>> The current reset framework API does not allow to release what is done by
>> reset_control_reset(), IOW decrement triggered_count. Add the new
>> reset_control_resettable() call to do so.
>>
>> When reset_control_reset() has been called once, the counter
>> triggered_count, in the reset framework, is incremented i.e the resource
>> under the reset is in-use and the reset should not be done again.
>> reset_control_resettable() would be the way to state that the resource is
>> no longer used and, that from the caller's perspective, the reset can be
>> fired again if necessary.
>>
>> This patch will fix a usb suspend warning seen on the libretech-cc
>> related to the shared reset line. This warning was addressed by the
>> previously reverted commit 7a410953d1fb ("usb: dwc3: meson-g12a: fix shared
>> reset control use")
> Could you also send a patch that shows how your new feature can be used
> to fix the problem that was originally fixed by that patch (and still
> exists, now that it was reverted.)
>
> Thanks,
>
> Kevin

Hello Kevin,


Will do soon !


Sincerely,

Amjad

