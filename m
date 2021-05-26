Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8D6F3391D38
	for <lists+linux-usb@lfdr.de>; Wed, 26 May 2021 18:39:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235159AbhEZQkd (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 26 May 2021 12:40:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:41889 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234561AbhEZQkc (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 26 May 2021 12:40:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1622047140;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=3shAPoRLX0LdpJPXp0V0/Qy29QApIg6T8CXRJoBjIfw=;
        b=B5HO69jEHgCnXLvIPpWGTfcxuWsfVlwUoUydocWJclCcfVMEeKqHYQ7oORBENYSRB7793B
        F25kJCI0u+Tzggimkvkkf6xgeNcGqoS3kiPKyymtHZ634zf3G8khOxpfidzYjma9qVjMQ3
        EihKf7EsI07Oh2C/DlriIW3EcvXay1U=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-289-ndw6OweIOr22IClKWxfQTg-1; Wed, 26 May 2021 12:38:58 -0400
X-MC-Unique: ndw6OweIOr22IClKWxfQTg-1
Received: by mail-ed1-f69.google.com with SMTP id m6-20020aa7c4860000b029038d4e973878so892844edq.10
        for <linux-usb@vger.kernel.org>; Wed, 26 May 2021 09:38:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=3shAPoRLX0LdpJPXp0V0/Qy29QApIg6T8CXRJoBjIfw=;
        b=Iha4wUEZ4JL1T98vjO8zxO7jTb4gPkitU1e6/1bKtrKx1NH7wNJsj6qBOZH5DxtF7Q
         0QamA6JS0GSQvit2ItynLG0FftZmWvcwVf2IriyXL53CwlafrjjOnDqjV5tCh8x/6wKj
         B6BxmKYNQXeWqfLllvu2RWhaKZUmWGqj09mr4PJ8H6Q+jCQZ9q3buEbskal00/DXmgW2
         yDx9yhyTeVN/Fu3ptwT0514HxkZP7Of/OqIlLOi2obE3s3IznwzzhS8a9rMuwlvwPBux
         egMIKGjn4hovzYPEwv44g+/dQlUpU1PNFkZe8YrAbxgQQZGQoabIrFAe4lYrIcYN2LY0
         5vjg==
X-Gm-Message-State: AOAM533w8WxY2fIZ1DlhyTEz8APiJavIWROBaldYqMBS+HZtLlMQ9OBC
        73wYQaxIaFwWwxdRjfsOmZWLApXCf4xRQLd129AIc3GtJSJV8wp458TlXT8YUeHLSxO6POJPaNJ
        ZobaKzN6tIcTxTMYMHV49
X-Received: by 2002:a17:906:274d:: with SMTP id a13mr17839076ejd.51.1622047137754;
        Wed, 26 May 2021 09:38:57 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx4kRAf2eM9AYGK7XKmgzKdo81FT7PSCF91i/BDA4+9Qy3kPqbShcjG+yy+qaR2pSJE5nx4yQ==
X-Received: by 2002:a17:906:274d:: with SMTP id a13mr17839058ejd.51.1622047137579;
        Wed, 26 May 2021 09:38:57 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id t9sm10388942eji.39.2021.05.26.09.38.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 May 2021 09:38:57 -0700 (PDT)
Subject: Re: [PATCH 0/2] usb: typec: mux: a few improvements
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Li Jun <jun.li@nxp.com>
Cc:     linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20210526153548.61276-1-heikki.krogerus@linux.intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <aaa329c8-c8d6-fa0d-9346-843f09259d83@redhat.com>
Date:   Wed, 26 May 2021 18:38:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210526153548.61276-1-heikki.krogerus@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

On 5/26/21 5:35 PM, Heikki Krogerus wrote:
> Hi,
> 
> The first patch should be trivial cleanup, but in the second one I'm
> removing the condition that in practice forces the orientation switch
> to always have the device property named "orientation-switch". This
> change only impacts connections described with device graph since only
> in that case the callback function is supplied with the "id" parameter
> which is the first part of the condition (if the id is not supplied,
> the function also does not expect the device property to exist).
> 
> But when the connection between the connector and the switch is
> described with device graph, I don't see any need for that device
> property. Therefore let's just remove the condition and the
> requirement for the device property with it.
> 
> thanks,
> 
> Heikki Krogerus (2):
>   usb: typec: mux: Use device type instead of device name for matching
>   usb: typec: mux: Remove requirement for the "orientation-switch"
>     device property

Thanks, the series looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

for the series.

Regards,

Hans

