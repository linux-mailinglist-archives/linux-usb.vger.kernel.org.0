Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5A37942663D
	for <lists+linux-usb@lfdr.de>; Fri,  8 Oct 2021 10:52:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229987AbhJHIyd (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 8 Oct 2021 04:54:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:50858 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229673AbhJHIyb (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 8 Oct 2021 04:54:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1633683156;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=ixPfMuIL4aFwKbcBY0rHOnVPHcxJb+OU2o5YUy5UMfU=;
        b=IJDSQYLxK9cnuZBOqRooZEU4Srq9cqa3zk2FUiXCsFLy32d22GR8rHWx5eKodOqfS/8m+N
        kCBAXuXHPpVbu4xd7agt7/nX9OCuBXWKDyhAFldAtfr2iewY8omyIc9blo1zUTSn3/A12g
        2qAXGX4jArm4XO151BBscrjgVC0LXGc=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-138-r2o-QMgANx6pGAwqnFPgBw-1; Fri, 08 Oct 2021 04:52:35 -0400
X-MC-Unique: r2o-QMgANx6pGAwqnFPgBw-1
Received: by mail-ed1-f72.google.com with SMTP id q26-20020aa7da9a000000b003db531e7acbso4180162eds.22
        for <linux-usb@vger.kernel.org>; Fri, 08 Oct 2021 01:52:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=ixPfMuIL4aFwKbcBY0rHOnVPHcxJb+OU2o5YUy5UMfU=;
        b=ymkeJwxIbNbf4duKO6IA32RuvxM/yobuNBwRJVIbpuOehg6rH0HTVzuGPQvDUCgBtF
         ANE5YI3n3YFF2wJUNaf9J9Xlt4Ut6Yws6IcYbvcUWrS5lxNNq3d0135h8wUIi1phSdDU
         3TQ8Mb69Tb2NmK1HJ48j1ZZckEE8xbTVFoNAvwJAs1hA3nfL8iQMcxHIBZ3W5DOIu3YD
         VOu18Tj1YD7DdNjUbqOp8Qtj1s5A1uMhcbVP8qGjdQ/Zx5QE2haPx2Imoaba+DD/fia4
         bXK6qonEBeKdPcG+PeMquY55T7vNcdPFN76wxmKY/A7vob9/MEz5n6r0RXE4G1Sj8JR1
         /LyQ==
X-Gm-Message-State: AOAM532a6XOU9iYdibbjzU6DX/dg5DJTTQnoV46xotR4FILNM+k9CfBB
        eue4D8qY896gPO9i7AiWJOxBJuqosS1PRfmzQfZXinSyOEkfckTkruD+szKZFKejPzEJHs1BNyG
        NKkrjXRUV5aiSz3DfOXv9
X-Received: by 2002:a17:907:9908:: with SMTP id ka8mr2814603ejc.164.1633683153893;
        Fri, 08 Oct 2021 01:52:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwHrU5dtdXI1UVaptX6VjfPguzM+7v3UzJx3CmGWdjfG1KpNCHWhS2YzBXhFjWBPoHF9yEo/w==
X-Received: by 2002:a17:907:9908:: with SMTP id ka8mr2814581ejc.164.1633683153674;
        Fri, 08 Oct 2021 01:52:33 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id u16sm684667ejy.14.2021.10.08.01.52.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 Oct 2021 01:52:33 -0700 (PDT)
Subject: Re: [PATCH 1/1] usb: typec: altmodes/displayport: reorder
 dp_altmode_configured()
To:     lindsey.stanpoor@gmail.com, intel-gfx@lists.freedesktop.org,
        linux-usb@vger.kernel.org
Cc:     heikki.krogerus@linux.intel.com, gregkh@linuxfoundation.org,
        cnemo@tutanota.com
References: <20211006043257.23242-1-lindsey.stanpoor@gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <da805c7c-e5fb-74fc-4122-88f920fae533@redhat.com>
Date:   Fri, 8 Oct 2021 10:52:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20211006043257.23242-1-lindsey.stanpoor@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

On 10/6/21 6:32 AM, lindsey.stanpoor@gmail.com wrote:
> From: Cameron Nemo <cnemo@tutanota.com>
> 
> A recent commit [1] introduced an unintended behavioral change by
> reordering certain function calls. The sysfs_notify call for
> pin_assignment should only be invoked when the dp_altmode_notify call
> returns 0, and in the dp->data.conf == 0 case.
> 
> [1] https://lore.kernel.org/r/20210817215201.795062-8-hdegoede@redhat.com
> 
> Signed-off-by: Cameron Nemo <cnemo@tutanota.com>

You are right that my commit changed the behavior I should have added
something about that to the commit message, *but* I believe
that the new behavior is correct and should be kept.

Even if the dp_altmode_notify() fails, then reading from
the pin_assignment sysfs file will still show the new pin-assignment,
so the contents of the sysfs file has changed and thus the notify is
the correct thing to do independent of the dp_altmode_notify() 
return value.

Likewise if we have selected a pin_assignment ourselves and the
user tries to change this by writing to the pin_assignment sysfs
file, then we may get an async (so not signalled as an error
on the sysfs write syscall) CMDT_RSP_NAK to the new pin_assignment
at which point we set dp->data.conf = 0; and then call
dp_altmode_configured() and in this case again the
sysfs file "contents" has changed so we should do a notify.

More-over doing a syfs-notify when nothing has changed is really
not the end of the world, it is not like we are going to do this
100s of times per second.

IOW I believe that the new behavior although different is
correct (and the new code is also a lot more straight forward).

So NACK from me for this change.

Question, does this patch fix an actual problem which you were
seeing, or did you just notice this while reviewing the change ?

Regards,

Hans




> ---
>  drivers/usb/typec/altmodes/displayport.c | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/typec/altmodes/displayport.c b/drivers/usb/typec/altmodes/displayport.c
> index c1d8c23baa39..a15ae78066e3 100644
> --- a/drivers/usb/typec/altmodes/displayport.c
> +++ b/drivers/usb/typec/altmodes/displayport.c
> @@ -154,10 +154,17 @@ static int dp_altmode_status_update(struct dp_altmode *dp)
>  
>  static int dp_altmode_configured(struct dp_altmode *dp)
>  {
> +	int ret;
> +
>  	sysfs_notify(&dp->alt->dev.kobj, "displayport", "configuration");
> +
> +	ret = dp_altmode_notify(dp);
> +	if (ret || !dp->data.conf)
> +		return ret;
> +
>  	sysfs_notify(&dp->alt->dev.kobj, "displayport", "pin_assignment");
>  
> -	return dp_altmode_notify(dp);
> +	return 0;
>  }
>  
>  static int dp_altmode_configure_vdm(struct dp_altmode *dp, u32 conf)
> 

