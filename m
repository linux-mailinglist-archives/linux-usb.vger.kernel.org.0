Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2440C2FDCED
	for <lists+linux-usb@lfdr.de>; Thu, 21 Jan 2021 00:40:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729738AbhATV1z (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 20 Jan 2021 16:27:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:49296 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1732509AbhATNqg (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 20 Jan 2021 08:46:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1611150306;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=/a6CMcIutcxErUCcxPrh94A+MqdbANj7G9XZs65vz9Q=;
        b=cK18+J7B9CZ2ojrNxppV6PO/OMKJ/MrjekxZ0LnxzIfqz8sIUC3LN/vVvyFb3qvpfBV5fX
        fuDPlO/jn+kWFpDo9HfWKRdebnL8cuO6umOd168U5aMM1p6sEfyBE9LI/NYnfnHWw2mEkx
        zh1lNHVblE0e5RrxKijvKonT5WDsgpU=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-176-wdJYlSJSPLWSRtWRb8NWng-1; Wed, 20 Jan 2021 08:45:05 -0500
X-MC-Unique: wdJYlSJSPLWSRtWRb8NWng-1
Received: by mail-ed1-f69.google.com with SMTP id e25so2576660edq.6
        for <linux-usb@vger.kernel.org>; Wed, 20 Jan 2021 05:45:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=/a6CMcIutcxErUCcxPrh94A+MqdbANj7G9XZs65vz9Q=;
        b=rfvrwr/UpFXHZVn2Gjka/j8koJ6giSapel7zTEHhSqZRyJdPeyVHwGSJbITDydgxfM
         6qUrr1vh0q3J72aXbS1NGsIkdMfzuGZK0oq/CrXcAce44ftkc0YteNxvISzVbWwNWpy+
         uImcWWg1uJTwrS5cAwswoQl0f8pihXPjOfBsUg4Pn/WOCyyjDCl8P6WW9mY/EOu7yW9w
         wgsscFVxiUcw1UsADwZRND3NBkiitVzgZqXWGPiIP98QGZzHcuIBjM81ftif+9rebVvX
         1FsJD9ARGZV6jUMXjajKCgVewcjhZtZMWWaF0NvsMXk80yNGGn9HEUzpJ4HGNhDIqXW2
         EpgQ==
X-Gm-Message-State: AOAM533ySSZHmKox6Mb48bCGf+fqWlfsgsNH5JirebBBHBUbbqATLSm3
        iVedtHFi8GBXgC78zSCzzaCInd6sk4tW69ScEpSj1w7/yZRCyYjmbd5LimpnG8wqkHOjGk+Bnzn
        fpRLz4/YjzYd512rpVrHJ
X-Received: by 2002:a17:906:70d4:: with SMTP id g20mr6413192ejk.361.1611150303984;
        Wed, 20 Jan 2021 05:45:03 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzQJh4Egq/glOcE6MZI5rNwkQL84wDaqZyhxpS5NT0fhW5MprNFEufOH89StjuNZVodtBi72Q==
X-Received: by 2002:a17:906:70d4:: with SMTP id g20mr6413175ejk.361.1611150303762;
        Wed, 20 Jan 2021 05:45:03 -0800 (PST)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-37a3-353b-be90-1238.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:37a3:353b:be90:1238])
        by smtp.gmail.com with ESMTPSA id u23sm1121993edt.78.2021.01.20.05.45.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 Jan 2021 05:45:03 -0800 (PST)
Subject: Re: [PATCH v6 0/3] AMS, Collision Avoidance, and Protocol Error
To:     Kyle Tso <kyletso@google.com>, linux@roeck-us.net,
        heikki.krogerus@linux.intel.com, gregkh@linuxfoundation.org
Cc:     badhri@google.com, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20210114145053.1952756-1-kyletso@google.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <2211ad43-b76c-fbe9-2cc8-bb40c4ee4e89@redhat.com>
Date:   Wed, 20 Jan 2021 14:45:02 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20210114145053.1952756-1-kyletso@google.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

On 1/14/21 3:50 PM, Kyle Tso wrote:
> v5 https://lore.kernel.org/r/20210105163927.1376770-1-kyletso@google.com
> 
> "usb: typec: tcpm: AMS and Collision Avoidance"
>  - removed the signed-off
>  - modified the coding style suggested from Heikki
>  - added FR_SWAP AMS handling
> 
> "usb: typec: tcpm: Protocol Error handling"
>  - removed the signed-off
>  - modified the coding style suggested from Heikki
>  - modified more coding style problems (line wrapping limit)
> 
> "usb: typec: tcpm: Respond Wait if VDM state machine is running"
>  - no change

I've finally gotten around to testing this. I'm happy to
report that the power-role swapping regression seen in one
of the older versions of this patch-set is gone.

So the entire series is:
Tested-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans





> 
> -------------------------------------------------------------------
> 
> Kyle Tso (3):
>   usb: typec: tcpm: AMS and Collision Avoidance
>   usb: typec: tcpm: Protocol Error handling
>   usb: typec: tcpm: Respond Wait if VDM state machine is running
> 
>  drivers/usb/typec/tcpm/tcpm.c | 1001 +++++++++++++++++++++++++++------
>  include/linux/usb/pd.h        |    2 +
>  include/linux/usb/tcpm.h      |    4 +
>  3 files changed, 829 insertions(+), 178 deletions(-)
> 

