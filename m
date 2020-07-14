Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B9BA721EFEB
	for <lists+linux-usb@lfdr.de>; Tue, 14 Jul 2020 14:01:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726729AbgGNMBk (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 14 Jul 2020 08:01:40 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:56177 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726332AbgGNMBk (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 14 Jul 2020 08:01:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1594728098;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=NzuBDHY8WxHVw+Kc5uxbtm+Tv/UGUbdolVzEdoMmBhE=;
        b=dFbzFnOVdpB73j0vxaojqfmdbxN+Spuun/QOmPpYWSXlIJc4ckH+q9Q70dFhS7v7mpykZi
        M66HMPHJZ9mSO6HvqcQfJutDiJWaCvXSJYARk+FV6dSRkDxVqA3FaBXrseCfIlMirfnCqX
        KxtZ1NhDVrMZUZw1olVwCTH29dddHP4=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-35-m_tBIe7-MLSiBC7FXVJvSQ-1; Tue, 14 Jul 2020 08:01:37 -0400
X-MC-Unique: m_tBIe7-MLSiBC7FXVJvSQ-1
Received: by mail-wm1-f69.google.com with SMTP id c124so3632545wme.0
        for <linux-usb@vger.kernel.org>; Tue, 14 Jul 2020 05:01:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=NzuBDHY8WxHVw+Kc5uxbtm+Tv/UGUbdolVzEdoMmBhE=;
        b=bkiFR3L9yeTE5+cyXPKSxMGLH7d/6dP6IPgClRojP0qJFdeKeX05x8d+ZrLDl7a3r1
         tnipKrPGbEKTiNElX//6uStMCDC9VYRURUxvbtXX11dmdglHStWfeveWDNqXFVuSmqh9
         JnaBF7yba1/ci4RMsyP3hZzqDag6TlVVdJOkfwC7MtNhiRPmJZXA1znyEDYvTxt7hy/V
         K1AVj+T788e+hdAwPWsMh8W/O5MSfSD6nsDwXVmd7ZVU2W4i1DpTxlAsmrtsQz9Z93Nq
         /2jCxE3AWsJ230NVSEUcWzONkPpDxjFAIougWZLiQRFCVVRNU7xNkCPb4OuFZ38DmWf/
         uNVQ==
X-Gm-Message-State: AOAM532ZqpBYsvwEOfJaQuQzPPSYLH6oUpSdGQlQDp9elppNFTq8ogbq
        IisUS31Kg+QGpqjkt59awzFpvvOQBODeEPQFfxlSCaMYNBd84vaVT00n8n3Yt6xvCTq79USI+Cl
        sVRCMCrFexsCO1WI3H2uo
X-Received: by 2002:a05:6000:46:: with SMTP id k6mr4915629wrx.102.1594728095803;
        Tue, 14 Jul 2020 05:01:35 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwRWb7tTc7UzuLqaB4EtVaorEanJOKFyDzDcud2e1J9/uU8AvfG3tw0yBdSHRwNxyEMbrjmtQ==
X-Received: by 2002:a05:6000:46:: with SMTP id k6mr4915596wrx.102.1594728095573;
        Tue, 14 Jul 2020 05:01:35 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c0c-fe00-d2ea-f29d-118b-24dc.cable.dynamic.v6.ziggo.nl. [2001:1c00:c0c:fe00:d2ea:f29d:118b:24dc])
        by smtp.gmail.com with ESMTPSA id v7sm29697902wrp.45.2020.07.14.05.01.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Jul 2020 05:01:34 -0700 (PDT)
Subject: Re: [PATCH 08/32] usb: typec: tcpm: tcpm: Remove dangling unused
 'struct tcpm_altmode_ops'
To:     Lee Jones <lee.jones@linaro.org>
Cc:     gregkh@linuxfoundation.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        Guenter Roeck <linux@roeck-us.net>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>
References: <20200706133341.476881-1-lee.jones@linaro.org>
 <20200706133341.476881-9-lee.jones@linaro.org>
 <ca14707c-7d40-07ac-da1d-ca27a2e93dcd@redhat.com>
 <20200706142051.GA3500@dell>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <65f27abc-69c8-3877-be5b-e5e478153af9@redhat.com>
Date:   Tue, 14 Jul 2020 14:01:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200706142051.GA3500@dell>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

On 7/6/20 4:20 PM, Lee Jones wrote:
> On Mon, 06 Jul 2020, Hans de Goede wrote:
> 
>> Hi,
>>
>> On 7/6/20 3:33 PM, Lee Jones wrote:
>>> Looks as though a079973f462a3 ("usb: typec: tcpm: Remove tcpc_config
>>> configuration mechanism") pulled out the only use of 'tcpm_altmode_ops'
>>> last year.  No need to keep it around.
>>>
>>> Fixes the following W=1 kernel build warning(s):
>>>
>>>    drivers/usb/typec/tcpm/tcpm.c:1551:39: warning: ‘tcpm_altmode_ops’ defined but not used [-Wunused-const-variable=]
>>>    1551 | static const struct typec_altmode_ops tcpm_altmode_ops = {
>>>    | ^~~~~~~~~~~~~~~~
>>>
>>> Cc: Guenter Roeck <linux@roeck-us.net>
>>> Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>
>>> Cc: Hans de Goede <hdegoede@redhat.com>
>>> Signed-off-by: Lee Jones <lee.jones@linaro.org>
>>
>> This is necessary for adding Display port over Type-C support
>> on devices using the tcpm code, rather then firmware, to do
>> the Type-C alt-mode negotiation.
>>
>> I have a local patch in my tree which adds support for this.
>>
>> But Heikki did not like my approach, so that patch
>> (which needs the bits you are removing) never landed
>> upstream:
>>
>> https://patchwork.kernel.org/patch/11199517/
>>
>> Which is somewhat old now.
> 
> Yes, that's a just a little old now.
> 
> If it drags on for much longer, perhaps consider taking it out for the
> time being and adding it back when you start to make use of it again?

Ok, I've just submitted a reworked patch-series upstream which
actually uses this code. So please drop this patch from your
patch-set.

Regards,

Hans


s

