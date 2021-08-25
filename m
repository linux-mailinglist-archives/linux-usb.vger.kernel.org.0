Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2186B3F7D74
	for <lists+linux-usb@lfdr.de>; Wed, 25 Aug 2021 23:03:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232611AbhHYVEj (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 25 Aug 2021 17:04:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47720 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232123AbhHYVEj (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 25 Aug 2021 17:04:39 -0400
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CA2E5C061757
        for <linux-usb@vger.kernel.org>; Wed, 25 Aug 2021 14:03:52 -0700 (PDT)
Received: by mail-wm1-x335.google.com with SMTP id z9-20020a7bc149000000b002e8861aff59so1108141wmi.0
        for <linux-usb@vger.kernel.org>; Wed, 25 Aug 2021 14:03:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=references:user-agent:from:to:cc:subject:date:in-reply-to
         :message-id:mime-version;
        bh=kwbt09fOlYpiOsoXRS9sjXbXW76WhT2QN/qa+eAvJW8=;
        b=mc5emlzA9Qjkmej1jZHT0GwkjTwasyfE3pihjygoxX3JDxWBjUKoYB3ST+T2o9YGqV
         Wj9hsaFtqDCnzD+e/AjzTX/Bqw+fh0ZCVL9unMj2/gt8fbr/unyd1Vj6y7TR+rFRE1wd
         Jnetzhew2c4uj9xgof9c7UWYyhv/K/hl0E9RAb9wgjaxhbMdm/zQn1fSsLLvOdJqh6jE
         Od06KuOpXRNqcni2JpzZ/7L6GcsmgwXut0HLhhFS6a1xbSzl0t4fPDwDOmAiPlo8xHQi
         tSI++xsnMU/j1J4lVZHmJTdQRA6wWhDQT6LAjrOoA3E+9slGa/vc0fw+cJyWEf+b2nTr
         5qdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
         :in-reply-to:message-id:mime-version;
        bh=kwbt09fOlYpiOsoXRS9sjXbXW76WhT2QN/qa+eAvJW8=;
        b=E5jiHjgPjQ6goowWZYp+EJOlsXe0WMV265iH541Ecy69Qm47F8m90EuPRWuRn70fxr
         gVqhG9PwZisFkgHZi7OW2MQ9GnlxOW3Z/FTJf9VxIDPxWuFRMunxapAcz8OMbWNkEPDc
         zppGOs2CeNLvmf+NaU0CqUf0BamsgeD/yZ/yLNRGZTLVUVNwaNkanXhtcEPd9e1CQZqn
         Mt/LfaDB7cvl+6Rm9BuVhjfEB4kF6SJKtwVu6njeIVo/Y1XxT/nw/SyKRfWEHq6N11Aw
         94nCjVfzA3FcDWan5UpxS1Ri+HDe+OP2kyWWV2tMxYkRw8N4PYW8qGjIIfTdq+SnObns
         mGAw==
X-Gm-Message-State: AOAM532SjZfk/fMjUbdb8XjowNrZhyY4ruLu7eHKJeYUFzqTgwaJX1ns
        ecy/6inZ2DnYUF5STZzNSubKGespVh/DOQ==
X-Google-Smtp-Source: ABdhPJwSNPocZ6/TXBAuSCb+GalqYZVnTJq96GRPofHlv5uiZkYVAPSomJLzu2mGGhPNvxgmiAv39A==
X-Received: by 2002:a05:600c:428a:: with SMTP id v10mr10978650wmc.25.1629925431279;
        Wed, 25 Aug 2021 14:03:51 -0700 (PDT)
Received: from localhost (82-65-169-74.subs.proxad.net. [82.65.169.74])
        by smtp.gmail.com with ESMTPSA id 19sm6421551wmo.39.2021.08.25.14.03.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Aug 2021 14:03:50 -0700 (PDT)
References: <20210712125529.76070-1-pavel.hofman@ivitera.com>
 <20210712125529.76070-3-pavel.hofman@ivitera.com>
 <1jr1ehy79v.fsf@starbuckisacylon.baylibre.com>
 <d03d8d29-f3f2-028f-efb1-a194955599d7@ivitera.com>
User-agent: mu4e 1.6.4; emacs 27.1
From:   Jerome Brunet <jbrunet@baylibre.com>
To:     Pavel Hofman <pavel.hofman@ivitera.com>, linux-usb@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Ruslan Bilovol <ruslan.bilovol@gmail.com>,
        Felipe Balbi <balbi@kernel.org>
Subject: Re: [PATCH v3 2/4] usb: gadget: u_audio: add bi-directional volume
 and mute support
Date:   Wed, 25 Aug 2021 22:57:54 +0200
In-reply-to: <d03d8d29-f3f2-028f-efb1-a194955599d7@ivitera.com>
Message-ID: <1jmtp5xmmg.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


On Wed 25 Aug 2021 at 19:59, Pavel Hofman <pavel.hofman@ivitera.com> wrote:

> Dne 25. 08. 21 v 15:25 Jerome Brunet napsal(a):
>> On Mon 12 Jul 2021 at 14:55, Pavel Hofman <pavel.hofman@ivitera.com>
>> wrote:
>> 
>>> From: Ruslan Bilovol <ruslan.bilovol@gmail.com>
>>>
>>> USB Audio Class 1/2 have ability to change device's
>>> volume and mute by USB Host through class-specific control
>>> requests. Device also can notify Host about volume/mute
>>> change on its side through optional interrupt endpoint.
>>>
>>> This patch adds Volume and Mute ALSA controls which can be
>>> used by user to send and receive notifications to/from
>>> the USB Host about Volume and Mute change.
>>>
>>> These params come from f_uac* so volume and mute controls
>>> will be created only if the function support and enable
>>> each explicitly
>>>
>>> Signed-off-by: Ruslan Bilovol <ruslan.bilovol@gmail.com>
>>> Signed-off-by: Pavel Hofman <pavel.hofman@ivitera.com>
>> Hi Greg,
>> This change made it to usb-testing and usb-next but there are several
>> indentation errors in it. By itself, without the rest of the series, it
>> does not make much sense. It adds a couple of alsa controls but those
>> actually do nothing without the uac1 and uac2 part of the series.
>> Maybe it would be better to drop this change until the rest of series is
>> ready (if this is still possible) ?
>> 
>
> The indentation errors were fixed by commit
> https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git/commit/?h=usb-next&id=1bc220835526ae076eecfb7ed513f80f22cf840d

Could you check again ? I believe you missed some in u_audio.c (at least).

> which is in usb-next now too. If possible this commit should be dropped too.
>
> Thanks,
>
> Pavel.

