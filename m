Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B2035339890
	for <lists+linux-usb@lfdr.de>; Fri, 12 Mar 2021 21:43:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234998AbhCLUmg (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 12 Mar 2021 15:42:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55344 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234978AbhCLUm2 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 12 Mar 2021 15:42:28 -0500
Received: from mail-io1-xd29.google.com (mail-io1-xd29.google.com [IPv6:2607:f8b0:4864:20::d29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A2C5AC061761
        for <linux-usb@vger.kernel.org>; Fri, 12 Mar 2021 12:42:28 -0800 (PST)
Received: by mail-io1-xd29.google.com with SMTP id z13so27140625iox.8
        for <linux-usb@vger.kernel.org>; Fri, 12 Mar 2021 12:42:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Ml55NsSS9dl1HuL/10fQC9QseWnc0sqmj8urOFv4Nf4=;
        b=Mp2XAowatemJ6FkTTW+ZVICZSsIc0Z4YMEhy413HGK6oCi82HOpIEs5qLdXaoZK6CN
         iDqrWFCPcwYBGCAFRLeUGC+FwpY0vvcVISew7uKj36eQ8636nrcd70pUFltMkqU6l2aK
         k+7h01ZL+Hr3v7WzFTyrrk/HJr43wq8RxYB8Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Ml55NsSS9dl1HuL/10fQC9QseWnc0sqmj8urOFv4Nf4=;
        b=MSiPCWliHfZE7y6cM/aJeuiPNlCN9y8A90N9u4kOJy8vZPJGO/hot04j8hFkZBfRoj
         E6g+SeZcOpfGjvCikkIwR28uF+7jVW/Ri3pzjC7Jkf6LnDy05GPw+uZKJXJMVruXnPHT
         Xn+B18f1layMdik3Sx5Jgz7PLp2MoSY2sb5llpSdBRQ7soWiX/ozpNN3wNmAYesZFe0S
         Db1tt1AVD7QavlmZT8Y2NIBAkj65QaTgPZr4H0E3b8YwPVYhNqJARnIubr3k2TAjB1B1
         ymWyJ5+QLhsQR8vdxKbhkmAA4vgzqIpL0X8bFWs7xRcFfxi7fLFS7aboPcLWH8tXrfDB
         xA5g==
X-Gm-Message-State: AOAM531nbQb5+uM+shDDGIpxQ+uWKz7C0yc6Mu9GLGxu5xoHKJddkYgq
        ASKzGR39EHEksgjIlnQreLRNQHNCGghFzA==
X-Google-Smtp-Source: ABdhPJxy67hR0FTymctXJo+DmAr+8PjbU2bbnFaDt+0mndydc6UHQZhDfuk/7iCdovRQORDmQ78Qig==
X-Received: by 2002:a02:cc1b:: with SMTP id n27mr1034792jap.106.1615581748123;
        Fri, 12 Mar 2021 12:42:28 -0800 (PST)
Received: from [192.168.1.112] (c-24-9-64-241.hsd1.co.comcast.net. [24.9.64.241])
        by smtp.gmail.com with ESMTPSA id k4sm3409426ion.29.2021.03.12.12.42.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Mar 2021 12:42:27 -0800 (PST)
Subject: Re: [PATCH] usbip: fix vhci races in connection tear down
To:     Hillf Danton <hdanton@sina.com>
Cc:     valentina.manea.m@gmail.com, shuah@kernel.org,
        gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        syzbot+a93fba6d384346a761e3@syzkaller.appspotmail.com,
        Shuah Khan <skhan@linuxfoundation.org>
References: <20210312022737.44122-1-skhan@linuxfoundation.org>
 <20210312070806.383-1-hdanton@sina.com>
From:   Shuah Khan <skhan@linuxfoundation.org>
Message-ID: <b0891cea-579f-2c29-4f3e-52713b836dce@linuxfoundation.org>
Date:   Fri, 12 Mar 2021 13:42:26 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210312070806.383-1-hdanton@sina.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 3/12/21 12:08 AM, Hillf Danton wrote:
> On Thu, 11 Mar 2021 19:27:37 -0700  Shuah Khan wrote:
>> vhci_shutdown_connection() references connection state (tcp_socket,
>> tcp_rx, tcp_tx, sockfd) saved in usbpip_device without holding the
>> lock.
>>
>> Current connection tear down sequence:
>> Step 1: shutdown the socket
>> Step 2: stop rx thread and reset tcp_rx pointer
>> Step 3: stop tx thread and reset tcp_tx pointer
>> Step 4: Reset tcp_socket and sockfd
>>
>> There are several race windows between these steps. In addition, device
>> reset routine (vhci_device_reset) resets tcp_socket and sockfd holding
>> the lock.
> 
> Can you specify the scenario where reset runs in race with teardown as
> both are parts of usbip_work on a singlethread workqueue?
>>

Hmm. I can't think of one. I was concerned about any async paths that
potentially interfere with shutdown. With vhci_shutdown_connection()
being so relaxed with locking, this is a cautious approach on my part.
I am also keeping in mind that this problem shows up in a limited
scope fuzzing test that doesn't trigger any other normal paths that
would be active if there is real device on the other side.

As for the tcp_socket check in the reset routine, I am not positive
what purpose it serves. I introduced the in_disconnect flag so
shutdown and reset don't collide, in case I am missing some scenario
in the normal path when we actually have a actual device attached.

With the other locking and error path problems in addressed, both
shutdown and reset could be made simpler.

In any case, I think in_disconnect might be too big a hammer. I will
redo the patch without it and also remove tcp_socket handling from
the reset routine. I don't see USBIP_EH_RESET getting set without
USBIP_EH_SHUTDOWN.

thanks,
-- Shuah

